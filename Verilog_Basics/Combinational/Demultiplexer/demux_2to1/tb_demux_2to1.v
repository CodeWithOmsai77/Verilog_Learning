module tb_demux_2to1;
reg D;
reg S;
wire [1:0] Y;

demux_2to1 DUT (
    .D(D),
    .S(S),
    .Y(Y)
);

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_demux_2to1);

    D = 0 ; S = 0 ;
    #10 D = 0 ; S = 1 ;
    #10 D = 1 ; S = 0 ;
    #10 D = 1 ; S = 1 ;
    #10 $finish;
end
endmodule