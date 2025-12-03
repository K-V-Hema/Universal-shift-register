class usr_env extends uvm_env;
usr_agent agent;
usr_sbd sbd;
usr_mon mon;
usr_cov cov;
`uvm_component_utils(usr_env)
`NEW_COMP

function void build_phase(uvm_phase phase);
	agent=usr_agent::type_id::create("agent",this);
	sbd=usr_sbd::type_id::create("sbd",this);
	mon=usr_mon::type_id::create("mon",this);
	cov=usr_cov::type_id::create("cov",this);
endfunction

function void connect_phase(uvm_phase phase);
	mon.ap_port.connect(sbd.analysis_export);
	mon.ap_port.connect(cov.analysis_export);
endfunction
endclass
