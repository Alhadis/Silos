`timescale 1ns/1ns

module cpu_tb  ;  
 
 reg  clock; 
  reg  reset; 
  
  wire [4:0] writeRegWb;
  wire [31:0] resultWb;
  wire [31:0] pcIf;
  wire [1:0] pcSrcId;
  wire [31:0] instrID;
  
  cpu DUT (.clock(clock), 
                    .reset (reset),
                    .writeRegWb(writeRegWb), 
                    .resultWb(resultWb),
                    .pcIf(pcIf), 
                    .pcSrcId(pcSrcId), 
                    .instrID(instrID)); 
           
           
  initial begin
  
   clock = 0;
   reset = 1;
   #120 reset = 0;
	
   #2550 $stop;
  end
  
	initial begin
		$display("*************************************************");
		$display("The textual simulation results:");
		$display("*************************************************");
		$monitor("Time : %0d Clock: %d \n[$s0] = %h  [$s1] = %h  [$s2] = %h \n[$s3] = %h  [$s4] = %h  [$s5] = %h \n[$s6] = %h  [$s7] = %h  [$t0] = %h \n[$t1] = %h  [$t2] = %h  [$t3] = %h \n[$t4] = %h  [$t5] = %h  [$t6] = %h \n[$t7] = %h  [$t8] = %h  [$t9] = %h \n",
			$time, clock, DUT.decode_module.registers.s0,DUT.decode_module.registers.s1,DUT.decode_module.registers.s2,
								DUT.decode_module.registers.s3,DUT.decode_module.registers.s4,DUT.decode_module.registers.s5,
								DUT.decode_module.registers.s6,DUT.decode_module.registers.s7,DUT.decode_module.registers.t0,
								DUT.decode_module.registers.t1,DUT.decode_module.registers.t2,DUT.decode_module.registers.t3,
								DUT.decode_module.registers.t4,DUT.decode_module.registers.t5,DUT.decode_module.registers.t6,
								DUT.decode_module.registers.t7,DUT.decode_module.registers.t8,DUT.decode_module.registers.t9);
	end
	
  always #50 clock = ~clock;
     
endmodule

