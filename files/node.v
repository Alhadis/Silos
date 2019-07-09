`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ali Behrouzi 9532266
// 
// Create Date:    19:34:02 06/30/2019 
// Design Name: 
// Module Name:    node 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module node(clock,crc,mod,data,bus_in,addr,receiverAddr,data_out
    );
input clock;
input [3:0] crc,addr,receiverAddr;
input  mod;
input [63:0] data;
inout bus_in;
output [63:0] data_out;

//bus enable 
reg bus_en=0;
// node Data
wire [63:0] nodeData;
//assign nodeData=data;
reg [63:0]temp_data;

//bus temp
reg bus_temp;

// packet
wire [79:0] packet;

reg [79:0] received_packet;

//startbit and end bit
reg startbit,endbit;

// initial start and end bit
initial begin
 startbit=0;
 endbit=1;
end



//datasize
wire [1:0] datasize=2'b11;

//make packet
assign packet[0]=startbit;
assign packet[4:1]=addr;
assign packet[8:5]=receiverAddr;
assign packet[10:9]=datasize;
assign packet[74:11]=nodeData;
assign packet[78:75]=crc;
assign packet[79]=endbit;

// regs for mod 1
integer  counter=0;
integer  counter_idle=0;
integer  counter_ack=0;

//regs for mod 0
integer  counter_receiver=0;
integer begin_ack=0;
integer  counter_ack_receiver=0;
reg [15:0] ack=0;
integer begin_receiving=0;

	always @(posedge clock) begin
	
		// mod =0 means its gonna be receiver
		if(mod==0) begin
			bus_en=0;
			// see the start bit
			if(bus_in==0) begin_receiving=1;
			
			// if we have seen the start bit
			if(begin_receiving==1) begin
				// receive packet in 80 clock
				if(counter_receiver<80) begin
					received_packet[counter_receiver]=bus_in;
					counter_receiver=counter_receiver+1;
				end
				// when packet has been received
				else begin
					// if receive address was equal to node address
					if (received_packet[8:5]==addr) begin
						//if packet's crc was equal to node crc
						if (received_packet[78:75]==crc) begin
							temp_data=received_packet[74:11];
							begin_receiving=0;
							begin_ack=1;
							ack[addr]=1;
							
						end
					end
				end
			end
			// we want to send ack
			if(begin_ack==1) begin
				if(counter_ack_receiver<2) begin
					bus_en=1;
					bus_temp=1;
					
					counter_ack_receiver=counter_ack_receiver+1;
				end
				// ack has been sent
				else begin
					
					begin_ack=0;
					counter_ack_receiver=0;
					counter_receiver=0;
				end

			end
			
		end
	
	
	
		// mod =1  means its gonna be sender
		else if (mod==1) begin
				//bus_en=0;
				// send packet in 80 clock
				if (counter<80) begin
					bus_en=1;
					bus_temp=packet[counter];
					counter=counter+1;
				end
				
				//when packet has been sent
				else begin
					bus_en=0;
					// keep bus 0 to recieve ack
					if(counter ==80) begin
						bus_en=1;
						bus_temp=0;
						counter =81;
					end
					
					// waiting to see ack
					else begin
						
						if (bus_in==1) begin
							counter_ack=counter_ack+1;
							//receive ack
							
							if (counter_ack==2) begin
								//idle bus
								bus_en=1;
								bus_temp=1;
								counter=0;
								counter_idle=0;
								counter_ack=0;
							end
						end
					end
				end
			
		end
		
		
	end
	
	
	assign bus_in= bus_en ? bus_temp : 1'bZ;
						
	assign nodeData= ack[addr]==1'b1 ? temp_data : data;
	
	assign data_out=nodeData;
	


endmodule




module FPGA(
clock,

// 4 bit input polynomial
CRC1,CRC2,CRC3,CRC4,CRC5,CRC6,CRC7,CRC8,CRC9,CRC10,CRC11,CRC12,CRC13,CRC14,CRC15,CRC16,

// 63 bit input initila data
Data1,Data2,Data3,Data4,Data5,Data6,Data7,Data8,Data9,Data10,Data11,Data12,Data13,Data14,Data15,Data16,

Data1_out,Data2_out,Data3_out,Data4_out,Data5_out,Data6_out,Data7_out,Data8_out,Data9_out,Data10_out,Data11_out,Data12_out,Data13_out,Data14_out,Data15_out,Data16_out,

// the addres which sender will send data to the node with this address
receiverAddr1,receiverAddr2,receiverAddr3,receiverAddr4,receiverAddr5,receiverAddr6,receiverAddr7,
receiverAddr8,receiverAddr9,receiverAddr10,receiverAddr11,receiverAddr12,receiverAddr13,receiverAddr14,
receiverAddr15,receiverAddr16,

// determines who is sender, this is robust and ofcurse onehot
mod,

// to see what is on bus in any clock
bus_show


    );
	 
	 // 4 bit input polynomial
input [3:0] CRC1,CRC2,CRC3,CRC4,CRC5,CRC6,CRC7,CRC8,CRC9,CRC10,
CRC11,CRC12,CRC13,CRC14,CRC15,CRC16;

// 63 bit input initila data
input [63:0] Data1,Data2,Data3,Data4,Data5,Data6,Data7,Data8,Data9,
Data10,Data11,Data12,Data13,Data14,Data15,Data16;

output [63:0] Data1_out,Data2_out,Data3_out,Data4_out,Data5_out,Data6_out,Data7_out,Data8_out,Data9_out
,Data10_out,Data11_out,Data12_out,Data13_out,Data14_out,Data15_out,Data16_out;

// the addres which sender will send data to the node with this address
input [3:0] receiverAddr1,receiverAddr2,receiverAddr3,receiverAddr4,receiverAddr5,receiverAddr6,receiverAddr7,
receiverAddr8,receiverAddr9,receiverAddr10,receiverAddr11,receiverAddr12,receiverAddr13,receiverAddr14,
receiverAddr15,receiverAddr16;

input clock;

// to see what is on bus in any clock
output bus_show;


// determines who is sender, this is robust and ofcurse onehot
input [15:0] mod;
	
wire bus;
//wire en=1;

// the nodes addresses
reg [3:0] addr1,addr2,addr3,addr4,addr5,addr6,addr7,addr8,addr9,addr10,addr11,addr12,addr13,addr14,addr15,addr16;

initial begin
 addr1=0;
 addr2=1;
 addr3=2;
 addr4=3;
 addr5=4;
 addr6=5;
 addr7=6;
 addr8=7;
 addr9=8;
 addr10=9;
 addr11=10;
 addr12=11;
 addr13=12;
 addr14=13;
 addr15=14;
 addr16=15;
end


// instantiation
node node1(.clock(clock),.crc(CRC1),.mod(mod[0]),.data(Data1),.bus_in(bus),.addr(addr1),.receiverAddr(receiverAddr1),.data_out(Data1_out));
node node2(.clock(clock),.crc(CRC2),.mod(mod[1]),.data(Data2),.bus_in(bus),.addr(addr2),.receiverAddr(receiverAddr2),.data_out(Data2_out));
node node3(.clock(clock),.crc(CRC3),.mod(mod[2]),.data(Data3),.bus_in(bus),.addr(addr3),.receiverAddr(receiverAddr3),.data_out(Data3_out));
node node4(.clock(clock),.crc(CRC4),.mod(mod[3]),.data(Data4),.bus_in(bus),.addr(addr4),.receiverAddr(receiverAddr4),.data_out(Data4_out));
node node5(.clock(clock),.crc(CRC5),.mod(mod[4]),.data(Data5),.bus_in(bus),.addr(addr5),.receiverAddr(receiverAddr5),.data_out(Data5_out));
node node6(.clock(clock),.crc(CRC6),.mod(mod[5]),.data(Data6),.bus_in(bus),.addr(addr6),.receiverAddr(receiverAddr6),.data_out(Data6_out));
node node7(.clock(clock),.crc(CRC7),.mod(mod[6]),.data(Data7),.bus_in(bus),.addr(addr7),.receiverAddr(receiverAddr7),.data_out(Data7_out));
node node8(.clock(clock),.crc(CRC8),.mod(mod[7]),.data(Data8),.bus_in(bus),.addr(addr8),.receiverAddr(receiverAddr8),.data_out(Data8_out));
node node9(.clock(clock),.crc(CRC9),.mod(mod[8]),.data(Data9),.bus_in(bus),.addr(addr9),.receiverAddr(receiverAddr9),.data_out(Data9_out));


// we put bus in bus_show to see what is on it in any clock;
assign bus_show= bus;

endmodule

