`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2024 13:58:19
// Design Name: 
// Module Name: carry_look_ahead_adder
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


module carry_look_ahead_adder
        #(parameter N = 4)
         (A,
          B,
          Cin,
          SUM,
          Cout);
          
          input [N-1:0]A;
          input [N-1:0]B;
          input Cin;
          output [N-1:0]SUM;
          output Cout;
          
          genvar i;
          
          wire [N-1:0]Carry_reg;
          wire [N-1:0] Gen, Prop;
          wire [N-1:0] temp;
          
          and and_cout (temp[N-1], Prop[N-1], Carry_reg[N-1]);
          or or_cout (Cout, Gen[N-1], temp[N-1]);
          
          generate
          for(i=0; i<N; i=i+1)
          begin
          and and_logic (Gen[i], A[i], B[i]);
          xor xor_logic (Prop[i], A[i], B[i]);
          end
          endgenerate
          
          generate
          for(i=0; i<N; i=i+1)
          begin
            if(i==0)
            begin
                assign Carry_reg[0] = Cin;
                xor xor_sum (SUM[0], Prop[0], Carry_reg[0]);
            end
            else if (i>0)
            begin
                and and_carry (temp[i-1], Prop[i-1], Carry_reg[i-1]);
                or or_carry (Carry_reg[i], Gen[i-1], temp[i-1]);
                xor xor_SUM (SUM[i], Prop[i], Carry_reg[i]);
            end
          end
          endgenerate
endmodule
