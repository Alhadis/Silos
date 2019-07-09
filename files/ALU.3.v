module ALU (input [2:0] fn, input [7:0] op_A, op_B,input cin, output reg [7:0] out,output reg co, z); 

	always@(*)begin
		{out,co,z} = 0;
		casex (fn) 
			3'b00? : {co,out} = cin + op_A + op_B ;
			3'b01? : {co,out} = op_A - op_B - cin;
			3'b100 : out = op_A & op_B;
			3'b101 : out = op_A | op_B;
			3'b110 : out = op_A ^ op_B;
			3'b111 : out = ~(op_A & op_B);
		endcase
		z = (out == 8'b0);
	
	end

endmodule


module test_ALU ();
reg [2:0] fn;
reg [7:0] A, B;
reg cin;
wire [7:0] out;
wire co, z;

ALU cpu( fn,A, B,cin,out, co, z); 

initial begin
	fn = 3'b000; 
	A = 8'd8; B = 8'd5; cin  = 1 ;
	#10 cin = 0;
	#10 fn = 3'b011;
	#10 B = 8'd23; 
	#10 fn = 3'b100;
	#10 fn = 3'b101;
	#10 fn = 3'b110;
	#10 fn = 3'b111;
	#10;
	

end

endmodule



