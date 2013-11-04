`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:16 10/22/2013
// Design Name:   memory_ip_block
// Module Name:   /media/datadisk/xilinx/programmable_memory_bist/pmbist_test.v
// Project Name:  programmable_memory_bist
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_ip_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`include "defines.v"

////////////////////////////////////////////////////////////////////////////////
// Test commands

// Single memory write 1, read 1, write 0, read 0
`define TEST_CMD_0 (`IR_UPDWN(0) | \
                    `IR_OP3(0)   | `IR_OP2(1) | `IR_OP1(0) | `IR_OP0(0) | \
                    `IR_POL3(0)  | `IR_POL2(0)| `IR_POL1(0)| `IR_POL0(0)| \
                    `IR_NO(3)    | `IR_DATA(8'hFA)         | `IR_W(0)   | \
                    `IR_ADMD(2))


module pmbist_test;

	// Inputs
	reg clk;
	reg rst;
	reg [`SCAN_WIDTH-1:0] scan;
	reg ts;

	// Outputs
	wire passfail;

	// Instantiate the Unit Under Test (UUT)
	memory_ip_block uut (
		.clk(clk), 
		.rst(rst), 
		.scan(scan), 
		.ts(ts), 
		.passfail(passfail)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		scan = 0;
		ts = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
    end
		// Add stimulus here
    always 
        #5  clk = !clk;
        
    initial begin
        // Input to the BIST
        #10;
        rst = 0;
        
        #15;
        scan = `TEST_CMD_0;
               
        #20;
        ts = 1'b1;
        
        #25;
        ts = 1'b0;
    end
      
endmodule

