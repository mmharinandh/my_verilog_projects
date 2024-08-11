`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 11:15:44
// Design Name: 
// Module Name: adder_test
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


module adder_test;

parameter N = 16;

reg clk, start, cin;
reg [15:0] data_in;
wire done;
wire [16:0] data_out;

carry_lookahead_adder_datapath dut1 (.clk(clk), 
                                     .load_a(load_a), 
                                     .load_b(load_b), 
                                     .clr_a(clear_a),
                                     .clr_b(clear_b),
                                     .carry_in(cin),
                                     .data_in(data_in),
                                     .data_out(data_out));
                                     
carry_lookahead_adder_control dut2 (.clk(clk),
                                    .load_a(load_a),
                                    .load_b(load_b),
                                    .clear_a(clear_a),
                                    .clear_b(clear_b),
                                    .start(start),
                                    .done(done));
                                    
initial
begin 
    $monitor("%h", dut1.A_out);
end
                                    
initial
begin
    clk = 1'b0;
    start = 1'b0;
    cin = 1'b1;
end

always #5 clk = ~clk;

initial
begin
    #12 start = 1'b1;
        data_in = 16'hAAAA;
    #15 data_in = 16'h1111;
end
endmodule
