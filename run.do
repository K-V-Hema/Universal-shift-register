vlog -sv +cover=bcesft top.sv +incdir+C:/uvm-1.2/src
vopt top +cover=fcbest -o  usr_load_test
vsim -coverage  usr_load_test \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi\
-sv_seed 12345
coverage save -onexit  usr_load_test.ucdb
add wave -r sim:/top/pif/*
run -all

