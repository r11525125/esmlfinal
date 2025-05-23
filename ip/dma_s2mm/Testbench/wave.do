onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/clk
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/reset
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PADDR
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PREADY
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PENABLE
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PSEL
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PWRITE
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PWDATA
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PRDATA
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_PSLVERROR
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/ctrl_interrupts
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_araddr
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arregion
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arlen
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arsize
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arburst
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arlock
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arcache
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arqos
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_arprot
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_rready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_rvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_rdata
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_rlast
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awaddr
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awregion
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awlen
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awsize
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awburst
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awlock
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awcache
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awqos
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_awprot
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_wvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_wready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_wdata
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_wstrb
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_wlast
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_bvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_bready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/write_bresp
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_tvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_tready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_tdata
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_tkeep
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_tdest
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_tlast
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_clk
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_reset
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_clk
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat0_o_reset
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_tvalid
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_tready
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_tdata
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_tkeep
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_tdest
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/dat1_i_tlast
add wave -noupdate /tb_soc/dut_wrapper/dut/dma/read_rresp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2337280648 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {1429722830 ps} {1796667503 ps}
