`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 22:01:48
// Design Name: 
// Module Name: det_ckt
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


module det_ckt(clk, A, S, Z);

input clk, A;
output reg [1:0]S;
output reg Z;

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

always @(posedge clk)
begin
    case(S)
    
        S0:
        begin
        if (A == 0) 
        begin
        S <= S1;
        Z <= 0;
        end
        else 
        begin
        S <= S0;
        Z <= 0;
        end
        end
        
        S1:
        begin
        if (A == 0) 
        begin
        S <= S1;
        Z <= 0;
        end
        else 
        begin
        S <= S2;
        Z <= 0;
        end
        end
        
        S2:
        begin
        if (A == 0) 
        begin
        S <= S1;
        Z <= 0;
        end
        else 
        begin
        S <= S3;
        Z <= 0;
        end
        end
        
        S3:
        begin
        if (A == 0) 
        begin
        S <= S1;
        Z <= 1;
        end
        else 
        begin
        S <= S0;
        Z <= 0;
        end
        end
        
        default:
        begin
        S<=S0;
        Z<=0;
        end
    endcase
end


endmodule
