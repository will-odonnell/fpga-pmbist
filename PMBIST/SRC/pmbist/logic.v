// logic.v
`include "defines.v"

//***********************************************
// Logic Blocks
//***********************************************


//***********************************************
// Generates the S,R inputs to the address counter
//***********************************************
module address_counter_up_down(updwn_in, ts_in, s_out, r_out);

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input               updwn_in;
input               ts_in;
output              s_out;
output              r_out;

wire                s_out;
wire                r_out;
//-----------------------------------------------
// Module definition
//-----------------------------------------------

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

assign s_out = ~updwn_in & ts_in;
assign r_out =  updwn_in & ts_in;

endmodule 

//***********************************************
// Generates the hold signal for address counter
//***********************************************
module address_counter_hold(cmpff_in, udff_q_in, ir_updwn_in, hold_out);

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input               cmpff_in;
input               udff_q_in;
input               ir_updwn_in;
output              hold_out;

wire                hold_out;
//-----------------------------------------------
// Module definition
//-----------------------------------------------
assign hold_out = (udff_q_in ^ ir_updwn_in) | ~cmpff_in;

endmodule

//***********************************************
// Generates the hold signal for instruction register
//***********************************************
module instruction_register_hold(lu_in, ld_in, updwn_in, ts_in, cc_comp_in, hold_out);

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input               lu_in;
input               ld_in;
input               updwn_in;
input               ts_in;
input               cc_comp_in;
output              hold_out;

wire                hold;
wire                or1;

//-----------------------------------------------
// Module Definition
//-----------------------------------------------

assign or1  =  ((lu_in && updwn_in) || (ld_in && ~updwn_in));
assign hold = ~((or1 && cc_comp_in) || (ts_in));
assign hold_out = hold;

endmodule

//***********************************************
// Polarizes the data based on control mux output
//***********************************************
module data_polarity (data_in, pol_in, data_out);

parameter   dw  = `DATA_WIDTH;

//-----------------------------------------------
// Input/Output 
//-----------------------------------------------
input   [dw-1:0]    data_in;
input               pol_in;
output  [dw-1:0]    data_out;

wire                pol_exp;  // expands polarity bit
//-----------------------------------------------
// Module Definition
//-----------------------------------------------
//assign pol_exp = {dw{pol_in}};
assign pol_exp = {8{1'b1}};
assign data_out = data_in ^ pol_exp;

endmodule




