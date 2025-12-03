class usr_agent extends uvm_agent;
`uvm_component_utils(usr_agent)
`NEW_COMP

usr_sqr sqr;
usr_drv drv;

function void build_phase(uvm_phase phase);
	drv=usr_drv::type_id::create("drv",this);
	sqr=usr_sqr::type_id::create("sqr",this);
endfunction

function void connect_phase(uvm_phase phase);
	drv.seq_item_port.connect(sqr.seq_item_export);
endfunction
endclass
