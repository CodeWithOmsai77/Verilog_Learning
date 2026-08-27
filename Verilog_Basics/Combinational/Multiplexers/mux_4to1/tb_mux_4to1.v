module tb_mux_4to1;
reg [3:0] I;
reg [1:0] S;
wire Y;

mux_4to1 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux_4to1);

// Select I[0]
I = 4'b0000;
S = 2'b00;
#10;

I = 4'b0001;
S = 2'b00;
#10;

// Select I[1]
I = 4'b0000;
S = 2'b01;
#10;

I = 4'b0010;
S = 2'b01;
#10;

// Select I[2]
I = 4'b0000;
S = 2'b10;
#10;

I = 4'b0100;
S = 2'b10;
#10;

// Select I[3]
I = 4'b0000;
S = 2'b11;
#10;

I = 4'b1000;
S = 2'b11;
#10;
    $finish;

end
endmodule
