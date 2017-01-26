`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:16:59 10/31/2016
// Design Name:   ALU
// Module Name:   D:/yash/Xilinx/csnproject/ALU_tb.v
// Project Name:  csnproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [33:0] inputdata;
	reg clk;

	// Outputs
	wire [15:0] Y;
	wire cout;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inputdata(inputdata), 
		.clk(clk), 
		.Y(Y), 
		.cout(cout), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		inputdata =0;
		
		clk=0;
		
		// Wait 100 ns for global reset to finish
		#50
      inputdata = 34'b0001111111011111110000000000000000;  
		// Add stimulus here
		
		#180 $stop;
		
	end
	always begin #5 clk=!clk; end

      
endmodule

