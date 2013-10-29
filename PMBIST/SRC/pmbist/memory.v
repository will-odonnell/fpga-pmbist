// memory.v
`include "defines.v"

//***********************************************
// Module Name 
//***********************************************
module memory_under_test(clk,rst,cmd_in,addr_in,data_in,data_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    dw = `DATA_WIDTH;
parameter    aw = `ADDR_WIDTH;
parameter   sw          = `SCAN_WIDTH;
parameter   tasw        = `ADDR_WIDTH;
parameter   tcsw        = `MARCH_SEQ_FRMT_SIZE;    
parameter   tdsw        = `DATA_WIDTH;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   clk;
input                   rst;
input     [tcsw-1:0]	cmd_in;
input     [aw-1:0]      addr_in;
input     [dw-1:0]      data_in;
output    [dw-1:0]      data_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------


//***********************************************
// Module definition
//***********************************************
blk_mem_32k 
  mem_32k(
    .clka(clk), 
    .rsta(rst),
    .wea(cmd_in[0]),
    .addra(addr_in),
    .dina(data_in),
    .douta(data_out)
);
 
endmodule
