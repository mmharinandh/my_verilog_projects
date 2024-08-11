`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 07:32:41
// Design Name: 
// Module Name: carry_lookahead_adder
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


module carry_lookahead_adder_datapath
      #(parameter N = 16)
        (output [N:0] data_out,                        
         input          clk,
                        load_a,
                        load_b,
                        clr_a,
                        clr_b,
                        carry_in,
               [N-1:0]  data_in);
               
         wire [N-1:0] A_out;
         wire [N-1:0] B_out; 
         wire [N-1:0] generate_value;
         wire [N-1:0] propagate; 
         wire [N-1:0] carry_reg;
         wire [N-1:0] sum_reg;
         wire carry_out;
         genvar i;
         
         assign data_out = {carry_out,sum_reg};
         assign carry_reg[0] = carry_in;
         
         PIPO 
            #(.N(16))
              p_a (.clk(clk),
                   .clear(clr_a),
                   .load(load_a),
                   .data_in(data_in),
                   .data_out(A_out));
         
         PIPO
             #(.N(16))
              p_b (.clk(clk),
                   .clear(clr_b),
                   .load(load_b),
                   .data_in(data_in),
                   .data_out(B_out));
                   
         gen_prop
             #(.N(16))
                  gp1 (.A(A_out),
                       .B(B_out),
                       .generate_value(generate_value),
                       .propagate(propagate));
         
         generate
         for(i=0; i<N; i=i+1)
         begin
            if (i<N-1)
            adder a1 (.sum(sum_reg[i]),
                      .carry(carry_reg[i+1]),
                      .generate_value(generate_value[i]),
                      .propagate(propagate[i]),
                      .C(carry_reg[i]));
            else if (i == N-1)
            begin
            adder a1 (.sum(sum_reg[i]),
                      .carry(carry_out),
                      .generate_value(generate_value[i]),
                      .propagate(propagate[i]),
                      .C(carry_reg[i]));
            end
         end
         endgenerate
endmodule
