//***********************************************
// Definitions for memory BIST 
//***********************************************
`ifndef _define_vh
`define _define_vh
// Maximum number of operations per March sequence.  This field
// corresponds to the "m" parameter in the design.
`define MARCH_MAX_OPS       4

// corresponds to the "k" parameter in the design.
`define DATA_WIDTH          8

// corresponds to the "n" parameter in the design.
`define ADDR_WIDTH          8

// corresponds to the "r" parameter in the design.
`define MARCH_SEQ_SIZE      4

// corresponds to the "R" parameter in the design.
`define MARCH_SEQ_FRMT_SIZE 4

// corresponds to the "w" parameter in the design.
// appears to be the same as DATA_WIDTH

// Cycle counter size in bits
`define CYCLE_COUNTER_SIZE  2

// Gray counter in pattern generator
`define GRAY_COUNTER_WIDTH  5

////////////////////////////////////////////////////////////////////////////////


// Databus enable signals
`define    MB_TDS_EN        1
`define    AM_TDS_EN        0

// Instruction register bitfield widths
`define IR_BFW_TE       1
`define IR_BFW_ADMD     4
`define IR_BFW_W        1
`define IR_BFW_DATA     8
`define IR_BFW_NO       2
`define IR_BFW_POL_SING 1   // Size of polarity for single instruction
`define IR_BFW_POL      (`IR_BFW_POL_SING * `MARCH_MAX_OPS)
`define IR_BFW_OP_SING  4
`define IR_BFW_OP       (`IR_BFW_OP_SING * `MARCH_MAX_OPS)
`define IR_BFW_UPDWN    1    

// Instruction register bitfield positions
`define IR_BFP_START    0   // first bitfield position
`define IR_BFP_TE       (`IR_BFP_START)    
`define IR_BFP_ADMD     (`IR_BFP_TE + `IR_BFW_TE)
`define IR_BFP_W        (`IR_BFP_ADMD + `IR_BFW_ADMD)
`define IR_BFP_DATA     (`IR_BFP_W + `IR_BFW_W)
`define IR_BFP_NO       (`IR_BFP_DATA + `IR_BFW_DATA)
`define IR_BFP_POL      (`IR_BFP_NO + `IR_BFW_NO)
`define IR_BFP_OP       (`IR_BFP_POL + `IR_BFW_POL)
`define IR_BFP_UPDWN    (`IR_BFP_OP + `IR_BFW_OP)

// Scan register bitfield widths (same as IR field widths)
`define SCAN_BFW_ADMD   `IR_BFW_ADMD     
`define SCAN_BFW_W      `IR_BFW_W
`define SCAN_BFW_DATA   `IR_BFW_DATA     
`define SCAN_BFW_NO     `IR_BFW_NO       
`define SCAN_BFW_POL    `IR_BFW_POL      
`define SCAN_BFW_OP     `IR_BFW_OP       
`define SCAN_BFW_UPDWN  `IR_BFW_UPDWN        

// Scan register bitfield positions
`define SCAN_BFP_START  0   // first bitfield position
`define SCAN_BFP_ADMD   (`SCAN_BFP_START)
`define SCAN_BFP_W      (`SCAN_BFP_ADMD + `SCAN_BFW_ADMD)
`define SCAN_BFP_DATA   (`SCAN_BFP_W + `SCAN_BFW_W)
`define SCAN_BFP_NO     (`SCAN_BFP_DATA + `SCAN_BFW_DATA)
`define SCAN_BFP_POL    (`SCAN_BFP_NO + `SCAN_BFW_NO)
`define SCAN_BFP_OP     (`SCAN_BFP_POL + `SCAN_BFW_POL)
`define SCAN_BFP_UPDWN  (`SCAN_BFP_OP + `SCAN_BFW_OP)

// corresponds to the size of the scan-path register
`define SCAN_REG_START  `SCAN_BFP_START
`define SCAN_REG_END    `SCAN_BFP_UPDWN + `SCAN_BFW_UPDWN
`define SCAN_WIDTH      (`SCAN_REG_END - `SCAN_REG_START + 1)


// Instruction Register Generator
`define IR_UPDWN(v) v << `SCAN_BFP_UPDWN
`define IR_OP3(v)   v << `SCAN_BFP_OP + 12
`define IR_OP2(v)   v << `SCAN_BFP_OP + 8
`define IR_OP1(v)   v << `SCAN_BFP_OP + 4
`define IR_OP0(v)   v << `SCAN_BFP_OP + 0
`define IR_POL3(v)  v << `SCAN_BFP_POL + 3
`define IR_POL2(v)  v << `SCAN_BFP_POL + 2
`define IR_POL1(v)  v << `SCAN_BFP_POL + 1
`define IR_POL0(v)  v << `SCAN_BFP_POL + 0
`define IR_NO(v)    v << `SCAN_BFP_NO
`define IR_DATA(v)  v << `SCAN_BFP_DATA
`define IR_W(v)     v << `SCAN_BFP_W
`define IR_ADMD(v)  v << `SCAN_BFP_ADMD


// Pseudo-random seed for address mode
`define ADMD_PR_SEED    15  // Use a 4-bit number for all address sizes  

`define ADMD_LIUD_FIRST 0           // First address to use
`define ADMD_LIUD_LAST  16'hffff    // Last address to use

`define ADDR_UP     0       // Counting direction up
`define ADDR_DOWN   1       // Counting direction down (reverse)

// Address Modes
`define ADMD_LIUD   0       // Linear Up/Down
`define ADMD_PRUD   1       // Psuedo-random up/down
`define ADMD_AC     2       // Address Complimenting
`define ADMD_GC     3       // Gray coding 
`define ADMD_WC     4       // Worst-case gate delay
// 2^i addressing mode uses lower 3 bits to define i
// bit[3] = Address Mode 2^i, bit[2:0] = i
`define ADMD_2I0    8       // 2^i where i=0
`define ADMD_2I1    9       // 2^i where i=1
`define ADMD_2I2    10      // 2^i where i=2
`define ADMD_2I3    11      // 2^i where i=3
`define ADMD_2I4    12      // 2^i where i=4
`define ADMD_2I5    13      // 2^i where i=5
`define ADMD_2I6    14      // 2^i where i=6
`define ADMD_2I7    15      // 2^i where i=7

`endif //_define_vh
