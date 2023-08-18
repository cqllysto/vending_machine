`timescale 1ns / 1ps

module main(
input A, B, clk,
output z, c, La, Lb, Lclk
    );
    
    // A is nickel, B is dime

    // LEDs to see whats happening because im confuuussseeeddd
assign La = A;
assign Lb = B;
assign Lclk = clk;

wire C, D, E; // wires from the outputs of the three flip flops

wire Qa, Qb, Qc; // wires into the inputs of the three flip flops

assign Qa =  A + B&D + B&C&E;
assign Qb =  B&!C&!D + !A&!B&!C&D + !B&!C&D&!E + A&!C&!D&E;
assign Qc =  A&!C&!E + !A&!B&!C&E + !A&!C&!D&E;
assign z  =  C + D&E;
assign Qa =  C;

// Q_A Flip Flop
    ff Q_A (
    .D (Qa),
    .clk(clk),
    .Q(C)    
    );

// Q_B Flip Flop
    ff Q_B (
    .D (Qb),
    .clk(clk),
    .Q(D)    
    );
    
// Q_C Flip Flop
    ff Q_C (
    .D (Qc),
    .clk(clk),
    .Q(E)    
    );
    
// Candy
    ff Candy (
    .D (Qa),
    .clk(clk),
    .Q(z)    
    );
    
// Change    
    ff Change (
    .D (Qa),
    .clk(clk),
    .Q(c)    
    );
    
    
endmodule
