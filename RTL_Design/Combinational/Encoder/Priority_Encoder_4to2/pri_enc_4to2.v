module pri_enc_4to2 (
    input [3:0] I,
    output [1:0] Y
);

assign Y[1] = I[3] | I[2] ;
assign Y[0] = I[3] | (~I[2] & I[1]) ;

endmodule
