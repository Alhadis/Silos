Require Import Bool String List Arith.
Require Import Omega.
Require Import micromega.Lia.
Require Import Kami.
Require Import Lib.Indexer.
Require Import Bsvtokami.

Require Import FunctionalExtensionality.

Set Implicit Arguments.


Definition InstFieldsFields := (STRUCT {
    "csr" :: Bit 12;
    "funct3" :: Bit 3;
    "funct7" :: Bit 7;
    "immB" :: Bit 32;
    "immI" :: Bit 32;
    "immJ" :: Bit 32;
    "immS" :: Bit 32;
    "immU" :: Bit 32;
    "opcode" :: Bit 7;
    "rd" :: Bit 5;
    "rs1" :: Bit 5;
    "rs2" :: Bit 5}).
Definition InstFields  := Struct (InstFieldsFields).

(* interface for module wrapper for getInstFields *)
Record Interface'getInstFields := {
    Interface'getInstFields'modules: Modules;
    Interface'getInstFields'getInstFields: string;
}.
Hint Unfold Interface'getInstFields'modules : ModuleDefs.
Hint Unfold Interface'getInstFields'getInstFields : ModuleDefs.

Module module'getInstFields.
    Section Section'getInstFields.
    Variable instancePrefix: string.
    Definition Modules'getInstFields: Modules :=
         (BKMODULE {
        Method instancePrefix--"getInstFields" (inst: (Bit 32)): InstFields := 
    (
                LET inst20 : Bit 1 <- (#inst$[20:20]@32);
                LET inst31 : Bit 1 <- (#inst$[31:31]@32);
                LET inst7 : Bit 1 <- (#inst$[7:7]@32);
                LET inst3120 : Bit 12 <- (#inst$[31:20]@32);
                LET inst3112 : Bit 20 <- (#inst$[31:12]@32);
                LET inst118 : Bit 4 <- (#inst$[11:8]@32);
                LET inst117 : Bit 5 <- (#inst$[11:7]@32);
                LET inst3125 : Bit 7 <- (#inst$[31:25]@32);
                LET inst1912 : Bit 8 <- (#inst$[19:12]@32);
                LET inst3021 : Bit 10 <- (#inst$[30:21]@32);
        LET immI : (Bit 32) <-  UniBit (SignExtendTrunc 12 32) #inst3120;
                LET immSbits : Bit 12 <- (BinBit (Concat (7) 5) #inst3125 #inst117);
        LET immS : (Bit 32) <-  UniBit (SignExtendTrunc 12 32) #immSbits;
                LET immBbits : Bit 14 <- (BinBit (Concat (1 + 1 + 7 + 4) 1) (BinBit (Concat (1 + 1 + 7) 4) (BinBit (Concat (1 + 1) 7) (BinBit (Concat (1) 1) #inst31 #inst7) #inst3125) #inst118) $$(natToWord 1 0));
        LET immB : (Bit 32) <-  UniBit (SignExtendTrunc 14 32) #immBbits;
                LET immUbits : Bit 32 <- (BinBit (Concat (20) 12) #inst3112 $$(natToWord 12 0));
        LET immU : (Bit 32) <-  UniBit (SignExtendTrunc 32 32) #immUbits;
                LET immJbits : Bit 21 <- (BinBit (Concat (1 + 8 + 1 + 10) 1) (BinBit (Concat (1 + 8 + 1) 10) (BinBit (Concat (1 + 8) 1) (BinBit (Concat (1) 8) #inst31 #inst1912) #inst20) #inst3021) $$(natToWord 1 0));
        LET immJ : (Bit 32) <-  UniBit (SignExtendTrunc 21 32) #immJbits;
                LET instFields : InstFields <- STRUCT { "csr" ::= ((#inst$[31:20]@32)); "funct3" ::= ((#inst$[14:12]@32)); "funct7" ::= ((#inst$[31:25]@32)); "immB" ::= (#immB); "immI" ::= (#immI); "immJ" ::= (#immJ); "immS" ::= (#immS); "immU" ::= (#immU); "opcode" ::= ((#inst$[6:0]@32)); "rd" ::= ((#inst$[11:7]@32)); "rs1" ::= ((#inst$[19:15]@32)); "rs2" ::= ((#inst$[24:20]@32))  }%kami_expr;
                Ret #instFields
    )
    }). (* getInstFields *)
    Definition getInstFields := Build_Interface'getInstFields Modules'getInstFields (instancePrefix--"getInstFields").
    End Section'getInstFields.
End module'getInstFields.

Definition function'getInstFields := module'getInstFields.getInstFields.
Hint Unfold function'getInstFields : ModuleDefs.
Hint Unfold module'getInstFields.getInstFields : ModuleDefs.
Hint Unfold module'getInstFields.Modules'getInstFields : ModuleDefs.


Definition opOPIMM : ConstT (Bit 7) := ($$(natToWord 7 19))%kami.

Definition opOP : ConstT (Bit 7) := ($$(natToWord 7 51))%kami.

Definition opLUI : ConstT (Bit 7) := ($$(natToWord 7 55))%kami.

Definition opJAL : ConstT (Bit 7) := ($$(natToWord 7 111))%kami.

Definition opJALR : ConstT (Bit 7) := ($$(natToWord 7 103))%kami.

Definition opBRANCH : ConstT (Bit 7) := ($$(natToWord 7 99))%kami.

Definition opLOAD : ConstT (Bit 7) := ($$(natToWord 7 3))%kami.

Definition opSTORE : ConstT (Bit 7) := ($$(natToWord 7 35))%kami.

Definition opAUIPC : ConstT (Bit 7) := ($$(natToWord 7 23))%kami.

Definition opSYSTEM : ConstT (Bit 7) := ($$(natToWord 7 115))%kami.

Definition fnADD : ConstT (Bit 3) := ($$(natToWord 3 0))%kami.

Definition fnSLL : ConstT (Bit 3) := ($$(natToWord 3 1))%kami.

Definition fnSLT : ConstT (Bit 3) := ($$(natToWord 3 2))%kami.

Definition fnSLTU : ConstT (Bit 3) := ($$(natToWord 3 3))%kami.

Definition fnXOR : ConstT (Bit 3) := ($$(natToWord 3 4))%kami.

Definition fnSR : ConstT (Bit 3) := ($$(natToWord 3 5))%kami.

Definition fnOR : ConstT (Bit 3) := ($$(natToWord 3 6))%kami.

Definition fnAND : ConstT (Bit 3) := ($$(natToWord 3 7))%kami.

Definition fnBEQ : ConstT (Bit 3) := ($$(natToWord 3 0))%kami.

Definition fnBNE : ConstT (Bit 3) := ($$(natToWord 3 1))%kami.

Definition fnBLT : ConstT (Bit 3) := ($$(natToWord 3 4))%kami.

Definition fnBGE : ConstT (Bit 3) := ($$(natToWord 3 5))%kami.

Definition fnBLTU : ConstT (Bit 3) := ($$(natToWord 3 6))%kami.

Definition fnBGEU : ConstT (Bit 3) := ($$(natToWord 3 7))%kami.

Definition fnLW : ConstT (Bit 3) := ($$(natToWord 3 2))%kami.

Definition fnLB : ConstT (Bit 3) := ($$(natToWord 3 0))%kami.

Definition fnLH : ConstT (Bit 3) := ($$(natToWord 3 1))%kami.

Definition fnLBU : ConstT (Bit 3) := ($$(natToWord 3 4))%kami.

Definition fnLHU : ConstT (Bit 3) := ($$(natToWord 3 5))%kami.

Definition fnSW : ConstT (Bit 3) := ($$(natToWord 3 2))%kami.

Definition fnSB : ConstT (Bit 3) := ($$(natToWord 3 0))%kami.

Definition fnSH : ConstT (Bit 3) := ($$(natToWord 3 1))%kami.

Definition fnMUL : ConstT (Bit 3) := ($$(natToWord 3 0))%kami.

Definition fnCSRRW : ConstT (Bit 3) := ($$(natToWord 3 1))%kami.

Definition fnCSRRS : ConstT (Bit 3) := ($$(natToWord 3 2))%kami.

Definition fnCSRRC : ConstT (Bit 3) := ($$(natToWord 3 3))%kami.

Definition fnCSRRWI : ConstT (Bit 3) := ($$(natToWord 3 5))%kami.

Definition fnCSRRSI : ConstT (Bit 3) := ($$(natToWord 3 6))%kami.

Definition fnCSRRCI : ConstT (Bit 3) := ($$(natToWord 3 7))%kami.

Definition instMRET : ConstT (Bit 32) := ($$( (* 32'h30200073 *) WO~0~0~1~1~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~0~0~1~1 ))%kami.

Definition instECALL : ConstT (Bit 32) := ($$(natToWord 32 115))%kami.

Definition instEBREAK : ConstT (Bit 32) := ($$( (* 32'h100073 *) WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~0~0~1~1 ))%kami.

Definition csrCYCLE : ConstT (Bit 12) := ($$( (* 12'hc00 *) WO~1~1~0~0~0~0~0~0~0~0~0~0 ))%kami.

Definition csrINSTRET : ConstT (Bit 12) := ($$( (* 12'hc02 *) WO~1~1~0~0~0~0~0~0~0~0~1~0 ))%kami.

Definition csrMVENDORID : ConstT (Bit 12) := ($$( (* 12'hf11 *) WO~1~1~1~1~0~0~0~1~0~0~0~1 ))%kami.

Definition csrMARCHID : ConstT (Bit 12) := ($$( (* 12'hf12 *) WO~1~1~1~1~0~0~0~1~0~0~1~0 ))%kami.

Definition csrMIMPID : ConstT (Bit 12) := ($$( (* 12'hf13 *) WO~1~1~1~1~0~0~0~1~0~0~1~1 ))%kami.

Definition csrMHARTID : ConstT (Bit 12) := ($$( (* 12'hf13 *) WO~1~1~1~1~0~0~0~1~0~0~1~1 ))%kami.

Definition csrMSTATUS : ConstT (Bit 12) := ($$( (* 12'h300 *) WO~0~0~1~1~0~0~0~0~0~0~0~0 ))%kami.

Definition csrMISA : ConstT (Bit 12) := ($$( (* 12'h301 *) WO~0~0~1~1~0~0~0~0~0~0~0~1 ))%kami.

Definition csrMIE : ConstT (Bit 12) := ($$( (* 12'h304 *) WO~0~0~1~1~0~0~0~0~0~1~0~0 ))%kami.

Definition csrMTVEC : ConstT (Bit 12) := ($$( (* 12'h305 *) WO~0~0~1~1~0~0~0~0~0~1~0~1 ))%kami.

Definition csrMSCRATCH : ConstT (Bit 12) := ($$( (* 12'h340 *) WO~0~0~1~1~0~1~0~0~0~0~0~0 ))%kami.

Definition csrMEPC : ConstT (Bit 12) := ($$( (* 12'h341 *) WO~0~0~1~1~0~1~0~0~0~0~0~1 ))%kami.

Definition csrMCAUSE : ConstT (Bit 12) := ($$( (* 12'h342 *) WO~0~0~1~1~0~1~0~0~0~0~1~0 ))%kami.

Definition csrMTVAL : ConstT (Bit 12) := ($$( (* 12'h343 *) WO~0~0~1~1~0~1~0~0~0~0~1~1 ))%kami.

Definition csrMIP : ConstT (Bit 12) := ($$( (* 12'h344 *) WO~0~0~1~1~0~1~0~0~0~1~0~0 ))%kami.

Definition cause_INST_ADDR_MISALIGNED : ConstT (Bit 4) := ($0)%kami.

Definition cause_INST_ACCESS_FAULT : ConstT (Bit 4) := ($1)%kami.

Definition cause_ILLEGAL_INSTRUCTION : ConstT (Bit 4) := ($2)%kami.

Definition cause_BREAKPOINT : ConstT (Bit 4) := ($3)%kami.

Definition cause_LOAD_ADDRESS_MISALIGNED : ConstT (Bit 4) := ($4)%kami.

Definition cause_LOAD_ACCESS_FAULT : ConstT (Bit 4) := ($5)%kami.

Definition cause_STORE_AMO_ADDRESS_MISALIGNED : ConstT (Bit 4) := ($6)%kami.

Definition cause_STORE_AMO_ACCESS_FAULT : ConstT (Bit 4) := ($7)%kami.

Definition cause_ENVIRONMENT_CALL_FROM_M_MODE : ConstT (Bit 4) := ($11)%kami.

