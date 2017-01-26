`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:01:25 10/28/2016 
// Design Name: 
// Module Name:    mult8bit 
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
module mult8bit( 
output [15:0] prod,

input [7:0] mc, 
input [7:0] mp,
input clk
);
wire busy;
reg [7:0] A, Q, M;
reg Q_1;
reg [3:0] count;
wire [7:0] sum, difference;
reg ss;
initial begin
#100
A <= 8'b0;
 M <= mc;
 Q <= mp;
 Q_1 <= 1'b0;
 count <= 4'b0;
 ss <= 1'b1;
 end  
always @(posedge clk)
begin
 if (busy&ss) begin
  case ({Q[0], Q_1})
 2'b0_1 : {A, Q, Q_1} <= {sum[7], sum, Q};
 2'b1_0 : {A, Q, Q_1} <= {difference[7], difference, Q};
 default: {A, Q, Q_1} <= {A[7], A, Q};
 endcase
 count <= count + 1'b1;
 end
end
addsub adder (sum, A, M, 1'b0);
addsub subtracter (difference, A, ~M, 1'b1);
assign prod = {A, Q};
assign busy = (count < 8);
endmodule
module addsub(out, a, b, cin);
output [7:0] out;
input [7:0] a;
input [7:0] b;
input cin;
assign out = a + b + cin;
endmodule