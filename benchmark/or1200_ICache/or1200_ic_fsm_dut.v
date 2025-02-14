//Following code is from line 1935
module or1200_ic_fsm(icqmem_cycstb_i, icram_we, burst, start_addr, tagcomp_miss, ic_en, biu_read, biudata_valid, icqmem_ci_i, first_miss_ack, first_hit_ack, first_miss_err, tag_we, biudata_error, rst, clk, saved_addr);

    input                clk;
    input                rst;
    input                ic_en;
    input                icqmem_cycstb_i;
    input                icqmem_ci_i;
    input                tagcomp_miss;
    input                biudata_valid;
    input                biudata_error;
    input         [31:0] start_addr;
    output        [31:0] saved_addr;
    output        [3:0]  icram_we;
    output               biu_read;
    output               first_hit_ack;
    output               first_miss_ack;
    output               first_miss_err;
    output               burst;
    output               tag_we;
    reg  [31:0] saved_addr_r = 32'b0;
    reg  [1:0]  state = 2'b0;
    reg  [2:0]  cnt = 3'b0;
    reg  hitmiss_eval = 1'b0;
    reg  load = 1'b0;
    reg  cache_inhibit = 1'b0;
    reg [199:0] coverage0 = 200'b0;


    assign icram_we = { 4{ ((biu_read & biudata_valid) & (~cache_inhibit)) } };
  //assertion( icram_we = Concat(Concat(Concat(biu_read & biudata_valid & If(Not(cache_inhibit == 1) == True, 1, 0), biu_read & biudata_valid & If(Not(cache_inhibit == 1) == True, 1, 0)), biu_read & biudata_valid & If(Not(cache_inhibit == 1) == True, 1, 0)), biu_read & biudata_valid & If(Not(cache_inhibit == 1) == True, 1, 0))) 0
    assign tag_we = ((biu_read & biudata_valid) & (~cache_inhibit));
  //assertion( tag_we = biu_read & biudata_valid & If(Not(cache_inhibit == 1) == True, 1, 0)) 1
    assign biu_read = ((hitmiss_eval & tagcomp_miss) | ((~hitmiss_eval) & load));
  //assertion( biu_read = hitmiss_eval & tagcomp_miss | If(Not(hitmiss_eval == 1) == True, 1, 0) & load) 2
    assign saved_addr = saved_addr_r;
  //assertion( saved_addr = saved_addr_r) 3
    assign first_hit_ack = (((((state == 2'd1) & hitmiss_eval) & (~tagcomp_miss)) & (~cache_inhibit)) & (~icqmem_ci_i));
  //assertion( first_hit_ack = If((1 == state) == True, 1, 0) & hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(cache_inhibit == 1) == True, 1, 0) & If(Not(icqmem_ci_i == 1) == True, 1, 0)) 4
    assign first_miss_ack = ((state == 2'd1) & biudata_valid);
  //assertion( first_miss_ack = If((1 == state) == True, 1, 0) & biudata_valid) 5
    assign first_miss_err = ((state == 2'd1) & biudata_error);
  //assertion( first_miss_err = If((1 == state) == True, 1, 0) & biudata_error) 6
    assign burst = ((((state == 2'd1) & tagcomp_miss) & (~cache_inhibit)) | (state == 2'd2));
  //assertion( burst = If((1 == state) == True, 1, 0) & tagcomp_miss & If(Not(cache_inhibit == 1) == True, 1, 0) | If((2 == state) == True, 1, 0)) 7
    //Following code is from line 2000
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    coverage0[8] = 1;  //assertion( 0 != rst = True) 8
                    state <= 2'd0;  //assertion( state = 0) 10
                    saved_addr_r <= 32'b0;  //assertion( saved_addr_r = 0) 11
                    hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 12
                    load <= 1'b0;  //assertion( load = 0) 13
                    cnt <= 3'b000;  //assertion( cnt = 0) 14
                    cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 15
                end
            else
                begin
                    // coverage0[9] = 1;  //assertion( 0 != rst = False) 9
                    case (state)
                      2'd0:
                        begin
                            coverage0[16] = 1;  //assertion( 0 == state = True) 16
                            if ((ic_en & icqmem_cycstb_i))
                                begin
                                    coverage0[17] = 1;  //assertion( ic_en & icqmem_cycstb_i = True) 17
                                    state <= 2'd1;  //assertion( state = 1) 19
                                    saved_addr_r <= start_addr;  //assertion( saved_addr_r = start_addr) 20
                                    hitmiss_eval <= 1'b1;  //assertion( hitmiss_eval = 1) 21
                                    load <= 1'b1;  //assertion( load = 1) 22
                                    cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 23
                                end
                            else
                                begin
                                    coverage0[18] = 1;  //assertion( ic_en & icqmem_cycstb_i = False) 18
                                    hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 24
                                    load <= 1'b0;  //assertion( load = 0) 25
                                    cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 26
                                end
                        end
                      2'd1:
                        begin
                            coverage0[27] = 1;  //assertion( 1 == state = True) 27
                            if ((icqmem_cycstb_i & icqmem_ci_i))
                                begin
                                    coverage0[28] = 1;  //assertion( icqmem_cycstb_i & icqmem_ci_i = True) 28
                                    cache_inhibit <= 1'b1;  //assertion( cache_inhibit = 1) 30
                                end
                            else
                                    coverage0[29] = 1;  //assertion( icqmem_cycstb_i & icqmem_ci_i = False) 29
                            if (hitmiss_eval)
                                begin
                                    coverage0[31] = 1;  //assertion( 0 != hitmiss_eval = True) 31
                                    saved_addr_r[31:13] <= start_addr[31:13];  //assertion( Extract(31, 13, saved_addr_r) = Extract(31, 13, start_addr)) 33
                                end
                            else
                                    coverage0[32] = 1;  //assertion( 0 != hitmiss_eval = False) 32
                            if (((((~ic_en) || (hitmiss_eval & (~icqmem_cycstb_i))) || biudata_error) || (cache_inhibit & biudata_valid)))
                                begin
                                    coverage0[34] = 1;  //assertion( Or(If(Or(If(Or(If(Not(ic_en == 1) == True, 1, 0) == 1, hitmiss_eval & If(Not(icqmem_cycstb_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, biudata_error == 1) == True, 1, 0) == 1, cache_inhibit & biudata_valid == 1) = True) 34
                                    state <= 2'd0;  //assertion( state = 0) 36
                                    hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 37
                                    load <= 1'b0;  //assertion( load = 0) 38
                                    cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 39
                                end
                            else
                                begin
                                    coverage0[35] = 1;  //assertion( Or(If(Or(If(Or(If(Not(ic_en == 1) == True, 1, 0) == 1, hitmiss_eval & If(Not(icqmem_cycstb_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, biudata_error == 1) == True, 1, 0) == 1, cache_inhibit & biudata_valid == 1) = False) 35
                                    if ((tagcomp_miss & biudata_valid))
                                        begin
                                            coverage0[40] = 1;  //assertion( tagcomp_miss & biudata_valid = True) 40
                                            state <= 2'd2;  //assertion( state = 2) 42
                                            saved_addr_r[3:2] <= (saved_addr_r[3:2] + 1'd1);  //assertion( Extract(3, 2, saved_addr_r) = Extract(3, 2, saved_addr_r) + ZeroExt(1, 1)) 43
                                            hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 44
                                            cnt <= (4 - 2);  //assertion( cnt = 4 - ZeroExt(1, 2)) 45
                                            cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 46
                                        end
                                    else
                                        begin
                                            coverage0[41] = 1;  //assertion( tagcomp_miss & biudata_valid = False) 41
                                            if (((~tagcomp_miss) & (~icqmem_ci_i)))
                                                begin
                                                    coverage0[47] = 1;  //assertion( If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(icqmem_ci_i == 1) == True, 1, 0) = True) 47
                                                    saved_addr_r <= start_addr;  //assertion( saved_addr_r = start_addr) 49
                                                    cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 50
                                                end
                                            else
                                                begin
                                                    coverage0[48] = 1;  //assertion( If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(icqmem_ci_i == 1) == True, 1, 0) = False) 48
                                                    if ((~icqmem_cycstb_i))
                                                        begin
                                                            coverage0[51] = 1;  //assertion( Not(icqmem_cycstb_i == 1) = True) 51
                                                            state <= 2'd0;  //assertion( state = 0) 53
                                                            hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 54
                                                            load <= 1'b0;  //assertion( load = 0) 55
                                                            cache_inhibit <= 1'b0;  //assertion( cache_inhibit = 0) 56
                                                        end
                                                    else
                                                        begin
                                                            coverage0[52] = 1;  //assertion( Not(icqmem_cycstb_i == 1) = False) 52
                                                            hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 57
                                                        end
                                                end
                                        end
                                end
                        end
                      2'd2:
                        begin
                            coverage0[58] = 1;  //assertion( 2 == state = True) 58
                            if ((biudata_valid && (|cnt)))
                                begin
                                    coverage0[59] = 1;  //assertion( And(biudata_valid == 1, bvredor(cnt) == 1) = True) 59
                                    cnt <= (cnt - 3'd1);  //assertion( cnt = cnt - 1) 61
                                    saved_addr_r[3:2] <= (saved_addr_r[3:2] + 1'd1);  //assertion( Extract(3, 2, saved_addr_r) = Extract(3, 2, saved_addr_r) + ZeroExt(1, 1)) 62
                                end
                            else
                                begin
                                    coverage0[60] = 1;  //assertion( And(biudata_valid == 1, bvredor(cnt) == 1) = False) 60
                                    if (biudata_valid)
                                        begin
                                            coverage0[63] = 1;  //assertion( 0 != biudata_valid = True) 63
                                            state <= 2'd0;  //assertion( state = 0) 65
                                            saved_addr_r <= start_addr;  //assertion( saved_addr_r = start_addr) 66
                                            hitmiss_eval <= 1'b0;  //assertion( hitmiss_eval = 0) 67
                                            load <= 1'b0;  //assertion( load = 0) 68
                                        end
                                    else
                                            coverage0[64] = 1;  //assertion( 0 != biudata_valid = False) 64
                                end
                        end
                      default:
                        begin
                            coverage0[69] = 1;  //assertion( If(0 != state == True, 1, 0) & If(1 != state == True, 1, 0) & If(2 != state == True, 1, 0) = True) 69
                            state <= 2'd0;  //assertion( state = 0) 70
                        end
                    endcase
                end
        end
                            assert property (coverage0[8]==0);

                    assert property (coverage0[9]==0);

                            assert property (coverage0[16]==0);

                                    assert property (coverage0[17]==0);

                                    assert property (coverage0[18]==0);

                            assert property (coverage0[27]==0);

                                    assert property (coverage0[28]==0);

                                    assert property (coverage0[29]==0);

                                    assert property (coverage0[31]==0);

                                    assert property (coverage0[32]==0);

                                    assert property (coverage0[34]==0);

                                    assert property (coverage0[35]==0);

                                            assert property (coverage0[40]==0);

                                            assert property (coverage0[41]==0);

                                                    assert property (coverage0[47]==0);

                                                    assert property (coverage0[48]==0);

                                                            assert property (coverage0[51]==0);

                                                            assert property (coverage0[52]==0);

                            assert property (coverage0[58]==0);

                                    assert property (coverage0[59]==0);

                                    assert property (coverage0[60]==0);

                                            assert property (coverage0[63]==0);

                                            assert property (coverage0[64]==0);

                            // assert property (coverage0[69]==0);

endmodule
