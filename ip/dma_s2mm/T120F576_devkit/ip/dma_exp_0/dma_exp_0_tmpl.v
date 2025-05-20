////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////

dma_exp_0 u_dma_exp_0(
.clk ( clk ),
.reset ( reset ),
.ctrl_PADDR ( ctrl_PADDR ),
.ctrl_PREADY ( ctrl_PREADY ),
.ctrl_PENABLE ( ctrl_PENABLE ),
.ctrl_PSEL ( ctrl_PSEL ),
.ctrl_PWRITE ( ctrl_PWRITE ),
.ctrl_PWDATA ( ctrl_PWDATA ),
.ctrl_PRDATA ( ctrl_PRDATA ),
.ctrl_PSLVERROR ( ctrl_PSLVERROR ),
.ctrl_interrupts ( ctrl_interrupts ),
.read_arvalid ( read_arvalid ),
.read_araddr ( read_araddr ),
.read_arready ( read_arready ),
.read_arregion ( read_arregion ),
.read_arlen ( read_arlen ),
.read_arsize ( read_arsize ),
.read_arburst ( read_arburst ),
.read_arlock ( read_arlock ),
.read_arcache ( read_arcache ),
.read_arqos ( read_arqos ),
.read_arprot ( read_arprot ),
.read_rready ( read_rready ),
.read_rvalid ( read_rvalid ),
.read_rdata ( read_rdata ),
.read_rlast ( read_rlast ),
.write_awvalid ( write_awvalid ),
.write_awready ( write_awready ),
.write_awaddr ( write_awaddr ),
.write_awregion ( write_awregion ),
.write_awlen ( write_awlen ),
.write_awsize ( write_awsize ),
.write_awburst ( write_awburst ),
.write_awlock ( write_awlock ),
.write_awcache ( write_awcache ),
.write_awqos ( write_awqos ),
.write_awprot ( write_awprot ),
.write_wvalid ( write_wvalid ),
.write_wready ( write_wready ),
.write_wdata ( write_wdata ),
.write_wstrb ( write_wstrb ),
.write_wlast ( write_wlast ),
.write_bvalid ( write_bvalid ),
.write_bready ( write_bready ),
.write_bresp ( write_bresp ),
.dat0_o_tvalid ( dat0_o_tvalid ),
.dat0_o_tready ( dat0_o_tready ),
.dat0_o_tdata ( dat0_o_tdata ),
.dat0_o_tkeep ( dat0_o_tkeep ),
.dat0_o_tdest ( dat0_o_tdest ),
.dat0_o_tlast ( dat0_o_tlast ),
.dat1_i_clk ( dat1_i_clk ),
.dat1_i_reset ( dat1_i_reset ),
.dat0_o_clk ( dat0_o_clk ),
.dat0_o_reset ( dat0_o_reset ),
.dat1_i_tvalid ( dat1_i_tvalid ),
.dat1_i_tready ( dat1_i_tready ),
.dat1_i_tdata ( dat1_i_tdata ),
.dat1_i_tkeep ( dat1_i_tkeep ),
.dat1_i_tdest ( dat1_i_tdest ),
.dat1_i_tlast ( dat1_i_tlast ),
.read_rresp ( read_rresp )
);
