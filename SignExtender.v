`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:40 10/29/2016 
// Design Name: 
// Module Name:    SignExtender 
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
module SignExtender( CLK, extend, extended );
input[7:0] extend;
input CLK;
output[15:0] extended;

reg[15:0] extended;
wire[7:0] extend;

always @(posedge CLK)
begin
    extended[7:0] = extend[7:0];
    extended[15:8] = {8{extend[7]}};
end
endmodule
