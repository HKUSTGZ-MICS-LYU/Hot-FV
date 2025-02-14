//Following code is from line 1907
module or1200_except(sig_illegal, sig_itlbmiss, dcpu_ack_i, dcpu_err_i, rst, sig_trap, id_freeze, spr_dat_ppc, clk, eear, except_start, sig_range, abort_ex, except_type, if_stall, wb_freeze, ex_void, except_started, branch_taken, sig_dbuserr, du_dsr, sr_we, icpu_err_i, sig_dmmufault, except_stop, lsu_addr, epcr_we, ex_freeze, pc_we, to_sr, genpc_freeze, flushpipe, datain, esr, epcr, sig_immufault, sr, sig_dtlbmiss, sig_ibuserr, sig_align, id_pc, esr_we, sig_syscall, sig_tick, icpu_ack_i, sig_int, if_pc, lr_sav, extend_flush, eear_we, spr_dat_npc);

    input                clk;
    input                rst;
    input                sig_ibuserr;
    input                sig_dbuserr;
    input                sig_illegal;
    input                sig_align;
    input                sig_range;
    input                sig_dtlbmiss;
    input                sig_dmmufault;
    input                sig_int;
    input                sig_syscall;
    input                sig_trap;
    input                sig_itlbmiss;
    input                sig_immufault;
    input                sig_tick;
    input                branch_taken;
    input                genpc_freeze;
    input                id_freeze;
    input                ex_freeze;
    input                wb_freeze;
    input                if_stall;
    input         [31:0] if_pc;
    output        [31:0] id_pc;
    output        [29:0] lr_sav;
    input         [31:0] datain;
    input         [13:0] du_dsr;
    input                epcr_we;
    input                eear_we;
    input                esr_we;
    input                pc_we;
    output        [31:0] epcr;
    output        [31:0] eear;
    output        [15:0] esr;
    input         [15:0] to_sr;
    input                sr_we;
    input         [15:0] sr;
    input         [31:0] lsu_addr;
    output               flushpipe;
    output               extend_flush;
    output        [3:0]  except_type;
    output               except_start;
    output               except_started;
    output        [12:0] except_stop;
    input                ex_void;
    output        [31:0] spr_dat_ppc;
    output        [31:0] spr_dat_npc;
    output               abort_ex;
    input                icpu_ack_i;
    input                icpu_err_i;
    input                dcpu_ack_i;
    input                dcpu_err_i;
    reg  [3:0]  except_type = 4'b0;
    reg  [31:0] id_pc = 32'b0;
    reg  [31:0] ex_pc = 32'b0;
    reg  [31:0] wb_pc = 32'b0;
    reg  [31:0] epcr = 32'b0;
    reg  [31:0] eear = 32'b0;
    reg  [15:0] esr = 16'b0;
    reg  [2:0]  id_exceptflags = 3'b0;
    reg  [2:0]  ex_exceptflags = 3'b0;
    reg  [2:0]  state = 3'b0;
    reg  extend_flush = 1'b0;
    reg  extend_flush_last = 1'b0;
    reg  ex_dslot = 1'b0;
    reg  delayed1_ex_dslot = 1'b0;
    reg  delayed2_ex_dslot = 1'b0;
    wire   except_started;
    wire  [12:0] except_trig;
    wire   except_flushpipe;
    reg  [2:0]  delayed_iee = 3'b0;
    reg  [2:0]  delayed_tee = 3'b0;
    wire   int_pending;
    wire   tick_pending;
    reg [199:0] coverage0 = 200'b0;


    assign except_started = (extend_flush & except_start);
  //assertion( except_started = extend_flush & except_start) 0
    assign lr_sav = ex_pc[31:2];
  //assertion( lr_sav = Extract(31, 2, ex_pc)) 1
    assign spr_dat_ppc = wb_pc;
  //assertion( spr_dat_ppc = wb_pc) 2
    assign spr_dat_npc = (ex_void ? id_pc : ex_pc);
  //assertion( spr_dat_npc = If(0 != ex_void == True, id_pc, ex_pc)) 3
    assign except_start = ((except_type != 4'h0) & extend_flush);
  //assertion( except_start = If(0 != except_type == True, 1, 0) & extend_flush) 4
    assign int_pending = ((((((sig_int & sr[2]) & delayed_iee[2]) & (~ex_freeze)) & (~branch_taken)) & (~ex_dslot)) & (~sr_we));
  //assertion( int_pending = sig_int & Extract(2, 2, sr) & Extract(2, 2, delayed_iee) & ~ex_freeze & ~branch_taken & ~ex_dslot & ~sr_we) 5
    assign tick_pending = (((((sig_tick & sr[1]) & (~ex_freeze)) & (~branch_taken)) & (~ex_dslot)) & (~sr_we));
  //assertion( tick_pending = sig_tick & Extract(1, 1, sr) & ~ex_freeze & ~branch_taken & ~ex_dslot & ~sr_we) 6
    assign abort_ex = ((((sig_dbuserr | sig_dmmufault) | sig_dtlbmiss) | sig_align) | sig_illegal);
  //assertion( abort_ex = sig_dbuserr | sig_dmmufault | sig_dtlbmiss | sig_align | sig_illegal) 7
    assign except_trig = {(tick_pending & (~du_dsr[4])), (int_pending & (~du_dsr[7])), (ex_exceptflags[1] & (~du_dsr[9])), (ex_exceptflags[0] & (~du_dsr[3])), (ex_exceptflags[2] & (~du_dsr[1])), (sig_illegal & (~du_dsr[6])), (sig_align & (~du_dsr[5])), (sig_dtlbmiss & (~du_dsr[8])), (sig_dmmufault & (~du_dsr[2])), (sig_dbuserr & (~du_dsr[1])), (sig_range & (~du_dsr[10])), ((sig_trap & (~du_dsr[13])) & (~ex_freeze)), ((sig_syscall & (~du_dsr[11])) & (~ex_freeze))};
  //assertion( except_trig = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(tick_pending & ~Extract(4, 4, du_dsr), int_pending & ~Extract(7, 7, du_dsr)), Extract(1, 1, ex_exceptflags) & ~Extract(9, 9, du_dsr)), Extract(0, 0, ex_exceptflags) & ~Extract(3, 3, du_dsr)), Extract(2, 2, ex_exceptflags) & ~Extract(1, 1, du_dsr)), sig_illegal & ~Extract(6, 6, du_dsr)), sig_align & ~Extract(5, 5, du_dsr)), sig_dtlbmiss & ~Extract(8, 8, du_dsr)), sig_dmmufault & ~Extract(2, 2, du_dsr)), sig_dbuserr & ~Extract(1, 1, du_dsr)), sig_range & ~Extract(10, 10, du_dsr)), sig_trap & ~Extract(13, 13, du_dsr) & ~ex_freeze), sig_syscall & ~Extract(11, 11, du_dsr) & ~ex_freeze)) 8
    assign except_stop = {(tick_pending & du_dsr[4]), (int_pending & du_dsr[7]), (ex_exceptflags[1] & du_dsr[9]), (ex_exceptflags[0] & du_dsr[3]), (ex_exceptflags[2] & du_dsr[1]), (sig_illegal & du_dsr[6]), (sig_align & du_dsr[5]), (sig_dtlbmiss & du_dsr[8]), (sig_dmmufault & du_dsr[2]), (sig_dbuserr & du_dsr[1]), (sig_range & du_dsr[10]), ((sig_trap & du_dsr[13]) & (~ex_freeze)), ((sig_syscall & du_dsr[11]) & (~ex_freeze))};
  //assertion( except_stop = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(tick_pending & Extract(4, 4, du_dsr), int_pending & Extract(7, 7, du_dsr)), Extract(1, 1, ex_exceptflags) & Extract(9, 9, du_dsr)), Extract(0, 0, ex_exceptflags) & Extract(3, 3, du_dsr)), Extract(2, 2, ex_exceptflags) & Extract(1, 1, du_dsr)), sig_illegal & Extract(6, 6, du_dsr)), sig_align & Extract(5, 5, du_dsr)), sig_dtlbmiss & Extract(8, 8, du_dsr)), sig_dmmufault & Extract(2, 2, du_dsr)), sig_dbuserr & Extract(1, 1, du_dsr)), sig_range & Extract(10, 10, du_dsr)), sig_trap & Extract(13, 13, du_dsr) & ~ex_freeze), sig_syscall & Extract(11, 11, du_dsr) & ~ex_freeze)) 9
    //Following code is from line 2040
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    coverage0[10] = 1;  //assertion( 0 != rst = True) 10
                    id_pc <= 32'd0;  //assertion( id_pc = 0) 12
                    id_exceptflags <= 3'b000;  //assertion( id_exceptflags = 0) 13
                end
            else
                begin
                    // coverage0[11] = 1;  //assertion( 0 != rst = False) 11
                    if (flushpipe)
                        begin
                            coverage0[14] = 1;  //assertion( 0 != flushpipe = True) 14
                            id_pc <= 32'h0000_0000;  //assertion( id_pc = 0) 16
                            id_exceptflags <= 3'b000;  //assertion( id_exceptflags = 0) 17
                        end
                    else
                        begin
                            coverage0[15] = 1;  //assertion( 0 != flushpipe = False) 15
                            if ((~id_freeze))
                                begin
                                    coverage0[18] = 1;  //assertion( Not(id_freeze == 1) = True) 18
                                    id_pc <= if_pc;  //assertion( id_pc = if_pc) 20
                                    id_exceptflags <= {sig_ibuserr, sig_itlbmiss, sig_immufault};  //assertion( id_exceptflags = Concat(Concat(sig_ibuserr, sig_itlbmiss), sig_immufault)) 21
                                end
                            else
                                    coverage0[19] = 1;  //assertion( Not(id_freeze == 1) = False) 19
                        end
                end
        end

    //Following code is from line 2063
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    coverage0[22] = 1;  //assertion( 0 != rst = True) 22
                    delayed_iee <= 3'b000;  //assertion( delayed_iee = 0) 24
                end
            else
                begin
                    // coverage0[23] = 1;  //assertion( 0 != rst = False) 23
                    if ((~sr[2]))
                        begin
                            coverage0[25] = 1;  //assertion( Not(Extract(2, 2, sr) == 1) = True) 25
                            delayed_iee <= 3'b000;  //assertion( delayed_iee = 0) 27
                        end
                    else
                        begin
                            coverage0[26] = 1;  //assertion( Not(Extract(2, 2, sr) == 1) = False) 26
                            delayed_iee <= {delayed_iee[1:0], 1'b1};  //assertion( delayed_iee = Concat(Extract(1, 0, delayed_iee), 1)) 28
                        end
                end
        end

    //Following code is from line 2079
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    coverage0[29] = 1;  //assertion( 0 != rst = True) 29
                    delayed_tee <= 3'b000;  //assertion( delayed_tee = 0) 31
                end
            else
                begin
                    // coverage0[30] = 1;  //assertion( 0 != rst = False) 30
                    if ((~sr[1]))
                        begin
                            coverage0[32] = 1;  //assertion( Not(Extract(1, 1, sr) == 1) = True) 32
                            delayed_tee <= 3'b000;  //assertion( delayed_tee = 0) 34
                        end
                    else
                        begin
                            coverage0[33] = 1;  //assertion( Not(Extract(1, 1, sr) == 1) = False) 33
                            delayed_tee <= {delayed_tee[1:0], 1'b1};  //assertion( delayed_tee = Concat(Extract(1, 0, delayed_tee), 1)) 35
                        end
                end
        end

    //Following code is from line 2090
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    coverage0[36] = 1;  //assertion( 0 != rst = True) 36
                    ex_dslot <= 1'b0;  //assertion( ex_dslot = 0) 38
                    ex_pc <= 32'd0;  //assertion( ex_pc = 0) 39
                    ex_exceptflags <= 3'b000;  //assertion( ex_exceptflags = 0) 40
                    delayed1_ex_dslot <= 1'b0;  //assertion( delayed1_ex_dslot = 0) 41
                    delayed2_ex_dslot <= 1'b0;  //assertion( delayed2_ex_dslot = 0) 42
                end
            else
                begin
                    // coverage0[37] = 1;  //assertion( 0 != rst = False) 37
                    if (flushpipe)
                        begin
                            coverage0[43] = 1;  //assertion( 0 != flushpipe = True) 43
                            ex_dslot <= 1'b0;  //assertion( ex_dslot = 0) 45
                            ex_pc <= 32'h0000_0000;  //assertion( ex_pc = 0) 46
                            ex_exceptflags <= 3'b000;  //assertion( ex_exceptflags = 0) 47
                            delayed1_ex_dslot <= 1'b0;  //assertion( delayed1_ex_dslot = 0) 48
                            delayed2_ex_dslot <= 1'b0;  //assertion( delayed2_ex_dslot = 0) 49
                        end
                    else
                        begin
                            coverage0[44] = 1;  //assertion( 0 != flushpipe = False) 44
                            if (((~ex_freeze) & id_freeze))
                                begin
                                    coverage0[50] = 1;  //assertion( If(Not(ex_freeze == 1) == True, 1, 0) & id_freeze = True) 50
                                    ex_dslot <= 1'b0;  //assertion( ex_dslot = 0) 52
                                    ex_pc <= id_pc;  //assertion( ex_pc = id_pc) 53
                                    ex_exceptflags <= 3'b000;  //assertion( ex_exceptflags = 0) 54
                                    delayed1_ex_dslot <= ex_dslot;  //assertion( delayed1_ex_dslot = ex_dslot) 55
                                    delayed2_ex_dslot <= delayed1_ex_dslot;  //assertion( delayed2_ex_dslot = delayed1_ex_dslot) 56
                                end
                            else
                                begin
                                    coverage0[51] = 1;  //assertion( If(Not(ex_freeze == 1) == True, 1, 0) & id_freeze = False) 51
                                    if ((~ex_freeze))
                                        begin
                                            coverage0[57] = 1;  //assertion( Not(ex_freeze == 1) = True) 57
                                            ex_dslot <= branch_taken;  //assertion( ex_dslot = branch_taken) 59
                                            ex_pc <= id_pc;  //assertion( ex_pc = id_pc) 60
                                            ex_exceptflags <= id_exceptflags;  //assertion( ex_exceptflags = id_exceptflags) 61
                                            delayed1_ex_dslot <= ex_dslot;  //assertion( delayed1_ex_dslot = ex_dslot) 62
                                            delayed2_ex_dslot <= delayed1_ex_dslot;  //assertion( delayed2_ex_dslot = delayed1_ex_dslot) 63
                                        end
                                    else
                                            coverage0[58] = 1;  //assertion( Not(ex_freeze == 1) = False) 58
                                end
                        end
                end
        end

    //Following code is from line 2124
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    coverage0[64] = 1;  //assertion( 0 != rst = True) 64
                    wb_pc <= 32'd0;  //assertion( wb_pc = 0) 66
                end
            else
                begin
                    // coverage0[65] = 1;  //assertion( 0 != rst = False) 65
                    if ((~wb_freeze))
                        begin
                            coverage0[67] = 1;  //assertion( Not(wb_freeze == 1) = True) 67
                            wb_pc <= ex_pc;  //assertion( wb_pc = ex_pc) 69
                        end
                    else
                            coverage0[68] = 1;  //assertion( Not(wb_freeze == 1) = False) 68
                end
        end

    assign flushpipe = ((except_flushpipe | pc_we) | extend_flush);
  //assertion( flushpipe = except_flushpipe | pc_we | extend_flush) 70
    assign except_flushpipe = ((|except_trig) & ~|state);
  //assertion( except_flushpipe = bvredor(except_trig) & ~bvredor(state)) 71
    //Following code is from line 2151
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    coverage0[72] = 1;  //assertion( 0 != rst = True) 72
                    state <= 3'd0;  //assertion( state = 0) 74
                    except_type <= 4'h0;  //assertion( except_type = 0) 75
                    extend_flush <= 1'b0;  //assertion( extend_flush = 0) 76
                    epcr <= 32'b0;  //assertion( epcr = 0) 77
                    eear <= 32'b0;  //assertion( eear = 0) 78
                    esr <= 16'b1000000000000001;  //assertion( esr = 32769) 79
                    extend_flush_last <= 1'b0;  //assertion( extend_flush_last = 0) 80
                end
            else
                begin
                    // coverage0[73] = 1;  //assertion( 0 != rst = False) 73
                    case (state)
                      3'd0:
                        begin
                            coverage0[81] = 1;  //assertion( 0 == state = True) 81
                            if (except_flushpipe)
                                begin
                                    coverage0[82] = 1;  //assertion( 0 != except_flushpipe = True) 82
                                    state <= 3'd1;  //assertion( state = 1) 84
                                    extend_flush <= 1'b1;  //assertion( extend_flush = 1) 85
                                    esr <= (sr_we ? to_sr : sr);  //assertion( esr = If(0 != sr_we == True, to_sr, sr)) 86
                                    case (except_trig)
                                      13'b1_xxxx_xxxx_xxxx:
                                        begin
                                            coverage0[87] = 1;  //assertion( 4096 == except_trig = True) 87
                                            except_type <= 4'h5;  //assertion( except_type = 5) 88
                                            epcr <= (ex_dslot ? wb_pc : (delayed1_ex_dslot ? id_pc : (delayed2_ex_dslot ? id_pc : id_pc)));  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 89
                                        end
                                      13'b0_1xxx_xxxx_xxxx:
                                        begin
                                            coverage0[90] = 1;  //assertion( 2048 == except_trig = True) 90
                                            except_type <= 4'h8;  //assertion( except_type = 8) 91
                                            epcr <= (ex_dslot ? wb_pc : (delayed1_ex_dslot ? id_pc : (delayed2_ex_dslot ? id_pc : id_pc)));  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 92
                                        end
                                      13'b0_01xx_xxxx_xxxx:
                                        begin
                                            coverage0[93] = 1;  //assertion( 1024 == except_trig = True) 93
                                            except_type <= 4'ha;  //assertion( except_type = 10) 94
                                            eear <= (ex_dslot ? ex_pc : ex_pc);  //assertion( eear = If(0 != ex_dslot == True, ex_pc, ex_pc)) 95
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 96
                                        end
                                      13'b0_001x_xxxx_xxxx:
                                        begin
                                            coverage0[97] = 1;  //assertion( 512 == except_trig = True) 97
                                            except_type <= 4'h4;  //assertion( except_type = 4) 98
                                            eear <= (ex_dslot ? ex_pc : (delayed1_ex_dslot ? id_pc : (delayed2_ex_dslot ? id_pc : id_pc)));  //assertion( eear = If(0 != ex_dslot == True, ex_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 99
                                            epcr <= (ex_dslot ? wb_pc : (delayed1_ex_dslot ? id_pc : (delayed2_ex_dslot ? id_pc : id_pc)));  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 100
                                        end
                                      13'b0_0001_xxxx_xxxx:
                                        begin
                                            coverage0[101] = 1;  //assertion( 256 == except_trig = True) 101
                                            except_type <= 4'h2;  //assertion( except_type = 2) 102
                                            eear <= (ex_dslot ? wb_pc : ex_pc);  //assertion( eear = If(0 != ex_dslot == True, wb_pc, ex_pc)) 103
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 104
                                        end
                                      13'b0_0000_1xxx_xxxx:
                                        begin
                                            coverage0[105] = 1;  //assertion( 128 == except_trig = True) 105
                                            except_type <= 4'h7;  //assertion( except_type = 7) 106
                                            eear <= ex_pc;  //assertion( eear = ex_pc) 107
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 108
                                        end
                                      13'b0_0000_01xx_xxxx:
                                        begin
                                            coverage0[109] = 1;  //assertion( 64 == except_trig = True) 109
                                            except_type <= 4'h6;  //assertion( except_type = 6) 110
                                            eear <= lsu_addr;  //assertion( eear = lsu_addr) 111
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 112
                                        end
                                      13'b0_0000_001x_xxxx:
                                        begin
                                            coverage0[113] = 1;  //assertion( 32 == except_trig = True) 113
                                            except_type <= 4'h9;  //assertion( except_type = 9) 114
                                            eear <= lsu_addr;  //assertion( eear = lsu_addr) 115
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 116
                                        end
                                      13'b0_0000_0001_xxxx:
                                        begin
                                            coverage0[117] = 1;  //assertion( 16 == except_trig = True) 117
                                            except_type <= 4'h3;  //assertion( except_type = 3) 118
                                            eear <= lsu_addr;  //assertion( eear = lsu_addr) 119
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 120
                                        end
                                      13'b0_0000_0000_1xxx:
                                        begin
                                            coverage0[121] = 1;  //assertion( 8 == except_trig = True) 121
                                            except_type <= 4'h2;  //assertion( except_type = 2) 122
                                            eear <= lsu_addr;  //assertion( eear = lsu_addr) 123
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 124
                                        end
                                      13'b0_0000_0000_01xx:
                                        begin
                                            coverage0[125] = 1;  //assertion( 4 == except_trig = True) 125
                                            except_type <= 4'hb;  //assertion( except_type = 11) 126
                                            epcr <= (ex_dslot ? wb_pc : (delayed1_ex_dslot ? id_pc : (delayed2_ex_dslot ? id_pc : id_pc)));  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 127
                                        end
                                      13'b0_0000_0000_001x:
                                        begin
                                            coverage0[128] = 1;  //assertion( 2 == except_trig = True) 128
                                            except_type <= 4'he;  //assertion( except_type = 14) 129
                                            epcr <= (ex_dslot ? wb_pc : ex_pc);  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 130
                                        end
                                      13'b0_0000_0000_0001:
                                        begin
                                            coverage0[131] = 1;  //assertion( 1 == except_trig = True) 131
                                            except_type <= 4'hc;  //assertion( except_type = 12) 132
                                            epcr <= (ex_dslot ? wb_pc : (delayed1_ex_dslot ? id_pc : (delayed2_ex_dslot ? id_pc : id_pc)));  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 133
                                        end
                                      default:
                                        begin
                                            coverage0[134] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 134
                                            except_type <= 4'h0;  //assertion( except_type = 0) 135
                                        end
                                    endcase
                                end
                            else
                                begin
                                    coverage0[83] = 1;  //assertion( 0 != except_flushpipe = False) 83
                                    if (pc_we)
                                        begin
                                            coverage0[136] = 1;  //assertion( 0 != pc_we = True) 136
                                            state <= 3'd1;  //assertion( state = 1) 138
                                            extend_flush <= 1'b1;  //assertion( extend_flush = 1) 139
                                        end
                                    else
                                        begin
                                            coverage0[137] = 1;  //assertion( 0 != pc_we = False) 137
                                            if (epcr_we)
                                                begin
                                                    coverage0[140] = 1;  //assertion( 0 != epcr_we = True) 140
                                                    epcr <= datain;  //assertion( epcr = datain) 142
                                                end
                                            else
                                                    coverage0[141] = 1;  //assertion( 0 != epcr_we = False) 141
                                            if (eear_we)
                                                begin
                                                    coverage0[143] = 1;  //assertion( 0 != eear_we = True) 143
                                                    eear <= datain;  //assertion( eear = datain) 145
                                                end
                                            else
                                                    coverage0[144] = 1;  //assertion( 0 != eear_we = False) 144
                                            if (esr_we)
                                                begin
                                                    coverage0[146] = 1;  //assertion( 0 != esr_we = True) 146
                                                    esr <= {1'b1, datain[14:0]};  //assertion( esr = Concat(1, Extract(14, 0, datain))) 148
                                                end
                                            else
                                                    coverage0[147] = 1;  //assertion( 0 != esr_we = False) 147
                                        end
                                end
                        end
                      3'd1:
                        begin
                            coverage0[149] = 1;  //assertion( 1 == state = True) 149
                            if (((icpu_ack_i | icpu_err_i) | genpc_freeze))
                                begin
                                    coverage0[150] = 1;  //assertion( icpu_ack_i | icpu_err_i | genpc_freeze = True) 150
                                    state <= 3'd2;  //assertion( state = 2) 152
                                end
                            else
                                    coverage0[151] = 1;  //assertion( icpu_ack_i | icpu_err_i | genpc_freeze = False) 151
                        end
                      3'd2:
                        begin
                            coverage0[153] = 1;  //assertion( 2 == state = True) 153
                            if ((except_type == 4'he))
                                begin
                                    coverage0[154] = 1;  //assertion( 14 == except_type = True) 154
                                    state <= 3'd0;  //assertion( state = 0) 156
                                    extend_flush <= 1'b0;  //assertion( extend_flush = 0) 157
                                    extend_flush_last <= 1'b0;  //assertion( extend_flush_last = 0) 158
                                    except_type <= 4'h0;  //assertion( except_type = 0) 159
                                end
                            else
                                begin
                                    coverage0[155] = 1;  //assertion( 14 == except_type = False) 155
                                    state <= 3'd3;  //assertion( state = 3) 160
                                end
                        end
                      3'd3:
                        begin
                            coverage0[161] = 1;  //assertion( 3 == state = True) 161
                            state <= 3'd4;  //assertion( state = 4) 162
                        end
                      3'd4:
                        begin
                            coverage0[163] = 1;  //assertion( 4 == state = True) 163
                            state <= 3'd5;  //assertion( state = 5) 164
                            extend_flush <= 1'b0;  //assertion( extend_flush = 0) 165
                            extend_flush_last <= 1'b0;  //assertion( extend_flush_last = 0) 166
                        end
                      default:
                        begin
                            coverage0[167] = 1;  //assertion( If(0 != state == True, 1, 0) & If(1 != state == True, 1, 0) & If(2 != state == True, 1, 0) & If(3 != state == True, 1, 0) & If(4 != state == True, 1, 0) = True) 167
                            if (((~if_stall) && (~id_freeze)))
                                begin
                                    coverage0[168] = 1;  //assertion( And(If(Not(if_stall == 1) == True, 1, 0) == 1, If(Not(id_freeze == 1) == True, 1, 0) == 1) = True) 168
                                    state <= 3'd0;  //assertion( state = 0) 170
                                    except_type <= 4'h0;  //assertion( except_type = 0) 171
                                    extend_flush_last <= 1'b0;  //assertion( extend_flush_last = 0) 172
                                end
                            else
                                    coverage0[169] = 1;  //assertion( And(If(Not(if_stall == 1) == True, 1, 0) == 1, If(Not(id_freeze == 1) == True, 1, 0) == 1) = False) 169
                        end
                    endcase
                end
        end
                            assert property (coverage0[10]==0);

                    // assert property (coverage0[11]==0);

                            assert property (coverage0[14]==0);

                            assert property (coverage0[15]==0);

                                    assert property (coverage0[18]==0);

                                    assert property (coverage0[19]==0);

                    assert property (coverage0[22]==0);

                    // assert property (coverage0[23]==0);

                            assert property (coverage0[25]==0);

                            assert property (coverage0[26]==0);

                    assert property (coverage0[29]==0);

                    // assert property (coverage0[30]==0);

                            assert property (coverage0[32]==0);

                            assert property (coverage0[33]==0);

                    assert property (coverage0[36]==0);

                    // assert property (coverage0[37]==0);

                            assert property (coverage0[43]==0);

                            assert property (coverage0[44]==0);

                                    assert property (coverage0[50]==0);

                                    assert property (coverage0[51]==0);

                                            assert property (coverage0[57]==0);

                                            assert property (coverage0[58]==0);

                    assert property (coverage0[64]==0);

                    // assert property (coverage0[65]==0);

                            assert property (coverage0[67]==0);

                            assert property (coverage0[68]==0);

                    assert property (coverage0[72]==0);

                    // assert property (coverage0[73]==0);

                            assert property (coverage0[81]==0);

                                    assert property (coverage0[82]==0);

                                            assert property (coverage0[87]==0);

                                            assert property (coverage0[90]==0);

                                            assert property (coverage0[93]==0);

                                            assert property (coverage0[97]==0);

                                            assert property (coverage0[101]==0);

                                            assert property (coverage0[105]==0);

                                            assert property (coverage0[109]==0);

                                            assert property (coverage0[113]==0);

                                            assert property (coverage0[117]==0);

                                            assert property (coverage0[121]==0);

                                            assert property (coverage0[125]==0);

                                            assert property (coverage0[128]==0);

                                            assert property (coverage0[131]==0);

                                            assert property (coverage0[134]==0);

                                    assert property (coverage0[83]==0);

                                            assert property (coverage0[136]==0);

                                            assert property (coverage0[137]==0);

                                                    assert property (coverage0[140]==0);

                                                    assert property (coverage0[141]==0);

                                                    assert property (coverage0[143]==0);

                                                    assert property (coverage0[144]==0);

                                                    assert property (coverage0[146]==0);

                                                    assert property (coverage0[147]==0);

                            assert property (coverage0[149]==0);

                                    assert property (coverage0[150]==0);

                                    assert property (coverage0[151]==0);

                            assert property (coverage0[153]==0);

                                    assert property (coverage0[154]==0);

                                    assert property (coverage0[155]==0);

                            assert property (coverage0[161]==0);

                            assert property (coverage0[163]==0);

                            assert property (coverage0[167]==0);

                                    assert property (coverage0[168]==0);

                                    assert property (coverage0[169]==0);

endmodule
