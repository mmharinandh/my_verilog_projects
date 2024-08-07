`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 23:06:39
// Design Name: 
// Module Name: serial_adder
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


module serial_adder(clk, reset, A, B, S, C);

input clk, reset, A, B;
output reg S, C;

reg state;
parameter carry0 = 1'b0; 
parameter carry1 = 1'b1;

always @(posedge clk)

    if (reset == 0)
    begin
    state <= carry0;
    S <= 0;
    C <= carry0;
    end
    
    else
    begin
        case(state)
        
        carry0:
        begin
            if ((A==1'b0)&(B==1'b0))
            begin
            state <= carry0;
            S <= 0;
            C <= carry0;
            end
            
            else if ((A==1'b0)&(B==1'b1))
            begin
            state <= carry0;
            S <= 1;
            C <= carry0;
            end
            
            else if ((A==1'b1)&(B==1'b0))
            begin
            state <= carry0;
            S <= 1;
            C <= carry0;
            end
            
            else if ((A==1'b1)&(B==1'b1))
            begin
            state <= carry1;
            S <= 0;
            C <= carry1;
            end
            
        end
        
        carry1:
        begin
            if ((A==1'b0)&(B==1'b0))
            begin
            state <= carry0;
            S <= 1;
            C <= carry0;
            end
            
            else if ((A==1'b0)&(B==1'b1))
            begin
            state <= carry1;
            S <= 0;
            C <= carry1;
            end
            
            else if ((A==1'b1)&(B==1'b0))
            begin
            state <= carry1;
            S <= 0;
            C <= carry1;
            end
            
            else if ((A==1'b1)&(B==1'b1))
            begin
            state <= carry1;
            S <= 1;
            C <= carry1;
            end
            
        end
        
        default:
        begin
            S <= 0;
            state <= carry0;
            C <= carry0;
        end
        endcase
    end
endmodule
