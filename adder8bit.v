`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:28 10/27/2016 
// Design Name: 
// Module Name:    adder8bit 
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
module adder8bit(
input [7:0]a,
input [7:0]b,
output [7:0]sum,
output cout,
output flow
    );
wire c[6:0];
wire cin;
wire [7:0]over;
wire [7:0]SUM;
assign cin=1'b0;
	fulladd f0( .a( a[0] ), .b( b[0] ), .cin( cin ), .sum( SUM[0]), .cout( c[0]) );
	fulladd f1( .a( a[1] ), .b( b[1] ), .cin( c[0] ), .sum( SUM[1]), .cout(c[1]) );
	fulladd f2( .a( a[2] ), .b( b[2] ), .cin( c[1] ), .sum( SUM[2]), .cout(c[2]) );
	fulladd f3( .a( a[3] ), .b( b[3] ), .cin( c[2] ), .sum( SUM[3]), .cout(c[3]) );
	fulladd f4( .a( a[4] ), .b( b[4] ), .cin( c[3] ), .sum( SUM[4]), .cout(c[4]) );
	fulladd f5( .a( a[5] ), .b( b[5] ), .cin( c[4] ), .sum( SUM[5]), .cout(c[5]) );
	fulladd f6( .a( a[6] ), .b( b[6] ), .cin( c[5] ), .sum( SUM[6]), .cout(c[6]) );
	fulladd f7( .a( a[7] ), .b( b[7] ), .cin( c[6] ), .sum( SUM[7]), .cout(cout) );
assign flow=cout^c[6];
assign over[0]=flow;
assign over[1]=flow;
assign over[2]=flow;
assign over[3]=flow;
assign over[4]=flow;
assign over[5]=flow;
assign over[6]=flow;
assign over[7]=flow;
assign sum=(~over)&SUM;

endmodule
 
module fulladd(a,b,cin,sum,cout);
input a;
input b;
input cin;
output sum;
output cout;
assign sum=(a^b^cin);
assign cout=((a^b)& cin)| (a&b);

endmodule

 