module tb_demux_1to8;
reg I;
reg [2:0] S;
wire [7:0] Y;

demux_1to8 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

integer i;

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_demux_1to8);

    I = 0;
    for (i = 0 ; i < 8 ; i++) begin  
        S = i;
        #10;
    end

    I = 1;
    for (i = 0 ; i < 8 ; i++) begin 
        S = i;
        #10;
    end
    $finish;
end
endmodule
