module tb_Priority_Encoder_4to2_using_Valid_output;
reg [3:0] I;
wire [1:0] Y;
wire V;

reg  [1:0] expected;
reg expected_V;

Priority_Encoder_4to2_using_Valid_output DUT (
    .I(I),
    .Y(Y),
    .V(V)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_Priority_Encoder_4to2_using_Valid_output);


    // Initial Test
    I = 4'b0000;
    expected = 2'b00;
    expected_V = 1'b0;
    #10;
    if (Y == expected && V == expected_V)
    $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
    $display("FAIL: I=%b Y=%b V=%b Expected_Y=%b Expected_V=%b",
             I, Y, V, expected, expected_V);

    // Test 1
    I = 4'b0001;
    expected = 2'b00;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 2
    I = 4'b0010;
    expected = 2'b01;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 3
    I = 4'b0011;
    expected = 2'b01;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 4
    I = 4'b0100;
    expected = 2'b10;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 5
    I = 4'b0111;
    expected = 2'b10;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 6
    I = 4'b1000;
    expected = 2'b11;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 7
    I = 4'b1011;
    expected = 2'b11;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        // Test 8
    I = 4'b1111;
    expected = 2'b11;
    expected_V = 1'b1;
    #10;
    if (Y == expected && V == expected_V)
        $display("PASS: I=%b Y=%b V=%b", I, Y, V);
    else
        $display("FAIL: I=%b Y=%b Expected=%b Expected_V=%b", I, Y, expected, expected_V);

        $finish;
end
endmodule
