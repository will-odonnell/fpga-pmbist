library verilog;
use verilog.vl_types.all;
entity control_mux is
    generic(
        mw              : integer := 4;
        rw              : integer := 4;
        cs              : integer := 2;
        irl_te          : integer := 0;
        irh_te          : integer := 0;
        irl_admd        : integer := 1;
        irh_admd        : integer := 4;
        irl_w           : integer := 5;
        irh_w           : integer := 5;
        irl_data        : integer := 6;
        irh_data        : integer := 13;
        irl_no          : integer := 14;
        irh_no          : integer := 15;
        irl_pol         : integer := 16;
        irh_pol         : integer := 19;
        irl_op          : integer := 20;
        irh_op          : integer := 35;
        irl_updwn       : integer := 36;
        irh_updwn       : integer := 36;
        irw_te          : integer := 1;
        irw_admd        : integer := 4;
        irw_w           : integer := 1;
        irw_data        : integer := 8;
        irw_no          : integer := 2;
        irw_pol         : integer := 4;
        irw_op          : integer := 16;
        irw_updwn       : integer := 1;
        cmw_op          : integer := 4;
        cmw_pol         : integer := 1;
        irpl_op0        : integer := 0;
        irph_op0        : integer := 3;
        irpl_op1        : integer := 4;
        irph_op1        : integer := 7;
        irpl_op2        : integer := 8;
        irph_op2        : integer := 11;
        irpl_op3        : integer := 12;
        irph_op3        : integer := 15;
        irp_op0         : integer := 0;
        irp_op1         : integer := 1;
        irp_op2         : integer := 2;
        irp_op3         : integer := 3
    );
    port(
        op_in           : in     vl_logic_vector;
        pol_in          : in     vl_logic_vector;
        cyc_cnt_in      : in     vl_logic_vector;
        op_out          : out    vl_logic_vector;
        pol_out         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of mw : constant is 1;
    attribute mti_svvh_generic_type of rw : constant is 1;
    attribute mti_svvh_generic_type of cs : constant is 1;
    attribute mti_svvh_generic_type of irl_te : constant is 1;
    attribute mti_svvh_generic_type of irh_te : constant is 1;
    attribute mti_svvh_generic_type of irl_admd : constant is 1;
    attribute mti_svvh_generic_type of irh_admd : constant is 1;
    attribute mti_svvh_generic_type of irl_w : constant is 1;
    attribute mti_svvh_generic_type of irh_w : constant is 1;
    attribute mti_svvh_generic_type of irl_data : constant is 1;
    attribute mti_svvh_generic_type of irh_data : constant is 1;
    attribute mti_svvh_generic_type of irl_no : constant is 1;
    attribute mti_svvh_generic_type of irh_no : constant is 1;
    attribute mti_svvh_generic_type of irl_pol : constant is 1;
    attribute mti_svvh_generic_type of irh_pol : constant is 1;
    attribute mti_svvh_generic_type of irl_op : constant is 1;
    attribute mti_svvh_generic_type of irh_op : constant is 1;
    attribute mti_svvh_generic_type of irl_updwn : constant is 1;
    attribute mti_svvh_generic_type of irh_updwn : constant is 1;
    attribute mti_svvh_generic_type of irw_te : constant is 1;
    attribute mti_svvh_generic_type of irw_admd : constant is 1;
    attribute mti_svvh_generic_type of irw_w : constant is 1;
    attribute mti_svvh_generic_type of irw_data : constant is 1;
    attribute mti_svvh_generic_type of irw_no : constant is 1;
    attribute mti_svvh_generic_type of irw_pol : constant is 1;
    attribute mti_svvh_generic_type of irw_op : constant is 1;
    attribute mti_svvh_generic_type of irw_updwn : constant is 1;
    attribute mti_svvh_generic_type of cmw_op : constant is 1;
    attribute mti_svvh_generic_type of cmw_pol : constant is 1;
    attribute mti_svvh_generic_type of irpl_op0 : constant is 1;
    attribute mti_svvh_generic_type of irph_op0 : constant is 1;
    attribute mti_svvh_generic_type of irpl_op1 : constant is 1;
    attribute mti_svvh_generic_type of irph_op1 : constant is 1;
    attribute mti_svvh_generic_type of irpl_op2 : constant is 1;
    attribute mti_svvh_generic_type of irph_op2 : constant is 1;
    attribute mti_svvh_generic_type of irpl_op3 : constant is 1;
    attribute mti_svvh_generic_type of irph_op3 : constant is 1;
    attribute mti_svvh_generic_type of irp_op0 : constant is 1;
    attribute mti_svvh_generic_type of irp_op1 : constant is 1;
    attribute mti_svvh_generic_type of irp_op2 : constant is 1;
    attribute mti_svvh_generic_type of irp_op3 : constant is 1;
end control_mux;
