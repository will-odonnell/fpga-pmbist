`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:29:51 11/05/2013
// Design Name:   pattern_generator
// Module Name:   /media/datadisk/mp/PMBIST/SRC/pmbist/pattern_generator_testbench.v
// Project Name:  programmable_memory_bist
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pattern_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pattern_generator_testbench;

	// Inputs
	reg clk;
	reg rst;
	reg sbmt_in;
	reg shft_in;
	reg [7:0] addr_in;

	// Outputs
	wire [7:0] ptrn_out;

	// Instantiate the Unit Under Test (UUT)
	pattern_generator uut (
		.clk(clk), 
		.rst(rst), 
		.sbmt_in(sbmt_in), 
		.shft_in(shft_in), 
		.addr_in(addr_in), 
		.ptrn_out(ptrn_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		sbmt_in = 0;
		shft_in = 0;
		addr_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;

        #105;
        sbmt_in = 1;
        #110;
        sbmt_in = 0;

        #305;
        sbmt_in = 1;
        #310;
        sbmt_in = 0;
	end

    always
        #5 shft_in = ~shft_in;
      
endmodule

