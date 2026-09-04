module Decoder_2to4(
    input [1:0] I,
    output [3:0] Y
);

assign Y[0] = ~I[1] & ~I[0];
assign Y[1] = ~I[1] &  I[0];
assign Y[2] =  I[1] & ~I[0];
assign Y[3] =  I[1] &  I[0];

endmodule