//Following code is from line 1
module b11(stbi, x_out, x_in, clock, reset);

    input         [5:0] x_in;
    input               stbi;
    input               clock;
    input               reset;
    output        [5:0] x_out;
    reg [5:0] x_out = 6'b0;
    reg  [5:0]  r_in = 6'b0;
    reg  [3:0]  stato = 4'b0;
    reg  [5:0]  cont = 6'b0;
    wire signed [8:0] cont1_inv;
    reg signed [8:0]  cont1 = 9'sb0;
    reg [999:0] coverage0 = 1000'b0;

    assign cont1_inv = (-cont1);
  //assertion( cont1_inv = -cont1) 0
    //Following code is from line 20
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    coverage0[1] = 1;  //assertion( 1 == reset = True) 1
                    assert property (coverage0[1]==0);
                    stato = 4'b0000;  //assertion( stato = 0) 3
                    r_in = 6'b0;  //assertion( r_in = 0) 4
                    cont = 6'b0;  //assertion( cont = 0) 5
                    cont1 = 9'b0;  //assertion( cont1 = 0) 6
                    x_out = 6'b0;  //assertion( x_out = 0) 7
                end
            else
                begin
                    coverage0[2] = 1;  //assertion( 1 == reset = False) 2
                    assert property (coverage0[2]==0);
                    case (stato)
                      4'b0000:
                        begin
                            coverage0[8] = 1;  //assertion( 0 == stato = True) 8
                            assert property (coverage0[8]==0);
                            cont = 6'b0;  //assertion( cont = 0) 9
                            r_in = x_in;  //assertion( r_in = x_in) 10
                            x_out = 6'b0;  //assertion( x_out = 0) 11
                            stato = 4'b0001;  //assertion( stato = 1) 12
                        end
                      4'b0001:
                        begin
                            coverage0[13] = 1;  //assertion( 1 == stato = True) 13
                            assert property (coverage0[13]==0);
                            r_in = x_in;  //assertion( r_in = x_in) 14
                            if ((stbi == 1'b1))
                                begin
                                    coverage0[15] = 1;  //assertion( 1 == stbi = True) 15
                                    assert property (coverage0[15]==0);
                                    stato = 4'b0001;  //assertion( stato = 1) 17
                                end
                            else
                                begin
                                    coverage0[16] = 1;  //assertion( 1 == stbi = False) 16
                                    assert property (coverage0[16]==0);
                                    stato = 4'b0010;  //assertion( stato = 2) 18
                                end
                        end
                      4'b0010:
                        begin
                            coverage0[19] = 1;  //assertion( 2 == stato = True) 19
                            assert property (coverage0[19]==0);
                            if (((r_in == 6'b0) || (r_in == 6'b111111)))
                                begin
                                    coverage0[20] = 1;  //assertion( Or(If((0 == r_in) == True, 1, 0) == 1, If((63 == r_in) == True, 1, 0) == 1) = True) 20
                                    assert property (coverage0[20]==0);
                                    if ((cont < 6'b11001))
                                        begin
                                            coverage0[22] = 1;  //assertion( ULT(cont, 25) = True) 22
                                            assert property (coverage0[22]==0);
                                            cont = (cont + 1'b1);  //assertion( cont = cont + ZeroExt(5, 1)) 24
                                        end
                                    else
                                        begin
                                            coverage0[23] = 1;  //assertion( ULT(cont, 25) = False) 23
                                            assert property (coverage0[23]==0);
                                            cont = 6'b0;  //assertion( cont = 0) 25
                                        end
                                    cont1 = {3'b0, r_in};  //assertion( cont1 = Concat(0, r_in)) 26
                                    stato = 4'b1000;  //assertion( stato = 8) 27
                                end
                            else
                                begin
                                    coverage0[21] = 1;  //assertion( Or(If((0 == r_in) == True, 1, 0) == 1, If((63 == r_in) == True, 1, 0) == 1) = False) 21
                                    assert property (coverage0[21]==0);
                                    if ((r_in <= 6'b011010))
                                        begin
                                            coverage0[28] = 1;  //assertion( ULE(r_in, 26) = True) 28
                                            assert property (coverage0[28]==0);
                                            stato = 4'b0011;  //assertion( stato = 3) 30
                                        end
                                    else
                                        begin
                                            coverage0[29] = 1;  //assertion( ULE(r_in, 26) = False) 29
                                            assert property (coverage0[29]==0);
                                            stato = 4'b0001;  //assertion( stato = 1) 31
                                        end
                                end
                        end
                      4'b0011:
                        begin
                            coverage0[32] = 1;  //assertion( 3 == stato = True) 32
                            assert property (coverage0[32]==0);
                            if ((r_in[0] == 1'b1))
                                begin
                                    coverage0[33] = 1;  //assertion( 1 == Extract(0, 0, r_in) = True) 33
                                    assert property (coverage0[33]==0);
                                    cont1 = {2'b0, cont, 1'b0};  //assertion( cont1 = Concat(Concat(0, cont), 0)) 35
                                end
                            else
                                begin
                                    coverage0[34] = 1;  //assertion( 1 == Extract(0, 0, r_in) = False) 34
                                    assert property (coverage0[34]==0);
                                    cont1 = {3'b0, cont};  //assertion( cont1 = Concat(0, cont)) 36
                                end
                            stato = 4'b0100;  //assertion( stato = 4) 37
                        end
                      4'b0100:
                        begin
                            coverage0[38] = 1;  //assertion( 4 == stato = True) 38
                            assert property (coverage0[38]==0);
                            if ((r_in[1] == 1'b1))
                                begin
                                    coverage0[39] = 1;  //assertion( 1 == Extract(1, 1, r_in) = True) 39
                                    assert property (coverage0[39]==0);
                                    cont1 = ({3'b0, r_in} + cont1);  //assertion( cont1 = Concat(0, r_in) + cont1) 41
                                    stato = 4'b0101;  //assertion( stato = 5) 42
                                end
                            else
                                begin
                                    coverage0[40] = 1;  //assertion( 1 == Extract(1, 1, r_in) = False) 40
                                    assert property (coverage0[40]==0);
                                    cont1 = ({3'b0, r_in} - cont1);  //assertion( cont1 = Concat(0, r_in) - cont1) 43
                                    stato = 4'b0110;  //assertion( stato = 6) 44
                                end
                        end
                      4'b0101:
                        begin
                            coverage0[45] = 1;  //assertion( 5 == stato = True) 45
                            assert property (coverage0[45]==0);
                            if ((cont1 > 9'sb011010))
                                begin
                                    coverage0[46] = 1;  //assertion( 26 < cont1 = True) 46
                                    assert property (coverage0[46]==0);
                                    cont1 = (cont1 - 9'b011010);  //assertion( cont1 = cont1 - 26) 48
                                    stato = 4'b0101;  //assertion( stato = 5) 49
                                end
                            else
                                begin
                                    coverage0[47] = 1;  //assertion( 26 < cont1 = False) 47
                                    assert property (coverage0[47]==0);
                                    stato = 4'b0111;  //assertion( stato = 7) 50
                                end
                        end
                      4'b0110:
                        begin
                            coverage0[51] = 1;  //assertion( 6 == stato = True) 51
                            assert property (coverage0[51]==0);
                            if ((cont1 > 9'sb111111))
                                begin
                                    coverage0[52] = 1;  //assertion( 63 < cont1 = True) 52
                                    assert property (coverage0[52]==0);
                                    cont1 = (cont1 + 9'b011010);  //assertion( cont1 = cont1 + 26) 54
                                    stato = 4'b0110;  //assertion( stato = 6) 55
                                end
                            else
                                begin
                                    coverage0[53] = 1;  //assertion( 63 < cont1 = False) 53
                                    assert property (coverage0[53]==0);
                                    stato = 4'b0111;  //assertion( stato = 7) 56
                                end
                        end
                      4'b0111:
                        begin
                            coverage0[57] = 1;  //assertion( 7 == stato = True) 57
                            assert property (coverage0[57]==0);
                            if ((r_in[3:2] == 2'b00))
                                begin
                                    coverage0[58] = 1;  //assertion( 0 == Extract(3, 2, r_in) = True) 58
                                    assert property (coverage0[58]==0);
                                    cont1 = (cont1 - 9'b010101);  //assertion( cont1 = cont1 - 21) 60
                                end
                            else
                                begin
                                    coverage0[59] = 1;  //assertion( 0 == Extract(3, 2, r_in) = False) 59
                                    assert property (coverage0[59]==0);
                                    if ((r_in[3:2] == 2'b01))
                                        begin
                                            coverage0[61] = 1;  //assertion( 1 == Extract(3, 2, r_in) = True) 61
                                            assert property (coverage0[61]==0);
                                            cont1 = (cont1 - 9'b101010);  //assertion( cont1 = cont1 - 42) 63
                                        end
                                    else
                                        begin
                                            coverage0[62] = 1;  //assertion( 1 == Extract(3, 2, r_in) = False) 62
                                            assert property (coverage0[62]==0);
                                            if ((r_in[3:2] == 2'b10))
                                                begin
                                                    coverage0[64] = 1;  //assertion( 2 == Extract(3, 2, r_in) = True) 64
                                                    assert property (coverage0[64]==0);
                                                    cont1 = (cont1 + 9'b111);  //assertion( cont1 = cont1 + 7) 66
                                                end
                                            else
                                                begin
                                                    coverage0[65] = 1;  //assertion( 2 == Extract(3, 2, r_in) = False) 65
                                                    assert property (coverage0[65]==0);
                                                    cont1 = (cont1 + 9'b011100);  //assertion( cont1 = cont1 + 28) 67
                                                end
                                        end
                                end
                            stato = 4'b1000;  //assertion( stato = 8) 68
                        end
                      4'b1000:
                        begin
                            coverage0[69] = 1;  //assertion( 8 == stato = True) 69
                            assert property (coverage0[69]==0);
                            if ((cont1 < 9'sb0))
                                begin
                                    coverage0[70] = 1;  //assertion( 0 > cont1 = True) 70
                                    assert property (coverage0[70]==0);
                                    x_out = cont1_inv[5:0];  //assertion( x_out = Extract(5, 0, cont1_inv)) 72
                                end
                            else
                                begin
                                    coverage0[71] = 1;  //assertion( 0 > cont1 = False) 71
                                    assert property (coverage0[71]==0);
                                    x_out = cont1[5:0];  //assertion( x_out = Extract(5, 0, cont1)) 73
                                end
                            stato = 4'b0001;  //assertion( stato = 1) 74
                        end
                    endcase
                end
        end

endmodule
