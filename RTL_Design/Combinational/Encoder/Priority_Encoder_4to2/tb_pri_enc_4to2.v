module tb_pri_enc_4to2;

reg  [3:0] I;
wire [1:0] Y;
reg  [1:0] expected;

pri_enc_4to2 DUT (
    .I(I),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_pri_enc_4to2);

    // Test 1
    I = 4'b0001;
    expected = 2'b00;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 2
    I = 4'b0010;
    expected = 2'b01;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 3
    I = 4'b0011;
    expected = 2'b01;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 4
    I = 4'b0100;
    expected = 2'b10;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 5
    I = 4'b0111;
    expected = 2'b10;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 6
    I = 4'b1000;
    expected = 2'b11;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    //Test 7
    I = 4'b1011;
    expected = 2'b11;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    // Test 8
    I = 4'b1111;
    expected = 2'b11;
    #10;
    if (Y == expected)
        $display("PASS: I=%b Y=%b", I, Y);
    else
        $display("FAIL: I=%b Y=%b Expected=%b", I, Y, expected);

    $finish;
end

endmodule