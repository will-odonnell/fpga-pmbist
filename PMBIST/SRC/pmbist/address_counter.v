// address_counter.v
`include "defines.v"

//***********************************************
// Address Counter 
//***********************************************
module address_counter(clk,rst,admd_in,hold_in,updwn_in,s_in,r_in,tas_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    tasw        = `ADDR_WIDTH;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input                   admd_in;
input                   hold_in;
input                   updwn_in;
input                   s_in;
input                   r_in;

output  [tasw-1:0]      tas_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------
reg     [tasw-1:0]      count;  // internal counter

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
  
  // Block in reset
  if (rst) begin
    count <= 0;
  
  // Set to first address
  end else if (s_in == 1) begin
    if (admd_in == `ADMD_LIUD) begin
        count <= `ADMD_LIUD_FIRST;
    end else if (admd_in == `ADMD_PRUD) begin
        count <= `ADMD_PR_SEED;
    end 
  
  // Set to last address (reverse)
  end else if (r_in == 1) begin
    if (admd_in == `ADMD_LIUD) begin
        count <= `ADMD_LIUD_LAST;
    end else if (admd_in == `ADMD_PRUD) begin
        count <= `ADMD_PR_SEED;
    end 
  
  // Keep the address steady while tests run
  end else if (hold_in == 1) begin
    count <= count;

  // Psuedo-random up/down
  end else if (admd_in == `ADMD_PRUD) begin
    // LFSR implementation
    // P(x) = (x^8)+(x^6)+(x^5)+(x^4)+1
    if (updwn_in == 0) begin
        count[7:1] <= count[6:0];   
        count[0] <= (((count[7]^count[5])^count[4])^count[3]);
    end else begin
        count[6:0] <= count[7:1];   
        count[7] <= (((count[0]^count[5])^count[4])^count[3]);
    end

  // All other counting methods use linear up/down
  end else begin
    if (updwn_in == 0) begin
        count <= count + 1;
    end else begin
        count <= count - 1;    
    end
  end
  
endmodule