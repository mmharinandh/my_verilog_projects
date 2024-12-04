`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2024 14:25:31
// Design Name: 
// Module Name: adder_tb
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


module carry_lookahead_adder_tb;
    reg [3:0] A, B;     // 4-bit inputs
    reg Cin;            // Carry-in
    wire [3:0] SUM;     // 4-bit sum
    wire Cout;          // Carry-out

    // Instantiate the CLA adder
    carry_look_ahead_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .SUM(SUM),
        .Cout(Cout)
    );

    initial begin
        $display("A     B     Cin | SUM   Cout");
        $monitor("%b %b %b   | %b   %b", A, B, Cin, SUM, Cout);

        A = 4'b0001; B = 4'b0010; Cin = 0; #10; // Test 1
        A = 4'b1010; B = 4'b0101; Cin = 1; #10; // Test 2
        A = 4'b1111; B = 4'b0001; Cin = 0; #10; // Test 3
        A = 4'b1001; B = 4'b0110; Cin = 1; #10; // Test 4

        $finish;
    end
endmodule

