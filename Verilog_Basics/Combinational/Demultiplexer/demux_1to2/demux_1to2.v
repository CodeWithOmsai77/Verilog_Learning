module demux_1to2 (
    input I,
    input S,
    output [1:0] Y
);

assign Y[0] = I & ~S;
assign Y[1] = I & S;

endmodule