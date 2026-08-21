module nor_gate (
    input a,
    input b,
    output y
);

assign y = ~(a | b);

endmodule


module nor_gate_tb;

reg a , b ;
wire y ;

nor_gate DUT (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("nor_gate.vcd");
    $dumpvars(0, nor_gate_tb);

    a = 0 ; b = 0;
    #10 a = 0 ; b = 1;
    #10 a = 1 ; b = 0;
    #10 a = 1 ; b = 1;

    #10 $finish;
end

endmodule