#######################################################################
#  system_top.sdc   —   Efinix Ti60F225  (trojan_soc + MAC + DMA)
#  專案：Gigabit RGMII + Isolation-Forest
#  版次：2025-05-20
#######################################################################

############################################################
# 1. 基準輸入時脈 (板載 25 MHz 晶振)
############################################################
create_clock -name clk25            \
             -period 40.000         \
             [get_ports clk25]

############################################################
# 2. PLL 派生時脈
#    pll_sys/outclk_0 → 125 MHz
#    pll_sys/outclk_1 → 125 MHz +90°
#    pll_sys/outclk_2 → 100 MHz
############################################################
create_generated_clock -name clk125       \
    -source [get_pins u_pll|refclk]       \
    -divide_by 1 -multiply_by 5           \
    [get_pins u_pll|outclk_0]

create_generated_clock -name clk125_90    \
    -source [get_pins u_pll|refclk]       \
    -divide_by 1 -multiply_by 5           \
    -phase 90                             \
    [get_pins u_pll|outclk_1]

create_generated_clock -name clk100       \
    -source [get_pins u_pll|refclk]       \
    -divide_by 1 -multiply_by 4           \
    [get_pins u_pll|outclk_2]

############################################################
# 3. RGMII RX 外部回送時脈（PHY → FPGA）
#    RGMII 1000BASE-T：125 MHz DDR；RGMII_RX_CLK
############################################################
create_clock -name rxclk_ext \
             -period 8.000   \
             [get_ports rgmii_rx_clk]

# 標註該時脈為 input clock、使工具推斷 I/O cell 到內部 CLKNET 路徑
set_clock_latency -source 0 [get_clocks rxclk_ext]

############################################################
# 4. Clock Groups — 解除跨時脈分析
############################################################
set_clock_groups -asynchronous  \
    -group {clk125 clk125_90}   \
    -group {rxclk_ext}

set_clock_groups -asynchronous  \
    -group {clk125 clk125_90 rxclk_ext}  \
    -group {clk100}

############################################################
# 5. RGMII I/O 介面延遲
#    假設板線負載延遲 = 0.25 ns
############################################################
set_input_delay  -clock rxclk_ext  0.25 [get_ports {rgmii_rxd[*] rgmii_rx_ctl}]
set_output_delay -clock clk125_90  0.25 [get_ports {rgmii_txd[*] rgmii_tx_ctl}]

############################################################
# 6. MDIO / GPIO / Reset — false path
############################################################
set_false_path -from [get_ports {mdio mdc uart_rx rst_n}] \
              -to   [all_registers]

set_false_path -from [all_registers] \
              -to   [get_ports {mdio uart_tx}]

############################################################
# 7. AXI CDC 多週期範例
#    (若 DMA m_axi_aclk = 125 MHz, CPU clk100 = 100 MHz)
############################################################
set_max_delay -from  [get_clocks clk125] \
             -to    [get_clocks clk100]  \
             -datapath_only 16.0   ;# 兩個 8 ns 週期

############################################################
# 8. 旁路未使用 CLK
############################################################
set_clock_uncertainty 0.20 [all_clocks]

#######################################################################
#  END OF FILE
#######################################################################
