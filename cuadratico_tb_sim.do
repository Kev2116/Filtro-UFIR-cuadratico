onbreak resume
onerror resume
vsim -novopt work.cuadratico_tb

add wave sim:/cuadratico_tb/u_cuadratico/clk
add wave sim:/cuadratico_tb/u_cuadratico/reset
add wave sim:/cuadratico_tb/u_cuadratico/in1
add wave sim:/cuadratico_tb/u_cuadratico/out_rsvd
add wave sim:/cuadratico_tb/out_rsvd_ref
run -all
