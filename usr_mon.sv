class usr_mon extends uvm_monitor;
uvm_analysis_port#(usr_tx)ap_port;
`uvm_component_utils(usr_mon)
`NEW_COMP
virtual usr_intrf vif;

function void build();
	uvm_resource_db#(virtual usr_intrf)::read_by_name("USR","VIF",vif,this);
	ap_port=new("ap_port",this);
endfunction
task run();
usr_tx tx;
	forever begin
		@(posedge vif.clk);
		tx=new("tx");
		tx.load=vif.load;
		tx.hold=vif.hold;
		tx.shift_right=vif.shift_right;
		tx.shift_left=vif.shift_left;
		tx.serial_in=vif.serial_in;
		tx.parallel_in=vif.parallel_in;
		tx.serial_out=vif.serial_out;
		tx.parallel_out=vif.parallel_out;
		ap_port.write(tx);
	end
endtask
endclass

