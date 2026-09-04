module tb_Decoder_2to4;
reg [1:0] I;
reg E;
wire [3:0] Y;

reg [3:0] expected;
integer i;

Decoder_2to4 DUT(
    .I(I),
    .E(E),
    .Y(Y)
);

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_Decoder_2to4);

    E = 0;
    for (i = 0 ; i < 4 ; i++) begin 
        I = i;
        expected = 4'b0000;
        #10;
          if (Y == expected)
            $display("PASS: E=%b I=%b Y=%b", E, I, Y);
        else
            $display("FAIL: E=%b I=%b Y=%b Expected=%b",
                     E, I, Y, expected);
    end

    E = 1;
    for (i = 0 ; i < 4 ; i++) begin
        I = i;
        expected = 4'b0001;
        #10;
          if (Y == expected)
            $display("PASS: E=%b I=%b Y=%b", E, I, Y);
        else
            $display("FAIL: E=%b I=%b Y=%b Expected=%b",
                     E, I, Y, expected);
    end
    $finish;
end
endmodule