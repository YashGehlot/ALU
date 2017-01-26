`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:41 10/29/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
input [33:0]inputdata,
input clk,
output reg [15:0]Y,
output reg cout,
output reg overflow
    );
reg [15:0] rY;
reg rcout;
reg roverflow;	 
	 
wire [1:0]opcode;
wire [7:0]A;
wire [7:0]B;	 

assign opcode=inputdata[33:32];
assign A=inputdata[31:24];
assign B=inputdata[23:16];	

reg [1:0]op;

wire [7:0] adda,addb,addy;
wire [15:0]exaddy;
wire addc,addf;

wire [15:0]multy;
wire [7:0] multa,multb;
//wire multbusy; 
//multclk;

wire [7:0] anda,andb,andy;
wire [15:0] exandy;

wire [7:0] xora,xorb,xory;
wire [15:0] exxory;


assign adda=A;assign addb=B;
adder8bit x1( .a(adda), .b(addb), .sum(addy), .cout(addc), .flow(addf));
SignExtender sx1( .CLK(clk), .extend(addy), .extended(exaddy));

assign multa=A;assign multb=B;
mult8bit x2( .prod(multy)/*, .busy(multbusy)*/, .mc(multa), .mp(multb), .clk(clk));

assign anda=A;assign andb=B;
and8bit x3(.A(anda), .B(andb), .C(andy));
SignExtender sx2( .CLK(clk), .extend(andy), .extended(exandy));

assign xora=A;assign xorb=B;
xor8bit x4(.A(xora), .B(xorb), .C(xory));
SignExtender sx3( .CLK(clk), .extend(xory), .extended(exxory));

always @(posedge clk)
begin
   if( opcode == 0)
     begin
		assign rY=exaddy;assign rcout=addc;assign roverflow=addf;
	  end	
   if( opcode == 1)
	  assign rY=exandy;

   if( opcode == 2)
      assign rY=exxory;

   if( opcode == 3)
      begin
			assign rY=multy;
		end
end
always @(posedge clk) begin
	assign Y = rY;
	assign cout=rcout;
	assign overflow=roverflow;
end

endmodule
	