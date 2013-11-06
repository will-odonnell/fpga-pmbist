`include "defines.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:39 11/04/2013 
// Design Name: 
// Module Name:    pattern_generator 
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
module pattern_generator(clk,rst,sbmt_in,shft_in,ptrn_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter   gw      = `GRAY_COUNTER_WIDTH;
parameter   dw      = `DATA_WIDTH;

//-----------------------------------------------
// Input/Output Ports
//-----------------------------------------------
input               clk;
input               rst;
input               sbmt_in;
input               shft_in;
output  [dw-1:0]    ptrn_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------
reg     [gw-1:0]    count;      // internal counter
wire    [gw-1:0]    g;          // gray code, shortened name for assignments
wire    [gw-1:0]    e;          // Eulerian number, shortened name for assignments
reg     [2:0]       selcnt;     // mux select counter
reg     [2:0]       tilcnt;     // tiler counter for pattern shifter
wire                update;
//***********************************************
// Module definition
//***********************************************

// 5-bit counter to feed gray coding
always @(posedge rst or posedge sbmt_in) begin
    if (rst) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
end

// 3-bit counter to track number of submits to 
// select the correct pattern to generate
always @(posedge rst or posedge shft_in) begin
    if (rst) begin
        tilcnt <= 0;
    end else begin
        if (tilcnt == 4) begin
            tilcnt <= 0;
        end else begin     
           tilcnt <= tilcnt + 1;
        end
    end
end

// 3-bit counter to select the mux input to
// generate the correct column for Euler numbers.
always @(posedge rst or posedge update) begin
    if (rst) begin
        selcnt <= 0;
    end else begin
        if (selcnt == 4) begin
            selcnt <= 0;
        end else begin
            selcnt <= selcnt + 1;
        end
    end
end

// Generate the update signal
assign update = ~(count[4] | count[3] | count[2] | count[1] | count[0]);

// Convert counter to gray coding
assign g[4] = count[4];
assign g[3] = count[3]^count[4];
assign g[2] = count[2]^count[3];
assign g[1] = count[1]^count[2];
assign g[0] = count[0]^count[1];

// Transform the gray coding to the correct Eulerian number
assign e[4] = (selcnt == 0) ?  g[4] :
              (selcnt == 1) ? ~g[0] :
              (selcnt == 2) ?  g[1] :
              (selcnt == 3) ?  g[2] :
              (selcnt == 4) ?  g[3] :
              0;
assign e[3] = (selcnt == 0) ?  g[3] :
              (selcnt == 1) ?  g[4] :
              (selcnt == 2) ? ~g[0] :
              (selcnt == 3) ?  g[1] :
              (selcnt == 4) ?  g[2] :
              0;
assign e[2] = (selcnt == 0) ?  g[2] :
              (selcnt == 1) ?  g[3] :
              (selcnt == 2) ?  g[4] :
              (selcnt == 3) ? ~g[0] :
              (selcnt == 4) ?  g[1] :
              0;
assign e[1] = (selcnt == 0) ?  g[1] :
              (selcnt == 1) ?  g[2] :
              (selcnt == 2) ?  g[3] :
              (selcnt == 3) ?  g[4] :
              (selcnt == 4) ? ~g[0] :
              0;
assign e[0] = (selcnt == 0) ?  g[0] :
              (selcnt == 1) ? ~g[1] :
              (selcnt == 2) ? ~g[2] :
              (selcnt == 3) ? ~g[3] :
              (selcnt == 4) ? ~g[4] :
              0;

// Select the gray coding bits to generate the data pattern
assign ptrn_out = (tilcnt == 0) ? {e[0],e[1],e[2],e[3],e[4],e[0],e[1],e[2]} :
                  (tilcnt == 1) ? {e[2],e[3],e[4],e[0],e[1],e[2],e[3],e[4]} : 
                  (tilcnt == 2) ? {e[4],e[0],e[1],e[2],e[3],e[4],e[0],e[1]} : 
                  (tilcnt == 3) ? {e[1],e[2],e[3],e[4],e[0],e[1],e[2],e[3]} :                   
                  (tilcnt == 4) ? {e[3],e[4],e[0],e[1],e[2],e[3],e[4],e[0]} :
                  8'hff;
endmodule
