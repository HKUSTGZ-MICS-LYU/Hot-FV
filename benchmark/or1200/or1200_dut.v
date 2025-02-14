//Following code is from line 1
module or1200(dwb_clk_i, pm_wakeup_o, dwb_we_o, rst_i, dbg_bp_o, dbg_adr_i, dwb_dat_o, dwb_stb_o, dbg_ewt_i, dwb_adr_o, iwb_cti_o, dbg_ack_o, pm_cpu_gate_o, iwb_adr_o, dbg_dat_o, dbg_lss_o, dwb_ack_i, dbg_we_i, iwb_bte_o, dbg_wp_o, pm_ic_gate_o, iwb_err_i, iwb_dat_i, dbg_dat_i, sig_tick, dwb_cti_o, iwb_ack_i, dwb_err_i, dwb_rst_i, iwb_cyc_o, iwb_clk_i, iwb_we_o, dwb_sel_o, dbg_stall_i, pic_ints_i, iwb_dat_o, iwb_rst_i, dwb_rty_i, dwb_bte_o, dbg_stb_i, pm_clksd_o, pm_lvolt_o, dbg_is_o, clmode_i, pm_cpustall_i, pm_dc_gate_o, dwb_dat_i, iwb_stb_o, pm_immu_gate_o, clk_i, dwb_cyc_o, iwb_sel_o, pm_dmmu_gate_o, iwb_rty_i, pm_tt_gate_o);

    input                clk_i;
    input                rst_i;
    input         [19:0] pic_ints_i;
    input         [1:0]  clmode_i;
    input                iwb_clk_i;
    input                iwb_rst_i;
    input                iwb_ack_i;
    input                iwb_err_i;
    input                iwb_rty_i;
    input         [31:0] iwb_dat_i;
    output               iwb_cyc_o;
    output        [31:0] iwb_adr_o;
    output               iwb_stb_o;
    output               iwb_we_o;
    output        [3:0]  iwb_sel_o;
    output        [31:0] iwb_dat_o;
    output        [2:0]  iwb_cti_o;
    output        [1:0]  iwb_bte_o;
    input                dwb_clk_i;
    input                dwb_rst_i;
    input                dwb_ack_i;
    input                dwb_err_i;
    input                dwb_rty_i;
    input         [31:0] dwb_dat_i;
    output               dwb_cyc_o;
    output        [31:0] dwb_adr_o;
    output               dwb_stb_o;
    output               dwb_we_o;
    output        [3:0]  dwb_sel_o;
    output        [31:0] dwb_dat_o;
    output        [2:0]  dwb_cti_o;
    output        [1:0]  dwb_bte_o;
    input                dbg_stall_i;
    input                dbg_ewt_i;
    output        [3:0]  dbg_lss_o;
    output        [1:0]  dbg_is_o;
    output        [10:0] dbg_wp_o;
    output               dbg_bp_o;
    input                dbg_stb_i;
    input                dbg_we_i;
    input         [31:0] dbg_adr_i;
    input         [31:0] dbg_dat_i;
    output        [31:0] dbg_dat_o;
    output               dbg_ack_o;
    input                pm_cpustall_i;
    output        [3:0]  pm_clksd_o;
    output               pm_dc_gate_o;
    output               pm_ic_gate_o;
    output               pm_dmmu_gate_o;
    output               pm_immu_gate_o;
    output               pm_tt_gate_o;
    output               pm_cpu_gate_o;
    output               pm_wakeup_o;
    output               pm_lvolt_o;
    output               sig_tick;
    wire   abort_ex;
    wire   abort_mvspr;
    wire   boot_adr_sel;
    wire  [2:0] branch_op;
    wire   dbg_ack_o;
    wire   dbg_bp_o;
    wire  [31:0] dbg_dat_o;
    wire  [1:0] dbg_is_o;
    wire  [3:0] dbg_lss_o;
    wire  [10:0] dbg_wp_o;
    wire   dc_en;
    wire   dc_no_writethrough;
    wire   dcpu_ack_qmem;
    wire  [31:0] dcpu_adr_cpu;
    wire   dcpu_cycstb_cpu;
    wire  [31:0] dcpu_dat_cpu;
    wire  [31:0] dcpu_dat_qmem;
    wire   dcpu_err_dmmu;
    wire   dcpu_rty_qmem;
    wire  [3:0] dcpu_sel_cpu;
    wire  [3:0] dcpu_tag_cpu;
    wire  [3:0] dcpu_tag_dmmu;
    wire   dcpu_we_cpu;
    wire   dcqmem_ack_dc;
    wire  [31:0] dcqmem_adr_qmem;
    wire   dcqmem_ci_qmem;
    wire   dcqmem_cycstb_qmem;
    wire  [31:0] dcqmem_dat_dc;
    wire  [31:0] dcqmem_dat_qmem;
    wire   dcqmem_err_dc;
    wire   dcqmem_rty_dc;
    wire  [3:0] dcqmem_sel_qmem;
    wire  [3:0] dcqmem_tag_dc;
    wire  [3:0] dcqmem_tag_qmem;
    wire   dcqmem_we_qmem;
    wire   dcsb_ack_sb;
    wire  [31:0] dcsb_adr_dc;
    wire   dcsb_cab_dc;
    wire   dcsb_cyc_dc;
    wire  [31:0] dcsb_dat_dc;
    wire  [31:0] dcsb_dat_sb;
    wire   dcsb_err_sb;
    wire  [3:0] dcsb_sel_dc;
    wire   dcsb_stb_dc;
    wire   dcsb_we_dc;
    wire   dmmu_en;
    wire  [31:0] du_addr;
    wire  [31:0] du_dat_cpu;
    wire  [31:0] du_dat_du;
    wire  [24:0] du_dmr1;
    wire  [13:0] du_dsr;
    wire  [13:0] du_except_stop;
    wire  [13:0] du_except_trig;
    wire   du_flush_pipe;
    wire   du_hwbkpt;
    wire   du_hwbkpt_ls_r;
    wire  [31:0] du_lsu_load_dat;
    wire  [31:0] du_lsu_store_dat;
    wire   du_read;
    wire   du_stall;
    wire   du_write;
    wire  [31:0] dwb_adr_o;
    reg  dwb_biu_biu_ack_cnt = 1'b0;
    wire   dwb_biu_biu_ack_o;
    wire  [31:0] dwb_biu_biu_adr_i;
    wire   dwb_biu_biu_cab_i;
    wire   dwb_biu_biu_cyc_i;
    wire  [31:0] dwb_biu_biu_dat_i;
    wire  [31:0] dwb_biu_biu_dat_o;
    reg  dwb_biu_biu_err_cnt = 1'b0;
    wire   dwb_biu_biu_err_o;
    wire   dwb_biu_biu_rty;
    reg  dwb_biu_biu_rty_cnt = 1'b0;
    wire  [3:0] dwb_biu_biu_sel_i;
    wire   dwb_biu_biu_stb;
    wire   dwb_biu_biu_stb_i;
    reg  dwb_biu_biu_stb_reg = 1'b0;
    wire   dwb_biu_biu_we_i;
    reg  [3:0]  dwb_biu_burst_len = 4'b0;
    wire   dwb_biu_clk;
    wire  [1:0] dwb_biu_clmode;
    wire   dwb_biu_retry_cnt;
    wire   dwb_biu_rst;
    wire   dwb_biu_wb_ack;
    reg  dwb_biu_wb_ack_cnt = 1'b0;
    wire   dwb_biu_wb_ack_i;
    reg  [31:0] dwb_biu_wb_adr_o = 32'b0;
    reg  [1:0]  dwb_biu_wb_bte_o = 2'b0;
    wire   dwb_biu_wb_clk_i;
    reg  [2:0]  dwb_biu_wb_cti_nxt = 3'b0;
    reg  [2:0]  dwb_biu_wb_cti_o = 3'b0;
    reg  dwb_biu_wb_cyc_nxt = 1'b0;
    reg  dwb_biu_wb_cyc_o = 1'b0;
    wire  [31:0] dwb_biu_wb_dat_i;
    wire  [31:0] dwb_biu_wb_dat_o;
    reg  dwb_biu_wb_err_cnt = 1'b0;
    wire   dwb_biu_wb_err_i;
    wire  [1:0] dwb_biu_wb_fsm_idle;
    wire  [1:0] dwb_biu_wb_fsm_last;
    reg  [1:0]  dwb_biu_wb_fsm_state_cur = 2'b0;
    reg  [1:0]  dwb_biu_wb_fsm_state_nxt = 2'b0;
    wire  [1:0] dwb_biu_wb_fsm_trans;
    wire   dwb_biu_wb_rst_i;
    reg  dwb_biu_wb_rty_cnt = 1'b0;
    wire   dwb_biu_wb_rty_i;
    reg  [3:0]  dwb_biu_wb_sel_o = 4'b0;
    reg  dwb_biu_wb_stb_nxt = 1'b0;
    reg  dwb_biu_wb_stb_o = 1'b0;
    reg  dwb_biu_wb_we_o = 1'b0;
    wire  [1:0] dwb_bte_o;
    wire  [2:0] dwb_cti_o;
    wire   dwb_cyc_o;
    wire  [31:0] dwb_dat_o;
    wire  [3:0] dwb_sel_o;
    wire   dwb_stb_o;
    wire   dwb_we_o;
    wire   ex_freeze;
    wire  [31:0] ex_insn;
    wire  [31:0] ex_pc;
    wire   ex_void;
    wire   flushpipe;
    wire   ic_en;
    wire   icbiu_ack_biu;
    wire  [31:0] icbiu_adr_ic;
    wire  [31:0] icbiu_adr_ic_word;
    wire   icbiu_cab_ic;
    wire   icbiu_cyc_ic;
    wire  [31:0] icbiu_dat_biu;
    wire  [31:0] icbiu_dat_ic;
    wire   icbiu_err_biu;
    wire  [3:0] icbiu_sel_ic;
    wire   icbiu_stb_ic;
    wire  [3:0] icbiu_tag_biu;
    wire  [3:0] icbiu_tag_ic;
    wire   icbiu_we_ic;
    wire   icpu_ack_qmem;
    wire  [31:0] icpu_adr_cpu;
    wire  [31:0] icpu_adr_immu;
    wire   icpu_cycstb_cpu;
    wire  [31:0] icpu_dat_qmem;
    wire   icpu_err_immu;
    wire   icpu_rty_immu;
    wire  [3:0] icpu_sel_cpu;
    wire  [3:0] icpu_tag_cpu;
    wire  [3:0] icpu_tag_immu;
    wire   icqmem_ack_ic;
    wire  [31:0] icqmem_adr_qmem;
    wire   icqmem_ci_qmem;
    wire   icqmem_cycstb_qmem;
    wire  [31:0] icqmem_dat_ic;
    wire   icqmem_err_ic;
    wire   icqmem_rty_ic;
    wire  [3:0] icqmem_sel_qmem;
    wire  [3:0] icqmem_tag_ic;
    wire  [3:0] icqmem_tag_qmem;
    wire  [31:0] id_insn;
    wire  [31:0] id_pc;
    wire   id_void;
    wire   immu_en;
    wire  [31:0] iwb_adr_o;
    reg  iwb_biu_biu_ack_cnt = 1'b0;
    wire   iwb_biu_biu_ack_o;
    wire  [31:0] iwb_biu_biu_adr_i;
    wire   iwb_biu_biu_cab_i;
    wire   iwb_biu_biu_cyc_i;
    wire  [31:0] iwb_biu_biu_dat_i;
    wire  [31:0] iwb_biu_biu_dat_o;
    reg  iwb_biu_biu_err_cnt = 1'b0;
    wire   iwb_biu_biu_err_o;
    wire   iwb_biu_biu_rty;
    reg  iwb_biu_biu_rty_cnt = 1'b0;
    wire  [3:0] iwb_biu_biu_sel_i;
    wire   iwb_biu_biu_stb;
    wire   iwb_biu_biu_stb_i;
    reg  iwb_biu_biu_stb_reg = 1'b0;
    wire   iwb_biu_biu_we_i;
    reg  [3:0]  iwb_biu_burst_len = 4'b0;
    wire   iwb_biu_clk;
    wire  [1:0] iwb_biu_clmode;
    wire   iwb_biu_retry_cnt;
    wire   iwb_biu_rst;
    wire   iwb_biu_wb_ack;
    reg  iwb_biu_wb_ack_cnt = 1'b0;
    wire   iwb_biu_wb_ack_i;
    reg  [31:0] iwb_biu_wb_adr_o = 32'b0;
    reg  [1:0]  iwb_biu_wb_bte_o = 2'b0;
    wire   iwb_biu_wb_clk_i;
    reg  [2:0]  iwb_biu_wb_cti_nxt = 3'b0;
    reg  [2:0]  iwb_biu_wb_cti_o = 3'b0;
    reg  iwb_biu_wb_cyc_nxt = 1'b0;
    reg  iwb_biu_wb_cyc_o = 1'b0;
    wire  [31:0] iwb_biu_wb_dat_i;
    wire  [31:0] iwb_biu_wb_dat_o;
    reg  iwb_biu_wb_err_cnt = 1'b0;
    wire   iwb_biu_wb_err_i;
    wire  [1:0] iwb_biu_wb_fsm_idle;
    wire  [1:0] iwb_biu_wb_fsm_last;
    reg  [1:0]  iwb_biu_wb_fsm_state_cur = 2'b0;
    reg  [1:0]  iwb_biu_wb_fsm_state_nxt = 2'b0;
    wire  [1:0] iwb_biu_wb_fsm_trans;
    wire   iwb_biu_wb_rst_i;
    reg  iwb_biu_wb_rty_cnt = 1'b0;
    wire   iwb_biu_wb_rty_i;
    reg  [3:0]  iwb_biu_wb_sel_o = 4'b0;
    reg  iwb_biu_wb_stb_nxt = 1'b0;
    reg  iwb_biu_wb_stb_o = 1'b0;
    reg  iwb_biu_wb_we_o = 1'b0;
    wire  [1:0] iwb_bte_o;
    wire  [2:0] iwb_cti_o;
    wire   iwb_cyc_o;
    wire  [31:0] iwb_dat_o;
    wire  [3:0] iwb_sel_o;
    wire   iwb_stb_o;
    wire   iwb_we_o;
    wire   mtspr_dc_done;
    wire   or1200_cpu_abort_ex;
    wire   or1200_cpu_abort_mvspr;
    wire  [31:0] or1200_cpu_alu_dataout;
    wire  [4:0] or1200_cpu_alu_op;
    wire  [3:0] or1200_cpu_alu_op2;
    wire   or1200_cpu_boot_adr_sel_i;
    wire  [2:0] or1200_cpu_branch_op;
    wire   or1200_cpu_carry;
    wire   or1200_cpu_clk;
    wire  [3:0] or1200_cpu_comp_op;
    wire  [5:0] or1200_cpu_cust5_limm;
    wire  [4:0] or1200_cpu_cust5_op;
    wire   or1200_cpu_cy_we_alu;
    wire   or1200_cpu_cy_we_rf;
    wire   or1200_cpu_cyforw;
    wire   or1200_cpu_dc_en;
    wire   or1200_cpu_dc_no_writethrough;
    wire   or1200_cpu_dcpu_ack_i;
    wire  [31:0] or1200_cpu_dcpu_adr_o;
    wire   or1200_cpu_dcpu_cycstb_o;
    wire  [31:0] or1200_cpu_dcpu_dat_i;
    wire  [31:0] or1200_cpu_dcpu_dat_o;
    wire   or1200_cpu_dcpu_err_i;
    wire   or1200_cpu_dcpu_rty_i;
    wire  [3:0] or1200_cpu_dcpu_sel_o;
    wire  [3:0] or1200_cpu_dcpu_tag_i;
    wire  [3:0] or1200_cpu_dcpu_tag_o;
    wire   or1200_cpu_dcpu_we_o;
    wire   or1200_cpu_dmmu_en;
    wire   or1200_cpu_dsx;
    wire  [31:0] or1200_cpu_du_addr;
    wire  [31:0] or1200_cpu_du_dat_cpu;
    wire  [31:0] or1200_cpu_du_dat_du;
    wire  [24:0] or1200_cpu_du_dmr1;
    wire  [13:0] or1200_cpu_du_dsr;
    wire  [13:0] or1200_cpu_du_except_stop;
    wire  [13:0] or1200_cpu_du_except_trig;
    wire   or1200_cpu_du_flush_pipe;
    wire   or1200_cpu_du_hwbkpt;
    wire   or1200_cpu_du_hwbkpt_ls_r;
    wire  [31:0] or1200_cpu_du_lsu_load_dat;
    wire  [31:0] or1200_cpu_du_lsu_store_dat;
    wire   or1200_cpu_du_read;
    wire   or1200_cpu_du_stall;
    wire   or1200_cpu_du_write;
    wire  [31:0] or1200_cpu_eear;
    wire   or1200_cpu_eear_we;
    wire  [31:0] or1200_cpu_epcr;
    wire   or1200_cpu_epcr_we;
    wire  [16:0] or1200_cpu_esr;
    wire   or1200_cpu_esr_we;
    wire  [31:2] or1200_cpu_ex_branch_addrtarget;
    wire   or1200_cpu_ex_branch_taken;
    wire   or1200_cpu_ex_flushpipe;
    wire   or1200_cpu_ex_freeze;
    wire  [31:0] or1200_cpu_ex_insn;
    wire   or1200_cpu_ex_macrc_op;
    wire  [31:0] or1200_cpu_ex_pc;
    wire  [31:0] or1200_cpu_ex_simm;
    wire   or1200_cpu_ex_spr_read;
    wire   or1200_cpu_ex_spr_write;
    wire   or1200_cpu_ex_void;
    wire   or1200_cpu_except_align;
    wire   or1200_cpu_except_dbuserr;
    wire   or1200_cpu_except_dmmufault;
    wire   or1200_cpu_except_dtlbmiss;
    wire   or1200_cpu_except_flushpipe;
    wire   or1200_cpu_except_ibuserr;
    wire   or1200_cpu_except_illegal;
    wire   or1200_cpu_except_immufault;
    wire   or1200_cpu_except_itlbmiss;
    wire   or1200_cpu_except_start;
    wire   or1200_cpu_except_started;
    wire  [13:0] or1200_cpu_except_stop;
    wire  [13:0] or1200_cpu_except_trig;
    wire  [3:0] or1200_cpu_except_type;
    wire   or1200_cpu_extend_flush;
    wire   or1200_cpu_flag;
    wire   or1200_cpu_flag_we;
    wire   or1200_cpu_flag_we_alu;
    wire   or1200_cpu_flag_we_fpu;
    wire   or1200_cpu_flagforw;
    wire   or1200_cpu_flagforw_alu;
    wire   or1200_cpu_flagforw_fpu;
    wire   or1200_cpu_force_dslot_fetch;
    wire  [11:0] or1200_cpu_fpcsr;
    wire   or1200_cpu_fpcsr_we;
    wire  [31:0] or1200_cpu_fpu_dataout;
    wire   or1200_cpu_fpu_done;
    wire   or1200_cpu_fpu_except_started;
    wire  [7:0] or1200_cpu_fpu_op;
    wire   or1200_cpu_genpc_freeze;
    wire   or1200_cpu_genpc_refetch;
    wire   or1200_cpu_ic_en;
    wire   or1200_cpu_icpu_ack_i;
    wire  [31:0] or1200_cpu_icpu_adr_i;
    wire  [31:0] or1200_cpu_icpu_adr_o;
    wire   or1200_cpu_icpu_cycstb_o;
    wire  [31:0] or1200_cpu_icpu_dat_i;
    wire   or1200_cpu_icpu_err_i;
    wire   or1200_cpu_icpu_rty_i;
    wire  [3:0] or1200_cpu_icpu_sel_o;
    wire  [3:0] or1200_cpu_icpu_tag_i;
    wire  [3:0] or1200_cpu_icpu_tag_o;
    wire  [31:2] or1200_cpu_id_branch_addrtarget;
    wire   or1200_cpu_id_flushpipe;
    wire   or1200_cpu_id_freeze;
    wire  [31:0] or1200_cpu_id_insn;
    wire  [3:0] or1200_cpu_id_lsu_op;
    wire  [2:0] or1200_cpu_id_mac_op;
    wire   or1200_cpu_id_macrc_op;
    wire  [31:0] or1200_cpu_id_pc;
    wire  [31:0] or1200_cpu_id_simm;
    wire   or1200_cpu_id_void;
    wire   or1200_cpu_if_flushpipe;
    wire   or1200_cpu_if_freeze;
    wire  [31:0] or1200_cpu_if_insn;
    wire  [31:0] or1200_cpu_if_pc;
    wire   or1200_cpu_if_stall;
    wire   or1200_cpu_immu_en;
    wire  [31:0] or1200_cpu_lsu_dataout;
    wire   or1200_cpu_lsu_stall;
    wire   or1200_cpu_lsu_unstall;
    wire  [2:0] or1200_cpu_mac_op;
    wire   or1200_cpu_mtspr_dc_done;
    wire   or1200_cpu_mtspr_done;
    wire  [31:0] or1200_cpu_mult_mac_result;
    wire   or1200_cpu_mult_mac_stall;
    wire  [2:0] or1200_cpu_multicycle;
    wire  [31:0] or1200_cpu_muxed_a;
    wire  [31:0] or1200_cpu_muxed_b;
    wire   or1200_cpu_no_more_dslot;
    wire  [31:0] or1200_cpu_operand_a;
    wire  [31:0] or1200_cpu_operand_b;
    wire  [31:0] or1200_cpu_or1200_alu_a;
    wire   or1200_cpu_or1200_alu_a_eq_b;
    wire   or1200_cpu_or1200_alu_a_lt_b;
    wire  [4:0] or1200_cpu_or1200_alu_alu_op;
    wire  [3:0] or1200_cpu_or1200_alu_alu_op2;
    wire  [31:0] or1200_cpu_or1200_alu_b;
    wire  [31:0] or1200_cpu_or1200_alu_b_mux;
    wire   or1200_cpu_or1200_alu_carry;
    wire  [31:0] or1200_cpu_or1200_alu_carry_in;
    wire  [31:0] or1200_cpu_or1200_alu_comp_a;
    wire  [31:0] or1200_cpu_or1200_alu_comp_b;
    wire  [3:0] or1200_cpu_or1200_alu_comp_op;
    wire  [5:0] or1200_cpu_or1200_alu_cust5_limm;
    wire  [4:0] or1200_cpu_or1200_alu_cust5_op;
    wire   or1200_cpu_or1200_alu_cy_sub;
    wire   or1200_cpu_or1200_alu_cy_sum;
    reg  or1200_cpu_or1200_alu_cy_we = 1'b0;
    reg  or1200_cpu_or1200_alu_cyforw = 1'b0;
    reg  [31:0] or1200_cpu_or1200_alu_extended = 32'b0;
    wire   or1200_cpu_or1200_alu_flag;
    reg  or1200_cpu_or1200_alu_flag_we = 1'b0;
    reg  or1200_cpu_or1200_alu_flagcomp = 1'b0;
    reg  or1200_cpu_or1200_alu_flagforw = 1'b0;
    wire   or1200_cpu_or1200_alu_macrc_op;
    wire  [31:0] or1200_cpu_or1200_alu_mult_mac_result;
    wire   or1200_cpu_or1200_alu_ov_sum;
    reg  or1200_cpu_or1200_alu_ov_we = 1'b0;
    reg  or1200_cpu_or1200_alu_ovforw = 1'b0;
    reg  [31:0] or1200_cpu_or1200_alu_result = 32'b0;
    wire  [31:0] or1200_cpu_or1200_alu_result_and;
    wire  [31:0] or1200_cpu_or1200_alu_result_sum;
    reg  [31:0] or1200_cpu_or1200_alu_shifted_rotated = 32'b0;
    wire  [31:0] or1200_cpu_or1200_cfgr_spr_addr;
    reg  [31:0] or1200_cpu_or1200_cfgr_spr_dat_o = 32'b0;
    wire   or1200_cpu_or1200_ctrl_abort_mvspr;
    reg  [4:0]  or1200_cpu_or1200_ctrl_alu_op = 5'b0;
    reg  [3:0]  or1200_cpu_or1200_ctrl_alu_op2 = 4'b0;
    wire   or1200_cpu_or1200_ctrl_clk;
    reg  [3:0]  or1200_cpu_or1200_ctrl_comp_op = 4'b0;
    wire  [5:0] or1200_cpu_or1200_ctrl_cust5_limm;
    wire  [4:0] or1200_cpu_or1200_ctrl_cust5_op;
    wire   or1200_cpu_or1200_ctrl_dc_no_writethrough;
    wire   or1200_cpu_or1200_ctrl_du_flush_pipe;
    wire   or1200_cpu_or1200_ctrl_du_hwbkpt;
    reg  [31:2] or1200_cpu_or1200_ctrl_ex_branch_addrtarget = 30'b0;
    reg  [2:0]  or1200_cpu_or1200_ctrl_ex_branch_op = 3'b0;
    wire   or1200_cpu_or1200_ctrl_ex_branch_taken;
    reg  or1200_cpu_or1200_ctrl_ex_delayslot_dsi = 1'b0;
    reg  or1200_cpu_or1200_ctrl_ex_delayslot_nop = 1'b0;
    wire   or1200_cpu_or1200_ctrl_ex_flushpipe;
    wire   or1200_cpu_or1200_ctrl_ex_freeze;
    reg  [31:0] or1200_cpu_or1200_ctrl_ex_insn = 32'b0;
    wire   or1200_cpu_or1200_ctrl_ex_macrc_op;
    wire  [31:0] or1200_cpu_or1200_ctrl_ex_pc;
    reg  [31:0] or1200_cpu_or1200_ctrl_ex_simm = 32'b0;
    wire   or1200_cpu_or1200_ctrl_ex_spr_read;
    wire   or1200_cpu_or1200_ctrl_ex_spr_write;
    wire   or1200_cpu_or1200_ctrl_ex_void;
    wire   or1200_cpu_or1200_ctrl_except_flushpipe;
    reg  or1200_cpu_or1200_ctrl_except_illegal = 1'b0;
    wire   or1200_cpu_or1200_ctrl_extend_flush;
    wire   or1200_cpu_or1200_ctrl_force_dslot_fetch;
    wire  [7:0] or1200_cpu_or1200_ctrl_fpu_op;
    wire  [31:2] or1200_cpu_or1200_ctrl_id_branch_addrtarget;
    reg  [2:0]  or1200_cpu_or1200_ctrl_id_branch_op = 3'b0;
    wire   or1200_cpu_or1200_ctrl_id_flushpipe;
    wire   or1200_cpu_or1200_ctrl_id_freeze;
    reg  [31:0] or1200_cpu_or1200_ctrl_id_insn = 32'b0;
    reg  [3:0]  or1200_cpu_or1200_ctrl_id_lsu_op = 4'b0;
    wire  [2:0] or1200_cpu_or1200_ctrl_id_mac_op;
    wire   or1200_cpu_or1200_ctrl_id_macrc_op;
    wire  [31:0] or1200_cpu_or1200_ctrl_id_pc;
    reg  [31:0] or1200_cpu_or1200_ctrl_id_simm = 32'b0;
    wire   or1200_cpu_or1200_ctrl_id_void;
    wire   or1200_cpu_or1200_ctrl_if_flushpipe;
    wire  [31:0] or1200_cpu_or1200_ctrl_if_insn;
    wire   or1200_cpu_or1200_ctrl_if_maci_op;
    wire  [2:0] or1200_cpu_or1200_ctrl_mac_op;
    reg  [2:0]  or1200_cpu_or1200_ctrl_multicycle = 3'b0;
    wire   or1200_cpu_or1200_ctrl_no_more_dslot;
    wire   or1200_cpu_or1200_ctrl_pc_we;
    wire  [4:0] or1200_cpu_or1200_ctrl_rf_addra;
    wire  [4:0] or1200_cpu_or1200_ctrl_rf_addrb;
    reg  [4:0]  or1200_cpu_or1200_ctrl_rf_addrw = 5'b0;
    wire   or1200_cpu_or1200_ctrl_rf_rda;
    wire   or1200_cpu_or1200_ctrl_rf_rdb;
    wire   or1200_cpu_or1200_ctrl_rfe;
    reg  [3:0]  or1200_cpu_or1200_ctrl_rfwb_op = 4'b0;
    wire   or1200_cpu_or1200_ctrl_rst;
    reg  [1:0]  or1200_cpu_or1200_ctrl_sel_a = 2'b0;
    reg  [1:0]  or1200_cpu_or1200_ctrl_sel_b = 2'b0;
    reg  or1200_cpu_or1200_ctrl_sel_imm = 1'b0;
    reg  or1200_cpu_or1200_ctrl_sig_syscall = 1'b0;
    reg  or1200_cpu_or1200_ctrl_sig_trap = 1'b0;
    reg  or1200_cpu_or1200_ctrl_spr_read = 1'b0;
    reg  or1200_cpu_or1200_ctrl_spr_write = 1'b0;
    reg  [1:0]  or1200_cpu_or1200_ctrl_wait_on = 2'b0;
    wire   or1200_cpu_or1200_ctrl_wb_flushpipe;
    wire   or1200_cpu_or1200_ctrl_wb_freeze;
    reg  [31:0] or1200_cpu_or1200_ctrl_wb_insn = 32'b0;
    reg  [4:0]  or1200_cpu_or1200_ctrl_wb_rfaddrw = 5'b0;
    wire   or1200_cpu_or1200_ctrl_wb_void;
    wire   or1200_cpu_or1200_ctrl_wbforw_valid;
    wire   or1200_cpu_or1200_except_abort_ex;
    wire   or1200_cpu_or1200_except_abort_mvspr;
    wire  [2:0] or1200_cpu_or1200_except_branch_op;
    wire   or1200_cpu_or1200_except_clk;
    wire  [31:0] or1200_cpu_or1200_except_datain;
    wire   or1200_cpu_or1200_except_dcpu_ack_i;
    wire   or1200_cpu_or1200_except_dcpu_err_i;
    reg  or1200_cpu_or1200_except_delayed1_ex_dslot = 1'b0;
    reg  or1200_cpu_or1200_except_delayed2_ex_dslot = 1'b0;
    reg  [2:0]  or1200_cpu_or1200_except_delayed_iee = 3'b0;
    reg  [2:0]  or1200_cpu_or1200_except_delayed_tee = 3'b0;
    reg  [31:0] or1200_cpu_or1200_except_dl_pc = 32'b0;
    wire   or1200_cpu_or1200_except_dmr1_bt;
    reg  or1200_cpu_or1200_except_dmr1_bt_prev = 1'b0;
    wire   or1200_cpu_or1200_except_dmr1_st;
    reg  or1200_cpu_or1200_except_dmr1_st_prev = 1'b0;
    wire   or1200_cpu_or1200_except_dsr_te;
    reg  or1200_cpu_or1200_except_dsr_te_prev = 1'b0;
    reg  or1200_cpu_or1200_except_dsx = 1'b0;
    wire  [24:0] or1200_cpu_or1200_except_du_dmr1;
    wire  [13:0] or1200_cpu_or1200_except_du_dsr;
    wire   or1200_cpu_or1200_except_du_hwbkpt;
    wire   or1200_cpu_or1200_except_du_hwbkpt_ls_r;
    reg  [31:0] or1200_cpu_or1200_except_eear = 32'b0;
    wire   or1200_cpu_or1200_except_eear_we;
    reg  [31:0] or1200_cpu_or1200_except_epcr = 32'b0;
    wire   or1200_cpu_or1200_except_epcr_we;
    reg  [16:0] or1200_cpu_or1200_except_esr = 17'b0;
    wire   or1200_cpu_or1200_except_esr_we;
    wire   or1200_cpu_or1200_except_ex_branch_taken;
    reg  or1200_cpu_or1200_except_ex_dslot = 1'b0;
    reg  [2:0]  or1200_cpu_or1200_except_ex_exceptflags = 3'b0;
    wire   or1200_cpu_or1200_except_ex_flushpipe;
    wire   or1200_cpu_or1200_except_ex_freeze;
    reg  or1200_cpu_or1200_except_ex_freeze_prev = 1'b0;
    reg  [31:0] or1200_cpu_or1200_except_ex_pc = 32'b0;
    reg  or1200_cpu_or1200_except_ex_pc_val = 1'b0;
    wire   or1200_cpu_or1200_except_ex_void;
    wire   or1200_cpu_or1200_except_except_flushpipe;
    wire   or1200_cpu_or1200_except_except_start;
    wire   or1200_cpu_or1200_except_except_started;
    wire  [13:0] or1200_cpu_or1200_except_except_stop;
    wire  [13:0] or1200_cpu_or1200_except_except_trig;
    reg  [3:0]  or1200_cpu_or1200_except_except_type = 4'b0;
    reg  or1200_cpu_or1200_except_extend_flush = 1'b0;
    reg  or1200_cpu_or1200_except_extend_flush_last = 1'b0;
    wire   or1200_cpu_or1200_except_fp_pending;
    wire   or1200_cpu_or1200_except_fpcsr_fpee;
    wire   or1200_cpu_or1200_except_genpc_freeze;
    wire   or1200_cpu_or1200_except_icpu_ack_i;
    wire   or1200_cpu_or1200_except_icpu_err_i;
    reg  [2:0]  or1200_cpu_or1200_except_id_exceptflags = 3'b0;
    wire   or1200_cpu_or1200_except_id_flushpipe;
    wire   or1200_cpu_or1200_except_id_freeze;
    reg  [31:0] or1200_cpu_or1200_except_id_pc = 32'b0;
    reg  or1200_cpu_or1200_except_id_pc_val = 1'b0;
    wire  [31:0] or1200_cpu_or1200_except_if_pc;
    wire   or1200_cpu_or1200_except_if_stall;
    wire   or1200_cpu_or1200_except_int_pending;
    wire  [31:0] or1200_cpu_or1200_except_lsu_addr;
    wire   or1200_cpu_or1200_except_pc_we;
    wire   or1200_cpu_or1200_except_range_pending;
    wire   or1200_cpu_or1200_except_rst;
    wire   or1200_cpu_or1200_except_sig_align;
    wire   or1200_cpu_or1200_except_sig_dbuserr;
    wire   or1200_cpu_or1200_except_sig_dmmufault;
    wire   or1200_cpu_or1200_except_sig_dtlbmiss;
    wire   or1200_cpu_or1200_except_sig_fp;
    wire   or1200_cpu_or1200_except_sig_ibuserr;
    wire   or1200_cpu_or1200_except_sig_illegal;
    wire   or1200_cpu_or1200_except_sig_immufault;
    wire   or1200_cpu_or1200_except_sig_int;
    wire   or1200_cpu_or1200_except_sig_itlbmiss;
    wire   or1200_cpu_or1200_except_sig_range;
    wire   or1200_cpu_or1200_except_sig_syscall;
    wire   or1200_cpu_or1200_except_sig_tick;
    wire   or1200_cpu_or1200_except_sig_trap;
    wire  [31:0] or1200_cpu_or1200_except_spr_dat_npc;
    wire  [31:0] or1200_cpu_or1200_except_spr_dat_ppc;
    wire  [16:0] or1200_cpu_or1200_except_sr;
    wire   or1200_cpu_or1200_except_sr_ted;
    reg  or1200_cpu_or1200_except_sr_ted_prev = 1'b0;
    wire   or1200_cpu_or1200_except_sr_we;
    reg  [2:0]  or1200_cpu_or1200_except_state = 3'b0;
    wire   or1200_cpu_or1200_except_tick_pending;
    wire  [16:0] or1200_cpu_or1200_except_to_sr;
    wire   or1200_cpu_or1200_except_trace_cond;
    reg  or1200_cpu_or1200_except_trace_trap = 1'b0;
    wire   or1200_cpu_or1200_except_wb_freeze;
    reg  [31:0] or1200_cpu_or1200_except_wb_pc = 32'b0;
    wire  [31:0] or1200_cpu_or1200_fpu_a;
    wire  [31:0] or1200_cpu_or1200_fpu_b;
    wire   or1200_cpu_or1200_fpu_clk;
    wire   or1200_cpu_or1200_fpu_done;
    wire   or1200_cpu_or1200_fpu_ex_freeze;
    wire   or1200_cpu_or1200_fpu_except_started;
    wire   or1200_cpu_or1200_fpu_flag_we;
    wire   or1200_cpu_or1200_fpu_flagforw;
    wire  [11:0] or1200_cpu_or1200_fpu_fpcsr;
    wire   or1200_cpu_or1200_fpu_fpcsr_we;
    wire  [7:0] or1200_cpu_or1200_fpu_fpu_op;
    wire  [31:0] or1200_cpu_or1200_fpu_result;
    wire   or1200_cpu_or1200_fpu_rst;
    wire   or1200_cpu_or1200_fpu_sig_fp;
    wire  [31:0] or1200_cpu_or1200_fpu_spr_addr;
    wire   or1200_cpu_or1200_fpu_spr_cs;
    wire  [31:0] or1200_cpu_or1200_fpu_spr_dat_i;
    wire  [31:0] or1200_cpu_or1200_fpu_spr_dat_o;
    wire   or1200_cpu_or1200_fpu_spr_write;
    wire   or1200_cpu_or1200_freeze_abort_ex;
    wire   or1200_cpu_or1200_freeze_clk;
    wire   or1200_cpu_or1200_freeze_du_stall;
    wire   or1200_cpu_or1200_freeze_ex_freeze;
    wire   or1200_cpu_or1200_freeze_extend_flush;
    wire   or1200_cpu_or1200_freeze_flushpipe;
    reg  or1200_cpu_or1200_freeze_flushpipe_r = 1'b0;
    wire   or1200_cpu_or1200_freeze_force_dslot_fetch;
    wire   or1200_cpu_or1200_freeze_fpu_done;
    wire   or1200_cpu_or1200_freeze_genpc_freeze;
    wire   or1200_cpu_or1200_freeze_icpu_ack_i;
    wire   or1200_cpu_or1200_freeze_icpu_err_i;
    wire   or1200_cpu_or1200_freeze_id_freeze;
    wire   or1200_cpu_or1200_freeze_if_freeze;
    wire   or1200_cpu_or1200_freeze_if_stall;
    wire   or1200_cpu_or1200_freeze_lsu_stall;
    wire   or1200_cpu_or1200_freeze_lsu_unstall;
    wire   or1200_cpu_or1200_freeze_mac_stall;
    wire   or1200_cpu_or1200_freeze_mtspr_done;
    wire  [2:0] or1200_cpu_or1200_freeze_multicycle;
    reg  [2:0]  or1200_cpu_or1200_freeze_multicycle_cnt = 3'b0;
    wire   or1200_cpu_or1200_freeze_multicycle_freeze;
    wire   or1200_cpu_or1200_freeze_rst;
    wire   or1200_cpu_or1200_freeze_saving_if_insn;
    wire  [1:0] or1200_cpu_or1200_freeze_wait_on;
    reg  [1:0]  or1200_cpu_or1200_freeze_waiting_on = 2'b0;
    wire   or1200_cpu_or1200_freeze_wb_freeze;
    wire  [2:0] or1200_cpu_or1200_genpc_branch_op;
    wire   or1200_cpu_or1200_genpc_clk;
    wire   or1200_cpu_or1200_genpc_du_flush_pipe;
    wire  [31:0] or1200_cpu_or1200_genpc_epcr;
    wire  [31:2] or1200_cpu_or1200_genpc_ex_branch_addrtarget;
    reg  or1200_cpu_or1200_genpc_ex_branch_taken = 1'b0;
    wire   or1200_cpu_or1200_genpc_except_prefix;
    wire   or1200_cpu_or1200_genpc_except_start;
    wire  [3:0] or1200_cpu_or1200_genpc_except_type;
    wire   or1200_cpu_or1200_genpc_flag;
    wire   or1200_cpu_or1200_genpc_flagforw;
    wire   or1200_cpu_or1200_genpc_genpc_freeze;
    wire   or1200_cpu_or1200_genpc_genpc_refetch;
    reg  or1200_cpu_or1200_genpc_genpc_refetch_r = 1'b0;
    wire  [31:0] or1200_cpu_or1200_genpc_icpu_adr_i;
    wire  [31:0] or1200_cpu_or1200_genpc_icpu_adr_o;
    wire   or1200_cpu_or1200_genpc_icpu_cycstb_o;
    wire   or1200_cpu_or1200_genpc_icpu_rty_i;
    wire  [3:0] or1200_cpu_or1200_genpc_icpu_sel_o;
    wire  [3:0] or1200_cpu_or1200_genpc_icpu_tag_o;
    wire  [31:2] or1200_cpu_or1200_genpc_id_branch_addrtarget;
    wire   or1200_cpu_or1200_genpc_lsu_stall;
    wire  [31:0] or1200_cpu_or1200_genpc_muxed_b;
    wire   or1200_cpu_or1200_genpc_no_more_dslot;
    wire  [31:0] or1200_cpu_or1200_genpc_operand_b;
    reg  [31:0] or1200_cpu_or1200_genpc_pc = 32'b0;
    reg  [31:2] or1200_cpu_or1200_genpc_pcreg = 30'b0;
    wire  [31:0] or1200_cpu_or1200_genpc_pcreg_boot;
    reg  [31:2] or1200_cpu_or1200_genpc_pcreg_default = 30'b0;
    reg  or1200_cpu_or1200_genpc_pcreg_select = 1'b0;
    wire  [2:0] or1200_cpu_or1200_genpc_pre_branch_op;
    wire   or1200_cpu_or1200_genpc_rst;
    wire  [31:0] or1200_cpu_or1200_genpc_spr_dat_i;
    wire  [31:0] or1200_cpu_or1200_genpc_spr_dat_npc;
    wire   or1200_cpu_or1200_genpc_spr_pc_we;
    reg  or1200_cpu_or1200_genpc_wait_lsu = 1'b0;
    reg  [31:0] or1200_cpu_or1200_if_addr_saved = 32'b0;
    wire   or1200_cpu_or1200_if_clk;
    reg  [2:0]  or1200_cpu_or1200_if_err_saved = 3'b0;
    wire   or1200_cpu_or1200_if_except_ibuserr;
    wire   or1200_cpu_or1200_if_except_immufault;
    wire   or1200_cpu_or1200_if_except_itlbmiss;
    wire   or1200_cpu_or1200_if_genpc_refetch;
    wire   or1200_cpu_or1200_if_icpu_ack_i;
    wire  [31:0] or1200_cpu_or1200_if_icpu_adr_i;
    wire  [31:0] or1200_cpu_or1200_if_icpu_dat_i;
    wire   or1200_cpu_or1200_if_icpu_err_i;
    wire  [3:0] or1200_cpu_or1200_if_icpu_tag_i;
    wire   or1200_cpu_or1200_if_if_bypass;
    reg  or1200_cpu_or1200_if_if_bypass_reg = 1'b0;
    wire   or1200_cpu_or1200_if_if_flushpipe;
    wire   or1200_cpu_or1200_if_if_freeze;
    wire  [31:0] or1200_cpu_or1200_if_if_insn;
    wire  [31:0] or1200_cpu_or1200_if_if_pc;
    wire   or1200_cpu_or1200_if_if_stall;
    reg  [31:0] or1200_cpu_or1200_if_insn_saved = 32'b0;
    wire   or1200_cpu_or1200_if_no_more_dslot;
    wire   or1200_cpu_or1200_if_rfe;
    wire   or1200_cpu_or1200_if_rst;
    wire   or1200_cpu_or1200_if_save_insn;
    reg  or1200_cpu_or1200_if_saved = 1'b0;
    wire   or1200_cpu_or1200_if_saving_if_insn;
    wire   or1200_cpu_or1200_lsu_clk;
    wire   or1200_cpu_or1200_lsu_dcpu_ack_i;
    wire  [31:0] or1200_cpu_or1200_lsu_dcpu_adr_o;
    reg  [2:0]  or1200_cpu_or1200_lsu_dcpu_adr_r = 3'b0;
    wire   or1200_cpu_or1200_lsu_dcpu_cycstb_o;
    wire  [31:0] or1200_cpu_or1200_lsu_dcpu_dat_i;
    wire  [31:0] or1200_cpu_or1200_lsu_dcpu_dat_o;
    wire   or1200_cpu_or1200_lsu_dcpu_err_i;
    wire   or1200_cpu_or1200_lsu_dcpu_rty_i;
    reg  [3:0]  or1200_cpu_or1200_lsu_dcpu_sel_o = 4'b0;
    wire  [3:0] or1200_cpu_or1200_lsu_dcpu_tag_i;
    wire  [3:0] or1200_cpu_or1200_lsu_dcpu_tag_o;
    wire   or1200_cpu_or1200_lsu_dcpu_we_o;
    wire   or1200_cpu_or1200_lsu_du_stall;
    wire  [31:0] or1200_cpu_or1200_lsu_ex_addrbase;
    wire  [31:0] or1200_cpu_or1200_lsu_ex_addrofs;
    wire   or1200_cpu_or1200_lsu_ex_freeze;
    reg  [3:0]  or1200_cpu_or1200_lsu_ex_lsu_op = 4'b0;
    reg  or1200_cpu_or1200_lsu_except_align = 1'b0;
    wire   or1200_cpu_or1200_lsu_except_dbuserr;
    wire   or1200_cpu_or1200_lsu_except_dmmufault;
    wire   or1200_cpu_or1200_lsu_except_dtlbmiss;
    wire   or1200_cpu_or1200_lsu_flushpipe;
    wire  [31:0] or1200_cpu_or1200_lsu_id_addrbase;
    wire  [31:0] or1200_cpu_or1200_lsu_id_addrofs;
    wire   or1200_cpu_or1200_lsu_id_freeze;
    wire  [3:0] or1200_cpu_or1200_lsu_id_lsu_op;
    wire  [2:0] or1200_cpu_or1200_lsu_id_precalc_sum;
    wire  [31:0] or1200_cpu_or1200_lsu_lsu_datain;
    wire  [31:0] or1200_cpu_or1200_lsu_lsu_dataout;
    wire   or1200_cpu_or1200_lsu_lsu_stall;
    wire   or1200_cpu_or1200_lsu_lsu_unstall;
    wire  [1:0] or1200_cpu_or1200_lsu_or1200_mem2reg_addr;
    reg  [31:0] or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = 32'b0;
    wire  [3:0] or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op;
    wire  [31:0] or1200_cpu_or1200_lsu_or1200_mem2reg_memdata;
    reg  [31:0] or1200_cpu_or1200_lsu_or1200_mem2reg_regdata = 32'b0;
    wire  [1:0] or1200_cpu_or1200_lsu_or1200_reg2mem_addr;
    wire  [3:0] or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op;
    wire  [31:0] or1200_cpu_or1200_lsu_or1200_reg2mem_memdata;
    reg  [7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = 8'b0;
    reg  [7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl = 8'b0;
    reg  [7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh = 8'b0;
    reg  [7:0]  or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll = 8'b0;
    wire  [31:0] or1200_cpu_or1200_lsu_or1200_reg2mem_regdata;
    wire   or1200_cpu_or1200_lsu_rst;
    wire  [31:0] or1200_cpu_or1200_mult_mac_a;
    wire  [4:0] or1200_cpu_or1200_mult_mac_alu_op;
    wire   or1200_cpu_or1200_mult_mac_alu_op_div;
    wire   or1200_cpu_or1200_mult_mac_alu_op_mul;
    wire   or1200_cpu_or1200_mult_mac_alu_op_sdiv;
    wire   or1200_cpu_or1200_mult_mac_alu_op_smul;
    wire   or1200_cpu_or1200_mult_mac_alu_op_udiv;
    wire   or1200_cpu_or1200_mult_mac_alu_op_umul;
    wire  [31:0] or1200_cpu_or1200_mult_mac_b;
    wire   or1200_cpu_or1200_mult_mac_clk;
    wire   or1200_cpu_or1200_mult_mac_div_by_zero;
    reg  [5:0]  or1200_cpu_or1200_mult_mac_div_cntr = 6'b0;
    reg  or1200_cpu_or1200_mult_mac_div_free = 1'b0;
    reg  [63:0] or1200_cpu_or1200_mult_mac_div_quot_r = 64'b0;
    wire   or1200_cpu_or1200_mult_mac_div_stall;
    wire  [31:0] or1200_cpu_or1200_mult_mac_div_tmp;
    wire   or1200_cpu_or1200_mult_mac_ex_freeze;
    reg  or1200_cpu_or1200_mult_mac_ex_freeze_r = 1'b0;
    wire   or1200_cpu_or1200_mult_mac_id_macrc_op;
    wire  [2:0] or1200_cpu_or1200_mult_mac_mac_op;
    wire  [2:0] or1200_cpu_or1200_mult_mac_mac_op_r1;
    wire  [2:0] or1200_cpu_or1200_mult_mac_mac_op_r2;
    wire  [2:0] or1200_cpu_or1200_mult_mac_mac_op_r3;
    wire  [63:0] or1200_cpu_or1200_mult_mac_mac_r;
    wire   or1200_cpu_or1200_mult_mac_mac_stall_r;
    wire   or1200_cpu_or1200_mult_mac_macrc_op;
    wire  [63:0] or1200_cpu_or1200_mult_mac_mul_prod;
    reg  [63:0] or1200_cpu_or1200_mult_mac_mul_prod_r = 64'b0;
    wire   or1200_cpu_or1200_mult_mac_mul_stall;
    reg  [1:0]  or1200_cpu_or1200_mult_mac_mul_stall_count = 2'b0;
    wire   or1200_cpu_or1200_mult_mac_mult_mac_stall;
    wire   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK;
    wire  [63:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P;
    wire   or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST;
    wire  [31:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X;
    reg  [31:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved = 32'b0;
    wire  [31:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y;
    reg  [31:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved = 32'b0;
    reg  [63:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1 = 64'b0;
    reg signed [31:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi = 32'sb0;
    reg signed [31:0] or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi = 32'sb0;
    reg  or1200_cpu_or1200_mult_mac_ov_we = 1'b0;
    reg  or1200_cpu_or1200_mult_mac_ovforw = 1'b0;
    reg  [31:0] or1200_cpu_or1200_mult_mac_result = 32'b0;
    wire   or1200_cpu_or1200_mult_mac_rst;
    wire  [31:0] or1200_cpu_or1200_mult_mac_spr_addr;
    wire   or1200_cpu_or1200_mult_mac_spr_cs;
    wire  [31:0] or1200_cpu_or1200_mult_mac_spr_dat_i;
    wire  [31:0] or1200_cpu_or1200_mult_mac_spr_dat_o;
    wire   or1200_cpu_or1200_mult_mac_spr_machi_we;
    wire   or1200_cpu_or1200_mult_mac_spr_maclo_we;
    wire   or1200_cpu_or1200_mult_mac_spr_write;
    wire  [31:0] or1200_cpu_or1200_mult_mac_x;
    wire  [31:0] or1200_cpu_or1200_mult_mac_y;
    wire   or1200_cpu_or1200_operandmuxes_clk;
    wire  [31:0] or1200_cpu_or1200_operandmuxes_ex_forw;
    wire   or1200_cpu_or1200_operandmuxes_ex_freeze;
    wire   or1200_cpu_or1200_operandmuxes_id_freeze;
    reg  [31:0] or1200_cpu_or1200_operandmuxes_muxed_a = 32'b0;
    reg  [31:0] or1200_cpu_or1200_operandmuxes_muxed_b = 32'b0;
    reg  [31:0] or1200_cpu_or1200_operandmuxes_operand_a = 32'b0;
    reg  [31:0] or1200_cpu_or1200_operandmuxes_operand_b = 32'b0;
    wire  [31:0] or1200_cpu_or1200_operandmuxes_rf_dataa;
    wire  [31:0] or1200_cpu_or1200_operandmuxes_rf_datab;
    wire   or1200_cpu_or1200_operandmuxes_rst;
    reg  or1200_cpu_or1200_operandmuxes_saved_a = 1'b0;
    reg  or1200_cpu_or1200_operandmuxes_saved_b = 1'b0;
    wire  [1:0] or1200_cpu_or1200_operandmuxes_sel_a;
    wire  [1:0] or1200_cpu_or1200_operandmuxes_sel_b;
    wire  [31:0] or1200_cpu_or1200_operandmuxes_simm;
    wire  [31:0] or1200_cpu_or1200_operandmuxes_wb_forw;
    wire  [4:0] or1200_cpu_or1200_rf_addra;
    reg  [4:0]  or1200_cpu_or1200_rf_addra_last = 5'b0;
    wire  [4:0] or1200_cpu_or1200_rf_addrb;
    wire  [4:0] or1200_cpu_or1200_rf_addrw;
    wire   or1200_cpu_or1200_rf_clk;
    wire   or1200_cpu_or1200_rf_cy_we_i;
    wire   or1200_cpu_or1200_rf_cy_we_o;
    wire  [31:0] or1200_cpu_or1200_rf_dataa;
    wire  [31:0] or1200_cpu_or1200_rf_datab;
    wire  [31:0] or1200_cpu_or1200_rf_dataw;
    wire   or1200_cpu_or1200_rf_du_read;
    wire   or1200_cpu_or1200_rf_flushpipe;
    wire  [31:0] or1200_cpu_or1200_rf_from_rfa;
    wire  [31:0] or1200_cpu_or1200_rf_from_rfb;
    wire   or1200_cpu_or1200_rf_id_freeze;
    wire   or1200_cpu_or1200_rf_rda;
    wire   or1200_cpu_or1200_rf_rdb;
    wire  [4:0] or1200_cpu_or1200_rf_rf_a_addr_a;
    reg  [4:0]  or1200_cpu_or1200_rf_rf_a_addr_a_reg = 5'b0;
    wire  [4:0] or1200_cpu_or1200_rf_rf_a_addr_b;
    wire   or1200_cpu_or1200_rf_rf_a_ce_a;
    wire   or1200_cpu_or1200_rf_rf_a_ce_b;
    wire   or1200_cpu_or1200_rf_rf_a_clk_a;
    wire   or1200_cpu_or1200_rf_rf_a_clk_b;
    wire  [31:0] or1200_cpu_or1200_rf_rf_a_di_b;
    wire  [31:0] or1200_cpu_or1200_rf_rf_a_do_a;
    reg  [31:0] or1200_cpu_or1200_rf_rf_a_mem [31:0];
    wire   or1200_cpu_or1200_rf_rf_a_we_b;
    wire  [4:0] or1200_cpu_or1200_rf_rf_addra;
    wire  [4:0] or1200_cpu_or1200_rf_rf_addrw;
    wire  [4:0] or1200_cpu_or1200_rf_rf_b_addr_a;
    reg  [4:0]  or1200_cpu_or1200_rf_rf_b_addr_a_reg = 5'b0;
    wire  [4:0] or1200_cpu_or1200_rf_rf_b_addr_b;
    wire   or1200_cpu_or1200_rf_rf_b_ce_a;
    wire   or1200_cpu_or1200_rf_rf_b_ce_b;
    wire   or1200_cpu_or1200_rf_rf_b_clk_a;
    wire   or1200_cpu_or1200_rf_rf_b_clk_b;
    wire  [31:0] or1200_cpu_or1200_rf_rf_b_di_b;
    wire  [31:0] or1200_cpu_or1200_rf_rf_b_do_a;
    reg  [31:0] or1200_cpu_or1200_rf_rf_b_mem [31:0];
    wire   or1200_cpu_or1200_rf_rf_b_we_b;
    wire  [31:0] or1200_cpu_or1200_rf_rf_dataw;
    wire   or1200_cpu_or1200_rf_rf_ena;
    wire   or1200_cpu_or1200_rf_rf_enb;
    wire   or1200_cpu_or1200_rf_rf_we;
    reg  or1200_cpu_or1200_rf_rf_we_allow = 1'b0;
    wire   or1200_cpu_or1200_rf_rst;
    wire  [31:0] or1200_cpu_or1200_rf_spr_addr;
    wire   or1200_cpu_or1200_rf_spr_cs;
    wire   or1200_cpu_or1200_rf_spr_cs_fe;
    wire  [31:0] or1200_cpu_or1200_rf_spr_dat_i;
    wire  [31:0] or1200_cpu_or1200_rf_spr_dat_o;
    reg  or1200_cpu_or1200_rf_spr_du_cs = 1'b0;
    wire   or1200_cpu_or1200_rf_spr_valid;
    wire   or1200_cpu_or1200_rf_spr_write;
    wire   or1200_cpu_or1200_rf_supv;
    wire   or1200_cpu_or1200_rf_wb_freeze;
    wire   or1200_cpu_or1200_rf_we;
    wire  [31:0] or1200_cpu_or1200_sprs_addrbase;
    wire  [15:0] or1200_cpu_or1200_sprs_addrofs;
    wire   or1200_cpu_or1200_sprs_boot_adr_sel_i;
    wire  [2:0] or1200_cpu_or1200_sprs_branch_op;
    wire   or1200_cpu_or1200_sprs_carry;
    wire   or1200_cpu_or1200_sprs_cfgr_sel;
    wire   or1200_cpu_or1200_sprs_clk;
    wire   or1200_cpu_or1200_sprs_cy_we;
    wire   or1200_cpu_or1200_sprs_cyforw;
    wire  [31:0] or1200_cpu_or1200_sprs_dat_i;
    wire   or1200_cpu_or1200_sprs_dsx;
    wire   or1200_cpu_or1200_sprs_du_access;
    wire  [31:0] or1200_cpu_or1200_sprs_du_addr;
    wire  [31:0] or1200_cpu_or1200_sprs_du_dat_cpu;
    wire  [31:0] or1200_cpu_or1200_sprs_du_dat_du;
    wire   or1200_cpu_or1200_sprs_du_read;
    wire   or1200_cpu_or1200_sprs_du_write;
    wire  [31:0] or1200_cpu_or1200_sprs_eear;
    wire   or1200_cpu_or1200_sprs_eear_sel;
    wire   or1200_cpu_or1200_sprs_eear_we;
    wire  [31:0] or1200_cpu_or1200_sprs_epcr;
    wire   or1200_cpu_or1200_sprs_epcr_sel;
    wire   or1200_cpu_or1200_sprs_epcr_we;
    wire  [16:0] or1200_cpu_or1200_sprs_esr;
    wire   or1200_cpu_or1200_sprs_esr_sel;
    wire   or1200_cpu_or1200_sprs_esr_we;
    wire   or1200_cpu_or1200_sprs_ex_spr_read;
    wire   or1200_cpu_or1200_sprs_ex_spr_write;
    wire   or1200_cpu_or1200_sprs_except_started;
    wire   or1200_cpu_or1200_sprs_flag;
    wire   or1200_cpu_or1200_sprs_flag_we;
    wire   or1200_cpu_or1200_sprs_flagforw;
    wire  [11:0] or1200_cpu_or1200_sprs_fpcsr;
    wire   or1200_cpu_or1200_sprs_fpcsr_sel;
    wire   or1200_cpu_or1200_sprs_fpcsr_we;
    wire   or1200_cpu_or1200_sprs_npc_sel;
    wire   or1200_cpu_or1200_sprs_ov_we;
    wire   or1200_cpu_or1200_sprs_ovforw;
    wire   or1200_cpu_or1200_sprs_pc_we;
    wire   or1200_cpu_or1200_sprs_ppc_sel;
    wire   or1200_cpu_or1200_sprs_rf_sel;
    wire   or1200_cpu_or1200_sprs_rst;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_addr;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_cs;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_cfgr;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_dmmu;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_du;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_fpu;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_immu;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_mac;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_npc;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_o;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_pic;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_pm;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_ppc;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_rf;
    wire  [31:0] or1200_cpu_or1200_sprs_spr_dat_tt;
    wire   or1200_cpu_or1200_sprs_spr_we;
    reg  [16:0] or1200_cpu_or1200_sprs_sr = 17'b0;
    reg  [16:0] or1200_cpu_or1200_sprs_sr_reg = 17'b0;
    reg  or1200_cpu_or1200_sprs_sr_reg_bit_eph = 1'b0;
    wire   or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed;
    reg  or1200_cpu_or1200_sprs_sr_reg_bit_eph_select = 1'b0;
    wire   or1200_cpu_or1200_sprs_sr_sel;
    wire   or1200_cpu_or1200_sprs_sr_we;
    wire  [31:0] or1200_cpu_or1200_sprs_sys_data;
    wire  [16:0] or1200_cpu_or1200_sprs_to_sr;
    reg  [31:0] or1200_cpu_or1200_sprs_to_wbmux = 32'b0;
    reg  [31:0] or1200_cpu_or1200_sprs_unqualified_cs = 32'b0;
    wire   or1200_cpu_or1200_wbmux_clk;
    wire  [31:0] or1200_cpu_or1200_wbmux_muxin_a;
    wire  [31:0] or1200_cpu_or1200_wbmux_muxin_b;
    wire  [31:0] or1200_cpu_or1200_wbmux_muxin_c;
    wire  [31:0] or1200_cpu_or1200_wbmux_muxin_d;
    wire  [31:0] or1200_cpu_or1200_wbmux_muxin_e;
    reg  [31:0] or1200_cpu_or1200_wbmux_muxout = 32'b0;
    reg  [31:0] or1200_cpu_or1200_wbmux_muxreg = 32'b0;
    reg  or1200_cpu_or1200_wbmux_muxreg_valid = 1'b0;
    wire  [3:0] or1200_cpu_or1200_wbmux_rfwb_op;
    wire   or1200_cpu_or1200_wbmux_rst;
    wire   or1200_cpu_or1200_wbmux_wb_freeze;
    wire   or1200_cpu_ov_we_alu;
    wire   or1200_cpu_ov_we_mult_mac;
    wire   or1200_cpu_ovforw;
    wire   or1200_cpu_ovforw_mult_mac;
    wire   or1200_cpu_pc_we;
    wire  [2:0] or1200_cpu_pre_branch_op;
    wire  [4:0] or1200_cpu_rf_addra;
    wire  [4:0] or1200_cpu_rf_addrb;
    wire  [4:0] or1200_cpu_rf_addrw;
    wire  [31:0] or1200_cpu_rf_dataa;
    wire  [31:0] or1200_cpu_rf_datab;
    wire  [31:0] or1200_cpu_rf_dataw;
    wire   or1200_cpu_rf_rda;
    wire   or1200_cpu_rf_rdb;
    wire   or1200_cpu_rfe;
    wire  [3:0] or1200_cpu_rfwb_op;
    wire   or1200_cpu_rst;
    wire   or1200_cpu_saving_if_insn;
    wire   or1200_cpu_sb_en;
    wire  [1:0] or1200_cpu_sel_a;
    wire  [1:0] or1200_cpu_sel_b;
    wire   or1200_cpu_sig_fp;
    wire   or1200_cpu_sig_int;
    wire   or1200_cpu_sig_range;
    wire   or1200_cpu_sig_syscall;
    wire   or1200_cpu_sig_tick;
    wire   or1200_cpu_sig_trap;
    wire  [31:0] or1200_cpu_spr_addr;
    wire  [31:0] or1200_cpu_spr_cs;
    wire  [31:0] or1200_cpu_spr_dat_cfgr;
    wire  [31:0] or1200_cpu_spr_dat_cpu;
    wire  [31:0] or1200_cpu_spr_dat_dmmu;
    wire  [31:0] or1200_cpu_spr_dat_du;
    wire  [31:0] or1200_cpu_spr_dat_fpu;
    wire  [31:0] or1200_cpu_spr_dat_immu;
    wire  [31:0] or1200_cpu_spr_dat_mac;
    wire  [31:0] or1200_cpu_spr_dat_npc;
    wire  [31:0] or1200_cpu_spr_dat_pic;
    wire  [31:0] or1200_cpu_spr_dat_pm;
    wire  [31:0] or1200_cpu_spr_dat_ppc;
    wire  [31:0] or1200_cpu_spr_dat_rf;
    wire  [31:0] or1200_cpu_spr_dat_tt;
    wire   or1200_cpu_spr_we;
    wire  [31:0] or1200_cpu_sprs_dataout;
    wire  [16:0] or1200_cpu_sr;
    wire   or1200_cpu_sr_we;
    wire   or1200_cpu_supv;
    wire  [16:0] or1200_cpu_to_sr;
    wire  [1:0] or1200_cpu_wait_on;
    wire   or1200_cpu_wb_flushpipe;
    wire  [31:0] or1200_cpu_wb_forw;
    wire   or1200_cpu_wb_freeze;
    wire  [31:0] or1200_cpu_wb_insn;
    wire  [31:0] or1200_cpu_wb_pc;
    wire   or1200_cpu_wbforw_valid;
    wire   or1200_dc_top_clk;
    wire  [31:0] or1200_dc_top_dc_addr;
    wire   or1200_dc_top_dc_block_flush;
    wire   or1200_dc_top_dc_block_invalidate;
    wire   or1200_dc_top_dc_block_writeback;
    wire   or1200_dc_top_dc_en;
    wire   or1200_dc_top_dc_no_writethrough;
    wire   or1200_dc_top_dcfsm_biu_do_sel;
    wire   or1200_dc_top_dcfsm_biu_read;
    wire   or1200_dc_top_dcfsm_biu_write;
    wire   or1200_dc_top_dcfsm_burst;
    wire   or1200_dc_top_dcfsm_dcram_di_sel;
    wire   or1200_dc_top_dcfsm_first_hit_ack;
    wire   or1200_dc_top_dcfsm_first_miss_ack;
    wire   or1200_dc_top_dcfsm_first_miss_err;
    wire   or1200_dc_top_dcfsm_tag_dirty;
    wire   or1200_dc_top_dcfsm_tag_valid;
    wire   or1200_dc_top_dcfsm_tag_we;
    wire   or1200_dc_top_dcqmem_ack_o;
    wire  [31:0] or1200_dc_top_dcqmem_adr_i;
    wire  [31:13] or1200_dc_top_dcqmem_adr_i_tag;
    wire   or1200_dc_top_dcqmem_ci_i;
    wire   or1200_dc_top_dcqmem_cycstb_i;
    wire  [31:0] or1200_dc_top_dcqmem_dat_i;
    wire  [31:0] or1200_dc_top_dcqmem_dat_o;
    wire   or1200_dc_top_dcqmem_err_o;
    wire   or1200_dc_top_dcqmem_rty_o;
    wire  [3:0] or1200_dc_top_dcqmem_sel_i;
    wire  [3:0] or1200_dc_top_dcqmem_tag_i;
    wire  [3:0] or1200_dc_top_dcqmem_tag_o;
    wire   or1200_dc_top_dcqmem_we_i;
    wire  [3:0] or1200_dc_top_dcram_we;
    wire   or1200_dc_top_dcsb_ack_i;
    wire  [31:0] or1200_dc_top_dcsb_adr_o;
    wire   or1200_dc_top_dcsb_cab_o;
    wire   or1200_dc_top_dcsb_cyc_o;
    wire  [31:0] or1200_dc_top_dcsb_dat_i;
    wire  [31:0] or1200_dc_top_dcsb_dat_o;
    wire   or1200_dc_top_dcsb_err_i;
    wire  [3:0] or1200_dc_top_dcsb_sel_o;
    wire   or1200_dc_top_dcsb_stb_o;
    wire   or1200_dc_top_dcsb_we_o;
    wire  [12:4] or1200_dc_top_dctag_addr;
    wire   or1200_dc_top_dctag_dirty;
    wire   or1200_dc_top_dctag_en;
    wire   or1200_dc_top_dctag_v;
    wire   or1200_dc_top_dctag_we;
    wire   or1200_dc_top_dirty;
    wire  [31:0] or1200_dc_top_from_dcram;
    wire   or1200_dc_top_mtspr_dc_done;
    reg  [31:0] or1200_dc_top_or1200_dc_fsm_addr_r = 32'b0;
    wire   or1200_dc_top_or1200_dc_fsm_biu_do_sel;
    wire   or1200_dc_top_or1200_dc_fsm_biu_read;
    wire   or1200_dc_top_or1200_dc_fsm_biu_write;
    wire   or1200_dc_top_or1200_dc_fsm_biudata_error;
    wire   or1200_dc_top_or1200_dc_fsm_biudata_valid;
    wire   or1200_dc_top_or1200_dc_fsm_burst;
    reg  or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = 1'b0;
    reg  or1200_dc_top_or1200_dc_fsm_cache_inhibit = 1'b0;
    wire   or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval;
    reg  or1200_dc_top_or1200_dc_fsm_cache_miss = 1'b0;
    reg  or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush = 1'b0;
    reg  or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = 1'b0;
    reg  or1200_dc_top_or1200_dc_fsm_cache_wb = 1'b0;
    wire   or1200_dc_top_or1200_dc_fsm_clk;
    reg  [3:0]  or1200_dc_top_or1200_dc_fsm_cnt = 4'b0;
    wire  [31:0] or1200_dc_top_or1200_dc_fsm_dc_addr;
    wire   or1200_dc_top_or1200_dc_fsm_dc_block_flush;
    wire   or1200_dc_top_or1200_dc_fsm_dc_block_writeback;
    wire   or1200_dc_top_or1200_dc_fsm_dc_en;
    wire   or1200_dc_top_or1200_dc_fsm_dc_no_writethrough;
    wire   or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i;
    wire   or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i;
    wire  [3:0] or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i;
    wire   or1200_dc_top_or1200_dc_fsm_dcqmem_we_i;
    wire   or1200_dc_top_or1200_dc_fsm_dcram_di_sel;
    wire  [3:0] or1200_dc_top_or1200_dc_fsm_dcram_we;
    wire   or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load;
    wire   or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load;
    reg  or1200_dc_top_or1200_dc_fsm_did_early_load_ack = 1'b0;
    wire   or1200_dc_top_or1200_dc_fsm_dirty;
    wire   or1200_dc_top_or1200_dc_fsm_first_hit_ack;
    wire   or1200_dc_top_or1200_dc_fsm_first_miss_ack;
    wire   or1200_dc_top_or1200_dc_fsm_first_miss_err;
    reg  or1200_dc_top_or1200_dc_fsm_hitmiss_eval = 1'b0;
    reg  or1200_dc_top_or1200_dc_fsm_load = 1'b0;
    wire   or1200_dc_top_or1200_dc_fsm_load_hit_ack;
    wire   or1200_dc_top_or1200_dc_fsm_load_inhibit_ack;
    wire   or1200_dc_top_or1200_dc_fsm_load_miss_ack;
    wire  [31:0] or1200_dc_top_or1200_dc_fsm_lsu_addr;
    wire   or1200_dc_top_or1200_dc_fsm_mtspr_dc_done;
    wire  [1:0] or1200_dc_top_or1200_dc_fsm_next_addr_word;
    wire   or1200_dc_top_or1200_dc_fsm_rst;
    wire   or1200_dc_top_or1200_dc_fsm_spr_cswe;
    wire  [31:0] or1200_dc_top_or1200_dc_fsm_spr_dat_i;
    reg  [2:0]  or1200_dc_top_or1200_dc_fsm_state = 3'b0;
    reg  or1200_dc_top_or1200_dc_fsm_store = 1'b0;
    wire   or1200_dc_top_or1200_dc_fsm_store_hit_ack;
    wire   or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack;
    wire   or1200_dc_top_or1200_dc_fsm_store_inhibit_ack;
    wire   or1200_dc_top_or1200_dc_fsm_store_miss_ack;
    wire   or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack;
    wire  [18:0] or1200_dc_top_or1200_dc_fsm_tag;
    wire   or1200_dc_top_or1200_dc_fsm_tag_dirty;
    wire   or1200_dc_top_or1200_dc_fsm_tag_v;
    wire   or1200_dc_top_or1200_dc_fsm_tag_valid;
    wire   or1200_dc_top_or1200_dc_fsm_tag_we;
    wire   or1200_dc_top_or1200_dc_fsm_tagcomp_miss;
    wire   or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set;
    wire   or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop;
    wire   or1200_dc_top_or1200_dc_fsm_writethrough;
    wire  [10:0] or1200_dc_top_or1200_dc_ram_addr;
    wire   or1200_dc_top_or1200_dc_ram_clk;
    wire  [31:0] or1200_dc_top_or1200_dc_ram_datain;
    wire  [31:0] or1200_dc_top_or1200_dc_ram_dataout;
    wire  [10:0] or1200_dc_top_or1200_dc_ram_dc_ram_addr;
    reg  [10:0] or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg = 11'b0;
    wire   or1200_dc_top_or1200_dc_ram_dc_ram_ce;
    wire   or1200_dc_top_or1200_dc_ram_dc_ram_clk;
    wire  [31:0] or1200_dc_top_or1200_dc_ram_dc_ram_di;
    wire  [31:0] or1200_dc_top_or1200_dc_ram_dc_ram_doq;
    reg  [7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem0 [2047:0];
    reg  [7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem1 [2047:0];
    reg  [7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem2 [2047:0];
    reg  [7:0]  or1200_dc_top_or1200_dc_ram_dc_ram_mem3 [2047:0];
    wire  [3:0] or1200_dc_top_or1200_dc_ram_dc_ram_we;
    wire   or1200_dc_top_or1200_dc_ram_en;
    wire   or1200_dc_top_or1200_dc_ram_rst;
    wire  [3:0] or1200_dc_top_or1200_dc_ram_we;
    wire  [8:0] or1200_dc_top_or1200_dc_tag_addr;
    wire   or1200_dc_top_or1200_dc_tag_clk;
    wire  [20:0] or1200_dc_top_or1200_dc_tag_datain;
    wire  [8:0] or1200_dc_top_or1200_dc_tag_dc_tag0_addr;
    reg  [8:0]  or1200_dc_top_or1200_dc_tag_dc_tag0_addr_reg = 9'b0;
    wire   or1200_dc_top_or1200_dc_tag_dc_tag0_ce;
    wire   or1200_dc_top_or1200_dc_tag_dc_tag0_clk;
    wire  [20:0] or1200_dc_top_or1200_dc_tag_dc_tag0_di;
    wire  [20:0] or1200_dc_top_or1200_dc_tag_dc_tag0_doq;
    reg  [20:0] or1200_dc_top_or1200_dc_tag_dc_tag0_mem [511:0];
    wire   or1200_dc_top_or1200_dc_tag_dc_tag0_we;
    wire   or1200_dc_top_or1200_dc_tag_dirty;
    wire   or1200_dc_top_or1200_dc_tag_en;
    wire   or1200_dc_top_or1200_dc_tag_rst;
    wire  [18:0] or1200_dc_top_or1200_dc_tag_tag;
    wire   or1200_dc_top_or1200_dc_tag_tag_v;
    wire   or1200_dc_top_or1200_dc_tag_we;
    wire   or1200_dc_top_rst;
    wire  [31:0] or1200_dc_top_spr_addr;
    wire   or1200_dc_top_spr_cs;
    wire  [31:0] or1200_dc_top_spr_dat_i;
    wire   or1200_dc_top_spr_write;
    wire  [18:0] or1200_dc_top_tag;
    wire   or1200_dc_top_tag_v;
    reg  or1200_dc_top_tagcomp_miss = 1'b0;
    wire  [31:0] or1200_dc_top_to_dcram;
    wire   or1200_dmmu_top_clk;
    wire   or1200_dmmu_top_dc_en;
    wire  [31:0] or1200_dmmu_top_dcpu_adr_i;
    wire   or1200_dmmu_top_dcpu_cycstb_i;
    wire   or1200_dmmu_top_dcpu_err_o;
    wire  [3:0] or1200_dmmu_top_dcpu_tag_o;
    reg  [31:13] or1200_dmmu_top_dcpu_vpn_r = 19'b0;
    wire   or1200_dmmu_top_dcpu_we_i;
    wire   or1200_dmmu_top_dmmu_en;
    wire   or1200_dmmu_top_dtlb_ci;
    wire  [31:0] or1200_dmmu_top_dtlb_dat_o;
    reg  or1200_dmmu_top_dtlb_done = 1'b0;
    wire   or1200_dmmu_top_dtlb_en;
    wire   or1200_dmmu_top_dtlb_hit;
    wire  [31:13] or1200_dmmu_top_dtlb_ppn;
    wire   or1200_dmmu_top_dtlb_spr_access;
    wire   or1200_dmmu_top_dtlb_sre;
    wire   or1200_dmmu_top_dtlb_swe;
    wire   or1200_dmmu_top_dtlb_ure;
    wire   or1200_dmmu_top_dtlb_uwe;
    wire   or1200_dmmu_top_fault;
    wire   or1200_dmmu_top_miss;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_ci;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_clk;
    wire  [5:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr;
    reg  [5:0]  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr_reg = 6'b0;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk;
    wire  [13:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di;
    wire  [13:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_doq;
    reg  [13:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_mem [63:0];
    wire   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we;
    wire  [5:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr;
    reg  [5:0]  or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr_reg = 6'b0;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk;
    wire  [23:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di;
    wire  [23:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_doq;
    reg  [23:0] or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_mem [63:0];
    wire   or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_hit;
    wire  [31:13] or1200_dmmu_top_or1200_dmmu_tlb_ppn;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_rst;
    wire  [31:0] or1200_dmmu_top_or1200_dmmu_tlb_spr_addr;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_spr_cs;
    wire  [31:0] or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i;
    wire  [31:0] or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_spr_write;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_sre;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_swe;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_tlb_en;
    wire  [5:0] or1200_dmmu_top_or1200_dmmu_tlb_tlb_index;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en;
    wire  [13:0] or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in;
    wire  [13:0] or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en;
    wire  [23:0] or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in;
    wire  [23:0] or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_ure;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_uwe;
    wire   or1200_dmmu_top_or1200_dmmu_tlb_v;
    wire  [31:0] or1200_dmmu_top_or1200_dmmu_tlb_vaddr;
    wire  [31:19] or1200_dmmu_top_or1200_dmmu_tlb_vpn;
    wire  [31:0] or1200_dmmu_top_qmemdmmu_adr_o;
    wire   or1200_dmmu_top_qmemdmmu_ci_o;
    wire   or1200_dmmu_top_qmemdmmu_cycstb_o;
    wire   or1200_dmmu_top_qmemdmmu_err_i;
    wire  [3:0] or1200_dmmu_top_qmemdmmu_tag_i;
    wire   or1200_dmmu_top_rst;
    wire  [31:0] or1200_dmmu_top_spr_addr;
    wire   or1200_dmmu_top_spr_cs;
    wire  [31:0] or1200_dmmu_top_spr_dat_i;
    wire  [31:0] or1200_dmmu_top_spr_dat_o;
    wire   or1200_dmmu_top_spr_write;
    wire   or1200_dmmu_top_supv;
    wire  [2:0] or1200_du_branch_op;
    wire   or1200_du_clk;
    reg  or1200_du_dbg_ack = 1'b0;
    reg  or1200_du_dbg_ack_o = 1'b0;
    wire  [31:0] or1200_du_dbg_adr_i;
    wire   or1200_du_dbg_bp_o;
    reg  or1200_du_dbg_bp_r = 1'b0;
    wire  [31:0] or1200_du_dbg_dat_i;
    reg  [31:0] or1200_du_dbg_dat_o = 32'b0;
    wire   or1200_du_dbg_ewt_i;
    reg  [1:0]  or1200_du_dbg_is_o = 2'b0;
    wire  [3:0] or1200_du_dbg_lss_o;
    wire   or1200_du_dbg_stall_i;
    reg  or1200_du_dbg_stall_i_r = 1'b0;
    wire   or1200_du_dbg_stb_i;
    wire   or1200_du_dbg_we_i;
    wire  [10:0] or1200_du_dbg_wp_o;
    wire  [31:0] or1200_du_dcpu_adr_i;
    wire   or1200_du_dcpu_cycstb_i;
    wire  [31:0] or1200_du_dcpu_dat_dc;
    wire  [31:0] or1200_du_dcpu_dat_lsu;
    wire   or1200_du_dcpu_we_i;
    wire  [7:0] or1200_du_dcr0;
    wire   or1200_du_dcr0_sel;
    wire  [7:0] or1200_du_dcr1;
    wire   or1200_du_dcr1_sel;
    wire  [7:0] or1200_du_dcr2;
    wire   or1200_du_dcr2_sel;
    wire  [7:0] or1200_du_dcr3;
    wire   or1200_du_dcr3_sel;
    wire  [7:0] or1200_du_dcr4;
    wire   or1200_du_dcr4_sel;
    wire  [7:0] or1200_du_dcr5;
    wire   or1200_du_dcr5_sel;
    wire  [7:0] or1200_du_dcr6;
    wire   or1200_du_dcr6_sel;
    wire  [7:0] or1200_du_dcr7;
    wire   or1200_du_dcr7_sel;
    reg  [24:0] or1200_du_dmr1 = 25'b0;
    wire   or1200_du_dmr1_sel;
    wire  [23:0] or1200_du_dmr2;
    wire   or1200_du_dmr2_sel;
    reg  [13:0] or1200_du_drr = 14'b0;
    wire   or1200_du_drr_sel;
    reg  [13:0] or1200_du_dsr = 14'b0;
    wire   or1200_du_dsr_sel;
    wire  [31:0] or1200_du_du_addr;
    wire  [31:0] or1200_du_du_dat_i;
    wire  [31:0] or1200_du_du_dat_o;
    wire  [24:0] or1200_du_du_dmr1;
    wire  [13:0] or1200_du_du_dsr;
    wire  [13:0] or1200_du_du_except_stop;
    wire   or1200_du_du_flush_pipe;
    reg  or1200_du_du_flush_pipe_r = 1'b0;
    wire   or1200_du_du_hwbkpt;
    reg  or1200_du_du_hwbkpt_hold = 1'b0;
    wire   or1200_du_du_read;
    wire   or1200_du_du_stall;
    wire   or1200_du_du_write;
    wire  [31:0] or1200_du_dvr0;
    wire   or1200_du_dvr0_sel;
    wire  [31:0] or1200_du_dvr1;
    wire   or1200_du_dvr1_sel;
    wire  [31:0] or1200_du_dvr2;
    wire   or1200_du_dvr2_sel;
    wire  [31:0] or1200_du_dvr3;
    wire   or1200_du_dvr3_sel;
    wire  [31:0] or1200_du_dvr4;
    wire   or1200_du_dvr4_sel;
    wire  [31:0] or1200_du_dvr5;
    wire   or1200_du_dvr5_sel;
    wire  [31:0] or1200_du_dvr6;
    wire   or1200_du_dvr6_sel;
    wire  [31:0] or1200_du_dvr7;
    wire   or1200_du_dvr7_sel;
    wire  [31:0] or1200_du_dwcr0;
    wire   or1200_du_dwcr0_sel;
    wire  [31:0] or1200_du_dwcr1;
    wire   or1200_du_dwcr1_sel;
    wire   or1200_du_ex_freeze;
    reg  or1200_du_ex_freeze_q = 1'b0;
    wire  [31:0] or1200_du_ex_insn;
    reg  [13:0] or1200_du_except_stop = 14'b0;
    wire   or1200_du_icpu_cycstb_i;
    wire  [31:0] or1200_du_id_pc;
    wire  [31:0] or1200_du_rf_dataw;
    wire   or1200_du_rst;
    wire  [31:0] or1200_du_spr_addr;
    wire   or1200_du_spr_cs;
    wire  [31:0] or1200_du_spr_dat_i;
    wire  [31:0] or1200_du_spr_dat_npc;
    reg  [31:0] or1200_du_spr_dat_o = 32'b0;
    wire   or1200_du_spr_write;
    wire  [31:0] or1200_du_tbar_dat_o;
    wire  [31:0] or1200_du_tbia_dat_o;
    wire  [31:0] or1200_du_tbim_dat_o;
    wire  [31:0] or1200_du_tbts_dat_o;
    wire   or1200_ic_top_clk;
    wire  [31:0] or1200_ic_top_from_icram;
    wire  [31:0] or1200_ic_top_ic_addr;
    wire   or1200_ic_top_ic_en;
    wire   or1200_ic_top_ic_inv;
    reg  or1200_ic_top_ic_inv_q = 1'b0;
    wire   or1200_ic_top_icbiu_ack_i;
    wire  [31:0] or1200_ic_top_icbiu_adr_o;
    wire   or1200_ic_top_icbiu_cab_o;
    wire   or1200_ic_top_icbiu_cyc_o;
    wire  [31:0] or1200_ic_top_icbiu_dat_i;
    wire  [31:0] or1200_ic_top_icbiu_dat_o;
    wire   or1200_ic_top_icbiu_err_i;
    wire  [3:0] or1200_ic_top_icbiu_sel_o;
    wire   or1200_ic_top_icbiu_stb_o;
    wire   or1200_ic_top_icbiu_we_o;
    wire   or1200_ic_top_icfsm_biu_read;
    wire   or1200_ic_top_icfsm_burst;
    wire   or1200_ic_top_icfsm_first_hit_ack;
    wire   or1200_ic_top_icfsm_first_miss_ack;
    wire   or1200_ic_top_icfsm_first_miss_err;
    wire   or1200_ic_top_icfsm_tag_we;
    wire   or1200_ic_top_icqmem_ack_o;
    wire  [31:0] or1200_ic_top_icqmem_adr_i;
    wire   or1200_ic_top_icqmem_ci_i;
    wire   or1200_ic_top_icqmem_cycstb_i;
    wire  [31:0] or1200_ic_top_icqmem_dat_o;
    wire   or1200_ic_top_icqmem_err_o;
    wire   or1200_ic_top_icqmem_rty_o;
    wire  [3:0] or1200_ic_top_icqmem_sel_i;
    wire  [3:0] or1200_ic_top_icqmem_tag_i;
    wire  [3:0] or1200_ic_top_icqmem_tag_o;
    wire  [3:0] or1200_ic_top_icram_we;
    wire  [12:4] or1200_ic_top_ictag_addr;
    wire   or1200_ic_top_ictag_en;
    wire   or1200_ic_top_ictag_v;
    wire   or1200_ic_top_ictag_we;
    wire   or1200_ic_top_or1200_ic_fsm_biu_read;
    wire   or1200_ic_top_or1200_ic_fsm_biudata_error;
    wire   or1200_ic_top_or1200_ic_fsm_biudata_valid;
    wire   or1200_ic_top_or1200_ic_fsm_burst;
    reg  or1200_ic_top_or1200_ic_fsm_cache_inhibit = 1'b0;
    wire   or1200_ic_top_or1200_ic_fsm_clk;
    reg  [3:0]  or1200_ic_top_or1200_ic_fsm_cnt = 4'b0;
    wire   or1200_ic_top_or1200_ic_fsm_first_hit_ack;
    wire   or1200_ic_top_or1200_ic_fsm_first_miss_ack;
    wire   or1200_ic_top_or1200_ic_fsm_first_miss_err;
    reg  or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 1'b0;
    wire   or1200_ic_top_or1200_ic_fsm_ic_en;
    wire   or1200_ic_top_or1200_ic_fsm_icqmem_ci_i;
    wire   or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i;
    wire  [3:0] or1200_ic_top_or1200_ic_fsm_icram_we;
    reg  or1200_ic_top_or1200_ic_fsm_last_eval_miss = 1'b0;
    reg  or1200_ic_top_or1200_ic_fsm_load = 1'b0;
    wire   or1200_ic_top_or1200_ic_fsm_rst;
    wire  [31:0] or1200_ic_top_or1200_ic_fsm_saved_addr;
    reg  [31:0] or1200_ic_top_or1200_ic_fsm_saved_addr_r = 32'b0;
    wire  [31:0] or1200_ic_top_or1200_ic_fsm_start_addr;
    reg  [1:0]  or1200_ic_top_or1200_ic_fsm_state = 2'b0;
    wire   or1200_ic_top_or1200_ic_fsm_tag_we;
    wire   or1200_ic_top_or1200_ic_fsm_tagcomp_miss;
    wire  [10:0] or1200_ic_top_or1200_ic_ram_addr;
    wire   or1200_ic_top_or1200_ic_ram_clk;
    wire  [31:0] or1200_ic_top_or1200_ic_ram_datain;
    wire  [31:0] or1200_ic_top_or1200_ic_ram_dataout;
    wire   or1200_ic_top_or1200_ic_ram_en;
    wire  [10:0] or1200_ic_top_or1200_ic_ram_ic_ram0_addr;
    reg  [10:0] or1200_ic_top_or1200_ic_ram_ic_ram0_addr_reg = 11'b0;
    wire   or1200_ic_top_or1200_ic_ram_ic_ram0_ce;
    wire   or1200_ic_top_or1200_ic_ram_ic_ram0_clk;
    wire  [31:0] or1200_ic_top_or1200_ic_ram_ic_ram0_di;
    wire  [31:0] or1200_ic_top_or1200_ic_ram_ic_ram0_doq;
    reg  [31:0] or1200_ic_top_or1200_ic_ram_ic_ram0_mem [2047:0];
    wire   or1200_ic_top_or1200_ic_ram_ic_ram0_we;
    wire   or1200_ic_top_or1200_ic_ram_rst;
    wire  [3:0] or1200_ic_top_or1200_ic_ram_we;
    wire  [8:0] or1200_ic_top_or1200_ic_tag_addr;
    wire   or1200_ic_top_or1200_ic_tag_clk;
    wire  [19:0] or1200_ic_top_or1200_ic_tag_datain;
    wire   or1200_ic_top_or1200_ic_tag_en;
    wire  [8:0] or1200_ic_top_or1200_ic_tag_ic_tag0_addr;
    reg  [8:0]  or1200_ic_top_or1200_ic_tag_ic_tag0_addr_reg = 9'b0;
    wire   or1200_ic_top_or1200_ic_tag_ic_tag0_ce;
    wire   or1200_ic_top_or1200_ic_tag_ic_tag0_clk;
    wire  [19:0] or1200_ic_top_or1200_ic_tag_ic_tag0_di;
    wire  [19:0] or1200_ic_top_or1200_ic_tag_ic_tag0_doq;
    reg  [19:0] or1200_ic_top_or1200_ic_tag_ic_tag0_mem [511:0];
    wire   or1200_ic_top_or1200_ic_tag_ic_tag0_we;
    wire   or1200_ic_top_or1200_ic_tag_rst;
    wire  [18:0] or1200_ic_top_or1200_ic_tag_tag;
    wire   or1200_ic_top_or1200_ic_tag_tag_v;
    wire   or1200_ic_top_or1200_ic_tag_we;
    wire   or1200_ic_top_rst;
    wire  [31:0] or1200_ic_top_saved_addr;
    wire   or1200_ic_top_spr_cs;
    wire  [31:0] or1200_ic_top_spr_dat_i;
    wire   or1200_ic_top_spr_write;
    wire  [18:0] or1200_ic_top_tag;
    wire   or1200_ic_top_tag_v;
    reg  or1200_ic_top_tagcomp_miss = 1'b0;
    wire  [31:0] or1200_ic_top_to_icram;
    wire   or1200_immu_top_boot_adr_sel_i;
    wire   or1200_immu_top_clk;
    reg  or1200_immu_top_dis_spr_access_frst_clk = 1'b0;
    reg  or1200_immu_top_dis_spr_access_scnd_clk = 1'b0;
    wire   or1200_immu_top_fault;
    wire   or1200_immu_top_ic_en;
    wire  [31:0] or1200_immu_top_icpu_adr_boot;
    reg  [31:0] or1200_immu_top_icpu_adr_default = 32'b0;
    wire  [31:0] or1200_immu_top_icpu_adr_i;
    reg  [31:0] or1200_immu_top_icpu_adr_o = 32'b0;
    reg  or1200_immu_top_icpu_adr_select = 1'b0;
    wire   or1200_immu_top_icpu_cycstb_i;
    wire   or1200_immu_top_icpu_err_o;
    wire   or1200_immu_top_icpu_rty_o;
    wire  [3:0] or1200_immu_top_icpu_tag_o;
    reg  [31:13] or1200_immu_top_icpu_vpn_r = 19'b0;
    wire   or1200_immu_top_immu_en;
    wire   or1200_immu_top_itlb_ci;
    wire  [31:0] or1200_immu_top_itlb_dat_o;
    wire   or1200_immu_top_itlb_done;
    wire   or1200_immu_top_itlb_en;
    reg  or1200_immu_top_itlb_en_r = 1'b0;
    wire   or1200_immu_top_itlb_hit;
    wire  [31:13] or1200_immu_top_itlb_ppn;
    wire   or1200_immu_top_itlb_spr_access;
    wire   or1200_immu_top_itlb_sxe;
    wire   or1200_immu_top_itlb_uxe;
    wire   or1200_immu_top_miss;
    wire   or1200_immu_top_or1200_immu_tlb_ci;
    wire   or1200_immu_top_or1200_immu_tlb_clk;
    wire   or1200_immu_top_or1200_immu_tlb_hit;
    wire  [5:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr;
    reg  [5:0]  or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr_reg = 6'b0;
    wire   or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce;
    wire   or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk;
    wire  [13:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di;
    wire  [13:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_doq;
    reg  [13:0] or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_mem [63:0];
    wire   or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we;
    wire  [5:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr;
    reg  [5:0]  or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr_reg = 6'b0;
    wire   or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce;
    wire   or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk;
    wire  [21:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di;
    wire  [21:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_doq;
    reg  [21:0] or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_mem [63:0];
    wire   or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we;
    wire  [31:13] or1200_immu_top_or1200_immu_tlb_ppn;
    wire   or1200_immu_top_or1200_immu_tlb_rst;
    wire  [31:0] or1200_immu_top_or1200_immu_tlb_spr_addr;
    wire   or1200_immu_top_or1200_immu_tlb_spr_cs;
    wire  [31:0] or1200_immu_top_or1200_immu_tlb_spr_dat_i;
    wire  [31:0] or1200_immu_top_or1200_immu_tlb_spr_dat_o;
    wire   or1200_immu_top_or1200_immu_tlb_spr_write;
    wire   or1200_immu_top_or1200_immu_tlb_sxe;
    wire   or1200_immu_top_or1200_immu_tlb_tlb_en;
    wire  [5:0] or1200_immu_top_or1200_immu_tlb_tlb_index;
    wire   or1200_immu_top_or1200_immu_tlb_tlb_mr_en;
    wire  [13:0] or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in;
    wire  [13:0] or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out;
    wire   or1200_immu_top_or1200_immu_tlb_tlb_mr_we;
    wire   or1200_immu_top_or1200_immu_tlb_tlb_tr_en;
    wire  [21:0] or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in;
    wire  [21:0] or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out;
    wire   or1200_immu_top_or1200_immu_tlb_tlb_tr_we;
    wire   or1200_immu_top_or1200_immu_tlb_uxe;
    wire   or1200_immu_top_or1200_immu_tlb_v;
    wire  [31:0] or1200_immu_top_or1200_immu_tlb_vaddr;
    wire  [31:19] or1200_immu_top_or1200_immu_tlb_vpn;
    wire   or1200_immu_top_page_cross;
    wire  [31:0] or1200_immu_top_qmemimmu_adr_o;
    wire   or1200_immu_top_qmemimmu_ci_o;
    wire   or1200_immu_top_qmemimmu_cycstb_o;
    wire   or1200_immu_top_qmemimmu_err_i;
    wire   or1200_immu_top_qmemimmu_rty_i;
    wire  [3:0] or1200_immu_top_qmemimmu_tag_i;
    wire   or1200_immu_top_rst;
    wire  [31:0] or1200_immu_top_spr_addr;
    wire   or1200_immu_top_spr_cs;
    wire  [31:0] or1200_immu_top_spr_dat_i;
    wire  [31:0] or1200_immu_top_spr_dat_o;
    reg  [31:0] or1200_immu_top_spr_dat_reg = 32'b0;
    wire   or1200_immu_top_spr_write;
    wire   or1200_immu_top_supv;
    wire   or1200_pic_clk;
    wire   or1200_pic_intr;
    wire  [19:0] or1200_pic_pic_int;
    wire   or1200_pic_pic_wakeup;
    reg  [19:2] or1200_pic_picmr = 18'b0;
    wire   or1200_pic_picmr_sel;
    reg  [19:0] or1200_pic_picsr = 20'b0;
    wire   or1200_pic_picsr_sel;
    wire   or1200_pic_rst;
    wire  [31:0] or1200_pic_spr_addr;
    wire   or1200_pic_spr_cs;
    wire  [31:0] or1200_pic_spr_dat_i;
    reg  [31:0] or1200_pic_spr_dat_o = 32'b0;
    wire   or1200_pic_spr_write;
    wire  [19:0] or1200_pic_um_ints;
    wire   or1200_pm_clk;
    wire   or1200_pm_pic_wakeup;
    wire  [3:0] or1200_pm_pm_clksd;
    wire   or1200_pm_pm_cpu_gate;
    wire   or1200_pm_pm_cpustall;
    wire   or1200_pm_pm_dc_gate;
    wire   or1200_pm_pm_dmmu_gate;
    wire   or1200_pm_pm_ic_gate;
    wire   or1200_pm_pm_immu_gate;
    wire   or1200_pm_pm_lvolt;
    wire   or1200_pm_pm_tt_gate;
    wire   or1200_pm_pm_wakeup;
    wire   or1200_pm_rst;
    wire  [31:0] or1200_pm_spr_addr;
    wire  [31:0] or1200_pm_spr_dat_i;
    wire  [31:0] or1200_pm_spr_dat_o;
    wire   or1200_pm_spr_write;
    wire   or1200_qmem_top_clk;
    wire   or1200_qmem_top_dcqmem_ack_i;
    wire  [31:0] or1200_qmem_top_dcqmem_adr_o;
    wire   or1200_qmem_top_dcqmem_ci_o;
    wire   or1200_qmem_top_dcqmem_cycstb_o;
    wire  [31:0] or1200_qmem_top_dcqmem_dat_i;
    wire  [31:0] or1200_qmem_top_dcqmem_dat_o;
    wire   or1200_qmem_top_dcqmem_err_i;
    wire   or1200_qmem_top_dcqmem_rty_i;
    wire  [3:0] or1200_qmem_top_dcqmem_sel_o;
    wire  [3:0] or1200_qmem_top_dcqmem_tag_i;
    wire  [3:0] or1200_qmem_top_dcqmem_tag_o;
    wire   or1200_qmem_top_dcqmem_we_o;
    wire   or1200_qmem_top_icqmem_ack_i;
    wire  [31:0] or1200_qmem_top_icqmem_adr_o;
    wire   or1200_qmem_top_icqmem_ci_o;
    wire   or1200_qmem_top_icqmem_cycstb_o;
    wire  [31:0] or1200_qmem_top_icqmem_dat_i;
    wire   or1200_qmem_top_icqmem_err_i;
    wire   or1200_qmem_top_icqmem_rty_i;
    wire  [3:0] or1200_qmem_top_icqmem_sel_o;
    wire  [3:0] or1200_qmem_top_icqmem_tag_i;
    wire  [3:0] or1200_qmem_top_icqmem_tag_o;
    wire   or1200_qmem_top_qmemdcpu_ack_o;
    wire  [31:0] or1200_qmem_top_qmemdcpu_dat_i;
    wire  [31:0] or1200_qmem_top_qmemdcpu_dat_o;
    wire   or1200_qmem_top_qmemdcpu_rty_o;
    wire  [3:0] or1200_qmem_top_qmemdcpu_sel_i;
    wire  [3:0] or1200_qmem_top_qmemdcpu_tag_i;
    wire   or1200_qmem_top_qmemdcpu_we_i;
    wire  [31:0] or1200_qmem_top_qmemdmmu_adr_i;
    wire   or1200_qmem_top_qmemdmmu_ci_i;
    wire   or1200_qmem_top_qmemdmmu_cycstb_i;
    wire   or1200_qmem_top_qmemdmmu_err_o;
    wire  [3:0] or1200_qmem_top_qmemdmmu_tag_o;
    wire   or1200_qmem_top_qmemicpu_ack_o;
    wire  [31:0] or1200_qmem_top_qmemicpu_dat_o;
    wire  [3:0] or1200_qmem_top_qmemicpu_sel_i;
    wire  [3:0] or1200_qmem_top_qmemicpu_tag_i;
    wire  [31:0] or1200_qmem_top_qmemimmu_adr_i;
    wire   or1200_qmem_top_qmemimmu_ci_i;
    wire   or1200_qmem_top_qmemimmu_cycstb_i;
    wire   or1200_qmem_top_qmemimmu_err_o;
    wire   or1200_qmem_top_qmemimmu_rty_o;
    wire  [3:0] or1200_qmem_top_qmemimmu_tag_o;
    wire   or1200_qmem_top_rst;
    wire   or1200_sb_clk;
    wire   or1200_sb_dcsb_ack_o;
    wire  [31:0] or1200_sb_dcsb_adr_i;
    wire   or1200_sb_dcsb_cab_i;
    wire   or1200_sb_dcsb_cyc_i;
    wire  [31:0] or1200_sb_dcsb_dat_i;
    wire  [31:0] or1200_sb_dcsb_dat_o;
    wire   or1200_sb_dcsb_err_o;
    wire  [3:0] or1200_sb_dcsb_sel_i;
    wire   or1200_sb_dcsb_stb_i;
    wire   or1200_sb_dcsb_we_i;
    wire   or1200_sb_rst;
    wire   or1200_sb_sb_en;
    wire   or1200_sb_sbbiu_ack_i;
    wire  [31:0] or1200_sb_sbbiu_adr_o;
    wire   or1200_sb_sbbiu_cab_o;
    wire   or1200_sb_sbbiu_cyc_o;
    wire  [31:0] or1200_sb_sbbiu_dat_i;
    wire  [31:0] or1200_sb_sbbiu_dat_o;
    wire   or1200_sb_sbbiu_err_i;
    wire  [3:0] or1200_sb_sbbiu_sel_o;
    wire   or1200_sb_sbbiu_stb_o;
    wire   or1200_sb_sbbiu_we_o;
    wire   or1200_tt_clk;
    wire   or1200_tt_du_stall;
    wire   or1200_tt_intr;
    wire   or1200_tt_match;
    wire   or1200_tt_restart;
    wire   or1200_tt_rst;
    wire  [31:0] or1200_tt_spr_addr;
    wire   or1200_tt_spr_cs;
    wire  [31:0] or1200_tt_spr_dat_i;
    reg  [31:0] or1200_tt_spr_dat_o = 32'b0;
    wire   or1200_tt_spr_write;
    wire   or1200_tt_stop;
    reg  [31:0] or1200_tt_ttcr = 32'b0;
    wire   or1200_tt_ttcr_sel;
    reg  [31:0] or1200_tt_ttmr = 32'b0;
    wire   or1200_tt_ttmr_sel;
    wire   pic_wakeup;
    wire  [3:0] pm_clksd_o;
    wire   pm_cpu_gate_o;
    wire   pm_dc_gate_o;
    wire   pm_dmmu_gate_o;
    wire   pm_ic_gate_o;
    wire   pm_immu_gate_o;
    wire   pm_lvolt_o;
    wire   pm_tt_gate_o;
    wire   pm_wakeup_o;
    wire  [31:0] qmemdmmu_adr_dmmu;
    wire   qmemdmmu_ci_dmmu;
    wire   qmemdmmu_cycstb_dmmu;
    wire   qmemdmmu_err_qmem;
    wire  [3:0] qmemdmmu_tag_qmem;
    wire  [31:0] qmemimmu_adr_immu;
    wire   qmemimmu_ci_immu;
    wire   qmemimmu_cycstb_immu;
    wire   qmemimmu_err_qmem;
    wire   qmemimmu_rty_qmem;
    wire  [3:0] qmemimmu_tag_qmem;
    wire  [31:0] rf_dataw;
    wire   sb_en;
    wire   sbbiu_ack_biu;
    wire  [31:0] sbbiu_adr_sb;
    wire   sbbiu_cab_sb;
    wire   sbbiu_cyc_sb;
    wire  [31:0] sbbiu_dat_biu;
    wire  [31:0] sbbiu_dat_sb;
    wire   sbbiu_err_biu;
    wire  [3:0] sbbiu_sel_sb;
    wire   sbbiu_stb_sb;
    wire   sbbiu_we_sb;
    wire   sig_int;
    wire   sig_tick;
    wire  [31:0] spr_addr;
    wire  [31:0] spr_cs;
    wire  [31:0] spr_dat_cpu;
    wire  [31:0] spr_dat_dmmu;
    wire  [31:0] spr_dat_du;
    wire  [31:0] spr_dat_immu;
    wire  [31:0] spr_dat_npc;
    wire  [31:0] spr_dat_pic;
    wire  [31:0] spr_dat_pm;
    wire  [31:0] spr_dat_tt;
    wire   spr_we;
    wire   supv;
    wire   wb_freeze;
    wire  [31:0] wb_insn;
    wire  [31:0] wb_pc;
    reg [9999:0] coverage0 = 10000'b0;

    assign boot_adr_sel = 1'b0;

  //assertion( boot_adr_sel = 0) 0
    assign du_hwbkpt_ls_r = 1'b0;

  //assertion( du_hwbkpt_ls_r = 0) 1
    assign dwb_biu_retry_cnt = 1'b0;

  //assertion( dwb_biu_retry_cnt = 0) 2
    assign dwb_biu_wb_fsm_idle = 2'h0;

  //assertion( dwb_biu_wb_fsm_idle = 0) 3
    assign dwb_biu_wb_fsm_last = 2'h2;

  //assertion( dwb_biu_wb_fsm_last = 2) 4
    assign dwb_biu_wb_fsm_trans = 2'h1;

  //assertion( dwb_biu_wb_fsm_trans = 1) 5
    assign iwb_biu_retry_cnt = 1'b0;

  //assertion( iwb_biu_retry_cnt = 0) 6
    assign iwb_biu_wb_fsm_idle = 2'h0;

  //assertion( iwb_biu_wb_fsm_idle = 0) 7
    assign iwb_biu_wb_fsm_last = 2'h2;

  //assertion( iwb_biu_wb_fsm_last = 2) 8
    assign iwb_biu_wb_fsm_trans = 2'h1;

  //assertion( iwb_biu_wb_fsm_trans = 1) 9
    assign or1200_cpu_or1200_ctrl_dc_no_writethrough = 0;

  //assertion( or1200_cpu_or1200_ctrl_dc_no_writethrough = 0) 10
    assign or1200_cpu_or1200_ctrl_ex_macrc_op = 1'b0;

  //assertion( or1200_cpu_or1200_ctrl_ex_macrc_op = 0) 11
    assign or1200_cpu_or1200_ctrl_force_dslot_fetch = 1'b0;

  //assertion( or1200_cpu_or1200_ctrl_force_dslot_fetch = 0) 12
    assign or1200_cpu_or1200_ctrl_fpu_op = 8'h00;

  //assertion( or1200_cpu_or1200_ctrl_fpu_op = 0) 13
    assign or1200_cpu_or1200_ctrl_id_mac_op = 3'h0;

  //assertion( or1200_cpu_or1200_ctrl_id_mac_op = 0) 14
    assign or1200_cpu_or1200_ctrl_id_macrc_op = 1'b0;

  //assertion( or1200_cpu_or1200_ctrl_id_macrc_op = 0) 15
    assign or1200_cpu_or1200_ctrl_if_maci_op = 1'b0;

  //assertion( or1200_cpu_or1200_ctrl_if_maci_op = 0) 16
    assign or1200_cpu_or1200_ctrl_mac_op = 3'h0;

  //assertion( or1200_cpu_or1200_ctrl_mac_op = 0) 17
    assign or1200_cpu_or1200_fpu_done = (-1);

  //assertion( or1200_cpu_or1200_fpu_done = -1) 18
    assign or1200_cpu_or1200_fpu_flag_we = 0;

  //assertion( or1200_cpu_or1200_fpu_flag_we = 0) 19
    assign or1200_cpu_or1200_fpu_flagforw = 0;

  //assertion( or1200_cpu_or1200_fpu_flagforw = 0) 20
    assign or1200_cpu_or1200_fpu_fpcsr = 0;

  //assertion( or1200_cpu_or1200_fpu_fpcsr = 0) 21
    assign or1200_cpu_or1200_fpu_result = 0;

  //assertion( or1200_cpu_or1200_fpu_result = 0) 22
    assign or1200_cpu_or1200_fpu_sig_fp = 0;

  //assertion( or1200_cpu_or1200_fpu_sig_fp = 0) 23
    assign or1200_cpu_or1200_fpu_spr_dat_o = 0;

  //assertion( or1200_cpu_or1200_fpu_spr_dat_o = 0) 24
    assign or1200_cpu_or1200_genpc_icpu_sel_o = 4'hf;

  //assertion( or1200_cpu_or1200_genpc_icpu_sel_o = 15) 25
    assign or1200_cpu_or1200_genpc_icpu_tag_o = 4'h1;

  //assertion( or1200_cpu_or1200_genpc_icpu_tag_o = 1) 26
    assign or1200_cpu_or1200_genpc_pcreg_boot = 32'h00000100;

  //assertion( or1200_cpu_or1200_genpc_pcreg_boot = 256) 27
    assign or1200_cpu_or1200_mult_mac_mac_op_r1 = 3'h0;

  //assertion( or1200_cpu_or1200_mult_mac_mac_op_r1 = 0) 28
    assign or1200_cpu_or1200_mult_mac_mac_op_r2 = 3'h0;

  //assertion( or1200_cpu_or1200_mult_mac_mac_op_r2 = 0) 29
    assign or1200_cpu_or1200_mult_mac_mac_op_r3 = 3'h0;

  //assertion( or1200_cpu_or1200_mult_mac_mac_op_r3 = 0) 30
    assign or1200_cpu_or1200_mult_mac_mac_r = 64'h0000000000000000;

  //assertion( or1200_cpu_or1200_mult_mac_mac_r = 0) 31
    assign or1200_cpu_or1200_mult_mac_mac_stall_r = 1'b0;

  //assertion( or1200_cpu_or1200_mult_mac_mac_stall_r = 0) 32
    assign or1200_cpu_or1200_mult_mac_spr_dat_o = 32'h00000000;

  //assertion( or1200_cpu_or1200_mult_mac_spr_dat_o = 0) 33
    assign or1200_cpu_or1200_mult_mac_spr_machi_we = 1'b0;

  //assertion( or1200_cpu_or1200_mult_mac_spr_machi_we = 0) 34
    assign or1200_cpu_or1200_mult_mac_spr_maclo_we = 1'b0;

  //assertion( or1200_cpu_or1200_mult_mac_spr_maclo_we = 0) 35
    assign or1200_cpu_sb_en = 1'b0;

  //assertion( or1200_cpu_sb_en = 0) 36
    assign or1200_dc_top_dc_block_flush = 0;

  //assertion( or1200_dc_top_dc_block_flush = 0) 37
    assign or1200_dc_top_dc_block_writeback = 0;

  //assertion( or1200_dc_top_dc_block_writeback = 0) 38
    assign or1200_dc_top_or1200_dc_fsm_mtspr_dc_done = 1'b1;

  //assertion( or1200_dc_top_or1200_dc_fsm_mtspr_dc_done = 1) 39
    assign or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set = 0;

  //assertion( or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set = 0) 40
    assign or1200_dc_top_or1200_dc_fsm_writethrough = (-1);

  //assertion( or1200_dc_top_or1200_dc_fsm_writethrough = -1) 41
    assign or1200_du_dbg_lss_o = 4'h0;

  //assertion( or1200_du_dbg_lss_o = 0) 42
    assign or1200_du_dbg_wp_o = 11'h000;

  //assertion( or1200_du_dbg_wp_o = 0) 43
    assign or1200_du_dcr0 = 8'h00;

  //assertion( or1200_du_dcr0 = 0) 44
    assign or1200_du_dcr1 = 8'h00;

  //assertion( or1200_du_dcr1 = 0) 45
    assign or1200_du_dcr2 = 8'h00;

  //assertion( or1200_du_dcr2 = 0) 46
    assign or1200_du_dcr3 = 8'h00;

  //assertion( or1200_du_dcr3 = 0) 47
    assign or1200_du_dcr4 = 8'h00;

  //assertion( or1200_du_dcr4 = 0) 48
    assign or1200_du_dcr5 = 8'h00;

  //assertion( or1200_du_dcr5 = 0) 49
    assign or1200_du_dcr6 = 8'h00;

  //assertion( or1200_du_dcr6 = 0) 50
    assign or1200_du_dcr7 = 8'h00;

  //assertion( or1200_du_dcr7 = 0) 51
    assign or1200_du_dmr2 = 24'h000000;

  //assertion( or1200_du_dmr2 = 0) 52
    assign or1200_du_du_hwbkpt = 1'b0;

  //assertion( or1200_du_du_hwbkpt = 0) 53
    assign or1200_du_dvr0 = 32'h00000000;

  //assertion( or1200_du_dvr0 = 0) 54
    assign or1200_du_dvr1 = 32'h00000000;

  //assertion( or1200_du_dvr1 = 0) 55
    assign or1200_du_dvr2 = 32'h00000000;

  //assertion( or1200_du_dvr2 = 0) 56
    assign or1200_du_dvr3 = 32'h00000000;

  //assertion( or1200_du_dvr3 = 0) 57
    assign or1200_du_dvr4 = 32'h00000000;

  //assertion( or1200_du_dvr4 = 0) 58
    assign or1200_du_dvr5 = 32'h00000000;

  //assertion( or1200_du_dvr5 = 0) 59
    assign or1200_du_dvr6 = 32'h00000000;

  //assertion( or1200_du_dvr6 = 0) 60
    assign or1200_du_dvr7 = 32'h00000000;

  //assertion( or1200_du_dvr7 = 0) 61
    assign or1200_du_dwcr0 = 32'h00000000;

  //assertion( or1200_du_dwcr0 = 0) 62
    assign or1200_du_dwcr1 = 32'h00000000;

  //assertion( or1200_du_dwcr1 = 0) 63
    assign or1200_du_tbar_dat_o = 32'h00000000;

  //assertion( or1200_du_tbar_dat_o = 0) 64
    assign or1200_du_tbia_dat_o = 32'h00000000;

  //assertion( or1200_du_tbia_dat_o = 0) 65
    assign or1200_du_tbim_dat_o = 32'h00000000;

  //assertion( or1200_du_tbim_dat_o = 0) 66
    assign or1200_du_tbts_dat_o = 32'h00000000;

  //assertion( or1200_du_tbts_dat_o = 0) 67
    assign or1200_ic_top_icbiu_dat_o = 32'h00000000;

  //assertion( or1200_ic_top_icbiu_dat_o = 0) 68
    assign or1200_ic_top_icbiu_we_o = 1'b0;

  //assertion( or1200_ic_top_icbiu_we_o = 0) 69
    assign or1200_immu_top_icpu_adr_boot = 32'h00000100;

  //assertion( or1200_immu_top_icpu_adr_boot = 256) 70
    assign or1200_pm_pm_clksd = 4'h0;

  //assertion( or1200_pm_pm_clksd = 0) 71
    assign or1200_pm_pm_cpu_gate = 1'b0;

  //assertion( or1200_pm_pm_cpu_gate = 0) 72
    assign or1200_pm_pm_dc_gate = 1'b0;

  //assertion( or1200_pm_pm_dc_gate = 0) 73
    assign or1200_pm_pm_dmmu_gate = 1'b0;

  //assertion( or1200_pm_pm_dmmu_gate = 0) 74
    assign or1200_pm_pm_ic_gate = 1'b0;

  //assertion( or1200_pm_pm_ic_gate = 0) 75
    assign or1200_pm_pm_immu_gate = 1'b0;

  //assertion( or1200_pm_pm_immu_gate = 0) 76
    assign or1200_pm_pm_lvolt = 1'b0;

  //assertion( or1200_pm_pm_lvolt = 0) 77
    assign or1200_pm_pm_tt_gate = 1'b0;

  //assertion( or1200_pm_pm_tt_gate = 0) 78
    assign or1200_pm_pm_wakeup = 1'b1;

  //assertion( or1200_pm_pm_wakeup = 1) 79
    assign icbiu_adr_ic_word = {icbiu_adr_ic[31:2], 2'h0};

  //assertion( icbiu_adr_ic_word = Concat(Extract(31, 2, icbiu_adr_ic), 0)) 80
    assign or1200_immu_top_page_cross = (or1200_immu_top_icpu_adr_i[31:13] != or1200_immu_top_icpu_vpn_r);

  //assertion( or1200_immu_top_page_cross = Extract(31, 13, or1200_immu_top_icpu_adr_i) != or1200_immu_top_icpu_vpn_r) 81
    assign or1200_immu_top_icpu_tag_o = (or1200_immu_top_miss ? 4'hd : (or1200_immu_top_fault ? 4'hc : or1200_immu_top_qmemimmu_tag_i));

  //assertion( or1200_immu_top_icpu_tag_o = If(0 != or1200_immu_top_miss == True, 13, If(0 != or1200_immu_top_fault == True, 12, or1200_immu_top_qmemimmu_tag_i))) 82
    assign or1200_immu_top_qmemimmu_cycstb_o = (or1200_immu_top_immu_en ? (((((~(or1200_immu_top_miss | or1200_immu_top_fault)) & or1200_immu_top_icpu_cycstb_i) & (~or1200_immu_top_page_cross)) & or1200_immu_top_itlb_done) & (~or1200_immu_top_itlb_spr_access)) : (or1200_immu_top_icpu_cycstb_i & (~or1200_immu_top_page_cross)));

  //assertion( or1200_immu_top_qmemimmu_cycstb_o = If(0 != or1200_immu_top_immu_en == True, ~(or1200_immu_top_miss | or1200_immu_top_fault) & or1200_immu_top_icpu_cycstb_i & ~or1200_immu_top_page_cross & or1200_immu_top_itlb_done & ~or1200_immu_top_itlb_spr_access, or1200_immu_top_icpu_cycstb_i & ~or1200_immu_top_page_cross)) 83
    assign or1200_immu_top_qmemimmu_ci_o = (or1200_immu_top_immu_en ? or1200_immu_top_itlb_ci : 1'b0);

  //assertion( or1200_immu_top_qmemimmu_ci_o = If(0 != or1200_immu_top_immu_en == True, or1200_immu_top_itlb_ci, 0)) 84
    assign or1200_immu_top_qmemimmu_adr_o = ((or1200_immu_top_immu_en & or1200_immu_top_itlb_done) ? {or1200_immu_top_itlb_ppn, or1200_immu_top_icpu_adr_i[12:2], 2'h0} : {or1200_immu_top_icpu_vpn_r, or1200_immu_top_icpu_adr_i[12:2], 2'h0});

  //assertion( or1200_immu_top_qmemimmu_adr_o = If((1 == or1200_immu_top_immu_en & or1200_immu_top_itlb_done) == True, Concat(Concat(or1200_immu_top_itlb_ppn, Extract(12, 2, or1200_immu_top_icpu_adr_i)), 0), Concat(Concat(or1200_immu_top_icpu_vpn_r, Extract(12, 2, or1200_immu_top_icpu_adr_i)), 0))) 85
    assign or1200_immu_top_spr_dat_o = (or1200_immu_top_itlb_spr_access ? or1200_immu_top_itlb_dat_o : or1200_immu_top_spr_dat_reg);

  //assertion( or1200_immu_top_spr_dat_o = If(0 != or1200_immu_top_itlb_spr_access == True, or1200_immu_top_itlb_dat_o, or1200_immu_top_spr_dat_reg)) 86
    assign or1200_immu_top_or1200_immu_tlb_spr_dat_o = ((~|or1200_immu_top_or1200_immu_tlb_spr_write & ~|or1200_immu_top_or1200_immu_tlb_spr_addr[7]) ? {or1200_immu_top_or1200_immu_tlb_vpn, or1200_immu_top_or1200_immu_tlb_tlb_index, 6'h00, 1'b0, 5'h00, or1200_immu_top_or1200_immu_tlb_v} : ((~|or1200_immu_top_or1200_immu_tlb_spr_write & or1200_immu_top_or1200_immu_tlb_spr_addr[7]) ? {or1200_immu_top_or1200_immu_tlb_ppn, 5'h00, or1200_immu_top_or1200_immu_tlb_uxe, or1200_immu_top_or1200_immu_tlb_sxe, 4'h0, or1200_immu_top_or1200_immu_tlb_ci, 1'b0} : 32'h00000000));

  //assertion( or1200_immu_top_or1200_immu_tlb_spr_dat_o = If((1 == ~bvredor(or1200_immu_top_or1200_immu_tlb_spr_write) & ~bvredor(Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_addr))) == True, Concat(Concat(Concat(Concat(Concat(or1200_immu_top_or1200_immu_tlb_vpn, or1200_immu_top_or1200_immu_tlb_tlb_index), 0), 0), 0), or1200_immu_top_or1200_immu_tlb_v), If((1 == ~bvredor(or1200_immu_top_or1200_immu_tlb_spr_write) & Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_addr)) == True, Concat(Concat(Concat(Concat(Concat(Concat(or1200_immu_top_or1200_immu_tlb_ppn, 0), or1200_immu_top_or1200_immu_tlb_uxe), or1200_immu_top_or1200_immu_tlb_sxe), 0), or1200_immu_top_or1200_immu_tlb_ci), 0), 0))) 87
    assign or1200_immu_top_or1200_immu_tlb_vpn = or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out[13:1];

  //assertion( or1200_immu_top_or1200_immu_tlb_vpn = Extract(13, 1, or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out)) 88
    assign or1200_immu_top_or1200_immu_tlb_v = or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out[0];

  //assertion( or1200_immu_top_or1200_immu_tlb_v = Extract(0, 0, or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out)) 89
    assign or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in = {or1200_immu_top_or1200_immu_tlb_spr_dat_i[31:19], or1200_immu_top_or1200_immu_tlb_spr_dat_i[0]};

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in = Concat(Extract(31, 19, or1200_immu_top_or1200_immu_tlb_spr_dat_i), Extract(0, 0, or1200_immu_top_or1200_immu_tlb_spr_dat_i))) 90
    assign or1200_immu_top_or1200_immu_tlb_ppn = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out[21:3];

  //assertion( or1200_immu_top_or1200_immu_tlb_ppn = Extract(21, 3, or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out)) 91
    assign or1200_immu_top_or1200_immu_tlb_uxe = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out[2];

  //assertion( or1200_immu_top_or1200_immu_tlb_uxe = Extract(2, 2, or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out)) 92
    assign or1200_immu_top_or1200_immu_tlb_sxe = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out[1];

  //assertion( or1200_immu_top_or1200_immu_tlb_sxe = Extract(1, 1, or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out)) 93
    assign or1200_immu_top_or1200_immu_tlb_ci = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out[0];

  //assertion( or1200_immu_top_or1200_immu_tlb_ci = Extract(0, 0, or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out)) 94
    assign or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in = {or1200_immu_top_or1200_immu_tlb_spr_dat_i[31:13], or1200_immu_top_or1200_immu_tlb_spr_dat_i[7], or1200_immu_top_or1200_immu_tlb_spr_dat_i[6], or1200_immu_top_or1200_immu_tlb_spr_dat_i[1]};

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in = Concat(Concat(Concat(Extract(31, 13, or1200_immu_top_or1200_immu_tlb_spr_dat_i), Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_dat_i)), Extract(6, 6, or1200_immu_top_or1200_immu_tlb_spr_dat_i)), Extract(1, 1, or1200_immu_top_or1200_immu_tlb_spr_dat_i))) 95
    assign or1200_immu_top_or1200_immu_tlb_tlb_index = (or1200_immu_top_or1200_immu_tlb_spr_cs ? or1200_immu_top_or1200_immu_tlb_spr_addr[5:0] : or1200_immu_top_or1200_immu_tlb_vaddr[18:13]);

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_index = If(0 != or1200_immu_top_or1200_immu_tlb_spr_cs == True, Extract(5, 0, or1200_immu_top_or1200_immu_tlb_spr_addr), Extract(18, 13, or1200_immu_top_or1200_immu_tlb_vaddr))) 96
    assign or1200_immu_top_spr_cs = spr_cs[2];

  //assertion( or1200_immu_top_spr_cs = Extract(2, 2, spr_cs)) 97
    assign or1200_ic_top_ictag_addr = (or1200_ic_top_ic_inv ? or1200_ic_top_spr_dat_i[12:4] : or1200_ic_top_ic_addr[12:4]);

  //assertion( or1200_ic_top_ictag_addr = If(0 != or1200_ic_top_ic_inv == True, Extract(12, 4, or1200_ic_top_spr_dat_i), Extract(12, 4, or1200_ic_top_ic_addr))) 98
    assign or1200_ic_top_icbiu_cyc_o = (or1200_ic_top_ic_en ? or1200_ic_top_icfsm_biu_read : or1200_ic_top_icqmem_cycstb_i);

  //assertion( or1200_ic_top_icbiu_cyc_o = If(0 != or1200_ic_top_ic_en == True, or1200_ic_top_icfsm_biu_read, or1200_ic_top_icqmem_cycstb_i)) 99
    assign or1200_ic_top_icbiu_stb_o = (or1200_ic_top_ic_en ? or1200_ic_top_icfsm_biu_read : or1200_ic_top_icqmem_cycstb_i);

  //assertion( or1200_ic_top_icbiu_stb_o = If(0 != or1200_ic_top_ic_en == True, or1200_ic_top_icfsm_biu_read, or1200_ic_top_icqmem_cycstb_i)) 100
    assign or1200_ic_top_icbiu_sel_o = ((or1200_ic_top_ic_en & or1200_ic_top_icfsm_biu_read) ? 4'hf : or1200_ic_top_icqmem_sel_i);

  //assertion( or1200_ic_top_icbiu_sel_o = If((1 == or1200_ic_top_ic_en & or1200_ic_top_icfsm_biu_read) == True, 15, or1200_ic_top_icqmem_sel_i)) 101
    assign or1200_ic_top_icbiu_cab_o = (or1200_ic_top_ic_en ? or1200_ic_top_icfsm_burst : 1'b0);

  //assertion( or1200_ic_top_icbiu_cab_o = If(0 != or1200_ic_top_ic_en == True, or1200_ic_top_icfsm_burst, 0)) 102
    assign or1200_ic_top_icqmem_tag_o = (or1200_ic_top_icqmem_err_o ? 4'hb : or1200_ic_top_icqmem_tag_i);

  //assertion( or1200_ic_top_icqmem_tag_o = If(0 != or1200_ic_top_icqmem_err_o == True, 11, or1200_ic_top_icqmem_tag_i)) 103
    assign or1200_ic_top_icqmem_ack_o = (or1200_ic_top_ic_en ? (or1200_ic_top_icfsm_first_hit_ack | or1200_ic_top_icfsm_first_miss_ack) : or1200_ic_top_icbiu_ack_i);

  //assertion( or1200_ic_top_icqmem_ack_o = If(0 != or1200_ic_top_ic_en == True, or1200_ic_top_icfsm_first_hit_ack | or1200_ic_top_icfsm_first_miss_ack, or1200_ic_top_icbiu_ack_i)) 104
    assign or1200_ic_top_icqmem_err_o = (or1200_ic_top_ic_en ? or1200_ic_top_icfsm_first_miss_err : or1200_ic_top_icbiu_err_i);

  //assertion( or1200_ic_top_icqmem_err_o = If(0 != or1200_ic_top_ic_en == True, or1200_ic_top_icfsm_first_miss_err, or1200_ic_top_icbiu_err_i)) 105
    assign or1200_ic_top_ic_addr = (or1200_ic_top_icfsm_biu_read ? or1200_ic_top_saved_addr : or1200_ic_top_icqmem_adr_i);

  //assertion( or1200_ic_top_ic_addr = If(0 != or1200_ic_top_icfsm_biu_read == True, or1200_ic_top_saved_addr, or1200_ic_top_icqmem_adr_i)) 106
    assign or1200_ic_top_icqmem_dat_o = ((or1200_ic_top_icfsm_first_miss_ack | ~|or1200_ic_top_ic_en) ? or1200_ic_top_icbiu_dat_i : or1200_ic_top_from_icram);

  //assertion( or1200_ic_top_icqmem_dat_o = If((1 == or1200_ic_top_icfsm_first_miss_ack | ~bvredor(or1200_ic_top_ic_en)) == True, or1200_ic_top_icbiu_dat_i, or1200_ic_top_from_icram)) 107
    assign or1200_ic_top_or1200_ic_fsm_icram_we = { 4{ ((or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid) & ~|or1200_ic_top_or1200_ic_fsm_cache_inhibit) } };

  //assertion( or1200_ic_top_or1200_ic_fsm_icram_we = Concat(Concat(Concat(or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit), or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit)), or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit)), or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit))) 108
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_we = or1200_ic_top_or1200_ic_ram_we[0];

  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_we = Extract(0, 0, or1200_ic_top_or1200_ic_ram_we)) 109
    assign or1200_ic_top_or1200_ic_ram_addr = or1200_ic_top_ic_addr[12:2];

  //assertion( or1200_ic_top_or1200_ic_ram_addr = Extract(12, 2, or1200_ic_top_ic_addr)) 110
    assign or1200_ic_top_or1200_ic_tag_tag = or1200_ic_top_or1200_ic_tag_ic_tag0_doq[19:1];

  //assertion( or1200_ic_top_or1200_ic_tag_tag = Extract(19, 1, or1200_ic_top_or1200_ic_tag_ic_tag0_doq)) 111
    assign or1200_ic_top_or1200_ic_tag_tag_v = or1200_ic_top_or1200_ic_tag_ic_tag0_doq[0];

  //assertion( or1200_ic_top_or1200_ic_tag_tag_v = Extract(0, 0, or1200_ic_top_or1200_ic_tag_ic_tag0_doq)) 112
    assign or1200_ic_top_or1200_ic_tag_datain = {or1200_ic_top_ic_addr[31:13], or1200_ic_top_ictag_v};

  //assertion( or1200_ic_top_or1200_ic_tag_datain = Concat(Extract(31, 13, or1200_ic_top_ic_addr), or1200_ic_top_ictag_v)) 113
    assign or1200_ic_top_spr_cs = spr_cs[4];

  //assertion( or1200_ic_top_spr_cs = Extract(4, 4, spr_cs)) 114
    assign or1200_cpu_dc_en = or1200_cpu_sr[3];

  //assertion( or1200_cpu_dc_en = Extract(3, 3, or1200_cpu_sr)) 115
    assign or1200_cpu_ic_en = or1200_cpu_sr[4];

  //assertion( or1200_cpu_ic_en = Extract(4, 4, or1200_cpu_sr)) 116
    assign or1200_cpu_dmmu_en = or1200_cpu_sr[5];

  //assertion( or1200_cpu_dmmu_en = Extract(5, 5, or1200_cpu_sr)) 117
    assign or1200_cpu_supv = or1200_cpu_sr[0];

  //assertion( or1200_cpu_supv = Extract(0, 0, or1200_cpu_sr)) 118
    assign or1200_cpu_sig_range = or1200_cpu_sr[11];

  //assertion( or1200_cpu_sig_range = Extract(11, 11, or1200_cpu_sr)) 119
    assign or1200_cpu_or1200_genpc_icpu_adr_o = (((((~|or1200_cpu_or1200_genpc_no_more_dslot & ~|or1200_cpu_or1200_genpc_except_start) & ~|or1200_cpu_or1200_genpc_spr_pc_we) & ~|or1200_cpu_or1200_genpc_du_flush_pipe) & (or1200_cpu_or1200_genpc_icpu_rty_i | or1200_cpu_or1200_genpc_genpc_refetch)) ? or1200_cpu_or1200_genpc_icpu_adr_i : {or1200_cpu_or1200_genpc_pc[31:2], 1'b0, (or1200_cpu_or1200_genpc_ex_branch_taken | or1200_cpu_or1200_genpc_spr_pc_we)});

  //assertion( or1200_cpu_or1200_genpc_icpu_adr_o = If((1 == ~bvredor(or1200_cpu_or1200_genpc_no_more_dslot) & ~bvredor(or1200_cpu_or1200_genpc_except_start) & ~bvredor(or1200_cpu_or1200_genpc_spr_pc_we) & ~bvredor(or1200_cpu_or1200_genpc_du_flush_pipe) & (or1200_cpu_or1200_genpc_icpu_rty_i | or1200_cpu_or1200_genpc_genpc_refetch)) == True, or1200_cpu_or1200_genpc_icpu_adr_i, Concat(Concat(Extract(31, 2, or1200_cpu_or1200_genpc_pc), 0), or1200_cpu_or1200_genpc_ex_branch_taken | or1200_cpu_or1200_genpc_spr_pc_we))) 120
    assign or1200_cpu_or1200_genpc_except_prefix = or1200_cpu_sr[14];

  //assertion( or1200_cpu_or1200_genpc_except_prefix = Extract(14, 14, or1200_cpu_sr)) 121
    assign or1200_cpu_or1200_if_if_bypass = (or1200_cpu_or1200_if_icpu_adr_i[0] ? 1'b0 : (or1200_cpu_or1200_if_if_bypass_reg | or1200_cpu_or1200_if_if_flushpipe));

  //assertion( or1200_cpu_or1200_if_if_bypass = If((1 == Extract(0, 0, or1200_cpu_or1200_if_icpu_adr_i)) == True, 0, or1200_cpu_or1200_if_if_bypass_reg | or1200_cpu_or1200_if_if_flushpipe)) 122
    assign or1200_cpu_or1200_if_if_insn = (((or1200_cpu_or1200_if_no_more_dslot | or1200_cpu_or1200_if_rfe) | or1200_cpu_or1200_if_if_bypass) ? 32'h14410000 : (or1200_cpu_or1200_if_saved ? or1200_cpu_or1200_if_insn_saved : (or1200_cpu_or1200_if_icpu_ack_i ? or1200_cpu_or1200_if_icpu_dat_i : 32'h14610000)));

  //assertion( or1200_cpu_or1200_if_if_insn = If((1 == or1200_cpu_or1200_if_no_more_dslot | or1200_cpu_or1200_if_rfe | or1200_cpu_or1200_if_if_bypass) == True, 339804160, If(0 != or1200_cpu_or1200_if_saved == True, or1200_cpu_or1200_if_insn_saved, If(0 != or1200_cpu_or1200_if_icpu_ack_i == True, or1200_cpu_or1200_if_icpu_dat_i, 341901312)))) 123
    assign or1200_cpu_or1200_if_if_pc = (or1200_cpu_or1200_if_saved ? or1200_cpu_or1200_if_addr_saved : {or1200_cpu_or1200_if_icpu_adr_i[31:2], 2'h0});

  //assertion( or1200_cpu_or1200_if_if_pc = If(0 != or1200_cpu_or1200_if_saved == True, or1200_cpu_or1200_if_addr_saved, Concat(Extract(31, 2, or1200_cpu_or1200_if_icpu_adr_i), 0))) 124
    assign or1200_cpu_or1200_if_except_itlbmiss = (or1200_cpu_or1200_if_no_more_dslot ? 1'b0 : (or1200_cpu_or1200_if_saved ? or1200_cpu_or1200_if_err_saved[0] : (or1200_cpu_or1200_if_icpu_err_i & (or1200_cpu_or1200_if_icpu_tag_i == 4'hd))));

  //assertion( or1200_cpu_or1200_if_except_itlbmiss = If(0 != or1200_cpu_or1200_if_no_more_dslot == True, 0, If(0 != or1200_cpu_or1200_if_saved == True, Extract(0, 0, or1200_cpu_or1200_if_err_saved), or1200_cpu_or1200_if_icpu_err_i & If((13 == or1200_cpu_or1200_if_icpu_tag_i) == True, 1, 0)))) 125
    assign or1200_cpu_or1200_if_except_immufault = (or1200_cpu_or1200_if_no_more_dslot ? 1'b0 : (or1200_cpu_or1200_if_saved ? or1200_cpu_or1200_if_err_saved[1] : (or1200_cpu_or1200_if_icpu_err_i & (or1200_cpu_or1200_if_icpu_tag_i == 4'hc))));

  //assertion( or1200_cpu_or1200_if_except_immufault = If(0 != or1200_cpu_or1200_if_no_more_dslot == True, 0, If(0 != or1200_cpu_or1200_if_saved == True, Extract(1, 1, or1200_cpu_or1200_if_err_saved), or1200_cpu_or1200_if_icpu_err_i & If((12 == or1200_cpu_or1200_if_icpu_tag_i) == True, 1, 0)))) 126
    assign or1200_cpu_or1200_if_except_ibuserr = (or1200_cpu_or1200_if_no_more_dslot ? 1'b0 : (or1200_cpu_or1200_if_saved ? or1200_cpu_or1200_if_err_saved[2] : (or1200_cpu_or1200_if_icpu_err_i & (or1200_cpu_or1200_if_icpu_tag_i == 4'hb))));

  //assertion( or1200_cpu_or1200_if_except_ibuserr = If(0 != or1200_cpu_or1200_if_no_more_dslot == True, 0, If(0 != or1200_cpu_or1200_if_saved == True, Extract(2, 2, or1200_cpu_or1200_if_err_saved), or1200_cpu_or1200_if_icpu_err_i & If((11 == or1200_cpu_or1200_if_icpu_tag_i) == True, 1, 0)))) 127
    assign or1200_cpu_or1200_ctrl_rf_addra = or1200_cpu_or1200_ctrl_if_insn[20:16];

  //assertion( or1200_cpu_or1200_ctrl_rf_addra = Extract(20, 16, or1200_cpu_or1200_ctrl_if_insn)) 128
    assign or1200_cpu_or1200_ctrl_rf_addrb = or1200_cpu_or1200_ctrl_if_insn[15:11];

  //assertion( or1200_cpu_or1200_ctrl_rf_addrb = Extract(15, 11, or1200_cpu_or1200_ctrl_if_insn)) 129
    assign or1200_cpu_or1200_ctrl_rf_rdb = or1200_cpu_or1200_ctrl_if_insn[30];

  //assertion( or1200_cpu_or1200_ctrl_rf_rdb = Extract(30, 30, or1200_cpu_or1200_ctrl_if_insn)) 130
    assign or1200_cpu_or1200_ctrl_id_branch_addrtarget = ({{ 4{ or1200_cpu_or1200_ctrl_id_insn[25] } }, or1200_cpu_or1200_ctrl_id_insn[25:0]} + or1200_cpu_or1200_ctrl_id_pc[31:2]);

  //assertion( or1200_cpu_or1200_ctrl_id_branch_addrtarget = Concat(Concat(Concat(Concat(Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 0, or1200_cpu_or1200_ctrl_id_insn)) + Extract(31, 2, or1200_cpu_or1200_ctrl_id_pc)) 131
    assign or1200_cpu_or1200_ctrl_cust5_op = or1200_cpu_or1200_ctrl_ex_insn[4:0];

  //assertion( or1200_cpu_or1200_ctrl_cust5_op = Extract(4, 0, or1200_cpu_or1200_ctrl_ex_insn)) 132
    assign or1200_cpu_or1200_ctrl_cust5_limm = or1200_cpu_or1200_ctrl_ex_insn[10:5];

  //assertion( or1200_cpu_or1200_ctrl_cust5_limm = Extract(10, 5, or1200_cpu_or1200_ctrl_ex_insn)) 133
    assign or1200_cpu_or1200_rf_rf_addra = ((or1200_cpu_or1200_rf_spr_valid & ~|or1200_cpu_or1200_rf_spr_write) ? or1200_cpu_or1200_rf_spr_addr[4:0] : (or1200_cpu_or1200_rf_spr_cs_fe ? or1200_cpu_or1200_rf_addra_last : or1200_cpu_or1200_rf_addra));

  //assertion( or1200_cpu_or1200_rf_rf_addra = If((1 == or1200_cpu_or1200_rf_spr_valid & ~bvredor(or1200_cpu_or1200_rf_spr_write)) == True, Extract(4, 0, or1200_cpu_or1200_rf_spr_addr), If(0 != or1200_cpu_or1200_rf_spr_cs_fe == True, or1200_cpu_or1200_rf_addra_last, or1200_cpu_or1200_rf_addra))) 134
    assign or1200_cpu_or1200_rf_rf_addrw = ((or1200_cpu_or1200_rf_spr_valid & or1200_cpu_or1200_rf_spr_write) ? or1200_cpu_or1200_rf_spr_addr[4:0] : or1200_cpu_or1200_rf_addrw);

  //assertion( or1200_cpu_or1200_rf_rf_addrw = If((1 == or1200_cpu_or1200_rf_spr_valid & or1200_cpu_or1200_rf_spr_write) == True, Extract(4, 0, or1200_cpu_or1200_rf_spr_addr), or1200_cpu_or1200_rf_addrw)) 135
    assign or1200_cpu_or1200_rf_rf_dataw = ((or1200_cpu_or1200_rf_spr_valid & or1200_cpu_or1200_rf_spr_write) ? or1200_cpu_or1200_rf_spr_dat_i : or1200_cpu_or1200_rf_dataw);

  //assertion( or1200_cpu_or1200_rf_rf_dataw = If((1 == or1200_cpu_or1200_rf_spr_valid & or1200_cpu_or1200_rf_spr_write) == True, or1200_cpu_or1200_rf_spr_dat_i, or1200_cpu_or1200_rf_dataw)) 136
    assign or1200_cpu_or1200_rf_supv = or1200_cpu_sr[0];

  //assertion( or1200_cpu_or1200_rf_supv = Extract(0, 0, or1200_cpu_sr)) 137
    assign or1200_cpu_or1200_rf_we = or1200_cpu_rfwb_op[0];

  //assertion( or1200_cpu_or1200_rf_we = Extract(0, 0, or1200_cpu_rfwb_op)) 138
    assign or1200_cpu_or1200_rf_spr_cs = or1200_cpu_spr_cs[0];

  //assertion( or1200_cpu_or1200_rf_spr_cs = Extract(0, 0, or1200_cpu_spr_cs)) 139
    assign or1200_cpu_or1200_alu_comp_a = {(or1200_cpu_or1200_alu_a[31] ^ or1200_cpu_or1200_alu_comp_op[3]), or1200_cpu_or1200_alu_a[30:0]};

  //assertion( or1200_cpu_or1200_alu_comp_a = Concat(Extract(31, 31, or1200_cpu_or1200_alu_a) ^ Extract(3, 3, or1200_cpu_or1200_alu_comp_op), Extract(30, 0, or1200_cpu_or1200_alu_a))) 140
    assign or1200_cpu_or1200_alu_comp_b = {(or1200_cpu_or1200_alu_b[31] ^ or1200_cpu_or1200_alu_comp_op[3]), or1200_cpu_or1200_alu_b[30:0]};

  //assertion( or1200_cpu_or1200_alu_comp_b = Concat(Extract(31, 31, or1200_cpu_or1200_alu_b) ^ Extract(3, 3, or1200_cpu_or1200_alu_comp_op), Extract(30, 0, or1200_cpu_or1200_alu_b))) 141
    assign or1200_cpu_or1200_alu_a_eq_b = ~|(|or1200_cpu_or1200_alu_result_sum);

  //assertion( or1200_cpu_or1200_alu_a_eq_b = ~bvredor(bvredor(or1200_cpu_or1200_alu_result_sum))) 142
    assign or1200_cpu_or1200_alu_a_lt_b = (or1200_cpu_or1200_alu_comp_op[3] ? (((or1200_cpu_or1200_alu_a[31] & ~|or1200_cpu_or1200_alu_b[31]) | ((~|or1200_cpu_or1200_alu_a[31] & ~|or1200_cpu_or1200_alu_b[31]) & or1200_cpu_or1200_alu_result_sum[31])) | ((or1200_cpu_or1200_alu_a[31] & or1200_cpu_or1200_alu_b[31]) & or1200_cpu_or1200_alu_result_sum[31])) : (or1200_cpu_or1200_alu_b > or1200_cpu_or1200_alu_a));

  //assertion( or1200_cpu_or1200_alu_a_lt_b = If((1 == Extract(3, 3, or1200_cpu_or1200_alu_comp_op)) == True, Extract(31, 31, or1200_cpu_or1200_alu_a) & ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_b)) | ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_a)) & ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_b)) & Extract(31, 31, or1200_cpu_or1200_alu_result_sum) | Extract(31, 31, or1200_cpu_or1200_alu_a) & Extract(31, 31, or1200_cpu_or1200_alu_b) & Extract(31, 31, or1200_cpu_or1200_alu_result_sum), If(UGT(or1200_cpu_or1200_alu_b, or1200_cpu_or1200_alu_a) == True, 1, 0))) 143
    assign or1200_cpu_or1200_alu_carry_in = ((or1200_cpu_or1200_alu_alu_op == 5'h01) ? {31'h00000000, or1200_cpu_or1200_alu_carry} : 32'h00000000);

  //assertion( or1200_cpu_or1200_alu_carry_in = If((1 == or1200_cpu_or1200_alu_alu_op) == True, Concat(0, or1200_cpu_or1200_alu_carry), 0)) 144
    assign or1200_cpu_or1200_alu_b_mux = (((or1200_cpu_or1200_alu_alu_op == 5'h02) | (or1200_cpu_or1200_alu_alu_op == 5'h10)) ? ((~or1200_cpu_or1200_alu_b) + 32'h00000001) : or1200_cpu_or1200_alu_b);

  //assertion( or1200_cpu_or1200_alu_b_mux = If((1 == If((2 == or1200_cpu_or1200_alu_alu_op) == True, 1, 0) | If((16 == or1200_cpu_or1200_alu_alu_op) == True, 1, 0)) == True, ~or1200_cpu_or1200_alu_b + 1, or1200_cpu_or1200_alu_b)) 145
    assign or1200_cpu_or1200_alu_cy_sum = ((({1'b0, or1200_cpu_or1200_alu_a} + {1'b0, or1200_cpu_or1200_alu_b_mux}) + {1'b0, or1200_cpu_or1200_alu_carry_in}) >> 32);

  //assertion( or1200_cpu_or1200_alu_cy_sum = Concat(0, or1200_cpu_or1200_alu_a) + Concat(0, or1200_cpu_or1200_alu_b_mux) + Concat(0, or1200_cpu_or1200_alu_carry_in) >> ZeroExt(27, 32)) 146
    assign or1200_cpu_or1200_alu_result_sum = (({1'b0, or1200_cpu_or1200_alu_a} + {1'b0, or1200_cpu_or1200_alu_b_mux}) + {1'b0, or1200_cpu_or1200_alu_carry_in});

  //assertion( or1200_cpu_or1200_alu_result_sum = Concat(0, or1200_cpu_or1200_alu_a) + Concat(0, or1200_cpu_or1200_alu_b_mux) + Concat(0, or1200_cpu_or1200_alu_carry_in)) 147
    assign or1200_cpu_or1200_fpu_spr_cs = or1200_cpu_spr_cs[11];

  //assertion( or1200_cpu_or1200_fpu_spr_cs = Extract(11, 11, or1200_cpu_spr_cs)) 148
    assign or1200_cpu_or1200_mult_mac_alu_op_smul = (or1200_cpu_or1200_mult_mac_alu_op == 5'h06);

  //assertion( or1200_cpu_or1200_mult_mac_alu_op_smul = 6 == or1200_cpu_or1200_mult_mac_alu_op) 149
    assign or1200_cpu_or1200_mult_mac_alu_op_umul = (or1200_cpu_or1200_mult_mac_alu_op == 5'h0b);

  //assertion( or1200_cpu_or1200_mult_mac_alu_op_umul = 11 == or1200_cpu_or1200_mult_mac_alu_op) 150
    assign or1200_cpu_or1200_mult_mac_alu_op_sdiv = (or1200_cpu_or1200_mult_mac_alu_op == 5'h09);

  //assertion( or1200_cpu_or1200_mult_mac_alu_op_sdiv = 9 == or1200_cpu_or1200_mult_mac_alu_op) 151
    assign or1200_cpu_or1200_mult_mac_alu_op_udiv = (or1200_cpu_or1200_mult_mac_alu_op == 5'h0a);

  //assertion( or1200_cpu_or1200_mult_mac_alu_op_udiv = 10 == or1200_cpu_or1200_mult_mac_alu_op) 152
    assign or1200_cpu_or1200_mult_mac_x = (((or1200_cpu_or1200_mult_mac_alu_op_sdiv | or1200_cpu_or1200_mult_mac_alu_op_smul) & or1200_cpu_or1200_mult_mac_a[31]) ? ((~or1200_cpu_or1200_mult_mac_a) + 32'h00000001) : (((or1200_cpu_or1200_mult_mac_alu_op_div | or1200_cpu_or1200_mult_mac_alu_op_mul) | (|or1200_cpu_or1200_mult_mac_mac_op)) ? or1200_cpu_or1200_mult_mac_a : 32'h00000000));

  //assertion( or1200_cpu_or1200_mult_mac_x = If((1 == (or1200_cpu_or1200_mult_mac_alu_op_sdiv | or1200_cpu_or1200_mult_mac_alu_op_smul) & Extract(31, 31, or1200_cpu_or1200_mult_mac_a)) == True, ~or1200_cpu_or1200_mult_mac_a + 1, If((1 == or1200_cpu_or1200_mult_mac_alu_op_div | or1200_cpu_or1200_mult_mac_alu_op_mul | bvredor(or1200_cpu_or1200_mult_mac_mac_op)) == True, or1200_cpu_or1200_mult_mac_a, 0))) 153
    assign or1200_cpu_or1200_mult_mac_y = (((or1200_cpu_or1200_mult_mac_alu_op_sdiv | or1200_cpu_or1200_mult_mac_alu_op_smul) & or1200_cpu_or1200_mult_mac_b[31]) ? ((~or1200_cpu_or1200_mult_mac_b) + 32'h00000001) : (((or1200_cpu_or1200_mult_mac_alu_op_div | or1200_cpu_or1200_mult_mac_alu_op_mul) | (|or1200_cpu_or1200_mult_mac_mac_op)) ? or1200_cpu_or1200_mult_mac_b : 32'h00000000));

  //assertion( or1200_cpu_or1200_mult_mac_y = If((1 == (or1200_cpu_or1200_mult_mac_alu_op_sdiv | or1200_cpu_or1200_mult_mac_alu_op_smul) & Extract(31, 31, or1200_cpu_or1200_mult_mac_b)) == True, ~or1200_cpu_or1200_mult_mac_b + 1, If((1 == or1200_cpu_or1200_mult_mac_alu_op_div | or1200_cpu_or1200_mult_mac_alu_op_mul | bvredor(or1200_cpu_or1200_mult_mac_mac_op)) == True, or1200_cpu_or1200_mult_mac_b, 0))) 154
    assign or1200_cpu_or1200_mult_mac_div_tmp = (or1200_cpu_or1200_mult_mac_div_quot_r[63:32] - or1200_cpu_or1200_mult_mac_y);

  //assertion( or1200_cpu_or1200_mult_mac_div_tmp = Extract(63, 32, or1200_cpu_or1200_mult_mac_div_quot_r) - or1200_cpu_or1200_mult_mac_y) 155
    assign or1200_cpu_or1200_mult_mac_spr_cs = or1200_cpu_spr_cs[5];

  //assertion( or1200_cpu_or1200_mult_mac_spr_cs = Extract(5, 5, or1200_cpu_spr_cs)) 156
    assign or1200_cpu_or1200_sprs_spr_addr = (or1200_cpu_or1200_sprs_du_access ? or1200_cpu_or1200_sprs_du_addr : (or1200_cpu_or1200_sprs_addrbase | {16'h0000, or1200_cpu_or1200_sprs_addrofs}));

  //assertion( or1200_cpu_or1200_sprs_spr_addr = If(0 != or1200_cpu_or1200_sprs_du_access == True, or1200_cpu_or1200_sprs_du_addr, or1200_cpu_or1200_sprs_addrbase | Concat(0, or1200_cpu_or1200_sprs_addrofs))) 157
    assign or1200_cpu_or1200_sprs_spr_dat_o = (or1200_cpu_or1200_sprs_du_write ? or1200_cpu_or1200_sprs_du_dat_du : or1200_cpu_or1200_sprs_dat_i);

  //assertion( or1200_cpu_or1200_sprs_spr_dat_o = If(0 != or1200_cpu_or1200_sprs_du_write == True, or1200_cpu_or1200_sprs_du_dat_du, or1200_cpu_or1200_sprs_dat_i)) 158
    assign or1200_cpu_or1200_sprs_du_dat_cpu = (or1200_cpu_or1200_sprs_du_read ? or1200_cpu_or1200_sprs_to_wbmux : (or1200_cpu_or1200_sprs_du_write ? or1200_cpu_or1200_sprs_du_dat_du : or1200_cpu_or1200_sprs_dat_i));

  //assertion( or1200_cpu_or1200_sprs_du_dat_cpu = If(0 != or1200_cpu_or1200_sprs_du_read == True, or1200_cpu_or1200_sprs_to_wbmux, If(0 != or1200_cpu_or1200_sprs_du_write == True, or1200_cpu_or1200_sprs_du_dat_du, or1200_cpu_or1200_sprs_dat_i))) 159
    assign or1200_cpu_or1200_sprs_to_sr[15:12] = (or1200_cpu_or1200_sprs_except_started ? {or1200_cpu_or1200_sprs_sr[15:14], or1200_cpu_or1200_sprs_dsx, 1'b0} : ((or1200_cpu_or1200_sprs_branch_op == 3'h6) ? or1200_cpu_or1200_sprs_esr[15:12] : ((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) ? {1'b1, or1200_cpu_or1200_sprs_spr_dat_o[14:12]} : or1200_cpu_or1200_sprs_sr[15:12])));

  //assertion( Extract(15, 12, or1200_cpu_or1200_sprs_to_sr) = If(0 != or1200_cpu_or1200_sprs_except_started == True, Concat(Concat(Extract(15, 14, or1200_cpu_or1200_sprs_sr), or1200_cpu_or1200_sprs_dsx), 0), If((6 == or1200_cpu_or1200_sprs_branch_op) == True, Extract(15, 12, or1200_cpu_or1200_sprs_esr), If((1 == or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) == True, Concat(1, Extract(14, 12, or1200_cpu_or1200_sprs_spr_dat_o)), Extract(15, 12, or1200_cpu_or1200_sprs_sr))))) 160
    assign or1200_cpu_or1200_sprs_to_sr[16] = (or1200_cpu_or1200_sprs_except_started ? 1'b1 : ((or1200_cpu_or1200_sprs_branch_op == 3'h6) ? or1200_cpu_or1200_sprs_esr[16] : ((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) ? or1200_cpu_or1200_sprs_spr_dat_o[16] : or1200_cpu_or1200_sprs_sr[16])));

  //assertion( Extract(16, 16, or1200_cpu_or1200_sprs_to_sr) = If(0 != or1200_cpu_or1200_sprs_except_started == True, 1, If((6 == or1200_cpu_or1200_sprs_branch_op) == True, Extract(16, 16, or1200_cpu_or1200_sprs_esr), If((1 == or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) == True, Extract(16, 16, or1200_cpu_or1200_sprs_spr_dat_o), Extract(16, 16, or1200_cpu_or1200_sprs_sr))))) 161
    assign or1200_cpu_or1200_sprs_to_sr[11] = (or1200_cpu_or1200_sprs_except_started ? or1200_cpu_or1200_sprs_sr[11] : ((or1200_cpu_or1200_sprs_branch_op == 3'h6) ? or1200_cpu_or1200_sprs_esr[11] : (or1200_cpu_or1200_sprs_ov_we ? or1200_cpu_or1200_sprs_ovforw : ((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) ? or1200_cpu_or1200_sprs_spr_dat_o[11] : or1200_cpu_or1200_sprs_sr[11]))));

  //assertion( Extract(11, 11, or1200_cpu_or1200_sprs_to_sr) = If(0 != or1200_cpu_or1200_sprs_except_started == True, Extract(11, 11, or1200_cpu_or1200_sprs_sr), If((6 == or1200_cpu_or1200_sprs_branch_op) == True, Extract(11, 11, or1200_cpu_or1200_sprs_esr), If(0 != or1200_cpu_or1200_sprs_ov_we == True, or1200_cpu_or1200_sprs_ovforw, If((1 == or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) == True, Extract(11, 11, or1200_cpu_or1200_sprs_spr_dat_o), Extract(11, 11, or1200_cpu_or1200_sprs_sr)))))) 162
    assign or1200_cpu_or1200_sprs_to_sr[10] = (or1200_cpu_or1200_sprs_except_started ? or1200_cpu_or1200_sprs_sr[10] : ((or1200_cpu_or1200_sprs_branch_op == 3'h6) ? or1200_cpu_or1200_sprs_esr[10] : (or1200_cpu_or1200_sprs_cy_we ? or1200_cpu_or1200_sprs_cyforw : ((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) ? or1200_cpu_or1200_sprs_spr_dat_o[10] : or1200_cpu_or1200_sprs_sr[10]))));

  //assertion( Extract(10, 10, or1200_cpu_or1200_sprs_to_sr) = If(0 != or1200_cpu_or1200_sprs_except_started == True, Extract(10, 10, or1200_cpu_or1200_sprs_sr), If((6 == or1200_cpu_or1200_sprs_branch_op) == True, Extract(10, 10, or1200_cpu_or1200_sprs_esr), If(0 != or1200_cpu_or1200_sprs_cy_we == True, or1200_cpu_or1200_sprs_cyforw, If((1 == or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) == True, Extract(10, 10, or1200_cpu_or1200_sprs_spr_dat_o), Extract(10, 10, or1200_cpu_or1200_sprs_sr)))))) 163
    assign or1200_cpu_or1200_sprs_to_sr[9] = (or1200_cpu_or1200_sprs_except_started ? or1200_cpu_or1200_sprs_sr[9] : ((or1200_cpu_or1200_sprs_branch_op == 3'h6) ? or1200_cpu_or1200_sprs_esr[9] : (or1200_cpu_or1200_sprs_flag_we ? or1200_cpu_or1200_sprs_flagforw : ((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) ? or1200_cpu_or1200_sprs_spr_dat_o[9] : or1200_cpu_or1200_sprs_sr[9]))));

  //assertion( Extract(9, 9, or1200_cpu_or1200_sprs_to_sr) = If(0 != or1200_cpu_or1200_sprs_except_started == True, Extract(9, 9, or1200_cpu_or1200_sprs_sr), If((6 == or1200_cpu_or1200_sprs_branch_op) == True, Extract(9, 9, or1200_cpu_or1200_sprs_esr), If(0 != or1200_cpu_or1200_sprs_flag_we == True, or1200_cpu_or1200_sprs_flagforw, If((1 == or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) == True, Extract(9, 9, or1200_cpu_or1200_sprs_spr_dat_o), Extract(9, 9, or1200_cpu_or1200_sprs_sr)))))) 164
    assign or1200_cpu_or1200_sprs_to_sr[8:0] = (or1200_cpu_or1200_sprs_except_started ? {or1200_cpu_or1200_sprs_sr[8:7], 2'h0, or1200_cpu_or1200_sprs_sr[4:3], 3'h1} : ((or1200_cpu_or1200_sprs_branch_op == 3'h6) ? or1200_cpu_or1200_sprs_esr[8:0] : ((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) ? or1200_cpu_or1200_sprs_spr_dat_o[8:0] : or1200_cpu_or1200_sprs_sr[8:0])));

  //assertion( Extract(8, 0, or1200_cpu_or1200_sprs_to_sr) = If(0 != or1200_cpu_or1200_sprs_except_started == True, Concat(Concat(Concat(Extract(8, 7, or1200_cpu_or1200_sprs_sr), 0), Extract(4, 3, or1200_cpu_or1200_sprs_sr)), 1), If((6 == or1200_cpu_or1200_sprs_branch_op) == True, Extract(8, 0, or1200_cpu_or1200_sprs_esr), If((1 == or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) == True, Extract(8, 0, or1200_cpu_or1200_sprs_spr_dat_o), Extract(8, 0, or1200_cpu_or1200_sprs_sr))))) 165
    assign or1200_cpu_or1200_sprs_flag = or1200_cpu_or1200_sprs_sr[9];

  //assertion( or1200_cpu_or1200_sprs_flag = Extract(9, 9, or1200_cpu_or1200_sprs_sr)) 166
    assign or1200_cpu_or1200_sprs_carry = or1200_cpu_or1200_sprs_sr[10];

  //assertion( or1200_cpu_or1200_sprs_carry = Extract(10, 10, or1200_cpu_or1200_sprs_sr)) 167
    assign or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed = (or1200_cpu_or1200_sprs_sr_reg_bit_eph_select ? or1200_cpu_or1200_sprs_boot_adr_sel_i : or1200_cpu_or1200_sprs_sr_reg_bit_eph);

  //assertion( or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed = If(0 != or1200_cpu_or1200_sprs_sr_reg_bit_eph_select == True, or1200_cpu_or1200_sprs_boot_adr_sel_i, or1200_cpu_or1200_sprs_sr_reg_bit_eph)) 168
    assign or1200_cpu_or1200_sprs_addrofs = or1200_cpu_ex_simm[15:0];

  //assertion( or1200_cpu_or1200_sprs_addrofs = Extract(15, 0, or1200_cpu_ex_simm)) 169
    assign or1200_cpu_or1200_lsu_id_precalc_sum = ({1'b0, or1200_cpu_or1200_lsu_id_addrbase[1:0]} + {1'b0, or1200_cpu_or1200_lsu_id_addrofs[1:0]});

  //assertion( or1200_cpu_or1200_lsu_id_precalc_sum = Concat(0, Extract(1, 0, or1200_cpu_or1200_lsu_id_addrbase)) + Concat(0, Extract(1, 0, or1200_cpu_or1200_lsu_id_addrofs))) 170
    assign or1200_cpu_or1200_lsu_dcpu_adr_o[31:2] = (or1200_cpu_or1200_lsu_ex_addrbase[31:2] + (or1200_cpu_or1200_lsu_ex_addrofs[31:2] + {29'h00000000, or1200_cpu_or1200_lsu_dcpu_adr_r[2]}));

  //assertion( Extract(31, 2, or1200_cpu_or1200_lsu_dcpu_adr_o) = Extract(31, 2, or1200_cpu_or1200_lsu_ex_addrbase) + Extract(31, 2, or1200_cpu_or1200_lsu_ex_addrofs) + Concat(0, Extract(2, 2, or1200_cpu_or1200_lsu_dcpu_adr_r))) 171
    assign or1200_cpu_or1200_lsu_dcpu_adr_o[1:0] = or1200_cpu_or1200_lsu_dcpu_adr_r[1:0];

  //assertion( Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o) = Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_r)) 172
    assign or1200_cpu_or1200_lsu_dcpu_cycstb_o = (((or1200_cpu_or1200_lsu_du_stall | or1200_cpu_or1200_lsu_lsu_unstall) | or1200_cpu_or1200_lsu_except_align) ? 1'b0 : (|or1200_cpu_or1200_lsu_ex_lsu_op));

  //assertion( or1200_cpu_or1200_lsu_dcpu_cycstb_o = If((1 == or1200_cpu_or1200_lsu_du_stall | or1200_cpu_or1200_lsu_lsu_unstall | or1200_cpu_or1200_lsu_except_align) == True, 0, bvredor(or1200_cpu_or1200_lsu_ex_lsu_op))) 173
    assign or1200_cpu_or1200_lsu_dcpu_we_o = or1200_cpu_or1200_lsu_ex_lsu_op[3];

  //assertion( or1200_cpu_or1200_lsu_dcpu_we_o = Extract(3, 3, or1200_cpu_or1200_lsu_ex_lsu_op)) 174
    assign or1200_cpu_or1200_lsu_dcpu_tag_o = (or1200_cpu_or1200_lsu_dcpu_cycstb_o ? 4'h1 : 4'h0);

  //assertion( or1200_cpu_or1200_lsu_dcpu_tag_o = If(0 != or1200_cpu_or1200_lsu_dcpu_cycstb_o == True, 1, 0)) 175
    assign or1200_cpu_or1200_lsu_or1200_mem2reg_addr = or1200_cpu_or1200_lsu_dcpu_adr_o[1:0];

  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_addr = Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) 176
    assign or1200_cpu_or1200_lsu_or1200_reg2mem_memdata = {or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh, or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl, or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh, or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll};

  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata = Concat(Concat(Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh, or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl), or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh), or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll)) 177
    assign or1200_cpu_or1200_lsu_or1200_reg2mem_addr = or1200_cpu_or1200_lsu_dcpu_adr_o[1:0];

  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_addr = Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) 178
    assign or1200_cpu_or1200_freeze_multicycle_freeze = (|or1200_cpu_or1200_freeze_multicycle_cnt);

  //assertion( or1200_cpu_or1200_freeze_multicycle_freeze = bvredor(or1200_cpu_or1200_freeze_multicycle_cnt)) 179
    assign or1200_cpu_or1200_except_dsr_te = (or1200_cpu_or1200_except_ex_freeze_prev ? or1200_cpu_or1200_except_dsr_te_prev : or1200_cpu_or1200_except_du_dsr[13]);

  //assertion( or1200_cpu_or1200_except_dsr_te = If(0 != or1200_cpu_or1200_except_ex_freeze_prev == True, or1200_cpu_or1200_except_dsr_te_prev, Extract(13, 13, or1200_cpu_or1200_except_du_dsr))) 180
    assign or1200_cpu_or1200_except_sr_ted = (or1200_cpu_or1200_except_ex_freeze_prev ? or1200_cpu_or1200_except_sr_ted_prev : or1200_cpu_or1200_except_sr[16]);

  //assertion( or1200_cpu_or1200_except_sr_ted = If(0 != or1200_cpu_or1200_except_ex_freeze_prev == True, or1200_cpu_or1200_except_sr_ted_prev, Extract(16, 16, or1200_cpu_or1200_except_sr))) 181
    assign or1200_cpu_or1200_except_dmr1_st = (or1200_cpu_or1200_except_ex_freeze_prev ? or1200_cpu_or1200_except_dmr1_st_prev : or1200_cpu_or1200_except_du_dmr1[22]);

  //assertion( or1200_cpu_or1200_except_dmr1_st = If(0 != or1200_cpu_or1200_except_ex_freeze_prev == True, or1200_cpu_or1200_except_dmr1_st_prev, Extract(22, 22, or1200_cpu_or1200_except_du_dmr1))) 182
    assign or1200_cpu_or1200_except_dmr1_bt = (or1200_cpu_or1200_except_ex_freeze_prev ? or1200_cpu_or1200_except_dmr1_bt_prev : or1200_cpu_or1200_except_du_dmr1[23]);

  //assertion( or1200_cpu_or1200_except_dmr1_bt = If(0 != or1200_cpu_or1200_except_ex_freeze_prev == True, or1200_cpu_or1200_except_dmr1_bt_prev, Extract(23, 23, or1200_cpu_or1200_except_du_dmr1))) 183
    assign or1200_cpu_or1200_except_spr_dat_npc = (or1200_cpu_or1200_except_ex_void ? or1200_cpu_or1200_except_id_pc : or1200_cpu_or1200_except_ex_pc);

  //assertion( or1200_cpu_or1200_except_spr_dat_npc = If(0 != or1200_cpu_or1200_except_ex_void == True, or1200_cpu_or1200_except_id_pc, or1200_cpu_or1200_except_ex_pc)) 184
    assign or1200_cpu_or1200_except_except_trig = {(or1200_cpu_or1200_except_ex_exceptflags[1] & (~or1200_cpu_or1200_except_du_dsr[9])), (or1200_cpu_or1200_except_ex_exceptflags[0] & (~or1200_cpu_or1200_except_du_dsr[3])), (or1200_cpu_or1200_except_ex_exceptflags[2] & (~or1200_cpu_or1200_except_du_dsr[1])), (or1200_cpu_or1200_except_sig_illegal & (~or1200_cpu_or1200_except_du_dsr[6])), (or1200_cpu_or1200_except_sig_align & (~or1200_cpu_or1200_except_du_dsr[5])), (or1200_cpu_or1200_except_sig_dtlbmiss & (~or1200_cpu_or1200_except_du_dsr[8])), (or1200_cpu_or1200_except_sig_trap & (~or1200_cpu_or1200_except_du_dsr[13])), ((or1200_cpu_or1200_except_sig_syscall & (~or1200_cpu_or1200_except_du_dsr[11])) & (~or1200_cpu_or1200_except_ex_freeze)), (or1200_cpu_or1200_except_sig_dmmufault & (~or1200_cpu_or1200_except_du_dsr[2])), (or1200_cpu_or1200_except_sig_dbuserr & (~or1200_cpu_or1200_except_du_dsr[1])), (or1200_cpu_or1200_except_range_pending & (~or1200_cpu_or1200_except_du_dsr[10])), (or1200_cpu_or1200_except_fp_pending & (~or1200_cpu_or1200_except_du_dsr[12])), (or1200_cpu_or1200_except_int_pending & (~or1200_cpu_or1200_except_du_dsr[7])), (or1200_cpu_or1200_except_tick_pending & (~or1200_cpu_or1200_except_du_dsr[4]))};

  //assertion( or1200_cpu_or1200_except_except_trig = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(1, 1, or1200_cpu_or1200_except_ex_exceptflags) & ~Extract(9, 9, or1200_cpu_or1200_except_du_dsr), Extract(0, 0, or1200_cpu_or1200_except_ex_exceptflags) & ~Extract(3, 3, or1200_cpu_or1200_except_du_dsr)), Extract(2, 2, or1200_cpu_or1200_except_ex_exceptflags) & ~Extract(1, 1, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_illegal & ~Extract(6, 6, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_align & ~Extract(5, 5, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_dtlbmiss & ~Extract(8, 8, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_trap & ~Extract(13, 13, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_syscall & ~Extract(11, 11, or1200_cpu_or1200_except_du_dsr) & ~or1200_cpu_or1200_except_ex_freeze), or1200_cpu_or1200_except_sig_dmmufault & ~Extract(2, 2, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_dbuserr & ~Extract(1, 1, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_range_pending & ~Extract(10, 10, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_fp_pending & ~Extract(12, 12, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_int_pending & ~Extract(7, 7, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_tick_pending & ~Extract(4, 4, or1200_cpu_or1200_except_du_dsr))) 185
    assign or1200_cpu_or1200_except_except_stop = {(or1200_cpu_or1200_except_tick_pending & or1200_cpu_or1200_except_du_dsr[4]), (or1200_cpu_or1200_except_int_pending & or1200_cpu_or1200_except_du_dsr[7]), (or1200_cpu_or1200_except_ex_exceptflags[1] & or1200_cpu_or1200_except_du_dsr[9]), (or1200_cpu_or1200_except_ex_exceptflags[0] & or1200_cpu_or1200_except_du_dsr[3]), (or1200_cpu_or1200_except_ex_exceptflags[2] & or1200_cpu_or1200_except_du_dsr[1]), (or1200_cpu_or1200_except_sig_illegal & or1200_cpu_or1200_except_du_dsr[6]), (or1200_cpu_or1200_except_sig_align & or1200_cpu_or1200_except_du_dsr[5]), (or1200_cpu_or1200_except_sig_dtlbmiss & or1200_cpu_or1200_except_du_dsr[8]), (or1200_cpu_or1200_except_sig_dmmufault & or1200_cpu_or1200_except_du_dsr[2]), (or1200_cpu_or1200_except_sig_dbuserr & or1200_cpu_or1200_except_du_dsr[1]), (or1200_cpu_or1200_except_range_pending & or1200_cpu_or1200_except_du_dsr[10]), (or1200_cpu_or1200_except_sig_trap & or1200_cpu_or1200_except_du_dsr[13]), (or1200_cpu_or1200_except_fp_pending & or1200_cpu_or1200_except_du_dsr[12]), ((or1200_cpu_or1200_except_sig_syscall & or1200_cpu_or1200_except_du_dsr[11]) & (~or1200_cpu_or1200_except_ex_freeze))};

  //assertion( or1200_cpu_or1200_except_except_stop = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(or1200_cpu_or1200_except_tick_pending & Extract(4, 4, or1200_cpu_or1200_except_du_dsr), or1200_cpu_or1200_except_int_pending & Extract(7, 7, or1200_cpu_or1200_except_du_dsr)), Extract(1, 1, or1200_cpu_or1200_except_ex_exceptflags) & Extract(9, 9, or1200_cpu_or1200_except_du_dsr)), Extract(0, 0, or1200_cpu_or1200_except_ex_exceptflags) & Extract(3, 3, or1200_cpu_or1200_except_du_dsr)), Extract(2, 2, or1200_cpu_or1200_except_ex_exceptflags) & Extract(1, 1, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_illegal & Extract(6, 6, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_align & Extract(5, 5, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_dtlbmiss & Extract(8, 8, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_dmmufault & Extract(2, 2, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_dbuserr & Extract(1, 1, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_range_pending & Extract(10, 10, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_trap & Extract(13, 13, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_fp_pending & Extract(12, 12, or1200_cpu_or1200_except_du_dsr)), or1200_cpu_or1200_except_sig_syscall & Extract(11, 11, or1200_cpu_or1200_except_du_dsr) & ~or1200_cpu_or1200_except_ex_freeze)) 186
    assign or1200_cpu_or1200_except_fpcsr_fpee = or1200_cpu_fpcsr[0];

  //assertion( or1200_cpu_or1200_except_fpcsr_fpee = Extract(0, 0, or1200_cpu_fpcsr)) 187
    assign or1200_dmmu_top_dcpu_tag_o = (or1200_dmmu_top_miss ? 4'hd : (or1200_dmmu_top_fault ? 4'hc : or1200_dmmu_top_qmemdmmu_tag_i));

  //assertion( or1200_dmmu_top_dcpu_tag_o = If(0 != or1200_dmmu_top_miss == True, 13, If(0 != or1200_dmmu_top_fault == True, 12, or1200_dmmu_top_qmemdmmu_tag_i))) 188
    assign or1200_dmmu_top_qmemdmmu_cycstb_o = ((or1200_dmmu_top_dc_en & or1200_dmmu_top_dmmu_en) ? ((~|(or1200_dmmu_top_miss | or1200_dmmu_top_fault) & or1200_dmmu_top_dtlb_done) & or1200_dmmu_top_dcpu_cycstb_i) : (~|(or1200_dmmu_top_miss | or1200_dmmu_top_fault) & or1200_dmmu_top_dcpu_cycstb_i));

  //assertion( or1200_dmmu_top_qmemdmmu_cycstb_o = If((1 == or1200_dmmu_top_dc_en & or1200_dmmu_top_dmmu_en) == True, ~bvredor(or1200_dmmu_top_miss | or1200_dmmu_top_fault) & or1200_dmmu_top_dtlb_done & or1200_dmmu_top_dcpu_cycstb_i, ~bvredor(or1200_dmmu_top_miss | or1200_dmmu_top_fault) & or1200_dmmu_top_dcpu_cycstb_i)) 189
    assign or1200_dmmu_top_qmemdmmu_ci_o = (or1200_dmmu_top_dmmu_en ? or1200_dmmu_top_dtlb_ci : or1200_dmmu_top_dcpu_adr_i[31]);

  //assertion( or1200_dmmu_top_qmemdmmu_ci_o = If(0 != or1200_dmmu_top_dmmu_en == True, or1200_dmmu_top_dtlb_ci, Extract(31, 31, or1200_dmmu_top_dcpu_adr_i))) 190
    assign or1200_dmmu_top_qmemdmmu_adr_o = (or1200_dmmu_top_dmmu_en ? {or1200_dmmu_top_dtlb_ppn, or1200_dmmu_top_dcpu_adr_i[12:0]} : or1200_dmmu_top_dcpu_adr_i);

  //assertion( or1200_dmmu_top_qmemdmmu_adr_o = If(0 != or1200_dmmu_top_dmmu_en == True, Concat(or1200_dmmu_top_dtlb_ppn, Extract(12, 0, or1200_dmmu_top_dcpu_adr_i)), or1200_dmmu_top_dcpu_adr_i)) 191
    assign or1200_dmmu_top_spr_dat_o = (or1200_dmmu_top_dtlb_spr_access ? or1200_dmmu_top_dtlb_dat_o : 32'h00000000);

  //assertion( or1200_dmmu_top_spr_dat_o = If(0 != or1200_dmmu_top_dtlb_spr_access == True, or1200_dmmu_top_dtlb_dat_o, 0)) 192
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o = (((or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & ~|or1200_dmmu_top_or1200_dmmu_tlb_spr_write) & ~|or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[7]) ? {or1200_dmmu_top_or1200_dmmu_tlb_vpn, or1200_dmmu_top_or1200_dmmu_tlb_tlb_index, 6'h00, 1'b0, 5'h00, or1200_dmmu_top_or1200_dmmu_tlb_v} : (((or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & ~|or1200_dmmu_top_or1200_dmmu_tlb_spr_write) & or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[7]) ? {or1200_dmmu_top_or1200_dmmu_tlb_ppn, 3'h0, or1200_dmmu_top_or1200_dmmu_tlb_swe, or1200_dmmu_top_or1200_dmmu_tlb_sre, or1200_dmmu_top_or1200_dmmu_tlb_uwe, or1200_dmmu_top_or1200_dmmu_tlb_ure, 4'h0, or1200_dmmu_top_or1200_dmmu_tlb_ci, 1'b0} : 32'h00000000));

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o = If((1 == or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & ~bvredor(or1200_dmmu_top_or1200_dmmu_tlb_spr_write) & ~bvredor(Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr))) == True, Concat(Concat(Concat(Concat(Concat(or1200_dmmu_top_or1200_dmmu_tlb_vpn, or1200_dmmu_top_or1200_dmmu_tlb_tlb_index), 0), 0), 0), or1200_dmmu_top_or1200_dmmu_tlb_v), If((1 == or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & ~bvredor(or1200_dmmu_top_or1200_dmmu_tlb_spr_write) & Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr)) == True, Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(or1200_dmmu_top_or1200_dmmu_tlb_ppn, 0), or1200_dmmu_top_or1200_dmmu_tlb_swe), or1200_dmmu_top_or1200_dmmu_tlb_sre), or1200_dmmu_top_or1200_dmmu_tlb_uwe), or1200_dmmu_top_or1200_dmmu_tlb_ure), 0), or1200_dmmu_top_or1200_dmmu_tlb_ci), 0), 0))) 193
    assign or1200_dmmu_top_or1200_dmmu_tlb_vpn = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out[13:1];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_vpn = Extract(13, 1, or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out)) 194
    assign or1200_dmmu_top_or1200_dmmu_tlb_v = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out[0];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_v = Extract(0, 0, or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out)) 195
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in = {or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[31:19], or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[0]};

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in = Concat(Extract(31, 19, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i), Extract(0, 0, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i))) 196
    assign or1200_dmmu_top_or1200_dmmu_tlb_ppn = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out[23:5];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_ppn = Extract(23, 5, or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out)) 197
    assign or1200_dmmu_top_or1200_dmmu_tlb_swe = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out[4];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_swe = Extract(4, 4, or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out)) 198
    assign or1200_dmmu_top_or1200_dmmu_tlb_sre = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out[3];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_sre = Extract(3, 3, or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out)) 199
    assign or1200_dmmu_top_or1200_dmmu_tlb_uwe = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out[2];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_uwe = Extract(2, 2, or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out)) 200
    assign or1200_dmmu_top_or1200_dmmu_tlb_ure = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out[1];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_ure = Extract(1, 1, or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out)) 201
    assign or1200_dmmu_top_or1200_dmmu_tlb_ci = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out[0];

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_ci = Extract(0, 0, or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out)) 202
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in = {or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[31:13], or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[9], or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[8], or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[7], or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[6], or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i[1]};

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in = Concat(Concat(Concat(Concat(Concat(Extract(31, 13, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i), Extract(9, 9, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i)), Extract(8, 8, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i)), Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i)), Extract(6, 6, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i)), Extract(1, 1, or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i))) 203
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_index = (or1200_dmmu_top_or1200_dmmu_tlb_spr_cs ? or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[5:0] : or1200_dmmu_top_or1200_dmmu_tlb_vaddr[18:13]);

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_index = If(0 != or1200_dmmu_top_or1200_dmmu_tlb_spr_cs == True, Extract(5, 0, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr), Extract(18, 13, or1200_dmmu_top_or1200_dmmu_tlb_vaddr))) 204
    assign or1200_dmmu_top_spr_cs = spr_cs[1];

  //assertion( or1200_dmmu_top_spr_cs = Extract(1, 1, spr_cs)) 205
    assign or1200_dc_top_dctag_addr = (or1200_dc_top_dc_block_invalidate ? or1200_dc_top_spr_dat_i[12:4] : or1200_dc_top_dc_addr[12:4]);

  //assertion( or1200_dc_top_dctag_addr = If(0 != or1200_dc_top_dc_block_invalidate == True, Extract(12, 4, or1200_dc_top_spr_dat_i), Extract(12, 4, or1200_dc_top_dc_addr))) 206
    assign or1200_dc_top_dctag_v = (or1200_dc_top_dc_block_invalidate ? 1'b0 : or1200_dc_top_dcfsm_tag_valid);

  //assertion( or1200_dc_top_dctag_v = If(0 != or1200_dc_top_dc_block_invalidate == True, 0, or1200_dc_top_dcfsm_tag_valid)) 207
    assign or1200_dc_top_dctag_dirty = (or1200_dc_top_dc_block_invalidate ? 1'b0 : or1200_dc_top_dcfsm_tag_dirty);

  //assertion( or1200_dc_top_dctag_dirty = If(0 != or1200_dc_top_dc_block_invalidate == True, 0, or1200_dc_top_dcfsm_tag_dirty)) 208
    assign or1200_dc_top_dcsb_dat_o = (or1200_dc_top_dcfsm_biu_do_sel ? or1200_dc_top_from_dcram : or1200_dc_top_dcqmem_dat_i);

  //assertion( or1200_dc_top_dcsb_dat_o = If(0 != or1200_dc_top_dcfsm_biu_do_sel == True, or1200_dc_top_from_dcram, or1200_dc_top_dcqmem_dat_i)) 209
    assign or1200_dc_top_dcsb_cyc_o = (or1200_dc_top_dc_en ? (or1200_dc_top_dcfsm_biu_read | or1200_dc_top_dcfsm_biu_write) : or1200_dc_top_dcqmem_cycstb_i);

  //assertion( or1200_dc_top_dcsb_cyc_o = If(0 != or1200_dc_top_dc_en == True, or1200_dc_top_dcfsm_biu_read | or1200_dc_top_dcfsm_biu_write, or1200_dc_top_dcqmem_cycstb_i)) 210
    assign or1200_dc_top_dcsb_stb_o = (or1200_dc_top_dc_en ? (or1200_dc_top_dcfsm_biu_read | or1200_dc_top_dcfsm_biu_write) : or1200_dc_top_dcqmem_cycstb_i);

  //assertion( or1200_dc_top_dcsb_stb_o = If(0 != or1200_dc_top_dc_en == True, or1200_dc_top_dcfsm_biu_read | or1200_dc_top_dcfsm_biu_write, or1200_dc_top_dcqmem_cycstb_i)) 211
    assign or1200_dc_top_dcsb_we_o = (or1200_dc_top_dc_en ? or1200_dc_top_dcfsm_biu_write : or1200_dc_top_dcqmem_we_i);

  //assertion( or1200_dc_top_dcsb_we_o = If(0 != or1200_dc_top_dc_en == True, or1200_dc_top_dcfsm_biu_write, or1200_dc_top_dcqmem_we_i)) 212
    assign or1200_dc_top_dcsb_sel_o = ((or1200_dc_top_dc_en & or1200_dc_top_dcfsm_burst) ? 4'hf : or1200_dc_top_dcqmem_sel_i);

  //assertion( or1200_dc_top_dcsb_sel_o = If((1 == or1200_dc_top_dc_en & or1200_dc_top_dcfsm_burst) == True, 15, or1200_dc_top_dcqmem_sel_i)) 213
    assign or1200_dc_top_dcqmem_tag_o = (or1200_dc_top_dcqmem_err_o ? 4'hb : or1200_dc_top_dcqmem_tag_i);

  //assertion( or1200_dc_top_dcqmem_tag_o = If(0 != or1200_dc_top_dcqmem_err_o == True, 11, or1200_dc_top_dcqmem_tag_i)) 214
    assign or1200_dc_top_dcqmem_ack_o = (or1200_dc_top_dc_en ? (or1200_dc_top_dcfsm_first_hit_ack | or1200_dc_top_dcfsm_first_miss_ack) : or1200_dc_top_dcsb_ack_i);

  //assertion( or1200_dc_top_dcqmem_ack_o = If(0 != or1200_dc_top_dc_en == True, or1200_dc_top_dcfsm_first_hit_ack | or1200_dc_top_dcfsm_first_miss_ack, or1200_dc_top_dcsb_ack_i)) 215
    assign or1200_dc_top_dcqmem_err_o = (or1200_dc_top_dc_en ? or1200_dc_top_dcfsm_first_miss_err : or1200_dc_top_dcsb_err_i);

  //assertion( or1200_dc_top_dcqmem_err_o = If(0 != or1200_dc_top_dc_en == True, or1200_dc_top_dcfsm_first_miss_err, or1200_dc_top_dcsb_err_i)) 216
    assign or1200_dc_top_to_dcram = (or1200_dc_top_dcfsm_dcram_di_sel ? or1200_dc_top_dcsb_dat_i : or1200_dc_top_dcqmem_dat_i);

  //assertion( or1200_dc_top_to_dcram = If(0 != or1200_dc_top_dcfsm_dcram_di_sel == True, or1200_dc_top_dcsb_dat_i, or1200_dc_top_dcqmem_dat_i)) 217
    assign or1200_dc_top_dcqmem_dat_o = ((or1200_dc_top_dcfsm_first_miss_ack | ~|or1200_dc_top_dc_en) ? or1200_dc_top_dcsb_dat_i : or1200_dc_top_from_dcram);

  //assertion( or1200_dc_top_dcqmem_dat_o = If((1 == or1200_dc_top_dcfsm_first_miss_ack | ~bvredor(or1200_dc_top_dc_en)) == True, or1200_dc_top_dcsb_dat_i, or1200_dc_top_from_dcram)) 218
    assign or1200_dc_top_dcqmem_adr_i_tag = or1200_dc_top_dcqmem_adr_i[31:13];

  //assertion( or1200_dc_top_dcqmem_adr_i_tag = Extract(31, 13, or1200_dc_top_dcqmem_adr_i)) 219
    assign or1200_dc_top_or1200_dc_fsm_next_addr_word = (or1200_dc_top_or1200_dc_fsm_addr_r[3:2] + 2'h1);

  //assertion( or1200_dc_top_or1200_dc_fsm_next_addr_word = Extract(3, 2, or1200_dc_top_or1200_dc_fsm_addr_r) + 1) 220
    assign or1200_dc_top_or1200_dc_fsm_dc_addr = (((or1200_dc_top_or1200_dc_fsm_dc_block_flush & ~|or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush) | (or1200_dc_top_or1200_dc_fsm_dc_block_writeback & ~|or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback)) ? or1200_dc_top_or1200_dc_fsm_spr_dat_i : ((or1200_dc_top_or1200_dc_fsm_state == 3'h5) ? or1200_dc_top_or1200_dc_fsm_addr_r : (((or1200_dc_top_or1200_dc_fsm_state == 3'h0) | or1200_dc_top_or1200_dc_fsm_hitmiss_eval) ? or1200_dc_top_or1200_dc_fsm_lsu_addr : ((((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_biudata_valid) & or1200_dc_top_or1200_dc_fsm_store) ? {or1200_dc_top_or1200_dc_fsm_addr_r[31:4], or1200_dc_top_or1200_dc_fsm_next_addr_word, 2'h0} : or1200_dc_top_or1200_dc_fsm_addr_r))));

  //assertion( or1200_dc_top_or1200_dc_fsm_dc_addr = If((1 == or1200_dc_top_or1200_dc_fsm_dc_block_flush & ~bvredor(or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush) | or1200_dc_top_or1200_dc_fsm_dc_block_writeback & ~bvredor(or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback)) == True, or1200_dc_top_or1200_dc_fsm_spr_dat_i, If((5 == or1200_dc_top_or1200_dc_fsm_state) == True, or1200_dc_top_or1200_dc_fsm_addr_r, If((1 == If((0 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) | or1200_dc_top_or1200_dc_fsm_hitmiss_eval) == True, or1200_dc_top_or1200_dc_fsm_lsu_addr, If((1 == If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_biudata_valid & or1200_dc_top_or1200_dc_fsm_store) == True, Concat(Concat(Extract(31, 4, or1200_dc_top_or1200_dc_fsm_addr_r), or1200_dc_top_or1200_dc_fsm_next_addr_word), 0), or1200_dc_top_or1200_dc_fsm_addr_r))))) 221
    assign or1200_dc_top_or1200_dc_fsm_burst = (or1200_dc_top_or1200_dc_fsm_state == 3'h2);

  //assertion( or1200_dc_top_or1200_dc_fsm_burst = 2 == or1200_dc_top_or1200_dc_fsm_state) 222
    assign or1200_dc_top_or1200_dc_ram_addr = or1200_dc_top_dc_addr[12:2];

  //assertion( or1200_dc_top_or1200_dc_ram_addr = Extract(12, 2, or1200_dc_top_dc_addr)) 223
    assign or1200_dc_top_or1200_dc_tag_tag = or1200_dc_top_or1200_dc_tag_dc_tag0_doq[20:2];

  //assertion( or1200_dc_top_or1200_dc_tag_tag = Extract(20, 2, or1200_dc_top_or1200_dc_tag_dc_tag0_doq)) 224
    assign or1200_dc_top_or1200_dc_tag_tag_v = or1200_dc_top_or1200_dc_tag_dc_tag0_doq[1];

  //assertion( or1200_dc_top_or1200_dc_tag_tag_v = Extract(1, 1, or1200_dc_top_or1200_dc_tag_dc_tag0_doq)) 225
    assign or1200_dc_top_or1200_dc_tag_dirty = or1200_dc_top_or1200_dc_tag_dc_tag0_doq[0];

  //assertion( or1200_dc_top_or1200_dc_tag_dirty = Extract(0, 0, or1200_dc_top_or1200_dc_tag_dc_tag0_doq)) 226
    assign or1200_dc_top_or1200_dc_tag_datain = {or1200_dc_top_dc_addr[31:13], or1200_dc_top_dctag_v, or1200_dc_top_dctag_dirty};

  //assertion( or1200_dc_top_or1200_dc_tag_datain = Concat(Concat(Extract(31, 13, or1200_dc_top_dc_addr), or1200_dc_top_dctag_v), or1200_dc_top_dctag_dirty)) 227
    assign or1200_dc_top_spr_cs = spr_cs[3];

  //assertion( or1200_dc_top_spr_cs = Extract(3, 3, spr_cs)) 228
    assign or1200_du_spr_cs = spr_cs[6];

  //assertion( or1200_du_spr_cs = Extract(6, 6, spr_cs)) 229
    assign or1200_pic_picmr_sel = ((or1200_pic_spr_cs & (or1200_pic_spr_addr[1:0] == 2'h0)) ? 1'b1 : 1'b0);

  //assertion( or1200_pic_picmr_sel = If((1 == or1200_pic_spr_cs & If((0 == Extract(1, 0, or1200_pic_spr_addr)) == True, 1, 0)) == True, 1, 0)) 230
    assign or1200_pic_picsr_sel = ((or1200_pic_spr_cs & (or1200_pic_spr_addr[1:0] == 2'h2)) ? 1'b1 : 1'b0);

  //assertion( or1200_pic_picsr_sel = If((1 == or1200_pic_spr_cs & If((2 == Extract(1, 0, or1200_pic_spr_addr)) == True, 1, 0)) == True, 1, 0)) 231
    assign or1200_pic_intr = (|or1200_pic_um_ints);

  //assertion( or1200_pic_intr = bvredor(or1200_pic_um_ints)) 232
    assign or1200_pic_spr_cs = spr_cs[9];

  //assertion( or1200_pic_spr_cs = Extract(9, 9, spr_cs)) 233
    assign or1200_tt_ttmr_sel = ((or1200_tt_spr_cs & (or1200_tt_spr_addr[0] ^ 1'b0)) ? 1'b1 : 1'b0);

  //assertion( or1200_tt_ttmr_sel = If((1 == or1200_tt_spr_cs & ~(Extract(0, 0, or1200_tt_spr_addr) ^ 0)) == True, 1, 0)) 234
    assign or1200_tt_ttcr_sel = ((or1200_tt_spr_cs & (or1200_tt_spr_addr[0] ^ 1'b1)) ? 1'b1 : 1'b0);

  //assertion( or1200_tt_ttcr_sel = If((1 == or1200_tt_spr_cs & ~(Extract(0, 0, or1200_tt_spr_addr) ^ 1)) == True, 1, 0)) 235
    assign or1200_tt_match = ((or1200_tt_ttmr[27:0] == or1200_tt_ttcr[27:0]) ? 1'b1 : 1'b0);

  //assertion( or1200_tt_match = If((Extract(27, 0, or1200_tt_ttmr) == Extract(27, 0, or1200_tt_ttcr)) == True, 1, 0)) 236
    assign or1200_tt_intr = or1200_tt_ttmr[28];

  //assertion( or1200_tt_intr = Extract(28, 28, or1200_tt_ttmr)) 237
    assign or1200_tt_spr_cs = spr_cs[10];

  //assertion( or1200_tt_spr_cs = Extract(10, 10, spr_cs)) 238
    assign or1200_pm_spr_dat_o[3:0] = 4'h0;

  //assertion( Extract(3, 0, or1200_pm_spr_dat_o) = 0) 239
    assign or1200_pm_spr_dat_o[4] = 1'b0;

  //assertion( Extract(4, 4, or1200_pm_spr_dat_o) = 0) 240
    assign or1200_pm_spr_dat_o[5] = 1'b0;

  //assertion( Extract(5, 5, or1200_pm_spr_dat_o) = 0) 241
    assign or1200_pm_spr_dat_o[6] = 1'b0;

  //assertion( Extract(6, 6, or1200_pm_spr_dat_o) = 0) 242
    assign or1200_pm_spr_dat_o[31:7] = 25'h0000000;

  //assertion( Extract(31, 7, or1200_pm_spr_dat_o) = 0) 243
    assign iwb_biu_wb_dat_o = iwb_biu_biu_dat_i;

  //assertion( iwb_biu_wb_dat_o = iwb_biu_biu_dat_i) 244
    assign iwb_biu_wb_ack = ((iwb_biu_wb_ack_i & ~|iwb_biu_wb_err_i) & ~|iwb_biu_wb_rty_i);

  //assertion( iwb_biu_wb_ack = iwb_biu_wb_ack_i & ~bvredor(iwb_biu_wb_err_i) & ~bvredor(iwb_biu_wb_rty_i)) 245
    assign iwb_biu_biu_stb = (iwb_biu_biu_stb_i & iwb_biu_biu_stb_reg);

  //assertion( iwb_biu_biu_stb = iwb_biu_biu_stb_i & iwb_biu_biu_stb_reg) 246
    assign iwb_biu_biu_dat_o = iwb_biu_wb_dat_i;

  //assertion( iwb_biu_biu_dat_o = iwb_biu_wb_dat_i) 247
    assign iwb_biu_biu_rty = ((((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans) & iwb_biu_wb_rty_i) & iwb_biu_wb_stb_o) & (iwb_biu_wb_rty_cnt ^ iwb_biu_biu_rty_cnt));

  //assertion( iwb_biu_biu_rty = If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans) == True, 1, 0) & iwb_biu_wb_rty_i & iwb_biu_wb_stb_o & ~(iwb_biu_wb_rty_cnt ^ iwb_biu_biu_rty_cnt)) 248
    assign iwb_biu_biu_ack_o = ((((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans) & iwb_biu_wb_ack) & iwb_biu_wb_stb_o) & (iwb_biu_wb_ack_cnt ^ iwb_biu_biu_ack_cnt));

  //assertion( iwb_biu_biu_ack_o = If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans) == True, 1, 0) & iwb_biu_wb_ack & iwb_biu_wb_stb_o & ~(iwb_biu_wb_ack_cnt ^ iwb_biu_biu_ack_cnt)) 249
    assign iwb_biu_biu_err_o = ((((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans) & iwb_biu_wb_err_i) & iwb_biu_wb_stb_o) & (iwb_biu_wb_err_cnt ^ iwb_biu_biu_err_cnt));

  //assertion( iwb_biu_biu_err_o = If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans) == True, 1, 0) & iwb_biu_wb_err_i & iwb_biu_wb_stb_o & ~(iwb_biu_wb_err_cnt ^ iwb_biu_biu_err_cnt)) 250
    assign dwb_biu_wb_dat_o = dwb_biu_biu_dat_i;

  //assertion( dwb_biu_wb_dat_o = dwb_biu_biu_dat_i) 251
    assign dwb_biu_wb_ack = ((dwb_biu_wb_ack_i & ~|dwb_biu_wb_err_i) & ~|dwb_biu_wb_rty_i);

  //assertion( dwb_biu_wb_ack = dwb_biu_wb_ack_i & ~bvredor(dwb_biu_wb_err_i) & ~bvredor(dwb_biu_wb_rty_i)) 252
    assign dwb_biu_biu_stb = (dwb_biu_biu_stb_i & dwb_biu_biu_stb_reg);

  //assertion( dwb_biu_biu_stb = dwb_biu_biu_stb_i & dwb_biu_biu_stb_reg) 253
    assign dwb_biu_biu_dat_o = dwb_biu_wb_dat_i;

  //assertion( dwb_biu_biu_dat_o = dwb_biu_wb_dat_i) 254
    assign dwb_biu_biu_rty = ((((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans) & dwb_biu_wb_rty_i) & dwb_biu_wb_stb_o) & (dwb_biu_wb_rty_cnt ^ dwb_biu_biu_rty_cnt));

  //assertion( dwb_biu_biu_rty = If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans) == True, 1, 0) & dwb_biu_wb_rty_i & dwb_biu_wb_stb_o & ~(dwb_biu_wb_rty_cnt ^ dwb_biu_biu_rty_cnt)) 255
    assign dwb_biu_biu_ack_o = ((((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans) & dwb_biu_wb_ack) & dwb_biu_wb_stb_o) & (dwb_biu_wb_ack_cnt ^ dwb_biu_biu_ack_cnt));

  //assertion( dwb_biu_biu_ack_o = If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans) == True, 1, 0) & dwb_biu_wb_ack & dwb_biu_wb_stb_o & ~(dwb_biu_wb_ack_cnt ^ dwb_biu_biu_ack_cnt)) 256
    assign dwb_biu_biu_err_o = ((((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans) & dwb_biu_wb_err_i) & dwb_biu_wb_stb_o) & (dwb_biu_wb_err_cnt ^ dwb_biu_biu_err_cnt));

  //assertion( dwb_biu_biu_err_o = If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans) == True, 1, 0) & dwb_biu_wb_err_i & dwb_biu_wb_stb_o & ~(dwb_biu_wb_err_cnt ^ dwb_biu_biu_err_cnt)) 257
    assign iwb_biu_clk = clk_i;

  //assertion( iwb_biu_clk = clk_i) 258
    assign iwb_biu_rst = rst_i;

  //assertion( iwb_biu_rst = rst_i) 259
    assign iwb_biu_clmode = clmode_i;

  //assertion( iwb_biu_clmode = clmode_i) 260
    assign iwb_biu_wb_clk_i = iwb_clk_i;

  //assertion( iwb_biu_wb_clk_i = iwb_clk_i) 261
    assign iwb_biu_wb_rst_i = iwb_rst_i;

  //assertion( iwb_biu_wb_rst_i = iwb_rst_i) 262
    assign iwb_biu_wb_ack_i = iwb_ack_i;

  //assertion( iwb_biu_wb_ack_i = iwb_ack_i) 263
    assign iwb_biu_wb_err_i = iwb_err_i;

  //assertion( iwb_biu_wb_err_i = iwb_err_i) 264
    assign iwb_biu_wb_rty_i = iwb_rty_i;

  //assertion( iwb_biu_wb_rty_i = iwb_rty_i) 265
    assign iwb_biu_wb_dat_i = iwb_dat_i;

  //assertion( iwb_biu_wb_dat_i = iwb_dat_i) 266
    assign iwb_cyc_o = iwb_biu_wb_cyc_o;

  //assertion( iwb_cyc_o = iwb_biu_wb_cyc_o) 267
    assign iwb_adr_o = iwb_biu_wb_adr_o;

  //assertion( iwb_adr_o = iwb_biu_wb_adr_o) 268
    assign iwb_stb_o = iwb_biu_wb_stb_o;

  //assertion( iwb_stb_o = iwb_biu_wb_stb_o) 269
    assign iwb_we_o = iwb_biu_wb_we_o;

  //assertion( iwb_we_o = iwb_biu_wb_we_o) 270
    assign iwb_sel_o = iwb_biu_wb_sel_o;

  //assertion( iwb_sel_o = iwb_biu_wb_sel_o) 271
    assign iwb_dat_o = iwb_biu_wb_dat_o;

  //assertion( iwb_dat_o = iwb_biu_wb_dat_o) 272
    assign iwb_cti_o = iwb_biu_wb_cti_o;

  //assertion( iwb_cti_o = iwb_biu_wb_cti_o) 273
    assign iwb_bte_o = iwb_biu_wb_bte_o;

  //assertion( iwb_bte_o = iwb_biu_wb_bte_o) 274
    assign iwb_biu_biu_dat_i = icbiu_dat_ic;

  //assertion( iwb_biu_biu_dat_i = icbiu_dat_ic) 275
    assign iwb_biu_biu_adr_i = icbiu_adr_ic_word;

  //assertion( iwb_biu_biu_adr_i = icbiu_adr_ic_word) 276
    assign iwb_biu_biu_cyc_i = icbiu_cyc_ic;

  //assertion( iwb_biu_biu_cyc_i = icbiu_cyc_ic) 277
    assign iwb_biu_biu_stb_i = icbiu_stb_ic;

  //assertion( iwb_biu_biu_stb_i = icbiu_stb_ic) 278
    assign iwb_biu_biu_we_i = icbiu_we_ic;

  //assertion( iwb_biu_biu_we_i = icbiu_we_ic) 279
    assign iwb_biu_biu_sel_i = icbiu_sel_ic;

  //assertion( iwb_biu_biu_sel_i = icbiu_sel_ic) 280
    assign iwb_biu_biu_cab_i = icbiu_cab_ic;

  //assertion( iwb_biu_biu_cab_i = icbiu_cab_ic) 281
    assign icbiu_dat_biu = iwb_biu_biu_dat_o;

  //assertion( icbiu_dat_biu = iwb_biu_biu_dat_o) 282
    assign icbiu_ack_biu = iwb_biu_biu_ack_o;

  //assertion( icbiu_ack_biu = iwb_biu_biu_ack_o) 283
    assign icbiu_err_biu = iwb_biu_biu_err_o;

  //assertion( icbiu_err_biu = iwb_biu_biu_err_o) 284
    assign dwb_biu_clk = clk_i;

  //assertion( dwb_biu_clk = clk_i) 285
    assign dwb_biu_rst = rst_i;

  //assertion( dwb_biu_rst = rst_i) 286
    assign dwb_biu_clmode = clmode_i;

  //assertion( dwb_biu_clmode = clmode_i) 287
    assign dwb_biu_wb_clk_i = dwb_clk_i;

  //assertion( dwb_biu_wb_clk_i = dwb_clk_i) 288
    assign dwb_biu_wb_rst_i = dwb_rst_i;

  //assertion( dwb_biu_wb_rst_i = dwb_rst_i) 289
    assign dwb_biu_wb_ack_i = dwb_ack_i;

  //assertion( dwb_biu_wb_ack_i = dwb_ack_i) 290
    assign dwb_biu_wb_err_i = dwb_err_i;

  //assertion( dwb_biu_wb_err_i = dwb_err_i) 291
    assign dwb_biu_wb_rty_i = dwb_rty_i;

  //assertion( dwb_biu_wb_rty_i = dwb_rty_i) 292
    assign dwb_biu_wb_dat_i = dwb_dat_i;

  //assertion( dwb_biu_wb_dat_i = dwb_dat_i) 293
    assign dwb_cyc_o = dwb_biu_wb_cyc_o;

  //assertion( dwb_cyc_o = dwb_biu_wb_cyc_o) 294
    assign dwb_adr_o = dwb_biu_wb_adr_o;

  //assertion( dwb_adr_o = dwb_biu_wb_adr_o) 295
    assign dwb_stb_o = dwb_biu_wb_stb_o;

  //assertion( dwb_stb_o = dwb_biu_wb_stb_o) 296
    assign dwb_we_o = dwb_biu_wb_we_o;

  //assertion( dwb_we_o = dwb_biu_wb_we_o) 297
    assign dwb_sel_o = dwb_biu_wb_sel_o;

  //assertion( dwb_sel_o = dwb_biu_wb_sel_o) 298
    assign dwb_dat_o = dwb_biu_wb_dat_o;

  //assertion( dwb_dat_o = dwb_biu_wb_dat_o) 299
    assign dwb_cti_o = dwb_biu_wb_cti_o;

  //assertion( dwb_cti_o = dwb_biu_wb_cti_o) 300
    assign dwb_bte_o = dwb_biu_wb_bte_o;

  //assertion( dwb_bte_o = dwb_biu_wb_bte_o) 301
    assign dwb_biu_biu_dat_i = sbbiu_dat_sb;

  //assertion( dwb_biu_biu_dat_i = sbbiu_dat_sb) 302
    assign dwb_biu_biu_adr_i = sbbiu_adr_sb;

  //assertion( dwb_biu_biu_adr_i = sbbiu_adr_sb) 303
    assign dwb_biu_biu_cyc_i = sbbiu_cyc_sb;

  //assertion( dwb_biu_biu_cyc_i = sbbiu_cyc_sb) 304
    assign dwb_biu_biu_stb_i = sbbiu_stb_sb;

  //assertion( dwb_biu_biu_stb_i = sbbiu_stb_sb) 305
    assign dwb_biu_biu_we_i = sbbiu_we_sb;

  //assertion( dwb_biu_biu_we_i = sbbiu_we_sb) 306
    assign dwb_biu_biu_sel_i = sbbiu_sel_sb;

  //assertion( dwb_biu_biu_sel_i = sbbiu_sel_sb) 307
    assign dwb_biu_biu_cab_i = sbbiu_cab_sb;

  //assertion( dwb_biu_biu_cab_i = sbbiu_cab_sb) 308
    assign sbbiu_dat_biu = dwb_biu_biu_dat_o;

  //assertion( sbbiu_dat_biu = dwb_biu_biu_dat_o) 309
    assign sbbiu_ack_biu = dwb_biu_biu_ack_o;

  //assertion( sbbiu_ack_biu = dwb_biu_biu_ack_o) 310
    assign sbbiu_err_biu = dwb_biu_biu_err_o;

  //assertion( sbbiu_err_biu = dwb_biu_biu_err_o) 311
    assign or1200_immu_top_itlb_spr_access = (or1200_immu_top_spr_cs & (~or1200_immu_top_dis_spr_access_scnd_clk));

  //assertion( or1200_immu_top_itlb_spr_access = or1200_immu_top_spr_cs & ~or1200_immu_top_dis_spr_access_scnd_clk) 312
    assign or1200_immu_top_icpu_rty_o = or1200_immu_top_qmemimmu_rty_i;

  //assertion( or1200_immu_top_icpu_rty_o = or1200_immu_top_qmemimmu_rty_i) 313
    assign or1200_immu_top_icpu_err_o = ((or1200_immu_top_miss | or1200_immu_top_fault) | or1200_immu_top_qmemimmu_err_i);

  //assertion( or1200_immu_top_icpu_err_o = or1200_immu_top_miss | or1200_immu_top_fault | or1200_immu_top_qmemimmu_err_i) 314
    assign or1200_immu_top_itlb_done = (or1200_immu_top_itlb_en_r & (~or1200_immu_top_page_cross));

  //assertion( or1200_immu_top_itlb_done = or1200_immu_top_itlb_en_r & ~or1200_immu_top_page_cross) 315
    assign or1200_immu_top_fault = (or1200_immu_top_itlb_done & ((~|or1200_immu_top_supv & ~|or1200_immu_top_itlb_uxe) | (or1200_immu_top_supv & ~|or1200_immu_top_itlb_sxe)));

  //assertion( or1200_immu_top_fault = or1200_immu_top_itlb_done & (~bvredor(or1200_immu_top_supv) & ~bvredor(or1200_immu_top_itlb_uxe) | or1200_immu_top_supv & ~bvredor(or1200_immu_top_itlb_sxe))) 316
    assign or1200_immu_top_miss = (or1200_immu_top_itlb_done & ~|or1200_immu_top_itlb_hit);

  //assertion( or1200_immu_top_miss = or1200_immu_top_itlb_done & ~bvredor(or1200_immu_top_itlb_hit)) 317
    assign or1200_immu_top_itlb_en = (or1200_immu_top_immu_en & or1200_immu_top_icpu_cycstb_i);

  //assertion( or1200_immu_top_itlb_en = or1200_immu_top_immu_en & or1200_immu_top_icpu_cycstb_i) 318
    assign or1200_immu_top_or1200_immu_tlb_tlb_mr_en = (or1200_immu_top_or1200_immu_tlb_tlb_en | (or1200_immu_top_or1200_immu_tlb_spr_cs & ~|or1200_immu_top_or1200_immu_tlb_spr_addr[7]));

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_mr_en = or1200_immu_top_or1200_immu_tlb_tlb_en | or1200_immu_top_or1200_immu_tlb_spr_cs & ~bvredor(Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_addr))) 319
    assign or1200_immu_top_or1200_immu_tlb_tlb_mr_we = ((or1200_immu_top_or1200_immu_tlb_spr_cs & or1200_immu_top_or1200_immu_tlb_spr_write) & ~|or1200_immu_top_or1200_immu_tlb_spr_addr[7]);

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_mr_we = or1200_immu_top_or1200_immu_tlb_spr_cs & or1200_immu_top_or1200_immu_tlb_spr_write & ~bvredor(Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_addr))) 320
    assign or1200_immu_top_or1200_immu_tlb_tlb_tr_en = (or1200_immu_top_or1200_immu_tlb_tlb_en | (or1200_immu_top_or1200_immu_tlb_spr_cs & or1200_immu_top_or1200_immu_tlb_spr_addr[7]));

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_tr_en = or1200_immu_top_or1200_immu_tlb_tlb_en | or1200_immu_top_or1200_immu_tlb_spr_cs & Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_addr)) 321
    assign or1200_immu_top_or1200_immu_tlb_tlb_tr_we = ((or1200_immu_top_or1200_immu_tlb_spr_cs & or1200_immu_top_or1200_immu_tlb_spr_write) & or1200_immu_top_or1200_immu_tlb_spr_addr[7]);

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_tr_we = or1200_immu_top_or1200_immu_tlb_spr_cs & or1200_immu_top_or1200_immu_tlb_spr_write & Extract(7, 7, or1200_immu_top_or1200_immu_tlb_spr_addr)) 322
    assign or1200_immu_top_or1200_immu_tlb_hit = ((or1200_immu_top_or1200_immu_tlb_vpn == or1200_immu_top_or1200_immu_tlb_vaddr[31:19]) & or1200_immu_top_or1200_immu_tlb_v);

  //assertion( or1200_immu_top_or1200_immu_tlb_hit = If((or1200_immu_top_or1200_immu_tlb_vpn == Extract(31, 19, or1200_immu_top_or1200_immu_tlb_vaddr)) == True, 1, 0) & or1200_immu_top_or1200_immu_tlb_v) 323
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk = or1200_immu_top_or1200_immu_tlb_clk;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk = or1200_immu_top_or1200_immu_tlb_clk) 324
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce = or1200_immu_top_or1200_immu_tlb_tlb_mr_en;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce = or1200_immu_top_or1200_immu_tlb_tlb_mr_en) 325
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we = or1200_immu_top_or1200_immu_tlb_tlb_mr_we;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we = or1200_immu_top_or1200_immu_tlb_tlb_mr_we) 326
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr = or1200_immu_top_or1200_immu_tlb_tlb_index;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr = or1200_immu_top_or1200_immu_tlb_tlb_index) 327
    assign or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di = or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di = or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_in) 328
    assign or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out = or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_doq;

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_mr_ram_out = or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_doq) 329
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk = or1200_immu_top_or1200_immu_tlb_clk;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk = or1200_immu_top_or1200_immu_tlb_clk) 330
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce = or1200_immu_top_or1200_immu_tlb_tlb_tr_en;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce = or1200_immu_top_or1200_immu_tlb_tlb_tr_en) 331
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we = or1200_immu_top_or1200_immu_tlb_tlb_tr_we;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we = or1200_immu_top_or1200_immu_tlb_tlb_tr_we) 332
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr = or1200_immu_top_or1200_immu_tlb_tlb_index;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr = or1200_immu_top_or1200_immu_tlb_tlb_index) 333
    assign or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in;

  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di = or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_in) 334
    assign or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out = or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_doq;

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_tr_ram_out = or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_doq) 335
    assign or1200_immu_top_or1200_immu_tlb_clk = or1200_immu_top_clk;

  //assertion( or1200_immu_top_or1200_immu_tlb_clk = or1200_immu_top_clk) 336
    assign or1200_immu_top_or1200_immu_tlb_rst = or1200_immu_top_rst;

  //assertion( or1200_immu_top_or1200_immu_tlb_rst = or1200_immu_top_rst) 337
    assign or1200_immu_top_or1200_immu_tlb_tlb_en = or1200_immu_top_itlb_en;

  //assertion( or1200_immu_top_or1200_immu_tlb_tlb_en = or1200_immu_top_itlb_en) 338
    assign or1200_immu_top_or1200_immu_tlb_vaddr = or1200_immu_top_icpu_adr_i;

  //assertion( or1200_immu_top_or1200_immu_tlb_vaddr = or1200_immu_top_icpu_adr_i) 339
    assign or1200_immu_top_itlb_hit = or1200_immu_top_or1200_immu_tlb_hit;

  //assertion( or1200_immu_top_itlb_hit = or1200_immu_top_or1200_immu_tlb_hit) 340
    assign or1200_immu_top_itlb_ppn = or1200_immu_top_or1200_immu_tlb_ppn;

  //assertion( or1200_immu_top_itlb_ppn = or1200_immu_top_or1200_immu_tlb_ppn) 341
    assign or1200_immu_top_itlb_uxe = or1200_immu_top_or1200_immu_tlb_uxe;

  //assertion( or1200_immu_top_itlb_uxe = or1200_immu_top_or1200_immu_tlb_uxe) 342
    assign or1200_immu_top_itlb_sxe = or1200_immu_top_or1200_immu_tlb_sxe;

  //assertion( or1200_immu_top_itlb_sxe = or1200_immu_top_or1200_immu_tlb_sxe) 343
    assign or1200_immu_top_itlb_ci = or1200_immu_top_or1200_immu_tlb_ci;

  //assertion( or1200_immu_top_itlb_ci = or1200_immu_top_or1200_immu_tlb_ci) 344
    assign or1200_immu_top_or1200_immu_tlb_spr_cs = or1200_immu_top_itlb_spr_access;

  //assertion( or1200_immu_top_or1200_immu_tlb_spr_cs = or1200_immu_top_itlb_spr_access) 345
    assign or1200_immu_top_or1200_immu_tlb_spr_write = or1200_immu_top_spr_write;

  //assertion( or1200_immu_top_or1200_immu_tlb_spr_write = or1200_immu_top_spr_write) 346
    assign or1200_immu_top_or1200_immu_tlb_spr_addr = or1200_immu_top_spr_addr;

  //assertion( or1200_immu_top_or1200_immu_tlb_spr_addr = or1200_immu_top_spr_addr) 347
    assign or1200_immu_top_or1200_immu_tlb_spr_dat_i = or1200_immu_top_spr_dat_i;

  //assertion( or1200_immu_top_or1200_immu_tlb_spr_dat_i = or1200_immu_top_spr_dat_i) 348
    assign or1200_immu_top_itlb_dat_o = or1200_immu_top_or1200_immu_tlb_spr_dat_o;

  //assertion( or1200_immu_top_itlb_dat_o = or1200_immu_top_or1200_immu_tlb_spr_dat_o) 349
    assign or1200_immu_top_clk = clk_i;

  //assertion( or1200_immu_top_clk = clk_i) 350
    assign or1200_immu_top_rst = rst_i;

  //assertion( or1200_immu_top_rst = rst_i) 351
    assign or1200_immu_top_ic_en = ic_en;

  //assertion( or1200_immu_top_ic_en = ic_en) 352
    assign or1200_immu_top_immu_en = immu_en;

  //assertion( or1200_immu_top_immu_en = immu_en) 353
    assign or1200_immu_top_supv = supv;

  //assertion( or1200_immu_top_supv = supv) 354
    assign or1200_immu_top_icpu_adr_i = icpu_adr_cpu;

  //assertion( or1200_immu_top_icpu_adr_i = icpu_adr_cpu) 355
    assign or1200_immu_top_icpu_cycstb_i = icpu_cycstb_cpu;

  //assertion( or1200_immu_top_icpu_cycstb_i = icpu_cycstb_cpu) 356
    assign icpu_adr_immu = or1200_immu_top_icpu_adr_o;

  //assertion( icpu_adr_immu = or1200_immu_top_icpu_adr_o) 357
    assign icpu_tag_immu = or1200_immu_top_icpu_tag_o;

  //assertion( icpu_tag_immu = or1200_immu_top_icpu_tag_o) 358
    assign icpu_rty_immu = or1200_immu_top_icpu_rty_o;

  //assertion( icpu_rty_immu = or1200_immu_top_icpu_rty_o) 359
    assign icpu_err_immu = or1200_immu_top_icpu_err_o;

  //assertion( icpu_err_immu = or1200_immu_top_icpu_err_o) 360
    assign or1200_immu_top_boot_adr_sel_i = boot_adr_sel;

  //assertion( or1200_immu_top_boot_adr_sel_i = boot_adr_sel) 361
    assign or1200_immu_top_spr_write = spr_we;

  //assertion( or1200_immu_top_spr_write = spr_we) 362
    assign or1200_immu_top_spr_addr = spr_addr;

  //assertion( or1200_immu_top_spr_addr = spr_addr) 363
    assign or1200_immu_top_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_immu_top_spr_dat_i = spr_dat_cpu) 364
    assign spr_dat_immu = or1200_immu_top_spr_dat_o;

  //assertion( spr_dat_immu = or1200_immu_top_spr_dat_o) 365
    assign or1200_immu_top_qmemimmu_rty_i = qmemimmu_rty_qmem;

  //assertion( or1200_immu_top_qmemimmu_rty_i = qmemimmu_rty_qmem) 366
    assign or1200_immu_top_qmemimmu_err_i = qmemimmu_err_qmem;

  //assertion( or1200_immu_top_qmemimmu_err_i = qmemimmu_err_qmem) 367
    assign or1200_immu_top_qmemimmu_tag_i = qmemimmu_tag_qmem;

  //assertion( or1200_immu_top_qmemimmu_tag_i = qmemimmu_tag_qmem) 368
    assign qmemimmu_adr_immu = or1200_immu_top_qmemimmu_adr_o;

  //assertion( qmemimmu_adr_immu = or1200_immu_top_qmemimmu_adr_o) 369
    assign qmemimmu_cycstb_immu = or1200_immu_top_qmemimmu_cycstb_o;

  //assertion( qmemimmu_cycstb_immu = or1200_immu_top_qmemimmu_cycstb_o) 370
    assign qmemimmu_ci_immu = or1200_immu_top_qmemimmu_ci_o;

  //assertion( qmemimmu_ci_immu = or1200_immu_top_qmemimmu_ci_o) 371
    assign or1200_ic_top_icbiu_adr_o = or1200_ic_top_ic_addr;

  //assertion( or1200_ic_top_icbiu_adr_o = or1200_ic_top_ic_addr) 372
    assign or1200_ic_top_ic_inv = (or1200_ic_top_spr_cs & or1200_ic_top_spr_write);

  //assertion( or1200_ic_top_ic_inv = or1200_ic_top_spr_cs & or1200_ic_top_spr_write) 373
    assign or1200_ic_top_ictag_we = (or1200_ic_top_icfsm_tag_we | or1200_ic_top_ic_inv);

  //assertion( or1200_ic_top_ictag_we = or1200_ic_top_icfsm_tag_we | or1200_ic_top_ic_inv) 374
    assign or1200_ic_top_ictag_en = (or1200_ic_top_ic_inv | or1200_ic_top_ic_en);

  //assertion( or1200_ic_top_ictag_en = or1200_ic_top_ic_inv | or1200_ic_top_ic_en) 375
    assign or1200_ic_top_ictag_v = (~or1200_ic_top_ic_inv);

  //assertion( or1200_ic_top_ictag_v = ~or1200_ic_top_ic_inv) 376
    assign or1200_ic_top_icqmem_rty_o = ((~or1200_ic_top_icqmem_ack_o) & (~or1200_ic_top_icqmem_err_o));

  //assertion( or1200_ic_top_icqmem_rty_o = ~or1200_ic_top_icqmem_ack_o & ~or1200_ic_top_icqmem_err_o) 377
    assign or1200_ic_top_to_icram = or1200_ic_top_icbiu_dat_i;

  //assertion( or1200_ic_top_to_icram = or1200_ic_top_icbiu_dat_i) 378
    assign or1200_ic_top_or1200_ic_fsm_tag_we = ((or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid) & ~|or1200_ic_top_or1200_ic_fsm_cache_inhibit);

  //assertion( or1200_ic_top_or1200_ic_fsm_tag_we = or1200_ic_top_or1200_ic_fsm_biu_read & or1200_ic_top_or1200_ic_fsm_biudata_valid & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit)) 379
    assign or1200_ic_top_or1200_ic_fsm_biu_read = ((or1200_ic_top_or1200_ic_fsm_hitmiss_eval & or1200_ic_top_or1200_ic_fsm_tagcomp_miss) | (~|or1200_ic_top_or1200_ic_fsm_hitmiss_eval & or1200_ic_top_or1200_ic_fsm_load));

  //assertion( or1200_ic_top_or1200_ic_fsm_biu_read = or1200_ic_top_or1200_ic_fsm_hitmiss_eval & or1200_ic_top_or1200_ic_fsm_tagcomp_miss | ~bvredor(or1200_ic_top_or1200_ic_fsm_hitmiss_eval) & or1200_ic_top_or1200_ic_fsm_load) 380
    assign or1200_ic_top_or1200_ic_fsm_saved_addr = or1200_ic_top_or1200_ic_fsm_saved_addr_r;

  //assertion( or1200_ic_top_or1200_ic_fsm_saved_addr = or1200_ic_top_or1200_ic_fsm_saved_addr_r) 381
    assign or1200_ic_top_or1200_ic_fsm_first_hit_ack = ((((or1200_ic_top_or1200_ic_fsm_state == 2'h1) & or1200_ic_top_or1200_ic_fsm_hitmiss_eval) & ~|or1200_ic_top_or1200_ic_fsm_tagcomp_miss) & ~|or1200_ic_top_or1200_ic_fsm_cache_inhibit);

  //assertion( or1200_ic_top_or1200_ic_fsm_first_hit_ack = If((1 == or1200_ic_top_or1200_ic_fsm_state) == True, 1, 0) & or1200_ic_top_or1200_ic_fsm_hitmiss_eval & ~bvredor(or1200_ic_top_or1200_ic_fsm_tagcomp_miss) & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit)) 382
    assign or1200_ic_top_or1200_ic_fsm_first_miss_ack = (((or1200_ic_top_or1200_ic_fsm_state == 2'h1) & or1200_ic_top_or1200_ic_fsm_biudata_valid) & (~or1200_ic_top_or1200_ic_fsm_first_hit_ack));

  //assertion( or1200_ic_top_or1200_ic_fsm_first_miss_ack = If((1 == or1200_ic_top_or1200_ic_fsm_state) == True, 1, 0) & or1200_ic_top_or1200_ic_fsm_biudata_valid & ~or1200_ic_top_or1200_ic_fsm_first_hit_ack) 383
    assign or1200_ic_top_or1200_ic_fsm_first_miss_err = ((or1200_ic_top_or1200_ic_fsm_state == 2'h1) & or1200_ic_top_or1200_ic_fsm_biudata_error);

  //assertion( or1200_ic_top_or1200_ic_fsm_first_miss_err = If((1 == or1200_ic_top_or1200_ic_fsm_state) == True, 1, 0) & or1200_ic_top_or1200_ic_fsm_biudata_error) 384
    assign or1200_ic_top_or1200_ic_fsm_burst = ((((or1200_ic_top_or1200_ic_fsm_state == 2'h1) & or1200_ic_top_or1200_ic_fsm_tagcomp_miss) & ~|or1200_ic_top_or1200_ic_fsm_cache_inhibit) | (or1200_ic_top_or1200_ic_fsm_state == 2'h2));

  //assertion( or1200_ic_top_or1200_ic_fsm_burst = If((1 == or1200_ic_top_or1200_ic_fsm_state) == True, 1, 0) & or1200_ic_top_or1200_ic_fsm_tagcomp_miss & ~bvredor(or1200_ic_top_or1200_ic_fsm_cache_inhibit) | If((2 == or1200_ic_top_or1200_ic_fsm_state) == True, 1, 0)) 385
    assign or1200_ic_top_or1200_ic_fsm_clk = or1200_ic_top_clk;

  //assertion( or1200_ic_top_or1200_ic_fsm_clk = or1200_ic_top_clk) 386
    assign or1200_ic_top_or1200_ic_fsm_rst = or1200_ic_top_rst;

  //assertion( or1200_ic_top_or1200_ic_fsm_rst = or1200_ic_top_rst) 387
    assign or1200_ic_top_or1200_ic_fsm_ic_en = or1200_ic_top_ic_en;

  //assertion( or1200_ic_top_or1200_ic_fsm_ic_en = or1200_ic_top_ic_en) 388
    assign or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i = or1200_ic_top_icqmem_cycstb_i;

  //assertion( or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i = or1200_ic_top_icqmem_cycstb_i) 389
    assign or1200_ic_top_or1200_ic_fsm_icqmem_ci_i = or1200_ic_top_icqmem_ci_i;

  //assertion( or1200_ic_top_or1200_ic_fsm_icqmem_ci_i = or1200_ic_top_icqmem_ci_i) 390
    assign or1200_ic_top_or1200_ic_fsm_tagcomp_miss = or1200_ic_top_tagcomp_miss;

  //assertion( or1200_ic_top_or1200_ic_fsm_tagcomp_miss = or1200_ic_top_tagcomp_miss) 391
    assign or1200_ic_top_or1200_ic_fsm_biudata_valid = or1200_ic_top_icbiu_ack_i;

  //assertion( or1200_ic_top_or1200_ic_fsm_biudata_valid = or1200_ic_top_icbiu_ack_i) 392
    assign or1200_ic_top_or1200_ic_fsm_biudata_error = or1200_ic_top_icbiu_err_i;

  //assertion( or1200_ic_top_or1200_ic_fsm_biudata_error = or1200_ic_top_icbiu_err_i) 393
    assign or1200_ic_top_or1200_ic_fsm_start_addr = or1200_ic_top_icqmem_adr_i;

  //assertion( or1200_ic_top_or1200_ic_fsm_start_addr = or1200_ic_top_icqmem_adr_i) 394
    assign or1200_ic_top_saved_addr = or1200_ic_top_or1200_ic_fsm_saved_addr;

  //assertion( or1200_ic_top_saved_addr = or1200_ic_top_or1200_ic_fsm_saved_addr) 395
    assign or1200_ic_top_icram_we = or1200_ic_top_or1200_ic_fsm_icram_we;

  //assertion( or1200_ic_top_icram_we = or1200_ic_top_or1200_ic_fsm_icram_we) 396
    assign or1200_ic_top_icfsm_tag_we = or1200_ic_top_or1200_ic_fsm_tag_we;

  //assertion( or1200_ic_top_icfsm_tag_we = or1200_ic_top_or1200_ic_fsm_tag_we) 397
    assign or1200_ic_top_icfsm_biu_read = or1200_ic_top_or1200_ic_fsm_biu_read;

  //assertion( or1200_ic_top_icfsm_biu_read = or1200_ic_top_or1200_ic_fsm_biu_read) 398
    assign or1200_ic_top_icfsm_first_hit_ack = or1200_ic_top_or1200_ic_fsm_first_hit_ack;

  //assertion( or1200_ic_top_icfsm_first_hit_ack = or1200_ic_top_or1200_ic_fsm_first_hit_ack) 399
    assign or1200_ic_top_icfsm_first_miss_ack = or1200_ic_top_or1200_ic_fsm_first_miss_ack;

  //assertion( or1200_ic_top_icfsm_first_miss_ack = or1200_ic_top_or1200_ic_fsm_first_miss_ack) 400
    assign or1200_ic_top_icfsm_first_miss_err = or1200_ic_top_or1200_ic_fsm_first_miss_err;

  //assertion( or1200_ic_top_icfsm_first_miss_err = or1200_ic_top_or1200_ic_fsm_first_miss_err) 401
    assign or1200_ic_top_icfsm_burst = or1200_ic_top_or1200_ic_fsm_burst;

  //assertion( or1200_ic_top_icfsm_burst = or1200_ic_top_or1200_ic_fsm_burst) 402
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_clk = or1200_ic_top_or1200_ic_ram_clk;

  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_clk = or1200_ic_top_or1200_ic_ram_clk) 403
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_ce = or1200_ic_top_or1200_ic_ram_en;

  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_ce = or1200_ic_top_or1200_ic_ram_en) 404
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_addr = or1200_ic_top_or1200_ic_ram_addr;

  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_addr = or1200_ic_top_or1200_ic_ram_addr) 405
    assign or1200_ic_top_or1200_ic_ram_ic_ram0_di = or1200_ic_top_or1200_ic_ram_datain;

  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_di = or1200_ic_top_or1200_ic_ram_datain) 406
    assign or1200_ic_top_or1200_ic_ram_dataout = or1200_ic_top_or1200_ic_ram_ic_ram0_doq;

  //assertion( or1200_ic_top_or1200_ic_ram_dataout = or1200_ic_top_or1200_ic_ram_ic_ram0_doq) 407
    assign or1200_ic_top_or1200_ic_ram_clk = or1200_ic_top_clk;

  //assertion( or1200_ic_top_or1200_ic_ram_clk = or1200_ic_top_clk) 408
    assign or1200_ic_top_or1200_ic_ram_rst = or1200_ic_top_rst;

  //assertion( or1200_ic_top_or1200_ic_ram_rst = or1200_ic_top_rst) 409
    assign or1200_ic_top_or1200_ic_ram_en = or1200_ic_top_ic_en;

  //assertion( or1200_ic_top_or1200_ic_ram_en = or1200_ic_top_ic_en) 410
    assign or1200_ic_top_or1200_ic_ram_we = or1200_ic_top_icram_we;

  //assertion( or1200_ic_top_or1200_ic_ram_we = or1200_ic_top_icram_we) 411
    assign or1200_ic_top_or1200_ic_ram_datain = or1200_ic_top_to_icram;

  //assertion( or1200_ic_top_or1200_ic_ram_datain = or1200_ic_top_to_icram) 412
    assign or1200_ic_top_from_icram = or1200_ic_top_or1200_ic_ram_dataout;

  //assertion( or1200_ic_top_from_icram = or1200_ic_top_or1200_ic_ram_dataout) 413
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_clk = or1200_ic_top_or1200_ic_tag_clk;

  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_clk = or1200_ic_top_or1200_ic_tag_clk) 414
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_ce = or1200_ic_top_or1200_ic_tag_en;

  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_ce = or1200_ic_top_or1200_ic_tag_en) 415
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_we = or1200_ic_top_or1200_ic_tag_we;

  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_we = or1200_ic_top_or1200_ic_tag_we) 416
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_addr = or1200_ic_top_or1200_ic_tag_addr;

  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_addr = or1200_ic_top_or1200_ic_tag_addr) 417
    assign or1200_ic_top_or1200_ic_tag_ic_tag0_di = or1200_ic_top_or1200_ic_tag_datain;

  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_di = or1200_ic_top_or1200_ic_tag_datain) 418
    assign or1200_ic_top_or1200_ic_tag_clk = or1200_ic_top_clk;

  //assertion( or1200_ic_top_or1200_ic_tag_clk = or1200_ic_top_clk) 419
    assign or1200_ic_top_or1200_ic_tag_rst = or1200_ic_top_rst;

  //assertion( or1200_ic_top_or1200_ic_tag_rst = or1200_ic_top_rst) 420
    assign or1200_ic_top_or1200_ic_tag_addr = or1200_ic_top_ictag_addr;

  //assertion( or1200_ic_top_or1200_ic_tag_addr = or1200_ic_top_ictag_addr) 421
    assign or1200_ic_top_or1200_ic_tag_en = or1200_ic_top_ictag_en;

  //assertion( or1200_ic_top_or1200_ic_tag_en = or1200_ic_top_ictag_en) 422
    assign or1200_ic_top_or1200_ic_tag_we = or1200_ic_top_ictag_we;

  //assertion( or1200_ic_top_or1200_ic_tag_we = or1200_ic_top_ictag_we) 423
    assign or1200_ic_top_tag_v = or1200_ic_top_or1200_ic_tag_tag_v;

  //assertion( or1200_ic_top_tag_v = or1200_ic_top_or1200_ic_tag_tag_v) 424
    assign or1200_ic_top_tag = or1200_ic_top_or1200_ic_tag_tag;

  //assertion( or1200_ic_top_tag = or1200_ic_top_or1200_ic_tag_tag) 425
    assign or1200_ic_top_clk = clk_i;

  //assertion( or1200_ic_top_clk = clk_i) 426
    assign or1200_ic_top_rst = rst_i;

  //assertion( or1200_ic_top_rst = rst_i) 427
    assign icbiu_dat_ic = or1200_ic_top_icbiu_dat_o;

  //assertion( icbiu_dat_ic = or1200_ic_top_icbiu_dat_o) 428
    assign icbiu_adr_ic = or1200_ic_top_icbiu_adr_o;

  //assertion( icbiu_adr_ic = or1200_ic_top_icbiu_adr_o) 429
    assign icbiu_cyc_ic = or1200_ic_top_icbiu_cyc_o;

  //assertion( icbiu_cyc_ic = or1200_ic_top_icbiu_cyc_o) 430
    assign icbiu_stb_ic = or1200_ic_top_icbiu_stb_o;

  //assertion( icbiu_stb_ic = or1200_ic_top_icbiu_stb_o) 431
    assign icbiu_we_ic = or1200_ic_top_icbiu_we_o;

  //assertion( icbiu_we_ic = or1200_ic_top_icbiu_we_o) 432
    assign icbiu_sel_ic = or1200_ic_top_icbiu_sel_o;

  //assertion( icbiu_sel_ic = or1200_ic_top_icbiu_sel_o) 433
    assign icbiu_cab_ic = or1200_ic_top_icbiu_cab_o;

  //assertion( icbiu_cab_ic = or1200_ic_top_icbiu_cab_o) 434
    assign or1200_ic_top_icbiu_dat_i = icbiu_dat_biu;

  //assertion( or1200_ic_top_icbiu_dat_i = icbiu_dat_biu) 435
    assign or1200_ic_top_icbiu_ack_i = icbiu_ack_biu;

  //assertion( or1200_ic_top_icbiu_ack_i = icbiu_ack_biu) 436
    assign or1200_ic_top_icbiu_err_i = icbiu_err_biu;

  //assertion( or1200_ic_top_icbiu_err_i = icbiu_err_biu) 437
    assign or1200_ic_top_ic_en = ic_en;

  //assertion( or1200_ic_top_ic_en = ic_en) 438
    assign or1200_ic_top_icqmem_adr_i = icqmem_adr_qmem;

  //assertion( or1200_ic_top_icqmem_adr_i = icqmem_adr_qmem) 439
    assign or1200_ic_top_icqmem_cycstb_i = icqmem_cycstb_qmem;

  //assertion( or1200_ic_top_icqmem_cycstb_i = icqmem_cycstb_qmem) 440
    assign or1200_ic_top_icqmem_ci_i = icqmem_ci_qmem;

  //assertion( or1200_ic_top_icqmem_ci_i = icqmem_ci_qmem) 441
    assign or1200_ic_top_icqmem_sel_i = icqmem_sel_qmem;

  //assertion( or1200_ic_top_icqmem_sel_i = icqmem_sel_qmem) 442
    assign or1200_ic_top_icqmem_tag_i = icqmem_tag_qmem;

  //assertion( or1200_ic_top_icqmem_tag_i = icqmem_tag_qmem) 443
    assign icqmem_dat_ic = or1200_ic_top_icqmem_dat_o;

  //assertion( icqmem_dat_ic = or1200_ic_top_icqmem_dat_o) 444
    assign icqmem_ack_ic = or1200_ic_top_icqmem_ack_o;

  //assertion( icqmem_ack_ic = or1200_ic_top_icqmem_ack_o) 445
    assign icqmem_rty_ic = or1200_ic_top_icqmem_rty_o;

  //assertion( icqmem_rty_ic = or1200_ic_top_icqmem_rty_o) 446
    assign icqmem_err_ic = or1200_ic_top_icqmem_err_o;

  //assertion( icqmem_err_ic = or1200_ic_top_icqmem_err_o) 447
    assign icqmem_tag_ic = or1200_ic_top_icqmem_tag_o;

  //assertion( icqmem_tag_ic = or1200_ic_top_icqmem_tag_o) 448
    assign or1200_ic_top_spr_write = spr_we;

  //assertion( or1200_ic_top_spr_write = spr_we) 449
    assign or1200_ic_top_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_ic_top_spr_dat_i = spr_dat_cpu) 450
    assign or1200_cpu_du_except_trig = or1200_cpu_except_trig;

  //assertion( or1200_cpu_du_except_trig = or1200_cpu_except_trig) 451
    assign or1200_cpu_du_except_stop = or1200_cpu_except_stop;

  //assertion( or1200_cpu_du_except_stop = or1200_cpu_except_stop) 452
    assign or1200_cpu_du_lsu_store_dat = or1200_cpu_operand_b;

  //assertion( or1200_cpu_du_lsu_store_dat = or1200_cpu_operand_b) 453
    assign or1200_cpu_du_lsu_load_dat = or1200_cpu_lsu_dataout;

  //assertion( or1200_cpu_du_lsu_load_dat = or1200_cpu_lsu_dataout) 454
    assign or1200_cpu_immu_en = (or1200_cpu_sr[6] & (~or1200_cpu_except_started));

  //assertion( or1200_cpu_immu_en = Extract(6, 6, or1200_cpu_sr) & ~or1200_cpu_except_started) 455
    assign or1200_cpu_flagforw = ((or1200_cpu_flag_we_alu & or1200_cpu_flagforw_alu) | (or1200_cpu_flagforw_fpu & or1200_cpu_flag_we_fpu));

  //assertion( or1200_cpu_flagforw = or1200_cpu_flag_we_alu & or1200_cpu_flagforw_alu | or1200_cpu_flagforw_fpu & or1200_cpu_flag_we_fpu) 456
    assign or1200_cpu_flag_we = ((or1200_cpu_flag_we_alu | or1200_cpu_flag_we_fpu) & (~or1200_cpu_abort_mvspr));

  //assertion( or1200_cpu_flag_we = (or1200_cpu_flag_we_alu | or1200_cpu_flag_we_fpu) & ~or1200_cpu_abort_mvspr) 457
    assign or1200_cpu_mtspr_done = or1200_cpu_mtspr_dc_done;

  //assertion( or1200_cpu_mtspr_done = or1200_cpu_mtspr_dc_done) 458
    assign or1200_cpu_or1200_genpc_icpu_cycstb_o = (~((or1200_cpu_or1200_genpc_genpc_freeze | ((|or1200_cpu_or1200_genpc_pre_branch_op) & ~|or1200_cpu_or1200_genpc_icpu_rty_i)) | or1200_cpu_or1200_genpc_wait_lsu));

  //assertion( or1200_cpu_or1200_genpc_icpu_cycstb_o = ~(or1200_cpu_or1200_genpc_genpc_freeze | bvredor(or1200_cpu_or1200_genpc_pre_branch_op) & ~bvredor(or1200_cpu_or1200_genpc_icpu_rty_i) | or1200_cpu_or1200_genpc_wait_lsu)) 459
    assign or1200_cpu_or1200_genpc_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_genpc_clk = or1200_cpu_clk) 460
    assign or1200_cpu_or1200_genpc_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_genpc_rst = or1200_cpu_rst) 461
    assign or1200_cpu_icpu_adr_o = or1200_cpu_or1200_genpc_icpu_adr_o;

  //assertion( or1200_cpu_icpu_adr_o = or1200_cpu_or1200_genpc_icpu_adr_o) 462
    assign or1200_cpu_icpu_cycstb_o = or1200_cpu_or1200_genpc_icpu_cycstb_o;

  //assertion( or1200_cpu_icpu_cycstb_o = or1200_cpu_or1200_genpc_icpu_cycstb_o) 463
    assign or1200_cpu_icpu_sel_o = or1200_cpu_or1200_genpc_icpu_sel_o;

  //assertion( or1200_cpu_icpu_sel_o = or1200_cpu_or1200_genpc_icpu_sel_o) 464
    assign or1200_cpu_icpu_tag_o = or1200_cpu_or1200_genpc_icpu_tag_o;

  //assertion( or1200_cpu_icpu_tag_o = or1200_cpu_or1200_genpc_icpu_tag_o) 465
    assign or1200_cpu_or1200_genpc_icpu_rty_i = or1200_cpu_icpu_rty_i;

  //assertion( or1200_cpu_or1200_genpc_icpu_rty_i = or1200_cpu_icpu_rty_i) 466
    assign or1200_cpu_or1200_genpc_icpu_adr_i = or1200_cpu_icpu_adr_i;

  //assertion( or1200_cpu_or1200_genpc_icpu_adr_i = or1200_cpu_icpu_adr_i) 467
    assign or1200_cpu_or1200_genpc_pre_branch_op = or1200_cpu_pre_branch_op;

  //assertion( or1200_cpu_or1200_genpc_pre_branch_op = or1200_cpu_pre_branch_op) 468
    assign or1200_cpu_or1200_genpc_branch_op = or1200_cpu_branch_op;

  //assertion( or1200_cpu_or1200_genpc_branch_op = or1200_cpu_branch_op) 469
    assign or1200_cpu_or1200_genpc_except_type = or1200_cpu_except_type;

  //assertion( or1200_cpu_or1200_genpc_except_type = or1200_cpu_except_type) 470
    assign or1200_cpu_or1200_genpc_id_branch_addrtarget = or1200_cpu_id_branch_addrtarget;

  //assertion( or1200_cpu_or1200_genpc_id_branch_addrtarget = or1200_cpu_id_branch_addrtarget) 471
    assign or1200_cpu_or1200_genpc_ex_branch_addrtarget = or1200_cpu_ex_branch_addrtarget;

  //assertion( or1200_cpu_or1200_genpc_ex_branch_addrtarget = or1200_cpu_ex_branch_addrtarget) 472
    assign or1200_cpu_or1200_genpc_muxed_b = or1200_cpu_muxed_b;

  //assertion( or1200_cpu_or1200_genpc_muxed_b = or1200_cpu_muxed_b) 473
    assign or1200_cpu_or1200_genpc_operand_b = or1200_cpu_operand_b;

  //assertion( or1200_cpu_or1200_genpc_operand_b = or1200_cpu_operand_b) 474
    assign or1200_cpu_or1200_genpc_flag = or1200_cpu_flag;

  //assertion( or1200_cpu_or1200_genpc_flag = or1200_cpu_flag) 475
    assign or1200_cpu_or1200_genpc_flagforw = or1200_cpu_flagforw;

  //assertion( or1200_cpu_or1200_genpc_flagforw = or1200_cpu_flagforw) 476
    assign or1200_cpu_ex_branch_taken = or1200_cpu_or1200_genpc_ex_branch_taken;

  //assertion( or1200_cpu_ex_branch_taken = or1200_cpu_or1200_genpc_ex_branch_taken) 477
    assign or1200_cpu_or1200_genpc_except_start = or1200_cpu_except_start;

  //assertion( or1200_cpu_or1200_genpc_except_start = or1200_cpu_except_start) 478
    assign or1200_cpu_or1200_genpc_epcr = or1200_cpu_epcr;

  //assertion( or1200_cpu_or1200_genpc_epcr = or1200_cpu_epcr) 479
    assign or1200_cpu_or1200_genpc_spr_dat_i = or1200_cpu_spr_dat_cpu;

  //assertion( or1200_cpu_or1200_genpc_spr_dat_i = or1200_cpu_spr_dat_cpu) 480
    assign or1200_cpu_or1200_genpc_spr_pc_we = or1200_cpu_pc_we;

  //assertion( or1200_cpu_or1200_genpc_spr_pc_we = or1200_cpu_pc_we) 481
    assign or1200_cpu_or1200_genpc_genpc_refetch = or1200_cpu_genpc_refetch;

  //assertion( or1200_cpu_or1200_genpc_genpc_refetch = or1200_cpu_genpc_refetch) 482
    assign or1200_cpu_or1200_genpc_genpc_freeze = or1200_cpu_genpc_freeze;

  //assertion( or1200_cpu_or1200_genpc_genpc_freeze = or1200_cpu_genpc_freeze) 483
    assign or1200_cpu_or1200_genpc_no_more_dslot = or1200_cpu_no_more_dslot;

  //assertion( or1200_cpu_or1200_genpc_no_more_dslot = or1200_cpu_no_more_dslot) 484
    assign or1200_cpu_or1200_genpc_lsu_stall = or1200_cpu_lsu_stall;

  //assertion( or1200_cpu_or1200_genpc_lsu_stall = or1200_cpu_lsu_stall) 485
    assign or1200_cpu_or1200_genpc_du_flush_pipe = or1200_cpu_du_flush_pipe;

  //assertion( or1200_cpu_or1200_genpc_du_flush_pipe = or1200_cpu_du_flush_pipe) 486
    assign or1200_cpu_or1200_genpc_spr_dat_npc = or1200_cpu_spr_dat_npc;

  //assertion( or1200_cpu_or1200_genpc_spr_dat_npc = or1200_cpu_spr_dat_npc) 487
    assign or1200_cpu_or1200_if_save_insn = (((or1200_cpu_or1200_if_icpu_ack_i | or1200_cpu_or1200_if_icpu_err_i) & or1200_cpu_or1200_if_if_freeze) & ~|or1200_cpu_or1200_if_saved);

  //assertion( or1200_cpu_or1200_if_save_insn = (or1200_cpu_or1200_if_icpu_ack_i | or1200_cpu_or1200_if_icpu_err_i) & or1200_cpu_or1200_if_if_freeze & ~bvredor(or1200_cpu_or1200_if_saved)) 488
    assign or1200_cpu_or1200_if_saving_if_insn = (~|or1200_cpu_or1200_if_if_flushpipe & or1200_cpu_or1200_if_save_insn);

  //assertion( or1200_cpu_or1200_if_saving_if_insn = ~bvredor(or1200_cpu_or1200_if_if_flushpipe) & or1200_cpu_or1200_if_save_insn) 489
    assign or1200_cpu_or1200_if_if_stall = ((~|or1200_cpu_or1200_if_icpu_err_i & ~|or1200_cpu_or1200_if_icpu_ack_i) & ~|or1200_cpu_or1200_if_saved);

  //assertion( or1200_cpu_or1200_if_if_stall = ~bvredor(or1200_cpu_or1200_if_icpu_err_i) & ~bvredor(or1200_cpu_or1200_if_icpu_ack_i) & ~bvredor(or1200_cpu_or1200_if_saved)) 490
    assign or1200_cpu_or1200_if_genpc_refetch = (or1200_cpu_or1200_if_saved & or1200_cpu_or1200_if_icpu_ack_i);

  //assertion( or1200_cpu_or1200_if_genpc_refetch = or1200_cpu_or1200_if_saved & or1200_cpu_or1200_if_icpu_ack_i) 491
    assign or1200_cpu_or1200_if_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_if_clk = or1200_cpu_clk) 492
    assign or1200_cpu_or1200_if_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_if_rst = or1200_cpu_rst) 493
    assign or1200_cpu_or1200_if_icpu_dat_i = or1200_cpu_icpu_dat_i;

  //assertion( or1200_cpu_or1200_if_icpu_dat_i = or1200_cpu_icpu_dat_i) 494
    assign or1200_cpu_or1200_if_icpu_ack_i = or1200_cpu_icpu_ack_i;

  //assertion( or1200_cpu_or1200_if_icpu_ack_i = or1200_cpu_icpu_ack_i) 495
    assign or1200_cpu_or1200_if_icpu_err_i = or1200_cpu_icpu_err_i;

  //assertion( or1200_cpu_or1200_if_icpu_err_i = or1200_cpu_icpu_err_i) 496
    assign or1200_cpu_or1200_if_icpu_adr_i = or1200_cpu_icpu_adr_i;

  //assertion( or1200_cpu_or1200_if_icpu_adr_i = or1200_cpu_icpu_adr_i) 497
    assign or1200_cpu_or1200_if_icpu_tag_i = or1200_cpu_icpu_tag_i;

  //assertion( or1200_cpu_or1200_if_icpu_tag_i = or1200_cpu_icpu_tag_i) 498
    assign or1200_cpu_or1200_if_if_freeze = or1200_cpu_if_freeze;

  //assertion( or1200_cpu_or1200_if_if_freeze = or1200_cpu_if_freeze) 499
    assign or1200_cpu_if_insn = or1200_cpu_or1200_if_if_insn;

  //assertion( or1200_cpu_if_insn = or1200_cpu_or1200_if_if_insn) 500
    assign or1200_cpu_if_pc = or1200_cpu_or1200_if_if_pc;

  //assertion( or1200_cpu_if_pc = or1200_cpu_or1200_if_if_pc) 501
    assign or1200_cpu_or1200_if_if_flushpipe = or1200_cpu_if_flushpipe;

  //assertion( or1200_cpu_or1200_if_if_flushpipe = or1200_cpu_if_flushpipe) 502
    assign or1200_cpu_saving_if_insn = or1200_cpu_or1200_if_saving_if_insn;

  //assertion( or1200_cpu_saving_if_insn = or1200_cpu_or1200_if_saving_if_insn) 503
    assign or1200_cpu_if_stall = or1200_cpu_or1200_if_if_stall;

  //assertion( or1200_cpu_if_stall = or1200_cpu_or1200_if_if_stall) 504
    assign or1200_cpu_or1200_if_no_more_dslot = or1200_cpu_no_more_dslot;

  //assertion( or1200_cpu_or1200_if_no_more_dslot = or1200_cpu_no_more_dslot) 505
    assign or1200_cpu_genpc_refetch = or1200_cpu_or1200_if_genpc_refetch;

  //assertion( or1200_cpu_genpc_refetch = or1200_cpu_or1200_if_genpc_refetch) 506
    assign or1200_cpu_or1200_if_rfe = or1200_cpu_rfe;

  //assertion( or1200_cpu_or1200_if_rfe = or1200_cpu_rfe) 507
    assign or1200_cpu_except_itlbmiss = or1200_cpu_or1200_if_except_itlbmiss;

  //assertion( or1200_cpu_except_itlbmiss = or1200_cpu_or1200_if_except_itlbmiss) 508
    assign or1200_cpu_except_immufault = or1200_cpu_or1200_if_except_immufault;

  //assertion( or1200_cpu_except_immufault = or1200_cpu_or1200_if_except_immufault) 509
    assign or1200_cpu_except_ibuserr = or1200_cpu_or1200_if_except_ibuserr;

  //assertion( or1200_cpu_except_ibuserr = or1200_cpu_or1200_if_except_ibuserr) 510
    assign or1200_cpu_or1200_ctrl_rf_rda = (or1200_cpu_or1200_ctrl_if_insn[31] | or1200_cpu_or1200_ctrl_if_maci_op);

  //assertion( or1200_cpu_or1200_ctrl_rf_rda = Extract(31, 31, or1200_cpu_or1200_ctrl_if_insn) | or1200_cpu_or1200_ctrl_if_maci_op) 511
    assign or1200_cpu_or1200_ctrl_no_more_dslot = ((((|or1200_cpu_or1200_ctrl_ex_branch_op) & ~|or1200_cpu_or1200_ctrl_id_void) & or1200_cpu_or1200_ctrl_ex_branch_taken) | (or1200_cpu_or1200_ctrl_ex_branch_op == 3'h6));

  //assertion( or1200_cpu_or1200_ctrl_no_more_dslot = bvredor(or1200_cpu_or1200_ctrl_ex_branch_op) & ~bvredor(or1200_cpu_or1200_ctrl_id_void) & or1200_cpu_or1200_ctrl_ex_branch_taken | If((6 == or1200_cpu_or1200_ctrl_ex_branch_op) == True, 1, 0)) 512
    assign or1200_cpu_or1200_ctrl_id_void = ((or1200_cpu_or1200_ctrl_id_insn[31:26] == 6'h05) & or1200_cpu_or1200_ctrl_id_insn[16]);

  //assertion( or1200_cpu_or1200_ctrl_id_void = If((5 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0) & Extract(16, 16, or1200_cpu_or1200_ctrl_id_insn)) 513
    assign or1200_cpu_or1200_ctrl_ex_void = ((or1200_cpu_or1200_ctrl_ex_insn[31:26] == 6'h05) & or1200_cpu_or1200_ctrl_ex_insn[16]);

  //assertion( or1200_cpu_or1200_ctrl_ex_void = If((5 == Extract(31, 26, or1200_cpu_or1200_ctrl_ex_insn)) == True, 1, 0) & Extract(16, 16, or1200_cpu_or1200_ctrl_ex_insn)) 514
    assign or1200_cpu_or1200_ctrl_wb_void = ((or1200_cpu_or1200_ctrl_wb_insn[31:26] == 6'h05) & or1200_cpu_or1200_ctrl_wb_insn[16]);

  //assertion( or1200_cpu_or1200_ctrl_wb_void = If((5 == Extract(31, 26, or1200_cpu_or1200_ctrl_wb_insn)) == True, 1, 0) & Extract(16, 16, or1200_cpu_or1200_ctrl_wb_insn)) 515
    assign or1200_cpu_or1200_ctrl_ex_spr_write = (or1200_cpu_or1200_ctrl_spr_write & ~|or1200_cpu_or1200_ctrl_abort_mvspr);

  //assertion( or1200_cpu_or1200_ctrl_ex_spr_write = or1200_cpu_or1200_ctrl_spr_write & ~bvredor(or1200_cpu_or1200_ctrl_abort_mvspr)) 516
    assign or1200_cpu_or1200_ctrl_ex_spr_read = (or1200_cpu_or1200_ctrl_spr_read & ~|or1200_cpu_or1200_ctrl_abort_mvspr);

  //assertion( or1200_cpu_or1200_ctrl_ex_spr_read = or1200_cpu_or1200_ctrl_spr_read & ~bvredor(or1200_cpu_or1200_ctrl_abort_mvspr)) 517
    assign or1200_cpu_or1200_ctrl_if_flushpipe = (((or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we) | or1200_cpu_or1200_ctrl_extend_flush) | or1200_cpu_or1200_ctrl_du_flush_pipe);

  //assertion( or1200_cpu_or1200_ctrl_if_flushpipe = or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we | or1200_cpu_or1200_ctrl_extend_flush | or1200_cpu_or1200_ctrl_du_flush_pipe) 518
    assign or1200_cpu_or1200_ctrl_id_flushpipe = (((or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we) | or1200_cpu_or1200_ctrl_extend_flush) | or1200_cpu_or1200_ctrl_du_flush_pipe);

  //assertion( or1200_cpu_or1200_ctrl_id_flushpipe = or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we | or1200_cpu_or1200_ctrl_extend_flush | or1200_cpu_or1200_ctrl_du_flush_pipe) 519
    assign or1200_cpu_or1200_ctrl_ex_flushpipe = (((or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we) | or1200_cpu_or1200_ctrl_extend_flush) | or1200_cpu_or1200_ctrl_du_flush_pipe);

  //assertion( or1200_cpu_or1200_ctrl_ex_flushpipe = or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we | or1200_cpu_or1200_ctrl_extend_flush | or1200_cpu_or1200_ctrl_du_flush_pipe) 520
    assign or1200_cpu_or1200_ctrl_wb_flushpipe = (((or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we) | or1200_cpu_or1200_ctrl_extend_flush) | or1200_cpu_or1200_ctrl_du_flush_pipe);

  //assertion( or1200_cpu_or1200_ctrl_wb_flushpipe = or1200_cpu_or1200_ctrl_except_flushpipe | or1200_cpu_or1200_ctrl_pc_we | or1200_cpu_or1200_ctrl_extend_flush | or1200_cpu_or1200_ctrl_du_flush_pipe) 521
    assign or1200_cpu_or1200_ctrl_rfe = ((or1200_cpu_or1200_ctrl_id_branch_op == 3'h6) | (or1200_cpu_or1200_ctrl_ex_branch_op == 3'h6));

  //assertion( or1200_cpu_or1200_ctrl_rfe = If((6 == or1200_cpu_or1200_ctrl_id_branch_op) == True, 1, 0) | If((6 == or1200_cpu_or1200_ctrl_ex_branch_op) == True, 1, 0)) 522
    assign or1200_cpu_or1200_ctrl_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_ctrl_clk = or1200_cpu_clk) 523
    assign or1200_cpu_or1200_ctrl_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_ctrl_rst = or1200_cpu_rst) 524
    assign or1200_cpu_or1200_ctrl_except_flushpipe = or1200_cpu_except_flushpipe;

  //assertion( or1200_cpu_or1200_ctrl_except_flushpipe = or1200_cpu_except_flushpipe) 525
    assign or1200_cpu_or1200_ctrl_extend_flush = or1200_cpu_extend_flush;

  //assertion( or1200_cpu_or1200_ctrl_extend_flush = or1200_cpu_extend_flush) 526
    assign or1200_cpu_if_flushpipe = or1200_cpu_or1200_ctrl_if_flushpipe;

  //assertion( or1200_cpu_if_flushpipe = or1200_cpu_or1200_ctrl_if_flushpipe) 527
    assign or1200_cpu_id_flushpipe = or1200_cpu_or1200_ctrl_id_flushpipe;

  //assertion( or1200_cpu_id_flushpipe = or1200_cpu_or1200_ctrl_id_flushpipe) 528
    assign or1200_cpu_ex_flushpipe = or1200_cpu_or1200_ctrl_ex_flushpipe;

  //assertion( or1200_cpu_ex_flushpipe = or1200_cpu_or1200_ctrl_ex_flushpipe) 529
    assign or1200_cpu_wb_flushpipe = or1200_cpu_or1200_ctrl_wb_flushpipe;

  //assertion( or1200_cpu_wb_flushpipe = or1200_cpu_or1200_ctrl_wb_flushpipe) 530
    assign or1200_cpu_or1200_ctrl_id_freeze = or1200_cpu_id_freeze;

  //assertion( or1200_cpu_or1200_ctrl_id_freeze = or1200_cpu_id_freeze) 531
    assign or1200_cpu_or1200_ctrl_ex_freeze = or1200_cpu_ex_freeze;

  //assertion( or1200_cpu_or1200_ctrl_ex_freeze = or1200_cpu_ex_freeze) 532
    assign or1200_cpu_or1200_ctrl_wb_freeze = or1200_cpu_wb_freeze;

  //assertion( or1200_cpu_or1200_ctrl_wb_freeze = or1200_cpu_wb_freeze) 533
    assign or1200_cpu_or1200_ctrl_if_insn = or1200_cpu_if_insn;

  //assertion( or1200_cpu_or1200_ctrl_if_insn = or1200_cpu_if_insn) 534
    assign or1200_cpu_id_insn = or1200_cpu_or1200_ctrl_id_insn;

  //assertion( or1200_cpu_id_insn = or1200_cpu_or1200_ctrl_id_insn) 535
    assign or1200_cpu_ex_insn = or1200_cpu_or1200_ctrl_ex_insn;

  //assertion( or1200_cpu_ex_insn = or1200_cpu_or1200_ctrl_ex_insn) 536
    assign or1200_cpu_or1200_ctrl_abort_mvspr = or1200_cpu_abort_mvspr;

  //assertion( or1200_cpu_or1200_ctrl_abort_mvspr = or1200_cpu_abort_mvspr) 537
    assign or1200_cpu_pre_branch_op = or1200_cpu_or1200_ctrl_id_branch_op;

  //assertion( or1200_cpu_pre_branch_op = or1200_cpu_or1200_ctrl_id_branch_op) 538
    assign or1200_cpu_branch_op = or1200_cpu_or1200_ctrl_ex_branch_op;

  //assertion( or1200_cpu_branch_op = or1200_cpu_or1200_ctrl_ex_branch_op) 539
    assign or1200_cpu_or1200_ctrl_ex_branch_taken = or1200_cpu_ex_branch_taken;

  //assertion( or1200_cpu_or1200_ctrl_ex_branch_taken = or1200_cpu_ex_branch_taken) 540
    assign or1200_cpu_or1200_ctrl_pc_we = or1200_cpu_pc_we;

  //assertion( or1200_cpu_or1200_ctrl_pc_we = or1200_cpu_pc_we) 541
    assign or1200_cpu_rf_addra = or1200_cpu_or1200_ctrl_rf_addra;

  //assertion( or1200_cpu_rf_addra = or1200_cpu_or1200_ctrl_rf_addra) 542
    assign or1200_cpu_rf_addrb = or1200_cpu_or1200_ctrl_rf_addrb;

  //assertion( or1200_cpu_rf_addrb = or1200_cpu_or1200_ctrl_rf_addrb) 543
    assign or1200_cpu_rf_rda = or1200_cpu_or1200_ctrl_rf_rda;

  //assertion( or1200_cpu_rf_rda = or1200_cpu_or1200_ctrl_rf_rda) 544
    assign or1200_cpu_rf_rdb = or1200_cpu_or1200_ctrl_rf_rdb;

  //assertion( or1200_cpu_rf_rdb = or1200_cpu_or1200_ctrl_rf_rdb) 545
    assign or1200_cpu_alu_op = or1200_cpu_or1200_ctrl_alu_op;

  //assertion( or1200_cpu_alu_op = or1200_cpu_or1200_ctrl_alu_op) 546
    assign or1200_cpu_alu_op2 = or1200_cpu_or1200_ctrl_alu_op2;

  //assertion( or1200_cpu_alu_op2 = or1200_cpu_or1200_ctrl_alu_op2) 547
    assign or1200_cpu_mac_op = or1200_cpu_or1200_ctrl_mac_op;

  //assertion( or1200_cpu_mac_op = or1200_cpu_or1200_ctrl_mac_op) 548
    assign or1200_cpu_comp_op = or1200_cpu_or1200_ctrl_comp_op;

  //assertion( or1200_cpu_comp_op = or1200_cpu_or1200_ctrl_comp_op) 549
    assign or1200_cpu_rf_addrw = or1200_cpu_or1200_ctrl_rf_addrw;

  //assertion( or1200_cpu_rf_addrw = or1200_cpu_or1200_ctrl_rf_addrw) 550
    assign or1200_cpu_rfwb_op = or1200_cpu_or1200_ctrl_rfwb_op;

  //assertion( or1200_cpu_rfwb_op = or1200_cpu_or1200_ctrl_rfwb_op) 551
    assign or1200_cpu_fpu_op = or1200_cpu_or1200_ctrl_fpu_op;

  //assertion( or1200_cpu_fpu_op = or1200_cpu_or1200_ctrl_fpu_op) 552
    assign or1200_cpu_wb_insn = or1200_cpu_or1200_ctrl_wb_insn;

  //assertion( or1200_cpu_wb_insn = or1200_cpu_or1200_ctrl_wb_insn) 553
    assign or1200_cpu_id_simm = or1200_cpu_or1200_ctrl_id_simm;

  //assertion( or1200_cpu_id_simm = or1200_cpu_or1200_ctrl_id_simm) 554
    assign or1200_cpu_ex_simm = or1200_cpu_or1200_ctrl_ex_simm;

  //assertion( or1200_cpu_ex_simm = or1200_cpu_or1200_ctrl_ex_simm) 555
    assign or1200_cpu_id_branch_addrtarget = or1200_cpu_or1200_ctrl_id_branch_addrtarget;

  //assertion( or1200_cpu_id_branch_addrtarget = or1200_cpu_or1200_ctrl_id_branch_addrtarget) 556
    assign or1200_cpu_ex_branch_addrtarget = or1200_cpu_or1200_ctrl_ex_branch_addrtarget;

  //assertion( or1200_cpu_ex_branch_addrtarget = or1200_cpu_or1200_ctrl_ex_branch_addrtarget) 557
    assign or1200_cpu_sel_a = or1200_cpu_or1200_ctrl_sel_a;

  //assertion( or1200_cpu_sel_a = or1200_cpu_or1200_ctrl_sel_a) 558
    assign or1200_cpu_sel_b = or1200_cpu_or1200_ctrl_sel_b;

  //assertion( or1200_cpu_sel_b = or1200_cpu_or1200_ctrl_sel_b) 559
    assign or1200_cpu_id_lsu_op = or1200_cpu_or1200_ctrl_id_lsu_op;

  //assertion( or1200_cpu_id_lsu_op = or1200_cpu_or1200_ctrl_id_lsu_op) 560
    assign or1200_cpu_cust5_op = or1200_cpu_or1200_ctrl_cust5_op;

  //assertion( or1200_cpu_cust5_op = or1200_cpu_or1200_ctrl_cust5_op) 561
    assign or1200_cpu_cust5_limm = or1200_cpu_or1200_ctrl_cust5_limm;

  //assertion( or1200_cpu_cust5_limm = or1200_cpu_or1200_ctrl_cust5_limm) 562
    assign or1200_cpu_or1200_ctrl_id_pc = or1200_cpu_id_pc;

  //assertion( or1200_cpu_or1200_ctrl_id_pc = or1200_cpu_id_pc) 563
    assign or1200_cpu_or1200_ctrl_ex_pc = or1200_cpu_ex_pc;

  //assertion( or1200_cpu_or1200_ctrl_ex_pc = or1200_cpu_ex_pc) 564
    assign or1200_cpu_or1200_ctrl_du_hwbkpt = or1200_cpu_du_hwbkpt;

  //assertion( or1200_cpu_or1200_ctrl_du_hwbkpt = or1200_cpu_du_hwbkpt) 565
    assign or1200_cpu_multicycle = or1200_cpu_or1200_ctrl_multicycle;

  //assertion( or1200_cpu_multicycle = or1200_cpu_or1200_ctrl_multicycle) 566
    assign or1200_cpu_wait_on = or1200_cpu_or1200_ctrl_wait_on;

  //assertion( or1200_cpu_wait_on = or1200_cpu_or1200_ctrl_wait_on) 567
    assign or1200_cpu_or1200_ctrl_wbforw_valid = or1200_cpu_wbforw_valid;

  //assertion( or1200_cpu_or1200_ctrl_wbforw_valid = or1200_cpu_wbforw_valid) 568
    assign or1200_cpu_sig_syscall = or1200_cpu_or1200_ctrl_sig_syscall;

  //assertion( or1200_cpu_sig_syscall = or1200_cpu_or1200_ctrl_sig_syscall) 569
    assign or1200_cpu_sig_trap = or1200_cpu_or1200_ctrl_sig_trap;

  //assertion( or1200_cpu_sig_trap = or1200_cpu_or1200_ctrl_sig_trap) 570
    assign or1200_cpu_force_dslot_fetch = or1200_cpu_or1200_ctrl_force_dslot_fetch;

  //assertion( or1200_cpu_force_dslot_fetch = or1200_cpu_or1200_ctrl_force_dslot_fetch) 571
    assign or1200_cpu_no_more_dslot = or1200_cpu_or1200_ctrl_no_more_dslot;

  //assertion( or1200_cpu_no_more_dslot = or1200_cpu_or1200_ctrl_no_more_dslot) 572
    assign or1200_cpu_id_void = or1200_cpu_or1200_ctrl_id_void;

  //assertion( or1200_cpu_id_void = or1200_cpu_or1200_ctrl_id_void) 573
    assign or1200_cpu_ex_void = or1200_cpu_or1200_ctrl_ex_void;

  //assertion( or1200_cpu_ex_void = or1200_cpu_or1200_ctrl_ex_void) 574
    assign or1200_cpu_ex_spr_read = or1200_cpu_or1200_ctrl_ex_spr_read;

  //assertion( or1200_cpu_ex_spr_read = or1200_cpu_or1200_ctrl_ex_spr_read) 575
    assign or1200_cpu_ex_spr_write = or1200_cpu_or1200_ctrl_ex_spr_write;

  //assertion( or1200_cpu_ex_spr_write = or1200_cpu_or1200_ctrl_ex_spr_write) 576
    assign or1200_cpu_or1200_ctrl_du_flush_pipe = or1200_cpu_du_flush_pipe;

  //assertion( or1200_cpu_or1200_ctrl_du_flush_pipe = or1200_cpu_du_flush_pipe) 577
    assign or1200_cpu_id_mac_op = or1200_cpu_or1200_ctrl_id_mac_op;

  //assertion( or1200_cpu_id_mac_op = or1200_cpu_or1200_ctrl_id_mac_op) 578
    assign or1200_cpu_id_macrc_op = or1200_cpu_or1200_ctrl_id_macrc_op;

  //assertion( or1200_cpu_id_macrc_op = or1200_cpu_or1200_ctrl_id_macrc_op) 579
    assign or1200_cpu_ex_macrc_op = or1200_cpu_or1200_ctrl_ex_macrc_op;

  //assertion( or1200_cpu_ex_macrc_op = or1200_cpu_or1200_ctrl_ex_macrc_op) 580
    assign or1200_cpu_rfe = or1200_cpu_or1200_ctrl_rfe;

  //assertion( or1200_cpu_rfe = or1200_cpu_or1200_ctrl_rfe) 581
    assign or1200_cpu_except_illegal = or1200_cpu_or1200_ctrl_except_illegal;

  //assertion( or1200_cpu_except_illegal = or1200_cpu_or1200_ctrl_except_illegal) 582
    assign or1200_cpu_dc_no_writethrough = or1200_cpu_or1200_ctrl_dc_no_writethrough;

  //assertion( or1200_cpu_dc_no_writethrough = or1200_cpu_or1200_ctrl_dc_no_writethrough) 583
    assign or1200_cpu_or1200_rf_spr_cs_fe = (or1200_cpu_or1200_rf_spr_du_cs & ~|(or1200_cpu_or1200_rf_spr_cs & or1200_cpu_or1200_rf_du_read));

  //assertion( or1200_cpu_or1200_rf_spr_cs_fe = or1200_cpu_or1200_rf_spr_du_cs & ~bvredor(or1200_cpu_or1200_rf_spr_cs & or1200_cpu_or1200_rf_du_read)) 584
    assign or1200_cpu_or1200_rf_spr_valid = (or1200_cpu_or1200_rf_spr_cs & (or1200_cpu_or1200_rf_spr_addr[10:5] == 6'h20));

  //assertion( or1200_cpu_or1200_rf_spr_valid = or1200_cpu_or1200_rf_spr_cs & If((32 == Extract(10, 5, or1200_cpu_or1200_rf_spr_addr)) == True, 1, 0)) 585
    assign or1200_cpu_or1200_rf_spr_dat_o = or1200_cpu_or1200_rf_from_rfa;

  //assertion( or1200_cpu_or1200_rf_spr_dat_o = or1200_cpu_or1200_rf_from_rfa) 586
    assign or1200_cpu_or1200_rf_dataa = or1200_cpu_or1200_rf_from_rfa;

  //assertion( or1200_cpu_or1200_rf_dataa = or1200_cpu_or1200_rf_from_rfa) 587
    assign or1200_cpu_or1200_rf_datab = or1200_cpu_or1200_rf_from_rfb;

  //assertion( or1200_cpu_or1200_rf_datab = or1200_cpu_or1200_rf_from_rfb) 588
    assign or1200_cpu_or1200_rf_rf_we = (((or1200_cpu_or1200_rf_spr_valid & or1200_cpu_or1200_rf_spr_write) | (or1200_cpu_or1200_rf_we & (~or1200_cpu_or1200_rf_wb_freeze))) & or1200_cpu_or1200_rf_rf_we_allow);

  //assertion( or1200_cpu_or1200_rf_rf_we = (or1200_cpu_or1200_rf_spr_valid & or1200_cpu_or1200_rf_spr_write | or1200_cpu_or1200_rf_we & ~or1200_cpu_or1200_rf_wb_freeze) & or1200_cpu_or1200_rf_rf_we_allow) 589
    assign or1200_cpu_or1200_rf_cy_we_o = ((or1200_cpu_or1200_rf_cy_we_i & (~or1200_cpu_or1200_rf_wb_freeze)) & or1200_cpu_or1200_rf_rf_we_allow);

  //assertion( or1200_cpu_or1200_rf_cy_we_o = or1200_cpu_or1200_rf_cy_we_i & ~or1200_cpu_or1200_rf_wb_freeze & or1200_cpu_or1200_rf_rf_we_allow) 590
    assign or1200_cpu_or1200_rf_rf_ena = (((or1200_cpu_or1200_rf_rda & (~or1200_cpu_or1200_rf_id_freeze)) | (or1200_cpu_or1200_rf_spr_valid & ~|or1200_cpu_or1200_rf_spr_write)) | or1200_cpu_or1200_rf_spr_cs_fe);

  //assertion( or1200_cpu_or1200_rf_rf_ena = or1200_cpu_or1200_rf_rda & ~or1200_cpu_or1200_rf_id_freeze | or1200_cpu_or1200_rf_spr_valid & ~bvredor(or1200_cpu_or1200_rf_spr_write) | or1200_cpu_or1200_rf_spr_cs_fe) 591
    assign or1200_cpu_or1200_rf_rf_enb = (or1200_cpu_or1200_rf_rdb & (~or1200_cpu_or1200_rf_id_freeze));

  //assertion( or1200_cpu_or1200_rf_rf_enb = or1200_cpu_or1200_rf_rdb & ~or1200_cpu_or1200_rf_id_freeze) 592
    assign or1200_cpu_or1200_rf_rf_a_clk_a = or1200_cpu_or1200_rf_clk;

  //assertion( or1200_cpu_or1200_rf_rf_a_clk_a = or1200_cpu_or1200_rf_clk) 593
    assign or1200_cpu_or1200_rf_rf_a_ce_a = or1200_cpu_or1200_rf_rf_ena;

  //assertion( or1200_cpu_or1200_rf_rf_a_ce_a = or1200_cpu_or1200_rf_rf_ena) 594
    assign or1200_cpu_or1200_rf_rf_a_addr_a = or1200_cpu_or1200_rf_rf_addra;

  //assertion( or1200_cpu_or1200_rf_rf_a_addr_a = or1200_cpu_or1200_rf_rf_addra) 595
    assign or1200_cpu_or1200_rf_from_rfa = or1200_cpu_or1200_rf_rf_a_do_a;

  //assertion( or1200_cpu_or1200_rf_from_rfa = or1200_cpu_or1200_rf_rf_a_do_a) 596
    assign or1200_cpu_or1200_rf_rf_a_clk_b = or1200_cpu_or1200_rf_clk;

  //assertion( or1200_cpu_or1200_rf_rf_a_clk_b = or1200_cpu_or1200_rf_clk) 597
    assign or1200_cpu_or1200_rf_rf_a_ce_b = or1200_cpu_or1200_rf_rf_we;

  //assertion( or1200_cpu_or1200_rf_rf_a_ce_b = or1200_cpu_or1200_rf_rf_we) 598
    assign or1200_cpu_or1200_rf_rf_a_we_b = or1200_cpu_or1200_rf_rf_we;

  //assertion( or1200_cpu_or1200_rf_rf_a_we_b = or1200_cpu_or1200_rf_rf_we) 599
    assign or1200_cpu_or1200_rf_rf_a_addr_b = or1200_cpu_or1200_rf_rf_addrw;

  //assertion( or1200_cpu_or1200_rf_rf_a_addr_b = or1200_cpu_or1200_rf_rf_addrw) 600
    assign or1200_cpu_or1200_rf_rf_a_di_b = or1200_cpu_or1200_rf_rf_dataw;

  //assertion( or1200_cpu_or1200_rf_rf_a_di_b = or1200_cpu_or1200_rf_rf_dataw) 601
    assign or1200_cpu_or1200_rf_rf_b_clk_a = or1200_cpu_or1200_rf_clk;

  //assertion( or1200_cpu_or1200_rf_rf_b_clk_a = or1200_cpu_or1200_rf_clk) 602
    assign or1200_cpu_or1200_rf_rf_b_ce_a = or1200_cpu_or1200_rf_rf_enb;

  //assertion( or1200_cpu_or1200_rf_rf_b_ce_a = or1200_cpu_or1200_rf_rf_enb) 603
    assign or1200_cpu_or1200_rf_rf_b_addr_a = or1200_cpu_or1200_rf_addrb;

  //assertion( or1200_cpu_or1200_rf_rf_b_addr_a = or1200_cpu_or1200_rf_addrb) 604
    assign or1200_cpu_or1200_rf_from_rfb = or1200_cpu_or1200_rf_rf_b_do_a;

  //assertion( or1200_cpu_or1200_rf_from_rfb = or1200_cpu_or1200_rf_rf_b_do_a) 605
    assign or1200_cpu_or1200_rf_rf_b_clk_b = or1200_cpu_or1200_rf_clk;

  //assertion( or1200_cpu_or1200_rf_rf_b_clk_b = or1200_cpu_or1200_rf_clk) 606
    assign or1200_cpu_or1200_rf_rf_b_ce_b = or1200_cpu_or1200_rf_rf_we;

  //assertion( or1200_cpu_or1200_rf_rf_b_ce_b = or1200_cpu_or1200_rf_rf_we) 607
    assign or1200_cpu_or1200_rf_rf_b_we_b = or1200_cpu_or1200_rf_rf_we;

  //assertion( or1200_cpu_or1200_rf_rf_b_we_b = or1200_cpu_or1200_rf_rf_we) 608
    assign or1200_cpu_or1200_rf_rf_b_addr_b = or1200_cpu_or1200_rf_rf_addrw;

  //assertion( or1200_cpu_or1200_rf_rf_b_addr_b = or1200_cpu_or1200_rf_rf_addrw) 609
    assign or1200_cpu_or1200_rf_rf_b_di_b = or1200_cpu_or1200_rf_rf_dataw;

  //assertion( or1200_cpu_or1200_rf_rf_b_di_b = or1200_cpu_or1200_rf_rf_dataw) 610
    assign or1200_cpu_or1200_rf_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_rf_clk = or1200_cpu_clk) 611
    assign or1200_cpu_or1200_rf_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_rf_rst = or1200_cpu_rst) 612
    assign or1200_cpu_or1200_rf_cy_we_i = or1200_cpu_cy_we_alu;

  //assertion( or1200_cpu_or1200_rf_cy_we_i = or1200_cpu_cy_we_alu) 613
    assign or1200_cpu_cy_we_rf = or1200_cpu_or1200_rf_cy_we_o;

  //assertion( or1200_cpu_cy_we_rf = or1200_cpu_or1200_rf_cy_we_o) 614
    assign or1200_cpu_or1200_rf_wb_freeze = or1200_cpu_wb_freeze;

  //assertion( or1200_cpu_or1200_rf_wb_freeze = or1200_cpu_wb_freeze) 615
    assign or1200_cpu_or1200_rf_addrw = or1200_cpu_rf_addrw;

  //assertion( or1200_cpu_or1200_rf_addrw = or1200_cpu_rf_addrw) 616
    assign or1200_cpu_or1200_rf_dataw = or1200_cpu_rf_dataw;

  //assertion( or1200_cpu_or1200_rf_dataw = or1200_cpu_rf_dataw) 617
    assign or1200_cpu_or1200_rf_flushpipe = or1200_cpu_wb_flushpipe;

  //assertion( or1200_cpu_or1200_rf_flushpipe = or1200_cpu_wb_flushpipe) 618
    assign or1200_cpu_or1200_rf_id_freeze = or1200_cpu_id_freeze;

  //assertion( or1200_cpu_or1200_rf_id_freeze = or1200_cpu_id_freeze) 619
    assign or1200_cpu_or1200_rf_addra = or1200_cpu_rf_addra;

  //assertion( or1200_cpu_or1200_rf_addra = or1200_cpu_rf_addra) 620
    assign or1200_cpu_or1200_rf_addrb = or1200_cpu_rf_addrb;

  //assertion( or1200_cpu_or1200_rf_addrb = or1200_cpu_rf_addrb) 621
    assign or1200_cpu_rf_dataa = or1200_cpu_or1200_rf_dataa;

  //assertion( or1200_cpu_rf_dataa = or1200_cpu_or1200_rf_dataa) 622
    assign or1200_cpu_rf_datab = or1200_cpu_or1200_rf_datab;

  //assertion( or1200_cpu_rf_datab = or1200_cpu_or1200_rf_datab) 623
    assign or1200_cpu_or1200_rf_rda = or1200_cpu_rf_rda;

  //assertion( or1200_cpu_or1200_rf_rda = or1200_cpu_rf_rda) 624
    assign or1200_cpu_or1200_rf_rdb = or1200_cpu_rf_rdb;

  //assertion( or1200_cpu_or1200_rf_rdb = or1200_cpu_rf_rdb) 625
    assign or1200_cpu_or1200_rf_spr_write = or1200_cpu_spr_we;

  //assertion( or1200_cpu_or1200_rf_spr_write = or1200_cpu_spr_we) 626
    assign or1200_cpu_or1200_rf_spr_addr = or1200_cpu_spr_addr;

  //assertion( or1200_cpu_or1200_rf_spr_addr = or1200_cpu_spr_addr) 627
    assign or1200_cpu_or1200_rf_spr_dat_i = or1200_cpu_spr_dat_cpu;

  //assertion( or1200_cpu_or1200_rf_spr_dat_i = or1200_cpu_spr_dat_cpu) 628
    assign or1200_cpu_spr_dat_rf = or1200_cpu_or1200_rf_spr_dat_o;

  //assertion( or1200_cpu_spr_dat_rf = or1200_cpu_or1200_rf_spr_dat_o) 629
    assign or1200_cpu_or1200_rf_du_read = or1200_cpu_du_read;

  //assertion( or1200_cpu_or1200_rf_du_read = or1200_cpu_du_read) 630
    assign or1200_cpu_or1200_operandmuxes_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_operandmuxes_clk = or1200_cpu_clk) 631
    assign or1200_cpu_or1200_operandmuxes_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_operandmuxes_rst = or1200_cpu_rst) 632
    assign or1200_cpu_or1200_operandmuxes_id_freeze = or1200_cpu_id_freeze;

  //assertion( or1200_cpu_or1200_operandmuxes_id_freeze = or1200_cpu_id_freeze) 633
    assign or1200_cpu_or1200_operandmuxes_ex_freeze = or1200_cpu_ex_freeze;

  //assertion( or1200_cpu_or1200_operandmuxes_ex_freeze = or1200_cpu_ex_freeze) 634
    assign or1200_cpu_or1200_operandmuxes_rf_dataa = or1200_cpu_rf_dataa;

  //assertion( or1200_cpu_or1200_operandmuxes_rf_dataa = or1200_cpu_rf_dataa) 635
    assign or1200_cpu_or1200_operandmuxes_rf_datab = or1200_cpu_rf_datab;

  //assertion( or1200_cpu_or1200_operandmuxes_rf_datab = or1200_cpu_rf_datab) 636
    assign or1200_cpu_or1200_operandmuxes_ex_forw = or1200_cpu_rf_dataw;

  //assertion( or1200_cpu_or1200_operandmuxes_ex_forw = or1200_cpu_rf_dataw) 637
    assign or1200_cpu_or1200_operandmuxes_wb_forw = or1200_cpu_wb_forw;

  //assertion( or1200_cpu_or1200_operandmuxes_wb_forw = or1200_cpu_wb_forw) 638
    assign or1200_cpu_or1200_operandmuxes_simm = or1200_cpu_id_simm;

  //assertion( or1200_cpu_or1200_operandmuxes_simm = or1200_cpu_id_simm) 639
    assign or1200_cpu_or1200_operandmuxes_sel_a = or1200_cpu_sel_a;

  //assertion( or1200_cpu_or1200_operandmuxes_sel_a = or1200_cpu_sel_a) 640
    assign or1200_cpu_or1200_operandmuxes_sel_b = or1200_cpu_sel_b;

  //assertion( or1200_cpu_or1200_operandmuxes_sel_b = or1200_cpu_sel_b) 641
    assign or1200_cpu_operand_a = or1200_cpu_or1200_operandmuxes_operand_a;

  //assertion( or1200_cpu_operand_a = or1200_cpu_or1200_operandmuxes_operand_a) 642
    assign or1200_cpu_operand_b = or1200_cpu_or1200_operandmuxes_operand_b;

  //assertion( or1200_cpu_operand_b = or1200_cpu_or1200_operandmuxes_operand_b) 643
    assign or1200_cpu_muxed_a = or1200_cpu_or1200_operandmuxes_muxed_a;

  //assertion( or1200_cpu_muxed_a = or1200_cpu_or1200_operandmuxes_muxed_a) 644
    assign or1200_cpu_muxed_b = or1200_cpu_or1200_operandmuxes_muxed_b;

  //assertion( or1200_cpu_muxed_b = or1200_cpu_or1200_operandmuxes_muxed_b) 645
    assign or1200_cpu_or1200_alu_cy_sub = or1200_cpu_or1200_alu_a_lt_b;

  //assertion( or1200_cpu_or1200_alu_cy_sub = or1200_cpu_or1200_alu_a_lt_b) 646
    assign or1200_cpu_or1200_alu_ov_sum = ((((~|or1200_cpu_or1200_alu_a[31] & ~|or1200_cpu_or1200_alu_b_mux[31]) & or1200_cpu_or1200_alu_result_sum[31]) | (((~|or1200_cpu_or1200_alu_a[31] & or1200_cpu_or1200_alu_b_mux[31]) & or1200_cpu_or1200_alu_result_sum[31]) & (or1200_cpu_or1200_alu_alu_op == 5'h02))) | ((or1200_cpu_or1200_alu_a[31] & or1200_cpu_or1200_alu_b_mux[31]) & ~|or1200_cpu_or1200_alu_result_sum[31]));

  //assertion( or1200_cpu_or1200_alu_ov_sum = ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_a)) & ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_b_mux)) & Extract(31, 31, or1200_cpu_or1200_alu_result_sum) | ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_a)) & Extract(31, 31, or1200_cpu_or1200_alu_b_mux) & Extract(31, 31, or1200_cpu_or1200_alu_result_sum) & If((2 == or1200_cpu_or1200_alu_alu_op) == True, 1, 0) | Extract(31, 31, or1200_cpu_or1200_alu_a) & Extract(31, 31, or1200_cpu_or1200_alu_b_mux) & ~bvredor(Extract(31, 31, or1200_cpu_or1200_alu_result_sum))) 647
    assign or1200_cpu_or1200_alu_result_and = (or1200_cpu_or1200_alu_a & or1200_cpu_or1200_alu_b);

  //assertion( or1200_cpu_or1200_alu_result_and = or1200_cpu_or1200_alu_a & or1200_cpu_or1200_alu_b) 648
    assign or1200_cpu_or1200_alu_a = or1200_cpu_operand_a;

  //assertion( or1200_cpu_or1200_alu_a = or1200_cpu_operand_a) 649
    assign or1200_cpu_or1200_alu_b = or1200_cpu_operand_b;

  //assertion( or1200_cpu_or1200_alu_b = or1200_cpu_operand_b) 650
    assign or1200_cpu_or1200_alu_mult_mac_result = or1200_cpu_mult_mac_result;

  //assertion( or1200_cpu_or1200_alu_mult_mac_result = or1200_cpu_mult_mac_result) 651
    assign or1200_cpu_or1200_alu_macrc_op = or1200_cpu_ex_macrc_op;

  //assertion( or1200_cpu_or1200_alu_macrc_op = or1200_cpu_ex_macrc_op) 652
    assign or1200_cpu_or1200_alu_alu_op = or1200_cpu_alu_op;

  //assertion( or1200_cpu_or1200_alu_alu_op = or1200_cpu_alu_op) 653
    assign or1200_cpu_or1200_alu_alu_op2 = or1200_cpu_alu_op2;

  //assertion( or1200_cpu_or1200_alu_alu_op2 = or1200_cpu_alu_op2) 654
    assign or1200_cpu_or1200_alu_comp_op = or1200_cpu_comp_op;

  //assertion( or1200_cpu_or1200_alu_comp_op = or1200_cpu_comp_op) 655
    assign or1200_cpu_or1200_alu_cust5_op = or1200_cpu_cust5_op;

  //assertion( or1200_cpu_or1200_alu_cust5_op = or1200_cpu_cust5_op) 656
    assign or1200_cpu_or1200_alu_cust5_limm = or1200_cpu_cust5_limm;

  //assertion( or1200_cpu_or1200_alu_cust5_limm = or1200_cpu_cust5_limm) 657
    assign or1200_cpu_alu_dataout = or1200_cpu_or1200_alu_result;

  //assertion( or1200_cpu_alu_dataout = or1200_cpu_or1200_alu_result) 658
    assign or1200_cpu_flagforw_alu = or1200_cpu_or1200_alu_flagforw;

  //assertion( or1200_cpu_flagforw_alu = or1200_cpu_or1200_alu_flagforw) 659
    assign or1200_cpu_flag_we_alu = or1200_cpu_or1200_alu_flag_we;

  //assertion( or1200_cpu_flag_we_alu = or1200_cpu_or1200_alu_flag_we) 660
    assign or1200_cpu_ovforw = or1200_cpu_or1200_alu_ovforw;

  //assertion( or1200_cpu_ovforw = or1200_cpu_or1200_alu_ovforw) 661
    assign or1200_cpu_ov_we_alu = or1200_cpu_or1200_alu_ov_we;

  //assertion( or1200_cpu_ov_we_alu = or1200_cpu_or1200_alu_ov_we) 662
    assign or1200_cpu_cyforw = or1200_cpu_or1200_alu_cyforw;

  //assertion( or1200_cpu_cyforw = or1200_cpu_or1200_alu_cyforw) 663
    assign or1200_cpu_cy_we_alu = or1200_cpu_or1200_alu_cy_we;

  //assertion( or1200_cpu_cy_we_alu = or1200_cpu_or1200_alu_cy_we) 664
    assign or1200_cpu_or1200_alu_carry = or1200_cpu_carry;

  //assertion( or1200_cpu_or1200_alu_carry = or1200_cpu_carry) 665
    assign or1200_cpu_or1200_alu_flag = or1200_cpu_flag;

  //assertion( or1200_cpu_or1200_alu_flag = or1200_cpu_flag) 666
    assign or1200_cpu_fpu_except_started = (or1200_cpu_except_started & (or1200_cpu_except_type == 4'hd));

  //assertion( or1200_cpu_fpu_except_started = or1200_cpu_except_started & If((13 == or1200_cpu_except_type) == True, 1, 0)) 667
    assign or1200_cpu_or1200_fpu_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_fpu_clk = or1200_cpu_clk) 668
    assign or1200_cpu_or1200_fpu_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_fpu_rst = or1200_cpu_rst) 669
    assign or1200_cpu_or1200_fpu_ex_freeze = or1200_cpu_ex_freeze;

  //assertion( or1200_cpu_or1200_fpu_ex_freeze = or1200_cpu_ex_freeze) 670
    assign or1200_cpu_or1200_fpu_a = or1200_cpu_operand_a;

  //assertion( or1200_cpu_or1200_fpu_a = or1200_cpu_operand_a) 671
    assign or1200_cpu_or1200_fpu_b = or1200_cpu_operand_b;

  //assertion( or1200_cpu_or1200_fpu_b = or1200_cpu_operand_b) 672
    assign or1200_cpu_or1200_fpu_fpu_op = or1200_cpu_fpu_op;

  //assertion( or1200_cpu_or1200_fpu_fpu_op = or1200_cpu_fpu_op) 673
    assign or1200_cpu_fpu_dataout = or1200_cpu_or1200_fpu_result;

  //assertion( or1200_cpu_fpu_dataout = or1200_cpu_or1200_fpu_result) 674
    assign or1200_cpu_fpu_done = or1200_cpu_or1200_fpu_done;

  //assertion( or1200_cpu_fpu_done = or1200_cpu_or1200_fpu_done) 675
    assign or1200_cpu_flagforw_fpu = or1200_cpu_or1200_fpu_flagforw;

  //assertion( or1200_cpu_flagforw_fpu = or1200_cpu_or1200_fpu_flagforw) 676
    assign or1200_cpu_flag_we_fpu = or1200_cpu_or1200_fpu_flag_we;

  //assertion( or1200_cpu_flag_we_fpu = or1200_cpu_or1200_fpu_flag_we) 677
    assign or1200_cpu_sig_fp = or1200_cpu_or1200_fpu_sig_fp;

  //assertion( or1200_cpu_sig_fp = or1200_cpu_or1200_fpu_sig_fp) 678
    assign or1200_cpu_or1200_fpu_except_started = or1200_cpu_fpu_except_started;

  //assertion( or1200_cpu_or1200_fpu_except_started = or1200_cpu_fpu_except_started) 679
    assign or1200_cpu_or1200_fpu_fpcsr_we = or1200_cpu_fpcsr_we;

  //assertion( or1200_cpu_or1200_fpu_fpcsr_we = or1200_cpu_fpcsr_we) 680
    assign or1200_cpu_fpcsr = or1200_cpu_or1200_fpu_fpcsr;

  //assertion( or1200_cpu_fpcsr = or1200_cpu_or1200_fpu_fpcsr) 681
    assign or1200_cpu_or1200_fpu_spr_write = or1200_cpu_spr_we;

  //assertion( or1200_cpu_or1200_fpu_spr_write = or1200_cpu_spr_we) 682
    assign or1200_cpu_or1200_fpu_spr_addr = or1200_cpu_spr_addr;

  //assertion( or1200_cpu_or1200_fpu_spr_addr = or1200_cpu_spr_addr) 683
    assign or1200_cpu_or1200_fpu_spr_dat_i = or1200_cpu_spr_dat_cpu;

  //assertion( or1200_cpu_or1200_fpu_spr_dat_i = or1200_cpu_spr_dat_cpu) 684
    assign or1200_cpu_spr_dat_fpu = or1200_cpu_or1200_fpu_spr_dat_o;

  //assertion( or1200_cpu_spr_dat_fpu = or1200_cpu_or1200_fpu_spr_dat_o) 685
    assign or1200_cpu_or1200_mult_mac_alu_op_mul = (or1200_cpu_or1200_mult_mac_alu_op_smul | or1200_cpu_or1200_mult_mac_alu_op_umul);

  //assertion( or1200_cpu_or1200_mult_mac_alu_op_mul = or1200_cpu_or1200_mult_mac_alu_op_smul | or1200_cpu_or1200_mult_mac_alu_op_umul) 686
    assign or1200_cpu_or1200_mult_mac_alu_op_div = (or1200_cpu_or1200_mult_mac_alu_op_sdiv | or1200_cpu_or1200_mult_mac_alu_op_udiv);

  //assertion( or1200_cpu_or1200_mult_mac_alu_op_div = or1200_cpu_or1200_mult_mac_alu_op_sdiv | or1200_cpu_or1200_mult_mac_alu_op_udiv) 687
    assign or1200_cpu_or1200_mult_mac_div_by_zero = (~|(|or1200_cpu_or1200_mult_mac_b) & or1200_cpu_or1200_mult_mac_alu_op_div);

  //assertion( or1200_cpu_or1200_mult_mac_div_by_zero = ~bvredor(bvredor(or1200_cpu_or1200_mult_mac_b)) & or1200_cpu_or1200_mult_mac_alu_op_div) 688
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1;

  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1) 689
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X = or1200_cpu_or1200_mult_mac_x;

  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X = or1200_cpu_or1200_mult_mac_x) 690
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y = or1200_cpu_or1200_mult_mac_y;

  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y = or1200_cpu_or1200_mult_mac_y) 691
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK = or1200_cpu_or1200_mult_mac_clk;

  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK = or1200_cpu_or1200_mult_mac_clk) 692
    assign or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = or1200_cpu_or1200_mult_mac_rst;

  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = or1200_cpu_or1200_mult_mac_rst) 693
    assign or1200_cpu_or1200_mult_mac_mul_prod = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P;

  //assertion( or1200_cpu_or1200_mult_mac_mul_prod = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_P) 694
    assign or1200_cpu_or1200_mult_mac_mul_stall = ((|or1200_cpu_or1200_mult_mac_mul_stall_count) | ((~|(|or1200_cpu_or1200_mult_mac_mul_stall_count) & or1200_cpu_or1200_mult_mac_alu_op_mul) & ~|or1200_cpu_or1200_mult_mac_ex_freeze_r));

  //assertion( or1200_cpu_or1200_mult_mac_mul_stall = bvredor(or1200_cpu_or1200_mult_mac_mul_stall_count) | ~bvredor(bvredor(or1200_cpu_or1200_mult_mac_mul_stall_count)) & or1200_cpu_or1200_mult_mac_alu_op_mul & ~bvredor(or1200_cpu_or1200_mult_mac_ex_freeze_r)) 695
    assign or1200_cpu_or1200_mult_mac_div_stall = ((|or1200_cpu_or1200_mult_mac_div_cntr) | (~|or1200_cpu_or1200_mult_mac_ex_freeze_r & or1200_cpu_or1200_mult_mac_alu_op_div));

  //assertion( or1200_cpu_or1200_mult_mac_div_stall = bvredor(or1200_cpu_or1200_mult_mac_div_cntr) | ~bvredor(or1200_cpu_or1200_mult_mac_ex_freeze_r) & or1200_cpu_or1200_mult_mac_alu_op_div) 696
    assign or1200_cpu_or1200_mult_mac_mult_mac_stall = ((or1200_cpu_or1200_mult_mac_mac_stall_r | or1200_cpu_or1200_mult_mac_div_stall) | or1200_cpu_or1200_mult_mac_mul_stall);

  //assertion( or1200_cpu_or1200_mult_mac_mult_mac_stall = or1200_cpu_or1200_mult_mac_mac_stall_r | or1200_cpu_or1200_mult_mac_div_stall | or1200_cpu_or1200_mult_mac_mul_stall) 697
    assign or1200_cpu_or1200_mult_mac_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_mult_mac_clk = or1200_cpu_clk) 698
    assign or1200_cpu_or1200_mult_mac_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_mult_mac_rst = or1200_cpu_rst) 699
    assign or1200_cpu_or1200_mult_mac_ex_freeze = or1200_cpu_ex_freeze;

  //assertion( or1200_cpu_or1200_mult_mac_ex_freeze = or1200_cpu_ex_freeze) 700
    assign or1200_cpu_or1200_mult_mac_id_macrc_op = or1200_cpu_id_macrc_op;

  //assertion( or1200_cpu_or1200_mult_mac_id_macrc_op = or1200_cpu_id_macrc_op) 701
    assign or1200_cpu_or1200_mult_mac_macrc_op = or1200_cpu_ex_macrc_op;

  //assertion( or1200_cpu_or1200_mult_mac_macrc_op = or1200_cpu_ex_macrc_op) 702
    assign or1200_cpu_or1200_mult_mac_a = or1200_cpu_operand_a;

  //assertion( or1200_cpu_or1200_mult_mac_a = or1200_cpu_operand_a) 703
    assign or1200_cpu_or1200_mult_mac_b = or1200_cpu_operand_b;

  //assertion( or1200_cpu_or1200_mult_mac_b = or1200_cpu_operand_b) 704
    assign or1200_cpu_or1200_mult_mac_mac_op = or1200_cpu_mac_op;

  //assertion( or1200_cpu_or1200_mult_mac_mac_op = or1200_cpu_mac_op) 705
    assign or1200_cpu_or1200_mult_mac_alu_op = or1200_cpu_alu_op;

  //assertion( or1200_cpu_or1200_mult_mac_alu_op = or1200_cpu_alu_op) 706
    assign or1200_cpu_mult_mac_result = or1200_cpu_or1200_mult_mac_result;

  //assertion( or1200_cpu_mult_mac_result = or1200_cpu_or1200_mult_mac_result) 707
    assign or1200_cpu_mult_mac_stall = or1200_cpu_or1200_mult_mac_mult_mac_stall;

  //assertion( or1200_cpu_mult_mac_stall = or1200_cpu_or1200_mult_mac_mult_mac_stall) 708
    assign or1200_cpu_ovforw_mult_mac = or1200_cpu_or1200_mult_mac_ovforw;

  //assertion( or1200_cpu_ovforw_mult_mac = or1200_cpu_or1200_mult_mac_ovforw) 709
    assign or1200_cpu_ov_we_mult_mac = or1200_cpu_or1200_mult_mac_ov_we;

  //assertion( or1200_cpu_ov_we_mult_mac = or1200_cpu_or1200_mult_mac_ov_we) 710
    assign or1200_cpu_or1200_mult_mac_spr_write = or1200_cpu_spr_we;

  //assertion( or1200_cpu_or1200_mult_mac_spr_write = or1200_cpu_spr_we) 711
    assign or1200_cpu_or1200_mult_mac_spr_addr = or1200_cpu_spr_addr;

  //assertion( or1200_cpu_or1200_mult_mac_spr_addr = or1200_cpu_spr_addr) 712
    assign or1200_cpu_or1200_mult_mac_spr_dat_i = or1200_cpu_spr_dat_cpu;

  //assertion( or1200_cpu_or1200_mult_mac_spr_dat_i = or1200_cpu_spr_dat_cpu) 713
    assign or1200_cpu_spr_dat_mac = or1200_cpu_or1200_mult_mac_spr_dat_o;

  //assertion( or1200_cpu_spr_dat_mac = or1200_cpu_or1200_mult_mac_spr_dat_o) 714
    assign or1200_cpu_or1200_sprs_du_access = (or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write);

  //assertion( or1200_cpu_or1200_sprs_du_access = or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write) 715
    assign or1200_cpu_or1200_sprs_spr_we = (or1200_cpu_or1200_sprs_du_write | (or1200_cpu_or1200_sprs_ex_spr_write & ~|or1200_cpu_or1200_sprs_du_access));

  //assertion( or1200_cpu_or1200_sprs_spr_we = or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_write & ~bvredor(or1200_cpu_or1200_sprs_du_access)) 716
    assign or1200_cpu_or1200_sprs_spr_cs = (or1200_cpu_or1200_sprs_unqualified_cs & { 32{ (((or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write) | or1200_cpu_or1200_sprs_ex_spr_read) | (or1200_cpu_or1200_sprs_ex_spr_write & or1200_cpu_or1200_sprs_sr[0])) } });

  //assertion( or1200_cpu_or1200_sprs_spr_cs = or1200_cpu_or1200_sprs_unqualified_cs & Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(..., ...), ... | ... | ... | ...), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | ... & ...), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, ...)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr)), or1200_cpu_or1200_sprs_du_read | or1200_cpu_or1200_sprs_du_write | or1200_cpu_or1200_sprs_ex_spr_read | or1200_cpu_or1200_sprs_ex_spr_write & Extract(0, 0, or1200_cpu_or1200_sprs_sr))) 717
    assign or1200_cpu_or1200_sprs_cfgr_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:4] == 7'h00));

  //assertion( or1200_cpu_or1200_sprs_cfgr_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((0 == Extract(10, 4, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 718
    assign or1200_cpu_or1200_sprs_rf_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:5] == 6'h20));

  //assertion( or1200_cpu_or1200_sprs_rf_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((32 == Extract(10, 5, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 719
    assign or1200_cpu_or1200_sprs_npc_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h010));

  //assertion( or1200_cpu_or1200_sprs_npc_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((16 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 720
    assign or1200_cpu_or1200_sprs_ppc_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h012));

  //assertion( or1200_cpu_or1200_sprs_ppc_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((18 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 721
    assign or1200_cpu_or1200_sprs_sr_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h011));

  //assertion( or1200_cpu_or1200_sprs_sr_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((17 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 722
    assign or1200_cpu_or1200_sprs_epcr_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h020));

  //assertion( or1200_cpu_or1200_sprs_epcr_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((32 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 723
    assign or1200_cpu_or1200_sprs_eear_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h030));

  //assertion( or1200_cpu_or1200_sprs_eear_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((48 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 724
    assign or1200_cpu_or1200_sprs_esr_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h040));

  //assertion( or1200_cpu_or1200_sprs_esr_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((64 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 725
    assign or1200_cpu_or1200_sprs_fpcsr_sel = (or1200_cpu_or1200_sprs_spr_cs[0] & (or1200_cpu_or1200_sprs_spr_addr[10:0] == 11'h014));

  //assertion( or1200_cpu_or1200_sprs_fpcsr_sel = Extract(0, 0, or1200_cpu_or1200_sprs_spr_cs) & If((20 == Extract(10, 0, or1200_cpu_or1200_sprs_spr_addr)) == True, 1, 0)) 726
    assign or1200_cpu_or1200_sprs_sr_we = (((((or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel) | (or1200_cpu_or1200_sprs_branch_op == 3'h6)) | or1200_cpu_or1200_sprs_flag_we) | or1200_cpu_or1200_sprs_cy_we) | or1200_cpu_or1200_sprs_ov_we);

  //assertion( or1200_cpu_or1200_sprs_sr_we = or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_sr_sel | If((6 == or1200_cpu_or1200_sprs_branch_op) == True, 1, 0) | or1200_cpu_or1200_sprs_flag_we | or1200_cpu_or1200_sprs_cy_we | or1200_cpu_or1200_sprs_ov_we) 727
    assign or1200_cpu_or1200_sprs_pc_we = (or1200_cpu_or1200_sprs_du_write & (or1200_cpu_or1200_sprs_npc_sel | or1200_cpu_or1200_sprs_ppc_sel));

  //assertion( or1200_cpu_or1200_sprs_pc_we = or1200_cpu_or1200_sprs_du_write & (or1200_cpu_or1200_sprs_npc_sel | or1200_cpu_or1200_sprs_ppc_sel)) 728
    assign or1200_cpu_or1200_sprs_epcr_we = (or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_epcr_sel);

  //assertion( or1200_cpu_or1200_sprs_epcr_we = or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_epcr_sel) 729
    assign or1200_cpu_or1200_sprs_eear_we = (or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_eear_sel);

  //assertion( or1200_cpu_or1200_sprs_eear_we = or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_eear_sel) 730
    assign or1200_cpu_or1200_sprs_esr_we = (or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_esr_sel);

  //assertion( or1200_cpu_or1200_sprs_esr_we = or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_esr_sel) 731
    assign or1200_cpu_or1200_sprs_fpcsr_we = (or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_fpcsr_sel);

  //assertion( or1200_cpu_or1200_sprs_fpcsr_we = or1200_cpu_or1200_sprs_spr_we & or1200_cpu_or1200_sprs_fpcsr_sel) 732
    assign or1200_cpu_or1200_sprs_sys_data = (((((((((or1200_cpu_or1200_sprs_spr_dat_cfgr & { 32{ or1200_cpu_or1200_sprs_cfgr_sel } }) | (or1200_cpu_or1200_sprs_spr_dat_rf & { 32{ or1200_cpu_or1200_sprs_rf_sel } })) | (or1200_cpu_or1200_sprs_spr_dat_npc & { 32{ or1200_cpu_or1200_sprs_npc_sel } })) | (or1200_cpu_or1200_sprs_spr_dat_ppc & { 32{ or1200_cpu_or1200_sprs_ppc_sel } })) | ({15'h0000, or1200_cpu_or1200_sprs_sr} & { 32{ or1200_cpu_or1200_sprs_sr_sel } })) | (or1200_cpu_or1200_sprs_epcr & { 32{ or1200_cpu_or1200_sprs_epcr_sel } })) | (or1200_cpu_or1200_sprs_eear & { 32{ or1200_cpu_or1200_sprs_eear_sel } })) | ({20'h00000, or1200_cpu_or1200_sprs_fpcsr} & { 32{ or1200_cpu_or1200_sprs_fpcsr_sel } })) | ({15'h0000, or1200_cpu_or1200_sprs_esr} & { 32{ or1200_cpu_or1200_sprs_esr_sel } }));

  //assertion( or1200_cpu_or1200_sprs_sys_data = ... | ... | ... | ... | ... | ... | ... | ... | ...) 733
    assign or1200_cpu_or1200_sprs_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_sprs_clk = or1200_cpu_clk) 734
    assign or1200_cpu_or1200_sprs_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_sprs_rst = or1200_cpu_rst) 735
    assign or1200_cpu_or1200_sprs_flagforw = or1200_cpu_flagforw;

  //assertion( or1200_cpu_or1200_sprs_flagforw = or1200_cpu_flagforw) 736
    assign or1200_cpu_or1200_sprs_flag_we = or1200_cpu_flag_we;

  //assertion( or1200_cpu_or1200_sprs_flag_we = or1200_cpu_flag_we) 737
    assign or1200_cpu_flag = or1200_cpu_or1200_sprs_flag;

  //assertion( or1200_cpu_flag = or1200_cpu_or1200_sprs_flag) 738
    assign or1200_cpu_or1200_sprs_cyforw = or1200_cpu_cyforw;

  //assertion( or1200_cpu_or1200_sprs_cyforw = or1200_cpu_cyforw) 739
    assign or1200_cpu_or1200_sprs_cy_we = or1200_cpu_cy_we_rf;

  //assertion( or1200_cpu_or1200_sprs_cy_we = or1200_cpu_cy_we_rf) 740
    assign or1200_cpu_carry = or1200_cpu_or1200_sprs_carry;

  //assertion( or1200_cpu_carry = or1200_cpu_or1200_sprs_carry) 741
    assign or1200_cpu_or1200_sprs_ovforw = (or1200_cpu_ovforw | or1200_cpu_ovforw_mult_mac);

  //assertion( or1200_cpu_or1200_sprs_ovforw = or1200_cpu_ovforw | or1200_cpu_ovforw_mult_mac) 742
    assign or1200_cpu_or1200_sprs_ov_we = (or1200_cpu_ov_we_alu | or1200_cpu_ov_we_mult_mac);

  //assertion( or1200_cpu_or1200_sprs_ov_we = or1200_cpu_ov_we_alu | or1200_cpu_ov_we_mult_mac) 743
    assign or1200_cpu_or1200_sprs_dsx = or1200_cpu_dsx;

  //assertion( or1200_cpu_or1200_sprs_dsx = or1200_cpu_dsx) 744
    assign or1200_cpu_or1200_sprs_addrbase = or1200_cpu_operand_a;

  //assertion( or1200_cpu_or1200_sprs_addrbase = or1200_cpu_operand_a) 745
    assign or1200_cpu_or1200_sprs_dat_i = or1200_cpu_operand_b;

  //assertion( or1200_cpu_or1200_sprs_dat_i = or1200_cpu_operand_b) 746
    assign or1200_cpu_or1200_sprs_branch_op = or1200_cpu_branch_op;

  //assertion( or1200_cpu_or1200_sprs_branch_op = or1200_cpu_branch_op) 747
    assign or1200_cpu_or1200_sprs_ex_spr_read = or1200_cpu_ex_spr_read;

  //assertion( or1200_cpu_or1200_sprs_ex_spr_read = or1200_cpu_ex_spr_read) 748
    assign or1200_cpu_or1200_sprs_ex_spr_write = or1200_cpu_ex_spr_write;

  //assertion( or1200_cpu_or1200_sprs_ex_spr_write = or1200_cpu_ex_spr_write) 749
    assign or1200_cpu_or1200_sprs_epcr = or1200_cpu_epcr;

  //assertion( or1200_cpu_or1200_sprs_epcr = or1200_cpu_epcr) 750
    assign or1200_cpu_or1200_sprs_eear = or1200_cpu_eear;

  //assertion( or1200_cpu_or1200_sprs_eear = or1200_cpu_eear) 751
    assign or1200_cpu_or1200_sprs_esr = or1200_cpu_esr;

  //assertion( or1200_cpu_or1200_sprs_esr = or1200_cpu_esr) 752
    assign or1200_cpu_or1200_sprs_except_started = or1200_cpu_except_started;

  //assertion( or1200_cpu_or1200_sprs_except_started = or1200_cpu_except_started) 753
    assign or1200_cpu_sprs_dataout = or1200_cpu_or1200_sprs_to_wbmux;

  //assertion( or1200_cpu_sprs_dataout = or1200_cpu_or1200_sprs_to_wbmux) 754
    assign or1200_cpu_epcr_we = or1200_cpu_or1200_sprs_epcr_we;

  //assertion( or1200_cpu_epcr_we = or1200_cpu_or1200_sprs_epcr_we) 755
    assign or1200_cpu_eear_we = or1200_cpu_or1200_sprs_eear_we;

  //assertion( or1200_cpu_eear_we = or1200_cpu_or1200_sprs_eear_we) 756
    assign or1200_cpu_esr_we = or1200_cpu_or1200_sprs_esr_we;

  //assertion( or1200_cpu_esr_we = or1200_cpu_or1200_sprs_esr_we) 757
    assign or1200_cpu_pc_we = or1200_cpu_or1200_sprs_pc_we;

  //assertion( or1200_cpu_pc_we = or1200_cpu_or1200_sprs_pc_we) 758
    assign or1200_cpu_sr_we = or1200_cpu_or1200_sprs_sr_we;

  //assertion( or1200_cpu_sr_we = or1200_cpu_or1200_sprs_sr_we) 759
    assign or1200_cpu_to_sr = or1200_cpu_or1200_sprs_to_sr;

  //assertion( or1200_cpu_to_sr = or1200_cpu_or1200_sprs_to_sr) 760
    assign or1200_cpu_sr = or1200_cpu_or1200_sprs_sr;

  //assertion( or1200_cpu_sr = or1200_cpu_or1200_sprs_sr) 761
    assign or1200_cpu_or1200_sprs_spr_dat_cfgr = or1200_cpu_spr_dat_cfgr;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_cfgr = or1200_cpu_spr_dat_cfgr) 762
    assign or1200_cpu_or1200_sprs_spr_dat_rf = or1200_cpu_spr_dat_rf;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_rf = or1200_cpu_spr_dat_rf) 763
    assign or1200_cpu_or1200_sprs_spr_dat_npc = or1200_cpu_spr_dat_npc;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_npc = or1200_cpu_spr_dat_npc) 764
    assign or1200_cpu_or1200_sprs_spr_dat_ppc = or1200_cpu_spr_dat_ppc;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_ppc = or1200_cpu_spr_dat_ppc) 765
    assign or1200_cpu_or1200_sprs_spr_dat_mac = or1200_cpu_spr_dat_mac;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_mac = or1200_cpu_spr_dat_mac) 766
    assign or1200_cpu_or1200_sprs_boot_adr_sel_i = or1200_cpu_boot_adr_sel_i;

  //assertion( or1200_cpu_or1200_sprs_boot_adr_sel_i = or1200_cpu_boot_adr_sel_i) 767
    assign or1200_cpu_or1200_sprs_fpcsr = or1200_cpu_fpcsr;

  //assertion( or1200_cpu_or1200_sprs_fpcsr = or1200_cpu_fpcsr) 768
    assign or1200_cpu_fpcsr_we = or1200_cpu_or1200_sprs_fpcsr_we;

  //assertion( or1200_cpu_fpcsr_we = or1200_cpu_or1200_sprs_fpcsr_we) 769
    assign or1200_cpu_or1200_sprs_spr_dat_fpu = or1200_cpu_spr_dat_fpu;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_fpu = or1200_cpu_spr_dat_fpu) 770
    assign or1200_cpu_or1200_sprs_spr_dat_pic = or1200_cpu_spr_dat_pic;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_pic = or1200_cpu_spr_dat_pic) 771
    assign or1200_cpu_or1200_sprs_spr_dat_tt = or1200_cpu_spr_dat_tt;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_tt = or1200_cpu_spr_dat_tt) 772
    assign or1200_cpu_or1200_sprs_spr_dat_pm = or1200_cpu_spr_dat_pm;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_pm = or1200_cpu_spr_dat_pm) 773
    assign or1200_cpu_or1200_sprs_spr_dat_dmmu = or1200_cpu_spr_dat_dmmu;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_dmmu = or1200_cpu_spr_dat_dmmu) 774
    assign or1200_cpu_or1200_sprs_spr_dat_immu = or1200_cpu_spr_dat_immu;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_immu = or1200_cpu_spr_dat_immu) 775
    assign or1200_cpu_or1200_sprs_spr_dat_du = or1200_cpu_spr_dat_du;

  //assertion( or1200_cpu_or1200_sprs_spr_dat_du = or1200_cpu_spr_dat_du) 776
    assign or1200_cpu_spr_addr = or1200_cpu_or1200_sprs_spr_addr;

  //assertion( or1200_cpu_spr_addr = or1200_cpu_or1200_sprs_spr_addr) 777
    assign or1200_cpu_spr_dat_cpu = or1200_cpu_or1200_sprs_spr_dat_o;

  //assertion( or1200_cpu_spr_dat_cpu = or1200_cpu_or1200_sprs_spr_dat_o) 778
    assign or1200_cpu_spr_cs = or1200_cpu_or1200_sprs_spr_cs;

  //assertion( or1200_cpu_spr_cs = or1200_cpu_or1200_sprs_spr_cs) 779
    assign or1200_cpu_spr_we = or1200_cpu_or1200_sprs_spr_we;

  //assertion( or1200_cpu_spr_we = or1200_cpu_or1200_sprs_spr_we) 780
    assign or1200_cpu_or1200_sprs_du_addr = or1200_cpu_du_addr;

  //assertion( or1200_cpu_or1200_sprs_du_addr = or1200_cpu_du_addr) 781
    assign or1200_cpu_or1200_sprs_du_dat_du = or1200_cpu_du_dat_du;

  //assertion( or1200_cpu_or1200_sprs_du_dat_du = or1200_cpu_du_dat_du) 782
    assign or1200_cpu_or1200_sprs_du_read = or1200_cpu_du_read;

  //assertion( or1200_cpu_or1200_sprs_du_read = or1200_cpu_du_read) 783
    assign or1200_cpu_or1200_sprs_du_write = or1200_cpu_du_write;

  //assertion( or1200_cpu_or1200_sprs_du_write = or1200_cpu_du_write) 784
    assign or1200_cpu_du_dat_cpu = or1200_cpu_or1200_sprs_du_dat_cpu;

  //assertion( or1200_cpu_du_dat_cpu = or1200_cpu_or1200_sprs_du_dat_cpu) 785
    assign or1200_cpu_or1200_lsu_lsu_stall = (or1200_cpu_or1200_lsu_dcpu_rty_i & or1200_cpu_or1200_lsu_dcpu_cycstb_o);

  //assertion( or1200_cpu_or1200_lsu_lsu_stall = or1200_cpu_or1200_lsu_dcpu_rty_i & or1200_cpu_or1200_lsu_dcpu_cycstb_o) 786
    assign or1200_cpu_or1200_lsu_lsu_unstall = or1200_cpu_or1200_lsu_dcpu_ack_i;

  //assertion( or1200_cpu_or1200_lsu_lsu_unstall = or1200_cpu_or1200_lsu_dcpu_ack_i) 787
    assign or1200_cpu_or1200_lsu_except_dtlbmiss = (or1200_cpu_or1200_lsu_dcpu_err_i & (or1200_cpu_or1200_lsu_dcpu_tag_i == 4'hd));

  //assertion( or1200_cpu_or1200_lsu_except_dtlbmiss = or1200_cpu_or1200_lsu_dcpu_err_i & If((13 == or1200_cpu_or1200_lsu_dcpu_tag_i) == True, 1, 0)) 788
    assign or1200_cpu_or1200_lsu_except_dmmufault = (or1200_cpu_or1200_lsu_dcpu_err_i & (or1200_cpu_or1200_lsu_dcpu_tag_i == 4'hc));

  //assertion( or1200_cpu_or1200_lsu_except_dmmufault = or1200_cpu_or1200_lsu_dcpu_err_i & If((12 == or1200_cpu_or1200_lsu_dcpu_tag_i) == True, 1, 0)) 789
    assign or1200_cpu_or1200_lsu_except_dbuserr = (or1200_cpu_or1200_lsu_dcpu_err_i & (or1200_cpu_or1200_lsu_dcpu_tag_i == 4'hb));

  //assertion( or1200_cpu_or1200_lsu_except_dbuserr = or1200_cpu_or1200_lsu_dcpu_err_i & If((11 == or1200_cpu_or1200_lsu_dcpu_tag_i) == True, 1, 0)) 790
    assign or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = or1200_cpu_or1200_lsu_ex_lsu_op;

  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = or1200_cpu_or1200_lsu_ex_lsu_op) 791
    assign or1200_cpu_or1200_lsu_or1200_mem2reg_memdata = or1200_cpu_or1200_lsu_dcpu_dat_i;

  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_memdata = or1200_cpu_or1200_lsu_dcpu_dat_i) 792
    assign or1200_cpu_or1200_lsu_lsu_dataout = or1200_cpu_or1200_lsu_or1200_mem2reg_regdata;

  //assertion( or1200_cpu_or1200_lsu_lsu_dataout = or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) 793
    assign or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op = or1200_cpu_or1200_lsu_ex_lsu_op;

  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op = or1200_cpu_or1200_lsu_ex_lsu_op) 794
    assign or1200_cpu_or1200_lsu_or1200_reg2mem_regdata = or1200_cpu_or1200_lsu_lsu_datain;

  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_regdata = or1200_cpu_or1200_lsu_lsu_datain) 795
    assign or1200_cpu_or1200_lsu_dcpu_dat_o = or1200_cpu_or1200_lsu_or1200_reg2mem_memdata;

  //assertion( or1200_cpu_or1200_lsu_dcpu_dat_o = or1200_cpu_or1200_lsu_or1200_reg2mem_memdata) 796
    assign or1200_cpu_or1200_lsu_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_lsu_clk = or1200_cpu_clk) 797
    assign or1200_cpu_or1200_lsu_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_lsu_rst = or1200_cpu_rst) 798
    assign or1200_cpu_or1200_lsu_id_addrbase = or1200_cpu_muxed_a;

  //assertion( or1200_cpu_or1200_lsu_id_addrbase = or1200_cpu_muxed_a) 799
    assign or1200_cpu_or1200_lsu_ex_addrbase = or1200_cpu_operand_a;

  //assertion( or1200_cpu_or1200_lsu_ex_addrbase = or1200_cpu_operand_a) 800
    assign or1200_cpu_or1200_lsu_id_addrofs = or1200_cpu_id_simm;

  //assertion( or1200_cpu_or1200_lsu_id_addrofs = or1200_cpu_id_simm) 801
    assign or1200_cpu_or1200_lsu_ex_addrofs = or1200_cpu_ex_simm;

  //assertion( or1200_cpu_or1200_lsu_ex_addrofs = or1200_cpu_ex_simm) 802
    assign or1200_cpu_or1200_lsu_id_lsu_op = or1200_cpu_id_lsu_op;

  //assertion( or1200_cpu_or1200_lsu_id_lsu_op = or1200_cpu_id_lsu_op) 803
    assign or1200_cpu_or1200_lsu_lsu_datain = or1200_cpu_operand_b;

  //assertion( or1200_cpu_or1200_lsu_lsu_datain = or1200_cpu_operand_b) 804
    assign or1200_cpu_lsu_dataout = or1200_cpu_or1200_lsu_lsu_dataout;

  //assertion( or1200_cpu_lsu_dataout = or1200_cpu_or1200_lsu_lsu_dataout) 805
    assign or1200_cpu_lsu_stall = or1200_cpu_or1200_lsu_lsu_stall;

  //assertion( or1200_cpu_lsu_stall = or1200_cpu_or1200_lsu_lsu_stall) 806
    assign or1200_cpu_lsu_unstall = or1200_cpu_or1200_lsu_lsu_unstall;

  //assertion( or1200_cpu_lsu_unstall = or1200_cpu_or1200_lsu_lsu_unstall) 807
    assign or1200_cpu_or1200_lsu_du_stall = or1200_cpu_du_stall;

  //assertion( or1200_cpu_or1200_lsu_du_stall = or1200_cpu_du_stall) 808
    assign or1200_cpu_except_align = or1200_cpu_or1200_lsu_except_align;

  //assertion( or1200_cpu_except_align = or1200_cpu_or1200_lsu_except_align) 809
    assign or1200_cpu_except_dtlbmiss = or1200_cpu_or1200_lsu_except_dtlbmiss;

  //assertion( or1200_cpu_except_dtlbmiss = or1200_cpu_or1200_lsu_except_dtlbmiss) 810
    assign or1200_cpu_except_dmmufault = or1200_cpu_or1200_lsu_except_dmmufault;

  //assertion( or1200_cpu_except_dmmufault = or1200_cpu_or1200_lsu_except_dmmufault) 811
    assign or1200_cpu_except_dbuserr = or1200_cpu_or1200_lsu_except_dbuserr;

  //assertion( or1200_cpu_except_dbuserr = or1200_cpu_or1200_lsu_except_dbuserr) 812
    assign or1200_cpu_or1200_lsu_id_freeze = or1200_cpu_id_freeze;

  //assertion( or1200_cpu_or1200_lsu_id_freeze = or1200_cpu_id_freeze) 813
    assign or1200_cpu_or1200_lsu_ex_freeze = or1200_cpu_ex_freeze;

  //assertion( or1200_cpu_or1200_lsu_ex_freeze = or1200_cpu_ex_freeze) 814
    assign or1200_cpu_or1200_lsu_flushpipe = or1200_cpu_ex_flushpipe;

  //assertion( or1200_cpu_or1200_lsu_flushpipe = or1200_cpu_ex_flushpipe) 815
    assign or1200_cpu_dcpu_adr_o = or1200_cpu_or1200_lsu_dcpu_adr_o;

  //assertion( or1200_cpu_dcpu_adr_o = or1200_cpu_or1200_lsu_dcpu_adr_o) 816
    assign or1200_cpu_dcpu_cycstb_o = or1200_cpu_or1200_lsu_dcpu_cycstb_o;

  //assertion( or1200_cpu_dcpu_cycstb_o = or1200_cpu_or1200_lsu_dcpu_cycstb_o) 817
    assign or1200_cpu_dcpu_we_o = or1200_cpu_or1200_lsu_dcpu_we_o;

  //assertion( or1200_cpu_dcpu_we_o = or1200_cpu_or1200_lsu_dcpu_we_o) 818
    assign or1200_cpu_dcpu_sel_o = or1200_cpu_or1200_lsu_dcpu_sel_o;

  //assertion( or1200_cpu_dcpu_sel_o = or1200_cpu_or1200_lsu_dcpu_sel_o) 819
    assign or1200_cpu_dcpu_tag_o = or1200_cpu_or1200_lsu_dcpu_tag_o;

  //assertion( or1200_cpu_dcpu_tag_o = or1200_cpu_or1200_lsu_dcpu_tag_o) 820
    assign or1200_cpu_dcpu_dat_o = or1200_cpu_or1200_lsu_dcpu_dat_o;

  //assertion( or1200_cpu_dcpu_dat_o = or1200_cpu_or1200_lsu_dcpu_dat_o) 821
    assign or1200_cpu_or1200_lsu_dcpu_dat_i = or1200_cpu_dcpu_dat_i;

  //assertion( or1200_cpu_or1200_lsu_dcpu_dat_i = or1200_cpu_dcpu_dat_i) 822
    assign or1200_cpu_or1200_lsu_dcpu_ack_i = or1200_cpu_dcpu_ack_i;

  //assertion( or1200_cpu_or1200_lsu_dcpu_ack_i = or1200_cpu_dcpu_ack_i) 823
    assign or1200_cpu_or1200_lsu_dcpu_rty_i = or1200_cpu_dcpu_rty_i;

  //assertion( or1200_cpu_or1200_lsu_dcpu_rty_i = or1200_cpu_dcpu_rty_i) 824
    assign or1200_cpu_or1200_lsu_dcpu_err_i = or1200_cpu_dcpu_err_i;

  //assertion( or1200_cpu_or1200_lsu_dcpu_err_i = or1200_cpu_dcpu_err_i) 825
    assign or1200_cpu_or1200_lsu_dcpu_tag_i = or1200_cpu_dcpu_tag_i;

  //assertion( or1200_cpu_or1200_lsu_dcpu_tag_i = or1200_cpu_dcpu_tag_i) 826
    assign or1200_cpu_or1200_wbmux_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_wbmux_clk = or1200_cpu_clk) 827
    assign or1200_cpu_or1200_wbmux_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_wbmux_rst = or1200_cpu_rst) 828
    assign or1200_cpu_or1200_wbmux_wb_freeze = or1200_cpu_wb_freeze;

  //assertion( or1200_cpu_or1200_wbmux_wb_freeze = or1200_cpu_wb_freeze) 829
    assign or1200_cpu_or1200_wbmux_rfwb_op = or1200_cpu_rfwb_op;

  //assertion( or1200_cpu_or1200_wbmux_rfwb_op = or1200_cpu_rfwb_op) 830
    assign or1200_cpu_or1200_wbmux_muxin_a = or1200_cpu_alu_dataout;

  //assertion( or1200_cpu_or1200_wbmux_muxin_a = or1200_cpu_alu_dataout) 831
    assign or1200_cpu_or1200_wbmux_muxin_b = or1200_cpu_lsu_dataout;

  //assertion( or1200_cpu_or1200_wbmux_muxin_b = or1200_cpu_lsu_dataout) 832
    assign or1200_cpu_or1200_wbmux_muxin_c = or1200_cpu_sprs_dataout;

  //assertion( or1200_cpu_or1200_wbmux_muxin_c = or1200_cpu_sprs_dataout) 833
    assign or1200_cpu_or1200_wbmux_muxin_d = or1200_cpu_ex_pc;

  //assertion( or1200_cpu_or1200_wbmux_muxin_d = or1200_cpu_ex_pc) 834
    assign or1200_cpu_or1200_wbmux_muxin_e = or1200_cpu_fpu_dataout;

  //assertion( or1200_cpu_or1200_wbmux_muxin_e = or1200_cpu_fpu_dataout) 835
    assign or1200_cpu_rf_dataw = or1200_cpu_or1200_wbmux_muxout;

  //assertion( or1200_cpu_rf_dataw = or1200_cpu_or1200_wbmux_muxout) 836
    assign or1200_cpu_wb_forw = or1200_cpu_or1200_wbmux_muxreg;

  //assertion( or1200_cpu_wb_forw = or1200_cpu_or1200_wbmux_muxreg) 837
    assign or1200_cpu_wbforw_valid = or1200_cpu_or1200_wbmux_muxreg_valid;

  //assertion( or1200_cpu_wbforw_valid = or1200_cpu_or1200_wbmux_muxreg_valid) 838
    assign or1200_cpu_or1200_freeze_genpc_freeze = ((or1200_cpu_or1200_freeze_du_stall & ~|or1200_cpu_or1200_freeze_saving_if_insn) | or1200_cpu_or1200_freeze_flushpipe_r);

  //assertion( or1200_cpu_or1200_freeze_genpc_freeze = or1200_cpu_or1200_freeze_du_stall & ~bvredor(or1200_cpu_or1200_freeze_saving_if_insn) | or1200_cpu_or1200_freeze_flushpipe_r) 839
    assign or1200_cpu_or1200_freeze_if_freeze = (or1200_cpu_or1200_freeze_id_freeze | or1200_cpu_or1200_freeze_extend_flush);

  //assertion( or1200_cpu_or1200_freeze_if_freeze = or1200_cpu_or1200_freeze_id_freeze | or1200_cpu_or1200_freeze_extend_flush) 840
    assign or1200_cpu_or1200_freeze_id_freeze = (((((or1200_cpu_or1200_freeze_lsu_stall | ((~or1200_cpu_or1200_freeze_lsu_unstall) & or1200_cpu_or1200_freeze_if_stall)) | or1200_cpu_or1200_freeze_multicycle_freeze) | (|or1200_cpu_or1200_freeze_waiting_on)) | or1200_cpu_or1200_freeze_force_dslot_fetch) | or1200_cpu_or1200_freeze_du_stall);

  //assertion( or1200_cpu_or1200_freeze_id_freeze = or1200_cpu_or1200_freeze_lsu_stall | ~or1200_cpu_or1200_freeze_lsu_unstall & or1200_cpu_or1200_freeze_if_stall | or1200_cpu_or1200_freeze_multicycle_freeze | bvredor(or1200_cpu_or1200_freeze_waiting_on) | or1200_cpu_or1200_freeze_force_dslot_fetch | or1200_cpu_or1200_freeze_du_stall) 841
    assign or1200_cpu_or1200_freeze_ex_freeze = or1200_cpu_or1200_freeze_wb_freeze;

  //assertion( or1200_cpu_or1200_freeze_ex_freeze = or1200_cpu_or1200_freeze_wb_freeze) 842
    assign or1200_cpu_or1200_freeze_wb_freeze = (((((or1200_cpu_or1200_freeze_lsu_stall | ((~or1200_cpu_or1200_freeze_lsu_unstall) & or1200_cpu_or1200_freeze_if_stall)) | or1200_cpu_or1200_freeze_multicycle_freeze) | (|or1200_cpu_or1200_freeze_waiting_on)) | or1200_cpu_or1200_freeze_du_stall) | or1200_cpu_or1200_freeze_abort_ex);

  //assertion( or1200_cpu_or1200_freeze_wb_freeze = or1200_cpu_or1200_freeze_lsu_stall | ~or1200_cpu_or1200_freeze_lsu_unstall & or1200_cpu_or1200_freeze_if_stall | or1200_cpu_or1200_freeze_multicycle_freeze | bvredor(or1200_cpu_or1200_freeze_waiting_on) | or1200_cpu_or1200_freeze_du_stall | or1200_cpu_or1200_freeze_abort_ex) 843
    assign or1200_cpu_or1200_freeze_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_freeze_clk = or1200_cpu_clk) 844
    assign or1200_cpu_or1200_freeze_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_freeze_rst = or1200_cpu_rst) 845
    assign or1200_cpu_or1200_freeze_multicycle = or1200_cpu_multicycle;

  //assertion( or1200_cpu_or1200_freeze_multicycle = or1200_cpu_multicycle) 846
    assign or1200_cpu_or1200_freeze_wait_on = or1200_cpu_wait_on;

  //assertion( or1200_cpu_or1200_freeze_wait_on = or1200_cpu_wait_on) 847
    assign or1200_cpu_or1200_freeze_flushpipe = or1200_cpu_wb_flushpipe;

  //assertion( or1200_cpu_or1200_freeze_flushpipe = or1200_cpu_wb_flushpipe) 848
    assign or1200_cpu_or1200_freeze_extend_flush = or1200_cpu_extend_flush;

  //assertion( or1200_cpu_or1200_freeze_extend_flush = or1200_cpu_extend_flush) 849
    assign or1200_cpu_or1200_freeze_lsu_stall = or1200_cpu_lsu_stall;

  //assertion( or1200_cpu_or1200_freeze_lsu_stall = or1200_cpu_lsu_stall) 850
    assign or1200_cpu_or1200_freeze_if_stall = or1200_cpu_if_stall;

  //assertion( or1200_cpu_or1200_freeze_if_stall = or1200_cpu_if_stall) 851
    assign or1200_cpu_or1200_freeze_lsu_unstall = or1200_cpu_lsu_unstall;

  //assertion( or1200_cpu_or1200_freeze_lsu_unstall = or1200_cpu_lsu_unstall) 852
    assign or1200_cpu_or1200_freeze_du_stall = or1200_cpu_du_stall;

  //assertion( or1200_cpu_or1200_freeze_du_stall = or1200_cpu_du_stall) 853
    assign or1200_cpu_or1200_freeze_mac_stall = or1200_cpu_mult_mac_stall;

  //assertion( or1200_cpu_or1200_freeze_mac_stall = or1200_cpu_mult_mac_stall) 854
    assign or1200_cpu_or1200_freeze_force_dslot_fetch = or1200_cpu_force_dslot_fetch;

  //assertion( or1200_cpu_or1200_freeze_force_dslot_fetch = or1200_cpu_force_dslot_fetch) 855
    assign or1200_cpu_or1200_freeze_abort_ex = or1200_cpu_abort_ex;

  //assertion( or1200_cpu_or1200_freeze_abort_ex = or1200_cpu_abort_ex) 856
    assign or1200_cpu_genpc_freeze = or1200_cpu_or1200_freeze_genpc_freeze;

  //assertion( or1200_cpu_genpc_freeze = or1200_cpu_or1200_freeze_genpc_freeze) 857
    assign or1200_cpu_if_freeze = or1200_cpu_or1200_freeze_if_freeze;

  //assertion( or1200_cpu_if_freeze = or1200_cpu_or1200_freeze_if_freeze) 858
    assign or1200_cpu_id_freeze = or1200_cpu_or1200_freeze_id_freeze;

  //assertion( or1200_cpu_id_freeze = or1200_cpu_or1200_freeze_id_freeze) 859
    assign or1200_cpu_ex_freeze = or1200_cpu_or1200_freeze_ex_freeze;

  //assertion( or1200_cpu_ex_freeze = or1200_cpu_or1200_freeze_ex_freeze) 860
    assign or1200_cpu_wb_freeze = or1200_cpu_or1200_freeze_wb_freeze;

  //assertion( or1200_cpu_wb_freeze = or1200_cpu_or1200_freeze_wb_freeze) 861
    assign or1200_cpu_or1200_freeze_saving_if_insn = or1200_cpu_saving_if_insn;

  //assertion( or1200_cpu_or1200_freeze_saving_if_insn = or1200_cpu_saving_if_insn) 862
    assign or1200_cpu_or1200_freeze_fpu_done = or1200_cpu_fpu_done;

  //assertion( or1200_cpu_or1200_freeze_fpu_done = or1200_cpu_fpu_done) 863
    assign or1200_cpu_or1200_freeze_mtspr_done = or1200_cpu_mtspr_done;

  //assertion( or1200_cpu_or1200_freeze_mtspr_done = or1200_cpu_mtspr_done) 864
    assign or1200_cpu_or1200_freeze_icpu_ack_i = or1200_cpu_icpu_ack_i;

  //assertion( or1200_cpu_or1200_freeze_icpu_ack_i = or1200_cpu_icpu_ack_i) 865
    assign or1200_cpu_or1200_freeze_icpu_err_i = or1200_cpu_icpu_err_i;

  //assertion( or1200_cpu_or1200_freeze_icpu_err_i = or1200_cpu_icpu_err_i) 866
    assign or1200_cpu_or1200_except_except_started = (or1200_cpu_or1200_except_extend_flush & or1200_cpu_or1200_except_except_start);

  //assertion( or1200_cpu_or1200_except_except_started = or1200_cpu_or1200_except_extend_flush & or1200_cpu_or1200_except_except_start) 867
    assign or1200_cpu_or1200_except_except_start = ((or1200_cpu_or1200_except_except_type != 4'h0) & or1200_cpu_or1200_except_extend_flush);

  //assertion( or1200_cpu_or1200_except_except_start = If(0 != or1200_cpu_or1200_except_except_type == True, 1, 0) & or1200_cpu_or1200_except_extend_flush) 868
    assign or1200_cpu_or1200_except_int_pending = (((((((or1200_cpu_or1200_except_sig_int & (or1200_cpu_or1200_except_sr[2] | (or1200_cpu_or1200_except_sr_we & or1200_cpu_or1200_except_to_sr[2]))) & or1200_cpu_or1200_except_id_pc_val) & or1200_cpu_or1200_except_delayed_iee[2]) & (~or1200_cpu_or1200_except_ex_freeze)) & (~or1200_cpu_or1200_except_ex_branch_taken)) & (~or1200_cpu_or1200_except_ex_dslot)) & (~(or1200_cpu_or1200_except_sr_we & (~or1200_cpu_or1200_except_to_sr[2]))));

  //assertion( or1200_cpu_or1200_except_int_pending = or1200_cpu_or1200_except_sig_int & (Extract(2, 2, or1200_cpu_or1200_except_sr) | or1200_cpu_or1200_except_sr_we & Extract(2, 2, or1200_cpu_or1200_except_to_sr)) & or1200_cpu_or1200_except_id_pc_val & Extract(2, 2, or1200_cpu_or1200_except_delayed_iee) & ~or1200_cpu_or1200_except_ex_freeze & ~or1200_cpu_or1200_except_ex_branch_taken & ~or1200_cpu_or1200_except_ex_dslot & ~(or1200_cpu_or1200_except_sr_we & ~Extract(2, 2, or1200_cpu_or1200_except_to_sr))) 869
    assign or1200_cpu_or1200_except_tick_pending = (((((((or1200_cpu_or1200_except_sig_tick & (or1200_cpu_or1200_except_sr[1] | (or1200_cpu_or1200_except_sr_we & or1200_cpu_or1200_except_to_sr[1]))) & or1200_cpu_or1200_except_id_pc_val) & or1200_cpu_or1200_except_delayed_tee[2]) & (~or1200_cpu_or1200_except_ex_freeze)) & (~or1200_cpu_or1200_except_ex_branch_taken)) & (~or1200_cpu_or1200_except_ex_dslot)) & (~(or1200_cpu_or1200_except_sr_we & (~or1200_cpu_or1200_except_to_sr[1]))));

  //assertion( or1200_cpu_or1200_except_tick_pending = or1200_cpu_or1200_except_sig_tick & (Extract(1, 1, or1200_cpu_or1200_except_sr) | or1200_cpu_or1200_except_sr_we & Extract(1, 1, or1200_cpu_or1200_except_to_sr)) & or1200_cpu_or1200_except_id_pc_val & Extract(2, 2, or1200_cpu_or1200_except_delayed_tee) & ~or1200_cpu_or1200_except_ex_freeze & ~or1200_cpu_or1200_except_ex_branch_taken & ~or1200_cpu_or1200_except_ex_dslot & ~(or1200_cpu_or1200_except_sr_we & ~Extract(1, 1, or1200_cpu_or1200_except_to_sr))) 870
    assign or1200_cpu_or1200_except_fp_pending = ((((or1200_cpu_or1200_except_sig_fp & or1200_cpu_or1200_except_fpcsr_fpee) & (~or1200_cpu_or1200_except_ex_freeze)) & (~or1200_cpu_or1200_except_ex_branch_taken)) & (~or1200_cpu_or1200_except_ex_dslot));

  //assertion( or1200_cpu_or1200_except_fp_pending = or1200_cpu_or1200_except_sig_fp & or1200_cpu_or1200_except_fpcsr_fpee & ~or1200_cpu_or1200_except_ex_freeze & ~or1200_cpu_or1200_except_ex_branch_taken & ~or1200_cpu_or1200_except_ex_dslot) 871
    assign or1200_cpu_or1200_except_range_pending = ((((or1200_cpu_or1200_except_sig_range & or1200_cpu_or1200_except_sr[12]) & (~or1200_cpu_or1200_except_ex_freeze)) & (~or1200_cpu_or1200_except_ex_branch_taken)) & (~or1200_cpu_or1200_except_ex_dslot));

  //assertion( or1200_cpu_or1200_except_range_pending = or1200_cpu_or1200_except_sig_range & Extract(12, 12, or1200_cpu_or1200_except_sr) & ~or1200_cpu_or1200_except_ex_freeze & ~or1200_cpu_or1200_except_ex_branch_taken & ~or1200_cpu_or1200_except_ex_dslot) 872
    assign or1200_cpu_or1200_except_abort_ex = (((((or1200_cpu_or1200_except_sig_dbuserr | or1200_cpu_or1200_except_sig_dmmufault) | or1200_cpu_or1200_except_sig_dtlbmiss) | or1200_cpu_or1200_except_sig_align) | or1200_cpu_or1200_except_sig_illegal) | ((((or1200_cpu_or1200_except_du_hwbkpt | or1200_cpu_or1200_except_trace_trap) & or1200_cpu_or1200_except_ex_pc_val) & ~|or1200_cpu_or1200_except_sr_ted) & ~|or1200_cpu_or1200_except_dsr_te));

  //assertion( or1200_cpu_or1200_except_abort_ex = or1200_cpu_or1200_except_sig_dbuserr | or1200_cpu_or1200_except_sig_dmmufault | or1200_cpu_or1200_except_sig_dtlbmiss | or1200_cpu_or1200_except_sig_align | or1200_cpu_or1200_except_sig_illegal | (or1200_cpu_or1200_except_du_hwbkpt | or1200_cpu_or1200_except_trace_trap) & or1200_cpu_or1200_except_ex_pc_val & ~bvredor(or1200_cpu_or1200_except_sr_ted) & ~bvredor(or1200_cpu_or1200_except_dsr_te)) 873
    assign or1200_cpu_or1200_except_abort_mvspr = (or1200_cpu_or1200_except_sig_illegal | ((((or1200_cpu_or1200_except_du_hwbkpt | or1200_cpu_or1200_except_trace_trap) & or1200_cpu_or1200_except_ex_pc_val) & ~|or1200_cpu_or1200_except_sr_ted) & ~|or1200_cpu_or1200_except_dsr_te));

  //assertion( or1200_cpu_or1200_except_abort_mvspr = or1200_cpu_or1200_except_sig_illegal | (or1200_cpu_or1200_except_du_hwbkpt | or1200_cpu_or1200_except_trace_trap) & or1200_cpu_or1200_except_ex_pc_val & ~bvredor(or1200_cpu_or1200_except_sr_ted) & ~bvredor(or1200_cpu_or1200_except_dsr_te)) 874
    assign or1200_cpu_or1200_except_spr_dat_ppc = or1200_cpu_or1200_except_wb_pc;

  //assertion( or1200_cpu_or1200_except_spr_dat_ppc = or1200_cpu_or1200_except_wb_pc) 875
    assign or1200_cpu_or1200_except_trace_cond = ((~|or1200_cpu_or1200_except_ex_freeze & ~|or1200_cpu_or1200_except_ex_void) & ((1'b0 | or1200_cpu_or1200_except_dmr1_st) | (((or1200_cpu_or1200_except_branch_op != 3'h0) & (or1200_cpu_or1200_except_branch_op != 3'h6)) & or1200_cpu_or1200_except_dmr1_bt)));

  //assertion( or1200_cpu_or1200_except_trace_cond = ~bvredor(or1200_cpu_or1200_except_ex_freeze) & ~bvredor(or1200_cpu_or1200_except_ex_void) & (0 | or1200_cpu_or1200_except_dmr1_st | If(0 != or1200_cpu_or1200_except_branch_op == True, 1, 0) & If(6 != or1200_cpu_or1200_except_branch_op == True, 1, 0) & or1200_cpu_or1200_except_dmr1_bt)) 876
    assign or1200_cpu_or1200_except_except_flushpipe = ((|or1200_cpu_or1200_except_except_trig) & ~|or1200_cpu_or1200_except_state);

  //assertion( or1200_cpu_or1200_except_except_flushpipe = bvredor(or1200_cpu_or1200_except_except_trig) & ~bvredor(or1200_cpu_or1200_except_state)) 877
    assign or1200_cpu_or1200_except_clk = or1200_cpu_clk;

  //assertion( or1200_cpu_or1200_except_clk = or1200_cpu_clk) 878
    assign or1200_cpu_or1200_except_rst = or1200_cpu_rst;

  //assertion( or1200_cpu_or1200_except_rst = or1200_cpu_rst) 879
    assign or1200_cpu_or1200_except_sig_ibuserr = or1200_cpu_except_ibuserr;

  //assertion( or1200_cpu_or1200_except_sig_ibuserr = or1200_cpu_except_ibuserr) 880
    assign or1200_cpu_or1200_except_sig_dbuserr = or1200_cpu_except_dbuserr;

  //assertion( or1200_cpu_or1200_except_sig_dbuserr = or1200_cpu_except_dbuserr) 881
    assign or1200_cpu_or1200_except_sig_illegal = or1200_cpu_except_illegal;

  //assertion( or1200_cpu_or1200_except_sig_illegal = or1200_cpu_except_illegal) 882
    assign or1200_cpu_or1200_except_sig_align = or1200_cpu_except_align;

  //assertion( or1200_cpu_or1200_except_sig_align = or1200_cpu_except_align) 883
    assign or1200_cpu_or1200_except_sig_range = or1200_cpu_sig_range;

  //assertion( or1200_cpu_or1200_except_sig_range = or1200_cpu_sig_range) 884
    assign or1200_cpu_or1200_except_sig_dtlbmiss = or1200_cpu_except_dtlbmiss;

  //assertion( or1200_cpu_or1200_except_sig_dtlbmiss = or1200_cpu_except_dtlbmiss) 885
    assign or1200_cpu_or1200_except_sig_dmmufault = or1200_cpu_except_dmmufault;

  //assertion( or1200_cpu_or1200_except_sig_dmmufault = or1200_cpu_except_dmmufault) 886
    assign or1200_cpu_or1200_except_sig_int = or1200_cpu_sig_int;

  //assertion( or1200_cpu_or1200_except_sig_int = or1200_cpu_sig_int) 887
    assign or1200_cpu_or1200_except_sig_syscall = or1200_cpu_sig_syscall;

  //assertion( or1200_cpu_or1200_except_sig_syscall = or1200_cpu_sig_syscall) 888
    assign or1200_cpu_or1200_except_sig_trap = or1200_cpu_sig_trap;

  //assertion( or1200_cpu_or1200_except_sig_trap = or1200_cpu_sig_trap) 889
    assign or1200_cpu_or1200_except_sig_itlbmiss = or1200_cpu_except_itlbmiss;

  //assertion( or1200_cpu_or1200_except_sig_itlbmiss = or1200_cpu_except_itlbmiss) 890
    assign or1200_cpu_or1200_except_sig_immufault = or1200_cpu_except_immufault;

  //assertion( or1200_cpu_or1200_except_sig_immufault = or1200_cpu_except_immufault) 891
    assign or1200_cpu_or1200_except_sig_tick = or1200_cpu_sig_tick;

  //assertion( or1200_cpu_or1200_except_sig_tick = or1200_cpu_sig_tick) 892
    assign or1200_cpu_or1200_except_ex_branch_taken = or1200_cpu_ex_branch_taken;

  //assertion( or1200_cpu_or1200_except_ex_branch_taken = or1200_cpu_ex_branch_taken) 893
    assign or1200_cpu_or1200_except_genpc_freeze = or1200_cpu_genpc_freeze;

  //assertion( or1200_cpu_or1200_except_genpc_freeze = or1200_cpu_genpc_freeze) 894
    assign or1200_cpu_or1200_except_id_freeze = or1200_cpu_id_freeze;

  //assertion( or1200_cpu_or1200_except_id_freeze = or1200_cpu_id_freeze) 895
    assign or1200_cpu_or1200_except_ex_freeze = or1200_cpu_ex_freeze;

  //assertion( or1200_cpu_or1200_except_ex_freeze = or1200_cpu_ex_freeze) 896
    assign or1200_cpu_or1200_except_wb_freeze = or1200_cpu_wb_freeze;

  //assertion( or1200_cpu_or1200_except_wb_freeze = or1200_cpu_wb_freeze) 897
    assign or1200_cpu_or1200_except_if_stall = or1200_cpu_if_stall;

  //assertion( or1200_cpu_or1200_except_if_stall = or1200_cpu_if_stall) 898
    assign or1200_cpu_or1200_except_if_pc = or1200_cpu_if_pc;

  //assertion( or1200_cpu_or1200_except_if_pc = or1200_cpu_if_pc) 899
    assign or1200_cpu_id_pc = or1200_cpu_or1200_except_id_pc;

  //assertion( or1200_cpu_id_pc = or1200_cpu_or1200_except_id_pc) 900
    assign or1200_cpu_ex_pc = or1200_cpu_or1200_except_ex_pc;

  //assertion( or1200_cpu_ex_pc = or1200_cpu_or1200_except_ex_pc) 901
    assign or1200_cpu_wb_pc = or1200_cpu_or1200_except_wb_pc;

  //assertion( or1200_cpu_wb_pc = or1200_cpu_or1200_except_wb_pc) 902
    assign or1200_cpu_or1200_except_id_flushpipe = or1200_cpu_id_flushpipe;

  //assertion( or1200_cpu_or1200_except_id_flushpipe = or1200_cpu_id_flushpipe) 903
    assign or1200_cpu_or1200_except_ex_flushpipe = or1200_cpu_ex_flushpipe;

  //assertion( or1200_cpu_or1200_except_ex_flushpipe = or1200_cpu_ex_flushpipe) 904
    assign or1200_cpu_extend_flush = or1200_cpu_or1200_except_extend_flush;

  //assertion( or1200_cpu_extend_flush = or1200_cpu_or1200_except_extend_flush) 905
    assign or1200_cpu_except_flushpipe = or1200_cpu_or1200_except_except_flushpipe;

  //assertion( or1200_cpu_except_flushpipe = or1200_cpu_or1200_except_except_flushpipe) 906
    assign or1200_cpu_except_type = or1200_cpu_or1200_except_except_type;

  //assertion( or1200_cpu_except_type = or1200_cpu_or1200_except_except_type) 907
    assign or1200_cpu_except_start = or1200_cpu_or1200_except_except_start;

  //assertion( or1200_cpu_except_start = or1200_cpu_or1200_except_except_start) 908
    assign or1200_cpu_except_started = or1200_cpu_or1200_except_except_started;

  //assertion( or1200_cpu_except_started = or1200_cpu_or1200_except_except_started) 909
    assign or1200_cpu_except_stop = or1200_cpu_or1200_except_except_stop;

  //assertion( or1200_cpu_except_stop = or1200_cpu_or1200_except_except_stop) 910
    assign or1200_cpu_except_trig = or1200_cpu_or1200_except_except_trig;

  //assertion( or1200_cpu_except_trig = or1200_cpu_or1200_except_except_trig) 911
    assign or1200_cpu_or1200_except_ex_void = or1200_cpu_ex_void;

  //assertion( or1200_cpu_or1200_except_ex_void = or1200_cpu_ex_void) 912
    assign or1200_cpu_abort_mvspr = or1200_cpu_or1200_except_abort_mvspr;

  //assertion( or1200_cpu_abort_mvspr = or1200_cpu_or1200_except_abort_mvspr) 913
    assign or1200_cpu_or1200_except_branch_op = or1200_cpu_branch_op;

  //assertion( or1200_cpu_or1200_except_branch_op = or1200_cpu_branch_op) 914
    assign or1200_cpu_spr_dat_ppc = or1200_cpu_or1200_except_spr_dat_ppc;

  //assertion( or1200_cpu_spr_dat_ppc = or1200_cpu_or1200_except_spr_dat_ppc) 915
    assign or1200_cpu_spr_dat_npc = or1200_cpu_or1200_except_spr_dat_npc;

  //assertion( or1200_cpu_spr_dat_npc = or1200_cpu_or1200_except_spr_dat_npc) 916
    assign or1200_cpu_or1200_except_datain = or1200_cpu_spr_dat_cpu;

  //assertion( or1200_cpu_or1200_except_datain = or1200_cpu_spr_dat_cpu) 917
    assign or1200_cpu_or1200_except_du_dsr = or1200_cpu_du_dsr;

  //assertion( or1200_cpu_or1200_except_du_dsr = or1200_cpu_du_dsr) 918
    assign or1200_cpu_or1200_except_epcr_we = or1200_cpu_epcr_we;

  //assertion( or1200_cpu_or1200_except_epcr_we = or1200_cpu_epcr_we) 919
    assign or1200_cpu_or1200_except_eear_we = or1200_cpu_eear_we;

  //assertion( or1200_cpu_or1200_except_eear_we = or1200_cpu_eear_we) 920
    assign or1200_cpu_or1200_except_esr_we = or1200_cpu_esr_we;

  //assertion( or1200_cpu_or1200_except_esr_we = or1200_cpu_esr_we) 921
    assign or1200_cpu_or1200_except_pc_we = or1200_cpu_pc_we;

  //assertion( or1200_cpu_or1200_except_pc_we = or1200_cpu_pc_we) 922
    assign or1200_cpu_epcr = or1200_cpu_or1200_except_epcr;

  //assertion( or1200_cpu_epcr = or1200_cpu_or1200_except_epcr) 923
    assign or1200_cpu_eear = or1200_cpu_or1200_except_eear;

  //assertion( or1200_cpu_eear = or1200_cpu_or1200_except_eear) 924
    assign or1200_cpu_or1200_except_du_dmr1 = or1200_cpu_du_dmr1;

  //assertion( or1200_cpu_or1200_except_du_dmr1 = or1200_cpu_du_dmr1) 925
    assign or1200_cpu_or1200_except_du_hwbkpt = or1200_cpu_du_hwbkpt;

  //assertion( or1200_cpu_or1200_except_du_hwbkpt = or1200_cpu_du_hwbkpt) 926
    assign or1200_cpu_or1200_except_du_hwbkpt_ls_r = or1200_cpu_du_hwbkpt_ls_r;

  //assertion( or1200_cpu_or1200_except_du_hwbkpt_ls_r = or1200_cpu_du_hwbkpt_ls_r) 927
    assign or1200_cpu_esr = or1200_cpu_or1200_except_esr;

  //assertion( or1200_cpu_esr = or1200_cpu_or1200_except_esr) 928
    assign or1200_cpu_or1200_except_sr_we = or1200_cpu_sr_we;

  //assertion( or1200_cpu_or1200_except_sr_we = or1200_cpu_sr_we) 929
    assign or1200_cpu_or1200_except_to_sr = or1200_cpu_to_sr;

  //assertion( or1200_cpu_or1200_except_to_sr = or1200_cpu_to_sr) 930
    assign or1200_cpu_or1200_except_sr = or1200_cpu_sr;

  //assertion( or1200_cpu_or1200_except_sr = or1200_cpu_sr) 931
    assign or1200_cpu_or1200_except_lsu_addr = or1200_cpu_dcpu_adr_o;

  //assertion( or1200_cpu_or1200_except_lsu_addr = or1200_cpu_dcpu_adr_o) 932
    assign or1200_cpu_abort_ex = or1200_cpu_or1200_except_abort_ex;

  //assertion( or1200_cpu_abort_ex = or1200_cpu_or1200_except_abort_ex) 933
    assign or1200_cpu_or1200_except_icpu_ack_i = or1200_cpu_icpu_ack_i;

  //assertion( or1200_cpu_or1200_except_icpu_ack_i = or1200_cpu_icpu_ack_i) 934
    assign or1200_cpu_or1200_except_icpu_err_i = or1200_cpu_icpu_err_i;

  //assertion( or1200_cpu_or1200_except_icpu_err_i = or1200_cpu_icpu_err_i) 935
    assign or1200_cpu_or1200_except_dcpu_ack_i = or1200_cpu_dcpu_ack_i;

  //assertion( or1200_cpu_or1200_except_dcpu_ack_i = or1200_cpu_dcpu_ack_i) 936
    assign or1200_cpu_or1200_except_dcpu_err_i = or1200_cpu_dcpu_err_i;

  //assertion( or1200_cpu_or1200_except_dcpu_err_i = or1200_cpu_dcpu_err_i) 937
    assign or1200_cpu_or1200_except_sig_fp = or1200_cpu_sig_fp;

  //assertion( or1200_cpu_or1200_except_sig_fp = or1200_cpu_sig_fp) 938
    assign or1200_cpu_dsx = or1200_cpu_or1200_except_dsx;

  //assertion( or1200_cpu_dsx = or1200_cpu_or1200_except_dsx) 939
    assign or1200_cpu_or1200_cfgr_spr_addr = or1200_cpu_spr_addr;

  //assertion( or1200_cpu_or1200_cfgr_spr_addr = or1200_cpu_spr_addr) 940
    assign or1200_cpu_spr_dat_cfgr = or1200_cpu_or1200_cfgr_spr_dat_o;

  //assertion( or1200_cpu_spr_dat_cfgr = or1200_cpu_or1200_cfgr_spr_dat_o) 941
    assign or1200_cpu_clk = clk_i;

  //assertion( or1200_cpu_clk = clk_i) 942
    assign or1200_cpu_rst = rst_i;

  //assertion( or1200_cpu_rst = rst_i) 943
    assign ic_en = or1200_cpu_ic_en;

  //assertion( ic_en = or1200_cpu_ic_en) 944
    assign icpu_adr_cpu = or1200_cpu_icpu_adr_o;

  //assertion( icpu_adr_cpu = or1200_cpu_icpu_adr_o) 945
    assign icpu_cycstb_cpu = or1200_cpu_icpu_cycstb_o;

  //assertion( icpu_cycstb_cpu = or1200_cpu_icpu_cycstb_o) 946
    assign icpu_sel_cpu = or1200_cpu_icpu_sel_o;

  //assertion( icpu_sel_cpu = or1200_cpu_icpu_sel_o) 947
    assign icpu_tag_cpu = or1200_cpu_icpu_tag_o;

  //assertion( icpu_tag_cpu = or1200_cpu_icpu_tag_o) 948
    assign or1200_cpu_icpu_dat_i = icpu_dat_qmem;

  //assertion( or1200_cpu_icpu_dat_i = icpu_dat_qmem) 949
    assign or1200_cpu_icpu_ack_i = icpu_ack_qmem;

  //assertion( or1200_cpu_icpu_ack_i = icpu_ack_qmem) 950
    assign or1200_cpu_icpu_rty_i = icpu_rty_immu;

  //assertion( or1200_cpu_icpu_rty_i = icpu_rty_immu) 951
    assign or1200_cpu_icpu_err_i = icpu_err_immu;

  //assertion( or1200_cpu_icpu_err_i = icpu_err_immu) 952
    assign or1200_cpu_icpu_adr_i = icpu_adr_immu;

  //assertion( or1200_cpu_icpu_adr_i = icpu_adr_immu) 953
    assign or1200_cpu_icpu_tag_i = icpu_tag_immu;

  //assertion( or1200_cpu_icpu_tag_i = icpu_tag_immu) 954
    assign immu_en = or1200_cpu_immu_en;

  //assertion( immu_en = or1200_cpu_immu_en) 955
    assign id_void = or1200_cpu_id_void;

  //assertion( id_void = or1200_cpu_id_void) 956
    assign id_insn = or1200_cpu_id_insn;

  //assertion( id_insn = or1200_cpu_id_insn) 957
    assign ex_void = or1200_cpu_ex_void;

  //assertion( ex_void = or1200_cpu_ex_void) 958
    assign ex_insn = or1200_cpu_ex_insn;

  //assertion( ex_insn = or1200_cpu_ex_insn) 959
    assign ex_freeze = or1200_cpu_ex_freeze;

  //assertion( ex_freeze = or1200_cpu_ex_freeze) 960
    assign wb_insn = or1200_cpu_wb_insn;

  //assertion( wb_insn = or1200_cpu_wb_insn) 961
    assign wb_freeze = or1200_cpu_wb_freeze;

  //assertion( wb_freeze = or1200_cpu_wb_freeze) 962
    assign id_pc = or1200_cpu_id_pc;

  //assertion( id_pc = or1200_cpu_id_pc) 963
    assign ex_pc = or1200_cpu_ex_pc;

  //assertion( ex_pc = or1200_cpu_ex_pc) 964
    assign wb_pc = or1200_cpu_wb_pc;

  //assertion( wb_pc = or1200_cpu_wb_pc) 965
    assign branch_op = or1200_cpu_branch_op;

  //assertion( branch_op = or1200_cpu_branch_op) 966
    assign spr_dat_npc = or1200_cpu_spr_dat_npc;

  //assertion( spr_dat_npc = or1200_cpu_spr_dat_npc) 967
    assign rf_dataw = or1200_cpu_rf_dataw;

  //assertion( rf_dataw = or1200_cpu_rf_dataw) 968
    assign flushpipe = or1200_cpu_ex_flushpipe;

  //assertion( flushpipe = or1200_cpu_ex_flushpipe) 969
    assign or1200_cpu_du_stall = du_stall;

  //assertion( or1200_cpu_du_stall = du_stall) 970
    assign or1200_cpu_du_addr = du_addr;

  //assertion( or1200_cpu_du_addr = du_addr) 971
    assign or1200_cpu_du_dat_du = du_dat_du;

  //assertion( or1200_cpu_du_dat_du = du_dat_du) 972
    assign or1200_cpu_du_read = du_read;

  //assertion( or1200_cpu_du_read = du_read) 973
    assign or1200_cpu_du_write = du_write;

  //assertion( or1200_cpu_du_write = du_write) 974
    assign du_except_stop = or1200_cpu_du_except_stop;

  //assertion( du_except_stop = or1200_cpu_du_except_stop) 975
    assign or1200_cpu_du_flush_pipe = du_flush_pipe;

  //assertion( or1200_cpu_du_flush_pipe = du_flush_pipe) 976
    assign du_except_trig = or1200_cpu_du_except_trig;

  //assertion( du_except_trig = or1200_cpu_du_except_trig) 977
    assign or1200_cpu_du_dsr = du_dsr;

  //assertion( or1200_cpu_du_dsr = du_dsr) 978
    assign or1200_cpu_du_dmr1 = du_dmr1;

  //assertion( or1200_cpu_du_dmr1 = du_dmr1) 979
    assign or1200_cpu_du_hwbkpt = du_hwbkpt;

  //assertion( or1200_cpu_du_hwbkpt = du_hwbkpt) 980
    assign or1200_cpu_du_hwbkpt_ls_r = du_hwbkpt_ls_r;

  //assertion( or1200_cpu_du_hwbkpt_ls_r = du_hwbkpt_ls_r) 981
    assign du_dat_cpu = or1200_cpu_du_dat_cpu;

  //assertion( du_dat_cpu = or1200_cpu_du_dat_cpu) 982
    assign du_lsu_store_dat = or1200_cpu_du_lsu_store_dat;

  //assertion( du_lsu_store_dat = or1200_cpu_du_lsu_store_dat) 983
    assign du_lsu_load_dat = or1200_cpu_du_lsu_load_dat;

  //assertion( du_lsu_load_dat = or1200_cpu_du_lsu_load_dat) 984
    assign abort_mvspr = or1200_cpu_abort_mvspr;

  //assertion( abort_mvspr = or1200_cpu_abort_mvspr) 985
    assign abort_ex = or1200_cpu_abort_ex;

  //assertion( abort_ex = or1200_cpu_abort_ex) 986
    assign dc_en = or1200_cpu_dc_en;

  //assertion( dc_en = or1200_cpu_dc_en) 987
    assign dcpu_adr_cpu = or1200_cpu_dcpu_adr_o;

  //assertion( dcpu_adr_cpu = or1200_cpu_dcpu_adr_o) 988
    assign dcpu_cycstb_cpu = or1200_cpu_dcpu_cycstb_o;

  //assertion( dcpu_cycstb_cpu = or1200_cpu_dcpu_cycstb_o) 989
    assign dcpu_we_cpu = or1200_cpu_dcpu_we_o;

  //assertion( dcpu_we_cpu = or1200_cpu_dcpu_we_o) 990
    assign dcpu_sel_cpu = or1200_cpu_dcpu_sel_o;

  //assertion( dcpu_sel_cpu = or1200_cpu_dcpu_sel_o) 991
    assign dcpu_tag_cpu = or1200_cpu_dcpu_tag_o;

  //assertion( dcpu_tag_cpu = or1200_cpu_dcpu_tag_o) 992
    assign dcpu_dat_cpu = or1200_cpu_dcpu_dat_o;

  //assertion( dcpu_dat_cpu = or1200_cpu_dcpu_dat_o) 993
    assign or1200_cpu_dcpu_dat_i = dcpu_dat_qmem;

  //assertion( or1200_cpu_dcpu_dat_i = dcpu_dat_qmem) 994
    assign or1200_cpu_dcpu_ack_i = dcpu_ack_qmem;

  //assertion( or1200_cpu_dcpu_ack_i = dcpu_ack_qmem) 995
    assign or1200_cpu_dcpu_rty_i = dcpu_rty_qmem;

  //assertion( or1200_cpu_dcpu_rty_i = dcpu_rty_qmem) 996
    assign or1200_cpu_dcpu_err_i = dcpu_err_dmmu;

  //assertion( or1200_cpu_dcpu_err_i = dcpu_err_dmmu) 997
    assign or1200_cpu_dcpu_tag_i = dcpu_tag_dmmu;

  //assertion( or1200_cpu_dcpu_tag_i = dcpu_tag_dmmu) 998
    assign sb_en = or1200_cpu_sb_en;

  //assertion( sb_en = or1200_cpu_sb_en) 999
    assign dmmu_en = or1200_cpu_dmmu_en;

  //assertion( dmmu_en = or1200_cpu_dmmu_en) 1000
    assign dc_no_writethrough = or1200_cpu_dc_no_writethrough;

  //assertion( dc_no_writethrough = or1200_cpu_dc_no_writethrough) 1001
    assign or1200_cpu_boot_adr_sel_i = boot_adr_sel;

  //assertion( or1200_cpu_boot_adr_sel_i = boot_adr_sel) 1002
    assign or1200_cpu_sig_int = sig_int;

  //assertion( or1200_cpu_sig_int = sig_int) 1003
    assign or1200_cpu_sig_tick = sig_tick;

  //assertion( or1200_cpu_sig_tick = sig_tick) 1004
    assign supv = or1200_cpu_supv;

  //assertion( supv = or1200_cpu_supv) 1005
    assign spr_addr = or1200_cpu_spr_addr;

  //assertion( spr_addr = or1200_cpu_spr_addr) 1006
    assign spr_dat_cpu = or1200_cpu_spr_dat_cpu;

  //assertion( spr_dat_cpu = or1200_cpu_spr_dat_cpu) 1007
    assign or1200_cpu_spr_dat_pic = spr_dat_pic;

  //assertion( or1200_cpu_spr_dat_pic = spr_dat_pic) 1008
    assign or1200_cpu_spr_dat_tt = spr_dat_tt;

  //assertion( or1200_cpu_spr_dat_tt = spr_dat_tt) 1009
    assign or1200_cpu_spr_dat_pm = spr_dat_pm;

  //assertion( or1200_cpu_spr_dat_pm = spr_dat_pm) 1010
    assign or1200_cpu_spr_dat_dmmu = spr_dat_dmmu;

  //assertion( or1200_cpu_spr_dat_dmmu = spr_dat_dmmu) 1011
    assign or1200_cpu_spr_dat_immu = spr_dat_immu;

  //assertion( or1200_cpu_spr_dat_immu = spr_dat_immu) 1012
    assign or1200_cpu_spr_dat_du = spr_dat_du;

  //assertion( or1200_cpu_spr_dat_du = spr_dat_du) 1013
    assign spr_cs = or1200_cpu_spr_cs;

  //assertion( spr_cs = or1200_cpu_spr_cs) 1014
    assign spr_we = or1200_cpu_spr_we;

  //assertion( spr_we = or1200_cpu_spr_we) 1015
    assign or1200_cpu_mtspr_dc_done = mtspr_dc_done;

  //assertion( or1200_cpu_mtspr_dc_done = mtspr_dc_done) 1016
    assign or1200_dmmu_top_dtlb_spr_access = or1200_dmmu_top_spr_cs;

  //assertion( or1200_dmmu_top_dtlb_spr_access = or1200_dmmu_top_spr_cs) 1017
    assign or1200_dmmu_top_dcpu_err_o = ((or1200_dmmu_top_miss | or1200_dmmu_top_fault) | or1200_dmmu_top_qmemdmmu_err_i);

  //assertion( or1200_dmmu_top_dcpu_err_o = or1200_dmmu_top_miss | or1200_dmmu_top_fault | or1200_dmmu_top_qmemdmmu_err_i) 1018
    assign or1200_dmmu_top_fault = (or1200_dmmu_top_dtlb_done & (((((~|or1200_dmmu_top_dcpu_we_i & ~|or1200_dmmu_top_supv) & ~|or1200_dmmu_top_dtlb_ure) | ((~|or1200_dmmu_top_dcpu_we_i & or1200_dmmu_top_supv) & ~|or1200_dmmu_top_dtlb_sre)) | ((or1200_dmmu_top_dcpu_we_i & ~|or1200_dmmu_top_supv) & ~|or1200_dmmu_top_dtlb_uwe)) | ((or1200_dmmu_top_dcpu_we_i & or1200_dmmu_top_supv) & ~|or1200_dmmu_top_dtlb_swe)));

  //assertion( or1200_dmmu_top_fault = or1200_dmmu_top_dtlb_done & (~bvredor(or1200_dmmu_top_dcpu_we_i) & ~bvredor(or1200_dmmu_top_supv) & ~bvredor(or1200_dmmu_top_dtlb_ure) | ~bvredor(or1200_dmmu_top_dcpu_we_i) & or1200_dmmu_top_supv & ~bvredor(or1200_dmmu_top_dtlb_sre) | or1200_dmmu_top_dcpu_we_i & ~bvredor(or1200_dmmu_top_supv) & ~bvredor(or1200_dmmu_top_dtlb_uwe) | or1200_dmmu_top_dcpu_we_i & or1200_dmmu_top_supv & ~bvredor(or1200_dmmu_top_dtlb_swe))) 1019
    assign or1200_dmmu_top_miss = (or1200_dmmu_top_dtlb_done & ~|or1200_dmmu_top_dtlb_hit);

  //assertion( or1200_dmmu_top_miss = or1200_dmmu_top_dtlb_done & ~bvredor(or1200_dmmu_top_dtlb_hit)) 1020
    assign or1200_dmmu_top_dtlb_en = (or1200_dmmu_top_dmmu_en & or1200_dmmu_top_dcpu_cycstb_i);

  //assertion( or1200_dmmu_top_dtlb_en = or1200_dmmu_top_dmmu_en & or1200_dmmu_top_dcpu_cycstb_i) 1021
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en = (or1200_dmmu_top_or1200_dmmu_tlb_tlb_en | (or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & ~|or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[7]));

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en = or1200_dmmu_top_or1200_dmmu_tlb_tlb_en | or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & ~bvredor(Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr))) 1022
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we = ((or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & or1200_dmmu_top_or1200_dmmu_tlb_spr_write) & ~|or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[7]);

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we = or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & or1200_dmmu_top_or1200_dmmu_tlb_spr_write & ~bvredor(Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr))) 1023
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en = (or1200_dmmu_top_or1200_dmmu_tlb_tlb_en | (or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[7]));

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en = or1200_dmmu_top_or1200_dmmu_tlb_tlb_en | or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr)) 1024
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we = ((or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & or1200_dmmu_top_or1200_dmmu_tlb_spr_write) & or1200_dmmu_top_or1200_dmmu_tlb_spr_addr[7]);

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we = or1200_dmmu_top_or1200_dmmu_tlb_spr_cs & or1200_dmmu_top_or1200_dmmu_tlb_spr_write & Extract(7, 7, or1200_dmmu_top_or1200_dmmu_tlb_spr_addr)) 1025
    assign or1200_dmmu_top_or1200_dmmu_tlb_hit = ((or1200_dmmu_top_or1200_dmmu_tlb_vpn == or1200_dmmu_top_or1200_dmmu_tlb_vaddr[31:19]) & or1200_dmmu_top_or1200_dmmu_tlb_v);

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_hit = If((or1200_dmmu_top_or1200_dmmu_tlb_vpn == Extract(31, 19, or1200_dmmu_top_or1200_dmmu_tlb_vaddr)) == True, 1, 0) & or1200_dmmu_top_or1200_dmmu_tlb_v) 1026
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk = or1200_dmmu_top_or1200_dmmu_tlb_clk;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk = or1200_dmmu_top_or1200_dmmu_tlb_clk) 1027
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_en) 1028
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_we) 1029
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr = or1200_dmmu_top_or1200_dmmu_tlb_tlb_index;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr = or1200_dmmu_top_or1200_dmmu_tlb_tlb_index) 1030
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di = or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_in) 1031
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_doq;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_mr_ram_out = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_doq) 1032
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk = or1200_dmmu_top_or1200_dmmu_tlb_clk;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk = or1200_dmmu_top_or1200_dmmu_tlb_clk) 1033
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_en) 1034
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_we) 1035
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr = or1200_dmmu_top_or1200_dmmu_tlb_tlb_index;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr = or1200_dmmu_top_or1200_dmmu_tlb_tlb_index) 1036
    assign or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di = or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_in) 1037
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_doq;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_tr_ram_out = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_doq) 1038
    assign or1200_dmmu_top_or1200_dmmu_tlb_clk = or1200_dmmu_top_clk;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_clk = or1200_dmmu_top_clk) 1039
    assign or1200_dmmu_top_or1200_dmmu_tlb_rst = or1200_dmmu_top_rst;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_rst = or1200_dmmu_top_rst) 1040
    assign or1200_dmmu_top_or1200_dmmu_tlb_tlb_en = or1200_dmmu_top_dtlb_en;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_tlb_en = or1200_dmmu_top_dtlb_en) 1041
    assign or1200_dmmu_top_or1200_dmmu_tlb_vaddr = or1200_dmmu_top_dcpu_adr_i;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_vaddr = or1200_dmmu_top_dcpu_adr_i) 1042
    assign or1200_dmmu_top_dtlb_hit = or1200_dmmu_top_or1200_dmmu_tlb_hit;

  //assertion( or1200_dmmu_top_dtlb_hit = or1200_dmmu_top_or1200_dmmu_tlb_hit) 1043
    assign or1200_dmmu_top_dtlb_ppn = or1200_dmmu_top_or1200_dmmu_tlb_ppn;

  //assertion( or1200_dmmu_top_dtlb_ppn = or1200_dmmu_top_or1200_dmmu_tlb_ppn) 1044
    assign or1200_dmmu_top_dtlb_uwe = or1200_dmmu_top_or1200_dmmu_tlb_uwe;

  //assertion( or1200_dmmu_top_dtlb_uwe = or1200_dmmu_top_or1200_dmmu_tlb_uwe) 1045
    assign or1200_dmmu_top_dtlb_ure = or1200_dmmu_top_or1200_dmmu_tlb_ure;

  //assertion( or1200_dmmu_top_dtlb_ure = or1200_dmmu_top_or1200_dmmu_tlb_ure) 1046
    assign or1200_dmmu_top_dtlb_swe = or1200_dmmu_top_or1200_dmmu_tlb_swe;

  //assertion( or1200_dmmu_top_dtlb_swe = or1200_dmmu_top_or1200_dmmu_tlb_swe) 1047
    assign or1200_dmmu_top_dtlb_sre = or1200_dmmu_top_or1200_dmmu_tlb_sre;

  //assertion( or1200_dmmu_top_dtlb_sre = or1200_dmmu_top_or1200_dmmu_tlb_sre) 1048
    assign or1200_dmmu_top_dtlb_ci = or1200_dmmu_top_or1200_dmmu_tlb_ci;

  //assertion( or1200_dmmu_top_dtlb_ci = or1200_dmmu_top_or1200_dmmu_tlb_ci) 1049
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_cs = or1200_dmmu_top_dtlb_spr_access;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_spr_cs = or1200_dmmu_top_dtlb_spr_access) 1050
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_write = or1200_dmmu_top_spr_write;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_spr_write = or1200_dmmu_top_spr_write) 1051
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_addr = or1200_dmmu_top_spr_addr;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_spr_addr = or1200_dmmu_top_spr_addr) 1052
    assign or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i = or1200_dmmu_top_spr_dat_i;

  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_i = or1200_dmmu_top_spr_dat_i) 1053
    assign or1200_dmmu_top_dtlb_dat_o = or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o;

  //assertion( or1200_dmmu_top_dtlb_dat_o = or1200_dmmu_top_or1200_dmmu_tlb_spr_dat_o) 1054
    assign or1200_dmmu_top_clk = clk_i;

  //assertion( or1200_dmmu_top_clk = clk_i) 1055
    assign or1200_dmmu_top_rst = rst_i;

  //assertion( or1200_dmmu_top_rst = rst_i) 1056
    assign or1200_dmmu_top_dc_en = dc_en;

  //assertion( or1200_dmmu_top_dc_en = dc_en) 1057
    assign or1200_dmmu_top_dmmu_en = dmmu_en;

  //assertion( or1200_dmmu_top_dmmu_en = dmmu_en) 1058
    assign or1200_dmmu_top_supv = supv;

  //assertion( or1200_dmmu_top_supv = supv) 1059
    assign or1200_dmmu_top_dcpu_adr_i = dcpu_adr_cpu;

  //assertion( or1200_dmmu_top_dcpu_adr_i = dcpu_adr_cpu) 1060
    assign or1200_dmmu_top_dcpu_cycstb_i = dcpu_cycstb_cpu;

  //assertion( or1200_dmmu_top_dcpu_cycstb_i = dcpu_cycstb_cpu) 1061
    assign or1200_dmmu_top_dcpu_we_i = dcpu_we_cpu;

  //assertion( or1200_dmmu_top_dcpu_we_i = dcpu_we_cpu) 1062
    assign dcpu_tag_dmmu = or1200_dmmu_top_dcpu_tag_o;

  //assertion( dcpu_tag_dmmu = or1200_dmmu_top_dcpu_tag_o) 1063
    assign dcpu_err_dmmu = or1200_dmmu_top_dcpu_err_o;

  //assertion( dcpu_err_dmmu = or1200_dmmu_top_dcpu_err_o) 1064
    assign or1200_dmmu_top_spr_write = spr_we;

  //assertion( or1200_dmmu_top_spr_write = spr_we) 1065
    assign or1200_dmmu_top_spr_addr = spr_addr;

  //assertion( or1200_dmmu_top_spr_addr = spr_addr) 1066
    assign or1200_dmmu_top_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_dmmu_top_spr_dat_i = spr_dat_cpu) 1067
    assign spr_dat_dmmu = or1200_dmmu_top_spr_dat_o;

  //assertion( spr_dat_dmmu = or1200_dmmu_top_spr_dat_o) 1068
    assign or1200_dmmu_top_qmemdmmu_err_i = qmemdmmu_err_qmem;

  //assertion( or1200_dmmu_top_qmemdmmu_err_i = qmemdmmu_err_qmem) 1069
    assign or1200_dmmu_top_qmemdmmu_tag_i = qmemdmmu_tag_qmem;

  //assertion( or1200_dmmu_top_qmemdmmu_tag_i = qmemdmmu_tag_qmem) 1070
    assign qmemdmmu_adr_dmmu = or1200_dmmu_top_qmemdmmu_adr_o;

  //assertion( qmemdmmu_adr_dmmu = or1200_dmmu_top_qmemdmmu_adr_o) 1071
    assign qmemdmmu_cycstb_dmmu = or1200_dmmu_top_qmemdmmu_cycstb_o;

  //assertion( qmemdmmu_cycstb_dmmu = or1200_dmmu_top_qmemdmmu_cycstb_o) 1072
    assign qmemdmmu_ci_dmmu = or1200_dmmu_top_qmemdmmu_ci_o;

  //assertion( qmemdmmu_ci_dmmu = or1200_dmmu_top_qmemdmmu_ci_o) 1073
    assign or1200_dc_top_dcsb_adr_o = or1200_dc_top_dc_addr;

  //assertion( or1200_dc_top_dcsb_adr_o = or1200_dc_top_dc_addr) 1074
    assign or1200_dc_top_dc_block_invalidate = ((or1200_dc_top_spr_cs & or1200_dc_top_spr_write) & ((or1200_dc_top_spr_addr[2:0] == 3'h3) | (or1200_dc_top_spr_addr[2:0] == 3'h2)));

  //assertion( or1200_dc_top_dc_block_invalidate = or1200_dc_top_spr_cs & or1200_dc_top_spr_write & (If((3 == Extract(2, 0, or1200_dc_top_spr_addr)) == True, 1, 0) | If((2 == Extract(2, 0, or1200_dc_top_spr_addr)) == True, 1, 0))) 1075
    assign or1200_dc_top_dctag_we = (or1200_dc_top_dcfsm_tag_we | or1200_dc_top_dc_block_invalidate);

  //assertion( or1200_dc_top_dctag_we = or1200_dc_top_dcfsm_tag_we | or1200_dc_top_dc_block_invalidate) 1076
    assign or1200_dc_top_dctag_en = (or1200_dc_top_dc_block_invalidate | or1200_dc_top_dc_en);

  //assertion( or1200_dc_top_dctag_en = or1200_dc_top_dc_block_invalidate | or1200_dc_top_dc_en) 1077
    assign or1200_dc_top_dcsb_cab_o = ((or1200_dc_top_dc_en & or1200_dc_top_dcfsm_burst) & or1200_dc_top_dcsb_cyc_o);

  //assertion( or1200_dc_top_dcsb_cab_o = or1200_dc_top_dc_en & or1200_dc_top_dcfsm_burst & or1200_dc_top_dcsb_cyc_o) 1078
    assign or1200_dc_top_dcqmem_rty_o = (~or1200_dc_top_dcqmem_ack_o);

  //assertion( or1200_dc_top_dcqmem_rty_o = ~or1200_dc_top_dcqmem_ack_o) 1079
    assign or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval = ((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i) | (~|or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_cache_inhibit));

  //assertion( or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval = or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i | ~bvredor(or1200_dc_top_or1200_dc_fsm_hitmiss_eval) & or1200_dc_top_or1200_dc_fsm_cache_inhibit) 1080
    assign or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load = ((((or1200_dc_top_or1200_dc_fsm_state == 3'h3) & or1200_dc_top_or1200_dc_fsm_dcqmem_we_i) & ~|or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback) & ~|or1200_dc_top_or1200_dc_fsm_did_early_load_ack);

  //assertion( or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load = If((3 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_dcqmem_we_i & ~bvredor(or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback) & ~bvredor(or1200_dc_top_or1200_dc_fsm_did_early_load_ack)) 1081
    assign or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load = (((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_load) & or1200_dc_top_or1200_dc_fsm_biudata_valid);

  //assertion( or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load = If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_load & or1200_dc_top_or1200_dc_fsm_biudata_valid) 1082
    assign or1200_dc_top_or1200_dc_fsm_dcram_we = ((({ 4{ (or1200_dc_top_or1200_dc_fsm_store_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack) } } | { 4{ or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load } }) & or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i) | { 4{ or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load } });

  //assertion( or1200_dc_top_or1200_dc_fsm_dcram_we = (Concat(Concat(Concat(or1200_dc_top_or1200_dc_fsm_store_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack, or1200_dc_top_or1200_dc_fsm_store_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack), or1200_dc_top_or1200_dc_fsm_store_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack), or1200_dc_top_or1200_dc_fsm_store_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack) | Concat(Concat(Concat(or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load, or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load), or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load), or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load)) & or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i | Concat(Concat(Concat(or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load, or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load), or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load), or1200_dc_top_or1200_dc_fsm_dcram_we_during_line_load)) 1083
    assign or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop = (((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_biudata_valid) & ~|(|or1200_dc_top_or1200_dc_fsm_cnt));

  //assertion( or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop = If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_biudata_valid & ~bvredor(bvredor(or1200_dc_top_or1200_dc_fsm_cnt))) 1084
    assign or1200_dc_top_or1200_dc_fsm_tag_dirty = or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set;

  //assertion( or1200_dc_top_or1200_dc_fsm_tag_dirty = or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set) 1085
    assign or1200_dc_top_or1200_dc_fsm_tag_we = ((or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop | or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set) | (or1200_dc_top_or1200_dc_fsm_state == 3'h6));

  //assertion( or1200_dc_top_or1200_dc_fsm_tag_we = or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop | or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set | If((6 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0)) 1086
    assign or1200_dc_top_or1200_dc_fsm_tag_valid = ((or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop & (or1200_dc_top_or1200_dc_fsm_load | (or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback))) | or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set);

  //assertion( or1200_dc_top_or1200_dc_fsm_tag_valid = or1200_dc_top_or1200_dc_fsm_tagram_we_end_of_loadstore_loop & (or1200_dc_top_or1200_dc_fsm_load | or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback) | or1200_dc_top_or1200_dc_fsm_tagram_dirty_bit_set) 1087
    assign or1200_dc_top_or1200_dc_fsm_biu_read = (((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & (((((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & ~|or1200_dc_top_or1200_dc_fsm_dirty) & ~|(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough)) | (or1200_dc_top_or1200_dc_fsm_load & or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval)) & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i)) | ((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_load));

  //assertion( or1200_dc_top_or1200_dc_fsm_biu_read = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & (or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss & ~bvredor(or1200_dc_top_or1200_dc_fsm_dirty) & ~bvredor(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough) | or1200_dc_top_or1200_dc_fsm_load & or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval) & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i | If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_load) 1088
    assign or1200_dc_top_or1200_dc_fsm_biu_write = ((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & ((((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & or1200_dc_top_or1200_dc_fsm_dirty) | (or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough)) | (or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval))) & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i) | ((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_store));

  //assertion( or1200_dc_top_or1200_dc_fsm_biu_write = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & (or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss & or1200_dc_top_or1200_dc_fsm_dirty | or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough | or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_cache_inhibit_with_eval) & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i | If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_store) 1089
    assign or1200_dc_top_or1200_dc_fsm_dcram_di_sel = or1200_dc_top_or1200_dc_fsm_load;

  //assertion( or1200_dc_top_or1200_dc_fsm_dcram_di_sel = or1200_dc_top_or1200_dc_fsm_load) 1090
    assign or1200_dc_top_or1200_dc_fsm_biu_do_sel = ((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_store);

  //assertion( or1200_dc_top_or1200_dc_fsm_biu_do_sel = If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_store) 1091
    assign or1200_dc_top_or1200_dc_fsm_first_hit_ack = (((((or1200_dc_top_or1200_dc_fsm_load_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_ack) | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack) | or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack) | or1200_dc_top_or1200_dc_fsm_store_inhibit_ack) | or1200_dc_top_or1200_dc_fsm_store_miss_ack);

  //assertion( or1200_dc_top_or1200_dc_fsm_first_hit_ack = or1200_dc_top_or1200_dc_fsm_load_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_ack | or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack | or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack | or1200_dc_top_or1200_dc_fsm_store_inhibit_ack | or1200_dc_top_or1200_dc_fsm_store_miss_ack) 1092
    assign or1200_dc_top_or1200_dc_fsm_first_miss_ack = ((~or1200_dc_top_or1200_dc_fsm_first_hit_ack) & (or1200_dc_top_or1200_dc_fsm_load_miss_ack | or1200_dc_top_or1200_dc_fsm_load_inhibit_ack));

  //assertion( or1200_dc_top_or1200_dc_fsm_first_miss_ack = ~or1200_dc_top_or1200_dc_fsm_first_hit_ack & (or1200_dc_top_or1200_dc_fsm_load_miss_ack | or1200_dc_top_or1200_dc_fsm_load_inhibit_ack)) 1093
    assign or1200_dc_top_or1200_dc_fsm_load_hit_ack = (((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & or1200_dc_top_or1200_dc_fsm_hitmiss_eval) & ~|or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & ~|or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i) & or1200_dc_top_or1200_dc_fsm_load);

  //assertion( or1200_dc_top_or1200_dc_fsm_load_hit_ack = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_hitmiss_eval & ~bvredor(or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & ~bvredor(or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i) & or1200_dc_top_or1200_dc_fsm_load) 1094
    assign or1200_dc_top_or1200_dc_fsm_store_hit_ack = ((((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & or1200_dc_top_or1200_dc_fsm_hitmiss_eval) & ~|or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & ~|or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i) & or1200_dc_top_or1200_dc_fsm_store) & ~|or1200_dc_top_or1200_dc_fsm_writethrough);

  //assertion( or1200_dc_top_or1200_dc_fsm_store_hit_ack = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_hitmiss_eval & ~bvredor(or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & ~bvredor(or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i) & or1200_dc_top_or1200_dc_fsm_store & ~bvredor(or1200_dc_top_or1200_dc_fsm_writethrough)) 1095
    assign or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack = ((((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & ~|or1200_dc_top_or1200_dc_fsm_cache_miss) & ~|or1200_dc_top_or1200_dc_fsm_cache_inhibit) & or1200_dc_top_or1200_dc_fsm_store) & or1200_dc_top_or1200_dc_fsm_writethrough) & or1200_dc_top_or1200_dc_fsm_biudata_valid);

  //assertion( or1200_dc_top_or1200_dc_fsm_store_hit_writethrough_ack = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & ~bvredor(or1200_dc_top_or1200_dc_fsm_cache_miss) & ~bvredor(or1200_dc_top_or1200_dc_fsm_cache_inhibit) & or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough & or1200_dc_top_or1200_dc_fsm_biudata_valid) 1096
    assign or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack = ((((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & or1200_dc_top_or1200_dc_fsm_cache_miss) & ~|or1200_dc_top_or1200_dc_fsm_cache_inhibit) & or1200_dc_top_or1200_dc_fsm_store) & or1200_dc_top_or1200_dc_fsm_writethrough) & or1200_dc_top_or1200_dc_fsm_biudata_valid);

  //assertion( or1200_dc_top_or1200_dc_fsm_store_miss_writethrough_ack = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_cache_miss & ~bvredor(or1200_dc_top_or1200_dc_fsm_cache_inhibit) & or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough & or1200_dc_top_or1200_dc_fsm_biudata_valid) 1097
    assign or1200_dc_top_or1200_dc_fsm_store_inhibit_ack = ((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & or1200_dc_top_or1200_dc_fsm_store) & or1200_dc_top_or1200_dc_fsm_cache_inhibit) & or1200_dc_top_or1200_dc_fsm_biudata_valid);

  //assertion( or1200_dc_top_or1200_dc_fsm_store_inhibit_ack = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_cache_inhibit & or1200_dc_top_or1200_dc_fsm_biudata_valid) 1098
    assign or1200_dc_top_or1200_dc_fsm_load_miss_ack = (((((or1200_dc_top_or1200_dc_fsm_state == 3'h2) & or1200_dc_top_or1200_dc_fsm_load) & ({28'h0000000, or1200_dc_top_or1200_dc_fsm_cnt} == 32'h0000000c)) & or1200_dc_top_or1200_dc_fsm_biudata_valid) & ~|(or1200_dc_top_or1200_dc_fsm_dcqmem_we_i & ~|or1200_dc_top_or1200_dc_fsm_writethrough));

  //assertion( or1200_dc_top_or1200_dc_fsm_load_miss_ack = If((2 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_load & If((12 == Concat(0, or1200_dc_top_or1200_dc_fsm_cnt)) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_biudata_valid & ~bvredor(or1200_dc_top_or1200_dc_fsm_dcqmem_we_i & ~bvredor(or1200_dc_top_or1200_dc_fsm_writethrough))) 1099
    assign or1200_dc_top_or1200_dc_fsm_load_inhibit_ack = ((((or1200_dc_top_or1200_dc_fsm_state == 3'h1) & or1200_dc_top_or1200_dc_fsm_load) & or1200_dc_top_or1200_dc_fsm_cache_inhibit) & or1200_dc_top_or1200_dc_fsm_biudata_valid);

  //assertion( or1200_dc_top_or1200_dc_fsm_load_inhibit_ack = If((1 == or1200_dc_top_or1200_dc_fsm_state) == True, 1, 0) & or1200_dc_top_or1200_dc_fsm_load & or1200_dc_top_or1200_dc_fsm_cache_inhibit & or1200_dc_top_or1200_dc_fsm_biudata_valid) 1100
    assign or1200_dc_top_or1200_dc_fsm_store_miss_ack = or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load;

  //assertion( or1200_dc_top_or1200_dc_fsm_store_miss_ack = or1200_dc_top_or1200_dc_fsm_dcram_we_after_line_load) 1101
    assign or1200_dc_top_or1200_dc_fsm_first_miss_err = (or1200_dc_top_or1200_dc_fsm_biudata_error & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i);

  //assertion( or1200_dc_top_or1200_dc_fsm_first_miss_err = or1200_dc_top_or1200_dc_fsm_biudata_error & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i) 1102
    assign or1200_dc_top_or1200_dc_fsm_clk = or1200_dc_top_clk;

  //assertion( or1200_dc_top_or1200_dc_fsm_clk = or1200_dc_top_clk) 1103
    assign or1200_dc_top_or1200_dc_fsm_rst = or1200_dc_top_rst;

  //assertion( or1200_dc_top_or1200_dc_fsm_rst = or1200_dc_top_rst) 1104
    assign or1200_dc_top_or1200_dc_fsm_dc_en = or1200_dc_top_dc_en;

  //assertion( or1200_dc_top_or1200_dc_fsm_dc_en = or1200_dc_top_dc_en) 1105
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i = or1200_dc_top_dcqmem_cycstb_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i = or1200_dc_top_dcqmem_cycstb_i) 1106
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i = or1200_dc_top_dcqmem_ci_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i = or1200_dc_top_dcqmem_ci_i) 1107
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_we_i = or1200_dc_top_dcqmem_we_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_dcqmem_we_i = or1200_dc_top_dcqmem_we_i) 1108
    assign or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i = or1200_dc_top_dcqmem_sel_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_dcqmem_sel_i = or1200_dc_top_dcqmem_sel_i) 1109
    assign or1200_dc_top_or1200_dc_fsm_tagcomp_miss = or1200_dc_top_tagcomp_miss;

  //assertion( or1200_dc_top_or1200_dc_fsm_tagcomp_miss = or1200_dc_top_tagcomp_miss) 1110
    assign or1200_dc_top_or1200_dc_fsm_biudata_valid = or1200_dc_top_dcsb_ack_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_biudata_valid = or1200_dc_top_dcsb_ack_i) 1111
    assign or1200_dc_top_or1200_dc_fsm_biudata_error = or1200_dc_top_dcsb_err_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_biudata_error = or1200_dc_top_dcsb_err_i) 1112
    assign or1200_dc_top_or1200_dc_fsm_lsu_addr = or1200_dc_top_dcqmem_adr_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_lsu_addr = or1200_dc_top_dcqmem_adr_i) 1113
    assign or1200_dc_top_dcram_we = or1200_dc_top_or1200_dc_fsm_dcram_we;

  //assertion( or1200_dc_top_dcram_we = or1200_dc_top_or1200_dc_fsm_dcram_we) 1114
    assign or1200_dc_top_dcfsm_biu_read = or1200_dc_top_or1200_dc_fsm_biu_read;

  //assertion( or1200_dc_top_dcfsm_biu_read = or1200_dc_top_or1200_dc_fsm_biu_read) 1115
    assign or1200_dc_top_dcfsm_biu_write = or1200_dc_top_or1200_dc_fsm_biu_write;

  //assertion( or1200_dc_top_dcfsm_biu_write = or1200_dc_top_or1200_dc_fsm_biu_write) 1116
    assign or1200_dc_top_dcfsm_biu_do_sel = or1200_dc_top_or1200_dc_fsm_biu_do_sel;

  //assertion( or1200_dc_top_dcfsm_biu_do_sel = or1200_dc_top_or1200_dc_fsm_biu_do_sel) 1117
    assign or1200_dc_top_dcfsm_dcram_di_sel = or1200_dc_top_or1200_dc_fsm_dcram_di_sel;

  //assertion( or1200_dc_top_dcfsm_dcram_di_sel = or1200_dc_top_or1200_dc_fsm_dcram_di_sel) 1118
    assign or1200_dc_top_dcfsm_first_hit_ack = or1200_dc_top_or1200_dc_fsm_first_hit_ack;

  //assertion( or1200_dc_top_dcfsm_first_hit_ack = or1200_dc_top_or1200_dc_fsm_first_hit_ack) 1119
    assign or1200_dc_top_dcfsm_first_miss_ack = or1200_dc_top_or1200_dc_fsm_first_miss_ack;

  //assertion( or1200_dc_top_dcfsm_first_miss_ack = or1200_dc_top_or1200_dc_fsm_first_miss_ack) 1120
    assign or1200_dc_top_dcfsm_first_miss_err = or1200_dc_top_or1200_dc_fsm_first_miss_err;

  //assertion( or1200_dc_top_dcfsm_first_miss_err = or1200_dc_top_or1200_dc_fsm_first_miss_err) 1121
    assign or1200_dc_top_dcfsm_burst = or1200_dc_top_or1200_dc_fsm_burst;

  //assertion( or1200_dc_top_dcfsm_burst = or1200_dc_top_or1200_dc_fsm_burst) 1122
    assign or1200_dc_top_dcfsm_tag_we = or1200_dc_top_or1200_dc_fsm_tag_we;

  //assertion( or1200_dc_top_dcfsm_tag_we = or1200_dc_top_or1200_dc_fsm_tag_we) 1123
    assign or1200_dc_top_dcfsm_tag_valid = or1200_dc_top_or1200_dc_fsm_tag_valid;

  //assertion( or1200_dc_top_dcfsm_tag_valid = or1200_dc_top_or1200_dc_fsm_tag_valid) 1124
    assign or1200_dc_top_dc_addr = or1200_dc_top_or1200_dc_fsm_dc_addr;

  //assertion( or1200_dc_top_dc_addr = or1200_dc_top_or1200_dc_fsm_dc_addr) 1125
    assign or1200_dc_top_or1200_dc_fsm_dc_no_writethrough = or1200_dc_top_dc_no_writethrough;

  //assertion( or1200_dc_top_or1200_dc_fsm_dc_no_writethrough = or1200_dc_top_dc_no_writethrough) 1126
    assign or1200_dc_top_dcfsm_tag_dirty = or1200_dc_top_or1200_dc_fsm_tag_dirty;

  //assertion( or1200_dc_top_dcfsm_tag_dirty = or1200_dc_top_or1200_dc_fsm_tag_dirty) 1127
    assign or1200_dc_top_or1200_dc_fsm_dirty = or1200_dc_top_dirty;

  //assertion( or1200_dc_top_or1200_dc_fsm_dirty = or1200_dc_top_dirty) 1128
    assign or1200_dc_top_or1200_dc_fsm_tag = or1200_dc_top_tag;

  //assertion( or1200_dc_top_or1200_dc_fsm_tag = or1200_dc_top_tag) 1129
    assign or1200_dc_top_or1200_dc_fsm_tag_v = or1200_dc_top_tag_v;

  //assertion( or1200_dc_top_or1200_dc_fsm_tag_v = or1200_dc_top_tag_v) 1130
    assign or1200_dc_top_or1200_dc_fsm_dc_block_flush = or1200_dc_top_dc_block_flush;

  //assertion( or1200_dc_top_or1200_dc_fsm_dc_block_flush = or1200_dc_top_dc_block_flush) 1131
    assign or1200_dc_top_or1200_dc_fsm_dc_block_writeback = or1200_dc_top_dc_block_writeback;

  //assertion( or1200_dc_top_or1200_dc_fsm_dc_block_writeback = or1200_dc_top_dc_block_writeback) 1132
    assign or1200_dc_top_or1200_dc_fsm_spr_dat_i = or1200_dc_top_spr_dat_i;

  //assertion( or1200_dc_top_or1200_dc_fsm_spr_dat_i = or1200_dc_top_spr_dat_i) 1133
    assign or1200_dc_top_mtspr_dc_done = or1200_dc_top_or1200_dc_fsm_mtspr_dc_done;

  //assertion( or1200_dc_top_mtspr_dc_done = or1200_dc_top_or1200_dc_fsm_mtspr_dc_done) 1134
    assign or1200_dc_top_or1200_dc_fsm_spr_cswe = (or1200_dc_top_spr_cs & or1200_dc_top_spr_write);

  //assertion( or1200_dc_top_or1200_dc_fsm_spr_cswe = or1200_dc_top_spr_cs & or1200_dc_top_spr_write) 1135
    assign or1200_dc_top_or1200_dc_ram_dc_ram_clk = or1200_dc_top_or1200_dc_ram_clk;

  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_clk = or1200_dc_top_or1200_dc_ram_clk) 1136
    assign or1200_dc_top_or1200_dc_ram_dc_ram_ce = or1200_dc_top_or1200_dc_ram_en;

  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_ce = or1200_dc_top_or1200_dc_ram_en) 1137
    assign or1200_dc_top_or1200_dc_ram_dc_ram_we = or1200_dc_top_or1200_dc_ram_we;

  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_we = or1200_dc_top_or1200_dc_ram_we) 1138
    assign or1200_dc_top_or1200_dc_ram_dc_ram_addr = or1200_dc_top_or1200_dc_ram_addr;

  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_addr = or1200_dc_top_or1200_dc_ram_addr) 1139
    assign or1200_dc_top_or1200_dc_ram_dc_ram_di = or1200_dc_top_or1200_dc_ram_datain;

  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_di = or1200_dc_top_or1200_dc_ram_datain) 1140
    assign or1200_dc_top_or1200_dc_ram_dataout = or1200_dc_top_or1200_dc_ram_dc_ram_doq;

  //assertion( or1200_dc_top_or1200_dc_ram_dataout = or1200_dc_top_or1200_dc_ram_dc_ram_doq) 1141
    assign or1200_dc_top_or1200_dc_ram_clk = or1200_dc_top_clk;

  //assertion( or1200_dc_top_or1200_dc_ram_clk = or1200_dc_top_clk) 1142
    assign or1200_dc_top_or1200_dc_ram_rst = or1200_dc_top_rst;

  //assertion( or1200_dc_top_or1200_dc_ram_rst = or1200_dc_top_rst) 1143
    assign or1200_dc_top_or1200_dc_ram_en = or1200_dc_top_dc_en;

  //assertion( or1200_dc_top_or1200_dc_ram_en = or1200_dc_top_dc_en) 1144
    assign or1200_dc_top_or1200_dc_ram_we = or1200_dc_top_dcram_we;

  //assertion( or1200_dc_top_or1200_dc_ram_we = or1200_dc_top_dcram_we) 1145
    assign or1200_dc_top_or1200_dc_ram_datain = or1200_dc_top_to_dcram;

  //assertion( or1200_dc_top_or1200_dc_ram_datain = or1200_dc_top_to_dcram) 1146
    assign or1200_dc_top_from_dcram = or1200_dc_top_or1200_dc_ram_dataout;

  //assertion( or1200_dc_top_from_dcram = or1200_dc_top_or1200_dc_ram_dataout) 1147
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_clk = or1200_dc_top_or1200_dc_tag_clk;

  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_clk = or1200_dc_top_or1200_dc_tag_clk) 1148
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_ce = or1200_dc_top_or1200_dc_tag_en;

  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_ce = or1200_dc_top_or1200_dc_tag_en) 1149
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_we = or1200_dc_top_or1200_dc_tag_we;

  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_we = or1200_dc_top_or1200_dc_tag_we) 1150
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_addr = or1200_dc_top_or1200_dc_tag_addr;

  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_addr = or1200_dc_top_or1200_dc_tag_addr) 1151
    assign or1200_dc_top_or1200_dc_tag_dc_tag0_di = or1200_dc_top_or1200_dc_tag_datain;

  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_di = or1200_dc_top_or1200_dc_tag_datain) 1152
    assign or1200_dc_top_or1200_dc_tag_clk = or1200_dc_top_clk;

  //assertion( or1200_dc_top_or1200_dc_tag_clk = or1200_dc_top_clk) 1153
    assign or1200_dc_top_or1200_dc_tag_rst = or1200_dc_top_rst;

  //assertion( or1200_dc_top_or1200_dc_tag_rst = or1200_dc_top_rst) 1154
    assign or1200_dc_top_or1200_dc_tag_addr = or1200_dc_top_dctag_addr;

  //assertion( or1200_dc_top_or1200_dc_tag_addr = or1200_dc_top_dctag_addr) 1155
    assign or1200_dc_top_or1200_dc_tag_en = or1200_dc_top_dctag_en;

  //assertion( or1200_dc_top_or1200_dc_tag_en = or1200_dc_top_dctag_en) 1156
    assign or1200_dc_top_or1200_dc_tag_we = or1200_dc_top_dctag_we;

  //assertion( or1200_dc_top_or1200_dc_tag_we = or1200_dc_top_dctag_we) 1157
    assign or1200_dc_top_tag_v = or1200_dc_top_or1200_dc_tag_tag_v;

  //assertion( or1200_dc_top_tag_v = or1200_dc_top_or1200_dc_tag_tag_v) 1158
    assign or1200_dc_top_tag = or1200_dc_top_or1200_dc_tag_tag;

  //assertion( or1200_dc_top_tag = or1200_dc_top_or1200_dc_tag_tag) 1159
    assign or1200_dc_top_dirty = or1200_dc_top_or1200_dc_tag_dirty;

  //assertion( or1200_dc_top_dirty = or1200_dc_top_or1200_dc_tag_dirty) 1160
    assign or1200_dc_top_clk = clk_i;

  //assertion( or1200_dc_top_clk = clk_i) 1161
    assign or1200_dc_top_rst = rst_i;

  //assertion( or1200_dc_top_rst = rst_i) 1162
    assign dcsb_dat_dc = or1200_dc_top_dcsb_dat_o;

  //assertion( dcsb_dat_dc = or1200_dc_top_dcsb_dat_o) 1163
    assign dcsb_adr_dc = or1200_dc_top_dcsb_adr_o;

  //assertion( dcsb_adr_dc = or1200_dc_top_dcsb_adr_o) 1164
    assign dcsb_cyc_dc = or1200_dc_top_dcsb_cyc_o;

  //assertion( dcsb_cyc_dc = or1200_dc_top_dcsb_cyc_o) 1165
    assign dcsb_stb_dc = or1200_dc_top_dcsb_stb_o;

  //assertion( dcsb_stb_dc = or1200_dc_top_dcsb_stb_o) 1166
    assign dcsb_we_dc = or1200_dc_top_dcsb_we_o;

  //assertion( dcsb_we_dc = or1200_dc_top_dcsb_we_o) 1167
    assign dcsb_sel_dc = or1200_dc_top_dcsb_sel_o;

  //assertion( dcsb_sel_dc = or1200_dc_top_dcsb_sel_o) 1168
    assign dcsb_cab_dc = or1200_dc_top_dcsb_cab_o;

  //assertion( dcsb_cab_dc = or1200_dc_top_dcsb_cab_o) 1169
    assign or1200_dc_top_dcsb_dat_i = dcsb_dat_sb;

  //assertion( or1200_dc_top_dcsb_dat_i = dcsb_dat_sb) 1170
    assign or1200_dc_top_dcsb_ack_i = dcsb_ack_sb;

  //assertion( or1200_dc_top_dcsb_ack_i = dcsb_ack_sb) 1171
    assign or1200_dc_top_dcsb_err_i = dcsb_err_sb;

  //assertion( or1200_dc_top_dcsb_err_i = dcsb_err_sb) 1172
    assign or1200_dc_top_dc_en = dc_en;

  //assertion( or1200_dc_top_dc_en = dc_en) 1173
    assign or1200_dc_top_dcqmem_adr_i = dcqmem_adr_qmem;

  //assertion( or1200_dc_top_dcqmem_adr_i = dcqmem_adr_qmem) 1174
    assign or1200_dc_top_dcqmem_cycstb_i = dcqmem_cycstb_qmem;

  //assertion( or1200_dc_top_dcqmem_cycstb_i = dcqmem_cycstb_qmem) 1175
    assign or1200_dc_top_dcqmem_ci_i = dcqmem_ci_qmem;

  //assertion( or1200_dc_top_dcqmem_ci_i = dcqmem_ci_qmem) 1176
    assign or1200_dc_top_dcqmem_we_i = dcqmem_we_qmem;

  //assertion( or1200_dc_top_dcqmem_we_i = dcqmem_we_qmem) 1177
    assign or1200_dc_top_dcqmem_sel_i = dcqmem_sel_qmem;

  //assertion( or1200_dc_top_dcqmem_sel_i = dcqmem_sel_qmem) 1178
    assign or1200_dc_top_dcqmem_tag_i = dcqmem_tag_qmem;

  //assertion( or1200_dc_top_dcqmem_tag_i = dcqmem_tag_qmem) 1179
    assign or1200_dc_top_dcqmem_dat_i = dcqmem_dat_qmem;

  //assertion( or1200_dc_top_dcqmem_dat_i = dcqmem_dat_qmem) 1180
    assign dcqmem_dat_dc = or1200_dc_top_dcqmem_dat_o;

  //assertion( dcqmem_dat_dc = or1200_dc_top_dcqmem_dat_o) 1181
    assign dcqmem_ack_dc = or1200_dc_top_dcqmem_ack_o;

  //assertion( dcqmem_ack_dc = or1200_dc_top_dcqmem_ack_o) 1182
    assign dcqmem_rty_dc = or1200_dc_top_dcqmem_rty_o;

  //assertion( dcqmem_rty_dc = or1200_dc_top_dcqmem_rty_o) 1183
    assign dcqmem_err_dc = or1200_dc_top_dcqmem_err_o;

  //assertion( dcqmem_err_dc = or1200_dc_top_dcqmem_err_o) 1184
    assign dcqmem_tag_dc = or1200_dc_top_dcqmem_tag_o;

  //assertion( dcqmem_tag_dc = or1200_dc_top_dcqmem_tag_o) 1185
    assign or1200_dc_top_dc_no_writethrough = dc_no_writethrough;

  //assertion( or1200_dc_top_dc_no_writethrough = dc_no_writethrough) 1186
    assign or1200_dc_top_spr_write = spr_we;

  //assertion( or1200_dc_top_spr_write = spr_we) 1187
    assign or1200_dc_top_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_dc_top_spr_dat_i = spr_dat_cpu) 1188
    assign or1200_dc_top_spr_addr = spr_addr;

  //assertion( or1200_dc_top_spr_addr = spr_addr) 1189
    assign mtspr_dc_done = or1200_dc_top_mtspr_dc_done;

  //assertion( mtspr_dc_done = or1200_dc_top_mtspr_dc_done) 1190
    assign or1200_qmem_top_qmemicpu_dat_o = or1200_qmem_top_icqmem_dat_i;

  //assertion( or1200_qmem_top_qmemicpu_dat_o = or1200_qmem_top_icqmem_dat_i) 1191
    assign or1200_qmem_top_qmemicpu_ack_o = or1200_qmem_top_icqmem_ack_i;

  //assertion( or1200_qmem_top_qmemicpu_ack_o = or1200_qmem_top_icqmem_ack_i) 1192
    assign or1200_qmem_top_qmemimmu_rty_o = or1200_qmem_top_icqmem_rty_i;

  //assertion( or1200_qmem_top_qmemimmu_rty_o = or1200_qmem_top_icqmem_rty_i) 1193
    assign or1200_qmem_top_qmemimmu_err_o = or1200_qmem_top_icqmem_err_i;

  //assertion( or1200_qmem_top_qmemimmu_err_o = or1200_qmem_top_icqmem_err_i) 1194
    assign or1200_qmem_top_qmemimmu_tag_o = or1200_qmem_top_icqmem_tag_i;

  //assertion( or1200_qmem_top_qmemimmu_tag_o = or1200_qmem_top_icqmem_tag_i) 1195
    assign or1200_qmem_top_icqmem_adr_o = or1200_qmem_top_qmemimmu_adr_i;

  //assertion( or1200_qmem_top_icqmem_adr_o = or1200_qmem_top_qmemimmu_adr_i) 1196
    assign or1200_qmem_top_icqmem_cycstb_o = or1200_qmem_top_qmemimmu_cycstb_i;

  //assertion( or1200_qmem_top_icqmem_cycstb_o = or1200_qmem_top_qmemimmu_cycstb_i) 1197
    assign or1200_qmem_top_icqmem_ci_o = or1200_qmem_top_qmemimmu_ci_i;

  //assertion( or1200_qmem_top_icqmem_ci_o = or1200_qmem_top_qmemimmu_ci_i) 1198
    assign or1200_qmem_top_icqmem_sel_o = or1200_qmem_top_qmemicpu_sel_i;

  //assertion( or1200_qmem_top_icqmem_sel_o = or1200_qmem_top_qmemicpu_sel_i) 1199
    assign or1200_qmem_top_icqmem_tag_o = or1200_qmem_top_qmemicpu_tag_i;

  //assertion( or1200_qmem_top_icqmem_tag_o = or1200_qmem_top_qmemicpu_tag_i) 1200
    assign or1200_qmem_top_qmemdcpu_dat_o = or1200_qmem_top_dcqmem_dat_i;

  //assertion( or1200_qmem_top_qmemdcpu_dat_o = or1200_qmem_top_dcqmem_dat_i) 1201
    assign or1200_qmem_top_qmemdcpu_ack_o = or1200_qmem_top_dcqmem_ack_i;

  //assertion( or1200_qmem_top_qmemdcpu_ack_o = or1200_qmem_top_dcqmem_ack_i) 1202
    assign or1200_qmem_top_qmemdcpu_rty_o = or1200_qmem_top_dcqmem_rty_i;

  //assertion( or1200_qmem_top_qmemdcpu_rty_o = or1200_qmem_top_dcqmem_rty_i) 1203
    assign or1200_qmem_top_qmemdmmu_err_o = or1200_qmem_top_dcqmem_err_i;

  //assertion( or1200_qmem_top_qmemdmmu_err_o = or1200_qmem_top_dcqmem_err_i) 1204
    assign or1200_qmem_top_qmemdmmu_tag_o = or1200_qmem_top_dcqmem_tag_i;

  //assertion( or1200_qmem_top_qmemdmmu_tag_o = or1200_qmem_top_dcqmem_tag_i) 1205
    assign or1200_qmem_top_dcqmem_adr_o = or1200_qmem_top_qmemdmmu_adr_i;

  //assertion( or1200_qmem_top_dcqmem_adr_o = or1200_qmem_top_qmemdmmu_adr_i) 1206
    assign or1200_qmem_top_dcqmem_cycstb_o = or1200_qmem_top_qmemdmmu_cycstb_i;

  //assertion( or1200_qmem_top_dcqmem_cycstb_o = or1200_qmem_top_qmemdmmu_cycstb_i) 1207
    assign or1200_qmem_top_dcqmem_ci_o = or1200_qmem_top_qmemdmmu_ci_i;

  //assertion( or1200_qmem_top_dcqmem_ci_o = or1200_qmem_top_qmemdmmu_ci_i) 1208
    assign or1200_qmem_top_dcqmem_we_o = or1200_qmem_top_qmemdcpu_we_i;

  //assertion( or1200_qmem_top_dcqmem_we_o = or1200_qmem_top_qmemdcpu_we_i) 1209
    assign or1200_qmem_top_dcqmem_sel_o = or1200_qmem_top_qmemdcpu_sel_i;

  //assertion( or1200_qmem_top_dcqmem_sel_o = or1200_qmem_top_qmemdcpu_sel_i) 1210
    assign or1200_qmem_top_dcqmem_tag_o = or1200_qmem_top_qmemdcpu_tag_i;

  //assertion( or1200_qmem_top_dcqmem_tag_o = or1200_qmem_top_qmemdcpu_tag_i) 1211
    assign or1200_qmem_top_dcqmem_dat_o = or1200_qmem_top_qmemdcpu_dat_i;

  //assertion( or1200_qmem_top_dcqmem_dat_o = or1200_qmem_top_qmemdcpu_dat_i) 1212
    assign or1200_qmem_top_clk = clk_i;

  //assertion( or1200_qmem_top_clk = clk_i) 1213
    assign or1200_qmem_top_rst = rst_i;

  //assertion( or1200_qmem_top_rst = rst_i) 1214
    assign or1200_qmem_top_qmemimmu_adr_i = qmemimmu_adr_immu;

  //assertion( or1200_qmem_top_qmemimmu_adr_i = qmemimmu_adr_immu) 1215
    assign or1200_qmem_top_qmemimmu_cycstb_i = qmemimmu_cycstb_immu;

  //assertion( or1200_qmem_top_qmemimmu_cycstb_i = qmemimmu_cycstb_immu) 1216
    assign or1200_qmem_top_qmemimmu_ci_i = qmemimmu_ci_immu;

  //assertion( or1200_qmem_top_qmemimmu_ci_i = qmemimmu_ci_immu) 1217
    assign or1200_qmem_top_qmemicpu_sel_i = icpu_sel_cpu;

  //assertion( or1200_qmem_top_qmemicpu_sel_i = icpu_sel_cpu) 1218
    assign or1200_qmem_top_qmemicpu_tag_i = icpu_tag_cpu;

  //assertion( or1200_qmem_top_qmemicpu_tag_i = icpu_tag_cpu) 1219
    assign icpu_dat_qmem = or1200_qmem_top_qmemicpu_dat_o;

  //assertion( icpu_dat_qmem = or1200_qmem_top_qmemicpu_dat_o) 1220
    assign icpu_ack_qmem = or1200_qmem_top_qmemicpu_ack_o;

  //assertion( icpu_ack_qmem = or1200_qmem_top_qmemicpu_ack_o) 1221
    assign qmemimmu_rty_qmem = or1200_qmem_top_qmemimmu_rty_o;

  //assertion( qmemimmu_rty_qmem = or1200_qmem_top_qmemimmu_rty_o) 1222
    assign qmemimmu_err_qmem = or1200_qmem_top_qmemimmu_err_o;

  //assertion( qmemimmu_err_qmem = or1200_qmem_top_qmemimmu_err_o) 1223
    assign qmemimmu_tag_qmem = or1200_qmem_top_qmemimmu_tag_o;

  //assertion( qmemimmu_tag_qmem = or1200_qmem_top_qmemimmu_tag_o) 1224
    assign icqmem_adr_qmem = or1200_qmem_top_icqmem_adr_o;

  //assertion( icqmem_adr_qmem = or1200_qmem_top_icqmem_adr_o) 1225
    assign icqmem_cycstb_qmem = or1200_qmem_top_icqmem_cycstb_o;

  //assertion( icqmem_cycstb_qmem = or1200_qmem_top_icqmem_cycstb_o) 1226
    assign icqmem_ci_qmem = or1200_qmem_top_icqmem_ci_o;

  //assertion( icqmem_ci_qmem = or1200_qmem_top_icqmem_ci_o) 1227
    assign icqmem_sel_qmem = or1200_qmem_top_icqmem_sel_o;

  //assertion( icqmem_sel_qmem = or1200_qmem_top_icqmem_sel_o) 1228
    assign icqmem_tag_qmem = or1200_qmem_top_icqmem_tag_o;

  //assertion( icqmem_tag_qmem = or1200_qmem_top_icqmem_tag_o) 1229
    assign or1200_qmem_top_icqmem_dat_i = icqmem_dat_ic;

  //assertion( or1200_qmem_top_icqmem_dat_i = icqmem_dat_ic) 1230
    assign or1200_qmem_top_icqmem_ack_i = icqmem_ack_ic;

  //assertion( or1200_qmem_top_icqmem_ack_i = icqmem_ack_ic) 1231
    assign or1200_qmem_top_icqmem_rty_i = icqmem_rty_ic;

  //assertion( or1200_qmem_top_icqmem_rty_i = icqmem_rty_ic) 1232
    assign or1200_qmem_top_icqmem_err_i = icqmem_err_ic;

  //assertion( or1200_qmem_top_icqmem_err_i = icqmem_err_ic) 1233
    assign or1200_qmem_top_icqmem_tag_i = icqmem_tag_ic;

  //assertion( or1200_qmem_top_icqmem_tag_i = icqmem_tag_ic) 1234
    assign or1200_qmem_top_qmemdmmu_adr_i = qmemdmmu_adr_dmmu;

  //assertion( or1200_qmem_top_qmemdmmu_adr_i = qmemdmmu_adr_dmmu) 1235
    assign or1200_qmem_top_qmemdmmu_cycstb_i = qmemdmmu_cycstb_dmmu;

  //assertion( or1200_qmem_top_qmemdmmu_cycstb_i = qmemdmmu_cycstb_dmmu) 1236
    assign or1200_qmem_top_qmemdmmu_ci_i = qmemdmmu_ci_dmmu;

  //assertion( or1200_qmem_top_qmemdmmu_ci_i = qmemdmmu_ci_dmmu) 1237
    assign or1200_qmem_top_qmemdcpu_we_i = dcpu_we_cpu;

  //assertion( or1200_qmem_top_qmemdcpu_we_i = dcpu_we_cpu) 1238
    assign or1200_qmem_top_qmemdcpu_sel_i = dcpu_sel_cpu;

  //assertion( or1200_qmem_top_qmemdcpu_sel_i = dcpu_sel_cpu) 1239
    assign or1200_qmem_top_qmemdcpu_tag_i = dcpu_tag_cpu;

  //assertion( or1200_qmem_top_qmemdcpu_tag_i = dcpu_tag_cpu) 1240
    assign or1200_qmem_top_qmemdcpu_dat_i = dcpu_dat_cpu;

  //assertion( or1200_qmem_top_qmemdcpu_dat_i = dcpu_dat_cpu) 1241
    assign dcpu_dat_qmem = or1200_qmem_top_qmemdcpu_dat_o;

  //assertion( dcpu_dat_qmem = or1200_qmem_top_qmemdcpu_dat_o) 1242
    assign dcpu_ack_qmem = or1200_qmem_top_qmemdcpu_ack_o;

  //assertion( dcpu_ack_qmem = or1200_qmem_top_qmemdcpu_ack_o) 1243
    assign dcpu_rty_qmem = or1200_qmem_top_qmemdcpu_rty_o;

  //assertion( dcpu_rty_qmem = or1200_qmem_top_qmemdcpu_rty_o) 1244
    assign qmemdmmu_err_qmem = or1200_qmem_top_qmemdmmu_err_o;

  //assertion( qmemdmmu_err_qmem = or1200_qmem_top_qmemdmmu_err_o) 1245
    assign qmemdmmu_tag_qmem = or1200_qmem_top_qmemdmmu_tag_o;

  //assertion( qmemdmmu_tag_qmem = or1200_qmem_top_qmemdmmu_tag_o) 1246
    assign dcqmem_adr_qmem = or1200_qmem_top_dcqmem_adr_o;

  //assertion( dcqmem_adr_qmem = or1200_qmem_top_dcqmem_adr_o) 1247
    assign dcqmem_cycstb_qmem = or1200_qmem_top_dcqmem_cycstb_o;

  //assertion( dcqmem_cycstb_qmem = or1200_qmem_top_dcqmem_cycstb_o) 1248
    assign dcqmem_ci_qmem = or1200_qmem_top_dcqmem_ci_o;

  //assertion( dcqmem_ci_qmem = or1200_qmem_top_dcqmem_ci_o) 1249
    assign dcqmem_we_qmem = or1200_qmem_top_dcqmem_we_o;

  //assertion( dcqmem_we_qmem = or1200_qmem_top_dcqmem_we_o) 1250
    assign dcqmem_sel_qmem = or1200_qmem_top_dcqmem_sel_o;

  //assertion( dcqmem_sel_qmem = or1200_qmem_top_dcqmem_sel_o) 1251
    assign dcqmem_tag_qmem = or1200_qmem_top_dcqmem_tag_o;

  //assertion( dcqmem_tag_qmem = or1200_qmem_top_dcqmem_tag_o) 1252
    assign dcqmem_dat_qmem = or1200_qmem_top_dcqmem_dat_o;

  //assertion( dcqmem_dat_qmem = or1200_qmem_top_dcqmem_dat_o) 1253
    assign or1200_qmem_top_dcqmem_dat_i = dcqmem_dat_dc;

  //assertion( or1200_qmem_top_dcqmem_dat_i = dcqmem_dat_dc) 1254
    assign or1200_qmem_top_dcqmem_ack_i = dcqmem_ack_dc;

  //assertion( or1200_qmem_top_dcqmem_ack_i = dcqmem_ack_dc) 1255
    assign or1200_qmem_top_dcqmem_rty_i = dcqmem_rty_dc;

  //assertion( or1200_qmem_top_dcqmem_rty_i = dcqmem_rty_dc) 1256
    assign or1200_qmem_top_dcqmem_err_i = dcqmem_err_dc;

  //assertion( or1200_qmem_top_dcqmem_err_i = dcqmem_err_dc) 1257
    assign or1200_qmem_top_dcqmem_tag_i = dcqmem_tag_dc;

  //assertion( or1200_qmem_top_dcqmem_tag_i = dcqmem_tag_dc) 1258
    assign or1200_sb_sbbiu_dat_o = or1200_sb_dcsb_dat_i;

  //assertion( or1200_sb_sbbiu_dat_o = or1200_sb_dcsb_dat_i) 1259
    assign or1200_sb_sbbiu_adr_o = or1200_sb_dcsb_adr_i;

  //assertion( or1200_sb_sbbiu_adr_o = or1200_sb_dcsb_adr_i) 1260
    assign or1200_sb_sbbiu_cyc_o = or1200_sb_dcsb_cyc_i;

  //assertion( or1200_sb_sbbiu_cyc_o = or1200_sb_dcsb_cyc_i) 1261
    assign or1200_sb_sbbiu_stb_o = or1200_sb_dcsb_stb_i;

  //assertion( or1200_sb_sbbiu_stb_o = or1200_sb_dcsb_stb_i) 1262
    assign or1200_sb_sbbiu_we_o = or1200_sb_dcsb_we_i;

  //assertion( or1200_sb_sbbiu_we_o = or1200_sb_dcsb_we_i) 1263
    assign or1200_sb_sbbiu_cab_o = or1200_sb_dcsb_cab_i;

  //assertion( or1200_sb_sbbiu_cab_o = or1200_sb_dcsb_cab_i) 1264
    assign or1200_sb_sbbiu_sel_o = or1200_sb_dcsb_sel_i;

  //assertion( or1200_sb_sbbiu_sel_o = or1200_sb_dcsb_sel_i) 1265
    assign or1200_sb_dcsb_dat_o = or1200_sb_sbbiu_dat_i;

  //assertion( or1200_sb_dcsb_dat_o = or1200_sb_sbbiu_dat_i) 1266
    assign or1200_sb_dcsb_ack_o = or1200_sb_sbbiu_ack_i;

  //assertion( or1200_sb_dcsb_ack_o = or1200_sb_sbbiu_ack_i) 1267
    assign or1200_sb_dcsb_err_o = or1200_sb_sbbiu_err_i;

  //assertion( or1200_sb_dcsb_err_o = or1200_sb_sbbiu_err_i) 1268
    assign or1200_sb_clk = clk_i;

  //assertion( or1200_sb_clk = clk_i) 1269
    assign or1200_sb_rst = rst_i;

  //assertion( or1200_sb_rst = rst_i) 1270
    assign or1200_sb_sb_en = sb_en;

  //assertion( or1200_sb_sb_en = sb_en) 1271
    assign or1200_sb_dcsb_dat_i = dcsb_dat_dc;

  //assertion( or1200_sb_dcsb_dat_i = dcsb_dat_dc) 1272
    assign or1200_sb_dcsb_adr_i = dcsb_adr_dc;

  //assertion( or1200_sb_dcsb_adr_i = dcsb_adr_dc) 1273
    assign or1200_sb_dcsb_cyc_i = dcsb_cyc_dc;

  //assertion( or1200_sb_dcsb_cyc_i = dcsb_cyc_dc) 1274
    assign or1200_sb_dcsb_stb_i = dcsb_stb_dc;

  //assertion( or1200_sb_dcsb_stb_i = dcsb_stb_dc) 1275
    assign or1200_sb_dcsb_we_i = dcsb_we_dc;

  //assertion( or1200_sb_dcsb_we_i = dcsb_we_dc) 1276
    assign or1200_sb_dcsb_sel_i = dcsb_sel_dc;

  //assertion( or1200_sb_dcsb_sel_i = dcsb_sel_dc) 1277
    assign or1200_sb_dcsb_cab_i = dcsb_cab_dc;

  //assertion( or1200_sb_dcsb_cab_i = dcsb_cab_dc) 1278
    assign dcsb_dat_sb = or1200_sb_dcsb_dat_o;

  //assertion( dcsb_dat_sb = or1200_sb_dcsb_dat_o) 1279
    assign dcsb_ack_sb = or1200_sb_dcsb_ack_o;

  //assertion( dcsb_ack_sb = or1200_sb_dcsb_ack_o) 1280
    assign dcsb_err_sb = or1200_sb_dcsb_err_o;

  //assertion( dcsb_err_sb = or1200_sb_dcsb_err_o) 1281
    assign sbbiu_dat_sb = or1200_sb_sbbiu_dat_o;

  //assertion( sbbiu_dat_sb = or1200_sb_sbbiu_dat_o) 1282
    assign sbbiu_adr_sb = or1200_sb_sbbiu_adr_o;

  //assertion( sbbiu_adr_sb = or1200_sb_sbbiu_adr_o) 1283
    assign sbbiu_cyc_sb = or1200_sb_sbbiu_cyc_o;

  //assertion( sbbiu_cyc_sb = or1200_sb_sbbiu_cyc_o) 1284
    assign sbbiu_stb_sb = or1200_sb_sbbiu_stb_o;

  //assertion( sbbiu_stb_sb = or1200_sb_sbbiu_stb_o) 1285
    assign sbbiu_we_sb = or1200_sb_sbbiu_we_o;

  //assertion( sbbiu_we_sb = or1200_sb_sbbiu_we_o) 1286
    assign sbbiu_sel_sb = or1200_sb_sbbiu_sel_o;

  //assertion( sbbiu_sel_sb = or1200_sb_sbbiu_sel_o) 1287
    assign sbbiu_cab_sb = or1200_sb_sbbiu_cab_o;

  //assertion( sbbiu_cab_sb = or1200_sb_sbbiu_cab_o) 1288
    assign or1200_sb_sbbiu_dat_i = sbbiu_dat_biu;

  //assertion( or1200_sb_sbbiu_dat_i = sbbiu_dat_biu) 1289
    assign or1200_sb_sbbiu_ack_i = sbbiu_ack_biu;

  //assertion( or1200_sb_sbbiu_ack_i = sbbiu_ack_biu) 1290
    assign or1200_sb_sbbiu_err_i = sbbiu_err_biu;

  //assertion( or1200_sb_sbbiu_err_i = sbbiu_err_biu) 1291
    assign or1200_du_du_stall = or1200_du_dbg_stall_i;

  //assertion( or1200_du_du_stall = or1200_du_dbg_stall_i) 1292
    assign or1200_du_du_addr = or1200_du_dbg_adr_i;

  //assertion( or1200_du_du_addr = or1200_du_dbg_adr_i) 1293
    assign or1200_du_du_dat_o = or1200_du_dbg_dat_i;

  //assertion( or1200_du_du_dat_o = or1200_du_dbg_dat_i) 1294
    assign or1200_du_du_read = (or1200_du_dbg_stb_i & ~|or1200_du_dbg_we_i);

  //assertion( or1200_du_du_read = or1200_du_dbg_stb_i & ~bvredor(or1200_du_dbg_we_i)) 1295
    assign or1200_du_du_write = (or1200_du_dbg_stb_i & or1200_du_dbg_we_i);

  //assertion( or1200_du_du_write = or1200_du_dbg_stb_i & or1200_du_dbg_we_i) 1296
    assign or1200_du_du_flush_pipe = or1200_du_du_flush_pipe_r;

  //assertion( or1200_du_du_flush_pipe = or1200_du_du_flush_pipe_r) 1297
    assign or1200_du_du_dmr1 = or1200_du_dmr1;

  //assertion( or1200_du_du_dmr1 = or1200_du_dmr1) 1298
    assign or1200_du_dmr1_sel = (or1200_du_spr_cs & (or1200_du_spr_addr[10:0] == 11'h010));

  //assertion( or1200_du_dmr1_sel = or1200_du_spr_cs & If((16 == Extract(10, 0, or1200_du_spr_addr)) == True, 1, 0)) 1299
    assign or1200_du_dsr_sel = (or1200_du_spr_cs & (or1200_du_spr_addr[10:0] == 11'h014));

  //assertion( or1200_du_dsr_sel = or1200_du_spr_cs & If((20 == Extract(10, 0, or1200_du_spr_addr)) == True, 1, 0)) 1300
    assign or1200_du_drr_sel = (or1200_du_spr_cs & (or1200_du_spr_addr[10:0] == 11'h015));

  //assertion( or1200_du_drr_sel = or1200_du_spr_cs & If((21 == Extract(10, 0, or1200_du_spr_addr)) == True, 1, 0)) 1301
    assign or1200_du_dbg_bp_o = or1200_du_dbg_bp_r;

  //assertion( or1200_du_dbg_bp_o = or1200_du_dbg_bp_r) 1302
    assign or1200_du_du_dsr = or1200_du_dsr;

  //assertion( or1200_du_du_dsr = or1200_du_dsr) 1303
    assign or1200_du_clk = clk_i;

  //assertion( or1200_du_clk = clk_i) 1304
    assign or1200_du_rst = rst_i;

  //assertion( or1200_du_rst = rst_i) 1305
    assign or1200_du_dcpu_cycstb_i = dcpu_cycstb_cpu;

  //assertion( or1200_du_dcpu_cycstb_i = dcpu_cycstb_cpu) 1306
    assign or1200_du_dcpu_we_i = dcpu_we_cpu;

  //assertion( or1200_du_dcpu_we_i = dcpu_we_cpu) 1307
    assign or1200_du_dcpu_adr_i = dcpu_adr_cpu;

  //assertion( or1200_du_dcpu_adr_i = dcpu_adr_cpu) 1308
    assign or1200_du_dcpu_dat_lsu = dcpu_dat_cpu;

  //assertion( or1200_du_dcpu_dat_lsu = dcpu_dat_cpu) 1309
    assign or1200_du_dcpu_dat_dc = dcpu_dat_qmem;

  //assertion( or1200_du_dcpu_dat_dc = dcpu_dat_qmem) 1310
    assign or1200_du_icpu_cycstb_i = icpu_cycstb_cpu;

  //assertion( or1200_du_icpu_cycstb_i = icpu_cycstb_cpu) 1311
    assign or1200_du_ex_freeze = ex_freeze;

  //assertion( or1200_du_ex_freeze = ex_freeze) 1312
    assign or1200_du_branch_op = branch_op;

  //assertion( or1200_du_branch_op = branch_op) 1313
    assign or1200_du_ex_insn = ex_insn;

  //assertion( or1200_du_ex_insn = ex_insn) 1314
    assign or1200_du_id_pc = id_pc;

  //assertion( or1200_du_id_pc = id_pc) 1315
    assign or1200_du_spr_dat_npc = spr_dat_npc;

  //assertion( or1200_du_spr_dat_npc = spr_dat_npc) 1316
    assign or1200_du_rf_dataw = rf_dataw;

  //assertion( or1200_du_rf_dataw = rf_dataw) 1317
    assign du_dsr = or1200_du_du_dsr;

  //assertion( du_dsr = or1200_du_du_dsr) 1318
    assign du_dmr1 = or1200_du_du_dmr1;

  //assertion( du_dmr1 = or1200_du_du_dmr1) 1319
    assign du_stall = or1200_du_du_stall;

  //assertion( du_stall = or1200_du_du_stall) 1320
    assign du_addr = or1200_du_du_addr;

  //assertion( du_addr = or1200_du_du_addr) 1321
    assign or1200_du_du_dat_i = du_dat_cpu;

  //assertion( or1200_du_du_dat_i = du_dat_cpu) 1322
    assign du_dat_du = or1200_du_du_dat_o;

  //assertion( du_dat_du = or1200_du_du_dat_o) 1323
    assign du_read = or1200_du_du_read;

  //assertion( du_read = or1200_du_du_read) 1324
    assign du_write = or1200_du_du_write;

  //assertion( du_write = or1200_du_du_write) 1325
    assign or1200_du_du_except_stop = du_except_stop;

  //assertion( or1200_du_du_except_stop = du_except_stop) 1326
    assign du_hwbkpt = or1200_du_du_hwbkpt;

  //assertion( du_hwbkpt = or1200_du_du_hwbkpt) 1327
    assign du_flush_pipe = or1200_du_du_flush_pipe;

  //assertion( du_flush_pipe = or1200_du_du_flush_pipe) 1328
    assign or1200_du_spr_write = spr_we;

  //assertion( or1200_du_spr_write = spr_we) 1329
    assign or1200_du_spr_addr = spr_addr;

  //assertion( or1200_du_spr_addr = spr_addr) 1330
    assign or1200_du_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_du_spr_dat_i = spr_dat_cpu) 1331
    assign spr_dat_du = or1200_du_spr_dat_o;

  //assertion( spr_dat_du = or1200_du_spr_dat_o) 1332
    assign or1200_du_dbg_stall_i = dbg_stall_i;

  //assertion( or1200_du_dbg_stall_i = dbg_stall_i) 1333
    assign or1200_du_dbg_ewt_i = dbg_ewt_i;

  //assertion( or1200_du_dbg_ewt_i = dbg_ewt_i) 1334
    assign dbg_lss_o = or1200_du_dbg_lss_o;

  //assertion( dbg_lss_o = or1200_du_dbg_lss_o) 1335
    assign dbg_is_o = or1200_du_dbg_is_o;

  //assertion( dbg_is_o = or1200_du_dbg_is_o) 1336
    assign dbg_wp_o = or1200_du_dbg_wp_o;

  //assertion( dbg_wp_o = or1200_du_dbg_wp_o) 1337
    assign dbg_bp_o = or1200_du_dbg_bp_o;

  //assertion( dbg_bp_o = or1200_du_dbg_bp_o) 1338
    assign or1200_du_dbg_stb_i = dbg_stb_i;

  //assertion( or1200_du_dbg_stb_i = dbg_stb_i) 1339
    assign or1200_du_dbg_we_i = dbg_we_i;

  //assertion( or1200_du_dbg_we_i = dbg_we_i) 1340
    assign or1200_du_dbg_adr_i = dbg_adr_i;

  //assertion( or1200_du_dbg_adr_i = dbg_adr_i) 1341
    assign or1200_du_dbg_dat_i = dbg_dat_i;

  //assertion( or1200_du_dbg_dat_i = dbg_dat_i) 1342
    assign dbg_dat_o = or1200_du_dbg_dat_o;

  //assertion( dbg_dat_o = or1200_du_dbg_dat_o) 1343
    assign dbg_ack_o = or1200_du_dbg_ack_o;

  //assertion( dbg_ack_o = or1200_du_dbg_ack_o) 1344
    assign or1200_pic_um_ints = (or1200_pic_pic_int & {or1200_pic_picmr, 2'h3});

  //assertion( or1200_pic_um_ints = or1200_pic_pic_int & Concat(or1200_pic_picmr, 3)) 1345
    assign or1200_pic_pic_wakeup = or1200_pic_intr;

  //assertion( or1200_pic_pic_wakeup = or1200_pic_intr) 1346
    assign or1200_pic_clk = clk_i;

  //assertion( or1200_pic_clk = clk_i) 1347
    assign or1200_pic_rst = rst_i;

  //assertion( or1200_pic_rst = rst_i) 1348
    assign or1200_pic_spr_write = spr_we;

  //assertion( or1200_pic_spr_write = spr_we) 1349
    assign or1200_pic_spr_addr = spr_addr;

  //assertion( or1200_pic_spr_addr = spr_addr) 1350
    assign or1200_pic_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_pic_spr_dat_i = spr_dat_cpu) 1351
    assign spr_dat_pic = or1200_pic_spr_dat_o;

  //assertion( spr_dat_pic = or1200_pic_spr_dat_o) 1352
    assign pic_wakeup = or1200_pic_pic_wakeup;

  //assertion( pic_wakeup = or1200_pic_pic_wakeup) 1353
    assign sig_int = or1200_pic_intr;

  //assertion( sig_int = or1200_pic_intr) 1354
    assign or1200_pic_pic_int = pic_ints_i;

  //assertion( or1200_pic_pic_int = pic_ints_i) 1355
    assign or1200_tt_restart = (or1200_tt_match & (or1200_tt_ttmr[31:30] == 2'h1));

  //assertion( or1200_tt_restart = or1200_tt_match & If((1 == Extract(31, 30, or1200_tt_ttmr)) == True, 1, 0)) 1356
    assign or1200_tt_stop = (((or1200_tt_match & (or1200_tt_ttmr[31:30] == 2'h2)) | (or1200_tt_ttmr[31:30] == 2'h0)) | or1200_tt_du_stall);

  //assertion( or1200_tt_stop = or1200_tt_match & If((2 == Extract(31, 30, or1200_tt_ttmr)) == True, 1, 0) | If((0 == Extract(31, 30, or1200_tt_ttmr)) == True, 1, 0) | or1200_tt_du_stall) 1357
    assign or1200_tt_clk = clk_i;

  //assertion( or1200_tt_clk = clk_i) 1358
    assign or1200_tt_rst = rst_i;

  //assertion( or1200_tt_rst = rst_i) 1359
    assign or1200_tt_du_stall = du_stall;

  //assertion( or1200_tt_du_stall = du_stall) 1360
    assign or1200_tt_spr_write = spr_we;

  //assertion( or1200_tt_spr_write = spr_we) 1361
    assign or1200_tt_spr_addr = spr_addr;

  //assertion( or1200_tt_spr_addr = spr_addr) 1362
    assign or1200_tt_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_tt_spr_dat_i = spr_dat_cpu) 1363
    assign spr_dat_tt = or1200_tt_spr_dat_o;

  //assertion( spr_dat_tt = or1200_tt_spr_dat_o) 1364
    assign sig_tick = or1200_tt_intr;

  //assertion( sig_tick = or1200_tt_intr) 1365
    assign or1200_pm_clk = clk_i;

  //assertion( or1200_pm_clk = clk_i) 1366
    assign or1200_pm_rst = rst_i;

  //assertion( or1200_pm_rst = rst_i) 1367
    assign or1200_pm_pic_wakeup = pic_wakeup;

  //assertion( or1200_pm_pic_wakeup = pic_wakeup) 1368
    assign or1200_pm_spr_write = spr_we;

  //assertion( or1200_pm_spr_write = spr_we) 1369
    assign or1200_pm_spr_addr = spr_addr;

  //assertion( or1200_pm_spr_addr = spr_addr) 1370
    assign or1200_pm_spr_dat_i = spr_dat_cpu;

  //assertion( or1200_pm_spr_dat_i = spr_dat_cpu) 1371
    assign spr_dat_pm = or1200_pm_spr_dat_o;

  //assertion( spr_dat_pm = or1200_pm_spr_dat_o) 1372
    assign pm_clksd_o = or1200_pm_pm_clksd;

  //assertion( pm_clksd_o = or1200_pm_pm_clksd) 1373
    assign or1200_pm_pm_cpustall = pm_cpustall_i;

  //assertion( or1200_pm_pm_cpustall = pm_cpustall_i) 1374
    assign pm_dc_gate_o = or1200_pm_pm_dc_gate;

  //assertion( pm_dc_gate_o = or1200_pm_pm_dc_gate) 1375
    assign pm_ic_gate_o = or1200_pm_pm_ic_gate;

  //assertion( pm_ic_gate_o = or1200_pm_pm_ic_gate) 1376
    assign pm_dmmu_gate_o = or1200_pm_pm_dmmu_gate;

  //assertion( pm_dmmu_gate_o = or1200_pm_pm_dmmu_gate) 1377
    assign pm_immu_gate_o = or1200_pm_pm_immu_gate;

  //assertion( pm_immu_gate_o = or1200_pm_pm_immu_gate) 1378
    assign pm_tt_gate_o = or1200_pm_pm_tt_gate;

  //assertion( pm_tt_gate_o = or1200_pm_pm_tt_gate) 1379
    assign pm_cpu_gate_o = or1200_pm_pm_cpu_gate;

  //assertion( pm_cpu_gate_o = or1200_pm_pm_cpu_gate) 1380
    assign pm_wakeup_o = or1200_pm_pm_wakeup;

  //assertion( pm_wakeup_o = or1200_pm_pm_wakeup) 1381
    assign pm_lvolt_o = or1200_pm_pm_lvolt;

  //assertion( pm_lvolt_o = or1200_pm_pm_lvolt) 1382
    //Following code is from line 3100
        always @(posedge iwb_biu_wb_rst_i or posedge iwb_biu_wb_clk_i) begin
            if ((iwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1383] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = True) 1383
                    iwb_biu_wb_fsm_state_cur <= iwb_biu_wb_fsm_idle;  //assertion( iwb_biu_wb_fsm_state_cur = iwb_biu_wb_fsm_idle) 1385
                end
            else
                begin
                    coverage0[1384] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = False) 1384
                    iwb_biu_wb_fsm_state_cur <= iwb_biu_wb_fsm_state_nxt;  //assertion( iwb_biu_wb_fsm_state_cur = iwb_biu_wb_fsm_state_nxt) 1386
                end
        end

    //Following code is from line 3103
        always @(posedge iwb_biu_wb_rst_i or posedge iwb_biu_wb_clk_i) begin
            if ((iwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1387] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = True) 1387
                    iwb_biu_burst_len <= 0;  //assertion( iwb_biu_burst_len = 0) 1389
                end
            else
                begin
                    coverage0[1388] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = False) 1388
                    if ((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle))
                        begin
                            coverage0[1390] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = True) 1390
                            iwb_biu_burst_len <= 4'h2;  //assertion( iwb_biu_burst_len = 2) 1392
                        end
                    else
                        begin
                            coverage0[1391] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = False) 1391
                            if ((iwb_biu_wb_stb_o & iwb_biu_wb_ack))
                                begin
                                    coverage0[1393] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_ack = True) 1393
                                    iwb_biu_burst_len <= (iwb_biu_burst_len - 4'h1);  //assertion( iwb_biu_burst_len = iwb_biu_burst_len - 1) 1395
                                end
                            else
                                    coverage0[1394] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_ack = False) 1394
                        end
                end
        end

    //Following code is from line 3107
        always @(iwb_biu_biu_we_i or iwb_biu_biu_sel_i or iwb_biu_biu_cab_i or iwb_biu_biu_stb or iwb_biu_biu_cyc_i or iwb_biu_wb_we_o or iwb_biu_wb_stb_o or iwb_biu_wb_sel_o or iwb_biu_wb_cti_o or iwb_biu_wb_ack or iwb_biu_wb_rty_i or iwb_biu_wb_err_i or iwb_biu_burst_len or iwb_biu_wb_fsm_state_cur) begin
            case (iwb_biu_wb_fsm_state_cur)
              iwb_biu_wb_fsm_idle:
                begin
                    coverage0[1396] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = True) 1396
                    iwb_biu_wb_cyc_nxt = (iwb_biu_biu_cyc_i & iwb_biu_biu_stb);  //assertion( iwb_biu_wb_cyc_nxt = iwb_biu_biu_cyc_i & iwb_biu_biu_stb) 1397
                    iwb_biu_wb_stb_nxt = (iwb_biu_biu_cyc_i & iwb_biu_biu_stb);  //assertion( iwb_biu_wb_stb_nxt = iwb_biu_biu_cyc_i & iwb_biu_biu_stb) 1398
                    iwb_biu_wb_cti_nxt = {(~iwb_biu_biu_cab_i), 1'b1, (~iwb_biu_biu_cab_i)};  //assertion( iwb_biu_wb_cti_nxt = Concat(Concat(If(Not(iwb_biu_biu_cab_i == 1) == True, 1, 0), 1), If(Not(iwb_biu_biu_cab_i == 1) == True, 1, 0))) 1399
                    if ((iwb_biu_biu_cyc_i & iwb_biu_biu_stb))
                        begin
                            coverage0[1400] = 1;  //assertion( iwb_biu_biu_cyc_i & iwb_biu_biu_stb = True) 1400
                            iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_trans;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_trans) 1402
                        end
                    else
                        begin
                            coverage0[1401] = 1;  //assertion( iwb_biu_biu_cyc_i & iwb_biu_biu_stb = False) 1401
                            iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_idle;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_idle) 1403
                        end
                end
              iwb_biu_wb_fsm_trans:
                begin
                    coverage0[1404] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_trans = True) 1404
                    iwb_biu_wb_cyc_nxt = ((~iwb_biu_wb_stb_o) | (((~iwb_biu_wb_err_i) & (~iwb_biu_wb_rty_i)) & (~(iwb_biu_wb_ack & (iwb_biu_wb_cti_o == 3'h7)))));  //assertion( iwb_biu_wb_cyc_nxt = If(Not(iwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(iwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0) == 1) == True, 1, 0)) 1405
                    iwb_biu_wb_stb_nxt = (((~iwb_biu_wb_stb_o) | (((~iwb_biu_wb_err_i) & (~iwb_biu_wb_rty_i)) & (~iwb_biu_wb_ack))) | (((~iwb_biu_wb_err_i) & (~iwb_biu_wb_rty_i)) & (iwb_biu_wb_cti_o == 3'h2)));  //assertion( iwb_biu_wb_stb_nxt = If(Not(iwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(iwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_ack == 1) == True, 1, 0) | If(Not(iwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_rty_i == 1) == True, 1, 0) & If((2 == iwb_biu_wb_cti_o) == True, 1, 0)) 1406
                    iwb_biu_wb_cti_nxt[2] = (((iwb_biu_wb_stb_o & iwb_biu_wb_ack) & (iwb_biu_burst_len == 32'h00000000)) | iwb_biu_wb_cti_o[2]);  //assertion( Extract(2, 2, iwb_biu_wb_cti_nxt) = iwb_biu_wb_stb_o & iwb_biu_wb_ack & If((0 == ZeroExt(28, iwb_biu_burst_len)) == True, 1, 0) | Extract(2, 2, iwb_biu_wb_cti_o)) 1407
                    iwb_biu_wb_cti_nxt[1] = 1'b1;  //assertion( Extract(1, 1, iwb_biu_wb_cti_nxt) = 1) 1408
                    iwb_biu_wb_cti_nxt[0] = (((iwb_biu_wb_stb_o & iwb_biu_wb_ack) & (iwb_biu_burst_len == 32'h00000000)) | iwb_biu_wb_cti_o[0]);  //assertion( Extract(0, 0, iwb_biu_wb_cti_nxt) = iwb_biu_wb_stb_o & iwb_biu_wb_ack & If((0 == ZeroExt(28, iwb_biu_burst_len)) == True, 1, 0) | Extract(0, 0, iwb_biu_wb_cti_o)) 1409
                    if (((((((~iwb_biu_biu_cyc_i) | (~iwb_biu_biu_stb)) | (~iwb_biu_biu_cab_i)) | (iwb_biu_biu_sel_i != iwb_biu_wb_sel_o)) | (iwb_biu_biu_we_i != iwb_biu_wb_we_o)) & (iwb_biu_wb_cti_o == 3'h2)))
                        begin
                            coverage0[1410] = 1;  //assertion( (If(Not(iwb_biu_biu_cyc_i == 1) == True, 1, 0) | If(Not(iwb_biu_biu_stb == 1) == True, 1, 0) | If(Not(iwb_biu_biu_cab_i == 1) == True, 1, 0) | If(iwb_biu_biu_sel_i != iwb_biu_wb_sel_o == True, 1, 0) | If(iwb_biu_biu_we_i != iwb_biu_wb_we_o == True, 1, 0)) & If((2 == iwb_biu_wb_cti_o) == True, 1, 0) = True) 1410
                            iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_last;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_last) 1412
                        end
                    else
                        begin
                            coverage0[1411] = 1;  //assertion( (If(Not(iwb_biu_biu_cyc_i == 1) == True, 1, 0) | If(Not(iwb_biu_biu_stb == 1) == True, 1, 0) | If(Not(iwb_biu_biu_cab_i == 1) == True, 1, 0) | If(iwb_biu_biu_sel_i != iwb_biu_wb_sel_o == True, 1, 0) | If(iwb_biu_biu_we_i != iwb_biu_wb_we_o == True, 1, 0)) & If((2 == iwb_biu_wb_cti_o) == True, 1, 0) = False) 1411
                            if ((((iwb_biu_wb_err_i | iwb_biu_wb_rty_i) | (iwb_biu_wb_ack & (iwb_biu_wb_cti_o == 3'h7))) & iwb_biu_wb_stb_o))
                                begin
                                    coverage0[1413] = 1;  //assertion( (iwb_biu_wb_err_i | iwb_biu_wb_rty_i | iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0)) & iwb_biu_wb_stb_o = True) 1413
                                    iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_idle;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_idle) 1415
                                end
                            else
                                begin
                                    coverage0[1414] = 1;  //assertion( (iwb_biu_wb_err_i | iwb_biu_wb_rty_i | iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0)) & iwb_biu_wb_stb_o = False) 1414
                                    iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_trans;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_trans) 1416
                                end
                        end
                end
              iwb_biu_wb_fsm_last:
                begin
                    coverage0[1417] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_last = True) 1417
                    iwb_biu_wb_cyc_nxt = ((~iwb_biu_wb_stb_o) | (((~iwb_biu_wb_err_i) & (~iwb_biu_wb_rty_i)) & (~(iwb_biu_wb_ack & (iwb_biu_wb_cti_o == 3'h7)))));  //assertion( iwb_biu_wb_cyc_nxt = If(Not(iwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(iwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0) == 1) == True, 1, 0)) 1418
                    iwb_biu_wb_stb_nxt = ((~iwb_biu_wb_stb_o) | (((~iwb_biu_wb_err_i) & (~iwb_biu_wb_rty_i)) & (~(iwb_biu_wb_ack & (iwb_biu_wb_cti_o == 3'h7)))));  //assertion( iwb_biu_wb_stb_nxt = If(Not(iwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(iwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0) == 1) == True, 1, 0)) 1419
                    iwb_biu_wb_cti_nxt[2] = ((iwb_biu_wb_ack & iwb_biu_wb_stb_o) | iwb_biu_wb_cti_o[2]);  //assertion( Extract(2, 2, iwb_biu_wb_cti_nxt) = iwb_biu_wb_ack & iwb_biu_wb_stb_o | Extract(2, 2, iwb_biu_wb_cti_o)) 1420
                    iwb_biu_wb_cti_nxt[1] = 1'b1;  //assertion( Extract(1, 1, iwb_biu_wb_cti_nxt) = 1) 1421
                    iwb_biu_wb_cti_nxt[0] = ((iwb_biu_wb_ack & iwb_biu_wb_stb_o) | iwb_biu_wb_cti_o[0]);  //assertion( Extract(0, 0, iwb_biu_wb_cti_nxt) = iwb_biu_wb_ack & iwb_biu_wb_stb_o | Extract(0, 0, iwb_biu_wb_cti_o)) 1422
                    if ((((iwb_biu_wb_err_i | iwb_biu_wb_rty_i) | (iwb_biu_wb_ack & (iwb_biu_wb_cti_o == 3'h7))) & iwb_biu_wb_stb_o))
                        begin
                            coverage0[1423] = 1;  //assertion( (iwb_biu_wb_err_i | iwb_biu_wb_rty_i | iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0)) & iwb_biu_wb_stb_o = True) 1423
                            iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_idle;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_idle) 1425
                        end
                    else
                        begin
                            coverage0[1424] = 1;  //assertion( (iwb_biu_wb_err_i | iwb_biu_wb_rty_i | iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0)) & iwb_biu_wb_stb_o = False) 1424
                            iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_last;  //assertion( iwb_biu_wb_fsm_state_nxt = iwb_biu_wb_fsm_last) 1426
                        end
                end
              default:
                begin
                    coverage0[1427] = 1;  //assertion( If(iwb_biu_wb_fsm_state_cur != iwb_biu_wb_fsm_idle == True, 1, 0) & If(iwb_biu_wb_fsm_state_cur != iwb_biu_wb_fsm_trans == True, 1, 0) & If(iwb_biu_wb_fsm_state_cur != iwb_biu_wb_fsm_last == True, 1, 0) = True) 1427
                    iwb_biu_wb_cyc_nxt = 1'bx;  //assertion( iwb_biu_wb_cyc_nxt = 0) 1428
                    iwb_biu_wb_stb_nxt = 1'bx;  //assertion( iwb_biu_wb_stb_nxt = 0) 1429
                    iwb_biu_wb_cti_nxt = 3'bx;  //assertion( iwb_biu_wb_cti_nxt = 0) 1430
                    iwb_biu_wb_fsm_state_nxt = 2'bx;  //assertion( iwb_biu_wb_fsm_state_nxt = 0) 1431
                end
            endcase
        end

    //Following code is from line 3142
        always @(posedge iwb_biu_wb_rst_i or posedge iwb_biu_wb_clk_i) begin
            if ((iwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1432] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = True) 1432
                    iwb_biu_wb_cyc_o <= 1'b0;  //assertion( iwb_biu_wb_cyc_o = 0) 1434
                    iwb_biu_wb_stb_o <= 1'b0;  //assertion( iwb_biu_wb_stb_o = 0) 1435
                    iwb_biu_wb_cti_o <= 3'h7;  //assertion( iwb_biu_wb_cti_o = 7) 1436
                    iwb_biu_wb_bte_o <= 2'h1;  //assertion( iwb_biu_wb_bte_o = 1) 1437
                    iwb_biu_wb_we_o <= 1'b0;  //assertion( iwb_biu_wb_we_o = 0) 1438
                    iwb_biu_wb_sel_o <= 4'hf;  //assertion( iwb_biu_wb_sel_o = 15) 1439
                    iwb_biu_wb_adr_o <= 32'h00000000;  //assertion( iwb_biu_wb_adr_o = 0) 1440
                end
            else
                begin
                    coverage0[1433] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = False) 1433
                    iwb_biu_wb_cyc_o <= iwb_biu_wb_cyc_nxt;  //assertion( iwb_biu_wb_cyc_o = iwb_biu_wb_cyc_nxt) 1441
                    if ((iwb_biu_wb_ack & (iwb_biu_wb_cti_o == 3'h7)))
                        begin
                            coverage0[1442] = 1;  //assertion( iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0) = True) 1442
                            iwb_biu_wb_stb_o <= 1'b0;  //assertion( iwb_biu_wb_stb_o = 0) 1444
                        end
                    else
                        begin
                            coverage0[1443] = 1;  //assertion( iwb_biu_wb_ack & If((7 == iwb_biu_wb_cti_o) == True, 1, 0) = False) 1443
                            iwb_biu_wb_stb_o <= iwb_biu_wb_stb_nxt;  //assertion( iwb_biu_wb_stb_o = iwb_biu_wb_stb_nxt) 1445
                        end
                    iwb_biu_wb_cti_o <= iwb_biu_wb_cti_nxt;  //assertion( iwb_biu_wb_cti_o = iwb_biu_wb_cti_nxt) 1446
                    iwb_biu_wb_bte_o <= 2'h1;  //assertion( iwb_biu_wb_bte_o = 1) 1447
                    if ((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle))
                        begin
                            coverage0[1448] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = True) 1448
                            iwb_biu_wb_we_o <= iwb_biu_biu_we_i;  //assertion( iwb_biu_wb_we_o = iwb_biu_biu_we_i) 1450
                            iwb_biu_wb_sel_o <= iwb_biu_biu_sel_i;  //assertion( iwb_biu_wb_sel_o = iwb_biu_biu_sel_i) 1451
                        end
                    else
                            coverage0[1449] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = False) 1449
                    if ((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle))
                        begin
                            coverage0[1452] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = True) 1452
                            iwb_biu_wb_adr_o <= iwb_biu_biu_adr_i;  //assertion( iwb_biu_wb_adr_o = iwb_biu_biu_adr_i) 1454
                        end
                    else
                        begin
                            coverage0[1453] = 1;  //assertion( iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle = False) 1453
                            if ((iwb_biu_wb_stb_o & iwb_biu_wb_ack))
                                begin
                                    coverage0[1455] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_ack = True) 1455
                                    iwb_biu_wb_adr_o[3:2] <= (iwb_biu_wb_adr_o[3:2] + 2'h1);  //assertion( Extract(3, 2, iwb_biu_wb_adr_o) = Extract(3, 2, iwb_biu_wb_adr_o) + 1) 1457
                                end
                            else
                                    coverage0[1456] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_ack = False) 1456
                        end
                end
        end

    //Following code is from line 3165
        always @(posedge iwb_biu_wb_rst_i or posedge iwb_biu_wb_clk_i) begin
            if ((iwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1458] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = True) 1458
                    iwb_biu_wb_ack_cnt <= 1'b0;  //assertion( iwb_biu_wb_ack_cnt = 0) 1460
                    iwb_biu_wb_err_cnt <= 1'b0;  //assertion( iwb_biu_wb_err_cnt = 0) 1461
                    iwb_biu_wb_rty_cnt <= 1'b0;  //assertion( iwb_biu_wb_rty_cnt = 0) 1462
                end
            else
                begin
                    coverage0[1459] = 1;  //assertion( 1 == iwb_biu_wb_rst_i = False) 1459
                    if (((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) | (~(|iwb_biu_clmode))))
                        begin
                            coverage0[1463] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = True) 1463
                            iwb_biu_wb_ack_cnt <= 1'b0;  //assertion( iwb_biu_wb_ack_cnt = 0) 1465
                        end
                    else
                        begin
                            coverage0[1464] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = False) 1464
                            if ((iwb_biu_wb_stb_o & iwb_biu_wb_ack))
                                begin
                                    coverage0[1466] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_ack = True) 1466
                                    iwb_biu_wb_ack_cnt <= (~iwb_biu_wb_ack_cnt);  //assertion( iwb_biu_wb_ack_cnt = Not(iwb_biu_wb_ack_cnt == 1)) 1468
                                end
                            else
                                    coverage0[1467] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_ack = False) 1467
                        end
                    if (((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) | (~(|iwb_biu_clmode))))
                        begin
                            coverage0[1469] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = True) 1469
                            iwb_biu_wb_err_cnt <= 1'b0;  //assertion( iwb_biu_wb_err_cnt = 0) 1471
                        end
                    else
                        begin
                            coverage0[1470] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = False) 1470
                            if ((iwb_biu_wb_stb_o & iwb_biu_wb_err_i))
                                begin
                                    coverage0[1472] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_err_i = True) 1472
                                    iwb_biu_wb_err_cnt <= (~iwb_biu_wb_err_cnt);  //assertion( iwb_biu_wb_err_cnt = Not(iwb_biu_wb_err_cnt == 1)) 1474
                                end
                            else
                                    coverage0[1473] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_err_i = False) 1473
                        end
                    if (((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) | (~(|iwb_biu_clmode))))
                        begin
                            coverage0[1475] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = True) 1475
                            iwb_biu_wb_rty_cnt <= 1'b0;  //assertion( iwb_biu_wb_rty_cnt = 0) 1477
                        end
                    else
                        begin
                            coverage0[1476] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = False) 1476
                            if ((iwb_biu_wb_stb_o & iwb_biu_wb_rty_i))
                                begin
                                    coverage0[1478] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_rty_i = True) 1478
                                    iwb_biu_wb_rty_cnt <= (~iwb_biu_wb_rty_cnt);  //assertion( iwb_biu_wb_rty_cnt = Not(iwb_biu_wb_rty_cnt == 1)) 1480
                                end
                            else
                                    coverage0[1479] = 1;  //assertion( iwb_biu_wb_stb_o & iwb_biu_wb_rty_i = False) 1479
                        end
                end
        end

    //Following code is from line 3179
        always @(posedge iwb_biu_rst or posedge iwb_biu_clk) begin
            if ((iwb_biu_rst == 1'b1))
                begin
                    coverage0[1481] = 1;  //assertion( 1 == iwb_biu_rst = True) 1481
                    iwb_biu_biu_stb_reg <= 1'b0;  //assertion( iwb_biu_biu_stb_reg = 0) 1483
                    iwb_biu_biu_ack_cnt <= 1'b0;  //assertion( iwb_biu_biu_ack_cnt = 0) 1484
                    iwb_biu_biu_err_cnt <= 1'b0;  //assertion( iwb_biu_biu_err_cnt = 0) 1485
                    iwb_biu_biu_rty_cnt <= 1'b0;  //assertion( iwb_biu_biu_rty_cnt = 0) 1486
                end
            else
                begin
                    coverage0[1482] = 1;  //assertion( 1 == iwb_biu_rst = False) 1482
                    if (((iwb_biu_biu_stb_i & (~iwb_biu_biu_cab_i)) & iwb_biu_biu_ack_o))
                        begin
                            coverage0[1487] = 1;  //assertion( iwb_biu_biu_stb_i & If(Not(iwb_biu_biu_cab_i == 1) == True, 1, 0) & iwb_biu_biu_ack_o = True) 1487
                            iwb_biu_biu_stb_reg <= 1'b0;  //assertion( iwb_biu_biu_stb_reg = 0) 1489
                        end
                    else
                        begin
                            coverage0[1488] = 1;  //assertion( iwb_biu_biu_stb_i & If(Not(iwb_biu_biu_cab_i == 1) == True, 1, 0) & iwb_biu_biu_ack_o = False) 1488
                            iwb_biu_biu_stb_reg <= iwb_biu_biu_stb_i;  //assertion( iwb_biu_biu_stb_reg = iwb_biu_biu_stb_i) 1490
                        end
                    if (((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) | (~(|iwb_biu_clmode))))
                        begin
                            coverage0[1491] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = True) 1491
                            iwb_biu_biu_ack_cnt <= 1'b0;  //assertion( iwb_biu_biu_ack_cnt = 0) 1493
                        end
                    else
                        begin
                            coverage0[1492] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = False) 1492
                            if (iwb_biu_biu_ack_o)
                                begin
                                    coverage0[1494] = 1;  //assertion( 0 != iwb_biu_biu_ack_o = True) 1494
                                    iwb_biu_biu_ack_cnt <= (~iwb_biu_biu_ack_cnt);  //assertion( iwb_biu_biu_ack_cnt = Not(iwb_biu_biu_ack_cnt == 1)) 1496
                                end
                            else
                                    coverage0[1495] = 1;  //assertion( 0 != iwb_biu_biu_ack_o = False) 1495
                        end
                    if (((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) | (~(|iwb_biu_clmode))))
                        begin
                            coverage0[1497] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = True) 1497
                            iwb_biu_biu_err_cnt <= 1'b0;  //assertion( iwb_biu_biu_err_cnt = 0) 1499
                        end
                    else
                        begin
                            coverage0[1498] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = False) 1498
                            if ((iwb_biu_wb_err_i & iwb_biu_biu_err_o))
                                begin
                                    coverage0[1500] = 1;  //assertion( iwb_biu_wb_err_i & iwb_biu_biu_err_o = True) 1500
                                    iwb_biu_biu_err_cnt <= (~iwb_biu_biu_err_cnt);  //assertion( iwb_biu_biu_err_cnt = Not(iwb_biu_biu_err_cnt == 1)) 1502
                                end
                            else
                                    coverage0[1501] = 1;  //assertion( iwb_biu_wb_err_i & iwb_biu_biu_err_o = False) 1501
                        end
                    if (((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) | (~(|iwb_biu_clmode))))
                        begin
                            coverage0[1503] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = True) 1503
                            iwb_biu_biu_rty_cnt <= 1'b0;  //assertion( iwb_biu_biu_rty_cnt = 0) 1505
                        end
                    else
                        begin
                            coverage0[1504] = 1;  //assertion( If((iwb_biu_wb_fsm_state_cur == iwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(iwb_biu_clmode) == 1) == True, 1, 0) = False) 1504
                            if (iwb_biu_biu_rty)
                                begin
                                    coverage0[1506] = 1;  //assertion( 0 != iwb_biu_biu_rty = True) 1506
                                    iwb_biu_biu_rty_cnt <= (~iwb_biu_biu_rty_cnt);  //assertion( iwb_biu_biu_rty_cnt = Not(iwb_biu_biu_rty_cnt == 1)) 1508
                                end
                            else
                                    coverage0[1507] = 1;  //assertion( 0 != iwb_biu_biu_rty = False) 1507
                        end
                end
        end

    //Following code is from line 3196
        always @(posedge dwb_biu_wb_rst_i or posedge dwb_biu_wb_clk_i) begin
            if ((dwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1509] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = True) 1509
                    dwb_biu_wb_fsm_state_cur <= dwb_biu_wb_fsm_idle;  //assertion( dwb_biu_wb_fsm_state_cur = dwb_biu_wb_fsm_idle) 1511
                end
            else
                begin
                    coverage0[1510] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = False) 1510
                    dwb_biu_wb_fsm_state_cur <= dwb_biu_wb_fsm_state_nxt;  //assertion( dwb_biu_wb_fsm_state_cur = dwb_biu_wb_fsm_state_nxt) 1512
                end
        end

    //Following code is from line 3199
        always @(posedge dwb_biu_wb_rst_i or posedge dwb_biu_wb_clk_i) begin
            if ((dwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1513] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = True) 1513
                    dwb_biu_burst_len <= 0;  //assertion( dwb_biu_burst_len = 0) 1515
                end
            else
                begin
                    coverage0[1514] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = False) 1514
                    if ((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle))
                        begin
                            coverage0[1516] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = True) 1516
                            dwb_biu_burst_len <= 4'h2;  //assertion( dwb_biu_burst_len = 2) 1518
                        end
                    else
                        begin
                            coverage0[1517] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = False) 1517
                            if ((dwb_biu_wb_stb_o & dwb_biu_wb_ack))
                                begin
                                    coverage0[1519] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_ack = True) 1519
                                    dwb_biu_burst_len <= (dwb_biu_burst_len - 4'h1);  //assertion( dwb_biu_burst_len = dwb_biu_burst_len - 1) 1521
                                end
                            else
                                    coverage0[1520] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_ack = False) 1520
                        end
                end
        end

    //Following code is from line 3203
        always @(dwb_biu_biu_we_i or dwb_biu_biu_sel_i or dwb_biu_biu_cab_i or dwb_biu_biu_stb or dwb_biu_biu_cyc_i or dwb_biu_wb_we_o or dwb_biu_wb_stb_o or dwb_biu_wb_sel_o or dwb_biu_wb_cti_o or dwb_biu_wb_ack or dwb_biu_wb_rty_i or dwb_biu_wb_err_i or dwb_biu_burst_len or dwb_biu_wb_fsm_state_cur) begin
            case (dwb_biu_wb_fsm_state_cur)
              dwb_biu_wb_fsm_idle:
                begin
                    coverage0[1522] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = True) 1522
                    dwb_biu_wb_cyc_nxt = (dwb_biu_biu_cyc_i & dwb_biu_biu_stb);  //assertion( dwb_biu_wb_cyc_nxt = dwb_biu_biu_cyc_i & dwb_biu_biu_stb) 1523
                    dwb_biu_wb_stb_nxt = (dwb_biu_biu_cyc_i & dwb_biu_biu_stb);  //assertion( dwb_biu_wb_stb_nxt = dwb_biu_biu_cyc_i & dwb_biu_biu_stb) 1524
                    dwb_biu_wb_cti_nxt = {(~dwb_biu_biu_cab_i), 1'b1, (~dwb_biu_biu_cab_i)};  //assertion( dwb_biu_wb_cti_nxt = Concat(Concat(If(Not(dwb_biu_biu_cab_i == 1) == True, 1, 0), 1), If(Not(dwb_biu_biu_cab_i == 1) == True, 1, 0))) 1525
                    if ((dwb_biu_biu_cyc_i & dwb_biu_biu_stb))
                        begin
                            coverage0[1526] = 1;  //assertion( dwb_biu_biu_cyc_i & dwb_biu_biu_stb = True) 1526
                            dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_trans;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_trans) 1528
                        end
                    else
                        begin
                            coverage0[1527] = 1;  //assertion( dwb_biu_biu_cyc_i & dwb_biu_biu_stb = False) 1527
                            dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_idle;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_idle) 1529
                        end
                end
              dwb_biu_wb_fsm_trans:
                begin
                    coverage0[1530] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_trans = True) 1530
                    dwb_biu_wb_cyc_nxt = ((~dwb_biu_wb_stb_o) | (((~dwb_biu_wb_err_i) & (~dwb_biu_wb_rty_i)) & (~(dwb_biu_wb_ack & (dwb_biu_wb_cti_o == 3'h7)))));  //assertion( dwb_biu_wb_cyc_nxt = If(Not(dwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(dwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0) == 1) == True, 1, 0)) 1531
                    dwb_biu_wb_stb_nxt = (((~dwb_biu_wb_stb_o) | (((~dwb_biu_wb_err_i) & (~dwb_biu_wb_rty_i)) & (~dwb_biu_wb_ack))) | (((~dwb_biu_wb_err_i) & (~dwb_biu_wb_rty_i)) & (dwb_biu_wb_cti_o == 3'h2)));  //assertion( dwb_biu_wb_stb_nxt = If(Not(dwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(dwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_ack == 1) == True, 1, 0) | If(Not(dwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_rty_i == 1) == True, 1, 0) & If((2 == dwb_biu_wb_cti_o) == True, 1, 0)) 1532
                    dwb_biu_wb_cti_nxt[2] = (((dwb_biu_wb_stb_o & dwb_biu_wb_ack) & (dwb_biu_burst_len == 32'h00000000)) | dwb_biu_wb_cti_o[2]);  //assertion( Extract(2, 2, dwb_biu_wb_cti_nxt) = dwb_biu_wb_stb_o & dwb_biu_wb_ack & If((0 == ZeroExt(28, dwb_biu_burst_len)) == True, 1, 0) | Extract(2, 2, dwb_biu_wb_cti_o)) 1533
                    dwb_biu_wb_cti_nxt[1] = 1'b1;  //assertion( Extract(1, 1, dwb_biu_wb_cti_nxt) = 1) 1534
                    dwb_biu_wb_cti_nxt[0] = (((dwb_biu_wb_stb_o & dwb_biu_wb_ack) & (dwb_biu_burst_len == 32'h00000000)) | dwb_biu_wb_cti_o[0]);  //assertion( Extract(0, 0, dwb_biu_wb_cti_nxt) = dwb_biu_wb_stb_o & dwb_biu_wb_ack & If((0 == ZeroExt(28, dwb_biu_burst_len)) == True, 1, 0) | Extract(0, 0, dwb_biu_wb_cti_o)) 1535
                    if (((((((~dwb_biu_biu_cyc_i) | (~dwb_biu_biu_stb)) | (~dwb_biu_biu_cab_i)) | (dwb_biu_biu_sel_i != dwb_biu_wb_sel_o)) | (dwb_biu_biu_we_i != dwb_biu_wb_we_o)) & (dwb_biu_wb_cti_o == 3'h2)))
                        begin
                            coverage0[1536] = 1;  //assertion( (If(Not(dwb_biu_biu_cyc_i == 1) == True, 1, 0) | If(Not(dwb_biu_biu_stb == 1) == True, 1, 0) | If(Not(dwb_biu_biu_cab_i == 1) == True, 1, 0) | If(dwb_biu_biu_sel_i != dwb_biu_wb_sel_o == True, 1, 0) | If(dwb_biu_biu_we_i != dwb_biu_wb_we_o == True, 1, 0)) & If((2 == dwb_biu_wb_cti_o) == True, 1, 0) = True) 1536
                            dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_last;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_last) 1538
                        end
                    else
                        begin
                            coverage0[1537] = 1;  //assertion( (If(Not(dwb_biu_biu_cyc_i == 1) == True, 1, 0) | If(Not(dwb_biu_biu_stb == 1) == True, 1, 0) | If(Not(dwb_biu_biu_cab_i == 1) == True, 1, 0) | If(dwb_biu_biu_sel_i != dwb_biu_wb_sel_o == True, 1, 0) | If(dwb_biu_biu_we_i != dwb_biu_wb_we_o == True, 1, 0)) & If((2 == dwb_biu_wb_cti_o) == True, 1, 0) = False) 1537
                            if ((((dwb_biu_wb_err_i | dwb_biu_wb_rty_i) | (dwb_biu_wb_ack & (dwb_biu_wb_cti_o == 3'h7))) & dwb_biu_wb_stb_o))
                                begin
                                    coverage0[1539] = 1;  //assertion( (dwb_biu_wb_err_i | dwb_biu_wb_rty_i | dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0)) & dwb_biu_wb_stb_o = True) 1539
                                    dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_idle;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_idle) 1541
                                end
                            else
                                begin
                                    coverage0[1540] = 1;  //assertion( (dwb_biu_wb_err_i | dwb_biu_wb_rty_i | dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0)) & dwb_biu_wb_stb_o = False) 1540
                                    dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_trans;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_trans) 1542
                                end
                        end
                end
              dwb_biu_wb_fsm_last:
                begin
                    coverage0[1543] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_last = True) 1543
                    dwb_biu_wb_cyc_nxt = ((~dwb_biu_wb_stb_o) | (((~dwb_biu_wb_err_i) & (~dwb_biu_wb_rty_i)) & (~(dwb_biu_wb_ack & (dwb_biu_wb_cti_o == 3'h7)))));  //assertion( dwb_biu_wb_cyc_nxt = If(Not(dwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(dwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0) == 1) == True, 1, 0)) 1544
                    dwb_biu_wb_stb_nxt = ((~dwb_biu_wb_stb_o) | (((~dwb_biu_wb_err_i) & (~dwb_biu_wb_rty_i)) & (~(dwb_biu_wb_ack & (dwb_biu_wb_cti_o == 3'h7)))));  //assertion( dwb_biu_wb_stb_nxt = If(Not(dwb_biu_wb_stb_o == 1) == True, 1, 0) | If(Not(dwb_biu_wb_err_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_rty_i == 1) == True, 1, 0) & If(Not(dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0) == 1) == True, 1, 0)) 1545
                    dwb_biu_wb_cti_nxt[2] = ((dwb_biu_wb_ack & dwb_biu_wb_stb_o) | dwb_biu_wb_cti_o[2]);  //assertion( Extract(2, 2, dwb_biu_wb_cti_nxt) = dwb_biu_wb_ack & dwb_biu_wb_stb_o | Extract(2, 2, dwb_biu_wb_cti_o)) 1546
                    dwb_biu_wb_cti_nxt[1] = 1'b1;  //assertion( Extract(1, 1, dwb_biu_wb_cti_nxt) = 1) 1547
                    dwb_biu_wb_cti_nxt[0] = ((dwb_biu_wb_ack & dwb_biu_wb_stb_o) | dwb_biu_wb_cti_o[0]);  //assertion( Extract(0, 0, dwb_biu_wb_cti_nxt) = dwb_biu_wb_ack & dwb_biu_wb_stb_o | Extract(0, 0, dwb_biu_wb_cti_o)) 1548
                    if ((((dwb_biu_wb_err_i | dwb_biu_wb_rty_i) | (dwb_biu_wb_ack & (dwb_biu_wb_cti_o == 3'h7))) & dwb_biu_wb_stb_o))
                        begin
                            coverage0[1549] = 1;  //assertion( (dwb_biu_wb_err_i | dwb_biu_wb_rty_i | dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0)) & dwb_biu_wb_stb_o = True) 1549
                            dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_idle;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_idle) 1551
                        end
                    else
                        begin
                            coverage0[1550] = 1;  //assertion( (dwb_biu_wb_err_i | dwb_biu_wb_rty_i | dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0)) & dwb_biu_wb_stb_o = False) 1550
                            dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_last;  //assertion( dwb_biu_wb_fsm_state_nxt = dwb_biu_wb_fsm_last) 1552
                        end
                end
              default:
                begin
                    coverage0[1553] = 1;  //assertion( If(dwb_biu_wb_fsm_state_cur != dwb_biu_wb_fsm_idle == True, 1, 0) & If(dwb_biu_wb_fsm_state_cur != dwb_biu_wb_fsm_trans == True, 1, 0) & If(dwb_biu_wb_fsm_state_cur != dwb_biu_wb_fsm_last == True, 1, 0) = True) 1553
                    dwb_biu_wb_cyc_nxt = 1'bx;  //assertion( dwb_biu_wb_cyc_nxt = 0) 1554
                    dwb_biu_wb_stb_nxt = 1'bx;  //assertion( dwb_biu_wb_stb_nxt = 0) 1555
                    dwb_biu_wb_cti_nxt = 3'bx;  //assertion( dwb_biu_wb_cti_nxt = 0) 1556
                    dwb_biu_wb_fsm_state_nxt = 2'bx;  //assertion( dwb_biu_wb_fsm_state_nxt = 0) 1557
                end
            endcase
        end

    //Following code is from line 3238
        always @(posedge dwb_biu_wb_rst_i or posedge dwb_biu_wb_clk_i) begin
            if ((dwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1558] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = True) 1558
                    dwb_biu_wb_cyc_o <= 1'b0;  //assertion( dwb_biu_wb_cyc_o = 0) 1560
                    dwb_biu_wb_stb_o <= 1'b0;  //assertion( dwb_biu_wb_stb_o = 0) 1561
                    dwb_biu_wb_cti_o <= 3'h7;  //assertion( dwb_biu_wb_cti_o = 7) 1562
                    dwb_biu_wb_bte_o <= 2'h1;  //assertion( dwb_biu_wb_bte_o = 1) 1563
                    dwb_biu_wb_we_o <= 1'b0;  //assertion( dwb_biu_wb_we_o = 0) 1564
                    dwb_biu_wb_sel_o <= 4'hf;  //assertion( dwb_biu_wb_sel_o = 15) 1565
                    dwb_biu_wb_adr_o <= 32'h00000000;  //assertion( dwb_biu_wb_adr_o = 0) 1566
                end
            else
                begin
                    coverage0[1559] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = False) 1559
                    dwb_biu_wb_cyc_o <= dwb_biu_wb_cyc_nxt;  //assertion( dwb_biu_wb_cyc_o = dwb_biu_wb_cyc_nxt) 1567
                    if ((dwb_biu_wb_ack & (dwb_biu_wb_cti_o == 3'h7)))
                        begin
                            coverage0[1568] = 1;  //assertion( dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0) = True) 1568
                            dwb_biu_wb_stb_o <= 1'b0;  //assertion( dwb_biu_wb_stb_o = 0) 1570
                        end
                    else
                        begin
                            coverage0[1569] = 1;  //assertion( dwb_biu_wb_ack & If((7 == dwb_biu_wb_cti_o) == True, 1, 0) = False) 1569
                            dwb_biu_wb_stb_o <= dwb_biu_wb_stb_nxt;  //assertion( dwb_biu_wb_stb_o = dwb_biu_wb_stb_nxt) 1571
                        end
                    dwb_biu_wb_cti_o <= dwb_biu_wb_cti_nxt;  //assertion( dwb_biu_wb_cti_o = dwb_biu_wb_cti_nxt) 1572
                    dwb_biu_wb_bte_o <= 2'h1;  //assertion( dwb_biu_wb_bte_o = 1) 1573
                    if ((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle))
                        begin
                            coverage0[1574] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = True) 1574
                            dwb_biu_wb_we_o <= dwb_biu_biu_we_i;  //assertion( dwb_biu_wb_we_o = dwb_biu_biu_we_i) 1576
                            dwb_biu_wb_sel_o <= dwb_biu_biu_sel_i;  //assertion( dwb_biu_wb_sel_o = dwb_biu_biu_sel_i) 1577
                        end
                    else
                            coverage0[1575] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = False) 1575
                    if ((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle))
                        begin
                            coverage0[1578] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = True) 1578
                            dwb_biu_wb_adr_o <= dwb_biu_biu_adr_i;  //assertion( dwb_biu_wb_adr_o = dwb_biu_biu_adr_i) 1580
                        end
                    else
                        begin
                            coverage0[1579] = 1;  //assertion( dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle = False) 1579
                            if ((dwb_biu_wb_stb_o & dwb_biu_wb_ack))
                                begin
                                    coverage0[1581] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_ack = True) 1581
                                    dwb_biu_wb_adr_o[3:2] <= (dwb_biu_wb_adr_o[3:2] + 2'h1);  //assertion( Extract(3, 2, dwb_biu_wb_adr_o) = Extract(3, 2, dwb_biu_wb_adr_o) + 1) 1583
                                end
                            else
                                    coverage0[1582] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_ack = False) 1582
                        end
                end
        end

    //Following code is from line 3261
        always @(posedge dwb_biu_wb_rst_i or posedge dwb_biu_wb_clk_i) begin
            if ((dwb_biu_wb_rst_i == 1'b1))
                begin
                    coverage0[1584] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = True) 1584
                    dwb_biu_wb_ack_cnt <= 1'b0;  //assertion( dwb_biu_wb_ack_cnt = 0) 1586
                    dwb_biu_wb_err_cnt <= 1'b0;  //assertion( dwb_biu_wb_err_cnt = 0) 1587
                    dwb_biu_wb_rty_cnt <= 1'b0;  //assertion( dwb_biu_wb_rty_cnt = 0) 1588
                end
            else
                begin
                    coverage0[1585] = 1;  //assertion( 1 == dwb_biu_wb_rst_i = False) 1585
                    if (((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) | (~(|dwb_biu_clmode))))
                        begin
                            coverage0[1589] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = True) 1589
                            dwb_biu_wb_ack_cnt <= 1'b0;  //assertion( dwb_biu_wb_ack_cnt = 0) 1591
                        end
                    else
                        begin
                            coverage0[1590] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = False) 1590
                            if ((dwb_biu_wb_stb_o & dwb_biu_wb_ack))
                                begin
                                    coverage0[1592] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_ack = True) 1592
                                    dwb_biu_wb_ack_cnt <= (~dwb_biu_wb_ack_cnt);  //assertion( dwb_biu_wb_ack_cnt = Not(dwb_biu_wb_ack_cnt == 1)) 1594
                                end
                            else
                                    coverage0[1593] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_ack = False) 1593
                        end
                    if (((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) | (~(|dwb_biu_clmode))))
                        begin
                            coverage0[1595] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = True) 1595
                            dwb_biu_wb_err_cnt <= 1'b0;  //assertion( dwb_biu_wb_err_cnt = 0) 1597
                        end
                    else
                        begin
                            coverage0[1596] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = False) 1596
                            if ((dwb_biu_wb_stb_o & dwb_biu_wb_err_i))
                                begin
                                    coverage0[1598] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_err_i = True) 1598
                                    dwb_biu_wb_err_cnt <= (~dwb_biu_wb_err_cnt);  //assertion( dwb_biu_wb_err_cnt = Not(dwb_biu_wb_err_cnt == 1)) 1600
                                end
                            else
                                    coverage0[1599] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_err_i = False) 1599
                        end
                    if (((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) | (~(|dwb_biu_clmode))))
                        begin
                            coverage0[1601] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = True) 1601
                            dwb_biu_wb_rty_cnt <= 1'b0;  //assertion( dwb_biu_wb_rty_cnt = 0) 1603
                        end
                    else
                        begin
                            coverage0[1602] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = False) 1602
                            if ((dwb_biu_wb_stb_o & dwb_biu_wb_rty_i))
                                begin
                                    coverage0[1604] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_rty_i = True) 1604
                                    dwb_biu_wb_rty_cnt <= (~dwb_biu_wb_rty_cnt);  //assertion( dwb_biu_wb_rty_cnt = Not(dwb_biu_wb_rty_cnt == 1)) 1606
                                end
                            else
                                    coverage0[1605] = 1;  //assertion( dwb_biu_wb_stb_o & dwb_biu_wb_rty_i = False) 1605
                        end
                end
        end

    //Following code is from line 3275
        always @(posedge dwb_biu_rst or posedge dwb_biu_clk) begin
            if ((dwb_biu_rst == 1'b1))
                begin
                    coverage0[1607] = 1;  //assertion( 1 == dwb_biu_rst = True) 1607
                    dwb_biu_biu_stb_reg <= 1'b0;  //assertion( dwb_biu_biu_stb_reg = 0) 1609
                    dwb_biu_biu_ack_cnt <= 1'b0;  //assertion( dwb_biu_biu_ack_cnt = 0) 1610
                    dwb_biu_biu_err_cnt <= 1'b0;  //assertion( dwb_biu_biu_err_cnt = 0) 1611
                    dwb_biu_biu_rty_cnt <= 1'b0;  //assertion( dwb_biu_biu_rty_cnt = 0) 1612
                end
            else
                begin
                    coverage0[1608] = 1;  //assertion( 1 == dwb_biu_rst = False) 1608
                    if (((dwb_biu_biu_stb_i & (~dwb_biu_biu_cab_i)) & dwb_biu_biu_ack_o))
                        begin
                            coverage0[1613] = 1;  //assertion( dwb_biu_biu_stb_i & If(Not(dwb_biu_biu_cab_i == 1) == True, 1, 0) & dwb_biu_biu_ack_o = True) 1613
                            dwb_biu_biu_stb_reg <= 1'b0;  //assertion( dwb_biu_biu_stb_reg = 0) 1615
                        end
                    else
                        begin
                            coverage0[1614] = 1;  //assertion( dwb_biu_biu_stb_i & If(Not(dwb_biu_biu_cab_i == 1) == True, 1, 0) & dwb_biu_biu_ack_o = False) 1614
                            dwb_biu_biu_stb_reg <= dwb_biu_biu_stb_i;  //assertion( dwb_biu_biu_stb_reg = dwb_biu_biu_stb_i) 1616
                        end
                    if (((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) | (~(|dwb_biu_clmode))))
                        begin
                            coverage0[1617] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = True) 1617
                            dwb_biu_biu_ack_cnt <= 1'b0;  //assertion( dwb_biu_biu_ack_cnt = 0) 1619
                        end
                    else
                        begin
                            coverage0[1618] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = False) 1618
                            if (dwb_biu_biu_ack_o)
                                begin
                                    coverage0[1620] = 1;  //assertion( 0 != dwb_biu_biu_ack_o = True) 1620
                                    dwb_biu_biu_ack_cnt <= (~dwb_biu_biu_ack_cnt);  //assertion( dwb_biu_biu_ack_cnt = Not(dwb_biu_biu_ack_cnt == 1)) 1622
                                end
                            else
                                    coverage0[1621] = 1;  //assertion( 0 != dwb_biu_biu_ack_o = False) 1621
                        end
                    if (((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) | (~(|dwb_biu_clmode))))
                        begin
                            coverage0[1623] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = True) 1623
                            dwb_biu_biu_err_cnt <= 1'b0;  //assertion( dwb_biu_biu_err_cnt = 0) 1625
                        end
                    else
                        begin
                            coverage0[1624] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = False) 1624
                            if ((dwb_biu_wb_err_i & dwb_biu_biu_err_o))
                                begin
                                    coverage0[1626] = 1;  //assertion( dwb_biu_wb_err_i & dwb_biu_biu_err_o = True) 1626
                                    dwb_biu_biu_err_cnt <= (~dwb_biu_biu_err_cnt);  //assertion( dwb_biu_biu_err_cnt = Not(dwb_biu_biu_err_cnt == 1)) 1628
                                end
                            else
                                    coverage0[1627] = 1;  //assertion( dwb_biu_wb_err_i & dwb_biu_biu_err_o = False) 1627
                        end
                    if (((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) | (~(|dwb_biu_clmode))))
                        begin
                            coverage0[1629] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = True) 1629
                            dwb_biu_biu_rty_cnt <= 1'b0;  //assertion( dwb_biu_biu_rty_cnt = 0) 1631
                        end
                    else
                        begin
                            coverage0[1630] = 1;  //assertion( If((dwb_biu_wb_fsm_state_cur == dwb_biu_wb_fsm_idle) == True, 1, 0) | If(Not(bvredor(dwb_biu_clmode) == 1) == True, 1, 0) = False) 1630
                            if (dwb_biu_biu_rty)
                                begin
                                    coverage0[1632] = 1;  //assertion( 0 != dwb_biu_biu_rty = True) 1632
                                    dwb_biu_biu_rty_cnt <= (~dwb_biu_biu_rty_cnt);  //assertion( dwb_biu_biu_rty_cnt = Not(dwb_biu_biu_rty_cnt == 1)) 1634
                                end
                            else
                                    coverage0[1633] = 1;  //assertion( 0 != dwb_biu_biu_rty = False) 1633
                        end
                end
        end

    //Following code is from line 3292
        always @(posedge or1200_immu_top_clk or posedge or1200_immu_top_rst) begin
            if ((or1200_immu_top_rst == 1'b1))
                begin
                    coverage0[1635] = 1;  //assertion( 1 == or1200_immu_top_rst = True) 1635
                    or1200_immu_top_icpu_adr_default <= 32'h00000100;  //assertion( or1200_immu_top_icpu_adr_default = 256) 1637
                    or1200_immu_top_icpu_adr_select <= 1'b1;  //assertion( or1200_immu_top_icpu_adr_select = 1) 1638
                end
            else
                begin
                    coverage0[1636] = 1;  //assertion( 1 == or1200_immu_top_rst = False) 1636
                    if (or1200_immu_top_icpu_adr_select)
                        begin
                            coverage0[1639] = 1;  //assertion( 0 != or1200_immu_top_icpu_adr_select = True) 1639
                            or1200_immu_top_icpu_adr_default <= or1200_immu_top_icpu_adr_boot;  //assertion( or1200_immu_top_icpu_adr_default = or1200_immu_top_icpu_adr_boot) 1641
                            or1200_immu_top_icpu_adr_select <= 1'b0;  //assertion( or1200_immu_top_icpu_adr_select = 0) 1642
                        end
                    else
                        begin
                            coverage0[1640] = 1;  //assertion( 0 != or1200_immu_top_icpu_adr_select = False) 1640
                            or1200_immu_top_icpu_adr_default <= or1200_immu_top_icpu_adr_i;  //assertion( or1200_immu_top_icpu_adr_default = or1200_immu_top_icpu_adr_i) 1643
                        end
                end
        end

    //Following code is from line 3302
        always @(or1200_immu_top_icpu_adr_select or or1200_immu_top_icpu_adr_default or or1200_immu_top_icpu_adr_boot) begin
            if (or1200_immu_top_icpu_adr_select)
                begin
                    coverage0[1644] = 1;  //assertion( 0 != or1200_immu_top_icpu_adr_select = True) 1644
                    or1200_immu_top_icpu_adr_o = or1200_immu_top_icpu_adr_boot;  //assertion( or1200_immu_top_icpu_adr_o = or1200_immu_top_icpu_adr_boot) 1646
                end
            else
                begin
                    coverage0[1645] = 1;  //assertion( 0 != or1200_immu_top_icpu_adr_select = False) 1645
                    or1200_immu_top_icpu_adr_o = or1200_immu_top_icpu_adr_default;  //assertion( or1200_immu_top_icpu_adr_o = or1200_immu_top_icpu_adr_default) 1647
                end
        end

    //Following code is from line 3305
        always @(posedge or1200_immu_top_rst or posedge or1200_immu_top_clk) begin
            if ((or1200_immu_top_rst == 1'b1))
                begin
                    coverage0[1648] = 1;  //assertion( 1 == or1200_immu_top_rst = True) 1648
                    or1200_immu_top_icpu_vpn_r <= 19'h00000;  //assertion( or1200_immu_top_icpu_vpn_r = 0) 1650
                end
            else
                begin
                    coverage0[1649] = 1;  //assertion( 1 == or1200_immu_top_rst = False) 1649
                    or1200_immu_top_icpu_vpn_r <= or1200_immu_top_icpu_adr_i[31:13];  //assertion( or1200_immu_top_icpu_vpn_r = Extract(31, 13, or1200_immu_top_icpu_adr_i)) 1651
                end
        end

    //Following code is from line 3308
        always @(posedge or1200_immu_top_rst or posedge or1200_immu_top_clk) begin
            if ((or1200_immu_top_rst == 1'b1))
                begin
                    coverage0[1652] = 1;  //assertion( 1 == or1200_immu_top_rst = True) 1652
                    or1200_immu_top_dis_spr_access_frst_clk <= 1'b0;  //assertion( or1200_immu_top_dis_spr_access_frst_clk = 0) 1654
                end
            else
                begin
                    coverage0[1653] = 1;  //assertion( 1 == or1200_immu_top_rst = False) 1653
                    if ((~or1200_immu_top_icpu_rty_o))
                        begin
                            coverage0[1655] = 1;  //assertion( Not(or1200_immu_top_icpu_rty_o == 1) = True) 1655
                            or1200_immu_top_dis_spr_access_frst_clk <= 1'b0;  //assertion( or1200_immu_top_dis_spr_access_frst_clk = 0) 1657
                        end
                    else
                        begin
                            coverage0[1656] = 1;  //assertion( Not(or1200_immu_top_icpu_rty_o == 1) = False) 1656
                            if (or1200_immu_top_spr_cs)
                                begin
                                    coverage0[1658] = 1;  //assertion( 0 != or1200_immu_top_spr_cs = True) 1658
                                    or1200_immu_top_dis_spr_access_frst_clk <= 1'b1;  //assertion( or1200_immu_top_dis_spr_access_frst_clk = 1) 1660
                                end
                            else
                                    coverage0[1659] = 1;  //assertion( 0 != or1200_immu_top_spr_cs = False) 1659
                        end
                end
        end

    //Following code is from line 3312
        always @(posedge or1200_immu_top_rst or posedge or1200_immu_top_clk) begin
            if ((or1200_immu_top_rst == 1'b1))
                begin
                    coverage0[1661] = 1;  //assertion( 1 == or1200_immu_top_rst = True) 1661
                    or1200_immu_top_dis_spr_access_scnd_clk <= 1'b0;  //assertion( or1200_immu_top_dis_spr_access_scnd_clk = 0) 1663
                end
            else
                begin
                    coverage0[1662] = 1;  //assertion( 1 == or1200_immu_top_rst = False) 1662
                    if ((~or1200_immu_top_icpu_rty_o))
                        begin
                            coverage0[1664] = 1;  //assertion( Not(or1200_immu_top_icpu_rty_o == 1) = True) 1664
                            or1200_immu_top_dis_spr_access_scnd_clk <= 1'b0;  //assertion( or1200_immu_top_dis_spr_access_scnd_clk = 0) 1666
                        end
                    else
                        begin
                            coverage0[1665] = 1;  //assertion( Not(or1200_immu_top_icpu_rty_o == 1) = False) 1665
                            if (or1200_immu_top_dis_spr_access_frst_clk)
                                begin
                                    coverage0[1667] = 1;  //assertion( 0 != or1200_immu_top_dis_spr_access_frst_clk = True) 1667
                                    or1200_immu_top_dis_spr_access_scnd_clk <= 1'b1;  //assertion( or1200_immu_top_dis_spr_access_scnd_clk = 1) 1669
                                end
                            else
                                    coverage0[1668] = 1;  //assertion( 0 != or1200_immu_top_dis_spr_access_frst_clk = False) 1668
                        end
                end
        end

    //Following code is from line 3316
        always @(posedge or1200_immu_top_rst or posedge or1200_immu_top_clk) begin
            if ((or1200_immu_top_rst == 1'b1))
                begin
                    coverage0[1670] = 1;  //assertion( 1 == or1200_immu_top_rst = True) 1670
                    or1200_immu_top_itlb_en_r <= 1'b0;  //assertion( or1200_immu_top_itlb_en_r = 0) 1672
                end
            else
                begin
                    coverage0[1671] = 1;  //assertion( 1 == or1200_immu_top_rst = False) 1671
                    or1200_immu_top_itlb_en_r <= (or1200_immu_top_itlb_en & (~or1200_immu_top_itlb_spr_access));  //assertion( or1200_immu_top_itlb_en_r = or1200_immu_top_itlb_en & ~or1200_immu_top_itlb_spr_access) 1673
                end
        end

    //Following code is from line 3319
        always @(posedge or1200_immu_top_rst or posedge or1200_immu_top_clk) begin
            if ((or1200_immu_top_rst == 1'b1))
                begin
                    coverage0[1674] = 1;  //assertion( 1 == or1200_immu_top_rst = True) 1674
                    or1200_immu_top_spr_dat_reg <= 32'h00000000;  //assertion( or1200_immu_top_spr_dat_reg = 0) 1676
                end
            else
                begin
                    coverage0[1675] = 1;  //assertion( 1 == or1200_immu_top_rst = False) 1675
                    if ((or1200_immu_top_spr_cs & (~or1200_immu_top_dis_spr_access_scnd_clk)))
                        begin
                            coverage0[1677] = 1;  //assertion( or1200_immu_top_spr_cs & If(Not(or1200_immu_top_dis_spr_access_scnd_clk == 1) == True, 1, 0) = True) 1677
                            or1200_immu_top_spr_dat_reg <= or1200_immu_top_itlb_dat_o;  //assertion( or1200_immu_top_spr_dat_reg = or1200_immu_top_itlb_dat_o) 1679
                        end
                    else
                            coverage0[1678] = 1;  //assertion( or1200_immu_top_spr_cs & If(Not(or1200_immu_top_dis_spr_access_scnd_clk == 1) == True, 1, 0) = False) 1678
                end
        end

    //Following code is from line 3322
        always @(posedge or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk) begin
            if (or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce)
                begin
                    coverage0[1680] = 1;  //assertion( 0 != or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce = True) 1680
                    or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr_reg <= or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr;  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr_reg = or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr) 1682
                end
            else
                    coverage0[1681] = 1;  //assertion( 0 != or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce = False) 1681
        end

    //Following code is from line 3324
        always @(posedge or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_clk) begin
            if ((or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we && or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce))
                begin
                    coverage0[1683] = 1;  //assertion( And(or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we == 1, or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce == 1) = True) 1683
                    or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_mem[or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr] <= or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di;  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_mem[or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_addr] = or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_di) 1685
                end
            else
                    coverage0[1684] = 1;  //assertion( And(or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_we == 1, or1200_immu_top_or1200_immu_tlb_itlb_mr_ram_ce == 1) = False) 1684
        end

    //Following code is from line 3326
        always @(posedge or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk) begin
            if (or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce)
                begin
                    coverage0[1686] = 1;  //assertion( 0 != or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce = True) 1686
                    or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr_reg <= or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr;  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr_reg = or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr) 1688
                end
            else
                    coverage0[1687] = 1;  //assertion( 0 != or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce = False) 1687
        end

    //Following code is from line 3328
        always @(posedge or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_clk) begin
            if ((or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we && or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce))
                begin
                    coverage0[1689] = 1;  //assertion( And(or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we == 1, or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce == 1) = True) 1689
                    or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_mem[or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr] <= or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di;  //assertion( or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_mem[or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_addr] = or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_di) 1691
                end
            else
                    coverage0[1690] = 1;  //assertion( And(or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_we == 1, or1200_immu_top_or1200_immu_tlb_itlb_tr_ram_ce == 1) = False) 1690
        end

    //Following code is from line 3330
        always @(posedge or1200_ic_top_rst or posedge or1200_ic_top_clk) begin
            if ((or1200_ic_top_rst == 1'b1))
                begin
                    coverage0[1692] = 1;  //assertion( 1 == or1200_ic_top_rst = True) 1692
                    or1200_ic_top_ic_inv_q <= 1'b0;  //assertion( or1200_ic_top_ic_inv_q = 0) 1694
                end
            else
                begin
                    coverage0[1693] = 1;  //assertion( 1 == or1200_ic_top_rst = False) 1693
                    or1200_ic_top_ic_inv_q <= or1200_ic_top_ic_inv;  //assertion( or1200_ic_top_ic_inv_q = or1200_ic_top_ic_inv) 1695
                end
        end

    //Following code is from line 3333
        always @(or1200_ic_top_tag_v or or1200_ic_top_saved_addr or or1200_ic_top_tag) begin
            if (((or1200_ic_top_tag != or1200_ic_top_saved_addr[31:13]) | (~or1200_ic_top_tag_v)))
                begin
                    coverage0[1696] = 1;  //assertion( If(or1200_ic_top_tag != Extract(31, 13, or1200_ic_top_saved_addr) == True, 1, 0) | If(Not(or1200_ic_top_tag_v == 1) == True, 1, 0) = True) 1696
                    or1200_ic_top_tagcomp_miss = 1'b1;  //assertion( or1200_ic_top_tagcomp_miss = 1) 1698
                end
            else
                begin
                    coverage0[1697] = 1;  //assertion( If(or1200_ic_top_tag != Extract(31, 13, or1200_ic_top_saved_addr) == True, 1, 0) | If(Not(or1200_ic_top_tag_v == 1) == True, 1, 0) = False) 1697
                    or1200_ic_top_tagcomp_miss = 1'b0;  //assertion( or1200_ic_top_tagcomp_miss = 0) 1699
                end
        end

    //Following code is from line 3336
        always @(posedge or1200_ic_top_or1200_ic_fsm_rst or posedge or1200_ic_top_or1200_ic_fsm_clk) begin
            if ((or1200_ic_top_or1200_ic_fsm_rst == 1'b1))
                begin
                    coverage0[1700] = 1;  //assertion( 1 == or1200_ic_top_or1200_ic_fsm_rst = True) 1700
                    or1200_ic_top_or1200_ic_fsm_state <= 2'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 0) 1702
                    or1200_ic_top_or1200_ic_fsm_saved_addr_r <= 32'h00000000;  //assertion( or1200_ic_top_or1200_ic_fsm_saved_addr_r = 0) 1703
                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1704
                    or1200_ic_top_or1200_ic_fsm_load <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 0) 1705
                    or1200_ic_top_or1200_ic_fsm_cnt <= 4'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_cnt = 0) 1706
                    or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 0) 1707
                    or1200_ic_top_or1200_ic_fsm_last_eval_miss <= 0;  //assertion( or1200_ic_top_or1200_ic_fsm_last_eval_miss = 0) 1708
                end
            else
                begin
                    coverage0[1701] = 1;  //assertion( 1 == or1200_ic_top_or1200_ic_fsm_rst = False) 1701
                    case (or1200_ic_top_or1200_ic_fsm_state)
                      2'h0:
                        begin
                            coverage0[1709] = 1;  //assertion( 0 == or1200_ic_top_or1200_ic_fsm_state = True) 1709
                            if ((or1200_ic_top_or1200_ic_fsm_ic_en & or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i))
                                begin
                                    coverage0[1710] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_ic_en & or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i = True) 1710
                                    or1200_ic_top_or1200_ic_fsm_state <= 2'h1;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 1) 1712
                                    or1200_ic_top_or1200_ic_fsm_saved_addr_r <= or1200_ic_top_or1200_ic_fsm_start_addr;  //assertion( or1200_ic_top_or1200_ic_fsm_saved_addr_r = or1200_ic_top_or1200_ic_fsm_start_addr) 1713
                                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b1;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 1) 1714
                                    or1200_ic_top_or1200_ic_fsm_load <= 1'b1;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 1) 1715
                                    or1200_ic_top_or1200_ic_fsm_cache_inhibit <= or1200_ic_top_or1200_ic_fsm_icqmem_ci_i;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = or1200_ic_top_or1200_ic_fsm_icqmem_ci_i) 1716
                                    or1200_ic_top_or1200_ic_fsm_last_eval_miss <= 0;  //assertion( or1200_ic_top_or1200_ic_fsm_last_eval_miss = 0) 1717
                                end
                            else
                                begin
                                    coverage0[1711] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_ic_en & or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i = False) 1711
                                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1718
                                    or1200_ic_top_or1200_ic_fsm_load <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 0) 1719
                                    or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 0) 1720
                                end
                        end
                      2'h1:
                        begin
                            coverage0[1721] = 1;  //assertion( 1 == or1200_ic_top_or1200_ic_fsm_state = True) 1721
                            if ((or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i & or1200_ic_top_or1200_ic_fsm_icqmem_ci_i))
                                begin
                                    coverage0[1722] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i & or1200_ic_top_or1200_ic_fsm_icqmem_ci_i = True) 1722
                                    or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b1;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 1) 1724
                                end
                            else
                                    coverage0[1723] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i & or1200_ic_top_or1200_ic_fsm_icqmem_ci_i = False) 1723
                            if (or1200_ic_top_or1200_ic_fsm_hitmiss_eval)
                                begin
                                    coverage0[1725] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_fsm_hitmiss_eval = True) 1725
                                    or1200_ic_top_or1200_ic_fsm_saved_addr_r[31:13] <= or1200_ic_top_or1200_ic_fsm_start_addr[31:13];  //assertion( Extract(31, 13, or1200_ic_top_or1200_ic_fsm_saved_addr_r) = Extract(31, 13, or1200_ic_top_or1200_ic_fsm_start_addr)) 1727
                                end
                            else
                                    coverage0[1726] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_fsm_hitmiss_eval = False) 1726
                            if (((((~or1200_ic_top_or1200_ic_fsm_ic_en) || (or1200_ic_top_or1200_ic_fsm_hitmiss_eval & (~or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i))) || or1200_ic_top_or1200_ic_fsm_biudata_error) || (or1200_ic_top_or1200_ic_fsm_cache_inhibit & or1200_ic_top_or1200_ic_fsm_biudata_valid)))
                                begin
                                    coverage0[1728] = 1;  //assertion( Or(If(Or(If(Or(If(Not(or1200_ic_top_or1200_ic_fsm_ic_en == 1) == True, 1, 0) == 1, or1200_ic_top_or1200_ic_fsm_hitmiss_eval & If(Not(or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, or1200_ic_top_or1200_ic_fsm_biudata_error == 1) == True, 1, 0) == 1, or1200_ic_top_or1200_ic_fsm_cache_inhibit & or1200_ic_top_or1200_ic_fsm_biudata_valid == 1) = True) 1728
                                    or1200_ic_top_or1200_ic_fsm_state <= 2'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 0) 1730
                                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1731
                                    or1200_ic_top_or1200_ic_fsm_load <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 0) 1732
                                    or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 0) 1733
                                end
                            else
                                begin
                                    coverage0[1729] = 1;  //assertion( Or(If(Or(If(Or(If(Not(or1200_ic_top_or1200_ic_fsm_ic_en == 1) == True, 1, 0) == 1, or1200_ic_top_or1200_ic_fsm_hitmiss_eval & If(Not(or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, or1200_ic_top_or1200_ic_fsm_biudata_error == 1) == True, 1, 0) == 1, or1200_ic_top_or1200_ic_fsm_cache_inhibit & or1200_ic_top_or1200_ic_fsm_biudata_valid == 1) = False) 1729
                                    if ((or1200_ic_top_or1200_ic_fsm_tagcomp_miss & or1200_ic_top_or1200_ic_fsm_biudata_valid))
                                        begin
                                            coverage0[1734] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_tagcomp_miss & or1200_ic_top_or1200_ic_fsm_biudata_valid = True) 1734
                                            or1200_ic_top_or1200_ic_fsm_state <= 2'h2;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 2) 1736
                                            or1200_ic_top_or1200_ic_fsm_saved_addr_r[3:2] <= (or1200_ic_top_or1200_ic_fsm_saved_addr_r[3:2] + 2'h1);  //assertion( Extract(3, 2, or1200_ic_top_or1200_ic_fsm_saved_addr_r) = Extract(3, 2, or1200_ic_top_or1200_ic_fsm_saved_addr_r) + 1) 1737
                                            or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1738
                                            or1200_ic_top_or1200_ic_fsm_cnt <= (-8);  //assertion( or1200_ic_top_or1200_ic_fsm_cnt = -8) 1739
                                            or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 0) 1740
                                        end
                                    else
                                        begin
                                            coverage0[1735] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_tagcomp_miss & or1200_ic_top_or1200_ic_fsm_biudata_valid = False) 1735
                                            if (((~or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i) & (~or1200_ic_top_or1200_ic_fsm_last_eval_miss)))
                                                begin
                                                    coverage0[1741] = 1;  //assertion( If(Not(or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i == 1) == True, 1, 0) & If(Not(or1200_ic_top_or1200_ic_fsm_last_eval_miss == 1) == True, 1, 0) = True) 1741
                                                    or1200_ic_top_or1200_ic_fsm_state <= 2'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 0) 1743
                                                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1744
                                                    or1200_ic_top_or1200_ic_fsm_load <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 0) 1745
                                                    or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 0) 1746
                                                end
                                            else
                                                begin
                                                    coverage0[1742] = 1;  //assertion( If(Not(or1200_ic_top_or1200_ic_fsm_icqmem_cycstb_i == 1) == True, 1, 0) & If(Not(or1200_ic_top_or1200_ic_fsm_last_eval_miss == 1) == True, 1, 0) = False) 1742
                                                    if (((~or1200_ic_top_or1200_ic_fsm_tagcomp_miss) & (~or1200_ic_top_or1200_ic_fsm_icqmem_ci_i)))
                                                        begin
                                                            coverage0[1747] = 1;  //assertion( If(Not(or1200_ic_top_or1200_ic_fsm_tagcomp_miss == 1) == True, 1, 0) & If(Not(or1200_ic_top_or1200_ic_fsm_icqmem_ci_i == 1) == True, 1, 0) = True) 1747
                                                            or1200_ic_top_or1200_ic_fsm_saved_addr_r <= or1200_ic_top_or1200_ic_fsm_start_addr;  //assertion( or1200_ic_top_or1200_ic_fsm_saved_addr_r = or1200_ic_top_or1200_ic_fsm_start_addr) 1749
                                                            or1200_ic_top_or1200_ic_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_cache_inhibit = 0) 1750
                                                        end
                                                    else
                                                        begin
                                                            coverage0[1748] = 1;  //assertion( If(Not(or1200_ic_top_or1200_ic_fsm_tagcomp_miss == 1) == True, 1, 0) & If(Not(or1200_ic_top_or1200_ic_fsm_icqmem_ci_i == 1) == True, 1, 0) = False) 1748
                                                            or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1751
                                                        end
                                                end
                                        end
                                end
                            if ((or1200_ic_top_or1200_ic_fsm_hitmiss_eval & (~or1200_ic_top_or1200_ic_fsm_tagcomp_miss)))
                                begin
                                    coverage0[1752] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval & If(Not(or1200_ic_top_or1200_ic_fsm_tagcomp_miss == 1) == True, 1, 0) = True) 1752
                                    or1200_ic_top_or1200_ic_fsm_last_eval_miss <= (-1);  //assertion( or1200_ic_top_or1200_ic_fsm_last_eval_miss = -1) 1754
                                end
                            else
                                    coverage0[1753] = 1;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval & If(Not(or1200_ic_top_or1200_ic_fsm_tagcomp_miss == 1) == True, 1, 0) = False) 1753
                        end
                      2'h2:
                        begin
                            coverage0[1755] = 1;  //assertion( 2 == or1200_ic_top_or1200_ic_fsm_state = True) 1755
                            if ((~or1200_ic_top_or1200_ic_fsm_ic_en))
                                begin
                                    coverage0[1756] = 1;  //assertion( Not(or1200_ic_top_or1200_ic_fsm_ic_en == 1) = True) 1756
                                    or1200_ic_top_or1200_ic_fsm_state <= 2'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 0) 1758
                                    or1200_ic_top_or1200_ic_fsm_saved_addr_r <= or1200_ic_top_or1200_ic_fsm_start_addr;  //assertion( or1200_ic_top_or1200_ic_fsm_saved_addr_r = or1200_ic_top_or1200_ic_fsm_start_addr) 1759
                                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1760
                                    or1200_ic_top_or1200_ic_fsm_load <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 0) 1761
                                end
                            else
                                begin
                                    coverage0[1757] = 1;  //assertion( Not(or1200_ic_top_or1200_ic_fsm_ic_en == 1) = False) 1757
                                    if ((or1200_ic_top_or1200_ic_fsm_biudata_valid && (|or1200_ic_top_or1200_ic_fsm_cnt)))
                                        begin
                                            coverage0[1762] = 1;  //assertion( And(or1200_ic_top_or1200_ic_fsm_biudata_valid == 1, bvredor(or1200_ic_top_or1200_ic_fsm_cnt) == 1) = True) 1762
                                            or1200_ic_top_or1200_ic_fsm_cnt <= (or1200_ic_top_or1200_ic_fsm_cnt - 4'h4);  //assertion( or1200_ic_top_or1200_ic_fsm_cnt = or1200_ic_top_or1200_ic_fsm_cnt - 4) 1764
                                            or1200_ic_top_or1200_ic_fsm_saved_addr_r[3:2] <= (or1200_ic_top_or1200_ic_fsm_saved_addr_r[3:2] + 2'h1);  //assertion( Extract(3, 2, or1200_ic_top_or1200_ic_fsm_saved_addr_r) = Extract(3, 2, or1200_ic_top_or1200_ic_fsm_saved_addr_r) + 1) 1765
                                        end
                                    else
                                        begin
                                            coverage0[1763] = 1;  //assertion( And(or1200_ic_top_or1200_ic_fsm_biudata_valid == 1, bvredor(or1200_ic_top_or1200_ic_fsm_cnt) == 1) = False) 1763
                                            if (or1200_ic_top_or1200_ic_fsm_biudata_valid)
                                                begin
                                                    coverage0[1766] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_fsm_biudata_valid = True) 1766
                                                    or1200_ic_top_or1200_ic_fsm_state <= 2'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 0) 1768
                                                    or1200_ic_top_or1200_ic_fsm_saved_addr_r <= or1200_ic_top_or1200_ic_fsm_start_addr;  //assertion( or1200_ic_top_or1200_ic_fsm_saved_addr_r = or1200_ic_top_or1200_ic_fsm_start_addr) 1769
                                                    or1200_ic_top_or1200_ic_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_hitmiss_eval = 0) 1770
                                                    or1200_ic_top_or1200_ic_fsm_load <= 1'b0;  //assertion( or1200_ic_top_or1200_ic_fsm_load = 0) 1771
                                                end
                                            else
                                                    coverage0[1767] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_fsm_biudata_valid = False) 1767
                                        end
                                end
                        end
                      default:
                        begin
                            coverage0[1772] = 1;  //assertion( If(0 != or1200_ic_top_or1200_ic_fsm_state == True, 1, 0) & If(1 != or1200_ic_top_or1200_ic_fsm_state == True, 1, 0) & If(2 != or1200_ic_top_or1200_ic_fsm_state == True, 1, 0) = True) 1772
                            or1200_ic_top_or1200_ic_fsm_state <= 2'h0;  //assertion( or1200_ic_top_or1200_ic_fsm_state = 0) 1773
                        end
                    endcase
                end
        end

    //Following code is from line 3407
        always @(posedge or1200_ic_top_or1200_ic_ram_ic_ram0_clk) begin
            if (or1200_ic_top_or1200_ic_ram_ic_ram0_ce)
                begin
                    coverage0[1774] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_ram_ic_ram0_ce = True) 1774
                    or1200_ic_top_or1200_ic_ram_ic_ram0_addr_reg <= or1200_ic_top_or1200_ic_ram_ic_ram0_addr;  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_addr_reg = or1200_ic_top_or1200_ic_ram_ic_ram0_addr) 1776
                end
            else
                    coverage0[1775] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_ram_ic_ram0_ce = False) 1775
        end

    //Following code is from line 3409
        always @(posedge or1200_ic_top_or1200_ic_ram_ic_ram0_clk) begin
            if ((or1200_ic_top_or1200_ic_ram_ic_ram0_we && or1200_ic_top_or1200_ic_ram_ic_ram0_ce))
                begin
                    coverage0[1777] = 1;  //assertion( And(or1200_ic_top_or1200_ic_ram_ic_ram0_we == 1, or1200_ic_top_or1200_ic_ram_ic_ram0_ce == 1) = True) 1777
                    or1200_ic_top_or1200_ic_ram_ic_ram0_mem[or1200_ic_top_or1200_ic_ram_ic_ram0_addr] <= or1200_ic_top_or1200_ic_ram_ic_ram0_di;  //assertion( or1200_ic_top_or1200_ic_ram_ic_ram0_mem[or1200_ic_top_or1200_ic_ram_ic_ram0_addr] = or1200_ic_top_or1200_ic_ram_ic_ram0_di) 1779
                end
            else
                    coverage0[1778] = 1;  //assertion( And(or1200_ic_top_or1200_ic_ram_ic_ram0_we == 1, or1200_ic_top_or1200_ic_ram_ic_ram0_ce == 1) = False) 1778
        end

    //Following code is from line 3411
        always @(posedge or1200_ic_top_or1200_ic_tag_ic_tag0_clk) begin
            if (or1200_ic_top_or1200_ic_tag_ic_tag0_ce)
                begin
                    coverage0[1780] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_tag_ic_tag0_ce = True) 1780
                    or1200_ic_top_or1200_ic_tag_ic_tag0_addr_reg <= or1200_ic_top_or1200_ic_tag_ic_tag0_addr;  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_addr_reg = or1200_ic_top_or1200_ic_tag_ic_tag0_addr) 1782
                end
            else
                    coverage0[1781] = 1;  //assertion( 0 != or1200_ic_top_or1200_ic_tag_ic_tag0_ce = False) 1781
        end

    //Following code is from line 3413
        always @(posedge or1200_ic_top_or1200_ic_tag_ic_tag0_clk) begin
            if ((or1200_ic_top_or1200_ic_tag_ic_tag0_we && or1200_ic_top_or1200_ic_tag_ic_tag0_ce))
                begin
                    coverage0[1783] = 1;  //assertion( And(or1200_ic_top_or1200_ic_tag_ic_tag0_we == 1, or1200_ic_top_or1200_ic_tag_ic_tag0_ce == 1) = True) 1783
                    or1200_ic_top_or1200_ic_tag_ic_tag0_mem[or1200_ic_top_or1200_ic_tag_ic_tag0_addr] <= or1200_ic_top_or1200_ic_tag_ic_tag0_di;  //assertion( or1200_ic_top_or1200_ic_tag_ic_tag0_mem[or1200_ic_top_or1200_ic_tag_ic_tag0_addr] = or1200_ic_top_or1200_ic_tag_ic_tag0_di) 1785
                end
            else
                    coverage0[1784] = 1;  //assertion( And(or1200_ic_top_or1200_ic_tag_ic_tag0_we == 1, or1200_ic_top_or1200_ic_tag_ic_tag0_ce == 1) = False) 1784
        end

    //Following code is from line 3415
        always @(posedge or1200_cpu_or1200_genpc_rst or posedge or1200_cpu_or1200_genpc_clk) begin
            if ((or1200_cpu_or1200_genpc_rst == 1'b1))
                begin
                    coverage0[1786] = 1;  //assertion( 1 == or1200_cpu_or1200_genpc_rst = True) 1786
                    or1200_cpu_or1200_genpc_wait_lsu <= 1'b0;  //assertion( or1200_cpu_or1200_genpc_wait_lsu = 0) 1788
                end
            else
                begin
                    coverage0[1787] = 1;  //assertion( 1 == or1200_cpu_or1200_genpc_rst = False) 1787
                    if ((((~or1200_cpu_or1200_genpc_wait_lsu) & (|or1200_cpu_or1200_genpc_pre_branch_op)) & or1200_cpu_or1200_genpc_lsu_stall))
                        begin
                            coverage0[1789] = 1;  //assertion( If(Not(or1200_cpu_or1200_genpc_wait_lsu == 1) == True, 1, 0) & bvredor(or1200_cpu_or1200_genpc_pre_branch_op) & or1200_cpu_or1200_genpc_lsu_stall = True) 1789
                            or1200_cpu_or1200_genpc_wait_lsu <= 1'b1;  //assertion( or1200_cpu_or1200_genpc_wait_lsu = 1) 1791
                        end
                    else
                        begin
                            coverage0[1790] = 1;  //assertion( If(Not(or1200_cpu_or1200_genpc_wait_lsu == 1) == True, 1, 0) & bvredor(or1200_cpu_or1200_genpc_pre_branch_op) & or1200_cpu_or1200_genpc_lsu_stall = False) 1790
                            if ((or1200_cpu_or1200_genpc_wait_lsu & ~|or1200_cpu_or1200_genpc_pre_branch_op))
                                begin
                                    coverage0[1792] = 1;  //assertion( or1200_cpu_or1200_genpc_wait_lsu & ~bvredor(or1200_cpu_or1200_genpc_pre_branch_op) = True) 1792
                                    or1200_cpu_or1200_genpc_wait_lsu <= 1'b0;  //assertion( or1200_cpu_or1200_genpc_wait_lsu = 0) 1794
                                end
                            else
                                    coverage0[1793] = 1;  //assertion( or1200_cpu_or1200_genpc_wait_lsu & ~bvredor(or1200_cpu_or1200_genpc_pre_branch_op) = False) 1793
                        end
                end
        end

    //Following code is from line 3419
        always @(posedge or1200_cpu_or1200_genpc_rst or posedge or1200_cpu_or1200_genpc_clk) begin
            if ((or1200_cpu_or1200_genpc_rst == 1'b1))
                begin
                    coverage0[1795] = 1;  //assertion( 1 == or1200_cpu_or1200_genpc_rst = True) 1795
                    or1200_cpu_or1200_genpc_genpc_refetch_r <= 1'b0;  //assertion( or1200_cpu_or1200_genpc_genpc_refetch_r = 0) 1797
                end
            else
                begin
                    coverage0[1796] = 1;  //assertion( 1 == or1200_cpu_or1200_genpc_rst = False) 1796
                    if (or1200_cpu_or1200_genpc_genpc_refetch)
                        begin
                            coverage0[1798] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_genpc_refetch = True) 1798
                            or1200_cpu_or1200_genpc_genpc_refetch_r <= 1'b1;  //assertion( or1200_cpu_or1200_genpc_genpc_refetch_r = 1) 1800
                        end
                    else
                        begin
                            coverage0[1799] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_genpc_refetch = False) 1799
                            or1200_cpu_or1200_genpc_genpc_refetch_r <= 1'b0;  //assertion( or1200_cpu_or1200_genpc_genpc_refetch_r = 0) 1801
                        end
                end
        end

    //Following code is from line 3423
        always @(or1200_cpu_or1200_genpc_du_flush_pipe or or1200_cpu_or1200_genpc_except_prefix or or1200_cpu_or1200_genpc_spr_dat_i or or1200_cpu_or1200_genpc_spr_pc_we or or1200_cpu_or1200_genpc_epcr or or1200_cpu_or1200_genpc_operand_b or or1200_cpu_or1200_genpc_except_start or or1200_cpu_or1200_genpc_except_type or or1200_cpu_or1200_genpc_branch_op or or1200_cpu_or1200_genpc_flag or or1200_cpu_or1200_genpc_ex_branch_addrtarget or or1200_cpu_or1200_genpc_pcreg) begin
            case ({or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we, or1200_cpu_or1200_genpc_except_start, or1200_cpu_or1200_genpc_branch_op})
              6'h00:
                begin
                    coverage0[1802] = 1;  //assertion( 0 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1802
                    or1200_cpu_or1200_genpc_pc = {(or1200_cpu_or1200_genpc_pcreg + 30'h00000001), 2'h0};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(or1200_cpu_or1200_genpc_pcreg + 1, 0)) 1803
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b0;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 0) 1804
                end
              6'h01:
                begin
                    coverage0[1805] = 1;  //assertion( 1 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1805
                    or1200_cpu_or1200_genpc_pc = {or1200_cpu_or1200_genpc_ex_branch_addrtarget, 2'h0};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(or1200_cpu_or1200_genpc_ex_branch_addrtarget, 0)) 1806
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1807
                end
              6'h02:
                begin
                    coverage0[1808] = 1;  //assertion( 2 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1808
                    or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_operand_b;  //assertion( or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_operand_b) 1809
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1810
                end
              6'h04:
                begin
                    coverage0[1811] = 1;  //assertion( 4 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1811
                    if (or1200_cpu_or1200_genpc_flag)
                        begin
                            coverage0[1812] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_flag = True) 1812
                            or1200_cpu_or1200_genpc_pc = {or1200_cpu_or1200_genpc_ex_branch_addrtarget, 2'h0};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(or1200_cpu_or1200_genpc_ex_branch_addrtarget, 0)) 1814
                            or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1815
                        end
                    else
                        begin
                            coverage0[1813] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_flag = False) 1813
                            or1200_cpu_or1200_genpc_pc = {(or1200_cpu_or1200_genpc_pcreg + 30'h00000001), 2'h0};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(or1200_cpu_or1200_genpc_pcreg + 1, 0)) 1816
                            or1200_cpu_or1200_genpc_ex_branch_taken = 1'b0;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 0) 1817
                        end
                end
              6'h05:
                begin
                    coverage0[1818] = 1;  //assertion( 5 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1818
                    if (or1200_cpu_or1200_genpc_flag)
                        begin
                            coverage0[1819] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_flag = True) 1819
                            or1200_cpu_or1200_genpc_pc = {(or1200_cpu_or1200_genpc_pcreg + 30'h00000001), 2'h0};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(or1200_cpu_or1200_genpc_pcreg + 1, 0)) 1821
                            or1200_cpu_or1200_genpc_ex_branch_taken = 1'b0;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 0) 1822
                        end
                    else
                        begin
                            coverage0[1820] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_flag = False) 1820
                            or1200_cpu_or1200_genpc_pc = {or1200_cpu_or1200_genpc_ex_branch_addrtarget, 2'h0};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(or1200_cpu_or1200_genpc_ex_branch_addrtarget, 0)) 1823
                            or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1824
                        end
                end
              6'h06:
                begin
                    coverage0[1825] = 1;  //assertion( 6 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1825
                    or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_epcr;  //assertion( or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_epcr) 1826
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1827
                end
              6'b100zzz:
                begin
                    coverage0[1828] = 1;  //assertion( 32 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1828
                    or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_spr_dat_npc;  //assertion( or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_spr_dat_npc) 1829
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1830
                end
              6'b01zzz:
                begin
                    coverage0[1831] = 1;  //assertion( 8 == Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) = True) 1831
                    or1200_cpu_or1200_genpc_pc = {(or1200_cpu_or1200_genpc_except_prefix ? 20'hf0000 : 20'h00000), or1200_cpu_or1200_genpc_except_type, 8'h00};  //assertion( or1200_cpu_or1200_genpc_pc = Concat(Concat(If(0 != or1200_cpu_or1200_genpc_except_prefix == True, 983040, 0), or1200_cpu_or1200_genpc_except_type), 0)) 1832
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b1;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 1) 1833
                end
              default:
                begin
                    coverage0[1834] = 1;  //assertion( If(0 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(1 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(2 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(4 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(5 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(6 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(32 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) & If(8 != Concat(Concat(Concat(or1200_cpu_or1200_genpc_du_flush_pipe, or1200_cpu_or1200_genpc_spr_pc_we), or1200_cpu_or1200_genpc_except_start), or1200_cpu_or1200_genpc_branch_op) == True, 1, 0) = True) 1834
                    or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_spr_dat_i;  //assertion( or1200_cpu_or1200_genpc_pc = or1200_cpu_or1200_genpc_spr_dat_i) 1835
                    or1200_cpu_or1200_genpc_ex_branch_taken = 1'b0;  //assertion( or1200_cpu_or1200_genpc_ex_branch_taken = 0) 1836
                end
            endcase
        end

    //Following code is from line 3470
        always @(posedge or1200_cpu_or1200_genpc_rst or posedge or1200_cpu_or1200_genpc_clk) begin
            if ((or1200_cpu_or1200_genpc_rst == 1'b1))
                begin
                    coverage0[1837] = 1;  //assertion( 1 == or1200_cpu_or1200_genpc_rst = True) 1837
                    or1200_cpu_or1200_genpc_pcreg_default <= 30'h0000003c;  //assertion( or1200_cpu_or1200_genpc_pcreg_default = 60) 1839
                    or1200_cpu_or1200_genpc_pcreg_select <= 1'b1;  //assertion( or1200_cpu_or1200_genpc_pcreg_select = 1) 1840
                end
            else
                begin
                    coverage0[1838] = 1;  //assertion( 1 == or1200_cpu_or1200_genpc_rst = False) 1838
                    if (or1200_cpu_or1200_genpc_pcreg_select)
                        begin
                            coverage0[1841] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_pcreg_select = True) 1841
                            or1200_cpu_or1200_genpc_pcreg_default <= or1200_cpu_or1200_genpc_pcreg_boot[31:2];  //assertion( or1200_cpu_or1200_genpc_pcreg_default = Extract(31, 2, or1200_cpu_or1200_genpc_pcreg_boot)) 1843
                            or1200_cpu_or1200_genpc_pcreg_select <= 1'b0;  //assertion( or1200_cpu_or1200_genpc_pcreg_select = 0) 1844
                        end
                    else
                        begin
                            coverage0[1842] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_pcreg_select = False) 1842
                            if (or1200_cpu_or1200_genpc_spr_pc_we)
                                begin
                                    coverage0[1845] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_spr_pc_we = True) 1845
                                    or1200_cpu_or1200_genpc_pcreg_default <= or1200_cpu_or1200_genpc_spr_dat_i[31:2];  //assertion( or1200_cpu_or1200_genpc_pcreg_default = Extract(31, 2, or1200_cpu_or1200_genpc_spr_dat_i)) 1847
                                end
                            else
                                begin
                                    coverage0[1846] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_spr_pc_we = False) 1846
                                    if ((((or1200_cpu_or1200_genpc_du_flush_pipe | or1200_cpu_or1200_genpc_no_more_dslot) | or1200_cpu_or1200_genpc_except_start) | (((~or1200_cpu_or1200_genpc_genpc_freeze) & (~or1200_cpu_or1200_genpc_icpu_rty_i)) & (~or1200_cpu_or1200_genpc_genpc_refetch))))
                                        begin
                                            coverage0[1848] = 1;  //assertion( or1200_cpu_or1200_genpc_du_flush_pipe | or1200_cpu_or1200_genpc_no_more_dslot | or1200_cpu_or1200_genpc_except_start | If(Not(or1200_cpu_or1200_genpc_genpc_freeze == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_genpc_icpu_rty_i == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_genpc_genpc_refetch == 1) == True, 1, 0) = True) 1848
                                            or1200_cpu_or1200_genpc_pcreg_default <= or1200_cpu_or1200_genpc_pc[31:2];  //assertion( or1200_cpu_or1200_genpc_pcreg_default = Extract(31, 2, or1200_cpu_or1200_genpc_pc)) 1850
                                        end
                                    else
                                            coverage0[1849] = 1;  //assertion( or1200_cpu_or1200_genpc_du_flush_pipe | or1200_cpu_or1200_genpc_no_more_dslot | or1200_cpu_or1200_genpc_except_start | If(Not(or1200_cpu_or1200_genpc_genpc_freeze == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_genpc_icpu_rty_i == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_genpc_genpc_refetch == 1) == True, 1, 0) = False) 1849
                                end
                        end
                end
        end

    //Following code is from line 3481
        always @(or1200_cpu_or1200_genpc_pcreg_select or or1200_cpu_or1200_genpc_pcreg_default or or1200_cpu_or1200_genpc_pcreg_boot) begin
            if (or1200_cpu_or1200_genpc_pcreg_select)
                begin
                    coverage0[1851] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_pcreg_select = True) 1851
                    or1200_cpu_or1200_genpc_pcreg = or1200_cpu_or1200_genpc_pcreg_boot[31:2];  //assertion( or1200_cpu_or1200_genpc_pcreg = Extract(31, 2, or1200_cpu_or1200_genpc_pcreg_boot)) 1853
                end
            else
                begin
                    coverage0[1852] = 1;  //assertion( 0 != or1200_cpu_or1200_genpc_pcreg_select = False) 1852
                    or1200_cpu_or1200_genpc_pcreg = or1200_cpu_or1200_genpc_pcreg_default;  //assertion( or1200_cpu_or1200_genpc_pcreg = or1200_cpu_or1200_genpc_pcreg_default) 1854
                end
        end

    //Following code is from line 3484
        always @(posedge or1200_cpu_or1200_if_rst or posedge or1200_cpu_or1200_if_clk) begin
            if ((or1200_cpu_or1200_if_rst == 1'b1))
                begin
                    coverage0[1855] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = True) 1855
                    or1200_cpu_or1200_if_if_bypass_reg <= 1'b0;  //assertion( or1200_cpu_or1200_if_if_bypass_reg = 0) 1857
                end
            else
                begin
                    coverage0[1856] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = False) 1856
                    or1200_cpu_or1200_if_if_bypass_reg <= or1200_cpu_or1200_if_if_bypass;  //assertion( or1200_cpu_or1200_if_if_bypass_reg = or1200_cpu_or1200_if_if_bypass) 1858
                end
        end

    //Following code is from line 3487
        always @(posedge or1200_cpu_or1200_if_rst or posedge or1200_cpu_or1200_if_clk) begin
            if ((or1200_cpu_or1200_if_rst == 1'b1))
                begin
                    coverage0[1859] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = True) 1859
                    or1200_cpu_or1200_if_saved <= 1'b0;  //assertion( or1200_cpu_or1200_if_saved = 0) 1861
                end
            else
                begin
                    coverage0[1860] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = False) 1860
                    if (or1200_cpu_or1200_if_if_flushpipe)
                        begin
                            coverage0[1862] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = True) 1862
                            or1200_cpu_or1200_if_saved <= 1'b0;  //assertion( or1200_cpu_or1200_if_saved = 0) 1864
                        end
                    else
                        begin
                            coverage0[1863] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = False) 1863
                            if (or1200_cpu_or1200_if_save_insn)
                                begin
                                    coverage0[1865] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = True) 1865
                                    or1200_cpu_or1200_if_saved <= 1'b1;  //assertion( or1200_cpu_or1200_if_saved = 1) 1867
                                end
                            else
                                begin
                                    coverage0[1866] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = False) 1866
                                    if ((~or1200_cpu_or1200_if_if_freeze))
                                        begin
                                            coverage0[1868] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = True) 1868
                                            or1200_cpu_or1200_if_saved <= 1'b0;  //assertion( or1200_cpu_or1200_if_saved = 0) 1870
                                        end
                                    else
                                            coverage0[1869] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = False) 1869
                                end
                        end
                end
        end

    //Following code is from line 3492
        always @(posedge or1200_cpu_or1200_if_rst or posedge or1200_cpu_or1200_if_clk) begin
            if ((or1200_cpu_or1200_if_rst == 1'b1))
                begin
                    coverage0[1871] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = True) 1871
                    or1200_cpu_or1200_if_insn_saved <= 32'h14410000;  //assertion( or1200_cpu_or1200_if_insn_saved = 339804160) 1873
                end
            else
                begin
                    coverage0[1872] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = False) 1872
                    if (or1200_cpu_or1200_if_if_flushpipe)
                        begin
                            coverage0[1874] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = True) 1874
                            or1200_cpu_or1200_if_insn_saved <= 32'h14410000;  //assertion( or1200_cpu_or1200_if_insn_saved = 339804160) 1876
                        end
                    else
                        begin
                            coverage0[1875] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = False) 1875
                            if (or1200_cpu_or1200_if_save_insn)
                                begin
                                    coverage0[1877] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = True) 1877
                                    or1200_cpu_or1200_if_insn_saved <= (or1200_cpu_or1200_if_icpu_err_i ? 32'h14410000 : or1200_cpu_or1200_if_icpu_dat_i);  //assertion( or1200_cpu_or1200_if_insn_saved = If(0 != or1200_cpu_or1200_if_icpu_err_i == True, 339804160, or1200_cpu_or1200_if_icpu_dat_i)) 1879
                                end
                            else
                                begin
                                    coverage0[1878] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = False) 1878
                                    if ((~or1200_cpu_or1200_if_if_freeze))
                                        begin
                                            coverage0[1880] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = True) 1880
                                            or1200_cpu_or1200_if_insn_saved <= 32'h14410000;  //assertion( or1200_cpu_or1200_if_insn_saved = 339804160) 1882
                                        end
                                    else
                                            coverage0[1881] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = False) 1881
                                end
                        end
                end
        end

    //Following code is from line 3497
        always @(posedge or1200_cpu_or1200_if_rst or posedge or1200_cpu_or1200_if_clk) begin
            if ((or1200_cpu_or1200_if_rst == 1'b1))
                begin
                    coverage0[1883] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = True) 1883
                    or1200_cpu_or1200_if_addr_saved <= 32'h00000000;  //assertion( or1200_cpu_or1200_if_addr_saved = 0) 1885
                end
            else
                begin
                    coverage0[1884] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = False) 1884
                    if (or1200_cpu_or1200_if_if_flushpipe)
                        begin
                            coverage0[1886] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = True) 1886
                            or1200_cpu_or1200_if_addr_saved <= 32'h00000000;  //assertion( or1200_cpu_or1200_if_addr_saved = 0) 1888
                        end
                    else
                        begin
                            coverage0[1887] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = False) 1887
                            if (or1200_cpu_or1200_if_save_insn)
                                begin
                                    coverage0[1889] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = True) 1889
                                    or1200_cpu_or1200_if_addr_saved <= {or1200_cpu_or1200_if_icpu_adr_i[31:2], 2'h0};  //assertion( or1200_cpu_or1200_if_addr_saved = Concat(Extract(31, 2, or1200_cpu_or1200_if_icpu_adr_i), 0)) 1891
                                end
                            else
                                begin
                                    coverage0[1890] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = False) 1890
                                    if ((~or1200_cpu_or1200_if_if_freeze))
                                        begin
                                            coverage0[1892] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = True) 1892
                                            or1200_cpu_or1200_if_addr_saved <= {or1200_cpu_or1200_if_icpu_adr_i[31:2], 2'h0};  //assertion( or1200_cpu_or1200_if_addr_saved = Concat(Extract(31, 2, or1200_cpu_or1200_if_icpu_adr_i), 0)) 1894
                                        end
                                    else
                                            coverage0[1893] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = False) 1893
                                end
                        end
                end
        end

    //Following code is from line 3502
        always @(posedge or1200_cpu_or1200_if_rst or posedge or1200_cpu_or1200_if_clk) begin
            if ((or1200_cpu_or1200_if_rst == 1'b1))
                begin
                    coverage0[1895] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = True) 1895
                    or1200_cpu_or1200_if_err_saved <= 3'h0;  //assertion( or1200_cpu_or1200_if_err_saved = 0) 1897
                end
            else
                begin
                    coverage0[1896] = 1;  //assertion( 1 == or1200_cpu_or1200_if_rst = False) 1896
                    if (or1200_cpu_or1200_if_if_flushpipe)
                        begin
                            coverage0[1898] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = True) 1898
                            or1200_cpu_or1200_if_err_saved <= 3'h0;  //assertion( or1200_cpu_or1200_if_err_saved = 0) 1900
                        end
                    else
                        begin
                            coverage0[1899] = 1;  //assertion( 0 != or1200_cpu_or1200_if_if_flushpipe = False) 1899
                            if (or1200_cpu_or1200_if_save_insn)
                                begin
                                    coverage0[1901] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = True) 1901
                                    or1200_cpu_or1200_if_err_saved[0] <= (or1200_cpu_or1200_if_icpu_err_i & (or1200_cpu_or1200_if_icpu_tag_i == 4'hd));  //assertion( Extract(0, 0, or1200_cpu_or1200_if_err_saved) = or1200_cpu_or1200_if_icpu_err_i & If((13 == or1200_cpu_or1200_if_icpu_tag_i) == True, 1, 0)) 1903
                                    or1200_cpu_or1200_if_err_saved[1] <= (or1200_cpu_or1200_if_icpu_err_i & (or1200_cpu_or1200_if_icpu_tag_i == 4'hc));  //assertion( Extract(1, 1, or1200_cpu_or1200_if_err_saved) = or1200_cpu_or1200_if_icpu_err_i & If((12 == or1200_cpu_or1200_if_icpu_tag_i) == True, 1, 0)) 1904
                                    or1200_cpu_or1200_if_err_saved[2] <= (or1200_cpu_or1200_if_icpu_err_i & (or1200_cpu_or1200_if_icpu_tag_i == 4'hb));  //assertion( Extract(2, 2, or1200_cpu_or1200_if_err_saved) = or1200_cpu_or1200_if_icpu_err_i & If((11 == or1200_cpu_or1200_if_icpu_tag_i) == True, 1, 0)) 1905
                                end
                            else
                                begin
                                    coverage0[1902] = 1;  //assertion( 0 != or1200_cpu_or1200_if_save_insn = False) 1902
                                    if ((~or1200_cpu_or1200_if_if_freeze))
                                        begin
                                            coverage0[1906] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = True) 1906
                                            or1200_cpu_or1200_if_err_saved <= 3'h0;  //assertion( or1200_cpu_or1200_if_err_saved = 0) 1908
                                        end
                                    else
                                            coverage0[1907] = 1;  //assertion( Not(or1200_cpu_or1200_if_if_freeze == 1) = False) 1907
                                end
                        end
                end
        end

    //Following code is from line 3511
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[1909] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 1909
                    or1200_cpu_or1200_ctrl_ex_delayslot_nop <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_nop = 0) 1911
                    or1200_cpu_or1200_ctrl_ex_delayslot_dsi <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_dsi = 0) 1912
                end
            else
                begin
                    coverage0[1910] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 1910
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & (~or1200_cpu_or1200_ctrl_ex_delayslot_dsi)) & or1200_cpu_or1200_ctrl_ex_delayslot_nop))
                        begin
                            coverage0[1913] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_ctrl_ex_delayslot_dsi == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_ex_delayslot_nop = True) 1913
                            or1200_cpu_or1200_ctrl_ex_delayslot_nop <= or1200_cpu_or1200_ctrl_id_void;  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_nop = or1200_cpu_or1200_ctrl_id_void) 1915
                            or1200_cpu_or1200_ctrl_ex_delayslot_dsi <= (~or1200_cpu_or1200_ctrl_id_void);  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_dsi = Not(or1200_cpu_or1200_ctrl_id_void == 1)) 1916
                        end
                    else
                        begin
                            coverage0[1914] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_ctrl_ex_delayslot_dsi == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_ex_delayslot_nop = False) 1914
                            if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_ex_delayslot_dsi) & (~or1200_cpu_or1200_ctrl_ex_delayslot_nop)))
                                begin
                                    coverage0[1917] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_ex_delayslot_dsi & If(Not(or1200_cpu_or1200_ctrl_ex_delayslot_nop == 1) == True, 1, 0) = True) 1917
                                    or1200_cpu_or1200_ctrl_ex_delayslot_nop <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_nop = 0) 1919
                                    or1200_cpu_or1200_ctrl_ex_delayslot_dsi <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_dsi = 0) 1920
                                end
                            else
                                begin
                                    coverage0[1918] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_ex_delayslot_dsi & If(Not(or1200_cpu_or1200_ctrl_ex_delayslot_nop == 1) == True, 1, 0) = False) 1918
                                    if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                        begin
                                            coverage0[1921] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 1921
                                            or1200_cpu_or1200_ctrl_ex_delayslot_nop <= (((or1200_cpu_or1200_ctrl_id_void && or1200_cpu_or1200_ctrl_ex_branch_taken) && (or1200_cpu_or1200_ctrl_ex_branch_op != 3'h0)) && (or1200_cpu_or1200_ctrl_ex_branch_op != 3'h6));  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_nop = And(If(And(If(And(or1200_cpu_or1200_ctrl_id_void == 1, or1200_cpu_or1200_ctrl_ex_branch_taken == 1) == True, 1, 0) == 1, If(0 != or1200_cpu_or1200_ctrl_ex_branch_op == True, 1, 0) == 1) == True, 1, 0) == 1, If(6 != or1200_cpu_or1200_ctrl_ex_branch_op == True, 1, 0) == 1)) 1923
                                            or1200_cpu_or1200_ctrl_ex_delayslot_dsi <= ((((~or1200_cpu_or1200_ctrl_id_void) && or1200_cpu_or1200_ctrl_ex_branch_taken) && (or1200_cpu_or1200_ctrl_ex_branch_op != 3'h0)) && (or1200_cpu_or1200_ctrl_ex_branch_op != 3'h6));  //assertion( or1200_cpu_or1200_ctrl_ex_delayslot_dsi = And(If(And(If(And(If(Not(or1200_cpu_or1200_ctrl_id_void == 1) == True, 1, 0) == 1, or1200_cpu_or1200_ctrl_ex_branch_taken == 1) == True, 1, 0) == 1, If(0 != or1200_cpu_or1200_ctrl_ex_branch_op == True, 1, 0) == 1) == True, 1, 0) == 1, If(6 != or1200_cpu_or1200_ctrl_ex_branch_op == True, 1, 0) == 1)) 1924
                                        end
                                    else
                                            coverage0[1922] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 1922
                                end
                        end
                end
        end

    //Following code is from line 3528
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[1925] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 1925
                    or1200_cpu_or1200_ctrl_ex_simm <= 32'h00000000;  //assertion( or1200_cpu_or1200_ctrl_ex_simm = 0) 1927
                end
            else
                begin
                    coverage0[1926] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 1926
                    if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                        begin
                            coverage0[1928] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 1928
                            or1200_cpu_or1200_ctrl_ex_simm <= or1200_cpu_or1200_ctrl_id_simm;  //assertion( or1200_cpu_or1200_ctrl_ex_simm = or1200_cpu_or1200_ctrl_id_simm) 1930
                        end
                    else
                            coverage0[1929] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 1929
                end
        end

    //Following code is from line 3531
        always @(or1200_cpu_or1200_ctrl_id_insn) begin
            case (or1200_cpu_or1200_ctrl_id_insn[31:26])
              6'h27:
                begin
                    coverage0[1931] = 1;  //assertion( 39 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1931
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1932
                end
              6'h28:
                begin
                    coverage0[1933] = 1;  //assertion( 40 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1933
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1934
                end
              6'h21:
                begin
                    coverage0[1935] = 1;  //assertion( 33 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1935
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1936
                end
              6'h22:
                begin
                    coverage0[1937] = 1;  //assertion( 34 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1937
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1938
                end
              6'h23:
                begin
                    coverage0[1939] = 1;  //assertion( 35 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1939
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1940
                end
              6'h24:
                begin
                    coverage0[1941] = 1;  //assertion( 36 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1941
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1942
                end
              6'h25:
                begin
                    coverage0[1943] = 1;  //assertion( 37 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1943
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1944
                end
              6'h26:
                begin
                    coverage0[1945] = 1;  //assertion( 38 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1945
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1946
                end
              6'h2c:
                begin
                    coverage0[1947] = 1;  //assertion( 44 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1947
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1948
                end
              6'h30:
                begin
                    coverage0[1949] = 1;  //assertion( 48 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1949
                    or1200_cpu_or1200_ctrl_id_simm = {16'h0000, or1200_cpu_or1200_ctrl_id_insn[25:21], or1200_cpu_or1200_ctrl_id_insn[10:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(0, Extract(25, 21, or1200_cpu_or1200_ctrl_id_insn)), Extract(10, 0, or1200_cpu_or1200_ctrl_id_insn))) 1950
                end
              6'h35:
                begin
                    coverage0[1951] = 1;  //assertion( 53 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1951
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[25] } }, or1200_cpu_or1200_ctrl_id_insn[25:21], or1200_cpu_or1200_ctrl_id_insn[10:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 21, or1200_cpu_or1200_ctrl_id_insn)), Extract(10, 0, or1200_cpu_or1200_ctrl_id_insn))) 1952
                end
              6'h37:
                begin
                    coverage0[1953] = 1;  //assertion( 55 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1953
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[25] } }, or1200_cpu_or1200_ctrl_id_insn[25:21], or1200_cpu_or1200_ctrl_id_insn[10:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 21, or1200_cpu_or1200_ctrl_id_insn)), Extract(10, 0, or1200_cpu_or1200_ctrl_id_insn))) 1954
                end
              6'h36:
                begin
                    coverage0[1955] = 1;  //assertion( 54 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1955
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[25] } }, or1200_cpu_or1200_ctrl_id_insn[25:21], or1200_cpu_or1200_ctrl_id_insn[10:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 25, or1200_cpu_or1200_ctrl_id_insn)), Extract(25, 21, or1200_cpu_or1200_ctrl_id_insn)), Extract(10, 0, or1200_cpu_or1200_ctrl_id_insn))) 1956
                end
              6'h2b:
                begin
                    coverage0[1957] = 1;  //assertion( 43 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1957
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1958
                end
              6'h2f:
                begin
                    coverage0[1959] = 1;  //assertion( 47 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1959
                    or1200_cpu_or1200_ctrl_id_simm = {{ 16{ or1200_cpu_or1200_ctrl_id_insn[15] } }, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 15, or1200_cpu_or1200_ctrl_id_insn)), Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1960
                end
              default:
                begin
                    coverage0[1961] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 1961
                    or1200_cpu_or1200_ctrl_id_simm = {16'h0000, or1200_cpu_or1200_ctrl_id_insn[15:0]};  //assertion( or1200_cpu_or1200_ctrl_id_simm = Concat(0, Extract(15, 0, or1200_cpu_or1200_ctrl_id_insn))) 1962
                end
            endcase
        end

    //Following code is from line 3550
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[1963] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 1963
                    or1200_cpu_or1200_ctrl_ex_branch_addrtarget <= 0;  //assertion( or1200_cpu_or1200_ctrl_ex_branch_addrtarget = 0) 1965
                end
            else
                begin
                    coverage0[1964] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 1964
                    if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                        begin
                            coverage0[1966] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 1966
                            or1200_cpu_or1200_ctrl_ex_branch_addrtarget <= or1200_cpu_or1200_ctrl_id_branch_addrtarget;  //assertion( or1200_cpu_or1200_ctrl_ex_branch_addrtarget = or1200_cpu_or1200_ctrl_id_branch_addrtarget) 1968
                        end
                    else
                            coverage0[1967] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 1967
                end
        end

    //Following code is from line 3553
        always @(or1200_cpu_or1200_ctrl_wb_rfaddrw or or1200_cpu_or1200_ctrl_wbforw_valid or or1200_cpu_or1200_ctrl_rfwb_op or or1200_cpu_or1200_ctrl_id_insn or or1200_cpu_or1200_ctrl_rf_addrw) begin
            if (((or1200_cpu_or1200_ctrl_id_insn[20:16] == or1200_cpu_or1200_ctrl_rf_addrw) && or1200_cpu_or1200_ctrl_rfwb_op[0]))
                begin
                    coverage0[1969] = 1;  //assertion( And(If((Extract(20, 16, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_rf_addrw) == True, 1, 0) == 1, Extract(0, 0, or1200_cpu_or1200_ctrl_rfwb_op) == 1) = True) 1969
                    or1200_cpu_or1200_ctrl_sel_a = 2'h2;  //assertion( or1200_cpu_or1200_ctrl_sel_a = 2) 1971
                end
            else
                begin
                    coverage0[1970] = 1;  //assertion( And(If((Extract(20, 16, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_rf_addrw) == True, 1, 0) == 1, Extract(0, 0, or1200_cpu_or1200_ctrl_rfwb_op) == 1) = False) 1970
                    if (((or1200_cpu_or1200_ctrl_id_insn[20:16] == or1200_cpu_or1200_ctrl_wb_rfaddrw) && or1200_cpu_or1200_ctrl_wbforw_valid))
                        begin
                            coverage0[1972] = 1;  //assertion( And(If((Extract(20, 16, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_wb_rfaddrw) == True, 1, 0) == 1, or1200_cpu_or1200_ctrl_wbforw_valid == 1) = True) 1972
                            or1200_cpu_or1200_ctrl_sel_a = 2'h3;  //assertion( or1200_cpu_or1200_ctrl_sel_a = 3) 1974
                        end
                    else
                        begin
                            coverage0[1973] = 1;  //assertion( And(If((Extract(20, 16, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_wb_rfaddrw) == True, 1, 0) == 1, or1200_cpu_or1200_ctrl_wbforw_valid == 1) = False) 1973
                            or1200_cpu_or1200_ctrl_sel_a = 2'h0;  //assertion( or1200_cpu_or1200_ctrl_sel_a = 0) 1975
                        end
                end
        end

    //Following code is from line 3557
        always @(or1200_cpu_or1200_ctrl_wb_rfaddrw or or1200_cpu_or1200_ctrl_wbforw_valid or or1200_cpu_or1200_ctrl_rfwb_op or or1200_cpu_or1200_ctrl_id_insn or or1200_cpu_or1200_ctrl_sel_imm or or1200_cpu_or1200_ctrl_rf_addrw) begin
            if (or1200_cpu_or1200_ctrl_sel_imm)
                begin
                    coverage0[1976] = 1;  //assertion( 0 != or1200_cpu_or1200_ctrl_sel_imm = True) 1976
                    or1200_cpu_or1200_ctrl_sel_b = 2'h1;  //assertion( or1200_cpu_or1200_ctrl_sel_b = 1) 1978
                end
            else
                begin
                    coverage0[1977] = 1;  //assertion( 0 != or1200_cpu_or1200_ctrl_sel_imm = False) 1977
                    if (((or1200_cpu_or1200_ctrl_id_insn[15:11] == or1200_cpu_or1200_ctrl_rf_addrw) && or1200_cpu_or1200_ctrl_rfwb_op[0]))
                        begin
                            coverage0[1979] = 1;  //assertion( And(If((Extract(15, 11, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_rf_addrw) == True, 1, 0) == 1, Extract(0, 0, or1200_cpu_or1200_ctrl_rfwb_op) == 1) = True) 1979
                            or1200_cpu_or1200_ctrl_sel_b = 2'h2;  //assertion( or1200_cpu_or1200_ctrl_sel_b = 2) 1981
                        end
                    else
                        begin
                            coverage0[1980] = 1;  //assertion( And(If((Extract(15, 11, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_rf_addrw) == True, 1, 0) == 1, Extract(0, 0, or1200_cpu_or1200_ctrl_rfwb_op) == 1) = False) 1980
                            if (((or1200_cpu_or1200_ctrl_id_insn[15:11] == or1200_cpu_or1200_ctrl_wb_rfaddrw) && or1200_cpu_or1200_ctrl_wbforw_valid))
                                begin
                                    coverage0[1982] = 1;  //assertion( And(If((Extract(15, 11, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_wb_rfaddrw) == True, 1, 0) == 1, or1200_cpu_or1200_ctrl_wbforw_valid == 1) = True) 1982
                                    or1200_cpu_or1200_ctrl_sel_b = 2'h3;  //assertion( or1200_cpu_or1200_ctrl_sel_b = 3) 1984
                                end
                            else
                                begin
                                    coverage0[1983] = 1;  //assertion( And(If((Extract(15, 11, or1200_cpu_or1200_ctrl_id_insn) == or1200_cpu_or1200_ctrl_wb_rfaddrw) == True, 1, 0) == 1, or1200_cpu_or1200_ctrl_wbforw_valid == 1) = False) 1983
                                    or1200_cpu_or1200_ctrl_sel_b = 2'h0;  //assertion( or1200_cpu_or1200_ctrl_sel_b = 0) 1985
                                end
                        end
                end
        end

    //Following code is from line 3562
        always @(or1200_cpu_or1200_ctrl_id_insn) begin
            case (or1200_cpu_or1200_ctrl_id_insn[31:26])
              6'h09:
                begin
                    coverage0[1986] = 1;  //assertion( 9 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1986
                    or1200_cpu_or1200_ctrl_multicycle = 3'h1;  //assertion( or1200_cpu_or1200_ctrl_multicycle = 1) 1987
                end
              6'h2d:
                begin
                    coverage0[1988] = 1;  //assertion( 45 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1988
                    or1200_cpu_or1200_ctrl_multicycle = 3'h1;  //assertion( or1200_cpu_or1200_ctrl_multicycle = 1) 1989
                end
              default:
                begin
                    coverage0[1990] = 1;  //assertion( If(9 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(45 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) = True) 1990
                    or1200_cpu_or1200_ctrl_multicycle = 3'h0;  //assertion( or1200_cpu_or1200_ctrl_multicycle = 0) 1991
                end
            endcase
        end

    //Following code is from line 3568
        always @(or1200_cpu_or1200_ctrl_id_insn) begin
            case (or1200_cpu_or1200_ctrl_id_insn[31:26])
              6'h38:
                begin
                    coverage0[1992] = 1;  //assertion( 56 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1992
                    or1200_cpu_or1200_ctrl_wait_on = (((((1'b0 | (or1200_cpu_or1200_ctrl_id_insn[4:0] == 5'h09)) | (or1200_cpu_or1200_ctrl_id_insn[4:0] == 5'h0a)) | (or1200_cpu_or1200_ctrl_id_insn[4:0] == 5'h06)) | (or1200_cpu_or1200_ctrl_id_insn[4:0] == 5'h0b)) ? 2'h1 : 2'h0);  //assertion( or1200_cpu_or1200_ctrl_wait_on = If((1 == 0 | If((9 == Extract(4, 0, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0) | If((10 == Extract(4, 0, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0) | If((6 == Extract(4, 0, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0) | If((11 == Extract(4, 0, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0)) == True, 1, 0)) 1993
                end
              6'h2c:
                begin
                    coverage0[1994] = 1;  //assertion( 44 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1994
                    or1200_cpu_or1200_ctrl_wait_on = 2'h1;  //assertion( or1200_cpu_or1200_ctrl_wait_on = 1) 1995
                end
              6'h30:
                begin
                    coverage0[1996] = 1;  //assertion( 48 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 1996
                    or1200_cpu_or1200_ctrl_wait_on = 2'h3;  //assertion( or1200_cpu_or1200_ctrl_wait_on = 3) 1997
                end
              default:
                begin
                    coverage0[1998] = 1;  //assertion( If(56 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(44 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(48 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) = True) 1998
                    or1200_cpu_or1200_ctrl_wait_on = 2'h0;  //assertion( or1200_cpu_or1200_ctrl_wait_on = 0) 1999
                end
            endcase
        end

    //Following code is from line 3575
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2000] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2000
                    or1200_cpu_or1200_ctrl_rf_addrw <= 5'h00;  //assertion( or1200_cpu_or1200_ctrl_rf_addrw = 0) 2002
                end
            else
                begin
                    coverage0[2001] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2001
                    if (((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze))
                        begin
                            coverage0[2003] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze = True) 2003
                            or1200_cpu_or1200_ctrl_rf_addrw <= 5'h00;  //assertion( or1200_cpu_or1200_ctrl_rf_addrw = 0) 2005
                        end
                    else
                        begin
                            coverage0[2004] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze = False) 2004
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2006] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2006
                                    case (or1200_cpu_or1200_ctrl_id_insn[31:26])
                                      6'h01:
                                        begin
                                            coverage0[2008] = 1;  //assertion( 1 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2008
                                            or1200_cpu_or1200_ctrl_rf_addrw <= 5'h09;  //assertion( or1200_cpu_or1200_ctrl_rf_addrw = 9) 2009
                                        end
                                      6'h12:
                                        begin
                                            coverage0[2010] = 1;  //assertion( 18 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2010
                                            or1200_cpu_or1200_ctrl_rf_addrw <= 5'h09;  //assertion( or1200_cpu_or1200_ctrl_rf_addrw = 9) 2011
                                        end
                                      default:
                                        begin
                                            coverage0[2012] = 1;  //assertion( If(1 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(18 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) = True) 2012
                                            or1200_cpu_or1200_ctrl_rf_addrw <= or1200_cpu_or1200_ctrl_id_insn[25:21];  //assertion( or1200_cpu_or1200_ctrl_rf_addrw = Extract(25, 21, or1200_cpu_or1200_ctrl_id_insn)) 2013
                                        end
                                    endcase
                                end
                            else
                                    coverage0[2007] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2007
                        end
                end
        end

    //Following code is from line 3583
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2014] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2014
                    or1200_cpu_or1200_ctrl_wb_rfaddrw <= 5'h00;  //assertion( or1200_cpu_or1200_ctrl_wb_rfaddrw = 0) 2016
                end
            else
                begin
                    coverage0[2015] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2015
                    if ((~or1200_cpu_or1200_ctrl_wb_freeze))
                        begin
                            coverage0[2017] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_wb_freeze == 1) = True) 2017
                            or1200_cpu_or1200_ctrl_wb_rfaddrw <= or1200_cpu_or1200_ctrl_rf_addrw;  //assertion( or1200_cpu_or1200_ctrl_wb_rfaddrw = or1200_cpu_or1200_ctrl_rf_addrw) 2019
                        end
                    else
                            coverage0[2018] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_wb_freeze == 1) = False) 2018
                end
        end

    //Following code is from line 3586
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2020] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2020
                    or1200_cpu_or1200_ctrl_id_insn <= 32'h14410000;  //assertion( or1200_cpu_or1200_ctrl_id_insn = 339804160) 2022
                end
            else
                begin
                    coverage0[2021] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2021
                    if (or1200_cpu_or1200_ctrl_id_flushpipe)
                        begin
                            coverage0[2023] = 1;  //assertion( 0 != or1200_cpu_or1200_ctrl_id_flushpipe = True) 2023
                            or1200_cpu_or1200_ctrl_id_insn <= 32'h14410000;  //assertion( or1200_cpu_or1200_ctrl_id_insn = 339804160) 2025
                        end
                    else
                        begin
                            coverage0[2024] = 1;  //assertion( 0 != or1200_cpu_or1200_ctrl_id_flushpipe = False) 2024
                            if ((~or1200_cpu_or1200_ctrl_id_freeze))
                                begin
                                    coverage0[2026] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_id_freeze == 1) = True) 2026
                                    or1200_cpu_or1200_ctrl_id_insn <= or1200_cpu_or1200_ctrl_if_insn;  //assertion( or1200_cpu_or1200_ctrl_id_insn = or1200_cpu_or1200_ctrl_if_insn) 2028
                                end
                            else
                                    coverage0[2027] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_id_freeze == 1) = False) 2027
                        end
                end
        end

    //Following code is from line 3590
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2029] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2029
                    or1200_cpu_or1200_ctrl_ex_insn <= 32'h14410000;  //assertion( or1200_cpu_or1200_ctrl_ex_insn = 339804160) 2031
                end
            else
                begin
                    coverage0[2030] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2030
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2032] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2032
                            or1200_cpu_or1200_ctrl_ex_insn <= 32'h14410000;  //assertion( or1200_cpu_or1200_ctrl_ex_insn = 339804160) 2034
                        end
                    else
                        begin
                            coverage0[2033] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2033
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2035] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2035
                                    or1200_cpu_or1200_ctrl_ex_insn <= or1200_cpu_or1200_ctrl_id_insn;  //assertion( or1200_cpu_or1200_ctrl_ex_insn = or1200_cpu_or1200_ctrl_id_insn) 2037
                                end
                            else
                                    coverage0[2036] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2036
                        end
                end
        end

    //Following code is from line 3594
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2038] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2038
                    or1200_cpu_or1200_ctrl_wb_insn <= 32'h14410000;  //assertion( or1200_cpu_or1200_ctrl_wb_insn = 339804160) 2040
                end
            else
                begin
                    coverage0[2039] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2039
                    if ((~or1200_cpu_or1200_ctrl_wb_freeze))
                        begin
                            coverage0[2041] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_wb_freeze == 1) = True) 2041
                            or1200_cpu_or1200_ctrl_wb_insn <= or1200_cpu_or1200_ctrl_ex_insn;  //assertion( or1200_cpu_or1200_ctrl_wb_insn = or1200_cpu_or1200_ctrl_ex_insn) 2043
                        end
                    else
                            coverage0[2042] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_wb_freeze == 1) = False) 2042
                end
        end

    //Following code is from line 3597
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2044] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2044
                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2046
                end
            else
                begin
                    coverage0[2045] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2045
                    if ((~or1200_cpu_or1200_ctrl_id_freeze))
                        begin
                            coverage0[2047] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_id_freeze == 1) = True) 2047
                            case (or1200_cpu_or1200_ctrl_if_insn[31:26])
                              6'h12:
                                begin
                                    coverage0[2049] = 1;  //assertion( 18 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2049
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2050
                                end
                              6'h11:
                                begin
                                    coverage0[2051] = 1;  //assertion( 17 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2051
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2052
                                end
                              6'h09:
                                begin
                                    coverage0[2053] = 1;  //assertion( 9 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2053
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2054
                                end
                              6'h2d:
                                begin
                                    coverage0[2055] = 1;  //assertion( 45 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2055
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2056
                                end
                              6'h30:
                                begin
                                    coverage0[2057] = 1;  //assertion( 48 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2057
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2058
                                end
                              6'h08:
                                begin
                                    coverage0[2059] = 1;  //assertion( 8 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2059
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2060
                                end
                              6'h35:
                                begin
                                    coverage0[2061] = 1;  //assertion( 53 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2061
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2062
                                end
                              6'h36:
                                begin
                                    coverage0[2063] = 1;  //assertion( 54 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2063
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2064
                                end
                              6'h37:
                                begin
                                    coverage0[2065] = 1;  //assertion( 55 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2065
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2066
                                end
                              6'h38:
                                begin
                                    coverage0[2067] = 1;  //assertion( 56 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2067
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2068
                                end
                              6'h39:
                                begin
                                    coverage0[2069] = 1;  //assertion( 57 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2069
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2070
                                end
                              6'h05:
                                begin
                                    coverage0[2071] = 1;  //assertion( 5 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2071
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 0) 2072
                                end
                              default:
                                begin
                                    coverage0[2073] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 2073
                                    or1200_cpu_or1200_ctrl_sel_imm <= 1'b1;  //assertion( or1200_cpu_or1200_ctrl_sel_imm = 1) 2074
                                end
                            endcase
                        end
                    else
                            coverage0[2048] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_id_freeze == 1) = False) 2048
                end
        end

    //Following code is from line 3614
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2075] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2075
                    or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2077
                end
            else
                begin
                    coverage0[2076] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2076
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2078] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2078
                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2080
                        end
                    else
                        begin
                            coverage0[2079] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2079
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2081] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2081
                                    case (or1200_cpu_or1200_ctrl_id_insn[31:26])
                                      6'h00:
                                        begin
                                            coverage0[2083] = 1;  //assertion( 0 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2083
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2084
                                        end
                                      6'h01:
                                        begin
                                            coverage0[2085] = 1;  //assertion( 1 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2085
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2086
                                        end
                                      6'h12:
                                        begin
                                            coverage0[2087] = 1;  //assertion( 18 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2087
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2088
                                        end
                                      6'h11:
                                        begin
                                            coverage0[2089] = 1;  //assertion( 17 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2089
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2090
                                        end
                                      6'h03:
                                        begin
                                            coverage0[2091] = 1;  //assertion( 3 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2091
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2092
                                        end
                                      6'h04:
                                        begin
                                            coverage0[2093] = 1;  //assertion( 4 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2093
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2094
                                        end
                                      6'h09:
                                        begin
                                            coverage0[2095] = 1;  //assertion( 9 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2095
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2096
                                        end
                                      6'h06:
                                        begin
                                            coverage0[2097] = 1;  //assertion( 6 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2097
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2098
                                        end
                                      6'h2d:
                                        begin
                                            coverage0[2099] = 1;  //assertion( 45 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2099
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2100
                                        end
                                      6'h08:
                                        begin
                                            coverage0[2101] = 1;  //assertion( 8 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2101
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2102
                                        end
                                      6'h21:
                                        begin
                                            coverage0[2103] = 1;  //assertion( 33 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2103
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2104
                                        end
                                      6'h22:
                                        begin
                                            coverage0[2105] = 1;  //assertion( 34 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2105
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2106
                                        end
                                      6'h23:
                                        begin
                                            coverage0[2107] = 1;  //assertion( 35 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2107
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2108
                                        end
                                      6'h24:
                                        begin
                                            coverage0[2109] = 1;  //assertion( 36 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2109
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2110
                                        end
                                      6'h25:
                                        begin
                                            coverage0[2111] = 1;  //assertion( 37 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2111
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2112
                                        end
                                      6'h26:
                                        begin
                                            coverage0[2113] = 1;  //assertion( 38 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2113
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2114
                                        end
                                      6'h27:
                                        begin
                                            coverage0[2115] = 1;  //assertion( 39 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2115
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2116
                                        end
                                      6'h28:
                                        begin
                                            coverage0[2117] = 1;  //assertion( 40 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2117
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2118
                                        end
                                      6'h29:
                                        begin
                                            coverage0[2119] = 1;  //assertion( 41 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2119
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2120
                                        end
                                      6'h2a:
                                        begin
                                            coverage0[2121] = 1;  //assertion( 42 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2121
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2122
                                        end
                                      6'h2b:
                                        begin
                                            coverage0[2123] = 1;  //assertion( 43 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2123
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2124
                                        end
                                      6'h2c:
                                        begin
                                            coverage0[2125] = 1;  //assertion( 44 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2125
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2126
                                        end
                                      6'h2f:
                                        begin
                                            coverage0[2127] = 1;  //assertion( 47 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2127
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2128
                                        end
                                      6'h30:
                                        begin
                                            coverage0[2129] = 1;  //assertion( 48 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2129
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2130
                                        end
                                      6'h35:
                                        begin
                                            coverage0[2131] = 1;  //assertion( 53 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2131
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2132
                                        end
                                      6'h36:
                                        begin
                                            coverage0[2133] = 1;  //assertion( 54 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2133
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2134
                                        end
                                      6'h37:
                                        begin
                                            coverage0[2135] = 1;  //assertion( 55 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2135
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2136
                                        end
                                      6'h39:
                                        begin
                                            coverage0[2137] = 1;  //assertion( 57 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2137
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2138
                                        end
                                      6'h05:
                                        begin
                                            coverage0[2139] = 1;  //assertion( 5 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2139
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0) 2140
                                        end
                                      6'h38:
                                        begin
                                            coverage0[2141] = 1;  //assertion( 56 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2141
                                            or1200_cpu_or1200_ctrl_except_illegal <= (1'b0 | ((or1200_cpu_or1200_ctrl_id_insn[4:0] == 5'h08) & (or1200_cpu_or1200_ctrl_id_insn[9:6] == 4'h3)));  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 0 | If((8 == Extract(4, 0, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0) & If((3 == Extract(9, 6, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0)) 2142
                                        end
                                      default:
                                        begin
                                            coverage0[2143] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 2143
                                            or1200_cpu_or1200_ctrl_except_illegal <= 1'b1;  //assertion( or1200_cpu_or1200_ctrl_except_illegal = 1) 2144
                                        end
                                    endcase
                                end
                            else
                                    coverage0[2082] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2082
                        end
                end
        end

    //Following code is from line 3650
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2145] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2145
                    or1200_cpu_or1200_ctrl_alu_op <= 5'h04;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 4) 2147
                end
            else
                begin
                    coverage0[2146] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2146
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2148] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2148
                            or1200_cpu_or1200_ctrl_alu_op <= 5'h04;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 4) 2150
                        end
                    else
                        begin
                            coverage0[2149] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2149
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2151] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2151
                                    case (or1200_cpu_or1200_ctrl_id_insn[31:26])
                                      6'h06:
                                        begin
                                            coverage0[2153] = 1;  //assertion( 6 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2153
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h11;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 17) 2154
                                        end
                                      6'h27:
                                        begin
                                            coverage0[2155] = 1;  //assertion( 39 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2155
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h00;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 0) 2156
                                        end
                                      6'h28:
                                        begin
                                            coverage0[2157] = 1;  //assertion( 40 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2157
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h01;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 1) 2158
                                        end
                                      6'h29:
                                        begin
                                            coverage0[2159] = 1;  //assertion( 41 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2159
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h03;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 3) 2160
                                        end
                                      6'h2a:
                                        begin
                                            coverage0[2161] = 1;  //assertion( 42 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2161
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h04;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 4) 2162
                                        end
                                      6'h2b:
                                        begin
                                            coverage0[2163] = 1;  //assertion( 43 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2163
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h05;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 5) 2164
                                        end
                                      6'h2c:
                                        begin
                                            coverage0[2165] = 1;  //assertion( 44 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2165
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h06;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 6) 2166
                                        end
                                      6'h2f:
                                        begin
                                            coverage0[2167] = 1;  //assertion( 47 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2167
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h10;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 16) 2168
                                        end
                                      6'h38:
                                        begin
                                            coverage0[2169] = 1;  //assertion( 56 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2169
                                            or1200_cpu_or1200_ctrl_alu_op <= {1'b0, or1200_cpu_or1200_ctrl_id_insn[3:0]};  //assertion( or1200_cpu_or1200_ctrl_alu_op = Concat(0, Extract(3, 0, or1200_cpu_or1200_ctrl_id_insn))) 2170
                                        end
                                      6'h39:
                                        begin
                                            coverage0[2171] = 1;  //assertion( 57 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2171
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h10;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 16) 2172
                                        end
                                      default:
                                        begin
                                            coverage0[2173] = 1;  //assertion( If(6 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(39 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(40 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(41 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(42 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(43 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(44 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(47 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(56 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(57 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) = True) 2173
                                            or1200_cpu_or1200_ctrl_alu_op <= 5'h04;  //assertion( or1200_cpu_or1200_ctrl_alu_op = 4) 2174
                                        end
                                    endcase
                                end
                            else
                                    coverage0[2152] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2152
                        end
                end
        end

    //Following code is from line 3666
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2175] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2175
                    or1200_cpu_or1200_ctrl_alu_op2 <= 0;  //assertion( or1200_cpu_or1200_ctrl_alu_op2 = 0) 2177
                end
            else
                begin
                    coverage0[2176] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2176
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2178] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2178
                            or1200_cpu_or1200_ctrl_alu_op2 <= 0;  //assertion( or1200_cpu_or1200_ctrl_alu_op2 = 0) 2180
                        end
                    else
                        begin
                            coverage0[2179] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2179
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2181] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2181
                                    or1200_cpu_or1200_ctrl_alu_op2 <= or1200_cpu_or1200_ctrl_id_insn[9:6];  //assertion( or1200_cpu_or1200_ctrl_alu_op2 = Extract(9, 6, or1200_cpu_or1200_ctrl_id_insn)) 2183
                                end
                            else
                                    coverage0[2182] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2182
                        end
                end
        end

    //Following code is from line 3670
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2184] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2184
                    or1200_cpu_or1200_ctrl_spr_read <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_read = 0) 2186
                    or1200_cpu_or1200_ctrl_spr_write <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_write = 0) 2187
                end
            else
                begin
                    coverage0[2185] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2185
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2188] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2188
                            or1200_cpu_or1200_ctrl_spr_read <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_read = 0) 2190
                            or1200_cpu_or1200_ctrl_spr_write <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_write = 0) 2191
                        end
                    else
                        begin
                            coverage0[2189] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2189
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2192] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2192
                                    case (or1200_cpu_or1200_ctrl_id_insn[31:26])
                                      6'h2d:
                                        begin
                                            coverage0[2194] = 1;  //assertion( 45 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2194
                                            or1200_cpu_or1200_ctrl_spr_read <= 1'b1;  //assertion( or1200_cpu_or1200_ctrl_spr_read = 1) 2195
                                            or1200_cpu_or1200_ctrl_spr_write <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_write = 0) 2196
                                        end
                                      6'h30:
                                        begin
                                            coverage0[2197] = 1;  //assertion( 48 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2197
                                            or1200_cpu_or1200_ctrl_spr_read <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_read = 0) 2198
                                            or1200_cpu_or1200_ctrl_spr_write <= 1'b1;  //assertion( or1200_cpu_or1200_ctrl_spr_write = 1) 2199
                                        end
                                      default:
                                        begin
                                            coverage0[2200] = 1;  //assertion( If(45 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(48 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) = True) 2200
                                            or1200_cpu_or1200_ctrl_spr_read <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_read = 0) 2201
                                            or1200_cpu_or1200_ctrl_spr_write <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_spr_write = 0) 2202
                                        end
                                    endcase
                                end
                            else
                                    coverage0[2193] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2193
                        end
                end
        end

    //Following code is from line 3693
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2203] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2203
                    or1200_cpu_or1200_ctrl_rfwb_op <= 4'h0;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 0) 2205
                end
            else
                begin
                    coverage0[2204] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2204
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2206] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2206
                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h0;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 0) 2208
                        end
                    else
                        begin
                            coverage0[2207] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2207
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2209] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2209
                                    case (or1200_cpu_or1200_ctrl_id_insn[31:26])
                                      6'h01:
                                        begin
                                            coverage0[2211] = 1;  //assertion( 1 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2211
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h7;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 7) 2212
                                        end
                                      6'h12:
                                        begin
                                            coverage0[2213] = 1;  //assertion( 18 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2213
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h7;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 7) 2214
                                        end
                                      6'h06:
                                        begin
                                            coverage0[2215] = 1;  //assertion( 6 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2215
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2216
                                        end
                                      6'h2d:
                                        begin
                                            coverage0[2217] = 1;  //assertion( 45 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2217
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h5;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 5) 2218
                                        end
                                      6'h21:
                                        begin
                                            coverage0[2219] = 1;  //assertion( 33 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2219
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h3;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 3) 2220
                                        end
                                      6'h22:
                                        begin
                                            coverage0[2221] = 1;  //assertion( 34 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2221
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h3;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 3) 2222
                                        end
                                      6'h23:
                                        begin
                                            coverage0[2223] = 1;  //assertion( 35 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2223
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h3;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 3) 2224
                                        end
                                      6'h24:
                                        begin
                                            coverage0[2225] = 1;  //assertion( 36 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2225
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h3;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 3) 2226
                                        end
                                      6'h25:
                                        begin
                                            coverage0[2227] = 1;  //assertion( 37 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2227
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h3;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 3) 2228
                                        end
                                      6'h26:
                                        begin
                                            coverage0[2229] = 1;  //assertion( 38 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2229
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h3;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 3) 2230
                                        end
                                      6'h27:
                                        begin
                                            coverage0[2231] = 1;  //assertion( 39 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2231
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2232
                                        end
                                      6'h28:
                                        begin
                                            coverage0[2233] = 1;  //assertion( 40 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2233
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2234
                                        end
                                      6'h29:
                                        begin
                                            coverage0[2235] = 1;  //assertion( 41 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2235
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2236
                                        end
                                      6'h2a:
                                        begin
                                            coverage0[2237] = 1;  //assertion( 42 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2237
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2238
                                        end
                                      6'h2b:
                                        begin
                                            coverage0[2239] = 1;  //assertion( 43 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2239
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2240
                                        end
                                      6'h2c:
                                        begin
                                            coverage0[2241] = 1;  //assertion( 44 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2241
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2242
                                        end
                                      6'h38:
                                        begin
                                            coverage0[2243] = 1;  //assertion( 56 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2243
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h1;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 1) 2244
                                        end
                                      default:
                                        begin
                                            coverage0[2245] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 2245
                                            or1200_cpu_or1200_ctrl_rfwb_op <= 4'h0;  //assertion( or1200_cpu_or1200_ctrl_rfwb_op = 0) 2246
                                        end
                                    endcase
                                end
                            else
                                    coverage0[2210] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2210
                        end
                end
        end

    //Following code is from line 3716
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2247] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2247
                    or1200_cpu_or1200_ctrl_id_branch_op <= 3'h0;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 0) 2249
                end
            else
                begin
                    coverage0[2248] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2248
                    if (or1200_cpu_or1200_ctrl_id_flushpipe)
                        begin
                            coverage0[2250] = 1;  //assertion( 0 != or1200_cpu_or1200_ctrl_id_flushpipe = True) 2250
                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h0;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 0) 2252
                        end
                    else
                        begin
                            coverage0[2251] = 1;  //assertion( 0 != or1200_cpu_or1200_ctrl_id_flushpipe = False) 2251
                            if ((~or1200_cpu_or1200_ctrl_id_freeze))
                                begin
                                    coverage0[2253] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_id_freeze == 1) = True) 2253
                                    case (or1200_cpu_or1200_ctrl_if_insn[31:26])
                                      6'h00:
                                        begin
                                            coverage0[2255] = 1;  //assertion( 0 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2255
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h1;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 1) 2256
                                        end
                                      6'h01:
                                        begin
                                            coverage0[2257] = 1;  //assertion( 1 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2257
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h1;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 1) 2258
                                        end
                                      6'h12:
                                        begin
                                            coverage0[2259] = 1;  //assertion( 18 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2259
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h2;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 2) 2260
                                        end
                                      6'h11:
                                        begin
                                            coverage0[2261] = 1;  //assertion( 17 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2261
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h2;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 2) 2262
                                        end
                                      6'h03:
                                        begin
                                            coverage0[2263] = 1;  //assertion( 3 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2263
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h5;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 5) 2264
                                        end
                                      6'h04:
                                        begin
                                            coverage0[2265] = 1;  //assertion( 4 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2265
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h4;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 4) 2266
                                        end
                                      6'h09:
                                        begin
                                            coverage0[2267] = 1;  //assertion( 9 == Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) = True) 2267
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h6;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 6) 2268
                                        end
                                      default:
                                        begin
                                            coverage0[2269] = 1;  //assertion( If(0 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) & If(1 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) & If(18 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) & If(17 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) & If(3 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) & If(4 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) & If(9 != Extract(31, 26, or1200_cpu_or1200_ctrl_if_insn) == True, 1, 0) = True) 2269
                                            or1200_cpu_or1200_ctrl_id_branch_op <= 3'h0;  //assertion( or1200_cpu_or1200_ctrl_id_branch_op = 0) 2270
                                        end
                                    endcase
                                end
                            else
                                    coverage0[2254] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_id_freeze == 1) = False) 2254
                        end
                end
        end

    //Following code is from line 3729
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2271] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2271
                    or1200_cpu_or1200_ctrl_ex_branch_op <= 3'h0;  //assertion( or1200_cpu_or1200_ctrl_ex_branch_op = 0) 2273
                end
            else
                begin
                    coverage0[2272] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2272
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2274] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2274
                            or1200_cpu_or1200_ctrl_ex_branch_op <= 3'h0;  //assertion( or1200_cpu_or1200_ctrl_ex_branch_op = 0) 2276
                        end
                    else
                        begin
                            coverage0[2275] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2275
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2277] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2277
                                    or1200_cpu_or1200_ctrl_ex_branch_op <= or1200_cpu_or1200_ctrl_id_branch_op;  //assertion( or1200_cpu_or1200_ctrl_ex_branch_op = or1200_cpu_or1200_ctrl_id_branch_op) 2279
                                end
                            else
                                    coverage0[2278] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2278
                        end
                end
        end

    //Following code is from line 3733
        always @(or1200_cpu_or1200_ctrl_id_insn) begin
            case (or1200_cpu_or1200_ctrl_id_insn[31:26])
              6'h21:
                begin
                    coverage0[2280] = 1;  //assertion( 33 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2280
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h6;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 6) 2281
                end
              6'h22:
                begin
                    coverage0[2282] = 1;  //assertion( 34 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2282
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h7;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 7) 2283
                end
              6'h23:
                begin
                    coverage0[2284] = 1;  //assertion( 35 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2284
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h2;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 2) 2285
                end
              6'h24:
                begin
                    coverage0[2286] = 1;  //assertion( 36 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2286
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h3;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 3) 2287
                end
              6'h25:
                begin
                    coverage0[2288] = 1;  //assertion( 37 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2288
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h4;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 4) 2289
                end
              6'h26:
                begin
                    coverage0[2290] = 1;  //assertion( 38 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2290
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h5;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 5) 2291
                end
              6'h35:
                begin
                    coverage0[2292] = 1;  //assertion( 53 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2292
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'he;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 14) 2293
                end
              6'h36:
                begin
                    coverage0[2294] = 1;  //assertion( 54 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2294
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'ha;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 10) 2295
                end
              6'h37:
                begin
                    coverage0[2296] = 1;  //assertion( 55 == Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) = True) 2296
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'hc;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 12) 2297
                end
              default:
                begin
                    coverage0[2298] = 1;  //assertion( If(33 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(34 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(35 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(36 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(37 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(38 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(53 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(54 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) & If(55 != Extract(31, 26, or1200_cpu_or1200_ctrl_id_insn) == True, 1, 0) = True) 2298
                    or1200_cpu_or1200_ctrl_id_lsu_op = 4'h0;  //assertion( or1200_cpu_or1200_ctrl_id_lsu_op = 0) 2299
                end
            endcase
        end

    //Following code is from line 3746
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2300] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2300
                    or1200_cpu_or1200_ctrl_comp_op <= 4'h0;  //assertion( or1200_cpu_or1200_ctrl_comp_op = 0) 2302
                end
            else
                begin
                    coverage0[2301] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2301
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2303] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2303
                            or1200_cpu_or1200_ctrl_comp_op <= 4'h0;  //assertion( or1200_cpu_or1200_ctrl_comp_op = 0) 2305
                        end
                    else
                        begin
                            coverage0[2304] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2304
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2306] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2306
                                    or1200_cpu_or1200_ctrl_comp_op <= or1200_cpu_or1200_ctrl_id_insn[24:21];  //assertion( or1200_cpu_or1200_ctrl_comp_op = Extract(24, 21, or1200_cpu_or1200_ctrl_id_insn)) 2308
                                end
                            else
                                    coverage0[2307] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2307
                        end
                end
        end

    //Following code is from line 3750
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2309] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2309
                    or1200_cpu_or1200_ctrl_sig_syscall <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sig_syscall = 0) 2311
                end
            else
                begin
                    coverage0[2310] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2310
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2312] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2312
                            or1200_cpu_or1200_ctrl_sig_syscall <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sig_syscall = 0) 2314
                        end
                    else
                        begin
                            coverage0[2313] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2313
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2315] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2315
                                    or1200_cpu_or1200_ctrl_sig_syscall <= (or1200_cpu_or1200_ctrl_id_insn[31:23] == 9'h040);  //assertion( or1200_cpu_or1200_ctrl_sig_syscall = 64 == Extract(31, 23, or1200_cpu_or1200_ctrl_id_insn)) 2317
                                end
                            else
                                    coverage0[2316] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2316
                        end
                end
        end

    //Following code is from line 3754
        always @(posedge or1200_cpu_or1200_ctrl_rst or posedge or1200_cpu_or1200_ctrl_clk) begin
            if ((or1200_cpu_or1200_ctrl_rst == 1'b1))
                begin
                    coverage0[2318] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = True) 2318
                    or1200_cpu_or1200_ctrl_sig_trap <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sig_trap = 0) 2320
                end
            else
                begin
                    coverage0[2319] = 1;  //assertion( 1 == or1200_cpu_or1200_ctrl_rst = False) 2319
                    if ((((~or1200_cpu_or1200_ctrl_ex_freeze) & or1200_cpu_or1200_ctrl_id_freeze) | or1200_cpu_or1200_ctrl_ex_flushpipe))
                        begin
                            coverage0[2321] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = True) 2321
                            or1200_cpu_or1200_ctrl_sig_trap <= 1'b0;  //assertion( or1200_cpu_or1200_ctrl_sig_trap = 0) 2323
                        end
                    else
                        begin
                            coverage0[2322] = 1;  //assertion( If(Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_ctrl_id_freeze | or1200_cpu_or1200_ctrl_ex_flushpipe = False) 2322
                            if ((~or1200_cpu_or1200_ctrl_ex_freeze))
                                begin
                                    coverage0[2324] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = True) 2324
                                    or1200_cpu_or1200_ctrl_sig_trap <= ((or1200_cpu_or1200_ctrl_id_insn[31:23] == 9'h042) | or1200_cpu_or1200_ctrl_du_hwbkpt);  //assertion( or1200_cpu_or1200_ctrl_sig_trap = If((66 == Extract(31, 23, or1200_cpu_or1200_ctrl_id_insn)) == True, 1, 0) | or1200_cpu_or1200_ctrl_du_hwbkpt) 2326
                                end
                            else
                                    coverage0[2325] = 1;  //assertion( Not(or1200_cpu_or1200_ctrl_ex_freeze == 1) = False) 2325
                        end
                end
        end

    //Following code is from line 3758
        always @(posedge or1200_cpu_or1200_rf_clk) begin
            if ((or1200_cpu_or1200_rf_rf_ena & (~(or1200_cpu_or1200_rf_spr_cs_fe | (or1200_cpu_or1200_rf_du_read & or1200_cpu_or1200_rf_spr_cs)))))
                begin
                    coverage0[2327] = 1;  //assertion( or1200_cpu_or1200_rf_rf_ena & If(Not(or1200_cpu_or1200_rf_spr_cs_fe | or1200_cpu_or1200_rf_du_read & or1200_cpu_or1200_rf_spr_cs == 1) == True, 1, 0) = True) 2327
                    or1200_cpu_or1200_rf_addra_last <= or1200_cpu_or1200_rf_addra;  //assertion( or1200_cpu_or1200_rf_addra_last = or1200_cpu_or1200_rf_addra) 2329
                end
            else
                    coverage0[2328] = 1;  //assertion( or1200_cpu_or1200_rf_rf_ena & If(Not(or1200_cpu_or1200_rf_spr_cs_fe | or1200_cpu_or1200_rf_du_read & or1200_cpu_or1200_rf_spr_cs == 1) == True, 1, 0) = False) 2328
        end

    //Following code is from line 3760
        always @(posedge or1200_cpu_or1200_rf_clk) begin
            or1200_cpu_or1200_rf_spr_du_cs <= (or1200_cpu_or1200_rf_spr_cs & or1200_cpu_or1200_rf_du_read);  //assertion( or1200_cpu_or1200_rf_spr_du_cs = or1200_cpu_or1200_rf_spr_cs & or1200_cpu_or1200_rf_du_read) 2330
        end

    //Following code is from line 3762
        always @(posedge or1200_cpu_or1200_rf_clk or posedge or1200_cpu_or1200_rf_rst) begin
            if ((or1200_cpu_or1200_rf_rst == 1'b1))
                begin
                    coverage0[2331] = 1;  //assertion( 1 == or1200_cpu_or1200_rf_rst = True) 2331
                    or1200_cpu_or1200_rf_rf_we_allow <= 1'b1;  //assertion( or1200_cpu_or1200_rf_rf_we_allow = 1) 2333
                end
            else
                begin
                    coverage0[2332] = 1;  //assertion( 1 == or1200_cpu_or1200_rf_rst = False) 2332
                    if ((~or1200_cpu_or1200_rf_wb_freeze))
                        begin
                            coverage0[2334] = 1;  //assertion( ~or1200_cpu_or1200_rf_wb_freeze = True) 2334
                            or1200_cpu_or1200_rf_rf_we_allow <= (~or1200_cpu_or1200_rf_flushpipe);  //assertion( or1200_cpu_or1200_rf_rf_we_allow = ~or1200_cpu_or1200_rf_flushpipe) 2336
                        end
                    else
                            coverage0[2335] = 1;  //assertion( ~or1200_cpu_or1200_rf_wb_freeze = False) 2335
                end
        end

    //Following code is from line 3765
        always @(posedge or1200_cpu_or1200_rf_rf_a_clk_a) begin
            if (or1200_cpu_or1200_rf_rf_a_ce_a)
                begin
                    coverage0[2337] = 1;  //assertion( 0 != or1200_cpu_or1200_rf_rf_a_ce_a = True) 2337
                    or1200_cpu_or1200_rf_rf_a_addr_a_reg <= or1200_cpu_or1200_rf_rf_a_addr_a;  //assertion( or1200_cpu_or1200_rf_rf_a_addr_a_reg = or1200_cpu_or1200_rf_rf_a_addr_a) 2339
                end
            else
                    coverage0[2338] = 1;  //assertion( 0 != or1200_cpu_or1200_rf_rf_a_ce_a = False) 2338
        end

    //Following code is from line 3767
        always @(posedge or1200_cpu_or1200_rf_rf_a_clk_b) begin
            if ((or1200_cpu_or1200_rf_rf_a_ce_b & or1200_cpu_or1200_rf_rf_a_we_b))
                begin
                    coverage0[2340] = 1;  //assertion( or1200_cpu_or1200_rf_rf_a_ce_b & or1200_cpu_or1200_rf_rf_a_we_b = True) 2340
                    or1200_cpu_or1200_rf_rf_a_mem[or1200_cpu_or1200_rf_rf_a_addr_b] <= or1200_cpu_or1200_rf_rf_a_di_b;  //assertion( or1200_cpu_or1200_rf_rf_a_mem[or1200_cpu_or1200_rf_rf_a_addr_b] = or1200_cpu_or1200_rf_rf_a_di_b) 2342
                end
            else
                    coverage0[2341] = 1;  //assertion( or1200_cpu_or1200_rf_rf_a_ce_b & or1200_cpu_or1200_rf_rf_a_we_b = False) 2341
        end

    //Following code is from line 3769
        always @(posedge or1200_cpu_or1200_rf_rf_b_clk_a) begin
            if (or1200_cpu_or1200_rf_rf_b_ce_a)
                begin
                    coverage0[2343] = 1;  //assertion( 0 != or1200_cpu_or1200_rf_rf_b_ce_a = True) 2343
                    or1200_cpu_or1200_rf_rf_b_addr_a_reg <= or1200_cpu_or1200_rf_rf_b_addr_a;  //assertion( or1200_cpu_or1200_rf_rf_b_addr_a_reg = or1200_cpu_or1200_rf_rf_b_addr_a) 2345
                end
            else
                    coverage0[2344] = 1;  //assertion( 0 != or1200_cpu_or1200_rf_rf_b_ce_a = False) 2344
        end

    //Following code is from line 3771
        always @(posedge or1200_cpu_or1200_rf_rf_b_clk_b) begin
            if ((or1200_cpu_or1200_rf_rf_b_ce_b & or1200_cpu_or1200_rf_rf_b_we_b))
                begin
                    coverage0[2346] = 1;  //assertion( or1200_cpu_or1200_rf_rf_b_ce_b & or1200_cpu_or1200_rf_rf_b_we_b = True) 2346
                    or1200_cpu_or1200_rf_rf_b_mem[or1200_cpu_or1200_rf_rf_b_addr_b] <= or1200_cpu_or1200_rf_rf_b_di_b;  //assertion( or1200_cpu_or1200_rf_rf_b_mem[or1200_cpu_or1200_rf_rf_b_addr_b] = or1200_cpu_or1200_rf_rf_b_di_b) 2348
                end
            else
                    coverage0[2347] = 1;  //assertion( or1200_cpu_or1200_rf_rf_b_ce_b & or1200_cpu_or1200_rf_rf_b_we_b = False) 2347
        end

    //Following code is from line 3773
        always @(posedge or1200_cpu_or1200_operandmuxes_rst or posedge or1200_cpu_or1200_operandmuxes_clk) begin
            if ((or1200_cpu_or1200_operandmuxes_rst == 1'b1))
                begin
                    coverage0[2349] = 1;  //assertion( 1 == or1200_cpu_or1200_operandmuxes_rst = True) 2349
                    or1200_cpu_or1200_operandmuxes_operand_a <= 32'h00000000;  //assertion( or1200_cpu_or1200_operandmuxes_operand_a = 0) 2351
                    or1200_cpu_or1200_operandmuxes_saved_a <= 1'b0;  //assertion( or1200_cpu_or1200_operandmuxes_saved_a = 0) 2352
                end
            else
                begin
                    coverage0[2350] = 1;  //assertion( 1 == or1200_cpu_or1200_operandmuxes_rst = False) 2350
                    if ((((~or1200_cpu_or1200_operandmuxes_ex_freeze) && or1200_cpu_or1200_operandmuxes_id_freeze) && (~or1200_cpu_or1200_operandmuxes_saved_a)))
                        begin
                            coverage0[2353] = 1;  //assertion( And(If(And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_a == 1) == True, 1, 0) == 1) = True) 2353
                            or1200_cpu_or1200_operandmuxes_operand_a <= or1200_cpu_or1200_operandmuxes_muxed_a;  //assertion( or1200_cpu_or1200_operandmuxes_operand_a = or1200_cpu_or1200_operandmuxes_muxed_a) 2355
                            or1200_cpu_or1200_operandmuxes_saved_a <= 1'b1;  //assertion( or1200_cpu_or1200_operandmuxes_saved_a = 1) 2356
                        end
                    else
                        begin
                            coverage0[2354] = 1;  //assertion( And(If(And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_a == 1) == True, 1, 0) == 1) = False) 2354
                            if (((~or1200_cpu_or1200_operandmuxes_ex_freeze) && (~or1200_cpu_or1200_operandmuxes_saved_a)))
                                begin
                                    coverage0[2357] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_a == 1) == True, 1, 0) == 1) = True) 2357
                                    or1200_cpu_or1200_operandmuxes_operand_a <= or1200_cpu_or1200_operandmuxes_muxed_a;  //assertion( or1200_cpu_or1200_operandmuxes_operand_a = or1200_cpu_or1200_operandmuxes_muxed_a) 2359
                                end
                            else
                                begin
                                    coverage0[2358] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_a == 1) == True, 1, 0) == 1) = False) 2358
                                    if (((~or1200_cpu_or1200_operandmuxes_ex_freeze) && (~or1200_cpu_or1200_operandmuxes_id_freeze)))
                                        begin
                                            coverage0[2360] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1) = True) 2360
                                            or1200_cpu_or1200_operandmuxes_saved_a <= 1'b0;  //assertion( or1200_cpu_or1200_operandmuxes_saved_a = 0) 2362
                                        end
                                    else
                                            coverage0[2361] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1) = False) 2361
                                end
                        end
                end
        end

    //Following code is from line 3784
        always @(posedge or1200_cpu_or1200_operandmuxes_rst or posedge or1200_cpu_or1200_operandmuxes_clk) begin
            if ((or1200_cpu_or1200_operandmuxes_rst == 1'b1))
                begin
                    coverage0[2363] = 1;  //assertion( 1 == or1200_cpu_or1200_operandmuxes_rst = True) 2363
                    or1200_cpu_or1200_operandmuxes_operand_b <= 32'h00000000;  //assertion( or1200_cpu_or1200_operandmuxes_operand_b = 0) 2365
                    or1200_cpu_or1200_operandmuxes_saved_b <= 1'b0;  //assertion( or1200_cpu_or1200_operandmuxes_saved_b = 0) 2366
                end
            else
                begin
                    coverage0[2364] = 1;  //assertion( 1 == or1200_cpu_or1200_operandmuxes_rst = False) 2364
                    if ((((~or1200_cpu_or1200_operandmuxes_ex_freeze) && or1200_cpu_or1200_operandmuxes_id_freeze) && (~or1200_cpu_or1200_operandmuxes_saved_b)))
                        begin
                            coverage0[2367] = 1;  //assertion( And(If(And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_b == 1) == True, 1, 0) == 1) = True) 2367
                            or1200_cpu_or1200_operandmuxes_operand_b <= or1200_cpu_or1200_operandmuxes_muxed_b;  //assertion( or1200_cpu_or1200_operandmuxes_operand_b = or1200_cpu_or1200_operandmuxes_muxed_b) 2369
                            or1200_cpu_or1200_operandmuxes_saved_b <= 1'b1;  //assertion( or1200_cpu_or1200_operandmuxes_saved_b = 1) 2370
                        end
                    else
                        begin
                            coverage0[2368] = 1;  //assertion( And(If(And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_b == 1) == True, 1, 0) == 1) = False) 2368
                            if (((~or1200_cpu_or1200_operandmuxes_ex_freeze) && (~or1200_cpu_or1200_operandmuxes_saved_b)))
                                begin
                                    coverage0[2371] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_b == 1) == True, 1, 0) == 1) = True) 2371
                                    or1200_cpu_or1200_operandmuxes_operand_b <= or1200_cpu_or1200_operandmuxes_muxed_b;  //assertion( or1200_cpu_or1200_operandmuxes_operand_b = or1200_cpu_or1200_operandmuxes_muxed_b) 2373
                                end
                            else
                                begin
                                    coverage0[2372] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_saved_b == 1) == True, 1, 0) == 1) = False) 2372
                                    if (((~or1200_cpu_or1200_operandmuxes_ex_freeze) && (~or1200_cpu_or1200_operandmuxes_id_freeze)))
                                        begin
                                            coverage0[2374] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1) = True) 2374
                                            or1200_cpu_or1200_operandmuxes_saved_b <= 1'b0;  //assertion( or1200_cpu_or1200_operandmuxes_saved_b = 0) 2376
                                        end
                                    else
                                            coverage0[2375] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_operandmuxes_ex_freeze == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_operandmuxes_id_freeze == 1) == True, 1, 0) == 1) = False) 2375
                                end
                        end
                end
        end

    //Following code is from line 3795
        always @(or1200_cpu_or1200_operandmuxes_sel_a or or1200_cpu_or1200_operandmuxes_rf_dataa or or1200_cpu_or1200_operandmuxes_wb_forw or or1200_cpu_or1200_operandmuxes_ex_forw) begin
            case (or1200_cpu_or1200_operandmuxes_sel_a)
              2'h2:
                begin
                    coverage0[2377] = 1;  //assertion( 2 == or1200_cpu_or1200_operandmuxes_sel_a = True) 2377
                    or1200_cpu_or1200_operandmuxes_muxed_a = or1200_cpu_or1200_operandmuxes_ex_forw;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_a = or1200_cpu_or1200_operandmuxes_ex_forw) 2378
                end
              2'h3:
                begin
                    coverage0[2379] = 1;  //assertion( 3 == or1200_cpu_or1200_operandmuxes_sel_a = True) 2379
                    or1200_cpu_or1200_operandmuxes_muxed_a = or1200_cpu_or1200_operandmuxes_wb_forw;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_a = or1200_cpu_or1200_operandmuxes_wb_forw) 2380
                end
              default:
                begin
                    coverage0[2381] = 1;  //assertion( If(2 != or1200_cpu_or1200_operandmuxes_sel_a == True, 1, 0) & If(3 != or1200_cpu_or1200_operandmuxes_sel_a == True, 1, 0) = True) 2381
                    or1200_cpu_or1200_operandmuxes_muxed_a = or1200_cpu_or1200_operandmuxes_rf_dataa;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_a = or1200_cpu_or1200_operandmuxes_rf_dataa) 2382
                end
            endcase
        end

    //Following code is from line 3801
        always @(or1200_cpu_or1200_operandmuxes_sel_b or or1200_cpu_or1200_operandmuxes_rf_datab or or1200_cpu_or1200_operandmuxes_wb_forw or or1200_cpu_or1200_operandmuxes_ex_forw or or1200_cpu_or1200_operandmuxes_simm) begin
            case (or1200_cpu_or1200_operandmuxes_sel_b)
              2'h1:
                begin
                    coverage0[2383] = 1;  //assertion( 1 == or1200_cpu_or1200_operandmuxes_sel_b = True) 2383
                    or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_simm;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_simm) 2384
                end
              2'h2:
                begin
                    coverage0[2385] = 1;  //assertion( 2 == or1200_cpu_or1200_operandmuxes_sel_b = True) 2385
                    or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_ex_forw;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_ex_forw) 2386
                end
              2'h3:
                begin
                    coverage0[2387] = 1;  //assertion( 3 == or1200_cpu_or1200_operandmuxes_sel_b = True) 2387
                    or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_wb_forw;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_wb_forw) 2388
                end
              default:
                begin
                    coverage0[2389] = 1;  //assertion( If(1 != or1200_cpu_or1200_operandmuxes_sel_b == True, 1, 0) & If(2 != or1200_cpu_or1200_operandmuxes_sel_b == True, 1, 0) & If(3 != or1200_cpu_or1200_operandmuxes_sel_b == True, 1, 0) = True) 2389
                    or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_rf_datab;  //assertion( or1200_cpu_or1200_operandmuxes_muxed_b = or1200_cpu_or1200_operandmuxes_rf_datab) 2390
                end
            endcase
        end

    //Following code is from line 3808
        always @(or1200_cpu_or1200_alu_extended or or1200_cpu_or1200_alu_carry or or1200_cpu_or1200_alu_flag or or1200_cpu_or1200_alu_mult_mac_result or or1200_cpu_or1200_alu_shifted_rotated or or1200_cpu_or1200_alu_macrc_op or or1200_cpu_or1200_alu_result_and or or1200_cpu_or1200_alu_result_sum or or1200_cpu_or1200_alu_b or or1200_cpu_or1200_alu_a or or1200_cpu_or1200_alu_alu_op2 or or1200_cpu_or1200_alu_alu_op) begin
            case (or1200_cpu_or1200_alu_alu_op)
              5'h0f:
                begin
                    coverage0[2391] = 1;  //assertion( 15 == or1200_cpu_or1200_alu_alu_op = True) 2391
                    case (or1200_cpu_or1200_alu_alu_op2)
                      4'h0:
                        begin
                            coverage0[2392] = 1;  //assertion( 0 == or1200_cpu_or1200_alu_alu_op2 = True) 2392
                            or1200_cpu_or1200_alu_result = (or1200_cpu_or1200_alu_a[0] ? 1 : (or1200_cpu_or1200_alu_a[1] ? 2 : (or1200_cpu_or1200_alu_a[2] ? 3 : (or1200_cpu_or1200_alu_a[3] ? 4 : (or1200_cpu_or1200_alu_a[4] ? 5 : (or1200_cpu_or1200_alu_a[5] ? 6 : (or1200_cpu_or1200_alu_a[6] ? 7 : (or1200_cpu_or1200_alu_a[7] ? 8 : (or1200_cpu_or1200_alu_a[8] ? 9 : (or1200_cpu_or1200_alu_a[9] ? 10 : (or1200_cpu_or1200_alu_a[10] ? 11 : (or1200_cpu_or1200_alu_a[11] ? 12 : (or1200_cpu_or1200_alu_a[12] ? 13 : (or1200_cpu_or1200_alu_a[13] ? 14 : (or1200_cpu_or1200_alu_a[14] ? 15 : (or1200_cpu_or1200_alu_a[15] ? 16 : (or1200_cpu_or1200_alu_a[16] ? 17 : (or1200_cpu_or1200_alu_a[17] ? 18 : (or1200_cpu_or1200_alu_a[18] ? 19 : (or1200_cpu_or1200_alu_a[19] ? 20 : (or1200_cpu_or1200_alu_a[20] ? 21 : (or1200_cpu_or1200_alu_a[21] ? 22 : (or1200_cpu_or1200_alu_a[22] ? 23 : (or1200_cpu_or1200_alu_a[23] ? 24 : (or1200_cpu_or1200_alu_a[24] ? 25 : (or1200_cpu_or1200_alu_a[25] ? 26 : (or1200_cpu_or1200_alu_a[26] ? 27 : (or1200_cpu_or1200_alu_a[27] ? 28 : (or1200_cpu_or1200_alu_a[28] ? 29 : (or1200_cpu_or1200_alu_a[29] ? 30 : (or1200_cpu_or1200_alu_a[30] ? 31 : (or1200_cpu_or1200_alu_a[31] ? 32 : 0))))))))))))))))))))))))))))))));  //assertion( or1200_cpu_or1200_alu_result = If((1 == Extract(0, 0, or1200_cpu_or1200_alu_a)) == True, ZeroExt(5, 1), If((1 == Extract(1, 1, or1200_cpu_or1200_alu_a)) == True, ZeroExt(4, 2), If((1 == Extract(2, 2, or1200_cpu_or1200_alu_a)) == True, ZeroExt(4, 3), If((1 == Extract(3, 3, or1200_cpu_or1200_alu_a)) == True, ZeroExt(3, 4), If((1 == Extract(4, 4, or1200_cpu_or1200_alu_a)) == True, ZeroExt(3, 5), If((1 == Extract(5, 5, or1200_cpu_or1200_alu_a)) == True, ZeroExt(3, 6), If((1 == Extract(6, 6, or1200_cpu_or1200_alu_a)) == True, ZeroExt(3, 7), If((1 == Extract(7, 7, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 8), If((1 == Extract(8, 8, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 9), If((1 == Extract(9, 9, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 10), If((1 == Extract(10, 10, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 11), If((1 == Extract(11, 11, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 12), If((1 == Extract(12, 12, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 13), If((1 == Extract(13, 13, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 14), If((1 == Extract(14, 14, or1200_cpu_or1200_alu_a)) == True, ZeroExt(2, 15), If((1 == Extract(15, 15, or1200_cpu_or1200_alu_a)) == True, ZeroExt(1, 16), If((1 == Extract(16, 16, or1200_cpu_or1200_alu_a)) == True, ZeroExt(1, 17), If((1 == Extract(17, 17, ...)) == True, ZeroExt(1, 18), If((... == ...) == True, ZeroExt(1, 19), If((...) == ..., ZeroExt(1, ...), If(..., ..., ...)))))))))))))))))))))) 2393
                        end
                      default:
                        begin
                            coverage0[2394] = 1;  //assertion( 0 != or1200_cpu_or1200_alu_alu_op2 = True) 2394
                            or1200_cpu_or1200_alu_result = (or1200_cpu_or1200_alu_a[31] ? 32 : (or1200_cpu_or1200_alu_a[30] ? 31 : (or1200_cpu_or1200_alu_a[29] ? 30 : (or1200_cpu_or1200_alu_a[28] ? 29 : (or1200_cpu_or1200_alu_a[27] ? 28 : (or1200_cpu_or1200_alu_a[26] ? 27 : (or1200_cpu_or1200_alu_a[25] ? 26 : (or1200_cpu_or1200_alu_a[24] ? 25 : (or1200_cpu_or1200_alu_a[23] ? 24 : (or1200_cpu_or1200_alu_a[22] ? 23 : (or1200_cpu_or1200_alu_a[21] ? 22 : (or1200_cpu_or1200_alu_a[20] ? 21 : (or1200_cpu_or1200_alu_a[19] ? 20 : (or1200_cpu_or1200_alu_a[18] ? 19 : (or1200_cpu_or1200_alu_a[17] ? 18 : (or1200_cpu_or1200_alu_a[16] ? 17 : (or1200_cpu_or1200_alu_a[15] ? 16 : (or1200_cpu_or1200_alu_a[14] ? 15 : (or1200_cpu_or1200_alu_a[13] ? 14 : (or1200_cpu_or1200_alu_a[12] ? 13 : (or1200_cpu_or1200_alu_a[11] ? 12 : (or1200_cpu_or1200_alu_a[10] ? 11 : (or1200_cpu_or1200_alu_a[9] ? 10 : (or1200_cpu_or1200_alu_a[8] ? 9 : (or1200_cpu_or1200_alu_a[7] ? 8 : (or1200_cpu_or1200_alu_a[6] ? 7 : (or1200_cpu_or1200_alu_a[5] ? 6 : (or1200_cpu_or1200_alu_a[4] ? 5 : (or1200_cpu_or1200_alu_a[3] ? 4 : (or1200_cpu_or1200_alu_a[2] ? 3 : (or1200_cpu_or1200_alu_a[1] ? 2 : (or1200_cpu_or1200_alu_a[0] ? 1 : 0))))))))))))))))))))))))))))))));  //assertion( or1200_cpu_or1200_alu_result = If((1 == Extract(31, 31, or1200_cpu_or1200_alu_a)) == True, 32, ZeroExt(1, If((1 == Extract(30, 30, or1200_cpu_or1200_alu_a)) == True, 31, If((1 == Extract(29, 29, or1200_cpu_or1200_alu_a)) == True, 30, If((1 == Extract(28, 28, or1200_cpu_or1200_alu_a)) == True, 29, If((1 == Extract(27, 27, or1200_cpu_or1200_alu_a)) == True, 28, If((1 == Extract(26, 26, or1200_cpu_or1200_alu_a)) == True, 27, If((1 == Extract(25, 25, or1200_cpu_or1200_alu_a)) == True, 26, If((1 == Extract(24, 24, or1200_cpu_or1200_alu_a)) == True, 25, If((1 == Extract(23, 23, or1200_cpu_or1200_alu_a)) == True, 24, If((1 == Extract(22, 22, or1200_cpu_or1200_alu_a)) == True, 23, If((1 == Extract(21, 21, or1200_cpu_or1200_alu_a)) == True, 22, If((1 == Extract(20, 20, or1200_cpu_or1200_alu_a)) == True, 21, If((1 == Extract(19, 19, or1200_cpu_or1200_alu_a)) == True, 20, If((1 == Extract(18, 18, or1200_cpu_or1200_alu_a)) == True, 19, If((1 == Extract(17, 17, or1200_cpu_or1200_alu_a)) == True, 18, If((1 == Extract(16, 16, or1200_cpu_or1200_alu_a)) == True, 17, If((1 == Extract(15, 15, ...)) == True, 16, ZeroExt(1, If((...) == ..., 15, If(..., ..., ...)))))))))))))))))))))) 2395
                        end
                    endcase
                end
              5'h08:
                begin
                    coverage0[2396] = 1;  //assertion( 8 == or1200_cpu_or1200_alu_alu_op = True) 2396
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_shifted_rotated;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_shifted_rotated) 2397
                end
              5'h01:
                begin
                    coverage0[2398] = 1;  //assertion( 1 == or1200_cpu_or1200_alu_alu_op = True) 2398
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_sum;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_sum) 2399
                end
              5'h02:
                begin
                    coverage0[2400] = 1;  //assertion( 2 == or1200_cpu_or1200_alu_alu_op = True) 2400
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_sum;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_sum) 2401
                end
              5'h00:
                begin
                    coverage0[2402] = 1;  //assertion( 0 == or1200_cpu_or1200_alu_alu_op = True) 2402
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_sum;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_sum) 2403
                end
              5'h05:
                begin
                    coverage0[2404] = 1;  //assertion( 5 == or1200_cpu_or1200_alu_alu_op = True) 2404
                    or1200_cpu_or1200_alu_result = (or1200_cpu_or1200_alu_a ^ or1200_cpu_or1200_alu_b);  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_a ^ or1200_cpu_or1200_alu_b) 2405
                end
              5'h04:
                begin
                    coverage0[2406] = 1;  //assertion( 4 == or1200_cpu_or1200_alu_alu_op = True) 2406
                    or1200_cpu_or1200_alu_result = (or1200_cpu_or1200_alu_a | or1200_cpu_or1200_alu_b);  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_a | or1200_cpu_or1200_alu_b) 2407
                end
              5'h0c:
                begin
                    coverage0[2408] = 1;  //assertion( 12 == or1200_cpu_or1200_alu_alu_op = True) 2408
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_extended;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_extended) 2409
                end
              5'h0d:
                begin
                    coverage0[2410] = 1;  //assertion( 13 == or1200_cpu_or1200_alu_alu_op = True) 2410
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_a;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_a) 2411
                end
              5'h11:
                begin
                    coverage0[2412] = 1;  //assertion( 17 == or1200_cpu_or1200_alu_alu_op = True) 2412
                    if (or1200_cpu_or1200_alu_macrc_op)
                        begin
                            coverage0[2413] = 1;  //assertion( 0 != or1200_cpu_or1200_alu_macrc_op = True) 2413
                            or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result) 2415
                        end
                    else
                        begin
                            coverage0[2414] = 1;  //assertion( 0 != or1200_cpu_or1200_alu_macrc_op = False) 2414
                            or1200_cpu_or1200_alu_result = (or1200_cpu_or1200_alu_b << 32'h00000010);  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_b << 16) 2416
                        end
                end
              5'h09:
                begin
                    coverage0[2417] = 1;  //assertion( 9 == or1200_cpu_or1200_alu_alu_op = True) 2417
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result) 2418
                end
              5'h0a:
                begin
                    coverage0[2419] = 1;  //assertion( 10 == or1200_cpu_or1200_alu_alu_op = True) 2419
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result) 2420
                end
              5'h06:
                begin
                    coverage0[2421] = 1;  //assertion( 6 == or1200_cpu_or1200_alu_alu_op = True) 2421
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result) 2422
                end
              5'h0b:
                begin
                    coverage0[2423] = 1;  //assertion( 11 == or1200_cpu_or1200_alu_alu_op = True) 2423
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_mult_mac_result) 2424
                end
              5'h0e:
                begin
                    coverage0[2425] = 1;  //assertion( 14 == or1200_cpu_or1200_alu_alu_op = True) 2425
                    or1200_cpu_or1200_alu_result = (or1200_cpu_or1200_alu_flag ? or1200_cpu_or1200_alu_a : or1200_cpu_or1200_alu_b);  //assertion( or1200_cpu_or1200_alu_result = If(0 != or1200_cpu_or1200_alu_flag == True, or1200_cpu_or1200_alu_a, or1200_cpu_or1200_alu_b)) 2426
                end
              default:
                begin
                    coverage0[2427] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 2427
                    or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_and;  //assertion( or1200_cpu_or1200_alu_result = or1200_cpu_or1200_alu_result_and) 2428
                end
            endcase
        end

    //Following code is from line 3831
        always @(or1200_cpu_or1200_alu_flagcomp or or1200_cpu_or1200_alu_result_and or or1200_cpu_or1200_alu_result_sum or or1200_cpu_or1200_alu_alu_op) begin
            case (or1200_cpu_or1200_alu_alu_op)
              5'h10:
                begin
                    coverage0[2429] = 1;  //assertion( 16 == or1200_cpu_or1200_alu_alu_op = True) 2429
                    or1200_cpu_or1200_alu_flagforw = or1200_cpu_or1200_alu_flagcomp;  //assertion( or1200_cpu_or1200_alu_flagforw = or1200_cpu_or1200_alu_flagcomp) 2430
                    or1200_cpu_or1200_alu_flag_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_flag_we = 1) 2431
                end
              default:
                begin
                    coverage0[2432] = 1;  //assertion( 16 != or1200_cpu_or1200_alu_alu_op = True) 2432
                    or1200_cpu_or1200_alu_flagforw = or1200_cpu_or1200_alu_flagcomp;  //assertion( or1200_cpu_or1200_alu_flagforw = or1200_cpu_or1200_alu_flagcomp) 2433
                    or1200_cpu_or1200_alu_flag_we = 1'b0;  //assertion( or1200_cpu_or1200_alu_flag_we = 0) 2434
                end
            endcase
        end

    //Following code is from line 3842
        always @(or1200_cpu_or1200_alu_cy_sub or or1200_cpu_or1200_alu_cy_sum or or1200_cpu_or1200_alu_alu_op) begin
            case (or1200_cpu_or1200_alu_alu_op)
              5'h01:
                begin
                    coverage0[2435] = 1;  //assertion( 1 == or1200_cpu_or1200_alu_alu_op = True) 2435
                    or1200_cpu_or1200_alu_cyforw = or1200_cpu_or1200_alu_cy_sum;  //assertion( or1200_cpu_or1200_alu_cyforw = or1200_cpu_or1200_alu_cy_sum) 2436
                    or1200_cpu_or1200_alu_cy_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_cy_we = 1) 2437
                end
              5'h00:
                begin
                    coverage0[2438] = 1;  //assertion( 0 == or1200_cpu_or1200_alu_alu_op = True) 2438
                    or1200_cpu_or1200_alu_cyforw = or1200_cpu_or1200_alu_cy_sum;  //assertion( or1200_cpu_or1200_alu_cyforw = or1200_cpu_or1200_alu_cy_sum) 2439
                    or1200_cpu_or1200_alu_cy_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_cy_we = 1) 2440
                end
              5'h02:
                begin
                    coverage0[2441] = 1;  //assertion( 2 == or1200_cpu_or1200_alu_alu_op = True) 2441
                    or1200_cpu_or1200_alu_cyforw = or1200_cpu_or1200_alu_cy_sub;  //assertion( or1200_cpu_or1200_alu_cyforw = or1200_cpu_or1200_alu_cy_sub) 2442
                    or1200_cpu_or1200_alu_cy_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_cy_we = 1) 2443
                end
              default:
                begin
                    coverage0[2444] = 1;  //assertion( If(1 != or1200_cpu_or1200_alu_alu_op == True, 1, 0) & If(0 != or1200_cpu_or1200_alu_alu_op == True, 1, 0) & If(2 != or1200_cpu_or1200_alu_alu_op == True, 1, 0) = True) 2444
                    or1200_cpu_or1200_alu_cyforw = 1'b0;  //assertion( or1200_cpu_or1200_alu_cyforw = 0) 2445
                    or1200_cpu_or1200_alu_cy_we = 1'b0;  //assertion( or1200_cpu_or1200_alu_cy_we = 0) 2446
                end
            endcase
        end

    //Following code is from line 3861
        always @(or1200_cpu_or1200_alu_ov_sum or or1200_cpu_or1200_alu_alu_op) begin
            case (or1200_cpu_or1200_alu_alu_op)
              5'h01:
                begin
                    coverage0[2447] = 1;  //assertion( 1 == or1200_cpu_or1200_alu_alu_op = True) 2447
                    or1200_cpu_or1200_alu_ovforw = or1200_cpu_or1200_alu_ov_sum;  //assertion( or1200_cpu_or1200_alu_ovforw = or1200_cpu_or1200_alu_ov_sum) 2448
                    or1200_cpu_or1200_alu_ov_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_ov_we = 1) 2449
                end
              5'h02:
                begin
                    coverage0[2450] = 1;  //assertion( 2 == or1200_cpu_or1200_alu_alu_op = True) 2450
                    or1200_cpu_or1200_alu_ovforw = or1200_cpu_or1200_alu_ov_sum;  //assertion( or1200_cpu_or1200_alu_ovforw = or1200_cpu_or1200_alu_ov_sum) 2451
                    or1200_cpu_or1200_alu_ov_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_ov_we = 1) 2452
                end
              5'h00:
                begin
                    coverage0[2453] = 1;  //assertion( 0 == or1200_cpu_or1200_alu_alu_op = True) 2453
                    or1200_cpu_or1200_alu_ovforw = or1200_cpu_or1200_alu_ov_sum;  //assertion( or1200_cpu_or1200_alu_ovforw = or1200_cpu_or1200_alu_ov_sum) 2454
                    or1200_cpu_or1200_alu_ov_we = 1'b1;  //assertion( or1200_cpu_or1200_alu_ov_we = 1) 2455
                end
              default:
                begin
                    coverage0[2456] = 1;  //assertion( If(1 != or1200_cpu_or1200_alu_alu_op == True, 1, 0) & If(2 != or1200_cpu_or1200_alu_alu_op == True, 1, 0) & If(0 != or1200_cpu_or1200_alu_alu_op == True, 1, 0) = True) 2456
                    or1200_cpu_or1200_alu_ovforw = 1'b0;  //assertion( or1200_cpu_or1200_alu_ovforw = 0) 2457
                    or1200_cpu_or1200_alu_ov_we = 1'b0;  //assertion( or1200_cpu_or1200_alu_ov_we = 0) 2458
                end
            endcase
        end

    //Following code is from line 3880
        always @(or1200_cpu_or1200_alu_b or or1200_cpu_or1200_alu_a or or1200_cpu_or1200_alu_alu_op2) begin
            case (or1200_cpu_or1200_alu_alu_op2)
              4'h0:
                begin
                    coverage0[2459] = 1;  //assertion( 0 == or1200_cpu_or1200_alu_alu_op2 = True) 2459
                    or1200_cpu_or1200_alu_shifted_rotated = (or1200_cpu_or1200_alu_a << or1200_cpu_or1200_alu_b[4:0]);  //assertion( or1200_cpu_or1200_alu_shifted_rotated = or1200_cpu_or1200_alu_a << ZeroExt(27, Extract(4, 0, or1200_cpu_or1200_alu_b))) 2460
                end
              4'h1:
                begin
                    coverage0[2461] = 1;  //assertion( 1 == or1200_cpu_or1200_alu_alu_op2 = True) 2461
                    or1200_cpu_or1200_alu_shifted_rotated = (or1200_cpu_or1200_alu_a >> or1200_cpu_or1200_alu_b[4:0]);  //assertion( or1200_cpu_or1200_alu_shifted_rotated = LShR(or1200_cpu_or1200_alu_a, ZeroExt(27, Extract(4, 0, or1200_cpu_or1200_alu_b)))) 2462
                end
              default:
                begin
                    coverage0[2463] = 1;  //assertion( If(0 != or1200_cpu_or1200_alu_alu_op2 == True, 1, 0) & If(1 != or1200_cpu_or1200_alu_alu_op2 == True, 1, 0) = True) 2463
                    or1200_cpu_or1200_alu_shifted_rotated = (({ 32{ or1200_cpu_or1200_alu_a[31] } } << (6'h20 - {1'b0, or1200_cpu_or1200_alu_b[4:0]})) | (or1200_cpu_or1200_alu_a >> or1200_cpu_or1200_alu_b[4:0]));  //assertion( or1200_cpu_or1200_alu_shifted_rotated = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(..., ...), Extract(31, 31, ...)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)), Extract(31, 31, or1200_cpu_or1200_alu_a)) << ZeroExt(26, 32 - Concat(0, Extract(4, 0, or1200_cpu_or1200_alu_b))) | LShR(or1200_cpu_or1200_alu_a, ZeroExt(27, Extract(4, 0, or1200_cpu_or1200_alu_b)))) 2464
                end
            endcase
        end

    //Following code is from line 3886
        always @(or1200_cpu_or1200_alu_a_lt_b or or1200_cpu_or1200_alu_a_eq_b or or1200_cpu_or1200_alu_comp_op) begin
            case (or1200_cpu_or1200_alu_comp_op[2:0])
              3'h0:
                begin
                    coverage0[2465] = 1;  //assertion( 0 == Extract(2, 0, or1200_cpu_or1200_alu_comp_op) = True) 2465
                    or1200_cpu_or1200_alu_flagcomp = or1200_cpu_or1200_alu_a_eq_b;  //assertion( or1200_cpu_or1200_alu_flagcomp = or1200_cpu_or1200_alu_a_eq_b) 2466
                end
              3'h1:
                begin
                    coverage0[2467] = 1;  //assertion( 1 == Extract(2, 0, or1200_cpu_or1200_alu_comp_op) = True) 2467
                    or1200_cpu_or1200_alu_flagcomp = (~or1200_cpu_or1200_alu_a_eq_b);  //assertion( or1200_cpu_or1200_alu_flagcomp = ~or1200_cpu_or1200_alu_a_eq_b) 2468
                end
              3'h2:
                begin
                    coverage0[2469] = 1;  //assertion( 2 == Extract(2, 0, or1200_cpu_or1200_alu_comp_op) = True) 2469
                    or1200_cpu_or1200_alu_flagcomp = (~(or1200_cpu_or1200_alu_a_eq_b | or1200_cpu_or1200_alu_a_lt_b));  //assertion( or1200_cpu_or1200_alu_flagcomp = ~(or1200_cpu_or1200_alu_a_eq_b | or1200_cpu_or1200_alu_a_lt_b)) 2470
                end
              3'h3:
                begin
                    coverage0[2471] = 1;  //assertion( 3 == Extract(2, 0, or1200_cpu_or1200_alu_comp_op) = True) 2471
                    or1200_cpu_or1200_alu_flagcomp = (~or1200_cpu_or1200_alu_a_lt_b);  //assertion( or1200_cpu_or1200_alu_flagcomp = ~or1200_cpu_or1200_alu_a_lt_b) 2472
                end
              3'h4:
                begin
                    coverage0[2473] = 1;  //assertion( 4 == Extract(2, 0, or1200_cpu_or1200_alu_comp_op) = True) 2473
                    or1200_cpu_or1200_alu_flagcomp = or1200_cpu_or1200_alu_a_lt_b;  //assertion( or1200_cpu_or1200_alu_flagcomp = or1200_cpu_or1200_alu_a_lt_b) 2474
                end
              3'h5:
                begin
                    coverage0[2475] = 1;  //assertion( 5 == Extract(2, 0, or1200_cpu_or1200_alu_comp_op) = True) 2475
                    or1200_cpu_or1200_alu_flagcomp = (or1200_cpu_or1200_alu_a_eq_b | or1200_cpu_or1200_alu_a_lt_b);  //assertion( or1200_cpu_or1200_alu_flagcomp = or1200_cpu_or1200_alu_a_eq_b | or1200_cpu_or1200_alu_a_lt_b) 2476
                end
              default:
                begin
                    coverage0[2477] = 1;  //assertion( If(0 != Extract(2, 0, or1200_cpu_or1200_alu_comp_op) == True, 1, 0) & If(1 != Extract(2, 0, or1200_cpu_or1200_alu_comp_op) == True, 1, 0) & If(2 != Extract(2, 0, or1200_cpu_or1200_alu_comp_op) == True, 1, 0) & If(3 != Extract(2, 0, or1200_cpu_or1200_alu_comp_op) == True, 1, 0) & If(4 != Extract(2, 0, or1200_cpu_or1200_alu_comp_op) == True, 1, 0) & If(5 != Extract(2, 0, or1200_cpu_or1200_alu_comp_op) == True, 1, 0) = True) 2477
                    or1200_cpu_or1200_alu_flagcomp = 1'b0;  //assertion( or1200_cpu_or1200_alu_flagcomp = 0) 2478
                end
            endcase
        end

    //Following code is from line 3896
        always @(or1200_cpu_or1200_alu_a or or1200_cpu_or1200_alu_alu_op2 or or1200_cpu_or1200_alu_alu_op) begin
            case (or1200_cpu_or1200_alu_alu_op2)
              4'h0:
                begin
                    coverage0[2479] = 1;  //assertion( 0 == or1200_cpu_or1200_alu_alu_op2 = True) 2479
                    or1200_cpu_or1200_alu_extended = {{ 16{ or1200_cpu_or1200_alu_a[15] } }, or1200_cpu_or1200_alu_a[15:0]};  //assertion( or1200_cpu_or1200_alu_extended = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(15, 15, or1200_cpu_or1200_alu_a), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 15, or1200_cpu_or1200_alu_a)), Extract(15, 0, or1200_cpu_or1200_alu_a))) 2480
                end
              4'h1:
                begin
                    coverage0[2481] = 1;  //assertion( 1 == or1200_cpu_or1200_alu_alu_op2 = True) 2481
                    or1200_cpu_or1200_alu_extended = {{ 24{ or1200_cpu_or1200_alu_a[7] } }, or1200_cpu_or1200_alu_a[7:0]};  //assertion( or1200_cpu_or1200_alu_extended = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(..., ...), Extract(7, 7, ...)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 7, or1200_cpu_or1200_alu_a)), Extract(7, 0, or1200_cpu_or1200_alu_a))) 2482
                end
              4'h2:
                begin
                    coverage0[2483] = 1;  //assertion( 2 == or1200_cpu_or1200_alu_alu_op2 = True) 2483
                    or1200_cpu_or1200_alu_extended = {16'h0000, or1200_cpu_or1200_alu_a[15:0]};  //assertion( or1200_cpu_or1200_alu_extended = Concat(0, Extract(15, 0, or1200_cpu_or1200_alu_a))) 2484
                end
              4'h3:
                begin
                    coverage0[2485] = 1;  //assertion( 3 == or1200_cpu_or1200_alu_alu_op2 = True) 2485
                    or1200_cpu_or1200_alu_extended = {24'h000000, or1200_cpu_or1200_alu_a[7:0]};  //assertion( or1200_cpu_or1200_alu_extended = Concat(0, Extract(7, 0, or1200_cpu_or1200_alu_a))) 2486
                end
              default:
                begin
                    coverage0[2487] = 1;  //assertion( If(0 != or1200_cpu_or1200_alu_alu_op2 == True, 1, 0) & If(1 != or1200_cpu_or1200_alu_alu_op2 == True, 1, 0) & If(2 != or1200_cpu_or1200_alu_alu_op2 == True, 1, 0) & If(3 != or1200_cpu_or1200_alu_alu_op2 == True, 1, 0) = True) 2487
                    or1200_cpu_or1200_alu_extended = or1200_cpu_or1200_alu_a;  //assertion( or1200_cpu_or1200_alu_extended = or1200_cpu_or1200_alu_a) 2488
                end
            endcase
        end

    //Following code is from line 3904
        always @(posedge or1200_cpu_or1200_mult_mac_rst or posedge or1200_cpu_or1200_mult_mac_clk) begin
            if ((or1200_cpu_or1200_mult_mac_rst == 1'b1))
                begin
                    coverage0[2489] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = True) 2489
                    or1200_cpu_or1200_mult_mac_ex_freeze_r <= 1'b1;  //assertion( or1200_cpu_or1200_mult_mac_ex_freeze_r = 1) 2491
                end
            else
                begin
                    coverage0[2490] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = False) 2490
                    or1200_cpu_or1200_mult_mac_ex_freeze_r <= or1200_cpu_or1200_mult_mac_ex_freeze;  //assertion( or1200_cpu_or1200_mult_mac_ex_freeze_r = or1200_cpu_or1200_mult_mac_ex_freeze) 2492
                end
        end

    //Following code is from line 3907
        always @(or1200_cpu_or1200_mult_mac_alu_op or or1200_cpu_or1200_mult_mac_a or or1200_cpu_or1200_mult_mac_b or or1200_cpu_or1200_mult_mac_div_quot_r or or1200_cpu_or1200_mult_mac_mul_prod_r) begin
            case (or1200_cpu_or1200_mult_mac_alu_op)
              5'h09:
                begin
                    coverage0[2493] = 1;  //assertion( 9 == or1200_cpu_or1200_mult_mac_alu_op = True) 2493
                    or1200_cpu_or1200_mult_mac_result = ((or1200_cpu_or1200_mult_mac_a[31] ^ or1200_cpu_or1200_mult_mac_b[31]) ? ((~or1200_cpu_or1200_mult_mac_div_quot_r[31:0]) + 32'h00000001) : or1200_cpu_or1200_mult_mac_div_quot_r[31:0]);  //assertion( or1200_cpu_or1200_mult_mac_result = If((1 == Extract(31, 31, or1200_cpu_or1200_mult_mac_a) ^ Extract(31, 31, or1200_cpu_or1200_mult_mac_b)) == True, ~Extract(31, 0, or1200_cpu_or1200_mult_mac_div_quot_r) + 1, Extract(31, 0, or1200_cpu_or1200_mult_mac_div_quot_r))) 2494
                end
              5'h0a:
                begin
                    coverage0[2495] = 1;  //assertion( 10 == or1200_cpu_or1200_mult_mac_alu_op = True) 2495
                    or1200_cpu_or1200_mult_mac_result = or1200_cpu_or1200_mult_mac_div_quot_r[31:0];  //assertion( or1200_cpu_or1200_mult_mac_result = Extract(31, 0, or1200_cpu_or1200_mult_mac_div_quot_r)) 2496
                end
              5'h06:
                begin
                    coverage0[2497] = 1;  //assertion( 6 == or1200_cpu_or1200_mult_mac_alu_op = True) 2497
                    or1200_cpu_or1200_mult_mac_result = ((or1200_cpu_or1200_mult_mac_a[31] ^ or1200_cpu_or1200_mult_mac_b[31]) ? ((~or1200_cpu_or1200_mult_mac_mul_prod_r[31:0]) + 32'h00000001) : or1200_cpu_or1200_mult_mac_mul_prod_r[31:0]);  //assertion( or1200_cpu_or1200_mult_mac_result = If((1 == Extract(31, 31, or1200_cpu_or1200_mult_mac_a) ^ Extract(31, 31, or1200_cpu_or1200_mult_mac_b)) == True, ~Extract(31, 0, or1200_cpu_or1200_mult_mac_mul_prod_r) + 1, Extract(31, 0, or1200_cpu_or1200_mult_mac_mul_prod_r))) 2498
                end
              5'h0b:
                begin
                    coverage0[2499] = 1;  //assertion( 11 == or1200_cpu_or1200_mult_mac_alu_op = True) 2499
                    or1200_cpu_or1200_mult_mac_result = or1200_cpu_or1200_mult_mac_mul_prod_r[31:0];  //assertion( or1200_cpu_or1200_mult_mac_result = Extract(31, 0, or1200_cpu_or1200_mult_mac_mul_prod_r)) 2500
                end
              default:
                begin
                    coverage0[2501] = 1;  //assertion( If(9 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) & If(10 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) & If(6 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) & If(11 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) = True) 2501
                    or1200_cpu_or1200_mult_mac_result = 32'h00000000;  //assertion( or1200_cpu_or1200_mult_mac_result = 0) 2502
                end
            endcase
        end

    //Following code is from line 3915
        always @(or1200_cpu_or1200_mult_mac_alu_op or or1200_cpu_or1200_mult_mac_mul_prod_r or or1200_cpu_or1200_mult_mac_a or or1200_cpu_or1200_mult_mac_b or or1200_cpu_or1200_mult_mac_div_by_zero) begin
            case (or1200_cpu_or1200_mult_mac_alu_op)
              5'h06:
                begin
                    coverage0[2503] = 1;  //assertion( 6 == or1200_cpu_or1200_mult_mac_alu_op = True) 2503
                    or1200_cpu_or1200_mult_mac_ovforw = ((or1200_cpu_or1200_mult_mac_mul_prod_r[31] && (~((or1200_cpu_or1200_mult_mac_a[31] ^ or1200_cpu_or1200_mult_mac_b[31]) && ~|or1200_cpu_or1200_mult_mac_mul_prod_r[30:0]))) || (|or1200_cpu_or1200_mult_mac_mul_prod_r[63:32]));  //assertion( or1200_cpu_or1200_mult_mac_ovforw = Or(If(And(Extract(31, 31, or1200_cpu_or1200_mult_mac_mul_prod_r) == 1, If(Not(And(Extract(31, 31, or1200_cpu_or1200_mult_mac_a) ^ Extract(31, 31, or1200_cpu_or1200_mult_mac_b) == 1, ~bvredor(Extract(30, 0, or1200_cpu_or1200_mult_mac_mul_prod_r)) == 1) == True) == True, 1, 0) == 1) == True, 1, 0) == 1, bvredor(Extract(63, 32, or1200_cpu_or1200_mult_mac_mul_prod_r)) == 1)) 2504
                    or1200_cpu_or1200_mult_mac_ov_we = (-1);  //assertion( or1200_cpu_or1200_mult_mac_ov_we = -1) 2505
                end
              5'h0b:
                begin
                    coverage0[2506] = 1;  //assertion( 11 == or1200_cpu_or1200_mult_mac_alu_op = True) 2506
                    or1200_cpu_or1200_mult_mac_ovforw = (|or1200_cpu_or1200_mult_mac_mul_prod_r[63:32]);  //assertion( or1200_cpu_or1200_mult_mac_ovforw = bvredor(Extract(63, 32, or1200_cpu_or1200_mult_mac_mul_prod_r))) 2507
                    or1200_cpu_or1200_mult_mac_ov_we = (-1);  //assertion( or1200_cpu_or1200_mult_mac_ov_we = -1) 2508
                end
              5'h0a:
                begin
                    coverage0[2509] = 1;  //assertion( 10 == or1200_cpu_or1200_mult_mac_alu_op = True) 2509
                    or1200_cpu_or1200_mult_mac_ovforw = (or1200_cpu_or1200_mult_mac_div_by_zero || ((or1200_cpu_or1200_mult_mac_a == 32'h80000000) && (or1200_cpu_or1200_mult_mac_b == 32'hffffffff)));  //assertion( or1200_cpu_or1200_mult_mac_ovforw = Or(or1200_cpu_or1200_mult_mac_div_by_zero == 1, If(And(If((2147483648 == or1200_cpu_or1200_mult_mac_a) == True, 1, 0) == 1, If((4294967295 == or1200_cpu_or1200_mult_mac_b) == True, 1, 0) == 1) == True, 1, 0) == 1)) 2510
                    or1200_cpu_or1200_mult_mac_ov_we = (-1);  //assertion( or1200_cpu_or1200_mult_mac_ov_we = -1) 2511
                end
              5'h09:
                begin
                    coverage0[2512] = 1;  //assertion( 9 == or1200_cpu_or1200_mult_mac_alu_op = True) 2512
                    or1200_cpu_or1200_mult_mac_ovforw = (or1200_cpu_or1200_mult_mac_div_by_zero || ((or1200_cpu_or1200_mult_mac_a == 32'h80000000) && (or1200_cpu_or1200_mult_mac_b == 32'hffffffff)));  //assertion( or1200_cpu_or1200_mult_mac_ovforw = Or(or1200_cpu_or1200_mult_mac_div_by_zero == 1, If(And(If((2147483648 == or1200_cpu_or1200_mult_mac_a) == True, 1, 0) == 1, If((4294967295 == or1200_cpu_or1200_mult_mac_b) == True, 1, 0) == 1) == True, 1, 0) == 1)) 2513
                    or1200_cpu_or1200_mult_mac_ov_we = (-1);  //assertion( or1200_cpu_or1200_mult_mac_ov_we = -1) 2514
                end
              default:
                begin
                    coverage0[2515] = 1;  //assertion( If(6 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) & If(11 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) & If(10 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) & If(9 != or1200_cpu_or1200_mult_mac_alu_op == True, 1, 0) = True) 2515
                    or1200_cpu_or1200_mult_mac_ovforw = 0;  //assertion( or1200_cpu_or1200_mult_mac_ovforw = 0) 2516
                    or1200_cpu_or1200_mult_mac_ov_we = 0;  //assertion( or1200_cpu_or1200_mult_mac_ov_we = 0) 2517
                end
            endcase
        end

    //Following code is from line 3938
        always @(or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved) begin
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved) 2518
        end

    //Following code is from line 3940
        always @(or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved) begin
            or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved) 2519
        end

    //Following code is from line 3942
        always @(posedge or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST or posedge or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK) begin
            if ((or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST == 1'b1))
                begin
                    coverage0[2520] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = True) 2520
                    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved <= 32'h00000000;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved = 0) 2522
                    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved <= 32'h00000000;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved = 0) 2523
                end
            else
                begin
                    coverage0[2521] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = False) 2521
                    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved <= or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X_saved = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_X) 2524
                    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved <= or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y_saved = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_Y) 2525
                end
        end

    //Following code is from line 3951
        always @(posedge or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST or posedge or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_CLK) begin
            if ((or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST == 1'b1))
                begin
                    coverage0[2526] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = True) 2526
                    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1 <= 64'h0000000000000000;  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1 = 0) 2528
                end
            else
                begin
                    coverage0[2527] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_RST = False) 2527
                    or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1 <= (or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi * or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi);  //assertion( or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_p1 = or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_xi*or1200_cpu_or1200_mult_mac_or1200_gmultp2_32x32_yi) 2529
                end
        end

    //Following code is from line 3954
        always @(posedge or1200_cpu_or1200_mult_mac_clk or posedge or1200_cpu_or1200_mult_mac_rst) begin
            if ((or1200_cpu_or1200_mult_mac_rst == 1'b1))
                begin
                    coverage0[2530] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = True) 2530
                    or1200_cpu_or1200_mult_mac_mul_prod_r <= 64'h0000000000000000;  //assertion( or1200_cpu_or1200_mult_mac_mul_prod_r = 0) 2532
                end
            else
                begin
                    coverage0[2531] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = False) 2531
                    or1200_cpu_or1200_mult_mac_mul_prod_r <= or1200_cpu_or1200_mult_mac_mul_prod;  //assertion( or1200_cpu_or1200_mult_mac_mul_prod_r = or1200_cpu_or1200_mult_mac_mul_prod) 2533
                end
        end

    //Following code is from line 3957
        always @(posedge or1200_cpu_or1200_mult_mac_clk or posedge or1200_cpu_or1200_mult_mac_rst) begin
            if ((or1200_cpu_or1200_mult_mac_rst == 1'b1))
                begin
                    coverage0[2534] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = True) 2534
                    or1200_cpu_or1200_mult_mac_mul_stall_count <= 0;  //assertion( or1200_cpu_or1200_mult_mac_mul_stall_count = 0) 2536
                end
            else
                begin
                    coverage0[2535] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = False) 2535
                    if ((~(|or1200_cpu_or1200_mult_mac_mul_stall_count)))
                        begin
                            coverage0[2537] = 1;  //assertion( Not(bvredor(or1200_cpu_or1200_mult_mac_mul_stall_count) == 1) = True) 2537
                            or1200_cpu_or1200_mult_mac_mul_stall_count <= {or1200_cpu_or1200_mult_mac_mul_stall_count[0], (or1200_cpu_or1200_mult_mac_alu_op_mul & (~or1200_cpu_or1200_mult_mac_ex_freeze_r))};  //assertion( or1200_cpu_or1200_mult_mac_mul_stall_count = Concat(Extract(0, 0, or1200_cpu_or1200_mult_mac_mul_stall_count), or1200_cpu_or1200_mult_mac_alu_op_mul & If(Not(or1200_cpu_or1200_mult_mac_ex_freeze_r == 1) == True, 1, 0))) 2539
                        end
                    else
                        begin
                            coverage0[2538] = 1;  //assertion( Not(bvredor(or1200_cpu_or1200_mult_mac_mul_stall_count) == 1) = False) 2538
                            or1200_cpu_or1200_mult_mac_mul_stall_count <= {or1200_cpu_or1200_mult_mac_mul_stall_count[0], 1'b0};  //assertion( or1200_cpu_or1200_mult_mac_mul_stall_count = Concat(Extract(0, 0, or1200_cpu_or1200_mult_mac_mul_stall_count), 0)) 2540
                        end
                end
        end

    //Following code is from line 3961
        always @(posedge or1200_cpu_or1200_mult_mac_clk or posedge or1200_cpu_or1200_mult_mac_rst) begin
            if ((or1200_cpu_or1200_mult_mac_rst == 1'b1))
                begin
                    coverage0[2541] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = True) 2541
                    or1200_cpu_or1200_mult_mac_div_quot_r <= 64'h0000000000000000;  //assertion( or1200_cpu_or1200_mult_mac_div_quot_r = 0) 2543
                    or1200_cpu_or1200_mult_mac_div_free <= 1'b1;  //assertion( or1200_cpu_or1200_mult_mac_div_free = 1) 2544
                    or1200_cpu_or1200_mult_mac_div_cntr <= 6'h00;  //assertion( or1200_cpu_or1200_mult_mac_div_cntr = 0) 2545
                end
            else
                begin
                    coverage0[2542] = 1;  //assertion( 1 == or1200_cpu_or1200_mult_mac_rst = False) 2542
                    if (or1200_cpu_or1200_mult_mac_div_by_zero)
                        begin
                            coverage0[2546] = 1;  //assertion( 0 != or1200_cpu_or1200_mult_mac_div_by_zero = True) 2546
                            or1200_cpu_or1200_mult_mac_div_quot_r <= 64'h0000000000000000;  //assertion( or1200_cpu_or1200_mult_mac_div_quot_r = 0) 2548
                            or1200_cpu_or1200_mult_mac_div_free <= 1'b1;  //assertion( or1200_cpu_or1200_mult_mac_div_free = 1) 2549
                            or1200_cpu_or1200_mult_mac_div_cntr <= 6'h00;  //assertion( or1200_cpu_or1200_mult_mac_div_cntr = 0) 2550
                        end
                    else
                        begin
                            coverage0[2547] = 1;  //assertion( 0 != or1200_cpu_or1200_mult_mac_div_by_zero = False) 2547
                            if ((|or1200_cpu_or1200_mult_mac_div_cntr))
                                begin
                                    coverage0[2551] = 1;  //assertion( bvredor(or1200_cpu_or1200_mult_mac_div_cntr) = True) 2551
                                    if (or1200_cpu_or1200_mult_mac_div_tmp[31])
                                        begin
                                            coverage0[2553] = 1;  //assertion( Extract(31, 31, or1200_cpu_or1200_mult_mac_div_tmp) = True) 2553
                                            or1200_cpu_or1200_mult_mac_div_quot_r <= {or1200_cpu_or1200_mult_mac_div_quot_r[62:0], 1'b0};  //assertion( or1200_cpu_or1200_mult_mac_div_quot_r = Concat(Extract(62, 0, or1200_cpu_or1200_mult_mac_div_quot_r), 0)) 2555
                                        end
                                    else
                                        begin
                                            coverage0[2554] = 1;  //assertion( Extract(31, 31, or1200_cpu_or1200_mult_mac_div_tmp) = False) 2554
                                            or1200_cpu_or1200_mult_mac_div_quot_r <= {or1200_cpu_or1200_mult_mac_div_tmp[30:0], or1200_cpu_or1200_mult_mac_div_quot_r[31:0], 1'b1};  //assertion( or1200_cpu_or1200_mult_mac_div_quot_r = Concat(Concat(Extract(30, 0, or1200_cpu_or1200_mult_mac_div_tmp), Extract(31, 0, or1200_cpu_or1200_mult_mac_div_quot_r)), 1)) 2556
                                        end
                                    or1200_cpu_or1200_mult_mac_div_cntr <= (or1200_cpu_or1200_mult_mac_div_cntr - 6'h01);  //assertion( or1200_cpu_or1200_mult_mac_div_cntr = or1200_cpu_or1200_mult_mac_div_cntr - 1) 2557
                                end
                            else
                                begin
                                    coverage0[2552] = 1;  //assertion( bvredor(or1200_cpu_or1200_mult_mac_div_cntr) = False) 2552
                                    if ((or1200_cpu_or1200_mult_mac_alu_op_div && or1200_cpu_or1200_mult_mac_div_free))
                                        begin
                                            coverage0[2558] = 1;  //assertion( And(or1200_cpu_or1200_mult_mac_alu_op_div == 1, or1200_cpu_or1200_mult_mac_div_free == 1) = True) 2558
                                            or1200_cpu_or1200_mult_mac_div_quot_r <= {31'h00000000, or1200_cpu_or1200_mult_mac_x, 1'b0};  //assertion( or1200_cpu_or1200_mult_mac_div_quot_r = Concat(Concat(0, or1200_cpu_or1200_mult_mac_x), 0)) 2560
                                            or1200_cpu_or1200_mult_mac_div_cntr <= 6'h20;  //assertion( or1200_cpu_or1200_mult_mac_div_cntr = 32) 2561
                                            or1200_cpu_or1200_mult_mac_div_free <= 1'b0;  //assertion( or1200_cpu_or1200_mult_mac_div_free = 0) 2562
                                        end
                                    else
                                        begin
                                            coverage0[2559] = 1;  //assertion( And(or1200_cpu_or1200_mult_mac_alu_op_div == 1, or1200_cpu_or1200_mult_mac_div_free == 1) = False) 2559
                                            if ((or1200_cpu_or1200_mult_mac_div_free | (~or1200_cpu_or1200_mult_mac_ex_freeze)))
                                                begin
                                                    coverage0[2563] = 1;  //assertion( or1200_cpu_or1200_mult_mac_div_free | If(Not(or1200_cpu_or1200_mult_mac_ex_freeze == 1) == True, 1, 0) = True) 2563
                                                    or1200_cpu_or1200_mult_mac_div_free <= 1'b1;  //assertion( or1200_cpu_or1200_mult_mac_div_free = 1) 2565
                                                end
                                            else
                                                    coverage0[2564] = 1;  //assertion( or1200_cpu_or1200_mult_mac_div_free | If(Not(or1200_cpu_or1200_mult_mac_ex_freeze == 1) == True, 1, 0) = False) 2564
                                        end
                                end
                        end
                end
        end

    //Following code is from line 3983
        always @(or1200_cpu_or1200_sprs_spr_addr) begin
            case (or1200_cpu_or1200_sprs_spr_addr[15:11])
              5'h00:
                begin
                    coverage0[2566] = 1;  //assertion( 0 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2566
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000001;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 1) 2567
                end
              5'h01:
                begin
                    coverage0[2568] = 1;  //assertion( 1 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2568
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000002;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 2) 2569
                end
              5'h02:
                begin
                    coverage0[2570] = 1;  //assertion( 2 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2570
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000004;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 4) 2571
                end
              5'h03:
                begin
                    coverage0[2572] = 1;  //assertion( 3 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2572
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000008;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 8) 2573
                end
              5'h04:
                begin
                    coverage0[2574] = 1;  //assertion( 4 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2574
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000010;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 16) 2575
                end
              5'h05:
                begin
                    coverage0[2576] = 1;  //assertion( 5 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2576
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000020;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 32) 2577
                end
              5'h06:
                begin
                    coverage0[2578] = 1;  //assertion( 6 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2578
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000040;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 64) 2579
                end
              5'h07:
                begin
                    coverage0[2580] = 1;  //assertion( 7 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2580
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000080;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 128) 2581
                end
              5'h08:
                begin
                    coverage0[2582] = 1;  //assertion( 8 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2582
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000100;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 256) 2583
                end
              5'h09:
                begin
                    coverage0[2584] = 1;  //assertion( 9 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2584
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000200;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 512) 2585
                end
              5'h0a:
                begin
                    coverage0[2586] = 1;  //assertion( 10 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2586
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000400;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 1024) 2587
                end
              5'h0b:
                begin
                    coverage0[2588] = 1;  //assertion( 11 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2588
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00000800;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 2048) 2589
                end
              5'h0c:
                begin
                    coverage0[2590] = 1;  //assertion( 12 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2590
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00001000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 4096) 2591
                end
              5'h0d:
                begin
                    coverage0[2592] = 1;  //assertion( 13 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2592
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00002000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 8192) 2593
                end
              5'h0e:
                begin
                    coverage0[2594] = 1;  //assertion( 14 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2594
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00004000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 16384) 2595
                end
              5'h0f:
                begin
                    coverage0[2596] = 1;  //assertion( 15 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2596
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00008000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 32768) 2597
                end
              5'h10:
                begin
                    coverage0[2598] = 1;  //assertion( 16 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2598
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00010000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 65536) 2599
                end
              5'h11:
                begin
                    coverage0[2600] = 1;  //assertion( 17 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2600
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00020000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 131072) 2601
                end
              5'h12:
                begin
                    coverage0[2602] = 1;  //assertion( 18 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2602
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00040000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 262144) 2603
                end
              5'h13:
                begin
                    coverage0[2604] = 1;  //assertion( 19 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2604
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00080000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 524288) 2605
                end
              5'h14:
                begin
                    coverage0[2606] = 1;  //assertion( 20 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2606
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00100000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 1048576) 2607
                end
              5'h15:
                begin
                    coverage0[2608] = 1;  //assertion( 21 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2608
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00200000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 2097152) 2609
                end
              5'h16:
                begin
                    coverage0[2610] = 1;  //assertion( 22 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2610
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00400000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 4194304) 2611
                end
              5'h17:
                begin
                    coverage0[2612] = 1;  //assertion( 23 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2612
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h00800000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 8388608) 2613
                end
              5'h18:
                begin
                    coverage0[2614] = 1;  //assertion( 24 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2614
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h01000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 16777216) 2615
                end
              5'h19:
                begin
                    coverage0[2616] = 1;  //assertion( 25 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2616
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h02000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 33554432) 2617
                end
              5'h1a:
                begin
                    coverage0[2618] = 1;  //assertion( 26 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2618
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h04000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 67108864) 2619
                end
              5'h1b:
                begin
                    coverage0[2620] = 1;  //assertion( 27 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2620
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h08000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 134217728) 2621
                end
              5'h1c:
                begin
                    coverage0[2622] = 1;  //assertion( 28 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2622
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h10000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 268435456) 2623
                end
              5'h1d:
                begin
                    coverage0[2624] = 1;  //assertion( 29 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2624
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h20000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 536870912) 2625
                end
              5'h1e:
                begin
                    coverage0[2626] = 1;  //assertion( 30 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2626
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h40000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 1073741824) 2627
                end
              5'h1f:
                begin
                    coverage0[2628] = 1;  //assertion( 31 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2628
                    or1200_cpu_or1200_sprs_unqualified_cs = 32'h80000000;  //assertion( or1200_cpu_or1200_sprs_unqualified_cs = 2147483648) 2629
                end
            endcase
        end

    //Following code is from line 4018
        always @(posedge or1200_cpu_or1200_sprs_rst or posedge or1200_cpu_or1200_sprs_clk) begin
            if ((or1200_cpu_or1200_sprs_rst == 1'b1))
                begin
                    coverage0[2630] = 1;  //assertion( 1 == or1200_cpu_or1200_sprs_rst = True) 2630
                    or1200_cpu_or1200_sprs_sr_reg <= 17'h08001;  //assertion( or1200_cpu_or1200_sprs_sr_reg = 32769) 2632
                end
            else
                begin
                    coverage0[2631] = 1;  //assertion( 1 == or1200_cpu_or1200_sprs_rst = False) 2631
                    if (or1200_cpu_or1200_sprs_except_started)
                        begin
                            coverage0[2633] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_except_started = True) 2633
                            or1200_cpu_or1200_sprs_sr_reg <= or1200_cpu_or1200_sprs_to_sr;  //assertion( or1200_cpu_or1200_sprs_sr_reg = or1200_cpu_or1200_sprs_to_sr) 2635
                        end
                    else
                        begin
                            coverage0[2634] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_except_started = False) 2634
                            if (or1200_cpu_or1200_sprs_sr_we)
                                begin
                                    coverage0[2636] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_sr_we = True) 2636
                                    or1200_cpu_or1200_sprs_sr_reg <= or1200_cpu_or1200_sprs_to_sr;  //assertion( or1200_cpu_or1200_sprs_sr_reg = or1200_cpu_or1200_sprs_to_sr) 2638
                                end
                            else
                                    coverage0[2637] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_sr_we = False) 2637
                        end
                end
        end

    //Following code is from line 4022
        always @(posedge or1200_cpu_or1200_sprs_rst or posedge or1200_cpu_or1200_sprs_clk) begin
            if ((or1200_cpu_or1200_sprs_rst == 1'b1))
                begin
                    coverage0[2639] = 1;  //assertion( 1 == or1200_cpu_or1200_sprs_rst = True) 2639
                    or1200_cpu_or1200_sprs_sr_reg_bit_eph <= 1'b0;  //assertion( or1200_cpu_or1200_sprs_sr_reg_bit_eph = 0) 2641
                    or1200_cpu_or1200_sprs_sr_reg_bit_eph_select <= 1'b1;  //assertion( or1200_cpu_or1200_sprs_sr_reg_bit_eph_select = 1) 2642
                end
            else
                begin
                    coverage0[2640] = 1;  //assertion( 1 == or1200_cpu_or1200_sprs_rst = False) 2640
                    if (or1200_cpu_or1200_sprs_sr_reg_bit_eph_select)
                        begin
                            coverage0[2643] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_sr_reg_bit_eph_select = True) 2643
                            or1200_cpu_or1200_sprs_sr_reg_bit_eph <= or1200_cpu_or1200_sprs_boot_adr_sel_i;  //assertion( or1200_cpu_or1200_sprs_sr_reg_bit_eph = or1200_cpu_or1200_sprs_boot_adr_sel_i) 2645
                            or1200_cpu_or1200_sprs_sr_reg_bit_eph_select <= 1'b0;  //assertion( or1200_cpu_or1200_sprs_sr_reg_bit_eph_select = 0) 2646
                        end
                    else
                        begin
                            coverage0[2644] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_sr_reg_bit_eph_select = False) 2644
                            if (or1200_cpu_or1200_sprs_sr_we)
                                begin
                                    coverage0[2647] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_sr_we = True) 2647
                                    or1200_cpu_or1200_sprs_sr_reg_bit_eph <= or1200_cpu_or1200_sprs_to_sr[14];  //assertion( or1200_cpu_or1200_sprs_sr_reg_bit_eph = Extract(14, 14, or1200_cpu_or1200_sprs_to_sr)) 2649
                                end
                            else
                                    coverage0[2648] = 1;  //assertion( 0 != or1200_cpu_or1200_sprs_sr_we = False) 2648
                        end
                end
        end

    //Following code is from line 4032
        always @(or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed or or1200_cpu_or1200_sprs_sr_reg) begin
            or1200_cpu_or1200_sprs_sr = {or1200_cpu_or1200_sprs_sr_reg[16:15], or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed, or1200_cpu_or1200_sprs_sr_reg[13:0]};  //assertion( or1200_cpu_or1200_sprs_sr = Concat(Concat(Extract(16, 15, or1200_cpu_or1200_sprs_sr_reg), or1200_cpu_or1200_sprs_sr_reg_bit_eph_muxed), Extract(13, 0, or1200_cpu_or1200_sprs_sr_reg))) 2650
        end

    //Following code is from line 4034
        always @(or1200_cpu_or1200_sprs_spr_dat_tt or or1200_cpu_or1200_sprs_spr_dat_du or or1200_cpu_or1200_sprs_spr_dat_immu or or1200_cpu_or1200_sprs_spr_dat_dmmu or or1200_cpu_or1200_sprs_spr_dat_fpu or or1200_cpu_or1200_sprs_spr_dat_pm or or1200_cpu_or1200_sprs_spr_dat_pic or or1200_cpu_or1200_sprs_spr_dat_mac or or1200_cpu_or1200_sprs_sys_data or or1200_cpu_or1200_sprs_spr_addr) begin
            case (or1200_cpu_or1200_sprs_spr_addr[15:11])
              5'h00:
                begin
                    coverage0[2651] = 1;  //assertion( 0 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2651
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_sys_data;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_sys_data) 2652
                end
              5'h0a:
                begin
                    coverage0[2653] = 1;  //assertion( 10 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2653
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_tt;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_tt) 2654
                end
              5'h09:
                begin
                    coverage0[2655] = 1;  //assertion( 9 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2655
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_pic;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_pic) 2656
                end
              5'h08:
                begin
                    coverage0[2657] = 1;  //assertion( 8 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2657
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_pm;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_pm) 2658
                end
              5'h01:
                begin
                    coverage0[2659] = 1;  //assertion( 1 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2659
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_dmmu;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_dmmu) 2660
                end
              5'h02:
                begin
                    coverage0[2661] = 1;  //assertion( 2 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2661
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_immu;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_immu) 2662
                end
              5'h05:
                begin
                    coverage0[2663] = 1;  //assertion( 5 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2663
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_mac;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_mac) 2664
                end
              5'h0b:
                begin
                    coverage0[2665] = 1;  //assertion( 11 == Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) = True) 2665
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_fpu;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_fpu) 2666
                end
              default:
                begin
                    coverage0[2667] = 1;  //assertion( If(0 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(10 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(9 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(8 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(1 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(2 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(5 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) & If(11 != Extract(15, 11, or1200_cpu_or1200_sprs_spr_addr) == True, 1, 0) = True) 2667
                    or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_du;  //assertion( or1200_cpu_or1200_sprs_to_wbmux = or1200_cpu_or1200_sprs_spr_dat_du) 2668
                end
            endcase
        end

    //Following code is from line 4046
        always @(posedge or1200_cpu_or1200_lsu_rst or posedge or1200_cpu_or1200_lsu_clk) begin
            if ((or1200_cpu_or1200_lsu_rst == 1'b1))
                begin
                    coverage0[2669] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_rst = True) 2669
                    or1200_cpu_or1200_lsu_ex_lsu_op <= 4'h0;  //assertion( or1200_cpu_or1200_lsu_ex_lsu_op = 0) 2671
                end
            else
                begin
                    coverage0[2670] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_rst = False) 2670
                    if ((((~or1200_cpu_or1200_lsu_ex_freeze) & or1200_cpu_or1200_lsu_id_freeze) | or1200_cpu_or1200_lsu_flushpipe))
                        begin
                            coverage0[2672] = 1;  //assertion( If(Not(or1200_cpu_or1200_lsu_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_lsu_id_freeze | or1200_cpu_or1200_lsu_flushpipe = True) 2672
                            or1200_cpu_or1200_lsu_ex_lsu_op <= 4'h0;  //assertion( or1200_cpu_or1200_lsu_ex_lsu_op = 0) 2674
                        end
                    else
                        begin
                            coverage0[2673] = 1;  //assertion( If(Not(or1200_cpu_or1200_lsu_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_lsu_id_freeze | or1200_cpu_or1200_lsu_flushpipe = False) 2673
                            if ((~or1200_cpu_or1200_lsu_ex_freeze))
                                begin
                                    coverage0[2675] = 1;  //assertion( Not(or1200_cpu_or1200_lsu_ex_freeze == 1) = True) 2675
                                    or1200_cpu_or1200_lsu_ex_lsu_op <= or1200_cpu_or1200_lsu_id_lsu_op;  //assertion( or1200_cpu_or1200_lsu_ex_lsu_op = or1200_cpu_or1200_lsu_id_lsu_op) 2677
                                end
                            else
                                    coverage0[2676] = 1;  //assertion( Not(or1200_cpu_or1200_lsu_ex_freeze == 1) = False) 2676
                        end
                end
        end

    //Following code is from line 4050
        always @(posedge or1200_cpu_or1200_lsu_rst or posedge or1200_cpu_or1200_lsu_clk) begin
            if ((or1200_cpu_or1200_lsu_rst == 1'b1))
                begin
                    coverage0[2678] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_rst = True) 2678
                    or1200_cpu_or1200_lsu_dcpu_adr_r <= 3'h0;  //assertion( or1200_cpu_or1200_lsu_dcpu_adr_r = 0) 2680
                end
            else
                begin
                    coverage0[2679] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_rst = False) 2679
                    if ((~or1200_cpu_or1200_lsu_ex_freeze))
                        begin
                            coverage0[2681] = 1;  //assertion( Not(or1200_cpu_or1200_lsu_ex_freeze == 1) = True) 2681
                            or1200_cpu_or1200_lsu_dcpu_adr_r <= or1200_cpu_or1200_lsu_id_precalc_sum;  //assertion( or1200_cpu_or1200_lsu_dcpu_adr_r = or1200_cpu_or1200_lsu_id_precalc_sum) 2683
                        end
                    else
                            coverage0[2682] = 1;  //assertion( Not(or1200_cpu_or1200_lsu_ex_freeze == 1) = False) 2682
                end
        end

    //Following code is from line 4053
        always @(posedge or1200_cpu_or1200_lsu_rst or posedge or1200_cpu_or1200_lsu_clk) begin
            if ((or1200_cpu_or1200_lsu_rst == 1'b1))
                begin
                    coverage0[2684] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_rst = True) 2684
                    or1200_cpu_or1200_lsu_except_align <= 1'b0;  //assertion( or1200_cpu_or1200_lsu_except_align = 0) 2686
                end
            else
                begin
                    coverage0[2685] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_rst = False) 2685
                    if ((((~or1200_cpu_or1200_lsu_ex_freeze) & or1200_cpu_or1200_lsu_id_freeze) | or1200_cpu_or1200_lsu_flushpipe))
                        begin
                            coverage0[2687] = 1;  //assertion( If(Not(or1200_cpu_or1200_lsu_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_lsu_id_freeze | or1200_cpu_or1200_lsu_flushpipe = True) 2687
                            or1200_cpu_or1200_lsu_except_align <= 1'b0;  //assertion( or1200_cpu_or1200_lsu_except_align = 0) 2689
                        end
                    else
                        begin
                            coverage0[2688] = 1;  //assertion( If(Not(or1200_cpu_or1200_lsu_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_lsu_id_freeze | or1200_cpu_or1200_lsu_flushpipe = False) 2688
                            if ((~or1200_cpu_or1200_lsu_ex_freeze))
                                begin
                                    coverage0[2690] = 1;  //assertion( Not(or1200_cpu_or1200_lsu_ex_freeze == 1) = True) 2690
                                    or1200_cpu_or1200_lsu_except_align <= (((((or1200_cpu_or1200_lsu_id_lsu_op == 4'hc) | (or1200_cpu_or1200_lsu_id_lsu_op == 4'h4)) | (or1200_cpu_or1200_lsu_id_lsu_op == 4'h5)) & or1200_cpu_or1200_lsu_id_precalc_sum[0]) | ((((or1200_cpu_or1200_lsu_id_lsu_op == 4'he) | (or1200_cpu_or1200_lsu_id_lsu_op == 4'h6)) | (or1200_cpu_or1200_lsu_id_lsu_op == 4'h7)) & (|or1200_cpu_or1200_lsu_id_precalc_sum[1:0])));  //assertion( or1200_cpu_or1200_lsu_except_align = (If((12 == or1200_cpu_or1200_lsu_id_lsu_op) == True, 1, 0) | If((4 == or1200_cpu_or1200_lsu_id_lsu_op) == True, 1, 0) | If((5 == or1200_cpu_or1200_lsu_id_lsu_op) == True, 1, 0)) & Extract(0, 0, or1200_cpu_or1200_lsu_id_precalc_sum) | (If((14 == or1200_cpu_or1200_lsu_id_lsu_op) == True, 1, 0) | If((6 == or1200_cpu_or1200_lsu_id_lsu_op) == True, 1, 0) | If((7 == or1200_cpu_or1200_lsu_id_lsu_op) == True, 1, 0)) & bvredor(Extract(1, 0, or1200_cpu_or1200_lsu_id_precalc_sum))) 2692
                                end
                            else
                                    coverage0[2691] = 1;  //assertion( Not(or1200_cpu_or1200_lsu_ex_freeze == 1) = False) 2691
                        end
                end
        end

    //Following code is from line 4057
        always @(or1200_cpu_or1200_lsu_dcpu_adr_o or or1200_cpu_or1200_lsu_ex_lsu_op) begin
            case ({or1200_cpu_or1200_lsu_ex_lsu_op, or1200_cpu_or1200_lsu_dcpu_adr_o[1:0]})
              6'h28:
                begin
                    coverage0[2693] = 1;  //assertion( 40 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2693
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h8;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 8) 2694
                end
              6'h29:
                begin
                    coverage0[2695] = 1;  //assertion( 41 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2695
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h4;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 4) 2696
                end
              6'h2a:
                begin
                    coverage0[2697] = 1;  //assertion( 42 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2697
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h2;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 2) 2698
                end
              6'h2b:
                begin
                    coverage0[2699] = 1;  //assertion( 43 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2699
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h1;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 1) 2700
                end
              6'h30:
                begin
                    coverage0[2701] = 1;  //assertion( 48 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2701
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'hc;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 12) 2702
                end
              6'h32:
                begin
                    coverage0[2703] = 1;  //assertion( 50 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2703
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h3;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 3) 2704
                end
              6'h38:
                begin
                    coverage0[2705] = 1;  //assertion( 56 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2705
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'hf;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 15) 2706
                end
              6'h08:
                begin
                    coverage0[2707] = 1;  //assertion( 8 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2707
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h8;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 8) 2708
                end
              6'h0c:
                begin
                    coverage0[2709] = 1;  //assertion( 12 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2709
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h8;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 8) 2710
                end
              6'h09:
                begin
                    coverage0[2711] = 1;  //assertion( 9 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2711
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h4;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 4) 2712
                end
              6'h0d:
                begin
                    coverage0[2713] = 1;  //assertion( 13 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2713
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h4;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 4) 2714
                end
              6'h0a:
                begin
                    coverage0[2715] = 1;  //assertion( 10 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2715
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h2;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 2) 2716
                end
              6'h0e:
                begin
                    coverage0[2717] = 1;  //assertion( 14 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2717
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h2;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 2) 2718
                end
              6'h0b:
                begin
                    coverage0[2719] = 1;  //assertion( 11 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2719
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h1;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 1) 2720
                end
              6'h0f:
                begin
                    coverage0[2721] = 1;  //assertion( 15 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2721
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h1;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 1) 2722
                end
              6'h10:
                begin
                    coverage0[2723] = 1;  //assertion( 16 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2723
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'hc;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 12) 2724
                end
              6'h14:
                begin
                    coverage0[2725] = 1;  //assertion( 20 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2725
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'hc;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 12) 2726
                end
              6'h12:
                begin
                    coverage0[2727] = 1;  //assertion( 18 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2727
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h3;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 3) 2728
                end
              6'h16:
                begin
                    coverage0[2729] = 1;  //assertion( 22 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2729
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h3;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 3) 2730
                end
              6'h18:
                begin
                    coverage0[2731] = 1;  //assertion( 24 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2731
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'hf;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 15) 2732
                end
              6'h1c:
                begin
                    coverage0[2733] = 1;  //assertion( 28 == Concat(or1200_cpu_or1200_lsu_ex_lsu_op, Extract(1, 0, or1200_cpu_or1200_lsu_dcpu_adr_o)) = True) 2733
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'hf;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 15) 2734
                end
              default:
                begin
                    coverage0[2735] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 2735
                    or1200_cpu_or1200_lsu_dcpu_sel_o = 4'h0;  //assertion( or1200_cpu_or1200_lsu_dcpu_sel_o = 0) 2736
                end
            endcase
        end

    //Following code is from line 4082
        always @(or1200_cpu_or1200_lsu_or1200_mem2reg_memdata or or1200_cpu_or1200_lsu_or1200_mem2reg_addr) begin
            case (or1200_cpu_or1200_lsu_or1200_mem2reg_addr)
              2'h0:
                begin
                    coverage0[2737] = 1;  //assertion( 0 == or1200_cpu_or1200_lsu_or1200_mem2reg_addr = True) 2737
                    or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = or1200_cpu_or1200_lsu_or1200_mem2reg_memdata;  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = or1200_cpu_or1200_lsu_or1200_mem2reg_memdata) 2738
                end
              2'h1:
                begin
                    coverage0[2739] = 1;  //assertion( 1 == or1200_cpu_or1200_lsu_or1200_mem2reg_addr = True) 2739
                    or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = {or1200_cpu_or1200_lsu_or1200_mem2reg_memdata[23:0], 8'h00};  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = Concat(Extract(23, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_memdata), 0)) 2740
                end
              2'h2:
                begin
                    coverage0[2741] = 1;  //assertion( 2 == or1200_cpu_or1200_lsu_or1200_mem2reg_addr = True) 2741
                    or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = {or1200_cpu_or1200_lsu_or1200_mem2reg_memdata[15:0], 16'h0000};  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = Concat(Extract(15, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_memdata), 0)) 2742
                end
              2'h3:
                begin
                    coverage0[2743] = 1;  //assertion( 3 == or1200_cpu_or1200_lsu_or1200_mem2reg_addr = True) 2743
                    or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = {or1200_cpu_or1200_lsu_or1200_mem2reg_memdata[7:0], 24'h000000};  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_aligned = Concat(Extract(7, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_memdata), 0)) 2744
                end
            endcase
        end

    //Following code is from line 4089
        always @(or1200_cpu_or1200_lsu_or1200_mem2reg_aligned or or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op) begin
            case (or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op)
              4'h2:
                begin
                    coverage0[2745] = 1;  //assertion( 2 == or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = True) 2745
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[7:0] = or1200_cpu_or1200_lsu_or1200_mem2reg_aligned[31:24];  //assertion( Extract(7, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = Extract(31, 24, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)) 2746
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[31:8] = 24'h000000;  //assertion( Extract(31, 8, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = 0) 2747
                end
              4'h3:
                begin
                    coverage0[2748] = 1;  //assertion( 3 == or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = True) 2748
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[7:0] = or1200_cpu_or1200_lsu_or1200_mem2reg_aligned[31:24];  //assertion( Extract(7, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = Extract(31, 24, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)) 2749
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[31:8] = { 24{ or1200_cpu_or1200_lsu_or1200_mem2reg_aligned[31] } };  //assertion( Extract(31, 8, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(..., ...), Extract(31, 31, ...)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned))) 2750
                end
              4'h4:
                begin
                    coverage0[2751] = 1;  //assertion( 4 == or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = True) 2751
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[15:0] = or1200_cpu_or1200_lsu_or1200_mem2reg_aligned[31:16];  //assertion( Extract(15, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = Extract(31, 16, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)) 2752
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[31:16] = 16'h0000;  //assertion( Extract(31, 16, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = 0) 2753
                end
              4'h5:
                begin
                    coverage0[2754] = 1;  //assertion( 5 == or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op = True) 2754
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[15:0] = or1200_cpu_or1200_lsu_or1200_mem2reg_aligned[31:16];  //assertion( Extract(15, 0, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = Extract(31, 16, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)) 2755
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata[31:16] = { 16{ or1200_cpu_or1200_lsu_or1200_mem2reg_aligned[31] } };  //assertion( Extract(31, 16, or1200_cpu_or1200_lsu_or1200_mem2reg_regdata) = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned)), Extract(31, 31, or1200_cpu_or1200_lsu_or1200_mem2reg_aligned))) 2756
                end
              default:
                begin
                    coverage0[2757] = 1;  //assertion( If(2 != or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op == True, 1, 0) & If(3 != or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op == True, 1, 0) & If(4 != or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op == True, 1, 0) & If(5 != or1200_cpu_or1200_lsu_or1200_mem2reg_lsu_op == True, 1, 0) = True) 2757
                    or1200_cpu_or1200_lsu_or1200_mem2reg_regdata = or1200_cpu_or1200_lsu_or1200_mem2reg_aligned;  //assertion( or1200_cpu_or1200_lsu_or1200_mem2reg_regdata = or1200_cpu_or1200_lsu_or1200_mem2reg_aligned) 2758
                end
            endcase
        end

    //Following code is from line 4109
        always @(or1200_cpu_or1200_lsu_or1200_reg2mem_regdata or or1200_cpu_or1200_lsu_or1200_reg2mem_addr or or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op) begin
            case ({or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr})
              6'h28:
                begin
                    coverage0[2759] = 1;  //assertion( 40 == Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) = True) 2759
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[7:0];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = Extract(7, 0, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2760
                end
              6'h30:
                begin
                    coverage0[2761] = 1;  //assertion( 48 == Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) = True) 2761
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[15:8];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = Extract(15, 8, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2762
                end
              default:
                begin
                    coverage0[2763] = 1;  //assertion( If(40 != Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) == True, 1, 0) & If(48 != Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) == True, 1, 0) = True) 2763
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[31:24];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hh = Extract(31, 24, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2764
                end
            endcase
        end

    //Following code is from line 4115
        always @(or1200_cpu_or1200_lsu_or1200_reg2mem_regdata or or1200_cpu_or1200_lsu_or1200_reg2mem_addr or or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op) begin
            case ({or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr})
              6'h38:
                begin
                    coverage0[2765] = 1;  //assertion( 56 == Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) = True) 2765
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[23:16];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl = Extract(23, 16, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2766
                end
              default:
                begin
                    coverage0[2767] = 1;  //assertion( 56 != Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) = True) 2767
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[7:0];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_hl = Extract(7, 0, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2768
                end
            endcase
        end

    //Following code is from line 4120
        always @(or1200_cpu_or1200_lsu_or1200_reg2mem_regdata or or1200_cpu_or1200_lsu_or1200_reg2mem_addr or or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op) begin
            case ({or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr})
              6'h2a:
                begin
                    coverage0[2769] = 1;  //assertion( 42 == Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) = True) 2769
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[7:0];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh = Extract(7, 0, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2770
                end
              default:
                begin
                    coverage0[2771] = 1;  //assertion( 42 != Concat(or1200_cpu_or1200_lsu_or1200_reg2mem_lsu_op, or1200_cpu_or1200_lsu_or1200_reg2mem_addr) = True) 2771
                    or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[15:8];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_lh = Extract(15, 8, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2772
                end
            endcase
        end

    //Following code is from line 4125
        always @(or1200_cpu_or1200_lsu_or1200_reg2mem_regdata) begin
            or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll = or1200_cpu_or1200_lsu_or1200_reg2mem_regdata[7:0];  //assertion( or1200_cpu_or1200_lsu_or1200_reg2mem_memdata_ll = Extract(7, 0, or1200_cpu_or1200_lsu_or1200_reg2mem_regdata)) 2773
        end

    //Following code is from line 4127
        always @(posedge or1200_cpu_or1200_wbmux_rst or posedge or1200_cpu_or1200_wbmux_clk) begin
            if ((or1200_cpu_or1200_wbmux_rst == 1'b1))
                begin
                    coverage0[2774] = 1;  //assertion( 1 == or1200_cpu_or1200_wbmux_rst = True) 2774
                    or1200_cpu_or1200_wbmux_muxreg <= 32'h00000000;  //assertion( or1200_cpu_or1200_wbmux_muxreg = 0) 2776
                    or1200_cpu_or1200_wbmux_muxreg_valid <= 1'b0;  //assertion( or1200_cpu_or1200_wbmux_muxreg_valid = 0) 2777
                end
            else
                begin
                    coverage0[2775] = 1;  //assertion( 1 == or1200_cpu_or1200_wbmux_rst = False) 2775
                    if ((~or1200_cpu_or1200_wbmux_wb_freeze))
                        begin
                            coverage0[2778] = 1;  //assertion( Not(or1200_cpu_or1200_wbmux_wb_freeze == 1) = True) 2778
                            or1200_cpu_or1200_wbmux_muxreg <= or1200_cpu_or1200_wbmux_muxout;  //assertion( or1200_cpu_or1200_wbmux_muxreg = or1200_cpu_or1200_wbmux_muxout) 2780
                            or1200_cpu_or1200_wbmux_muxreg_valid <= or1200_cpu_or1200_wbmux_rfwb_op[0];  //assertion( or1200_cpu_or1200_wbmux_muxreg_valid = Extract(0, 0, or1200_cpu_or1200_wbmux_rfwb_op)) 2781
                        end
                    else
                            coverage0[2779] = 1;  //assertion( Not(or1200_cpu_or1200_wbmux_wb_freeze == 1) = False) 2779
                end
        end

    //Following code is from line 4136
        always @(or1200_cpu_or1200_wbmux_rfwb_op or or1200_cpu_or1200_wbmux_muxin_e or or1200_cpu_or1200_wbmux_muxin_d or or1200_cpu_or1200_wbmux_muxin_c or or1200_cpu_or1200_wbmux_muxin_b or or1200_cpu_or1200_wbmux_muxin_a) begin
            case (or1200_cpu_or1200_wbmux_rfwb_op[3:1])
              3'h0:
                begin
                    coverage0[2782] = 1;  //assertion( 0 == Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) = True) 2782
                    or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_a;  //assertion( or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_a) 2783
                end
              3'h1:
                begin
                    coverage0[2784] = 1;  //assertion( 1 == Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) = True) 2784
                    or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_b;  //assertion( or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_b) 2785
                end
              3'h2:
                begin
                    coverage0[2786] = 1;  //assertion( 2 == Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) = True) 2786
                    or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_c;  //assertion( or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_c) 2787
                end
              3'h3:
                begin
                    coverage0[2788] = 1;  //assertion( 3 == Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) = True) 2788
                    or1200_cpu_or1200_wbmux_muxout = (or1200_cpu_or1200_wbmux_muxin_d + 32'h00000008);  //assertion( or1200_cpu_or1200_wbmux_muxout = or1200_cpu_or1200_wbmux_muxin_d + 8) 2789
                end
              default:
                begin
                    coverage0[2790] = 1;  //assertion( If(0 != Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) == True, 1, 0) & If(1 != Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) == True, 1, 0) & If(2 != Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) == True, 1, 0) & If(3 != Extract(3, 1, or1200_cpu_or1200_wbmux_rfwb_op) == True, 1, 0) = True) 2790
                    or1200_cpu_or1200_wbmux_muxout = 0;  //assertion( or1200_cpu_or1200_wbmux_muxout = 0) 2791
                end
            endcase
        end

    //Following code is from line 4144
        always @(posedge or1200_cpu_or1200_freeze_rst or posedge or1200_cpu_or1200_freeze_clk) begin
            if ((or1200_cpu_or1200_freeze_rst == 1'b1))
                begin
                    coverage0[2792] = 1;  //assertion( 1 == or1200_cpu_or1200_freeze_rst = True) 2792
                    or1200_cpu_or1200_freeze_flushpipe_r <= 1'b0;  //assertion( or1200_cpu_or1200_freeze_flushpipe_r = 0) 2794
                end
            else
                begin
                    coverage0[2793] = 1;  //assertion( 1 == or1200_cpu_or1200_freeze_rst = False) 2793
                    if ((or1200_cpu_or1200_freeze_icpu_ack_i | or1200_cpu_or1200_freeze_icpu_err_i))
                        begin
                            coverage0[2795] = 1;  //assertion( or1200_cpu_or1200_freeze_icpu_ack_i | or1200_cpu_or1200_freeze_icpu_err_i = True) 2795
                            or1200_cpu_or1200_freeze_flushpipe_r <= or1200_cpu_or1200_freeze_flushpipe;  //assertion( or1200_cpu_or1200_freeze_flushpipe_r = or1200_cpu_or1200_freeze_flushpipe) 2797
                        end
                    else
                        begin
                            coverage0[2796] = 1;  //assertion( or1200_cpu_or1200_freeze_icpu_ack_i | or1200_cpu_or1200_freeze_icpu_err_i = False) 2796
                            if ((~or1200_cpu_or1200_freeze_flushpipe))
                                begin
                                    coverage0[2798] = 1;  //assertion( Not(or1200_cpu_or1200_freeze_flushpipe == 1) = True) 2798
                                    or1200_cpu_or1200_freeze_flushpipe_r <= 1'b0;  //assertion( or1200_cpu_or1200_freeze_flushpipe_r = 0) 2800
                                end
                            else
                                    coverage0[2799] = 1;  //assertion( Not(or1200_cpu_or1200_freeze_flushpipe == 1) = False) 2799
                        end
                end
        end

    //Following code is from line 4148
        always @(posedge or1200_cpu_or1200_freeze_rst or posedge or1200_cpu_or1200_freeze_clk) begin
            if ((or1200_cpu_or1200_freeze_rst == 1'b1))
                begin
                    coverage0[2801] = 1;  //assertion( 1 == or1200_cpu_or1200_freeze_rst = True) 2801
                    or1200_cpu_or1200_freeze_multicycle_cnt <= 3'h0;  //assertion( or1200_cpu_or1200_freeze_multicycle_cnt = 0) 2803
                end
            else
                begin
                    coverage0[2802] = 1;  //assertion( 1 == or1200_cpu_or1200_freeze_rst = False) 2802
                    if ((|or1200_cpu_or1200_freeze_multicycle_cnt))
                        begin
                            coverage0[2804] = 1;  //assertion( bvredor(or1200_cpu_or1200_freeze_multicycle_cnt) = True) 2804
                            or1200_cpu_or1200_freeze_multicycle_cnt <= (or1200_cpu_or1200_freeze_multicycle_cnt - 3'h1);  //assertion( or1200_cpu_or1200_freeze_multicycle_cnt = or1200_cpu_or1200_freeze_multicycle_cnt - 1) 2806
                        end
                    else
                        begin
                            coverage0[2805] = 1;  //assertion( bvredor(or1200_cpu_or1200_freeze_multicycle_cnt) = False) 2805
                            if (((|or1200_cpu_or1200_freeze_multicycle) & (~or1200_cpu_or1200_freeze_ex_freeze)))
                                begin
                                    coverage0[2807] = 1;  //assertion( bvredor(or1200_cpu_or1200_freeze_multicycle) & If(Not(or1200_cpu_or1200_freeze_ex_freeze == 1) == True, 1, 0) = True) 2807
                                    or1200_cpu_or1200_freeze_multicycle_cnt <= or1200_cpu_or1200_freeze_multicycle;  //assertion( or1200_cpu_or1200_freeze_multicycle_cnt = or1200_cpu_or1200_freeze_multicycle) 2809
                                end
                            else
                                    coverage0[2808] = 1;  //assertion( bvredor(or1200_cpu_or1200_freeze_multicycle) & If(Not(or1200_cpu_or1200_freeze_ex_freeze == 1) == True, 1, 0) = False) 2808
                        end
                end
        end

    //Following code is from line 4152
        always @(posedge or1200_cpu_or1200_freeze_rst or posedge or1200_cpu_or1200_freeze_clk) begin
            if ((or1200_cpu_or1200_freeze_rst == 1'b1))
                begin
                    coverage0[2810] = 1;  //assertion( 1 == or1200_cpu_or1200_freeze_rst = True) 2810
                    or1200_cpu_or1200_freeze_waiting_on <= 0;  //assertion( or1200_cpu_or1200_freeze_waiting_on = 0) 2812
                end
            else
                begin
                    coverage0[2811] = 1;  //assertion( 1 == or1200_cpu_or1200_freeze_rst = False) 2811
                    if (((or1200_cpu_or1200_freeze_waiting_on == 2'h1) & (~or1200_cpu_or1200_freeze_mac_stall)))
                        begin
                            coverage0[2813] = 1;  //assertion( If((1 == or1200_cpu_or1200_freeze_waiting_on) == True, 1, 0) & If(Not(or1200_cpu_or1200_freeze_mac_stall == 1) == True, 1, 0) = True) 2813
                            or1200_cpu_or1200_freeze_waiting_on <= 0;  //assertion( or1200_cpu_or1200_freeze_waiting_on = 0) 2815
                        end
                    else
                        begin
                            coverage0[2814] = 1;  //assertion( If((1 == or1200_cpu_or1200_freeze_waiting_on) == True, 1, 0) & If(Not(or1200_cpu_or1200_freeze_mac_stall == 1) == True, 1, 0) = False) 2814
                            if (((or1200_cpu_or1200_freeze_waiting_on == 2'h2) & or1200_cpu_or1200_freeze_fpu_done))
                                begin
                                    coverage0[2816] = 1;  //assertion( If((2 == or1200_cpu_or1200_freeze_waiting_on) == True, 1, 0) & or1200_cpu_or1200_freeze_fpu_done = True) 2816
                                    or1200_cpu_or1200_freeze_waiting_on <= 0;  //assertion( or1200_cpu_or1200_freeze_waiting_on = 0) 2818
                                end
                            else
                                begin
                                    coverage0[2817] = 1;  //assertion( If((2 == or1200_cpu_or1200_freeze_waiting_on) == True, 1, 0) & or1200_cpu_or1200_freeze_fpu_done = False) 2817
                                    if (((or1200_cpu_or1200_freeze_waiting_on == 2'h3) & or1200_cpu_or1200_freeze_mtspr_done))
                                        begin
                                            coverage0[2819] = 1;  //assertion( If((3 == or1200_cpu_or1200_freeze_waiting_on) == True, 1, 0) & or1200_cpu_or1200_freeze_mtspr_done = True) 2819
                                            or1200_cpu_or1200_freeze_waiting_on <= 0;  //assertion( or1200_cpu_or1200_freeze_waiting_on = 0) 2821
                                        end
                                    else
                                        begin
                                            coverage0[2820] = 1;  //assertion( If((3 == or1200_cpu_or1200_freeze_waiting_on) == True, 1, 0) & or1200_cpu_or1200_freeze_mtspr_done = False) 2820
                                            if ((~or1200_cpu_or1200_freeze_ex_freeze))
                                                begin
                                                    coverage0[2822] = 1;  //assertion( Not(or1200_cpu_or1200_freeze_ex_freeze == 1) = True) 2822
                                                    or1200_cpu_or1200_freeze_waiting_on <= or1200_cpu_or1200_freeze_wait_on;  //assertion( or1200_cpu_or1200_freeze_waiting_on = or1200_cpu_or1200_freeze_wait_on) 2824
                                                end
                                            else
                                                    coverage0[2823] = 1;  //assertion( Not(or1200_cpu_or1200_freeze_ex_freeze == 1) = False) 2823
                                        end
                                end
                        end
                end
        end

    //Following code is from line 4158
        always @(posedge or1200_cpu_or1200_except_rst or posedge or1200_cpu_or1200_except_clk) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2825] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2825
                    or1200_cpu_or1200_except_trace_trap <= 1'b0;  //assertion( or1200_cpu_or1200_except_trace_trap = 0) 2827
                end
            else
                begin
                    coverage0[2826] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2826
                    if ((~(or1200_cpu_or1200_except_trace_trap && (~or1200_cpu_or1200_except_ex_pc_val))))
                        begin
                            coverage0[2828] = 1;  //assertion( Not(And(or1200_cpu_or1200_except_trace_trap == 1, If(Not(or1200_cpu_or1200_except_ex_pc_val == 1) == True, 1, 0) == 1) == True) = True) 2828
                            or1200_cpu_or1200_except_trace_trap <= ((or1200_cpu_or1200_except_trace_cond & (~or1200_cpu_or1200_except_dsr_te)) & (~or1200_cpu_or1200_except_sr_ted));  //assertion( or1200_cpu_or1200_except_trace_trap = or1200_cpu_or1200_except_trace_cond & If(Not(or1200_cpu_or1200_except_dsr_te == 1) == True, 1, 0) & If(Not(or1200_cpu_or1200_except_sr_ted == 1) == True, 1, 0)) 2830
                        end
                    else
                            coverage0[2829] = 1;  //assertion( Not(And(or1200_cpu_or1200_except_trace_trap == 1, If(Not(or1200_cpu_or1200_except_ex_pc_val == 1) == True, 1, 0) == 1) == True) = False) 2829
                end
        end

    //Following code is from line 4161
        always @(posedge or1200_cpu_or1200_except_rst or posedge or1200_cpu_or1200_except_clk) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2831] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2831
                    or1200_cpu_or1200_except_ex_freeze_prev <= 1'b0;  //assertion( or1200_cpu_or1200_except_ex_freeze_prev = 0) 2833
                    or1200_cpu_or1200_except_sr_ted_prev <= 1'b0;  //assertion( or1200_cpu_or1200_except_sr_ted_prev = 0) 2834
                    or1200_cpu_or1200_except_dsr_te_prev <= 1'b0;  //assertion( or1200_cpu_or1200_except_dsr_te_prev = 0) 2835
                    or1200_cpu_or1200_except_dmr1_st_prev <= 1'b0;  //assertion( or1200_cpu_or1200_except_dmr1_st_prev = 0) 2836
                    or1200_cpu_or1200_except_dmr1_bt_prev <= 1'b0;  //assertion( or1200_cpu_or1200_except_dmr1_bt_prev = 0) 2837
                end
            else
                begin
                    coverage0[2832] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2832
                    or1200_cpu_or1200_except_ex_freeze_prev <= or1200_cpu_or1200_except_ex_freeze;  //assertion( or1200_cpu_or1200_except_ex_freeze_prev = or1200_cpu_or1200_except_ex_freeze) 2838
                    if (((~or1200_cpu_or1200_except_ex_freeze_prev) || or1200_cpu_or1200_except_ex_void))
                        begin
                            coverage0[2839] = 1;  //assertion( Or(If(Not(or1200_cpu_or1200_except_ex_freeze_prev == 1) == True, 1, 0) == 1, or1200_cpu_or1200_except_ex_void == 1) = True) 2839
                            or1200_cpu_or1200_except_sr_ted_prev <= or1200_cpu_or1200_except_sr[16];  //assertion( or1200_cpu_or1200_except_sr_ted_prev = Extract(16, 16, or1200_cpu_or1200_except_sr)) 2841
                            or1200_cpu_or1200_except_dsr_te_prev <= or1200_cpu_or1200_except_du_dsr[13];  //assertion( or1200_cpu_or1200_except_dsr_te_prev = Extract(13, 13, or1200_cpu_or1200_except_du_dsr)) 2842
                            or1200_cpu_or1200_except_dmr1_st_prev <= or1200_cpu_or1200_except_du_dmr1[22];  //assertion( or1200_cpu_or1200_except_dmr1_st_prev = Extract(22, 22, or1200_cpu_or1200_except_du_dmr1)) 2843
                            or1200_cpu_or1200_except_dmr1_bt_prev <= or1200_cpu_or1200_except_du_dmr1[23];  //assertion( or1200_cpu_or1200_except_dmr1_bt_prev = Extract(23, 23, or1200_cpu_or1200_except_du_dmr1)) 2844
                        end
                    else
                            coverage0[2840] = 1;  //assertion( Or(If(Not(or1200_cpu_or1200_except_ex_freeze_prev == 1) == True, 1, 0) == 1, or1200_cpu_or1200_except_ex_void == 1) = False) 2840
                end
        end

    //Following code is from line 4178
        always @(posedge or1200_cpu_or1200_except_rst or posedge or1200_cpu_or1200_except_clk) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2845] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2845
                    or1200_cpu_or1200_except_id_pc <= 32'h00000000;  //assertion( or1200_cpu_or1200_except_id_pc = 0) 2847
                    or1200_cpu_or1200_except_id_pc_val <= 1'b0;  //assertion( or1200_cpu_or1200_except_id_pc_val = 0) 2848
                    or1200_cpu_or1200_except_id_exceptflags <= 3'h0;  //assertion( or1200_cpu_or1200_except_id_exceptflags = 0) 2849
                end
            else
                begin
                    coverage0[2846] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2846
                    if (or1200_cpu_or1200_except_id_flushpipe)
                        begin
                            coverage0[2850] = 1;  //assertion( 0 != or1200_cpu_or1200_except_id_flushpipe = True) 2850
                            or1200_cpu_or1200_except_id_pc_val <= 1'b0;  //assertion( or1200_cpu_or1200_except_id_pc_val = 0) 2852
                            or1200_cpu_or1200_except_id_exceptflags <= 3'h0;  //assertion( or1200_cpu_or1200_except_id_exceptflags = 0) 2853
                        end
                    else
                        begin
                            coverage0[2851] = 1;  //assertion( 0 != or1200_cpu_or1200_except_id_flushpipe = False) 2851
                            if ((~or1200_cpu_or1200_except_id_freeze))
                                begin
                                    coverage0[2854] = 1;  //assertion( Not(or1200_cpu_or1200_except_id_freeze == 1) = True) 2854
                                    or1200_cpu_or1200_except_id_pc <= or1200_cpu_or1200_except_if_pc;  //assertion( or1200_cpu_or1200_except_id_pc = or1200_cpu_or1200_except_if_pc) 2856
                                    or1200_cpu_or1200_except_id_pc_val <= 1'b1;  //assertion( or1200_cpu_or1200_except_id_pc_val = 1) 2857
                                    or1200_cpu_or1200_except_id_exceptflags <= {or1200_cpu_or1200_except_sig_ibuserr, or1200_cpu_or1200_except_sig_itlbmiss, or1200_cpu_or1200_except_sig_immufault};  //assertion( or1200_cpu_or1200_except_id_exceptflags = Concat(Concat(or1200_cpu_or1200_except_sig_ibuserr, or1200_cpu_or1200_except_sig_itlbmiss), or1200_cpu_or1200_except_sig_immufault)) 2858
                                end
                            else
                                    coverage0[2855] = 1;  //assertion( Not(or1200_cpu_or1200_except_id_freeze == 1) = False) 2855
                        end
                end
        end

    //Following code is from line 4193
        always @(posedge or1200_cpu_or1200_except_clk or posedge or1200_cpu_or1200_except_rst) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2859] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2859
                    or1200_cpu_or1200_except_delayed_iee <= 3'h0;  //assertion( or1200_cpu_or1200_except_delayed_iee = 0) 2861
                end
            else
                begin
                    coverage0[2860] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2860
                    if ((~or1200_cpu_or1200_except_sr[2]))
                        begin
                            coverage0[2862] = 1;  //assertion( Not(Extract(2, 2, or1200_cpu_or1200_except_sr) == 1) = True) 2862
                            or1200_cpu_or1200_except_delayed_iee <= 3'h0;  //assertion( or1200_cpu_or1200_except_delayed_iee = 0) 2864
                        end
                    else
                        begin
                            coverage0[2863] = 1;  //assertion( Not(Extract(2, 2, or1200_cpu_or1200_except_sr) == 1) = False) 2863
                            or1200_cpu_or1200_except_delayed_iee <= {or1200_cpu_or1200_except_delayed_iee[1:0], 1'b1};  //assertion( or1200_cpu_or1200_except_delayed_iee = Concat(Extract(1, 0, or1200_cpu_or1200_except_delayed_iee), 1)) 2865
                        end
                end
        end

    //Following code is from line 4197
        always @(posedge or1200_cpu_or1200_except_clk or posedge or1200_cpu_or1200_except_rst) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2866] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2866
                    or1200_cpu_or1200_except_delayed_tee <= 3'h0;  //assertion( or1200_cpu_or1200_except_delayed_tee = 0) 2868
                end
            else
                begin
                    coverage0[2867] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2867
                    if ((~or1200_cpu_or1200_except_sr[1]))
                        begin
                            coverage0[2869] = 1;  //assertion( Not(Extract(1, 1, or1200_cpu_or1200_except_sr) == 1) = True) 2869
                            or1200_cpu_or1200_except_delayed_tee <= 3'h0;  //assertion( or1200_cpu_or1200_except_delayed_tee = 0) 2871
                        end
                    else
                        begin
                            coverage0[2870] = 1;  //assertion( Not(Extract(1, 1, or1200_cpu_or1200_except_sr) == 1) = False) 2870
                            or1200_cpu_or1200_except_delayed_tee <= {or1200_cpu_or1200_except_delayed_tee[1:0], 1'b1};  //assertion( or1200_cpu_or1200_except_delayed_tee = Concat(Extract(1, 0, or1200_cpu_or1200_except_delayed_tee), 1)) 2872
                        end
                end
        end

    //Following code is from line 4201
        always @(posedge or1200_cpu_or1200_except_rst or posedge or1200_cpu_or1200_except_clk) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2873] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2873
                    or1200_cpu_or1200_except_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_ex_dslot = 0) 2875
                    or1200_cpu_or1200_except_ex_pc <= 32'h00000000;  //assertion( or1200_cpu_or1200_except_ex_pc = 0) 2876
                    or1200_cpu_or1200_except_ex_pc_val <= 1'b0;  //assertion( or1200_cpu_or1200_except_ex_pc_val = 0) 2877
                    or1200_cpu_or1200_except_ex_exceptflags <= 3'h0;  //assertion( or1200_cpu_or1200_except_ex_exceptflags = 0) 2878
                    or1200_cpu_or1200_except_delayed1_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_delayed1_ex_dslot = 0) 2879
                    or1200_cpu_or1200_except_delayed2_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_delayed2_ex_dslot = 0) 2880
                end
            else
                begin
                    coverage0[2874] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2874
                    if (or1200_cpu_or1200_except_ex_flushpipe)
                        begin
                            coverage0[2881] = 1;  //assertion( 0 != or1200_cpu_or1200_except_ex_flushpipe = True) 2881
                            or1200_cpu_or1200_except_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_ex_dslot = 0) 2883
                            or1200_cpu_or1200_except_ex_pc_val <= 1'b0;  //assertion( or1200_cpu_or1200_except_ex_pc_val = 0) 2884
                            or1200_cpu_or1200_except_ex_exceptflags <= 3'h0;  //assertion( or1200_cpu_or1200_except_ex_exceptflags = 0) 2885
                            or1200_cpu_or1200_except_delayed1_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_delayed1_ex_dslot = 0) 2886
                            or1200_cpu_or1200_except_delayed2_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_delayed2_ex_dslot = 0) 2887
                        end
                    else
                        begin
                            coverage0[2882] = 1;  //assertion( 0 != or1200_cpu_or1200_except_ex_flushpipe = False) 2882
                            if (((~or1200_cpu_or1200_except_ex_freeze) & or1200_cpu_or1200_except_id_freeze))
                                begin
                                    coverage0[2888] = 1;  //assertion( If(Not(or1200_cpu_or1200_except_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_except_id_freeze = True) 2888
                                    or1200_cpu_or1200_except_ex_dslot <= 1'b0;  //assertion( or1200_cpu_or1200_except_ex_dslot = 0) 2890
                                    or1200_cpu_or1200_except_ex_pc <= or1200_cpu_or1200_except_id_pc;  //assertion( or1200_cpu_or1200_except_ex_pc = or1200_cpu_or1200_except_id_pc) 2891
                                    or1200_cpu_or1200_except_ex_pc_val <= or1200_cpu_or1200_except_id_pc_val;  //assertion( or1200_cpu_or1200_except_ex_pc_val = or1200_cpu_or1200_except_id_pc_val) 2892
                                    or1200_cpu_or1200_except_ex_exceptflags <= 3'h0;  //assertion( or1200_cpu_or1200_except_ex_exceptflags = 0) 2893
                                    or1200_cpu_or1200_except_delayed1_ex_dslot <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_delayed1_ex_dslot = or1200_cpu_or1200_except_ex_dslot) 2894
                                    or1200_cpu_or1200_except_delayed2_ex_dslot <= or1200_cpu_or1200_except_delayed1_ex_dslot;  //assertion( or1200_cpu_or1200_except_delayed2_ex_dslot = or1200_cpu_or1200_except_delayed1_ex_dslot) 2895
                                end
                            else
                                begin
                                    coverage0[2889] = 1;  //assertion( If(Not(or1200_cpu_or1200_except_ex_freeze == 1) == True, 1, 0) & or1200_cpu_or1200_except_id_freeze = False) 2889
                                    if ((~or1200_cpu_or1200_except_ex_freeze))
                                        begin
                                            coverage0[2896] = 1;  //assertion( Not(or1200_cpu_or1200_except_ex_freeze == 1) = True) 2896
                                            or1200_cpu_or1200_except_ex_dslot <= or1200_cpu_or1200_except_ex_branch_taken;  //assertion( or1200_cpu_or1200_except_ex_dslot = or1200_cpu_or1200_except_ex_branch_taken) 2898
                                            or1200_cpu_or1200_except_ex_pc <= or1200_cpu_or1200_except_id_pc;  //assertion( or1200_cpu_or1200_except_ex_pc = or1200_cpu_or1200_except_id_pc) 2899
                                            or1200_cpu_or1200_except_ex_pc_val <= or1200_cpu_or1200_except_id_pc_val;  //assertion( or1200_cpu_or1200_except_ex_pc_val = or1200_cpu_or1200_except_id_pc_val) 2900
                                            or1200_cpu_or1200_except_ex_exceptflags <= or1200_cpu_or1200_except_id_exceptflags;  //assertion( or1200_cpu_or1200_except_ex_exceptflags = or1200_cpu_or1200_except_id_exceptflags) 2901
                                            or1200_cpu_or1200_except_delayed1_ex_dslot <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_delayed1_ex_dslot = or1200_cpu_or1200_except_ex_dslot) 2902
                                            or1200_cpu_or1200_except_delayed2_ex_dslot <= or1200_cpu_or1200_except_delayed1_ex_dslot;  //assertion( or1200_cpu_or1200_except_delayed2_ex_dslot = or1200_cpu_or1200_except_delayed1_ex_dslot) 2903
                                        end
                                    else
                                            coverage0[2897] = 1;  //assertion( Not(or1200_cpu_or1200_except_ex_freeze == 1) = False) 2897
                                end
                        end
                end
        end

    //Following code is from line 4233
        always @(posedge or1200_cpu_or1200_except_rst or posedge or1200_cpu_or1200_except_clk) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2904] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2904
                    or1200_cpu_or1200_except_wb_pc <= 32'h00000000;  //assertion( or1200_cpu_or1200_except_wb_pc = 0) 2906
                    or1200_cpu_or1200_except_dl_pc <= 32'h00000000;  //assertion( or1200_cpu_or1200_except_dl_pc = 0) 2907
                end
            else
                begin
                    coverage0[2905] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2905
                    if ((~or1200_cpu_or1200_except_wb_freeze))
                        begin
                            coverage0[2908] = 1;  //assertion( Not(or1200_cpu_or1200_except_wb_freeze == 1) = True) 2908
                            or1200_cpu_or1200_except_wb_pc <= or1200_cpu_or1200_except_ex_pc;  //assertion( or1200_cpu_or1200_except_wb_pc = or1200_cpu_or1200_except_ex_pc) 2910
                            or1200_cpu_or1200_except_dl_pc <= or1200_cpu_or1200_except_wb_pc;  //assertion( or1200_cpu_or1200_except_dl_pc = or1200_cpu_or1200_except_wb_pc) 2911
                        end
                    else
                            coverage0[2909] = 1;  //assertion( Not(or1200_cpu_or1200_except_wb_freeze == 1) = False) 2909
                end
        end

    //Following code is from line 4242
        always @(posedge or1200_cpu_or1200_except_rst or posedge or1200_cpu_or1200_except_clk) begin
            if ((or1200_cpu_or1200_except_rst == 1'b1))
                begin
                    coverage0[2912] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = True) 2912
                    or1200_cpu_or1200_except_state <= 3'h0;  //assertion( or1200_cpu_or1200_except_state = 0) 2914
                    or1200_cpu_or1200_except_except_type <= 4'h0;  //assertion( or1200_cpu_or1200_except_except_type = 0) 2915
                    or1200_cpu_or1200_except_extend_flush <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush = 0) 2916
                    or1200_cpu_or1200_except_epcr <= 32'h00000000;  //assertion( or1200_cpu_or1200_except_epcr = 0) 2917
                    or1200_cpu_or1200_except_eear <= 32'h00000000;  //assertion( or1200_cpu_or1200_except_eear = 0) 2918
                    or1200_cpu_or1200_except_esr <= 17'h08001;  //assertion( or1200_cpu_or1200_except_esr = 32769) 2919
                    or1200_cpu_or1200_except_extend_flush_last <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush_last = 0) 2920
                    or1200_cpu_or1200_except_dsx <= 1'b0;  //assertion( or1200_cpu_or1200_except_dsx = 0) 2921
                end
            else
                begin
                    coverage0[2913] = 1;  //assertion( 1 == or1200_cpu_or1200_except_rst = False) 2913
                    case (or1200_cpu_or1200_except_state)
                      3'h0:
                        begin
                            coverage0[2922] = 1;  //assertion( 0 == or1200_cpu_or1200_except_state = True) 2922
                            if (or1200_cpu_or1200_except_except_flushpipe)
                                begin
                                    coverage0[2923] = 1;  //assertion( 0 != or1200_cpu_or1200_except_except_flushpipe = True) 2923
                                    or1200_cpu_or1200_except_state <= 3'h1;  //assertion( or1200_cpu_or1200_except_state = 1) 2925
                                    or1200_cpu_or1200_except_extend_flush <= 1'b1;  //assertion( or1200_cpu_or1200_except_extend_flush = 1) 2926
                                    or1200_cpu_or1200_except_esr <= (or1200_cpu_or1200_except_sr_we ? or1200_cpu_or1200_except_to_sr : or1200_cpu_or1200_except_sr);  //assertion( or1200_cpu_or1200_except_esr = If(0 != or1200_cpu_or1200_except_sr_we == True, or1200_cpu_or1200_except_to_sr, or1200_cpu_or1200_except_sr)) 2927
                                    case (or1200_cpu_or1200_except_except_trig)
                                      14'b1zzzzzzzzzzzzz:
                                        begin
                                            coverage0[2928] = 1;  //assertion( 8192 == or1200_cpu_or1200_except_except_trig = True) 2928
                                            or1200_cpu_or1200_except_except_type <= 4'ha;  //assertion( or1200_cpu_or1200_except_except_type = 10) 2929
                                            or1200_cpu_or1200_except_eear <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_ex_pc : or1200_cpu_or1200_except_ex_pc);  //assertion( or1200_cpu_or1200_except_eear = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_ex_pc, or1200_cpu_or1200_except_ex_pc)) 2930
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : or1200_cpu_or1200_except_ex_pc);  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, or1200_cpu_or1200_except_ex_pc)) 2931
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2932
                                        end
                                      14'b01zzzzzzzzzzzz:
                                        begin
                                            coverage0[2933] = 1;  //assertion( 4096 == or1200_cpu_or1200_except_except_trig = True) 2933
                                            or1200_cpu_or1200_except_except_type <= 4'h4;  //assertion( or1200_cpu_or1200_except_except_type = 4) 2934
                                            or1200_cpu_or1200_except_eear <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_ex_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_id_pc : (or1200_cpu_or1200_except_delayed2_ex_dslot ? or1200_cpu_or1200_except_id_pc : or1200_cpu_or1200_except_id_pc)));  //assertion( or1200_cpu_or1200_except_eear = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_ex_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_id_pc, If(0 != or1200_cpu_or1200_except_delayed2_ex_dslot == True, or1200_cpu_or1200_except_id_pc, or1200_cpu_or1200_except_id_pc)))) 2935
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_id_pc : (or1200_cpu_or1200_except_delayed2_ex_dslot ? or1200_cpu_or1200_except_id_pc : or1200_cpu_or1200_except_id_pc)));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_id_pc, If(0 != or1200_cpu_or1200_except_delayed2_ex_dslot == True, or1200_cpu_or1200_except_id_pc, or1200_cpu_or1200_except_id_pc)))) 2936
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2937
                                        end
                                      14'b01zzzzzzzzzzz:
                                        begin
                                            coverage0[2938] = 1;  //assertion( 2048 == or1200_cpu_or1200_except_except_trig = True) 2938
                                            or1200_cpu_or1200_except_except_type <= 4'h2;  //assertion( or1200_cpu_or1200_except_except_type = 2) 2939
                                            or1200_cpu_or1200_except_eear <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : or1200_cpu_or1200_except_ex_pc);  //assertion( or1200_cpu_or1200_except_eear = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, or1200_cpu_or1200_except_ex_pc)) 2940
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : or1200_cpu_or1200_except_ex_pc);  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, or1200_cpu_or1200_except_ex_pc)) 2941
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2942
                                        end
                                      14'b01zzzzzzzzzz:
                                        begin
                                            coverage0[2943] = 1;  //assertion( 1024 == or1200_cpu_or1200_except_except_trig = True) 2943
                                            or1200_cpu_or1200_except_except_type <= 4'h7;  //assertion( or1200_cpu_or1200_except_except_type = 7) 2944
                                            or1200_cpu_or1200_except_eear <= or1200_cpu_or1200_except_ex_pc;  //assertion( or1200_cpu_or1200_except_eear = or1200_cpu_or1200_except_ex_pc) 2945
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : or1200_cpu_or1200_except_ex_pc);  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, or1200_cpu_or1200_except_ex_pc)) 2946
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2947
                                        end
                                      14'b01zzzzzzzzz:
                                        begin
                                            coverage0[2948] = 1;  //assertion( 512 == or1200_cpu_or1200_except_except_trig = True) 2948
                                            or1200_cpu_or1200_except_except_type <= 4'h6;  //assertion( or1200_cpu_or1200_except_except_type = 6) 2949
                                            or1200_cpu_or1200_except_eear <= or1200_cpu_or1200_except_lsu_addr;  //assertion( or1200_cpu_or1200_except_eear = or1200_cpu_or1200_except_lsu_addr) 2950
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : or1200_cpu_or1200_except_ex_pc);  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, or1200_cpu_or1200_except_ex_pc)) 2951
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2952
                                        end
                                      14'b01zzzzzzzz:
                                        begin
                                            coverage0[2953] = 1;  //assertion( 256 == or1200_cpu_or1200_except_except_trig = True) 2953
                                            or1200_cpu_or1200_except_except_type <= 4'h9;  //assertion( or1200_cpu_or1200_except_except_type = 9) 2954
                                            or1200_cpu_or1200_except_eear <= or1200_cpu_or1200_except_lsu_addr;  //assertion( or1200_cpu_or1200_except_eear = or1200_cpu_or1200_except_lsu_addr) 2955
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_dl_pc : or1200_cpu_or1200_except_ex_pc));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_dl_pc, or1200_cpu_or1200_except_ex_pc))) 2956
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2957
                                        end
                                      14'b01zzzzzzz:
                                        begin
                                            coverage0[2958] = 1;  //assertion( 128 == or1200_cpu_or1200_except_except_trig = True) 2958
                                            or1200_cpu_or1200_except_except_type <= 4'he;  //assertion( or1200_cpu_or1200_except_except_type = 14) 2959
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_id_pc : or1200_cpu_or1200_except_ex_pc));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_id_pc, or1200_cpu_or1200_except_ex_pc))) 2960
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2961
                                        end
                                      14'b01zzzzzz:
                                        begin
                                            coverage0[2962] = 1;  //assertion( 64 == or1200_cpu_or1200_except_except_trig = True) 2962
                                            or1200_cpu_or1200_except_except_type <= 4'hc;  //assertion( or1200_cpu_or1200_except_except_type = 12) 2963
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_id_pc : (or1200_cpu_or1200_except_delayed2_ex_dslot ? or1200_cpu_or1200_except_id_pc : or1200_cpu_or1200_except_id_pc)));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_id_pc, If(0 != or1200_cpu_or1200_except_delayed2_ex_dslot == True, or1200_cpu_or1200_except_id_pc, or1200_cpu_or1200_except_id_pc)))) 2964
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2965
                                        end
                                      14'b01zzzzz:
                                        begin
                                            coverage0[2966] = 1;  //assertion( 32 == or1200_cpu_or1200_except_except_trig = True) 2966
                                            or1200_cpu_or1200_except_except_type <= 4'h3;  //assertion( or1200_cpu_or1200_except_except_type = 3) 2967
                                            or1200_cpu_or1200_except_eear <= or1200_cpu_or1200_except_lsu_addr;  //assertion( or1200_cpu_or1200_except_eear = or1200_cpu_or1200_except_lsu_addr) 2968
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_dl_pc : or1200_cpu_or1200_except_ex_pc));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_dl_pc, or1200_cpu_or1200_except_ex_pc))) 2969
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2970
                                        end
                                      14'b01zzzz:
                                        begin
                                            coverage0[2971] = 1;  //assertion( 16 == or1200_cpu_or1200_except_except_trig = True) 2971
                                            or1200_cpu_or1200_except_except_type <= 4'h2;  //assertion( or1200_cpu_or1200_except_except_type = 2) 2972
                                            or1200_cpu_or1200_except_eear <= or1200_cpu_or1200_except_lsu_addr;  //assertion( or1200_cpu_or1200_except_eear = or1200_cpu_or1200_except_lsu_addr) 2973
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_dl_pc : or1200_cpu_or1200_except_ex_pc));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_dl_pc, or1200_cpu_or1200_except_ex_pc))) 2974
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2975
                                        end
                                      14'b01zzz:
                                        begin
                                            coverage0[2976] = 1;  //assertion( 8 == or1200_cpu_or1200_except_except_trig = True) 2976
                                            or1200_cpu_or1200_except_except_type <= 4'hb;  //assertion( or1200_cpu_or1200_except_except_type = 11) 2977
                                            or1200_cpu_or1200_except_epcr <= (or1200_cpu_or1200_except_ex_dslot ? or1200_cpu_or1200_except_wb_pc : (or1200_cpu_or1200_except_delayed1_ex_dslot ? or1200_cpu_or1200_except_dl_pc : (or1200_cpu_or1200_except_delayed2_ex_dslot ? or1200_cpu_or1200_except_id_pc : or1200_cpu_or1200_except_ex_pc)));  //assertion( or1200_cpu_or1200_except_epcr = If(0 != or1200_cpu_or1200_except_ex_dslot == True, or1200_cpu_or1200_except_wb_pc, If(0 != or1200_cpu_or1200_except_delayed1_ex_dslot == True, or1200_cpu_or1200_except_dl_pc, If(0 != or1200_cpu_or1200_except_delayed2_ex_dslot == True, or1200_cpu_or1200_except_id_pc, or1200_cpu_or1200_except_ex_pc)))) 2978
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2979
                                        end
                                      14'b01zz:
                                        begin
                                            coverage0[2980] = 1;  //assertion( 4 == or1200_cpu_or1200_except_except_trig = True) 2980
                                            or1200_cpu_or1200_except_except_type <= 4'hd;  //assertion( or1200_cpu_or1200_except_except_type = 13) 2981
                                            or1200_cpu_or1200_except_epcr <= or1200_cpu_or1200_except_id_pc;  //assertion( or1200_cpu_or1200_except_epcr = or1200_cpu_or1200_except_id_pc) 2982
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2983
                                        end
                                      14'b01z:
                                        begin
                                            coverage0[2984] = 1;  //assertion( 2 == or1200_cpu_or1200_except_except_trig = True) 2984
                                            or1200_cpu_or1200_except_except_type <= 4'h8;  //assertion( or1200_cpu_or1200_except_except_type = 8) 2985
                                            or1200_cpu_or1200_except_epcr <= or1200_cpu_or1200_except_id_pc;  //assertion( or1200_cpu_or1200_except_epcr = or1200_cpu_or1200_except_id_pc) 2986
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2987
                                        end
                                      14'h0001:
                                        begin
                                            coverage0[2988] = 1;  //assertion( 1 == or1200_cpu_or1200_except_except_trig = True) 2988
                                            or1200_cpu_or1200_except_except_type <= 4'h5;  //assertion( or1200_cpu_or1200_except_except_type = 5) 2989
                                            or1200_cpu_or1200_except_epcr <= or1200_cpu_or1200_except_id_pc;  //assertion( or1200_cpu_or1200_except_epcr = or1200_cpu_or1200_except_id_pc) 2990
                                            or1200_cpu_or1200_except_dsx <= or1200_cpu_or1200_except_ex_dslot;  //assertion( or1200_cpu_or1200_except_dsx = or1200_cpu_or1200_except_ex_dslot) 2991
                                        end
                                      default:
                                        begin
                                            coverage0[2992] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 2992
                                            or1200_cpu_or1200_except_except_type <= 4'h0;  //assertion( or1200_cpu_or1200_except_except_type = 0) 2993
                                        end
                                    endcase
                                end
                            else
                                begin
                                    coverage0[2924] = 1;  //assertion( 0 != or1200_cpu_or1200_except_except_flushpipe = False) 2924
                                    if (or1200_cpu_or1200_except_pc_we)
                                        begin
                                            coverage0[2994] = 1;  //assertion( 0 != or1200_cpu_or1200_except_pc_we = True) 2994
                                            or1200_cpu_or1200_except_state <= 3'h1;  //assertion( or1200_cpu_or1200_except_state = 1) 2996
                                            or1200_cpu_or1200_except_extend_flush <= 1'b1;  //assertion( or1200_cpu_or1200_except_extend_flush = 1) 2997
                                        end
                                    else
                                        begin
                                            coverage0[2995] = 1;  //assertion( 0 != or1200_cpu_or1200_except_pc_we = False) 2995
                                            if (or1200_cpu_or1200_except_epcr_we)
                                                begin
                                                    coverage0[2998] = 1;  //assertion( 0 != or1200_cpu_or1200_except_epcr_we = True) 2998
                                                    or1200_cpu_or1200_except_epcr <= or1200_cpu_or1200_except_datain;  //assertion( or1200_cpu_or1200_except_epcr = or1200_cpu_or1200_except_datain) 3000
                                                end
                                            else
                                                    coverage0[2999] = 1;  //assertion( 0 != or1200_cpu_or1200_except_epcr_we = False) 2999
                                            if (or1200_cpu_or1200_except_eear_we)
                                                begin
                                                    coverage0[3001] = 1;  //assertion( 0 != or1200_cpu_or1200_except_eear_we = True) 3001
                                                    or1200_cpu_or1200_except_eear <= or1200_cpu_or1200_except_datain;  //assertion( or1200_cpu_or1200_except_eear = or1200_cpu_or1200_except_datain) 3003
                                                end
                                            else
                                                    coverage0[3002] = 1;  //assertion( 0 != or1200_cpu_or1200_except_eear_we = False) 3002
                                            if (or1200_cpu_or1200_except_esr_we)
                                                begin
                                                    coverage0[3004] = 1;  //assertion( 0 != or1200_cpu_or1200_except_esr_we = True) 3004
                                                    or1200_cpu_or1200_except_esr <= {or1200_cpu_or1200_except_datain[16], 1'b1, or1200_cpu_or1200_except_datain[14:0]};  //assertion( or1200_cpu_or1200_except_esr = Concat(Concat(Extract(16, 16, or1200_cpu_or1200_except_datain), 1), Extract(14, 0, or1200_cpu_or1200_except_datain))) 3006
                                                end
                                            else
                                                    coverage0[3005] = 1;  //assertion( 0 != or1200_cpu_or1200_except_esr_we = False) 3005
                                        end
                                end
                        end
                      3'h1:
                        begin
                            coverage0[3007] = 1;  //assertion( 1 == or1200_cpu_or1200_except_state = True) 3007
                            if (((or1200_cpu_or1200_except_icpu_ack_i | or1200_cpu_or1200_except_icpu_err_i) | or1200_cpu_or1200_except_genpc_freeze))
                                begin
                                    coverage0[3008] = 1;  //assertion( or1200_cpu_or1200_except_icpu_ack_i | or1200_cpu_or1200_except_icpu_err_i | or1200_cpu_or1200_except_genpc_freeze = True) 3008
                                    or1200_cpu_or1200_except_state <= 3'h2;  //assertion( or1200_cpu_or1200_except_state = 2) 3010
                                end
                            else
                                    coverage0[3009] = 1;  //assertion( or1200_cpu_or1200_except_icpu_ack_i | or1200_cpu_or1200_except_icpu_err_i | or1200_cpu_or1200_except_genpc_freeze = False) 3009
                        end
                      3'h2:
                        begin
                            coverage0[3011] = 1;  //assertion( 2 == or1200_cpu_or1200_except_state = True) 3011
                            if ((or1200_cpu_or1200_except_except_type == 4'he))
                                begin
                                    coverage0[3012] = 1;  //assertion( 14 == or1200_cpu_or1200_except_except_type = True) 3012
                                    or1200_cpu_or1200_except_state <= 3'h0;  //assertion( or1200_cpu_or1200_except_state = 0) 3014
                                    or1200_cpu_or1200_except_extend_flush <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush = 0) 3015
                                    or1200_cpu_or1200_except_extend_flush_last <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush_last = 0) 3016
                                    or1200_cpu_or1200_except_except_type <= 4'h0;  //assertion( or1200_cpu_or1200_except_except_type = 0) 3017
                                end
                            else
                                begin
                                    coverage0[3013] = 1;  //assertion( 14 == or1200_cpu_or1200_except_except_type = False) 3013
                                    or1200_cpu_or1200_except_state <= 3'h3;  //assertion( or1200_cpu_or1200_except_state = 3) 3018
                                end
                        end
                      3'h3:
                        begin
                            coverage0[3019] = 1;  //assertion( 3 == or1200_cpu_or1200_except_state = True) 3019
                            or1200_cpu_or1200_except_state <= 3'h4;  //assertion( or1200_cpu_or1200_except_state = 4) 3020
                        end
                      3'h4:
                        begin
                            coverage0[3021] = 1;  //assertion( 4 == or1200_cpu_or1200_except_state = True) 3021
                            or1200_cpu_or1200_except_state <= 3'h5;  //assertion( or1200_cpu_or1200_except_state = 5) 3022
                            or1200_cpu_or1200_except_extend_flush <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush = 0) 3023
                            or1200_cpu_or1200_except_extend_flush_last <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush_last = 0) 3024
                        end
                      default:
                        begin
                            coverage0[3025] = 1;  //assertion( If(0 != or1200_cpu_or1200_except_state == True, 1, 0) & If(1 != or1200_cpu_or1200_except_state == True, 1, 0) & If(2 != or1200_cpu_or1200_except_state == True, 1, 0) & If(3 != or1200_cpu_or1200_except_state == True, 1, 0) & If(4 != or1200_cpu_or1200_except_state == True, 1, 0) = True) 3025
                            if (((~or1200_cpu_or1200_except_if_stall) && (~or1200_cpu_or1200_except_id_freeze)))
                                begin
                                    coverage0[3026] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_except_if_stall == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_except_id_freeze == 1) == True, 1, 0) == 1) = True) 3026
                                    or1200_cpu_or1200_except_state <= 3'h0;  //assertion( or1200_cpu_or1200_except_state = 0) 3028
                                    or1200_cpu_or1200_except_except_type <= 4'h0;  //assertion( or1200_cpu_or1200_except_except_type = 0) 3029
                                    or1200_cpu_or1200_except_extend_flush_last <= 1'b0;  //assertion( or1200_cpu_or1200_except_extend_flush_last = 0) 3030
                                end
                            else
                                    coverage0[3027] = 1;  //assertion( And(If(Not(or1200_cpu_or1200_except_if_stall == 1) == True, 1, 0) == 1, If(Not(or1200_cpu_or1200_except_id_freeze == 1) == True, 1, 0) == 1) = False) 3027
                        end
                    endcase
                end
        end

    //Following code is from line 4369
        always @(or1200_cpu_or1200_cfgr_spr_addr) begin
            if (~|or1200_cpu_or1200_cfgr_spr_addr[31:4])
                begin
                    coverage0[3031] = 1;  //assertion( ~bvredor(Extract(31, 4, or1200_cpu_or1200_cfgr_spr_addr)) = True) 3031
                    case (or1200_cpu_or1200_cfgr_spr_addr[3:0])
                      4'h0:
                        begin
                            coverage0[3033] = 1;  //assertion( 0 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3033
                            or1200_cpu_or1200_cfgr_spr_dat_o[5:0] = 6'h08;  //assertion( Extract(5, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 8) 3034
                            or1200_cpu_or1200_cfgr_spr_dat_o[15:6] = 10'h000;  //assertion( Extract(15, 6, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3035
                            or1200_cpu_or1200_cfgr_spr_dat_o[23:16] = 8'h00;  //assertion( Extract(23, 16, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3036
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:24] = 8'h13;  //assertion( Extract(31, 24, or1200_cpu_or1200_cfgr_spr_dat_o) = 19) 3037
                        end
                      4'h1:
                        begin
                            coverage0[3038] = 1;  //assertion( 1 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3038
                            or1200_cpu_or1200_cfgr_spr_dat_o[0] = 1'b1;  //assertion( Extract(0, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3039
                            or1200_cpu_or1200_cfgr_spr_dat_o[1] = 1'b1;  //assertion( Extract(1, 1, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3040
                            or1200_cpu_or1200_cfgr_spr_dat_o[2] = 1'b1;  //assertion( Extract(2, 2, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3041
                            or1200_cpu_or1200_cfgr_spr_dat_o[3] = 1'b1;  //assertion( Extract(3, 3, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3042
                            or1200_cpu_or1200_cfgr_spr_dat_o[4] = 1'b1;  //assertion( Extract(4, 4, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3043
                            or1200_cpu_or1200_cfgr_spr_dat_o[5] = 1'b0;  //assertion( Extract(5, 5, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3044
                            or1200_cpu_or1200_cfgr_spr_dat_o[6] = 1'b1;  //assertion( Extract(6, 6, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3045
                            or1200_cpu_or1200_cfgr_spr_dat_o[7] = 1'b0;  //assertion( Extract(7, 7, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3046
                            or1200_cpu_or1200_cfgr_spr_dat_o[8] = 1'b0;  //assertion( Extract(8, 8, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3047
                            or1200_cpu_or1200_cfgr_spr_dat_o[9] = 1'b1;  //assertion( Extract(9, 9, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3048
                            or1200_cpu_or1200_cfgr_spr_dat_o[10] = 1'b1;  //assertion( Extract(10, 10, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3049
                            or1200_cpu_or1200_cfgr_spr_dat_o[11] = 1'b0;  //assertion( Extract(11, 11, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3050
                            or1200_cpu_or1200_cfgr_spr_dat_o[23:12] = 12'h000;  //assertion( Extract(23, 12, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3051
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:24] = 8'h00;  //assertion( Extract(31, 24, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3052
                        end
                      4'h2:
                        begin
                            coverage0[3053] = 1;  //assertion( 2 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3053
                            or1200_cpu_or1200_cfgr_spr_dat_o[3:0] = 4'h0;  //assertion( Extract(3, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3054
                            or1200_cpu_or1200_cfgr_spr_dat_o[4] = 1'b0;  //assertion( Extract(4, 4, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3055
                            or1200_cpu_or1200_cfgr_spr_dat_o[5] = 1'b1;  //assertion( Extract(5, 5, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3056
                            or1200_cpu_or1200_cfgr_spr_dat_o[6] = 1'b0;  //assertion( Extract(6, 6, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3057
                            or1200_cpu_or1200_cfgr_spr_dat_o[7] = 1'b0;  //assertion( Extract(7, 7, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3058
                            or1200_cpu_or1200_cfgr_spr_dat_o[8] = 1'b0;  //assertion( Extract(8, 8, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3059
                            or1200_cpu_or1200_cfgr_spr_dat_o[9] = 1'b0;  //assertion( Extract(9, 9, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3060
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:10] = 22'h000000;  //assertion( Extract(31, 10, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3061
                        end
                      4'h3:
                        begin
                            coverage0[3062] = 1;  //assertion( 3 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3062
                            or1200_cpu_or1200_cfgr_spr_dat_o[1:0] = 2'h0;  //assertion( Extract(1, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3063
                            or1200_cpu_or1200_cfgr_spr_dat_o[4:2] = 3'h6;  //assertion( Extract(4, 2, or1200_cpu_or1200_cfgr_spr_dat_o) = 6) 3064
                            or1200_cpu_or1200_cfgr_spr_dat_o[7:5] = 3'h0;  //assertion( Extract(7, 5, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3065
                            or1200_cpu_or1200_cfgr_spr_dat_o[8] = 1'b0;  //assertion( Extract(8, 8, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3066
                            or1200_cpu_or1200_cfgr_spr_dat_o[9] = 1'b0;  //assertion( Extract(9, 9, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3067
                            or1200_cpu_or1200_cfgr_spr_dat_o[10] = 1'b0;  //assertion( Extract(10, 10, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3068
                            or1200_cpu_or1200_cfgr_spr_dat_o[11] = 1'b0;  //assertion( Extract(11, 11, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3069
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:12] = 20'h00000;  //assertion( Extract(31, 12, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3070
                        end
                      4'h4:
                        begin
                            coverage0[3071] = 1;  //assertion( 4 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3071
                            or1200_cpu_or1200_cfgr_spr_dat_o[1:0] = 2'h0;  //assertion( Extract(1, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3072
                            or1200_cpu_or1200_cfgr_spr_dat_o[4:2] = 3'h6;  //assertion( Extract(4, 2, or1200_cpu_or1200_cfgr_spr_dat_o) = 6) 3073
                            or1200_cpu_or1200_cfgr_spr_dat_o[7:5] = 3'h0;  //assertion( Extract(7, 5, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3074
                            or1200_cpu_or1200_cfgr_spr_dat_o[8] = 1'b0;  //assertion( Extract(8, 8, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3075
                            or1200_cpu_or1200_cfgr_spr_dat_o[9] = 1'b0;  //assertion( Extract(9, 9, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3076
                            or1200_cpu_or1200_cfgr_spr_dat_o[10] = 1'b0;  //assertion( Extract(10, 10, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3077
                            or1200_cpu_or1200_cfgr_spr_dat_o[11] = 1'b0;  //assertion( Extract(11, 11, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3078
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:12] = 20'h00000;  //assertion( Extract(31, 12, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3079
                        end
                      4'h5:
                        begin
                            coverage0[3080] = 1;  //assertion( 5 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3080
                            or1200_cpu_or1200_cfgr_spr_dat_o[2:0] = 3'h0;  //assertion( Extract(2, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3081
                            or1200_cpu_or1200_cfgr_spr_dat_o[6:3] = (-7);  //assertion( Extract(6, 3, or1200_cpu_or1200_cfgr_spr_dat_o) = -7) 3082
                            or1200_cpu_or1200_cfgr_spr_dat_o[7] = 1'b0;  //assertion( Extract(7, 7, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3083
                            or1200_cpu_or1200_cfgr_spr_dat_o[8] = 1'b0;  //assertion( Extract(8, 8, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3084
                            or1200_cpu_or1200_cfgr_spr_dat_o[9] = 1'b1;  //assertion( Extract(9, 9, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3085
                            or1200_cpu_or1200_cfgr_spr_dat_o[10] = 1'b1;  //assertion( Extract(10, 10, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3086
                            or1200_cpu_or1200_cfgr_spr_dat_o[11] = 1'b0;  //assertion( Extract(11, 11, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3087
                            or1200_cpu_or1200_cfgr_spr_dat_o[12] = 1'b0;  //assertion( Extract(12, 12, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3088
                            or1200_cpu_or1200_cfgr_spr_dat_o[13] = 1'b1;  //assertion( Extract(13, 13, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3089
                            or1200_cpu_or1200_cfgr_spr_dat_o[14] = 1'b0;  //assertion( Extract(14, 14, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3090
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:15] = 17'h00000;  //assertion( Extract(31, 15, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3091
                        end
                      4'h6:
                        begin
                            coverage0[3092] = 1;  //assertion( 6 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3092
                            or1200_cpu_or1200_cfgr_spr_dat_o[2:0] = 3'h0;  //assertion( Extract(2, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3093
                            or1200_cpu_or1200_cfgr_spr_dat_o[6:3] = (-7);  //assertion( Extract(6, 3, or1200_cpu_or1200_cfgr_spr_dat_o) = -7) 3094
                            or1200_cpu_or1200_cfgr_spr_dat_o[7] = 1'b0;  //assertion( Extract(7, 7, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3095
                            or1200_cpu_or1200_cfgr_spr_dat_o[8] = 1'b0;  //assertion( Extract(8, 8, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3096
                            or1200_cpu_or1200_cfgr_spr_dat_o[9] = 1'b1;  //assertion( Extract(9, 9, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3097
                            or1200_cpu_or1200_cfgr_spr_dat_o[10] = 1'b1;  //assertion( Extract(10, 10, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3098
                            or1200_cpu_or1200_cfgr_spr_dat_o[11] = 1'b0;  //assertion( Extract(11, 11, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3099
                            or1200_cpu_or1200_cfgr_spr_dat_o[12] = 1'b0;  //assertion( Extract(12, 12, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3100
                            or1200_cpu_or1200_cfgr_spr_dat_o[13] = 1'b1;  //assertion( Extract(13, 13, or1200_cpu_or1200_cfgr_spr_dat_o) = 1) 3101
                            or1200_cpu_or1200_cfgr_spr_dat_o[14] = 1'b0;  //assertion( Extract(14, 14, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3102
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:15] = 17'h00000;  //assertion( Extract(31, 15, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3103
                        end
                      4'h7:
                        begin
                            coverage0[3104] = 1;  //assertion( 7 == Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) = True) 3104
                            or1200_cpu_or1200_cfgr_spr_dat_o[3:0] = 4'h0;  //assertion( Extract(3, 0, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3105
                            or1200_cpu_or1200_cfgr_spr_dat_o[4] = 1'b0;  //assertion( Extract(4, 4, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3106
                            or1200_cpu_or1200_cfgr_spr_dat_o[31:5] = 27'h0000000;  //assertion( Extract(31, 5, or1200_cpu_or1200_cfgr_spr_dat_o) = 0) 3107
                        end
                      default:
                        begin
                            coverage0[3108] = 1;  //assertion( If(0 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(1 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(2 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(3 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(4 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(5 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(6 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) & If(7 != Extract(3, 0, or1200_cpu_or1200_cfgr_spr_addr) == True, 1, 0) = True) 3108
                            or1200_cpu_or1200_cfgr_spr_dat_o = 32'h00000000;  //assertion( or1200_cpu_or1200_cfgr_spr_dat_o = 0) 3109
                        end
                    endcase
                end
            else
                begin
                    coverage0[3032] = 1;  //assertion( ~bvredor(Extract(31, 4, or1200_cpu_or1200_cfgr_spr_addr)) = False) 3032
                    or1200_cpu_or1200_cfgr_spr_dat_o = 32'h00000000;  //assertion( or1200_cpu_or1200_cfgr_spr_dat_o = 0) 3110
                end
        end

    //Following code is from line 4457
        always @(posedge or1200_dmmu_top_rst or posedge or1200_dmmu_top_clk) begin
            if ((or1200_dmmu_top_rst == 1'b1))
                begin
                    coverage0[3111] = 1;  //assertion( 1 == or1200_dmmu_top_rst = True) 3111
                    or1200_dmmu_top_dtlb_done <= 1'b0;  //assertion( or1200_dmmu_top_dtlb_done = 0) 3113
                end
            else
                begin
                    coverage0[3112] = 1;  //assertion( 1 == or1200_dmmu_top_rst = False) 3112
                    if (or1200_dmmu_top_dtlb_en)
                        begin
                            coverage0[3114] = 1;  //assertion( 0 != or1200_dmmu_top_dtlb_en = True) 3114
                            or1200_dmmu_top_dtlb_done <= or1200_dmmu_top_dcpu_cycstb_i;  //assertion( or1200_dmmu_top_dtlb_done = or1200_dmmu_top_dcpu_cycstb_i) 3116
                        end
                    else
                        begin
                            coverage0[3115] = 1;  //assertion( 0 != or1200_dmmu_top_dtlb_en = False) 3115
                            or1200_dmmu_top_dtlb_done <= 1'b0;  //assertion( or1200_dmmu_top_dtlb_done = 0) 3117
                        end
                end
        end

    //Following code is from line 4461
        always @(posedge or1200_dmmu_top_rst or posedge or1200_dmmu_top_clk) begin
            if ((or1200_dmmu_top_rst == 1'b1))
                begin
                    coverage0[3118] = 1;  //assertion( 1 == or1200_dmmu_top_rst = True) 3118
                    or1200_dmmu_top_dcpu_vpn_r <= 19'h00000;  //assertion( or1200_dmmu_top_dcpu_vpn_r = 0) 3120
                end
            else
                begin
                    coverage0[3119] = 1;  //assertion( 1 == or1200_dmmu_top_rst = False) 3119
                    or1200_dmmu_top_dcpu_vpn_r <= or1200_dmmu_top_dcpu_adr_i[31:13];  //assertion( or1200_dmmu_top_dcpu_vpn_r = Extract(31, 13, or1200_dmmu_top_dcpu_adr_i)) 3121
                end
        end

    //Following code is from line 4464
        always @(posedge or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk) begin
            if (or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce)
                begin
                    coverage0[3122] = 1;  //assertion( 0 != or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce = True) 3122
                    or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr_reg <= or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr;  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr_reg = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr) 3124
                end
            else
                    coverage0[3123] = 1;  //assertion( 0 != or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce = False) 3123
        end

    //Following code is from line 4466
        always @(posedge or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_clk) begin
            if ((or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we && or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce))
                begin
                    coverage0[3125] = 1;  //assertion( And(or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we == 1, or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce == 1) = True) 3125
                    or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_mem[or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr] <= or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di;  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_mem[or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_addr] = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_di) 3127
                end
            else
                    coverage0[3126] = 1;  //assertion( And(or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_we == 1, or1200_dmmu_top_or1200_dmmu_tlb_dtlb_ram_ce == 1) = False) 3126
        end

    //Following code is from line 4468
        always @(posedge or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk) begin
            if (or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce)
                begin
                    coverage0[3128] = 1;  //assertion( 0 != or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce = True) 3128
                    or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr_reg <= or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr;  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr_reg = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr) 3130
                end
            else
                    coverage0[3129] = 1;  //assertion( 0 != or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce = False) 3129
        end

    //Following code is from line 4470
        always @(posedge or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_clk) begin
            if ((or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we && or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce))
                begin
                    coverage0[3131] = 1;  //assertion( And(or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we == 1, or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce == 1) = True) 3131
                    or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_mem[or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr] <= or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di;  //assertion( or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_mem[or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_addr] = or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_di) 3133
                end
            else
                    coverage0[3132] = 1;  //assertion( And(or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_we == 1, or1200_dmmu_top_or1200_dmmu_tlb_dtlb_tr_ram_ce == 1) = False) 3132
        end

    //Following code is from line 4472
        always @(or1200_dc_top_tag_v or or1200_dc_top_dcqmem_adr_i_tag or or1200_dc_top_tag) begin
            if (((or1200_dc_top_tag != or1200_dc_top_dcqmem_adr_i_tag) || (~or1200_dc_top_tag_v)))
                begin
                    coverage0[3134] = 1;  //assertion( Or(If(or1200_dc_top_tag != or1200_dc_top_dcqmem_adr_i_tag == True, 1, 0) == 1, If(Not(or1200_dc_top_tag_v == 1) == True, 1, 0) == 1) = True) 3134
                    or1200_dc_top_tagcomp_miss = 1'b1;  //assertion( or1200_dc_top_tagcomp_miss = 1) 3136
                end
            else
                begin
                    coverage0[3135] = 1;  //assertion( Or(If(or1200_dc_top_tag != or1200_dc_top_dcqmem_adr_i_tag == True, 1, 0) == 1, If(Not(or1200_dc_top_tag_v == 1) == True, 1, 0) == 1) = False) 3135
                    or1200_dc_top_tagcomp_miss = 1'b0;  //assertion( or1200_dc_top_tagcomp_miss = 0) 3137
                end
        end

    //Following code is from line 4475
        always @(posedge or1200_dc_top_or1200_dc_fsm_rst or posedge or1200_dc_top_or1200_dc_fsm_clk) begin
            if ((or1200_dc_top_or1200_dc_fsm_rst == 1'b1))
                begin
                    coverage0[3138] = 1;  //assertion( 1 == or1200_dc_top_or1200_dc_fsm_rst = True) 3138
                    or1200_dc_top_or1200_dc_fsm_state <= 3'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 0) 3140
                    or1200_dc_top_or1200_dc_fsm_addr_r <= 32'h00000000;  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = 0) 3141
                    or1200_dc_top_or1200_dc_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval = 0) 3142
                    or1200_dc_top_or1200_dc_fsm_store <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 0) 3143
                    or1200_dc_top_or1200_dc_fsm_load <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 0) 3144
                    or1200_dc_top_or1200_dc_fsm_cnt <= 4'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_cnt = 0) 3145
                    or1200_dc_top_or1200_dc_fsm_cache_miss <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_miss = 0) 3146
                    or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = 0) 3147
                    or1200_dc_top_or1200_dc_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_inhibit = 0) 3148
                    or1200_dc_top_or1200_dc_fsm_did_early_load_ack <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_did_early_load_ack = 0) 3149
                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush = 0) 3150
                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = 0) 3151
                end
            else
                begin
                    coverage0[3139] = 1;  //assertion( 1 == or1200_dc_top_or1200_dc_fsm_rst = False) 3139
                    case (or1200_dc_top_or1200_dc_fsm_state)
                      3'h0:
                        begin
                            coverage0[3152] = 1;  //assertion( 0 == or1200_dc_top_or1200_dc_fsm_state = True) 3152
                            if ((or1200_dc_top_or1200_dc_fsm_dc_en & (or1200_dc_top_or1200_dc_fsm_dc_block_flush | or1200_dc_top_or1200_dc_fsm_dc_block_writeback)))
                                begin
                                    coverage0[3153] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_dc_en & (or1200_dc_top_or1200_dc_fsm_dc_block_flush | or1200_dc_top_or1200_dc_fsm_dc_block_writeback) = True) 3153
                                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush <= or1200_dc_top_or1200_dc_fsm_dc_block_flush;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush = or1200_dc_top_or1200_dc_fsm_dc_block_flush) 3155
                                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback <= or1200_dc_top_or1200_dc_fsm_dc_block_writeback;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = or1200_dc_top_or1200_dc_fsm_dc_block_writeback) 3156
                                    or1200_dc_top_or1200_dc_fsm_hitmiss_eval <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval = 1) 3157
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h5;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 5) 3158
                                    or1200_dc_top_or1200_dc_fsm_addr_r <= or1200_dc_top_or1200_dc_fsm_spr_dat_i;  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = or1200_dc_top_or1200_dc_fsm_spr_dat_i) 3159
                                end
                            else
                                begin
                                    coverage0[3154] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_dc_en & (or1200_dc_top_or1200_dc_fsm_dc_block_flush | or1200_dc_top_or1200_dc_fsm_dc_block_writeback) = False) 3154
                                    if ((or1200_dc_top_or1200_dc_fsm_dc_en & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i))
                                        begin
                                            coverage0[3160] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_dc_en & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i = True) 3160
                                            or1200_dc_top_or1200_dc_fsm_state <= 3'h1;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 1) 3162
                                            or1200_dc_top_or1200_dc_fsm_hitmiss_eval <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval = 1) 3163
                                            or1200_dc_top_or1200_dc_fsm_store <= or1200_dc_top_or1200_dc_fsm_dcqmem_we_i;  //assertion( or1200_dc_top_or1200_dc_fsm_store = or1200_dc_top_or1200_dc_fsm_dcqmem_we_i) 3164
                                            or1200_dc_top_or1200_dc_fsm_load <= (~or1200_dc_top_or1200_dc_fsm_dcqmem_we_i);  //assertion( or1200_dc_top_or1200_dc_fsm_load = Not(or1200_dc_top_or1200_dc_fsm_dcqmem_we_i == 1)) 3165
                                        end
                                    else
                                            coverage0[3161] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_dc_en & or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i = False) 3161
                                end
                        end
                      3'h1:
                        begin
                            coverage0[3166] = 1;  //assertion( 1 == or1200_dc_top_or1200_dc_fsm_state = True) 3166
                            or1200_dc_top_or1200_dc_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval = 0) 3167
                            if (or1200_dc_top_or1200_dc_fsm_hitmiss_eval)
                                begin
                                    coverage0[3168] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_hitmiss_eval = True) 3168
                                    or1200_dc_top_or1200_dc_fsm_cache_inhibit <= or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_inhibit = or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i) 3170
                                    or1200_dc_top_or1200_dc_fsm_cache_miss <= or1200_dc_top_or1200_dc_fsm_tagcomp_miss;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_miss = or1200_dc_top_or1200_dc_fsm_tagcomp_miss) 3171
                                    or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback <= or1200_dc_top_or1200_dc_fsm_dirty;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = or1200_dc_top_or1200_dc_fsm_dirty) 3172
                                    or1200_dc_top_or1200_dc_fsm_addr_r <= or1200_dc_top_or1200_dc_fsm_lsu_addr;  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = or1200_dc_top_or1200_dc_fsm_lsu_addr) 3173
                                end
                            else
                                    coverage0[3169] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_hitmiss_eval = False) 3169
                            if ((((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss) & (~(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough))) & (~or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i)))
                                begin
                                    coverage0[3174] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss & If(Not(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough == 1) == True, 1, 0) & If(Not(or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i == 1) == True, 1, 0) = True) 3174
                                    if (or1200_dc_top_or1200_dc_fsm_dirty)
                                        begin
                                            coverage0[3176] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_dirty = True) 3176
                                            or1200_dc_top_or1200_dc_fsm_addr_r <= {or1200_dc_top_or1200_dc_fsm_tag, or1200_dc_top_or1200_dc_fsm_lsu_addr[12:2], 2'h0};  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = Concat(Concat(or1200_dc_top_or1200_dc_fsm_tag, Extract(12, 2, or1200_dc_top_or1200_dc_fsm_lsu_addr)), 0)) 3178
                                            or1200_dc_top_or1200_dc_fsm_load <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 0) 3179
                                            or1200_dc_top_or1200_dc_fsm_store <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 1) 3180
                                        end
                                    else
                                        begin
                                            coverage0[3177] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_dirty = False) 3177
                                            or1200_dc_top_or1200_dc_fsm_addr_r <= or1200_dc_top_or1200_dc_fsm_lsu_addr;  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = or1200_dc_top_or1200_dc_fsm_lsu_addr) 3181
                                            or1200_dc_top_or1200_dc_fsm_load <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 1) 3182
                                            or1200_dc_top_or1200_dc_fsm_store <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 0) 3183
                                        end
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h2;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 2) 3184
                                    or1200_dc_top_or1200_dc_fsm_cnt <= (-4);  //assertion( or1200_dc_top_or1200_dc_fsm_cnt = -4) 3185
                                end
                            else
                                begin
                                    coverage0[3175] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tagcomp_miss & If(Not(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough == 1) == True, 1, 0) & If(Not(or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i == 1) == True, 1, 0) = False) 3175
                                    if ((((~or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i) | ((~or1200_dc_top_or1200_dc_fsm_hitmiss_eval) & (or1200_dc_top_or1200_dc_fsm_biudata_valid | or1200_dc_top_or1200_dc_fsm_biudata_error))) | (((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & (~or1200_dc_top_or1200_dc_fsm_tagcomp_miss)) & (~or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i)) & (~(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough)))))
                                        begin
                                            coverage0[3186] = 1;  //assertion( If(Not(or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i == 1) == True, 1, 0) | If(Not(or1200_dc_top_or1200_dc_fsm_hitmiss_eval == 1) == True, 1, 0) & (or1200_dc_top_or1200_dc_fsm_biudata_valid | or1200_dc_top_or1200_dc_fsm_biudata_error) | or1200_dc_top_or1200_dc_fsm_hitmiss_eval & If(Not(or1200_dc_top_or1200_dc_fsm_tagcomp_miss == 1) == True, 1, 0) & If(Not(or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i == 1) == True, 1, 0) & If(Not(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough == 1) == True, 1, 0) = True) 3186
                                            or1200_dc_top_or1200_dc_fsm_state <= 3'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 0) 3188
                                            or1200_dc_top_or1200_dc_fsm_load <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 0) 3189
                                            or1200_dc_top_or1200_dc_fsm_store <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 0) 3190
                                            or1200_dc_top_or1200_dc_fsm_cache_inhibit <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_inhibit = 0) 3191
                                            or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = 0) 3192
                                        end
                                    else
                                            coverage0[3187] = 1;  //assertion( If(Not(or1200_dc_top_or1200_dc_fsm_dcqmem_cycstb_i == 1) == True, 1, 0) | If(Not(or1200_dc_top_or1200_dc_fsm_hitmiss_eval == 1) == True, 1, 0) & (or1200_dc_top_or1200_dc_fsm_biudata_valid | or1200_dc_top_or1200_dc_fsm_biudata_error) | or1200_dc_top_or1200_dc_fsm_hitmiss_eval & If(Not(or1200_dc_top_or1200_dc_fsm_tagcomp_miss == 1) == True, 1, 0) & If(Not(or1200_dc_top_or1200_dc_fsm_dcqmem_ci_i == 1) == True, 1, 0) & If(Not(or1200_dc_top_or1200_dc_fsm_store & or1200_dc_top_or1200_dc_fsm_writethrough == 1) == True, 1, 0) = False) 3187
                                end
                        end
                      3'h2:
                        begin
                            coverage0[3193] = 1;  //assertion( 2 == or1200_dc_top_or1200_dc_fsm_state = True) 3193
                            if (((~or1200_dc_top_or1200_dc_fsm_dc_en) | or1200_dc_top_or1200_dc_fsm_biudata_error))
                                begin
                                    coverage0[3194] = 1;  //assertion( If(Not(or1200_dc_top_or1200_dc_fsm_dc_en == 1) == True, 1, 0) | or1200_dc_top_or1200_dc_fsm_biudata_error = True) 3194
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 0) 3196
                                    or1200_dc_top_or1200_dc_fsm_load <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 0) 3197
                                    or1200_dc_top_or1200_dc_fsm_store <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 0) 3198
                                    or1200_dc_top_or1200_dc_fsm_cnt <= 4'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_cnt = 0) 3199
                                end
                            else
                                    coverage0[3195] = 1;  //assertion( If(Not(or1200_dc_top_or1200_dc_fsm_dc_en == 1) == True, 1, 0) | or1200_dc_top_or1200_dc_fsm_biudata_error = False) 3195
                            if ((or1200_dc_top_or1200_dc_fsm_biudata_valid & (|or1200_dc_top_or1200_dc_fsm_cnt)))
                                begin
                                    coverage0[3200] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_biudata_valid & bvredor(or1200_dc_top_or1200_dc_fsm_cnt) = True) 3200
                                    or1200_dc_top_or1200_dc_fsm_cnt <= (or1200_dc_top_or1200_dc_fsm_cnt - 4'h4);  //assertion( or1200_dc_top_or1200_dc_fsm_cnt = or1200_dc_top_or1200_dc_fsm_cnt - 4) 3202
                                    or1200_dc_top_or1200_dc_fsm_addr_r[3:2] <= (or1200_dc_top_or1200_dc_fsm_addr_r[3:2] + 2'h1);  //assertion( Extract(3, 2, or1200_dc_top_or1200_dc_fsm_addr_r) = Extract(3, 2, or1200_dc_top_or1200_dc_fsm_addr_r) + 1) 3203
                                end
                            else
                                begin
                                    coverage0[3201] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_biudata_valid & bvredor(or1200_dc_top_or1200_dc_fsm_cnt) = False) 3201
                                    if ((or1200_dc_top_or1200_dc_fsm_biudata_valid & (~(|or1200_dc_top_or1200_dc_fsm_cnt))))
                                        begin
                                            coverage0[3204] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_biudata_valid & If(Not(bvredor(or1200_dc_top_or1200_dc_fsm_cnt) == 1) == True, 1, 0) = True) 3204
                                            or1200_dc_top_or1200_dc_fsm_state <= 3'h3;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 3) 3206
                                            or1200_dc_top_or1200_dc_fsm_addr_r <= or1200_dc_top_or1200_dc_fsm_lsu_addr;  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = or1200_dc_top_or1200_dc_fsm_lsu_addr) 3207
                                            or1200_dc_top_or1200_dc_fsm_load <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 0) 3208
                                            or1200_dc_top_or1200_dc_fsm_store <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 0) 3209
                                        end
                                    else
                                            coverage0[3205] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_biudata_valid & If(Not(bvredor(or1200_dc_top_or1200_dc_fsm_cnt) == 1) == True, 1, 0) = False) 3205
                                end
                            if (or1200_dc_top_or1200_dc_fsm_load_miss_ack)
                                begin
                                    coverage0[3210] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_load_miss_ack = True) 3210
                                    or1200_dc_top_or1200_dc_fsm_did_early_load_ack <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_did_early_load_ack = 1) 3212
                                end
                            else
                                    coverage0[3211] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_load_miss_ack = False) 3211
                        end
                      3'h3:
                        begin
                            coverage0[3213] = 1;  //assertion( 3 == or1200_dc_top_or1200_dc_fsm_state = True) 3213
                            if (or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback)
                                begin
                                    coverage0[3214] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = True) 3214
                                    or1200_dc_top_or1200_dc_fsm_load <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 1) 3216
                                    or1200_dc_top_or1200_dc_fsm_cnt <= (-4);  //assertion( or1200_dc_top_or1200_dc_fsm_cnt = -4) 3217
                                    or1200_dc_top_or1200_dc_fsm_addr_r <= or1200_dc_top_or1200_dc_fsm_lsu_addr;  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = or1200_dc_top_or1200_dc_fsm_lsu_addr) 3218
                                    or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = 0) 3219
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h2;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 2) 3220
                                end
                            else
                                begin
                                    coverage0[3215] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_fsm_cache_dirty_needs_writeback = False) 3215
                                    if ((or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush | or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback))
                                        begin
                                            coverage0[3221] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush | or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = True) 3221
                                            or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush = 0) 3223
                                            or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = 0) 3224
                                            or1200_dc_top_or1200_dc_fsm_state <= 3'h7;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 7) 3225
                                        end
                                    else
                                        begin
                                            coverage0[3222] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush | or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = False) 3222
                                            or1200_dc_top_or1200_dc_fsm_did_early_load_ack <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_did_early_load_ack = 0) 3226
                                            or1200_dc_top_or1200_dc_fsm_state <= 3'h4;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 4) 3227
                                        end
                                end
                        end
                      3'h4:
                        begin
                            coverage0[3228] = 1;  //assertion( 4 == or1200_dc_top_or1200_dc_fsm_state = True) 3228
                            or1200_dc_top_or1200_dc_fsm_state <= 3'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 0) 3229
                        end
                      3'h5:
                        begin
                            coverage0[3230] = 1;  //assertion( 5 == or1200_dc_top_or1200_dc_fsm_state = True) 3230
                            or1200_dc_top_or1200_dc_fsm_hitmiss_eval <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval = 0) 3231
                            if ((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & (~or1200_dc_top_or1200_dc_fsm_tag_v)))
                                begin
                                    coverage0[3232] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval & If(Not(or1200_dc_top_or1200_dc_fsm_tag_v == 1) == True, 1, 0) = True) 3232
                                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush = 0) 3234
                                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = 0) 3235
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h7;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 7) 3236
                                end
                            else
                                begin
                                    coverage0[3233] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval & If(Not(or1200_dc_top_or1200_dc_fsm_tag_v == 1) == True, 1, 0) = False) 3233
                                    if ((or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tag_v))
                                        begin
                                            coverage0[3237] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tag_v = True) 3237
                                            if (((or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush | or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback) & or1200_dc_top_or1200_dc_fsm_dirty))
                                                begin
                                                    coverage0[3239] = 1;  //assertion( (or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush | or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback) & or1200_dc_top_or1200_dc_fsm_dirty = True) 3239
                                                    or1200_dc_top_or1200_dc_fsm_addr_r <= {or1200_dc_top_or1200_dc_fsm_tag, or1200_dc_top_or1200_dc_fsm_addr_r[12:2], 2'h0};  //assertion( or1200_dc_top_or1200_dc_fsm_addr_r = Concat(Concat(or1200_dc_top_or1200_dc_fsm_tag, Extract(12, 2, or1200_dc_top_or1200_dc_fsm_addr_r)), 0)) 3241
                                                    or1200_dc_top_or1200_dc_fsm_load <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_load = 0) 3242
                                                    or1200_dc_top_or1200_dc_fsm_store <= 1'b1;  //assertion( or1200_dc_top_or1200_dc_fsm_store = 1) 3243
                                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h2;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 2) 3244
                                                    or1200_dc_top_or1200_dc_fsm_cnt <= (-4);  //assertion( or1200_dc_top_or1200_dc_fsm_cnt = -4) 3245
                                                end
                                            else
                                                begin
                                                    coverage0[3240] = 1;  //assertion( (or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush | or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback) & or1200_dc_top_or1200_dc_fsm_dirty = False) 3240
                                                    if ((or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush & (~or1200_dc_top_or1200_dc_fsm_dirty)))
                                                        begin
                                                            coverage0[3246] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush & If(Not(or1200_dc_top_or1200_dc_fsm_dirty == 1) == True, 1, 0) = True) 3246
                                                            or1200_dc_top_or1200_dc_fsm_state <= 3'h6;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 6) 3248
                                                        end
                                                    else
                                                        begin
                                                            coverage0[3247] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush & If(Not(or1200_dc_top_or1200_dc_fsm_dirty == 1) == True, 1, 0) = False) 3247
                                                            if ((or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback & (~or1200_dc_top_or1200_dc_fsm_dirty)))
                                                                begin
                                                                    coverage0[3249] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback & If(Not(or1200_dc_top_or1200_dc_fsm_dirty == 1) == True, 1, 0) = True) 3249
                                                                    or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback = 0) 3251
                                                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h7;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 7) 3252
                                                                end
                                                            else
                                                                    coverage0[3250] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_writeback & If(Not(or1200_dc_top_or1200_dc_fsm_dirty == 1) == True, 1, 0) = False) 3250
                                                        end
                                                end
                                        end
                                    else
                                            coverage0[3238] = 1;  //assertion( or1200_dc_top_or1200_dc_fsm_hitmiss_eval & or1200_dc_top_or1200_dc_fsm_tag_v = False) 3238
                                end
                        end
                      3'h6:
                        begin
                            coverage0[3253] = 1;  //assertion( 6 == or1200_dc_top_or1200_dc_fsm_state = True) 3253
                            or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush <= 1'b0;  //assertion( or1200_dc_top_or1200_dc_fsm_cache_spr_block_flush = 0) 3254
                            if ((~or1200_dc_top_or1200_dc_fsm_spr_cswe))
                                begin
                                    coverage0[3255] = 1;  //assertion( Not(or1200_dc_top_or1200_dc_fsm_spr_cswe == 1) = True) 3255
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 0) 3257
                                end
                            else
                                    coverage0[3256] = 1;  //assertion( Not(or1200_dc_top_or1200_dc_fsm_spr_cswe == 1) = False) 3256
                        end
                      3'h7:
                        begin
                            coverage0[3258] = 1;  //assertion( 7 == or1200_dc_top_or1200_dc_fsm_state = True) 3258
                            if ((~or1200_dc_top_or1200_dc_fsm_spr_cswe))
                                begin
                                    coverage0[3259] = 1;  //assertion( Not(or1200_dc_top_or1200_dc_fsm_spr_cswe == 1) = True) 3259
                                    or1200_dc_top_or1200_dc_fsm_state <= 3'h0;  //assertion( or1200_dc_top_or1200_dc_fsm_state = 0) 3261
                                end
                            else
                                    coverage0[3260] = 1;  //assertion( Not(or1200_dc_top_or1200_dc_fsm_spr_cswe == 1) = False) 3260
                        end
                    endcase
                end
        end

    //Following code is from line 4596
        always @(posedge or1200_dc_top_or1200_dc_ram_dc_ram_clk) begin
            if (or1200_dc_top_or1200_dc_ram_dc_ram_ce)
                begin
                    coverage0[3262] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_ram_dc_ram_ce = True) 3262
                    or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg <= or1200_dc_top_or1200_dc_ram_dc_ram_addr;  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_addr_reg = or1200_dc_top_or1200_dc_ram_dc_ram_addr) 3264
                end
            else
                    coverage0[3263] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_ram_dc_ram_ce = False) 3263
        end

    //Following code is from line 4598
        always @(posedge or1200_dc_top_or1200_dc_ram_dc_ram_clk) begin
            if (or1200_dc_top_or1200_dc_ram_dc_ram_ce)
                begin
                    coverage0[3265] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_ram_dc_ram_ce = True) 3265
                    if (or1200_dc_top_or1200_dc_ram_dc_ram_we[3])
                        begin
                            coverage0[3267] = 1;  //assertion( Extract(3, 3, or1200_dc_top_or1200_dc_ram_dc_ram_we) = True) 3267
                            or1200_dc_top_or1200_dc_ram_dc_ram_mem0[or1200_dc_top_or1200_dc_ram_dc_ram_addr] <= or1200_dc_top_or1200_dc_ram_dc_ram_di[31:24];  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_mem0[or1200_dc_top_or1200_dc_ram_dc_ram_addr] = Extract(31, 24, or1200_dc_top_or1200_dc_ram_dc_ram_di)) 3269
                        end
                    else
                            coverage0[3268] = 1;  //assertion( Extract(3, 3, or1200_dc_top_or1200_dc_ram_dc_ram_we) = False) 3268
                    if (or1200_dc_top_or1200_dc_ram_dc_ram_we[2])
                        begin
                            coverage0[3270] = 1;  //assertion( Extract(2, 2, or1200_dc_top_or1200_dc_ram_dc_ram_we) = True) 3270
                            or1200_dc_top_or1200_dc_ram_dc_ram_mem1[or1200_dc_top_or1200_dc_ram_dc_ram_addr] <= or1200_dc_top_or1200_dc_ram_dc_ram_di[23:16];  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_mem1[or1200_dc_top_or1200_dc_ram_dc_ram_addr] = Extract(23, 16, or1200_dc_top_or1200_dc_ram_dc_ram_di)) 3272
                        end
                    else
                            coverage0[3271] = 1;  //assertion( Extract(2, 2, or1200_dc_top_or1200_dc_ram_dc_ram_we) = False) 3271
                    if (or1200_dc_top_or1200_dc_ram_dc_ram_we[1])
                        begin
                            coverage0[3273] = 1;  //assertion( Extract(1, 1, or1200_dc_top_or1200_dc_ram_dc_ram_we) = True) 3273
                            or1200_dc_top_or1200_dc_ram_dc_ram_mem2[or1200_dc_top_or1200_dc_ram_dc_ram_addr] <= or1200_dc_top_or1200_dc_ram_dc_ram_di[15:8];  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_mem2[or1200_dc_top_or1200_dc_ram_dc_ram_addr] = Extract(15, 8, or1200_dc_top_or1200_dc_ram_dc_ram_di)) 3275
                        end
                    else
                            coverage0[3274] = 1;  //assertion( Extract(1, 1, or1200_dc_top_or1200_dc_ram_dc_ram_we) = False) 3274
                    if (or1200_dc_top_or1200_dc_ram_dc_ram_we[0])
                        begin
                            coverage0[3276] = 1;  //assertion( Extract(0, 0, or1200_dc_top_or1200_dc_ram_dc_ram_we) = True) 3276
                            or1200_dc_top_or1200_dc_ram_dc_ram_mem3[or1200_dc_top_or1200_dc_ram_dc_ram_addr] <= or1200_dc_top_or1200_dc_ram_dc_ram_di[7:0];  //assertion( or1200_dc_top_or1200_dc_ram_dc_ram_mem3[or1200_dc_top_or1200_dc_ram_dc_ram_addr] = Extract(7, 0, or1200_dc_top_or1200_dc_ram_dc_ram_di)) 3278
                        end
                    else
                            coverage0[3277] = 1;  //assertion( Extract(0, 0, or1200_dc_top_or1200_dc_ram_dc_ram_we) = False) 3277
                end
            else
                    coverage0[3266] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_ram_dc_ram_ce = False) 3266
        end

    //Following code is from line 4605
        always @(posedge or1200_dc_top_or1200_dc_tag_dc_tag0_clk) begin
            if (or1200_dc_top_or1200_dc_tag_dc_tag0_ce)
                begin
                    coverage0[3279] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_tag_dc_tag0_ce = True) 3279
                    or1200_dc_top_or1200_dc_tag_dc_tag0_addr_reg <= or1200_dc_top_or1200_dc_tag_dc_tag0_addr;  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_addr_reg = or1200_dc_top_or1200_dc_tag_dc_tag0_addr) 3281
                end
            else
                    coverage0[3280] = 1;  //assertion( 0 != or1200_dc_top_or1200_dc_tag_dc_tag0_ce = False) 3280
        end

    //Following code is from line 4607
        always @(posedge or1200_dc_top_or1200_dc_tag_dc_tag0_clk) begin
            if ((or1200_dc_top_or1200_dc_tag_dc_tag0_we && or1200_dc_top_or1200_dc_tag_dc_tag0_ce))
                begin
                    coverage0[3282] = 1;  //assertion( And(or1200_dc_top_or1200_dc_tag_dc_tag0_we == 1, or1200_dc_top_or1200_dc_tag_dc_tag0_ce == 1) = True) 3282
                    or1200_dc_top_or1200_dc_tag_dc_tag0_mem[or1200_dc_top_or1200_dc_tag_dc_tag0_addr] <= or1200_dc_top_or1200_dc_tag_dc_tag0_di;  //assertion( or1200_dc_top_or1200_dc_tag_dc_tag0_mem[or1200_dc_top_or1200_dc_tag_dc_tag0_addr] = or1200_dc_top_or1200_dc_tag_dc_tag0_di) 3284
                end
            else
                    coverage0[3283] = 1;  //assertion( And(or1200_dc_top_or1200_dc_tag_dc_tag0_we == 1, or1200_dc_top_or1200_dc_tag_dc_tag0_ce == 1) = False) 3283
        end

    //Following code is from line 4609
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3285] = 1;  //assertion( 1 == or1200_du_rst = True) 3285
                    or1200_du_dbg_is_o <= 2'h0;  //assertion( or1200_du_dbg_is_o = 0) 3287
                end
            else
                begin
                    coverage0[3286] = 1;  //assertion( 1 == or1200_du_rst = False) 3286
                    if (((~or1200_du_ex_freeze) & (~((or1200_du_ex_insn[31:26] == 6'h05) & or1200_du_ex_insn[16]))))
                        begin
                            coverage0[3288] = 1;  //assertion( If(Not(or1200_du_ex_freeze == 1) == True, 1, 0) & ~(If((5 == Extract(31, 26, or1200_du_ex_insn)) == True, 1, 0) & Extract(16, 16, or1200_du_ex_insn)) = True) 3288
                            or1200_du_dbg_is_o <= (~or1200_du_dbg_is_o);  //assertion( or1200_du_dbg_is_o = ~or1200_du_dbg_is_o) 3290
                        end
                    else
                            coverage0[3289] = 1;  //assertion( If(Not(or1200_du_ex_freeze == 1) == True, 1, 0) & ~(If((5 == Extract(31, 26, or1200_du_ex_insn)) == True, 1, 0) & Extract(16, 16, or1200_du_ex_insn)) = False) 3289
                end
        end

    //Following code is from line 4612
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3291] = 1;  //assertion( 1 == or1200_du_rst = True) 3291
                    or1200_du_du_flush_pipe_r <= 1'b0;  //assertion( or1200_du_du_flush_pipe_r = 0) 3293
                end
            else
                begin
                    coverage0[3292] = 1;  //assertion( 1 == or1200_du_rst = False) 3292
                    or1200_du_du_flush_pipe_r <= ((or1200_du_dbg_stall_i_r && (~or1200_du_dbg_stall_i)) && (|or1200_du_du_except_stop));  //assertion( or1200_du_du_flush_pipe_r = And(If(And(or1200_du_dbg_stall_i_r == 1, If(Not(or1200_du_dbg_stall_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, bvredor(or1200_du_du_except_stop) == 1)) 3294
                end
        end

    //Following code is from line 4615
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3295] = 1;  //assertion( 1 == or1200_du_rst = True) 3295
                    or1200_du_dbg_stall_i_r <= 1'b0;  //assertion( or1200_du_dbg_stall_i_r = 0) 3297
                end
            else
                begin
                    coverage0[3296] = 1;  //assertion( 1 == or1200_du_rst = False) 3296
                    or1200_du_dbg_stall_i_r <= or1200_du_dbg_stall_i;  //assertion( or1200_du_dbg_stall_i_r = or1200_du_dbg_stall_i) 3298
                end
        end

    //Following code is from line 4618
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3299] = 1;  //assertion( 1 == or1200_du_rst = True) 3299
                    or1200_du_dbg_ack <= 1'b0;  //assertion( or1200_du_dbg_ack = 0) 3301
                    or1200_du_dbg_ack_o <= 1'b0;  //assertion( or1200_du_dbg_ack_o = 0) 3302
                end
            else
                begin
                    coverage0[3300] = 1;  //assertion( 1 == or1200_du_rst = False) 3300
                    or1200_du_dbg_ack <= or1200_du_dbg_stb_i;  //assertion( or1200_du_dbg_ack = or1200_du_dbg_stb_i) 3303
                    or1200_du_dbg_ack_o <= (or1200_du_dbg_ack & or1200_du_dbg_stb_i);  //assertion( or1200_du_dbg_ack_o = or1200_du_dbg_ack & or1200_du_dbg_stb_i) 3304
                end
        end

    //Following code is from line 4627
        always @(posedge or1200_du_clk) begin
            or1200_du_dbg_dat_o <= or1200_du_du_dat_i;  //assertion( or1200_du_dbg_dat_o = or1200_du_du_dat_i) 3305
        end

    //Following code is from line 4629
        always @(posedge or1200_du_clk) begin
            or1200_du_ex_freeze_q <= or1200_du_ex_freeze;  //assertion( or1200_du_ex_freeze_q = or1200_du_ex_freeze) 3306
        end

    //Following code is from line 4631
        always @(or1200_du_ex_freeze_q or or1200_du_du_except_stop) begin
            or1200_du_except_stop = 14'h0000;  //assertion( or1200_du_except_stop = 0) 3307
            case (or1200_du_du_except_stop)
              14'b1zzzzzzzzzzzzz:
                begin
                    coverage0[3308] = 1;  //assertion( 8192 == or1200_du_du_except_stop = True) 3308
                    or1200_du_except_stop[4] = 1'b1;  //assertion( Extract(4, 4, or1200_du_except_stop) = 1) 3309
                end
              14'b01zzzzzzzzzzzz:
                begin
                    coverage0[3310] = 1;  //assertion( 4096 == or1200_du_du_except_stop = True) 3310
                    or1200_du_except_stop[7] = 1'b1;  //assertion( Extract(7, 7, or1200_du_except_stop) = 1) 3311
                end
              14'b01zzzzzzzzzzz:
                begin
                    coverage0[3312] = 1;  //assertion( 2048 == or1200_du_du_except_stop = True) 3312
                    or1200_du_except_stop[9] = 1'b1;  //assertion( Extract(9, 9, or1200_du_except_stop) = 1) 3313
                end
              14'b01zzzzzzzzzz:
                begin
                    coverage0[3314] = 1;  //assertion( 1024 == or1200_du_du_except_stop = True) 3314
                    or1200_du_except_stop[3] = 1'b1;  //assertion( Extract(3, 3, or1200_du_except_stop) = 1) 3315
                end
              14'b01zzzzzzzzz:
                begin
                    coverage0[3316] = 1;  //assertion( 512 == or1200_du_du_except_stop = True) 3316
                    or1200_du_except_stop[1] = 1'b1;  //assertion( Extract(1, 1, or1200_du_except_stop) = 1) 3317
                end
              14'b01zzzzzzzz:
                begin
                    coverage0[3318] = 1;  //assertion( 256 == or1200_du_du_except_stop = True) 3318
                    or1200_du_except_stop[6] = 1'b1;  //assertion( Extract(6, 6, or1200_du_except_stop) = 1) 3319
                end
              14'b01zzzzzzz:
                begin
                    coverage0[3320] = 1;  //assertion( 128 == or1200_du_du_except_stop = True) 3320
                    or1200_du_except_stop[5] = 1'b1;  //assertion( Extract(5, 5, or1200_du_except_stop) = 1) 3321
                end
              14'b01zzzzzz:
                begin
                    coverage0[3322] = 1;  //assertion( 64 == or1200_du_du_except_stop = True) 3322
                    or1200_du_except_stop[8] = 1'b1;  //assertion( Extract(8, 8, or1200_du_except_stop) = 1) 3323
                end
              14'b01zzzzz:
                begin
                    coverage0[3324] = 1;  //assertion( 32 == or1200_du_du_except_stop = True) 3324
                    or1200_du_except_stop[2] = 1'b1;  //assertion( Extract(2, 2, or1200_du_except_stop) = 1) 3325
                end
              14'b01zzzz:
                begin
                    coverage0[3326] = 1;  //assertion( 16 == or1200_du_du_except_stop = True) 3326
                    or1200_du_except_stop[1] = 1'b1;  //assertion( Extract(1, 1, or1200_du_except_stop) = 1) 3327
                end
              14'b01zzz:
                begin
                    coverage0[3328] = 1;  //assertion( 8 == or1200_du_du_except_stop = True) 3328
                    or1200_du_except_stop[10] = 1'b1;  //assertion( Extract(10, 10, or1200_du_except_stop) = 1) 3329
                end
              14'b01zz:
                begin
                    coverage0[3330] = 1;  //assertion( 4 == or1200_du_du_except_stop = True) 3330
                    or1200_du_except_stop[13] = (1'b1 & (~or1200_du_ex_freeze_q));  //assertion( Extract(13, 13, or1200_du_except_stop) = 1 & ~or1200_du_ex_freeze_q) 3331
                end
              14'b01z:
                begin
                    coverage0[3332] = 1;  //assertion( 2 == or1200_du_du_except_stop = True) 3332
                    or1200_du_except_stop[12] = 1'b1;  //assertion( Extract(12, 12, or1200_du_except_stop) = 1) 3333
                end
              14'h0001:
                begin
                    coverage0[3334] = 1;  //assertion( 1 == or1200_du_du_except_stop = True) 3334
                    or1200_du_except_stop[11] = (1'b1 & (~or1200_du_ex_freeze_q));  //assertion( Extract(11, 11, or1200_du_except_stop) = 1 & ~or1200_du_ex_freeze_q) 3335
                end
              default:
                begin
                    coverage0[3336] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 3336
                    or1200_du_except_stop = 14'h0000;  //assertion( or1200_du_except_stop = 0) 3337
                end
            endcase
        end

    //Following code is from line 4652
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3338] = 1;  //assertion( 1 == or1200_du_rst = True) 3338
                    or1200_du_dbg_bp_r <= 1'b0;  //assertion( or1200_du_dbg_bp_r = 0) 3340
                end
            else
                begin
                    coverage0[3339] = 1;  //assertion( 1 == or1200_du_rst = False) 3339
                    if ((~or1200_du_ex_freeze))
                        begin
                            coverage0[3341] = 1;  //assertion( Not(or1200_du_ex_freeze == 1) = True) 3341
                            or1200_du_dbg_bp_r <= (((|or1200_du_except_stop) | ((~((or1200_du_ex_insn[31:26] == 6'h05) & or1200_du_ex_insn[16])) & or1200_du_dmr1[22])) | (((or1200_du_branch_op != 3'h0) & (or1200_du_branch_op != 3'h6)) & or1200_du_dmr1[23]));  //assertion( or1200_du_dbg_bp_r = bvredor(or1200_du_except_stop) | ~(If((5 == Extract(31, 26, or1200_du_ex_insn)) == True, 1, 0) & Extract(16, 16, or1200_du_ex_insn)) & Extract(22, 22, or1200_du_dmr1) | If(0 != or1200_du_branch_op == True, 1, 0) & If(6 != or1200_du_branch_op == True, 1, 0) & Extract(23, 23, or1200_du_dmr1)) 3343
                        end
                    else
                        begin
                            coverage0[3342] = 1;  //assertion( Not(or1200_du_ex_freeze == 1) = False) 3342
                            or1200_du_dbg_bp_r <= (|or1200_du_except_stop);  //assertion( or1200_du_dbg_bp_r = bvredor(or1200_du_except_stop)) 3344
                        end
                end
        end

    //Following code is from line 4656
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3345] = 1;  //assertion( 1 == or1200_du_rst = True) 3345
                    or1200_du_dmr1 <= 25'h0000000;  //assertion( or1200_du_dmr1 = 0) 3347
                end
            else
                begin
                    coverage0[3346] = 1;  //assertion( 1 == or1200_du_rst = False) 3346
                    if ((or1200_du_dmr1_sel && or1200_du_spr_write))
                        begin
                            coverage0[3348] = 1;  //assertion( And(or1200_du_dmr1_sel == 1, or1200_du_spr_write == 1) = True) 3348
                            or1200_du_dmr1 <= {1'b0, or1200_du_spr_dat_i[23:22], 22'h000000};  //assertion( or1200_du_dmr1 = Concat(Concat(0, Extract(23, 22, or1200_du_spr_dat_i)), 0)) 3350
                        end
                    else
                            coverage0[3349] = 1;  //assertion( And(or1200_du_dmr1_sel == 1, or1200_du_spr_write == 1) = False) 3349
                end
        end

    //Following code is from line 4659
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3351] = 1;  //assertion( 1 == or1200_du_rst = True) 3351
                    or1200_du_dsr <= 14'h0000;  //assertion( or1200_du_dsr = 0) 3353
                end
            else
                begin
                    coverage0[3352] = 1;  //assertion( 1 == or1200_du_rst = False) 3352
                    if ((or1200_du_dsr_sel && or1200_du_spr_write))
                        begin
                            coverage0[3354] = 1;  //assertion( And(or1200_du_dsr_sel == 1, or1200_du_spr_write == 1) = True) 3354
                            or1200_du_dsr <= or1200_du_spr_dat_i[13:0];  //assertion( or1200_du_dsr = Extract(13, 0, or1200_du_spr_dat_i)) 3356
                        end
                    else
                            coverage0[3355] = 1;  //assertion( And(or1200_du_dsr_sel == 1, or1200_du_spr_write == 1) = False) 3355
                end
        end

    //Following code is from line 4662
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3357] = 1;  //assertion( 1 == or1200_du_rst = True) 3357
                    or1200_du_drr <= 14'h0000;  //assertion( or1200_du_drr = 0) 3359
                end
            else
                begin
                    coverage0[3358] = 1;  //assertion( 1 == or1200_du_rst = False) 3358
                    if ((or1200_du_drr_sel && or1200_du_spr_write))
                        begin
                            coverage0[3360] = 1;  //assertion( And(or1200_du_drr_sel == 1, or1200_du_spr_write == 1) = True) 3360
                            or1200_du_drr <= or1200_du_spr_dat_i[13:0];  //assertion( or1200_du_drr = Extract(13, 0, or1200_du_spr_dat_i)) 3362
                        end
                    else
                        begin
                            coverage0[3361] = 1;  //assertion( And(or1200_du_drr_sel == 1, or1200_du_spr_write == 1) = False) 3361
                            or1200_du_drr <= (or1200_du_drr | or1200_du_except_stop);  //assertion( or1200_du_drr = or1200_du_drr | or1200_du_except_stop) 3363
                        end
                end
        end

    //Following code is from line 4666
        always @(or1200_du_dwcr1 or or1200_du_dwcr0 or or1200_du_dcr7 or or1200_du_dcr6 or or1200_du_dcr5 or or1200_du_dcr4 or or1200_du_dcr3 or or1200_du_dcr2 or or1200_du_dcr1 or or1200_du_dcr0 or or1200_du_dvr7 or or1200_du_dvr6 or or1200_du_dvr5 or or1200_du_dvr4 or or1200_du_dvr3 or or1200_du_dvr2 or or1200_du_dvr1 or or1200_du_dvr0 or or1200_du_dmr2 or or1200_du_dmr1 or or1200_du_drr or or1200_du_dsr or or1200_du_spr_addr) begin
            case (or1200_du_spr_addr[10:0])
              11'h010:
                begin
                    coverage0[3364] = 1;  //assertion( 16 == Extract(10, 0, or1200_du_spr_addr) = True) 3364
                    or1200_du_spr_dat_o = {7'h00, or1200_du_dmr1};  //assertion( or1200_du_spr_dat_o = Concat(0, or1200_du_dmr1)) 3365
                end
              11'h014:
                begin
                    coverage0[3366] = 1;  //assertion( 20 == Extract(10, 0, or1200_du_spr_addr) = True) 3366
                    or1200_du_spr_dat_o = {18'h00000, or1200_du_dsr};  //assertion( or1200_du_spr_dat_o = Concat(0, or1200_du_dsr)) 3367
                end
              11'h015:
                begin
                    coverage0[3368] = 1;  //assertion( 21 == Extract(10, 0, or1200_du_spr_addr) = True) 3368
                    or1200_du_spr_dat_o = {18'h00000, or1200_du_drr};  //assertion( or1200_du_spr_dat_o = Concat(0, or1200_du_drr)) 3369
                end
              default:
                begin
                    coverage0[3370] = 1;  //assertion( If(16 != Extract(10, 0, or1200_du_spr_addr) == True, 1, 0) & If(20 != Extract(10, 0, or1200_du_spr_addr) == True, 1, 0) & If(21 != Extract(10, 0, or1200_du_spr_addr) == True, 1, 0) = True) 3370
                    or1200_du_spr_dat_o = 32'h00000000;  //assertion( or1200_du_spr_dat_o = 0) 3371
                end
            endcase
        end

    //Following code is from line 4673
        always @(posedge or1200_du_rst or posedge or1200_du_clk) begin
            if ((or1200_du_rst == 1'b1))
                begin
                    coverage0[3372] = 1;  //assertion( 1 == or1200_du_rst = True) 3372
                    or1200_du_du_hwbkpt_hold <= 1'b0;  //assertion( or1200_du_du_hwbkpt_hold = 0) 3374
                end
            else
                begin
                    coverage0[3373] = 1;  //assertion( 1 == or1200_du_rst = False) 3373
                    if ((or1200_du_du_hwbkpt & or1200_du_ex_freeze))
                        begin
                            coverage0[3375] = 1;  //assertion( or1200_du_du_hwbkpt & or1200_du_ex_freeze = True) 3375
                            or1200_du_du_hwbkpt_hold <= 1'b1;  //assertion( or1200_du_du_hwbkpt_hold = 1) 3377
                        end
                    else
                        begin
                            coverage0[3376] = 1;  //assertion( or1200_du_du_hwbkpt & or1200_du_ex_freeze = False) 3376
                            if ((~or1200_du_ex_freeze))
                                begin
                                    coverage0[3378] = 1;  //assertion( Not(or1200_du_ex_freeze == 1) = True) 3378
                                    or1200_du_du_hwbkpt_hold <= 1'b0;  //assertion( or1200_du_du_hwbkpt_hold = 0) 3380
                                end
                            else
                                    coverage0[3379] = 1;  //assertion( Not(or1200_du_ex_freeze == 1) = False) 3379
                        end
                end
        end

    //Following code is from line 4677
        always @(posedge or1200_pic_rst or posedge or1200_pic_clk) begin
            if ((or1200_pic_rst == 1'b1))
                begin
                    coverage0[3381] = 1;  //assertion( 1 == or1200_pic_rst = True) 3381
                    or1200_pic_picmr <= 18'h20000;  //assertion( or1200_pic_picmr = 131072) 3383
                end
            else
                begin
                    coverage0[3382] = 1;  //assertion( 1 == or1200_pic_rst = False) 3382
                    if ((or1200_pic_picmr_sel && or1200_pic_spr_write))
                        begin
                            coverage0[3384] = 1;  //assertion( And(or1200_pic_picmr_sel == 1, or1200_pic_spr_write == 1) = True) 3384
                            or1200_pic_picmr <= or1200_pic_spr_dat_i[19:2];  //assertion( or1200_pic_picmr = Extract(19, 2, or1200_pic_spr_dat_i)) 3386
                        end
                    else
                            coverage0[3385] = 1;  //assertion( And(or1200_pic_picmr_sel == 1, or1200_pic_spr_write == 1) = False) 3385
                end
        end

    //Following code is from line 4680
        always @(posedge or1200_pic_rst or posedge or1200_pic_clk) begin
            if ((or1200_pic_rst == 1'b1))
                begin
                    coverage0[3387] = 1;  //assertion( 1 == or1200_pic_rst = True) 3387
                    or1200_pic_picsr <= 20'h00000;  //assertion( or1200_pic_picsr = 0) 3389
                end
            else
                begin
                    coverage0[3388] = 1;  //assertion( 1 == or1200_pic_rst = False) 3388
                    if ((or1200_pic_picsr_sel && or1200_pic_spr_write))
                        begin
                            coverage0[3390] = 1;  //assertion( And(or1200_pic_picsr_sel == 1, or1200_pic_spr_write == 1) = True) 3390
                            or1200_pic_picsr <= (or1200_pic_spr_dat_i[19:0] | or1200_pic_um_ints);  //assertion( or1200_pic_picsr = Extract(19, 0, or1200_pic_spr_dat_i) | or1200_pic_um_ints) 3392
                        end
                    else
                        begin
                            coverage0[3391] = 1;  //assertion( And(or1200_pic_picsr_sel == 1, or1200_pic_spr_write == 1) = False) 3391
                            or1200_pic_picsr <= (or1200_pic_picsr | or1200_pic_um_ints);  //assertion( or1200_pic_picsr = or1200_pic_picsr | or1200_pic_um_ints) 3393
                        end
                end
        end

    //Following code is from line 4684
        always @(or1200_pic_picsr or or1200_pic_picmr or or1200_pic_spr_addr) begin
            case (or1200_pic_spr_addr[1:0])
              2'h0:
                begin
                    coverage0[3394] = 1;  //assertion( 0 == Extract(1, 0, or1200_pic_spr_addr) = True) 3394
                    or1200_pic_spr_dat_o[19:0] = {or1200_pic_picmr, 2'h3};  //assertion( Extract(19, 0, or1200_pic_spr_dat_o) = Concat(or1200_pic_picmr, 3)) 3395
                    or1200_pic_spr_dat_o[31:20] = 12'h000;  //assertion( Extract(31, 20, or1200_pic_spr_dat_o) = 0) 3396
                end
              default:
                begin
                    coverage0[3397] = 1;  //assertion( 0 != Extract(1, 0, or1200_pic_spr_addr) = True) 3397
                    or1200_pic_spr_dat_o[19:0] = or1200_pic_picsr;  //assertion( Extract(19, 0, or1200_pic_spr_dat_o) = or1200_pic_picsr) 3398
                    or1200_pic_spr_dat_o[31:20] = 12'h000;  //assertion( Extract(31, 20, or1200_pic_spr_dat_o) = 0) 3399
                end
            endcase
        end

    //Following code is from line 4695
        always @(posedge or1200_tt_rst or posedge or1200_tt_clk) begin
            if ((or1200_tt_rst == 1'b1))
                begin
                    coverage0[3400] = 1;  //assertion( 1 == or1200_tt_rst = True) 3400
                    or1200_tt_ttmr <= 32'h00000000;  //assertion( or1200_tt_ttmr = 0) 3402
                end
            else
                begin
                    coverage0[3401] = 1;  //assertion( 1 == or1200_tt_rst = False) 3401
                    if ((or1200_tt_ttmr_sel && or1200_tt_spr_write))
                        begin
                            coverage0[3403] = 1;  //assertion( And(or1200_tt_ttmr_sel == 1, or1200_tt_spr_write == 1) = True) 3403
                            or1200_tt_ttmr <= or1200_tt_spr_dat_i;  //assertion( or1200_tt_ttmr = or1200_tt_spr_dat_i) 3405
                        end
                    else
                        begin
                            coverage0[3404] = 1;  //assertion( And(or1200_tt_ttmr_sel == 1, or1200_tt_spr_write == 1) = False) 3404
                            if (or1200_tt_ttmr[29])
                                begin
                                    coverage0[3406] = 1;  //assertion( Extract(29, 29, or1200_tt_ttmr) = True) 3406
                                    or1200_tt_ttmr[28] <= (or1200_tt_ttmr[28] | (or1200_tt_match & or1200_tt_ttmr[29]));  //assertion( Extract(28, 28, or1200_tt_ttmr) = Extract(28, 28, or1200_tt_ttmr) | or1200_tt_match & Extract(29, 29, or1200_tt_ttmr)) 3408
                                end
                            else
                                    coverage0[3407] = 1;  //assertion( Extract(29, 29, or1200_tt_ttmr) = False) 3407
                        end
                end
        end

    //Following code is from line 4699
        always @(posedge or1200_tt_rst or posedge or1200_tt_clk) begin
            if ((or1200_tt_rst == 1'b1))
                begin
                    coverage0[3409] = 1;  //assertion( 1 == or1200_tt_rst = True) 3409
                    or1200_tt_ttcr <= 32'h00000000;  //assertion( or1200_tt_ttcr = 0) 3411
                end
            else
                begin
                    coverage0[3410] = 1;  //assertion( 1 == or1200_tt_rst = False) 3410
                    if (or1200_tt_restart)
                        begin
                            coverage0[3412] = 1;  //assertion( 0 != or1200_tt_restart = True) 3412
                            or1200_tt_ttcr <= 32'h00000000;  //assertion( or1200_tt_ttcr = 0) 3414
                        end
                    else
                        begin
                            coverage0[3413] = 1;  //assertion( 0 != or1200_tt_restart = False) 3413
                            if ((or1200_tt_ttcr_sel && or1200_tt_spr_write))
                                begin
                                    coverage0[3415] = 1;  //assertion( And(or1200_tt_ttcr_sel == 1, or1200_tt_spr_write == 1) = True) 3415
                                    or1200_tt_ttcr <= or1200_tt_spr_dat_i;  //assertion( or1200_tt_ttcr = or1200_tt_spr_dat_i) 3417
                                end
                            else
                                begin
                                    coverage0[3416] = 1;  //assertion( And(or1200_tt_ttcr_sel == 1, or1200_tt_spr_write == 1) = False) 3416
                                    if ((~or1200_tt_stop))
                                        begin
                                            coverage0[3418] = 1;  //assertion( Not(or1200_tt_stop == 1) = True) 3418
                                            or1200_tt_ttcr <= (or1200_tt_ttcr + 32'h00000001);  //assertion( or1200_tt_ttcr = or1200_tt_ttcr + 1) 3420
                                        end
                                    else
                                            coverage0[3419] = 1;  //assertion( Not(or1200_tt_stop == 1) = False) 3419
                                end
                        end
                end
        end

    //Following code is from line 4704
        always @(or1200_tt_ttcr or or1200_tt_ttmr or or1200_tt_spr_addr) begin
            case (or1200_tt_spr_addr[0])
              1'b0:
                begin
                    coverage0[3421] = 1;  //assertion( 0 == Extract(0, 0, or1200_tt_spr_addr) = True) 3421
                    or1200_tt_spr_dat_o = or1200_tt_ttmr;  //assertion( or1200_tt_spr_dat_o = or1200_tt_ttmr) 3422
                end
              default:
                begin
                    coverage0[3423] = 1;  //assertion( 0 != Extract(0, 0, or1200_tt_spr_addr) = True) 3423
                    or1200_tt_spr_dat_o = or1200_tt_ttcr;  //assertion( or1200_tt_spr_dat_o = or1200_tt_ttcr) 3424
                end
            endcase
        end
                        // assert property (coverage0[1383]==0);

                    // assert property (coverage0[1384]==0);

                    // assert property (coverage0[1387]==0);

                    // assert property (coverage0[1388]==0);

                            assert property (coverage0[1390]==0);

                            assert property (coverage0[1391]==0);

                                    assert property (coverage0[1393]==0);

                                    assert property (coverage0[1394]==0);

                    assert property (coverage0[1396]==0);

                            assert property (coverage0[1400]==0);

                            assert property (coverage0[1401]==0);

                    assert property (coverage0[1404]==0);

                            assert property (coverage0[1410]==0);

                            assert property (coverage0[1411]==0);

                                    assert property (coverage0[1413]==0);

                                    assert property (coverage0[1414]==0);

                    assert property (coverage0[1417]==0);

                            assert property (coverage0[1423]==0);

                            assert property (coverage0[1424]==0);

                    assert property (coverage0[1427]==0);

                    // assert property (coverage0[1432]==0);

                    // assert property (coverage0[1433]==0);

                            assert property (coverage0[1442]==0);

                            assert property (coverage0[1443]==0);

                            assert property (coverage0[1448]==0);

                            assert property (coverage0[1449]==0);

                            assert property (coverage0[1452]==0);

                            assert property (coverage0[1453]==0);

                                    assert property (coverage0[1455]==0);

                                    assert property (coverage0[1456]==0);

                    // assert property (coverage0[1458]==0);

                    // assert property (coverage0[1459]==0);

                            assert property (coverage0[1463]==0);

                            assert property (coverage0[1464]==0);

                                    assert property (coverage0[1466]==0);

                                    assert property (coverage0[1467]==0);

                            assert property (coverage0[1469]==0);

                            assert property (coverage0[1470]==0);

                                    assert property (coverage0[1472]==0);

                                    assert property (coverage0[1473]==0);

                            assert property (coverage0[1475]==0);

                            assert property (coverage0[1476]==0);

                                    assert property (coverage0[1478]==0);

                                    assert property (coverage0[1479]==0);

                    // assert property (coverage0[1481]==0);

                    // assert property (coverage0[1482]==0);

                            assert property (coverage0[1487]==0);

                            assert property (coverage0[1488]==0);

                            assert property (coverage0[1491]==0);

                            assert property (coverage0[1492]==0);

                                    assert property (coverage0[1494]==0);

                                    assert property (coverage0[1495]==0);

                            assert property (coverage0[1497]==0);

                            assert property (coverage0[1498]==0);

                                    assert property (coverage0[1500]==0);

                                    assert property (coverage0[1501]==0);

                            assert property (coverage0[1503]==0);

                            assert property (coverage0[1504]==0);

                                    assert property (coverage0[1506]==0);

                                    assert property (coverage0[1507]==0);

                    // assert property (coverage0[1509]==0);

                    // assert property (coverage0[1510]==0);

                    // assert property (coverage0[1513]==0);

                    // assert property (coverage0[1514]==0);

                            assert property (coverage0[1516]==0);

                            assert property (coverage0[1517]==0);

                                    assert property (coverage0[1519]==0);

                                    assert property (coverage0[1520]==0);

                    assert property (coverage0[1522]==0);

                            assert property (coverage0[1526]==0);

                            assert property (coverage0[1527]==0);

                    assert property (coverage0[1530]==0);

                            assert property (coverage0[1536]==0);

                            assert property (coverage0[1537]==0);

                                    assert property (coverage0[1539]==0);

                                    assert property (coverage0[1540]==0);

                    assert property (coverage0[1543]==0);

                            assert property (coverage0[1549]==0);

                            assert property (coverage0[1550]==0);

                    assert property (coverage0[1553]==0);

                    // assert property (coverage0[1558]==0);

                    // assert property (coverage0[1559]==0);

                            assert property (coverage0[1568]==0);

                            assert property (coverage0[1569]==0);

                            assert property (coverage0[1574]==0);

                            assert property (coverage0[1575]==0);

                            assert property (coverage0[1578]==0);

                            assert property (coverage0[1579]==0);

                                    assert property (coverage0[1581]==0);

                                    assert property (coverage0[1582]==0);

                    // assert property (coverage0[1584]==0);

                    // assert property (coverage0[1585]==0);

                            assert property (coverage0[1589]==0);

                            assert property (coverage0[1590]==0);

                                    assert property (coverage0[1592]==0);

                                    assert property (coverage0[1593]==0);

                            assert property (coverage0[1595]==0);

                            assert property (coverage0[1596]==0);

                                    assert property (coverage0[1598]==0);

                                    assert property (coverage0[1599]==0);

                            assert property (coverage0[1601]==0);

                            assert property (coverage0[1602]==0);

                                    assert property (coverage0[1604]==0);

                                    assert property (coverage0[1605]==0);

                    // assert property (coverage0[1607]==0);

                    // assert property (coverage0[1608]==0);

                            assert property (coverage0[1613]==0);

                            assert property (coverage0[1614]==0);

                            assert property (coverage0[1617]==0);

                            assert property (coverage0[1618]==0);

                                    assert property (coverage0[1620]==0);

                                    assert property (coverage0[1621]==0);

                            assert property (coverage0[1623]==0);

                            assert property (coverage0[1624]==0);

                                    assert property (coverage0[1626]==0);

                                    assert property (coverage0[1627]==0);

                            assert property (coverage0[1629]==0);

                            assert property (coverage0[1630]==0);

                                    assert property (coverage0[1632]==0);

                                    assert property (coverage0[1633]==0);

                    // assert property (coverage0[1635]==0);

                    // assert property (coverage0[1636]==0);

                            assert property (coverage0[1639]==0);

                            assert property (coverage0[1640]==0);

                    assert property (coverage0[1644]==0);

                    assert property (coverage0[1645]==0);

                    // assert property (coverage0[1648]==0);

                    // assert property (coverage0[1649]==0);

                    // assert property (coverage0[1652]==0);

                    // assert property (coverage0[1653]==0);

                            assert property (coverage0[1655]==0);

                            assert property (coverage0[1656]==0);

                                    assert property (coverage0[1658]==0);

                                    assert property (coverage0[1659]==0);

                    // assert property (coverage0[1661]==0);

                    // assert property (coverage0[1662]==0);

                            assert property (coverage0[1664]==0);

                            assert property (coverage0[1665]==0);

                                    assert property (coverage0[1667]==0);

                                    assert property (coverage0[1668]==0);

                    // assert property (coverage0[1670]==0);

                    // assert property (coverage0[1671]==0);

                    // assert property (coverage0[1674]==0);

                    // assert property (coverage0[1675]==0);

                            assert property (coverage0[1677]==0);

                            assert property (coverage0[1678]==0);

                    assert property (coverage0[1680]==0);

                    assert property (coverage0[1681]==0);

                    assert property (coverage0[1683]==0);

                    assert property (coverage0[1684]==0);

                    assert property (coverage0[1686]==0);

                    assert property (coverage0[1687]==0);

                    assert property (coverage0[1689]==0);

                    assert property (coverage0[1690]==0);

                    // assert property (coverage0[1692]==0);

                    // assert property (coverage0[1693]==0);

                    assert property (coverage0[1696]==0);

                    assert property (coverage0[1697]==0);

                    // assert property (coverage0[1700]==0);

                    // assert property (coverage0[1701]==0);

                            assert property (coverage0[1709]==0);

                                    assert property (coverage0[1710]==0);

                                    assert property (coverage0[1711]==0);

                            assert property (coverage0[1721]==0);

                                    assert property (coverage0[1722]==0);

                                    assert property (coverage0[1723]==0);

                                    assert property (coverage0[1725]==0);

                                    assert property (coverage0[1726]==0);

                                    assert property (coverage0[1728]==0);

                                    assert property (coverage0[1729]==0);

                                            assert property (coverage0[1734]==0);

                                            assert property (coverage0[1735]==0);

                                                    assert property (coverage0[1741]==0);

                                                    assert property (coverage0[1742]==0);

                                                            assert property (coverage0[1747]==0);

                                                            assert property (coverage0[1748]==0);

                                    assert property (coverage0[1752]==0);

                                    assert property (coverage0[1753]==0);

                            assert property (coverage0[1755]==0);

                                    assert property (coverage0[1756]==0);

                                    assert property (coverage0[1757]==0);

                                            assert property (coverage0[1762]==0);

                                            assert property (coverage0[1763]==0);

                                                    assert property (coverage0[1766]==0);

                                                    assert property (coverage0[1767]==0);

                            assert property (coverage0[1772]==0);

                    assert property (coverage0[1774]==0);

                    assert property (coverage0[1775]==0);

                    assert property (coverage0[1777]==0);

                    assert property (coverage0[1778]==0);

                    assert property (coverage0[1780]==0);

                    assert property (coverage0[1781]==0);

                    assert property (coverage0[1783]==0);

                    assert property (coverage0[1784]==0);

                    // assert property (coverage0[1786]==0);

                    // assert property (coverage0[1787]==0);

                            assert property (coverage0[1789]==0);

                            assert property (coverage0[1790]==0);

                                    assert property (coverage0[1792]==0);

                                    assert property (coverage0[1793]==0);

                    // assert property (coverage0[1795]==0);

                    // assert property (coverage0[1796]==0);

                            assert property (coverage0[1798]==0);

                            assert property (coverage0[1799]==0);

                    assert property (coverage0[1802]==0);

                    assert property (coverage0[1805]==0);

                    assert property (coverage0[1808]==0);

                    assert property (coverage0[1811]==0);

                            assert property (coverage0[1812]==0);

                            assert property (coverage0[1813]==0);

                    assert property (coverage0[1818]==0);

                            assert property (coverage0[1819]==0);

                            assert property (coverage0[1820]==0);

                    assert property (coverage0[1825]==0);

                    assert property (coverage0[1828]==0);

                    assert property (coverage0[1831]==0);

                    assert property (coverage0[1834]==0);

                    // assert property (coverage0[1837]==0);

                    // assert property (coverage0[1838]==0);

                            assert property (coverage0[1841]==0);

                            assert property (coverage0[1842]==0);

                                    assert property (coverage0[1845]==0);

                                    assert property (coverage0[1846]==0);

                                            assert property (coverage0[1848]==0);

                                            assert property (coverage0[1849]==0);

                    assert property (coverage0[1851]==0);

                    assert property (coverage0[1852]==0);

                    // assert property (coverage0[1855]==0);

                    // assert property (coverage0[1856]==0);

                    // assert property (coverage0[1859]==0);

                    // assert property (coverage0[1860]==0);

                            assert property (coverage0[1862]==0);

                            assert property (coverage0[1863]==0);

                                    assert property (coverage0[1865]==0);

                                    assert property (coverage0[1866]==0);

                                            assert property (coverage0[1868]==0);

                                            assert property (coverage0[1869]==0);

                    // assert property (coverage0[1871]==0);

                    // assert property (coverage0[1872]==0);

                            assert property (coverage0[1874]==0);

                            assert property (coverage0[1875]==0);

                                    assert property (coverage0[1877]==0);

                                    assert property (coverage0[1878]==0);

                                            assert property (coverage0[1880]==0);

                                            assert property (coverage0[1881]==0);

                    // assert property (coverage0[1883]==0);

                    // assert property (coverage0[1884]==0);

                            assert property (coverage0[1886]==0);

                            assert property (coverage0[1887]==0);

                                    assert property (coverage0[1889]==0);

                                    assert property (coverage0[1890]==0);

                                            assert property (coverage0[1892]==0);

                                            assert property (coverage0[1893]==0);

                    // assert property (coverage0[1895]==0);

                    // assert property (coverage0[1896]==0);

                            assert property (coverage0[1898]==0);

                            assert property (coverage0[1899]==0);

                                    assert property (coverage0[1901]==0);

                                    assert property (coverage0[1902]==0);

                                            assert property (coverage0[1906]==0);

                                            assert property (coverage0[1907]==0);

                    // assert property (coverage0[1909]==0);

                    // assert property (coverage0[1910]==0);

                            assert property (coverage0[1913]==0);

                            assert property (coverage0[1914]==0);

                                    assert property (coverage0[1917]==0);

                                    assert property (coverage0[1918]==0);

                                            assert property (coverage0[1921]==0);

                                            assert property (coverage0[1922]==0);

                    // assert property (coverage0[1925]==0);

                    // assert property (coverage0[1926]==0);

                            assert property (coverage0[1928]==0);

                            assert property (coverage0[1929]==0);

                    assert property (coverage0[1931]==0);

                    assert property (coverage0[1933]==0);

                    assert property (coverage0[1935]==0);

                    assert property (coverage0[1937]==0);

                    assert property (coverage0[1939]==0);

                    assert property (coverage0[1941]==0);

                    assert property (coverage0[1943]==0);

                    assert property (coverage0[1945]==0);

                    assert property (coverage0[1947]==0);

                    assert property (coverage0[1949]==0);

                    assert property (coverage0[1951]==0);

                    assert property (coverage0[1953]==0);

                    assert property (coverage0[1955]==0);

                    assert property (coverage0[1957]==0);

                    assert property (coverage0[1959]==0);

                    assert property (coverage0[1961]==0);

                    // assert property (coverage0[1963]==0);

                    // assert property (coverage0[1964]==0);

                            assert property (coverage0[1966]==0);

                            assert property (coverage0[1967]==0);

                    assert property (coverage0[1969]==0);

                    assert property (coverage0[1970]==0);

                            assert property (coverage0[1972]==0);

                            assert property (coverage0[1973]==0);

                    assert property (coverage0[1976]==0);

                    assert property (coverage0[1977]==0);

                            assert property (coverage0[1979]==0);

                            assert property (coverage0[1980]==0);

                                    assert property (coverage0[1982]==0);

                                    assert property (coverage0[1983]==0);

                    assert property (coverage0[1986]==0);

                    assert property (coverage0[1988]==0);

                    assert property (coverage0[1990]==0);

                    assert property (coverage0[1992]==0);

                    assert property (coverage0[1994]==0);

                    assert property (coverage0[1996]==0);

                    assert property (coverage0[1998]==0);

                    // assert property (coverage0[2000]==0);

                    // assert property (coverage0[2001]==0);

                            assert property (coverage0[2003]==0);

                            assert property (coverage0[2004]==0);

                                    assert property (coverage0[2006]==0);

                                            assert property (coverage0[2008]==0);

                                            assert property (coverage0[2010]==0);

                                            assert property (coverage0[2012]==0);

                                    assert property (coverage0[2007]==0);

                    // assert property (coverage0[2014]==0);

                    // assert property (coverage0[2015]==0);

                            assert property (coverage0[2017]==0);

                            assert property (coverage0[2018]==0);

                    // assert property (coverage0[2020]==0);

                    // assert property (coverage0[2021]==0);

                            assert property (coverage0[2023]==0);

                            assert property (coverage0[2024]==0);

                                    assert property (coverage0[2026]==0);

                                    assert property (coverage0[2027]==0);

                    // assert property (coverage0[2029]==0);

                    // assert property (coverage0[2030]==0);

                            assert property (coverage0[2032]==0);

                            assert property (coverage0[2033]==0);

                                    assert property (coverage0[2035]==0);

                                    assert property (coverage0[2036]==0);

                    // assert property (coverage0[2038]==0);

                    // assert property (coverage0[2039]==0);

                            assert property (coverage0[2041]==0);

                            assert property (coverage0[2042]==0);

                    // assert property (coverage0[2044]==0);

                    // assert property (coverage0[2045]==0);

                            assert property (coverage0[2047]==0);

                                    assert property (coverage0[2049]==0);

                                    assert property (coverage0[2051]==0);

                                    assert property (coverage0[2053]==0);

                                    assert property (coverage0[2055]==0);

                                    assert property (coverage0[2057]==0);

                                    assert property (coverage0[2059]==0);

                                    assert property (coverage0[2061]==0);

                                    assert property (coverage0[2063]==0);

                                    assert property (coverage0[2065]==0);

                                    assert property (coverage0[2067]==0);

                                    assert property (coverage0[2069]==0);

                                    assert property (coverage0[2071]==0);

                                    assert property (coverage0[2073]==0);

                            assert property (coverage0[2048]==0);

                    // assert property (coverage0[2075]==0);

                    // assert property (coverage0[2076]==0);

                            assert property (coverage0[2078]==0);

                            assert property (coverage0[2079]==0);

                                    assert property (coverage0[2081]==0);

                                            assert property (coverage0[2083]==0);

                                            assert property (coverage0[2085]==0);

                                            assert property (coverage0[2087]==0);

                                            assert property (coverage0[2089]==0);

                                            assert property (coverage0[2091]==0);

                                            assert property (coverage0[2093]==0);

                                            assert property (coverage0[2095]==0);

                                            assert property (coverage0[2097]==0);

                                            assert property (coverage0[2099]==0);

                                            assert property (coverage0[2101]==0);

                                            assert property (coverage0[2103]==0);

                                            assert property (coverage0[2105]==0);

                                            assert property (coverage0[2107]==0);

                                            assert property (coverage0[2109]==0);

                                            assert property (coverage0[2111]==0);

                                            assert property (coverage0[2113]==0);

                                            assert property (coverage0[2115]==0);

                                            assert property (coverage0[2117]==0);

                                            assert property (coverage0[2119]==0);

                                            assert property (coverage0[2121]==0);

                                            assert property (coverage0[2123]==0);

                                            assert property (coverage0[2125]==0);

                                            assert property (coverage0[2127]==0);

                                            assert property (coverage0[2129]==0);

                                            assert property (coverage0[2131]==0);

                                            assert property (coverage0[2133]==0);

                                            assert property (coverage0[2135]==0);

                                            assert property (coverage0[2137]==0);

                                            assert property (coverage0[2139]==0);

                                            assert property (coverage0[2141]==0);

                                            assert property (coverage0[2143]==0);

                                    assert property (coverage0[2082]==0);

                    // assert property (coverage0[2145]==0);

                    // assert property (coverage0[2146]==0);

                            assert property (coverage0[2148]==0);

                            assert property (coverage0[2149]==0);

                                    assert property (coverage0[2151]==0);

                                            assert property (coverage0[2153]==0);

                                            assert property (coverage0[2155]==0);

                                            assert property (coverage0[2157]==0);

                                            assert property (coverage0[2159]==0);

                                            assert property (coverage0[2161]==0);

                                            assert property (coverage0[2163]==0);

                                            assert property (coverage0[2165]==0);

                                            assert property (coverage0[2167]==0);

                                            assert property (coverage0[2169]==0);

                                            assert property (coverage0[2171]==0);

                                            assert property (coverage0[2173]==0);

                                    assert property (coverage0[2152]==0);

                    // assert property (coverage0[2175]==0);

                    // assert property (coverage0[2176]==0);

                            assert property (coverage0[2178]==0);

                            assert property (coverage0[2179]==0);

                                    assert property (coverage0[2181]==0);

                                    assert property (coverage0[2182]==0);

                    // assert property (coverage0[2184]==0);

                    // assert property (coverage0[2185]==0);

                            assert property (coverage0[2188]==0);

                            assert property (coverage0[2189]==0);

                                    assert property (coverage0[2192]==0);

                                            assert property (coverage0[2194]==0);

                                            assert property (coverage0[2197]==0);

                                            assert property (coverage0[2200]==0);

                                    assert property (coverage0[2193]==0);

                    // assert property (coverage0[2203]==0);

                    // assert property (coverage0[2204]==0);

                            assert property (coverage0[2206]==0);

                            assert property (coverage0[2207]==0);

                                    assert property (coverage0[2209]==0);

                                            assert property (coverage0[2211]==0);

                                            assert property (coverage0[2213]==0);

                                            assert property (coverage0[2215]==0);

                                            assert property (coverage0[2217]==0);

                                            assert property (coverage0[2219]==0);

                                            assert property (coverage0[2221]==0);

                                            assert property (coverage0[2223]==0);

                                            assert property (coverage0[2225]==0);

                                            assert property (coverage0[2227]==0);

                                            assert property (coverage0[2229]==0);

                                            assert property (coverage0[2231]==0);

                                            assert property (coverage0[2233]==0);

                                            assert property (coverage0[2235]==0);

                                            assert property (coverage0[2237]==0);

                                            assert property (coverage0[2239]==0);

                                            assert property (coverage0[2241]==0);

                                            assert property (coverage0[2243]==0);

                                            assert property (coverage0[2245]==0);

                                    assert property (coverage0[2210]==0);

                    // assert property (coverage0[2247]==0);

                    // assert property (coverage0[2248]==0);

                            assert property (coverage0[2250]==0);

                            assert property (coverage0[2251]==0);

                                    assert property (coverage0[2253]==0);

                                            assert property (coverage0[2255]==0);

                                            assert property (coverage0[2257]==0);

                                            assert property (coverage0[2259]==0);

                                            assert property (coverage0[2261]==0);

                                            assert property (coverage0[2263]==0);

                                            assert property (coverage0[2265]==0);

                                            assert property (coverage0[2267]==0);

                                            assert property (coverage0[2269]==0);

                                    assert property (coverage0[2254]==0);

                    // assert property (coverage0[2271]==0);

                    // assert property (coverage0[2272]==0);

                            assert property (coverage0[2274]==0);

                            assert property (coverage0[2275]==0);

                                    assert property (coverage0[2277]==0);

                                    assert property (coverage0[2278]==0);

                    assert property (coverage0[2280]==0);

                    assert property (coverage0[2282]==0);

                    assert property (coverage0[2284]==0);

                    assert property (coverage0[2286]==0);

                    assert property (coverage0[2288]==0);

                    assert property (coverage0[2290]==0);

                    assert property (coverage0[2292]==0);

                    assert property (coverage0[2294]==0);

                    assert property (coverage0[2296]==0);

                    assert property (coverage0[2298]==0);

                    // assert property (coverage0[2300]==0);

                    // assert property (coverage0[2301]==0);

                            assert property (coverage0[2303]==0);

                            assert property (coverage0[2304]==0);

                                    assert property (coverage0[2306]==0);

                                    assert property (coverage0[2307]==0);

                    // assert property (coverage0[2309]==0);

                    // assert property (coverage0[2310]==0);

                            assert property (coverage0[2312]==0);

                            assert property (coverage0[2313]==0);

                                    assert property (coverage0[2315]==0);

                                    assert property (coverage0[2316]==0);

                    // assert property (coverage0[2318]==0);

                    // assert property (coverage0[2319]==0);

                            assert property (coverage0[2321]==0);

                            assert property (coverage0[2322]==0);

                                    assert property (coverage0[2324]==0);

                                    assert property (coverage0[2325]==0);

                    assert property (coverage0[2327]==0);

                    assert property (coverage0[2328]==0);

                    // assert property (coverage0[2331]==0);

                    // assert property (coverage0[2332]==0);

                            assert property (coverage0[2334]==0);

                            assert property (coverage0[2335]==0);

                    assert property (coverage0[2337]==0);

                    assert property (coverage0[2338]==0);

                    assert property (coverage0[2340]==0);

                    assert property (coverage0[2341]==0);

                    assert property (coverage0[2343]==0);

                    assert property (coverage0[2344]==0);

                    assert property (coverage0[2346]==0);

                    assert property (coverage0[2347]==0);

                    // assert property (coverage0[2349]==0);

                    // assert property (coverage0[2350]==0);

                            assert property (coverage0[2353]==0);

                            assert property (coverage0[2354]==0);

                                    assert property (coverage0[2357]==0);

                                    assert property (coverage0[2358]==0);

                                            assert property (coverage0[2360]==0);

                                            assert property (coverage0[2361]==0);

                    // assert property (coverage0[2363]==0);

                    // assert property (coverage0[2364]==0);

                            assert property (coverage0[2367]==0);

                            assert property (coverage0[2368]==0);

                                    assert property (coverage0[2371]==0);

                                    assert property (coverage0[2372]==0);

                                            assert property (coverage0[2374]==0);

                                            assert property (coverage0[2375]==0);

                    assert property (coverage0[2377]==0);

                    assert property (coverage0[2379]==0);

                    assert property (coverage0[2381]==0);

                    assert property (coverage0[2383]==0);

                    assert property (coverage0[2385]==0);

                    assert property (coverage0[2387]==0);

                    assert property (coverage0[2389]==0);

                    assert property (coverage0[2391]==0);

                            assert property (coverage0[2392]==0);

                            assert property (coverage0[2394]==0);

                    assert property (coverage0[2396]==0);

                    assert property (coverage0[2398]==0);

                    assert property (coverage0[2400]==0);

                    assert property (coverage0[2402]==0);

                    assert property (coverage0[2404]==0);

                    assert property (coverage0[2406]==0);

                    assert property (coverage0[2408]==0);

                    assert property (coverage0[2410]==0);

                    assert property (coverage0[2412]==0);

                            assert property (coverage0[2413]==0);

                            assert property (coverage0[2414]==0);

                    assert property (coverage0[2417]==0);

                    assert property (coverage0[2419]==0);

                    assert property (coverage0[2421]==0);

                    assert property (coverage0[2423]==0);

                    assert property (coverage0[2425]==0);

                    assert property (coverage0[2427]==0);

                    assert property (coverage0[2429]==0);

                    assert property (coverage0[2432]==0);

                    assert property (coverage0[2435]==0);

                    assert property (coverage0[2438]==0);

                    assert property (coverage0[2441]==0);

                    assert property (coverage0[2444]==0);

                    assert property (coverage0[2447]==0);

                    assert property (coverage0[2450]==0);

                    assert property (coverage0[2453]==0);

                    assert property (coverage0[2456]==0);

                    assert property (coverage0[2459]==0);

                    assert property (coverage0[2461]==0);

                    assert property (coverage0[2463]==0);

                    assert property (coverage0[2465]==0);

                    assert property (coverage0[2467]==0);

                    assert property (coverage0[2469]==0);

                    assert property (coverage0[2471]==0);

                    assert property (coverage0[2473]==0);

                    assert property (coverage0[2475]==0);

                    assert property (coverage0[2477]==0);

                    assert property (coverage0[2479]==0);

                    assert property (coverage0[2481]==0);

                    assert property (coverage0[2483]==0);

                    assert property (coverage0[2485]==0);

                    assert property (coverage0[2487]==0);

                    // assert property (coverage0[2489]==0);

                    // assert property (coverage0[2490]==0);

                    assert property (coverage0[2493]==0);

                    assert property (coverage0[2495]==0);

                    assert property (coverage0[2497]==0);

                    assert property (coverage0[2499]==0);

                    assert property (coverage0[2501]==0);

                    assert property (coverage0[2503]==0);

                    assert property (coverage0[2506]==0);

                    assert property (coverage0[2509]==0);

                    assert property (coverage0[2512]==0);

                    assert property (coverage0[2515]==0);

                    // assert property (coverage0[2520]==0);

                    // assert property (coverage0[2521]==0);

                    // assert property (coverage0[2526]==0);

                    // assert property (coverage0[2527]==0);

                    // assert property (coverage0[2530]==0);

                    // assert property (coverage0[2531]==0);

                    // assert property (coverage0[2534]==0);

                    // assert property (coverage0[2535]==0);

                            assert property (coverage0[2537]==0);

                            assert property (coverage0[2538]==0);

                    // assert property (coverage0[2541]==0);

                    // assert property (coverage0[2542]==0);

                            assert property (coverage0[2546]==0);

                            assert property (coverage0[2547]==0);

                                    assert property (coverage0[2551]==0);

                                            assert property (coverage0[2553]==0);

                                            assert property (coverage0[2554]==0);

                                    assert property (coverage0[2552]==0);

                                            assert property (coverage0[2558]==0);

                                            assert property (coverage0[2559]==0);

                                                    assert property (coverage0[2563]==0);

                                                    assert property (coverage0[2564]==0);

                    assert property (coverage0[2566]==0);

                    assert property (coverage0[2568]==0);

                    assert property (coverage0[2570]==0);

                    assert property (coverage0[2572]==0);

                    assert property (coverage0[2574]==0);

                    assert property (coverage0[2576]==0);

                    assert property (coverage0[2578]==0);

                    assert property (coverage0[2580]==0);

                    assert property (coverage0[2582]==0);

                    assert property (coverage0[2584]==0);

                    assert property (coverage0[2586]==0);

                    assert property (coverage0[2588]==0);

                    assert property (coverage0[2590]==0);

                    assert property (coverage0[2592]==0);

                    assert property (coverage0[2594]==0);

                    assert property (coverage0[2596]==0);

                    assert property (coverage0[2598]==0);

                    assert property (coverage0[2600]==0);

                    assert property (coverage0[2602]==0);

                    assert property (coverage0[2604]==0);

                    assert property (coverage0[2606]==0);

                    assert property (coverage0[2608]==0);

                    assert property (coverage0[2610]==0);

                    assert property (coverage0[2612]==0);

                    assert property (coverage0[2614]==0);

                    assert property (coverage0[2616]==0);

                    assert property (coverage0[2618]==0);

                    assert property (coverage0[2620]==0);

                    assert property (coverage0[2622]==0);

                    assert property (coverage0[2624]==0);

                    assert property (coverage0[2626]==0);

                    assert property (coverage0[2628]==0);

                    // assert property (coverage0[2630]==0);

                    // assert property (coverage0[2631]==0);

                            assert property (coverage0[2633]==0);

                            assert property (coverage0[2634]==0);

                                    assert property (coverage0[2636]==0);

                                    assert property (coverage0[2637]==0);

                    // assert property (coverage0[2639]==0);

                    // assert property (coverage0[2640]==0);

                            assert property (coverage0[2643]==0);

                            assert property (coverage0[2644]==0);

                                    assert property (coverage0[2647]==0);

                                    assert property (coverage0[2648]==0);

                    assert property (coverage0[2651]==0);

                    assert property (coverage0[2653]==0);

                    assert property (coverage0[2655]==0);

                    assert property (coverage0[2657]==0);

                    assert property (coverage0[2659]==0);

                    assert property (coverage0[2661]==0);

                    assert property (coverage0[2663]==0);

                    assert property (coverage0[2665]==0);

                    assert property (coverage0[2667]==0);

                    // assert property (coverage0[2669]==0);

                    // assert property (coverage0[2670]==0);

                            assert property (coverage0[2672]==0);

                            assert property (coverage0[2673]==0);

                                    assert property (coverage0[2675]==0);

                                    assert property (coverage0[2676]==0);

                    // assert property (coverage0[2678]==0);

                    // assert property (coverage0[2679]==0);

                            assert property (coverage0[2681]==0);

                            assert property (coverage0[2682]==0);

                    // assert property (coverage0[2684]==0);

                    // assert property (coverage0[2685]==0);

                            assert property (coverage0[2687]==0);

                            assert property (coverage0[2688]==0);

                                    assert property (coverage0[2690]==0);

                                    assert property (coverage0[2691]==0);

                    assert property (coverage0[2693]==0);

                    assert property (coverage0[2695]==0);

                    assert property (coverage0[2697]==0);

                    assert property (coverage0[2699]==0);

                    assert property (coverage0[2701]==0);

                    assert property (coverage0[2703]==0);

                    assert property (coverage0[2705]==0);

                    assert property (coverage0[2707]==0);

                    assert property (coverage0[2709]==0);

                    assert property (coverage0[2711]==0);

                    assert property (coverage0[2713]==0);

                    assert property (coverage0[2715]==0);

                    assert property (coverage0[2717]==0);

                    assert property (coverage0[2719]==0);

                    assert property (coverage0[2721]==0);

                    assert property (coverage0[2723]==0);

                    assert property (coverage0[2725]==0);

                    assert property (coverage0[2727]==0);

                    assert property (coverage0[2729]==0);

                    assert property (coverage0[2731]==0);

                    assert property (coverage0[2733]==0);

                    assert property (coverage0[2735]==0);

                    assert property (coverage0[2737]==0);

                    assert property (coverage0[2739]==0);

                    assert property (coverage0[2741]==0);

                    assert property (coverage0[2743]==0);

                    assert property (coverage0[2745]==0);

                    assert property (coverage0[2748]==0);

                    assert property (coverage0[2751]==0);

                    assert property (coverage0[2754]==0);

                    assert property (coverage0[2757]==0);

                    assert property (coverage0[2759]==0);

                    assert property (coverage0[2761]==0);

                    assert property (coverage0[2763]==0);

                    assert property (coverage0[2765]==0);

                    assert property (coverage0[2767]==0);

                    assert property (coverage0[2769]==0);

                    assert property (coverage0[2771]==0);

                    // assert property (coverage0[2774]==0);

                    // assert property (coverage0[2775]==0);

                            assert property (coverage0[2778]==0);

                            assert property (coverage0[2779]==0);

                    assert property (coverage0[2782]==0);

                    assert property (coverage0[2784]==0);

                    assert property (coverage0[2786]==0);

                    assert property (coverage0[2788]==0);

                    assert property (coverage0[2790]==0);

                    // assert property (coverage0[2792]==0);

                    // assert property (coverage0[2793]==0);

                            assert property (coverage0[2795]==0);

                            assert property (coverage0[2796]==0);

                                    assert property (coverage0[2798]==0);

                                    assert property (coverage0[2799]==0);

                    // assert property (coverage0[2801]==0);

                    // assert property (coverage0[2802]==0);

                            assert property (coverage0[2804]==0);

                            assert property (coverage0[2805]==0);

                                    assert property (coverage0[2807]==0);

                                    assert property (coverage0[2808]==0);

                    // assert property (coverage0[2810]==0);

                    // assert property (coverage0[2811]==0);

                            assert property (coverage0[2813]==0);

                            assert property (coverage0[2814]==0);

                                    assert property (coverage0[2816]==0);

                                    assert property (coverage0[2817]==0);

                                            assert property (coverage0[2819]==0);

                                            assert property (coverage0[2820]==0);

                                                    assert property (coverage0[2822]==0);

                                                    assert property (coverage0[2823]==0);

                    // assert property (coverage0[2825]==0);

                    // assert property (coverage0[2826]==0);

                            assert property (coverage0[2828]==0);

                            assert property (coverage0[2829]==0);

                    // assert property (coverage0[2831]==0);

                    // assert property (coverage0[2832]==0);

                            assert property (coverage0[2839]==0);

                            assert property (coverage0[2840]==0);

                    // assert property (coverage0[2845]==0);

                    // assert property (coverage0[2846]==0);

                            assert property (coverage0[2850]==0);

                            assert property (coverage0[2851]==0);

                                    assert property (coverage0[2854]==0);

                                    assert property (coverage0[2855]==0);

                    // assert property (coverage0[2859]==0);

                    // assert property (coverage0[2860]==0);

                            assert property (coverage0[2862]==0);

                            assert property (coverage0[2863]==0);

                    // assert property (coverage0[2866]==0);

                    // assert property (coverage0[2867]==0);

                            assert property (coverage0[2869]==0);

                            assert property (coverage0[2870]==0);

                    // assert property (coverage0[2873]==0);

                    // assert property (coverage0[2874]==0);

                            assert property (coverage0[2881]==0);

                            assert property (coverage0[2882]==0);

                                    assert property (coverage0[2888]==0);

                                    assert property (coverage0[2889]==0);

                                            assert property (coverage0[2896]==0);

                                            assert property (coverage0[2897]==0);

                    // assert property (coverage0[2904]==0);

                    // assert property (coverage0[2905]==0);

                            assert property (coverage0[2908]==0);

                            assert property (coverage0[2909]==0);

                    // assert property (coverage0[2912]==0);

                    // assert property (coverage0[2913]==0);

                            assert property (coverage0[2922]==0);

                                    assert property (coverage0[2923]==0);

                                            assert property (coverage0[2928]==0);

                                            assert property (coverage0[2933]==0);

                                            assert property (coverage0[2938]==0);

                                            assert property (coverage0[2943]==0);

                                            assert property (coverage0[2948]==0);

                                            assert property (coverage0[2953]==0);

                                            assert property (coverage0[2958]==0);

                                            assert property (coverage0[2962]==0);

                                            assert property (coverage0[2966]==0);

                                            assert property (coverage0[2971]==0);

                                            assert property (coverage0[2976]==0);

                                            assert property (coverage0[2980]==0);

                                            assert property (coverage0[2984]==0);

                                            assert property (coverage0[2988]==0);

                                            assert property (coverage0[2992]==0);

                                    assert property (coverage0[2924]==0);

                                            assert property (coverage0[2994]==0);

                                            assert property (coverage0[2995]==0);

                                                    assert property (coverage0[2998]==0);

                                                    assert property (coverage0[2999]==0);

                                                    assert property (coverage0[3001]==0);

                                                    assert property (coverage0[3002]==0);

                                                    assert property (coverage0[3004]==0);

                                                    assert property (coverage0[3005]==0);

                            assert property (coverage0[3007]==0);

                                    assert property (coverage0[3008]==0);

                                    assert property (coverage0[3009]==0);

                            assert property (coverage0[3011]==0);

                                    assert property (coverage0[3012]==0);

                                    assert property (coverage0[3013]==0);

                            assert property (coverage0[3019]==0);

                            assert property (coverage0[3021]==0);

                            assert property (coverage0[3025]==0);

                                    assert property (coverage0[3026]==0);

                                    assert property (coverage0[3027]==0);

                    assert property (coverage0[3031]==0);

                            assert property (coverage0[3033]==0);

                            assert property (coverage0[3038]==0);

                            assert property (coverage0[3053]==0);

                            assert property (coverage0[3062]==0);

                            assert property (coverage0[3071]==0);

                            assert property (coverage0[3080]==0);

                            assert property (coverage0[3092]==0);

                            assert property (coverage0[3104]==0);

                            assert property (coverage0[3108]==0);

                    assert property (coverage0[3032]==0);

                    // assert property (coverage0[3111]==0);

                    // assert property (coverage0[3112]==0);

                            assert property (coverage0[3114]==0);

                            assert property (coverage0[3115]==0);

                    // assert property (coverage0[3118]==0);

                    // assert property (coverage0[3119]==0);

                    assert property (coverage0[3122]==0);

                    assert property (coverage0[3123]==0);

                    assert property (coverage0[3125]==0);

                    assert property (coverage0[3126]==0);

                    assert property (coverage0[3128]==0);

                    assert property (coverage0[3129]==0);

                    assert property (coverage0[3131]==0);

                    assert property (coverage0[3132]==0);

                    assert property (coverage0[3134]==0);

                    assert property (coverage0[3135]==0);

                    // assert property (coverage0[3138]==0);

                    // assert property (coverage0[3139]==0);

                            assert property (coverage0[3152]==0);

                                    assert property (coverage0[3153]==0);

                                    assert property (coverage0[3154]==0);

                                            assert property (coverage0[3160]==0);

                                            assert property (coverage0[3161]==0);

                            assert property (coverage0[3166]==0);

                                    assert property (coverage0[3168]==0);

                                    assert property (coverage0[3169]==0);

                                    assert property (coverage0[3174]==0);

                                            assert property (coverage0[3176]==0);

                                            assert property (coverage0[3177]==0);

                                    assert property (coverage0[3175]==0);

                                            assert property (coverage0[3186]==0);

                                            assert property (coverage0[3187]==0);

                            assert property (coverage0[3193]==0);

                                    assert property (coverage0[3194]==0);

                                    assert property (coverage0[3195]==0);

                                    assert property (coverage0[3200]==0);

                                    assert property (coverage0[3201]==0);

                                            assert property (coverage0[3204]==0);

                                            assert property (coverage0[3205]==0);

                                    assert property (coverage0[3210]==0);

                                    assert property (coverage0[3211]==0);

                            assert property (coverage0[3213]==0);

                                    assert property (coverage0[3214]==0);

                                    assert property (coverage0[3215]==0);

                                            assert property (coverage0[3221]==0);

                                            assert property (coverage0[3222]==0);

                            assert property (coverage0[3228]==0);

                            assert property (coverage0[3230]==0);

                                    assert property (coverage0[3232]==0);

                                    assert property (coverage0[3233]==0);

                                            assert property (coverage0[3237]==0);

                                                    assert property (coverage0[3239]==0);

                                                    assert property (coverage0[3240]==0);

                                                            assert property (coverage0[3246]==0);

                                                            assert property (coverage0[3247]==0);

                                                                    assert property (coverage0[3249]==0);

                                                                    assert property (coverage0[3250]==0);

                                            assert property (coverage0[3238]==0);

                            assert property (coverage0[3253]==0);

                                    assert property (coverage0[3255]==0);

                                    assert property (coverage0[3256]==0);

                            assert property (coverage0[3258]==0);

                                    assert property (coverage0[3259]==0);

                                    assert property (coverage0[3260]==0);

                    assert property (coverage0[3262]==0);

                    assert property (coverage0[3263]==0);

                    assert property (coverage0[3265]==0);

                            assert property (coverage0[3267]==0);

                            assert property (coverage0[3268]==0);

                            assert property (coverage0[3270]==0);

                            assert property (coverage0[3271]==0);

                            assert property (coverage0[3273]==0);

                            assert property (coverage0[3274]==0);

                            assert property (coverage0[3276]==0);

                            assert property (coverage0[3277]==0);

                    assert property (coverage0[3266]==0);

                    assert property (coverage0[3279]==0);

                    assert property (coverage0[3280]==0);

                    assert property (coverage0[3282]==0);

                    assert property (coverage0[3283]==0);

                    // assert property (coverage0[3285]==0);

                    // assert property (coverage0[3286]==0);

                            assert property (coverage0[3288]==0);

                            assert property (coverage0[3289]==0);

                    // assert property (coverage0[3291]==0);

                    // assert property (coverage0[3292]==0);

                    // assert property (coverage0[3295]==0);

                    // assert property (coverage0[3296]==0);

                    // assert property (coverage0[3299]==0);

                    // assert property (coverage0[3300]==0);

                    assert property (coverage0[3308]==0);

                    assert property (coverage0[3310]==0);

                    assert property (coverage0[3312]==0);

                    assert property (coverage0[3314]==0);

                    assert property (coverage0[3316]==0);

                    assert property (coverage0[3318]==0);

                    assert property (coverage0[3320]==0);

                    assert property (coverage0[3322]==0);

                    assert property (coverage0[3324]==0);

                    assert property (coverage0[3326]==0);

                    assert property (coverage0[3328]==0);

                    assert property (coverage0[3330]==0);

                    assert property (coverage0[3332]==0);

                    assert property (coverage0[3334]==0);

                    assert property (coverage0[3336]==0);

                    // assert property (coverage0[3338]==0);

                    // assert property (coverage0[3339]==0);

                            assert property (coverage0[3341]==0);

                            assert property (coverage0[3342]==0);

                    // assert property (coverage0[3345]==0);

                    // assert property (coverage0[3346]==0);

                            assert property (coverage0[3348]==0);

                            assert property (coverage0[3349]==0);

                    // assert property (coverage0[3351]==0);

                    // assert property (coverage0[3352]==0);

                            assert property (coverage0[3354]==0);

                            assert property (coverage0[3355]==0);

                    // assert property (coverage0[3357]==0);

                    // assert property (coverage0[3358]==0);

                            assert property (coverage0[3360]==0);

                            assert property (coverage0[3361]==0);

                    assert property (coverage0[3364]==0);

                    assert property (coverage0[3366]==0);

                    assert property (coverage0[3368]==0);

                    assert property (coverage0[3370]==0);

                    // assert property (coverage0[3372]==0);

                    // assert property (coverage0[3373]==0);

                            assert property (coverage0[3375]==0);

                            assert property (coverage0[3376]==0);

                                    assert property (coverage0[3378]==0);

                                    assert property (coverage0[3379]==0);

                    // assert property (coverage0[3381]==0);

                    // assert property (coverage0[3382]==0);

                            assert property (coverage0[3384]==0);

                            assert property (coverage0[3385]==0);

                    // assert property (coverage0[3387]==0);

                    // assert property (coverage0[3388]==0);

                            assert property (coverage0[3390]==0);

                            assert property (coverage0[3391]==0);

                    assert property (coverage0[3394]==0);

                    assert property (coverage0[3397]==0);

                    // assert property (coverage0[3400]==0);

                    // assert property (coverage0[3401]==0);

                            assert property (coverage0[3403]==0);

                            assert property (coverage0[3404]==0);

                                    assert property (coverage0[3406]==0);

                                    assert property (coverage0[3407]==0);

                    // assert property (coverage0[3409]==0);

                    // assert property (coverage0[3410]==0);

                            assert property (coverage0[3412]==0);

                            assert property (coverage0[3413]==0);

                                    assert property (coverage0[3415]==0);

                                    assert property (coverage0[3416]==0);

                                            assert property (coverage0[3418]==0);

                                            assert property (coverage0[3419]==0);

                    assert property (coverage0[3421]==0);

                    assert property (coverage0[3423]==0);

endmodule
