module tb_encoder_4to2;
reg [3:0] I;
wire [1:0] Y;

encoder_4to2 DUT (
    .I(I),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_encoder_4to2);

        I = 4'b0001;
        #10 I = 4'b0010;
        #10 I = 4'b0100;
        #10 I = 4'b1000;

//I = 4'h1;
// #10 I = 4'h2;
// #10 I = 4'h4;
// #10 I = 4'h8;

//    I[3] = 0 ; I[2] = 0 ; I[1] = 0 ; I[0] = 1;
//    #10 I[3] = 0 ; I[2] = 0 ; I[1] = 1 ; I[0] = 0;
//    #10 I[3] = 0 ; I[2] = 1 ; I[1] = 0 ; I[0] = 0;
//    #10 I[3] = 1 ; I[2] = 0 ; I[1] = 0 ; I[0] = 0;

    #10 $finish;

end
endmodule