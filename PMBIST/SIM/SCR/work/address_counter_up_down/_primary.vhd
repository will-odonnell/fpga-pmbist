library verilog;
use verilog.vl_types.all;
entity address_counter_up_down is
    port(
        updwn_in        : in     vl_logic;
        ts_in           : in     vl_logic;
        s_out           : out    vl_logic;
        r_out           : out    vl_logic
    );
end address_counter_up_down;
