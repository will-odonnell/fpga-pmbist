library verilog;
use verilog.vl_types.all;
entity address_counter_hold is
    port(
        cmpff_in        : in     vl_logic;
        udff_q_in       : in     vl_logic;
        ir_updwn_in     : in     vl_logic;
        hold_out        : out    vl_logic
    );
end address_counter_hold;
