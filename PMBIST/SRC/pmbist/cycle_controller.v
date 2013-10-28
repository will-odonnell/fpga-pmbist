//cycle_controller.v
`include "defines.v"

//***********************************************
// Cycle Controller 
//
// This block contains the cycle controller which
// is composed of a cycle counter, control MUX,
// comparator and a D flip-flop.
//***********************************************
module cycle_controller(clk,rst,op_in,pol_in,no_in,ts_in,op_out,pol_out,cc_cmp_out,cc_cmpff_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter   mw          = `MARCH_MAX_OPS;
parameter   cs          = `CYCLE_COUNTER_SIZE;

// Instruction register bitfields high and low positions
parameter   irl_te      = `IR_BFP_TE;
parameter   irh_te      = `IR_BFP_TE + `IR_BFW_TE - 1;
parameter   irl_admd    = `IR_BFP_ADMD;
parameter   irh_admd    = `IR_BFP_ADMD + `IR_BFW_ADMD - 1;
parameter   irl_w       = `IR_BFP_W;
parameter   irh_w       = `IR_BFP_W + `IR_BFW_W - 1;
parameter   irl_data    = `IR_BFP_DATA;
parameter   irh_data    = `IR_BFP_DATA + `IR_BFW_DATA - 1;
parameter   irl_no      = `IR_BFP_NO;
parameter   irh_no      = `IR_BFP_NO + `IR_BFW_NO - 1;
parameter   irl_pol     = `IR_BFP_POL;
parameter   irh_pol     = `IR_BFP_POL + `IR_BFW_POL -1;
parameter   irl_op      = `IR_BFP_OP;
parameter   irh_op      = `IR_BFP_OP + `IR_BFW_OP - 1;
parameter   irl_updwn   = `IR_BFP_UPDWN;
parameter   irh_updwn   = `IR_BFP_UPDWN + `IR_BFW_UPDWN - 1;

// Instruction register widths for each bitfield
parameter   irw_te      = `IR_BFW_TE;
parameter   irw_admd    = `IR_BFW_ADMD;
parameter   irw_w       = `IR_BFW_W;
parameter   irw_data    = `IR_BFW_DATA;
parameter   irw_no      = `IR_BFW_NO;
parameter   irw_pol     = `IR_BFW_POL;
parameter   irw_op      = `IR_BFW_OP;
parameter   irw_updwn   = `IR_BFW_UPDWN; 

// Cycle Controller signal widths
parameter   ccw_pol     = `IR_BFW_POL_SING;
parameter   ccw_op      = `IR_BFW_OP_SING;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input   [irw_op-1:0]    op_in;
input   [irw_pol-1:0]   pol_in;
input   [irw_no-1:0]    no_in;
input                   ts_in;

output  [ccw_op-1:0]    op_out;
output  [ccw_pol-1:0]   pol_out;
output                  cc_cmp_out;
output                  cc_cmpff_out;

wire    [ccw_op-1:0]    op_out;
wire    [ccw_pol-1:0]   pol_out;
wire    [ccw_op-1:0]    op;
wire    [ccw_pol-1:0]   pol;
wire                    cc_cmp_out;
wire                    cc_cmpff_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------

wire    [cs-1:0]        cc_cnt; // Cycle Counter's cycle count
wire                    cp_cmp; // Comparator Output
wire                    cc_r;   // Cycle Controller reset signal

//***********************************************
// Module Definition
//***********************************************

//-----------------------------------------------
// Module Instantiations
//-----------------------------------------------
control_mux 
  ctrl_mux(
    .op_in(op_in),
    .pol_in(pol_in),
    .cyc_cnt_in(cc_cnt),
    .op_out(op),
    .pol_out(pol)
);

cycle_counter
  cyc_cntr(
    .clk(clk),
    .r_in(cc_r),
    .cyc_cnt_out(cc_cnt)
);

comparator
  cmpr(
    .no(no_in),
    .cyc_cnt_in(cc_cnt),
    .cmp_out(cp_cmp)
);     

flipflop
  cmpr_ff(
    .clk(clk),
    .rst(rst),
    .d_in(cp_cmp),
    .q_out(ccff_q)
);

//-----------------------------------------------
// Module Logic
//-----------------------------------------------
assign cc_r = ts_in || ccff_q;
assign cc_cmp_out = cp_cmp;
assign cc_cmpff_out = ccff_q;

assign op_out = op;
assign pol_out = pol;

endmodule // cycle_controller
 
