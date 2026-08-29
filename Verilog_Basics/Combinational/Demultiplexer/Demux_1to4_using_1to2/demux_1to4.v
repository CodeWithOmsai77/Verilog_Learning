module demux_1to4 (
    input I,
    input [1:0] S,
    output [3:0] Y
);

wire A;
wire B;

demux_1to2 Demux0 (
    .I(I),
    .S(S[1]),
    .Y({B,A})
);

demux_1to2 Demux1 (
    .I(A),
    .S(S[0]),
    .Y(Y[1:0])
);

demux_1to2 Demux2 (
    .I(B),
    .S(S[0]),
    .Y(Y[3:2])
);

endmodule