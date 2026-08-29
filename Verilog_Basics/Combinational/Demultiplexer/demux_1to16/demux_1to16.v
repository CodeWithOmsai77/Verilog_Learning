module demux_1to16 (
    input I,
    input [3:0] S,
    output [15:0] Y
);

assign Y = I << S;
endmodule