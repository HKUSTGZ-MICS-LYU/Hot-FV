//Following code is from line 1
module b06(clock, enable_count, cc_mux, reset, cont_eql, eql, uscite, ackout);

    input               eql;
    input               clock;
    input               reset;
    input               cont_eql;
    output        [1:0] cc_mux;
    output        [1:0] uscite;
    output              enable_count;
    output              ackout;
    reg [1:0] cc_mux = 2'b0;
    reg [1:0] uscite = 2'b0;
    reg enable_count = 1'b0;
    reg ackout = 1'b0;
    reg  [2:0]  state = 3'b0;
    reg [999:0] coverage0 = 1000'b0;

    //Following code is from line 15
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    coverage0[0] = 1;  //assertion( 1 == reset = True) 0
                    state <= 3'b000;  //assertion( state = 0) 2
                    cc_mux <= 2'b00;  //assertion( cc_mux = 0) 3
                    enable_count <= 1'b0;  //assertion( enable_count = 0) 4
                    ackout <= 1'b0;  //assertion( ackout = 0) 5
                    uscite <= 2'b00;  //assertion( uscite = 0) 6
                end
            else
                begin
                    coverage0[1] = 1;  //assertion( 1 == reset = False) 1
                    if ((cont_eql == 1'b1))
                        begin
                            coverage0[2] = 1;  //assertion( 1 == cont_eql = True) 7
                            ackout <= 1'b0;  //assertion( ackout = 0) 9
                            enable_count <= 1'b0;  //assertion( enable_count = 0) 10
                        end
                    else
                        begin
                            coverage0[3] = 1;  //assertion( 1 == cont_eql = False) 8
                            ackout <= 1'b1;  //assertion( ackout = 1) 11
                            enable_count <= 1'b1;  //assertion( enable_count = 1) 12
                        end
                    case (state)
                      3'b000:
                        begin
                            coverage0[4] = 1;  //assertion( 0 == state = True) 13
                            cc_mux <= 2'b01;  //assertion( cc_mux = 1) 14
                            uscite <= 2'b01;  //assertion( uscite = 1) 15
                            state <= 3'b001;  //assertion( state = 1) 16
                        end
                      3'b001:
                        begin
                            coverage0[5] = 1;  //assertion( 1 == state = True) 17
                            if ((eql == 1'b1))
                                begin
                                    coverage0[6] = 1;  //assertion( 1 == eql = True) 18
                                    uscite <= 2'b00;  //assertion( uscite = 0) 20
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 21
                                    state <= 3'b010;  //assertion( state = 2) 22
                                end
                            else
                                begin
                                    coverage0[7] = 1;  //assertion( 1 == eql = False) 19
                                    uscite <= 2'b01;  //assertion( uscite = 1) 23
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 24
                                    state <= 3'b101;  //assertion( state = 5) 25
                                end
                        end
                      3'b101:
                        begin
                            coverage0[8] = 1;  //assertion( 5 == state = True) 26
                            if ((eql == 1'b1))
                                begin
                                    coverage0[9] = 1;  //assertion( 1 == eql = True) 27
                                    uscite <= 2'b00;  //assertion( uscite = 0) 29
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 30
                                    state <= 3'b100;  //assertion( state = 4) 31
                                end
                            else
                                begin
                                    coverage0[10] = 1;  //assertion( 1 == eql = False) 28
                                    uscite <= 2'b01;  //assertion( uscite = 1) 32
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 33
                                    state <= 3'b001;  //assertion( state = 1) 34
                                end
                        end
                      3'b010:
                        begin
                            coverage0[11] = 1;  //assertion( 2 == state = True) 35
                            if ((eql == 1'b1))
                                begin
                                    coverage0[12] = 1;  //assertion( 1 == eql = True) 36
                                    uscite <= 2'b00;  //assertion( uscite = 0) 38
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 39
                                    state <= 3'b010;  //assertion( state = 2) 40
                                end
                            else
                                begin
                                    coverage0[13] = 1;  //assertion( 1 == eql = False) 37
                                    uscite <= 2'b01;  //assertion( uscite = 1) 41
                                    ackout <= 1'b1;  //assertion( ackout = 1) 42
                                    enable_count <= 1'b1;  //assertion( enable_count = 1) 43
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 44
                                    state <= 3'b011;  //assertion( state = 3) 45
                                end
                        end
                      3'b011:
                        begin
                            coverage0[14] = 1;  //assertion( 3 == state = True) 46
                            if ((eql == 1'b1))
                                begin
                                    coverage0[15] = 1;  //assertion( 1 == eql = True) 47
                                    uscite <= 2'b01;  //assertion( uscite = 1) 49
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 50
                                    state <= 3'b011;  //assertion( state = 3) 51
                                end
                            else
                                begin
                                    coverage0[16] = 1;  //assertion( 1 == eql = False) 48
                                    uscite <= 2'b01;  //assertion( uscite = 1) 52
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 53
                                    state <= 3'b001;  //assertion( state = 1) 54
                                end
                        end
                      3'b100:
                        begin
                            coverage0[17] = 1;  //assertion( 4 == state = True) 55
                            if ((eql == 1'b1))
                                begin
                                    coverage0[18] = 1;  //assertion( 1 == eql = True) 56
                                    uscite <= 2'b00;  //assertion( uscite = 0) 58
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 59
                                    state <= 3'b100;  //assertion( state = 4) 60
                                end
                            else
                                begin
                                    coverage0[19] = 1;  //assertion( 1 == eql = False) 57
                                    uscite <= 2'b11;  //assertion( uscite = 3) 61
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 62
                                    state <= 3'b110;  //assertion( state = 6) 63
                                end
                        end
                      3'b110:
                        begin
                            coverage0[20] = 1;  //assertion( 6 == state = True) 64
                            if ((eql == 1'b1))
                                begin
                                    coverage0[21] = 1;  //assertion( 1 == eql = True) 65
                                    uscite <= 2'b11;  //assertion( uscite = 3) 67
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 68
                                    state <= 3'b110;  //assertion( state = 6) 69
                                end
                            else
                                begin
                                    coverage0[22] = 1;  //assertion( 1 == eql = False) 66
                                    uscite <= 2'b01;  //assertion( uscite = 1) 70
                                    cc_mux <= 2'b01;  //assertion( cc_mux = 1) 71
                                    state <= 3'b001;  //assertion( state = 1) 72
                                end
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

endmodule
