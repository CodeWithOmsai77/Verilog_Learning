module demux_2to1 (
    input D,
    input S,
    output [1:0] Y
);

assign Y[0] = D & ~S;
assign Y[1] = D & S;

endmodule