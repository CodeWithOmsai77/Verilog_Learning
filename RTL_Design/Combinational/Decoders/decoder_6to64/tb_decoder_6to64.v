module tb_decoder_6to64;
reg [5:0] I;
wire [63:0] Y;
integer i;
reg [63:0] expected;

decoder_6to64 DUT (
    .I(I),
    .Y(Y)
);


initial begin
    $dumpfile ("dump.vcd");
    $dumpvars (0, tb_decoder_6to64);
    
    for (i = 0 ; i < 64 ; i++) begin
        I = i;
        expected = 64'b1 << I;
        #10;
        if (Y == expected)
            $display("PASS: I=%b Y=%b", I, Y);
        else
            $display("FAIL: I=%b Y=%b Expected=%b",
                     I, Y, expected);
    end
    $finish;
end
endmodule