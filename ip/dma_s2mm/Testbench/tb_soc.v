/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2021 Efinix Inc. All rights reserved.
//
// Description:
// Example Testbench for soc_dma_exp
// Note:
// 1. This simulation bypass SPI user binary loading to speed up simulation.
// 2. If SPI user binary loading should include in validation, please consult
// Efinix Inc. for more details.
// 3. Do not use memory initialization files (*.bin) in real design, please
// use memory initialization files that located in soc_Ruby_hw/source folder
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

module tb_soc ();

`include "soc_dma_exp_0_define.vh"

localparam	 MHZ = FREQ * 1000000;
real             CLK_PERIOD = (1000000000/real'(MHZ)) ;
reg  [10:0]      BAUDRATE   = (MHZ/115200);
/////////////////////////////////////////////////////////////////////////////
reg		clk			= 1'b0;
reg		mem_clk			= 1'b0;
reg		resetn			= 1'b1;
reg		my_pll_locked		= 1'b0;
reg		my_ddr_pll_locked	= 1'b0;
reg		uart_pass		= 1'b0;
reg		gpio_pass		= 1'b0;
wire 		system_spi_0_io_ss;
wire 		system_spi_0_io_sclk_write;
wire 		system_spi_0_io_data_0;
wire 		system_spi_0_io_data_1;
wire		system_uart_0_io_txd;
reg		system_uart_0_io_rxd	= 1'b1;
reg             uart_active = 1'b0;
//DDR
wire            io_ddrA_arw_valid;
wire            io_ddrA_arw_ready;
wire  [31:0]   	io_ddrA_arw_payload_addr;
wire  [7:0]    	io_ddrA_arw_payload_id;
wire  [7:0]    	io_ddrA_arw_payload_len;
wire  [2:0]    	io_ddrA_arw_payload_size;
wire  [1:0]    	io_ddrA_arw_payload_burst;
wire  [1:0]    	io_ddrA_arw_payload_lock;
wire           	io_ddrA_arw_payload_write;
wire  [7:0]    	io_ddrA_w_payload_id;
wire           	io_ddrA_w_valid;
wire           	io_ddrA_w_ready;
wire  [127:0]  	io_ddrA_w_payload_data;
wire  [15:0]   	io_ddrA_w_payload_strb;
wire           	io_ddrA_w_payload_last;
wire           	io_ddrA_b_valid;
wire           	io_ddrA_b_ready;
wire  [7:0]    	io_ddrA_b_payload_id;
wire           	io_ddrA_r_valid;
wire           	io_ddrA_r_ready;
wire  [127:0]  	io_ddrA_r_payload_data;
wire  [7:0]    	io_ddrA_r_payload_id;
wire  [1:0]    	io_ddrA_r_payload_resp;
wire           	io_ddrA_r_payload_last;
//SPI FLASH
reg  		WPn;
reg  		HOLDn;
//UART
reg   [10:0]	baudreg;
wire		baudtick;
reg   [9:0]	uart_rxd_buffer;
integer		i;
//GPIO
wire  [7:0]	system_gpio_0_io;
/////////////////////////////////////////////////////////////////////////////
//system clock
always #(CLK_PERIOD/2) clk = ~clk;
always #5  mem_clk = ~mem_clk;
//115200 baudrate
always@(posedge clk)
begin
	if(!uart_active)
		baudreg <= BAUDRATE/2;
	else begin
		if(baudreg !== BAUDRATE)
		baudreg <= baudreg + 1'b1;
		else
		baudreg <= 'h0;
	end
end

assign baudtick = (baudreg == BAUDRATE);

/////////////////////////////////////////////////////////////////////////////

initial
begin:system
	$display($time,,"-----------------------------------------");
	$display($time,,"[EFX_INFO]: Start executing DMA TEST");
	$display($time,,"[EFX_INFO]: Memory controller and memory model using in this simulation do not show real performance of hardware and thus may impact output and behaviour of DMA");
	$display($time,,"[EFX_INFO]: Please Contact Efinix INC. for DDR memory controller and model support");
	$display($time,,"-----------------------------------------");
	repeat (10) @(posedge clk);
	resetn 		= 1'b0;
	repeat (5)  @(posedge clk);
	resetn 		= 1'b1;
	repeat (2)  @(posedge clk);
	my_pll_locked 	  = 1'b1;
	my_ddr_pll_locked = 1'b1;
	uart_active	  = 0;
end

initial 
begin:timeout
	#12000000
	$display($time,,"-----------------------------------------");
	$display($time,,"[EFX_FATAL]: Simulation timeout, aborting simulation  ");
	$display($time,,"-----------------------------------------");
	$finish;

end

initial
begin:monitor
	@(posedge dut_wrapper.dut.dma.dat1_i_tvalid);
	$display($time,,"[EFX_INFO]: Transferring in Direct Mode detected");
	@(posedge dut_wrapper.dut.dma.dat1_i_tvalid);
	$display($time,,"[EFX_INFO]: Transferring in SG Mode detected");
	#1000000
	$display($time,,"[EFX_INFO]: TEST PASSED!");
	$finish;
end
top_soc_wrapper dut_wrapper(

  	.my_pll_rstn			(),
  	.my_pll_locked			(my_pll_locked),
  	.my_ddr_pll_rstn		(),
  	.my_ddr_pll_locked		(my_ddr_pll_locked),
  	.io_memoryClk			(mem_clk),
  	.io_systemClk			(clk),
  	.io_asyncReset			(resetn),
  	.system_uart_0_io_txd		(system_uart_0_io_txd),
  	.system_uart_0_io_rxd		(system_uart_0_io_rxd),
	.system_spi_0_io_data_0		(system_spi_0_io_data_0),
	.system_spi_0_io_data_1		(system_spi_0_io_data_1),
  	.system_spi_0_io_sclk_write	(system_spi_0_io_sclk_write),
  	.system_spi_0_io_ss		(system_spi_0_io_ss),
  	.io_ddrA_arw_valid		(io_ddrA_arw_valid),
  	.io_ddrA_arw_ready		(io_ddrA_arw_ready),
  	.io_ddrA_arw_payload_addr	(io_ddrA_arw_payload_addr),
  	.io_ddrA_arw_payload_id		(io_ddrA_arw_payload_id),
  	.io_ddrA_arw_payload_len	(io_ddrA_arw_payload_len),
  	.io_ddrA_arw_payload_size	(io_ddrA_arw_payload_size),
  	.io_ddrA_arw_payload_burst	(io_ddrA_arw_payload_burst),
  	.io_ddrA_arw_payload_lock	(io_ddrA_arw_payload_lock),
  	.io_ddrA_arw_payload_write	(io_ddrA_arw_payload_write),
  	.io_ddrA_w_payload_id		(io_ddrA_w_payload_id),
  	.io_ddrA_w_valid		(io_ddrA_w_valid),
  	.io_ddrA_w_ready		(io_ddrA_w_ready),
  	.io_ddrA_w_payload_data		(io_ddrA_w_payload_data),
  	.io_ddrA_w_payload_strb		(io_ddrA_w_payload_strb),
  	.io_ddrA_w_payload_last		(io_ddrA_w_payload_last),
  	.io_ddrA_b_valid		(io_ddrA_b_valid),
  	.io_ddrA_b_ready		(io_ddrA_b_ready),
  	.io_ddrA_b_payload_id		(io_ddrA_b_payload_id),
  	.io_ddrA_r_valid		(io_ddrA_r_valid),
  	.io_ddrA_r_ready		(io_ddrA_r_ready),
  	.io_ddrA_r_payload_data		(io_ddrA_r_payload_data),
  	.io_ddrA_r_payload_id		(io_ddrA_r_payload_id),
  	.io_ddrA_r_payload_resp		(io_ddrA_r_payload_resp),
  	.io_ddrA_r_payload_last		(io_ddrA_r_payload_last),
	.jtag_inst1_TCK			(),
  	.jtag_inst1_TDI			(),
  	.jtag_inst1_TDO			(),
  	.jtag_inst1_SEL			(),
  	.jtag_inst1_CAPTURE		(),
  	.jtag_inst1_SHIFT		(),
  	.jtag_inst1_UPDATE		(),
  	.jtag_inst1_RESET		()

);

simple_ddr_model simple_dram
(
	.mem_clk			(mem_clk),
	.resetn				(resetn),
	.aid_0				(io_ddrA_arw_payload_id),
	.aaddr_0			(io_ddrA_arw_payload_addr),
	.alen_0				(io_ddrA_arw_payload_len),
	.asize_0			(io_ddrA_arw_payload_size),
	.aburst_0			(io_ddrA_arw_payload_burst),
	.alock_0			(io_ddrA_arw_payload_lock),
	.avalid_0			(io_ddrA_arw_valid),
	.aready_0			(io_ddrA_arw_ready),
	.atype_0			(io_ddrA_arw_payload_write),
	.wid_0				(io_ddrA_w_payload_id),
	.wdata_0			(io_ddrA_w_payload_data),
	.wstrb_0			(io_ddrA_w_payload_strb),
	.wlast_0			(io_ddrA_w_payload_last),
	.wvalid_0			(io_ddrA_w_valid),
	.wready_0			(io_ddrA_w_ready),
	.rid_0				(io_ddrA_r_payload_id),
	.rdata_0			(io_ddrA_r_payload_data),
	.rlast_0			(io_ddrA_r_payload_last),
	.rvalid_0			(io_ddrA_r_valid),
	.rready_0			(io_ddrA_r_ready),
	.rresp_0			(io_ddrA_r_payload_resp),
	.bid_0				(io_ddrA_b_payload_id),
	.bvalid_0			(io_ddrA_b_valid),
	.bready_0			(io_ddrA_b_ready)

);


endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2021 Efinix Inc. All rights reserved.
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
