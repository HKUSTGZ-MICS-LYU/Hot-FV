//Following code is from line 1
module b12(reset, nl, start, k, nloss, speaker, clock, __obs);

    input               clock;
    input               reset;
    input               start;
    input         [3:0] k;
    output              nloss;
    output        [3:0] nl;
    output              speaker;
    input               __obs;

    reg nloss = 1'b0;
    reg [3:0] nl = 4'b0;
    reg speaker = 1'b0;
    reg  [1:0]  memory [0:31];
    reg  wr = 1'b0;
    reg  [4:0]  address = 5'b0;
    reg  [1:0]  data_in = 2'b0;
    reg  [1:0]  data_out = 2'b0;
    reg  [1:0]  num = 2'b0;
    reg  [2:0]  sound = 3'b0;
    reg  play = 1'b0;
    reg  s = 1'b0;
    reg  [2:0]  counter = 3'b0;
    reg  [1:0]  count = 2'b0;
    reg  [4:0]  gamma = 5'b0;
    reg  [1:0]  ind = 2'b0;
    reg  [4:0]  scan = 5'b0;
    reg  [4:0]  max = 5'b0;
    reg  [5:0]  timebase = 6'b0;
    reg  [5:0]  count2 = 6'b0;
    reg [499:0] coverage0 = 500'b0;

    //Following code is from line 34
        always @(posedge clock) begin
            if (reset)
                    begin
                        coverage0[0] = 1;  //assertion( 0 != reset = True) 0
                        s = 0;  //assertion( s = 0) 2
                        speaker <= 0;    //assertion( speaker = 0) 3
                        counter = 0;  //assertion( counter = 0) 4
                    end
            else
                    begin
                        coverage0[1] = 1;  //assertion( 0 != reset = False) 1
                        if (play)
                                begin
                                    coverage0[5] = 1;  //assertion( 0 != play = True) 5
                                    case (sound)
                                      0:
                                            begin
                                                coverage0[7] = 1;  //assertion( sound == ZeroExt(2, 0) = True) 7
                                                if ((counter > 2))
                                                        begin
                                                            coverage0[8] = 1;  //assertion( UGT(counter, ZeroExt(1, 2)) = True) 8
                                                            s = (~s);  //assertion( s = ~s) 10
                                                            counter = 0;  //assertion( counter = 0) 11
                                                            speaker <= s;    //assertion( speaker = s) 12
                                                        end
                                                else
                                                    begin
                                                        coverage0[9] = 1;  //assertion( UGT(counter, ZeroExt(1, 2)) = False) 9
                                                        counter = (counter + 1);  //assertion( counter = counter + ZeroExt(2, 1)) 13
                                                    end
                                            end
                                      1:
                                            begin
                                                coverage0[14] = 1;  //assertion( sound == ZeroExt(2, 1) = True) 14
                                                if ((counter > 3))
                                                        begin
                                                            coverage0[15] = 1;  //assertion( UGT(counter, ZeroExt(1, 3)) = True) 15
                                                            s = (~s);  //assertion( s = ~s) 17
                                                            speaker <= s;    //assertion( speaker = s) 18
                                                            counter = 0;  //assertion( counter = 0) 19
                                                        end
                                                else
                                                    begin
                                                        coverage0[16] = 1;  //assertion( UGT(counter, ZeroExt(1, 3)) = False) 16
                                                        counter = (counter + 1);  //assertion( counter = counter + ZeroExt(2, 1)) 20
                                                    end
                                            end
                                      2:
                                            begin
                                                coverage0[21] = 1;  //assertion( sound == ZeroExt(1, 2) = True) 21
                                                if ((counter > 4))
                                                        begin
                                                            coverage0[22] = 1;  //assertion( UGT(counter, 4) = True) 22
                                                            s = (~s);  //assertion( s = ~s) 24
                                                            speaker <= s;    //assertion( speaker = s) 25
                                                            counter = 0;  //assertion( counter = 0) 26
                                                        end
                                                else
                                                    begin
                                                        coverage0[23] = 1;  //assertion( UGT(counter, 4) = False) 23
                                                        counter = (counter + 1);  //assertion( counter = counter + ZeroExt(2, 1)) 27
                                                    end
                                            end
                                      3:
                                            begin
                                                coverage0[28] = 1;  //assertion( sound == ZeroExt(1, 3) = True) 28
                                                if ((counter > 5))
                                                        begin
                                                            coverage0[29] = 1;  //assertion( UGT(counter, 5) = True) 29
                                                            s = (~s);  //assertion( s = ~s) 31
                                                            speaker <= s;    //assertion( speaker = s) 32
                                                            counter = 0;  //assertion( counter = 0) 33
                                                        end
                                                else
                                                    begin
                                                        coverage0[30] = 1;  //assertion( UGT(counter, 5) = False) 30
                                                        counter = (counter + 1);  //assertion( counter = counter + ZeroExt(2, 1)) 34
                                                    end
                                            end
                                      4:
                                            begin
                                                coverage0[35] = 1;  //assertion( 4 == sound = True) 35
                                                if ((counter > 6))
                                                        begin
                                                            coverage0[36] = 1;  //assertion( UGT(counter, 6) = True) 36
                                                            s = (~s);  //assertion( s = ~s) 38
                                                            speaker <= s;    //assertion( speaker = s) 39
                                                            counter = 0;  //assertion( counter = 0) 40
                                                        end
                                                else
                                                    begin
                                                        coverage0[37] = 1;  //assertion( UGT(counter, 6) = False) 37
                                                        counter = (counter + 1);  //assertion( counter = counter + ZeroExt(2, 1)) 41
                                                    end
                                            end
                                      5:
                                            begin
                                                coverage0[42] = 1;  //assertion( 5 == sound = True) 42
                                                if ((counter > 1))
                                                        begin
                                                            coverage0[43] = 1;  //assertion( UGT(counter, ZeroExt(2, 1)) = True) 43
                                                            s = (~s);  //assertion( s = ~s) 45
                                                            speaker <= s;    //assertion( speaker = s) 46
                                                            counter = 0;  //assertion( counter = 0) 47
                                                        end
                                                else
                                                    begin
                                                        coverage0[44] = 1;  //assertion( UGT(counter, ZeroExt(2, 1)) = False) 44
                                                        counter = (counter + 1);  //assertion( counter = counter + ZeroExt(2, 1)) 48
                                                    end
                                            end
                                      default:
                                        begin
                                            coverage0[49] = 1;  //assertion( If(sound != ZeroExt(2, 0) == True, 1, 0) & If(sound != ZeroExt(2, 1) == True, 1, 0) & If(sound != ZeroExt(1, 2) == True, 1, 0) & If(sound != ZeroExt(1, 3) == True, 1, 0) & If(4 != sound == True, 1, 0) & If(5 != sound == True, 1, 0) = True) 49
                                            counter = 0;  //assertion( counter = 0) 50
                                        end
                                    endcase
                                end
                        else
                                begin
                                    coverage0[6] = 1;  //assertion( 0 != play = False) 6
                                    counter = 0;  //assertion( counter = 0) 51
                                    speaker <= 0;    //assertion( speaker = 0) 52
                                end
                    end
        end

    //Following code is from line 133
        always @(posedge clock) begin
            if (reset)
                    begin
                        coverage0[53] = 1;  //assertion( 0 != reset = True) 53
                        count = 0;  //assertion( count = 0) 55
                        num <= 0;    //assertion( num = 0) 56
                    end
            else
                    begin
                        coverage0[54] = 1;  //assertion( 0 != reset = False) 54
                        if ((count == 2'b11))
                            begin
                                coverage0[57] = 1;  //assertion( 3 == count = True) 57
                                count = 0;  //assertion( count = 0) 59
                            end
                        else
                            begin
                                coverage0[58] = 1;  //assertion( 3 == count = False) 58
                                count = (count + 1);  //assertion( count = count + ZeroExt(1, 1)) 60
                            end
                        num <= count;    //assertion( num = count) 61
                    end
        end

    //Following code is from line 155
        always @(posedge clock) begin
            if (reset)
                    begin
                        coverage0[62] = 1;  //assertion( 0 != reset = True) 62
                        data_out <= 0;    //assertion( data_out = 0) 64
                        memory[0] = 0;  //assertion( memory[0] = 0) 65
                        memory[1] = 0;  //assertion( memory[1] = 0) 66
                        memory[2] = 0;  //assertion( memory[2] = 0) 67
                        memory[3] = 0;  //assertion( memory[3] = 0) 68
                        memory[4] = 0;  //assertion( memory[4] = 0) 69
                        memory[5] = 0;  //assertion( memory[5] = 0) 70
                        memory[6] = 0;  //assertion( memory[6] = 0) 71
                        memory[7] = 0;  //assertion( memory[7] = 0) 72
                        memory[8] = 0;  //assertion( memory[8] = 0) 73
                        memory[9] = 0;  //assertion( memory[9] = 0) 74
                        memory[10] = 0;  //assertion( memory[10] = 0) 75
                        memory[11] = 0;  //assertion( memory[11] = 0) 76
                        memory[12] = 0;  //assertion( memory[12] = 0) 77
                        memory[13] = 0;  //assertion( memory[13] = 0) 78
                        memory[14] = 0;  //assertion( memory[14] = 0) 79
                        memory[15] = 0;  //assertion( memory[15] = 0) 80
                        memory[16] = 0;  //assertion( memory[16] = 0) 81
                        memory[17] = 0;  //assertion( memory[17] = 0) 82
                        memory[18] = 0;  //assertion( memory[18] = 0) 83
                        memory[19] = 0;  //assertion( memory[19] = 0) 84
                        memory[20] = 0;  //assertion( memory[20] = 0) 85
                        memory[21] = 0;  //assertion( memory[21] = 0) 86
                        memory[22] = 0;  //assertion( memory[22] = 0) 87
                        memory[23] = 0;  //assertion( memory[23] = 0) 88
                        memory[24] = 0;  //assertion( memory[24] = 0) 89
                        memory[25] = 0;  //assertion( memory[25] = 0) 90
                        memory[26] = 0;  //assertion( memory[26] = 0) 91
                        memory[27] = 0;  //assertion( memory[27] = 0) 92
                        memory[28] = 0;  //assertion( memory[28] = 0) 93
                        memory[29] = 0;  //assertion( memory[29] = 0) 94
                        memory[30] = 0;  //assertion( memory[30] = 0) 95
                        memory[31] = 0;  //assertion( memory[31] = 0) 96
                    end
            else
                    begin
                        coverage0[63] = 1;  //assertion( 0 != reset = False) 63
                        data_out <= memory[address];    //assertion( data_out = memory[address]) 97
                        if (wr)
                            begin
                                coverage0[98] = 1;  //assertion( 0 != wr = True) 98
                                memory[address] = data_in;  //assertion( memory[address] = data_in) 100
                            end
                        else
                                coverage0[99] = 1;  //assertion( 0 != wr = False) 99
                    end
        end

    //Following code is from line 217
        always @(posedge clock) begin
            if (reset)
                    begin
                        coverage0[101] = 1;  //assertion( 0 != reset = True) 101
                        nloss <= 'b0;    //assertion( nloss = 0) 103
                        nl <= 'b0;    //assertion( nl = 0) 104
                        play <= 'b0;    //assertion( play = 0) 105
                        wr <= 'b0;    //assertion( wr = 0) 106
                        scan = 'b0;  //assertion( scan = 0) 107
                        max = 'b0;  //assertion( max = 0) 108
                        ind = 'b0;  //assertion( ind = 0) 109
                        timebase = 'b0;  //assertion( timebase = 0) 110
                        count2 = 'b0;  //assertion( count2 = 0) 111
                        sound <= 'b0;    //assertion( sound = 0) 112
                        address <= 'b0;    //assertion( address = 0) 113
                        data_in <= 'b0;    //assertion( data_in = 0) 114
                        gamma = 'b0;  //assertion( gamma = 0) 115
                    end
            else
                    begin
                        coverage0[102] = 1;  //assertion( 0 != reset = False) 102
                        if ((start == 1'b1))
                            begin
                                coverage0[116] = 1;  //assertion( 1 == start = True) 116
                                gamma = 1;  //assertion( gamma = 1) 118
                            end
                        else
                            begin
                                coverage0[117] = 1;  //assertion( 1 == start = False) 117
                                gamma = gamma;  //assertion( gamma = gamma) 119
                            end
                        case (gamma)
                          0:
                                begin
                                    coverage0[120] = 1;  //assertion( gamma == ZeroExt(4, 0) = True) 120
                                    gamma = 'b0;  //assertion( gamma = 0) 121
                                end
                          1:
                                begin
                                    coverage0[122] = 1;  //assertion( gamma == ZeroExt(4, 1) = True) 122
                                    nloss <= 'b0;    //assertion( nloss = 0) 123
                                    nl <= 'b0;    //assertion( nl = 0) 124
                                    play <= 'b0;    //assertion( play = 0) 125
                                    wr <= 'b0;    //assertion( wr = 0) 126
                                    max = 'b0;  //assertion( max = 0) 127
                                    timebase = 33;  //assertion( timebase = 33) 128
                                    gamma = 2;  //assertion( gamma = 2) 129
                                end
                          2:
                                begin
                                    coverage0[130] = 1;  //assertion( gamma == ZeroExt(3, 2) = True) 130
                                    scan = 'b0;  //assertion( scan = 0) 131
                                    wr <= 1;    //assertion( wr = 1) 132
                                    address <= max;    //assertion( address = max) 133
                                    data_in <= num;    //assertion( data_in = num) 134
                                    gamma = 3;  //assertion( gamma = 3) 135
                                end
                          3:
                                begin
                                    coverage0[136] = 1;  //assertion( gamma == ZeroExt(3, 3) = True) 136
                                    wr <= 'b0;    //assertion( wr = 0) 137
                                    address <= scan;    //assertion( address = scan) 138
                                    gamma = 4;  //assertion( gamma = 4) 139
                                end
                          4:
                                begin
                                    coverage0[140] = 1;  //assertion( gamma == ZeroExt(2, 4) = True) 140
                                    gamma = 5;  //assertion( gamma = 5) 141
                                end
                          5:
                                begin
                                    coverage0[142] = 1;  //assertion( gamma == ZeroExt(2, 5) = True) 142
                                    nl[data_out] <= 1;    //assertion( arr_nl_1[data_out] = 1) 143
                                    count2 = timebase;  //assertion( count2 = timebase) 144
                                    play <= 1;    //assertion( play = 1) 145
                                    sound <= {1'b0, data_out};    //assertion( sound = Concat(0, data_out)) 146
                                    gamma = 6;  //assertion( gamma = 6) 147
                                end
                          6:
                                begin
                                    coverage0[148] = 1;  //assertion( gamma == ZeroExt(2, 6) = True) 148
                                    if ((count2 == 'b0))
                                            begin
                                                coverage0[149] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 149
                                                nl <= 0;    //assertion( nl = 0) 151
                                                play <= 0;    //assertion( play = 0) 152
                                                count2 = timebase;  //assertion( count2 = timebase) 153
                                                gamma = 7;  //assertion( gamma = 7) 154
                                            end
                                    else
                                            begin
                                                coverage0[150] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 150
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 155
                                                gamma = 6;  //assertion( gamma = 6) 156
                                            end
                                end
                          7:
                                begin
                                    coverage0[157] = 1;  //assertion( gamma == ZeroExt(2, 7) = True) 157
                                    if ((count2 == 0))
                                            begin
                                                coverage0[158] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 158
                                                if ((scan != max))
                                                        begin
                                                            coverage0[160] = 1;  //assertion( scan != max = True) 160
                                                            scan = (scan + 1);  //assertion( scan = scan + ZeroExt(4, 1)) 162
                                                            gamma = 3;  //assertion( gamma = 3) 163
                                                        end
                                                else
                                                        begin
                                                            coverage0[161] = 1;  //assertion( scan != max = False) 161
                                                            scan = 0;  //assertion( scan = 0) 164
                                                            gamma = 8;  //assertion( gamma = 8) 165
                                                        end
                                            end
                                    else
                                            begin
                                                coverage0[159] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 159
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 166
                                                gamma = 7;  //assertion( gamma = 7) 167
                                            end
                                end
                          8:
                                begin
                                    coverage0[168] = 1;  //assertion( gamma == ZeroExt(1, 8) = True) 168
                                    count2 = 33;  //assertion( count2 = 33) 169
                                    address <= scan;    //assertion( address = scan) 170
                                    gamma = 9;  //assertion( gamma = 9) 171
                                end
                          9:
                                begin
                                    coverage0[172] = 1;  //assertion( gamma == ZeroExt(1, 9) = True) 172
                                    gamma = 10;  //assertion( gamma = 10) 173
                                end
                          10:
                                begin
                                    coverage0[174] = 1;  //assertion( gamma == ZeroExt(1, 10) = True) 174
                                    if ((count2 == 0))
                                            begin
                                                coverage0[175] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 175
                                                nloss <= 1;    //assertion( nloss = 1) 177
                                                max = 0;  //assertion( max = 0) 178
                                                gamma = 17;  //assertion( gamma = 17) 179
                                            end
                                    else
                                            begin
                                                coverage0[176] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 176
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 180
                                                if ((k[0] == 1'b1))
                                                        begin
                                                            coverage0[181] = 1;  //assertion( 1 == Extract(0, 0, k) = True) 181
                                                            ind = 0;  //assertion( ind = 0) 183
                                                            sound <= 0;    //assertion( sound = 0) 184
                                                            play <= 1;    //assertion( play = 1) 185
                                                            count2 = timebase;  //assertion( count2 = timebase) 186
                                                            if ((data_out == 0))
                                                                begin
                                                                    coverage0[187] = 1;  //assertion( data_out == ZeroExt(1, 0) = True) 187
                                                                    gamma = 11;  //assertion( gamma = 11) 189
                                                                end
                                                            else
                                                                    begin
                                                                        coverage0[188] = 1;  //assertion( data_out == ZeroExt(1, 0) = False) 188
                                                                        nloss <= 1;    //assertion( nloss = 1) 190
                                                                        gamma = 14;  //assertion( gamma = 14) 191
                                                                    end
                                                        end
                                                else
                                                    begin
                                                        coverage0[182] = 1;  //assertion( 1 == Extract(0, 0, k) = False) 182
                                                        if ((k[1] == 1'b1))
                                                                begin
                                                                    coverage0[192] = 1;  //assertion( 1 == Extract(1, 1, k) = True) 192
                                                                    ind = 1;  //assertion( ind = 1) 194
                                                                    sound <= 1;    //assertion( sound = 1) 195
                                                                    play <= 1;    //assertion( play = 1) 196
                                                                    count2 = timebase;  //assertion( count2 = timebase) 197
                                                                    if ((data_out == 1))
                                                                        begin
                                                                            coverage0[198] = 1;  //assertion( data_out == ZeroExt(1, 1) = True) 198
                                                                            gamma = 11;  //assertion( gamma = 11) 200
                                                                        end
                                                                    else
                                                                            begin
                                                                                coverage0[199] = 1;  //assertion( data_out == ZeroExt(1, 1) = False) 199
                                                                                nloss <= 1;    //assertion( nloss = 1) 201
                                                                                gamma = 14;  //assertion( gamma = 14) 202
                                                                            end
                                                                end
                                                        else
                                                            begin
                                                                coverage0[193] = 1;  //assertion( 1 == Extract(1, 1, k) = False) 193
                                                                if ((k[2] == 1'b1))
                                                                        begin
                                                                            coverage0[203] = 1;  //assertion( 1 == Extract(2, 2, k) = True) 203
                                                                            ind = 2;  //assertion( ind = 2) 205
                                                                            sound <= 2;    //assertion( sound = 2) 206
                                                                            play <= 1;    //assertion( play = 1) 207
                                                                            count2 = timebase;  //assertion( count2 = timebase) 208
                                                                            if ((data_out == 2))
                                                                                begin
                                                                                    coverage0[209] = 1;  //assertion( 2 == data_out = True) 209
                                                                                    gamma = 11;  //assertion( gamma = 11) 211
                                                                                end
                                                                            else
                                                                                    begin
                                                                                        coverage0[210] = 1;  //assertion( 2 == data_out = False) 210
                                                                                        nloss <= 1;    //assertion( nloss = 1) 212
                                                                                        gamma = 14;  //assertion( gamma = 14) 213
                                                                                    end
                                                                        end
                                                                else
                                                                    begin
                                                                        coverage0[204] = 1;  //assertion( 1 == Extract(2, 2, k) = False) 204
                                                                        if ((k[3] == 1'b1))
                                                                                begin
                                                                                    coverage0[214] = 1;  //assertion( 1 == Extract(3, 3, k) = True) 214
                                                                                    ind = 3;  //assertion( ind = 3) 216
                                                                                    sound <= 3;    //assertion( sound = 3) 217
                                                                                    play <= 1;    //assertion( play = 1) 218
                                                                                    count2 = timebase;  //assertion( count2 = timebase) 219
                                                                                    if ((data_out == 3))
                                                                                        begin
                                                                                            coverage0[220] = 1;  //assertion( 3 == data_out = True) 220
                                                                                            gamma = 11;  //assertion( gamma = 11) 222
                                                                                        end
                                                                                    else
                                                                                            begin
                                                                                                coverage0[221] = 1;  //assertion( 3 == data_out = False) 221
                                                                                                nloss <= 1;    //assertion( nloss = 1) 223
                                                                                                gamma = 14;  //assertion( gamma = 14) 224
                                                                                            end
                                                                                end
                                                                        else
                                                                            begin
                                                                                coverage0[215] = 1;  //assertion( 1 == Extract(3, 3, k) = False) 215
                                                                                gamma = 10;  //assertion( gamma = 10) 225
                                                                            end
                                                                    end
                                                            end
                                                    end
                                            end
                                end
                          11:
                                begin
                                    coverage0[226] = 1;  //assertion( gamma == ZeroExt(1, 11) = True) 226
                                    nl[ind] <= 1;    //assertion( arr_nl_1[ind] = 1) 227
                                    gamma = 12;  //assertion( gamma = 12) 228
                                end
                          12:
                                begin
                                    coverage0[229] = 1;  //assertion( gamma == ZeroExt(1, 12) = True) 229
                                    if ((count2 == 0))
                                            begin
                                                coverage0[230] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 230
                                                nl <= 0;    //assertion( nl = 0) 232
                                                play <= 0;    //assertion( play = 0) 233
                                                count2 = timebase;  //assertion( count2 = timebase) 234
                                                gamma = 13;  //assertion( gamma = 13) 235
                                            end
                                    else
                                            begin
                                                coverage0[231] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 231
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 236
                                                gamma = 12;  //assertion( gamma = 12) 237
                                            end
                                end
                          13:
                                begin
                                    coverage0[238] = 1;  //assertion( gamma == ZeroExt(1, 13) = True) 238
                                    if ((count2 == 0))
                                            begin
                                                coverage0[239] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 239
                                                if ((scan != max))
                                                        begin
                                                            coverage0[241] = 1;  //assertion( scan != max = True) 241
                                                            scan = (scan + 1);  //assertion( scan = scan + ZeroExt(4, 1)) 243
                                                            gamma = 8;  //assertion( gamma = 8) 244
                                                        end
                                                else
                                                    begin
                                                        coverage0[242] = 1;  //assertion( scan != max = False) 242
                                                        if ((max != (32 - 1)))
                                                                begin
                                                                    coverage0[245] = 1;  //assertion( ZeroExt(1, max) != 32 - ZeroExt(5, 1) = True) 245
                                                                    max = (max + 1);  //assertion( max = max + ZeroExt(4, 1)) 247
                                                                    timebase = (timebase - 1);  //assertion( timebase = timebase - ZeroExt(5, 1)) 248
                                                                    gamma = 2;  //assertion( gamma = 2) 249
                                                                end
                                                        else
                                                                begin
                                                                    coverage0[246] = 1;  //assertion( ZeroExt(1, max) != 32 - ZeroExt(5, 1) = False) 246
                                                                    play <= 1;    //assertion( play = 1) 250
                                                                    sound <= 4;    //assertion( sound = 4) 251
                                                                    count2 = 8;  //assertion( count2 = 8) 252
                                                                    gamma = 24;  //assertion( gamma = 24) 253
                                                                end
                                                    end
                                            end
                                    else
                                            begin
                                                coverage0[240] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 240
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 254
                                                gamma = 13;  //assertion( gamma = 13) 255
                                            end
                                end
                          14:
                                begin
                                    coverage0[256] = 1;  //assertion( gamma == ZeroExt(1, 14) = True) 256
                                    nl[ind] <= 1;    //assertion( arr_nl_1[ind] = 1) 257
                                    gamma = 15;  //assertion( gamma = 15) 258
                                end
                          15:
                                begin
                                    coverage0[259] = 1;  //assertion( gamma == ZeroExt(1, 15) = True) 259
                                    if ((count2 == 0))
                                            begin
                                                coverage0[260] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 260
                                                nl <= 0;    //assertion( nl = 0) 262
                                                play <= 0;    //assertion( play = 0) 263
                                                count2 = timebase;  //assertion( count2 = timebase) 264
                                                gamma = 16;  //assertion( gamma = 16) 265
                                            end
                                    else
                                            begin
                                                coverage0[261] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 261
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 266
                                                gamma = 15;  //assertion( gamma = 15) 267
                                            end
                                end
                          16:
                                begin
                                    coverage0[268] = 1;  //assertion( 16 == gamma = True) 268
                                    if ((count2 == 0))
                                            begin
                                                coverage0[269] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 269
                                                max = 0;  //assertion( max = 0) 271
                                                gamma = 17;  //assertion( gamma = 17) 272
                                            end
                                    else
                                            begin
                                                coverage0[270] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 270
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 273
                                                gamma = 16;  //assertion( gamma = 16) 274
                                            end
                                end
                          17:
                                begin
                                    coverage0[275] = 1;  //assertion( 17 == gamma = True) 275
                                    address <= max;    //assertion( address = max) 276
                                    gamma = 18;  //assertion( gamma = 18) 277
                                end
                          18:
                                begin
                                    coverage0[278] = 1;  //assertion( 18 == gamma = True) 278
                                    gamma = 19;  //assertion( gamma = 19) 279
                                end
                          19:
                                begin
                                    coverage0[280] = 1;  //assertion( 19 == gamma = True) 280
                                    nl[data_out] <= 1;    //assertion( arr_nl_1[data_out] = 1) 281
                                    play <= 1;    //assertion( play = 1) 282
                                    sound <= {1'b0, data_out};    //assertion( sound = Concat(0, data_out)) 283
                                    count2 = timebase;  //assertion( count2 = timebase) 284
                                    gamma = 20;  //assertion( gamma = 20) 285
                                end
                          20:
                                begin
                                    coverage0[286] = 1;  //assertion( 20 == gamma = True) 286
                                    if ((count2 == 0))
                                            begin
                                                coverage0[287] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 287
                                                nl <= 0;    //assertion( nl = 0) 289
                                                play <= 0;    //assertion( play = 0) 290
                                                count2 = timebase;  //assertion( count2 = timebase) 291
                                                gamma = 21;  //assertion( gamma = 21) 292
                                            end
                                    else
                                            begin
                                                coverage0[288] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 288
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 293
                                                gamma = 20;  //assertion( gamma = 20) 294
                                            end
                                end
                          21:
                                begin
                                    coverage0[295] = 1;  //assertion( 21 == gamma = True) 295
                                    if ((count2 == 0))
                                            begin
                                                coverage0[296] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 296
                                                if ((max != scan))
                                                        begin
                                                            coverage0[298] = 1;  //assertion( max != scan = True) 298
                                                            max = (max + 1);  //assertion( max = max + ZeroExt(4, 1)) 300
                                                            gamma = 17;  //assertion( gamma = 17) 301
                                                        end
                                                else
                                                        begin
                                                            coverage0[299] = 1;  //assertion( max != scan = False) 299
                                                            nl[data_out] <= 1;    //assertion( arr_nl_1[data_out] = 1) 302
                                                            play <= 1;    //assertion( play = 1) 303
                                                            sound <= 5;    //assertion( sound = 5) 304
                                                            count2 = 8;  //assertion( count2 = 8) 305
                                                            gamma = 22;  //assertion( gamma = 22) 306
                                                        end
                                            end
                                    else
                                            begin
                                                coverage0[297] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 297
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 307
                                                gamma = 21;  //assertion( gamma = 21) 308
                                            end
                                end
                          22:
                                begin
                                    coverage0[309] = 1;  //assertion( 22 == gamma = True) 309
                                    if ((count2 == 0))
                                            begin
                                                coverage0[310] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 310
                                                nl <= 0;    //assertion( nl = 0) 312
                                                play <= 0;    //assertion( play = 0) 313
                                                count2 = 8;  //assertion( count2 = 8) 314
                                                gamma = 23;  //assertion( gamma = 23) 315
                                            end
                                    else
                                            begin
                                                coverage0[311] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 311
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 316
                                                gamma = 22;  //assertion( gamma = 22) 317
                                            end
                                end
                          23:
                                begin
                                    coverage0[318] = 1;  //assertion( 23 == gamma = True) 318
                                    if ((count2 == 0))
                                            begin
                                                coverage0[319] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 319
                                                nl[data_out] <= 1;    //assertion( arr_nl_1[data_out] = 1) 321
                                                play <= 1;    //assertion( play = 1) 322
                                                sound <= 5;    //assertion( sound = 5) 323
                                                count2 = 8;  //assertion( count2 = 8) 324
                                                gamma = 22;  //assertion( gamma = 22) 325
                                            end
                                    else
                                            begin
                                                coverage0[320] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 320
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 326
                                                gamma = 23;  //assertion( gamma = 23) 327
                                            end
                                end
                          24:
                                begin
                                    coverage0[328] = 1;  //assertion( 24 == gamma = True) 328
                                    if ((count2 == 0))
                                            begin
                                                coverage0[329] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 329
                                                nl <= 1;    //assertion( nl = 1) 331
                                                play <= 0;    //assertion( play = 0) 332
                                                count2 = 8;  //assertion( count2 = 8) 333
                                                gamma = 25;  //assertion( gamma = 25) 334
                                            end
                                    else
                                            begin
                                                coverage0[330] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 330
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 335
                                                gamma = 24;  //assertion( gamma = 24) 336
                                            end
                                end
                          25:
                                begin
                                    coverage0[337] = 1;  //assertion( 25 == gamma = True) 337
                                    if ((count2 == 0))
                                            begin
                                                coverage0[338] = 1;  //assertion( count2 == ZeroExt(5, 0) = True) 338
                                                nl <= 0;    //assertion( nl = 0) 340
                                                play <= 1;    //assertion( play = 1) 341
                                                sound <= 4;    //assertion( sound = 4) 342
                                                count2 = 8;  //assertion( count2 = 8) 343
                                                gamma = 24;  //assertion( gamma = 24) 344
                                            end
                                    else
                                            begin
                                                coverage0[339] = 1;  //assertion( count2 == ZeroExt(5, 0) = False) 339
                                                count2 = (count2 - 1);  //assertion( count2 = count2 - ZeroExt(5, 1)) 345
                                                gamma = 25;  //assertion( gamma = 25) 346
                                            end
                                end
                          default:
                            begin
                                coverage0[347] = 1;  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 347
                                gamma = 1;  //assertion( gamma = 1) 348
                            end
                        endcase
                    end
        end
                                assert property (coverage0[0]==0);

                        assert property (coverage0[1]==0);

                                    assert property (coverage0[5]==0);

                                                assert property (coverage0[7]==0);

                                                            assert property (coverage0[8]==0);

                                                        assert property (coverage0[9]==0);

                                                assert property (coverage0[14]==0);

                                                            assert property (coverage0[15]==0);

                                                        assert property (coverage0[16]==0);

                                                assert property (coverage0[21]==0);

                                                            assert property (coverage0[22]==0);

                                                        assert property (coverage0[23]==0);

                                                assert property (coverage0[28]==0);

                                                            assert property (coverage0[29]==0);

                                                        assert property (coverage0[30]==0);

                                                assert property (coverage0[35]==0);

                                                            assert property (coverage0[36]==0);

                                                        assert property (coverage0[37]==0);

                                                assert property (coverage0[42]==0);

                                                            assert property (coverage0[43]==0);

                                                        assert property (coverage0[44]==0);

                                            assert property (coverage0[49]==0);

                                    assert property (coverage0[6]==0);

                        assert property (coverage0[53]==0);

                        assert property (coverage0[54]==0);

                                assert property (coverage0[57]==0);

                                assert property (coverage0[58]==0);

                        assert property (coverage0[62]==0);

                        assert property (coverage0[63]==0);

                                assert property (coverage0[98]==0);

                                assert property (coverage0[99]==0);

                        assert property (coverage0[101]==0);

                        assert property (coverage0[102]==0);

                                assert property (coverage0[116]==0);

                                assert property (coverage0[117]==0);

                                    assert property (coverage0[120]==0);

                                    assert property (coverage0[122]==0);

                                    assert property (coverage0[130]==0);

                                    assert property (coverage0[136]==0);

                                    assert property (coverage0[140]==0);

                                    assert property (coverage0[142]==0);

                                    assert property (coverage0[148]==0);

                                                assert property (coverage0[149]==0);

                                                assert property (coverage0[150]==0);

                                    assert property (coverage0[157]==0);

                                                assert property (coverage0[158]==0);

                                                            assert property (coverage0[160]==0);

                                                            assert property (coverage0[161]==0);

                                                assert property (coverage0[159]==0);

                                    assert property (coverage0[168]==0);

                                    assert property (coverage0[172]==0);

                                    assert property (coverage0[174]==0);

                                                assert property (coverage0[175]==0);

                                                assert property (coverage0[176]==0);

                                                            assert property (coverage0[181]==0);

                                                                    assert property (coverage0[187]==0);

                                                                        assert property (coverage0[188]==0);

                                                        assert property (coverage0[182]==0);

                                                                    assert property (coverage0[192]==0);

                                                                            assert property (coverage0[198]==0);

                                                                                assert property (coverage0[199]==0);

                                                                assert property (coverage0[193]==0);

                                                                            assert property (coverage0[203]==0);

                                                                                    assert property (coverage0[209]==0);

                                                                                        assert property (coverage0[210]==0);

                                                                        assert property (coverage0[204]==0);

                                                                                    assert property (coverage0[214]==0);

                                                                                            assert property (coverage0[220]==0);

                                                                                                assert property (coverage0[221]==0);

                                                                                assert property (coverage0[215]==0);

                                    assert property (coverage0[226]==0);

                                    assert property (coverage0[229]==0);

                                                assert property (coverage0[230]==0);

                                                assert property (coverage0[231]==0);

                                    assert property (coverage0[238]==0);

                                                assert property (coverage0[239]==0);

                                                            assert property (coverage0[241]==0);

                                                        assert property (coverage0[242]==0);

                                                                    assert property (coverage0[245]==0);

                                                                    assert property (coverage0[246]==0);

                                                assert property (coverage0[240]==0);

                                    assert property (coverage0[256]==0);

                                    assert property (coverage0[259]==0);

                                                assert property (coverage0[260]==0);

                                                assert property (coverage0[261]==0);

                                    assert property (coverage0[268]==0);

                                                assert property (coverage0[269]==0);

                                                assert property (coverage0[270]==0);

                                    assert property (coverage0[275]==0);

                                    assert property (coverage0[278]==0);

                                    assert property (coverage0[280]==0);

                                    assert property (coverage0[286]==0);

                                                assert property (coverage0[287]==0);

                                                assert property (coverage0[288]==0);

                                    assert property (coverage0[295]==0);

                                                assert property (coverage0[296]==0);

                                                            assert property (coverage0[298]==0);

                                                            assert property (coverage0[299]==0);

                                                assert property (coverage0[297]==0);

                                    assert property (coverage0[309]==0);

                                                assert property (coverage0[310]==0);

                                                assert property (coverage0[311]==0);

                                    assert property (coverage0[318]==0);

                                                assert property (coverage0[319]==0);

                                                assert property (coverage0[320]==0);

                                    assert property (coverage0[328]==0);

                                                assert property (coverage0[329]==0);

                                                assert property (coverage0[330]==0);

                                    assert property (coverage0[337]==0);

                                                assert property (coverage0[338]==0);

                                                assert property (coverage0[339]==0);

                                assert property (coverage0[347]==0);
                                // assert property (scan==max);

endmodule
