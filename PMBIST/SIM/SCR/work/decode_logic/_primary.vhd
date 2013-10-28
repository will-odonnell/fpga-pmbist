library verilog;
use verilog.vl_types.all;
entity decode_logic is
    generic(
        tasw            : integer := 8
    );
    port(
        tas_in          : in     vl_logic_vector;
        lu_out          : out    vl_logic;
        ld_out          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of tasw : constant is 1;
end decode_logic;
