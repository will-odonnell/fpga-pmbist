//***********************************************
// Module Name 
//***********************************************
`include "defines.v"

module data_comparator(bist_data_in,mem_data_in,passfail_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    dw = `DATA_WIDTH;
parameter    aw = `ADDR_WIDTH;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input   [dw-1:0]    bist_data_in;
input   [dw-1:0]    mem_data_in;
output              passfail_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------
assign    passfail_out = bist_data_in ^ mem_data_in;

//***********************************************
// Module definition
//***********************************************

endmodule 
