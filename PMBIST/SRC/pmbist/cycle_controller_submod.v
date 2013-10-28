//***********************************************
// Sub-Modules for the Cycle Controller
//***********************************************
`include "defines.v"

//***********************************************
// Control Mux
// 
// The control mux takes the operation and
// polarity from the instruction register and
// outputs the correct operation based on the
// cycle count.
//***********************************************
module control_mux(op_in,pol_in,cyc_cnt_in,op_out,pol_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter   mw          = `MARCH_MAX_OPS;
parameter   rw          = `MARCH_SEQ_SIZE;
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

parameter   cmw_op      = 4; // control mux width for operation
parameter   cmw_pol     = 1; // control mux width for polarity

// High/low bit positions for operation fields
parameter   irpl_op0    = 0;
parameter   irph_op0    = 3;
parameter   irpl_op1    = 4;
parameter   irph_op1    = 7;
parameter   irpl_op2    = 8;
parameter   irph_op2    = 11;
parameter   irpl_op3    = 12;
parameter   irph_op3    = 15;

parameter   irp_op0     = 0;
parameter   irp_op1     = 1;
parameter   irp_op2     = 2;
parameter   irp_op3     = 3;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input   [irw_op-1:0]    op_in;
input   [irw_pol-1:0]   pol_in;    
input   [cs-1:0]        cyc_cnt_in;
output  [cmw_op-1:0]    op_out;
output  [cmw_pol-1:0]   pol_out;

reg     [cmw_op-1:0]    op_out;
reg     [cmw_pol-1:0]   pol_out;
//-----------------------------------------------
// Internal Signals
//-----------------------------------------------

//-----------------------------------------------
// Module Definition
//-----------------------------------------------
always @(cyc_cnt_in or op_in or pol_in)
  case (cyc_cnt_in)
    0: begin
      op_out <= op_in[irph_op0:irpl_op0];
      pol_out <= pol_in[irp_op0];
    end
    1: begin
      op_out <= op_in[irph_op1:irpl_op1];
      pol_out <= pol_in[irp_op1];
    end
    2: begin
      op_out <= op_in[irph_op2:irpl_op2];
      pol_out <= pol_in[irp_op2];
    end
    3: begin
      op_out <= op_in[irph_op3:irpl_op3];
      pol_out <= pol_in[irp_op3];
    end
  endcase


endmodule

//***********************************************
// Cycle Counter
//
// Indicates the cycle count for the current
//***********************************************
module cycle_counter(clk,r_in,cyc_cnt_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    mw        = `MARCH_MAX_OPS;
parameter    rw        = `MARCH_SEQ_SIZE;
parameter    cs        = `CYCLE_COUNTER_SIZE;
//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                clk;
input                r_in;
output  [cs-1:0]     cyc_cnt_out;

reg     [cs-1:0]     cyc_cnt_out;
//-----------------------------------------------
// Internal Signals
//-----------------------------------------------

//-----------------------------------------------
// Module Definition
//-----------------------------------------------
always @(posedge clk)
  
  // Reset
  if (r_in == 1'b1) begin 
    cyc_cnt_out <= 2'b0;
  end

  // Counter-Mode
  else begin
    cyc_cnt_out <= cyc_cnt_out + 1'b1;
  end

endmodule

//***********************************************
// Comparator
//***********************************************
module comparator(no,cyc_cnt_in,cmp_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter   mw          = `MARCH_MAX_OPS;
parameter   rw          = `MARCH_SEQ_SIZE;
parameter   cs          = `CYCLE_COUNTER_SIZE;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input   [cs-1:0]    no;
input   [cs-1:0]    cyc_cnt_in;
output              cmp_out;

reg                 cmp_out;
//-----------------------------------------------
// Internal Signals
//-----------------------------------------------

//-----------------------------------------------
// Module Definition
//-----------------------------------------------
always @(cyc_cnt_in or no) 
  if (cyc_cnt_in == no) begin
    cmp_out <= 1'b1;
  end else begin
    cmp_out <= 1'b0;
  end

endmodule
