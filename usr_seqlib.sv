class usr_seqlib extends uvm_sequence#(usr_tx);
uvm_phase phase;
`uvm_object_utils(usr_seqlib)
`NEW_OBJ

task pre_body();
	phase=get_starting_phase();
	if(phase!=null) begin
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,100);
	end
endtask

task post_body();
	if(phase!=null) begin
	phase.drop_objection(this);
	end
endtask
endclass

class usr_load_seq extends usr_seqlib;
`uvm_object_utils(usr_load_seq)
`NEW_OBJ
task body();
	repeat(3) begin
	`uvm_do_with(req,{req.load==1'b1;req.hold==1'b0;req.shift_right==0;req.shift_left==0;})
	end
endtask
endclass

class usr_hold_seq extends usr_seqlib;
`uvm_object_utils(usr_hold_seq)
`NEW_OBJ
task body();
	repeat(3) begin
	`uvm_do_with(req,{req.load==1'b0;req.hold==1'b1;req.shift_right==0;req.shift_left==0;})
	end
endtask
endclass

class usr_shift_right_seq extends usr_seqlib;
`uvm_object_utils(usr_shift_right_seq)
`NEW_OBJ
task body();
	repeat(3) begin
	`uvm_do_with(req,{req.load==1'b0;req.hold==1'b0;req.shift_right==1;req.shift_left==0;})
	end
endtask
endclass

class usr_shift_left_seq extends usr_seqlib;
`uvm_object_utils(usr_shift_left_seq)
`NEW_OBJ
task body();
	repeat(3) begin
	`uvm_do_with(req,{req.load==1'b0;req.hold==1'b0;req.shift_right==0;req.shift_left==1;})
	end
endtask
endclass

