// address_counter.v
`include "defines.v"

//***********************************************
// Address Counter 
//***********************************************
module address_counter(clk,rst,admd_in,hold_in,updwn_in,s_in,r_in,tas_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter   tasw        = `ADDR_WIDTH;
parameter   admw        = `IR_BFW_ADMD;
//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input   [admw-1:0]      admd_in;
input                   hold_in;
input                   updwn_in;
input                   s_in;
input                   r_in;

output  [tasw-1:0]      tas_out;
reg     [tasw-1:0]      tas_out;

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
    tas_out <= 0;
  
  // Set to first address
  end else if (s_in == 1) begin
    if (admd_in == `ADMD_LIUD) begin
        count <= `ADMD_LIUD_FIRST;
        tas_out <= `ADMD_LIUD_FIRST;
    end else if (admd_in == `ADMD_PRUD) begin
        count <= `ADMD_PR_SEED;
        tas_out <= `ADMD_PR_SEED;
    end 
  
  // Set to last address (reverse)
  end else if (r_in == 1) begin
    if (admd_in == `ADMD_LIUD) begin
        count <= `ADMD_LIUD_LAST;
        tas_out <= `ADMD_LIUD_LAST;
    end else if (admd_in == `ADMD_PRUD) begin
        count <= `ADMD_PR_SEED;
        tas_out <= `ADMD_PR_SEED;
    end 
  
  // Keep the address steady while tests run
  end else if (hold_in == 1) begin
    count <= count;
    tas_out <= count;

  //-----------------------------------------------------------------
  // Handle Address Modes
  //-----------------------------------------------------------------
  end else begin
  case (admd_in) 
    `ADMD_PRUD: begin
        // LFSR implementation
        // P(x) = (x^8)+(x^6)+(x^5)+(x^4)+1
        if (updwn_in == 0) begin
            count[7:1] <= count[6:0];   
            count[0] <= (((count[7]^count[5])^count[4])^count[3]);
            tas_out[7:1] <= count[6:0];   
            tas_out[0] <= (((count[7]^count[5])^count[4])^count[3]);
        end else begin
            count[6:0] <= count[7:1];   
            count[7] <= (((count[0]^count[5])^count[4])^count[3]);
            tas_out[6:0] <= count[7:1];   
            tas_out[7] <= (((count[0]^count[5])^count[4])^count[3]);
        end
    end

    `ADMD_LIUD: begin
        if(updwn_in == `ADDR_UP) begin
            count <= count + 1;
            tas_out <= count + 1;
        end else begin
            count <= count - 1;
            tas_out <= count - 1;
        end
    end
    
    `ADMD_AC: begin
        // Perform the counter next value as blocking statement
        if(updwn_in == `ADDR_UP) begin
            count <= count + 1;
        end else begin
            count <= count - 1;
        end
        
       // Only bit 7 is dependent on up/down
        if (updwn_in == `ADDR_UP) begin
            tas_out[7] <= count[0];
        end else begin
            tas_out[7] <= ~count[0];
        end
        // Transform the rest of the bits
            tas_out[6] <= count[7]^count[0];
            tas_out[5] <= count[6]^count[0];
            tas_out[4] <= count[5]^count[0];
            tas_out[3] <= count[4]^count[0];
            tas_out[2] <= count[3]^count[0];
            tas_out[1] <= count[2]^count[0];
            tas_out[0] <= count[1]^count[0];
    end
    
  endcase
end 
 
endmodule
