onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test/clk
add wave -noupdate /test/reset_b
add wave -noupdate /test/test_cpe_token_sz_out
add wave -noupdate /test/test_channel_data_out
add wave -noupdate /test/test_gpio_out
add wave -noupdate -radix decimal /test/cycle_count
add wave -noupdate /test/lf_test_mux
add wave -noupdate -radix hexadecimal /test/wr_chan_data
add wave -noupdate -radix hexadecimal /test/wr_dp_data
add wave -noupdate /test/cpe_ready_in
add wave -noupdate -radix hexadecimal /test/cpe_token_sz_in
add wave -noupdate /test/cpe_hold_in
add wave -noupdate /test/cpe_ready_out
add wave -noupdate /test/cpe_token_ck_in
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/fire
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ucode_idle
add wave -noupdate -radix binary /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/ucode_op
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_repeat_cnt
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/chan_out_ctl
add wave -noupdate -radix decimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_pc
add wave -noupdate -radix hexadecimal /test/cpe_token_sz_out
add wave -noupdate -radix hexadecimal /test/channel_data_out
add wave -noupdate -divider {{TEST SIGNALS}}
add wave -noupdate /test/test_cpe_token_sz_out
add wave -noupdate /test/test_channel_data_out
add wave -noupdate /test/test_gpio_out
add wave -noupdate -divider {{GOLD DATAPATH SOURCE BUS SELECTS}}
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/a_bus_mux_sel
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/b_bus_mux_sel
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/qs1_mux_s0
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/qs1_mux_s1
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/qs2_mux_s0
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/qs2_mux_s1
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/mx45_s0
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/mx45_s1
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/mx678_s0
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/mx678_s1
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/immediate_data
add wave -noupdate -divider {{AEVANS DATAPATH SOURCE BUS SELECTS}}
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/a_bus_mux_sel
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/b_bus_mux_sel
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/qs1_mux_s0
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/qs1_mux_s1
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/qs2_mux_s0
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/qs2_mux_s1
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/mx45_s0
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/mx45_s1
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/mx678_s0
add wave -noupdate /test/test_cpe_top_intg/cpe_top_aevans/ctl/mx678_s1
add wave -noupdate -radix hexadecimal /test/test_cpe_top_intg/cpe_top_aevans/ctl/immediate_data
add wave -noupdate -divider {{WRITEBACK SELECTS and BUSES}}
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/wb_mux_sel
add wave -noupdate -divider {RQS BLOCK}
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/rs_clk
add wave -noupdate /test/test_cpe_top_gold/cpe_top/rqs/rqs_ctl
add wave -noupdate /test/test_cpe_top_gold/cpe_top/rqs/read_bos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/bos_addr
add wave -noupdate /test/test_cpe_top_gold/cpe_top/rqs/read_tos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/tos_addr
add wave -noupdate /test/test_cpe_top_gold/cpe_top/rqs/write_enable
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/rqs_tos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/rqs_bos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/result_bus
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/rd_tos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/rd_bos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/wr_bos_data_buf
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/rqs/wr_tos_data_lat
add wave -noupdate -divider {QS1 BLOCK}
add wave -noupdate /test/clk
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/qs_ctl
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/write_enable
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/channnel_mux
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/read_tos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/tos_addr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/rd_tos_data
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/read_bos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/bos_addr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/rd_bos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/read_bos_reg_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/read_tos_reg_data
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/qs_array_1/write_bos
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf1/qs_array_1/write_tos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/wr_dp_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/wr_chan_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/wr_bos_data_buf
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/wr_tos_data_lat
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf1/wr_chan_data_buf
add wave -noupdate -divider ADDER
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/ADDER/a
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/ADDER/b
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/ADDER/adder_out
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/ADDER/addsub
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/dp_enable
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/ADDER/ci1
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/ADDER/sat
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/ADDER/tc
add wave -noupdate -divider {QS2 BLOCK}
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf2/qs_ctl
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf2/channnel_mux
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf2/read_bos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/bos_addr
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf2/read_tos
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/tos_addr
add wave -noupdate /test/test_cpe_top_gold/cpe_top/qs_top/lf2/write_enable
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/read_bos_reg_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/read_tos_reg_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/wr_dp_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/wr_chan_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/rd_bos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/wr_bos_data_buf
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/rd_tos_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/wr_tos_data_lat
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/qs_top/lf2/wr_chan_data_buf
add wave -noupdate -divider {SHIFTER OUTPUT}
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/a_bus_shft
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/b_bus_shft
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/shft_mode_a
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/shft_mode_b
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/shft_tc_a
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/shft_tc_b
add wave -noupdate /test/test_cpe_top_gold/cpe_top/dp/shift_a_ctl
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/shift_b_ctl
add wave -noupdate -divider {OUTPUT FIFO}
add wave -noupdate /test/test_cpe_top_gold/cpe_top/fifo/fifo_pop
add wave -noupdate /test/test_cpe_top_gold/cpe_top/fifo/fifo_we
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/fifo/fifo_data_out
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/fifo/result_bus
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/fifo/immediate_data
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/fifo/fifo_wr_addr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/fifo/fifo_rd_addr
add wave -noupdate -divider {{OUTPUT STATE MACHINE}}
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/cpe_ready_out
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/fifo_pop
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/clk
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/reset_b
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/chan_output_ctl
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/cpe_hold_in
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/cpe_token_ck_in
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/fifo_we
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/cpe_token_sz_out
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/state
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/sm_error
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/chan_output_dly
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/state_0
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/state_1
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/state_2
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/state_3
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/token_cnt
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_output_sm_1/fifo_clk
add wave -noupdate -divider {{SFU BLOCK}}
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/sfu_we
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/sfu_eq
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/sfu_ctrl
add wave -noupdate -divider GPIO
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/wb_mux/gpio_out
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/dp/wb_mux/gpio_in
add wave -noupdate -divider FSM
add wave -noupdate /test/clk
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_repeat_cnt
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/chan_out_ctl
add wave -noupdate -radix decimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_pc
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/mux_upc
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_repeat_cnt
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_num
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/ucode_op
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_zd
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_1
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_1_inc
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_1_zd
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_2
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_2_inc
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_2_zd
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_3
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_3_zd
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_3_inc
add wave -noupdate -divider XXXXXXXXXXXXXXXXXXXX
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/state_0
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/state_1
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/state_2
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/state_3
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/state_4
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/ld_loop_1_cntr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_1_cmp_reg
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_1_incr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/ld_loop_2_cntr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_2_cmp_reg
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_2_incr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/ld_loop_3_cntr
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_3_cmp_reg
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_3_incr
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/loop_back
add wave -noupdate -radix hexadecimal /test/test_cpe_top_gold/cpe_top/ctl/ctl_ucode_1/ucode_fsm/state
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/sfu_eq
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/wb_eq
add wave -noupdate /test/test_cpe_top_gold/cpe_top/ctl/wb_zd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35010000 ps} 0}
configure wave -namecolwidth 585
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
WaveRestoreZoom {0 ps} {94631252 ps}
