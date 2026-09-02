module tb_encoder_4to2;

reg  [3:0] I;
wire [1:0] Y;
reg  [1:0] expected;

encoder_4to2 DUT (
    .I(I),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_encoder_4to2);

    // Test 1
    I = 4'b0001;
    expected = 2'b00;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 2
    I = 4'b0010;
    expected = 2'b01;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 3
    I = 4'b0100;
    expected = 2'b10;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 4
    I = 4'b1000;
    expected = 2'b11;
    #1;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    $finish;
end

endmodule