`include "params.vh"
module state_update_32b (
			 output [127:0] state,
			 output [31:0] 	pdo,
`ifdef TWO
			 output [31:0] 	vo,
`endif

			 input [127:0] 	skinny_state,
			 input [31:0] 	pdi,
			 input 		clk, rst, enc, se,
`ifdef TWO			 
			 input 		vse, venc, vf, vl, kdf, fv,
 `ifdef MR
			 input vs2,
			 input [31:0] sdi,
 `endif
`endif
			 input [3:0] 	decrypt
   ) ;
   parameter FFTYPE = 1;
   
   wire [127:0]   si;
   wire [31:0] 	  gofs;
   wire [31:0] 	  state_buf;   
   wire [31:0] 	  pdi_eff;
`ifdef TWO	
   wire [127:0]   VP;
   wire [31:0] 	  V2, V2P;   
   
   reg [127:0] 	  V;
   reg 		  Vfb;   
   
   assign VP = {V[7:0] ,
		V[15:8],
		V[23:16],
		V[31:24],
		V[39:32],
		V[47:40],
		V[55:48],
		V[63:56],
		V[71:64],
		V[79:72],
		V[87:80],
		V[95:88],
		V[103:96],
		V[111:104],
		V[119:112],
		V[127:120]
		};

   assign vo = V[127:96];   
   
   always @ (posedge clk) begin
      if (venc) begin	 
	 if (vse) begin
	    V[31:0] <= pdo;
	    Vfb <= pdo[7];	    
	 end
 `ifdef MR
	 else if (vs2) begin
	    V[31:0] <= sdi;
	    Vfb <= sdi[7];	    
	 end
 `endif
	 else begin
	    V[31:0] <= V2P;
	    Vfb <= vl ? V2P[31] : VP[31];	    
	 end
	 V[127:32] <= V[95:0];
      end      
   end // always @ (posedge clk)

   assign V2[31:0] = vf ? {VP[30:0],VP[127]} ^ {24'h0, VP[127], 4'h0, VP[127], VP[127] , 1'b0} 
   : {VP[30:0],Vfb};
   assign V2P = {V2[7:0], V2[15:8], V2[23:16], V2[31:24]};
   assign state_buf = fv ? state[127:96] : V[127:96] ^ state[127:96];
   assign si = kdf ? {state[95:0], pdi_eff^state[127:96]} : 
	       (fv ? {state[95:0], V2P^pdi_eff^state[127:96]} : 
		{state[95:0], V2P^pdi_eff^state_buf});
`else // !`ifdef TWO
   assign si = {state[95:0], pdi_eff^state[127:96]};
   assign state_buf = state[127:96];
`endif
   
   assign pdi_eff[7:0] = decrypt[0]   ? pdo[7:0] : pdi[7:0];
   assign pdi_eff[15:8] = decrypt[1]  ? pdo[15:8] : pdi[15:8];
   assign pdi_eff[23:16] = decrypt[2] ? pdo[23:16] : pdi[23:16];
   assign pdi_eff[31:24] = decrypt[3] ? pdo[31:24] : pdi[31:24];      

   assign gofs[7:0] = {state_buf[0]^state_buf[7],state_buf[7:1]};
   assign gofs[15:8] = {state_buf[8]^state_buf[15],state_buf[15:9]};
   assign gofs[23:16] = {state_buf[16]^state_buf[23],state_buf[23:17]};
   assign gofs[31:24] = {state_buf[24]^state_buf[31],state_buf[31:25]};
   assign pdo = pdi ^ gofs;   

   generate if (FFTYPE == 1) begin
      state_reg_cg s0 (.so(state[31:0])  ,.si(si[31:0])  ,.skinnys(skinny_state[31:0])  ,.clk(clk),.rst(rst),.enc(enc),.se(se));
      state_reg_cg s1 (.so(state[63:32]) ,.si(si[63:32]) ,.skinnys(skinny_state[63:32]) ,.clk(clk),.rst(rst),.enc(enc),.se(se));
      state_reg_cg s2 (.so(state[95:64]) ,.si(si[95:64]) ,.skinnys(skinny_state[95:64]) ,.clk(clk),.rst(rst),.enc(enc),.se(se));
      state_reg_cg s3 (.so(state[127:96]),.si(si[127:96]),.skinnys(skinny_state[127:96]),.clk(clk),.rst(rst),.enc(enc),.se(se));
   end
   endgenerate

   
   
endmodule // state_update_fn
