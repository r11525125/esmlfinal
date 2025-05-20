onerror {quit -f}
vlib work
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./bin2gray.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./ddr_simple_dual_port_ram.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./default_soc.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./default_soc_define.vh
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./dma_exp_0.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./dma_loopback_tester.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./efx_asyncfifo_ctl.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./efx_fifo_ctl_sm.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./efx_fifo_functions.vh
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./efx_fifo_wrapper.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./efx_syncfifo_ctl.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./gray2bin.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./memory_checker.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./pipe_reg.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./simple_ddr_model.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./simple_dual_port_ram_fifo.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./soc_dma_exp_0.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./soc_dma_exp_0_define.vh
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./tb_define.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./tb_soc.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./top.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./top_soc_wrapper.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./user_dual_port_ram.v
vlog +define+SIM+SIM_MODE+EFX_SIM -sv ./dma_s2mm.v
vsim -t ns work.tb_soc
run -all
