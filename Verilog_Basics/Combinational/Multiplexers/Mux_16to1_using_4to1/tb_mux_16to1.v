module tb_mux_16to1;

reg [15:0] I;
reg [3:0] S;
wire Y;

reg expected;

mux_16to1 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

integer i;

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux_16to1);

    for (i = 0; i < 16; i = i + 1) begin

        // Set all inputs to 0
        I = '0;

        // Select current input
        S = i;

        #10;

        // Expected output should be the selected input
        expected = I[S];

        // Compare actual output with expected output
        if (Y == expected)
            $display("PASS: S=%d, I=%b, Y=%b", S, I, Y);
        else
            $display("FAIL: S=%d, I=%b, Expected=%b, Actual=%b",
                     S, I, expected, Y);

        // Set the currently selected input to 1
        I[i] = 1'b1;

        #10;

        // Calculate expected output again
        expected = I[S];

        // Check the output
        if (Y == expected)
            $display("PASS: S=%d, I=%b, Y=%b", S, I, Y);
        else
            $display("FAIL: S=%d, I=%b, Expected=%b, Actual=%b",
                     S, I, expected, Y);

    end

    $finish;

end

endmodule