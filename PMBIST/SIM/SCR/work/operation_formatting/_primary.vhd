library verilog;
use verilog.vl_types.all;
entity operation_formatting is
    generic(
        opw             : integer := 4
    );
    port(
        op_in           : in     vl_logic_vector;
        op_out          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of opw : constant is 1;
end operation_formatting;
