library verilog;
use verilog.vl_types.all;
entity cycle_counter is
    generic(
        mw              : integer := 4;
        rw              : integer := 4;
        cs              : integer := 2
    );
    port(
        clk             : in     vl_logic;
        r_in            : in     vl_logic;
        cyc_cnt_out     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of mw : constant is 1;
    attribute mti_svvh_generic_type of rw : constant is 1;
    attribute mti_svvh_generic_type of cs : constant is 1;
end cycle_counter;
