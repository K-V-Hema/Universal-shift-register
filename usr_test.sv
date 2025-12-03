class usr_test extends uvm_test;
`uvm_component_utils(usr_test)
`NEW_COMP
usr_env env;

function void build_phase(uvm_phase phase);
	env=usr_env::type_id::create("env",this);
endfunction

function void end_of_elaboration();
	uvm_top.print_topology();
	factory.print();
endfunction
endclass

class usr_load_test extends usr_test;
`uvm_component_utils(usr_load_test)
`NEW_COMP
task run_phase(uvm_phase phase);
	usr_load_seq seq;
		seq=new("seq");
	phase.raise_objection(this);
	seq.start(env.agent.sqr);
	phase.phase_done.set_drain_time(this,100);
	phase.drop_objection(this);
endtask
endclass

class usr_hold_test extends usr_test;
`uvm_component_utils(usr_hold_test)
`NEW_COMP
task run_phase(uvm_phase phase);
	usr_hold_seq seq;
		seq=new("seq");
	phase.raise_objection(this);
	seq.start(env.agent.sqr);
	phase.phase_done.set_drain_time(this,100);
	phase.drop_objection(this);
endtask
endclass

class usr_shift_right_test extends usr_test;
`uvm_component_utils(usr_shift_right_test)
`NEW_COMP
task run_phase(uvm_phase phase);
	usr_shift_right_seq seq;
		seq=new("seq");
	phase.raise_objection(this);
	seq.start(env.agent.sqr);
	phase.phase_done.set_drain_time(this,100);
	phase.drop_objection(this);
endtask
endclass

class usr_shift_left_test extends usr_test;
`uvm_component_utils(usr_shift_left_test)
`NEW_COMP
task run_phase(uvm_phase phase);
	usr_shift_left_seq seq;
	seq=new("seq");
	phase.raise_objection(this);
	seq.start(env.agent.sqr);
	phase.phase_done.set_drain_time(this,100);
	phase.drop_objection(this);
endtask
endclass
