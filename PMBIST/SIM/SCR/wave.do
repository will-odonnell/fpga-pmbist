onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test/clk
add wave -noupdate /test/reset_b
add wave -noupdate -radix decimal /test/cycle_count
add wave -noupdate /test/lf_test_mux
add wave -noupdate -radix hexadecimal /test/wr_chan_data
add wave -noupdate -radix hexadecimal /test/wr_dp_data
add wave -noupdate /test/cpe_ready_in
add wave -noupdate -radix hexadecimal /test/cpe_token_sz_in
add wave -noupdate /test/cpe_hold_in
add wave -noupdate /test/cpe_ready_out
add wave -noupdate /test/cpe_token_ck_in
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/fire
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ucode_idle
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/ctl/ctl_ucode_1/ucode_fsm/ucode_op
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_repeat_cnt
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_ucode_1/chan_out_ctl
add wave -noupdate -radix decimal /test/test_cpe_top/cpe_top/ctl/ctl_ucode_1/ucode_pc
add wave -noupdate -radix hexadecimal /test/cpe_token_sz_out
add wave -noupdate -radix hexadecimal /test/channel_data_out
add wave -noupdate -divider {RQS BLOCK}
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/rs_clk
add wave -noupdate /test/test_cpe_top/cpe_top/rqs/pop
add wave -noupdate /test/test_cpe_top/cpe_top/rqs/push
add wave -noupdate /test/test_cpe_top/cpe_top/rqs/read_bos
add wave -noupdate /test/test_cpe_top/cpe_top/rqs/read_tos
add wave -noupdate /test/test_cpe_top/cpe_top/rqs/reset_b
add wave -noupdate /test/test_cpe_top/cpe_top/rqs/write_enable
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/rqs_tos
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/rqs_bos
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/result_bus
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/rd_tos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/rd_bos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/wr_bos_data_buf
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/wr_tos_data_lat
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/tos_addr
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/rqs/bos_addr
add wave -noupdate -divider {DATAPATH SOURCE BUS SELECTS}
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/a_bus_mux_sel
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/b_bus_mux_sel
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/qs1_mux_s0
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/qs1_mux_s1
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/qs2_mux_s0
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/qs2_mux_s1
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/mx45_s0
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/mx45_s1
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/mx678_s0
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/mx678_s1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/ctl/immediate_data
add wave -noupdate -divider {WRITEBACK SELECTS and BUSES}
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/ctl/wb_mux_sel
add wave -noupdate /test/test_cpe_top/cpe_top/dp/gpio_write_enable
add wave -noupdate -divider {QS1 BLOCK}
add wave -noupdate /test/clk
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/insert_qs1
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/pop_qs1
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/push_qs1
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/read_bos_qs1
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/read_tos_qs1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/lf1/tos_addr
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/lf1/bos_addr
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/write_enable_qs1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/rd_tos_qs1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/rd_bos_qs1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/wr_chan_data_qs1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/wr_qs1
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/wr_chan_data_qs2
add wave -noupdate -divider {QS2 BLOCK}
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/insert_qs2
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/pop_qs2
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/push_qs2
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/read_bos_qs2
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/read_tos_qs2
add wave -noupdate /test/test_cpe_top/cpe_top/qs_top/write_enable_qs2
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/rd_tos_qs2
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/rd_bos_qs2
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/qs_top/wr_qs2
add wave -noupdate -divider ADDER
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/dp/ADDER/a
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/dp/ADDER/b
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/dp/ADDER/adder_out
add wave -noupdate /test/test_cpe_top/cpe_top/dp/ADDER/addsub
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/dp_enable
add wave -noupdate /test/test_cpe_top/cpe_top/dp/ADDER/ci1
add wave -noupdate /test/test_cpe_top/cpe_top/dp/ADDER/sat
add wave -noupdate /test/test_cpe_top/cpe_top/dp/ADDER/tc
add wave -noupdate -divider {SHIFTER OUTPUT}
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/dp/a_bus_shft
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/dp/b_bus_shft
add wave -noupdate /test/test_cpe_top/cpe_top/dp/shft_mode_a
add wave -noupdate /test/test_cpe_top/cpe_top/dp/shft_mode_b
add wave -noupdate /test/test_cpe_top/cpe_top/dp/shft_tc_a
add wave -noupdate /test/test_cpe_top/cpe_top/dp/shft_tc_b
add wave -noupdate /test/test_cpe_top/cpe_top/dp/shift_a_ctl
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/dp/shift_b_ctl
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/fifo_mux_sel
add wave -noupdate -divider {OUTPUT FIFO}
add wave -noupdate /test/test_cpe_top/cpe_top/fifo/fifo_mux_sel
add wave -noupdate /test/test_cpe_top/cpe_top/fifo/fifo_pop
add wave -noupdate /test/test_cpe_top/cpe_top/fifo/fifo_we
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/fifo/fifo_data_out
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/fifo/result_bus
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/fifo/immediate_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/fifo/fifo_wr_addr
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/fifo/fifo_rd_addr
add wave -noupdate -divider {{OUTPUT STATE MACHINE}}
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/cpe_ready_out
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/fifo_pop
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/clk
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/reset_b
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/chan_output_ctl
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/cpe_hold_in
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/cpe_token_ck_in
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/fifo_we
add wave -noupdate -radix hexadecimal /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/cpe_token_sz_out
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/state
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/sm_error
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/chan_output_dly
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/state_0
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/state_1
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/state_2
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/state_3
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/token_cnt
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/ctl_output_sm_1/fifo_clk
add wave -noupdate -divider {{SFU BLOCK}}
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/sfu_we
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/sfu_eq
add wave -noupdate /test/test_cpe_top/cpe_top/ctl/sfu_ctrl
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20367803 ps} 0}
configure wave -namecolwidth 352
configure wave -valuecolwidth 142
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {93975 ns}
