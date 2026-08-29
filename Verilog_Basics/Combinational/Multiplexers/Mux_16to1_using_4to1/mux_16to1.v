module mux_16to1 (

    input [15:0] I,
    input [3:0] S,
    output Y

);

wire A, B, C, D;

mux_4to1 Mux0 (
    .I(I[3:0]),
    .S(S[1:0]),
    .Y(A)
);

mux_4to1 Mux1 (
    .I(I[7:4]),
    .S(S[1:0]),
    .Y(B)
);

mux_4to1 Mux2 (
    .I(I[11:8]),
    .S(S[1:0]),
    .Y(C)
);

mux_4to1 Mux3 (
    .I(I[15:12]),
    .S(S[1:0]),
    .Y(D)
);

mux_4to1 Mux4 (
    .I({D, C, B, A}),
    .S(S[3:2]),
    .Y(Y)
);

endmodule