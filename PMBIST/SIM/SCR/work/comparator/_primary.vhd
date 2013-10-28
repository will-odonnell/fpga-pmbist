library verilog;
use verilog.vl_types.all;
entity comparator is
    generic(
        mw              : integer := 4;
        rw              : integer := 4;
        cs              : integer := 2
    );
    port(
        no              : in     vl_logic_vector;
        cyc_cnt_in      : in     vl_logic_vector;
        cmp_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of mw : constant is 1;
    attribute mti_svvh_generic_type of rw : constant is 1;
    attribute mti_svvh_generic_type of cs : constant is 1;
end comparator;
