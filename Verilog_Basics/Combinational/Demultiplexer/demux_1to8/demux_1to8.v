module demux_1to8 (
    input I,
    input [2:0] S,
    output [7:0] Y 
);

assign Y = I << S;
endmodule