
module DecodeExecute(CLOCK_50, instructionMemory, SW1, result, address);
//***************************************************************
input CLOCK_50;
input SW1;
input [31:0]instructionMemory;
wire [31:0] firstObj; // data memory buffer
wire [31:0] secondObj; // second data memory buffer
output reg [31:0]result;
output reg [7:0]address;
wire [6:0] addressOut;
wire [6:0] address_a;
wire [6:0] address_b;
wire [13:0] value; // used for I-type
reg [3:0] counter;
reg [31:0] instructionTemp;
reg WREN;
//***************************************************************

initial begin
	counter = 0;
	instructionTemp = 0;
	WREN = 0;
end

//Does store and decode/execute
SimDataMemory dt(CLOCK_50, result ,address_a, address, WREN, firstObj); // duplicate to read and write
SimDataMemory dtM(CLOCK_50, result , address_b, address, WREN, secondObj);

assign address_a[6:0] = instructionTemp[25:20]; // Register Source 1 Automatically assign them outside the loop
assign address_b[6:0] = instructionTemp[19:14]; // Register Source 2
assign addressOut[6:0] = instructionTemp[13:8]; // Destination Source 
assign value[13:0] = instructionTemp[13:0]; // value if i-type

always@(posedge CLOCK_50) begin
	if(SW1) begin // turn on CPU
		counter <= counter + 1;
		if(counter == 2) begin
		  	instructionTemp <= instructionMemory;
			/* Instruction is brought in and decoded */
						/* Decode into two types */
				if(instructionTemp != 0) begin
				 if(instructionTemp[31:26] != 6'b000111) begin 
				  if(instructionTemp[31:26] == 6'b000001 
				  || instructionTemp[31:26] == 6'b000010 
				  || instructionTemp[31:26] == 6'b000011 
				  || instructionTemp[31:26] == 6'b000100) begin // RType
					//R-Type Instruction
						if( instructionTemp[31:26] == 6'b000001) begin // adding
							result = firstObj + secondObj;
						end else if(instructionTemp[31:26] == 6'b000010) begin // subtracting
							result = firstObj - secondObj;
						end else if(instructionTemp[31:26] == 6'b000011) begin // AND
							result = firstObj & secondObj;
						end else if(instructionTemp[31:26] == 6'b000100) begin // OR
							result = firstObj | secondObj;
						end
						address = addressOut;
						if( instructionTemp != 0 ) begin 
							WREN = 1;
						end
				  end else if(instructionTemp[31:26] == 6'b000101 // IType
			    || instructionTemp[31:26] == 6'b000110) begin
			       if( instructionTemp[31:26] == 6'b000101) begin // LOAD
						result = value;
					end else if(instructionTemp[31:26] == 6'b000110) begin // MOVE 
						result = firstObj;
					end
						address = address_b[6:0];
					if( instructionTemp != 0 ) begin 
						WREN = 1;
					end
			     end
			   end
				end else if(instructionTemp == 32'hFFFFFFFF) begin
				  		address <= 7'b1111111;
				  		WREN <=0;
				end else if(instructionTemp == 0) begin
				  WREN = 0;  
				end
			/* If J-Type instruction occurs jump! and skip rest */
			counter <= 0;
		end
	 end
end

endmodule

module SimDataMemory(CLOCK, data, rAddress, wAddress, wren, out );// three way read and write
  input CLOCK;
  input [31:0] data;
  input [6:0] rAddress;
  input [6:0] wAddress;
  input wren;
  output [31:0] out;
  reg [31:0] dataArray[256:0];
  
  initial begin
    $readmemb("DataMemory.mem", dataArray);
  end
  
  always @(posedge CLOCK) begin
    if(wren) begin
      dataArray[wAddress] = data;
    end
  end
  assign out = dataArray[rAddress];

endmodule