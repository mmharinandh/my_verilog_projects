`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 08:03:14
// Design Name: 
// Module Name: PIPO
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


module PIPO
    #(parameter N = 4)
     (input             clk,
                        clear,
                        load,
                 [N-1:0]data_in,
      output reg [N-1:0]data_out);
      
      always @(posedge clk)
          begin
          if (clear == 1)
            data_out <= 0;
          else if ((!clear)&load)
            data_out <= data_in;
          end
endmodule
