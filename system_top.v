// =============================================================================
//   system_top.v   ‒  Ti60F225   Gigabit-Ethernet + DMA + Sapphire SoC
// =============================================================================
`timescale 1ns/1ps
`default_nettype none

// -----------------------------------------------------------------------------
module system_top
#(
    parameter AXI_DATA_W = 64,
    parameter AXI_ADDR_W = 32
)
(
    // ---- 25 MHz 板載晶振 & 按鍵 Reset ----
    input  wire        clk25,      // 25 MHz
    input  wire        rst_n,      // Active-high push-button

    // ---- RGMII ----
    output wire [3:0]  rgmii_txd,
    output wire        rgmii_tx_ctl,
    output wire        rgmii_tx_clk,
    input  wire [3:0]  rgmii_rxd,
    input  wire        rgmii_rx_ctl,
    input  wire        rgmii_rx_clk,

    // ---- MDIO ----
    output wire        mdc,
    inout  wire        mdio,

    // ---- USB-UART ----
    output wire        uart_tx,
    input  wire        uart_rx
);
    // =========================================================================
    // 1.  PLL：25 MHz → 125 MHz(+90°) / 125 MHz / 100 MHz
    // =========================================================================
    wire clk125, clk125_90, clk100, pll_lock;
    pll_sys u_pll (
        .refclk     (clk25),
        .rst        (~rst_n),
        .outclk_0   (clk125),        // AXI + DMA + MAC AXIS
        .outclk_1   (clk125_90),     // RGMII TX +90°
        .outclk_2   (clk100),        // CPU
        .locked     (pll_lock)
    );
    wire sys_rst_n = rst_n & pll_lock;

    // =========================================================================
    // 2.  Sapphire SoC (APB³×2, AXI Master 0, UART0, User-IRQ)
    // =========================================================================
    wire [31:0] apb0_paddr , apb0_pwdata , apb0_prdata;
    wire        apb0_pwrite, apb0_penable;

    wire [31:0] apb1_paddr , apb1_pwdata , apb1_prdata;
    wire        apb1_pwrite, apb1_penable;

    // AXI Master 0 (CPU → RAM/Periph)
    wire [AXI_ADDR_W-1:0] m_axi_awaddr , m_axi_araddr;
    wire [AXI_DATA_W-1:0] m_axi_wdata , m_axi_rdata;
    wire  [7:0]           m_axi_awlen  , m_axi_arlen;
    wire  [1:0]           m_axi_awburst, m_axi_arburst, m_axi_bresp, m_axi_rresp;
    wire                  m_axi_awvalid, m_axi_awready,
                          m_axi_wvalid , m_axi_wready , m_axi_wlast ,
                          m_axi_bvalid , m_axi_bready ,
                          m_axi_arvalid, m_axi_arready,
                          m_axi_rvalid , m_axi_rready , m_axi_rlast;

    wire                  user_irq;

    trojan_soc u_soc (
        .clk            (clk100),
        .rst_n          (sys_rst_n),

        // ---- UART0 ----
        .uart0_tx       (uart_tx),
        .uart0_rx       (uart_rx),

        // ---- APB3 0 (MAC) ----
        .apb3_0_paddr   (apb0_paddr ),
        .apb3_0_pwdata  (apb0_pwdata),
        .apb3_0_pwrite  (apb0_pwrite),
        .apb3_0_penable (apb0_penable),
        .apb3_0_prdata  (apb0_prdata),

        // ---- APB3 1 (DMA) ----
        .apb3_1_paddr   (apb1_paddr ),
        .apb3_1_pwdata  (apb1_pwdata),
        .apb3_1_pwrite  (apb1_pwrite),
        .apb3_1_penable (apb1_penable),
        .apb3_1_prdata  (apb1_prdata),

        // ---- AXI Master 0 ----
        .m_axi_aclk     (clk125),
        .m_axi_awaddr   (m_axi_awaddr),
        .m_axi_awlen    (m_axi_awlen ),
        .m_axi_awburst  (m_axi_awburst),
        .m_axi_awvalid  (m_axi_awvalid),
        .m_axi_awready  (m_axi_awready),
        .m_axi_wdata    (m_axi_wdata),
        .m_axi_wlast    (m_axi_wlast),
        .m_axi_wvalid   (m_axi_wvalid),
        .m_axi_wready   (m_axi_wready),
        .m_axi_bresp    (m_axi_bresp),
        .m_axi_bvalid   (m_axi_bvalid),
        .m_axi_bready   (m_axi_bready),
        .m_axi_araddr   (m_axi_araddr),
        .m_axi_arlen    (m_axi_arlen),
        .m_axi_arburst  (m_axi_arburst),
        .m_axi_arvalid  (m_axi_arvalid),
        .m_axi_arready  (m_axi_arready),
        .m_axi_rdata    (m_axi_rdata),
        .m_axi_rresp    (m_axi_rresp),
        .m_axi_rlast    (m_axi_rlast),
        .m_axi_rvalid   (m_axi_rvalid),
        .m_axi_rready   (m_axi_rready),

        // ---- User IRQ ----
        .user_intr_a    (user_irq)
    );

    // =========================================================================
    // 3.  Triple-Speed Ethernet MAC  (設定 Wizard = APB3 Control)
    // =========================================================================
    wire [31:0] mac_tdata;
    wire        mac_tvalid, mac_tlast, mac_tuser, mac_tready;

    tse_mac_rgmii u_mac (
        // ------ clocks / reset ------
        .tx_axi_clk      (clk125),
        .rx_axis_clk     (clk125),
        .mac_reset       (~sys_rst_n),

        // ------ AXI-Stream (RX out) ------
        .rx_axis_tdata   (mac_tdata ),
        .rx_axis_tvalid  (mac_tvalid),
        .rx_axis_tlast   (mac_tlast ),
        .rx_axis_tuser   (mac_tuser ),
        .rx_axis_tready  (mac_tready),

        // ------ APB3 Control ------
        .pclk            (clk125),
        .presetn         (sys_rst_n),
        .paddr           (apb0_paddr [11:0]),
        .pwdata          (apb0_pwdata),
        .pwrite          (apb0_pwrite),
        .penable         (apb0_penable),
        .prdata          (apb0_prdata),

        // ------ RGMII ------
        .rgmii_txd       (rgmii_txd),
        .rgmii_tx_ctl    (rgmii_tx_ctl),
        .rgmii_tx_clk    (rgmii_tx_clk),
        .rgmii_rxd       (rgmii_rxd),
        .rgmii_rx_ctl    (rgmii_rx_ctl),
        .rgmii_rx_clk    (rgmii_rx_clk),

        // ------ MDIO ------
        .Mdc             (mdc),
        .Mdio            (mdio)
    );

    // =========================================================================
    // 4.  DMA Controller (Stream-to-Memory)
    // =========================================================================
    dma_s2mm u_dma (
        .clk             (clk125),
        .reset           (~sys_rst_n),

        // ------ AXI-Stream Slave (from MAC) ------
        .s_axis_tdata    (mac_tdata ),
        .s_axis_tvalid   (mac_tvalid),
        .s_axis_tlast    (mac_tlast ),
        .s_axis_tuser    (mac_tuser ),
        .s_axis_tready   (mac_tready),

        // ------ AXI Master (寫到 SoC 互連) ------
        .m_axi_aclk      (clk125),
        .m_axi_awaddr    (m_axi_awaddr),
        .m_axi_awlen     (m_axi_awlen ),
        .m_axi_awburst   (m_axi_awburst),
        .m_axi_awvalid   (m_axi_awvalid),
        .m_axi_awready   (m_axi_awready),
        .m_axi_wdata     (m_axi_wdata),
        .m_axi_wlast     (m_axi_wlast),
        .m_axi_wvalid    (m_axi_wvalid),
        .m_axi_wready    (m_axi_wready),
        .m_axi_bresp     (m_axi_bresp),
        .m_axi_bvalid    (m_axi_bvalid),
        .m_axi_bready    (m_axi_bready),

        // ------ APB3 Control (SoC APB3_1) ------
        .ctrl_PCLK       (clk125),
        .ctrl_PRESETn    (sys_rst_n),
        .ctrl_PADDR      (apb1_paddr [11:0]),
        .ctrl_PWRITE     (apb1_pwrite),
        .ctrl_PENABLE    (apb1_penable),
        .ctrl_PWDATA     (apb1_pwdata),
        .ctrl_PRDATA     (apb1_prdata),

        // ------ Interrupt ------
        .ctrl_interrupt  (user_irq)
    );

endmodule
`default_nettype wire
