# 1. Create a work directory for modelsim
vlib ./work

# 2. Compile stuff in defined use order
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/address_counter.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/auxillary_memory.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/cycle_controller.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/cycle_controller_submod.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/data_comparator.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/decode_logic.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/defines.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/gates.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/logic.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/mbist_top.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/mem_ip_blk.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/memory.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/operation_formatting.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/pmbist_test.v
vcom -93 -work work  /scratch/wodonnell/mp/oct31/PMBIST/SIM/SRC/registers.v

# 3. Simulate top-level entity
vsim pmbist_test

# 4. Open some windows for viewing
view structures
view signals
view wave

# 5. Specify signals

# 6. Set some test patterns


run 100
