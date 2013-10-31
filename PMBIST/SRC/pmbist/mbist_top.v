//***********************************************
// Top-level module for memory BIST.  
//
// Corresponds to Figure 1 
//***********************************************
module mbist_top(clk,rst,ts_in,scan_in,tas_out,tcs_out,tds_out,passfail_out);
`include "defines.v"

//-----------------------------------------------
// Parameters
//-----------------------------------------------
parameter   dw          = `DATA_WIDTH;
parameter   mw          = `MARCH_MAX_OPS;
parameter   rw          = `MARCH_SEQ_SIZE;
parameter   sw          = `SCAN_WIDTH;
parameter   tasw        = `ADDR_WIDTH;
parameter   tcsw        = `MARCH_SEQ_FRMT_SIZE;
parameter   tdsw        = `DATA_WIDTH;
    
// Scan register bitfields high and low bit positions (scan position low/high)
parameter   spl_admd    = `SCAN_BFP_ADMD;
parameter   sph_admd    = `SCAN_BFP_ADMD + `SCAN_BFW_ADMD - 1;
parameter   spl_w       = `SCAN_BFP_W;
parameter   sph_w       = `SCAN_BFP_W + `SCAN_BFW_W - 1;
parameter   spl_data    = `SCAN_BFP_DATA;
parameter   sph_data    = `SCAN_BFP_DATA + `SCAN_BFW_DATA - 1;
parameter   spl_no      = `SCAN_BFP_NO;
parameter   sph_no      = `SCAN_BFP_NO + `SCAN_BFW_NO - 1;
parameter   spl_pol     = `SCAN_BFP_POL;
parameter   sph_pol     = `SCAN_BFP_POL + `SCAN_BFW_POL - 1;
parameter   spl_op      = `SCAN_BFP_OP;
parameter   sph_op      = `SCAN_BFP_OP + `SCAN_BFW_OP - 1;
parameter   spl_updwn   = `SCAN_BFP_UPDWN;
parameter   sph_updwn   = `SCAN_BFP_UPDWN + `SCAN_BFW_UPDWN - 1;

// Scan register widths for each bitfield (scan width)
parameter   sw_admd     = `SCAN_BFW_ADMD;
parameter   sw_w        = `SCAN_BFW_W;
parameter   sw_data     = `SCAN_BFW_DATA;
parameter   sw_no       = `SCAN_BFW_NO;
parameter   sw_pol      = `SCAN_BFW_POL;
parameter   sw_op       = `SCAN_BFW_OP;
parameter   sw_updwn    = `SCAN_BFW_UPDWN;

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
//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input                   ts_in;
input       [sw-1:0]    scan_in;

output      [tasw-1:0]  tas_out;
output      [tcsw-1:0]  tcs_out;
output      [tdsw-1:0]  tds_out;
output                  passfail_out;

//-----------------------------------------------
// Internal Wires and Registers 
//-----------------------------------------------

// Scan-path to IR
wire    [sw_admd-1:0]   spir_admd;  // address mode
wire    [sw_w-1:0]      spir_w;     // w signal
wire    [sw_data-1:0]   spir_data;  // data
wire    [sw_no-1:0]     spir_no;    // no signal
wire    [sw_pol-1:0]    spir_pol;   // polarity
wire    [sw_op-1:0]     spir_op;    // operation
wire    [sw_updwn-1:0]  spir_updwn; // up down signal

// Instruction Register 
wire    [irw_op-1:0]    ircc_op;  // operation to Cycle Controller
wire    [irw_pol-1:0]   ircc_pol; // polarity to Cycle Controller
wire    [irw_no-1:0]    ircc_no;  // NO signal to Cycle Controller
wire    [irw_admd-1:0]  irac_admd;// address mode to Address Counter
wire    [irw_updwn-1:0] ir_updwn; // up/dwn signal to mulitple
wire    [irw_data-1:0]  ir_data;  // data field to multiple
wire    [irw_te-1:0]    xxir_te;  // te signal from TBD to IR 

// Cycle Controller
wire    [rw-1:0]    ccfm_op;  // operation to formatting block
wire                cc_cmpff; // comparator's flipflop to multiple
wire                cc_cmp;   // comparator output to multiple
wire                cc_pol;   // polarity from control mux to logic

// Formatting
wire    [tcsw-1:0]   fmocr_op; // formatting to operation control register

// Inverted Cycle Controller Flip-Flop
wire                cmpff_inv; // inverted cc_cmpff signal

// Data-Polarity logic output
wire    [dw-1:0]    dl_data; // data after passing through polarity XOR-gate

// Up/Down Flip-Flop
wire                udff_q;   // q output to logic

// Logic Signals
wire                ir_hold;  // instruction register hold
wire                ac_hold;  // address counter hold
wire                ac_s;     // address counter s variable
wire                ac_r;     // address counter r variable


// Decode Logic to Instruction Register hold logic
wire                dlirh_lu;
wire                dlirh_;

// Memory compare signals
wire	[tdsw-1:0]  mem;

wire    [tasw-1:0]  tas;    // TAS bus
wire    [tcsw-1:0]  tcs;    // TCS bus
wire    [tdsw-1:0]  tds;    // TDS bus

//***********************************************
// Module Instantiations
//***********************************************
assign spir_admd    = scan_in[sph_admd:spl_admd];
assign spir_w       = scan_in[sph_w:spl_w];
assign spir_data    = scan_in[sph_data:spl_data];
assign spir_no      = scan_in[sph_no:spl_no];
assign spir_pol     = scan_in[sph_pol:spl_pol];
assign spir_op      = scan_in[sph_op:spl_op];
assign spir_updwn   = scan_in[sph_updwn:spl_updwn];

instruction_register
  inst_reg(
    .clk(clk),
    .rst(rst),
    .updwn_in(spir_updwn),
    .op_in(spir_op),
    .pol_in(spir_pol),
    .no_in(spir_no),
    .data_in(spir_data),
    .w_in(spir_w),
    .admd_in(spir_admd),
    .te_in(xxir_te),
    .hold_in(ir_hold),
    .updwn_out(ir_updwn),
    .op_out(ircc_op),
    .pol_out(ircc_pol),
    .no_out(ircc_no),
    .data_out(ir_data),
    .w_out(),
    .admd_out(irac_admd),
    .te_out()
);

cycle_controller
  cyc_ctrl(
    .clk(clk),
    .rst(rst),
    .op_in(ircc_op),
    .pol_in(ircc_pol),
    .no_in(ircc_no),
    .ts_in(ts_in),
    .op_out(ccfm_op),
    .pol_out(cc_pol),
    .cc_cmp_out(cc_cmp),
    .cc_cmpff_out(cc_cmpff)
);

address_counter
  addr_cntr(
    .clk(clk),
    .rst(rst),
    .admd_in(irac_admd),
    .hold_in(ac_hold),
    .updwn_in(ir_updwn),
    .s_in(ac_s),
    .r_in(ac_r),
    .tas_out(tas)
);

decode_logic
  dec_lgc(
    .tas_in(tas),
    .lu_out(dlirh_lu),
    .ld_out(dlirh_ld)
);

data_register
  data_reg(
    .clk(clk),
    .rst(rst),
    .data_in(dl_data),
    .data_out(tds)
);

data_comparator
  data_comp(
    .bist_data_in(tds),
    .mem_data_in(mem),
    .passfail_out(passfail)
);

operation_formatting
  op_fmt(
    .op_in(ccfm_op),
    .op_out(fmocr_op)
);

operation_control_register
  op_ctrl_reg(
    .clk(clk),
    .rst(rst),
    .op_in(fmocr_op),
    .op_out(tcs)
);

flipflop
  udff(
    .clk(clk),
    .rst(rst),
    .d_in(ir_updwn),
    .q_out(udff_q)
);

instruction_register_hold
  logic_ir_hold(
    .lu_in(dlirh_lu),
    .ld_in(dlirh_ld),
    .updwn_in(ir_updwn),
    .ts_in(ts_in),
    .cc_comp_in(cc_comp),
    .hold_out(ir_hold)
);

address_counter_hold
  addr_cntr_hold(
    .cmpff_in(cc_cmpff),
    .udff_q_in(udff_q),
    .ir_updwn_in(ir_updwn),
    .hold_out(ac_hold)
);

address_counter_up_down
  logic_addr_updwn(
    .updwn_in(ir_updwn),
    .ts_in(ts_in),
    .s_out(ac_s),
    .r_out(ac_r)
);

data_polarity
  data_pol_logic(
    .data_in(ir_data),
    .pol_in(cc_pol),
    .data_out(dl_data)
);

//-----------------------------------------------
// Module Logic
//-----------------------------------------------
assign tas_out = tas;
assign tcs_out = tcs;
assign tds_out = tds;
assign passfail_out = passfail;

endmodule 
