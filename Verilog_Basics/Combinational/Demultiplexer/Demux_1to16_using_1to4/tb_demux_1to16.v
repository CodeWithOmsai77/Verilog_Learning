module tb_demux_1to16;

reg I;
reg [3:0] S;
wire [15:0] Y;

reg [15:0] expected;

demux_1to16 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb_demux_1to16);

    I = 0;
    for (integer i = 0 ; i < 16 ; i++) begin
        S = i;
        expected = 16'b0;
        #10;

        if (Y !== expected) 
        $display("Fail : S=%0d , I= %b , Y=%b , expected=%b", 
        S, I, Y, expected);

        else
        $display("Pass : S=%0d , I= %b , Y=%b", 
        S, I, Y);
    end

    I = 1;
    for (integer i = 0 ; i < 16 ; i++) begin
        S = i;
        expected = 16'b0;
        #10;

        if (Y !== expected) 
        $display("Fail : S=%0d , I= %b , Y=%b , expected=%b", 
        S, I, Y, expected);

        else
        $display("Pass : S=%0d , I= %b , Y=%b", 
        S, I, Y);
    end
    $finish;
end
endmodule