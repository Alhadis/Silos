`timescale 1ns / 1ps

module wishbone_slave #(
	parameter slave_addr = 32'h00000000)
	(
	input rst_i,
	input clk_i,
	input [31:0] dat_i,
	input [31:0] adr_i,
	input we_i,						// 0-W, 1-R
	input sel_i,
	input stb_i,
	input cyc_i,
	input addressLength, 	// User defined. If (addressLength == 1) -> 10bbit
	
	output [31:0] dat_o,
	output ack_o,   
	
	//interface to the periphery
	output 	scl,
	inout		sda
	
	);
	
reg selected;	// true if the slave_addr and the adr_i are equal
reg ack;			// acknowledge signal to master
wire sda_oe;	// true in write cycle, false in read cycle
reg scl_reg;	// Contains the value of the SCL
wire scl_en;	// Used for setting the SCL's frequency
wire scl_oe;	// indicates an ongoing cycle
wire scl_low;	// The SDA can change if it's true.
wire scl_high;	// If SCL is high, START or STOP condition can be indicated.

// Set bitrate
parameter BITRATE = 10;

//Selection detection
always @(posedge clk_i)
begin
	if(rst_i) selected <= 0;
	else if(adr_i == slave_addr) selected <= 1;
	else selected <= 0;
end

// Start cycle 
reg cyc_old;
reg start;
always @(posedge clk_i)
begin
	if(rst_i)
	begin
		cyc_old <= 0;
		start <= 0;
	end
	else
	begin
		if((cyc_old == 0) && (cyc_i == 1)) start <= 1;
		cyc_old <= cyc_i;
	end
end

// Set BitRate
reg [7:0] clk_counter;
always @(posedge clk_i)
 begin
	if (rst_i || (clk_counter == BITRATE) || ((cyc_old == 0) && (cyc_i == 1)))
	begin
		clk_counter <= 0;
	end
	else 
	begin
		clk_counter <= clk_counter + 1;
	end
end

assign scl_en = (clk_counter == BITRATE);  

// Create scl signal
always @(posedge clk_i) begin
	if(rst_i) begin
		scl_reg <= 0;
	end
	else if(scl_en) begin
		scl_reg <= ~scl_reg;
	end
end
		
// Fill up the shift register
// 10bit address is separated
reg [55:0] sda_reg;
reg start_condition;
reg stop_condition;
reg[5:0] bit_counter;
always @(posedge clk_i) begin
	if(rst_i)begin
		sda_reg <= {56{1'b1}};
		bit_counter <= 0;
		start_condition <= 0;

	end
	else if ((cyc_old == 0) && (cyc_i == 1)) begin
		if(addressLength)begin
				sda_reg[55] <= 0;							// start sign
				sda_reg[54:50] <= 5'b11110;			// Higher 2 bits of the address
				sda_reg[49:48] <= adr_i[31:30];
				sda_reg[47] <= we_i;
				sda_reg[46] <= 1'bz;						// ACK from the slave
				sda_reg[45:38] <= adr_i[29:22];		// Lower 8 bits of the address
				sda_reg[37] <= 1'bz;
				if (!we_i)begin
					sda_reg[36:29] <= dat_i[31:24];
					sda_reg[28] <= 1'bz;
					sda_reg[27:20] <= dat_i[23:16];
					sda_reg[19] <= 1'bz;
					sda_reg[18:11] <= dat_i[15:8];
					sda_reg[10] <= 1'bz;
					sda_reg[9:2] <= dat_i[7:0];
					sda_reg[1] <= 1'bz;
				end
				else begin
					sda_reg[36:29] <= {8{1'bz}};
					sda_reg[28] <= 1'b1;
					sda_reg[27:20] <= {8{1'bz}};
					sda_reg[19] <= 1'b1;
					sda_reg[18:11] <= {8{1'bz}};
					sda_reg[10] <= 1'b1;
					sda_reg[9:2] <= {8{1'bz}};
					sda_reg[1] <= 1'b0;
				end
				sda_reg[0] <= 1'b1;						//stop condition
			end
			else begin
				sda_reg[55] <= 0;							//start sign
				sda_reg[54:48] <= adr_i[31:25];		//7 bit address
				sda_reg[47] <= we_i;
				sda_reg[46] <= 1'bz;
				if (!we_i)begin
					sda_reg[45:38] <= dat_i[31:24];
					sda_reg[37] <= 1'bz;
					sda_reg[36:29] <= dat_i[23:16];
					sda_reg[28] <= 1'bz;
					sda_reg[27:20] <= dat_i[15:8];
					sda_reg[19] <= 1'bz;
					sda_reg[18:11] <= dat_i[7:0];
					sda_reg[10] <= 1'bz;
				end
				else begin
					sda_reg[45:38] <= {8{1'bz}};
					sda_reg[37] <= 1'b1;
					sda_reg[36:29] <= {8{1'bz}};
					sda_reg[28] <= 1'b1;
					sda_reg[27:20] <= {8{1'bz}};
					sda_reg[19] <= 1'b1;
					sda_reg[18:11] <= {8{1'bz}};
					sda_reg[10] <= 1'b0;
				end
				sda_reg[9] <= 1'b1;						//stop condition
				start_condition <= 1'b1;
			end
	end
	if (start && start_condition && scl_high)begin	//send out start condition
		sda_reg <= {sda_reg[54:0], sda_reg[55]};
		start_condition <= 1'b0;
		bit_counter <= 1'b0;
	end
	
	if (start && stop_condition && scl_high)begin	//send out stop condition
		sda_reg <= {sda_reg[54:0], sda_reg[55]};
		bit_counter <= 1'b0;
	end
	
	if(start && scl_low && !start_condition && !stop_condition)begin	//start shifting
		sda_reg <= {sda_reg[54:0],sda_reg[55]};
		bit_counter <= bit_counter + 1;
	end
end

// Set the stop condition
always @(posedge clk_i)
begin
	if(rst_i) stop_condition <= 0;
	else if(addressLength)									// 10bit address 
		if(bit_counter == 56)
			stop_condition <= 1;
		else 
			stop_condition <= 0;
	else
		if(bit_counter == 47)
			stop_condition <= 1;
		else 
			stop_condition <= 0;
end


assign scl_oe = start ? 1'b1: 1'b0;
assign sda_oe = start ? 1'b1: 1'b0;
assign scl = (scl_oe)? scl_reg : 1'bz;

assign sda = (sda_oe) ? sda_reg[55] : 1'bz;

assign scl_low = ((clk_counter == (BITRATE/2)) & (!scl_reg));
assign scl_high = ((clk_counter == (BITRATE/2)) & ( scl_reg));

// Fill out dat_o register with data from the periphery
reg [31:0]reg_dat_o;
always @(posedge clk_i)begin
	if(start && stop_condition && we_i)
	if (addressLength)begin
		reg_dat_o[31:24] <= sda_reg[36:29];	
		reg_dat_o[23:16] <= sda_reg[27:20];
		reg_dat_o[15:8] <= sda_reg[18:11];
		reg_dat_o[7:0] <= sda_reg[9:2];
	end
	else begin
		reg_dat_o[31:24] <= sda_reg[36:29];
		reg_dat_o[23:16] <= sda_reg[27:20];
		reg_dat_o[15:8] <= sda_reg[18:11];
		reg_dat_o[7:0] <= sda_reg[9:2];
	end
end

assign dat_o = reg_dat_o;

// Set the acknowledge signal 
reg ack_fb;
always @(posedge clk_i)
begin
	if(rst_i) ack_fb <= 0;
	else if(stop_condition) ack_fb <= 1;
	else ack_fb <= 0;
end

assign ack_o = ack_fb;
endmodule
