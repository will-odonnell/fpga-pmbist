library verilog;
use verilog.vl_types.all;
entity flipflop is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        d_in            : in     vl_logic;
        q_out           : out    vl_logic
    );
end flipflop;
