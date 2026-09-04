module tb_Decoder_2to4;
reg [1:0] I;
wire [3:0] Y;

reg [3:0] expected;

Decoder_2to4 DUT(
    .I(I),
    .Y(Y)
);

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_Decoder_2to4);

    //Test 1
    I = 2'b00;
    expected = 4'b0001;
    #10;
    if (Y == expected)
    $display("PASS: I=%b Y=%b ", I, Y);
    else
    $display("FAIL: I=%b Y=%b  Expected_Y=%b", I, Y, expected,);

    // Test 2
    I = 2'b01;
    expected = 4'b0010;
    #10;
        if (Y == expected)
    $display("PASS: I=%b Y=%b ", I, Y);
    else
    $display("FAIL: I=%b Y=%b  Expected_Y=%b", I, Y, expected,);

    // Test 3
    I = 2'b10;
    expected = 4'b0100;
    #10;
         if (Y == expected)
    $display("PASS: I=%b Y=%b ", I, Y);
    else
    $display("FAIL: I=%b Y=%b  Expected_Y=%b", I, Y, expected,);

    //Test 4
    I = 2'b11;
    expected = 4'b1000;
    #10;
        if (Y == expected)
    $display("PASS: I=%b Y=%b ", I, Y);
    else
    $display("FAIL: I=%b Y=%b  Expected_Y=%b", I, Y, expected,);

    $finish;
end
endmodule