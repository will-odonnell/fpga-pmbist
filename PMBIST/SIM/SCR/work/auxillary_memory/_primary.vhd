library verilog;
use verilog.vl_types.all;
entity auxillary_memory is
    generic(
        dw              : integer := 8;
        aw              : integer := 8;
        sw              : integer := 37;
        tasw            : integer := 8;
        tcsw            : integer := 4;
        tdsw            : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cmd_in          : in     vl_logic_vector;
        addr_in         : in     vl_logic_vector;
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of dw : constant is 1;
    attribute mti_svvh_generic_type of aw : constant is 1;
    attribute mti_svvh_generic_type of sw : constant is 1;
    attribute mti_svvh_generic_type of tasw : constant is 1;
    attribute mti_svvh_generic_type of tcsw : constant is 1;
    attribute mti_svvh_generic_type of tdsw : constant is 1;
end auxillary_memory;
