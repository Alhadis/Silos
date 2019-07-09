
module Fetch(CLOCK_50, bufferInstructionMemory, SW1);
//***************************************************************
output [31:0] bufferInstructionMemory; // Used for sending the instruction to Decode/Execute stage 
input CLOCK_50; // Clock Used by all modules 
input SW1; // Switch to turn on and off CPU
wire [31:0] instructionMemory; // Holder to keep track of this stages Instruction
reg [6:0] currentAddress; // Program Counter
reg [3:0] counter; // Used to split the clock 
//***************************************************************

initial begin
	currentAddress = 0;
	counter = 0;
end
//InstructionMemory M4KGrab(currentAddress,CLOCK_50, 0, 0, instructionMemory); // this takes longer than 1 clock read


// Grab Instruction M4K block
SimInstructionMemory SimGrab(currentAddress, instructionMemory);
always @(posedge CLOCK_50) begin
	if(SW1) begin
		if(instructionMemory != 32'hFFFFFFFF) begin
			counter <= counter + 1;
			if(counter == 2) begin 
				if(instructionMemory[31:26] == 6'b000111) begin
				  currentAddress <= instructionMemory[6:0];
				  counter <= 0;
				end else begin
				  currentAddress <= currentAddress + 1; // Increment Program Counter
				  counter <= 0;
				end
			end 
		end
	end	
end
assign	bufferInstructionMemory = instructionMemory; // Send Instruction to Decode/Fetch by changing the instruction Memory 
endmodule



module SimInstructionMemory(address, instructionMemory);
  input [6:0] address;
  output [31:0] instructionMemory;
  reg [31:0] memoryItself[256:0];
  initial begin 
    $readmemb("InstructionMemory.mem", memoryItself);
  end
  assign instructionMemory = memoryItself[address];
endmodule 
