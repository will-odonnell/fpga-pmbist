// registers.v
`include "defines.v"

//***********************************************
// Instruction Register 
//***********************************************
module instruction_register(
    clk,
    rst,
    updwn_in,
    op_in,
    pol_in,
    no_in,
    data_in,
    w_in,
    admd_in,
    te_in,
    hold_in,
    updwn_out,
    op_out,
    pol_out,
    no_out,
    data_out,
    w_out,
    admd_out,
    te_out
);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
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

parameter   irw_te      = `IR_BFW_TE;
parameter   irw_admd    = `IR_BFW_ADMD;
parameter   irw_w       = `IR_BFW_W;
parameter   irw_data    = `IR_BFW_DATA;
parameter   irw_no      = `IR_BFW_NO;
parameter   irw_pol     = `IR_BFW_POL;
parameter   irw_op      = `IR_BFW_OP;
parameter   irw_updwn   = `IR_BFW_UPDWN; 

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                       clk;
input                       rst;
input   [irw_updwn-1:0]     updwn_in;
input   [irw_op-1:0]        op_in;
input   [irw_pol-1:0]       pol_in;
input   [irw_no-1:0]        no_in;
input   [irw_data-1:0]      data_in;
input   [irw_w-1:0]         w_in;
input   [irw_admd-1:0]      admd_in;
input   [irw_te-1:0]        te_in;
input                       hold_in;
output  [irw_updwn-1:0]     updwn_out;
output  [irw_op-1:0]        op_out;
output  [irw_pol-1:0]       pol_out;
output  [irw_no-1:0]        no_out;
output  [irw_data-1:0]      data_out;
output  [irw_w-1:0]         w_out;
output  [irw_admd-1:0]      admd_out;
output  [irw_te-1:0]        te_out;
        
reg     [irw_updwn-1:0]     updwn_out;
reg     [irw_op-1:0]        op_out;
reg     [irw_pol-1:0]       pol_out;
reg     [irw_no-1:0]        no_out;
reg     [irw_data-1:0]      data_out;
reg     [irw_w-1:0]         w_out;
reg     [irw_admd-1:0]      admd_out;
reg     [irw_te-1:0]        te_out;


//-----------------------------------------------
// Module definition
//-----------------------------------------------
always @(posedge clk) 

  if (rst) begin
    updwn_out   <= 1'b0;
    op_out      <= 16'b0;
    pol_out     <= 4'b0;
    no_out      <= 1'b0;
    data_out    <= 8'b0;
    w_out       <= 1'b0;
    admd_out    <= 4'b0;
    te_out      <= 1'b0;

  // if hold is not enabled, then allow register to update values.
  end else if (~hold_in) begin
    updwn_out   <= updwn_in;
    op_out      <= op_in;
    pol_out     <= pol_in;
    no_out      <= no_in;
    data_out    <= data_in;
    w_out       <= w_in;
    admd_out    <= admd_in;
   
    // Not clear what block sets this field
    // explicitly setting to 0.
    te_out    <= 1'b0;
  
  end

endmodule

//***********************************************
// Operation Control Register
//*********************************************** 
module operation_control_register(clk,rst,op_in,op_out,sbmt_out,shft_out,dmux_out);
`include "defines.v"
//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    opw    = `IR_BFW_OP_SING;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input   [opw-1:0]       op_in;
output  [opw-1:0]       op_out;
output                  sbmt_out;   // data gen submit signal
output                  shft_out;   // data gen shift signal
output                  dmux_out;   // data mux select signal

reg     [opw-1:0]       op_out;
reg                     sbmt_out;
reg                     shft_out;
reg                     dmux_out;

reg     [5:0]           sbmtcnt;
reg     [5:0]           shftcnt;

//-----------------------------------------------
// Module Definition
//-----------------------------------------------
always @(posedge clk)
  if (rst) begin
    op_out <= 1'b0;
    sbmt_out <= 1'b0;
    shft_out <= 1'b0;
    sbmtcnt  <= 0;
    shftcnt  <= 0;
    dmux_out <= 0;
  end else begin
    op_out <= op_in;
    dmux_out <= op_in[2];
    
    // Have submit and shift output some values that change over time
    // These need to be fine tuned for the system.  This is just 
    // an example.
    if (sbmtcnt < 32) begin
        // Pulse submit out on every 32 clock
        sbmtcnt <= sbmtcnt + 1;
        if (sbmtcnt == 0) begin
            sbmt_out <= 1;
        end else begin
            sbmt_out <= 0;
        end
        
        // Pulse shift out on every clock
        shft_out = ~shft_out;
        
    end else begin
        // Reset everything after 32 clocks
        sbmtcnt <= 0;
        shftcnt <= 0;
        sbmt_out <= 0;
        shft_out <= 0;
    end
  end

endmodule

//***********************************************
// Data Register
//*********************************************** 
module data_register(clk,rst,data_in,data_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    dw     = `DATA_WIDTH;


//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input               clk;
input               rst;
input   [dw-1:0]    data_in;
output  [dw-1:0]    data_out;

reg     [dw-1:0]    data;

//-----------------------------------------------
// Module Definition
//-----------------------------------------------
assign data_out = data;
always @(posedge clk)
  if (rst) begin
    data <= 1'b0;
  end else begin
    data <= data_in;
  end

endmodule



