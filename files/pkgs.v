package proj_pkgs;

   parameter LAP_SA_ALUWIDTH = 16;
   parameter LAP_N = 4;  // SA array side size

   parameter LAP_SA_ACCWIDTH = 32; // accumulator width
   
   parameter LAP_COL_CACHE_ADR_BITS = 4; // address row of LAP_N elements
   parameter LAP_COL_ADR_LSB = $clog2(LAP_N);
   parameter LAP_COL_ADR_MSB = LAP_COL_ADR_LSB + LAP_COL_CACHE_ADR_BITS -1;

   parameter LAP_ROW_CACHE_ADR_BITS = 4; // address row of LAP_N elements
   parameter LAP_ROW_ADR_LSB = $clog2(LAP_N);
   parameter LAP_ROW_ADR_MSB = LAP_ROW_ADR_LSB + LAP_ROW_CACHE_ADR_BITS -1;

   parameter LAP_PAR_CACHE_ADR_BITS = 4; // address row of LAP_N elements
   parameter LAP_PAR_ADR_LSB = $clog2(LAP_N);
   parameter LAP_PAR_ADR_MSB = LAP_PAR_ADR_LSB + LAP_PAR_CACHE_ADR_BITS -1;
   
   typedef struct packed {
      logic [INST_OPCD_MSB:0] opcd;
      logic [LAP_SA_ALUWIDTH - 1:0] data;
   } dbus_t;

   typedef struct  packed { // sum bus
      logic [LAP_SA_ACCWIDTH - 1:0] data;
   } sbus_t;

   typedef struct packed {
      logic 				 rd;
      logic [LAP_COL_CACHE_ADR_BITS-1:0] adr;
   } coladdr_t;

   typedef struct packed {
      logic 				 rd;
      logic [LAP_ROW_CACHE_ADR_BITS-1:0] adr;
   } rowaddr_t;

   typedef struct packed {
      logic 				 rd;
      logic 				 wr;
      logic [LAP_PAR_CACHE_ADR_BITS-1:0] adr;
   } paraddr_t;

   typedef struct 			 packed {
         logic 				 wr;
      logic [LAP_PAR_CACHE_ADR_BITS-1:0] adr;
   } pawaddr_t;
   

   parameter INST_OPCD_MSB = 3;
   parameter INST_RADR_MSB = 31;
   parameter INST_CADR_MSB = 31;
   parameter INST_PADR_MSB = 15;
   parameter INST_SADR_MSB = 31;
   parameter INST_VSIZ_MSB = 9;
   parameter OPCD_PASS = 5;
      
   // note, below are achitectural sizes, may be smaller in implementation
   typedef struct 		 packed {
      logic [INST_OPCD_MSB:0] 		 opcode;
      logic [INST_RADR_MSB:0] 		 radr;  // row operand starting address, byte offset
      logic [INST_CADR_MSB:0] 		 cadr;  // column operand starting address, byte offset
      logic [INST_PADR_MSB:0] 		 padr;  // partial sum temp storage address
      logic [INST_SADR_MSB:0] 		 sadr;  // store result starting address, for final result storage
      logic [INST_VSIZ_MSB:0] 		 vsize; // max size of vector (n of nxn)
   } sa_inst_t; // instructions for sa unit

   typedef struct 		 packed {
      logic [INST_OPCD_MSB:0] 		 opcode;
      logic [INST_PADR_MSB:0] 		 padr;  // partial sum temp storage address
      logic [INST_SADR_MSB:0] 		 sadr;  // store result starting address, for final result storage
      logic [INST_VSIZ_MSB:0] 		 vsize; // max size of vector (n of nxn)
   } pa_inst_t; // instructions for partial add and beyond

   typedef struct               packed {
      logic [INST_OPCD_MSB:0] 		opcd;
   } opcd_t; // opcode to pass to sa, pa and other units
 		
   
endpackage;

