//Following code is from line 1
module b01(clock, overflw, outp, reset, line2, line1);

    input               clock;
    input               line1;
    input               line2;
    input               reset;
    output              outp;
    output              overflw;
    reg outp = 1'b0;
    reg overflw = 1'b0;
    reg  [2:0]  stato = 3'b0;
    reg [999:0] coverage0 = 1000'b0;

    //Following code is from line 15
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    coverage0[0] = 1;  //assertion( 1 == reset = True) 0
                    stato <= 3'b0;  //assertion( stato = 0) 2
                    outp <= 1'b0;  //assertion( outp = 0) 3
                    overflw <= 1'b0;  //assertion( overflw = 0) 4
                end
            else
                begin
                    coverage0[1] = 1;  //assertion( 1 == reset = False) 1
                    case (stato)
                      3'b0:
                        begin
                            coverage0[2] = 1;  //assertion( 0 == stato = True) 5
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                    coverage0[3] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 6
                                    stato <= 3'b100;  //assertion( stato = 4) 8
                                end
                            else
                                begin
                                    coverage0[4] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 7
                                    stato <= 3'b001;  //assertion( stato = 1) 9
                                end
                            outp <= (line1 | line2);  //assertion( outp = line1 | line2) 10
                            overflw <= 1'b0;  //assertion( overflw = 0) 11
                        end
                      3'b011:
                        begin
                            coverage0[5] = 1;  //assertion( 3 == stato = True) 12
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                    coverage0[6] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 13
                                    stato <= 3'b100;  //assertion( stato = 4) 15
                                end
                            else
                                begin
                                    coverage0[7] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 14
                                    stato <= 3'b001;  //assertion( stato = 1) 16
                                end
                            outp <= (line1 | line2);  //assertion( outp = line1 | line2) 17
                            overflw <= 1'b1;  //assertion( overflw = 1) 18
                        end
                      3'b001:
                        begin
                            coverage0[8] = 1;  //assertion( 1 == stato = True) 19
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                    coverage0[9] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 20
                                    stato <= 3'b101;  //assertion( stato = 5) 22
                                end
                            else
                                begin
                                    coverage0[10] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 21
                                    stato <= 3'b010;  //assertion( stato = 2) 23
                                end
                            outp <= (line1 | line2);  //assertion( outp = line1 | line2) 24
                            overflw <= 1'b0;  //assertion( overflw = 0) 25
                        end
                      3'b100:
                        begin
                            coverage0[11] = 1;  //assertion( 4 == stato = True) 26
                            if (((line1 == 1'b1) || (line2 == 1'b1)))
                                begin
                                    coverage0[12] = 1;  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 27
                                    stato <= 3'b101;  //assertion( stato = 5) 29
                                end
                            else
                                begin
                                    coverage0[13] = 1;  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 28
                                    stato <= 3'b010;  //assertion( stato = 2) 30
                                end
                            outp <= (~(line1 ^ line2));  //assertion( outp = ~(line1 ^ line2)) 31
                            overflw <= 1'b0;  //assertion( overflw = 0) 32
                        end
                      3'b010:
                        begin
                            coverage0[14] = 1;  //assertion( 2 == stato = True) 33
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                    coverage0[15] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 34
                                    stato <= 3'b111;  //assertion( stato = 7) 36
                                end
                            else
                                begin
                                    coverage0[16] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 35
                                    stato <= 3'b110;  //assertion( stato = 6) 37
                                end
                            outp <= (line1 | line2);  //assertion( outp = line1 | line2) 38
                            overflw <= 1'b0;  //assertion( overflw = 0) 39
                        end
                      3'b101:
                        begin
                            coverage0[17] = 1;  //assertion( 5 == stato = True) 40
                            if (((line1 == 1'b1) || (line2 == 1'b1)))
                                begin
                                    coverage0[18] = 1;  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 41
                                    stato <= 3'b111;  //assertion( stato = 7) 43
                                end
                            else
                                begin
                                    coverage0[19] = 1;  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 42
                                    stato <= 3'b110;  //assertion( stato = 6) 44
                                end
                            outp <= (~(line1 | line2));  //assertion( outp = ~(line1 | line2)) 45
                            overflw <= 1'b0;  //assertion( overflw = 0) 46
                        end
                      3'b110:
                        begin
                            coverage0[20] = 1;  //assertion( 6 == stato = True) 47
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                    coverage0[21] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 48
                                    stato <= 3'b011;  //assertion( stato = 3) 50
                                end
                            else
                                begin
                                    coverage0[22] = 1;  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 49
                                    stato <= 3'b0;  //assertion( stato = 0) 51
                                end
                            outp <= (line1 | line2);  //assertion( outp = line1 | line2) 52
                            overflw <= 1'b0;  //assertion( overflw = 0) 53
                        end
                      3'b111:
                        begin
                            coverage0[23] = 1;  //assertion( 7 == stato = True) 54
                            if (((line1 == 1'b1) || (line2 == 1'b1)))
                                begin
                                    coverage0[24] = 1;  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 55
                                    stato <= 3'b011;  //assertion( stato = 3) 57
                                end
                            else
                                begin
                                    coverage0[25] = 1;  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 56
                                    stato <= 3'b000;  //assertion( stato = 0) 58
                                end
                            outp <= (~(line1 | line2));  //assertion( outp = ~(line1 | line2)) 59
                            overflw <= 1'b0;  //assertion( overflw = 0) 60
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

endmodule
