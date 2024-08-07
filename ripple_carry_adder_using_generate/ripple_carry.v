`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2024 21:07:15
// Design Name: 
// Module Name: generate_sim
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


module generate_sim #(parameter N = 4)(inA, inB, sum, carry);
input [N-1:0]inA;
input [N-1:0]inB;
output [N-1:0]sum;
output carry;

wire [N-1:0]inC;

assign carry = inC[N-1];

genvar i;

generate
for(i=0; i<N; i = i+1)
begin
    if (i==0)
    half_adder ha (sum[i], inC[i], inA[i], inB[i]);
    else if (i>0)
    full_adder fa (sum[i], inC[i], inA[i], inB[i], inC[i-1]);
end
endgenerate

endmodule


