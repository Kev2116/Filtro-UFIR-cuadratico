vlib work
vcom cuadratico_pkg.vhd -work work
vcom Discrete_FIR_Filter.vhd -work work
vcom cuadratico.vhd -work work
vlog -dpicopyopt 0 -sv gm_cuadratico_ref_dpi.sv
vlog -sv cuadratico_dpi_tb.sv
vsim -voptargs=+acc -L work  -sv_lib gm_cuadratico_ref_win64 work.cuadratico_dpi_tb
add wave /*
run -all
