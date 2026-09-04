module Decoder_2to4(
    input [1:0] I,
    input E,
    output [3:0] Y
);

// If Enable = 1, decode the input
// If Enable = 0, all outputs are 0
assign Y = E ? (4'b0001 << I) : 4'b0000;

endmodule