`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 22:27:59
// Design Name: 
// Module Name: booths_multiplier_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module booths_multiplier_tb;
    reg clk, rst;
    reg [3:0] multiplier, multiplicant;
    wire [3:0] Q1, Q2;
    parameter N= 4;
    booths_multiplier #(.N(N)) mul1 (clk, rst, multiplier, multiplicant, Q2, Q1);
    
    always #5 clk = ~clk;
    
    initial
    begin
        clk = 1'b0;
        rst = 1'b1;
        
        #6
        rst = 1'b0;
        
        #16
        rst = 1'b1;
        
        #26
        multiplier = 4'b0111;
        multiplicant = 4'b0111;
    end
endmodule
