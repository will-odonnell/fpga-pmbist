library verilog;
use verilog.vl_types.all;
entity data_comparator is
    generic(
        dw              : integer := 8;
        aw              : integer := 8
    );
    port(
        bist_data_in    : in     vl_logic_vector;
        mem_data_in     : in     vl_logic_vector;
        passfail_out    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of dw : constant is 1;
    attribute mti_svvh_generic_type of aw : constant is 1;
end data_comparator;
