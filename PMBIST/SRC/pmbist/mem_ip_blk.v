
`timescale 1ns/1ps
`include "defines.v"

//***********************************************
// Module Name 
//***********************************************
module memory_ip_block(clk,rst,scan,ts,passfail);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter   dw          = `DATA_WIDTH;
parameter   aw          = `ADDR_WIDTH;
parameter   sw          = `SCAN_WIDTH;
parameter   tasw        = `ADDR_WIDTH;
parameter   tcsw        = `MARCH_SEQ_FRMT_SIZE;    
parameter   tdsw        = `DATA_WIDTH;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input               	clk;
input               	rst;
input    [sw-1:0]	scan;
input               	ts;
output              	passfail;

reg                 	passfail;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------
wire    [tasw-1:0]  tas;    // test address signals
wire    [tcsw-1:0]  tcs;    // test control bits 

wire    [dw-1:0]    mut_data;

// TDS data signal bus and enable signals
tri     [tdsw-1:0]  tds;     // memory under test (mut) data bus
wire    [tdsw-1:0]  mb_tds;  // mbist tds output
wire    [tdsw-1:0]  am_tds;  // auxillary memory tds output

reg     [tdsw-1:0]  mb_tds_en;    
reg     [tdsw-1:0]  am_tds_en;

// MBIST output
wire                mb_passfail;

//***********************************************
// Module definition
//***********************************************
assign tds_bus = mb_tds_en ? mb_tds : 8'hzz;
assign tds_bus = am_tds_en ? am_tds : 8'hzz;  

mbist_top
  mbist (
    .clk(clk),
    .rst(rst),
    .ts_in(ts),
    .scan_in(scan),
    .tas_out(tas),
    .tcs_out(tcs),
    .tds_out(mb_tds),
    .passfail_out(mb_passfail)
);

memory_under_test
  mut (
    .clk(clk),
    .rst(rst),
    .cmd_in(tcs),
    .addr_in(tas),
    .data_in(tds),
    .data_out(mut_data)
);

auxillary_memory
  aux_mem (
    .clk(clk),
    .rst(rst),
    .cmd_in(tcs),
    .addr_in(tas),
    .data_in(scan[7:0]),
    .data_out(am_tds)
);  

always @(posedge clk) 

  if (rst) begin
    mb_tds_en <= 1'b0;
    passfail  <= 1'b0;
  end else begin
    mb_tds_en <= 1'b0;
    passfail  <= mb_passfail;
  end

endmodule
