// address_counter.v
`include "defines.v"

//***********************************************
// Address Counter 
//***********************************************
module address_generator(admd_in,updwn_in,tas_in,tas_out);

//-----------------------------------------------
// Parameters and Definitions
//-----------------------------------------------
parameter    tasw        = `ADDR_WIDTH;

//-----------------------------------------------
// Input/Output Signals
//-----------------------------------------------
input                   admd_in;
input                   updwn_in;
input   [tasw-1:0]      tas_in;
output  [tasw-1:0]      tas_out;

//-----------------------------------------------
// Internal Signals
//-----------------------------------------------

//***********************************************
// Module definition
//***********************************************

always @(admd_in or tas_in)
begin
  case (admd_in)
    `ADMD_AC: begin
        // Only bit 7 is dependent on up/down
        if (updwn_in == `ADDR_UP) begin
            tas_out[7] <= tas_in[0];
        end else begin
            tas_out[7] <= ~tas_in[0];
        end
        // Transform the rest of the bits
            tas_out[6] <= tas_in[7]^tas_in[0];
            tas_out[5] <= tas_in[6]^tas_in[0];
            tas_out[4] <= tas_in[5]^tas_in[0];
            tas_out[3] <= tas_in[4]^tas_in[0];
            tas_out[2] <= tas_in[3]^tas_in[0];
            tas_out[1] <= tas_in[2]^tas_in[0];
            tas_out[0] <= tas_in[1]^tas_in[0];
    end
    `ADMD_GC: begin
    
        // Only bit 7 is dependent on up/down
        if(updwn_in == `ADDR_UP) begin
            tas_out[7] <= tas_in[7];
        end else begin
            tas_out[7] <= ~tas_in[7];
        end
        // Transform the rest of the bits
            tas_out[6] <= tas_in[6]^tas_in[7];
            tas_out[5] <= tas_in[5]^tas_in[6];
            tas_out[4] <= tas_in[4]^tas_in[5];
            tas_out[3] <= tas_in[3]^tas_in[4];
            tas_out[2] <= tas_in[2]^tas_in[3];
            tas_out[1] <= tas_in[1]^tas_in[2];
            tas_out[0] <= tas_in[0]^tas_in[1];
    end

    //-----------------------------------------------------
    // Address Mode 2^i has many options depending
    // on the i input.
    //-----------------------------------------------------
    `ADMD_2I0: begin
        // i=0 is just linear counting method
        tas_out <= tas_in;
    end
    `ADMD_2I1: begin
        tas_out[7:2] <= tas_in[7:2];
        // i=1 swap 0 and 1
        tas_out[1] <= tas_in[0];
        tas_out[0] <= tas_in[1];
    end
    `ADMD_2I2: begin
        tas_out[7:3] <= tas_in[7:3];
        // i=1 swap 0 and 2
        tas_out[2] <= tas_in[0];
        tas_out[1] <= tas_in[1];
        tas_out[0] <= tas_in[2];
    end
    `ADMD_2I3: begin
        tas_out[7:4] <= tas_in[7:4];
        // i=1 swap 0 and 3
        tas_out[3] <= tas_in[0];
        tas_out[2:1] <= tas_in[2:1];
        tas_out[0] <= tas_in[3];
    end
    `ADMD_2I4: begin
        tas_out[7:5] <= tas_in[7:5];
        // i=1 swap 0 and 4
        tas_out[4] <= tas_in[0];
        tas_out[3:1] <= tas_in[3:1];
        tas_out[0] <= tas_in[4];
    end
    `ADMD_2I5: begin
        tas_out[7:6] <= tas_in[7:6];
        // i=1 swap 0 and 5
        tas_out[5] <= tas_in[0];
        tas_out[4:1] <= tas_in[4:1];
        tas_out[0] <= tas_in[5];
    end
    `ADMD_2I6: begin
        tas_out[7] <= tas_in[7];
        // i=1 swap 0 and 6
        tas_out[6] <= tas_in[0];
        tas_out[5:1] <= tas_in[5:1];
        tas_out[0] <= tas_in[6];
    end
    `ADMD_2I7: begin
        // i=1 swap 0 and 7
        tas_out[7] <= tas_in[0];
        tas_out[6:1] <= tas_in[6:1];
        tas_out[0] <= tas_in[7];
    end
  endcase
end
  
endmodule

 
