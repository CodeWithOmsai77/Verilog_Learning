module decoder_6to64 (
    input [5:0] I,
    output [63:0] Y
) ;

assign Y = 64'b1 << I;
endmodule