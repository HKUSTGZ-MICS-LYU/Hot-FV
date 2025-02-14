//Following code is from line 2
module b10(start, g_button, ctr, clock, key, cts, v_out, r_button, rts, rtr, v_in, test, reset);

    input               r_button;
    input               g_button;
    input               key;
    input               start;
    input               reset;
    input               test;
    output              cts;
    output              ctr;
    input               rts;
    input               rtr;
    input               clock;
    input         [3:0] v_in;
    output        [3:0] v_out;
    reg cts = 1'b0;
    reg ctr = 1'b0;
    reg [3:0] v_out = 4'b0;
    reg  [3:0]  stato = 4'b0;
    reg  voto0 = 1'b0;
    reg  voto1 = 1'b0;
    reg  voto2 = 1'b0;
    reg  voto3 = 1'b0;
    reg  [3:0]  sign = 4'b0;
    reg  last_g = 1'b0;
    reg  last_r = 1'b0;
    reg [999:0] coverage0 = 1000'b0;

    //Following code is from line 26
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    coverage0[0] = 1;  //assertion( 1 == reset = True) 0
                    stato <= 4'b0000;  //assertion( stato = 0) 2
                    voto0 <= 1'b0;  //assertion( voto0 = 0) 3
                    voto1 <= 1'b0;  //assertion( voto1 = 0) 4
                    voto2 <= 1'b0;  //assertion( voto2 = 0) 5
                    voto3 <= 1'b0;  //assertion( voto3 = 0) 6
                    sign <= 4'b0000;  //assertion( sign = 0) 7
                    last_g <= 1'b0;  //assertion( last_g = 0) 8
                    last_r <= 1'b0;  //assertion( last_r = 0) 9
                    cts <= 1'b0;  //assertion( cts = 0) 10
                    ctr <= 1'b0;  //assertion( ctr = 0) 11
                    v_out <= 4'b0000;  //assertion( v_out = 0) 12
                end
            else
                begin
                    coverage0[1] = 1;  //assertion( 1 == reset = False) 1
                    case (stato)
                      4'b0000:
                        begin
                            coverage0[2] = 1;  //assertion( 0 == stato = True) 13
                            voto1 <= 1'b0;  //assertion( voto1 = 0) 14
                            voto2 <= 1'b0;  //assertion( voto2 = 0) 15
                            voto3 <= 1'b0;  //assertion( voto3 = 0) 16
                            cts <= 1'b0;  //assertion( cts = 0) 17
                            ctr <= 1'b0;  //assertion( ctr = 0) 18
                            if ((test == 1'b0))
                                begin
                                    coverage0[3] = 1;  //assertion( 0 == test = True) 19
                                    sign <= 4'b0000;  //assertion( sign = 0) 21
                                    stato <= 4'b1001;  //assertion( stato = 9) 22
                                end
                            else
                                begin
                                    coverage0[4] = 1;  //assertion( 0 == test = False) 20
                                    voto0 <= 1'b0;  //assertion( voto0 = 0) 23
                                    voto1 <= 1'b0;  //assertion( voto1 = 0) 24
                                    voto2 <= 1'b0;  //assertion( voto2 = 0) 25
                                    voto3 <= 1'b0;  //assertion( voto3 = 0) 26
                                    stato <= 4'b0001;  //assertion( stato = 1) 27
                                end
                        end
                      4'b0001:
                        begin
                            coverage0[5] = 1;  //assertion( 1 == stato = True) 28
                            if ((start == 1'b1))
                                begin
                                    coverage0[6] = 1;  //assertion( 1 == start = True) 29
                                    voto0 <= 1'b0;  //assertion( voto0 = 0) 31
                                    voto1 <= 1'b0;  //assertion( voto1 = 0) 32
                                    voto2 <= 1'b0;  //assertion( voto2 = 0) 33
                                    voto3 <= 1'b0;  //assertion( voto3 = 0) 34
                                    stato <= 4'b0010;  //assertion( stato = 2) 35
                                end
                            else
                                    coverage0[7] = 1;  //assertion( 1 == start = False) 30
                            if ((rtr == 1'b1))
                                begin
                                    coverage0[8] = 1;  //assertion( 1 == rtr = True) 36
                                    cts <= 1'b1;  //assertion( cts = 1) 38
                                end
                            else
                                    coverage0[9] = 1;  //assertion( 1 == rtr = False) 37
                            if ((rtr == 1'b0))
                                begin
                                    coverage0[10] = 1;  //assertion( 0 == rtr = True) 39
                                    cts <= 1'b0;  //assertion( cts = 0) 41
                                end
                            else
                                    coverage0[11] = 1;  //assertion( 0 == rtr = False) 40
                        end
                      4'b0010:
                        begin
                            coverage0[12] = 1;  //assertion( 2 == stato = True) 42
                            if ((start == 1'b0))
                                begin
                                    coverage0[13] = 1;  //assertion( 0 == start = True) 43
                                    stato <= 4'b0011;  //assertion( stato = 3) 45
                                end
                            else
                                begin
                                    coverage0[14] = 1;  //assertion( 0 == start = False) 44
                                    if ((key == 1'b1))
                                        begin
                                            coverage0[15] = 1;  //assertion( 1 == key = True) 46
                                            voto0 <= key;  //assertion( voto0 = key) 48
                                            if ((((g_button ^ last_g) & g_button) == 1'b1))
                                                begin
                                                    coverage0[16] = 1;  //assertion( 1 == (g_button ^ last_g) & g_button = True) 49
                                                    voto1 <= (~voto1);  //assertion( voto1 = ~voto1) 51
                                                end
                                            else
                                                    coverage0[17] = 1;  //assertion( 1 == (g_button ^ last_g) & g_button = False) 50
                                            if ((((r_button ^ last_r) & r_button) == 1'b1))
                                                begin
                                                    coverage0[18] = 1;  //assertion( 1 == (r_button ^ last_r) & r_button = True) 52
                                                    voto2 <= (~voto2);  //assertion( voto2 = ~voto2) 54
                                                end
                                            else
                                                    coverage0[19] = 1;  //assertion( 1 == (r_button ^ last_r) & r_button = False) 53
                                            last_g <= g_button;  //assertion( last_g = g_button) 55
                                            last_r <= r_button;  //assertion( last_r = r_button) 56
                                        end
                                    else
                                        begin
                                            coverage0[20] = 1;  //assertion( 1 == key = False) 47
                                            voto0 <= 1'b0;  //assertion( voto0 = 0) 57
                                            voto1 <= 1'b0;  //assertion( voto1 = 0) 58
                                            voto2 <= 1'b0;  //assertion( voto2 = 0) 59
                                            voto3 <= 1'b0;  //assertion( voto3 = 0) 60
                                        end
                                end
                        end
                      4'b0011:
                        begin
                            coverage0[21] = 1;  //assertion( 3 == stato = True) 61
                            voto3 <= (voto0 ^ (voto1 ^ voto2));  //assertion( voto3 = voto0 ^ voto1 ^ voto2) 62
                            stato <= 4'b0100;  //assertion( stato = 4) 63
                            voto0 <= 1'b0;  //assertion( voto0 = 0) 64
                        end
                      4'b0100:
                        begin
                            coverage0[22] = 1;  //assertion( 4 == stato = True) 65
                            if ((rtr == 1'b1))
                                begin
                                    coverage0[23] = 1;  //assertion( 1 == rtr = True) 66
                                    v_out <= {voto3, voto2, voto1, voto0};  //assertion( v_out = Concat(Concat(Concat(voto3, voto2), voto1), voto0)) 68
                                    cts <= 1'b1;  //assertion( cts = 1) 69
                                    if (((((voto0 == 1'b0) && (voto1 == 1'b1)) && (voto2 == 1'b1)) && (voto3 == 1'b0)))
                                        begin
                                            coverage0[24] = 1;  //assertion( And(If(And(If(And(If((0 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((0 == voto3) == True, 1, 0) == 1) = True) 70
                                            stato <= 4'b1000;  //assertion( stato = 8) 72
                                        end
                                    else
                                        begin
                                            coverage0[25] = 1;  //assertion( And(If(And(If(And(If((0 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((0 == voto3) == True, 1, 0) == 1) = False) 71
                                            stato <= 4'b0101;  //assertion( stato = 5) 73
                                        end
                                end
                            else
                                    coverage0[26] = 1;  //assertion( 1 == rtr = False) 67
                        end
                      4'b0101:
                        begin
                            coverage0[27] = 1;  //assertion( 5 == stato = True) 74
                            if ((rts == 1'b0))
                                begin
                                    coverage0[28] = 1;  //assertion( 0 == rts = True) 75
                                    ctr <= 1'b1;  //assertion( ctr = 1) 77
                                    stato <= 4'b0110;  //assertion( stato = 6) 78
                                end
                            else
                                    coverage0[29] = 1;  //assertion( 0 == rts = False) 76
                        end
                      4'b0110:
                        begin
                            coverage0[30] = 1;  //assertion( 6 == stato = True) 79
                            if ((rts == 1'b1))
                                begin
                                    coverage0[31] = 1;  //assertion( 1 == rts = True) 80
                                    voto0 <= v_in[0];  //assertion( voto0 = Extract(0, 0, v_in)) 82
                                    voto1 <= v_in[1];  //assertion( voto1 = Extract(1, 1, v_in)) 83
                                    voto2 <= v_in[2];  //assertion( voto2 = Extract(2, 2, v_in)) 84
                                    voto3 <= v_in[3];  //assertion( voto3 = Extract(3, 3, v_in)) 85
                                    ctr <= 1'b0;  //assertion( ctr = 0) 86
                                    stato <= 4'b0111;  //assertion( stato = 7) 87
                                end
                            else
                                    coverage0[32] = 1;  //assertion( 1 == rts = False) 81
                        end
                      4'b0111:
                        begin
                            coverage0[33] = 1;  //assertion( 7 == stato = True) 88
                            if ((rtr == 1'b0))
                                begin
                                    coverage0[34] = 1;  //assertion( 0 == rtr = True) 89
                                    cts <= 1'b0;  //assertion( cts = 0) 91
                                    stato <= 4'b0100;  //assertion( stato = 4) 92
                                end
                            else
                                    coverage0[35] = 1;  //assertion( 0 == rtr = False) 90
                        end
                      4'b1000:
                        begin
                            coverage0[36] = 1;  //assertion( 8 == stato = True) 93
                            if ((rtr == 1'b0))
                                begin
                                    coverage0[37] = 1;  //assertion( 0 == rtr = True) 94
                                    cts <= 1'b0;  //assertion( cts = 0) 96
                                    stato <= 4'b0001;  //assertion( stato = 1) 97
                                end
                            else
                                    coverage0[38] = 1;  //assertion( 0 == rtr = False) 95
                        end
                      4'b1001:
                        begin
                            coverage0[39] = 1;  //assertion( 9 == stato = True) 98
                            voto0 <= v_in[0];  //assertion( voto0 = Extract(0, 0, v_in)) 99
                            voto1 <= v_in[1];  //assertion( voto1 = Extract(1, 1, v_in)) 100
                            voto2 <= v_in[2];  //assertion( voto2 = Extract(2, 2, v_in)) 101
                            voto3 <= v_in[3];  //assertion( voto3 = Extract(3, 3, v_in)) 102
                            sign <= 4'b1000;  //assertion( sign = 8) 103
                            if (((((voto0 == 1'b1) && (voto1 == 1'b1)) && (voto2 == 1'b1)) && (voto3 == 1'b1)))
                                begin
                                    coverage0[40] = 1;  //assertion( And(If(And(If(And(If((1 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto3) == True, 1, 0) == 1) = True) 104
                                    stato <= 4'b1010;  //assertion( stato = 10) 106
                                end
                            else
                                    coverage0[41] = 1;  //assertion( And(If(And(If(And(If((1 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto3) == True, 1, 0) == 1) = False) 105
                        end
                      4'b1010:
                        begin
                            coverage0[42] = 1;  //assertion( 10 == stato = True) 107
                            voto0 <= (1'b1 ^ sign[3]);  //assertion( voto0 = 1 ^ Extract(3, 3, sign)) 108
                            stato <= 4'b0100;  //assertion( stato = 4) 109
                        end
                    endcase
                end
        end
                            assert property (coverage0[0]==0);

                    assert property (coverage0[1]==0);

                            assert property (coverage0[2]==0);

                                    assert property (coverage0[3]==0);

                                    assert property (coverage0[4]==0);

                            assert property (coverage0[5]==0);

                                    assert property (coverage0[6]==0);

                                    assert property (coverage0[7]==0);

                                    assert property (coverage0[8]==0);

                                    assert property (coverage0[9]==0);

                                    assert property (coverage0[10]==0);

                                    assert property (coverage0[11]==0);

                            assert property (coverage0[12]==0);

                                    assert property (coverage0[13]==0);

                                    assert property (coverage0[14]==0);

                                            assert property (coverage0[15]==0);

                                                    assert property (coverage0[16]==0);

                                                    assert property (coverage0[17]==0);

                                                    assert property (coverage0[18]==0);

                                                    assert property (coverage0[19]==0);

                                            assert property (coverage0[20]==0);

                            assert property (coverage0[21]==0);

                            assert property (coverage0[22]==0);

                                    assert property (coverage0[23]==0);

                                            assert property (coverage0[24]==0);

                                            assert property (coverage0[25]==0);

                                    assert property (coverage0[26]==0);

                            assert property (coverage0[27]==0);

                                    assert property (coverage0[28]==0);

                                    assert property (coverage0[29]==0);

                            assert property (coverage0[30]==0);

                                    assert property (coverage0[31]==0);

                                    assert property (coverage0[32]==0);

                            assert property (coverage0[33]==0);

                                    assert property (coverage0[34]==0);

                                    assert property (coverage0[35]==0);

                            assert property (coverage0[36]==0);

                                    assert property (coverage0[37]==0);

                                    assert property (coverage0[38]==0);

                            assert property (coverage0[39]==0);

                                    assert property (coverage0[40]==0);

                                    assert property (coverage0[41]==0);

                            assert property (coverage0[42]==0);

endmodule
