// Generator : SpinalHDL v1.4.3    git head : 20a4261df2693e53e5a2e0efbb78d19d9a8ea2bc
// Component : EfxDMA



module EfxDMA (
  input      [13:0]   ctrl_PADDR,
  input      [0:0]    ctrl_PSEL,
  input               ctrl_PENABLE,
  output              ctrl_PREADY,
  input               ctrl_PWRITE,
  input      [31:0]   ctrl_PWDATA,
  output     [31:0]   ctrl_PRDATA,
  output              ctrl_PSLVERROR,
  output     [1:0]    ctrl_interrupts,
  output              read_arvalid,
  input               read_arready,
  output     [31:0]   read_araddr,
  output     [3:0]    read_arregion,
  output     [7:0]    read_arlen,
  output     [2:0]    read_arsize,
  output     [1:0]    read_arburst,
  output     [0:0]    read_arlock,
  output     [3:0]    read_arcache,
  output     [3:0]    read_arqos,
  output     [2:0]    read_arprot,
  input               read_rvalid,
  output              read_rready,
  input      [63:0]   read_rdata,
  input      [1:0]    read_rresp,
  input               read_rlast,
  output              write_awvalid,
  input               write_awready,
  output     [31:0]   write_awaddr,
  output     [3:0]    write_awregion,
  output     [7:0]    write_awlen,
  output     [2:0]    write_awsize,
  output     [1:0]    write_awburst,
  output     [0:0]    write_awlock,
  output     [3:0]    write_awcache,
  output     [3:0]    write_awqos,
  output     [2:0]    write_awprot,
  output              write_wvalid,
  input               write_wready,
  output     [63:0]   write_wdata,
  output     [7:0]    write_wstrb,
  output              write_wlast,
  input               write_bvalid,
  output              write_bready,
  input      [1:0]    write_bresp,
  input               dat1_i_tvalid,
  output              dat1_i_tready,
  input      [31:0]   dat1_i_tdata,
  input      [3:0]    dat1_i_tkeep,
  input      [3:0]    dat1_i_tdest,
  input               dat1_i_tlast,
  output              dat0_o_tvalid,
  input               dat0_o_tready,
  output     [31:0]   dat0_o_tdata,
  output     [3:0]    dat0_o_tkeep,
  output     [3:0]    dat0_o_tdest,
  output              dat0_o_tlast,
  input               clk,
  input               reset,
  input               dat1_i_clk,
  input               dat1_i_reset,
  input               dat0_o_clk,
  input               dat0_o_reset
);
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                core_io_sgRead_cmd_valid;
  wire                core_io_sgRead_cmd_payload_last;
  wire       [0:0]    core_io_sgRead_cmd_payload_fragment_opcode;
  wire       [31:0]   core_io_sgRead_cmd_payload_fragment_address;
  wire       [4:0]    core_io_sgRead_cmd_payload_fragment_length;
  wire       [0:0]    core_io_sgRead_cmd_payload_fragment_context;
  wire                core_io_sgRead_rsp_ready;
  wire                core_io_sgWrite_cmd_valid;
  wire                core_io_sgWrite_cmd_payload_last;
  wire       [0:0]    core_io_sgWrite_cmd_payload_fragment_opcode;
  wire       [31:0]   core_io_sgWrite_cmd_payload_fragment_address;
  wire       [1:0]    core_io_sgWrite_cmd_payload_fragment_length;
  wire       [63:0]   core_io_sgWrite_cmd_payload_fragment_data;
  wire       [7:0]    core_io_sgWrite_cmd_payload_fragment_mask;
  wire       [0:0]    core_io_sgWrite_cmd_payload_fragment_context;
  wire                core_io_sgWrite_rsp_ready;
  wire                core_io_read_cmd_valid;
  wire                core_io_read_cmd_payload_last;
  wire       [0:0]    core_io_read_cmd_payload_fragment_opcode;
  wire       [31:0]   core_io_read_cmd_payload_fragment_address;
  wire       [10:0]   core_io_read_cmd_payload_fragment_length;
  wire       [17:0]   core_io_read_cmd_payload_fragment_context;
  wire                core_io_read_rsp_ready;
  wire                core_io_write_cmd_valid;
  wire                core_io_write_cmd_payload_last;
  wire       [0:0]    core_io_write_cmd_payload_fragment_opcode;
  wire       [31:0]   core_io_write_cmd_payload_fragment_address;
  wire       [10:0]   core_io_write_cmd_payload_fragment_length;
  wire       [63:0]   core_io_write_cmd_payload_fragment_data;
  wire       [7:0]    core_io_write_cmd_payload_fragment_mask;
  wire       [11:0]   core_io_write_cmd_payload_fragment_context;
  wire                core_io_write_rsp_ready;
  wire                core_io_outputs_0_valid;
  wire       [31:0]   core_io_outputs_0_payload_data;
  wire       [3:0]    core_io_outputs_0_payload_mask;
  wire       [3:0]    core_io_outputs_0_payload_sink;
  wire                core_io_outputs_0_payload_last;
  wire                core_io_inputs_0_ready;
  wire       [1:0]    core_io_interrupts;
  wire                core_io_ctrl_PREADY;
  wire       [31:0]   core_io_ctrl_PRDATA;
  wire                core_io_ctrl_PSLVERROR;
  wire                interconnect_read_aggregated_arbiter_io_inputs_0_cmd_ready;
  wire                interconnect_read_aggregated_arbiter_io_inputs_0_rsp_valid;
  wire                interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_last;
  wire       [0:0]    interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  wire       [63:0]   interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_data;
  wire       [0:0]    interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_context;
  wire                interconnect_read_aggregated_arbiter_io_inputs_1_cmd_ready;
  wire                interconnect_read_aggregated_arbiter_io_inputs_1_rsp_valid;
  wire                interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_last;
  wire       [0:0]    interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_opcode;
  wire       [63:0]   interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_data;
  wire       [17:0]   interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_context;
  wire                interconnect_read_aggregated_arbiter_io_output_cmd_valid;
  wire                interconnect_read_aggregated_arbiter_io_output_cmd_payload_last;
  wire       [0:0]    interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_address;
  wire       [10:0]   interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_length;
  wire       [17:0]   interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_context;
  wire                interconnect_read_aggregated_arbiter_io_output_rsp_ready;
  wire                interconnect_write_aggregated_arbiter_io_inputs_0_cmd_ready;
  wire                interconnect_write_aggregated_arbiter_io_inputs_0_rsp_valid;
  wire                interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_last;
  wire       [0:0]    interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  wire       [0:0]    interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_arbiter_io_inputs_1_cmd_ready;
  wire                interconnect_write_aggregated_arbiter_io_inputs_1_rsp_valid;
  wire                interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_last;
  wire       [0:0]    interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_opcode;
  wire       [11:0]   interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_arbiter_io_output_cmd_valid;
  wire                interconnect_write_aggregated_arbiter_io_output_cmd_payload_last;
  wire       [0:0]    interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_address;
  wire       [10:0]   interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_length;
  wire       [63:0]   interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_data;
  wire       [7:0]    interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_mask;
  wire       [11:0]   interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_context;
  wire                interconnect_write_aggregated_arbiter_io_output_rsp_ready;
  wire                readLogic_sourceRemover_io_input_cmd_ready;
  wire                readLogic_sourceRemover_io_input_rsp_valid;
  wire                readLogic_sourceRemover_io_input_rsp_payload_last;
  wire       [0:0]    readLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  wire       [0:0]    readLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  wire       [63:0]   readLogic_sourceRemover_io_input_rsp_payload_fragment_data;
  wire       [17:0]   readLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  wire                readLogic_sourceRemover_io_output_cmd_valid;
  wire                readLogic_sourceRemover_io_output_cmd_payload_last;
  wire       [0:0]    readLogic_sourceRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   readLogic_sourceRemover_io_output_cmd_payload_fragment_address;
  wire       [10:0]   readLogic_sourceRemover_io_output_cmd_payload_fragment_length;
  wire       [18:0]   readLogic_sourceRemover_io_output_cmd_payload_fragment_context;
  wire                readLogic_sourceRemover_io_output_rsp_ready;
  wire                readLogic_bridge_io_input_cmd_ready;
  wire                readLogic_bridge_io_input_rsp_valid;
  wire                readLogic_bridge_io_input_rsp_payload_last;
  wire       [0:0]    readLogic_bridge_io_input_rsp_payload_fragment_opcode;
  wire       [63:0]   readLogic_bridge_io_input_rsp_payload_fragment_data;
  wire       [18:0]   readLogic_bridge_io_input_rsp_payload_fragment_context;
  wire                readLogic_bridge_io_output_ar_valid;
  wire       [31:0]   readLogic_bridge_io_output_ar_payload_addr;
  wire       [7:0]    readLogic_bridge_io_output_ar_payload_len;
  wire       [2:0]    readLogic_bridge_io_output_ar_payload_size;
  wire       [3:0]    readLogic_bridge_io_output_ar_payload_cache;
  wire       [2:0]    readLogic_bridge_io_output_ar_payload_prot;
  wire                readLogic_bridge_io_output_r_ready;
  wire                writeLogic_sourceRemover_io_input_cmd_ready;
  wire                writeLogic_sourceRemover_io_input_rsp_valid;
  wire                writeLogic_sourceRemover_io_input_rsp_payload_last;
  wire       [0:0]    writeLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  wire       [0:0]    writeLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  wire       [11:0]   writeLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  wire                writeLogic_sourceRemover_io_output_cmd_valid;
  wire                writeLogic_sourceRemover_io_output_cmd_payload_last;
  wire       [0:0]    writeLogic_sourceRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_address;
  wire       [10:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_length;
  wire       [63:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_data;
  wire       [7:0]    writeLogic_sourceRemover_io_output_cmd_payload_fragment_mask;
  wire       [12:0]   writeLogic_sourceRemover_io_output_cmd_payload_fragment_context;
  wire                writeLogic_sourceRemover_io_output_rsp_ready;
  wire                writeLogic_bridge_io_input_cmd_ready;
  wire                writeLogic_bridge_io_input_rsp_valid;
  wire                writeLogic_bridge_io_input_rsp_payload_last;
  wire       [0:0]    writeLogic_bridge_io_input_rsp_payload_fragment_opcode;
  wire       [12:0]   writeLogic_bridge_io_input_rsp_payload_fragment_context;
  wire                writeLogic_bridge_io_output_aw_valid;
  wire       [31:0]   writeLogic_bridge_io_output_aw_payload_addr;
  wire       [7:0]    writeLogic_bridge_io_output_aw_payload_len;
  wire       [2:0]    writeLogic_bridge_io_output_aw_payload_size;
  wire       [3:0]    writeLogic_bridge_io_output_aw_payload_cache;
  wire       [2:0]    writeLogic_bridge_io_output_aw_payload_prot;
  wire                writeLogic_bridge_io_output_w_valid;
  wire       [63:0]   writeLogic_bridge_io_output_w_payload_data;
  wire       [7:0]    writeLogic_bridge_io_output_w_payload_strb;
  wire                writeLogic_bridge_io_output_w_payload_last;
  wire                writeLogic_bridge_io_output_b_ready;
  wire                inputsAdapter_0_crossclock_fifo_io_push_ready;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_valid;
  wire       [31:0]   inputsAdapter_0_crossclock_fifo_io_pop_payload_data;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_payload_last;
  wire       [4:0]    inputsAdapter_0_crossclock_fifo_io_pushOccupancy;
  wire       [4:0]    inputsAdapter_0_crossclock_fifo_io_popOccupancy;
  wire                outputsAdapter_0_crossclock_fifo_io_push_ready;
  wire                outputsAdapter_0_crossclock_fifo_io_pop_valid;
  wire       [31:0]   outputsAdapter_0_crossclock_fifo_io_pop_payload_data;
  wire       [3:0]    outputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
  wire       [3:0]    outputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
  wire                outputsAdapter_0_crossclock_fifo_io_pop_payload_last;
  wire       [4:0]    outputsAdapter_0_crossclock_fifo_io_pushOccupancy;
  wire       [4:0]    outputsAdapter_0_crossclock_fifo_io_popOccupancy;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                core_io_write_cmd_s2mPipe_valid;
  wire                core_io_write_cmd_s2mPipe_ready;
  wire                core_io_write_cmd_s2mPipe_payload_last;
  wire       [0:0]    core_io_write_cmd_s2mPipe_payload_fragment_opcode;
  wire       [31:0]   core_io_write_cmd_s2mPipe_payload_fragment_address;
  wire       [10:0]   core_io_write_cmd_s2mPipe_payload_fragment_length;
  wire       [63:0]   core_io_write_cmd_s2mPipe_payload_fragment_data;
  wire       [7:0]    core_io_write_cmd_s2mPipe_payload_fragment_mask;
  wire       [11:0]   core_io_write_cmd_s2mPipe_payload_fragment_context;
  reg                 core_io_write_cmd_s2mPipe_rValid;
  reg                 core_io_write_cmd_s2mPipe_rData_last;
  reg        [0:0]    core_io_write_cmd_s2mPipe_rData_fragment_opcode;
  reg        [31:0]   core_io_write_cmd_s2mPipe_rData_fragment_address;
  reg        [10:0]   core_io_write_cmd_s2mPipe_rData_fragment_length;
  reg        [63:0]   core_io_write_cmd_s2mPipe_rData_fragment_data;
  reg        [7:0]    core_io_write_cmd_s2mPipe_rData_fragment_mask;
  reg        [11:0]   core_io_write_cmd_s2mPipe_rData_fragment_context;
  wire                core_io_write_cmd_s2mPipe_m2sPipe_valid;
  wire                core_io_write_cmd_s2mPipe_m2sPipe_ready;
  wire                core_io_write_cmd_s2mPipe_m2sPipe_payload_last;
  wire       [0:0]    core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_address;
  wire       [10:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_length;
  wire       [63:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_data;
  wire       [7:0]    core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_mask;
  wire       [11:0]   core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_context;
  reg                 core_io_write_cmd_s2mPipe_m2sPipe_rValid;
  reg                 core_io_write_cmd_s2mPipe_m2sPipe_rData_last;
  reg        [0:0]    core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_opcode;
  reg        [31:0]   core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_address;
  reg        [10:0]   core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_length;
  reg        [63:0]   core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_data;
  reg        [7:0]    core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_mask;
  reg        [11:0]   core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_context;
  wire                interconnect_read_aggregated_cmd_valid;
  wire                interconnect_read_aggregated_cmd_ready;
  wire                interconnect_read_aggregated_cmd_payload_last;
  wire       [0:0]    interconnect_read_aggregated_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_read_aggregated_cmd_payload_fragment_address;
  wire       [10:0]   interconnect_read_aggregated_cmd_payload_fragment_length;
  wire       [17:0]   interconnect_read_aggregated_cmd_payload_fragment_context;
  wire                interconnect_read_aggregated_rsp_valid;
  wire                interconnect_read_aggregated_rsp_ready;
  wire                interconnect_read_aggregated_rsp_payload_last;
  wire       [0:0]    interconnect_read_aggregated_rsp_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_rsp_payload_fragment_opcode;
  wire       [63:0]   interconnect_read_aggregated_rsp_payload_fragment_data;
  wire       [17:0]   interconnect_read_aggregated_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_cmd_valid;
  wire                interconnect_write_aggregated_cmd_ready;
  wire                interconnect_write_aggregated_cmd_payload_last;
  wire       [0:0]    interconnect_write_aggregated_cmd_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_cmd_payload_fragment_opcode;
  wire       [31:0]   interconnect_write_aggregated_cmd_payload_fragment_address;
  wire       [10:0]   interconnect_write_aggregated_cmd_payload_fragment_length;
  wire       [63:0]   interconnect_write_aggregated_cmd_payload_fragment_data;
  wire       [7:0]    interconnect_write_aggregated_cmd_payload_fragment_mask;
  wire       [11:0]   interconnect_write_aggregated_cmd_payload_fragment_context;
  wire                interconnect_write_aggregated_rsp_valid;
  wire                interconnect_write_aggregated_rsp_ready;
  wire                interconnect_write_aggregated_rsp_payload_last;
  wire       [0:0]    interconnect_write_aggregated_rsp_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_rsp_payload_fragment_opcode;
  wire       [11:0]   interconnect_write_aggregated_rsp_payload_fragment_context;
  wire                readLogic_resized_cmd_valid;
  wire                readLogic_resized_cmd_ready;
  wire                readLogic_resized_cmd_payload_last;
  wire       [0:0]    readLogic_resized_cmd_payload_fragment_source;
  wire       [0:0]    readLogic_resized_cmd_payload_fragment_opcode;
  wire       [31:0]   readLogic_resized_cmd_payload_fragment_address;
  wire       [10:0]   readLogic_resized_cmd_payload_fragment_length;
  wire       [17:0]   readLogic_resized_cmd_payload_fragment_context;
  wire                readLogic_resized_rsp_valid;
  wire                readLogic_resized_rsp_ready;
  wire                readLogic_resized_rsp_payload_last;
  wire       [0:0]    readLogic_resized_rsp_payload_fragment_source;
  wire       [0:0]    readLogic_resized_rsp_payload_fragment_opcode;
  wire       [63:0]   readLogic_resized_rsp_payload_fragment_data;
  wire       [17:0]   readLogic_resized_rsp_payload_fragment_context;
  wire                interconnect_read_aggregated_cmd_halfPipe_valid;
  wire                interconnect_read_aggregated_cmd_halfPipe_ready;
  wire                interconnect_read_aggregated_cmd_halfPipe_payload_last;
  wire       [0:0]    interconnect_read_aggregated_cmd_halfPipe_payload_fragment_source;
  wire       [0:0]    interconnect_read_aggregated_cmd_halfPipe_payload_fragment_opcode;
  wire       [31:0]   interconnect_read_aggregated_cmd_halfPipe_payload_fragment_address;
  wire       [10:0]   interconnect_read_aggregated_cmd_halfPipe_payload_fragment_length;
  wire       [17:0]   interconnect_read_aggregated_cmd_halfPipe_payload_fragment_context;
  reg                 interconnect_read_aggregated_cmd_halfPipe_regs_valid;
  reg                 interconnect_read_aggregated_cmd_halfPipe_regs_ready;
  reg                 interconnect_read_aggregated_cmd_halfPipe_regs_payload_last;
  reg        [0:0]    interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_source;
  reg        [0:0]    interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_opcode;
  reg        [31:0]   interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_address;
  reg        [10:0]   interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_length;
  reg        [17:0]   interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_context;
  wire                readLogic_adapter_ar_valid;
  wire                readLogic_adapter_ar_ready;
  wire       [31:0]   readLogic_adapter_ar_payload_addr;
  wire       [3:0]    readLogic_adapter_ar_payload_region;
  wire       [7:0]    readLogic_adapter_ar_payload_len;
  wire       [2:0]    readLogic_adapter_ar_payload_size;
  wire       [1:0]    readLogic_adapter_ar_payload_burst;
  wire       [0:0]    readLogic_adapter_ar_payload_lock;
  wire       [3:0]    readLogic_adapter_ar_payload_cache;
  wire       [3:0]    readLogic_adapter_ar_payload_qos;
  wire       [2:0]    readLogic_adapter_ar_payload_prot;
  wire                readLogic_adapter_r_valid;
  wire                readLogic_adapter_r_ready;
  wire       [63:0]   readLogic_adapter_r_payload_data;
  wire       [1:0]    readLogic_adapter_r_payload_resp;
  wire                readLogic_adapter_r_payload_last;
  wire       [3:0]    _zz_1;
  wire                readLogic_adapter_ar_halfPipe_valid;
  wire                readLogic_adapter_ar_halfPipe_ready;
  wire       [31:0]   readLogic_adapter_ar_halfPipe_payload_addr;
  wire       [3:0]    readLogic_adapter_ar_halfPipe_payload_region;
  wire       [7:0]    readLogic_adapter_ar_halfPipe_payload_len;
  wire       [2:0]    readLogic_adapter_ar_halfPipe_payload_size;
  wire       [1:0]    readLogic_adapter_ar_halfPipe_payload_burst;
  wire       [0:0]    readLogic_adapter_ar_halfPipe_payload_lock;
  wire       [3:0]    readLogic_adapter_ar_halfPipe_payload_cache;
  wire       [3:0]    readLogic_adapter_ar_halfPipe_payload_qos;
  wire       [2:0]    readLogic_adapter_ar_halfPipe_payload_prot;
  reg                 readLogic_adapter_ar_halfPipe_regs_valid;
  reg                 readLogic_adapter_ar_halfPipe_regs_ready;
  reg        [31:0]   readLogic_adapter_ar_halfPipe_regs_payload_addr;
  reg        [3:0]    readLogic_adapter_ar_halfPipe_regs_payload_region;
  reg        [7:0]    readLogic_adapter_ar_halfPipe_regs_payload_len;
  reg        [2:0]    readLogic_adapter_ar_halfPipe_regs_payload_size;
  reg        [1:0]    readLogic_adapter_ar_halfPipe_regs_payload_burst;
  reg        [0:0]    readLogic_adapter_ar_halfPipe_regs_payload_lock;
  reg        [3:0]    readLogic_adapter_ar_halfPipe_regs_payload_cache;
  reg        [3:0]    readLogic_adapter_ar_halfPipe_regs_payload_qos;
  reg        [2:0]    readLogic_adapter_ar_halfPipe_regs_payload_prot;
  wire                read_r_s2mPipe_valid;
  wire                read_r_s2mPipe_ready;
  wire       [63:0]   read_r_s2mPipe_payload_data;
  wire       [1:0]    read_r_s2mPipe_payload_resp;
  wire                read_r_s2mPipe_payload_last;
  reg                 read_r_s2mPipe_rValid;
  reg        [63:0]   read_r_s2mPipe_rData_data;
  reg        [1:0]    read_r_s2mPipe_rData_resp;
  reg                 read_r_s2mPipe_rData_last;
  wire                readLogic_beforeQueue_valid;
  wire                readLogic_beforeQueue_ready;
  wire       [63:0]   readLogic_beforeQueue_payload_data;
  wire       [1:0]    readLogic_beforeQueue_payload_resp;
  wire                readLogic_beforeQueue_payload_last;
  reg                 read_r_s2mPipe_m2sPipe_rValid;
  reg        [63:0]   read_r_s2mPipe_m2sPipe_rData_data;
  reg        [1:0]    read_r_s2mPipe_m2sPipe_rData_resp;
  reg                 read_r_s2mPipe_m2sPipe_rData_last;
  wire                writeLogic_resized_cmd_valid;
  wire                writeLogic_resized_cmd_ready;
  wire                writeLogic_resized_cmd_payload_last;
  wire       [0:0]    writeLogic_resized_cmd_payload_fragment_source;
  wire       [0:0]    writeLogic_resized_cmd_payload_fragment_opcode;
  wire       [31:0]   writeLogic_resized_cmd_payload_fragment_address;
  wire       [10:0]   writeLogic_resized_cmd_payload_fragment_length;
  wire       [63:0]   writeLogic_resized_cmd_payload_fragment_data;
  wire       [7:0]    writeLogic_resized_cmd_payload_fragment_mask;
  wire       [11:0]   writeLogic_resized_cmd_payload_fragment_context;
  wire                writeLogic_resized_rsp_valid;
  wire                writeLogic_resized_rsp_ready;
  wire                writeLogic_resized_rsp_payload_last;
  wire       [0:0]    writeLogic_resized_rsp_payload_fragment_source;
  wire       [0:0]    writeLogic_resized_rsp_payload_fragment_opcode;
  wire       [11:0]   writeLogic_resized_rsp_payload_fragment_context;
  wire                interconnect_write_aggregated_cmd_m2sPipe_valid;
  wire                interconnect_write_aggregated_cmd_m2sPipe_ready;
  wire                interconnect_write_aggregated_cmd_m2sPipe_payload_last;
  wire       [0:0]    interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_source;
  wire       [0:0]    interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_address;
  wire       [10:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_length;
  wire       [63:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_data;
  wire       [7:0]    interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_mask;
  wire       [11:0]   interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_context;
  reg                 interconnect_write_aggregated_cmd_m2sPipe_rValid;
  reg                 interconnect_write_aggregated_cmd_m2sPipe_rData_last;
  reg        [0:0]    interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_source;
  reg        [0:0]    interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_opcode;
  reg        [31:0]   interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_address;
  reg        [10:0]   interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_length;
  reg        [63:0]   interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_data;
  reg        [7:0]    interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_mask;
  reg        [11:0]   interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_context;
  wire                writeLogic_adapter_aw_valid;
  wire                writeLogic_adapter_aw_ready;
  wire       [31:0]   writeLogic_adapter_aw_payload_addr;
  wire       [3:0]    writeLogic_adapter_aw_payload_region;
  wire       [7:0]    writeLogic_adapter_aw_payload_len;
  wire       [2:0]    writeLogic_adapter_aw_payload_size;
  wire       [1:0]    writeLogic_adapter_aw_payload_burst;
  wire       [0:0]    writeLogic_adapter_aw_payload_lock;
  wire       [3:0]    writeLogic_adapter_aw_payload_cache;
  wire       [3:0]    writeLogic_adapter_aw_payload_qos;
  wire       [2:0]    writeLogic_adapter_aw_payload_prot;
  wire                writeLogic_adapter_w_valid;
  wire                writeLogic_adapter_w_ready;
  wire       [63:0]   writeLogic_adapter_w_payload_data;
  wire       [7:0]    writeLogic_adapter_w_payload_strb;
  wire                writeLogic_adapter_w_payload_last;
  wire                writeLogic_adapter_b_valid;
  wire                writeLogic_adapter_b_ready;
  wire       [1:0]    writeLogic_adapter_b_payload_resp;
  wire       [3:0]    _zz_2;
  wire                writeLogic_adapter_aw_halfPipe_valid;
  wire                writeLogic_adapter_aw_halfPipe_ready;
  wire       [31:0]   writeLogic_adapter_aw_halfPipe_payload_addr;
  wire       [3:0]    writeLogic_adapter_aw_halfPipe_payload_region;
  wire       [7:0]    writeLogic_adapter_aw_halfPipe_payload_len;
  wire       [2:0]    writeLogic_adapter_aw_halfPipe_payload_size;
  wire       [1:0]    writeLogic_adapter_aw_halfPipe_payload_burst;
  wire       [0:0]    writeLogic_adapter_aw_halfPipe_payload_lock;
  wire       [3:0]    writeLogic_adapter_aw_halfPipe_payload_cache;
  wire       [3:0]    writeLogic_adapter_aw_halfPipe_payload_qos;
  wire       [2:0]    writeLogic_adapter_aw_halfPipe_payload_prot;
  reg                 writeLogic_adapter_aw_halfPipe_regs_valid;
  reg                 writeLogic_adapter_aw_halfPipe_regs_ready;
  reg        [31:0]   writeLogic_adapter_aw_halfPipe_regs_payload_addr;
  reg        [3:0]    writeLogic_adapter_aw_halfPipe_regs_payload_region;
  reg        [7:0]    writeLogic_adapter_aw_halfPipe_regs_payload_len;
  reg        [2:0]    writeLogic_adapter_aw_halfPipe_regs_payload_size;
  reg        [1:0]    writeLogic_adapter_aw_halfPipe_regs_payload_burst;
  reg        [0:0]    writeLogic_adapter_aw_halfPipe_regs_payload_lock;
  reg        [3:0]    writeLogic_adapter_aw_halfPipe_regs_payload_cache;
  reg        [3:0]    writeLogic_adapter_aw_halfPipe_regs_payload_qos;
  reg        [2:0]    writeLogic_adapter_aw_halfPipe_regs_payload_prot;
  wire                writeLogic_adapter_w_s2mPipe_valid;
  wire                writeLogic_adapter_w_s2mPipe_ready;
  wire       [63:0]   writeLogic_adapter_w_s2mPipe_payload_data;
  wire       [7:0]    writeLogic_adapter_w_s2mPipe_payload_strb;
  wire                writeLogic_adapter_w_s2mPipe_payload_last;
  reg                 writeLogic_adapter_w_s2mPipe_rValid;
  reg        [63:0]   writeLogic_adapter_w_s2mPipe_rData_data;
  reg        [7:0]    writeLogic_adapter_w_s2mPipe_rData_strb;
  reg                 writeLogic_adapter_w_s2mPipe_rData_last;
  wire                writeLogic_adapter_w_s2mPipe_m2sPipe_valid;
  wire                writeLogic_adapter_w_s2mPipe_m2sPipe_ready;
  wire       [63:0]   writeLogic_adapter_w_s2mPipe_m2sPipe_payload_data;
  wire       [7:0]    writeLogic_adapter_w_s2mPipe_m2sPipe_payload_strb;
  wire                writeLogic_adapter_w_s2mPipe_m2sPipe_payload_last;
  reg                 writeLogic_adapter_w_s2mPipe_m2sPipe_rValid;
  reg        [63:0]   writeLogic_adapter_w_s2mPipe_m2sPipe_rData_data;
  reg        [7:0]    writeLogic_adapter_w_s2mPipe_m2sPipe_rData_strb;
  reg                 writeLogic_adapter_w_s2mPipe_m2sPipe_rData_last;
  wire                write_b_halfPipe_valid;
  wire                write_b_halfPipe_ready;
  wire       [1:0]    write_b_halfPipe_payload_resp;
  reg                 write_b_halfPipe_regs_valid;
  reg                 write_b_halfPipe_regs_ready;
  reg        [1:0]    write_b_halfPipe_regs_payload_resp;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_valid;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready;
  wire       [31:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_data;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_mask;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_sink;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_last;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid;
  reg        [31:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_data;
  reg        [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_mask;
  reg        [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_sink;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_last;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready;
  wire       [31:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask;
  wire       [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink;
  wire                inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rValid;
  reg        [31:0]   inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_mask;
  reg        [3:0]    inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_sink;
  reg                 inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_last;
  wire                core_io_outputs_0_s2mPipe_valid;
  wire                core_io_outputs_0_s2mPipe_ready;
  wire       [31:0]   core_io_outputs_0_s2mPipe_payload_data;
  wire       [3:0]    core_io_outputs_0_s2mPipe_payload_mask;
  wire       [3:0]    core_io_outputs_0_s2mPipe_payload_sink;
  wire                core_io_outputs_0_s2mPipe_payload_last;
  reg                 core_io_outputs_0_s2mPipe_rValid;
  reg        [31:0]   core_io_outputs_0_s2mPipe_rData_data;
  reg        [3:0]    core_io_outputs_0_s2mPipe_rData_mask;
  reg        [3:0]    core_io_outputs_0_s2mPipe_rData_sink;
  reg                 core_io_outputs_0_s2mPipe_rData_last;
  wire                outputsAdapter_0_ptr_valid;
  wire                outputsAdapter_0_ptr_ready;
  wire       [31:0]   outputsAdapter_0_ptr_payload_data;
  wire       [3:0]    outputsAdapter_0_ptr_payload_mask;
  wire       [3:0]    outputsAdapter_0_ptr_payload_sink;
  wire                outputsAdapter_0_ptr_payload_last;
  reg                 core_io_outputs_0_s2mPipe_m2sPipe_rValid;
  reg        [31:0]   core_io_outputs_0_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    core_io_outputs_0_s2mPipe_m2sPipe_rData_mask;
  reg        [3:0]    core_io_outputs_0_s2mPipe_m2sPipe_rData_sink;
  reg                 core_io_outputs_0_s2mPipe_m2sPipe_rData_last;

  assign _zz_6 = (_zz_3 && (! core_io_write_cmd_s2mPipe_ready));
  assign _zz_7 = (! interconnect_read_aggregated_cmd_halfPipe_regs_valid);
  assign _zz_8 = (! readLogic_adapter_ar_halfPipe_regs_valid);
  assign _zz_9 = (read_rready && (! read_r_s2mPipe_ready));
  assign _zz_10 = (! writeLogic_adapter_aw_halfPipe_regs_valid);
  assign _zz_11 = (writeLogic_adapter_w_ready && (! writeLogic_adapter_w_s2mPipe_ready));
  assign _zz_12 = (! write_b_halfPipe_regs_valid);
  assign _zz_13 = (_zz_5 && (! inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready));
  assign _zz_14 = (_zz_4 && (! core_io_outputs_0_s2mPipe_ready));
  EfxDMA_Core core (
    .io_sgRead_cmd_valid                        (core_io_sgRead_cmd_valid                                                              ), //o
    .io_sgRead_cmd_ready                        (interconnect_read_aggregated_arbiter_io_inputs_0_cmd_ready                            ), //i
    .io_sgRead_cmd_payload_last                 (core_io_sgRead_cmd_payload_last                                                       ), //o
    .io_sgRead_cmd_payload_fragment_opcode      (core_io_sgRead_cmd_payload_fragment_opcode                                            ), //o
    .io_sgRead_cmd_payload_fragment_address     (core_io_sgRead_cmd_payload_fragment_address[31:0]                                     ), //o
    .io_sgRead_cmd_payload_fragment_length      (core_io_sgRead_cmd_payload_fragment_length[4:0]                                       ), //o
    .io_sgRead_cmd_payload_fragment_context     (core_io_sgRead_cmd_payload_fragment_context                                           ), //o
    .io_sgRead_rsp_valid                        (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_valid                            ), //i
    .io_sgRead_rsp_ready                        (core_io_sgRead_rsp_ready                                                              ), //o
    .io_sgRead_rsp_payload_last                 (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_last                     ), //i
    .io_sgRead_rsp_payload_fragment_opcode      (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_opcode          ), //i
    .io_sgRead_rsp_payload_fragment_data        (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_data[63:0]      ), //i
    .io_sgRead_rsp_payload_fragment_context     (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_context         ), //i
    .io_sgWrite_cmd_valid                       (core_io_sgWrite_cmd_valid                                                             ), //o
    .io_sgWrite_cmd_ready                       (interconnect_write_aggregated_arbiter_io_inputs_0_cmd_ready                           ), //i
    .io_sgWrite_cmd_payload_last                (core_io_sgWrite_cmd_payload_last                                                      ), //o
    .io_sgWrite_cmd_payload_fragment_opcode     (core_io_sgWrite_cmd_payload_fragment_opcode                                           ), //o
    .io_sgWrite_cmd_payload_fragment_address    (core_io_sgWrite_cmd_payload_fragment_address[31:0]                                    ), //o
    .io_sgWrite_cmd_payload_fragment_length     (core_io_sgWrite_cmd_payload_fragment_length[1:0]                                      ), //o
    .io_sgWrite_cmd_payload_fragment_data       (core_io_sgWrite_cmd_payload_fragment_data[63:0]                                       ), //o
    .io_sgWrite_cmd_payload_fragment_mask       (core_io_sgWrite_cmd_payload_fragment_mask[7:0]                                        ), //o
    .io_sgWrite_cmd_payload_fragment_context    (core_io_sgWrite_cmd_payload_fragment_context                                          ), //o
    .io_sgWrite_rsp_valid                       (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_valid                           ), //i
    .io_sgWrite_rsp_ready                       (core_io_sgWrite_rsp_ready                                                             ), //o
    .io_sgWrite_rsp_payload_last                (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_last                    ), //i
    .io_sgWrite_rsp_payload_fragment_opcode     (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_opcode         ), //i
    .io_sgWrite_rsp_payload_fragment_context    (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_context        ), //i
    .io_read_cmd_valid                          (core_io_read_cmd_valid                                                                ), //o
    .io_read_cmd_ready                          (interconnect_read_aggregated_arbiter_io_inputs_1_cmd_ready                            ), //i
    .io_read_cmd_payload_last                   (core_io_read_cmd_payload_last                                                         ), //o
    .io_read_cmd_payload_fragment_opcode        (core_io_read_cmd_payload_fragment_opcode                                              ), //o
    .io_read_cmd_payload_fragment_address       (core_io_read_cmd_payload_fragment_address[31:0]                                       ), //o
    .io_read_cmd_payload_fragment_length        (core_io_read_cmd_payload_fragment_length[10:0]                                        ), //o
    .io_read_cmd_payload_fragment_context       (core_io_read_cmd_payload_fragment_context[17:0]                                       ), //o
    .io_read_rsp_valid                          (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_valid                            ), //i
    .io_read_rsp_ready                          (core_io_read_rsp_ready                                                                ), //o
    .io_read_rsp_payload_last                   (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_last                     ), //i
    .io_read_rsp_payload_fragment_opcode        (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_opcode          ), //i
    .io_read_rsp_payload_fragment_data          (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_data[63:0]      ), //i
    .io_read_rsp_payload_fragment_context       (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_context[17:0]   ), //i
    .io_write_cmd_valid                         (core_io_write_cmd_valid                                                               ), //o
    .io_write_cmd_ready                         (_zz_3                                                                                 ), //i
    .io_write_cmd_payload_last                  (core_io_write_cmd_payload_last                                                        ), //o
    .io_write_cmd_payload_fragment_opcode       (core_io_write_cmd_payload_fragment_opcode                                             ), //o
    .io_write_cmd_payload_fragment_address      (core_io_write_cmd_payload_fragment_address[31:0]                                      ), //o
    .io_write_cmd_payload_fragment_length       (core_io_write_cmd_payload_fragment_length[10:0]                                       ), //o
    .io_write_cmd_payload_fragment_data         (core_io_write_cmd_payload_fragment_data[63:0]                                         ), //o
    .io_write_cmd_payload_fragment_mask         (core_io_write_cmd_payload_fragment_mask[7:0]                                          ), //o
    .io_write_cmd_payload_fragment_context      (core_io_write_cmd_payload_fragment_context[11:0]                                      ), //o
    .io_write_rsp_valid                         (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_valid                           ), //i
    .io_write_rsp_ready                         (core_io_write_rsp_ready                                                               ), //o
    .io_write_rsp_payload_last                  (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_last                    ), //i
    .io_write_rsp_payload_fragment_opcode       (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_opcode         ), //i
    .io_write_rsp_payload_fragment_context      (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_context[11:0]  ), //i
    .io_outputs_0_valid                         (core_io_outputs_0_valid                                                               ), //o
    .io_outputs_0_ready                         (_zz_4                                                                                 ), //i
    .io_outputs_0_payload_data                  (core_io_outputs_0_payload_data[31:0]                                                  ), //o
    .io_outputs_0_payload_mask                  (core_io_outputs_0_payload_mask[3:0]                                                   ), //o
    .io_outputs_0_payload_sink                  (core_io_outputs_0_payload_sink[3:0]                                                   ), //o
    .io_outputs_0_payload_last                  (core_io_outputs_0_payload_last                                                        ), //o
    .io_inputs_0_valid                          (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid                          ), //i
    .io_inputs_0_ready                          (core_io_inputs_0_ready                                                                ), //o
    .io_inputs_0_payload_data                   (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data[31:0]             ), //i
    .io_inputs_0_payload_mask                   (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask[3:0]              ), //i
    .io_inputs_0_payload_sink                   (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink[3:0]              ), //i
    .io_inputs_0_payload_last                   (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last                   ), //i
    .io_interrupts                              (core_io_interrupts[1:0]                                                               ), //o
    .io_ctrl_PADDR                              (ctrl_PADDR[13:0]                                                                      ), //i
    .io_ctrl_PSEL                               (ctrl_PSEL                                                                             ), //i
    .io_ctrl_PENABLE                            (ctrl_PENABLE                                                                          ), //i
    .io_ctrl_PREADY                             (core_io_ctrl_PREADY                                                                   ), //o
    .io_ctrl_PWRITE                             (ctrl_PWRITE                                                                           ), //i
    .io_ctrl_PWDATA                             (ctrl_PWDATA[31:0]                                                                     ), //i
    .io_ctrl_PRDATA                             (core_io_ctrl_PRDATA[31:0]                                                             ), //o
    .io_ctrl_PSLVERROR                          (core_io_ctrl_PSLVERROR                                                                ), //o
    .clk                                        (clk                                                                                   ), //i
    .reset                                      (reset                                                                                 )  //i
  );
  EfxDMA_BmbArbiter interconnect_read_aggregated_arbiter (
    .io_inputs_0_cmd_valid                       (core_io_sgRead_cmd_valid                                                             ), //i
    .io_inputs_0_cmd_ready                       (interconnect_read_aggregated_arbiter_io_inputs_0_cmd_ready                           ), //o
    .io_inputs_0_cmd_payload_last                (core_io_sgRead_cmd_payload_last                                                      ), //i
    .io_inputs_0_cmd_payload_fragment_opcode     (core_io_sgRead_cmd_payload_fragment_opcode                                           ), //i
    .io_inputs_0_cmd_payload_fragment_address    (core_io_sgRead_cmd_payload_fragment_address[31:0]                                    ), //i
    .io_inputs_0_cmd_payload_fragment_length     (core_io_sgRead_cmd_payload_fragment_length[4:0]                                      ), //i
    .io_inputs_0_cmd_payload_fragment_context    (core_io_sgRead_cmd_payload_fragment_context                                          ), //i
    .io_inputs_0_rsp_valid                       (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_valid                           ), //o
    .io_inputs_0_rsp_ready                       (core_io_sgRead_rsp_ready                                                             ), //i
    .io_inputs_0_rsp_payload_last                (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_last                    ), //o
    .io_inputs_0_rsp_payload_fragment_opcode     (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_opcode         ), //o
    .io_inputs_0_rsp_payload_fragment_data       (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_data[63:0]     ), //o
    .io_inputs_0_rsp_payload_fragment_context    (interconnect_read_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_context        ), //o
    .io_inputs_1_cmd_valid                       (core_io_read_cmd_valid                                                               ), //i
    .io_inputs_1_cmd_ready                       (interconnect_read_aggregated_arbiter_io_inputs_1_cmd_ready                           ), //o
    .io_inputs_1_cmd_payload_last                (core_io_read_cmd_payload_last                                                        ), //i
    .io_inputs_1_cmd_payload_fragment_opcode     (core_io_read_cmd_payload_fragment_opcode                                             ), //i
    .io_inputs_1_cmd_payload_fragment_address    (core_io_read_cmd_payload_fragment_address[31:0]                                      ), //i
    .io_inputs_1_cmd_payload_fragment_length     (core_io_read_cmd_payload_fragment_length[10:0]                                       ), //i
    .io_inputs_1_cmd_payload_fragment_context    (core_io_read_cmd_payload_fragment_context[17:0]                                      ), //i
    .io_inputs_1_rsp_valid                       (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_valid                           ), //o
    .io_inputs_1_rsp_ready                       (core_io_read_rsp_ready                                                               ), //i
    .io_inputs_1_rsp_payload_last                (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_last                    ), //o
    .io_inputs_1_rsp_payload_fragment_opcode     (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_opcode         ), //o
    .io_inputs_1_rsp_payload_fragment_data       (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_data[63:0]     ), //o
    .io_inputs_1_rsp_payload_fragment_context    (interconnect_read_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_context[17:0]  ), //o
    .io_output_cmd_valid                         (interconnect_read_aggregated_arbiter_io_output_cmd_valid                             ), //o
    .io_output_cmd_ready                         (interconnect_read_aggregated_cmd_ready                                               ), //i
    .io_output_cmd_payload_last                  (interconnect_read_aggregated_arbiter_io_output_cmd_payload_last                      ), //o
    .io_output_cmd_payload_fragment_source       (interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_source           ), //o
    .io_output_cmd_payload_fragment_opcode       (interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_opcode           ), //o
    .io_output_cmd_payload_fragment_address      (interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_address[31:0]    ), //o
    .io_output_cmd_payload_fragment_length       (interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_length[10:0]     ), //o
    .io_output_cmd_payload_fragment_context      (interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_context[17:0]    ), //o
    .io_output_rsp_valid                         (interconnect_read_aggregated_rsp_valid                                               ), //i
    .io_output_rsp_ready                         (interconnect_read_aggregated_arbiter_io_output_rsp_ready                             ), //o
    .io_output_rsp_payload_last                  (interconnect_read_aggregated_rsp_payload_last                                        ), //i
    .io_output_rsp_payload_fragment_source       (interconnect_read_aggregated_rsp_payload_fragment_source                             ), //i
    .io_output_rsp_payload_fragment_opcode       (interconnect_read_aggregated_rsp_payload_fragment_opcode                             ), //i
    .io_output_rsp_payload_fragment_data         (interconnect_read_aggregated_rsp_payload_fragment_data[63:0]                         ), //i
    .io_output_rsp_payload_fragment_context      (interconnect_read_aggregated_rsp_payload_fragment_context[17:0]                      ), //i
    .clk                                         (clk                                                                                  ), //i
    .reset                                       (reset                                                                                )  //i
  );
  EfxDMA_BmbArbiter_1 interconnect_write_aggregated_arbiter (
    .io_inputs_0_cmd_valid                       (core_io_sgWrite_cmd_valid                                                             ), //i
    .io_inputs_0_cmd_ready                       (interconnect_write_aggregated_arbiter_io_inputs_0_cmd_ready                           ), //o
    .io_inputs_0_cmd_payload_last                (core_io_sgWrite_cmd_payload_last                                                      ), //i
    .io_inputs_0_cmd_payload_fragment_opcode     (core_io_sgWrite_cmd_payload_fragment_opcode                                           ), //i
    .io_inputs_0_cmd_payload_fragment_address    (core_io_sgWrite_cmd_payload_fragment_address[31:0]                                    ), //i
    .io_inputs_0_cmd_payload_fragment_length     (core_io_sgWrite_cmd_payload_fragment_length[1:0]                                      ), //i
    .io_inputs_0_cmd_payload_fragment_data       (core_io_sgWrite_cmd_payload_fragment_data[63:0]                                       ), //i
    .io_inputs_0_cmd_payload_fragment_mask       (core_io_sgWrite_cmd_payload_fragment_mask[7:0]                                        ), //i
    .io_inputs_0_cmd_payload_fragment_context    (core_io_sgWrite_cmd_payload_fragment_context                                          ), //i
    .io_inputs_0_rsp_valid                       (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_valid                           ), //o
    .io_inputs_0_rsp_ready                       (core_io_sgWrite_rsp_ready                                                             ), //i
    .io_inputs_0_rsp_payload_last                (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_last                    ), //o
    .io_inputs_0_rsp_payload_fragment_opcode     (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_opcode         ), //o
    .io_inputs_0_rsp_payload_fragment_context    (interconnect_write_aggregated_arbiter_io_inputs_0_rsp_payload_fragment_context        ), //o
    .io_inputs_1_cmd_valid                       (core_io_write_cmd_s2mPipe_m2sPipe_valid                                               ), //i
    .io_inputs_1_cmd_ready                       (interconnect_write_aggregated_arbiter_io_inputs_1_cmd_ready                           ), //o
    .io_inputs_1_cmd_payload_last                (core_io_write_cmd_s2mPipe_m2sPipe_payload_last                                        ), //i
    .io_inputs_1_cmd_payload_fragment_opcode     (core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_opcode                             ), //i
    .io_inputs_1_cmd_payload_fragment_address    (core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_address[31:0]                      ), //i
    .io_inputs_1_cmd_payload_fragment_length     (core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_length[10:0]                       ), //i
    .io_inputs_1_cmd_payload_fragment_data       (core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_data[63:0]                         ), //i
    .io_inputs_1_cmd_payload_fragment_mask       (core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_mask[7:0]                          ), //i
    .io_inputs_1_cmd_payload_fragment_context    (core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_context[11:0]                      ), //i
    .io_inputs_1_rsp_valid                       (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_valid                           ), //o
    .io_inputs_1_rsp_ready                       (core_io_write_rsp_ready                                                               ), //i
    .io_inputs_1_rsp_payload_last                (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_last                    ), //o
    .io_inputs_1_rsp_payload_fragment_opcode     (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_opcode         ), //o
    .io_inputs_1_rsp_payload_fragment_context    (interconnect_write_aggregated_arbiter_io_inputs_1_rsp_payload_fragment_context[11:0]  ), //o
    .io_output_cmd_valid                         (interconnect_write_aggregated_arbiter_io_output_cmd_valid                             ), //o
    .io_output_cmd_ready                         (interconnect_write_aggregated_cmd_ready                                               ), //i
    .io_output_cmd_payload_last                  (interconnect_write_aggregated_arbiter_io_output_cmd_payload_last                      ), //o
    .io_output_cmd_payload_fragment_source       (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_source           ), //o
    .io_output_cmd_payload_fragment_opcode       (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_opcode           ), //o
    .io_output_cmd_payload_fragment_address      (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_address[31:0]    ), //o
    .io_output_cmd_payload_fragment_length       (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_length[10:0]     ), //o
    .io_output_cmd_payload_fragment_data         (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_data[63:0]       ), //o
    .io_output_cmd_payload_fragment_mask         (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_mask[7:0]        ), //o
    .io_output_cmd_payload_fragment_context      (interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_context[11:0]    ), //o
    .io_output_rsp_valid                         (interconnect_write_aggregated_rsp_valid                                               ), //i
    .io_output_rsp_ready                         (interconnect_write_aggregated_arbiter_io_output_rsp_ready                             ), //o
    .io_output_rsp_payload_last                  (interconnect_write_aggregated_rsp_payload_last                                        ), //i
    .io_output_rsp_payload_fragment_source       (interconnect_write_aggregated_rsp_payload_fragment_source                             ), //i
    .io_output_rsp_payload_fragment_opcode       (interconnect_write_aggregated_rsp_payload_fragment_opcode                             ), //i
    .io_output_rsp_payload_fragment_context      (interconnect_write_aggregated_rsp_payload_fragment_context[11:0]                      ), //i
    .clk                                         (clk                                                                                   ), //i
    .reset                                       (reset                                                                                 )  //i
  );
  EfxDMA_BmbSourceRemover readLogic_sourceRemover (
    .io_input_cmd_valid                        (readLogic_resized_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (readLogic_sourceRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (readLogic_resized_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_source      (readLogic_resized_cmd_payload_fragment_source                         ), //i
    .io_input_cmd_payload_fragment_opcode      (readLogic_resized_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (readLogic_resized_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (readLogic_resized_cmd_payload_fragment_length[10:0]                   ), //i
    .io_input_cmd_payload_fragment_context     (readLogic_resized_cmd_payload_fragment_context[17:0]                  ), //i
    .io_input_rsp_valid                        (readLogic_sourceRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (readLogic_resized_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (readLogic_sourceRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_source      (readLogic_sourceRemover_io_input_rsp_payload_fragment_source          ), //o
    .io_input_rsp_payload_fragment_opcode      (readLogic_sourceRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_data        (readLogic_sourceRemover_io_input_rsp_payload_fragment_data[63:0]      ), //o
    .io_input_rsp_payload_fragment_context     (readLogic_sourceRemover_io_input_rsp_payload_fragment_context[17:0]   ), //o
    .io_output_cmd_valid                       (readLogic_sourceRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (readLogic_bridge_io_input_cmd_ready                                   ), //i
    .io_output_cmd_payload_last                (readLogic_sourceRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (readLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (readLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (readLogic_sourceRemover_io_output_cmd_payload_fragment_length[10:0]   ), //o
    .io_output_cmd_payload_fragment_context    (readLogic_sourceRemover_io_output_cmd_payload_fragment_context[18:0]  ), //o
    .io_output_rsp_valid                       (readLogic_bridge_io_input_rsp_valid                                   ), //i
    .io_output_rsp_ready                       (readLogic_sourceRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (readLogic_bridge_io_input_rsp_payload_last                            ), //i
    .io_output_rsp_payload_fragment_opcode     (readLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //i
    .io_output_rsp_payload_fragment_data       (readLogic_bridge_io_input_rsp_payload_fragment_data[63:0]             ), //i
    .io_output_rsp_payload_fragment_context    (readLogic_bridge_io_input_rsp_payload_fragment_context[18:0]          )  //i
  );
  EfxDMA_BmbToAxi4ReadOnlyBridge readLogic_bridge (
    .io_input_cmd_valid                       (readLogic_sourceRemover_io_output_cmd_valid                           ), //i
    .io_input_cmd_ready                       (readLogic_bridge_io_input_cmd_ready                                   ), //o
    .io_input_cmd_payload_last                (readLogic_sourceRemover_io_output_cmd_payload_last                    ), //i
    .io_input_cmd_payload_fragment_opcode     (readLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //i
    .io_input_cmd_payload_fragment_address    (readLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //i
    .io_input_cmd_payload_fragment_length     (readLogic_sourceRemover_io_output_cmd_payload_fragment_length[10:0]   ), //i
    .io_input_cmd_payload_fragment_context    (readLogic_sourceRemover_io_output_cmd_payload_fragment_context[18:0]  ), //i
    .io_input_rsp_valid                       (readLogic_bridge_io_input_rsp_valid                                   ), //o
    .io_input_rsp_ready                       (readLogic_sourceRemover_io_output_rsp_ready                           ), //i
    .io_input_rsp_payload_last                (readLogic_bridge_io_input_rsp_payload_last                            ), //o
    .io_input_rsp_payload_fragment_opcode     (readLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //o
    .io_input_rsp_payload_fragment_data       (readLogic_bridge_io_input_rsp_payload_fragment_data[63:0]             ), //o
    .io_input_rsp_payload_fragment_context    (readLogic_bridge_io_input_rsp_payload_fragment_context[18:0]          ), //o
    .io_output_ar_valid                       (readLogic_bridge_io_output_ar_valid                                   ), //o
    .io_output_ar_ready                       (readLogic_adapter_ar_ready                                            ), //i
    .io_output_ar_payload_addr                (readLogic_bridge_io_output_ar_payload_addr[31:0]                      ), //o
    .io_output_ar_payload_len                 (readLogic_bridge_io_output_ar_payload_len[7:0]                        ), //o
    .io_output_ar_payload_size                (readLogic_bridge_io_output_ar_payload_size[2:0]                       ), //o
    .io_output_ar_payload_cache               (readLogic_bridge_io_output_ar_payload_cache[3:0]                      ), //o
    .io_output_ar_payload_prot                (readLogic_bridge_io_output_ar_payload_prot[2:0]                       ), //o
    .io_output_r_valid                        (readLogic_adapter_r_valid                                             ), //i
    .io_output_r_ready                        (readLogic_bridge_io_output_r_ready                                    ), //o
    .io_output_r_payload_data                 (readLogic_adapter_r_payload_data[63:0]                                ), //i
    .io_output_r_payload_resp                 (readLogic_adapter_r_payload_resp[1:0]                                 ), //i
    .io_output_r_payload_last                 (readLogic_adapter_r_payload_last                                      ), //i
    .clk                                      (clk                                                                   ), //i
    .reset                                    (reset                                                                 )  //i
  );
  EfxDMA_BmbSourceRemover_1 writeLogic_sourceRemover (
    .io_input_cmd_valid                        (writeLogic_resized_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (writeLogic_sourceRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (writeLogic_resized_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_source      (writeLogic_resized_cmd_payload_fragment_source                         ), //i
    .io_input_cmd_payload_fragment_opcode      (writeLogic_resized_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (writeLogic_resized_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (writeLogic_resized_cmd_payload_fragment_length[10:0]                   ), //i
    .io_input_cmd_payload_fragment_data        (writeLogic_resized_cmd_payload_fragment_data[63:0]                     ), //i
    .io_input_cmd_payload_fragment_mask        (writeLogic_resized_cmd_payload_fragment_mask[7:0]                      ), //i
    .io_input_cmd_payload_fragment_context     (writeLogic_resized_cmd_payload_fragment_context[11:0]                  ), //i
    .io_input_rsp_valid                        (writeLogic_sourceRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (writeLogic_resized_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (writeLogic_sourceRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_source      (writeLogic_sourceRemover_io_input_rsp_payload_fragment_source          ), //o
    .io_input_rsp_payload_fragment_opcode      (writeLogic_sourceRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_context     (writeLogic_sourceRemover_io_input_rsp_payload_fragment_context[11:0]   ), //o
    .io_output_cmd_valid                       (writeLogic_sourceRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (writeLogic_bridge_io_input_cmd_ready                                   ), //i
    .io_output_cmd_payload_last                (writeLogic_sourceRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (writeLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_length[10:0]   ), //o
    .io_output_cmd_payload_fragment_data       (writeLogic_sourceRemover_io_output_cmd_payload_fragment_data[63:0]     ), //o
    .io_output_cmd_payload_fragment_mask       (writeLogic_sourceRemover_io_output_cmd_payload_fragment_mask[7:0]      ), //o
    .io_output_cmd_payload_fragment_context    (writeLogic_sourceRemover_io_output_cmd_payload_fragment_context[12:0]  ), //o
    .io_output_rsp_valid                       (writeLogic_bridge_io_input_rsp_valid                                   ), //i
    .io_output_rsp_ready                       (writeLogic_sourceRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (writeLogic_bridge_io_input_rsp_payload_last                            ), //i
    .io_output_rsp_payload_fragment_opcode     (writeLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //i
    .io_output_rsp_payload_fragment_context    (writeLogic_bridge_io_input_rsp_payload_fragment_context[12:0]          )  //i
  );
  EfxDMA_BmbToAxi4WriteOnlyBridge writeLogic_bridge (
    .io_input_cmd_valid                       (writeLogic_sourceRemover_io_output_cmd_valid                           ), //i
    .io_input_cmd_ready                       (writeLogic_bridge_io_input_cmd_ready                                   ), //o
    .io_input_cmd_payload_last                (writeLogic_sourceRemover_io_output_cmd_payload_last                    ), //i
    .io_input_cmd_payload_fragment_opcode     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_opcode         ), //i
    .io_input_cmd_payload_fragment_address    (writeLogic_sourceRemover_io_output_cmd_payload_fragment_address[31:0]  ), //i
    .io_input_cmd_payload_fragment_length     (writeLogic_sourceRemover_io_output_cmd_payload_fragment_length[10:0]   ), //i
    .io_input_cmd_payload_fragment_data       (writeLogic_sourceRemover_io_output_cmd_payload_fragment_data[63:0]     ), //i
    .io_input_cmd_payload_fragment_mask       (writeLogic_sourceRemover_io_output_cmd_payload_fragment_mask[7:0]      ), //i
    .io_input_cmd_payload_fragment_context    (writeLogic_sourceRemover_io_output_cmd_payload_fragment_context[12:0]  ), //i
    .io_input_rsp_valid                       (writeLogic_bridge_io_input_rsp_valid                                   ), //o
    .io_input_rsp_ready                       (writeLogic_sourceRemover_io_output_rsp_ready                           ), //i
    .io_input_rsp_payload_last                (writeLogic_bridge_io_input_rsp_payload_last                            ), //o
    .io_input_rsp_payload_fragment_opcode     (writeLogic_bridge_io_input_rsp_payload_fragment_opcode                 ), //o
    .io_input_rsp_payload_fragment_context    (writeLogic_bridge_io_input_rsp_payload_fragment_context[12:0]          ), //o
    .io_output_aw_valid                       (writeLogic_bridge_io_output_aw_valid                                   ), //o
    .io_output_aw_ready                       (writeLogic_adapter_aw_ready                                            ), //i
    .io_output_aw_payload_addr                (writeLogic_bridge_io_output_aw_payload_addr[31:0]                      ), //o
    .io_output_aw_payload_len                 (writeLogic_bridge_io_output_aw_payload_len[7:0]                        ), //o
    .io_output_aw_payload_size                (writeLogic_bridge_io_output_aw_payload_size[2:0]                       ), //o
    .io_output_aw_payload_cache               (writeLogic_bridge_io_output_aw_payload_cache[3:0]                      ), //o
    .io_output_aw_payload_prot                (writeLogic_bridge_io_output_aw_payload_prot[2:0]                       ), //o
    .io_output_w_valid                        (writeLogic_bridge_io_output_w_valid                                    ), //o
    .io_output_w_ready                        (writeLogic_adapter_w_ready                                             ), //i
    .io_output_w_payload_data                 (writeLogic_bridge_io_output_w_payload_data[63:0]                       ), //o
    .io_output_w_payload_strb                 (writeLogic_bridge_io_output_w_payload_strb[7:0]                        ), //o
    .io_output_w_payload_last                 (writeLogic_bridge_io_output_w_payload_last                             ), //o
    .io_output_b_valid                        (writeLogic_adapter_b_valid                                             ), //i
    .io_output_b_ready                        (writeLogic_bridge_io_output_b_ready                                    ), //o
    .io_output_b_payload_resp                 (writeLogic_adapter_b_payload_resp[1:0]                                 ), //i
    .clk                                      (clk                                                                    ), //i
    .reset                                    (reset                                                                  )  //i
  );
  EfxDMA_StreamFifoCC inputsAdapter_0_crossclock_fifo (
    .io_push_valid           (dat1_i_tvalid                                              ), //i
    .io_push_ready           (inputsAdapter_0_crossclock_fifo_io_push_ready              ), //o
    .io_push_payload_data    (dat1_i_tdata[31:0]                                         ), //i
    .io_push_payload_mask    (dat1_i_tkeep[3:0]                                          ), //i
    .io_push_payload_sink    (dat1_i_tdest[3:0]                                          ), //i
    .io_push_payload_last    (dat1_i_tlast                                               ), //i
    .io_pop_valid            (inputsAdapter_0_crossclock_fifo_io_pop_valid               ), //o
    .io_pop_ready            (_zz_5                                                      ), //i
    .io_pop_payload_data     (inputsAdapter_0_crossclock_fifo_io_pop_payload_data[31:0]  ), //o
    .io_pop_payload_mask     (inputsAdapter_0_crossclock_fifo_io_pop_payload_mask[3:0]   ), //o
    .io_pop_payload_sink     (inputsAdapter_0_crossclock_fifo_io_pop_payload_sink[3:0]   ), //o
    .io_pop_payload_last     (inputsAdapter_0_crossclock_fifo_io_pop_payload_last        ), //o
    .io_pushOccupancy        (inputsAdapter_0_crossclock_fifo_io_pushOccupancy[4:0]      ), //o
    .io_popOccupancy         (inputsAdapter_0_crossclock_fifo_io_popOccupancy[4:0]       ), //o
    .dat1_i_clk              (dat1_i_clk                                                 ), //i
    .dat1_i_reset            (dat1_i_reset                                               ), //i
    .clk                     (clk                                                        ), //i
    .reset                   (reset                                                      )  //i
  );
  EfxDMA_StreamFifoCC_1 outputsAdapter_0_crossclock_fifo (
    .io_push_valid           (outputsAdapter_0_ptr_valid                                  ), //i
    .io_push_ready           (outputsAdapter_0_crossclock_fifo_io_push_ready              ), //o
    .io_push_payload_data    (outputsAdapter_0_ptr_payload_data[31:0]                     ), //i
    .io_push_payload_mask    (outputsAdapter_0_ptr_payload_mask[3:0]                      ), //i
    .io_push_payload_sink    (outputsAdapter_0_ptr_payload_sink[3:0]                      ), //i
    .io_push_payload_last    (outputsAdapter_0_ptr_payload_last                           ), //i
    .io_pop_valid            (outputsAdapter_0_crossclock_fifo_io_pop_valid               ), //o
    .io_pop_ready            (dat0_o_tready                                               ), //i
    .io_pop_payload_data     (outputsAdapter_0_crossclock_fifo_io_pop_payload_data[31:0]  ), //o
    .io_pop_payload_mask     (outputsAdapter_0_crossclock_fifo_io_pop_payload_mask[3:0]   ), //o
    .io_pop_payload_sink     (outputsAdapter_0_crossclock_fifo_io_pop_payload_sink[3:0]   ), //o
    .io_pop_payload_last     (outputsAdapter_0_crossclock_fifo_io_pop_payload_last        ), //o
    .io_pushOccupancy        (outputsAdapter_0_crossclock_fifo_io_pushOccupancy[4:0]      ), //o
    .io_popOccupancy         (outputsAdapter_0_crossclock_fifo_io_popOccupancy[4:0]       ), //o
    .clk                     (clk                                                         ), //i
    .reset                   (reset                                                       ), //i
    .dat0_o_clk              (dat0_o_clk                                                  ), //i
    .dat0_o_reset            (dat0_o_reset                                                )  //i
  );
  assign ctrl_PREADY = core_io_ctrl_PREADY;
  assign ctrl_PRDATA = core_io_ctrl_PRDATA;
  assign ctrl_PSLVERROR = core_io_ctrl_PSLVERROR;
  assign ctrl_interrupts = core_io_interrupts;
  assign core_io_write_cmd_s2mPipe_valid = (core_io_write_cmd_valid || core_io_write_cmd_s2mPipe_rValid);
  assign _zz_3 = (! core_io_write_cmd_s2mPipe_rValid);
  assign core_io_write_cmd_s2mPipe_payload_last = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_last : core_io_write_cmd_payload_last);
  assign core_io_write_cmd_s2mPipe_payload_fragment_opcode = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_fragment_opcode : core_io_write_cmd_payload_fragment_opcode);
  assign core_io_write_cmd_s2mPipe_payload_fragment_address = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_fragment_address : core_io_write_cmd_payload_fragment_address);
  assign core_io_write_cmd_s2mPipe_payload_fragment_length = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_fragment_length : core_io_write_cmd_payload_fragment_length);
  assign core_io_write_cmd_s2mPipe_payload_fragment_data = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_fragment_data : core_io_write_cmd_payload_fragment_data);
  assign core_io_write_cmd_s2mPipe_payload_fragment_mask = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_fragment_mask : core_io_write_cmd_payload_fragment_mask);
  assign core_io_write_cmd_s2mPipe_payload_fragment_context = (core_io_write_cmd_s2mPipe_rValid ? core_io_write_cmd_s2mPipe_rData_fragment_context : core_io_write_cmd_payload_fragment_context);
  assign core_io_write_cmd_s2mPipe_ready = ((1'b1 && (! core_io_write_cmd_s2mPipe_m2sPipe_valid)) || core_io_write_cmd_s2mPipe_m2sPipe_ready);
  assign core_io_write_cmd_s2mPipe_m2sPipe_valid = core_io_write_cmd_s2mPipe_m2sPipe_rValid;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_last = core_io_write_cmd_s2mPipe_m2sPipe_rData_last;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_opcode = core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_opcode;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_address = core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_address;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_length = core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_length;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_data = core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_data;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_mask = core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_mask;
  assign core_io_write_cmd_s2mPipe_m2sPipe_payload_fragment_context = core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_context;
  assign core_io_write_cmd_s2mPipe_m2sPipe_ready = interconnect_write_aggregated_arbiter_io_inputs_1_cmd_ready;
  assign interconnect_read_aggregated_cmd_valid = interconnect_read_aggregated_arbiter_io_output_cmd_valid;
  assign interconnect_read_aggregated_rsp_ready = interconnect_read_aggregated_arbiter_io_output_rsp_ready;
  assign interconnect_read_aggregated_cmd_payload_last = interconnect_read_aggregated_arbiter_io_output_cmd_payload_last;
  assign interconnect_read_aggregated_cmd_payload_fragment_source = interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_source;
  assign interconnect_read_aggregated_cmd_payload_fragment_opcode = interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_opcode;
  assign interconnect_read_aggregated_cmd_payload_fragment_address = interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_address;
  assign interconnect_read_aggregated_cmd_payload_fragment_length = interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_length;
  assign interconnect_read_aggregated_cmd_payload_fragment_context = interconnect_read_aggregated_arbiter_io_output_cmd_payload_fragment_context;
  assign interconnect_write_aggregated_cmd_valid = interconnect_write_aggregated_arbiter_io_output_cmd_valid;
  assign interconnect_write_aggregated_rsp_ready = interconnect_write_aggregated_arbiter_io_output_rsp_ready;
  assign interconnect_write_aggregated_cmd_payload_last = interconnect_write_aggregated_arbiter_io_output_cmd_payload_last;
  assign interconnect_write_aggregated_cmd_payload_fragment_source = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_source;
  assign interconnect_write_aggregated_cmd_payload_fragment_opcode = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_opcode;
  assign interconnect_write_aggregated_cmd_payload_fragment_address = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_address;
  assign interconnect_write_aggregated_cmd_payload_fragment_length = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_length;
  assign interconnect_write_aggregated_cmd_payload_fragment_data = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_data;
  assign interconnect_write_aggregated_cmd_payload_fragment_mask = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_mask;
  assign interconnect_write_aggregated_cmd_payload_fragment_context = interconnect_write_aggregated_arbiter_io_output_cmd_payload_fragment_context;
  assign interconnect_read_aggregated_cmd_halfPipe_valid = interconnect_read_aggregated_cmd_halfPipe_regs_valid;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_last = interconnect_read_aggregated_cmd_halfPipe_regs_payload_last;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_source = interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_source;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_opcode = interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_opcode;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_address = interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_address;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_length = interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_length;
  assign interconnect_read_aggregated_cmd_halfPipe_payload_fragment_context = interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_context;
  assign interconnect_read_aggregated_cmd_ready = interconnect_read_aggregated_cmd_halfPipe_regs_ready;
  assign interconnect_read_aggregated_cmd_halfPipe_ready = readLogic_resized_cmd_ready;
  assign readLogic_resized_cmd_valid = interconnect_read_aggregated_cmd_halfPipe_valid;
  assign readLogic_resized_cmd_payload_last = interconnect_read_aggregated_cmd_halfPipe_payload_last;
  assign readLogic_resized_cmd_payload_fragment_source = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_source;
  assign readLogic_resized_cmd_payload_fragment_opcode = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_opcode;
  assign readLogic_resized_cmd_payload_fragment_address = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_address;
  assign readLogic_resized_cmd_payload_fragment_length = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_length;
  assign readLogic_resized_cmd_payload_fragment_context = interconnect_read_aggregated_cmd_halfPipe_payload_fragment_context;
  assign interconnect_read_aggregated_rsp_valid = readLogic_resized_rsp_valid;
  assign readLogic_resized_rsp_ready = interconnect_read_aggregated_rsp_ready;
  assign interconnect_read_aggregated_rsp_payload_last = readLogic_resized_rsp_payload_last;
  assign interconnect_read_aggregated_rsp_payload_fragment_source = readLogic_resized_rsp_payload_fragment_source;
  assign interconnect_read_aggregated_rsp_payload_fragment_opcode = readLogic_resized_rsp_payload_fragment_opcode;
  assign interconnect_read_aggregated_rsp_payload_fragment_data = readLogic_resized_rsp_payload_fragment_data;
  assign interconnect_read_aggregated_rsp_payload_fragment_context = readLogic_resized_rsp_payload_fragment_context;
  assign readLogic_resized_cmd_ready = readLogic_sourceRemover_io_input_cmd_ready;
  assign readLogic_resized_rsp_valid = readLogic_sourceRemover_io_input_rsp_valid;
  assign readLogic_resized_rsp_payload_last = readLogic_sourceRemover_io_input_rsp_payload_last;
  assign readLogic_resized_rsp_payload_fragment_source = readLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  assign readLogic_resized_rsp_payload_fragment_opcode = readLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  assign readLogic_resized_rsp_payload_fragment_data = readLogic_sourceRemover_io_input_rsp_payload_fragment_data;
  assign readLogic_resized_rsp_payload_fragment_context = readLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  assign readLogic_adapter_ar_valid = readLogic_bridge_io_output_ar_valid;
  assign readLogic_adapter_ar_payload_addr = readLogic_bridge_io_output_ar_payload_addr;
  assign _zz_1[3 : 0] = 4'b0000;
  assign readLogic_adapter_ar_payload_region = _zz_1;
  assign readLogic_adapter_ar_payload_len = readLogic_bridge_io_output_ar_payload_len;
  assign readLogic_adapter_ar_payload_size = readLogic_bridge_io_output_ar_payload_size;
  assign readLogic_adapter_ar_payload_burst = 2'b01;
  assign readLogic_adapter_ar_payload_lock = 1'b0;
  assign readLogic_adapter_ar_payload_cache = readLogic_bridge_io_output_ar_payload_cache;
  assign readLogic_adapter_ar_payload_qos = 4'b0000;
  assign readLogic_adapter_ar_payload_prot = readLogic_bridge_io_output_ar_payload_prot;
  assign readLogic_adapter_r_ready = readLogic_bridge_io_output_r_ready;
  assign readLogic_adapter_ar_halfPipe_valid = readLogic_adapter_ar_halfPipe_regs_valid;
  assign readLogic_adapter_ar_halfPipe_payload_addr = readLogic_adapter_ar_halfPipe_regs_payload_addr;
  assign readLogic_adapter_ar_halfPipe_payload_region = readLogic_adapter_ar_halfPipe_regs_payload_region;
  assign readLogic_adapter_ar_halfPipe_payload_len = readLogic_adapter_ar_halfPipe_regs_payload_len;
  assign readLogic_adapter_ar_halfPipe_payload_size = readLogic_adapter_ar_halfPipe_regs_payload_size;
  assign readLogic_adapter_ar_halfPipe_payload_burst = readLogic_adapter_ar_halfPipe_regs_payload_burst;
  assign readLogic_adapter_ar_halfPipe_payload_lock = readLogic_adapter_ar_halfPipe_regs_payload_lock;
  assign readLogic_adapter_ar_halfPipe_payload_cache = readLogic_adapter_ar_halfPipe_regs_payload_cache;
  assign readLogic_adapter_ar_halfPipe_payload_qos = readLogic_adapter_ar_halfPipe_regs_payload_qos;
  assign readLogic_adapter_ar_halfPipe_payload_prot = readLogic_adapter_ar_halfPipe_regs_payload_prot;
  assign readLogic_adapter_ar_ready = readLogic_adapter_ar_halfPipe_regs_ready;
  assign read_arvalid = readLogic_adapter_ar_halfPipe_valid;
  assign readLogic_adapter_ar_halfPipe_ready = read_arready;
  assign read_araddr = readLogic_adapter_ar_halfPipe_payload_addr;
  assign read_arregion = readLogic_adapter_ar_halfPipe_payload_region;
  assign read_arlen = readLogic_adapter_ar_halfPipe_payload_len;
  assign read_arsize = readLogic_adapter_ar_halfPipe_payload_size;
  assign read_arburst = readLogic_adapter_ar_halfPipe_payload_burst;
  assign read_arlock = readLogic_adapter_ar_halfPipe_payload_lock;
  assign read_arcache = readLogic_adapter_ar_halfPipe_payload_cache;
  assign read_arqos = readLogic_adapter_ar_halfPipe_payload_qos;
  assign read_arprot = readLogic_adapter_ar_halfPipe_payload_prot;
  assign read_r_s2mPipe_valid = (read_rvalid || read_r_s2mPipe_rValid);
  assign read_rready = (! read_r_s2mPipe_rValid);
  assign read_r_s2mPipe_payload_data = (read_r_s2mPipe_rValid ? read_r_s2mPipe_rData_data : read_rdata);
  assign read_r_s2mPipe_payload_resp = (read_r_s2mPipe_rValid ? read_r_s2mPipe_rData_resp : read_rresp);
  assign read_r_s2mPipe_payload_last = (read_r_s2mPipe_rValid ? read_r_s2mPipe_rData_last : read_rlast);
  assign read_r_s2mPipe_ready = ((1'b1 && (! readLogic_beforeQueue_valid)) || readLogic_beforeQueue_ready);
  assign readLogic_beforeQueue_valid = read_r_s2mPipe_m2sPipe_rValid;
  assign readLogic_beforeQueue_payload_data = read_r_s2mPipe_m2sPipe_rData_data;
  assign readLogic_beforeQueue_payload_resp = read_r_s2mPipe_m2sPipe_rData_resp;
  assign readLogic_beforeQueue_payload_last = read_r_s2mPipe_m2sPipe_rData_last;
  assign readLogic_adapter_r_valid = readLogic_beforeQueue_valid;
  assign readLogic_beforeQueue_ready = readLogic_adapter_r_ready;
  assign readLogic_adapter_r_payload_data = readLogic_beforeQueue_payload_data;
  assign readLogic_adapter_r_payload_resp = readLogic_beforeQueue_payload_resp;
  assign readLogic_adapter_r_payload_last = readLogic_beforeQueue_payload_last;
  assign interconnect_write_aggregated_cmd_ready = ((1'b1 && (! interconnect_write_aggregated_cmd_m2sPipe_valid)) || interconnect_write_aggregated_cmd_m2sPipe_ready);
  assign interconnect_write_aggregated_cmd_m2sPipe_valid = interconnect_write_aggregated_cmd_m2sPipe_rValid;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_last = interconnect_write_aggregated_cmd_m2sPipe_rData_last;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_source = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_source;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_opcode = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_opcode;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_address = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_address;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_length = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_length;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_data = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_data;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_mask = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_mask;
  assign interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_context = interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_context;
  assign interconnect_write_aggregated_cmd_m2sPipe_ready = writeLogic_resized_cmd_ready;
  assign writeLogic_resized_cmd_valid = interconnect_write_aggregated_cmd_m2sPipe_valid;
  assign writeLogic_resized_cmd_payload_last = interconnect_write_aggregated_cmd_m2sPipe_payload_last;
  assign writeLogic_resized_cmd_payload_fragment_source = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_source;
  assign writeLogic_resized_cmd_payload_fragment_opcode = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_opcode;
  assign writeLogic_resized_cmd_payload_fragment_address = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_address;
  assign writeLogic_resized_cmd_payload_fragment_length = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_length;
  assign writeLogic_resized_cmd_payload_fragment_data = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_data;
  assign writeLogic_resized_cmd_payload_fragment_mask = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_mask;
  assign writeLogic_resized_cmd_payload_fragment_context = interconnect_write_aggregated_cmd_m2sPipe_payload_fragment_context;
  assign interconnect_write_aggregated_rsp_valid = writeLogic_resized_rsp_valid;
  assign writeLogic_resized_rsp_ready = interconnect_write_aggregated_rsp_ready;
  assign interconnect_write_aggregated_rsp_payload_last = writeLogic_resized_rsp_payload_last;
  assign interconnect_write_aggregated_rsp_payload_fragment_source = writeLogic_resized_rsp_payload_fragment_source;
  assign interconnect_write_aggregated_rsp_payload_fragment_opcode = writeLogic_resized_rsp_payload_fragment_opcode;
  assign interconnect_write_aggregated_rsp_payload_fragment_context = writeLogic_resized_rsp_payload_fragment_context;
  assign writeLogic_resized_cmd_ready = writeLogic_sourceRemover_io_input_cmd_ready;
  assign writeLogic_resized_rsp_valid = writeLogic_sourceRemover_io_input_rsp_valid;
  assign writeLogic_resized_rsp_payload_last = writeLogic_sourceRemover_io_input_rsp_payload_last;
  assign writeLogic_resized_rsp_payload_fragment_source = writeLogic_sourceRemover_io_input_rsp_payload_fragment_source;
  assign writeLogic_resized_rsp_payload_fragment_opcode = writeLogic_sourceRemover_io_input_rsp_payload_fragment_opcode;
  assign writeLogic_resized_rsp_payload_fragment_context = writeLogic_sourceRemover_io_input_rsp_payload_fragment_context;
  assign writeLogic_adapter_aw_valid = writeLogic_bridge_io_output_aw_valid;
  assign writeLogic_adapter_aw_payload_addr = writeLogic_bridge_io_output_aw_payload_addr;
  assign _zz_2[3 : 0] = 4'b0000;
  assign writeLogic_adapter_aw_payload_region = _zz_2;
  assign writeLogic_adapter_aw_payload_len = writeLogic_bridge_io_output_aw_payload_len;
  assign writeLogic_adapter_aw_payload_size = writeLogic_bridge_io_output_aw_payload_size;
  assign writeLogic_adapter_aw_payload_burst = 2'b01;
  assign writeLogic_adapter_aw_payload_lock = 1'b0;
  assign writeLogic_adapter_aw_payload_cache = writeLogic_bridge_io_output_aw_payload_cache;
  assign writeLogic_adapter_aw_payload_qos = 4'b0000;
  assign writeLogic_adapter_aw_payload_prot = writeLogic_bridge_io_output_aw_payload_prot;
  assign writeLogic_adapter_w_valid = writeLogic_bridge_io_output_w_valid;
  assign writeLogic_adapter_w_payload_data = writeLogic_bridge_io_output_w_payload_data;
  assign writeLogic_adapter_w_payload_strb = writeLogic_bridge_io_output_w_payload_strb;
  assign writeLogic_adapter_w_payload_last = writeLogic_bridge_io_output_w_payload_last;
  assign writeLogic_adapter_b_ready = writeLogic_bridge_io_output_b_ready;
  assign writeLogic_adapter_aw_halfPipe_valid = writeLogic_adapter_aw_halfPipe_regs_valid;
  assign writeLogic_adapter_aw_halfPipe_payload_addr = writeLogic_adapter_aw_halfPipe_regs_payload_addr;
  assign writeLogic_adapter_aw_halfPipe_payload_region = writeLogic_adapter_aw_halfPipe_regs_payload_region;
  assign writeLogic_adapter_aw_halfPipe_payload_len = writeLogic_adapter_aw_halfPipe_regs_payload_len;
  assign writeLogic_adapter_aw_halfPipe_payload_size = writeLogic_adapter_aw_halfPipe_regs_payload_size;
  assign writeLogic_adapter_aw_halfPipe_payload_burst = writeLogic_adapter_aw_halfPipe_regs_payload_burst;
  assign writeLogic_adapter_aw_halfPipe_payload_lock = writeLogic_adapter_aw_halfPipe_regs_payload_lock;
  assign writeLogic_adapter_aw_halfPipe_payload_cache = writeLogic_adapter_aw_halfPipe_regs_payload_cache;
  assign writeLogic_adapter_aw_halfPipe_payload_qos = writeLogic_adapter_aw_halfPipe_regs_payload_qos;
  assign writeLogic_adapter_aw_halfPipe_payload_prot = writeLogic_adapter_aw_halfPipe_regs_payload_prot;
  assign writeLogic_adapter_aw_ready = writeLogic_adapter_aw_halfPipe_regs_ready;
  assign write_awvalid = writeLogic_adapter_aw_halfPipe_valid;
  assign writeLogic_adapter_aw_halfPipe_ready = write_awready;
  assign write_awaddr = writeLogic_adapter_aw_halfPipe_payload_addr;
  assign write_awregion = writeLogic_adapter_aw_halfPipe_payload_region;
  assign write_awlen = writeLogic_adapter_aw_halfPipe_payload_len;
  assign write_awsize = writeLogic_adapter_aw_halfPipe_payload_size;
  assign write_awburst = writeLogic_adapter_aw_halfPipe_payload_burst;
  assign write_awlock = writeLogic_adapter_aw_halfPipe_payload_lock;
  assign write_awcache = writeLogic_adapter_aw_halfPipe_payload_cache;
  assign write_awqos = writeLogic_adapter_aw_halfPipe_payload_qos;
  assign write_awprot = writeLogic_adapter_aw_halfPipe_payload_prot;
  assign writeLogic_adapter_w_s2mPipe_valid = (writeLogic_adapter_w_valid || writeLogic_adapter_w_s2mPipe_rValid);
  assign writeLogic_adapter_w_ready = (! writeLogic_adapter_w_s2mPipe_rValid);
  assign writeLogic_adapter_w_s2mPipe_payload_data = (writeLogic_adapter_w_s2mPipe_rValid ? writeLogic_adapter_w_s2mPipe_rData_data : writeLogic_adapter_w_payload_data);
  assign writeLogic_adapter_w_s2mPipe_payload_strb = (writeLogic_adapter_w_s2mPipe_rValid ? writeLogic_adapter_w_s2mPipe_rData_strb : writeLogic_adapter_w_payload_strb);
  assign writeLogic_adapter_w_s2mPipe_payload_last = (writeLogic_adapter_w_s2mPipe_rValid ? writeLogic_adapter_w_s2mPipe_rData_last : writeLogic_adapter_w_payload_last);
  assign writeLogic_adapter_w_s2mPipe_ready = ((1'b1 && (! writeLogic_adapter_w_s2mPipe_m2sPipe_valid)) || writeLogic_adapter_w_s2mPipe_m2sPipe_ready);
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_valid = writeLogic_adapter_w_s2mPipe_m2sPipe_rValid;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_payload_data = writeLogic_adapter_w_s2mPipe_m2sPipe_rData_data;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_payload_strb = writeLogic_adapter_w_s2mPipe_m2sPipe_rData_strb;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_payload_last = writeLogic_adapter_w_s2mPipe_m2sPipe_rData_last;
  assign write_wvalid = writeLogic_adapter_w_s2mPipe_m2sPipe_valid;
  assign writeLogic_adapter_w_s2mPipe_m2sPipe_ready = write_wready;
  assign write_wdata = writeLogic_adapter_w_s2mPipe_m2sPipe_payload_data;
  assign write_wstrb = writeLogic_adapter_w_s2mPipe_m2sPipe_payload_strb;
  assign write_wlast = writeLogic_adapter_w_s2mPipe_m2sPipe_payload_last;
  assign write_b_halfPipe_valid = write_b_halfPipe_regs_valid;
  assign write_b_halfPipe_payload_resp = write_b_halfPipe_regs_payload_resp;
  assign write_bready = write_b_halfPipe_regs_ready;
  assign writeLogic_adapter_b_valid = write_b_halfPipe_valid;
  assign write_b_halfPipe_ready = writeLogic_adapter_b_ready;
  assign writeLogic_adapter_b_payload_resp = write_b_halfPipe_payload_resp;
  assign dat1_i_tready = inputsAdapter_0_crossclock_fifo_io_push_ready;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_valid = (inputsAdapter_0_crossclock_fifo_io_pop_valid || inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid);
  assign _zz_5 = (! inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_data = (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_data : inputsAdapter_0_crossclock_fifo_io_pop_payload_data);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_mask = (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_mask : inputsAdapter_0_crossclock_fifo_io_pop_payload_mask);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_sink = (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_sink : inputsAdapter_0_crossclock_fifo_io_pop_payload_sink);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_last = (inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid ? inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_last : inputsAdapter_0_crossclock_fifo_io_pop_payload_last);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready = ((1'b1 && (! inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid)) || inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready);
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_valid = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rValid;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_data = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_data;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_mask = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_mask;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_sink = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_sink;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_payload_last = inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_last;
  assign inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_ready = core_io_inputs_0_ready;
  assign core_io_outputs_0_s2mPipe_valid = (core_io_outputs_0_valid || core_io_outputs_0_s2mPipe_rValid);
  assign _zz_4 = (! core_io_outputs_0_s2mPipe_rValid);
  assign core_io_outputs_0_s2mPipe_payload_data = (core_io_outputs_0_s2mPipe_rValid ? core_io_outputs_0_s2mPipe_rData_data : core_io_outputs_0_payload_data);
  assign core_io_outputs_0_s2mPipe_payload_mask = (core_io_outputs_0_s2mPipe_rValid ? core_io_outputs_0_s2mPipe_rData_mask : core_io_outputs_0_payload_mask);
  assign core_io_outputs_0_s2mPipe_payload_sink = (core_io_outputs_0_s2mPipe_rValid ? core_io_outputs_0_s2mPipe_rData_sink : core_io_outputs_0_payload_sink);
  assign core_io_outputs_0_s2mPipe_payload_last = (core_io_outputs_0_s2mPipe_rValid ? core_io_outputs_0_s2mPipe_rData_last : core_io_outputs_0_payload_last);
  assign core_io_outputs_0_s2mPipe_ready = ((1'b1 && (! outputsAdapter_0_ptr_valid)) || outputsAdapter_0_ptr_ready);
  assign outputsAdapter_0_ptr_valid = core_io_outputs_0_s2mPipe_m2sPipe_rValid;
  assign outputsAdapter_0_ptr_payload_data = core_io_outputs_0_s2mPipe_m2sPipe_rData_data;
  assign outputsAdapter_0_ptr_payload_mask = core_io_outputs_0_s2mPipe_m2sPipe_rData_mask;
  assign outputsAdapter_0_ptr_payload_sink = core_io_outputs_0_s2mPipe_m2sPipe_rData_sink;
  assign outputsAdapter_0_ptr_payload_last = core_io_outputs_0_s2mPipe_m2sPipe_rData_last;
  assign outputsAdapter_0_ptr_ready = outputsAdapter_0_crossclock_fifo_io_push_ready;
  assign dat0_o_tvalid = outputsAdapter_0_crossclock_fifo_io_pop_valid;
  assign dat0_o_tdata = outputsAdapter_0_crossclock_fifo_io_pop_payload_data;
  assign dat0_o_tkeep = outputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
  assign dat0_o_tdest = outputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
  assign dat0_o_tlast = outputsAdapter_0_crossclock_fifo_io_pop_payload_last;
  always @ (posedge clk) begin
    if(reset) begin
      core_io_write_cmd_s2mPipe_rValid <= 1'b0;
      core_io_write_cmd_s2mPipe_m2sPipe_rValid <= 1'b0;
      interconnect_read_aggregated_cmd_halfPipe_regs_valid <= 1'b0;
      interconnect_read_aggregated_cmd_halfPipe_regs_ready <= 1'b1;
      readLogic_adapter_ar_halfPipe_regs_valid <= 1'b0;
      readLogic_adapter_ar_halfPipe_regs_ready <= 1'b1;
      read_r_s2mPipe_rValid <= 1'b0;
      read_r_s2mPipe_m2sPipe_rValid <= 1'b0;
      interconnect_write_aggregated_cmd_m2sPipe_rValid <= 1'b0;
      writeLogic_adapter_aw_halfPipe_regs_valid <= 1'b0;
      writeLogic_adapter_aw_halfPipe_regs_ready <= 1'b1;
      writeLogic_adapter_w_s2mPipe_rValid <= 1'b0;
      writeLogic_adapter_w_s2mPipe_m2sPipe_rValid <= 1'b0;
      write_b_halfPipe_regs_valid <= 1'b0;
      write_b_halfPipe_regs_ready <= 1'b1;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid <= 1'b0;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rValid <= 1'b0;
      core_io_outputs_0_s2mPipe_rValid <= 1'b0;
      core_io_outputs_0_s2mPipe_m2sPipe_rValid <= 1'b0;
    end else begin
      if(core_io_write_cmd_s2mPipe_ready)begin
        core_io_write_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_6)begin
        core_io_write_cmd_s2mPipe_rValid <= core_io_write_cmd_valid;
      end
      if(core_io_write_cmd_s2mPipe_ready)begin
        core_io_write_cmd_s2mPipe_m2sPipe_rValid <= core_io_write_cmd_s2mPipe_valid;
      end
      if(_zz_7)begin
        interconnect_read_aggregated_cmd_halfPipe_regs_valid <= interconnect_read_aggregated_cmd_valid;
        interconnect_read_aggregated_cmd_halfPipe_regs_ready <= (! interconnect_read_aggregated_cmd_valid);
      end else begin
        interconnect_read_aggregated_cmd_halfPipe_regs_valid <= (! interconnect_read_aggregated_cmd_halfPipe_ready);
        interconnect_read_aggregated_cmd_halfPipe_regs_ready <= interconnect_read_aggregated_cmd_halfPipe_ready;
      end
      if(_zz_8)begin
        readLogic_adapter_ar_halfPipe_regs_valid <= readLogic_adapter_ar_valid;
        readLogic_adapter_ar_halfPipe_regs_ready <= (! readLogic_adapter_ar_valid);
      end else begin
        readLogic_adapter_ar_halfPipe_regs_valid <= (! readLogic_adapter_ar_halfPipe_ready);
        readLogic_adapter_ar_halfPipe_regs_ready <= readLogic_adapter_ar_halfPipe_ready;
      end
      if(read_r_s2mPipe_ready)begin
        read_r_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_9)begin
        read_r_s2mPipe_rValid <= read_rvalid;
      end
      if(read_r_s2mPipe_ready)begin
        read_r_s2mPipe_m2sPipe_rValid <= read_r_s2mPipe_valid;
      end
      if(interconnect_write_aggregated_cmd_ready)begin
        interconnect_write_aggregated_cmd_m2sPipe_rValid <= interconnect_write_aggregated_cmd_valid;
      end
      if(_zz_10)begin
        writeLogic_adapter_aw_halfPipe_regs_valid <= writeLogic_adapter_aw_valid;
        writeLogic_adapter_aw_halfPipe_regs_ready <= (! writeLogic_adapter_aw_valid);
      end else begin
        writeLogic_adapter_aw_halfPipe_regs_valid <= (! writeLogic_adapter_aw_halfPipe_ready);
        writeLogic_adapter_aw_halfPipe_regs_ready <= writeLogic_adapter_aw_halfPipe_ready;
      end
      if(writeLogic_adapter_w_s2mPipe_ready)begin
        writeLogic_adapter_w_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_11)begin
        writeLogic_adapter_w_s2mPipe_rValid <= writeLogic_adapter_w_valid;
      end
      if(writeLogic_adapter_w_s2mPipe_ready)begin
        writeLogic_adapter_w_s2mPipe_m2sPipe_rValid <= writeLogic_adapter_w_s2mPipe_valid;
      end
      if(_zz_12)begin
        write_b_halfPipe_regs_valid <= write_bvalid;
        write_b_halfPipe_regs_ready <= (! write_bvalid);
      end else begin
        write_b_halfPipe_regs_valid <= (! write_b_halfPipe_ready);
        write_b_halfPipe_regs_ready <= write_b_halfPipe_ready;
      end
      if(inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready)begin
        inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_13)begin
        inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rValid <= inputsAdapter_0_crossclock_fifo_io_pop_valid;
      end
      if(inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready)begin
        inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rValid <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_valid;
      end
      if(core_io_outputs_0_s2mPipe_ready)begin
        core_io_outputs_0_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_14)begin
        core_io_outputs_0_s2mPipe_rValid <= core_io_outputs_0_valid;
      end
      if(core_io_outputs_0_s2mPipe_ready)begin
        core_io_outputs_0_s2mPipe_m2sPipe_rValid <= core_io_outputs_0_s2mPipe_valid;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_6)begin
      core_io_write_cmd_s2mPipe_rData_last <= core_io_write_cmd_payload_last;
      core_io_write_cmd_s2mPipe_rData_fragment_opcode <= core_io_write_cmd_payload_fragment_opcode;
      core_io_write_cmd_s2mPipe_rData_fragment_address <= core_io_write_cmd_payload_fragment_address;
      core_io_write_cmd_s2mPipe_rData_fragment_length <= core_io_write_cmd_payload_fragment_length;
      core_io_write_cmd_s2mPipe_rData_fragment_data <= core_io_write_cmd_payload_fragment_data;
      core_io_write_cmd_s2mPipe_rData_fragment_mask <= core_io_write_cmd_payload_fragment_mask;
      core_io_write_cmd_s2mPipe_rData_fragment_context <= core_io_write_cmd_payload_fragment_context;
    end
    if(core_io_write_cmd_s2mPipe_ready)begin
      core_io_write_cmd_s2mPipe_m2sPipe_rData_last <= core_io_write_cmd_s2mPipe_payload_last;
      core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_opcode <= core_io_write_cmd_s2mPipe_payload_fragment_opcode;
      core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_address <= core_io_write_cmd_s2mPipe_payload_fragment_address;
      core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_length <= core_io_write_cmd_s2mPipe_payload_fragment_length;
      core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_data <= core_io_write_cmd_s2mPipe_payload_fragment_data;
      core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_mask <= core_io_write_cmd_s2mPipe_payload_fragment_mask;
      core_io_write_cmd_s2mPipe_m2sPipe_rData_fragment_context <= core_io_write_cmd_s2mPipe_payload_fragment_context;
    end
    if(_zz_7)begin
      interconnect_read_aggregated_cmd_halfPipe_regs_payload_last <= interconnect_read_aggregated_cmd_payload_last;
      interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_source <= interconnect_read_aggregated_cmd_payload_fragment_source;
      interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_opcode <= interconnect_read_aggregated_cmd_payload_fragment_opcode;
      interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_address <= interconnect_read_aggregated_cmd_payload_fragment_address;
      interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_length <= interconnect_read_aggregated_cmd_payload_fragment_length;
      interconnect_read_aggregated_cmd_halfPipe_regs_payload_fragment_context <= interconnect_read_aggregated_cmd_payload_fragment_context;
    end
    if(_zz_8)begin
      readLogic_adapter_ar_halfPipe_regs_payload_addr <= readLogic_adapter_ar_payload_addr;
      readLogic_adapter_ar_halfPipe_regs_payload_region <= readLogic_adapter_ar_payload_region;
      readLogic_adapter_ar_halfPipe_regs_payload_len <= readLogic_adapter_ar_payload_len;
      readLogic_adapter_ar_halfPipe_regs_payload_size <= readLogic_adapter_ar_payload_size;
      readLogic_adapter_ar_halfPipe_regs_payload_burst <= readLogic_adapter_ar_payload_burst;
      readLogic_adapter_ar_halfPipe_regs_payload_lock <= readLogic_adapter_ar_payload_lock;
      readLogic_adapter_ar_halfPipe_regs_payload_cache <= readLogic_adapter_ar_payload_cache;
      readLogic_adapter_ar_halfPipe_regs_payload_qos <= readLogic_adapter_ar_payload_qos;
      readLogic_adapter_ar_halfPipe_regs_payload_prot <= readLogic_adapter_ar_payload_prot;
    end
    if(_zz_9)begin
      read_r_s2mPipe_rData_data <= read_rdata;
      read_r_s2mPipe_rData_resp <= read_rresp;
      read_r_s2mPipe_rData_last <= read_rlast;
    end
    if(read_r_s2mPipe_ready)begin
      read_r_s2mPipe_m2sPipe_rData_data <= read_r_s2mPipe_payload_data;
      read_r_s2mPipe_m2sPipe_rData_resp <= read_r_s2mPipe_payload_resp;
      read_r_s2mPipe_m2sPipe_rData_last <= read_r_s2mPipe_payload_last;
    end
    if(interconnect_write_aggregated_cmd_ready)begin
      interconnect_write_aggregated_cmd_m2sPipe_rData_last <= interconnect_write_aggregated_cmd_payload_last;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_source <= interconnect_write_aggregated_cmd_payload_fragment_source;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_opcode <= interconnect_write_aggregated_cmd_payload_fragment_opcode;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_address <= interconnect_write_aggregated_cmd_payload_fragment_address;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_length <= interconnect_write_aggregated_cmd_payload_fragment_length;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_data <= interconnect_write_aggregated_cmd_payload_fragment_data;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_mask <= interconnect_write_aggregated_cmd_payload_fragment_mask;
      interconnect_write_aggregated_cmd_m2sPipe_rData_fragment_context <= interconnect_write_aggregated_cmd_payload_fragment_context;
    end
    if(_zz_10)begin
      writeLogic_adapter_aw_halfPipe_regs_payload_addr <= writeLogic_adapter_aw_payload_addr;
      writeLogic_adapter_aw_halfPipe_regs_payload_region <= writeLogic_adapter_aw_payload_region;
      writeLogic_adapter_aw_halfPipe_regs_payload_len <= writeLogic_adapter_aw_payload_len;
      writeLogic_adapter_aw_halfPipe_regs_payload_size <= writeLogic_adapter_aw_payload_size;
      writeLogic_adapter_aw_halfPipe_regs_payload_burst <= writeLogic_adapter_aw_payload_burst;
      writeLogic_adapter_aw_halfPipe_regs_payload_lock <= writeLogic_adapter_aw_payload_lock;
      writeLogic_adapter_aw_halfPipe_regs_payload_cache <= writeLogic_adapter_aw_payload_cache;
      writeLogic_adapter_aw_halfPipe_regs_payload_qos <= writeLogic_adapter_aw_payload_qos;
      writeLogic_adapter_aw_halfPipe_regs_payload_prot <= writeLogic_adapter_aw_payload_prot;
    end
    if(_zz_11)begin
      writeLogic_adapter_w_s2mPipe_rData_data <= writeLogic_adapter_w_payload_data;
      writeLogic_adapter_w_s2mPipe_rData_strb <= writeLogic_adapter_w_payload_strb;
      writeLogic_adapter_w_s2mPipe_rData_last <= writeLogic_adapter_w_payload_last;
    end
    if(writeLogic_adapter_w_s2mPipe_ready)begin
      writeLogic_adapter_w_s2mPipe_m2sPipe_rData_data <= writeLogic_adapter_w_s2mPipe_payload_data;
      writeLogic_adapter_w_s2mPipe_m2sPipe_rData_strb <= writeLogic_adapter_w_s2mPipe_payload_strb;
      writeLogic_adapter_w_s2mPipe_m2sPipe_rData_last <= writeLogic_adapter_w_s2mPipe_payload_last;
    end
    if(_zz_12)begin
      write_b_halfPipe_regs_payload_resp <= write_bresp;
    end
    if(_zz_13)begin
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_data <= inputsAdapter_0_crossclock_fifo_io_pop_payload_data;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_mask <= inputsAdapter_0_crossclock_fifo_io_pop_payload_mask;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_sink <= inputsAdapter_0_crossclock_fifo_io_pop_payload_sink;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_rData_last <= inputsAdapter_0_crossclock_fifo_io_pop_payload_last;
    end
    if(inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_ready)begin
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_data <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_data;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_mask <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_mask;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_sink <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_sink;
      inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_m2sPipe_rData_last <= inputsAdapter_0_crossclock_fifo_io_pop_s2mPipe_payload_last;
    end
    if(_zz_14)begin
      core_io_outputs_0_s2mPipe_rData_data <= core_io_outputs_0_payload_data;
      core_io_outputs_0_s2mPipe_rData_mask <= core_io_outputs_0_payload_mask;
      core_io_outputs_0_s2mPipe_rData_sink <= core_io_outputs_0_payload_sink;
      core_io_outputs_0_s2mPipe_rData_last <= core_io_outputs_0_payload_last;
    end
    if(core_io_outputs_0_s2mPipe_ready)begin
      core_io_outputs_0_s2mPipe_m2sPipe_rData_data <= core_io_outputs_0_s2mPipe_payload_data;
      core_io_outputs_0_s2mPipe_m2sPipe_rData_mask <= core_io_outputs_0_s2mPipe_payload_mask;
      core_io_outputs_0_s2mPipe_m2sPipe_rData_sink <= core_io_outputs_0_s2mPipe_payload_sink;
      core_io_outputs_0_s2mPipe_m2sPipe_rData_last <= core_io_outputs_0_s2mPipe_payload_last;
    end
  end


endmodule

module EfxDMA_StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload_data,
  input      [3:0]    io_push_payload_mask,
  input      [3:0]    io_push_payload_sink,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload_data,
  output     [3:0]    io_pop_payload_mask,
  output     [3:0]    io_pop_payload_sink,
  output              io_pop_payload_last,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               clk,
  input               reset,
  input               dat0_o_clk,
  input               dat0_o_reset
);
  reg        [40:0]   _zz_12;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire                _zz_13;
  wire       [4:0]    _zz_14;
  wire       [3:0]    _zz_15;
  wire       [4:0]    _zz_16;
  wire       [3:0]    _zz_17;
  wire       [0:0]    _zz_18;
  wire       [40:0]   _zz_19;
  wire                _zz_20;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire       [4:0]    _zz_6;
  wire       [40:0]   _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  reg [40:0] ram [0:15];

  assign _zz_13 = (io_push_valid && io_push_ready);
  assign _zz_14 = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_15 = pushCC_pushPtr[3:0];
  assign _zz_16 = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_17 = _zz_6[3:0];
  assign _zz_18 = _zz_7[40 : 40];
  assign _zz_19 = {io_push_payload_last,{io_push_payload_sink,{io_push_payload_mask,io_push_payload_data}}};
  assign _zz_20 = 1'b1;
  always @ (posedge clk) begin
    if(_zz_1) begin
      ram[_zz_15] <= _zz_19;
    end
  end

  always @ (posedge dat0_o_clk) begin
    if(_zz_20) begin
      _zz_12 <= ram[_zz_17];
    end
  end

  EfxDMA_BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray[4:0]                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  EfxDMA_BufferCC_3 pushToPopGray_buffercc (
    .io_dataIn       (pushToPopGray[4:0]                      ), //i
    .io_dataOut      (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .dat0_o_clk      (dat0_o_clk                              ), //i
    .dat0_o_reset    (dat0_o_reset                            )  //i
  );
  always @ (*) begin
    _zz_1 = 1'b0;
    if(_zz_13)begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_2 = (pushCC_popPtrGray[1] ^ _zz_3);
  assign _zz_3 = (pushCC_popPtrGray[2] ^ _zz_4);
  assign _zz_4 = (pushCC_popPtrGray[3] ^ _zz_5);
  assign _zz_5 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_5,{_zz_4,{_zz_3,{_zz_2,(pushCC_popPtrGray[0] ^ _zz_2)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign _zz_6 = ((io_pop_valid && io_pop_ready) ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_7 = _zz_12;
  assign io_pop_payload_data = _zz_7[31 : 0];
  assign io_pop_payload_mask = _zz_7[35 : 32];
  assign io_pop_payload_sink = _zz_7[39 : 36];
  assign io_pop_payload_last = _zz_18[0];
  assign _zz_8 = (popCC_pushPtrGray[1] ^ _zz_9);
  assign _zz_9 = (popCC_pushPtrGray[2] ^ _zz_10);
  assign _zz_10 = (popCC_pushPtrGray[3] ^ _zz_11);
  assign _zz_11 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_11,{_zz_10,{_zz_9,{_zz_8,(popCC_pushPtrGray[0] ^ _zz_8)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @ (posedge clk) begin
    if(reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if((io_push_valid && io_push_ready))begin
        pushCC_pushPtrGray <= (_zz_14 ^ pushCC_pushPtrPlus);
      end
      if(_zz_13)begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @ (posedge dat0_o_clk) begin
    if(dat0_o_reset) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if((io_pop_valid && io_pop_ready))begin
        popCC_popPtrGray <= (_zz_16 ^ popCC_popPtrPlus);
      end
      if((io_pop_valid && io_pop_ready))begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module EfxDMA_StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload_data,
  input      [3:0]    io_push_payload_mask,
  input      [3:0]    io_push_payload_sink,
  input               io_push_payload_last,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload_data,
  output     [3:0]    io_pop_payload_mask,
  output     [3:0]    io_pop_payload_sink,
  output              io_pop_payload_last,
  output     [4:0]    io_pushOccupancy,
  output     [4:0]    io_popOccupancy,
  input               dat1_i_clk,
  input               dat1_i_reset,
  input               clk,
  input               reset
);
  reg        [40:0]   _zz_12;
  wire       [4:0]    popToPushGray_buffercc_io_dataOut;
  wire       [4:0]    pushToPopGray_buffercc_io_dataOut;
  wire                _zz_13;
  wire       [4:0]    _zz_14;
  wire       [3:0]    _zz_15;
  wire       [4:0]    _zz_16;
  wire       [3:0]    _zz_17;
  wire       [0:0]    _zz_18;
  wire       [40:0]   _zz_19;
  wire                _zz_20;
  reg                 _zz_1;
  wire       [4:0]    popToPushGray;
  wire       [4:0]    pushToPopGray;
  reg        [4:0]    pushCC_pushPtr;
  wire       [4:0]    pushCC_pushPtrPlus;
  reg        [4:0]    pushCC_pushPtrGray;
  wire       [4:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  reg        [4:0]    popCC_popPtr;
  wire       [4:0]    popCC_popPtrPlus;
  reg        [4:0]    popCC_popPtrGray;
  wire       [4:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire       [4:0]    _zz_6;
  wire       [40:0]   _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  reg [40:0] ram [0:15];

  assign _zz_13 = (io_push_valid && io_push_ready);
  assign _zz_14 = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_15 = pushCC_pushPtr[3:0];
  assign _zz_16 = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_17 = _zz_6[3:0];
  assign _zz_18 = _zz_7[40 : 40];
  assign _zz_19 = {io_push_payload_last,{io_push_payload_sink,{io_push_payload_mask,io_push_payload_data}}};
  assign _zz_20 = 1'b1;
  always @ (posedge dat1_i_clk) begin
    if(_zz_1) begin
      ram[_zz_15] <= _zz_19;
    end
  end

  always @ (posedge clk) begin
    if(_zz_20) begin
      _zz_12 <= ram[_zz_17];
    end
  end

  EfxDMA_BufferCC popToPushGray_buffercc (
    .io_dataIn       (popToPushGray[4:0]                      ), //i
    .io_dataOut      (popToPushGray_buffercc_io_dataOut[4:0]  ), //o
    .dat1_i_clk      (dat1_i_clk                              ), //i
    .dat1_i_reset    (dat1_i_reset                            )  //i
  );
  EfxDMA_BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray[4:0]                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut[4:0]  ), //o
    .clk           (clk                                     ), //i
    .reset         (reset                                   )  //i
  );
  always @ (*) begin
    _zz_1 = 1'b0;
    if(_zz_13)begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 5'h01);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[4 : 3] == (~ pushCC_popPtrGray[4 : 3])) && (pushCC_pushPtrGray[2 : 0] == pushCC_popPtrGray[2 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_2 = (pushCC_popPtrGray[1] ^ _zz_3);
  assign _zz_3 = (pushCC_popPtrGray[2] ^ _zz_4);
  assign _zz_4 = (pushCC_popPtrGray[3] ^ _zz_5);
  assign _zz_5 = pushCC_popPtrGray[4];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_5,{_zz_4,{_zz_3,{_zz_2,(pushCC_popPtrGray[0] ^ _zz_2)}}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 5'h01);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign _zz_6 = ((io_pop_valid && io_pop_ready) ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_7 = _zz_12;
  assign io_pop_payload_data = _zz_7[31 : 0];
  assign io_pop_payload_mask = _zz_7[35 : 32];
  assign io_pop_payload_sink = _zz_7[39 : 36];
  assign io_pop_payload_last = _zz_18[0];
  assign _zz_8 = (popCC_pushPtrGray[1] ^ _zz_9);
  assign _zz_9 = (popCC_pushPtrGray[2] ^ _zz_10);
  assign _zz_10 = (popCC_pushPtrGray[3] ^ _zz_11);
  assign _zz_11 = popCC_pushPtrGray[4];
  assign io_popOccupancy = ({_zz_11,{_zz_10,{_zz_9,{_zz_8,(popCC_pushPtrGray[0] ^ _zz_8)}}}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @ (posedge dat1_i_clk) begin
    if(dat1_i_reset) begin
      pushCC_pushPtr <= 5'h0;
      pushCC_pushPtrGray <= 5'h0;
    end else begin
      if((io_push_valid && io_push_ready))begin
        pushCC_pushPtrGray <= (_zz_14 ^ pushCC_pushPtrPlus);
      end
      if(_zz_13)begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      popCC_popPtr <= 5'h0;
      popCC_popPtrGray <= 5'h0;
    end else begin
      if((io_pop_valid && io_pop_ready))begin
        popCC_popPtrGray <= (_zz_16 ^ popCC_popPtrPlus);
      end
      if((io_pop_valid && io_pop_ready))begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module EfxDMA_BmbToAxi4WriteOnlyBridge (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [10:0]   io_input_cmd_payload_fragment_length,
  input      [63:0]   io_input_cmd_payload_fragment_data,
  input      [7:0]    io_input_cmd_payload_fragment_mask,
  input      [12:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [12:0]   io_input_rsp_payload_fragment_context,
  output              io_output_aw_valid,
  input               io_output_aw_ready,
  output     [31:0]   io_output_aw_payload_addr,
  output     [7:0]    io_output_aw_payload_len,
  output     [2:0]    io_output_aw_payload_size,
  output     [3:0]    io_output_aw_payload_cache,
  output     [2:0]    io_output_aw_payload_prot,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [63:0]   io_output_w_payload_data,
  output     [7:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [1:0]    io_output_b_payload_resp,
  input               clk,
  input               reset
);
  wire                _zz_1;
  reg        [0:0]    _zz_2;
  reg                 _zz_3;
  wire                contextRemover_io_input_cmd_ready;
  wire                contextRemover_io_input_rsp_valid;
  wire                contextRemover_io_input_rsp_payload_last;
  wire       [0:0]    contextRemover_io_input_rsp_payload_fragment_opcode;
  wire       [12:0]   contextRemover_io_input_rsp_payload_fragment_context;
  wire                contextRemover_io_output_cmd_valid;
  wire                contextRemover_io_output_cmd_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_payload_fragment_address;
  wire       [10:0]   contextRemover_io_output_cmd_payload_fragment_length;
  wire       [63:0]   contextRemover_io_output_cmd_payload_fragment_data;
  wire       [7:0]    contextRemover_io_output_cmd_payload_fragment_mask;
  wire                contextRemover_io_output_rsp_ready;
  wire                contextRemover_io_output_cmd_fork_io_input_ready;
  wire                contextRemover_io_output_cmd_fork_io_outputs_0_valid;
  wire                contextRemover_io_output_cmd_fork_io_outputs_0_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_address;
  wire       [10:0]   contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_length;
  wire       [63:0]   contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_data;
  wire       [7:0]    contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_mask;
  wire                contextRemover_io_output_cmd_fork_io_outputs_1_valid;
  wire                contextRemover_io_output_cmd_fork_io_outputs_1_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_address;
  wire       [10:0]   contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_length;
  wire       [63:0]   contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_data;
  wire       [7:0]    contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_mask;
  wire                _zz_4;
  wire       [8:0]    _zz_5;
  wire       [11:0]   _zz_6;
  wire       [2:0]    _zz_7;
  wire       [11:0]   _zz_8;
  reg                 contextRemover_io_output_cmd_payload_first;
  reg                 cmdStage_valid;
  wire                cmdStage_ready;
  wire                cmdStage_payload_last;
  wire       [0:0]    cmdStage_payload_fragment_opcode;
  wire       [31:0]   cmdStage_payload_fragment_address;
  wire       [10:0]   cmdStage_payload_fragment_length;
  wire       [63:0]   cmdStage_payload_fragment_data;
  wire       [7:0]    cmdStage_payload_fragment_mask;

  assign _zz_4 = (! contextRemover_io_output_cmd_payload_first);
  assign _zz_5 = _zz_6[11 : 3];
  assign _zz_6 = ({1'b0,cmdStage_payload_fragment_length} + _zz_8);
  assign _zz_7 = cmdStage_payload_fragment_address[2 : 0];
  assign _zz_8 = {9'd0, _zz_7};
  EfxDMA_BmbContextRemover_1 contextRemover (
    .io_input_cmd_valid                        (io_input_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (contextRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (io_input_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_opcode      (io_input_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (io_input_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (io_input_cmd_payload_fragment_length[10:0]                   ), //i
    .io_input_cmd_payload_fragment_data        (io_input_cmd_payload_fragment_data[63:0]                     ), //i
    .io_input_cmd_payload_fragment_mask        (io_input_cmd_payload_fragment_mask[7:0]                      ), //i
    .io_input_cmd_payload_fragment_context     (io_input_cmd_payload_fragment_context[12:0]                  ), //i
    .io_input_rsp_valid                        (contextRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (io_input_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (contextRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_opcode      (contextRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_context     (contextRemover_io_input_rsp_payload_fragment_context[12:0]   ), //o
    .io_output_cmd_valid                       (contextRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (contextRemover_io_output_cmd_fork_io_input_ready             ), //i
    .io_output_cmd_payload_last                (contextRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (contextRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (contextRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (contextRemover_io_output_cmd_payload_fragment_length[10:0]   ), //o
    .io_output_cmd_payload_fragment_data       (contextRemover_io_output_cmd_payload_fragment_data[63:0]     ), //o
    .io_output_cmd_payload_fragment_mask       (contextRemover_io_output_cmd_payload_fragment_mask[7:0]      ), //o
    .io_output_rsp_valid                       (io_output_b_valid                                            ), //i
    .io_output_rsp_ready                       (contextRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (_zz_1                                                        ), //i
    .io_output_rsp_payload_fragment_opcode     (_zz_2                                                        ), //i
    .clk                                       (clk                                                          ), //i
    .reset                                     (reset                                                        )  //i
  );
  EfxDMA_StreamFork_2 contextRemover_io_output_cmd_fork (
    .io_input_valid                           (contextRemover_io_output_cmd_valid                                             ), //i
    .io_input_ready                           (contextRemover_io_output_cmd_fork_io_input_ready                               ), //o
    .io_input_payload_last                    (contextRemover_io_output_cmd_payload_last                                      ), //i
    .io_input_payload_fragment_opcode         (contextRemover_io_output_cmd_payload_fragment_opcode                           ), //i
    .io_input_payload_fragment_address        (contextRemover_io_output_cmd_payload_fragment_address[31:0]                    ), //i
    .io_input_payload_fragment_length         (contextRemover_io_output_cmd_payload_fragment_length[10:0]                     ), //i
    .io_input_payload_fragment_data           (contextRemover_io_output_cmd_payload_fragment_data[63:0]                       ), //i
    .io_input_payload_fragment_mask           (contextRemover_io_output_cmd_payload_fragment_mask[7:0]                        ), //i
    .io_outputs_0_valid                       (contextRemover_io_output_cmd_fork_io_outputs_0_valid                           ), //o
    .io_outputs_0_ready                       (_zz_3                                                                          ), //i
    .io_outputs_0_payload_last                (contextRemover_io_output_cmd_fork_io_outputs_0_payload_last                    ), //o
    .io_outputs_0_payload_fragment_opcode     (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_opcode         ), //o
    .io_outputs_0_payload_fragment_address    (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_payload_fragment_length     (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_length[10:0]   ), //o
    .io_outputs_0_payload_fragment_data       (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_data[63:0]     ), //o
    .io_outputs_0_payload_fragment_mask       (contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_mask[7:0]      ), //o
    .io_outputs_1_valid                       (contextRemover_io_output_cmd_fork_io_outputs_1_valid                           ), //o
    .io_outputs_1_ready                       (io_output_w_ready                                                              ), //i
    .io_outputs_1_payload_last                (contextRemover_io_output_cmd_fork_io_outputs_1_payload_last                    ), //o
    .io_outputs_1_payload_fragment_opcode     (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_opcode         ), //o
    .io_outputs_1_payload_fragment_address    (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_address[31:0]  ), //o
    .io_outputs_1_payload_fragment_length     (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_length[10:0]   ), //o
    .io_outputs_1_payload_fragment_data       (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_data[63:0]     ), //o
    .io_outputs_1_payload_fragment_mask       (contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_mask[7:0]      ), //o
    .clk                                      (clk                                                                            ), //i
    .reset                                    (reset                                                                          )  //i
  );
  assign io_input_cmd_ready = contextRemover_io_input_cmd_ready;
  assign io_input_rsp_valid = contextRemover_io_input_rsp_valid;
  assign io_input_rsp_payload_last = contextRemover_io_input_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = contextRemover_io_input_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_context = contextRemover_io_input_rsp_payload_fragment_context;
  always @ (*) begin
    cmdStage_valid = contextRemover_io_output_cmd_fork_io_outputs_0_valid;
    if(_zz_4)begin
      cmdStage_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_3 = cmdStage_ready;
    if(_zz_4)begin
      _zz_3 = 1'b1;
    end
  end

  assign cmdStage_payload_last = contextRemover_io_output_cmd_fork_io_outputs_0_payload_last;
  assign cmdStage_payload_fragment_opcode = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_opcode;
  assign cmdStage_payload_fragment_address = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_address;
  assign cmdStage_payload_fragment_length = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_length;
  assign cmdStage_payload_fragment_data = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_data;
  assign cmdStage_payload_fragment_mask = contextRemover_io_output_cmd_fork_io_outputs_0_payload_fragment_mask;
  assign io_output_aw_valid = cmdStage_valid;
  assign cmdStage_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdStage_payload_fragment_address;
  assign io_output_aw_payload_len = _zz_5[7:0];
  assign io_output_aw_payload_size = 3'b011;
  assign io_output_aw_payload_prot = 3'b010;
  assign io_output_aw_payload_cache = 4'b1111;
  assign io_output_w_valid = contextRemover_io_output_cmd_fork_io_outputs_1_valid;
  assign io_output_w_payload_data = contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_data;
  assign io_output_w_payload_strb = contextRemover_io_output_cmd_fork_io_outputs_1_payload_fragment_mask;
  assign io_output_w_payload_last = contextRemover_io_output_cmd_fork_io_outputs_1_payload_last;
  assign io_output_b_ready = contextRemover_io_output_rsp_ready;
  assign _zz_1 = 1'b1;
  always @ (*) begin
    if((io_output_b_payload_resp == 2'b00))begin
      _zz_2 = 1'b0;
    end else begin
      _zz_2 = 1'b1;
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      contextRemover_io_output_cmd_payload_first <= 1'b1;
    end else begin
      if((contextRemover_io_output_cmd_valid && contextRemover_io_output_cmd_fork_io_input_ready))begin
        contextRemover_io_output_cmd_payload_first <= contextRemover_io_output_cmd_payload_last;
      end
    end
  end


endmodule

module EfxDMA_BmbSourceRemover_1 (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_source,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [10:0]   io_input_cmd_payload_fragment_length,
  input      [63:0]   io_input_cmd_payload_fragment_data,
  input      [7:0]    io_input_cmd_payload_fragment_mask,
  input      [11:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_source,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [11:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [10:0]   io_output_cmd_payload_fragment_length,
  output     [63:0]   io_output_cmd_payload_fragment_data,
  output     [7:0]    io_output_cmd_payload_fragment_mask,
  output     [12:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [12:0]   io_output_rsp_payload_fragment_context
);
  wire       [0:0]    cmdContext_source;
  wire       [11:0]   cmdContext_context;
  wire       [0:0]    rspContext_source;
  wire       [11:0]   rspContext_context;
  wire       [12:0]   _zz_1;

  assign cmdContext_source = io_input_cmd_payload_fragment_source;
  assign cmdContext_context = io_input_cmd_payload_fragment_context;
  assign io_output_cmd_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = io_output_cmd_ready;
  assign io_output_cmd_payload_last = io_input_cmd_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = {cmdContext_context,cmdContext_source};
  assign _zz_1 = io_output_rsp_payload_fragment_context;
  assign rspContext_source = _zz_1[0 : 0];
  assign rspContext_context = _zz_1[12 : 1];
  assign io_input_rsp_valid = io_output_rsp_valid;
  assign io_output_rsp_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_source = rspContext_source;
  assign io_input_rsp_payload_fragment_context = rspContext_context;

endmodule

module EfxDMA_BmbToAxi4ReadOnlyBridge (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [10:0]   io_input_cmd_payload_fragment_length,
  input      [18:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [63:0]   io_input_rsp_payload_fragment_data,
  output     [18:0]   io_input_rsp_payload_fragment_context,
  output              io_output_ar_valid,
  input               io_output_ar_ready,
  output     [31:0]   io_output_ar_payload_addr,
  output     [7:0]    io_output_ar_payload_len,
  output     [2:0]    io_output_ar_payload_size,
  output     [3:0]    io_output_ar_payload_cache,
  output     [2:0]    io_output_ar_payload_prot,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [63:0]   io_output_r_payload_data,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               clk,
  input               reset
);
  reg        [0:0]    _zz_1;
  wire                contextRemover_io_input_cmd_ready;
  wire                contextRemover_io_input_rsp_valid;
  wire                contextRemover_io_input_rsp_payload_last;
  wire       [0:0]    contextRemover_io_input_rsp_payload_fragment_opcode;
  wire       [63:0]   contextRemover_io_input_rsp_payload_fragment_data;
  wire       [18:0]   contextRemover_io_input_rsp_payload_fragment_context;
  wire                contextRemover_io_output_cmd_valid;
  wire                contextRemover_io_output_cmd_payload_last;
  wire       [0:0]    contextRemover_io_output_cmd_payload_fragment_opcode;
  wire       [31:0]   contextRemover_io_output_cmd_payload_fragment_address;
  wire       [10:0]   contextRemover_io_output_cmd_payload_fragment_length;
  wire                contextRemover_io_output_rsp_ready;
  wire       [8:0]    _zz_2;
  wire       [11:0]   _zz_3;
  wire       [2:0]    _zz_4;
  wire       [11:0]   _zz_5;

  assign _zz_2 = _zz_3[11 : 3];
  assign _zz_3 = ({1'b0,contextRemover_io_output_cmd_payload_fragment_length} + _zz_5);
  assign _zz_4 = contextRemover_io_output_cmd_payload_fragment_address[2 : 0];
  assign _zz_5 = {9'd0, _zz_4};
  EfxDMA_BmbContextRemover contextRemover (
    .io_input_cmd_valid                        (io_input_cmd_valid                                           ), //i
    .io_input_cmd_ready                        (contextRemover_io_input_cmd_ready                            ), //o
    .io_input_cmd_payload_last                 (io_input_cmd_payload_last                                    ), //i
    .io_input_cmd_payload_fragment_opcode      (io_input_cmd_payload_fragment_opcode                         ), //i
    .io_input_cmd_payload_fragment_address     (io_input_cmd_payload_fragment_address[31:0]                  ), //i
    .io_input_cmd_payload_fragment_length      (io_input_cmd_payload_fragment_length[10:0]                   ), //i
    .io_input_cmd_payload_fragment_context     (io_input_cmd_payload_fragment_context[18:0]                  ), //i
    .io_input_rsp_valid                        (contextRemover_io_input_rsp_valid                            ), //o
    .io_input_rsp_ready                        (io_input_rsp_ready                                           ), //i
    .io_input_rsp_payload_last                 (contextRemover_io_input_rsp_payload_last                     ), //o
    .io_input_rsp_payload_fragment_opcode      (contextRemover_io_input_rsp_payload_fragment_opcode          ), //o
    .io_input_rsp_payload_fragment_data        (contextRemover_io_input_rsp_payload_fragment_data[63:0]      ), //o
    .io_input_rsp_payload_fragment_context     (contextRemover_io_input_rsp_payload_fragment_context[18:0]   ), //o
    .io_output_cmd_valid                       (contextRemover_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                       (io_output_ar_ready                                           ), //i
    .io_output_cmd_payload_last                (contextRemover_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode     (contextRemover_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address    (contextRemover_io_output_cmd_payload_fragment_address[31:0]  ), //o
    .io_output_cmd_payload_fragment_length     (contextRemover_io_output_cmd_payload_fragment_length[10:0]   ), //o
    .io_output_rsp_valid                       (io_output_r_valid                                            ), //i
    .io_output_rsp_ready                       (contextRemover_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                (io_output_r_payload_last                                     ), //i
    .io_output_rsp_payload_fragment_opcode     (_zz_1                                                        ), //i
    .io_output_rsp_payload_fragment_data       (io_output_r_payload_data[63:0]                               ), //i
    .clk                                       (clk                                                          ), //i
    .reset                                     (reset                                                        )  //i
  );
  assign io_input_cmd_ready = contextRemover_io_input_cmd_ready;
  assign io_input_rsp_valid = contextRemover_io_input_rsp_valid;
  assign io_input_rsp_payload_last = contextRemover_io_input_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = contextRemover_io_input_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = contextRemover_io_input_rsp_payload_fragment_data;
  assign io_input_rsp_payload_fragment_context = contextRemover_io_input_rsp_payload_fragment_context;
  assign io_output_ar_valid = contextRemover_io_output_cmd_valid;
  assign io_output_ar_payload_addr = contextRemover_io_output_cmd_payload_fragment_address;
  assign io_output_ar_payload_len = _zz_2[7:0];
  assign io_output_ar_payload_size = 3'b011;
  assign io_output_ar_payload_prot = 3'b010;
  assign io_output_ar_payload_cache = 4'b1111;
  assign io_output_r_ready = contextRemover_io_output_rsp_ready;
  always @ (*) begin
    if((io_output_r_payload_resp == 2'b00))begin
      _zz_1 = 1'b0;
    end else begin
      _zz_1 = 1'b1;
    end
  end


endmodule

module EfxDMA_BmbSourceRemover (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_source,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [10:0]   io_input_cmd_payload_fragment_length,
  input      [17:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_source,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [63:0]   io_input_rsp_payload_fragment_data,
  output     [17:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [10:0]   io_output_cmd_payload_fragment_length,
  output     [18:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [63:0]   io_output_rsp_payload_fragment_data,
  input      [18:0]   io_output_rsp_payload_fragment_context
);
  wire       [0:0]    cmdContext_source;
  wire       [17:0]   cmdContext_context;
  wire       [0:0]    rspContext_source;
  wire       [17:0]   rspContext_context;
  wire       [18:0]   _zz_1;

  assign cmdContext_source = io_input_cmd_payload_fragment_source;
  assign cmdContext_context = io_input_cmd_payload_fragment_context;
  assign io_output_cmd_valid = io_input_cmd_valid;
  assign io_input_cmd_ready = io_output_cmd_ready;
  assign io_output_cmd_payload_last = io_input_cmd_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_output_cmd_payload_fragment_context = {cmdContext_context,cmdContext_source};
  assign _zz_1 = io_output_rsp_payload_fragment_context;
  assign rspContext_source = _zz_1[0 : 0];
  assign rspContext_context = _zz_1[18 : 1];
  assign io_input_rsp_valid = io_output_rsp_valid;
  assign io_output_rsp_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_input_rsp_payload_fragment_source = rspContext_source;
  assign io_input_rsp_payload_fragment_context = rspContext_context;

endmodule

module EfxDMA_BmbArbiter_1 (
  input               io_inputs_0_cmd_valid,
  output              io_inputs_0_cmd_ready,
  input               io_inputs_0_cmd_payload_last,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_opcode,
  input      [31:0]   io_inputs_0_cmd_payload_fragment_address,
  input      [1:0]    io_inputs_0_cmd_payload_fragment_length,
  input      [63:0]   io_inputs_0_cmd_payload_fragment_data,
  input      [7:0]    io_inputs_0_cmd_payload_fragment_mask,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_context,
  output              io_inputs_0_rsp_valid,
  input               io_inputs_0_rsp_ready,
  output              io_inputs_0_rsp_payload_last,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_opcode,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_context,
  input               io_inputs_1_cmd_valid,
  output              io_inputs_1_cmd_ready,
  input               io_inputs_1_cmd_payload_last,
  input      [0:0]    io_inputs_1_cmd_payload_fragment_opcode,
  input      [31:0]   io_inputs_1_cmd_payload_fragment_address,
  input      [10:0]   io_inputs_1_cmd_payload_fragment_length,
  input      [63:0]   io_inputs_1_cmd_payload_fragment_data,
  input      [7:0]    io_inputs_1_cmd_payload_fragment_mask,
  input      [11:0]   io_inputs_1_cmd_payload_fragment_context,
  output              io_inputs_1_rsp_valid,
  input               io_inputs_1_rsp_ready,
  output              io_inputs_1_rsp_payload_last,
  output     [0:0]    io_inputs_1_rsp_payload_fragment_opcode,
  output     [11:0]   io_inputs_1_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_source,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [10:0]   io_output_cmd_payload_fragment_length,
  output     [63:0]   io_output_cmd_payload_fragment_data,
  output     [7:0]    io_output_cmd_payload_fragment_mask,
  output     [11:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_source,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [11:0]   io_output_rsp_payload_fragment_context,
  input               clk,
  input               reset
);
  wire       [0:0]    _zz_1;
  wire       [10:0]   _zz_2;
  wire       [11:0]   _zz_3;
  wire       [0:0]    _zz_4;
  reg                 _zz_5;
  wire                memory_arbiter_io_inputs_0_ready;
  wire                memory_arbiter_io_inputs_1_ready;
  wire                memory_arbiter_io_output_valid;
  wire                memory_arbiter_io_output_payload_last;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_opcode;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_address;
  wire       [10:0]   memory_arbiter_io_output_payload_fragment_length;
  wire       [63:0]   memory_arbiter_io_output_payload_fragment_data;
  wire       [7:0]    memory_arbiter_io_output_payload_fragment_mask;
  wire       [11:0]   memory_arbiter_io_output_payload_fragment_context;
  wire       [0:0]    memory_arbiter_io_chosen;
  wire       [1:0]    memory_arbiter_io_chosenOH;
  wire       [1:0]    _zz_6;
  wire       [0:0]    memory_rspSel;

  assign _zz_6 = {memory_arbiter_io_output_payload_fragment_source,memory_arbiter_io_chosen};
  EfxDMA_StreamArbiter_1 memory_arbiter (
    .io_inputs_0_valid                       (io_inputs_0_cmd_valid                                    ), //i
    .io_inputs_0_ready                       (memory_arbiter_io_inputs_0_ready                         ), //o
    .io_inputs_0_payload_last                (io_inputs_0_cmd_payload_last                             ), //i
    .io_inputs_0_payload_fragment_source     (_zz_1                                                    ), //i
    .io_inputs_0_payload_fragment_opcode     (io_inputs_0_cmd_payload_fragment_opcode                  ), //i
    .io_inputs_0_payload_fragment_address    (io_inputs_0_cmd_payload_fragment_address[31:0]           ), //i
    .io_inputs_0_payload_fragment_length     (_zz_2[10:0]                                              ), //i
    .io_inputs_0_payload_fragment_data       (io_inputs_0_cmd_payload_fragment_data[63:0]              ), //i
    .io_inputs_0_payload_fragment_mask       (io_inputs_0_cmd_payload_fragment_mask[7:0]               ), //i
    .io_inputs_0_payload_fragment_context    (_zz_3[11:0]                                              ), //i
    .io_inputs_1_valid                       (io_inputs_1_cmd_valid                                    ), //i
    .io_inputs_1_ready                       (memory_arbiter_io_inputs_1_ready                         ), //o
    .io_inputs_1_payload_last                (io_inputs_1_cmd_payload_last                             ), //i
    .io_inputs_1_payload_fragment_source     (_zz_4                                                    ), //i
    .io_inputs_1_payload_fragment_opcode     (io_inputs_1_cmd_payload_fragment_opcode                  ), //i
    .io_inputs_1_payload_fragment_address    (io_inputs_1_cmd_payload_fragment_address[31:0]           ), //i
    .io_inputs_1_payload_fragment_length     (io_inputs_1_cmd_payload_fragment_length[10:0]            ), //i
    .io_inputs_1_payload_fragment_data       (io_inputs_1_cmd_payload_fragment_data[63:0]              ), //i
    .io_inputs_1_payload_fragment_mask       (io_inputs_1_cmd_payload_fragment_mask[7:0]               ), //i
    .io_inputs_1_payload_fragment_context    (io_inputs_1_cmd_payload_fragment_context[11:0]           ), //i
    .io_output_valid                         (memory_arbiter_io_output_valid                           ), //o
    .io_output_ready                         (io_output_cmd_ready                                      ), //i
    .io_output_payload_last                  (memory_arbiter_io_output_payload_last                    ), //o
    .io_output_payload_fragment_source       (memory_arbiter_io_output_payload_fragment_source         ), //o
    .io_output_payload_fragment_opcode       (memory_arbiter_io_output_payload_fragment_opcode         ), //o
    .io_output_payload_fragment_address      (memory_arbiter_io_output_payload_fragment_address[31:0]  ), //o
    .io_output_payload_fragment_length       (memory_arbiter_io_output_payload_fragment_length[10:0]   ), //o
    .io_output_payload_fragment_data         (memory_arbiter_io_output_payload_fragment_data[63:0]     ), //o
    .io_output_payload_fragment_mask         (memory_arbiter_io_output_payload_fragment_mask[7:0]      ), //o
    .io_output_payload_fragment_context      (memory_arbiter_io_output_payload_fragment_context[11:0]  ), //o
    .io_chosen                               (memory_arbiter_io_chosen                                 ), //o
    .io_chosenOH                             (memory_arbiter_io_chosenOH[1:0]                          ), //o
    .clk                                     (clk                                                      ), //i
    .reset                                   (reset                                                    )  //i
  );
  always @(*) begin
    case(memory_rspSel)
      1'b0 : begin
        _zz_5 = io_inputs_0_rsp_ready;
      end
      default : begin
        _zz_5 = io_inputs_1_rsp_ready;
      end
    endcase
  end

  assign io_inputs_0_cmd_ready = memory_arbiter_io_inputs_0_ready;
  assign _zz_1 = 1'b0;
  assign _zz_2 = {9'd0, io_inputs_0_cmd_payload_fragment_length};
  assign _zz_3 = {11'd0, io_inputs_0_cmd_payload_fragment_context};
  assign io_inputs_1_cmd_ready = memory_arbiter_io_inputs_1_ready;
  assign _zz_4 = 1'b0;
  assign io_output_cmd_valid = memory_arbiter_io_output_valid;
  assign io_output_cmd_payload_last = memory_arbiter_io_output_payload_last;
  assign io_output_cmd_payload_fragment_opcode = memory_arbiter_io_output_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = memory_arbiter_io_output_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = memory_arbiter_io_output_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = memory_arbiter_io_output_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = memory_arbiter_io_output_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = memory_arbiter_io_output_payload_fragment_context;
  assign io_output_cmd_payload_fragment_source = _zz_6[0:0];
  assign memory_rspSel = io_output_rsp_payload_fragment_source[0 : 0];
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b0));
  assign io_inputs_0_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_0_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_0_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context[0:0];
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b1));
  assign io_inputs_1_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_1_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_1_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  assign io_output_rsp_ready = _zz_5;

endmodule

module EfxDMA_BmbArbiter (
  input               io_inputs_0_cmd_valid,
  output              io_inputs_0_cmd_ready,
  input               io_inputs_0_cmd_payload_last,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_opcode,
  input      [31:0]   io_inputs_0_cmd_payload_fragment_address,
  input      [4:0]    io_inputs_0_cmd_payload_fragment_length,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_context,
  output              io_inputs_0_rsp_valid,
  input               io_inputs_0_rsp_ready,
  output              io_inputs_0_rsp_payload_last,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_opcode,
  output     [63:0]   io_inputs_0_rsp_payload_fragment_data,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_context,
  input               io_inputs_1_cmd_valid,
  output              io_inputs_1_cmd_ready,
  input               io_inputs_1_cmd_payload_last,
  input      [0:0]    io_inputs_1_cmd_payload_fragment_opcode,
  input      [31:0]   io_inputs_1_cmd_payload_fragment_address,
  input      [10:0]   io_inputs_1_cmd_payload_fragment_length,
  input      [17:0]   io_inputs_1_cmd_payload_fragment_context,
  output              io_inputs_1_rsp_valid,
  input               io_inputs_1_rsp_ready,
  output              io_inputs_1_rsp_payload_last,
  output     [0:0]    io_inputs_1_rsp_payload_fragment_opcode,
  output     [63:0]   io_inputs_1_rsp_payload_fragment_data,
  output     [17:0]   io_inputs_1_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_source,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [10:0]   io_output_cmd_payload_fragment_length,
  output     [17:0]   io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_source,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [63:0]   io_output_rsp_payload_fragment_data,
  input      [17:0]   io_output_rsp_payload_fragment_context,
  input               clk,
  input               reset
);
  wire       [0:0]    _zz_1;
  wire       [10:0]   _zz_2;
  wire       [17:0]   _zz_3;
  wire       [0:0]    _zz_4;
  reg                 _zz_5;
  wire                memory_arbiter_io_inputs_0_ready;
  wire                memory_arbiter_io_inputs_1_ready;
  wire                memory_arbiter_io_output_valid;
  wire                memory_arbiter_io_output_payload_last;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_opcode;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_address;
  wire       [10:0]   memory_arbiter_io_output_payload_fragment_length;
  wire       [17:0]   memory_arbiter_io_output_payload_fragment_context;
  wire       [0:0]    memory_arbiter_io_chosen;
  wire       [1:0]    memory_arbiter_io_chosenOH;
  wire       [1:0]    _zz_6;
  wire       [0:0]    memory_rspSel;

  assign _zz_6 = {memory_arbiter_io_output_payload_fragment_source,memory_arbiter_io_chosen};
  EfxDMA_StreamArbiter memory_arbiter (
    .io_inputs_0_valid                       (io_inputs_0_cmd_valid                                    ), //i
    .io_inputs_0_ready                       (memory_arbiter_io_inputs_0_ready                         ), //o
    .io_inputs_0_payload_last                (io_inputs_0_cmd_payload_last                             ), //i
    .io_inputs_0_payload_fragment_source     (_zz_1                                                    ), //i
    .io_inputs_0_payload_fragment_opcode     (io_inputs_0_cmd_payload_fragment_opcode                  ), //i
    .io_inputs_0_payload_fragment_address    (io_inputs_0_cmd_payload_fragment_address[31:0]           ), //i
    .io_inputs_0_payload_fragment_length     (_zz_2[10:0]                                              ), //i
    .io_inputs_0_payload_fragment_context    (_zz_3[17:0]                                              ), //i
    .io_inputs_1_valid                       (io_inputs_1_cmd_valid                                    ), //i
    .io_inputs_1_ready                       (memory_arbiter_io_inputs_1_ready                         ), //o
    .io_inputs_1_payload_last                (io_inputs_1_cmd_payload_last                             ), //i
    .io_inputs_1_payload_fragment_source     (_zz_4                                                    ), //i
    .io_inputs_1_payload_fragment_opcode     (io_inputs_1_cmd_payload_fragment_opcode                  ), //i
    .io_inputs_1_payload_fragment_address    (io_inputs_1_cmd_payload_fragment_address[31:0]           ), //i
    .io_inputs_1_payload_fragment_length     (io_inputs_1_cmd_payload_fragment_length[10:0]            ), //i
    .io_inputs_1_payload_fragment_context    (io_inputs_1_cmd_payload_fragment_context[17:0]           ), //i
    .io_output_valid                         (memory_arbiter_io_output_valid                           ), //o
    .io_output_ready                         (io_output_cmd_ready                                      ), //i
    .io_output_payload_last                  (memory_arbiter_io_output_payload_last                    ), //o
    .io_output_payload_fragment_source       (memory_arbiter_io_output_payload_fragment_source         ), //o
    .io_output_payload_fragment_opcode       (memory_arbiter_io_output_payload_fragment_opcode         ), //o
    .io_output_payload_fragment_address      (memory_arbiter_io_output_payload_fragment_address[31:0]  ), //o
    .io_output_payload_fragment_length       (memory_arbiter_io_output_payload_fragment_length[10:0]   ), //o
    .io_output_payload_fragment_context      (memory_arbiter_io_output_payload_fragment_context[17:0]  ), //o
    .io_chosen                               (memory_arbiter_io_chosen                                 ), //o
    .io_chosenOH                             (memory_arbiter_io_chosenOH[1:0]                          ), //o
    .clk                                     (clk                                                      ), //i
    .reset                                   (reset                                                    )  //i
  );
  always @(*) begin
    case(memory_rspSel)
      1'b0 : begin
        _zz_5 = io_inputs_0_rsp_ready;
      end
      default : begin
        _zz_5 = io_inputs_1_rsp_ready;
      end
    endcase
  end

  assign io_inputs_0_cmd_ready = memory_arbiter_io_inputs_0_ready;
  assign _zz_1 = 1'b0;
  assign _zz_2 = {6'd0, io_inputs_0_cmd_payload_fragment_length};
  assign _zz_3 = {17'd0, io_inputs_0_cmd_payload_fragment_context};
  assign io_inputs_1_cmd_ready = memory_arbiter_io_inputs_1_ready;
  assign _zz_4 = 1'b0;
  assign io_output_cmd_valid = memory_arbiter_io_output_valid;
  assign io_output_cmd_payload_last = memory_arbiter_io_output_payload_last;
  assign io_output_cmd_payload_fragment_opcode = memory_arbiter_io_output_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = memory_arbiter_io_output_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = memory_arbiter_io_output_payload_fragment_length;
  assign io_output_cmd_payload_fragment_context = memory_arbiter_io_output_payload_fragment_context;
  assign io_output_cmd_payload_fragment_source = _zz_6[0:0];
  assign memory_rspSel = io_output_rsp_payload_fragment_source[0 : 0];
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b0));
  assign io_inputs_0_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_0_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_0_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_0_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context[0:0];
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && (memory_rspSel == 1'b1));
  assign io_inputs_1_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_1_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_1_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_1_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  assign io_output_rsp_ready = _zz_5;

endmodule

module EfxDMA_Core (
  output              io_sgRead_cmd_valid,
  input               io_sgRead_cmd_ready,
  output              io_sgRead_cmd_payload_last,
  output     [0:0]    io_sgRead_cmd_payload_fragment_opcode,
  output     [31:0]   io_sgRead_cmd_payload_fragment_address,
  output     [4:0]    io_sgRead_cmd_payload_fragment_length,
  output     [0:0]    io_sgRead_cmd_payload_fragment_context,
  input               io_sgRead_rsp_valid,
  output              io_sgRead_rsp_ready,
  input               io_sgRead_rsp_payload_last,
  input      [0:0]    io_sgRead_rsp_payload_fragment_opcode,
  input      [63:0]   io_sgRead_rsp_payload_fragment_data,
  input      [0:0]    io_sgRead_rsp_payload_fragment_context,
  output              io_sgWrite_cmd_valid,
  input               io_sgWrite_cmd_ready,
  output              io_sgWrite_cmd_payload_last,
  output     [0:0]    io_sgWrite_cmd_payload_fragment_opcode,
  output     [31:0]   io_sgWrite_cmd_payload_fragment_address,
  output     [1:0]    io_sgWrite_cmd_payload_fragment_length,
  output reg [63:0]   io_sgWrite_cmd_payload_fragment_data,
  output reg [7:0]    io_sgWrite_cmd_payload_fragment_mask,
  output     [0:0]    io_sgWrite_cmd_payload_fragment_context,
  input               io_sgWrite_rsp_valid,
  output              io_sgWrite_rsp_ready,
  input               io_sgWrite_rsp_payload_last,
  input      [0:0]    io_sgWrite_rsp_payload_fragment_opcode,
  input      [0:0]    io_sgWrite_rsp_payload_fragment_context,
  output reg          io_read_cmd_valid,
  input               io_read_cmd_ready,
  output              io_read_cmd_payload_last,
  output     [0:0]    io_read_cmd_payload_fragment_opcode,
  output     [31:0]   io_read_cmd_payload_fragment_address,
  output     [10:0]   io_read_cmd_payload_fragment_length,
  output     [17:0]   io_read_cmd_payload_fragment_context,
  input               io_read_rsp_valid,
  output              io_read_rsp_ready,
  input               io_read_rsp_payload_last,
  input      [0:0]    io_read_rsp_payload_fragment_opcode,
  input      [63:0]   io_read_rsp_payload_fragment_data,
  input      [17:0]   io_read_rsp_payload_fragment_context,
  output              io_write_cmd_valid,
  input               io_write_cmd_ready,
  output              io_write_cmd_payload_last,
  output     [0:0]    io_write_cmd_payload_fragment_opcode,
  output     [31:0]   io_write_cmd_payload_fragment_address,
  output     [10:0]   io_write_cmd_payload_fragment_length,
  output     [63:0]   io_write_cmd_payload_fragment_data,
  output     [7:0]    io_write_cmd_payload_fragment_mask,
  output     [11:0]   io_write_cmd_payload_fragment_context,
  input               io_write_rsp_valid,
  output              io_write_rsp_ready,
  input               io_write_rsp_payload_last,
  input      [0:0]    io_write_rsp_payload_fragment_opcode,
  input      [11:0]   io_write_rsp_payload_fragment_context,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [31:0]   io_outputs_0_payload_data,
  output     [3:0]    io_outputs_0_payload_mask,
  output     [3:0]    io_outputs_0_payload_sink,
  output              io_outputs_0_payload_last,
  input               io_inputs_0_valid,
  output reg          io_inputs_0_ready,
  input      [31:0]   io_inputs_0_payload_data,
  input      [3:0]    io_inputs_0_payload_mask,
  input      [3:0]    io_inputs_0_payload_sink,
  input               io_inputs_0_payload_last,
  output reg [1:0]    io_interrupts,
  input      [13:0]   io_ctrl_PADDR,
  input      [0:0]    io_ctrl_PSEL,
  input               io_ctrl_PENABLE,
  output              io_ctrl_PREADY,
  input               io_ctrl_PWRITE,
  input      [31:0]   io_ctrl_PWDATA,
  output reg [31:0]   io_ctrl_PRDATA,
  output              io_ctrl_PSLVERROR,
  input               clk,
  input               reset
);
  wire       [9:0]    _zz_58;
  wire       [5:0]    _zz_59;
  wire       [9:0]    _zz_60;
  reg        [7:0]    _zz_61;
  wire       [5:0]    _zz_62;
  wire                _zz_63;
  wire       [9:0]    _zz_64;
  wire       [2:0]    _zz_65;
  wire       [9:0]    _zz_66;
  wire       [11:0]   _zz_67;
  wire                _zz_68;
  wire       [7:0]    _zz_69;
  wire                _zz_70;
  wire                _zz_71;
  wire       [2:0]    _zz_72;
  reg        [2:0]    _zz_73;
  reg        [2:0]    _zz_74;
  reg        [0:0]    _zz_75;
  reg        [0:0]    _zz_76;
  wire                memory_core_io_writes_0_cmd_ready;
  wire                memory_core_io_writes_0_rsp_valid;
  wire       [5:0]    memory_core_io_writes_0_rsp_payload_context;
  wire                memory_core_io_writes_1_cmd_ready;
  wire                memory_core_io_writes_1_rsp_valid;
  wire       [5:0]    memory_core_io_writes_1_rsp_payload_context;
  wire                memory_core_io_reads_0_cmd_ready;
  wire                memory_core_io_reads_0_rsp_valid;
  wire       [31:0]   memory_core_io_reads_0_rsp_payload_data;
  wire       [3:0]    memory_core_io_reads_0_rsp_payload_mask;
  wire       [2:0]    memory_core_io_reads_0_rsp_payload_context;
  wire                memory_core_io_reads_1_cmd_ready;
  wire                memory_core_io_reads_1_rsp_valid;
  wire       [63:0]   memory_core_io_reads_1_rsp_payload_data;
  wire       [7:0]    memory_core_io_reads_1_rsp_payload_mask;
  wire       [11:0]   memory_core_io_reads_1_rsp_payload_context;
  wire                b2m_fsm_aggregate_engine_io_input_ready;
  wire       [63:0]   b2m_fsm_aggregate_engine_io_output_data;
  wire       [7:0]    b2m_fsm_aggregate_engine_io_output_mask;
  wire                b2m_fsm_aggregate_engine_io_output_consumed;
  wire       [2:0]    b2m_fsm_aggregate_engine_io_output_usedUntil;
  wire                _zz_77;
  wire                _zz_78;
  wire                _zz_79;
  wire                _zz_80;
  wire                _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  wire                _zz_84;
  wire                _zz_85;
  wire                _zz_86;
  wire                _zz_87;
  wire                _zz_88;
  wire                _zz_89;
  wire                _zz_90;
  wire                _zz_91;
  wire                _zz_92;
  wire                _zz_93;
  wire                _zz_94;
  wire                _zz_95;
  wire                _zz_96;
  wire       [12:0]   _zz_97;
  wire       [3:0]    _zz_98;
  wire       [0:0]    _zz_99;
  wire       [3:0]    _zz_100;
  wire       [0:0]    _zz_101;
  wire       [3:0]    _zz_102;
  wire       [8:0]    _zz_103;
  wire       [10:0]   _zz_104;
  wire       [25:0]   _zz_105;
  wire       [10:0]   _zz_106;
  wire       [26:0]   _zz_107;
  wire       [26:0]   _zz_108;
  wire       [12:0]   _zz_109;
  wire       [12:0]   _zz_110;
  wire       [12:0]   _zz_111;
  wire       [9:0]    _zz_112;
  wire       [10:0]   _zz_113;
  wire       [3:0]    _zz_114;
  wire       [0:0]    _zz_115;
  wire       [3:0]    _zz_116;
  wire       [0:0]    _zz_117;
  wire       [3:0]    _zz_118;
  wire       [26:0]   _zz_119;
  wire       [10:0]   _zz_120;
  wire       [0:0]    _zz_121;
  wire       [2:0]    _zz_122;
  wire       [0:0]    _zz_123;
  wire       [0:0]    _zz_124;
  wire       [0:0]    _zz_125;
  wire       [0:0]    _zz_126;
  wire       [1:0]    _zz_127;
  wire       [0:0]    _zz_128;
  wire       [1:0]    _zz_129;
  wire       [25:0]   _zz_130;
  wire       [25:0]   _zz_131;
  wire       [25:0]   _zz_132;
  wire       [25:0]   _zz_133;
  wire       [31:0]   _zz_134;
  wire       [31:0]   _zz_135;
  wire       [31:0]   _zz_136;
  wire       [31:0]   _zz_137;
  wire       [25:0]   _zz_138;
  wire       [25:0]   _zz_139;
  wire       [11:0]   _zz_140;
  wire       [10:0]   _zz_141;
  wire       [2:0]    _zz_142;
  wire       [10:0]   _zz_143;
  wire       [1:0]    _zz_144;
  wire       [11:0]   _zz_145;
  wire       [0:0]    _zz_146;
  wire       [0:0]    _zz_147;
  wire       [0:0]    _zz_148;
  wire       [1:0]    _zz_149;
  wire       [0:0]    _zz_150;
  wire       [1:0]    _zz_151;
  wire       [0:0]    _zz_152;
  wire       [31:0]   _zz_153;
  wire       [11:0]   _zz_154;
  wire       [26:0]   _zz_155;
  wire       [25:0]   _zz_156;
  wire       [25:0]   _zz_157;
  wire       [10:0]   _zz_158;
  wire       [25:0]   _zz_159;
  wire       [25:0]   _zz_160;
  wire       [25:0]   _zz_161;
  wire       [12:0]   _zz_162;
  wire       [12:0]   _zz_163;
  wire       [10:0]   _zz_164;
  wire       [2:0]    _zz_165;
  wire       [10:0]   _zz_166;
  wire       [10:0]   _zz_167;
  wire       [0:0]    _zz_168;
  wire       [2:0]    _zz_169;
  wire       [0:0]    _zz_170;
  wire       [0:0]    _zz_171;
  wire       [0:0]    _zz_172;
  wire       [1:0]    _zz_173;
  wire       [1:0]    _zz_174;
  wire       [0:0]    _zz_175;
  wire       [0:0]    _zz_176;
  wire       [0:0]    _zz_177;
  wire       [0:0]    _zz_178;
  wire       [0:0]    _zz_179;
  wire       [0:0]    _zz_180;
  wire       [0:0]    _zz_181;
  wire       [0:0]    _zz_182;
  wire       [0:0]    _zz_183;
  wire       [0:0]    _zz_184;
  wire       [0:0]    _zz_185;
  wire       [0:0]    _zz_186;
  wire       [0:0]    _zz_187;
  wire       [0:0]    _zz_188;
  wire       [0:0]    _zz_189;
  wire       [0:0]    _zz_190;
  wire       [0:0]    _zz_191;
  wire       [0:0]    _zz_192;
  wire       [0:0]    _zz_193;
  wire       [0:0]    _zz_194;
  wire       [0:0]    _zz_195;
  wire       [0:0]    _zz_196;
  wire       [0:0]    _zz_197;
  wire       [0:0]    _zz_198;
  wire       [0:0]    _zz_199;
  wire       [0:0]    _zz_200;
  wire       [0:0]    _zz_201;
  wire       [0:0]    _zz_202;
  wire       [0:0]    _zz_203;
  wire       [0:0]    _zz_204;
  wire       [0:0]    _zz_205;
  wire       [0:0]    _zz_206;
  wire       [0:0]    _zz_207;
  wire       [31:0]   _zz_208;
  wire       [31:0]   _zz_209;
  wire       [0:0]    _zz_210;
  wire       [0:0]    _zz_211;
  wire       [0:0]    _zz_212;
  wire       [0:0]    _zz_213;
  wire       [0:0]    _zz_214;
  wire       [0:0]    _zz_215;
  wire       [0:0]    _zz_216;
  wire       [0:0]    _zz_217;
  wire       [0:0]    _zz_218;
  wire       [0:0]    _zz_219;
  wire       [31:0]   _zz_220;
  wire       [31:0]   _zz_221;
  wire       [0:0]    _zz_222;
  wire       [0:0]    _zz_223;
  wire       [0:0]    _zz_224;
  wire       [0:0]    _zz_225;
  wire       [0:0]    _zz_226;
  wire       [0:0]    _zz_227;
  wire       [1:0]    _zz_228;
  wire       [10:0]   _zz_229;
  wire       [3:0]    _zz_230;
  wire       [12:0]   _zz_231;
  wire       [3:0]    _zz_232;
  wire       [0:0]    _zz_233;
  wire       [10:0]   _zz_234;
  wire       [0:0]    _zz_235;
  wire       [10:0]   _zz_236;
  wire       [2:0]    _zz_237;
  wire       [12:0]   _zz_238;
  wire       [1:0]    _zz_239;
  wire       [10:0]   _zz_240;
  wire       [2:0]    _zz_241;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg                 channels_0_channelStart;
  reg                 channels_0_channelStop;
  reg                 channels_0_channelCompletion;
  reg                 channels_0_channelValid;
  reg                 channels_0_descriptorStart;
  reg                 channels_0_descriptorCompletion;
  reg                 channels_0_descriptorValid;
  reg        [25:0]   channels_0_bytes;
  reg        [1:0]    channels_0_priority;
  reg        [1:0]    channels_0_weight;
  reg                 channels_0_readyToStop;
  reg                 channels_0_ctrl_kick;
  reg                 channels_0_ll_sgStart;
  reg                 channels_0_ll_valid;
  reg                 channels_0_ll_head;
  reg                 channels_0_ll_justASync;
  reg                 channels_0_ll_waitDone;
  reg                 channels_0_ll_readDone;
  reg                 channels_0_ll_writeDone;
  reg                 channels_0_ll_gotDescriptorStall;
  reg                 channels_0_ll_packet;
  reg                 channels_0_ll_requireSync;
  reg        [31:0]   channels_0_ll_ptr;
  reg        [31:0]   channels_0_ll_ptrNext;
  wire                channels_0_ll_requestLl;
  reg                 channels_0_ll_descriptorUpdated;
  wire       [10:0]   channels_0_fifo_base;
  wire       [10:0]   channels_0_fifo_words;
  reg        [10:0]   channels_0_fifo_push_available;
  reg        [10:0]   channels_0_fifo_push_availableDecr;
  reg        [10:0]   channels_0_fifo_push_ptr;
  wire       [10:0]   channels_0_fifo_push_ptrWithBase;
  wire       [10:0]   channels_0_fifo_push_ptrIncr_value;
  reg        [10:0]   channels_0_fifo_pop_ptr;
  wire       [12:0]   channels_0_fifo_pop_bytes;
  wire       [10:0]   channels_0_fifo_pop_ptrWithBase;
  wire       [12:0]   channels_0_fifo_pop_bytesIncr_value;
  wire       [12:0]   channels_0_fifo_pop_bytesDecr_value;
  wire                channels_0_fifo_pop_empty;
  wire       [10:0]   channels_0_fifo_pop_ptrIncr_value;
  reg        [12:0]   channels_0_fifo_pop_withoutOverride_exposed;
  wire                channels_0_fifo_empty;
  reg                 channels_0_push_memory;
  reg        [31:0]   channels_0_push_m2b_address;
  wire       [10:0]   channels_0_push_m2b_bytePerBurst;
  reg                 channels_0_push_m2b_loadDone;
  reg        [25:0]   channels_0_push_m2b_bytesLeft;
  reg        [3:0]    channels_0_push_m2b_memPending;
  reg                 channels_0_push_m2b_memPendingIncr;
  reg                 channels_0_push_m2b_memPendingDecr;
  reg                 channels_0_push_m2b_loadRequest;
  reg                 channels_0_pop_memory;
  reg                 channels_0_pop_b2s_last;
  reg        [3:0]    channels_0_pop_b2s_sinkId;
  reg                 channels_0_pop_b2s_veryLastTrigger;
  reg                 channels_0_pop_b2s_veryLastValid;
  reg        [10:0]   channels_0_pop_b2s_veryLastPtr;
  reg                 channels_0_pop_b2s_veryLastEndPacket;
  reg                 channels_0_readyForChannelCompletion;
  reg                 _zz_1;
  wire                channels_0_s2b_full;
  reg        [10:0]   channels_0_fifo_pop_ptrIncr_value_regNext;
  reg                 channels_0_interrupts_completion_enable;
  reg                 channels_0_interrupts_completion_valid;
  reg                 channels_0_interrupts_onChannelCompletion_enable;
  reg                 channels_0_interrupts_onChannelCompletion_valid;
  reg                 channels_0_interrupts_onLinkedListUpdate_enable;
  reg                 channels_0_interrupts_onLinkedListUpdate_valid;
  reg                 channels_1_channelStart;
  reg                 channels_1_channelStop;
  reg                 channels_1_channelCompletion;
  reg                 channels_1_channelValid;
  reg                 channels_1_descriptorStart;
  reg                 channels_1_descriptorCompletion;
  reg                 channels_1_descriptorValid;
  reg        [25:0]   channels_1_bytes;
  reg        [1:0]    channels_1_priority;
  reg        [1:0]    channels_1_weight;
  reg                 channels_1_readyToStop;
  reg        [26:0]   channels_1_bytesProbe_value;
  reg                 channels_1_bytesProbe_incr_valid;
  reg        [10:0]   channels_1_bytesProbe_incr_payload;
  reg                 channels_1_ctrl_kick;
  reg                 channels_1_ll_sgStart;
  reg                 channels_1_ll_valid;
  reg                 channels_1_ll_head;
  reg                 channels_1_ll_justASync;
  reg                 channels_1_ll_waitDone;
  reg                 channels_1_ll_readDone;
  reg                 channels_1_ll_writeDone;
  reg                 channels_1_ll_gotDescriptorStall;
  reg                 channels_1_ll_packet;
  reg                 channels_1_ll_requireSync;
  reg        [31:0]   channels_1_ll_ptr;
  reg        [31:0]   channels_1_ll_ptrNext;
  wire                channels_1_ll_requestLl;
  reg                 channels_1_ll_descriptorUpdated;
  wire       [10:0]   channels_1_fifo_base;
  wire       [10:0]   channels_1_fifo_words;
  reg        [10:0]   channels_1_fifo_push_available;
  wire       [10:0]   channels_1_fifo_push_availableDecr;
  reg        [10:0]   channels_1_fifo_push_ptr;
  wire       [10:0]   channels_1_fifo_push_ptrWithBase;
  wire       [10:0]   channels_1_fifo_push_ptrIncr_value;
  reg        [10:0]   channels_1_fifo_pop_ptr;
  wire       [12:0]   channels_1_fifo_pop_bytes;
  wire       [10:0]   channels_1_fifo_pop_ptrWithBase;
  wire       [12:0]   channels_1_fifo_pop_bytesIncr_value;
  wire       [12:0]   channels_1_fifo_pop_bytesDecr_value;
  wire                channels_1_fifo_pop_empty;
  wire       [10:0]   channels_1_fifo_pop_ptrIncr_value;
  reg        [12:0]   channels_1_fifo_pop_withOverride_backup;
  wire       [12:0]   channels_1_fifo_pop_withOverride_backupNext;
  reg                 channels_1_fifo_pop_withOverride_load;
  reg                 channels_1_fifo_pop_withOverride_unload;
  reg        [12:0]   channels_1_fifo_pop_withOverride_exposed;
  reg                 channels_1_fifo_pop_withOverride_valid;
  wire                channels_1_fifo_empty;
  reg                 channels_1_push_memory;
  reg                 channels_1_push_s2b_completionOnLast;
  reg                 channels_1_push_s2b_packetEvent;
  reg                 channels_1_push_s2b_packetLock;
  reg                 channels_1_push_s2b_waitFirst;
  reg                 channels_1_pop_memory;
  wire       [10:0]   channels_1_pop_b2m_bytePerBurst;
  reg                 channels_1_pop_b2m_fire;
  reg                 channels_1_pop_b2m_waitFinalRsp;
  reg                 channels_1_pop_b2m_flush;
  reg                 channels_1_pop_b2m_packetSync;
  reg                 channels_1_pop_b2m_packet;
  reg                 channels_1_pop_b2m_memRsp;
  reg        [3:0]    channels_1_pop_b2m_memPending;
  reg        [31:0]   channels_1_pop_b2m_address;
  reg        [26:0]   channels_1_pop_b2m_bytesLeft;
  wire                channels_1_pop_b2m_request;
  reg        [2:0]    channels_1_pop_b2m_bytesToSkip;
  reg        [12:0]   channels_1_pop_b2m_decrBytes;
  reg                 channels_1_pop_b2m_memPendingInc;
  wire                channels_1_readyForChannelCompletion;
  reg                 _zz_2;
  wire                channels_1_s2b_full;
  reg        [10:0]   channels_1_fifo_pop_ptrIncr_value_regNext;
  reg                 channels_1_interrupts_completion_enable;
  reg                 channels_1_interrupts_completion_valid;
  reg                 channels_1_interrupts_onChannelCompletion_enable;
  reg                 channels_1_interrupts_onChannelCompletion_valid;
  reg                 channels_1_interrupts_onLinkedListUpdate_enable;
  reg                 channels_1_interrupts_onLinkedListUpdate_valid;
  reg                 channels_1_interrupts_s2mPacket_enable;
  reg                 channels_1_interrupts_s2mPacket_valid;
  reg                 io_inputs_0_payload_last_regNextWhen;
  reg                 io_inputs_0_payload_last_regNextWhen_1;
  reg                 io_inputs_0_payload_last_regNextWhen_2;
  reg                 io_inputs_0_payload_last_regNextWhen_3;
  reg                 io_inputs_0_payload_last_regNextWhen_4;
  reg                 io_inputs_0_payload_last_regNextWhen_5;
  reg                 io_inputs_0_payload_last_regNextWhen_6;
  reg                 io_inputs_0_payload_last_regNextWhen_7;
  reg                 io_inputs_0_payload_last_regNextWhen_8;
  reg                 io_inputs_0_payload_last_regNextWhen_9;
  reg                 io_inputs_0_payload_last_regNextWhen_10;
  reg                 io_inputs_0_payload_last_regNextWhen_11;
  reg                 io_inputs_0_payload_last_regNextWhen_12;
  reg                 io_inputs_0_payload_last_regNextWhen_13;
  reg                 io_inputs_0_payload_last_regNextWhen_14;
  reg                 io_inputs_0_payload_last_regNextWhen_15;
  reg        [15:0]   s2b_0_cmd_firsts;
  wire                s2b_0_cmd_first;
  wire       [0:0]    s2b_0_cmd_channelsOh;
  wire                s2b_0_cmd_noHit;
  wire       [0:0]    s2b_0_cmd_channelsFull;
  reg                 io_inputs_0_thrown_valid;
  wire                io_inputs_0_thrown_ready;
  wire       [31:0]   io_inputs_0_thrown_payload_data;
  wire       [3:0]    io_inputs_0_thrown_payload_mask;
  wire       [3:0]    io_inputs_0_thrown_payload_sink;
  wire                io_inputs_0_thrown_payload_last;
  wire                _zz_3;
  wire                s2b_0_cmd_sinkHalted_valid;
  wire                s2b_0_cmd_sinkHalted_ready;
  wire       [31:0]   s2b_0_cmd_sinkHalted_payload_data;
  wire       [3:0]    s2b_0_cmd_sinkHalted_payload_mask;
  wire       [3:0]    s2b_0_cmd_sinkHalted_payload_sink;
  wire                s2b_0_cmd_sinkHalted_payload_last;
  wire       [2:0]    _zz_4;
  wire       [2:0]    _zz_5;
  wire       [2:0]    _zz_6;
  wire       [2:0]    _zz_7;
  wire       [2:0]    _zz_8;
  wire       [2:0]    _zz_9;
  wire       [2:0]    _zz_10;
  wire       [2:0]    _zz_11;
  wire       [2:0]    s2b_0_cmd_byteCount;
  wire       [0:0]    s2b_0_cmd_context_channel;
  wire       [2:0]    s2b_0_cmd_context_bytes;
  wire                s2b_0_cmd_context_flush;
  wire                s2b_0_cmd_context_packet;
  wire                _zz_12;
  wire       [0:0]    s2b_0_rsp_context_channel;
  wire       [2:0]    s2b_0_rsp_context_bytes;
  wire                s2b_0_rsp_context_flush;
  wire                s2b_0_rsp_context_packet;
  wire       [5:0]    _zz_13;
  wire                _zz_14;
  wire       [0:0]    b2s_0_cmd_channelsOh;
  wire       [0:0]    b2s_0_cmd_context_channel;
  wire                b2s_0_cmd_context_veryLast;
  wire                b2s_0_cmd_context_endPacket;
  wire       [10:0]   b2s_0_cmd_veryLastPtr;
  wire       [10:0]   b2s_0_cmd_address;
  wire       [0:0]    b2s_0_rsp_context_channel;
  wire                b2s_0_rsp_context_veryLast;
  wire                b2s_0_rsp_context_endPacket;
  wire       [2:0]    _zz_15;
  reg                 m2b_cmd_s0_valid;
  wire       [1:0]    _zz_16;
  wire       [0:0]    m2b_cmd_s0_priority_masked;
  reg        [0:0]    m2b_cmd_s0_priority_roundRobins_0;
  reg        [0:0]    m2b_cmd_s0_priority_roundRobins_1;
  reg        [0:0]    m2b_cmd_s0_priority_roundRobins_2;
  reg        [0:0]    m2b_cmd_s0_priority_roundRobins_3;
  reg        [1:0]    m2b_cmd_s0_priority_counter;
  wire       [0:0]    _zz_17;
  wire       [1:0]    _zz_18;
  wire       [1:0]    _zz_19;
  wire       [0:0]    m2b_cmd_s0_priority_chosenOh;
  wire                m2b_cmd_s0_priority_weightLast;
  wire       [0:0]    m2b_cmd_s0_priority_contextNext;
  wire       [31:0]   m2b_cmd_s0_address;
  wire       [25:0]   m2b_cmd_s0_bytesLeft;
  wire       [10:0]   m2b_cmd_s0_readAddressBurstRange;
  wire       [10:0]   m2b_cmd_s0_lengthHead;
  wire       [10:0]   m2b_cmd_s0_length;
  wire                m2b_cmd_s0_lastBurst;
  reg                 m2b_cmd_s1_valid;
  reg        [31:0]   m2b_cmd_s1_address;
  reg        [10:0]   m2b_cmd_s1_length;
  reg                 m2b_cmd_s1_lastBurst;
  reg        [25:0]   m2b_cmd_s1_bytesLeft;
  wire       [2:0]    m2b_cmd_s1_context_start;
  wire       [2:0]    m2b_cmd_s1_context_stop;
  wire       [10:0]   m2b_cmd_s1_context_length;
  wire                m2b_cmd_s1_context_last;
  wire       [31:0]   m2b_cmd_s1_addressNext;
  wire       [25:0]   m2b_cmd_s1_byteLeftNext;
  wire       [9:0]    m2b_cmd_s1_fifoPushDecr;
  wire       [2:0]    m2b_rsp_context_start;
  wire       [2:0]    m2b_rsp_context_stop;
  wire       [10:0]   m2b_rsp_context_length;
  wire                m2b_rsp_context_last;
  wire       [17:0]   _zz_20;
  wire                m2b_rsp_veryLast;
  reg                 m2b_rsp_first;
  wire                m2b_rsp_writeContext_last;
  wire                m2b_rsp_writeContext_lastOfBurst;
  wire       [3:0]    m2b_rsp_writeContext_loadByteInNextBeat;
  wire                m2b_writeRsp_context_last;
  wire                m2b_writeRsp_context_lastOfBurst;
  wire       [3:0]    m2b_writeRsp_context_loadByteInNextBeat;
  wire       [5:0]    _zz_21;
  wire                _zz_22;
  reg                 b2m_fsm_sel_valid;
  reg                 b2m_fsm_sel_ready;
  reg        [10:0]   b2m_fsm_sel_bytePerBurst;
  reg        [10:0]   b2m_fsm_sel_bytesInBurst;
  reg        [12:0]   b2m_fsm_sel_bytesInFifo;
  reg        [31:0]   b2m_fsm_sel_address;
  reg        [10:0]   b2m_fsm_sel_ptr;
  reg        [10:0]   b2m_fsm_sel_ptrMask;
  reg                 b2m_fsm_sel_flush;
  reg                 b2m_fsm_sel_packet;
  reg        [25:0]   b2m_fsm_sel_bytesLeft;
  reg                 b2m_fsm_arbiter_logic_valid;
  wire       [1:0]    _zz_23;
  wire       [0:0]    b2m_fsm_arbiter_logic_priority_masked;
  reg        [0:0]    b2m_fsm_arbiter_logic_priority_roundRobins_0;
  reg        [0:0]    b2m_fsm_arbiter_logic_priority_roundRobins_1;
  reg        [0:0]    b2m_fsm_arbiter_logic_priority_roundRobins_2;
  reg        [0:0]    b2m_fsm_arbiter_logic_priority_roundRobins_3;
  reg        [1:0]    b2m_fsm_arbiter_logic_priority_counter;
  wire       [0:0]    _zz_24;
  wire       [1:0]    _zz_25;
  wire       [1:0]    _zz_26;
  wire       [0:0]    b2m_fsm_arbiter_logic_priority_chosenOh;
  wire                b2m_fsm_arbiter_logic_priority_weightLast;
  wire       [0:0]    b2m_fsm_arbiter_logic_priority_contextNext;
  wire       [10:0]   b2m_fsm_bytesInBurstP1;
  wire       [31:0]   b2m_fsm_addressNext;
  wire       [26:0]   b2m_fsm_bytesLeftNext;
  wire                b2m_fsm_isFinalCmd;
  reg        [7:0]    b2m_fsm_beatCounter;
  reg                 b2m_fsm_sel_valid_regNext;
  wire                b2m_fsm_s0;
  reg                 b2m_fsm_s1;
  reg                 b2m_fsm_s2;
  wire       [12:0]   _zz_27;
  wire       [25:0]   _zz_28;
  wire       [10:0]   _zz_29;
  wire                b2m_fsm_fifoCompletion;
  reg                 b2m_fsm_toggle;
  wire       [10:0]   b2m_fsm_fetch_context_ptr;
  wire                b2m_fsm_fetch_context_toggle;
  wire       [10:0]   b2m_fsm_aggregate_context_ptr;
  wire                b2m_fsm_aggregate_context_toggle;
  wire       [11:0]   _zz_30;
  wire                memory_core_io_reads_1_rsp_s2mPipe_valid;
  reg                 memory_core_io_reads_1_rsp_s2mPipe_ready;
  wire       [63:0]   memory_core_io_reads_1_rsp_s2mPipe_payload_data;
  wire       [7:0]    memory_core_io_reads_1_rsp_s2mPipe_payload_mask;
  wire       [11:0]   memory_core_io_reads_1_rsp_s2mPipe_payload_context;
  reg                 memory_core_io_reads_1_rsp_s2mPipe_rValid;
  reg        [63:0]   memory_core_io_reads_1_rsp_s2mPipe_rData_data;
  reg        [7:0]    memory_core_io_reads_1_rsp_s2mPipe_rData_mask;
  reg        [11:0]   memory_core_io_reads_1_rsp_s2mPipe_rData_context;
  reg                 b2m_fsm_aggregate_memoryPort_valid;
  wire                b2m_fsm_aggregate_memoryPort_ready;
  wire       [63:0]   b2m_fsm_aggregate_memoryPort_payload_data;
  wire       [7:0]    b2m_fsm_aggregate_memoryPort_payload_mask;
  wire       [11:0]   b2m_fsm_aggregate_memoryPort_payload_context;
  reg                 b2m_fsm_aggregate_first;
  wire       [2:0]    b2m_fsm_aggregate_bytesToSkip;
  reg        [7:0]    b2m_fsm_aggregate_bytesToSkipMask;
  reg                 _zz_31;
  wire       [2:0]    b2m_fsm_cmd_maskFirstTrigger;
  wire       [2:0]    b2m_fsm_cmd_maskLastTriggerComb;
  reg        [2:0]    b2m_fsm_cmd_maskLastTriggerReg;
  reg        [7:0]    _zz_32;
  reg        [7:0]    b2m_fsm_cmd_maskLast;
  reg        [7:0]    b2m_fsm_cmd_maskFirst;
  wire                b2m_fsm_cmd_enoughAggregation;
  reg                 io_write_cmd_payload_first;
  wire                b2m_fsm_cmd_doPtrIncr;
  wire       [10:0]   b2m_fsm_cmd_context_length;
  wire                b2m_fsm_cmd_context_doPacketSync;
  wire       [10:0]   b2m_rsp_context_length;
  wire                b2m_rsp_context_doPacketSync;
  wire       [11:0]   _zz_33;
  wire       [1:0]    _zz_34;
  wire                _zz_35;
  reg        [1:0]    _zz_36;
  wire                ll_arbiter_head;
  reg        [1:0]    _zz_37;
  wire                ll_arbiter_isJustASink;
  reg                 ll_cmd_valid;
  reg                 ll_cmd_oh_0;
  reg                 ll_cmd_oh_1;
  reg        [1:0]    _zz_38;
  reg        [31:0]   ll_cmd_ptr;
  reg        [1:0]    _zz_39;
  reg        [31:0]   ll_cmd_ptrNext;
  reg        [26:0]   ll_cmd_bytesDone;
  reg        [1:0]    _zz_40;
  reg                 ll_cmd_endOfPacket;
  reg                 ll_cmd_isJustASink;
  reg                 ll_cmd_readFired;
  reg                 ll_cmd_writeFired;
  wire       [0:0]    ll_cmd_context_channel;
  wire       [3:0]    ll_cmd_writeMaskSplit_0;
  wire       [3:0]    ll_cmd_writeMaskSplit_1;
  wire       [31:0]   ll_cmd_writeDataSplit_0;
  wire       [31:0]   ll_cmd_writeDataSplit_1;
  wire       [0:0]    ll_readRsp_context_channel;
  reg        [1:0]    _zz_41;
  wire                ll_readRsp_oh_0;
  wire                ll_readRsp_oh_1;
  reg        [1:0]    ll_readRsp_beatCounter;
  reg                 ll_readRsp_completed;
  wire       [0:0]    ll_writeRsp_context_channel;
  reg        [1:0]    _zz_42;
  wire                ll_writeRsp_oh_0;
  wire                ll_writeRsp_oh_1;
  reg                 _zz_43;
  reg                 _zz_44;
  reg                 _zz_45;
  reg                 _zz_46;
  reg                 _zz_47;
  reg                 _zz_48;
  reg                 _zz_49;
  reg                 _zz_50;
  reg                 _zz_51;
  reg                 _zz_52;
  reg                 _zz_53;
  reg                 _zz_54;
  reg                 _zz_55;
  reg                 _zz_56;
  reg                 _zz_57;
  function [7:0] zz_io_sgWrite_cmd_payload_fragment_mask(input dummy);
    begin
      zz_io_sgWrite_cmd_payload_fragment_mask[7 : 4] = 4'b0000;
      zz_io_sgWrite_cmd_payload_fragment_mask[3 : 0] = 4'b1111;
    end
  endfunction
  wire [7:0] _zz_242;

  assign _zz_77 = (((channels_0_ll_valid && channels_0_ll_waitDone) && channels_0_ll_writeDone) && channels_0_ll_readDone);
  assign _zz_78 = (! channels_0_ll_justASync);
  assign _zz_79 = (! channels_0_ll_gotDescriptorStall);
  assign _zz_80 = 1'b1;
  assign _zz_81 = (! m2b_cmd_s0_valid);
  assign _zz_82 = (((channels_1_ll_valid && channels_1_ll_waitDone) && channels_1_ll_writeDone) && channels_1_ll_readDone);
  assign _zz_83 = (! channels_1_ll_justASync);
  assign _zz_84 = (! channels_1_ll_gotDescriptorStall);
  assign _zz_85 = (channels_1_descriptorValid && (! channels_1_push_memory));
  assign _zz_86 = (io_write_rsp_valid && io_write_rsp_ready);
  assign _zz_87 = 1'b1;
  assign _zz_88 = ((! b2m_fsm_sel_valid) && b2m_fsm_arbiter_logic_valid);
  assign _zz_89 = ((channels_1_pop_b2m_memPending == 4'b0000) && (channels_1_fifo_pop_bytes == 13'h0));
  assign _zz_90 = (! b2m_fsm_arbiter_logic_valid);
  assign _zz_91 = 1'b1;
  assign _zz_92 = ((io_write_cmd_valid && io_write_cmd_ready) && io_write_cmd_payload_last);
  assign _zz_93 = (b2m_fsm_aggregate_context_toggle != b2m_fsm_toggle);
  assign _zz_94 = (_zz_68 && (! memory_core_io_reads_1_rsp_s2mPipe_ready));
  assign _zz_95 = (! ll_cmd_valid);
  assign _zz_96 = (io_sgRead_rsp_valid && io_sgRead_rsp_ready);
  assign _zz_97 = (channels_0_fifo_pop_withoutOverride_exposed + channels_0_fifo_pop_bytesIncr_value);
  assign _zz_98 = (channels_0_push_m2b_memPending + _zz_100);
  assign _zz_99 = channels_0_push_m2b_memPendingIncr;
  assign _zz_100 = {3'd0, _zz_99};
  assign _zz_101 = channels_0_push_m2b_memPendingDecr;
  assign _zz_102 = {3'd0, _zz_101};
  assign _zz_103 = (channels_0_push_m2b_bytePerBurst >>> 2);
  assign _zz_104 = {2'd0, _zz_103};
  assign _zz_105 = {15'd0, channels_0_push_m2b_bytePerBurst};
  assign _zz_106 = (channels_0_fifo_push_available + channels_0_fifo_pop_ptrIncr_value_regNext);
  assign _zz_107 = (channels_1_bytesProbe_value + _zz_108);
  assign _zz_108 = {16'd0, channels_1_bytesProbe_incr_payload};
  assign _zz_109 = (channels_1_fifo_pop_withOverride_backup + channels_1_fifo_pop_bytesIncr_value);
  assign _zz_110 = (channels_1_fifo_pop_withOverride_exposed - channels_1_fifo_pop_bytesDecr_value);
  assign _zz_111 = {2'd0, channels_1_pop_b2m_bytePerBurst};
  assign _zz_112 = (channels_1_fifo_words >>> 1);
  assign _zz_113 = {1'd0, _zz_112};
  assign _zz_114 = (channels_1_pop_b2m_memPending + _zz_116);
  assign _zz_115 = channels_1_pop_b2m_memPendingInc;
  assign _zz_116 = {3'd0, _zz_115};
  assign _zz_117 = channels_1_pop_b2m_memRsp;
  assign _zz_118 = {3'd0, _zz_117};
  assign _zz_119 = {14'd0, channels_1_fifo_pop_bytes};
  assign _zz_120 = (channels_1_fifo_push_available + channels_1_fifo_pop_ptrIncr_value_regNext);
  assign _zz_121 = s2b_0_cmd_sinkHalted_payload_mask[3];
  assign _zz_122 = {2'd0, _zz_121};
  assign _zz_123 = _zz_13[4 : 4];
  assign _zz_124 = _zz_13[5 : 5];
  assign _zz_125 = _zz_15[1 : 1];
  assign _zz_126 = _zz_15[2 : 2];
  assign _zz_127 = (_zz_18 - _zz_129);
  assign _zz_128 = _zz_75;
  assign _zz_129 = {1'd0, _zz_128};
  assign _zz_130 = ((_zz_131 < m2b_cmd_s0_bytesLeft) ? _zz_132 : m2b_cmd_s0_bytesLeft);
  assign _zz_131 = {15'd0, m2b_cmd_s0_lengthHead};
  assign _zz_132 = {15'd0, m2b_cmd_s0_lengthHead};
  assign _zz_133 = {15'd0, m2b_cmd_s0_length};
  assign _zz_134 = (m2b_cmd_s1_address + _zz_135);
  assign _zz_135 = {21'd0, m2b_cmd_s1_length};
  assign _zz_136 = (m2b_cmd_s1_address + _zz_137);
  assign _zz_137 = {21'd0, m2b_cmd_s1_length};
  assign _zz_138 = (m2b_cmd_s1_bytesLeft - _zz_139);
  assign _zz_139 = {15'd0, m2b_cmd_s1_length};
  assign _zz_140 = ({1'b0,(_zz_141 | 11'h007)} + _zz_145);
  assign _zz_141 = (_zz_143 + io_read_cmd_payload_fragment_length);
  assign _zz_142 = m2b_cmd_s1_address[2 : 0];
  assign _zz_143 = {8'd0, _zz_142};
  assign _zz_144 = {1'b0,1'b1};
  assign _zz_145 = {10'd0, _zz_144};
  assign _zz_146 = _zz_20[17 : 17];
  assign _zz_147 = _zz_21[0 : 0];
  assign _zz_148 = _zz_21[1 : 1];
  assign _zz_149 = (_zz_25 - _zz_151);
  assign _zz_150 = _zz_76;
  assign _zz_151 = {1'd0, _zz_150};
  assign _zz_152 = 1'b1;
  assign _zz_153 = {21'd0, b2m_fsm_bytesInBurstP1};
  assign _zz_154 = {1'b0,b2m_fsm_bytesInBurstP1};
  assign _zz_155 = {15'd0, _zz_154};
  assign _zz_156 = {13'd0, _zz_27};
  assign _zz_157 = {13'd0, _zz_27};
  assign _zz_158 = b2m_fsm_sel_address[10:0];
  assign _zz_159 = ((_zz_28 < _zz_160) ? _zz_28 : _zz_161);
  assign _zz_160 = {15'd0, _zz_29};
  assign _zz_161 = {15'd0, _zz_29};
  assign _zz_162 = {2'd0, b2m_fsm_sel_bytesInBurst};
  assign _zz_163 = (b2m_fsm_sel_bytesInFifo - 13'h0001);
  assign _zz_164 = (_zz_166 + b2m_fsm_sel_bytesInBurst);
  assign _zz_165 = b2m_fsm_sel_address[2 : 0];
  assign _zz_166 = {8'd0, _zz_165};
  assign _zz_167 = (b2m_fsm_sel_ptr + 11'h002);
  assign _zz_168 = _zz_30[11 : 11];
  assign _zz_169 = b2m_fsm_sel_bytesInBurst[2:0];
  assign _zz_170 = 1'b1;
  assign _zz_171 = _zz_33[11 : 11];
  assign _zz_172 = 1'b1;
  assign _zz_173 = (_zz_34 & (~ _zz_174));
  assign _zz_174 = (_zz_34 - 2'b01);
  assign _zz_175 = io_sgRead_rsp_payload_fragment_data[62 : 62];
  assign _zz_176 = io_sgRead_rsp_payload_fragment_data[31 : 31];
  assign _zz_177 = io_sgRead_rsp_payload_fragment_data[31 : 31];
  assign _zz_178 = io_ctrl_PWDATA[0 : 0];
  assign _zz_179 = 1'b1;
  assign _zz_180 = io_ctrl_PWDATA[0 : 0];
  assign _zz_181 = 1'b1;
  assign _zz_182 = io_ctrl_PWDATA[4 : 4];
  assign _zz_183 = 1'b1;
  assign _zz_184 = io_ctrl_PWDATA[4 : 4];
  assign _zz_185 = 1'b1;
  assign _zz_186 = io_ctrl_PWDATA[0 : 0];
  assign _zz_187 = 1'b0;
  assign _zz_188 = io_ctrl_PWDATA[2 : 2];
  assign _zz_189 = 1'b0;
  assign _zz_190 = io_ctrl_PWDATA[3 : 3];
  assign _zz_191 = 1'b0;
  assign _zz_192 = io_ctrl_PWDATA[0 : 0];
  assign _zz_193 = 1'b1;
  assign _zz_194 = io_ctrl_PWDATA[0 : 0];
  assign _zz_195 = 1'b1;
  assign _zz_196 = io_ctrl_PWDATA[4 : 4];
  assign _zz_197 = 1'b1;
  assign _zz_198 = io_ctrl_PWDATA[4 : 4];
  assign _zz_199 = 1'b1;
  assign _zz_200 = io_ctrl_PWDATA[0 : 0];
  assign _zz_201 = 1'b0;
  assign _zz_202 = io_ctrl_PWDATA[2 : 2];
  assign _zz_203 = 1'b0;
  assign _zz_204 = io_ctrl_PWDATA[3 : 3];
  assign _zz_205 = 1'b0;
  assign _zz_206 = io_ctrl_PWDATA[4 : 4];
  assign _zz_207 = 1'b0;
  assign _zz_208 = io_ctrl_PWDATA[31 : 0];
  assign _zz_209 = _zz_208;
  assign _zz_210 = io_ctrl_PWDATA[12 : 12];
  assign _zz_211 = io_ctrl_PWDATA[12 : 12];
  assign _zz_212 = io_ctrl_PWDATA[13 : 13];
  assign _zz_213 = io_ctrl_PWDATA[2 : 2];
  assign _zz_214 = io_ctrl_PWDATA[0 : 0];
  assign _zz_215 = io_ctrl_PWDATA[2 : 2];
  assign _zz_216 = io_ctrl_PWDATA[3 : 3];
  assign _zz_217 = io_ctrl_PWDATA[12 : 12];
  assign _zz_218 = io_ctrl_PWDATA[13 : 13];
  assign _zz_219 = io_ctrl_PWDATA[14 : 14];
  assign _zz_220 = io_ctrl_PWDATA[31 : 0];
  assign _zz_221 = _zz_220;
  assign _zz_222 = io_ctrl_PWDATA[12 : 12];
  assign _zz_223 = io_ctrl_PWDATA[2 : 2];
  assign _zz_224 = io_ctrl_PWDATA[0 : 0];
  assign _zz_225 = io_ctrl_PWDATA[2 : 2];
  assign _zz_226 = io_ctrl_PWDATA[3 : 3];
  assign _zz_227 = io_ctrl_PWDATA[4 : 4];
  assign _zz_228 = (((io_read_rsp_valid && memory_core_io_writes_1_cmd_ready) && 1'b1) ? 2'b10 : 2'b00);
  assign _zz_229 = {9'd0, _zz_228};
  assign _zz_230 = (_zz_22 ? _zz_232 : 4'b0000);
  assign _zz_231 = {9'd0, _zz_230};
  assign _zz_232 = (m2b_writeRsp_context_loadByteInNextBeat + 4'b0001);
  assign _zz_233 = ((b2s_0_cmd_channelsOh[0] && memory_core_io_reads_0_cmd_ready) ? 1'b1 : 1'b0);
  assign _zz_234 = {10'd0, _zz_233};
  assign _zz_235 = ((_zz_12 && (s2b_0_cmd_sinkHalted_payload_mask != 4'b0000)) ? 1'b1 : 1'b0);
  assign _zz_236 = {10'd0, _zz_235};
  assign _zz_237 = (_zz_14 ? s2b_0_rsp_context_bytes : 3'b000);
  assign _zz_238 = {10'd0, _zz_237};
  assign _zz_239 = ((b2m_fsm_cmd_doPtrIncr && 1'b1) ? 2'b10 : 2'b00);
  assign _zz_240 = {9'd0, _zz_239};
  assign _zz_241 = {s2b_0_cmd_sinkHalted_payload_mask[2],{s2b_0_cmd_sinkHalted_payload_mask[1],s2b_0_cmd_sinkHalted_payload_mask[0]}};
  EfxDMA_DmaMemoryCore memory_core (
    .io_writes_0_cmd_valid               (s2b_0_cmd_sinkHalted_valid                        ), //i
    .io_writes_0_cmd_ready               (memory_core_io_writes_0_cmd_ready                 ), //o
    .io_writes_0_cmd_payload_address     (_zz_58[9:0]                                       ), //i
    .io_writes_0_cmd_payload_data        (s2b_0_cmd_sinkHalted_payload_data[31:0]           ), //i
    .io_writes_0_cmd_payload_mask        (s2b_0_cmd_sinkHalted_payload_mask[3:0]            ), //i
    .io_writes_0_cmd_payload_priority    (channels_1_priority[1:0]                          ), //i
    .io_writes_0_cmd_payload_context     (_zz_59[5:0]                                       ), //i
    .io_writes_0_rsp_valid               (memory_core_io_writes_0_rsp_valid                 ), //o
    .io_writes_0_rsp_payload_context     (memory_core_io_writes_0_rsp_payload_context[5:0]  ), //o
    .io_writes_1_cmd_valid               (io_read_rsp_valid                                 ), //i
    .io_writes_1_cmd_ready               (memory_core_io_writes_1_cmd_ready                 ), //o
    .io_writes_1_cmd_payload_address     (_zz_60[9:0]                                       ), //i
    .io_writes_1_cmd_payload_data        (io_read_rsp_payload_fragment_data[63:0]           ), //i
    .io_writes_1_cmd_payload_mask        (_zz_61[7:0]                                       ), //i
    .io_writes_1_cmd_payload_context     (_zz_62[5:0]                                       ), //i
    .io_writes_1_rsp_valid               (memory_core_io_writes_1_rsp_valid                 ), //o
    .io_writes_1_rsp_payload_context     (memory_core_io_writes_1_rsp_payload_context[5:0]  ), //o
    .io_reads_0_cmd_valid                (_zz_63                                            ), //i
    .io_reads_0_cmd_ready                (memory_core_io_reads_0_cmd_ready                  ), //o
    .io_reads_0_cmd_payload_address      (_zz_64[9:0]                                       ), //i
    .io_reads_0_cmd_payload_priority     (channels_0_priority[1:0]                          ), //i
    .io_reads_0_cmd_payload_context      (_zz_65[2:0]                                       ), //i
    .io_reads_0_rsp_valid                (memory_core_io_reads_0_rsp_valid                  ), //o
    .io_reads_0_rsp_ready                (io_outputs_0_ready                                ), //i
    .io_reads_0_rsp_payload_data         (memory_core_io_reads_0_rsp_payload_data[31:0]     ), //o
    .io_reads_0_rsp_payload_mask         (memory_core_io_reads_0_rsp_payload_mask[3:0]      ), //o
    .io_reads_0_rsp_payload_context      (memory_core_io_reads_0_rsp_payload_context[2:0]   ), //o
    .io_reads_1_cmd_valid                (b2m_fsm_sel_valid                                 ), //i
    .io_reads_1_cmd_ready                (memory_core_io_reads_1_cmd_ready                  ), //o
    .io_reads_1_cmd_payload_address      (_zz_66[9:0]                                       ), //i
    .io_reads_1_cmd_payload_context      (_zz_67[11:0]                                      ), //i
    .io_reads_1_rsp_valid                (memory_core_io_reads_1_rsp_valid                  ), //o
    .io_reads_1_rsp_ready                (_zz_68                                            ), //i
    .io_reads_1_rsp_payload_data         (memory_core_io_reads_1_rsp_payload_data[63:0]     ), //o
    .io_reads_1_rsp_payload_mask         (memory_core_io_reads_1_rsp_payload_mask[7:0]      ), //o
    .io_reads_1_rsp_payload_context      (memory_core_io_reads_1_rsp_payload_context[11:0]  ), //o
    .clk                                 (clk                                               ), //i
    .reset                               (reset                                             )  //i
  );
  EfxDMA_Aggregator b2m_fsm_aggregate_engine (
    .io_input_valid            (b2m_fsm_aggregate_memoryPort_valid                 ), //i
    .io_input_ready            (b2m_fsm_aggregate_engine_io_input_ready            ), //o
    .io_input_payload_data     (b2m_fsm_aggregate_memoryPort_payload_data[63:0]    ), //i
    .io_input_payload_mask     (_zz_69[7:0]                                        ), //i
    .io_output_data            (b2m_fsm_aggregate_engine_io_output_data[63:0]      ), //o
    .io_output_mask            (b2m_fsm_aggregate_engine_io_output_mask[7:0]       ), //o
    .io_output_enough          (b2m_fsm_cmd_enoughAggregation                      ), //i
    .io_output_consume         (_zz_70                                             ), //i
    .io_output_consumed        (b2m_fsm_aggregate_engine_io_output_consumed        ), //o
    .io_output_lastByteUsed    (b2m_fsm_cmd_maskLastTriggerReg[2:0]                ), //i
    .io_output_usedUntil       (b2m_fsm_aggregate_engine_io_output_usedUntil[2:0]  ), //o
    .io_flush                  (_zz_71                                             ), //i
    .io_offset                 (_zz_72[2:0]                                        ), //i
    .io_burstLength            (b2m_fsm_sel_bytesInBurst[10:0]                     ), //i
    .clk                       (clk                                                ), //i
    .reset                     (reset                                              )  //i
  );
  always @(*) begin
    case(_zz_241)
      3'b000 : begin
        _zz_73 = _zz_4;
      end
      3'b001 : begin
        _zz_73 = _zz_5;
      end
      3'b010 : begin
        _zz_73 = _zz_6;
      end
      3'b011 : begin
        _zz_73 = _zz_7;
      end
      3'b100 : begin
        _zz_73 = _zz_8;
      end
      3'b101 : begin
        _zz_73 = _zz_9;
      end
      3'b110 : begin
        _zz_73 = _zz_10;
      end
      default : begin
        _zz_73 = _zz_11;
      end
    endcase
  end

  always @(*) begin
    case(_zz_122)
      3'b000 : begin
        _zz_74 = _zz_4;
      end
      3'b001 : begin
        _zz_74 = _zz_5;
      end
      3'b010 : begin
        _zz_74 = _zz_6;
      end
      3'b011 : begin
        _zz_74 = _zz_7;
      end
      3'b100 : begin
        _zz_74 = _zz_8;
      end
      3'b101 : begin
        _zz_74 = _zz_9;
      end
      3'b110 : begin
        _zz_74 = _zz_10;
      end
      default : begin
        _zz_74 = _zz_11;
      end
    endcase
  end

  always @(*) begin
    case(_zz_16)
      2'b00 : begin
        _zz_75 = m2b_cmd_s0_priority_roundRobins_0;
      end
      2'b01 : begin
        _zz_75 = m2b_cmd_s0_priority_roundRobins_1;
      end
      2'b10 : begin
        _zz_75 = m2b_cmd_s0_priority_roundRobins_2;
      end
      default : begin
        _zz_75 = m2b_cmd_s0_priority_roundRobins_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_23)
      2'b00 : begin
        _zz_76 = b2m_fsm_arbiter_logic_priority_roundRobins_0;
      end
      2'b01 : begin
        _zz_76 = b2m_fsm_arbiter_logic_priority_roundRobins_1;
      end
      2'b10 : begin
        _zz_76 = b2m_fsm_arbiter_logic_priority_roundRobins_2;
      end
      default : begin
        _zz_76 = b2m_fsm_arbiter_logic_priority_roundRobins_3;
      end
    endcase
  end

  assign io_ctrl_PREADY = 1'b1;
  always @ (*) begin
    io_ctrl_PRDATA = 32'h0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        io_ctrl_PRDATA[0 : 0] = channels_0_channelValid;
      end
      14'h0070 : begin
        io_ctrl_PRDATA[31 : 0] = channels_0_ll_ptr;
      end
      14'h0054 : begin
        io_ctrl_PRDATA[0 : 0] = channels_0_interrupts_completion_valid;
        io_ctrl_PRDATA[2 : 2] = channels_0_interrupts_onChannelCompletion_valid;
        io_ctrl_PRDATA[3 : 3] = channels_0_interrupts_onLinkedListUpdate_valid;
      end
      14'h00ac : begin
        io_ctrl_PRDATA[0 : 0] = channels_1_channelValid;
      end
      14'h00f0 : begin
        io_ctrl_PRDATA[31 : 0] = channels_1_ll_ptr;
      end
      14'h00d4 : begin
        io_ctrl_PRDATA[0 : 0] = channels_1_interrupts_completion_valid;
        io_ctrl_PRDATA[2 : 2] = channels_1_interrupts_onChannelCompletion_valid;
        io_ctrl_PRDATA[3 : 3] = channels_1_interrupts_onLinkedListUpdate_valid;
        io_ctrl_PRDATA[4 : 4] = channels_1_interrupts_s2mPacket_valid;
      end
      default : begin
      end
    endcase
  end

  assign io_ctrl_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && io_ctrl_PWRITE);
  assign ctrl_askRead = ((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && (! io_ctrl_PWRITE));
  assign ctrl_doWrite = (((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && io_ctrl_PREADY) && io_ctrl_PWRITE);
  assign ctrl_doRead = (((io_ctrl_PSEL[0] && io_ctrl_PENABLE) && io_ctrl_PREADY) && (! io_ctrl_PWRITE));
  always @ (*) begin
    channels_0_channelStart = 1'b0;
    if(_zz_43)begin
      if(_zz_178[0])begin
        channels_0_channelStart = _zz_179[0];
      end
    end
    if(_zz_45)begin
      if(_zz_182[0])begin
        channels_0_channelStart = _zz_183[0];
      end
    end
  end

  always @ (*) begin
    channels_0_channelCompletion = 1'b0;
    if(channels_0_channelValid)begin
      if(channels_0_channelStop)begin
        if(channels_0_readyToStop)begin
          channels_0_channelCompletion = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_0_descriptorStart = 1'b0;
    if(channels_0_ctrl_kick)begin
      channels_0_descriptorStart = 1'b1;
    end
    if(_zz_77)begin
      if(_zz_78)begin
        if(_zz_79)begin
          channels_0_descriptorStart = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_0_descriptorCompletion = 1'b0;
    if(((((channels_0_descriptorValid && (! channels_0_pop_memory)) && channels_0_push_memory) && channels_0_push_m2b_loadDone) && (channels_0_push_m2b_memPending == 4'b0000)))begin
      channels_0_descriptorCompletion = 1'b1;
    end
    if(channels_0_channelValid)begin
      if(channels_0_channelStop)begin
        if(channels_0_readyToStop)begin
          channels_0_descriptorCompletion = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_0_readyToStop = 1'b1;
    if(channels_0_ll_waitDone)begin
      channels_0_readyToStop = 1'b0;
    end
    if((channels_0_push_m2b_memPending != 4'b0000))begin
      channels_0_readyToStop = 1'b0;
    end
  end

  always @ (*) begin
    channels_0_ll_sgStart = 1'b0;
    if(_zz_46)begin
      if(_zz_184[0])begin
        channels_0_ll_sgStart = _zz_185[0];
      end
    end
  end

  assign channels_0_ll_requestLl = ((((channels_0_channelValid && channels_0_ll_valid) && (! channels_0_channelStop)) && (! channels_0_ll_waitDone)) && ((! channels_0_descriptorValid) || channels_0_ll_requireSync));
  always @ (*) begin
    channels_0_ll_descriptorUpdated = 1'b0;
    if(_zz_77)begin
      if((! channels_0_ll_head))begin
        channels_0_ll_descriptorUpdated = 1'b1;
      end
    end
  end

  assign channels_0_fifo_base = 11'h0;
  assign channels_0_fifo_words = 11'h0ff;
  always @ (*) begin
    channels_0_fifo_push_availableDecr = 11'h0;
    if(m2b_cmd_s1_valid)begin
      if(io_read_cmd_ready)begin
        if(_zz_80)begin
          channels_0_fifo_push_availableDecr = {1'd0, m2b_cmd_s1_fifoPushDecr};
        end
      end
    end
  end

  assign channels_0_fifo_push_ptrWithBase = ((channels_0_fifo_base & (~ channels_0_fifo_words)) | (channels_0_fifo_push_ptr & channels_0_fifo_words));
  assign channels_0_fifo_pop_ptrWithBase = ((channels_0_fifo_base & (~ channels_0_fifo_words)) | (channels_0_fifo_pop_ptr & channels_0_fifo_words));
  assign channels_0_fifo_pop_empty = (channels_0_fifo_pop_ptr == channels_0_fifo_push_ptr);
  assign channels_0_fifo_pop_bytes = channels_0_fifo_pop_withoutOverride_exposed;
  assign channels_0_fifo_empty = (channels_0_fifo_push_ptr == channels_0_fifo_pop_ptr);
  assign channels_0_push_m2b_bytePerBurst = 11'h0ff;
  always @ (*) begin
    channels_0_push_m2b_memPendingIncr = 1'b0;
    if(_zz_81)begin
      if((channels_0_push_m2b_loadRequest && m2b_cmd_s0_priority_chosenOh[0]))begin
        channels_0_push_m2b_memPendingIncr = 1'b1;
      end
    end
  end

  always @ (*) begin
    channels_0_push_m2b_memPendingDecr = 1'b0;
    if((_zz_22 && m2b_writeRsp_context_lastOfBurst))begin
      channels_0_push_m2b_memPendingDecr = 1'b1;
    end
  end

  always @ (*) begin
    channels_0_push_m2b_loadRequest = (((((channels_0_descriptorValid && (! channels_0_channelStop)) && (! channels_0_push_m2b_loadDone)) && channels_0_push_memory) && (_zz_104 < channels_0_fifo_push_available)) && (channels_0_push_m2b_memPending != 4'b1111));
    if((((! channels_0_pop_memory) && channels_0_pop_b2s_veryLastValid) && (channels_0_push_m2b_bytesLeft <= _zz_105)))begin
      channels_0_push_m2b_loadRequest = 1'b0;
    end
  end

  always @ (*) begin
    channels_0_pop_b2s_veryLastTrigger = 1'b0;
    if(((io_read_rsp_valid && io_read_rsp_ready) && m2b_rsp_veryLast))begin
      if(1'b1)begin
        channels_0_pop_b2s_veryLastTrigger = 1'b1;
      end
    end
  end

  always @ (*) begin
    channels_0_readyForChannelCompletion = 1'b1;
    if(((! channels_0_pop_memory) && (! channels_0_fifo_pop_empty)))begin
      channels_0_readyForChannelCompletion = 1'b0;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b1;
    if(channels_0_ctrl_kick)begin
      _zz_1 = 1'b0;
    end
    if(channels_0_ll_valid)begin
      _zz_1 = 1'b0;
    end
  end

  assign channels_0_s2b_full = (channels_0_fifo_push_available < 11'h002);
  always @ (*) begin
    channels_1_channelStart = 1'b0;
    if(_zz_50)begin
      if(_zz_192[0])begin
        channels_1_channelStart = _zz_193[0];
      end
    end
    if(_zz_52)begin
      if(_zz_196[0])begin
        channels_1_channelStart = _zz_197[0];
      end
    end
  end

  always @ (*) begin
    channels_1_channelCompletion = 1'b0;
    if(channels_1_channelValid)begin
      if(channels_1_channelStop)begin
        if(channels_1_readyToStop)begin
          channels_1_channelCompletion = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_1_descriptorStart = 1'b0;
    if(channels_1_ctrl_kick)begin
      channels_1_descriptorStart = 1'b1;
    end
    if(_zz_82)begin
      if(_zz_83)begin
        if(_zz_84)begin
          channels_1_descriptorStart = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_1_descriptorCompletion = 1'b0;
    if(channels_1_pop_b2m_packetSync)begin
      if(_zz_85)begin
        if(channels_1_push_s2b_completionOnLast)begin
          channels_1_descriptorCompletion = 1'b1;
        end
      end
    end
    if(((channels_1_descriptorValid && (channels_1_pop_b2m_memPending == 4'b0000)) && channels_1_pop_b2m_waitFinalRsp))begin
      channels_1_descriptorCompletion = 1'b1;
    end
    if(channels_1_channelValid)begin
      if(channels_1_channelStop)begin
        if(channels_1_readyToStop)begin
          channels_1_descriptorCompletion = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_1_readyToStop = 1'b1;
    if(channels_1_ll_waitDone)begin
      channels_1_readyToStop = 1'b0;
    end
    if((channels_1_pop_b2m_memPending != 4'b0000))begin
      channels_1_readyToStop = 1'b0;
    end
  end

  always @ (*) begin
    channels_1_bytesProbe_incr_valid = 1'b0;
    if(_zz_86)begin
      if(_zz_87)begin
        channels_1_bytesProbe_incr_valid = 1'b1;
      end
    end
  end

  always @ (*) begin
    channels_1_bytesProbe_incr_payload = 11'h0;
    if(_zz_86)begin
      if(_zz_87)begin
        channels_1_bytesProbe_incr_payload = b2m_rsp_context_length;
      end
    end
  end

  always @ (*) begin
    channels_1_ll_sgStart = 1'b0;
    if(_zz_53)begin
      if(_zz_198[0])begin
        channels_1_ll_sgStart = _zz_199[0];
      end
    end
  end

  assign channels_1_ll_requestLl = ((((channels_1_channelValid && channels_1_ll_valid) && (! channels_1_channelStop)) && (! channels_1_ll_waitDone)) && ((! channels_1_descriptorValid) || channels_1_ll_requireSync));
  always @ (*) begin
    channels_1_ll_descriptorUpdated = 1'b0;
    if(_zz_82)begin
      if((! channels_1_ll_head))begin
        channels_1_ll_descriptorUpdated = 1'b1;
      end
    end
  end

  assign channels_1_fifo_base = 11'h100;
  assign channels_1_fifo_words = 11'h0ff;
  assign channels_1_fifo_push_availableDecr = 11'h0;
  assign channels_1_fifo_push_ptrWithBase = ((channels_1_fifo_base & (~ channels_1_fifo_words)) | (channels_1_fifo_push_ptr & channels_1_fifo_words));
  assign channels_1_fifo_pop_ptrWithBase = ((channels_1_fifo_base & (~ channels_1_fifo_words)) | (channels_1_fifo_pop_ptr & channels_1_fifo_words));
  assign channels_1_fifo_pop_empty = (channels_1_fifo_pop_ptr == channels_1_fifo_push_ptr);
  assign channels_1_fifo_pop_withOverride_backupNext = (_zz_109 - channels_1_fifo_pop_bytesDecr_value);
  always @ (*) begin
    channels_1_fifo_pop_withOverride_load = 1'b0;
    if((channels_1_push_s2b_packetEvent && channels_1_push_s2b_completionOnLast))begin
      channels_1_fifo_pop_withOverride_load = 1'b1;
    end
  end

  always @ (*) begin
    channels_1_fifo_pop_withOverride_unload = 1'b0;
    if(channels_1_pop_b2m_packetSync)begin
      channels_1_fifo_pop_withOverride_unload = 1'b1;
    end
  end

  assign channels_1_fifo_pop_bytes = channels_1_fifo_pop_withOverride_exposed;
  assign channels_1_fifo_empty = (channels_1_fifo_push_ptr == channels_1_fifo_pop_ptr);
  always @ (*) begin
    channels_1_push_s2b_packetEvent = 1'b0;
    if((_zz_14 && s2b_0_rsp_context_packet))begin
      channels_1_push_s2b_packetEvent = 1'b1;
    end
  end

  assign channels_1_pop_b2m_bytePerBurst = 11'h0ff;
  always @ (*) begin
    channels_1_pop_b2m_fire = 1'b0;
    if(_zz_88)begin
      if(_zz_152[0])begin
        channels_1_pop_b2m_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    channels_1_pop_b2m_packetSync = 1'b0;
    if(_zz_89)begin
      if(channels_1_pop_b2m_packet)begin
        channels_1_pop_b2m_packetSync = 1'b1;
      end
    end
    if(_zz_86)begin
      if(_zz_87)begin
        if(b2m_rsp_context_doPacketSync)begin
          channels_1_pop_b2m_packetSync = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    channels_1_pop_b2m_memRsp = 1'b0;
    if(_zz_86)begin
      if(_zz_172[0])begin
        channels_1_pop_b2m_memRsp = 1'b1;
      end
    end
  end

  assign channels_1_pop_b2m_request = ((((((channels_1_descriptorValid && (! channels_1_channelStop)) && (! channels_1_pop_b2m_waitFinalRsp)) && channels_1_pop_memory) && ((_zz_111 < channels_1_fifo_pop_bytes) || ((channels_1_fifo_push_available < _zz_113) || channels_1_pop_b2m_flush))) && (channels_1_fifo_pop_bytes != 13'h0)) && (channels_1_pop_b2m_memPending != 4'b1111));
  always @ (*) begin
    channels_1_pop_b2m_memPendingInc = 1'b0;
    if(_zz_90)begin
      if((channels_1_pop_b2m_request && b2m_fsm_arbiter_logic_priority_chosenOh[0]))begin
        channels_1_pop_b2m_memPendingInc = 1'b1;
      end
    end
  end

  always @ (*) begin
    channels_1_pop_b2m_decrBytes = 13'h0;
    if(b2m_fsm_s1)begin
      if(_zz_91)begin
        channels_1_pop_b2m_decrBytes = {2'd0, b2m_fsm_bytesInBurstP1};
      end
    end
  end

  assign channels_1_readyForChannelCompletion = 1'b1;
  always @ (*) begin
    _zz_2 = 1'b1;
    if(channels_1_ctrl_kick)begin
      _zz_2 = 1'b0;
    end
    if(channels_1_ll_valid)begin
      _zz_2 = 1'b0;
    end
  end

  assign channels_1_s2b_full = (channels_1_fifo_push_available < 11'h002);
  always @ (*) begin
    s2b_0_cmd_firsts[0] = io_inputs_0_payload_last_regNextWhen;
    s2b_0_cmd_firsts[1] = io_inputs_0_payload_last_regNextWhen_1;
    s2b_0_cmd_firsts[2] = io_inputs_0_payload_last_regNextWhen_2;
    s2b_0_cmd_firsts[3] = io_inputs_0_payload_last_regNextWhen_3;
    s2b_0_cmd_firsts[4] = io_inputs_0_payload_last_regNextWhen_4;
    s2b_0_cmd_firsts[5] = io_inputs_0_payload_last_regNextWhen_5;
    s2b_0_cmd_firsts[6] = io_inputs_0_payload_last_regNextWhen_6;
    s2b_0_cmd_firsts[7] = io_inputs_0_payload_last_regNextWhen_7;
    s2b_0_cmd_firsts[8] = io_inputs_0_payload_last_regNextWhen_8;
    s2b_0_cmd_firsts[9] = io_inputs_0_payload_last_regNextWhen_9;
    s2b_0_cmd_firsts[10] = io_inputs_0_payload_last_regNextWhen_10;
    s2b_0_cmd_firsts[11] = io_inputs_0_payload_last_regNextWhen_11;
    s2b_0_cmd_firsts[12] = io_inputs_0_payload_last_regNextWhen_12;
    s2b_0_cmd_firsts[13] = io_inputs_0_payload_last_regNextWhen_13;
    s2b_0_cmd_firsts[14] = io_inputs_0_payload_last_regNextWhen_14;
    s2b_0_cmd_firsts[15] = io_inputs_0_payload_last_regNextWhen_15;
  end

  assign s2b_0_cmd_first = s2b_0_cmd_firsts[io_inputs_0_payload_sink];
  assign s2b_0_cmd_channelsOh[0] = ((((channels_1_channelValid && (s2b_0_cmd_first || (! channels_1_push_s2b_waitFirst))) && (! channels_1_push_memory)) && 1'b1) && (io_inputs_0_payload_sink == 4'b0000));
  assign s2b_0_cmd_noHit = (! (s2b_0_cmd_channelsOh != 1'b0));
  assign s2b_0_cmd_channelsFull[0] = (channels_1_s2b_full || (channels_1_push_s2b_packetLock && io_inputs_0_payload_last));
  always @ (*) begin
    io_inputs_0_thrown_valid = io_inputs_0_valid;
    if(s2b_0_cmd_noHit)begin
      io_inputs_0_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_inputs_0_ready = io_inputs_0_thrown_ready;
    if(s2b_0_cmd_noHit)begin
      io_inputs_0_ready = 1'b1;
    end
  end

  assign io_inputs_0_thrown_payload_data = io_inputs_0_payload_data;
  assign io_inputs_0_thrown_payload_mask = io_inputs_0_payload_mask;
  assign io_inputs_0_thrown_payload_sink = io_inputs_0_payload_sink;
  assign io_inputs_0_thrown_payload_last = io_inputs_0_payload_last;
  assign _zz_3 = (! ((s2b_0_cmd_channelsOh & s2b_0_cmd_channelsFull) != 1'b0));
  assign s2b_0_cmd_sinkHalted_valid = (io_inputs_0_thrown_valid && _zz_3);
  assign io_inputs_0_thrown_ready = (s2b_0_cmd_sinkHalted_ready && _zz_3);
  assign s2b_0_cmd_sinkHalted_payload_data = io_inputs_0_thrown_payload_data;
  assign s2b_0_cmd_sinkHalted_payload_mask = io_inputs_0_thrown_payload_mask;
  assign s2b_0_cmd_sinkHalted_payload_sink = io_inputs_0_thrown_payload_sink;
  assign s2b_0_cmd_sinkHalted_payload_last = io_inputs_0_thrown_payload_last;
  assign _zz_4 = 3'b000;
  assign _zz_5 = 3'b001;
  assign _zz_6 = 3'b001;
  assign _zz_7 = 3'b010;
  assign _zz_8 = 3'b001;
  assign _zz_9 = 3'b010;
  assign _zz_10 = 3'b010;
  assign _zz_11 = 3'b011;
  assign s2b_0_cmd_byteCount = (_zz_73 + _zz_74);
  assign s2b_0_cmd_context_channel = s2b_0_cmd_channelsOh;
  assign s2b_0_cmd_context_bytes = s2b_0_cmd_byteCount;
  assign s2b_0_cmd_context_flush = io_inputs_0_payload_last;
  assign s2b_0_cmd_context_packet = io_inputs_0_payload_last;
  assign s2b_0_cmd_sinkHalted_ready = memory_core_io_writes_0_cmd_ready;
  assign _zz_58 = channels_1_fifo_push_ptrWithBase[9:0];
  assign _zz_59 = {s2b_0_cmd_context_packet,{s2b_0_cmd_context_flush,{s2b_0_cmd_context_bytes,s2b_0_cmd_context_channel}}};
  assign _zz_12 = (s2b_0_cmd_channelsOh[0] && (s2b_0_cmd_sinkHalted_valid && memory_core_io_writes_0_cmd_ready));
  assign _zz_13 = memory_core_io_writes_0_rsp_payload_context;
  assign s2b_0_rsp_context_channel = _zz_13[0 : 0];
  assign s2b_0_rsp_context_bytes = _zz_13[3 : 1];
  assign s2b_0_rsp_context_flush = _zz_123[0];
  assign s2b_0_rsp_context_packet = _zz_124[0];
  assign _zz_14 = (memory_core_io_writes_0_rsp_valid && s2b_0_rsp_context_channel[0]);
  assign b2s_0_cmd_channelsOh = (((channels_0_channelValid && (! channels_0_pop_memory)) && 1'b1) && (! channels_0_fifo_pop_empty));
  assign b2s_0_cmd_veryLastPtr = channels_0_pop_b2s_veryLastPtr;
  assign b2s_0_cmd_address = channels_0_fifo_pop_ptrWithBase;
  assign b2s_0_cmd_context_channel = b2s_0_cmd_channelsOh;
  assign b2s_0_cmd_context_veryLast = ((channels_0_pop_b2s_veryLastValid && (b2s_0_cmd_address[10 : 1] == b2s_0_cmd_veryLastPtr[10 : 1])) && (b2s_0_cmd_address[0 : 0] == 1'b1));
  assign b2s_0_cmd_context_endPacket = channels_0_pop_b2s_veryLastEndPacket;
  assign _zz_63 = (b2s_0_cmd_channelsOh != 1'b0);
  assign _zz_64 = b2s_0_cmd_address[9:0];
  assign _zz_65 = {b2s_0_cmd_context_endPacket,{b2s_0_cmd_context_veryLast,b2s_0_cmd_context_channel}};
  assign _zz_15 = memory_core_io_reads_0_rsp_payload_context;
  assign b2s_0_rsp_context_channel = _zz_15[0 : 0];
  assign b2s_0_rsp_context_veryLast = _zz_125[0];
  assign b2s_0_rsp_context_endPacket = _zz_126[0];
  assign io_outputs_0_valid = memory_core_io_reads_0_rsp_valid;
  assign io_outputs_0_payload_data = memory_core_io_reads_0_rsp_payload_data;
  assign io_outputs_0_payload_mask = memory_core_io_reads_0_rsp_payload_mask;
  assign io_outputs_0_payload_sink = channels_0_pop_b2s_sinkId;
  assign io_outputs_0_payload_last = (b2s_0_rsp_context_veryLast && b2s_0_rsp_context_endPacket);
  assign _zz_16 = channels_0_priority;
  assign m2b_cmd_s0_priority_masked[0] = (channels_0_push_m2b_loadRequest && (channels_0_priority == _zz_16));
  assign _zz_17 = m2b_cmd_s0_priority_masked;
  assign _zz_18 = {_zz_17,_zz_17};
  assign _zz_19 = (_zz_18 & (~ _zz_127));
  assign m2b_cmd_s0_priority_chosenOh = (_zz_19[1 : 1] | _zz_19[0 : 0]);
  assign m2b_cmd_s0_priority_weightLast = (channels_0_weight == m2b_cmd_s0_priority_counter);
  assign m2b_cmd_s0_priority_contextNext = (m2b_cmd_s0_priority_weightLast ? m2b_cmd_s0_priority_chosenOh[0 : 0] : m2b_cmd_s0_priority_chosenOh);
  assign m2b_cmd_s0_address = channels_0_push_m2b_address;
  assign m2b_cmd_s0_bytesLeft = channels_0_push_m2b_bytesLeft;
  assign m2b_cmd_s0_readAddressBurstRange = m2b_cmd_s0_address[10 : 0];
  assign m2b_cmd_s0_lengthHead = ((~ m2b_cmd_s0_readAddressBurstRange) & channels_0_push_m2b_bytePerBurst);
  assign m2b_cmd_s0_length = _zz_130[10:0];
  assign m2b_cmd_s0_lastBurst = (m2b_cmd_s0_bytesLeft == _zz_133);
  assign m2b_cmd_s1_context_start = m2b_cmd_s1_address[2:0];
  assign m2b_cmd_s1_context_stop = _zz_134[2:0];
  assign m2b_cmd_s1_context_last = m2b_cmd_s1_lastBurst;
  assign m2b_cmd_s1_context_length = m2b_cmd_s1_length;
  always @ (*) begin
    io_read_cmd_valid = 1'b0;
    if(m2b_cmd_s1_valid)begin
      io_read_cmd_valid = 1'b1;
    end
  end

  assign io_read_cmd_payload_last = 1'b1;
  assign io_read_cmd_payload_fragment_opcode = 1'b0;
  assign io_read_cmd_payload_fragment_address = m2b_cmd_s1_address;
  assign io_read_cmd_payload_fragment_length = m2b_cmd_s1_length;
  assign io_read_cmd_payload_fragment_context = {m2b_cmd_s1_context_last,{m2b_cmd_s1_context_length,{m2b_cmd_s1_context_stop,m2b_cmd_s1_context_start}}};
  assign m2b_cmd_s1_addressNext = (_zz_136 + 32'h00000001);
  assign m2b_cmd_s1_byteLeftNext = (_zz_138 - 26'h0000001);
  assign m2b_cmd_s1_fifoPushDecr = (_zz_140 >>> 2);
  assign _zz_20 = io_read_rsp_payload_fragment_context;
  assign m2b_rsp_context_start = _zz_20[2 : 0];
  assign m2b_rsp_context_stop = _zz_20[5 : 3];
  assign m2b_rsp_context_length = _zz_20[16 : 6];
  assign m2b_rsp_context_last = _zz_146[0];
  assign m2b_rsp_veryLast = (m2b_rsp_context_last && io_read_rsp_payload_last);
  always @ (*) begin
    _zz_61[0] = ((! (m2b_rsp_first && (3'b000 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b000))));
    _zz_61[1] = ((! (m2b_rsp_first && (3'b001 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b001))));
    _zz_61[2] = ((! (m2b_rsp_first && (3'b010 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b010))));
    _zz_61[3] = ((! (m2b_rsp_first && (3'b011 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b011))));
    _zz_61[4] = ((! (m2b_rsp_first && (3'b100 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b100))));
    _zz_61[5] = ((! (m2b_rsp_first && (3'b101 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b101))));
    _zz_61[6] = ((! (m2b_rsp_first && (3'b110 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b110))));
    _zz_61[7] = ((! (m2b_rsp_first && (3'b111 < m2b_rsp_context_start))) && (! (io_read_rsp_payload_last && (m2b_rsp_context_stop < 3'b111))));
  end

  assign m2b_rsp_writeContext_last = m2b_rsp_veryLast;
  assign m2b_rsp_writeContext_lastOfBurst = io_read_rsp_payload_last;
  assign m2b_rsp_writeContext_loadByteInNextBeat = ({1'b0,(io_read_rsp_payload_last ? m2b_rsp_context_stop : 3'b111)} - {1'b0,(m2b_rsp_first ? m2b_rsp_context_start : 3'b000)});
  assign _zz_60 = channels_0_fifo_push_ptrWithBase[9:0];
  assign io_read_rsp_ready = memory_core_io_writes_1_cmd_ready;
  assign _zz_62 = {m2b_rsp_writeContext_loadByteInNextBeat,{m2b_rsp_writeContext_lastOfBurst,m2b_rsp_writeContext_last}};
  assign _zz_21 = memory_core_io_writes_1_rsp_payload_context;
  assign m2b_writeRsp_context_last = _zz_147[0];
  assign m2b_writeRsp_context_lastOfBurst = _zz_148[0];
  assign m2b_writeRsp_context_loadByteInNextBeat = _zz_21[5 : 2];
  assign _zz_22 = (memory_core_io_writes_1_rsp_valid && 1'b1);
  assign _zz_23 = channels_1_priority;
  assign b2m_fsm_arbiter_logic_priority_masked[0] = (channels_1_pop_b2m_request && (channels_1_priority == _zz_23));
  assign _zz_24 = b2m_fsm_arbiter_logic_priority_masked;
  assign _zz_25 = {_zz_24,_zz_24};
  assign _zz_26 = (_zz_25 & (~ _zz_149));
  assign b2m_fsm_arbiter_logic_priority_chosenOh = (_zz_26[1 : 1] | _zz_26[0 : 0]);
  assign b2m_fsm_arbiter_logic_priority_weightLast = (channels_1_weight == b2m_fsm_arbiter_logic_priority_counter);
  assign b2m_fsm_arbiter_logic_priority_contextNext = (b2m_fsm_arbiter_logic_priority_weightLast ? b2m_fsm_arbiter_logic_priority_chosenOh[0 : 0] : b2m_fsm_arbiter_logic_priority_chosenOh);
  assign b2m_fsm_bytesInBurstP1 = (b2m_fsm_sel_bytesInBurst + 11'h001);
  assign b2m_fsm_addressNext = (b2m_fsm_sel_address + _zz_153);
  assign b2m_fsm_bytesLeftNext = ({1'b0,b2m_fsm_sel_bytesLeft} - _zz_155);
  assign b2m_fsm_isFinalCmd = b2m_fsm_bytesLeftNext[26];
  assign b2m_fsm_s0 = (b2m_fsm_sel_valid && (! b2m_fsm_sel_valid_regNext));
  assign _zz_27 = (b2m_fsm_sel_bytesInFifo - 13'h0001);
  assign _zz_28 = ((_zz_156 < b2m_fsm_sel_bytesLeft) ? _zz_157 : b2m_fsm_sel_bytesLeft);
  assign _zz_29 = (b2m_fsm_sel_bytePerBurst - (_zz_158 & b2m_fsm_sel_bytePerBurst));
  assign b2m_fsm_fifoCompletion = (_zz_162 == _zz_163);
  always @ (*) begin
    b2m_fsm_sel_ready = 1'b0;
    if(_zz_92)begin
      b2m_fsm_sel_ready = 1'b1;
    end
  end

  assign b2m_fsm_fetch_context_ptr = channels_1_fifo_pop_ptr;
  assign b2m_fsm_fetch_context_toggle = b2m_fsm_toggle;
  assign _zz_66 = b2m_fsm_sel_ptr[9:0];
  assign _zz_67 = {b2m_fsm_fetch_context_toggle,b2m_fsm_fetch_context_ptr};
  assign _zz_30 = memory_core_io_reads_1_rsp_payload_context;
  assign b2m_fsm_aggregate_context_ptr = _zz_30[10 : 0];
  assign b2m_fsm_aggregate_context_toggle = _zz_168[0];
  assign memory_core_io_reads_1_rsp_s2mPipe_valid = (memory_core_io_reads_1_rsp_valid || memory_core_io_reads_1_rsp_s2mPipe_rValid);
  assign _zz_68 = (! memory_core_io_reads_1_rsp_s2mPipe_rValid);
  assign memory_core_io_reads_1_rsp_s2mPipe_payload_data = (memory_core_io_reads_1_rsp_s2mPipe_rValid ? memory_core_io_reads_1_rsp_s2mPipe_rData_data : memory_core_io_reads_1_rsp_payload_data);
  assign memory_core_io_reads_1_rsp_s2mPipe_payload_mask = (memory_core_io_reads_1_rsp_s2mPipe_rValid ? memory_core_io_reads_1_rsp_s2mPipe_rData_mask : memory_core_io_reads_1_rsp_payload_mask);
  assign memory_core_io_reads_1_rsp_s2mPipe_payload_context = (memory_core_io_reads_1_rsp_s2mPipe_rValid ? memory_core_io_reads_1_rsp_s2mPipe_rData_context : memory_core_io_reads_1_rsp_payload_context);
  always @ (*) begin
    b2m_fsm_aggregate_memoryPort_valid = memory_core_io_reads_1_rsp_s2mPipe_valid;
    if(_zz_93)begin
      b2m_fsm_aggregate_memoryPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    memory_core_io_reads_1_rsp_s2mPipe_ready = b2m_fsm_aggregate_memoryPort_ready;
    if(_zz_93)begin
      memory_core_io_reads_1_rsp_s2mPipe_ready = 1'b1;
    end
  end

  assign b2m_fsm_aggregate_memoryPort_payload_data = memory_core_io_reads_1_rsp_s2mPipe_payload_data;
  assign b2m_fsm_aggregate_memoryPort_payload_mask = memory_core_io_reads_1_rsp_s2mPipe_payload_mask;
  assign b2m_fsm_aggregate_memoryPort_payload_context = memory_core_io_reads_1_rsp_s2mPipe_payload_context;
  assign b2m_fsm_aggregate_bytesToSkip = channels_1_pop_b2m_bytesToSkip;
  always @ (*) begin
    b2m_fsm_aggregate_bytesToSkipMask[0] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b000));
    b2m_fsm_aggregate_bytesToSkipMask[1] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b001));
    b2m_fsm_aggregate_bytesToSkipMask[2] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b010));
    b2m_fsm_aggregate_bytesToSkipMask[3] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b011));
    b2m_fsm_aggregate_bytesToSkipMask[4] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b100));
    b2m_fsm_aggregate_bytesToSkipMask[5] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b101));
    b2m_fsm_aggregate_bytesToSkipMask[6] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b110));
    b2m_fsm_aggregate_bytesToSkipMask[7] = ((! b2m_fsm_aggregate_first) || (b2m_fsm_aggregate_bytesToSkip <= 3'b111));
  end

  assign b2m_fsm_aggregate_memoryPort_ready = b2m_fsm_aggregate_engine_io_input_ready;
  assign _zz_69 = (b2m_fsm_aggregate_memoryPort_payload_mask & b2m_fsm_aggregate_bytesToSkipMask);
  assign _zz_72 = b2m_fsm_sel_address[2:0];
  assign _zz_71 = (! _zz_31);
  assign b2m_fsm_cmd_maskFirstTrigger = b2m_fsm_sel_address[2:0];
  assign b2m_fsm_cmd_maskLastTriggerComb = (b2m_fsm_cmd_maskFirstTrigger + _zz_169);
  always @ (*) begin
    _zz_32[0] = (3'b000 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[1] = (3'b001 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[2] = (3'b010 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[3] = (3'b011 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[4] = (3'b100 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[5] = (3'b101 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[6] = (3'b110 <= b2m_fsm_cmd_maskLastTriggerComb);
    _zz_32[7] = (3'b111 <= b2m_fsm_cmd_maskLastTriggerComb);
  end

  always @ (*) begin
    b2m_fsm_cmd_maskFirst[0] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b000);
    b2m_fsm_cmd_maskFirst[1] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b001);
    b2m_fsm_cmd_maskFirst[2] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b010);
    b2m_fsm_cmd_maskFirst[3] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b011);
    b2m_fsm_cmd_maskFirst[4] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b100);
    b2m_fsm_cmd_maskFirst[5] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b101);
    b2m_fsm_cmd_maskFirst[6] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b110);
    b2m_fsm_cmd_maskFirst[7] = (b2m_fsm_cmd_maskFirstTrigger <= 3'b111);
  end

  assign b2m_fsm_cmd_enoughAggregation = (((b2m_fsm_s2 && b2m_fsm_sel_valid) && (! _zz_71)) && (io_write_cmd_payload_last ? ((b2m_fsm_aggregate_engine_io_output_mask & b2m_fsm_cmd_maskLast) == b2m_fsm_cmd_maskLast) : (b2m_fsm_aggregate_engine_io_output_mask == 8'hff)));
  assign _zz_70 = (io_write_cmd_valid && io_write_cmd_ready);
  assign io_write_cmd_valid = b2m_fsm_cmd_enoughAggregation;
  assign io_write_cmd_payload_last = (b2m_fsm_beatCounter == 8'h0);
  assign io_write_cmd_payload_fragment_address = b2m_fsm_sel_address;
  assign io_write_cmd_payload_fragment_opcode = 1'b1;
  assign io_write_cmd_payload_fragment_data = b2m_fsm_aggregate_engine_io_output_data;
  assign io_write_cmd_payload_fragment_mask = (~ ((io_write_cmd_payload_first ? (~ b2m_fsm_cmd_maskFirst) : 8'h0) | (io_write_cmd_payload_last ? (~ b2m_fsm_cmd_maskLast) : 8'h0)));
  assign io_write_cmd_payload_fragment_length = b2m_fsm_sel_bytesInBurst;
  assign b2m_fsm_cmd_doPtrIncr = (b2m_fsm_sel_valid && (b2m_fsm_aggregate_engine_io_output_consumed || (((io_write_cmd_valid && io_write_cmd_ready) && io_write_cmd_payload_last) && (b2m_fsm_aggregate_engine_io_output_usedUntil == 3'b111))));
  assign b2m_fsm_cmd_context_length = b2m_fsm_sel_bytesInBurst;
  assign b2m_fsm_cmd_context_doPacketSync = (b2m_fsm_sel_packet && b2m_fsm_fifoCompletion);
  assign io_write_cmd_payload_fragment_context = {b2m_fsm_cmd_context_doPacketSync,b2m_fsm_cmd_context_length};
  assign io_write_rsp_ready = 1'b1;
  assign _zz_33 = io_write_rsp_payload_fragment_context;
  assign b2m_rsp_context_length = _zz_33[10 : 0];
  assign b2m_rsp_context_doPacketSync = _zz_171[0];
  assign _zz_34 = {channels_1_ll_requestLl,channels_0_ll_requestLl};
  assign _zz_35 = _zz_173[1];
  always @ (*) begin
    _zz_36[0] = channels_0_ll_requestLl;
    _zz_36[1] = _zz_35;
  end

  assign ll_arbiter_head = (_zz_36[0] ? channels_0_ll_head : channels_1_ll_head);
  always @ (*) begin
    _zz_37[0] = channels_0_ll_requestLl;
    _zz_37[1] = _zz_35;
  end

  assign ll_arbiter_isJustASink = (_zz_37[0] ? channels_0_descriptorValid : channels_1_descriptorValid);
  always @ (*) begin
    _zz_38[0] = channels_0_ll_requestLl;
    _zz_38[1] = _zz_35;
  end

  always @ (*) begin
    _zz_39[0] = channels_0_ll_requestLl;
    _zz_39[1] = _zz_35;
  end

  always @ (*) begin
    _zz_40[0] = channels_0_ll_requestLl;
    _zz_40[1] = _zz_35;
  end

  assign ll_cmd_context_channel = ll_cmd_oh_1;
  assign io_sgRead_cmd_valid = (ll_cmd_valid && (! ll_cmd_readFired));
  assign io_sgRead_cmd_payload_last = 1'b1;
  assign io_sgRead_cmd_payload_fragment_address = {ll_cmd_ptrNext[31 : 5],5'h0};
  assign io_sgRead_cmd_payload_fragment_length = 5'h1f;
  assign io_sgRead_cmd_payload_fragment_opcode = 1'b0;
  assign io_sgRead_cmd_payload_fragment_context = ll_cmd_context_channel;
  assign io_sgWrite_cmd_valid = (ll_cmd_valid && (! ll_cmd_writeFired));
  assign io_sgWrite_cmd_payload_last = 1'b1;
  assign io_sgWrite_cmd_payload_fragment_address = {ll_cmd_ptr[31 : 5],5'h0};
  assign io_sgWrite_cmd_payload_fragment_length = 2'b11;
  assign io_sgWrite_cmd_payload_fragment_opcode = 1'b1;
  assign io_sgWrite_cmd_payload_fragment_context = ll_cmd_context_channel;
  assign ll_cmd_writeMaskSplit_0 = io_sgWrite_cmd_payload_fragment_mask[3 : 0];
  assign ll_cmd_writeMaskSplit_1 = io_sgWrite_cmd_payload_fragment_mask[7 : 4];
  assign ll_cmd_writeDataSplit_0 = io_sgWrite_cmd_payload_fragment_data[31 : 0];
  assign ll_cmd_writeDataSplit_1 = io_sgWrite_cmd_payload_fragment_data[63 : 32];
  assign _zz_242 = zz_io_sgWrite_cmd_payload_fragment_mask(1'b0);
  always @ (*) io_sgWrite_cmd_payload_fragment_mask = _zz_242;
  always @ (*) begin
    io_sgWrite_cmd_payload_fragment_data[63 : 32] = 32'h0;
    io_sgWrite_cmd_payload_fragment_data[31 : 0] = 32'h0;
    io_sgWrite_cmd_payload_fragment_data[26 : 0] = ll_cmd_bytesDone;
    io_sgWrite_cmd_payload_fragment_data[30] = ll_cmd_endOfPacket;
    io_sgWrite_cmd_payload_fragment_data[31] = (! ll_cmd_isJustASink);
  end

  assign ll_readRsp_context_channel = io_sgRead_rsp_payload_fragment_context[0 : 0];
  always @ (*) begin
    _zz_41[0] = (ll_readRsp_context_channel == 1'b0);
    _zz_41[1] = (ll_readRsp_context_channel == 1'b1);
  end

  assign ll_readRsp_oh_0 = _zz_41[0];
  assign ll_readRsp_oh_1 = _zz_41[1];
  assign io_sgRead_rsp_ready = 1'b1;
  assign ll_writeRsp_context_channel = io_sgWrite_rsp_payload_fragment_context[0 : 0];
  always @ (*) begin
    _zz_42[0] = (ll_writeRsp_context_channel == 1'b0);
    _zz_42[1] = (ll_writeRsp_context_channel == 1'b1);
  end

  assign ll_writeRsp_oh_0 = _zz_42[0];
  assign ll_writeRsp_oh_1 = _zz_42[1];
  assign io_sgWrite_rsp_ready = 1'b1;
  always @ (*) begin
    io_interrupts = 2'b00;
    if(channels_0_interrupts_completion_valid)begin
      io_interrupts[0] = 1'b1;
    end
    if(channels_0_interrupts_onChannelCompletion_valid)begin
      io_interrupts[0] = 1'b1;
    end
    if(channels_0_interrupts_onLinkedListUpdate_valid)begin
      io_interrupts[0] = 1'b1;
    end
    if(channels_1_interrupts_completion_valid)begin
      io_interrupts[1] = 1'b1;
    end
    if(channels_1_interrupts_onChannelCompletion_valid)begin
      io_interrupts[1] = 1'b1;
    end
    if(channels_1_interrupts_onLinkedListUpdate_valid)begin
      io_interrupts[1] = 1'b1;
    end
    if(channels_1_interrupts_s2mPacket_valid)begin
      io_interrupts[1] = 1'b1;
    end
  end

  always @ (*) begin
    _zz_43 = 1'b0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        if(ctrl_doWrite)begin
          _zz_43 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_44 = 1'b0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        if(ctrl_doWrite)begin
          _zz_44 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_45 = 1'b0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        if(ctrl_doWrite)begin
          _zz_45 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_46 = 1'b0;
    case(io_ctrl_PADDR)
      14'h002c : begin
        if(ctrl_doWrite)begin
          _zz_46 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_47 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0054 : begin
        if(ctrl_doWrite)begin
          _zz_47 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_48 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0054 : begin
        if(ctrl_doWrite)begin
          _zz_48 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_49 = 1'b0;
    case(io_ctrl_PADDR)
      14'h0054 : begin
        if(ctrl_doWrite)begin
          _zz_49 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_50 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00ac : begin
        if(ctrl_doWrite)begin
          _zz_50 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_51 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00ac : begin
        if(ctrl_doWrite)begin
          _zz_51 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_52 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00ac : begin
        if(ctrl_doWrite)begin
          _zz_52 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_53 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00ac : begin
        if(ctrl_doWrite)begin
          _zz_53 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_54 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00d4 : begin
        if(ctrl_doWrite)begin
          _zz_54 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_55 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00d4 : begin
        if(ctrl_doWrite)begin
          _zz_55 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_56 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00d4 : begin
        if(ctrl_doWrite)begin
          _zz_56 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_57 = 1'b0;
    case(io_ctrl_PADDR)
      14'h00d4 : begin
        if(ctrl_doWrite)begin
          _zz_57 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign channels_0_fifo_push_ptrIncr_value = _zz_229;
  assign channels_0_fifo_pop_bytesIncr_value = _zz_231;
  assign channels_0_fifo_pop_bytesDecr_value = 13'h0;
  assign channels_0_fifo_pop_ptrIncr_value = _zz_234;
  assign channels_1_fifo_push_ptrIncr_value = _zz_236;
  assign channels_1_fifo_pop_bytesIncr_value = _zz_238;
  assign channels_1_fifo_pop_bytesDecr_value = channels_1_pop_b2m_decrBytes;
  assign channels_1_fifo_pop_ptrIncr_value = _zz_240;
  always @ (posedge clk) begin
    if(reset) begin
      channels_0_channelValid <= 1'b0;
      channels_0_descriptorValid <= 1'b0;
      channels_0_priority <= 2'b00;
      channels_0_weight <= 2'b00;
      channels_0_ctrl_kick <= 1'b0;
      channels_0_ll_valid <= 1'b0;
      channels_0_push_m2b_loadDone <= 1'b1;
      channels_0_push_m2b_memPending <= 4'b0000;
      channels_0_interrupts_completion_enable <= 1'b0;
      channels_0_interrupts_completion_valid <= 1'b0;
      channels_0_interrupts_onChannelCompletion_enable <= 1'b0;
      channels_0_interrupts_onChannelCompletion_valid <= 1'b0;
      channels_0_interrupts_onLinkedListUpdate_enable <= 1'b0;
      channels_0_interrupts_onLinkedListUpdate_valid <= 1'b0;
      channels_1_channelValid <= 1'b0;
      channels_1_descriptorValid <= 1'b0;
      channels_1_priority <= 2'b00;
      channels_1_weight <= 2'b00;
      channels_1_ctrl_kick <= 1'b0;
      channels_1_ll_valid <= 1'b0;
      channels_1_pop_b2m_memPending <= 4'b0000;
      channels_1_interrupts_completion_enable <= 1'b0;
      channels_1_interrupts_completion_valid <= 1'b0;
      channels_1_interrupts_onChannelCompletion_enable <= 1'b0;
      channels_1_interrupts_onChannelCompletion_valid <= 1'b0;
      channels_1_interrupts_onLinkedListUpdate_enable <= 1'b0;
      channels_1_interrupts_onLinkedListUpdate_valid <= 1'b0;
      channels_1_interrupts_s2mPacket_enable <= 1'b0;
      channels_1_interrupts_s2mPacket_valid <= 1'b0;
      io_inputs_0_payload_last_regNextWhen <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_1 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_2 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_3 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_4 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_5 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_6 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_7 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_8 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_9 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_10 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_11 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_12 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_13 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_14 <= 1'b1;
      io_inputs_0_payload_last_regNextWhen_15 <= 1'b1;
      m2b_cmd_s0_valid <= 1'b0;
      m2b_cmd_s0_priority_roundRobins_0 <= 1'b1;
      m2b_cmd_s0_priority_roundRobins_1 <= 1'b1;
      m2b_cmd_s0_priority_roundRobins_2 <= 1'b1;
      m2b_cmd_s0_priority_roundRobins_3 <= 1'b1;
      m2b_cmd_s0_priority_counter <= 2'b00;
      m2b_cmd_s1_valid <= 1'b0;
      m2b_rsp_first <= 1'b1;
      b2m_fsm_sel_valid <= 1'b0;
      b2m_fsm_arbiter_logic_valid <= 1'b0;
      b2m_fsm_arbiter_logic_priority_roundRobins_0 <= 1'b1;
      b2m_fsm_arbiter_logic_priority_roundRobins_1 <= 1'b1;
      b2m_fsm_arbiter_logic_priority_roundRobins_2 <= 1'b1;
      b2m_fsm_arbiter_logic_priority_roundRobins_3 <= 1'b1;
      b2m_fsm_arbiter_logic_priority_counter <= 2'b00;
      b2m_fsm_sel_valid_regNext <= 1'b0;
      b2m_fsm_s1 <= 1'b0;
      b2m_fsm_s2 <= 1'b0;
      b2m_fsm_toggle <= 1'b0;
      memory_core_io_reads_1_rsp_s2mPipe_rValid <= 1'b0;
      _zz_31 <= 1'b0;
      io_write_cmd_payload_first <= 1'b1;
      ll_cmd_valid <= 1'b0;
      ll_readRsp_beatCounter <= 2'b00;
    end else begin
      if(channels_0_channelStart)begin
        channels_0_channelValid <= 1'b1;
      end
      if(channels_0_channelCompletion)begin
        channels_0_channelValid <= 1'b0;
      end
      if(channels_0_descriptorStart)begin
        channels_0_descriptorValid <= 1'b1;
      end
      if(channels_0_descriptorCompletion)begin
        channels_0_descriptorValid <= 1'b0;
      end
      channels_0_ctrl_kick <= 1'b0;
      if(channels_0_channelCompletion)begin
        channels_0_ctrl_kick <= 1'b0;
      end
      if(_zz_77)begin
        if(_zz_78)begin
          if(! _zz_79) begin
            channels_0_ll_valid <= 1'b0;
          end
        end
      end
      if(channels_0_ll_sgStart)begin
        channels_0_ll_valid <= 1'b1;
      end
      if(channels_0_channelCompletion)begin
        channels_0_ll_valid <= 1'b0;
      end
      channels_0_push_m2b_memPending <= (_zz_98 - _zz_102);
      if(channels_0_descriptorStart)begin
        channels_0_push_m2b_loadDone <= 1'b0;
      end
      if((channels_0_descriptorValid && channels_0_descriptorCompletion))begin
        channels_0_interrupts_completion_valid <= 1'b1;
      end
      if((! channels_0_interrupts_completion_enable))begin
        channels_0_interrupts_completion_valid <= 1'b0;
      end
      if((channels_0_channelValid && channels_0_channelCompletion))begin
        channels_0_interrupts_onChannelCompletion_valid <= 1'b1;
      end
      if((! channels_0_interrupts_onChannelCompletion_enable))begin
        channels_0_interrupts_onChannelCompletion_valid <= 1'b0;
      end
      if(channels_0_ll_descriptorUpdated)begin
        channels_0_interrupts_onLinkedListUpdate_valid <= 1'b1;
      end
      if((! channels_0_interrupts_onLinkedListUpdate_enable))begin
        channels_0_interrupts_onLinkedListUpdate_valid <= 1'b0;
      end
      if(channels_1_channelStart)begin
        channels_1_channelValid <= 1'b1;
      end
      if(channels_1_channelCompletion)begin
        channels_1_channelValid <= 1'b0;
      end
      if(channels_1_descriptorStart)begin
        channels_1_descriptorValid <= 1'b1;
      end
      if(channels_1_descriptorCompletion)begin
        channels_1_descriptorValid <= 1'b0;
      end
      channels_1_ctrl_kick <= 1'b0;
      if(channels_1_channelCompletion)begin
        channels_1_ctrl_kick <= 1'b0;
      end
      if(_zz_82)begin
        if(_zz_83)begin
          if(! _zz_84) begin
            channels_1_ll_valid <= 1'b0;
          end
        end
      end
      if(channels_1_ll_sgStart)begin
        channels_1_ll_valid <= 1'b1;
      end
      if(channels_1_channelCompletion)begin
        channels_1_ll_valid <= 1'b0;
      end
      channels_1_pop_b2m_memPending <= (_zz_114 - _zz_118);
      if((channels_1_descriptorValid && channels_1_descriptorCompletion))begin
        channels_1_interrupts_completion_valid <= 1'b1;
      end
      if((! channels_1_interrupts_completion_enable))begin
        channels_1_interrupts_completion_valid <= 1'b0;
      end
      if((channels_1_channelValid && channels_1_channelCompletion))begin
        channels_1_interrupts_onChannelCompletion_valid <= 1'b1;
      end
      if((! channels_1_interrupts_onChannelCompletion_enable))begin
        channels_1_interrupts_onChannelCompletion_valid <= 1'b0;
      end
      if(channels_1_ll_descriptorUpdated)begin
        channels_1_interrupts_onLinkedListUpdate_valid <= 1'b1;
      end
      if((! channels_1_interrupts_onLinkedListUpdate_enable))begin
        channels_1_interrupts_onLinkedListUpdate_valid <= 1'b0;
      end
      if(channels_1_pop_b2m_packetSync)begin
        channels_1_interrupts_s2mPacket_valid <= 1'b1;
      end
      if((! channels_1_interrupts_s2mPacket_enable))begin
        channels_1_interrupts_s2mPacket_valid <= 1'b0;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0000)))begin
        io_inputs_0_payload_last_regNextWhen <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0001)))begin
        io_inputs_0_payload_last_regNextWhen_1 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0010)))begin
        io_inputs_0_payload_last_regNextWhen_2 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0011)))begin
        io_inputs_0_payload_last_regNextWhen_3 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0100)))begin
        io_inputs_0_payload_last_regNextWhen_4 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0101)))begin
        io_inputs_0_payload_last_regNextWhen_5 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0110)))begin
        io_inputs_0_payload_last_regNextWhen_6 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b0111)))begin
        io_inputs_0_payload_last_regNextWhen_7 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1000)))begin
        io_inputs_0_payload_last_regNextWhen_8 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1001)))begin
        io_inputs_0_payload_last_regNextWhen_9 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1010)))begin
        io_inputs_0_payload_last_regNextWhen_10 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1011)))begin
        io_inputs_0_payload_last_regNextWhen_11 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1100)))begin
        io_inputs_0_payload_last_regNextWhen_12 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1101)))begin
        io_inputs_0_payload_last_regNextWhen_13 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1110)))begin
        io_inputs_0_payload_last_regNextWhen_14 <= io_inputs_0_payload_last;
      end
      if(((io_inputs_0_valid && io_inputs_0_ready) && (io_inputs_0_payload_sink == 4'b1111)))begin
        io_inputs_0_payload_last_regNextWhen_15 <= io_inputs_0_payload_last;
      end
      if(_zz_81)begin
        if((channels_0_push_m2b_loadRequest != 1'b0))begin
          m2b_cmd_s0_valid <= 1'b1;
          if((2'b00 == _zz_16))begin
            m2b_cmd_s0_priority_roundRobins_0 <= m2b_cmd_s0_priority_contextNext;
          end
          if((2'b01 == _zz_16))begin
            m2b_cmd_s0_priority_roundRobins_1 <= m2b_cmd_s0_priority_contextNext;
          end
          if((2'b10 == _zz_16))begin
            m2b_cmd_s0_priority_roundRobins_2 <= m2b_cmd_s0_priority_contextNext;
          end
          if((2'b11 == _zz_16))begin
            m2b_cmd_s0_priority_roundRobins_3 <= m2b_cmd_s0_priority_contextNext;
          end
          m2b_cmd_s0_priority_counter <= (m2b_cmd_s0_priority_counter + 2'b01);
          if(m2b_cmd_s0_priority_weightLast)begin
            m2b_cmd_s0_priority_counter <= 2'b00;
          end
        end
      end
      if(m2b_cmd_s0_valid)begin
        m2b_cmd_s1_valid <= 1'b1;
      end
      if(m2b_cmd_s1_valid)begin
        if(io_read_cmd_ready)begin
          m2b_cmd_s0_valid <= 1'b0;
          m2b_cmd_s1_valid <= 1'b0;
          if(_zz_80)begin
            if(m2b_cmd_s1_lastBurst)begin
              channels_0_push_m2b_loadDone <= 1'b1;
            end
          end
        end
      end
      if((io_read_rsp_valid && io_read_rsp_ready))begin
        m2b_rsp_first <= io_read_rsp_payload_last;
      end
      if(_zz_90)begin
        if((channels_1_pop_b2m_request != 1'b0))begin
          b2m_fsm_arbiter_logic_valid <= 1'b1;
          if((2'b00 == _zz_23))begin
            b2m_fsm_arbiter_logic_priority_roundRobins_0 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          if((2'b01 == _zz_23))begin
            b2m_fsm_arbiter_logic_priority_roundRobins_1 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          if((2'b10 == _zz_23))begin
            b2m_fsm_arbiter_logic_priority_roundRobins_2 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          if((2'b11 == _zz_23))begin
            b2m_fsm_arbiter_logic_priority_roundRobins_3 <= b2m_fsm_arbiter_logic_priority_contextNext;
          end
          b2m_fsm_arbiter_logic_priority_counter <= (b2m_fsm_arbiter_logic_priority_counter + 2'b01);
          if(b2m_fsm_arbiter_logic_priority_weightLast)begin
            b2m_fsm_arbiter_logic_priority_counter <= 2'b00;
          end
        end
      end
      if(b2m_fsm_sel_ready)begin
        b2m_fsm_sel_valid <= 1'b0;
        if(b2m_fsm_sel_valid)begin
          b2m_fsm_arbiter_logic_valid <= 1'b0;
        end
      end
      if(_zz_88)begin
        b2m_fsm_sel_valid <= 1'b1;
      end
      b2m_fsm_sel_valid_regNext <= b2m_fsm_sel_valid;
      b2m_fsm_s1 <= b2m_fsm_s0;
      if(b2m_fsm_s1)begin
        b2m_fsm_s2 <= 1'b1;
      end
      if((! b2m_fsm_sel_valid))begin
        b2m_fsm_s2 <= 1'b0;
      end
      b2m_fsm_toggle <= (b2m_fsm_toggle ^ (b2m_fsm_sel_valid && b2m_fsm_sel_ready));
      if(memory_core_io_reads_1_rsp_s2mPipe_ready)begin
        memory_core_io_reads_1_rsp_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_94)begin
        memory_core_io_reads_1_rsp_s2mPipe_rValid <= memory_core_io_reads_1_rsp_valid;
      end
      _zz_31 <= (b2m_fsm_sel_valid && (! b2m_fsm_sel_ready));
      if((io_write_cmd_valid && io_write_cmd_ready))begin
        io_write_cmd_payload_first <= io_write_cmd_payload_last;
      end
      if(_zz_95)begin
        if(({_zz_35,channels_0_ll_requestLl} != 2'b00))begin
          ll_cmd_valid <= 1'b1;
        end
      end else begin
        if((ll_cmd_writeFired && ll_cmd_readFired))begin
          ll_cmd_valid <= 1'b0;
        end
      end
      if(_zz_96)begin
        ll_readRsp_beatCounter <= (ll_readRsp_beatCounter + 2'b01);
      end
      if(_zz_44)begin
        if(_zz_180[0])begin
          channels_0_ctrl_kick <= _zz_181[0];
        end
      end
      if(_zz_47)begin
        if(_zz_186[0])begin
          channels_0_interrupts_completion_valid <= _zz_187[0];
        end
      end
      if(_zz_48)begin
        if(_zz_188[0])begin
          channels_0_interrupts_onChannelCompletion_valid <= _zz_189[0];
        end
      end
      if(_zz_49)begin
        if(_zz_190[0])begin
          channels_0_interrupts_onLinkedListUpdate_valid <= _zz_191[0];
        end
      end
      if(_zz_51)begin
        if(_zz_194[0])begin
          channels_1_ctrl_kick <= _zz_195[0];
        end
      end
      if(_zz_54)begin
        if(_zz_200[0])begin
          channels_1_interrupts_completion_valid <= _zz_201[0];
        end
      end
      if(_zz_55)begin
        if(_zz_202[0])begin
          channels_1_interrupts_onChannelCompletion_valid <= _zz_203[0];
        end
      end
      if(_zz_56)begin
        if(_zz_204[0])begin
          channels_1_interrupts_onLinkedListUpdate_valid <= _zz_205[0];
        end
      end
      if(_zz_57)begin
        if(_zz_206[0])begin
          channels_1_interrupts_s2mPacket_valid <= _zz_207[0];
        end
      end
      case(io_ctrl_PADDR)
        14'h0044 : begin
          if(ctrl_doWrite)begin
            channels_0_priority <= io_ctrl_PWDATA[1 : 0];
            channels_0_weight <= io_ctrl_PWDATA[9 : 8];
          end
        end
        14'h0050 : begin
          if(ctrl_doWrite)begin
            channels_0_interrupts_completion_enable <= _zz_214[0];
            channels_0_interrupts_onChannelCompletion_enable <= _zz_215[0];
            channels_0_interrupts_onLinkedListUpdate_enable <= _zz_216[0];
          end
        end
        14'h00c4 : begin
          if(ctrl_doWrite)begin
            channels_1_priority <= io_ctrl_PWDATA[1 : 0];
            channels_1_weight <= io_ctrl_PWDATA[9 : 8];
          end
        end
        14'h00d0 : begin
          if(ctrl_doWrite)begin
            channels_1_interrupts_completion_enable <= _zz_224[0];
            channels_1_interrupts_onChannelCompletion_enable <= _zz_225[0];
            channels_1_interrupts_onLinkedListUpdate_enable <= _zz_226[0];
            channels_1_interrupts_s2mPacket_enable <= _zz_227[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(channels_0_descriptorStart)begin
      channels_0_ll_packet <= 1'b0;
    end
    if(channels_0_descriptorStart)begin
      channels_0_ll_requireSync <= 1'b0;
    end
    if(_zz_77)begin
      channels_0_ll_waitDone <= 1'b0;
      if(_zz_78)begin
        channels_0_ll_head <= 1'b0;
      end
    end
    if(channels_0_channelStart)begin
      channels_0_ll_waitDone <= 1'b0;
      channels_0_ll_head <= 1'b1;
    end
    channels_0_fifo_push_ptr <= (channels_0_fifo_push_ptr + channels_0_fifo_push_ptrIncr_value);
    if(channels_0_channelStart)begin
      channels_0_fifo_push_ptr <= 11'h0;
    end
    channels_0_fifo_pop_ptr <= (channels_0_fifo_pop_ptr + channels_0_fifo_pop_ptrIncr_value);
    channels_0_fifo_pop_withoutOverride_exposed <= (_zz_97 - channels_0_fifo_pop_bytesDecr_value);
    if(channels_0_channelStart)begin
      channels_0_fifo_pop_withoutOverride_exposed <= 13'h0;
    end
    if(channels_0_descriptorStart)begin
      channels_0_push_m2b_bytesLeft <= channels_0_bytes;
    end
    if(channels_0_pop_b2s_veryLastTrigger)begin
      channels_0_pop_b2s_veryLastValid <= 1'b1;
    end
    if(channels_0_pop_b2s_veryLastTrigger)begin
      channels_0_pop_b2s_veryLastPtr <= channels_0_fifo_push_ptrWithBase;
      channels_0_pop_b2s_veryLastEndPacket <= channels_0_pop_b2s_last;
    end
    if(channels_0_channelStart)begin
      channels_0_pop_b2s_veryLastValid <= 1'b0;
    end
    if(channels_0_channelValid)begin
      if(! channels_0_channelStop) begin
        if((! channels_0_descriptorValid))begin
          if((_zz_1 && channels_0_readyForChannelCompletion))begin
            channels_0_channelStop <= 1'b1;
          end
        end
      end
    end
    channels_0_fifo_pop_ptrIncr_value_regNext <= channels_0_fifo_pop_ptrIncr_value;
    channels_0_fifo_push_available <= (_zz_106 - (channels_0_push_memory ? channels_0_fifo_push_availableDecr : channels_0_fifo_push_ptrIncr_value));
    if(channels_0_channelStart)begin
      channels_0_fifo_push_ptr <= 11'h0;
      channels_0_fifo_push_available <= (channels_0_fifo_words + 11'h001);
      channels_0_fifo_pop_ptr <= 11'h0;
    end
    if(channels_1_bytesProbe_incr_valid)begin
      channels_1_bytesProbe_value <= (_zz_107 + 27'h0000001);
    end
    if(channels_1_descriptorStart)begin
      channels_1_ll_packet <= 1'b0;
    end
    if(channels_1_descriptorStart)begin
      channels_1_ll_requireSync <= 1'b0;
    end
    if(_zz_82)begin
      channels_1_ll_waitDone <= 1'b0;
      if(_zz_83)begin
        channels_1_ll_head <= 1'b0;
      end
    end
    if(channels_1_channelStart)begin
      channels_1_ll_waitDone <= 1'b0;
      channels_1_ll_head <= 1'b1;
    end
    channels_1_fifo_push_ptr <= (channels_1_fifo_push_ptr + channels_1_fifo_push_ptrIncr_value);
    if(channels_1_channelStart)begin
      channels_1_fifo_push_ptr <= 11'h0;
    end
    channels_1_fifo_pop_ptr <= (channels_1_fifo_pop_ptr + channels_1_fifo_pop_ptrIncr_value);
    channels_1_fifo_pop_withOverride_backup <= channels_1_fifo_pop_withOverride_backupNext;
    if((channels_1_channelStart || channels_1_fifo_pop_withOverride_unload))begin
      channels_1_fifo_pop_withOverride_valid <= 1'b0;
    end
    if(channels_1_fifo_pop_withOverride_load)begin
      channels_1_fifo_pop_withOverride_valid <= 1'b1;
    end
    channels_1_fifo_pop_withOverride_exposed <= ((! channels_1_fifo_pop_withOverride_valid) ? channels_1_fifo_pop_withOverride_backupNext : _zz_110);
    if(channels_1_channelStart)begin
      channels_1_fifo_pop_withOverride_backup <= 13'h0;
      channels_1_fifo_pop_withOverride_valid <= 1'b0;
    end
    if(channels_1_channelStart)begin
      channels_1_push_s2b_packetLock <= 1'b0;
    end
    if(channels_1_pop_b2m_fire)begin
      channels_1_pop_b2m_flush <= 1'b0;
    end
    if((channels_1_channelStart || channels_1_pop_b2m_fire))begin
      channels_1_pop_b2m_packet <= 1'b0;
    end
    if((channels_1_pop_b2m_bytesLeft < _zz_119))begin
      channels_1_pop_b2m_flush <= 1'b1;
    end
    if(_zz_89)begin
      channels_1_pop_b2m_flush <= 1'b0;
      channels_1_pop_b2m_packet <= 1'b0;
    end
    if(channels_1_pop_b2m_packetSync)begin
      channels_1_push_s2b_packetLock <= 1'b0;
      if(_zz_85)begin
        if(! channels_1_push_s2b_completionOnLast) begin
          if((! channels_1_pop_b2m_waitFinalRsp))begin
            channels_1_ll_requireSync <= 1'b1;
          end
        end
        channels_1_ll_packet <= 1'b1;
      end
    end
    if(channels_1_channelStart)begin
      channels_1_pop_b2m_bytesToSkip <= 3'b000;
      channels_1_pop_b2m_flush <= 1'b0;
    end
    if(channels_1_descriptorStart)begin
      channels_1_pop_b2m_bytesLeft <= {1'd0, channels_1_bytes};
      channels_1_pop_b2m_waitFinalRsp <= 1'b0;
    end
    if(channels_1_channelValid)begin
      if(! channels_1_channelStop) begin
        if((! channels_1_descriptorValid))begin
          if((_zz_2 && channels_1_readyForChannelCompletion))begin
            channels_1_channelStop <= 1'b1;
          end
        end
      end
    end
    channels_1_fifo_pop_ptrIncr_value_regNext <= channels_1_fifo_pop_ptrIncr_value;
    channels_1_fifo_push_available <= (_zz_120 - (channels_1_push_memory ? channels_1_fifo_push_availableDecr : channels_1_fifo_push_ptrIncr_value));
    if(channels_1_channelStart)begin
      channels_1_fifo_push_ptr <= 11'h0;
      channels_1_fifo_push_available <= (channels_1_fifo_words + 11'h001);
      channels_1_fifo_pop_ptr <= 11'h0;
    end
    if((channels_1_channelStart || channels_1_descriptorStart))begin
      channels_1_bytesProbe_value <= 27'h0;
    end
    if(_zz_12)begin
      channels_1_push_s2b_waitFirst <= 1'b0;
      if(io_inputs_0_payload_last)begin
        channels_1_push_s2b_packetLock <= 1'b1;
      end
    end
    if((_zz_14 && s2b_0_rsp_context_flush))begin
      channels_1_pop_b2m_flush <= 1'b1;
    end
    if((_zz_14 && s2b_0_rsp_context_packet))begin
      channels_1_pop_b2m_packet <= 1'b1;
    end
    if(((io_outputs_0_valid && io_outputs_0_ready) && b2s_0_rsp_context_veryLast))begin
      if(b2s_0_rsp_context_channel[0])begin
        channels_0_pop_b2s_veryLastValid <= 1'b0;
      end
    end
    m2b_cmd_s1_address <= m2b_cmd_s0_address;
    m2b_cmd_s1_length <= m2b_cmd_s0_length;
    m2b_cmd_s1_lastBurst <= m2b_cmd_s0_lastBurst;
    m2b_cmd_s1_bytesLeft <= m2b_cmd_s0_bytesLeft;
    if(m2b_cmd_s1_valid)begin
      if(io_read_cmd_ready)begin
        if(_zz_80)begin
          channels_0_push_m2b_address <= m2b_cmd_s1_addressNext;
          channels_0_push_m2b_bytesLeft <= m2b_cmd_s1_byteLeftNext;
        end
      end
    end
    if(_zz_88)begin
      b2m_fsm_sel_address <= channels_1_pop_b2m_address;
      b2m_fsm_sel_ptr <= channels_1_fifo_pop_ptrWithBase;
      b2m_fsm_sel_ptrMask <= channels_1_fifo_words;
      b2m_fsm_sel_bytePerBurst <= channels_1_pop_b2m_bytePerBurst;
      b2m_fsm_sel_bytesInFifo <= channels_1_fifo_pop_bytes;
      b2m_fsm_sel_flush <= channels_1_pop_b2m_flush;
      b2m_fsm_sel_packet <= channels_1_pop_b2m_packet;
      b2m_fsm_sel_bytesLeft <= channels_1_pop_b2m_bytesLeft[25:0];
    end
    if(b2m_fsm_s0)begin
      b2m_fsm_sel_bytesInBurst <= _zz_159[10:0];
    end
    if(b2m_fsm_s1)begin
      b2m_fsm_beatCounter <= (_zz_164 >>> 3);
      if(_zz_91)begin
        channels_1_pop_b2m_address <= b2m_fsm_addressNext;
        channels_1_pop_b2m_bytesLeft <= b2m_fsm_bytesLeftNext;
        if(b2m_fsm_isFinalCmd)begin
          channels_1_pop_b2m_waitFinalRsp <= 1'b1;
        end
        if((! b2m_fsm_fifoCompletion))begin
          if(b2m_fsm_sel_flush)begin
            channels_1_pop_b2m_flush <= 1'b1;
          end
          if(b2m_fsm_sel_packet)begin
            channels_1_pop_b2m_packet <= 1'b1;
          end
        end
      end
    end
    if((b2m_fsm_sel_valid && memory_core_io_reads_1_cmd_ready))begin
      b2m_fsm_sel_ptr <= ((b2m_fsm_sel_ptr & (~ b2m_fsm_sel_ptrMask)) | (_zz_167 & b2m_fsm_sel_ptrMask));
    end
    if(_zz_94)begin
      memory_core_io_reads_1_rsp_s2mPipe_rData_data <= memory_core_io_reads_1_rsp_payload_data;
      memory_core_io_reads_1_rsp_s2mPipe_rData_mask <= memory_core_io_reads_1_rsp_payload_mask;
      memory_core_io_reads_1_rsp_s2mPipe_rData_context <= memory_core_io_reads_1_rsp_payload_context;
    end
    if((b2m_fsm_aggregate_memoryPort_valid && b2m_fsm_aggregate_memoryPort_ready))begin
      b2m_fsm_aggregate_first <= 1'b0;
    end
    if((! (b2m_fsm_sel_valid && (! b2m_fsm_sel_ready))))begin
      b2m_fsm_aggregate_first <= 1'b1;
    end
    b2m_fsm_cmd_maskLastTriggerReg <= b2m_fsm_cmd_maskLastTriggerComb;
    b2m_fsm_cmd_maskLast <= _zz_32;
    if((io_write_cmd_valid && io_write_cmd_ready))begin
      b2m_fsm_beatCounter <= (b2m_fsm_beatCounter - 8'h01);
    end
    if(_zz_92)begin
      if(_zz_170[0])begin
        channels_1_pop_b2m_bytesToSkip <= (b2m_fsm_aggregate_engine_io_output_usedUntil + 3'b001);
      end
    end
    if((! ll_cmd_valid))begin
      ll_cmd_oh_0 <= channels_0_ll_requestLl;
      ll_cmd_oh_1 <= _zz_35;
    end
    if((! ll_cmd_valid))begin
      ll_cmd_ptr <= (_zz_38[0] ? channels_0_ll_ptr : channels_1_ll_ptr);
    end
    if((! ll_cmd_valid))begin
      ll_cmd_ptrNext <= (_zz_39[0] ? channels_0_ll_ptrNext : channels_1_ll_ptrNext);
    end
    if((! ll_cmd_valid))begin
      ll_cmd_bytesDone <= channels_1_bytesProbe_value;
    end
    if((! ll_cmd_valid))begin
      ll_cmd_endOfPacket <= (_zz_40[0] ? channels_0_ll_packet : channels_1_ll_packet);
    end
    if((! ll_cmd_valid))begin
      ll_cmd_isJustASink <= ll_arbiter_isJustASink;
    end
    if(_zz_95)begin
      ll_cmd_oh_0 <= channels_0_ll_requestLl;
      ll_cmd_oh_1 <= _zz_35;
      if(channels_0_ll_requestLl)begin
        channels_0_ll_waitDone <= 1'b1;
        channels_0_ll_writeDone <= ll_arbiter_head;
        channels_0_ll_justASync <= ll_arbiter_isJustASink;
        channels_0_ll_packet <= 1'b0;
        channels_0_ll_requireSync <= 1'b0;
        if((! ll_arbiter_isJustASink))begin
          channels_0_ll_ptr <= channels_0_ll_ptrNext;
        end
        channels_0_ll_readDone <= ll_arbiter_isJustASink;
      end
      if(_zz_35)begin
        channels_1_ll_waitDone <= 1'b1;
        channels_1_ll_writeDone <= ll_arbiter_head;
        channels_1_ll_justASync <= ll_arbiter_isJustASink;
        channels_1_ll_packet <= 1'b0;
        channels_1_ll_requireSync <= 1'b0;
        if((! ll_arbiter_isJustASink))begin
          channels_1_ll_ptr <= channels_1_ll_ptrNext;
        end
        channels_1_ll_readDone <= ll_arbiter_isJustASink;
      end
      ll_cmd_readFired <= ll_arbiter_isJustASink;
      ll_cmd_writeFired <= ll_arbiter_head;
    end
    if((io_sgRead_cmd_valid && io_sgRead_cmd_ready))begin
      ll_cmd_readFired <= 1'b1;
    end
    if((io_sgWrite_cmd_valid && io_sgWrite_cmd_ready))begin
      ll_cmd_writeFired <= 1'b1;
    end
    if(_zz_96)begin
      if((2'b01 == ll_readRsp_beatCounter))begin
        if(ll_readRsp_oh_0)begin
          channels_0_push_m2b_address <= io_sgRead_rsp_payload_fragment_data[31 : 0];
        end
      end
      if((2'b10 == ll_readRsp_beatCounter))begin
        if(ll_readRsp_oh_1)begin
          channels_1_pop_b2m_address <= io_sgRead_rsp_payload_fragment_data[31 : 0];
        end
      end
      if((2'b11 == ll_readRsp_beatCounter))begin
        if(ll_readRsp_oh_0)begin
          channels_0_ll_ptrNext <= io_sgRead_rsp_payload_fragment_data[31 : 0];
        end
        if(ll_readRsp_oh_1)begin
          channels_1_ll_ptrNext <= io_sgRead_rsp_payload_fragment_data[31 : 0];
        end
      end
      if((2'b00 == ll_readRsp_beatCounter))begin
        if(ll_readRsp_oh_0)begin
          channels_0_bytes <= io_sgRead_rsp_payload_fragment_data[57 : 32];
        end
        if(ll_readRsp_oh_1)begin
          channels_1_bytes <= io_sgRead_rsp_payload_fragment_data[57 : 32];
        end
      end
      if((2'b00 == ll_readRsp_beatCounter))begin
        if(ll_readRsp_oh_0)begin
          channels_0_pop_b2s_last <= _zz_175[0];
        end
      end
      if((2'b00 == ll_readRsp_beatCounter))begin
        if(ll_readRsp_oh_0)begin
          channels_0_ll_gotDescriptorStall <= _zz_176[0];
        end
        if(ll_readRsp_oh_1)begin
          channels_1_ll_gotDescriptorStall <= _zz_177[0];
        end
      end
      if(io_sgRead_rsp_payload_last)begin
        if(ll_readRsp_oh_0)begin
          channels_0_ll_readDone <= 1'b1;
        end
        if(ll_readRsp_oh_1)begin
          channels_1_ll_readDone <= 1'b1;
        end
      end
    end
    if((io_sgWrite_rsp_valid && io_sgWrite_rsp_ready))begin
      if(ll_writeRsp_oh_0)begin
        channels_0_ll_writeDone <= 1'b1;
      end
      if(ll_writeRsp_oh_1)begin
        channels_1_ll_writeDone <= 1'b1;
      end
    end
    case(io_ctrl_PADDR)
      14'h0 : begin
        if(ctrl_doWrite)begin
          channels_0_push_m2b_address[31 : 0] <= _zz_209;
        end
      end
      14'h000c : begin
        if(ctrl_doWrite)begin
          channels_0_push_memory <= _zz_210[0];
        end
      end
      14'h0018 : begin
        if(ctrl_doWrite)begin
          channels_0_pop_b2s_sinkId <= io_ctrl_PWDATA[19 : 16];
        end
      end
      14'h001c : begin
        if(ctrl_doWrite)begin
          channels_0_pop_memory <= _zz_211[0];
          channels_0_pop_b2s_last <= _zz_212[0];
        end
      end
      14'h002c : begin
        if(ctrl_doWrite)begin
          channels_0_channelStop <= _zz_213[0];
        end
      end
      14'h0020 : begin
        if(ctrl_doWrite)begin
          channels_0_bytes <= io_ctrl_PWDATA[25 : 0];
        end
      end
      14'h0070 : begin
        if(ctrl_doWrite)begin
          channels_0_ll_ptrNext <= io_ctrl_PWDATA[31 : 0];
        end
      end
      14'h008c : begin
        if(ctrl_doWrite)begin
          channels_1_push_memory <= _zz_217[0];
          channels_1_push_s2b_completionOnLast <= _zz_218[0];
          channels_1_push_s2b_waitFirst <= _zz_219[0];
        end
      end
      14'h0090 : begin
        if(ctrl_doWrite)begin
          channels_1_pop_b2m_address[31 : 0] <= _zz_221;
        end
      end
      14'h009c : begin
        if(ctrl_doWrite)begin
          channels_1_pop_memory <= _zz_222[0];
        end
      end
      14'h00ac : begin
        if(ctrl_doWrite)begin
          channels_1_channelStop <= _zz_223[0];
        end
      end
      14'h00a0 : begin
        if(ctrl_doWrite)begin
          channels_1_bytes <= io_ctrl_PWDATA[25 : 0];
        end
      end
      14'h00f0 : begin
        if(ctrl_doWrite)begin
          channels_1_ll_ptrNext <= io_ctrl_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module EfxDMA_BufferCC_3 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               dat0_o_clk,
  input               dat0_o_reset
);
  (* async_reg *) reg        [4:0]    buffers_0;
  (* async_reg *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge dat0_o_clk) begin
    if(dat0_o_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//EfxDMA_BufferCC_1 replaced by EfxDMA_BufferCC_1

module EfxDMA_BufferCC_1 (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg *) reg        [4:0]    buffers_0;
  (* async_reg *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk) begin
    if(reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxDMA_BufferCC (
  input      [4:0]    io_dataIn,
  output     [4:0]    io_dataOut,
  input               dat1_i_clk,
  input               dat1_i_reset
);
  (* async_reg *) reg        [4:0]    buffers_0;
  (* async_reg *) reg        [4:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge dat1_i_clk) begin
    if(dat1_i_reset) begin
      buffers_0 <= 5'h0;
      buffers_1 <= 5'h0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module EfxDMA_StreamFork_2 (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment_opcode,
  input      [31:0]   io_input_payload_fragment_address,
  input      [10:0]   io_input_payload_fragment_length,
  input      [63:0]   io_input_payload_fragment_data,
  input      [7:0]    io_input_payload_fragment_mask,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_last,
  output     [0:0]    io_outputs_0_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_payload_fragment_address,
  output     [10:0]   io_outputs_0_payload_fragment_length,
  output     [63:0]   io_outputs_0_payload_fragment_data,
  output     [7:0]    io_outputs_0_payload_fragment_mask,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_last,
  output     [0:0]    io_outputs_1_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_payload_fragment_address,
  output     [10:0]   io_outputs_1_payload_fragment_length,
  output     [63:0]   io_outputs_1_payload_fragment_data,
  output     [7:0]    io_outputs_1_payload_fragment_mask,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg                 _zz_2;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1);
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_0_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_0_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_0_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_0_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_1_valid = (io_input_valid && _zz_2);
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_1_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_1_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_1_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_1_payload_fragment_mask = io_input_payload_fragment_mask;
  always @ (posedge clk) begin
    if(reset) begin
      _zz_1 <= 1'b1;
      _zz_2 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2 <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1 <= 1'b1;
        _zz_2 <= 1'b1;
      end
    end
  end


endmodule

module EfxDMA_BmbContextRemover_1 (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [10:0]   io_input_cmd_payload_fragment_length,
  input      [63:0]   io_input_cmd_payload_fragment_data,
  input      [7:0]    io_input_cmd_payload_fragment_mask,
  input      [12:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [12:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [10:0]   io_output_cmd_payload_fragment_length,
  output     [63:0]   io_output_cmd_payload_fragment_data,
  output     [7:0]    io_output_cmd_payload_fragment_mask,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input               clk,
  input               reset
);
  reg                 _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                io_input_cmd_fork_io_input_ready;
  wire                io_input_cmd_fork_io_outputs_0_valid;
  wire                io_input_cmd_fork_io_outputs_0_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  wire       [10:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  wire       [63:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_data;
  wire       [7:0]    io_input_cmd_fork_io_outputs_0_payload_fragment_mask;
  wire       [12:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_1_valid;
  wire                io_input_cmd_fork_io_outputs_1_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  wire       [10:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  wire       [63:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_data;
  wire       [7:0]    io_input_cmd_fork_io_outputs_1_payload_fragment_mask;
  wire       [12:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid;
  wire       [12:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability;
  wire                _zz_5;
  reg                 io_input_cmd_fork_io_outputs_0_payload_first;
  reg                 io_input_cmd_fork_io_outputs_0_thrown_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address;
  wire       [10:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length;
  wire       [63:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_data;
  wire       [7:0]    io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_mask;
  wire       [12:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  wire       [12:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_payload;
  wire                _zz_1;

  assign _zz_5 = (! io_input_cmd_fork_io_outputs_0_payload_first);
  EfxDMA_StreamFork_1 io_input_cmd_fork (
    .io_input_valid                           (io_input_cmd_valid                                             ), //i
    .io_input_ready                           (io_input_cmd_fork_io_input_ready                               ), //o
    .io_input_payload_last                    (io_input_cmd_payload_last                                      ), //i
    .io_input_payload_fragment_opcode         (io_input_cmd_payload_fragment_opcode                           ), //i
    .io_input_payload_fragment_address        (io_input_cmd_payload_fragment_address[31:0]                    ), //i
    .io_input_payload_fragment_length         (io_input_cmd_payload_fragment_length[10:0]                     ), //i
    .io_input_payload_fragment_data           (io_input_cmd_payload_fragment_data[63:0]                       ), //i
    .io_input_payload_fragment_mask           (io_input_cmd_payload_fragment_mask[7:0]                        ), //i
    .io_input_payload_fragment_context        (io_input_cmd_payload_fragment_context[12:0]                    ), //i
    .io_outputs_0_valid                       (io_input_cmd_fork_io_outputs_0_valid                           ), //o
    .io_outputs_0_ready                       (_zz_2                                                          ), //i
    .io_outputs_0_payload_last                (io_input_cmd_fork_io_outputs_0_payload_last                    ), //o
    .io_outputs_0_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_0_payload_fragment_opcode         ), //o
    .io_outputs_0_payload_fragment_address    (io_input_cmd_fork_io_outputs_0_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_payload_fragment_length     (io_input_cmd_fork_io_outputs_0_payload_fragment_length[10:0]   ), //o
    .io_outputs_0_payload_fragment_data       (io_input_cmd_fork_io_outputs_0_payload_fragment_data[63:0]     ), //o
    .io_outputs_0_payload_fragment_mask       (io_input_cmd_fork_io_outputs_0_payload_fragment_mask[7:0]      ), //o
    .io_outputs_0_payload_fragment_context    (io_input_cmd_fork_io_outputs_0_payload_fragment_context[12:0]  ), //o
    .io_outputs_1_valid                       (io_input_cmd_fork_io_outputs_1_valid                           ), //o
    .io_outputs_1_ready                       (io_output_cmd_ready                                            ), //i
    .io_outputs_1_payload_last                (io_input_cmd_fork_io_outputs_1_payload_last                    ), //o
    .io_outputs_1_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_1_payload_fragment_opcode         ), //o
    .io_outputs_1_payload_fragment_address    (io_input_cmd_fork_io_outputs_1_payload_fragment_address[31:0]  ), //o
    .io_outputs_1_payload_fragment_length     (io_input_cmd_fork_io_outputs_1_payload_fragment_length[10:0]   ), //o
    .io_outputs_1_payload_fragment_data       (io_input_cmd_fork_io_outputs_1_payload_fragment_data[63:0]     ), //o
    .io_outputs_1_payload_fragment_mask       (io_input_cmd_fork_io_outputs_1_payload_fragment_mask[7:0]      ), //o
    .io_outputs_1_payload_fragment_context    (io_input_cmd_fork_io_outputs_1_payload_fragment_context[12:0]  ), //o
    .clk                                      (clk                                                            ), //i
    .reset                                    (reset                                                          )  //i
  );
  EfxDMA_StreamFifo_1 io_input_cmd_fork_io_outputs_0_thrown_translated_fifo (
    .io_push_valid      (io_input_cmd_fork_io_outputs_0_thrown_translated_valid                      ), //i
    .io_push_ready      (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready         ), //o
    .io_push_payload    (io_input_cmd_fork_io_outputs_0_thrown_translated_payload[12:0]              ), //i
    .io_pop_valid       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid          ), //o
    .io_pop_ready       (_zz_3                                                                       ), //i
    .io_pop_payload     (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload[12:0]  ), //o
    .io_flush           (_zz_4                                                                       ), //i
    .io_occupancy       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy[2:0]     ), //o
    .io_availability    (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability[2:0]  ), //o
    .clk                (clk                                                                         ), //i
    .reset              (reset                                                                       )  //i
  );
  assign io_input_cmd_ready = io_input_cmd_fork_io_input_ready;
  assign io_output_cmd_valid = io_input_cmd_fork_io_outputs_1_valid;
  assign io_output_cmd_payload_last = io_input_cmd_fork_io_outputs_1_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = io_input_cmd_fork_io_outputs_1_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = io_input_cmd_fork_io_outputs_1_payload_fragment_mask;
  always @ (*) begin
    io_input_cmd_fork_io_outputs_0_thrown_valid = io_input_cmd_fork_io_outputs_0_valid;
    if(_zz_5)begin
      io_input_cmd_fork_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_2 = io_input_cmd_fork_io_outputs_0_thrown_ready;
    if(_zz_5)begin
      _zz_2 = 1'b1;
    end
  end

  assign io_input_cmd_fork_io_outputs_0_thrown_payload_last = io_input_cmd_fork_io_outputs_0_payload_last;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode = io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address = io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length = io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_data = io_input_cmd_fork_io_outputs_0_payload_fragment_data;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_mask = io_input_cmd_fork_io_outputs_0_payload_fragment_mask;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_valid = io_input_cmd_fork_io_outputs_0_thrown_valid;
  assign io_input_cmd_fork_io_outputs_0_thrown_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_payload = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  assign _zz_3 = ((io_output_rsp_valid && io_output_rsp_payload_last) && io_input_rsp_ready);
  assign _zz_1 = (! (! io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid));
  assign io_output_rsp_ready = (io_input_rsp_ready && _zz_1);
  assign io_input_rsp_valid = (io_output_rsp_valid && _zz_1);
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_context = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  assign _zz_4 = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      io_input_cmd_fork_io_outputs_0_payload_first <= 1'b1;
    end else begin
      if((io_input_cmd_fork_io_outputs_0_valid && _zz_2))begin
        io_input_cmd_fork_io_outputs_0_payload_first <= io_input_cmd_fork_io_outputs_0_payload_last;
      end
    end
  end


endmodule

module EfxDMA_BmbContextRemover (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [10:0]   io_input_cmd_payload_fragment_length,
  input      [18:0]   io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [63:0]   io_input_rsp_payload_fragment_data,
  output     [18:0]   io_input_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [31:0]   io_output_cmd_payload_fragment_address,
  output     [10:0]   io_output_cmd_payload_fragment_length,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [63:0]   io_output_rsp_payload_fragment_data,
  input               clk,
  input               reset
);
  reg                 _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                io_input_cmd_fork_io_input_ready;
  wire                io_input_cmd_fork_io_outputs_0_valid;
  wire                io_input_cmd_fork_io_outputs_0_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  wire       [10:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  wire       [18:0]   io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_1_valid;
  wire                io_input_cmd_fork_io_outputs_1_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  wire       [10:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  wire       [18:0]   io_input_cmd_fork_io_outputs_1_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid;
  wire       [18:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy;
  wire       [2:0]    io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability;
  wire                _zz_5;
  reg                 io_input_cmd_fork_io_outputs_0_payload_first;
  reg                 io_input_cmd_fork_io_outputs_0_thrown_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_ready;
  wire                io_input_cmd_fork_io_outputs_0_thrown_payload_last;
  wire       [0:0]    io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode;
  wire       [31:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address;
  wire       [10:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length;
  wire       [18:0]   io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_valid;
  wire                io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  wire       [18:0]   io_input_cmd_fork_io_outputs_0_thrown_translated_payload;
  wire                _zz_1;

  assign _zz_5 = (! io_input_cmd_fork_io_outputs_0_payload_first);
  EfxDMA_StreamFork io_input_cmd_fork (
    .io_input_valid                           (io_input_cmd_valid                                             ), //i
    .io_input_ready                           (io_input_cmd_fork_io_input_ready                               ), //o
    .io_input_payload_last                    (io_input_cmd_payload_last                                      ), //i
    .io_input_payload_fragment_opcode         (io_input_cmd_payload_fragment_opcode                           ), //i
    .io_input_payload_fragment_address        (io_input_cmd_payload_fragment_address[31:0]                    ), //i
    .io_input_payload_fragment_length         (io_input_cmd_payload_fragment_length[10:0]                     ), //i
    .io_input_payload_fragment_context        (io_input_cmd_payload_fragment_context[18:0]                    ), //i
    .io_outputs_0_valid                       (io_input_cmd_fork_io_outputs_0_valid                           ), //o
    .io_outputs_0_ready                       (_zz_2                                                          ), //i
    .io_outputs_0_payload_last                (io_input_cmd_fork_io_outputs_0_payload_last                    ), //o
    .io_outputs_0_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_0_payload_fragment_opcode         ), //o
    .io_outputs_0_payload_fragment_address    (io_input_cmd_fork_io_outputs_0_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_payload_fragment_length     (io_input_cmd_fork_io_outputs_0_payload_fragment_length[10:0]   ), //o
    .io_outputs_0_payload_fragment_context    (io_input_cmd_fork_io_outputs_0_payload_fragment_context[18:0]  ), //o
    .io_outputs_1_valid                       (io_input_cmd_fork_io_outputs_1_valid                           ), //o
    .io_outputs_1_ready                       (io_output_cmd_ready                                            ), //i
    .io_outputs_1_payload_last                (io_input_cmd_fork_io_outputs_1_payload_last                    ), //o
    .io_outputs_1_payload_fragment_opcode     (io_input_cmd_fork_io_outputs_1_payload_fragment_opcode         ), //o
    .io_outputs_1_payload_fragment_address    (io_input_cmd_fork_io_outputs_1_payload_fragment_address[31:0]  ), //o
    .io_outputs_1_payload_fragment_length     (io_input_cmd_fork_io_outputs_1_payload_fragment_length[10:0]   ), //o
    .io_outputs_1_payload_fragment_context    (io_input_cmd_fork_io_outputs_1_payload_fragment_context[18:0]  ), //o
    .clk                                      (clk                                                            ), //i
    .reset                                    (reset                                                          )  //i
  );
  EfxDMA_StreamFifo io_input_cmd_fork_io_outputs_0_thrown_translated_fifo (
    .io_push_valid      (io_input_cmd_fork_io_outputs_0_thrown_translated_valid                      ), //i
    .io_push_ready      (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready         ), //o
    .io_push_payload    (io_input_cmd_fork_io_outputs_0_thrown_translated_payload[18:0]              ), //i
    .io_pop_valid       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid          ), //o
    .io_pop_ready       (_zz_3                                                                       ), //i
    .io_pop_payload     (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload[18:0]  ), //o
    .io_flush           (_zz_4                                                                       ), //i
    .io_occupancy       (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_occupancy[2:0]     ), //o
    .io_availability    (io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_availability[2:0]  ), //o
    .clk                (clk                                                                         ), //i
    .reset              (reset                                                                       )  //i
  );
  assign io_input_cmd_ready = io_input_cmd_fork_io_input_ready;
  assign io_output_cmd_valid = io_input_cmd_fork_io_outputs_1_valid;
  assign io_output_cmd_payload_last = io_input_cmd_fork_io_outputs_1_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_input_cmd_fork_io_outputs_1_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_input_cmd_fork_io_outputs_1_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_input_cmd_fork_io_outputs_1_payload_fragment_length;
  always @ (*) begin
    io_input_cmd_fork_io_outputs_0_thrown_valid = io_input_cmd_fork_io_outputs_0_valid;
    if(_zz_5)begin
      io_input_cmd_fork_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_2 = io_input_cmd_fork_io_outputs_0_thrown_ready;
    if(_zz_5)begin
      _zz_2 = 1'b1;
    end
  end

  assign io_input_cmd_fork_io_outputs_0_thrown_payload_last = io_input_cmd_fork_io_outputs_0_payload_last;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_opcode = io_input_cmd_fork_io_outputs_0_payload_fragment_opcode;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_address = io_input_cmd_fork_io_outputs_0_payload_fragment_address;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_length = io_input_cmd_fork_io_outputs_0_payload_fragment_length;
  assign io_input_cmd_fork_io_outputs_0_thrown_payload_fragment_context = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_valid = io_input_cmd_fork_io_outputs_0_thrown_valid;
  assign io_input_cmd_fork_io_outputs_0_thrown_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_ready;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_payload = io_input_cmd_fork_io_outputs_0_payload_fragment_context;
  assign io_input_cmd_fork_io_outputs_0_thrown_translated_ready = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_push_ready;
  assign _zz_3 = ((io_output_rsp_valid && io_output_rsp_payload_last) && io_input_rsp_ready);
  assign _zz_1 = (! (! io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_valid));
  assign io_output_rsp_ready = (io_input_rsp_ready && _zz_1);
  assign io_input_rsp_valid = (io_output_rsp_valid && _zz_1);
  assign io_input_rsp_payload_last = io_output_rsp_payload_last;
  assign io_input_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_input_rsp_payload_fragment_context = io_input_cmd_fork_io_outputs_0_thrown_translated_fifo_io_pop_payload;
  assign _zz_4 = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      io_input_cmd_fork_io_outputs_0_payload_first <= 1'b1;
    end else begin
      if((io_input_cmd_fork_io_outputs_0_valid && _zz_2))begin
        io_input_cmd_fork_io_outputs_0_payload_first <= io_input_cmd_fork_io_outputs_0_payload_last;
      end
    end
  end


endmodule

module EfxDMA_StreamArbiter_1 (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input               io_inputs_0_payload_last,
  input      [0:0]    io_inputs_0_payload_fragment_source,
  input      [0:0]    io_inputs_0_payload_fragment_opcode,
  input      [31:0]   io_inputs_0_payload_fragment_address,
  input      [10:0]   io_inputs_0_payload_fragment_length,
  input      [63:0]   io_inputs_0_payload_fragment_data,
  input      [7:0]    io_inputs_0_payload_fragment_mask,
  input      [11:0]   io_inputs_0_payload_fragment_context,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input               io_inputs_1_payload_last,
  input      [0:0]    io_inputs_1_payload_fragment_source,
  input      [0:0]    io_inputs_1_payload_fragment_opcode,
  input      [31:0]   io_inputs_1_payload_fragment_address,
  input      [10:0]   io_inputs_1_payload_fragment_length,
  input      [63:0]   io_inputs_1_payload_fragment_data,
  input      [7:0]    io_inputs_1_payload_fragment_mask,
  input      [11:0]   io_inputs_1_payload_fragment_context,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment_source,
  output     [0:0]    io_output_payload_fragment_opcode,
  output     [31:0]   io_output_payload_fragment_address,
  output     [10:0]   io_output_payload_fragment_length,
  output     [63:0]   io_output_payload_fragment_data,
  output     [7:0]    io_output_payload_fragment_mask,
  output     [11:0]   io_output_payload_fragment_context,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz_6;
  wire       [1:0]    _zz_7;
  wire       [3:0]    _zz_8;
  wire       [0:0]    _zz_9;
  wire       [0:0]    _zz_10;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_1;
  wire       [3:0]    _zz_2;
  wire       [3:0]    _zz_3;
  wire       [1:0]    _zz_4;
  wire                _zz_5;

  assign _zz_6 = (_zz_2 - _zz_8);
  assign _zz_7 = {maskLocked_0,maskLocked_1};
  assign _zz_8 = {2'd0, _zz_7};
  assign _zz_9 = _zz_4[0 : 0];
  assign _zz_10 = _zz_4[1 : 1];
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_2 = {_zz_1,_zz_1};
  assign _zz_3 = (_zz_2 & (~ _zz_6));
  assign _zz_4 = (_zz_3[3 : 2] | _zz_3[1 : 0]);
  assign maskProposal_0 = _zz_9[0];
  assign maskProposal_1 = _zz_10[0];
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_last = (maskRouted_0 ? io_inputs_0_payload_last : io_inputs_1_payload_last);
  assign io_output_payload_fragment_source = (maskRouted_0 ? io_inputs_0_payload_fragment_source : io_inputs_1_payload_fragment_source);
  assign io_output_payload_fragment_opcode = (maskRouted_0 ? io_inputs_0_payload_fragment_opcode : io_inputs_1_payload_fragment_opcode);
  assign io_output_payload_fragment_address = (maskRouted_0 ? io_inputs_0_payload_fragment_address : io_inputs_1_payload_fragment_address);
  assign io_output_payload_fragment_length = (maskRouted_0 ? io_inputs_0_payload_fragment_length : io_inputs_1_payload_fragment_length);
  assign io_output_payload_fragment_data = (maskRouted_0 ? io_inputs_0_payload_fragment_data : io_inputs_1_payload_fragment_data);
  assign io_output_payload_fragment_mask = (maskRouted_0 ? io_inputs_0_payload_fragment_mask : io_inputs_1_payload_fragment_mask);
  assign io_output_payload_fragment_context = (maskRouted_0 ? io_inputs_0_payload_fragment_context : io_inputs_1_payload_fragment_context);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_5 = io_chosenOH[1];
  assign io_chosen = _zz_5;
  always @ (posedge clk) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if(((io_output_valid && io_output_ready) && io_output_payload_last))begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input               io_inputs_0_payload_last,
  input      [0:0]    io_inputs_0_payload_fragment_source,
  input      [0:0]    io_inputs_0_payload_fragment_opcode,
  input      [31:0]   io_inputs_0_payload_fragment_address,
  input      [10:0]   io_inputs_0_payload_fragment_length,
  input      [17:0]   io_inputs_0_payload_fragment_context,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input               io_inputs_1_payload_last,
  input      [0:0]    io_inputs_1_payload_fragment_source,
  input      [0:0]    io_inputs_1_payload_fragment_opcode,
  input      [31:0]   io_inputs_1_payload_fragment_address,
  input      [10:0]   io_inputs_1_payload_fragment_length,
  input      [17:0]   io_inputs_1_payload_fragment_context,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment_source,
  output     [0:0]    io_output_payload_fragment_opcode,
  output     [31:0]   io_output_payload_fragment_address,
  output     [10:0]   io_output_payload_fragment_length,
  output     [17:0]   io_output_payload_fragment_context,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz_6;
  wire       [1:0]    _zz_7;
  wire       [3:0]    _zz_8;
  wire       [0:0]    _zz_9;
  wire       [0:0]    _zz_10;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_1;
  wire       [3:0]    _zz_2;
  wire       [3:0]    _zz_3;
  wire       [1:0]    _zz_4;
  wire                _zz_5;

  assign _zz_6 = (_zz_2 - _zz_8);
  assign _zz_7 = {maskLocked_0,maskLocked_1};
  assign _zz_8 = {2'd0, _zz_7};
  assign _zz_9 = _zz_4[0 : 0];
  assign _zz_10 = _zz_4[1 : 1];
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_2 = {_zz_1,_zz_1};
  assign _zz_3 = (_zz_2 & (~ _zz_6));
  assign _zz_4 = (_zz_3[3 : 2] | _zz_3[1 : 0]);
  assign maskProposal_0 = _zz_9[0];
  assign maskProposal_1 = _zz_10[0];
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_last = (maskRouted_0 ? io_inputs_0_payload_last : io_inputs_1_payload_last);
  assign io_output_payload_fragment_source = (maskRouted_0 ? io_inputs_0_payload_fragment_source : io_inputs_1_payload_fragment_source);
  assign io_output_payload_fragment_opcode = (maskRouted_0 ? io_inputs_0_payload_fragment_opcode : io_inputs_1_payload_fragment_opcode);
  assign io_output_payload_fragment_address = (maskRouted_0 ? io_inputs_0_payload_fragment_address : io_inputs_1_payload_fragment_address);
  assign io_output_payload_fragment_length = (maskRouted_0 ? io_inputs_0_payload_fragment_length : io_inputs_1_payload_fragment_length);
  assign io_output_payload_fragment_context = (maskRouted_0 ? io_inputs_0_payload_fragment_context : io_inputs_1_payload_fragment_context);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_5 = io_chosenOH[1];
  assign io_chosen = _zz_5;
  always @ (posedge clk) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if(((io_output_valid && io_output_ready) && io_output_payload_last))begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_Aggregator (
  input               io_input_valid,
  output              io_input_ready,
  input      [63:0]   io_input_payload_data,
  input      [7:0]    io_input_payload_mask,
  output reg [63:0]   io_output_data,
  output reg [7:0]    io_output_mask,
  input               io_output_enough,
  input               io_output_consume,
  output              io_output_consumed,
  input      [2:0]    io_output_lastByteUsed,
  output     [2:0]    io_output_usedUntil,
  input               io_flush,
  input      [2:0]    io_offset,
  input      [10:0]   io_burstLength,
  input               clk,
  input               reset
);
  reg        [0:0]    _zz_131;
  reg        [1:0]    _zz_132;
  reg        [1:0]    _zz_133;
  reg        [2:0]    _zz_134;
  reg        [2:0]    _zz_135;
  reg        [2:0]    _zz_136;
  reg        [2:0]    _zz_137;
  reg        [2:0]    _zz_138;
  reg        [2:0]    _zz_139;
  reg        [2:0]    _zz_140;
  reg        [2:0]    _zz_141;
  reg        [2:0]    _zz_142;
  reg        [3:0]    _zz_143;
  reg        [3:0]    _zz_144;
  reg        [3:0]    _zz_145;
  reg        [7:0]    _zz_146;
  reg        [7:0]    _zz_147;
  reg        [7:0]    _zz_148;
  reg        [7:0]    _zz_149;
  reg        [7:0]    _zz_150;
  reg        [7:0]    _zz_151;
  reg        [7:0]    _zz_152;
  reg        [7:0]    _zz_153;
  reg        [2:0]    _zz_154;
  wire       [0:0]    _zz_155;
  wire       [2:0]    _zz_156;
  wire       [1:0]    _zz_157;
  wire       [2:0]    _zz_158;
  wire       [2:0]    _zz_159;
  wire       [0:0]    _zz_160;
  wire       [2:0]    _zz_161;
  wire       [3:0]    _zz_162;
  wire       [1:0]    _zz_163;
  wire       [2:0]    _zz_164;
  wire       [3:0]    _zz_165;
  wire       [11:0]   _zz_166;
  wire       [2:0]    _zz_167;
  wire       [2:0]    _zz_168;
  wire       [2:0]    _zz_169;
  wire       [11:0]   _zz_170;
  wire       [0:0]    _zz_171;
  wire       [1:0]    _zz_172;
  wire       [2:0]    _zz_173;
  wire       [2:0]    _zz_174;
  wire       [2:0]    _zz_175;
  wire       [2:0]    _zz_176;
  wire       [2:0]    _zz_177;
  wire       [2:0]    _zz_178;
  wire       [2:0]    _zz_179;
  wire       [2:0]    _zz_180;
  wire       [2:0]    _zz_181;
  wire       [2:0]    _zz_182;
  wire       [2:0]    _zz_183;
  wire                s0_input_valid;
  wire                s0_input_ready;
  wire       [63:0]   s0_input_payload_data;
  wire       [7:0]    s0_input_payload_mask;
  reg                 io_input_m2sPipe_rValid;
  reg        [63:0]   io_input_m2sPipe_rData_data;
  reg        [7:0]    io_input_m2sPipe_rData_mask;
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire       [0:0]    s0_countOnesLogic_0;
  wire       [1:0]    s0_countOnesLogic_1;
  wire       [1:0]    s0_countOnesLogic_2;
  wire       [2:0]    _zz_8;
  wire       [2:0]    _zz_9;
  wire       [2:0]    _zz_10;
  wire       [2:0]    _zz_11;
  wire       [2:0]    _zz_12;
  wire       [2:0]    _zz_13;
  wire       [2:0]    _zz_14;
  wire       [2:0]    _zz_15;
  wire       [2:0]    s0_countOnesLogic_3;
  wire       [2:0]    _zz_16;
  wire       [2:0]    _zz_17;
  wire       [2:0]    _zz_18;
  wire       [2:0]    _zz_19;
  wire       [2:0]    _zz_20;
  wire       [2:0]    _zz_21;
  wire       [2:0]    _zz_22;
  wire       [2:0]    _zz_23;
  wire       [2:0]    s0_countOnesLogic_4;
  wire       [2:0]    _zz_24;
  wire       [2:0]    _zz_25;
  wire       [2:0]    _zz_26;
  wire       [2:0]    _zz_27;
  wire       [2:0]    _zz_28;
  wire       [2:0]    _zz_29;
  wire       [2:0]    _zz_30;
  wire       [2:0]    _zz_31;
  wire       [2:0]    s0_countOnesLogic_5;
  wire       [2:0]    _zz_32;
  wire       [2:0]    _zz_33;
  wire       [2:0]    _zz_34;
  wire       [2:0]    _zz_35;
  wire       [2:0]    _zz_36;
  wire       [2:0]    _zz_37;
  wire       [2:0]    _zz_38;
  wire       [2:0]    _zz_39;
  wire       [2:0]    s0_countOnesLogic_6;
  wire       [3:0]    _zz_40;
  wire       [3:0]    _zz_41;
  wire       [3:0]    _zz_42;
  wire       [3:0]    _zz_43;
  wire       [3:0]    _zz_44;
  wire       [3:0]    _zz_45;
  wire       [3:0]    _zz_46;
  wire       [3:0]    _zz_47;
  wire       [3:0]    s0_countOnesLogic_7;
  wire       [63:0]   s0_outputPayload_cmd_data;
  wire       [7:0]    s0_outputPayload_cmd_mask;
  wire       [0:0]    s0_outputPayload_countOnes_0;
  wire       [1:0]    s0_outputPayload_countOnes_1;
  wire       [1:0]    s0_outputPayload_countOnes_2;
  wire       [2:0]    s0_outputPayload_countOnes_3;
  wire       [2:0]    s0_outputPayload_countOnes_4;
  wire       [2:0]    s0_outputPayload_countOnes_5;
  wire       [2:0]    s0_outputPayload_countOnes_6;
  wire       [3:0]    s0_outputPayload_countOnes_7;
  wire                s0_output_valid;
  wire                s0_output_ready;
  wire       [63:0]   s0_output_payload_cmd_data;
  wire       [7:0]    s0_output_payload_cmd_mask;
  wire       [0:0]    s0_output_payload_countOnes_0;
  wire       [1:0]    s0_output_payload_countOnes_1;
  wire       [1:0]    s0_output_payload_countOnes_2;
  wire       [2:0]    s0_output_payload_countOnes_3;
  wire       [2:0]    s0_output_payload_countOnes_4;
  wire       [2:0]    s0_output_payload_countOnes_5;
  wire       [2:0]    s0_output_payload_countOnes_6;
  wire       [3:0]    s0_output_payload_countOnes_7;
  wire                s1_input_valid;
  wire                s1_input_ready;
  wire       [63:0]   s1_input_payload_cmd_data;
  wire       [7:0]    s1_input_payload_cmd_mask;
  wire       [0:0]    s1_input_payload_countOnes_0;
  wire       [1:0]    s1_input_payload_countOnes_1;
  wire       [1:0]    s1_input_payload_countOnes_2;
  wire       [2:0]    s1_input_payload_countOnes_3;
  wire       [2:0]    s1_input_payload_countOnes_4;
  wire       [2:0]    s1_input_payload_countOnes_5;
  wire       [2:0]    s1_input_payload_countOnes_6;
  wire       [3:0]    s1_input_payload_countOnes_7;
  reg                 s0_output_m2sPipe_rValid;
  reg        [63:0]   s0_output_m2sPipe_rData_cmd_data;
  reg        [7:0]    s0_output_m2sPipe_rData_cmd_mask;
  reg        [0:0]    s0_output_m2sPipe_rData_countOnes_0;
  reg        [1:0]    s0_output_m2sPipe_rData_countOnes_1;
  reg        [1:0]    s0_output_m2sPipe_rData_countOnes_2;
  reg        [2:0]    s0_output_m2sPipe_rData_countOnes_3;
  reg        [2:0]    s0_output_m2sPipe_rData_countOnes_4;
  reg        [2:0]    s0_output_m2sPipe_rData_countOnes_5;
  reg        [2:0]    s0_output_m2sPipe_rData_countOnes_6;
  reg        [3:0]    s0_output_m2sPipe_rData_countOnes_7;
  reg        [2:0]    s1_offset;
  wire       [3:0]    s1_offsetNext;
  reg        [11:0]   s1_byteCounter;
  wire       [2:0]    s1_inputIndexes_0;
  wire       [2:0]    s1_inputIndexes_1;
  wire       [2:0]    s1_inputIndexes_2;
  wire       [2:0]    s1_inputIndexes_3;
  wire       [2:0]    s1_inputIndexes_4;
  wire       [2:0]    s1_inputIndexes_5;
  wire       [2:0]    s1_inputIndexes_6;
  wire       [2:0]    s1_inputIndexes_7;
  wire       [63:0]   s1_outputPayload_cmd_data;
  wire       [7:0]    s1_outputPayload_cmd_mask;
  wire       [2:0]    s1_outputPayload_index_0;
  wire       [2:0]    s1_outputPayload_index_1;
  wire       [2:0]    s1_outputPayload_index_2;
  wire       [2:0]    s1_outputPayload_index_3;
  wire       [2:0]    s1_outputPayload_index_4;
  wire       [2:0]    s1_outputPayload_index_5;
  wire       [2:0]    s1_outputPayload_index_6;
  wire       [2:0]    s1_outputPayload_index_7;
  wire                s1_outputPayload_last;
  wire       [2:0]    s1_outputPayload_sel_0;
  wire       [2:0]    s1_outputPayload_sel_1;
  wire       [2:0]    s1_outputPayload_sel_2;
  wire       [2:0]    s1_outputPayload_sel_3;
  wire       [2:0]    s1_outputPayload_sel_4;
  wire       [2:0]    s1_outputPayload_sel_5;
  wire       [2:0]    s1_outputPayload_sel_6;
  wire       [2:0]    s1_outputPayload_sel_7;
  reg        [7:0]    s1_outputPayload_selValid;
  wire                _zz_48;
  wire                _zz_49;
  wire                _zz_50;
  wire                _zz_51;
  wire                _zz_52;
  wire                _zz_53;
  wire                _zz_54;
  wire                _zz_55;
  wire                _zz_56;
  wire                _zz_57;
  wire                _zz_58;
  wire                _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                _zz_64;
  wire                _zz_65;
  wire                _zz_66;
  wire                _zz_67;
  wire                _zz_68;
  wire                _zz_69;
  wire                _zz_70;
  wire                _zz_71;
  wire                _zz_72;
  wire                _zz_73;
  wire                _zz_74;
  wire                _zz_75;
  wire                _zz_76;
  wire                _zz_77;
  wire                _zz_78;
  wire                _zz_79;
  wire                _zz_80;
  wire                _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  wire                _zz_84;
  wire                _zz_85;
  wire                _zz_86;
  wire                _zz_87;
  wire                _zz_88;
  wire                _zz_89;
  wire                _zz_90;
  wire                _zz_91;
  wire                _zz_92;
  wire                _zz_93;
  wire                _zz_94;
  wire                _zz_95;
  wire                _zz_96;
  wire                _zz_97;
  wire                _zz_98;
  wire                _zz_99;
  wire                _zz_100;
  wire                _zz_101;
  wire                _zz_102;
  wire                _zz_103;
  wire                _zz_104;
  wire                _zz_105;
  wire                _zz_106;
  wire                _zz_107;
  wire                _zz_108;
  wire                _zz_109;
  wire                _zz_110;
  wire                _zz_111;
  wire                _zz_112;
  wire                _zz_113;
  wire                _zz_114;
  wire                _zz_115;
  wire                _zz_116;
  wire                _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire                _zz_120;
  wire                _zz_121;
  wire                _zz_122;
  wire                _zz_123;
  wire                _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  wire                _zz_127;
  wire                s1_output_valid;
  wire                s1_output_ready;
  wire       [63:0]   s1_output_payload_cmd_data;
  wire       [7:0]    s1_output_payload_cmd_mask;
  wire       [2:0]    s1_output_payload_index_0;
  wire       [2:0]    s1_output_payload_index_1;
  wire       [2:0]    s1_output_payload_index_2;
  wire       [2:0]    s1_output_payload_index_3;
  wire       [2:0]    s1_output_payload_index_4;
  wire       [2:0]    s1_output_payload_index_5;
  wire       [2:0]    s1_output_payload_index_6;
  wire       [2:0]    s1_output_payload_index_7;
  wire                s1_output_payload_last;
  wire       [2:0]    s1_output_payload_sel_0;
  wire       [2:0]    s1_output_payload_sel_1;
  wire       [2:0]    s1_output_payload_sel_2;
  wire       [2:0]    s1_output_payload_sel_3;
  wire       [2:0]    s1_output_payload_sel_4;
  wire       [2:0]    s1_output_payload_sel_5;
  wire       [2:0]    s1_output_payload_sel_6;
  wire       [2:0]    s1_output_payload_sel_7;
  wire       [7:0]    s1_output_payload_selValid;
  wire                s2_input_valid;
  reg                 s2_input_ready;
  wire       [63:0]   s2_input_payload_cmd_data;
  wire       [7:0]    s2_input_payload_cmd_mask;
  wire       [2:0]    s2_input_payload_index_0;
  wire       [2:0]    s2_input_payload_index_1;
  wire       [2:0]    s2_input_payload_index_2;
  wire       [2:0]    s2_input_payload_index_3;
  wire       [2:0]    s2_input_payload_index_4;
  wire       [2:0]    s2_input_payload_index_5;
  wire       [2:0]    s2_input_payload_index_6;
  wire       [2:0]    s2_input_payload_index_7;
  wire                s2_input_payload_last;
  wire       [2:0]    s2_input_payload_sel_0;
  wire       [2:0]    s2_input_payload_sel_1;
  wire       [2:0]    s2_input_payload_sel_2;
  wire       [2:0]    s2_input_payload_sel_3;
  wire       [2:0]    s2_input_payload_sel_4;
  wire       [2:0]    s2_input_payload_sel_5;
  wire       [2:0]    s2_input_payload_sel_6;
  wire       [2:0]    s2_input_payload_sel_7;
  wire       [7:0]    s2_input_payload_selValid;
  reg                 s1_output_m2sPipe_rValid;
  reg        [63:0]   s1_output_m2sPipe_rData_cmd_data;
  reg        [7:0]    s1_output_m2sPipe_rData_cmd_mask;
  reg        [2:0]    s1_output_m2sPipe_rData_index_0;
  reg        [2:0]    s1_output_m2sPipe_rData_index_1;
  reg        [2:0]    s1_output_m2sPipe_rData_index_2;
  reg        [2:0]    s1_output_m2sPipe_rData_index_3;
  reg        [2:0]    s1_output_m2sPipe_rData_index_4;
  reg        [2:0]    s1_output_m2sPipe_rData_index_5;
  reg        [2:0]    s1_output_m2sPipe_rData_index_6;
  reg        [2:0]    s1_output_m2sPipe_rData_index_7;
  reg                 s1_output_m2sPipe_rData_last;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_0;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_1;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_2;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_3;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_4;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_5;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_6;
  reg        [2:0]    s1_output_m2sPipe_rData_sel_7;
  reg        [7:0]    s1_output_m2sPipe_rData_selValid;
  wire       [7:0]    s2_inputDataBytes_0;
  wire       [7:0]    s2_inputDataBytes_1;
  wire       [7:0]    s2_inputDataBytes_2;
  wire       [7:0]    s2_inputDataBytes_3;
  wire       [7:0]    s2_inputDataBytes_4;
  wire       [7:0]    s2_inputDataBytes_5;
  wire       [7:0]    s2_inputDataBytes_6;
  wire       [7:0]    s2_inputDataBytes_7;
  reg                 s2_byteLogic_0_buffer_valid;
  reg        [7:0]    s2_byteLogic_0_buffer_data;
  wire                s2_byteLogic_0_lastUsed;
  wire                s2_byteLogic_0_inputMask;
  wire       [7:0]    s2_byteLogic_0_inputData;
  wire                s2_byteLogic_0_outputMask;
  wire       [7:0]    s2_byteLogic_0_outputData;
  reg                 s2_byteLogic_1_buffer_valid;
  reg        [7:0]    s2_byteLogic_1_buffer_data;
  wire                s2_byteLogic_1_lastUsed;
  wire                s2_byteLogic_1_inputMask;
  wire       [7:0]    s2_byteLogic_1_inputData;
  wire                s2_byteLogic_1_outputMask;
  wire       [7:0]    s2_byteLogic_1_outputData;
  reg                 s2_byteLogic_2_buffer_valid;
  reg        [7:0]    s2_byteLogic_2_buffer_data;
  wire                s2_byteLogic_2_lastUsed;
  wire                s2_byteLogic_2_inputMask;
  wire       [7:0]    s2_byteLogic_2_inputData;
  wire                s2_byteLogic_2_outputMask;
  wire       [7:0]    s2_byteLogic_2_outputData;
  reg                 s2_byteLogic_3_buffer_valid;
  reg        [7:0]    s2_byteLogic_3_buffer_data;
  wire                s2_byteLogic_3_lastUsed;
  wire                s2_byteLogic_3_inputMask;
  wire       [7:0]    s2_byteLogic_3_inputData;
  wire                s2_byteLogic_3_outputMask;
  wire       [7:0]    s2_byteLogic_3_outputData;
  reg                 s2_byteLogic_4_buffer_valid;
  reg        [7:0]    s2_byteLogic_4_buffer_data;
  wire                s2_byteLogic_4_lastUsed;
  wire                s2_byteLogic_4_inputMask;
  wire       [7:0]    s2_byteLogic_4_inputData;
  wire                s2_byteLogic_4_outputMask;
  wire       [7:0]    s2_byteLogic_4_outputData;
  reg                 s2_byteLogic_5_buffer_valid;
  reg        [7:0]    s2_byteLogic_5_buffer_data;
  wire                s2_byteLogic_5_lastUsed;
  wire                s2_byteLogic_5_inputMask;
  wire       [7:0]    s2_byteLogic_5_inputData;
  wire                s2_byteLogic_5_outputMask;
  wire       [7:0]    s2_byteLogic_5_outputData;
  reg                 s2_byteLogic_6_buffer_valid;
  reg        [7:0]    s2_byteLogic_6_buffer_data;
  wire                s2_byteLogic_6_lastUsed;
  wire                s2_byteLogic_6_inputMask;
  wire       [7:0]    s2_byteLogic_6_inputData;
  wire                s2_byteLogic_6_outputMask;
  wire       [7:0]    s2_byteLogic_6_outputData;
  reg                 s2_byteLogic_7_buffer_valid;
  reg        [7:0]    s2_byteLogic_7_buffer_data;
  wire                s2_byteLogic_7_lastUsed;
  wire                s2_byteLogic_7_inputMask;
  wire       [7:0]    s2_byteLogic_7_inputData;
  wire                s2_byteLogic_7_outputMask;
  wire       [7:0]    s2_byteLogic_7_outputData;
  wire                _zz_128;
  wire                _zz_129;
  wire                _zz_130;

  assign _zz_155 = _zz_4;
  assign _zz_156 = {2'd0, _zz_155};
  assign _zz_157 = {_zz_5,_zz_4};
  assign _zz_158 = {1'd0, _zz_157};
  assign _zz_159 = (_zz_140 + _zz_141);
  assign _zz_160 = _zz_7;
  assign _zz_161 = {2'd0, _zz_160};
  assign _zz_162 = (_zz_143 + _zz_144);
  assign _zz_163 = {s0_input_payload_mask[7],_zz_7};
  assign _zz_164 = {1'd0, _zz_163};
  assign _zz_165 = {1'd0, s1_offset};
  assign _zz_166 = {8'd0, s1_input_payload_countOnes_7};
  assign _zz_167 = {2'd0, s1_input_payload_countOnes_0};
  assign _zz_168 = {1'd0, s1_input_payload_countOnes_1};
  assign _zz_169 = {1'd0, s1_input_payload_countOnes_2};
  assign _zz_170 = {1'd0, io_burstLength};
  assign _zz_171 = _zz_1;
  assign _zz_172 = {_zz_2,_zz_1};
  assign _zz_173 = {_zz_3,{_zz_2,_zz_1}};
  assign _zz_174 = {_zz_3,{_zz_2,_zz_1}};
  assign _zz_175 = {_zz_3,{_zz_2,_zz_1}};
  assign _zz_176 = {_zz_3,{_zz_2,_zz_1}};
  assign _zz_177 = {_zz_6,{_zz_5,_zz_4}};
  assign _zz_178 = {_zz_3,{_zz_2,_zz_1}};
  assign _zz_179 = {_zz_6,{_zz_5,_zz_4}};
  assign _zz_180 = {_zz_3,{_zz_2,_zz_1}};
  assign _zz_181 = {_zz_6,{_zz_5,_zz_4}};
  assign _zz_182 = {_zz_130,{_zz_129,_zz_128}};
  assign _zz_183 = 3'b000;
  always @(*) begin
    case(_zz_171)
      1'b0 : begin
        _zz_131 = 1'b0;
      end
      default : begin
        _zz_131 = 1'b1;
      end
    endcase
  end

  always @(*) begin
    case(_zz_172)
      2'b00 : begin
        _zz_132 = 2'b00;
      end
      2'b01 : begin
        _zz_132 = 2'b01;
      end
      2'b10 : begin
        _zz_132 = 2'b01;
      end
      default : begin
        _zz_132 = 2'b10;
      end
    endcase
  end

  always @(*) begin
    case(_zz_173)
      3'b000 : begin
        _zz_133 = 2'b00;
      end
      3'b001 : begin
        _zz_133 = 2'b01;
      end
      3'b010 : begin
        _zz_133 = 2'b01;
      end
      3'b011 : begin
        _zz_133 = 2'b10;
      end
      3'b100 : begin
        _zz_133 = 2'b01;
      end
      3'b101 : begin
        _zz_133 = 2'b10;
      end
      3'b110 : begin
        _zz_133 = 2'b10;
      end
      default : begin
        _zz_133 = 2'b11;
      end
    endcase
  end

  always @(*) begin
    case(_zz_174)
      3'b000 : begin
        _zz_134 = _zz_8;
      end
      3'b001 : begin
        _zz_134 = _zz_9;
      end
      3'b010 : begin
        _zz_134 = _zz_10;
      end
      3'b011 : begin
        _zz_134 = _zz_11;
      end
      3'b100 : begin
        _zz_134 = _zz_12;
      end
      3'b101 : begin
        _zz_134 = _zz_13;
      end
      3'b110 : begin
        _zz_134 = _zz_14;
      end
      default : begin
        _zz_134 = _zz_15;
      end
    endcase
  end

  always @(*) begin
    case(_zz_156)
      3'b000 : begin
        _zz_135 = _zz_8;
      end
      3'b001 : begin
        _zz_135 = _zz_9;
      end
      3'b010 : begin
        _zz_135 = _zz_10;
      end
      3'b011 : begin
        _zz_135 = _zz_11;
      end
      3'b100 : begin
        _zz_135 = _zz_12;
      end
      3'b101 : begin
        _zz_135 = _zz_13;
      end
      3'b110 : begin
        _zz_135 = _zz_14;
      end
      default : begin
        _zz_135 = _zz_15;
      end
    endcase
  end

  always @(*) begin
    case(_zz_175)
      3'b000 : begin
        _zz_136 = _zz_16;
      end
      3'b001 : begin
        _zz_136 = _zz_17;
      end
      3'b010 : begin
        _zz_136 = _zz_18;
      end
      3'b011 : begin
        _zz_136 = _zz_19;
      end
      3'b100 : begin
        _zz_136 = _zz_20;
      end
      3'b101 : begin
        _zz_136 = _zz_21;
      end
      3'b110 : begin
        _zz_136 = _zz_22;
      end
      default : begin
        _zz_136 = _zz_23;
      end
    endcase
  end

  always @(*) begin
    case(_zz_158)
      3'b000 : begin
        _zz_137 = _zz_16;
      end
      3'b001 : begin
        _zz_137 = _zz_17;
      end
      3'b010 : begin
        _zz_137 = _zz_18;
      end
      3'b011 : begin
        _zz_137 = _zz_19;
      end
      3'b100 : begin
        _zz_137 = _zz_20;
      end
      3'b101 : begin
        _zz_137 = _zz_21;
      end
      3'b110 : begin
        _zz_137 = _zz_22;
      end
      default : begin
        _zz_137 = _zz_23;
      end
    endcase
  end

  always @(*) begin
    case(_zz_176)
      3'b000 : begin
        _zz_138 = _zz_24;
      end
      3'b001 : begin
        _zz_138 = _zz_25;
      end
      3'b010 : begin
        _zz_138 = _zz_26;
      end
      3'b011 : begin
        _zz_138 = _zz_27;
      end
      3'b100 : begin
        _zz_138 = _zz_28;
      end
      3'b101 : begin
        _zz_138 = _zz_29;
      end
      3'b110 : begin
        _zz_138 = _zz_30;
      end
      default : begin
        _zz_138 = _zz_31;
      end
    endcase
  end

  always @(*) begin
    case(_zz_177)
      3'b000 : begin
        _zz_139 = _zz_24;
      end
      3'b001 : begin
        _zz_139 = _zz_25;
      end
      3'b010 : begin
        _zz_139 = _zz_26;
      end
      3'b011 : begin
        _zz_139 = _zz_27;
      end
      3'b100 : begin
        _zz_139 = _zz_28;
      end
      3'b101 : begin
        _zz_139 = _zz_29;
      end
      3'b110 : begin
        _zz_139 = _zz_30;
      end
      default : begin
        _zz_139 = _zz_31;
      end
    endcase
  end

  always @(*) begin
    case(_zz_178)
      3'b000 : begin
        _zz_140 = _zz_32;
      end
      3'b001 : begin
        _zz_140 = _zz_33;
      end
      3'b010 : begin
        _zz_140 = _zz_34;
      end
      3'b011 : begin
        _zz_140 = _zz_35;
      end
      3'b100 : begin
        _zz_140 = _zz_36;
      end
      3'b101 : begin
        _zz_140 = _zz_37;
      end
      3'b110 : begin
        _zz_140 = _zz_38;
      end
      default : begin
        _zz_140 = _zz_39;
      end
    endcase
  end

  always @(*) begin
    case(_zz_179)
      3'b000 : begin
        _zz_141 = _zz_32;
      end
      3'b001 : begin
        _zz_141 = _zz_33;
      end
      3'b010 : begin
        _zz_141 = _zz_34;
      end
      3'b011 : begin
        _zz_141 = _zz_35;
      end
      3'b100 : begin
        _zz_141 = _zz_36;
      end
      3'b101 : begin
        _zz_141 = _zz_37;
      end
      3'b110 : begin
        _zz_141 = _zz_38;
      end
      default : begin
        _zz_141 = _zz_39;
      end
    endcase
  end

  always @(*) begin
    case(_zz_161)
      3'b000 : begin
        _zz_142 = _zz_32;
      end
      3'b001 : begin
        _zz_142 = _zz_33;
      end
      3'b010 : begin
        _zz_142 = _zz_34;
      end
      3'b011 : begin
        _zz_142 = _zz_35;
      end
      3'b100 : begin
        _zz_142 = _zz_36;
      end
      3'b101 : begin
        _zz_142 = _zz_37;
      end
      3'b110 : begin
        _zz_142 = _zz_38;
      end
      default : begin
        _zz_142 = _zz_39;
      end
    endcase
  end

  always @(*) begin
    case(_zz_180)
      3'b000 : begin
        _zz_143 = _zz_40;
      end
      3'b001 : begin
        _zz_143 = _zz_41;
      end
      3'b010 : begin
        _zz_143 = _zz_42;
      end
      3'b011 : begin
        _zz_143 = _zz_43;
      end
      3'b100 : begin
        _zz_143 = _zz_44;
      end
      3'b101 : begin
        _zz_143 = _zz_45;
      end
      3'b110 : begin
        _zz_143 = _zz_46;
      end
      default : begin
        _zz_143 = _zz_47;
      end
    endcase
  end

  always @(*) begin
    case(_zz_181)
      3'b000 : begin
        _zz_144 = _zz_40;
      end
      3'b001 : begin
        _zz_144 = _zz_41;
      end
      3'b010 : begin
        _zz_144 = _zz_42;
      end
      3'b011 : begin
        _zz_144 = _zz_43;
      end
      3'b100 : begin
        _zz_144 = _zz_44;
      end
      3'b101 : begin
        _zz_144 = _zz_45;
      end
      3'b110 : begin
        _zz_144 = _zz_46;
      end
      default : begin
        _zz_144 = _zz_47;
      end
    endcase
  end

  always @(*) begin
    case(_zz_164)
      3'b000 : begin
        _zz_145 = _zz_40;
      end
      3'b001 : begin
        _zz_145 = _zz_41;
      end
      3'b010 : begin
        _zz_145 = _zz_42;
      end
      3'b011 : begin
        _zz_145 = _zz_43;
      end
      3'b100 : begin
        _zz_145 = _zz_44;
      end
      3'b101 : begin
        _zz_145 = _zz_45;
      end
      3'b110 : begin
        _zz_145 = _zz_46;
      end
      default : begin
        _zz_145 = _zz_47;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_0)
      3'b000 : begin
        _zz_146 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_146 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_146 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_146 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_146 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_146 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_146 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_146 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_1)
      3'b000 : begin
        _zz_147 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_147 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_147 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_147 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_147 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_147 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_147 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_147 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_2)
      3'b000 : begin
        _zz_148 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_148 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_148 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_148 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_148 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_148 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_148 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_148 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_3)
      3'b000 : begin
        _zz_149 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_149 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_149 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_149 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_149 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_149 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_149 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_149 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_4)
      3'b000 : begin
        _zz_150 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_150 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_150 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_150 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_150 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_150 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_150 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_150 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_5)
      3'b000 : begin
        _zz_151 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_151 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_151 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_151 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_151 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_151 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_151 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_151 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_6)
      3'b000 : begin
        _zz_152 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_152 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_152 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_152 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_152 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_152 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_152 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_152 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(s2_input_payload_sel_7)
      3'b000 : begin
        _zz_153 = s2_inputDataBytes_0;
      end
      3'b001 : begin
        _zz_153 = s2_inputDataBytes_1;
      end
      3'b010 : begin
        _zz_153 = s2_inputDataBytes_2;
      end
      3'b011 : begin
        _zz_153 = s2_inputDataBytes_3;
      end
      3'b100 : begin
        _zz_153 = s2_inputDataBytes_4;
      end
      3'b101 : begin
        _zz_153 = s2_inputDataBytes_5;
      end
      3'b110 : begin
        _zz_153 = s2_inputDataBytes_6;
      end
      default : begin
        _zz_153 = s2_inputDataBytes_7;
      end
    endcase
  end

  always @(*) begin
    case(_zz_182)
      3'b000 : begin
        _zz_154 = s2_input_payload_sel_0;
      end
      3'b001 : begin
        _zz_154 = s2_input_payload_sel_1;
      end
      3'b010 : begin
        _zz_154 = s2_input_payload_sel_2;
      end
      3'b011 : begin
        _zz_154 = s2_input_payload_sel_3;
      end
      3'b100 : begin
        _zz_154 = s2_input_payload_sel_4;
      end
      3'b101 : begin
        _zz_154 = s2_input_payload_sel_5;
      end
      3'b110 : begin
        _zz_154 = s2_input_payload_sel_6;
      end
      default : begin
        _zz_154 = s2_input_payload_sel_7;
      end
    endcase
  end

  assign io_input_ready = ((1'b1 && (! s0_input_valid)) || s0_input_ready);
  assign s0_input_valid = io_input_m2sPipe_rValid;
  assign s0_input_payload_data = io_input_m2sPipe_rData_data;
  assign s0_input_payload_mask = io_input_m2sPipe_rData_mask;
  assign _zz_1 = s0_input_payload_mask[0];
  assign _zz_2 = s0_input_payload_mask[1];
  assign _zz_3 = s0_input_payload_mask[2];
  assign _zz_4 = s0_input_payload_mask[3];
  assign _zz_5 = s0_input_payload_mask[4];
  assign _zz_6 = s0_input_payload_mask[5];
  assign _zz_7 = s0_input_payload_mask[6];
  assign s0_countOnesLogic_0 = _zz_131;
  assign s0_countOnesLogic_1 = _zz_132;
  assign s0_countOnesLogic_2 = _zz_133;
  assign _zz_8 = 3'b000;
  assign _zz_9 = 3'b001;
  assign _zz_10 = 3'b001;
  assign _zz_11 = 3'b010;
  assign _zz_12 = 3'b001;
  assign _zz_13 = 3'b010;
  assign _zz_14 = 3'b010;
  assign _zz_15 = 3'b011;
  assign s0_countOnesLogic_3 = (_zz_134 + _zz_135);
  assign _zz_16 = 3'b000;
  assign _zz_17 = 3'b001;
  assign _zz_18 = 3'b001;
  assign _zz_19 = 3'b010;
  assign _zz_20 = 3'b001;
  assign _zz_21 = 3'b010;
  assign _zz_22 = 3'b010;
  assign _zz_23 = 3'b011;
  assign s0_countOnesLogic_4 = (_zz_136 + _zz_137);
  assign _zz_24 = 3'b000;
  assign _zz_25 = 3'b001;
  assign _zz_26 = 3'b001;
  assign _zz_27 = 3'b010;
  assign _zz_28 = 3'b001;
  assign _zz_29 = 3'b010;
  assign _zz_30 = 3'b010;
  assign _zz_31 = 3'b011;
  assign s0_countOnesLogic_5 = (_zz_138 + _zz_139);
  assign _zz_32 = 3'b000;
  assign _zz_33 = 3'b001;
  assign _zz_34 = 3'b001;
  assign _zz_35 = 3'b010;
  assign _zz_36 = 3'b001;
  assign _zz_37 = 3'b010;
  assign _zz_38 = 3'b010;
  assign _zz_39 = 3'b011;
  assign s0_countOnesLogic_6 = (_zz_159 + _zz_142);
  assign _zz_40 = 4'b0000;
  assign _zz_41 = 4'b0001;
  assign _zz_42 = 4'b0001;
  assign _zz_43 = 4'b0010;
  assign _zz_44 = 4'b0001;
  assign _zz_45 = 4'b0010;
  assign _zz_46 = 4'b0010;
  assign _zz_47 = 4'b0011;
  assign s0_countOnesLogic_7 = (_zz_162 + _zz_145);
  assign s0_outputPayload_cmd_data = s0_input_payload_data;
  assign s0_outputPayload_cmd_mask = s0_input_payload_mask;
  assign s0_outputPayload_countOnes_0 = s0_countOnesLogic_0;
  assign s0_outputPayload_countOnes_1 = s0_countOnesLogic_1;
  assign s0_outputPayload_countOnes_2 = s0_countOnesLogic_2;
  assign s0_outputPayload_countOnes_3 = s0_countOnesLogic_3;
  assign s0_outputPayload_countOnes_4 = s0_countOnesLogic_4;
  assign s0_outputPayload_countOnes_5 = s0_countOnesLogic_5;
  assign s0_outputPayload_countOnes_6 = s0_countOnesLogic_6;
  assign s0_outputPayload_countOnes_7 = s0_countOnesLogic_7;
  assign s0_output_valid = s0_input_valid;
  assign s0_input_ready = s0_output_ready;
  assign s0_output_payload_cmd_data = s0_outputPayload_cmd_data;
  assign s0_output_payload_cmd_mask = s0_outputPayload_cmd_mask;
  assign s0_output_payload_countOnes_0 = s0_outputPayload_countOnes_0;
  assign s0_output_payload_countOnes_1 = s0_outputPayload_countOnes_1;
  assign s0_output_payload_countOnes_2 = s0_outputPayload_countOnes_2;
  assign s0_output_payload_countOnes_3 = s0_outputPayload_countOnes_3;
  assign s0_output_payload_countOnes_4 = s0_outputPayload_countOnes_4;
  assign s0_output_payload_countOnes_5 = s0_outputPayload_countOnes_5;
  assign s0_output_payload_countOnes_6 = s0_outputPayload_countOnes_6;
  assign s0_output_payload_countOnes_7 = s0_outputPayload_countOnes_7;
  assign s0_output_ready = ((1'b1 && (! s1_input_valid)) || s1_input_ready);
  assign s1_input_valid = s0_output_m2sPipe_rValid;
  assign s1_input_payload_cmd_data = s0_output_m2sPipe_rData_cmd_data;
  assign s1_input_payload_cmd_mask = s0_output_m2sPipe_rData_cmd_mask;
  assign s1_input_payload_countOnes_0 = s0_output_m2sPipe_rData_countOnes_0;
  assign s1_input_payload_countOnes_1 = s0_output_m2sPipe_rData_countOnes_1;
  assign s1_input_payload_countOnes_2 = s0_output_m2sPipe_rData_countOnes_2;
  assign s1_input_payload_countOnes_3 = s0_output_m2sPipe_rData_countOnes_3;
  assign s1_input_payload_countOnes_4 = s0_output_m2sPipe_rData_countOnes_4;
  assign s1_input_payload_countOnes_5 = s0_output_m2sPipe_rData_countOnes_5;
  assign s1_input_payload_countOnes_6 = s0_output_m2sPipe_rData_countOnes_6;
  assign s1_input_payload_countOnes_7 = s0_output_m2sPipe_rData_countOnes_7;
  assign s1_offsetNext = (_zz_165 + s1_input_payload_countOnes_7);
  assign s1_inputIndexes_0 = (3'b000 + s1_offset);
  assign s1_inputIndexes_1 = (_zz_167 + s1_offset);
  assign s1_inputIndexes_2 = (_zz_168 + s1_offset);
  assign s1_inputIndexes_3 = (_zz_169 + s1_offset);
  assign s1_inputIndexes_4 = (s1_input_payload_countOnes_3 + s1_offset);
  assign s1_inputIndexes_5 = (s1_input_payload_countOnes_4 + s1_offset);
  assign s1_inputIndexes_6 = (s1_input_payload_countOnes_5 + s1_offset);
  assign s1_inputIndexes_7 = (s1_input_payload_countOnes_6 + s1_offset);
  assign s1_outputPayload_cmd_data = s1_input_payload_cmd_data;
  assign s1_outputPayload_cmd_mask = s1_input_payload_cmd_mask;
  assign s1_outputPayload_index_0 = s1_inputIndexes_0;
  assign s1_outputPayload_index_1 = s1_inputIndexes_1;
  assign s1_outputPayload_index_2 = s1_inputIndexes_2;
  assign s1_outputPayload_index_3 = s1_inputIndexes_3;
  assign s1_outputPayload_index_4 = s1_inputIndexes_4;
  assign s1_outputPayload_index_5 = s1_inputIndexes_5;
  assign s1_outputPayload_index_6 = s1_inputIndexes_6;
  assign s1_outputPayload_index_7 = s1_inputIndexes_7;
  assign s1_outputPayload_last = s1_offsetNext[3];
  assign _zz_48 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b000));
  assign _zz_49 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b000));
  assign _zz_50 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b000));
  assign _zz_51 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b000));
  assign _zz_52 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b000));
  assign _zz_53 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b000));
  assign _zz_54 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b000));
  assign _zz_55 = (((_zz_48 || _zz_50) || _zz_52) || _zz_54);
  assign _zz_56 = (((_zz_49 || _zz_50) || _zz_53) || _zz_54);
  assign _zz_57 = (((_zz_51 || _zz_52) || _zz_53) || _zz_54);
  assign s1_outputPayload_sel_0 = {_zz_57,{_zz_56,_zz_55}};
  always @ (*) begin
    s1_outputPayload_selValid[0] = (({_zz_54,{_zz_53,{_zz_52,{_zz_51,{_zz_50,{_zz_49,{_zz_48,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == _zz_183))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_0]);
    s1_outputPayload_selValid[1] = (({_zz_64,{_zz_63,{_zz_62,{_zz_61,{_zz_60,{_zz_59,{_zz_58,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b001))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_1]);
    s1_outputPayload_selValid[2] = (({_zz_74,{_zz_73,{_zz_72,{_zz_71,{_zz_70,{_zz_69,{_zz_68,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b010))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_2]);
    s1_outputPayload_selValid[3] = (({_zz_84,{_zz_83,{_zz_82,{_zz_81,{_zz_80,{_zz_79,{_zz_78,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b011))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_3]);
    s1_outputPayload_selValid[4] = (({_zz_94,{_zz_93,{_zz_92,{_zz_91,{_zz_90,{_zz_89,{_zz_88,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b100))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_4]);
    s1_outputPayload_selValid[5] = (({_zz_104,{_zz_103,{_zz_102,{_zz_101,{_zz_100,{_zz_99,{_zz_98,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b101))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_5]);
    s1_outputPayload_selValid[6] = (({_zz_114,{_zz_113,{_zz_112,{_zz_111,{_zz_110,{_zz_109,{_zz_108,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b110))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_6]);
    s1_outputPayload_selValid[7] = (({_zz_124,{_zz_123,{_zz_122,{_zz_121,{_zz_120,{_zz_119,{_zz_118,(s1_input_payload_cmd_mask[0] && (s1_inputIndexes_0 == 3'b111))}}}}}}} != 8'h0) && s1_outputPayload_cmd_mask[s1_outputPayload_sel_7]);
  end

  assign _zz_58 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b001));
  assign _zz_59 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b001));
  assign _zz_60 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b001));
  assign _zz_61 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b001));
  assign _zz_62 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b001));
  assign _zz_63 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b001));
  assign _zz_64 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b001));
  assign _zz_65 = (((_zz_58 || _zz_60) || _zz_62) || _zz_64);
  assign _zz_66 = (((_zz_59 || _zz_60) || _zz_63) || _zz_64);
  assign _zz_67 = (((_zz_61 || _zz_62) || _zz_63) || _zz_64);
  assign s1_outputPayload_sel_1 = {_zz_67,{_zz_66,_zz_65}};
  assign _zz_68 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b010));
  assign _zz_69 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b010));
  assign _zz_70 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b010));
  assign _zz_71 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b010));
  assign _zz_72 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b010));
  assign _zz_73 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b010));
  assign _zz_74 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b010));
  assign _zz_75 = (((_zz_68 || _zz_70) || _zz_72) || _zz_74);
  assign _zz_76 = (((_zz_69 || _zz_70) || _zz_73) || _zz_74);
  assign _zz_77 = (((_zz_71 || _zz_72) || _zz_73) || _zz_74);
  assign s1_outputPayload_sel_2 = {_zz_77,{_zz_76,_zz_75}};
  assign _zz_78 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b011));
  assign _zz_79 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b011));
  assign _zz_80 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b011));
  assign _zz_81 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b011));
  assign _zz_82 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b011));
  assign _zz_83 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b011));
  assign _zz_84 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b011));
  assign _zz_85 = (((_zz_78 || _zz_80) || _zz_82) || _zz_84);
  assign _zz_86 = (((_zz_79 || _zz_80) || _zz_83) || _zz_84);
  assign _zz_87 = (((_zz_81 || _zz_82) || _zz_83) || _zz_84);
  assign s1_outputPayload_sel_3 = {_zz_87,{_zz_86,_zz_85}};
  assign _zz_88 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b100));
  assign _zz_89 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b100));
  assign _zz_90 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b100));
  assign _zz_91 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b100));
  assign _zz_92 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b100));
  assign _zz_93 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b100));
  assign _zz_94 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b100));
  assign _zz_95 = (((_zz_88 || _zz_90) || _zz_92) || _zz_94);
  assign _zz_96 = (((_zz_89 || _zz_90) || _zz_93) || _zz_94);
  assign _zz_97 = (((_zz_91 || _zz_92) || _zz_93) || _zz_94);
  assign s1_outputPayload_sel_4 = {_zz_97,{_zz_96,_zz_95}};
  assign _zz_98 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b101));
  assign _zz_99 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b101));
  assign _zz_100 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b101));
  assign _zz_101 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b101));
  assign _zz_102 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b101));
  assign _zz_103 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b101));
  assign _zz_104 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b101));
  assign _zz_105 = (((_zz_98 || _zz_100) || _zz_102) || _zz_104);
  assign _zz_106 = (((_zz_99 || _zz_100) || _zz_103) || _zz_104);
  assign _zz_107 = (((_zz_101 || _zz_102) || _zz_103) || _zz_104);
  assign s1_outputPayload_sel_5 = {_zz_107,{_zz_106,_zz_105}};
  assign _zz_108 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b110));
  assign _zz_109 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b110));
  assign _zz_110 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b110));
  assign _zz_111 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b110));
  assign _zz_112 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b110));
  assign _zz_113 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b110));
  assign _zz_114 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b110));
  assign _zz_115 = (((_zz_108 || _zz_110) || _zz_112) || _zz_114);
  assign _zz_116 = (((_zz_109 || _zz_110) || _zz_113) || _zz_114);
  assign _zz_117 = (((_zz_111 || _zz_112) || _zz_113) || _zz_114);
  assign s1_outputPayload_sel_6 = {_zz_117,{_zz_116,_zz_115}};
  assign _zz_118 = (s1_input_payload_cmd_mask[1] && (s1_inputIndexes_1 == 3'b111));
  assign _zz_119 = (s1_input_payload_cmd_mask[2] && (s1_inputIndexes_2 == 3'b111));
  assign _zz_120 = (s1_input_payload_cmd_mask[3] && (s1_inputIndexes_3 == 3'b111));
  assign _zz_121 = (s1_input_payload_cmd_mask[4] && (s1_inputIndexes_4 == 3'b111));
  assign _zz_122 = (s1_input_payload_cmd_mask[5] && (s1_inputIndexes_5 == 3'b111));
  assign _zz_123 = (s1_input_payload_cmd_mask[6] && (s1_inputIndexes_6 == 3'b111));
  assign _zz_124 = (s1_input_payload_cmd_mask[7] && (s1_inputIndexes_7 == 3'b111));
  assign _zz_125 = (((_zz_118 || _zz_120) || _zz_122) || _zz_124);
  assign _zz_126 = (((_zz_119 || _zz_120) || _zz_123) || _zz_124);
  assign _zz_127 = (((_zz_121 || _zz_122) || _zz_123) || _zz_124);
  assign s1_outputPayload_sel_7 = {_zz_127,{_zz_126,_zz_125}};
  assign s1_output_valid = s1_input_valid;
  assign s1_input_ready = s1_output_ready;
  assign s1_output_payload_cmd_data = s1_outputPayload_cmd_data;
  assign s1_output_payload_cmd_mask = s1_outputPayload_cmd_mask;
  assign s1_output_payload_index_0 = s1_outputPayload_index_0;
  assign s1_output_payload_index_1 = s1_outputPayload_index_1;
  assign s1_output_payload_index_2 = s1_outputPayload_index_2;
  assign s1_output_payload_index_3 = s1_outputPayload_index_3;
  assign s1_output_payload_index_4 = s1_outputPayload_index_4;
  assign s1_output_payload_index_5 = s1_outputPayload_index_5;
  assign s1_output_payload_index_6 = s1_outputPayload_index_6;
  assign s1_output_payload_index_7 = s1_outputPayload_index_7;
  assign s1_output_payload_last = s1_outputPayload_last;
  assign s1_output_payload_sel_0 = s1_outputPayload_sel_0;
  assign s1_output_payload_sel_1 = s1_outputPayload_sel_1;
  assign s1_output_payload_sel_2 = s1_outputPayload_sel_2;
  assign s1_output_payload_sel_3 = s1_outputPayload_sel_3;
  assign s1_output_payload_sel_4 = s1_outputPayload_sel_4;
  assign s1_output_payload_sel_5 = s1_outputPayload_sel_5;
  assign s1_output_payload_sel_6 = s1_outputPayload_sel_6;
  assign s1_output_payload_sel_7 = s1_outputPayload_sel_7;
  assign s1_output_payload_selValid = s1_outputPayload_selValid;
  assign s1_output_ready = ((1'b1 && (! s2_input_valid)) || s2_input_ready);
  assign s2_input_valid = s1_output_m2sPipe_rValid;
  assign s2_input_payload_cmd_data = s1_output_m2sPipe_rData_cmd_data;
  assign s2_input_payload_cmd_mask = s1_output_m2sPipe_rData_cmd_mask;
  assign s2_input_payload_index_0 = s1_output_m2sPipe_rData_index_0;
  assign s2_input_payload_index_1 = s1_output_m2sPipe_rData_index_1;
  assign s2_input_payload_index_2 = s1_output_m2sPipe_rData_index_2;
  assign s2_input_payload_index_3 = s1_output_m2sPipe_rData_index_3;
  assign s2_input_payload_index_4 = s1_output_m2sPipe_rData_index_4;
  assign s2_input_payload_index_5 = s1_output_m2sPipe_rData_index_5;
  assign s2_input_payload_index_6 = s1_output_m2sPipe_rData_index_6;
  assign s2_input_payload_index_7 = s1_output_m2sPipe_rData_index_7;
  assign s2_input_payload_last = s1_output_m2sPipe_rData_last;
  assign s2_input_payload_sel_0 = s1_output_m2sPipe_rData_sel_0;
  assign s2_input_payload_sel_1 = s1_output_m2sPipe_rData_sel_1;
  assign s2_input_payload_sel_2 = s1_output_m2sPipe_rData_sel_2;
  assign s2_input_payload_sel_3 = s1_output_m2sPipe_rData_sel_3;
  assign s2_input_payload_sel_4 = s1_output_m2sPipe_rData_sel_4;
  assign s2_input_payload_sel_5 = s1_output_m2sPipe_rData_sel_5;
  assign s2_input_payload_sel_6 = s1_output_m2sPipe_rData_sel_6;
  assign s2_input_payload_sel_7 = s1_output_m2sPipe_rData_sel_7;
  assign s2_input_payload_selValid = s1_output_m2sPipe_rData_selValid;
  always @ (*) begin
    s2_input_ready = ((! io_output_enough) || io_output_consume);
    if((_zz_170 < s1_byteCounter))begin
      s2_input_ready = 1'b0;
    end
  end

  assign io_output_consumed = (s2_input_valid && s2_input_ready);
  assign s2_inputDataBytes_0 = s2_input_payload_cmd_data[7 : 0];
  assign s2_inputDataBytes_1 = s2_input_payload_cmd_data[15 : 8];
  assign s2_inputDataBytes_2 = s2_input_payload_cmd_data[23 : 16];
  assign s2_inputDataBytes_3 = s2_input_payload_cmd_data[31 : 24];
  assign s2_inputDataBytes_4 = s2_input_payload_cmd_data[39 : 32];
  assign s2_inputDataBytes_5 = s2_input_payload_cmd_data[47 : 40];
  assign s2_inputDataBytes_6 = s2_input_payload_cmd_data[55 : 48];
  assign s2_inputDataBytes_7 = s2_input_payload_cmd_data[63 : 56];
  assign s2_byteLogic_0_lastUsed = (3'b000 == io_output_lastByteUsed);
  assign s2_byteLogic_0_inputMask = s2_input_payload_selValid[0];
  assign s2_byteLogic_0_inputData = _zz_146;
  assign s2_byteLogic_0_outputMask = (s2_byteLogic_0_buffer_valid || (s2_input_valid && s2_byteLogic_0_inputMask));
  assign s2_byteLogic_0_outputData = (s2_byteLogic_0_buffer_valid ? s2_byteLogic_0_buffer_data : s2_byteLogic_0_inputData);
  always @ (*) begin
    io_output_mask[0] = s2_byteLogic_0_outputMask;
    io_output_mask[1] = s2_byteLogic_1_outputMask;
    io_output_mask[2] = s2_byteLogic_2_outputMask;
    io_output_mask[3] = s2_byteLogic_3_outputMask;
    io_output_mask[4] = s2_byteLogic_4_outputMask;
    io_output_mask[5] = s2_byteLogic_5_outputMask;
    io_output_mask[6] = s2_byteLogic_6_outputMask;
    io_output_mask[7] = s2_byteLogic_7_outputMask;
  end

  always @ (*) begin
    io_output_data[7 : 0] = s2_byteLogic_0_outputData;
    io_output_data[15 : 8] = s2_byteLogic_1_outputData;
    io_output_data[23 : 16] = s2_byteLogic_2_outputData;
    io_output_data[31 : 24] = s2_byteLogic_3_outputData;
    io_output_data[39 : 32] = s2_byteLogic_4_outputData;
    io_output_data[47 : 40] = s2_byteLogic_5_outputData;
    io_output_data[55 : 48] = s2_byteLogic_6_outputData;
    io_output_data[63 : 56] = s2_byteLogic_7_outputData;
  end

  assign s2_byteLogic_1_lastUsed = (3'b001 == io_output_lastByteUsed);
  assign s2_byteLogic_1_inputMask = s2_input_payload_selValid[1];
  assign s2_byteLogic_1_inputData = _zz_147;
  assign s2_byteLogic_1_outputMask = (s2_byteLogic_1_buffer_valid || (s2_input_valid && s2_byteLogic_1_inputMask));
  assign s2_byteLogic_1_outputData = (s2_byteLogic_1_buffer_valid ? s2_byteLogic_1_buffer_data : s2_byteLogic_1_inputData);
  assign s2_byteLogic_2_lastUsed = (3'b010 == io_output_lastByteUsed);
  assign s2_byteLogic_2_inputMask = s2_input_payload_selValid[2];
  assign s2_byteLogic_2_inputData = _zz_148;
  assign s2_byteLogic_2_outputMask = (s2_byteLogic_2_buffer_valid || (s2_input_valid && s2_byteLogic_2_inputMask));
  assign s2_byteLogic_2_outputData = (s2_byteLogic_2_buffer_valid ? s2_byteLogic_2_buffer_data : s2_byteLogic_2_inputData);
  assign s2_byteLogic_3_lastUsed = (3'b011 == io_output_lastByteUsed);
  assign s2_byteLogic_3_inputMask = s2_input_payload_selValid[3];
  assign s2_byteLogic_3_inputData = _zz_149;
  assign s2_byteLogic_3_outputMask = (s2_byteLogic_3_buffer_valid || (s2_input_valid && s2_byteLogic_3_inputMask));
  assign s2_byteLogic_3_outputData = (s2_byteLogic_3_buffer_valid ? s2_byteLogic_3_buffer_data : s2_byteLogic_3_inputData);
  assign s2_byteLogic_4_lastUsed = (3'b100 == io_output_lastByteUsed);
  assign s2_byteLogic_4_inputMask = s2_input_payload_selValid[4];
  assign s2_byteLogic_4_inputData = _zz_150;
  assign s2_byteLogic_4_outputMask = (s2_byteLogic_4_buffer_valid || (s2_input_valid && s2_byteLogic_4_inputMask));
  assign s2_byteLogic_4_outputData = (s2_byteLogic_4_buffer_valid ? s2_byteLogic_4_buffer_data : s2_byteLogic_4_inputData);
  assign s2_byteLogic_5_lastUsed = (3'b101 == io_output_lastByteUsed);
  assign s2_byteLogic_5_inputMask = s2_input_payload_selValid[5];
  assign s2_byteLogic_5_inputData = _zz_151;
  assign s2_byteLogic_5_outputMask = (s2_byteLogic_5_buffer_valid || (s2_input_valid && s2_byteLogic_5_inputMask));
  assign s2_byteLogic_5_outputData = (s2_byteLogic_5_buffer_valid ? s2_byteLogic_5_buffer_data : s2_byteLogic_5_inputData);
  assign s2_byteLogic_6_lastUsed = (3'b110 == io_output_lastByteUsed);
  assign s2_byteLogic_6_inputMask = s2_input_payload_selValid[6];
  assign s2_byteLogic_6_inputData = _zz_152;
  assign s2_byteLogic_6_outputMask = (s2_byteLogic_6_buffer_valid || (s2_input_valid && s2_byteLogic_6_inputMask));
  assign s2_byteLogic_6_outputData = (s2_byteLogic_6_buffer_valid ? s2_byteLogic_6_buffer_data : s2_byteLogic_6_inputData);
  assign s2_byteLogic_7_lastUsed = (3'b111 == io_output_lastByteUsed);
  assign s2_byteLogic_7_inputMask = s2_input_payload_selValid[7];
  assign s2_byteLogic_7_inputData = _zz_153;
  assign s2_byteLogic_7_outputMask = (s2_byteLogic_7_buffer_valid || (s2_input_valid && s2_byteLogic_7_inputMask));
  assign s2_byteLogic_7_outputData = (s2_byteLogic_7_buffer_valid ? s2_byteLogic_7_buffer_data : s2_byteLogic_7_inputData);
  assign _zz_128 = (((s2_byteLogic_1_lastUsed || s2_byteLogic_3_lastUsed) || s2_byteLogic_5_lastUsed) || s2_byteLogic_7_lastUsed);
  assign _zz_129 = (((s2_byteLogic_2_lastUsed || s2_byteLogic_3_lastUsed) || s2_byteLogic_6_lastUsed) || s2_byteLogic_7_lastUsed);
  assign _zz_130 = (((s2_byteLogic_4_lastUsed || s2_byteLogic_5_lastUsed) || s2_byteLogic_6_lastUsed) || s2_byteLogic_7_lastUsed);
  assign io_output_usedUntil = _zz_154;
  always @ (posedge clk) begin
    if(reset) begin
      io_input_m2sPipe_rValid <= 1'b0;
      s0_output_m2sPipe_rValid <= 1'b0;
      s1_output_m2sPipe_rValid <= 1'b0;
    end else begin
      if(io_input_ready)begin
        io_input_m2sPipe_rValid <= io_input_valid;
      end
      if(io_flush)begin
        io_input_m2sPipe_rValid <= 1'b0;
      end
      if(s0_output_ready)begin
        s0_output_m2sPipe_rValid <= s0_output_valid;
      end
      if(io_flush)begin
        s0_output_m2sPipe_rValid <= 1'b0;
      end
      if(s1_output_ready)begin
        s1_output_m2sPipe_rValid <= s1_output_valid;
      end
      if(io_flush)begin
        s1_output_m2sPipe_rValid <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(io_input_ready)begin
      io_input_m2sPipe_rData_data <= io_input_payload_data;
      io_input_m2sPipe_rData_mask <= io_input_payload_mask;
    end
    if(s0_output_ready)begin
      s0_output_m2sPipe_rData_cmd_data <= s0_output_payload_cmd_data;
      s0_output_m2sPipe_rData_cmd_mask <= s0_output_payload_cmd_mask;
      s0_output_m2sPipe_rData_countOnes_0 <= s0_output_payload_countOnes_0;
      s0_output_m2sPipe_rData_countOnes_1 <= s0_output_payload_countOnes_1;
      s0_output_m2sPipe_rData_countOnes_2 <= s0_output_payload_countOnes_2;
      s0_output_m2sPipe_rData_countOnes_3 <= s0_output_payload_countOnes_3;
      s0_output_m2sPipe_rData_countOnes_4 <= s0_output_payload_countOnes_4;
      s0_output_m2sPipe_rData_countOnes_5 <= s0_output_payload_countOnes_5;
      s0_output_m2sPipe_rData_countOnes_6 <= s0_output_payload_countOnes_6;
      s0_output_m2sPipe_rData_countOnes_7 <= s0_output_payload_countOnes_7;
    end
    if((s1_input_valid && s1_input_ready))begin
      s1_offset <= s1_offsetNext[2:0];
    end
    if(io_flush)begin
      s1_offset <= io_offset;
    end
    if((s1_input_valid && s1_input_ready))begin
      s1_byteCounter <= (s1_byteCounter + _zz_166);
    end
    if(io_flush)begin
      s1_byteCounter <= 12'h0;
    end
    if(s1_output_ready)begin
      s1_output_m2sPipe_rData_cmd_data <= s1_output_payload_cmd_data;
      s1_output_m2sPipe_rData_cmd_mask <= s1_output_payload_cmd_mask;
      s1_output_m2sPipe_rData_index_0 <= s1_output_payload_index_0;
      s1_output_m2sPipe_rData_index_1 <= s1_output_payload_index_1;
      s1_output_m2sPipe_rData_index_2 <= s1_output_payload_index_2;
      s1_output_m2sPipe_rData_index_3 <= s1_output_payload_index_3;
      s1_output_m2sPipe_rData_index_4 <= s1_output_payload_index_4;
      s1_output_m2sPipe_rData_index_5 <= s1_output_payload_index_5;
      s1_output_m2sPipe_rData_index_6 <= s1_output_payload_index_6;
      s1_output_m2sPipe_rData_index_7 <= s1_output_payload_index_7;
      s1_output_m2sPipe_rData_last <= s1_output_payload_last;
      s1_output_m2sPipe_rData_sel_0 <= s1_output_payload_sel_0;
      s1_output_m2sPipe_rData_sel_1 <= s1_output_payload_sel_1;
      s1_output_m2sPipe_rData_sel_2 <= s1_output_payload_sel_2;
      s1_output_m2sPipe_rData_sel_3 <= s1_output_payload_sel_3;
      s1_output_m2sPipe_rData_sel_4 <= s1_output_payload_sel_4;
      s1_output_m2sPipe_rData_sel_5 <= s1_output_payload_sel_5;
      s1_output_m2sPipe_rData_sel_6 <= s1_output_payload_sel_6;
      s1_output_m2sPipe_rData_sel_7 <= s1_output_payload_sel_7;
      s1_output_m2sPipe_rData_selValid <= s1_output_payload_selValid;
    end
    if(io_output_consume)begin
      s2_byteLogic_0_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_0_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_0_inputMask && ((! io_output_consume) || s2_byteLogic_0_buffer_valid)))begin
        s2_byteLogic_0_buffer_valid <= 1'b1;
        s2_byteLogic_0_buffer_data <= s2_byteLogic_0_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_0_buffer_valid <= (3'b000 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_1_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_1_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_1_inputMask && ((! io_output_consume) || s2_byteLogic_1_buffer_valid)))begin
        s2_byteLogic_1_buffer_valid <= 1'b1;
        s2_byteLogic_1_buffer_data <= s2_byteLogic_1_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_1_buffer_valid <= (3'b001 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_2_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_2_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_2_inputMask && ((! io_output_consume) || s2_byteLogic_2_buffer_valid)))begin
        s2_byteLogic_2_buffer_valid <= 1'b1;
        s2_byteLogic_2_buffer_data <= s2_byteLogic_2_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_2_buffer_valid <= (3'b010 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_3_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_3_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_3_inputMask && ((! io_output_consume) || s2_byteLogic_3_buffer_valid)))begin
        s2_byteLogic_3_buffer_valid <= 1'b1;
        s2_byteLogic_3_buffer_data <= s2_byteLogic_3_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_3_buffer_valid <= (3'b011 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_4_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_4_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_4_inputMask && ((! io_output_consume) || s2_byteLogic_4_buffer_valid)))begin
        s2_byteLogic_4_buffer_valid <= 1'b1;
        s2_byteLogic_4_buffer_data <= s2_byteLogic_4_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_4_buffer_valid <= (3'b100 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_5_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_5_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_5_inputMask && ((! io_output_consume) || s2_byteLogic_5_buffer_valid)))begin
        s2_byteLogic_5_buffer_valid <= 1'b1;
        s2_byteLogic_5_buffer_data <= s2_byteLogic_5_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_5_buffer_valid <= (3'b101 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_6_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_6_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_6_inputMask && ((! io_output_consume) || s2_byteLogic_6_buffer_valid)))begin
        s2_byteLogic_6_buffer_valid <= 1'b1;
        s2_byteLogic_6_buffer_data <= s2_byteLogic_6_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_6_buffer_valid <= (3'b110 < io_offset);
    end
    if(io_output_consume)begin
      s2_byteLogic_7_buffer_valid <= 1'b0;
    end
    if((s2_input_valid && s2_input_ready))begin
      if(s2_input_payload_last)begin
        s2_byteLogic_7_buffer_valid <= 1'b0;
      end
      if((s2_byteLogic_7_inputMask && ((! io_output_consume) || s2_byteLogic_7_buffer_valid)))begin
        s2_byteLogic_7_buffer_valid <= 1'b1;
        s2_byteLogic_7_buffer_data <= s2_byteLogic_7_inputData;
      end
    end
    if(io_flush)begin
      s2_byteLogic_7_buffer_valid <= (3'b111 < io_offset);
    end
  end


endmodule

module EfxDMA_DmaMemoryCore (
  input               io_writes_0_cmd_valid,
  output              io_writes_0_cmd_ready,
  input      [9:0]    io_writes_0_cmd_payload_address,
  input      [31:0]   io_writes_0_cmd_payload_data,
  input      [3:0]    io_writes_0_cmd_payload_mask,
  input      [1:0]    io_writes_0_cmd_payload_priority,
  input      [5:0]    io_writes_0_cmd_payload_context,
  output              io_writes_0_rsp_valid,
  output     [5:0]    io_writes_0_rsp_payload_context,
  input               io_writes_1_cmd_valid,
  output              io_writes_1_cmd_ready,
  input      [9:0]    io_writes_1_cmd_payload_address,
  input      [63:0]   io_writes_1_cmd_payload_data,
  input      [7:0]    io_writes_1_cmd_payload_mask,
  input      [5:0]    io_writes_1_cmd_payload_context,
  output              io_writes_1_rsp_valid,
  output     [5:0]    io_writes_1_rsp_payload_context,
  input               io_reads_0_cmd_valid,
  output              io_reads_0_cmd_ready,
  input      [9:0]    io_reads_0_cmd_payload_address,
  input      [1:0]    io_reads_0_cmd_payload_priority,
  input      [2:0]    io_reads_0_cmd_payload_context,
  output              io_reads_0_rsp_valid,
  input               io_reads_0_rsp_ready,
  output     [31:0]   io_reads_0_rsp_payload_data,
  output     [3:0]    io_reads_0_rsp_payload_mask,
  output     [2:0]    io_reads_0_rsp_payload_context,
  input               io_reads_1_cmd_valid,
  output              io_reads_1_cmd_ready,
  input      [9:0]    io_reads_1_cmd_payload_address,
  input      [11:0]   io_reads_1_cmd_payload_context,
  output              io_reads_1_rsp_valid,
  input               io_reads_1_rsp_ready,
  output     [63:0]   io_reads_1_rsp_payload_data,
  output     [7:0]    io_reads_1_rsp_payload_mask,
  output     [11:0]   io_reads_1_rsp_payload_context,
  input               clk,
  input               reset
);
  reg        [35:0]   _zz_39;
  reg        [35:0]   _zz_40;
  reg        [31:0]   _zz_41;
  reg        [3:0]    _zz_42;
  wire                _zz_43;
  wire                _zz_44;
  wire                _zz_45;
  wire                _zz_46;
  wire                _zz_47;
  wire                _zz_48;
  wire                _zz_49;
  wire                _zz_50;
  wire                _zz_51;
  wire                _zz_52;
  wire       [3:0]    _zz_53;
  wire       [9:0]    _zz_54;
  wire       [9:0]    _zz_55;
  wire       [3:0]    _zz_56;
  wire       [9:0]    _zz_57;
  wire       [9:0]    _zz_58;
  wire       [0:0]    _zz_59;
  wire       [0:0]    _zz_60;
  wire       [0:0]    _zz_61;
  wire       [0:0]    _zz_62;
  wire       [35:0]   _zz_63;
  wire       [35:0]   _zz_64;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                banks_0_write_valid;
  wire       [8:0]    banks_0_write_payload_address;
  wire       [31:0]   banks_0_write_payload_data_data;
  wire       [3:0]    banks_0_write_payload_data_mask;
  wire                banks_0_read_cmd_valid;
  wire       [8:0]    banks_0_read_cmd_payload;
  wire       [31:0]   banks_0_read_rsp_data;
  wire       [3:0]    banks_0_read_rsp_mask;
  wire       [35:0]   _zz_3;
  wire                banks_0_writeOr_value_valid;
  wire       [8:0]    banks_0_writeOr_value_payload_address;
  wire       [31:0]   banks_0_writeOr_value_payload_data_data;
  wire       [3:0]    banks_0_writeOr_value_payload_data_mask;
  wire                banks_0_readOr_value_valid;
  wire       [8:0]    banks_0_readOr_value_payload;
  wire                banks_1_write_valid;
  wire       [8:0]    banks_1_write_payload_address;
  wire       [31:0]   banks_1_write_payload_data_data;
  wire       [3:0]    banks_1_write_payload_data_mask;
  wire                banks_1_read_cmd_valid;
  wire       [8:0]    banks_1_read_cmd_payload;
  wire       [31:0]   banks_1_read_rsp_data;
  wire       [3:0]    banks_1_read_rsp_mask;
  wire       [35:0]   _zz_4;
  wire                banks_1_writeOr_value_valid;
  wire       [8:0]    banks_1_writeOr_value_payload_address;
  wire       [31:0]   banks_1_writeOr_value_payload_data_data;
  wire       [3:0]    banks_1_writeOr_value_payload_data_mask;
  wire                banks_1_readOr_value_valid;
  wire       [8:0]    banks_1_readOr_value_payload;
  reg        [3:0]    write_ports_0_priority_value = 4'b0000;
  wire                write_nodes_0_0_priority;
  wire                write_nodes_0_0_conflict;
  wire                write_nodes_0_1_priority;
  wire                write_nodes_0_1_conflict;
  wire                write_nodes_1_0_priority;
  wire                write_nodes_1_0_conflict;
  wire                write_nodes_1_1_priority;
  wire                write_nodes_1_1_conflict;
  wire       [0:0]    write_arbiter_0_losedAgainst;
  wire                write_arbiter_0_doIt;
  reg                 _zz_5;
  reg        [8:0]    _zz_6;
  reg        [31:0]   _zz_7;
  reg        [3:0]    _zz_8;
  reg                 _zz_9;
  reg        [8:0]    _zz_10;
  reg        [31:0]   _zz_11;
  reg        [3:0]    _zz_12;
  reg                 write_arbiter_0_doIt_regNext;
  reg        [5:0]    io_writes_0_cmd_payload_context_regNext;
  wire       [0:0]    write_arbiter_1_losedAgainst;
  wire                write_arbiter_1_doIt;
  reg                 _zz_13;
  reg        [8:0]    _zz_14;
  reg        [31:0]   _zz_15;
  reg        [3:0]    _zz_16;
  reg                 _zz_17;
  reg        [8:0]    _zz_18;
  reg        [31:0]   _zz_19;
  reg        [3:0]    _zz_20;
  reg                 write_arbiter_1_doIt_regNext;
  reg        [5:0]    io_writes_1_cmd_payload_context_regNext;
  wire                read_ports_0_buffer_s0_valid;
  wire       [2:0]    read_ports_0_buffer_s0_payload_context;
  wire       [9:0]    read_ports_0_buffer_s0_payload_address;
  reg                 read_ports_0_buffer_s1_valid;
  reg        [2:0]    read_ports_0_buffer_s1_payload_context;
  reg        [9:0]    read_ports_0_buffer_s1_payload_address;
  wire       [0:0]    read_ports_0_buffer_groupSel;
  wire                read_ports_0_buffer_bufferIn_valid;
  wire                read_ports_0_buffer_bufferIn_ready;
  wire       [31:0]   read_ports_0_buffer_bufferIn_payload_data;
  wire       [3:0]    read_ports_0_buffer_bufferIn_payload_mask;
  wire       [2:0]    read_ports_0_buffer_bufferIn_payload_context;
  wire                read_ports_0_buffer_bufferOut_valid;
  wire                read_ports_0_buffer_bufferOut_ready;
  wire       [31:0]   read_ports_0_buffer_bufferOut_payload_data;
  wire       [3:0]    read_ports_0_buffer_bufferOut_payload_mask;
  wire       [2:0]    read_ports_0_buffer_bufferOut_payload_context;
  reg                 read_ports_0_buffer_bufferIn_s2mPipe_rValid;
  reg        [31:0]   read_ports_0_buffer_bufferIn_s2mPipe_rData_data;
  reg        [3:0]    read_ports_0_buffer_bufferIn_s2mPipe_rData_mask;
  reg        [2:0]    read_ports_0_buffer_bufferIn_s2mPipe_rData_context;
  wire                read_ports_0_buffer_full;
  wire                _zz_21;
  wire                read_ports_0_cmd_valid;
  wire                read_ports_0_cmd_ready;
  wire       [9:0]    read_ports_0_cmd_payload_address;
  wire       [1:0]    read_ports_0_cmd_payload_priority;
  wire       [2:0]    read_ports_0_cmd_payload_context;
  reg        [3:0]    read_ports_0_priority_value = 4'b0000;
  wire                read_ports_1_buffer_s0_valid;
  wire       [11:0]   read_ports_1_buffer_s0_payload_context;
  wire       [9:0]    read_ports_1_buffer_s0_payload_address;
  reg                 read_ports_1_buffer_s1_valid;
  reg        [11:0]   read_ports_1_buffer_s1_payload_context;
  reg        [9:0]    read_ports_1_buffer_s1_payload_address;
  wire                read_ports_1_buffer_bufferIn_valid;
  wire                read_ports_1_buffer_bufferIn_ready;
  wire       [63:0]   read_ports_1_buffer_bufferIn_payload_data;
  wire       [7:0]    read_ports_1_buffer_bufferIn_payload_mask;
  wire       [11:0]   read_ports_1_buffer_bufferIn_payload_context;
  wire                read_ports_1_buffer_bufferOut_valid;
  wire                read_ports_1_buffer_bufferOut_ready;
  wire       [63:0]   read_ports_1_buffer_bufferOut_payload_data;
  wire       [7:0]    read_ports_1_buffer_bufferOut_payload_mask;
  wire       [11:0]   read_ports_1_buffer_bufferOut_payload_context;
  reg                 read_ports_1_buffer_bufferIn_s2mPipe_rValid;
  reg        [63:0]   read_ports_1_buffer_bufferIn_s2mPipe_rData_data;
  reg        [7:0]    read_ports_1_buffer_bufferIn_s2mPipe_rData_mask;
  reg        [11:0]   read_ports_1_buffer_bufferIn_s2mPipe_rData_context;
  wire                read_ports_1_buffer_full;
  wire                _zz_22;
  wire                read_ports_1_cmd_valid;
  wire                read_ports_1_cmd_ready;
  wire       [9:0]    read_ports_1_cmd_payload_address;
  wire       [11:0]   read_ports_1_cmd_payload_context;
  wire                read_nodes_0_0_priority;
  wire                read_nodes_0_0_conflict;
  wire                read_nodes_0_1_priority;
  wire                read_nodes_0_1_conflict;
  wire                read_nodes_1_0_priority;
  wire                read_nodes_1_0_conflict;
  wire                read_nodes_1_1_priority;
  wire                read_nodes_1_1_conflict;
  wire       [0:0]    read_arbiter_0_losedAgainst;
  wire                read_arbiter_0_doIt;
  reg                 _zz_23;
  reg        [8:0]    _zz_24;
  reg                 _zz_25;
  reg        [8:0]    _zz_26;
  wire       [0:0]    read_arbiter_1_losedAgainst;
  wire                read_arbiter_1_doIt;
  reg                 _zz_27;
  reg        [8:0]    _zz_28;
  reg                 _zz_29;
  reg        [8:0]    _zz_30;
  wire       [45:0]   _zz_31;
  wire       [44:0]   _zz_32;
  wire       [35:0]   _zz_33;
  wire       [9:0]    _zz_34;
  wire       [45:0]   _zz_35;
  wire       [44:0]   _zz_36;
  wire       [35:0]   _zz_37;
  wire       [9:0]    _zz_38;
  (* ram_style = "block" *) reg [35:0] banks_0_ram [0:511];
  (* ram_style = "block" *) reg [35:0] banks_1_ram [0:511];

  assign _zz_43 = (write_arbiter_0_doIt && (_zz_54[0 : 0] == 1'b0));
  assign _zz_44 = (write_arbiter_0_doIt && (_zz_55[0 : 0] == 1'b0));
  assign _zz_45 = (write_arbiter_1_doIt && 1'b1);
  assign _zz_46 = (write_arbiter_1_doIt && 1'b1);
  assign _zz_47 = (read_arbiter_0_doIt && (_zz_57[0 : 0] == 1'b0));
  assign _zz_48 = (read_arbiter_0_doIt && (_zz_58[0 : 0] == 1'b0));
  assign _zz_49 = (read_arbiter_1_doIt && 1'b1);
  assign _zz_50 = (read_arbiter_1_doIt && 1'b1);
  assign _zz_51 = (read_ports_0_buffer_bufferIn_ready && (! read_ports_0_buffer_bufferOut_ready));
  assign _zz_52 = (read_ports_1_buffer_bufferIn_ready && (! read_ports_1_buffer_bufferOut_ready));
  assign _zz_53 = {2'd0, io_writes_0_cmd_payload_priority};
  assign _zz_54 = (io_writes_0_cmd_payload_address ^ 10'h0);
  assign _zz_55 = (io_writes_0_cmd_payload_address ^ 10'h001);
  assign _zz_56 = {2'd0, read_ports_0_cmd_payload_priority};
  assign _zz_57 = (read_ports_0_cmd_payload_address ^ 10'h0);
  assign _zz_58 = (read_ports_0_cmd_payload_address ^ 10'h001);
  assign _zz_59 = _zz_31[0 : 0];
  assign _zz_60 = _zz_34[0 : 0];
  assign _zz_61 = _zz_35[0 : 0];
  assign _zz_62 = _zz_38[0 : 0];
  assign _zz_63 = {banks_0_write_payload_data_mask,banks_0_write_payload_data_data};
  assign _zz_64 = {banks_1_write_payload_data_mask,banks_1_write_payload_data_data};
  always @ (posedge clk) begin
    if(_zz_2) begin
      banks_0_ram[banks_0_write_payload_address] <= _zz_63;
    end
  end

  always @ (posedge clk) begin
    if(banks_0_read_cmd_valid) begin
      _zz_39 <= banks_0_ram[banks_0_read_cmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1) begin
      banks_1_ram[banks_1_write_payload_address] <= _zz_64;
    end
  end

  always @ (posedge clk) begin
    if(banks_1_read_cmd_valid) begin
      _zz_40 <= banks_1_ram[banks_1_read_cmd_payload];
    end
  end

  always @(*) begin
    case(read_ports_0_buffer_groupSel)
      1'b0 : begin
        _zz_41 = banks_0_read_rsp_data;
        _zz_42 = banks_0_read_rsp_mask;
      end
      default : begin
        _zz_41 = banks_1_read_rsp_data;
        _zz_42 = banks_1_read_rsp_mask;
      end
    endcase
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(banks_1_write_valid)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if(banks_0_write_valid)begin
      _zz_2 = 1'b1;
    end
  end

  assign _zz_3 = _zz_39;
  assign banks_0_read_rsp_data = _zz_3[31 : 0];
  assign banks_0_read_rsp_mask = _zz_3[35 : 32];
  assign banks_0_write_valid = banks_0_writeOr_value_valid;
  assign banks_0_write_payload_address = banks_0_writeOr_value_payload_address;
  assign banks_0_write_payload_data_data = banks_0_writeOr_value_payload_data_data;
  assign banks_0_write_payload_data_mask = banks_0_writeOr_value_payload_data_mask;
  assign banks_0_read_cmd_valid = banks_0_readOr_value_valid;
  assign banks_0_read_cmd_payload = banks_0_readOr_value_payload;
  assign _zz_4 = _zz_40;
  assign banks_1_read_rsp_data = _zz_4[31 : 0];
  assign banks_1_read_rsp_mask = _zz_4[35 : 32];
  assign banks_1_write_valid = banks_1_writeOr_value_valid;
  assign banks_1_write_payload_address = banks_1_writeOr_value_payload_address;
  assign banks_1_write_payload_data_data = banks_1_writeOr_value_payload_data_data;
  assign banks_1_write_payload_data_mask = banks_1_writeOr_value_payload_data_mask;
  assign banks_1_read_cmd_valid = banks_1_readOr_value_valid;
  assign banks_1_read_cmd_payload = banks_1_readOr_value_payload;
  assign write_nodes_0_1_priority = 1'b0;
  assign write_nodes_1_0_priority = 1'b1;
  assign write_nodes_0_1_conflict = ((io_writes_0_cmd_valid && io_writes_1_cmd_valid) && (((io_writes_0_cmd_payload_address ^ io_writes_1_cmd_payload_address) & 10'h0) == 10'h0));
  assign write_nodes_1_0_conflict = write_nodes_0_1_conflict;
  assign write_arbiter_0_losedAgainst[0] = (write_nodes_0_1_conflict && (! write_nodes_0_1_priority));
  assign write_arbiter_0_doIt = (io_writes_0_cmd_valid && (write_arbiter_0_losedAgainst == 1'b0));
  always @ (*) begin
    if(_zz_43)begin
      _zz_5 = 1'b1;
    end else begin
      _zz_5 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_43)begin
      _zz_6 = (io_writes_0_cmd_payload_address >>> 1);
    end else begin
      _zz_6 = 9'h0;
    end
  end

  always @ (*) begin
    if(_zz_43)begin
      _zz_7 = io_writes_0_cmd_payload_data[31 : 0];
    end else begin
      _zz_7 = 32'h0;
    end
  end

  always @ (*) begin
    if(_zz_43)begin
      _zz_8 = io_writes_0_cmd_payload_mask[3 : 0];
    end else begin
      _zz_8 = 4'b0000;
    end
  end

  always @ (*) begin
    if(_zz_44)begin
      _zz_9 = 1'b1;
    end else begin
      _zz_9 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_44)begin
      _zz_10 = (io_writes_0_cmd_payload_address >>> 1);
    end else begin
      _zz_10 = 9'h0;
    end
  end

  always @ (*) begin
    if(_zz_44)begin
      _zz_11 = io_writes_0_cmd_payload_data[31 : 0];
    end else begin
      _zz_11 = 32'h0;
    end
  end

  always @ (*) begin
    if(_zz_44)begin
      _zz_12 = io_writes_0_cmd_payload_mask[3 : 0];
    end else begin
      _zz_12 = 4'b0000;
    end
  end

  assign io_writes_0_cmd_ready = write_arbiter_0_doIt;
  assign io_writes_0_rsp_valid = write_arbiter_0_doIt_regNext;
  assign io_writes_0_rsp_payload_context = io_writes_0_cmd_payload_context_regNext;
  assign write_arbiter_1_losedAgainst[0] = (write_nodes_1_0_conflict && (! write_nodes_1_0_priority));
  assign write_arbiter_1_doIt = (io_writes_1_cmd_valid && (write_arbiter_1_losedAgainst == 1'b0));
  always @ (*) begin
    if(_zz_45)begin
      _zz_13 = 1'b1;
    end else begin
      _zz_13 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_45)begin
      _zz_14 = (io_writes_1_cmd_payload_address >>> 1);
    end else begin
      _zz_14 = 9'h0;
    end
  end

  always @ (*) begin
    if(_zz_45)begin
      _zz_15 = io_writes_1_cmd_payload_data[31 : 0];
    end else begin
      _zz_15 = 32'h0;
    end
  end

  always @ (*) begin
    if(_zz_45)begin
      _zz_16 = io_writes_1_cmd_payload_mask[3 : 0];
    end else begin
      _zz_16 = 4'b0000;
    end
  end

  always @ (*) begin
    if(_zz_46)begin
      _zz_17 = 1'b1;
    end else begin
      _zz_17 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_46)begin
      _zz_18 = (io_writes_1_cmd_payload_address >>> 1);
    end else begin
      _zz_18 = 9'h0;
    end
  end

  always @ (*) begin
    if(_zz_46)begin
      _zz_19 = io_writes_1_cmd_payload_data[63 : 32];
    end else begin
      _zz_19 = 32'h0;
    end
  end

  always @ (*) begin
    if(_zz_46)begin
      _zz_20 = io_writes_1_cmd_payload_mask[7 : 4];
    end else begin
      _zz_20 = 4'b0000;
    end
  end

  assign io_writes_1_cmd_ready = write_arbiter_1_doIt;
  assign io_writes_1_rsp_valid = write_arbiter_1_doIt_regNext;
  assign io_writes_1_rsp_payload_context = io_writes_1_cmd_payload_context_regNext;
  assign read_ports_0_buffer_groupSel = read_ports_0_buffer_s1_payload_address[0 : 0];
  assign read_ports_0_buffer_bufferIn_valid = read_ports_0_buffer_s1_valid;
  assign read_ports_0_buffer_bufferIn_payload_context = read_ports_0_buffer_s1_payload_context;
  assign read_ports_0_buffer_bufferIn_payload_data = _zz_41;
  assign read_ports_0_buffer_bufferIn_payload_mask = _zz_42;
  assign read_ports_0_buffer_bufferOut_valid = (read_ports_0_buffer_bufferIn_valid || read_ports_0_buffer_bufferIn_s2mPipe_rValid);
  assign read_ports_0_buffer_bufferIn_ready = (! read_ports_0_buffer_bufferIn_s2mPipe_rValid);
  assign read_ports_0_buffer_bufferOut_payload_data = (read_ports_0_buffer_bufferIn_s2mPipe_rValid ? read_ports_0_buffer_bufferIn_s2mPipe_rData_data : read_ports_0_buffer_bufferIn_payload_data);
  assign read_ports_0_buffer_bufferOut_payload_mask = (read_ports_0_buffer_bufferIn_s2mPipe_rValid ? read_ports_0_buffer_bufferIn_s2mPipe_rData_mask : read_ports_0_buffer_bufferIn_payload_mask);
  assign read_ports_0_buffer_bufferOut_payload_context = (read_ports_0_buffer_bufferIn_s2mPipe_rValid ? read_ports_0_buffer_bufferIn_s2mPipe_rData_context : read_ports_0_buffer_bufferIn_payload_context);
  assign io_reads_0_rsp_valid = read_ports_0_buffer_bufferOut_valid;
  assign read_ports_0_buffer_bufferOut_ready = io_reads_0_rsp_ready;
  assign io_reads_0_rsp_payload_data = read_ports_0_buffer_bufferOut_payload_data;
  assign io_reads_0_rsp_payload_mask = read_ports_0_buffer_bufferOut_payload_mask;
  assign io_reads_0_rsp_payload_context = read_ports_0_buffer_bufferOut_payload_context;
  assign read_ports_0_buffer_full = (read_ports_0_buffer_bufferOut_valid && (! read_ports_0_buffer_bufferOut_ready));
  assign _zz_21 = (! read_ports_0_buffer_full);
  assign read_ports_0_cmd_valid = (io_reads_0_cmd_valid && _zz_21);
  assign io_reads_0_cmd_ready = (read_ports_0_cmd_ready && _zz_21);
  assign read_ports_0_cmd_payload_address = io_reads_0_cmd_payload_address;
  assign read_ports_0_cmd_payload_priority = io_reads_0_cmd_payload_priority;
  assign read_ports_0_cmd_payload_context = io_reads_0_cmd_payload_context;
  assign read_ports_1_buffer_bufferIn_valid = read_ports_1_buffer_s1_valid;
  assign read_ports_1_buffer_bufferIn_payload_context = read_ports_1_buffer_s1_payload_context;
  assign read_ports_1_buffer_bufferIn_payload_data = {banks_1_read_rsp_data,banks_0_read_rsp_data};
  assign read_ports_1_buffer_bufferIn_payload_mask = {banks_1_read_rsp_mask,banks_0_read_rsp_mask};
  assign read_ports_1_buffer_bufferOut_valid = (read_ports_1_buffer_bufferIn_valid || read_ports_1_buffer_bufferIn_s2mPipe_rValid);
  assign read_ports_1_buffer_bufferIn_ready = (! read_ports_1_buffer_bufferIn_s2mPipe_rValid);
  assign read_ports_1_buffer_bufferOut_payload_data = (read_ports_1_buffer_bufferIn_s2mPipe_rValid ? read_ports_1_buffer_bufferIn_s2mPipe_rData_data : read_ports_1_buffer_bufferIn_payload_data);
  assign read_ports_1_buffer_bufferOut_payload_mask = (read_ports_1_buffer_bufferIn_s2mPipe_rValid ? read_ports_1_buffer_bufferIn_s2mPipe_rData_mask : read_ports_1_buffer_bufferIn_payload_mask);
  assign read_ports_1_buffer_bufferOut_payload_context = (read_ports_1_buffer_bufferIn_s2mPipe_rValid ? read_ports_1_buffer_bufferIn_s2mPipe_rData_context : read_ports_1_buffer_bufferIn_payload_context);
  assign io_reads_1_rsp_valid = read_ports_1_buffer_bufferOut_valid;
  assign read_ports_1_buffer_bufferOut_ready = io_reads_1_rsp_ready;
  assign io_reads_1_rsp_payload_data = read_ports_1_buffer_bufferOut_payload_data;
  assign io_reads_1_rsp_payload_mask = read_ports_1_buffer_bufferOut_payload_mask;
  assign io_reads_1_rsp_payload_context = read_ports_1_buffer_bufferOut_payload_context;
  assign read_ports_1_buffer_full = (read_ports_1_buffer_bufferOut_valid && (! read_ports_1_buffer_bufferOut_ready));
  assign _zz_22 = (! read_ports_1_buffer_full);
  assign read_ports_1_cmd_valid = (io_reads_1_cmd_valid && _zz_22);
  assign io_reads_1_cmd_ready = (read_ports_1_cmd_ready && _zz_22);
  assign read_ports_1_cmd_payload_address = io_reads_1_cmd_payload_address;
  assign read_ports_1_cmd_payload_context = io_reads_1_cmd_payload_context;
  assign read_nodes_0_1_priority = 1'b0;
  assign read_nodes_1_0_priority = 1'b1;
  assign read_nodes_0_1_conflict = ((read_ports_0_cmd_valid && read_ports_1_cmd_valid) && (((read_ports_0_cmd_payload_address ^ io_reads_1_cmd_payload_address) & 10'h0) == 10'h0));
  assign read_nodes_1_0_conflict = read_nodes_0_1_conflict;
  assign read_arbiter_0_losedAgainst[0] = (read_nodes_0_1_conflict && (! read_nodes_0_1_priority));
  assign read_arbiter_0_doIt = (read_ports_0_cmd_valid && (read_arbiter_0_losedAgainst == 1'b0));
  always @ (*) begin
    if(_zz_47)begin
      _zz_23 = 1'b1;
    end else begin
      _zz_23 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_47)begin
      _zz_24 = (read_ports_0_cmd_payload_address >>> 1);
    end else begin
      _zz_24 = 9'h0;
    end
  end

  always @ (*) begin
    if(_zz_48)begin
      _zz_25 = 1'b1;
    end else begin
      _zz_25 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_48)begin
      _zz_26 = (read_ports_0_cmd_payload_address >>> 1);
    end else begin
      _zz_26 = 9'h0;
    end
  end

  assign read_ports_0_cmd_ready = read_arbiter_0_doIt;
  assign read_ports_0_buffer_s0_valid = read_arbiter_0_doIt;
  assign read_ports_0_buffer_s0_payload_context = read_ports_0_cmd_payload_context;
  assign read_ports_0_buffer_s0_payload_address = read_ports_0_cmd_payload_address;
  assign read_arbiter_1_losedAgainst[0] = (read_nodes_1_0_conflict && (! read_nodes_1_0_priority));
  assign read_arbiter_1_doIt = (read_ports_1_cmd_valid && (read_arbiter_1_losedAgainst == 1'b0));
  always @ (*) begin
    if(_zz_49)begin
      _zz_27 = 1'b1;
    end else begin
      _zz_27 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_49)begin
      _zz_28 = (read_ports_1_cmd_payload_address >>> 1);
    end else begin
      _zz_28 = 9'h0;
    end
  end

  always @ (*) begin
    if(_zz_50)begin
      _zz_29 = 1'b1;
    end else begin
      _zz_29 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_50)begin
      _zz_30 = (read_ports_1_cmd_payload_address >>> 1);
    end else begin
      _zz_30 = 9'h0;
    end
  end

  assign read_ports_1_cmd_ready = read_arbiter_1_doIt;
  assign read_ports_1_buffer_s0_valid = read_arbiter_1_doIt;
  assign read_ports_1_buffer_s0_payload_context = read_ports_1_cmd_payload_context;
  assign read_ports_1_buffer_s0_payload_address = read_ports_1_cmd_payload_address;
  assign _zz_31 = ({{{_zz_8,_zz_7},_zz_6},_zz_5} | {{{_zz_16,_zz_15},_zz_14},_zz_13});
  assign banks_0_writeOr_value_valid = _zz_59[0];
  assign _zz_32 = _zz_31[45 : 1];
  assign banks_0_writeOr_value_payload_address = _zz_32[8 : 0];
  assign _zz_33 = _zz_32[44 : 9];
  assign banks_0_writeOr_value_payload_data_data = _zz_33[31 : 0];
  assign banks_0_writeOr_value_payload_data_mask = _zz_33[35 : 32];
  assign _zz_34 = ({_zz_24,_zz_23} | {_zz_28,_zz_27});
  assign banks_0_readOr_value_valid = _zz_60[0];
  assign banks_0_readOr_value_payload = _zz_34[9 : 1];
  assign _zz_35 = ({{{_zz_12,_zz_11},_zz_10},_zz_9} | {{{_zz_20,_zz_19},_zz_18},_zz_17});
  assign banks_1_writeOr_value_valid = _zz_61[0];
  assign _zz_36 = _zz_35[45 : 1];
  assign banks_1_writeOr_value_payload_address = _zz_36[8 : 0];
  assign _zz_37 = _zz_36[44 : 9];
  assign banks_1_writeOr_value_payload_data_data = _zz_37[31 : 0];
  assign banks_1_writeOr_value_payload_data_mask = _zz_37[35 : 32];
  assign _zz_38 = ({_zz_26,_zz_25} | {_zz_30,_zz_29});
  assign banks_1_readOr_value_valid = _zz_62[0];
  assign banks_1_readOr_value_payload = _zz_38[9 : 1];
  always @ (posedge clk) begin
    if(io_writes_0_cmd_valid)begin
      write_ports_0_priority_value <= (write_ports_0_priority_value + _zz_53);
      if(io_writes_0_cmd_ready)begin
        write_ports_0_priority_value <= 4'b0000;
      end
    end
    io_writes_0_cmd_payload_context_regNext <= io_writes_0_cmd_payload_context;
    io_writes_1_cmd_payload_context_regNext <= io_writes_1_cmd_payload_context;
    read_ports_0_buffer_s1_payload_context <= read_ports_0_buffer_s0_payload_context;
    read_ports_0_buffer_s1_payload_address <= read_ports_0_buffer_s0_payload_address;
    if(_zz_51)begin
      read_ports_0_buffer_bufferIn_s2mPipe_rData_data <= read_ports_0_buffer_bufferIn_payload_data;
      read_ports_0_buffer_bufferIn_s2mPipe_rData_mask <= read_ports_0_buffer_bufferIn_payload_mask;
      read_ports_0_buffer_bufferIn_s2mPipe_rData_context <= read_ports_0_buffer_bufferIn_payload_context;
    end
    if(read_ports_0_cmd_valid)begin
      read_ports_0_priority_value <= (read_ports_0_priority_value + _zz_56);
      if(read_ports_0_cmd_ready)begin
        read_ports_0_priority_value <= 4'b0000;
      end
    end
    read_ports_1_buffer_s1_payload_context <= read_ports_1_buffer_s0_payload_context;
    read_ports_1_buffer_s1_payload_address <= read_ports_1_buffer_s0_payload_address;
    if(_zz_52)begin
      read_ports_1_buffer_bufferIn_s2mPipe_rData_data <= read_ports_1_buffer_bufferIn_payload_data;
      read_ports_1_buffer_bufferIn_s2mPipe_rData_mask <= read_ports_1_buffer_bufferIn_payload_mask;
      read_ports_1_buffer_bufferIn_s2mPipe_rData_context <= read_ports_1_buffer_bufferIn_payload_context;
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      write_arbiter_0_doIt_regNext <= 1'b0;
      write_arbiter_1_doIt_regNext <= 1'b0;
      read_ports_0_buffer_s1_valid <= 1'b0;
      read_ports_0_buffer_bufferIn_s2mPipe_rValid <= 1'b0;
      read_ports_1_buffer_s1_valid <= 1'b0;
      read_ports_1_buffer_bufferIn_s2mPipe_rValid <= 1'b0;
    end else begin
      write_arbiter_0_doIt_regNext <= write_arbiter_0_doIt;
      write_arbiter_1_doIt_regNext <= write_arbiter_1_doIt;
      read_ports_0_buffer_s1_valid <= read_ports_0_buffer_s0_valid;
      if(read_ports_0_buffer_bufferOut_ready)begin
        read_ports_0_buffer_bufferIn_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_51)begin
        read_ports_0_buffer_bufferIn_s2mPipe_rValid <= read_ports_0_buffer_bufferIn_valid;
      end
      read_ports_1_buffer_s1_valid <= read_ports_1_buffer_s0_valid;
      if(read_ports_1_buffer_bufferOut_ready)begin
        read_ports_1_buffer_bufferIn_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_52)begin
        read_ports_1_buffer_bufferIn_s2mPipe_rValid <= read_ports_1_buffer_bufferIn_valid;
      end
    end
  end


endmodule

module EfxDMA_StreamFifo_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [12:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [12:0]   io_pop_payload,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  output reg [2:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [12:0]   _zz_3;
  wire       [0:0]    _zz_4;
  wire       [2:0]    _zz_5;
  wire       [0:0]    _zz_6;
  wire       [2:0]    _zz_7;
  wire       [2:0]    _zz_8;
  wire       [2:0]    _zz_9;
  wire       [2:0]    _zz_10;
  wire       [2:0]    _zz_11;
  wire                _zz_12;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2;
  wire       [2:0]    logic_ptrDif;
  reg [12:0] logic_ram [0:6];

  assign _zz_4 = logic_pushPtr_willIncrement;
  assign _zz_5 = {2'd0, _zz_4};
  assign _zz_6 = logic_popPtr_willIncrement;
  assign _zz_7 = {2'd0, _zz_6};
  assign _zz_8 = (3'b111 + logic_ptrDif);
  assign _zz_9 = (3'b111 + _zz_10);
  assign _zz_10 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_11 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_12 = 1'b1;
  always @ (posedge clk) begin
    if(_zz_12) begin
      _zz_3 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(logic_pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b110);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    if(logic_pushPtr_willOverflow)begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5);
    end
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b110);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    if(logic_popPtr_willOverflow)begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_7);
    end
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2 && (! logic_full))));
  assign io_pop_payload = _zz_3;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @ (*) begin
    if(logic_ptrMatch)begin
      io_occupancy = (logic_risingOccupancy ? 3'b111 : 3'b000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_8);
    end
  end

  always @ (*) begin
    if(logic_ptrMatch)begin
      io_availability = (logic_risingOccupancy ? 3'b000 : 3'b111);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_9 : _zz_11);
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_2 <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2 <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_StreamFork_1 (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment_opcode,
  input      [31:0]   io_input_payload_fragment_address,
  input      [10:0]   io_input_payload_fragment_length,
  input      [63:0]   io_input_payload_fragment_data,
  input      [7:0]    io_input_payload_fragment_mask,
  input      [12:0]   io_input_payload_fragment_context,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_last,
  output     [0:0]    io_outputs_0_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_payload_fragment_address,
  output     [10:0]   io_outputs_0_payload_fragment_length,
  output     [63:0]   io_outputs_0_payload_fragment_data,
  output     [7:0]    io_outputs_0_payload_fragment_mask,
  output     [12:0]   io_outputs_0_payload_fragment_context,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_last,
  output     [0:0]    io_outputs_1_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_payload_fragment_address,
  output     [10:0]   io_outputs_1_payload_fragment_length,
  output     [63:0]   io_outputs_1_payload_fragment_data,
  output     [7:0]    io_outputs_1_payload_fragment_mask,
  output     [12:0]   io_outputs_1_payload_fragment_context,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg                 _zz_2;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1);
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_0_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_0_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_0_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_0_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_0_payload_fragment_context = io_input_payload_fragment_context;
  assign io_outputs_1_valid = (io_input_valid && _zz_2);
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_1_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_1_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_1_payload_fragment_data = io_input_payload_fragment_data;
  assign io_outputs_1_payload_fragment_mask = io_input_payload_fragment_mask;
  assign io_outputs_1_payload_fragment_context = io_input_payload_fragment_context;
  always @ (posedge clk) begin
    if(reset) begin
      _zz_1 <= 1'b1;
      _zz_2 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2 <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1 <= 1'b1;
        _zz_2 <= 1'b1;
      end
    end
  end


endmodule

module EfxDMA_StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [18:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [18:0]   io_pop_payload,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  output reg [2:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [18:0]   _zz_3;
  wire       [0:0]    _zz_4;
  wire       [2:0]    _zz_5;
  wire       [0:0]    _zz_6;
  wire       [2:0]    _zz_7;
  wire       [2:0]    _zz_8;
  wire       [2:0]    _zz_9;
  wire       [2:0]    _zz_10;
  wire       [2:0]    _zz_11;
  wire                _zz_12;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2;
  wire       [2:0]    logic_ptrDif;
  reg [18:0] logic_ram [0:6];

  assign _zz_4 = logic_pushPtr_willIncrement;
  assign _zz_5 = {2'd0, _zz_4};
  assign _zz_6 = logic_popPtr_willIncrement;
  assign _zz_7 = {2'd0, _zz_6};
  assign _zz_8 = (3'b111 + logic_ptrDif);
  assign _zz_9 = (3'b111 + _zz_10);
  assign _zz_10 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_11 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_12 = 1'b1;
  always @ (posedge clk) begin
    if(_zz_12) begin
      _zz_3 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(logic_pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b110);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    if(logic_pushPtr_willOverflow)begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5);
    end
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b110);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    if(logic_popPtr_willOverflow)begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_7);
    end
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2 && (! logic_full))));
  assign io_pop_payload = _zz_3;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @ (*) begin
    if(logic_ptrMatch)begin
      io_occupancy = (logic_risingOccupancy ? 3'b111 : 3'b000);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_8);
    end
  end

  always @ (*) begin
    if(logic_ptrMatch)begin
      io_availability = (logic_risingOccupancy ? 3'b000 : 3'b111);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_9 : _zz_11);
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_2 <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2 <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module EfxDMA_StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment_opcode,
  input      [31:0]   io_input_payload_fragment_address,
  input      [10:0]   io_input_payload_fragment_length,
  input      [18:0]   io_input_payload_fragment_context,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_last,
  output     [0:0]    io_outputs_0_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_payload_fragment_address,
  output     [10:0]   io_outputs_0_payload_fragment_length,
  output     [18:0]   io_outputs_0_payload_fragment_context,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_last,
  output     [0:0]    io_outputs_1_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_payload_fragment_address,
  output     [10:0]   io_outputs_1_payload_fragment_length,
  output     [18:0]   io_outputs_1_payload_fragment_context,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg                 _zz_2;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1);
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_0_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_0_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_0_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_0_payload_fragment_context = io_input_payload_fragment_context;
  assign io_outputs_1_valid = (io_input_valid && _zz_2);
  assign io_outputs_1_payload_last = io_input_payload_last;
  assign io_outputs_1_payload_fragment_opcode = io_input_payload_fragment_opcode;
  assign io_outputs_1_payload_fragment_address = io_input_payload_fragment_address;
  assign io_outputs_1_payload_fragment_length = io_input_payload_fragment_length;
  assign io_outputs_1_payload_fragment_context = io_input_payload_fragment_context;
  always @ (posedge clk) begin
    if(reset) begin
      _zz_1 <= 1'b1;
      _zz_2 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2 <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1 <= 1'b1;
        _zz_2 <= 1'b1;
      end
    end
  end


endmodule
