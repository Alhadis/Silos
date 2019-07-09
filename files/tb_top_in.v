`timescale 1ns / 1ps


module tb_top_in;

	// Inputs
	reg rst;
	reg clk;
	reg [31:0] control_dat;
	reg [31:0] control_adr;
	reg dat_rdy;
	reg set_addressLength;
	reg we;

	// Outputs
	wire scl;

	// Bidirs
	wire sda;
	
	// Data reg
	reg [54:0]sda_reg_tb;
	reg [31:0]data = {31{1'b1}};

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.rst(rst), 
		.clk(clk), 
		.control_dat(control_dat), 
		.control_adr(control_adr), 
		.dat_rdy(dat_rdy), 
		.set_addressLength(set_addressLength), 
		.we(we), 
		.sda(sda), 
		.scl(scl)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		control_dat = 0;
		control_adr = 0;
		dat_rdy = 0;
		set_addressLength = 0;
		we = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		rst = 0;
		control_adr = 32'h1000_0000;
		we = 1;
		set_addressLength = 1;
		dat_rdy = 1;

	end
	
	always #5
	clk <= ~clk;
	
	reg [15:0]check_addr;
	reg old_sda;
	reg old_scl;
	reg frame_start;
	reg we_feedback;
	reg ack_feedback;
	
	always @(posedge clk)
	begin
	if(rst) old_scl <= 0;
   else	old_scl <= scl;
	end
	
	always @(posedge clk)
	begin
		if(rst) check_addr <= 0;
		else if(((sda == 0) && (old_sda == 1)) && ((scl == 0) && (old_scl == 1))) 
		begin
			frame_start <= 1;
		end
		else frame_start <= 0;
	end
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			sda_reg_tb[54] <= 1'bz;
			sda_reg_tb[53:46] <= {8{1'bz}};
			sda_reg_tb[45] <= 1'b1;
			sda_reg_tb[44:37] <= {8{1'bz}};
			sda_reg_tb[36] = 1'b1;
			sda_reg_tb[35:28] <= data[31:24];
			sda_reg_tb[27] <= 1'bz;
			sda_reg_tb[26:19] <= data[23:16];
			sda_reg_tb[18] <= 1'bz;
			sda_reg_tb[17:10] <= data[15:8];
			sda_reg_tb[9] <= 1'bz;
			sda_reg_tb[8:1] <= data[7:0];
			sda_reg_tb[0] <= 1'bz;
		end
	end
	

	reg tmp;
	always @(posedge clk)
	begin
		if((old_scl == 0) && (scl == 1))
		begin
			tmp <= 1;
			sda_reg_tb <= {sda_reg_tb[53:0],sda_reg_tb[54]};
		end
		else tmp <= 0;
	end
	

	assign sda = sda_reg_tb[54];
      
endmodule

