// address_counter.v
`include "defines.v"

//***********************************************
// Address Counter 
//***********************************************
module address_counter(clk,rst,hold_in,updwn_in,s_in,r_in,tas_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    tasw        = `ADDR_WIDTH;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input                   hold_in;
input                   updwn_in;
input                   s_in;
input                   r_in;

output  [tasw-1:0]      tas_out;

reg     [tasw-1:0]      tas_out;
//-----------------------------------------------
// Internal Signals
//-----------------------------------------------


//***********************************************
// Module definition
//***********************************************

// Control Signal Truth Table
// TS = test start
// UD = address up or down ordering
//  S = sequential order?
//  R = reverse order?
//
// TS UD | S  R
// ------+-----
//  0  0 | 0  0 (addr inc up)
//  0  1 | 0  0 (addr dec down)
//  1  0 | 1  0 (addr set to first location)
//  1  1 | 0  1 (addr set to last location)

always @(posedge clk)
  if (rst) begin
    tas_out <= 0;
  end else if (s_in == 1) begin
    tas_out <= 0;
  end else if (r_in == 1) begin
    tas_out <= 4'hf;
  end else if (hold_in == 1) begin
    tas_out <= tas_out;
  end else if (updwn_in == 0) begin 
    tas_out <= tas_out + 1;
  end else begin // (updwn_in == 1)
    tas_out <= tas_out - 1;
  end


endmodule

 
