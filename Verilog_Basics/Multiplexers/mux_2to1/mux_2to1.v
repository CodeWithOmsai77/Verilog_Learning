module mux_2to1 (
    input I0,
    input I1,
    input S,
    output reg Y
);

always @(*) begin
    if (S == 0)
    Y = I0;
    else
    Y = I1;
end
endmodule
