class usr_cov extends uvm_subscriber#(usr_tx);
usr_tx tx;
`uvm_component_utils(usr_cov)
covergroup usr_cg;
	coverpoint tx.load{
		bins LOAD={1'b1};
	}
	coverpoint tx.hold{
		bins HOLD={1'b1};
	}
	coverpoint tx.shift_right{
		bins SHIFT_RIGHT={1'b1};
	}
	coverpoint tx.shift_left{
		bins SHIFT_LEFT={1'b1};
	}
endgroup

function new(string name,uvm_component parent);
	super.new(name,parent);
	usr_cg=new();
endfunction

function void write(usr_tx t);
	tx=new t;
	usr_cg.sample();
endfunction
endclass
