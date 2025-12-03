`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "usr.sv"
`include "usr_comm.sv"
`include "usr_intrf.sv"
`include "usr_tx.sv"
`include "usr_sqr.sv"
`include "usr_drv.sv"
`include "usr_mon.sv"
`include "usr_cov.sv"
`include "usr_agent.sv"
`include "usr_sbd.sv"
`include "usr_env.sv"
`include "usr_seqlib.sv"
`include "usr_test.sv"
module top;
reg clk,res;
usr_intrf pif(clk,res);

initial begin
	uvm_resource_db#(virtual usr_intrf)::set("USR","VIF",pif,null);
end

usr dut(.clk(pif.clk),
		.res(pif.res),
		.load(pif.load),
		.hold(pif.hold),
		.shift_left(pif.shift_left),
		.shift_right(pif.shift_right),
		.serial_in(pif.serial_in),
		.parallel_in(pif.parallel_in),
		.serial_out(pif.serial_out),
    	.parallel_out(pif.parallel_out));

initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	res=1;
	repeat(2)@(posedge clk);
	res=0;
end

initial begin
	run_test("usr_load_test");
end
endmodule

