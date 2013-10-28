library verilog;
use verilog.vl_types.all;
entity address_counter is
    generic(
        tasw            : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        hold_in         : in     vl_logic;
        updwn_in        : in     vl_logic;
        s_in            : in     vl_logic;
        r_in            : in     vl_logic;
        tas_out         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of tasw : constant is 1;
end address_counter;
