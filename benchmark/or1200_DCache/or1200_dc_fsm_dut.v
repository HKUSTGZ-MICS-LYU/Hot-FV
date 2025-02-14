//Following code is from line 1889
module or1200_dc_fsm(first_miss_ack, first_miss_err, dcqmem_ci_i, biudata_error, biu_write, dcqmem_we_i, tag_valid, spr_cswe, burst, tag, dcqmem_cycstb_i, mtspr_dc_done, biu_read, dc_addr, tag_we, dcram_di_sel, biudata_valid, dc_block_flush, dc_en, rst, tag_dirty, lsu_addr, tagcomp_miss, dcram_we, dc_block_writeback, tag_v, spr_dat_i, biu_do_sel, dirty, dcqmem_sel_i, first_hit_ack, dc_no_writethrough, clk);

    input                clk;
    input                rst;
    input                dc_en;
    input                dcqmem_cycstb_i;
    input                dcqmem_ci_i;
    input                dcqmem_we_i;
    input         [3:0]  dcqmem_sel_i;
    input                tagcomp_miss;
    input                biudata_valid;
    input                biudata_error;
    input         [31:0] lsu_addr;
    output        [3:0]  dcram_we;
    output               biu_read;
    output               biu_write;
    output               dcram_di_sel;
    output               biu_do_sel;
    output               first_hit_ack;
    output               first_miss_ack;
    output               first_miss_err;
    output               burst;
    output               tag_we;
    output               tag_valid;
    output        [31:0] dc_addr;
    input                dc_no_writethrough;
    output               tag_dirty;
    input                dirty;
    input         [18:0] tag;
    input                tag_v;
    input                dc_block_flush;
    input                dc_block_writeback;
    input         [31:0] spr_dat_i;
    output               mtspr_dc_done;
    input                spr_cswe;
    reg  [31:0] addr_r = 32'b0;
    reg  [2:0]  state = 3'b0;
    reg  [3:0]  cnt = 4'b0;
    reg  hitmiss_eval = 1'b0;
    reg  store = 1'b0;
    reg  load = 1'b0;
    reg  cache_inhibit = 1'b0;
    reg  cache_miss = 1'b0;
    reg  cache_dirty_needs_writeback = 1'b0;
    reg  did_early_load_ack = 1'b0;
    reg  cache_spr_block_flush = 1'b0;
    reg  cache_spr_block_writeback = 1'b0;
    reg  cache_wb = 1'b0;
    wire   load_hit_ack;
    wire   load_miss_ack;
    wire   load_inhibit_ack;
    wire   store_hit_ack;
    wire   store_hit_writethrough_ack;
    wire   store_miss_writethrough_ack;
    wire   store_inhibit_ack;
    wire   store_miss_ack;
    wire   dcram_we_after_line_load;
    wire   dcram_we_during_line_load;
    wire   tagram_we_end_of_loadstore_loop;
    wire   tagram_dirty_bit_set;
    wire   writethrough;
    wire   cache_inhibit_with_eval;
    wire  [1:0] next_addr_word;
    reg [999:0] coverage0 = 1000'b0;

    assign cache_inhibit_with_eval = ((hitmiss_eval & dcqmem_ci_i) | ((~hitmiss_eval) & cache_inhibit));
  //assertion( cache_inhibit_with_eval = hitmiss_eval & dcqmem_ci_i | If(Not(hitmiss_eval == 1) == True, 1, 0) & cache_inhibit) 0
    assign dcram_we_after_line_load = ((((state == 3'd3) & dcqmem_we_i) & (~cache_dirty_needs_writeback)) & (~did_early_load_ack));
  //assertion( dcram_we_after_line_load = If((3 == state) == True, 1, 0) & dcqmem_we_i & If(Not(cache_dirty_needs_writeback == 1) == True, 1, 0) & If(Not(did_early_load_ack == 1) == True, 1, 0)) 1
    assign dcram_we_during_line_load = (((state == 3'd2) & load) & biudata_valid);
  //assertion( dcram_we_during_line_load = If((2 == state) == True, 1, 0) & load & biudata_valid) 2
    assign dcram_we = ((({ 4{ (store_hit_ack | store_hit_writethrough_ack) } } | { 4{ dcram_we_after_line_load } }) & dcqmem_sel_i) | { 4{ dcram_we_during_line_load } });
  //assertion( dcram_we = (Concat(Concat(Concat(store_hit_ack | store_hit_writethrough_ack, store_hit_ack | store_hit_writethrough_ack), store_hit_ack | store_hit_writethrough_ack), store_hit_ack | store_hit_writethrough_ack) | Concat(Concat(Concat(dcram_we_after_line_load, dcram_we_after_line_load), dcram_we_after_line_load), dcram_we_after_line_load)) & dcqmem_sel_i | Concat(Concat(Concat(dcram_we_during_line_load, dcram_we_during_line_load), dcram_we_during_line_load), dcram_we_during_line_load)) 3
    assign tagram_we_end_of_loadstore_loop = (((state == 3'd2) & biudata_valid) & (~(|cnt)));
  //assertion( tagram_we_end_of_loadstore_loop = If((2 == state) == True, 1, 0) & biudata_valid & If(Not(bvredor(cnt) == 1) == True, 1, 0)) 4
    assign tagram_dirty_bit_set = 0;
  //assertion( tagram_dirty_bit_set = 0) 5
    assign mtspr_dc_done = 1'b1;
  //assertion( mtspr_dc_done = 1) 6
    assign tag_dirty = tagram_dirty_bit_set;
  //assertion( tag_dirty = tagram_dirty_bit_set) 7
    assign tag_we = ((tagram_we_end_of_loadstore_loop | tagram_dirty_bit_set) | (state == 3'd6));
  //assertion( tag_we = tagram_we_end_of_loadstore_loop | tagram_dirty_bit_set | If((6 == state) == True, 1, 0)) 8
    assign tag_valid = ((tagram_we_end_of_loadstore_loop & (load | (store & cache_spr_block_writeback))) | tagram_dirty_bit_set);
  //assertion( tag_valid = tagram_we_end_of_loadstore_loop & (load | store & cache_spr_block_writeback) | tagram_dirty_bit_set) 9
    assign biu_read = (((state == 3'd1) & (((((hitmiss_eval & tagcomp_miss) & (~dirty)) & (~(store & writethrough))) | (load & cache_inhibit_with_eval)) & dcqmem_cycstb_i)) | ((state == 3'd2) & load));
  //assertion( biu_read = If((1 == state) == True, 1, 0) & (hitmiss_eval & tagcomp_miss & If(Not(dirty == 1) == True, 1, 0) & If(Not(store & writethrough == 1) == True, 1, 0) | load & cache_inhibit_with_eval) & dcqmem_cycstb_i | If((2 == state) == True, 1, 0) & load) 10
    assign biu_write = ((((state == 3'd1) & ((((hitmiss_eval & tagcomp_miss) & dirty) | (store & writethrough)) | (store & cache_inhibit_with_eval))) & dcqmem_cycstb_i) | ((state == 3'd2) & store));
  //assertion( biu_write = If((1 == state) == True, 1, 0) & (hitmiss_eval & tagcomp_miss & dirty | store & writethrough | store & cache_inhibit_with_eval) & dcqmem_cycstb_i | If((2 == state) == True, 1, 0) & store) 11
    assign dcram_di_sel = load;
  //assertion( dcram_di_sel = load) 12
    assign biu_do_sel = ((state == 3'd2) & store);
  //assertion( biu_do_sel = If((2 == state) == True, 1, 0) & store) 13
    assign next_addr_word = (addr_r[3:2] + 1);
  //assertion( next_addr_word = Extract(3, 2, addr_r) + ZeroExt(1, 1)) 14
    assign dc_addr = (((dc_block_flush & (~cache_spr_block_flush)) | (dc_block_writeback & (~cache_spr_block_writeback))) ? spr_dat_i : ((state == 3'd5) ? addr_r : (((state == 3'd0) | hitmiss_eval) ? lsu_addr : ((((state == 3'd2) & biudata_valid) & store) ? {addr_r[31:4], next_addr_word, 2'b00} : addr_r))));
  //assertion( dc_addr = If((1 == dc_block_flush & If(Not(cache_spr_block_flush == 1) == True, 1, 0) | dc_block_writeback & If(Not(cache_spr_block_writeback == 1) == True, 1, 0)) == True, spr_dat_i, If((5 == state) == True, addr_r, If((1 == If((0 == state) == True, 1, 0) | hitmiss_eval) == True, lsu_addr, If((1 == If((2 == state) == True, 1, 0) & biudata_valid & store) == True, Concat(Concat(Extract(31, 4, addr_r), next_addr_word), 0), addr_r))))) 15
    assign writethrough = 1;
  //assertion( writethrough = 1) 16
    assign first_hit_ack = (((((load_hit_ack | store_hit_ack) | store_hit_writethrough_ack) | store_miss_writethrough_ack) | store_inhibit_ack) | store_miss_ack);
  //assertion( first_hit_ack = load_hit_ack | store_hit_ack | store_hit_writethrough_ack | store_miss_writethrough_ack | store_inhibit_ack | store_miss_ack) 17
    assign first_miss_ack = ((~first_hit_ack) & (load_miss_ack | load_inhibit_ack));
  //assertion( first_miss_ack = ~first_hit_ack & (load_miss_ack | load_inhibit_ack)) 18
    assign load_hit_ack = (((((state == 3'd1) & hitmiss_eval) & (~tagcomp_miss)) & (~dcqmem_ci_i)) & load);
  //assertion( load_hit_ack = If((1 == state) == True, 1, 0) & hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) & load) 19
    assign store_hit_ack = ((((((state == 3'd1) & hitmiss_eval) & (~tagcomp_miss)) & (~dcqmem_ci_i)) & store) & (~writethrough));
  //assertion( store_hit_ack = If((1 == state) == True, 1, 0) & hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) & store & If(Not(writethrough == 1) == True, 1, 0)) 20
    assign store_hit_writethrough_ack = ((((((state == 3'd1) & (~cache_miss)) & (~cache_inhibit)) & store) & writethrough) & biudata_valid);
  //assertion( store_hit_writethrough_ack = If((1 == state) == True, 1, 0) & If(Not(cache_miss == 1) == True, 1, 0) & If(Not(cache_inhibit == 1) == True, 1, 0) & store & writethrough & biudata_valid) 21
    assign store_miss_writethrough_ack = ((((((state == 3'd1) & cache_miss) & (~cache_inhibit)) & store) & writethrough) & biudata_valid);
  //assertion( store_miss_writethrough_ack = If((1 == state) == True, 1, 0) & cache_miss & If(Not(cache_inhibit == 1) == True, 1, 0) & store & writethrough & biudata_valid) 22
    assign store_inhibit_ack = ((((state == 3'd1) & store) & cache_inhibit) & biudata_valid);
  //assertion( store_inhibit_ack = If((1 == state) == True, 1, 0) & store & cache_inhibit & biudata_valid) 23
    assign load_miss_ack = (((((state == 3'd2) & load) & (cnt == ((1 << 4) - 4))) & biudata_valid) & (~(dcqmem_we_i & (~writethrough))));
  //assertion( load_miss_ack = If((2 == state) == True, 1, 0) & load & If((cnt == ZeroExt(1, (ZeroExt(2, 1) << 4) - 4)) == True, 1, 0) & biudata_valid & If(Not(dcqmem_we_i & If(Not(writethrough == 1) == True, 1, 0) == 1) == True, 1, 0)) 24
    assign load_inhibit_ack = ((((state == 3'd1) & load) & cache_inhibit) & biudata_valid);
  //assertion( load_inhibit_ack = If((1 == state) == True, 1, 0) & load & cache_inhibit & biudata_valid) 25
    assign store_miss_ack = dcram_we_after_line_load;
  //assertion( store_miss_ack = dcram_we_after_line_load) 26
    assign first_miss_err = (biudata_error & dcqmem_cycstb_i);
  //assertion( first_miss_err = biudata_error & dcqmem_cycstb_i) 27
    assign burst = (state == 3'd2);
  //assertion( burst = 2 == state) 28
    //Following code is from line 2171
        always @(posedge clk or posedge rst) begin
            if ((rst == 1'b1))
                begin
                    coverage0[29] = 1;  //assertion( 1 == rst = True) 29
                    state <= 3'd0;  //assertion( state = 0) 31
                    addr_r <= 32'd0;  //assertion( addr_r = 0) 32
                    hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 33
                    store <= 1'b0;  //assertion( store = 0) 34
                    load <= 1'b0;  //assertion( load = 0) 35
                    cnt <= 4'd0;  //assertion( cnt = 0) 36
                    cache_miss <= 1'b0;  //assertion( cache_miss = 0) 37
                    cache_dirty_needs_writeback <= 1'b0;  //assertion( cache_dirty_needs_writeback = 0) 38
                    cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 39
                    did_early_load_ack <= 1'b0;  //assertion( did_early_load_ack = 0) 40
                    cache_spr_block_flush <= 1'b0;  //assertion( cache_spr_block_flush = 0) 41
                    cache_spr_block_writeback <= 1'b0;  //assertion( cache_spr_block_writeback = 0) 42
                end
            else
                begin
                    case (state)
                      3'd0:
                        begin
                            coverage0[43] = 1;  //assertion( 0 == state = True) 43
                            if ((dc_en & (dc_block_flush | dc_block_writeback)))
                                begin
                                    coverage0[44] = 1;  //assertion( dc_en & (dc_block_flush | dc_block_writeback) = True) 44
                                    cache_spr_block_flush <= dc_block_flush;  //assertion( cache_spr_block_flush = dc_block_flush) 46
                                    cache_spr_block_writeback <= dc_block_writeback;  //assertion( cache_spr_block_writeback = dc_block_writeback) 47
                                    hitmiss_eval <= 1'b1;  //assertion( hitmiss_eval = 1) 48
                                    state <= 3'd5;  //assertion( state = 5) 49
                                    addr_r <= spr_dat_i;  //assertion( addr_r = spr_dat_i) 50
                                end
                            else
                                begin
                                    coverage0[45] = 1;  //assertion( dc_en & (dc_block_flush | dc_block_writeback) = False) 45
                                    if ((dc_en & dcqmem_cycstb_i))
                                        begin
                                            coverage0[51] = 1;  //assertion( dc_en & dcqmem_cycstb_i = True) 51
                                            state <= 3'd1;  //assertion( state = 1) 53
                                            hitmiss_eval <= 1'b1;  //assertion( hitmiss_eval = 1) 54
                                            store <= dcqmem_we_i;  //assertion( store = dcqmem_we_i) 55
                                            load <= (~dcqmem_we_i);  //assertion( load = Not(dcqmem_we_i == 1)) 56
                                        end
                                    else
                                            coverage0[52] = 1;  //assertion( dc_en & dcqmem_cycstb_i = False) 52
                                end
                        end
                      3'd1:
                        begin
                            coverage0[57] = 1;  //assertion( 1 == state = True) 57
                            hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 58
                            if (hitmiss_eval)
                                begin
                                    coverage0[59] = 1;  //assertion( 0 != hitmiss_eval = True) 59
                                    cache_inhibit <= dcqmem_ci_i;  //assertion( cache_inhibit = dcqmem_ci_i) 61
                                    cache_miss <= tagcomp_miss;  //assertion( cache_miss = tagcomp_miss) 62
                                    cache_dirty_needs_writeback <= dirty;  //assertion( cache_dirty_needs_writeback = dirty) 63
                                    addr_r <= lsu_addr;  //assertion( addr_r = lsu_addr) 64
                                end
                            else
                                    coverage0[60] = 1;  //assertion( 0 != hitmiss_eval = False) 60
                            if ((((hitmiss_eval & tagcomp_miss) & (~(store & writethrough))) & (~dcqmem_ci_i)))
                                begin
                                    coverage0[65] = 1;  //assertion( hitmiss_eval & tagcomp_miss & If(Not(store & writethrough == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) = True) 65
                                    if (dirty)
                                        begin
                                            coverage0[67] = 1;  //assertion( 0 != dirty = True) 67
                                            addr_r <= {tag, lsu_addr[12:2], 2'd0};  //assertion( addr_r = Concat(Concat(tag, Extract(12, 2, lsu_addr)), 0)) 69
                                            load <= 1'b0;  //assertion( load = 0) 70
                                            store <= 1'b1;  //assertion( store = 1) 71
                                        end
                                    else
                                        begin
                                            coverage0[68] = 1;  //assertion( 0 != dirty = False) 68
                                            addr_r <= lsu_addr;  //assertion( addr_r = lsu_addr) 72
                                            load <= 1'b1;  //assertion( load = 1) 73
                                            store <= 1'b0;  //assertion( store = 0) 74
                                        end
                                    state <= 3'd2;  //assertion( state = 2) 75
                                    cnt <= ((1 << 4) - 4);  //assertion( cnt = (ZeroExt(2, 1) << 4) - 4) 76
                                end
                            else
                                begin
                                    coverage0[66] = 1;  //assertion( hitmiss_eval & tagcomp_miss & If(Not(store & writethrough == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) = False) 66
                                    if ((((~dcqmem_cycstb_i) | ((~hitmiss_eval) & (biudata_valid | biudata_error))) | (((hitmiss_eval & (~tagcomp_miss)) & (~dcqmem_ci_i)) & (~(store & writethrough)))))
                                        begin
                                            coverage0[77] = 1;  //assertion( If(Not(dcqmem_cycstb_i == 1) == True, 1, 0) | If(Not(hitmiss_eval == 1) == True, 1, 0) & (biudata_valid | biudata_error) | hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) & If(Not(store & writethrough == 1) == True, 1, 0) = True) 77
                                            state <= 3'd0;  //assertion( state = 0) 79
                                            load <= 1'b0;  //assertion( load = 0) 80
                                            store <= 1'b0;  //assertion( store = 0) 81
                                            cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 82
                                            cache_dirty_needs_writeback <= 1'b0;  //assertion( cache_dirty_needs_writeback = 0) 83
                                        end
                                    else
                                            coverage0[78] = 1;  //assertion( If(Not(dcqmem_cycstb_i == 1) == True, 1, 0) | If(Not(hitmiss_eval == 1) == True, 1, 0) & (biudata_valid | biudata_error) | hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) & If(Not(store & writethrough == 1) == True, 1, 0) = False) 78
                                end
                        end
                      3'd2:
                        begin
                            coverage0[84] = 1;  //assertion( 2 == state = True) 84
                            if (((~dc_en) | biudata_error))
                                begin
                                    coverage0[85] = 1;  //assertion( If(Not(dc_en == 1) == True, 1, 0) | biudata_error = True) 85
                                    state <= 3'd0;  //assertion( state = 0) 87
                                    load <= 1'b0;  //assertion( load = 0) 88
                                    store <= 1'b0;  //assertion( store = 0) 89
                                    cnt <= 4'd0;  //assertion( cnt = 0) 90
                                end
                            else
                                    coverage0[86] = 1;  //assertion( If(Not(dc_en == 1) == True, 1, 0) | biudata_error = False) 86
                            if ((biudata_valid & (|cnt)))
                                begin
                                    coverage0[91] = 1;  //assertion( biudata_valid & bvredor(cnt) = True) 91
                                    cnt <= (cnt - 4);  //assertion( cnt = cnt - ZeroExt(1, 4)) 93
                                    addr_r <= {addr_r[31:4], (addr_r[3:2] + 2'b1), addr_r[1:0]};  //assertion( addr_r = Concat(Concat(Extract(31, 4, addr_r), Extract(3, 2, addr_r) + 1), Extract(1, 0, addr_r))) 94
                                end
                            else
                                begin
                                    coverage0[92] = 1;  //assertion( biudata_valid & bvredor(cnt) = False) 92
                                    if ((biudata_valid & (~(|cnt))))
                                        begin
                                            coverage0[95] = 1;  //assertion( biudata_valid & If(Not(bvredor(cnt) == 1) == True, 1, 0) = True) 95
                                            state <= 3'd3;  //assertion( state = 3) 97
                                            addr_r <= lsu_addr;  //assertion( addr_r = lsu_addr) 98
                                            load <= 1'b0;  //assertion( load = 0) 99
                                            store <= 1'b0;  //assertion( store = 0) 100
                                        end
                                    else
                                            coverage0[96] = 1;  //assertion( biudata_valid & If(Not(bvredor(cnt) == 1) == True, 1, 0) = False) 96
                                end
                            if (load_miss_ack)
                                begin
                                    coverage0[101] = 1;  //assertion( 0 != load_miss_ack = True) 101
                                    did_early_load_ack <= 1'b1;  //assertion( did_early_load_ack = 1) 103
                                end
                            else
                                    coverage0[102] = 1;  //assertion( 0 != load_miss_ack = False) 102
                        end
                      3'd3:
                        begin
                            coverage0[104] = 1;  //assertion( 3 == state = True) 104
                            if (cache_dirty_needs_writeback)
                                begin
                                    coverage0[105] = 1;  //assertion( 0 != cache_dirty_needs_writeback = True) 105
                                    load <= 1'b1;  //assertion( load = 1) 107
                                    cnt <= ((1 << 4) - 4);  //assertion( cnt = (ZeroExt(2, 1) << 4) - 4) 108
                                    addr_r <= lsu_addr;  //assertion( addr_r = lsu_addr) 109
                                    cache_dirty_needs_writeback <= 1'b0;  //assertion( cache_dirty_needs_writeback = 0) 110
                                    state <= 3'd2;  //assertion( state = 2) 111
                                end
                            else
                                begin
                                    coverage0[106] = 1;  //assertion( 0 != cache_dirty_needs_writeback = False) 106
                                    if ((cache_spr_block_flush | cache_spr_block_writeback))
                                        begin
                                            coverage0[112] = 1;  //assertion( cache_spr_block_flush | cache_spr_block_writeback = True) 112
                                            cache_spr_block_flush <= 1'b0;  //assertion( cache_spr_block_flush = 0) 114
                                            cache_spr_block_writeback <= 1'b0;  //assertion( cache_spr_block_writeback = 0) 115
                                            state <= 3'd7;  //assertion( state = 7) 116
                                        end
                                    else
                                        begin
                                            coverage0[113] = 1;  //assertion( cache_spr_block_flush | cache_spr_block_writeback = False) 113
                                            did_early_load_ack <= 1'b0;  //assertion( did_early_load_ack = 0) 117
                                            state <= 3'd4;  //assertion( state = 4) 118
                                        end
                                end
                        end
                      3'd4:
                        begin
                            coverage0[119] = 1;  //assertion( 4 == state = True) 119
                            state <= 3'd0;  //assertion( state = 0) 120
                        end
                      3'd5:
                        begin
                            coverage0[121] = 1;  //assertion( 5 == state = True) 121
                            hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 122
                            if ((hitmiss_eval & (~tag_v)))
                                begin
                                    coverage0[123] = 1;  //assertion( hitmiss_eval & If(Not(tag_v == 1) == True, 1, 0) = True) 123
                                    cache_spr_block_flush <= 1'b0;  //assertion( cache_spr_block_flush = 0) 125
                                    cache_spr_block_writeback <= 1'b0;  //assertion( cache_spr_block_writeback = 0) 126
                                    state <= 3'd7;  //assertion( state = 7) 127
                                end
                            else
                                begin
                                    coverage0[124] = 1;  //assertion( hitmiss_eval & If(Not(tag_v == 1) == True, 1, 0) = False) 124
                                    if ((hitmiss_eval & tag_v))
                                        begin
                                            coverage0[128] = 1;  //assertion( hitmiss_eval & tag_v = True) 128
                                            if (((cache_spr_block_flush | cache_spr_block_writeback) & dirty))
                                                begin
                                                    coverage0[130] = 1;  //assertion( (cache_spr_block_flush | cache_spr_block_writeback) & dirty = True) 130
                                                    addr_r <= {tag, addr_r[12:2], 2'd0};  //assertion( addr_r = Concat(Concat(tag, Extract(12, 2, addr_r)), 0)) 132
                                                    load <= 1'b0;  //assertion( load = 0) 133
                                                    store <= 1'b1;  //assertion( store = 1) 134
                                                    state <= 3'd2;  //assertion( state = 2) 135
                                                    cnt <= ((1 << 4) - 4);  //assertion( cnt = (ZeroExt(2, 1) << 4) - 4) 136
                                                end
                                            else
                                                begin
                                                    coverage0[131] = 1;  //assertion( (cache_spr_block_flush | cache_spr_block_writeback) & dirty = False) 131
                                                    if ((cache_spr_block_flush & (~dirty)))
                                                        begin
                                                            coverage0[137] = 1;  //assertion( cache_spr_block_flush & If(Not(dirty == 1) == True, 1, 0) = True) 137
                                                            state <= 3'd6;  //assertion( state = 6) 139
                                                        end
                                                    else
                                                        begin
                                                            coverage0[138] = 1;  //assertion( cache_spr_block_flush & If(Not(dirty == 1) == True, 1, 0) = False) 138
                                                            if ((cache_spr_block_writeback & (~dirty)))
                                                                begin
                                                                    coverage0[140] = 1;  //assertion( cache_spr_block_writeback & If(Not(dirty == 1) == True, 1, 0) = True) 140
                                                                    cache_spr_block_writeback <= 1'b0;  //assertion( cache_spr_block_writeback = 0) 142
                                                                    state <= 3'd7;  //assertion( state = 7) 143
                                                                end
                                                            else
                                                                    coverage0[141] = 1;  //assertion( cache_spr_block_writeback & If(Not(dirty == 1) == True, 1, 0) = False) 141
                                                        end
                                                end
                                        end
                                    else
                                            coverage0[129] = 1;  //assertion( hitmiss_eval & tag_v = False) 129
                                end
                        end
                      3'd6:
                        begin
                            coverage0[144] = 1;  //assertion( 6 == state = True) 144
                            cache_spr_block_flush <= 1'b0;  //assertion( cache_spr_block_flush = 0) 145
                            if ((~spr_cswe))
                                begin
                                    coverage0[146] = 1;  //assertion( Not(spr_cswe == 1) = True) 146
                                    state <= 3'd0;  //assertion( state = 0) 148
                                end
                            else
                                    coverage0[147] = 1;  //assertion( Not(spr_cswe == 1) = False) 147
                        end
                      3'd7:
                        begin
                            coverage0[149] = 1;  //assertion( 7 == state = True) 149
                            if ((~spr_cswe))
                                begin
                                    coverage0[150] = 1;  //assertion( Not(spr_cswe == 1) = True) 150
                                    state <= 3'd0;  //assertion( state = 0) 152
                                end
                            else
                                    coverage0[151] = 1;  //assertion( Not(spr_cswe == 1) = False) 151
                        end
                    endcase
                end
        end
                            assert property (coverage0[29]==0);

                            assert property (coverage0[43]==0);

                                    assert property (coverage0[44]==0);

                                    assert property (coverage0[45]==0);

                                            assert property (coverage0[51]==0);

                                            assert property (coverage0[52]==0);

                            assert property (coverage0[57]==0);

                                    assert property (coverage0[59]==0);

                                    assert property (coverage0[60]==0);

                                    assert property (coverage0[65]==0);

                                            assert property (coverage0[67]==0);

                                            assert property (coverage0[68]==0);

                                    assert property (coverage0[66]==0);

                                            assert property (coverage0[77]==0);

                                            assert property (coverage0[78]==0);

                            assert property (coverage0[84]==0);

                                    assert property (coverage0[85]==0);

                                    assert property (coverage0[86]==0);

                                    assert property (coverage0[91]==0);

                                    assert property (coverage0[92]==0);

                                            assert property (coverage0[95]==0);

                                            assert property (coverage0[96]==0);

                                    assert property (coverage0[101]==0);

                                    assert property (coverage0[102]==0);

                            assert property (coverage0[104]==0);

                                    assert property (coverage0[105]==0);

                                    assert property (coverage0[106]==0);

                                            assert property (coverage0[112]==0);

                                            assert property (coverage0[113]==0);

                            assert property (coverage0[119]==0);

                            assert property (coverage0[121]==0);

                                    assert property (coverage0[123]==0);

                                    assert property (coverage0[124]==0);

                                            assert property (coverage0[128]==0);

                                                    assert property (coverage0[130]==0);

                                                    assert property (coverage0[131]==0);

                                                            assert property (coverage0[137]==0);

                                                            assert property (coverage0[138]==0);

                                                                    assert property (coverage0[140]==0);

                                                                    assert property (coverage0[141]==0);

                                            assert property (coverage0[129]==0);

                            assert property (coverage0[144]==0);

                                    assert property (coverage0[146]==0);

                                    assert property (coverage0[147]==0);

                            assert property (coverage0[149]==0);

                                    assert property (coverage0[150]==0);

                                    assert property (coverage0[151]==0);

endmodule
