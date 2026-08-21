module nand_gate(
    input a, 
    input b,
    output y
);

assign y = ~(a & b);

endmodule 

module nand_gate_tb;

reg a , b;
wire y;

nand_gate DUT (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile ("nand_gate.vcd");
    $dumpvars (0, nand_gate_tb);

    a = 0 ; b = 0;
    #10 a = 0 ; b = 1;
    #10 a = 1 ; b = 0;
    #10 a = 1 ; b = 1;

    #10 $finish;

end

endmodule
