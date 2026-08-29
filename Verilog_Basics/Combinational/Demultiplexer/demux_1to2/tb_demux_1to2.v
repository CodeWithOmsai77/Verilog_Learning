module tb_demux_1to2;
reg I;
reg S;
wire [1:0] Y;

demux_1to2 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_demux_1to2);

    I = 0 ; S = 0 ;
    #10 I = 0 ; S = 1 ;
    #10 I = 1 ; S = 0 ;
    #10 I = 1 ; S = 1 ;
    #10 $finish;
end
endmodule