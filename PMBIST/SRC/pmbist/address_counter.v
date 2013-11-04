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
wire    [tasw-1:0]      tas_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------
reg     [tasw-1:0]      count;  // internal counter
//***********************************************
// Module definition
//***********************************************

always @(posedge clk) begin
  
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

  //-----------------------------------------------------------------
  // Handle Address Modes
  //-----------------------------------------------------------------
  end else if (admd_in == `ADMD_PRUD) begin
    // LFSR implementation
    // P(x) = (x^8)+(x^6)+(x^5)+(x^4)+1
    if (updwn_in == `ADDR_UP) begin
        count[7:1] <= count[6:0];   
        count[0] <= (((count[7]^count[5])^count[4])^count[3]);
    end else begin
        count[6:0] <= count[7:1];   
        count[7] <= (((count[0]^count[5])^count[4])^count[3]);
    end
  
  end else begin // all other modes use linear up/down counter
    if(updwn_in == `ADDR_UP) begin
        count <= count + 1;
    end else begin
        count <= count - 1;
    end
  end
end 


assign tas_out[7] = (admd_in == `ADMD_AC)  ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    (admd_in == `ADMD_GC)  ? ((updwn_in == `ADDR_UP) ? count[7] : !count[7]) :
                    (admd_in == `ADMD_2I7) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[7];
assign tas_out[6] = (admd_in == `ADMD_AC)  ? count[7]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[6]^count[7] :
                    (admd_in == `ADMD_2I6) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[6];
assign tas_out[5] = (admd_in == `ADMD_AC)  ? count[6]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[5]^count[6] :
                    (admd_in == `ADMD_2I5) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[5];
assign tas_out[4] = (admd_in == `ADMD_AC)  ? count[5]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[4]^count[5] :
                    (admd_in == `ADMD_2I4) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[4];
assign tas_out[3] = (admd_in == `ADMD_AC)  ? count[4]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[3]^count[4] :
                    (admd_in == `ADMD_2I3) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[3];
assign tas_out[2] = (admd_in == `ADMD_AC)  ? count[3]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[2]^count[3] :
                    (admd_in == `ADMD_2I2) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[2];
assign tas_out[1] = (admd_in == `ADMD_AC)  ? count[2]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[1]^count[2] :
                    (admd_in == `ADMD_2I1) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    count[1];
assign tas_out[0] = (admd_in == `ADMD_AC)  ? count[1]^count[0] : 
                    (admd_in == `ADMD_GC)  ? count[0]^count[1] :
                    (admd_in == `ADMD_2I0) ? ((updwn_in == `ADDR_UP) ? count[0] : !count[0]) :
                    (admd_in == `ADMD_2I1) ? ((updwn_in == `ADDR_UP) ? count[1] : !count[1]) :
                    (admd_in == `ADMD_2I2) ? ((updwn_in == `ADDR_UP) ? count[2] : !count[2]) :
                    (admd_in == `ADMD_2I3) ? ((updwn_in == `ADDR_UP) ? count[3] : !count[3]) :
                    (admd_in == `ADMD_2I4) ? ((updwn_in == `ADDR_UP) ? count[4] : !count[4]) :
                    (admd_in == `ADMD_2I5) ? ((updwn_in == `ADDR_UP) ? count[5] : !count[5]) :
                    (admd_in == `ADMD_2I6) ? ((updwn_in == `ADDR_UP) ? count[6] : !count[6]) :
                    (admd_in == `ADMD_2I7) ? ((updwn_in == `ADDR_UP) ? count[7] : !count[7]) :
                    count[0];

endmodule
