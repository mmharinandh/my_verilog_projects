`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 07:19:52
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;

reg t_a, t_b, t_c;
wire t_s, t_co, t_g, t_p;
integer i;

adder dut (.sum(t_s), 
           .carry(t_co), 
           .generate_value(t_g), 
           .propagate(t_p), 
           .A(t_a), 
           .B(t_b), 
           .C(t_c));
           
initial
begin
for(i=0;i<8;i=i+1)
begin
#5 {t_a, t_b, t_c} = i;
end
end
endmodule
