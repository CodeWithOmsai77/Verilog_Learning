module tb_encoder_8to3;

reg  [7:0] I;
wire [2:0] Y;
reg  [2:0] expected;

encoder_8to3 DUT (
    .I(I),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_encoder_8to3);

    I = 8'b00000001;
    expected = 3'b000;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b00000010;
    expected = 3'b001;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b00000100;
    expected = 3'b010;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b00001000;
    expected = 3'b011;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b00010000;
    expected = 3'b100;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b00100000;
    expected = 3'b101;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b01000000;
    expected = 3'b110;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 I = 8'b10000000;
    expected = 3'b111;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    #9 $finish;
end

endmodule