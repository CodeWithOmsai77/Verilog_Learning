
module Test;

reg a;
wire y;

// Instantiate NOT gate
not_gate uut (a, y);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Test);

    $display("Simulation Started");

    a = 0; #10;
    a = 1; #10;

    $finish;
end

endmodule