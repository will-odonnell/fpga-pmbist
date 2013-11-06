// gates.v
`include "defines.v"

//***********************************************
// Generic Logic Gates 
//***********************************************

//-----------------------------------------------
// D Flip-Flop
//-----------------------------------------------
module flipflop (clk,rst,d_in,q_out);

input     clk;
input     rst;
input     d_in;
output    q_out;

reg       q_out;

always @(posedge clk)
  if(rst) begin
    q_out <= 1'b0;
  end else begin 
    q_out <= d_in;
  end

endmodule

//-----------------------------------------------
// D Flip-Flop with Q and Q' output
//-----------------------------------------------
module flipflop2q (clk,rst,d_in,q_out,qb_out);

input     clk;
input     rst;
input     d_in;
output    q_out;
output    qb_out;
reg       q_out;
reg       qb_out;

always @(posedge clk)
  if(rst) begin
    q_out <= 1'b0;
    qb_out <= 1'b1;
  end else begin 
    q_out <= d_in;
    qb_out <= ~d_in;
  end

endmodule

//-----------------------------------------------
// 8-bit 2-way mux
//-----------------------------------------------
module mux2x8 (a_in,b_in,s_in,d_out);

parameter   dw      = `DATA_WIDTH;

input   [dw-1:0]    a_in;
input   [dw-1:0]    b_in;
input               s_in;
output  [dw-1:0]    d_out;

assign d_out = (s_in) ? a_in : b_in;

endmodule



