/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2021 Efinix Inc. All rights reserved.
//
// Description:
// Soc wrapper file for soc simulation.
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

module top_soc_wrapper(

  	output	      		my_pll_rstn,
  	input			my_pll_locked,
  	output	      		my_ddr_pll_rstn,
  	input			my_ddr_pll_locked,
  	input               	io_memoryClk,
  	input               	io_systemClk,
  	input               	io_asyncReset,
	//UART
  	output              	system_uart_0_io_txd,
  	input               	system_uart_0_io_rxd,
	//SPI
	inout			system_spi_0_io_data_0,
	inout			system_spi_0_io_data_1,
  	output   reg      	system_spi_0_io_sclk_write,
  	output   reg      	system_spi_0_io_ss,
	//DDR
  	output              	io_ddrA_arw_valid,
  	input               	io_ddrA_arw_ready,
  	output     [31:0]   	io_ddrA_arw_payload_addr,
  	output     [7:0]    	io_ddrA_arw_payload_id,
  	output     [7:0]    	io_ddrA_arw_payload_len,
  	output     [2:0]    	io_ddrA_arw_payload_size,
  	output     [1:0]    	io_ddrA_arw_payload_burst,
  	output     [1:0]    	io_ddrA_arw_payload_lock,
  	output              	io_ddrA_arw_payload_write,
  	output     [7:0]    	io_ddrA_w_payload_id,
  	output              	io_ddrA_w_valid,
  	input               	io_ddrA_w_ready,
  	output     [127:0]  	io_ddrA_w_payload_data,
  	output     [15:0]   	io_ddrA_w_payload_strb,
  	output              	io_ddrA_w_payload_last,
  	input               	io_ddrA_b_valid,
  	output              	io_ddrA_b_ready,
  	input      [7:0]    	io_ddrA_b_payload_id,
  	input               	io_ddrA_r_valid,
  	output              	io_ddrA_r_ready,
  	input      [127:0]  	io_ddrA_r_payload_data,
  	input      [7:0]    	io_ddrA_r_payload_id,
  	input      [1:0]    	io_ddrA_r_payload_resp,
  	input               	io_ddrA_r_payload_last,
	//JTAG
	input               	jtag_inst1_TCK,
  	input               	jtag_inst1_TDI,
  	output              	jtag_inst1_TDO,
  	input               	jtag_inst1_SEL,
  	input               	jtag_inst1_CAPTURE,
  	input               	jtag_inst1_SHIFT,
  	input               	jtag_inst1_UPDATE,
  	input               	jtag_inst1_RESET
);
/////////////////////////////////////////////////////////////////////////////
wire		spi_0_io_sclk_write;
wire		spi_0_io_ss;
wire		spi_0_io_data_0_write;
reg		system_spi_0_io_data_0_write;
reg		system_spi_0_io_data_0_read;
wire		spi_0_io_data_0_writeEnable;
reg		system_spi_0_io_data_0_writeEnable;
wire		spi_0_io_data_1_write;
reg		system_spi_0_io_data_1_write;
reg		system_spi_0_io_data_1_read;
wire		spi_0_io_data_1_writeEnable;
reg		system_spi_0_io_data_1_writeEnable;


assign system_spi_0_io_data_0 = system_spi_0_io_data_0_writeEnable? system_spi_0_io_data_0_write : 1'bZ;
assign system_spi_0_io_data_1 = system_spi_0_io_data_1_writeEnable? system_spi_0_io_data_1_write : 1'bZ;


always@(posedge io_systemClk)
begin
system_spi_0_io_sclk_write 		<= spi_0_io_sclk_write;
system_spi_0_io_ss 			<= spi_0_io_ss;
system_spi_0_io_data_0_writeEnable 	<= spi_0_io_data_0_writeEnable;
system_spi_0_io_data_1_writeEnable 	<= spi_0_io_data_1_writeEnable;
system_spi_0_io_data_0_read 		<= system_spi_0_io_data_0;
system_spi_0_io_data_1_read 		<= system_spi_0_io_data_1;
system_spi_0_io_data_0_write 		<= spi_0_io_data_0_write;
system_spi_0_io_data_1_write 		<= spi_0_io_data_1_write;
end

/////////////////////////////////////////////////////////////////////////////

top dut (

  	.my_pll_rstn 				(my_pll_rstn),
  	.my_pll_locked				(my_pll_locked),
  	.my_ddr_pll_rstn			(my_ddr_pll_rstn),
  	.my_ddr_pll_locked			(my_ddr_pll_locked),
  	.io_memoryClk				(io_memoryClk),
  	.io_systemClk				(io_systemClk),
  	.io_asyncReset				(io_asyncReset),
  	.system_uart_0_io_txd			(system_uart_0_io_txd),
  	.system_uart_0_io_rxd			(system_uart_0_io_rxd),
  	.io_ddrA_arw_valid			(io_ddrA_arw_valid),
  	.io_ddrA_arw_ready			(io_ddrA_arw_ready),
  	.io_ddrA_arw_payload_addr		(io_ddrA_arw_payload_addr),
  	.io_ddrA_arw_payload_id			(io_ddrA_arw_payload_id),
  	.io_ddrA_arw_payload_len		(io_ddrA_arw_payload_len),
  	.io_ddrA_arw_payload_size		(io_ddrA_arw_payload_size),
  	.io_ddrA_arw_payload_burst		(io_ddrA_arw_payload_burst),
  	.io_ddrA_arw_payload_lock		(io_ddrA_arw_payload_lock),
  	.io_ddrA_arw_payload_write		(io_ddrA_arw_payload_write),
  	.io_ddrA_w_payload_id			(io_ddrA_w_payload_id),
  	.io_ddrA_w_valid			(io_ddrA_w_valid),
  	.io_ddrA_w_ready			(io_ddrA_w_ready),
  	.io_ddrA_w_payload_data			(io_ddrA_w_payload_data),
  	.io_ddrA_w_payload_strb			(io_ddrA_w_payload_strb),
  	.io_ddrA_w_payload_last			(io_ddrA_w_payload_last),
  	.io_ddrA_b_valid			(io_ddrA_b_valid),
  	.io_ddrA_b_ready			(io_ddrA_b_ready),
  	.io_ddrA_b_payload_id			(io_ddrA_b_payload_id),
  	.io_ddrA_r_valid			(io_ddrA_r_valid),
  	.io_ddrA_r_ready			(io_ddrA_r_ready),
  	.io_ddrA_r_payload_data			(io_ddrA_r_payload_data),
  	.io_ddrA_r_payload_id			(io_ddrA_r_payload_id),
  	.io_ddrA_r_payload_resp			(io_ddrA_r_payload_resp),
  	.io_ddrA_r_payload_last			(io_ddrA_r_payload_last),
  	.system_spi_0_io_sclk_write		(spi_0_io_sclk_write),
  	.system_spi_0_io_data_0_writeEnable	(spi_0_io_data_0_writeEnable),
  	.system_spi_0_io_data_0_read		(system_spi_0_io_data_0_read),
  	.system_spi_0_io_data_0_write		(spi_0_io_data_0_write),
  	.system_spi_0_io_data_1_writeEnable	(spi_0_io_data_1_writeEnable),
  	.system_spi_0_io_data_1_read		(system_spi_0_io_data_1_read),
  	.system_spi_0_io_data_1_write		(spi_0_io_data_1_write),
  	.system_spi_0_io_ss			(spi_0_io_ss),
	.jtag_inst1_TCK				(jtag_inst1_TCK),
  	.jtag_inst1_TDI				(jtag_inst1_TDI),
  	.jtag_inst1_TDO				(jtag_inst1_TDO),
  	.jtag_inst1_SEL				(jtag_inst1_SEL),
  	.jtag_inst1_CAPTURE			(jtag_inst1_CAPTURE),
  	.jtag_inst1_SHIFT			(jtag_inst1_SHIFT),
  	.jtag_inst1_UPDATE			(jtag_inst1_UPDATE),
  	.jtag_inst1_RESET			(jtag_inst1_RESET)

);


endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2020 Efinix Inc. All rights reserved.
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

