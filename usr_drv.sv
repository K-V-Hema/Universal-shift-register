class usr_drv extends uvm_driver#(usr_tx);
virtual usr_intrf vif;
`NEW_COMP
`uvm_component_utils(usr_drv)
function void build();
	uvm_resource_db#(virtual usr_intrf)::read_by_name("USR","VIF",vif,this);
endfunction
task run();
	forever begin
		seq_item_port.get_next_item(req);
		drive_tx(req);
		seq_item_port.item_done();
	end
endtask

task drive_tx(usr_tx tx);
	@(posedge vif.clk);
	vif.load<=tx.load;
	vif.hold<=tx.hold;
	vif.shift_right<=tx.shift_right;
	vif.shift_left<=tx.shift_left;
	vif.serial_in<=tx.serial_in;
	vif.parallel_in<=tx.parallel_in;
	@(posedge vif.clk);
	vif.load<=0;
	vif.hold<=0;
	vif.shift_right<=0;
	vif.shift_left<=0;
	vif.serial_in<=0;
	vif.parallel_in<=0;
endtask
endclass

