/*This is SPU Decode module which takes two instruction at a time as an input and outputs its appropriate
  source and destination addresses and also selects appropriate units for both even and odd instructions.
> operation is as follows:
  instruction input -> instruction decode (ID) -> pipe decide (PD) -> pipe select(PS) -> even/odd pipe -> output*/

`timescale 1ns/10ps
`include "opcode.h"

module DECODE_SPU(/*inputs*/  clk,reset,universal_reset,inst_in_1,inst_in_2,
                  /*outputs*/ addr_ra_even, addr_rb_even, addr_rc_even, addr_rt_even, inst_out_even, fix_sel, byte_sel,
	                      addr_ra_odd,  addr_rb_odd,  addr_rc_odd,  addr_rt_odd,  inst_out_odd,  permute_sel, branch_sel, ls_sel,
	                      branch_num, op_11_even,op_8_even,op_11_odd,op_8_odd, op_9_odd,op_7_odd,is_struct_hazard,struct_hazard_0);

	       
input clk,reset,universal_reset;
input [0:31] inst_in_1,inst_in_2;
input struct_hazard_0;
output [0:31] inst_out_even,inst_out_odd; 
output  [0:6] addr_ra_even, addr_rb_even, addr_rc_even; 
output  [0:6]addr_ra_odd,  addr_rb_odd,  addr_rc_odd;	     
output [0:6] addr_rt_even, addr_rt_odd;

output reg fix_sel, byte_sel, permute_sel, branch_sel, ls_sel;
output branch_num;

//-- INSTRUCTION 1 ID1 REGISTERS --------
reg op_11_1,op_8_1,op_9_1,op_7_1;
reg [0:31] inst_out_1;

//-- INSTRUCTION 1 ID2 REGISTERS -------
reg op_11_2,op_8_2,op_9_2,op_7_2;
reg [0:31] inst_out_2;

//-- INSTRUCTION 1 PD1 REGISTERS ------
reg pipe_even_1, pipe_odd_1;

//-- INSTRUCTION 1 PD2 REGISTERS ------
reg pipe_even_2, pipe_odd_2;

//-- PIPE SELECT WIRES ----------------
wire [0:31] inst_is_even;
wire [0:31] inst_is_odd;
wire [0:3] ps;
wire pipe_is_even, pipe_is_odd;
output op_11_even,op_8_even;
output op_11_odd,op_8_odd, op_9_odd,op_7_odd;
output is_struct_hazard;

assign is_struct_hazard = reset?0:(( ((pipe_odd_1 == pipe_odd_2) && (pipe_odd_1 !=0))  ) || (((pipe_even_1 == pipe_even_2) && (pipe_even_1 !=0)) ) ?1:0);

//---- PIPE SELECT LOGIC ------------------------------------------------------------------------------------------
assign inst_out_even = (!reset && !universal_reset && !struct_hazard_0)? inst_is_even : 0;
assign inst_out_odd  = (!reset && !universal_reset && !struct_hazard_0)? inst_is_odd : 0;

assign ps = {pipe_even_1,pipe_even_2,pipe_odd_1,pipe_odd_2};
assign pipe_is_even =  !struct_hazard_0 ? (((ps==4'b1100) || (ps==4'b1001) || (ps==4'b1000)) ? pipe_even_1 :((ps==4'b0110)?pipe_even_2:0)) :0;   // made change  ((ps==4'b1000)?pipe_even_2:0)
assign pipe_is_odd  =  !struct_hazard_0 ? (((ps==4'b0011) || (ps==4'b0110) || (ps==4'b0010)) ? pipe_odd_1  :((ps==4'b1001)?pipe_odd_2:0)) :0;

assign inst_is_even =  !struct_hazard_0 ? (((ps==4'b1100) || (ps==4'b1001) || (ps==4'b1000)) ? inst_out_1  :((ps==4'b0110)?inst_out_2:0)) :0;
assign inst_is_odd  =  !struct_hazard_0 ? (((ps==4'b0011) || (ps==4'b0110) || (ps==4'b0010)) ? inst_out_1  :((ps==4'b1001)?inst_out_2:0)) :0;

assign op_11_even   =  !struct_hazard_0 ? (((ps==4'b1100) || (ps==4'b1001) || (ps==4'b1000)) ? op_11_1     :((ps==4'b0110)?op_11_2:0)) :0;
assign op_11_odd    =  !struct_hazard_0 ? (((ps==4'b0011) || (ps==4'b0110) || (ps==4'b0010)) ? op_11_1     :((ps==4'b1001)?op_11_2:0)) :0;

assign op_8_even    =  !struct_hazard_0 ? (((ps==4'b1100) || (ps==4'b1001) || (ps==4'b1000)) ? op_8_1      :((ps==4'b0110)?op_8_2:0)) :0;
assign op_8_odd     =  !struct_hazard_0 ? (((ps==4'b0011) || (ps==4'b0110) || (ps==4'b0010)) ? op_8_1      :((ps==4'b1001)?op_8_2:0)) :0;

assign op_9_odd     =  !struct_hazard_0 ? (((ps==4'b0011) || (ps==4'b0110) || (ps==4'b0010)) ? op_9_1      :((ps==4'b1001)?op_9_2:0)) :0;
assign op_7_odd     =  !struct_hazard_0 ? (((ps==4'b0011) || (ps==4'b0110) || (ps==4'b0010)) ? op_7_1      :((ps==4'b1001)?op_7_2:0)) :0;
assign branch_num   =  !struct_hazard_0 ? ((ps==4'b1001) ? 1 : 0) :0;


// always @(*)
//   begin 
//     if (reset | universal_reset) 
//       begin
//             is_struct_hazard = 1'b0;
//       end
//     
//     else
//     begin 
//       is_struct_hazard = 0;
//       //Structural Hazard Logic
//       if((pipe_odd_1 == pipe_odd_2) && (pipe_odd_1 !=0))              is_struct_hazard = 1'b1;
//       else if((pipe_even_1 == pipe_even_2) && (pipe_even_1 !=0))      is_struct_hazard = 1'b1;
//       else is_struct_hazard = 1'b0;
//     end
// end

	assign addr_rt_even = pipe_is_even ? inst_is_even [25:31] : 0;
        assign addr_rt_odd =  pipe_is_odd ? inst_is_odd [25:31] : 0;

assign {addr_ra_even,addr_rb_even,addr_rc_even} =  pipe_is_even? (op_11_even ? {inst_is_even[18:24],inst_is_even[11:17],7'b0000000} : {inst_is_even[18:24],7'b0000000,7'b0000000}) :0;
assign {addr_ra_odd,addr_rb_odd,addr_rc_odd} =     pipe_is_odd ?(op_11_odd ? (inst_is_odd[0:10]==`STQX ? {inst_is_odd[18:24],inst_is_odd[11:17],inst_is_odd[25:31]} 
                                                            : {inst_is_odd[18:24],inst_is_odd[11:17],7'b0000000}):(op_8_odd ?({inst_is_odd[18:24],7'b0000000,7'b0000000}):(op_9_odd ?({inst_is_odd[25:31],7'b0000000,7'b0000000} ) :(0)  ))):(0); 
                                                   
                                                   /*
                                                   (op_11_odd  ? 
                                                        (inst_is_odd[0:10]==`STQX ? 
                                                            {inst_is_odd[18:24],inst_is_odd[11:17],inst_is_odd[25:31]} 
                                                            : {inst_is_odd[18:24],inst_is_odd[11:17],7'b0000000})
                                                        :(op_8_odd ? 
                                                          {inst_is_odd[18:24],7'b0000000,7'b0000000} 
                                                          : 0) ): 0;*/
// ----------------------------------------- POSEDGE BLOCK ---------------------------------------------
always @ (posedge (clk) or posedge (reset) or posedge (universal_reset)) 
begin
  if (reset)
  begin
      {inst_out_1,inst_out_2} <=  0;
//       {addr_ra_even, addr_rb_even, addr_rc_even /*addr_rt_even*/} <=  0;
//       {addr_ra_odd,  addr_rb_odd,  addr_rc_odd  /*addr_rt_odd*/} <=  0;
      {pipe_odd_1,pipe_even_1} <=  2'b00;
      {pipe_odd_2,pipe_even_2} <=  2'b00;
      {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b0000;
      {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b0000;
  end
  
  else if (universal_reset)
  begin
      {inst_out_1,inst_out_2} <=  0;
//       {addr_ra_even, addr_rb_even, addr_rc_even /*addr_rt_even*/} <=  0;
//       {addr_ra_odd,  addr_rb_odd,  addr_rc_odd  /*addr_rt_odd*/} <=  0;
      {pipe_odd_1,pipe_even_1} <=  2'b00;
      {pipe_odd_2,pipe_even_2} <=  2'b00;
      {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b0000;
      {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b0000;
  end
  
      else
      begin  
	inst_out_1 <=  inst_in_1;
	inst_out_2 <=  inst_in_2;
//--------------------------------------- INSTRUCTION 1 ID1 AND PD1 LOGIC ----------------------------------------

       if (inst_in_1[0:6] == `ILA  && !struct_hazard_0)  //instructions of 7 bit opcodes are identified
	begin
	  {pipe_odd_1,pipe_even_1} <=  2'b10;                                                              //pipe_odd_1,pipe_even_1
	  {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b0001;
	end
	        
      else if ((inst_in_1[0:7] == `LQD   || inst_in_1[0:7] == `STQD || inst_in_1[0:7] == `AHI   ||
	       inst_in_1[0:7] == `MPYI  || inst_in_1[0:7] == `ANDHI || inst_in_1[0:7] == `ORHI || 
	       inst_in_1[0:7] == `XORHI  || inst_in_1[0:7] == `CEQBI || inst_in_1[0:7] ==`CGTI) && !struct_hazard_0) 
	begin
	  {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b0010;      //instructions of 8 bit opcodes are identified    
	  if((inst_in_1[0:7] == `LQD  || inst_in_1[0:7] == `STQD )  && !struct_hazard_0)  
	    {pipe_odd_1,pipe_even_1} <=  2'b10;
	    
	  else
	    {pipe_odd_1,pipe_even_1} <=  2'b01;
	end
	  
      else if ((inst_in_1[0:8] == `LQA  || inst_in_1[0:8] == `STQA || inst_in_1[0:8] == `ILH  ||
	       inst_in_1[0:8] == `IL   || inst_in_1[0:8] == `BRA  || inst_in_1[0:8] == `BRNZ || 
	       inst_in_1[0:8] == `BRZ) && !struct_hazard_0 ) 
        begin
	  {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b0100;      //instructions of 9 bit opcodes are identified
	  {pipe_odd_1,pipe_even_1} <=  2'b10;
	end
	
      else
	begin
	       //instructions of 11 bit opcodes are identified
	  if  ((inst_in_1[0:10] == `LQX    || inst_in_1[0:10] == `STQX   || inst_in_1[0:10] == `SHLQBI || 
               inst_in_1[0:10] == `SHLQBY || inst_in_1[0:10] == `ROTQBI || inst_in_1[0:10] == `ROTQBY ||
               inst_in_1[0:10] == `ROTQMBY) && !struct_hazard_0)
               begin 
                    {pipe_odd_1,pipe_even_1} <=  2'b10; 
                    {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b1000;
               end
	  
	  else if ((inst_in_1[0:10] == `AH   || inst_in_1[0:10] == `SFH || inst_in_1[0:10] == `MPY ||
                   inst_in_1[0:10] == `MPYU || inst_in_1[0:10] == `CEQB|| inst_in_1[0:10] == `CEQH||
                   inst_in_1[0:10] == `CGTB || inst_in_1[0:10] == `CGT || inst_in_1[0:10] == `BG  ||
                   inst_in_1[0:10] == `AND  || inst_in_1[0:10] == `OR  || inst_in_1[0:10] == `XOR ||
                   inst_in_1[0:10] == `NAND || inst_in_1[0:10] == `NOR || inst_in_1[0:10] == `EQV ||
                   inst_in_1[0:10] == `CNTB || inst_in_1[0:10] == `GBB || inst_in_1[0:10] == `GB  ||
                   inst_in_1[0:10] == `AVGB) && !struct_hazard_0)
                   begin 
                     {pipe_odd_1,pipe_even_1} <=  2'b01; 
                     {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b1000;
                   end
	  else
	    begin {pipe_odd_1,pipe_even_1} <=  2'b00; {op_11_1,op_9_1,op_8_1,op_7_1} <=  4'b0000; end
	end
	  
	  
//--------------------------------------- INSTRUCTION 2 ID2 AND PD2 LOGIC----------------------------------------

      if (inst_in_2[0:6] == 7'b0100001  && !struct_hazard_0)  //instructions of 7 bit opcodes are identified
	begin
	  {pipe_odd_2,pipe_even_2} <=  2'b10;                                                   //pipe_odd_2,pipe_even_2
	  {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b0001;
	end
	        
      else if ((inst_in_2[0:7] == `LQD   || inst_in_2[0:7] == `STQD || inst_in_2[0:7] == `AHI   ||
	       inst_in_2[0:7] == `MPYI  || inst_in_2[0:7] == `ANDHI || inst_in_2[0:7] == `ORHI || 
	       inst_in_2[0:7] == `XORHI  || inst_in_2[0:7] == `CEQBI || inst_in_2[0:7] ==`CGTI) && !struct_hazard_0) 
	begin
	  {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b0010;      //instructions of 8 bit opcodes are identified    
	  if((inst_in_2[0:7] == `LQD  || inst_in_2[0:7] == `STQD)  && !struct_hazard_0)    
	    {pipe_odd_2,pipe_even_2} <=  2'b10;
	    
	  else
	    {pipe_odd_2,pipe_even_2} <=  2'b01;
	end
	  
      else if ((inst_in_2[0:8] == `LQA  || inst_in_2[0:8] == `STQA || inst_in_2[0:8] == `ILH  ||
	       inst_in_2[0:8] == `IL   || inst_in_2[0:8] == `BRA  || inst_in_2[0:8] == `BRNZ || 
	       inst_in_2[0:8] == `BRZ ) && !struct_hazard_0) 
        begin
	  {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b0100;      //instructions of 9 bit opcodes are identified
	  {pipe_odd_2,pipe_even_2} <=  2'b10;
	end
	
      else
	begin
	       //instructions of 11 bit opcodes are identified
	  if  ((inst_in_2[0:10] == `LQX    || inst_in_2[0:10] == `STQX   || inst_in_2[0:10] == `SHLQBI || 
               inst_in_2[0:10] == `SHLQBY || inst_in_2[0:10] == `ROTQBI || inst_in_2[0:10] == `ROTQBY ||
               inst_in_2[0:10] == `ROTQMBY) && !struct_hazard_0)
               begin 
                    {pipe_odd_2,pipe_even_2} <=  2'b10; 
                    {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b1000;
               end
	  
	  else if ((inst_in_2[0:10] == `AH   || inst_in_2[0:10] == `SFH || inst_in_2[0:10] == `MPY ||
                   inst_in_2[0:10] == `MPYU || inst_in_2[0:10] == `CEQB|| inst_in_2[0:10] == `CEQH||
                   inst_in_2[0:10] == `CGTB || inst_in_2[0:10] == `CGT || inst_in_2[0:10] == `BG  ||
                   inst_in_2[0:10] == `AND  || inst_in_2[0:10] == `OR  || inst_in_2[0:10] == `XOR ||
                   inst_in_2[0:10] == `NAND || inst_in_2[0:10] == `NOR || inst_in_2[0:10] == `EQV ||
                   inst_in_2[0:10] == `CNTB || inst_in_2[0:10] == `GBB || inst_in_2[0:10] == `GB  ||
                   inst_in_2[0:10] == `AVGB) && !struct_hazard_0)
                   begin 
                     {pipe_odd_2,pipe_even_2} <=  2'b01; 
                     {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b1000;
                   end
	  else
	    begin {pipe_odd_2,pipe_even_2} <=  2'b00; {op_11_2,op_9_2,op_8_2,op_7_2} <=  4'b0000; end
	end
	  
//--------------------------------------- EVEN PIPE OUTPUTS LOGIC i.e. DECODE_SPU OUTPUTS ----------------------------------
//      if (pipe_is_even)
//        begin
// //          addr_rt_even <=  inst_is_even [25:31];
// 
//         if (op_11_even)
// 	     {addr_ra_even,addr_rb_even,addr_rc_even} <=  {inst_is_even[18:24],inst_is_even[11:17],7'b0000000};
// 
// 	 else 
// 	     {addr_ra_even,addr_rb_even,addr_rc_even} <=  {inst_is_even[18:24],7'b0000000,7'b0000000};
//        end 
// 
//      else
//        begin 
// // 	 addr_rt_even <=  0;
// 	 {addr_ra_even, addr_rb_even, addr_rc_even/*, addr_rt_even*/} <=  0;
//        end

//--------------------------------------- ODD PIPE OUTPUTS LOGIC i.e. DECODE_SPU OUTPUTS ----------------------------------  
//      if (pipe_is_odd) 
//        begin
// // 	 addr_rt_odd <=  inst_is_odd [25:31];
// 	
//          if (op_11_odd)
//  	   begin
// 	     case(inst_is_odd[0:10])
// 		`STQX :  {addr_ra_odd,addr_rb_odd,addr_rc_odd} <=  {inst_is_odd[18:24],inst_is_odd[11:17],inst_is_odd[25:31]};
// 		 default:{addr_ra_odd,addr_rb_odd,addr_rc_odd} <=  {inst_is_odd[18:24],inst_is_odd[11:17],7'b0000000};
// 	     endcase
// 	   end
// 	        
// 
// 	 else if (op_8_odd)
// 	   {addr_ra_odd,addr_rb_odd,addr_rc_odd} <=  {inst_is_odd[18:24],7'b0000000,7'b0000000};
// 
// 	 else 
// 	   {addr_ra_odd,addr_rb_odd,addr_rc_odd} <=  {inst_is_odd[25:31],7'b0000000,7'b0000000};
//        end 
// 
//      else
//  	begin 
// // 	  addr_rt_odd <=  0;
// 	  {addr_ra_odd, addr_rb_odd, addr_rc_odd/*, addr_rt_odd*/} <=  0;
// 	end
//    end 
 end 
end

//----------------------------- COMBINATIONAL BLOCK -------------------------
always @(*)
  begin 
    if (reset | universal_reset) 
      begin
	{fix_sel, byte_sel} = 0;
	{ls_sel, permute_sel, branch_sel} = 3'b000;
//         is_struct_hazard = 1'b0;
      end
    
    else
    begin 
      {fix_sel, byte_sel} = 0;  
      {ls_sel, permute_sel, branch_sel} = 3'b000;
//       is_struct_hazard = 0;
      
//       //Structural Hazard Logic
//       if((pipe_odd_1 == pipe_odd_2) && (pipe_odd_1 !=0))              is_struct_hazard = 1'b1;
//       else if((pipe_even_1 == pipe_even_2) && (pipe_even_1 !=0))      is_struct_hazard = 1'b1;
//       else is_struct_hazard = 1'b0;

//----------------------------EVEN PIPE UNITS SELECTS ----------------------- 
      if(pipe_is_even && !struct_hazard_0) 
      begin 
	 if (op_8_even && !struct_hazard_0)
	   {fix_sel, byte_sel} = 2'b10;

	else if (op_11_even && !struct_hazard_0)
	    case(inst_is_even[0:10])
//-- BYTE --------------------------------------------------------------------
		`GBB:   { fix_sel, byte_sel} = 2'b01;
		`GB:    { fix_sel, byte_sel} = 2'b01;
		`CNTB:  { fix_sel, byte_sel} = 2'b01;
		`AVGB:  { fix_sel, byte_sel} = 2'b01;
//-- FIX --------------------------------------------------------------------
		`AH:    { fix_sel, byte_sel} = 2'b10;
		`SFH:   { fix_sel, byte_sel} = 2'b10;
		`BG:    { fix_sel, byte_sel} = 2'b10;
		`MPY:   { fix_sel, byte_sel} = 2'b10;
		`MPYU:  { fix_sel, byte_sel} = 2'b10;	
		`AND:   { fix_sel, byte_sel} = 2'b10;
		`OR:    { fix_sel, byte_sel} = 2'b10;
		`XOR:   { fix_sel, byte_sel} = 2'b10;
		`NAND:  { fix_sel, byte_sel} = 2'b10;
		`NOR:   { fix_sel, byte_sel} = 2'b10;
		`EQV:   { fix_sel, byte_sel} = 2'b10;
		`CEQB:  { fix_sel, byte_sel} = 2'b10;
		`CEQH:  { fix_sel, byte_sel} = 2'b10;
		`CGTB:  { fix_sel, byte_sel} = 2'b10;
		`CGT:   { fix_sel, byte_sel} = 2'b10;	
		default:{ fix_sel, byte_sel} = 2'b00;
	     endcase 
	  else 
	  {fix_sel, byte_sel} = 2'b00;
	end 
     
     else 
     {fix_sel, byte_sel} = 2'b00;
  
//------------------------------ ODD PIPE UNITS SELECTS ----------------------
    if(pipe_is_odd && !struct_hazard_0) 
      begin
	if (op_7_odd && !struct_hazard_0)
	  {ls_sel, permute_sel, branch_sel} = 3'b100; 

	else if (op_9_odd && !struct_hazard_0) 
	       case (inst_is_odd[0:8])
//-- LOAD & STORE -------------------------------------------------------------
		`LQA:  {ls_sel, permute_sel, branch_sel} = 3'b100;
		`STQA: {ls_sel, permute_sel, branch_sel} = 3'b100;
		`ILH:  {ls_sel, permute_sel, branch_sel} = 3'b100;
		`IL:   {ls_sel, permute_sel, branch_sel} = 3'b100;
//-- BRANCH -------------------------------------------------------------------
		`BR:   {ls_sel, permute_sel, branch_sel} = 3'b001;
		`BRA:  {ls_sel, permute_sel, branch_sel} = 3'b001;
		`BRNZ: {ls_sel, permute_sel, branch_sel} = 3'b001;
		`BRZ:  {ls_sel, permute_sel, branch_sel} = 3'b001;			
	       endcase 

       else if (op_11_odd && !struct_hazard_0) 
	      case (inst_is_odd[0:10])
//-- LOAD & STORE -------------------------------------------------------------
		`LQX:    {ls_sel, permute_sel, branch_sel} = 3'b100;
		`STQX:   {ls_sel, permute_sel, branch_sel} = 3'b100;
//-- PERMUTE ------------------------------------------------------------------
		`SHLQBI: {ls_sel, permute_sel, branch_sel} = 3'b010;
		`SHLQBY: {ls_sel, permute_sel, branch_sel} = 3'b010;
		`ROTQBI: {ls_sel, permute_sel, branch_sel} = 3'b010;
		`ROTQBY: {ls_sel, permute_sel, branch_sel} = 3'b010;
		`ROTQMBY:{ls_sel, permute_sel, branch_sel} = 3'b010;
	      endcase 
 
       else if (op_8_odd) 
	    {ls_sel, permute_sel, branch_sel} = 3'b100;

       else 
	    {ls_sel, permute_sel, branch_sel} = 3'b000;
    end 
   
    else 
	    {ls_sel, permute_sel, branch_sel} = 3'b000;   
  end 
end
endmodule 
  
