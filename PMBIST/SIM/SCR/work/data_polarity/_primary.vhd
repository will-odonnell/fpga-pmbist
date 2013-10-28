library verilog;
use verilog.vl_types.all;
entity data_polarity is
    generic(
        dw              : integer := 8
    );
    port(
        data_in         : in     vl_logic_vector;
        pol_in          : in     vl_logic;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of dw : constant is 1;
end data_polarity;
