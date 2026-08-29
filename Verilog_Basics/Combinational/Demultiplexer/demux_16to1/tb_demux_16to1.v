module tb_demux_16to1;
reg I;
reg [3:0] S;
wire [15:0] Y;

demux_16to1 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

integer i;
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_demux_16to1);

    I = 0;
    for (i = 0 ; i < 16 ; i++) begin 
        S = i;
        #10;
    end

    I = 1;
    for (i = 0 ; i < 16 ; i++) begin
        S = i;
        #10;
    end
    $finish;
end
endmodule