// 8:1 Multiplexer
// Selects one of 8 data inputs and sends it to the output

module mux_8to1 (

    // 8-bit data bus
    // I[7] = I7, I[6] = I6, ... I[0] = I0
    input [7:0] I,

    // 3-bit select bus
    // 3 bits can represent 8 combinations (000 to 111)
    input [2:0] S,

    // Output of the multiplexer
    output Y
);

// Select the input whose index is given by S
// S = 000 → I[0]
// S = 001 → I[1]
// S = 010 → I[2]
// S = 011 → I[3]
// S = 100 → I[4]
// S = 101 → I[5]
// S = 110 → I[6]
// S = 111 → I[7]

assign Y = I[S];

endmodule