module Test;

reg a, b;
wire y;

and_gate uut (a, b, y);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Test);

    $display("Simulation Started");

    a = 0 ; b = 0; #10;
    a = 0 ; b = 1; #10;
    a = 1 ; b = 0; #10;
    a = 1 ; b = 1; #10;
    
    $finish;
end

endmodule