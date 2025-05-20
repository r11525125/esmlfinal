/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2020 Efinix Inc. All rights reserved.
//
// Description:
// A simple ram model to emulate DDR RAM.
// Note:
// 1. Simulation with DDR controller and DDR RAM model will be available in
// future release
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
// 1.1 fix array concatenate issue
/////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module simple_ddr_model
(
	input		 mem_clk,
	input		 resetn,
	input [7:0] 	 aid_0,
	input [31:0] 	 aaddr_0,
	input [7:0] 	 alen_0,
	input [2:0] 	 asize_0,
	input [1:0] 	 aburst_0,
	input [1:0] 	 alock_0,
	input 		 avalid_0,
	output reg	 aready_0,
	input		 atype_0,


	input [7:0] 	 wid_0,
	input [127:0] 	 wdata_0,
	input [15:0] 	 wstrb_0,
	input 		 wlast_0,
	input 		 wvalid_0,
	output reg 	 wready_0,

	output [7:0] 	 rid_0,
	output [127:0] 	 rdata_0,
	output reg 	 rlast_0,
	output reg 	 rvalid_0,
	input 		 rready_0,
	output reg [1:0] rresp_0,


	output reg [7:0] bid_0,
	output reg 	 bvalid_0,
	input 		 bready_0

);
/////////////////////////////////////////////////////////////////////////////
localparam	s_idle	= 2'b00;
localparam	s_write	= 2'b01;
localparam	s_resp	= 2'b10;
localparam	s_read	= 2'b11;

reg   [1:0]  	r_ram0_state_1P;
reg   [7:0]  	r_aid_0_1P;
reg   [18:0] 	r_aaddr_0_1P;
reg   [7:0]  	r_alen_0_1P;
wire  [127:0]	wdata;
reg   [127:0]	wdata_r = 'd0;
/////////////////////////////////////////////////////////////////////////////

always@(negedge resetn or posedge mem_clk)
begin
	if (~resetn)
	begin
		r_ram0_state_1P	<= s_idle;
		r_aid_0_1P	<= {8{1'b0}};
		r_aaddr_0_1P	<= {19{1'b0}};
		r_alen_0_1P	<= {8{1'b0}};
		rlast_0		<= 1'b0;
		rvalid_0	<= 1'b0;
		aready_0	<= 1'b0;
		wready_0	<= 1'b0;
		bid_0		<= {8{1'b0}};
		bvalid_0	<= 1'b0;
		rresp_0		<= 2'b00;
	end else
	begin
		aready_0	<= 1'b0;
		rresp_0		<= 2'b00;
		
		case (r_ram0_state_1P)
			s_idle:
			begin
				if (avalid_0)
				begin
					if (atype_0)
					begin
						r_ram0_state_1P	<= s_write;
						wready_0	<= 1'b1;
					end
					else
					begin
						r_ram0_state_1P	<= s_read;
					end
					
					r_aid_0_1P		<= aid_0;
					r_aaddr_0_1P		<= aaddr_0[23:4];
					r_alen_0_1P		<= alen_0;
					aready_0		<= 1'b1;
				end
			end
			
			s_write:
			begin
				if (wvalid_0)
				begin
					r_aaddr_0_1P		<= r_aaddr_0_1P+1'b1;
					r_alen_0_1P		<= r_alen_0_1P-1'b1;
					
					if (r_alen_0_1P == {8{1'b0}})
					begin
						r_ram0_state_1P	<= s_resp;
						wready_0	<= 1'b0;
						bid_0		<= r_aid_0_1P;
						bvalid_0	<= 1'b1;
					end
				end
			end

			s_resp:
			begin
				if (bready_0)
				begin
					r_ram0_state_1P		<= s_idle;
					bvalid_0		<= 1'b0;
				end
			end
			
			s_read:
			begin
				rvalid_0			<= 1'b1;
				
				if (alen_0 == 8'b0)
					rlast_0			<= 1'b1;
				
				if (rvalid_0 && rready_0)
				begin
					r_aaddr_0_1P		<= r_aaddr_0_1P+1'b1;
					r_alen_0_1P		<= r_alen_0_1P-1'b1;
					
					if (r_alen_0_1P == 8'b1)
						rlast_0		<= 1'b1;
					
					if (r_alen_0_1P == {8{1'b0}})
					begin
						rvalid_0	<= 1'b0;
						rlast_0		<= 1'b0;
						
						r_ram0_state_1P	<= s_idle;
					end
				end
			end
			
			default:
			begin
				r_ram0_state_1P		<= s_idle;
				r_aid_0_1P		<= {8{1'b0}};
				r_aaddr_0_1P		<= {19{1'b0}};
				r_alen_0_1P		<= {8{1'b0}};
				rlast_0			<= 1'b0;
				rvalid_0		<= 1'b0;
				wready_0		<= 1'b0;
				bid_0			<= {8{1'b0}};
				bvalid_0		<= 1'b0;
			end
		endcase
	end
end
 genvar i;
 generate
 for(i=0; i < 16; i = i + 1) begin
	//assign wdata[(i*8+7) -: 8] = (wdata_0[(i*8+7) -: 8] & {{8}{wstrb_0[i]}}) | rdata_0[(i*8+7) -: 8];
	assign wdata[(i*8+7) -: 8] =  (wdata_0[(i*8+7) -: 8] & {8{wstrb_0[i]}});
	
	always@(wvalid_0)
		//wdata_r[(i*8+7) -: 8] <= wstrb_0[0] ? wdata[(i*8+7) -: 8] : wdata[(i*8+7) -: 8] | rdata_0[(i*8+7) -: 8];
		wdata_r[(i*8+7) -: 8] <= {8{wstrb_0[i]}} ? wdata[(i*8+7) -: 8] : rdata_0[(i*8+7) -: 8];

 end
 endgenerate

	 	ddr_simple_dual_port_ram #(
			.DATA_WIDTH (128),
			.ADDR_WIDTH (19),
			.RAM_INIT_FILE("MEM.TXT"),
			.OUTPUT_REG ("FALSE")
						 
	 	) ddr_ram (
			.wdata 	(wdata_r),
			.waddr	(r_aaddr_0_1P), 
			.raddr	(r_aaddr_0_1P),
			.we	(wvalid_0), 
			.wclk	(mem_clk), 
			.re	(rvalid_0|wready_0), 
			.rclk	(mem_clk),
			.rdata	(rdata_0)
	 	);

assign	rid_0	= r_aid_0_1P;


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
