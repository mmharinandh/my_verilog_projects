`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 10:50:39
// Design Name: 
// Module Name: carry_lookahead_adder_control
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


module carry_lookahead_adder_control
    #(parameter N = 16)
    (input start,
           clk,
     output reg load_a,
            load_b,
            clear_a,
            clear_b,
            done);
            
           reg [1:0] state;
           parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
           
           always @(posedge clk)
           begin
                case(state)
                    S0: if (start)
                        state <= S1;
                    S1: state <= S2;
                    S2: state <= S3;
                    S3: state <= S3;
                    default: state <= S0;
                endcase
           end
           
           always @(state)
           begin
                case(state)
                    S0: begin
                        #1 load_a = 1'b0;
                        load_b = 1'b0;
                        clear_a = 1'b0;
                        clear_b = 1'b0;
                        done = 1'b0;
                        end
                    S1: begin
                        #1 load_a = 1'b1;
                        end
                    S2: begin
                        #1 load_a = 1'b0;
                        load_b = 1'b1;
                        end
                    S3: begin
                        #1 load_b = 1'b0;
                        done = 1'b1;
                        end
                endcase
           end
endmodule
