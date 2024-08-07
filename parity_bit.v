`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 08:31:17
// Design Name: 
// Module Name: parity_bit
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


module parity_bit(clk, reset, A, SR);
    input clk, reset;
    input A;
    output reg [7:0]SR;
    parameter EVEN = 0, ODD = 1;
    reg state;
    reg [2:0]i;
    reg [2:0]value;
    
    always @(posedge clk)
    begin
    if (reset == 0)
        SR <=8'b0;
    else
    begin
        SR[6]<=SR[5];
        SR[5]<=SR[4];
        SR[4]<=SR[3];
        SR[3]<=SR[2];
        SR[2]<=SR[1];
        SR[1]<=SR[0];
        SR[0]<=A;
    end
    end
    
    always @(*)
    begin
    value = 0;
    for(i=0;i<7;i=i+1)
    begin
    if (SR[i]==1)
    value = value+1;
    end
    case(value%2)
    EVEN: begin SR[7] = 0; state = 0; end
    ODD : begin SR[7] = 1; state = 1; end
    endcase 
    end
endmodule
