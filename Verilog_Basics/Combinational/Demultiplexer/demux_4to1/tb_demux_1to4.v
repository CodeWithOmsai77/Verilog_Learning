module tb_demux_1to4;
reg D;
reg [1:0] S;
wire [3:0] Y;

demux_1to4 DUT (
    .D(D),
    .S(S),
    .Y(Y)
);

integer i;

initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_demux_1to4);

    D = 0;
    for (i = 0 ; i < 4 ; i++) begin
        S = i;
        #10;
    end

    D = 1;
    for (i = 0 ; i < 4 ; i++) begin
        S = i;
        #10;
    end

    $finish;
end
endmodule