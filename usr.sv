module usr(clk,res,load,hold,shift_left,shift_right,serial_in,parallel_in,serial_out,parallel_out);
parameter WIDTH=8;
input clk,res,load,hold,shift_left,shift_right,serial_in;
input [WIDTH-1:0]parallel_in;
output reg serial_out;
output reg [WIDTH-1:0]parallel_out;
reg [WIDTH-1:0]q;

assign parallel_out=q;
assign serial_out=shift_left?q[7]:shift_right?q[0]:1'b0;

always@(posedge clk) begin
	if(res==1)begin
	q=0;
	end
	else begin
		if(load)
			q<=parallel_in;
		else if(hold)
			q<=q;
		else if(shift_left)
			q<={q[WIDTH-2:0],serial_in};
		else if(shift_right)
			q<={serial_in,q[WIDTH-1:1]};
		else
			q<=q;
	end
end
endmodule
