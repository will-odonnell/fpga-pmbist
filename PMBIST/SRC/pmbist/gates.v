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


