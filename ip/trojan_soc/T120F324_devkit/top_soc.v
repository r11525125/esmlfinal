/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2023 Efinix Inc. All rights reserved.
//
// Description:
// Example top file for EfxSapphireSoc
//
// Language:  Verilog 2001
//
// ------------------------------------------------------------------------------
// REVISION:
//  $Snapshot: $
//  $Id:$
//
// History:
// 1.0 Initial Release. 
/////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module top_soc (
input [3:0] system_gpio_0_io_read,
output [3:0] system_gpio_0_io_write,
output [3:0] system_gpio_0_io_writeEnable,
input		jtag_inst1_TCK,
input		jtag_inst1_TDI,
output		jtag_inst1_TDO,
input		jtag_inst1_SEL,
input		jtag_inst1_CAPTURE,
input		jtag_inst1_SHIFT,
input		jtag_inst1_UPDATE,
input		jtag_inst1_RESET,
output		system_uart_0_io_txd,
input		system_uart_0_io_rxd,
output		system_spi_0_io_sclk_write,
output		system_spi_0_io_data_0_writeEnable,
input		system_spi_0_io_data_0_read,
output		system_spi_0_io_data_0_write,
output		system_spi_0_io_data_1_writeEnable,
input		system_spi_0_io_data_1_read,
output		system_spi_0_io_data_1_write,
output		system_spi_0_io_ss,

output      memoryCheckerPass,
output      systemClk_rstn,
input       systemClk_locked,
input       io_systemClk,
input       io_asyncResetn

);
/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
wire 		reset;
wire		io_systemReset;
wire 	    io_memoryReset;				
wire [1:0]  io_ddrA_b_payload_resp=2'b00;
wire userInterrupt_0;
wire [15:0] io_apbSlave_0_PADDR;
wire		io_apbSlave_0_PSEL;
wire		io_apbSlave_0_PENABLE;
wire		io_apbSlave_0_PREADY;
wire		io_apbSlave_0_PWRITE;
wire [31:0] io_apbSlave_0_PWDATA;
wire [31:0] io_apbSlave_0_PRDATA;
wire		io_apbSlave_0_PSLVERROR;
wire		start;
wire [31:0] iaddr;
wire [31:0] idata;
wire [7:0]  ilen;
wire [1:0]  status;
wire [15:0] io_apbSlave_1_PADDR;
wire		io_apbSlave_1_PSEL;
wire		io_apbSlave_1_PENABLE;
wire		io_apbSlave_1_PREADY;
wire		io_apbSlave_1_PWRITE;
wire [31:0] io_apbSlave_1_PWDATA;
wire [31:0] io_apbSlave_1_PRDATA;
wire		io_apbSlave_1_PSLVERROR;


/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
assign reset 	= ~( io_asyncResetn & systemClk_locked);
assign systemClk_rstn 	= 1'b1;


/////////////////////////////////////////////////////////////////////////////
timer_start #(
.MHZ(100),
.SECOND(10),
.PULSE(1)
) intr_s0 (
.clk(io_systemClk),
.rst_n(~io_systemReset),
.start(userInterrupt_0));

apb3_slave #(
.ADDR_WIDTH(16)) apb_slave_0 (
.clk(io_systemClk),
.resetn(~io_systemReset),
.PADDR(io_apbSlave_0_PADDR),
.PSEL(io_apbSlave_0_PSEL),
.PENABLE(io_apbSlave_0_PENABLE),
.PREADY(io_apbSlave_0_PREADY),
.PWRITE(io_apbSlave_0_PWRITE),
.PWDATA(io_apbSlave_0_PWDATA),
.PRDATA(io_apbSlave_0_PRDATA),
.PSLVERROR(io_apbSlave_0_PSLVERROR),
.start(start),
.iaddr(iaddr),
.ilen(ilen),
.idata(idata),
.status(status));

apb3_slave #(
.ADDR_WIDTH(16)) apb_slave_1 (
.clk(io_systemClk),
.resetn(~io_systemReset),
.PADDR(io_apbSlave_1_PADDR),
.PSEL(io_apbSlave_1_PSEL),
.PENABLE(io_apbSlave_1_PENABLE),
.PREADY(io_apbSlave_1_PREADY),
.PWRITE(io_apbSlave_1_PWRITE),
.PWDATA(io_apbSlave_1_PWDATA),
.PRDATA(io_apbSlave_1_PRDATA),
.PSLVERROR(io_apbSlave_1_PSLVERROR),
.start(),
.iaddr(),
.ilen(),
.idata(),
.status(2'b00));



/////////////////////////////////////////////////////////////////////////////

trojan_soc soc_inst
(
.io_apbSlave_1_PADDR(io_apbSlave_1_PADDR),
.io_apbSlave_1_PSEL(io_apbSlave_1_PSEL),
.io_apbSlave_1_PENABLE(io_apbSlave_1_PENABLE),
.io_apbSlave_1_PREADY(io_apbSlave_1_PREADY),
.io_apbSlave_1_PWRITE(io_apbSlave_1_PWRITE),
.io_apbSlave_1_PWDATA(io_apbSlave_1_PWDATA),
.io_apbSlave_1_PRDATA(io_apbSlave_1_PRDATA),
.io_apbSlave_1_PSLVERROR(io_apbSlave_1_PSLVERROR),
.jtagCtrl_tck(jtag_inst1_TCK),
.jtagCtrl_tdi(jtag_inst1_TDI),
.jtagCtrl_tdo(jtag_inst1_TDO),
.jtagCtrl_enable(jtag_inst1_SEL),
.jtagCtrl_capture(jtag_inst1_CAPTURE),
.jtagCtrl_shift(jtag_inst1_SHIFT),
.jtagCtrl_update(jtag_inst1_UPDATE),
.jtagCtrl_reset(jtag_inst1_RESET),
.system_gpio_0_io_read(system_gpio_0_io_read),
.system_gpio_0_io_write(system_gpio_0_io_write),
.system_gpio_0_io_writeEnable(system_gpio_0_io_writeEnable),
.userInterruptA(userInterrupt_0),
.system_spi_0_io_sclk_write(system_spi_0_io_sclk_write),
.system_spi_0_io_data_0_writeEnable(system_spi_0_io_data_0_writeEnable),
.system_spi_0_io_data_0_read(system_spi_0_io_data_0_read),
.system_spi_0_io_data_0_write(system_spi_0_io_data_0_write),
.system_spi_0_io_data_1_writeEnable(system_spi_0_io_data_1_writeEnable),
.system_spi_0_io_data_1_read(system_spi_0_io_data_1_read),
.system_spi_0_io_data_1_write(system_spi_0_io_data_1_write),
.system_spi_0_io_data_2_writeEnable(),
.system_spi_0_io_data_2_read(),
.system_spi_0_io_data_2_write(),
.system_spi_0_io_data_3_writeEnable(),
.system_spi_0_io_data_3_read(),
.system_spi_0_io_data_3_write(),
.system_spi_0_io_ss(system_spi_0_io_ss),
.system_uart_0_io_txd(system_uart_0_io_txd),
.system_uart_0_io_rxd(system_uart_0_io_rxd),
.io_apbSlave_0_PADDR(io_apbSlave_0_PADDR),
.io_apbSlave_0_PSEL(io_apbSlave_0_PSEL),
.io_apbSlave_0_PENABLE(io_apbSlave_0_PENABLE),
.io_apbSlave_0_PREADY(io_apbSlave_0_PREADY),
.io_apbSlave_0_PWRITE(io_apbSlave_0_PWRITE),
.io_apbSlave_0_PWDATA(io_apbSlave_0_PWDATA),
.io_apbSlave_0_PRDATA(io_apbSlave_0_PRDATA),
.io_apbSlave_0_PSLVERROR(io_apbSlave_0_PSLVERROR),

.io_systemClk(io_systemClk),
.io_asyncReset(reset),
.io_systemReset(io_systemReset)		
);

endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2023 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////
