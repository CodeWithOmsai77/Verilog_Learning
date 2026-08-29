module demux_16to1 (
    input I,
    input [3:0] S,
    output [15:0] Y
);

assign Y = I << S;
endmodule