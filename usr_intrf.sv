interface usr_intrf(input bit clk,res);
	bit load,hold,shift_left,shift_right,serial_in;
	bit [`WIDTH-1:0]parallel_in;
	bit serial_out;
    bit [`WIDTH-1:0]parallel_out;
endinterface


