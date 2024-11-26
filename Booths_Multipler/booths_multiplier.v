`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 21:26:09
// Design Name: 
// Module Name: booths_multiplier
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


module booths_multiplier(clk, rst, multiplier, multiplicant, Q2, Q1);

    parameter              N = 16, 
                           S0 = 3'b000, 
                           S1 = 3'b001, 
                           S2 = 3'b010,
                           S3 = 3'b011,
                           S4 = 3'b100,
                           S5 = 3'b101;
    
    input                  clk, 
                           rst;
    input         [N-1:0]  multiplier, 
                           multiplicant;
    output        [N-1:0]  Q2, 
                           Q1;
    
    reg           [N-1:0]  Accumulator, 
                           B,
                           C;
    reg                    Q0;
    reg                    done;
    reg           [2:0]    State;
    integer                Count;
    
    assign Q1 = done ? B : 0;
    assign Q2 = done ? Accumulator : 0;
    
    always @(posedge clk or negedge rst)
    begin
        if(rst == 1'b0)
        begin
            Accumulator <= 0;
            B <= 0;
            C <= 0;
            Q0 <= 0;
            State <= S0;
            Count <= N;
        end
        else
        begin
             case (State)
                  S0 : begin
                           Accumulator <= 0;
                           B <= multiplier;
                           C <= multiplicant;
                           Q0 <= 0;
                           State <= S1;
                           // Count <= N;
                       end
                  S1 : begin
                           case ({B[0], Q0})
                              2'b00  : State <= S4;
                              2'b01  : State <= S3;
                              2'b10  : State <= S2;
                              2'b11  : State <= S4;
                              default: State <= S0;
                           endcase
                       end
                  S2 : begin
                          Accumulator <= Accumulator + (~C) + 1'b1;
                          State <= S4;
                       end
                  S3 : begin
                          Accumulator <= Accumulator + C;
                          State <= S4;
                       end
                  S4 : begin
                          Q0 <= B[0];
                          B <= B >>1;
                          B[N-1] <= Accumulator[0];
                          Accumulator <= Accumulator >> 1;
                          Accumulator[N-1] <= Accumulator[N-1];
                          //{Accumulator, B, Q0} <= {Accumulator, B, Q0} >> 1;
                          Count <= Count - 1;
                          State <= S5;
                       end
                  S5 : begin
                          if (Count == 0)
                          begin
                               done <= 1'b1;
                               State <= S5;
                          end
                          else if (Count != 0)
                          begin
                               done <= 1'b0;
                               State <= S1;
                          end
                       end
                  default: begin
                               State <= S0;   
                           end
             endcase 
        end
    end
    
endmodule
