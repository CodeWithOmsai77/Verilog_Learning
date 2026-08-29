module tb_demux_1to4;
reg I;
reg [1:0] S;
wire [3:0] Y;

demux_1to4 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

integer i;
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_demux_1to4);

    I = 0;
    for (i = 0 ; i < 4 ; i++) begin
        S = i;
        #10;
    end

    I = 1;
    for (i = 0 ; i < 4 ; i++)begin
        S = i;
        #10;
    end
    $finish;
end
endmodule
