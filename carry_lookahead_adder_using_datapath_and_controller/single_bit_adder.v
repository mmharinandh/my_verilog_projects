`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CET
// Engineer: Harinandh M M
// 
// Create Date: 10.08.2024 07:05:18
// Design Name: Carry-LookAhead-Adder
// Module Name: adder 
// Description: Carry Look Ahead adder is a type of adder circuit with reduced propagation delay as compared to the normal ripple carry adder.
// The reduced propagation delay is obtained at the cost of excess hardware complexity.
//  
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder(output sum, 
                    carry,
             input  generate_value, 
                    propagate,
                    C);
    
    wire temp;
    
    xor x2 (sum, propagate, C);
    and a2 (temp, propagate, C);
    or o1 (carry, generate_value, temp);

endmodule
