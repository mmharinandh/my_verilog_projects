`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 10:02:00
// Design Name: 
// Module Name: gen_prop
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


module gen_prop
    #(parameter N = 4)
    (input [N-1:0]A,
           [N-1:0]B,
     output [N-1:0]generate_value,
            [N-1:0]propagate);
            
     assign generate_value = A&B;
     assign propagate = A^B;
     
endmodule
