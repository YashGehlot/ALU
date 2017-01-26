`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:28 10/29/2016 
// Design Name: 
// Module Name:    xor8bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module xor8bit(input wire [7:0] A, input wire [7:0] B, output wire [7:0] C);
assign C[0] = A[0] ^ B[0];
assign C[1] = A[1] ^ B[1];
assign C[2] = A[2] ^ B[2];
assign C[3] = A[3] ^ B[3];
assign C[4] = A[4] ^ B[4];
assign C[5] = A[5] ^ B[5];
assign C[6] = A[6] ^ B[6];
assign C[7] = A[7] ^ B[7];
endmodule