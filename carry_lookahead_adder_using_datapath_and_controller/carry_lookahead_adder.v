`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2024 19:24:30
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


module carry_lookahead_adder
    #(parameter N=16)
    (input clk,
           start,
           carry_in,
           [N-1:0]data_in,
     output done,
            [N:0]data_out);
        
     wire load_a, load_b, clear_b, clear_a;
     
     carry_lookahead_adder_datapath #(.N(N)) 
                                     dut1 (.clk(clk), 
                                     .load_a(load_a), 
                                     .load_b(load_b), 
                                     .clr_a(clear_a),
                                     .clr_b(clear_b),
                                     .carry_in(carry_in),
                                     .data_in(data_in),
                                     .data_out(data_out));
                                     
    carry_lookahead_adder_control #(.N(N)) 
                                     dut2 (.clk(clk),
                                        .load_a(load_a),
                                        .load_b(load_b),
                                        .clear_a(clear_a),
                                        .clear_b(clear_b),
                                        .start(start),
                                        .done(done));
        
endmodule
