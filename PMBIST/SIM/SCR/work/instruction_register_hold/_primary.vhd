library verilog;
use verilog.vl_types.all;
entity instruction_register_hold is
    port(
        lu_in           : in     vl_logic;
        ld_in           : in     vl_logic;
        updwn_in        : in     vl_logic;
        ts_in           : in     vl_logic;
        cc_comp_in      : in     vl_logic;
        hold_out        : out    vl_logic
    );
end instruction_register_hold;
