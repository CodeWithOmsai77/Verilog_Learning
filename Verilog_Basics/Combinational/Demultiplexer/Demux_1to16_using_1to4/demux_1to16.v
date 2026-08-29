module demux_1to16 (

    input I,
    input [3:0] S,
    output [15:0] Y

);

wire A, B, C, D;

demux_1to4 Demux0 (
    .I(I),
    .S({S[3], S[2]}),
    .Y({D, C, B, A})
);

demux_1to4 Demux1 (
    .I(A),
    .S({S[1], S[0]}),
    .Y(Y[3:0])
);

demux_1to4 Demux2 (
    .I(B),
    .S({S[1], S[0]}),
    .Y(Y[7:4])
);

demux_1to4 Demux3 (
    .I(C),
    .S({S[1], S[0]}),
    .Y(Y[11:8])
);

demux_1to4 Demux4 (
    .I(D),
    .S({S[1], S[0]}),
    .Y(Y[15:12])
);

endmodule