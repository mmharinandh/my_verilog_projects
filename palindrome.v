`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2024 12:29:03
// Design Name: 
// Module Name: design
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


module palindrome(word, out);
integer i;
input [31:0]word;
reg [31:0]temp;
integer count = 0;
output reg out;

always @(*)
begin
temp = word;
for(i=0;i<32;i=i+1) begin
if (word[i]==temp[31-i])
count = count+1;
end

if (count == 32)
out = 1'b1;
else
out = 1'b0;
end
endmodule
