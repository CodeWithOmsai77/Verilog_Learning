module tb_encoder_8to3;
reg [7:0] I;
wire [2:0] Y;

encoder_8to3 DUT (
    .I(I),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_encoder_8to3);

        I = 8'b00000001;
        #10 I = 8'b00000010;
        #10 I = 8'b00000100;
        #10 I = 8'b00001000;
        #10 I = 8'b00010000;
        #10 I = 8'b00100000;
        #10 I = 8'b01000000;
        #10 I = 8'b10000000;

//I = 8'h1;
// #10 I = 8'h2;
// #10 I = 8'h4;
// #10 I = 8'h8;
// #10 I = 8'h16;



    #10 $finish;

end
endmodule