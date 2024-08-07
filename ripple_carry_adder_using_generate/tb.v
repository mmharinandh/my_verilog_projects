`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2024 21:39:12
// Design Name: 
// Module Name: tb
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


module tb;

parameter N = 8;
reg [7:0]inA, inB;
wire [7:0]sum;
wire carry;

generate_sim #(.N(N)) dut (inA, inB, sum, carry);

initial
begin 
    inA = 8'b10111010;
    inB = 8'b11101011;
end
endmodule
