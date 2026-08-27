module tb_mux_8to1;

reg [7:0] I;
reg [2:0] S;
wire Y;

mux_8to1 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

integer i;

initial begin 

    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux_8to1);

// Repeat the test for all 8 inputs: I[0] to I[7]
for (i = 0; i < 8; i = i + 1) begin

    // Set all data inputs to 0
    // This tests the selected input when it is 0
    I = '0;

    // Select the current input
    // i = 0 → S = 000 → I[0]
    // i = 1 → S = 001 → I[1]
    // ...
    // i = 7 → S = 111 → I[7]
    S = i;

    // Wait so that Y can be observed
    #10;

    // Set the currently selected input to 1
    // i = 0 → I[0] = 1
    // i = 1 → I[1] = 1
    // ...
    // i = 7 → I[7] = 1
    I[i] = 1'b1;

    // Wait so that the change in Y can be observed
    #10;

end

// End the simulation
$finish;

end 

endmodule