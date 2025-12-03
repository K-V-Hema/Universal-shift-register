class usr_tx extends uvm_sequence_item;
	rand bit load,hold,shift_left,shift_right,serial_in;
	rand bit [`WIDTH-1:0]parallel_in;
	bit serial_out;
    bit [`WIDTH-1:0]parallel_out;

constraint c1{!(shift_left&&shift_right);}
constraint c2{!(load&hold);}
constraint c3{serial_in inside {0,1};}

`uvm_object_utils_begin(usr_tx)
	`uvm_field_int(load,UVM_ALL_ON)
	`uvm_field_int(hold,UVM_ALL_ON)
	`uvm_field_int(shift_left,UVM_ALL_ON)
	`uvm_field_int(shift_right,UVM_ALL_ON)
	`uvm_field_int(serial_in,UVM_ALL_ON)
	`uvm_field_int(parallel_in,UVM_ALL_ON)
`uvm_object_utils_end
`NEW_OBJ
endclass
