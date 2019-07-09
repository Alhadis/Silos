Require Import Bool String List Arith.
Require Import Omega.
Require Import micromega.Lia.
Require Import Kami.
Require Import Lib.Indexer.
Require Import Bsvtokami.

Require Import FunctionalExtensionality.

Set Implicit Arguments.


Require Import RVUtil.
Require Import CustomRegFiles.
Definition RegIndexSz := 4.

Definition DataSz := 16.

Definition MemDataSz := 32.

Definition LogDataSz := 4.

Definition LogMemDataSz := 5.

Definition LogMemDataBytes := 2.

(* interface for module wrapper for msb *)
Record Interface'msb := {
    Interface'msb'modules: Modules;
    Interface'msb'msb: string;
}.
Hint Unfold Interface'msb'modules : ModuleDefs.
Hint Unfold Interface'msb'msb : ModuleDefs.

Module module'msb.
    Section Section'msb.
    Variable sz : nat.
    Variable instancePrefix: string.
    Definition Modules'msb: Modules.
        refine (BKMODULE {
        Method instancePrefix--"msb" (v: (Bit sz)): Bit 1 := 
    (
        LET bsz : (Bit 32) <- $sz;
                LET shift : Bit 32 <- (#bsz - $$(natToWord 32 1));
                LET shifted : Bit sz <- (BinBit (Srl sz 32) #v #shift);
        LET one : (Bit sz) <-  UniBit (SignExtendTrunc 1 sz) $$(natToWord 1 1);
                LET msb_v : Bit sz <- (#shifted ~& #one);
                LET b : Bit 1 <- (IF (#msb_v == #one) then $$(natToWord 1 1) else $$(natToWord 1 0));
                Ret #b
    )
    }); abstract omega. Qed. (* msb *)
    Definition msb := Build_Interface'msb Modules'msb (instancePrefix--"msb").
    End Section'msb.
End module'msb.

Definition function'msb := module'msb.msb.
Hint Unfold function'msb : ModuleDefs.
Hint Unfold module'msb.msb : ModuleDefs.


(* interface for module wrapper for packBool *)
Record Interface'packBool := {
    Interface'packBool'modules: Modules;
    Interface'packBool'packBool: string;
}.
Hint Unfold Interface'packBool'modules : ModuleDefs.
Hint Unfold Interface'packBool'packBool : ModuleDefs.

Module module'packBool.
    Section Section'packBool.
    Variable instancePrefix: string.
    Definition Modules'packBool: Modules :=
         (BKMODULE {
        Method instancePrefix--"packBool" (v: Bool): Bit 1 := 
    (
                LET b : Bit 1 <- (IF #v then $$(natToWord 1 1) else $$(natToWord 1 0));
                Ret #b
    )
    }). (* packBool *)
    Definition packBool := Build_Interface'packBool Modules'packBool (instancePrefix--"packBool").
    End Section'packBool.
End module'packBool.

Definition function'packBool := module'packBool.packBool.
Hint Unfold function'packBool : ModuleDefs.
Hint Unfold module'packBool.packBool : ModuleDefs.
Hint Unfold module'packBool.Modules'packBool : ModuleDefs.


(* interface for module wrapper for reverseBits *)
Record Interface'reverseBits := {
    Interface'reverseBits'modules: Modules;
    Interface'reverseBits'reverseBits: string;
}.
Hint Unfold Interface'reverseBits'modules : ModuleDefs.
Hint Unfold Interface'reverseBits'reverseBits : ModuleDefs.

Module module'reverseBits.
    Section Section'reverseBits.
    Variable sz : nat.
    Variable instancePrefix: string.
    Definition Modules'reverseBits: Modules :=
         (BKMODULE {
        Method instancePrefix--"reverseBits" (v: (Bit sz)): Bit sz := 
    (
                LET reversed : Bit sz <- #v;
                Ret #reversed
    )
    }). (* reverseBits *)
    Definition reverseBits := Build_Interface'reverseBits Modules'reverseBits (instancePrefix--"reverseBits").
    End Section'reverseBits.
End module'reverseBits.

Definition function'reverseBits := module'reverseBits.reverseBits.
Hint Unfold function'reverseBits : ModuleDefs.
Hint Unfold module'reverseBits.reverseBits : ModuleDefs.
Hint Unfold module'reverseBits.Modules'reverseBits : ModuleDefs.


(* * interface CSRFile *)
Record CSRFile := {
    CSRFile'modules: Modules;
    CSRFile'isCSRValid : string;
    CSRFile'readCSR : string;
    CSRFile'writeCSR : string;
    CSRFile'interruptPending : string;
    CSRFile'raiseTrap : string;
    CSRFile'returnFromTrap : string;
}.

Hint Unfold CSRFile'modules : ModuleDefs.
Hint Unfold CSRFile'isCSRValid : ModuleDefs.
Hint Unfold CSRFile'readCSR : ModuleDefs.
Hint Unfold CSRFile'writeCSR : ModuleDefs.
Hint Unfold CSRFile'interruptPending : ModuleDefs.
Hint Unfold CSRFile'raiseTrap : ModuleDefs.
Hint Unfold CSRFile'returnFromTrap : ModuleDefs.

Module module'mkCSRFile.
    Section Section'mkCSRFile.
    Variable instancePrefix: string.
    Variable mip_msip: ConstT (Bit 1).
    Variable mip_mtip: ConstT (Bit 1).
    Variable mip_meip: ConstT (Bit 1).
        (* method bindings *)
    Let mstatus_mie := mkReg (Bit 1) (instancePrefix--"mstatus_mie") ($$(natToWord 1 0))%bk.
    Let mstatus_mpie := mkReg (Bit 1) (instancePrefix--"mstatus_mpie") ($$(natToWord 1 0))%bk.
    Let mtvec_base := mkReg (Bit 14) (instancePrefix--"mtvec_base") ($$(natToWord 14 0))%bk.
    Let mie_msie := mkReadOnlyReg (Bit 1) (instancePrefix--"mie_msie") ($$(natToWord 1 0))%bk.
    Let mie_mtie := mkReadOnlyReg (Bit 1) (instancePrefix--"mie_mtie") ($$(natToWord 1 0))%bk.
    Let mie_meie := mkReadOnlyReg (Bit 1) (instancePrefix--"mie_meie") ($$(natToWord 1 0))%bk.
    Let mscratch := mkReg (Bit 16) (instancePrefix--"mscratch") ($$(natToWord 16 0))%bk.
    Let mepc := mkReg (Bit 14) (instancePrefix--"mepc") ($$(natToWord 14 0))%bk.
    Let mcause_interrupt := mkReg (Bit 1) (instancePrefix--"mcause_interrupt") ($$(natToWord 1 0))%bk.
    Let mcause_code := mkReg (Bit 4) (instancePrefix--"mcause_code") ($$(natToWord 4 0))%bk.
    Let mtval := mkReg (Bit 16) (instancePrefix--"mtval") ($$(natToWord 16 0))%bk.
    Let mcause_code_read : string := (Reg'_read mcause_code).
    Let mcause_interrupt_read : string := (Reg'_read mcause_interrupt).
    Let mepc_read : string := (Reg'_read mepc).
    Let mie_meie_read : string := (Reg'_read mie_meie).
    Let mie_msie_read : string := (Reg'_read mie_msie).
    Let mie_mtie_read : string := (Reg'_read mie_mtie).
    Let mscratch_read : string := (Reg'_read mscratch).
    Let mstatus_mie_read : string := (Reg'_read mstatus_mie).
    Let mstatus_mpie_read : string := (Reg'_read mstatus_mpie).
    Let mtval_read : string := (Reg'_read mtval).
    Let mtvec_base_read : string := (Reg'_read mtvec_base).
    Let mstatus_mpie_write : string := (Reg'_write mstatus_mpie).
    Let mstatus_mie_write : string := (Reg'_write mstatus_mie).
    Let mie_meie_write : string := (Reg'_write mie_meie).
    Let mie_mtie_write : string := (Reg'_write mie_mtie).
    Let mie_msie_write : string := (Reg'_write mie_msie).
    Let mtvec_base_write : string := (Reg'_write mtvec_base).
    Let mscratch_write : string := (Reg'_write mscratch).
    Let mepc_write : string := (Reg'_write mepc).
    Let mcause_interrupt_write : string := (Reg'_write mcause_interrupt).
    Let mcause_code_write : string := (Reg'_write mcause_code).
    Let mtval_write : string := (Reg'_write mtval).
    Definition mkCSRFileModule: Modules :=
         (BKMODULE {
        (BKMod (Reg'modules mstatus_mie :: nil))
    with (BKMod (Reg'modules mstatus_mpie :: nil))
    with (BKMod (Reg'modules mtvec_base :: nil))
    with (BKMod (Reg'modules mie_msie :: nil))
    with (BKMod (Reg'modules mie_mtie :: nil))
    with (BKMod (Reg'modules mie_meie :: nil))
    with (BKMod (Reg'modules mscratch :: nil))
    with (BKMod (Reg'modules mepc :: nil))
    with (BKMod (Reg'modules mcause_interrupt :: nil))
    with (BKMod (Reg'modules mcause_code :: nil))
    with (BKMod (Reg'modules mtval :: nil))
    with Method instancePrefix--"isCSRValid" (csr_address : (Bit 12)) : Bool :=
    (
        LET isValid : Bool <- (* case expr *)
    (IF ((#csr_address == $$csrMVENDORID)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMARCHID)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMIMPID)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMHARTID)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMSTATUS)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMISA)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMIE)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMTVEC)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMSCRATCH)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMEPC)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMCAUSE)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMTVAL)) then 
($$true)%kami_expr else 
    (IF ((#csr_address == $$csrMIP)) then 
($$true)%kami_expr else 
(* default 14 *)($$false)%kami_expr
)
)
)
)
)
)
)
)
)
)
)
)
)
;
        Ret #isValid    )

    with Method instancePrefix--"readCSR" (csr_address : (Bit 12)) : Bit DataSz :=
    (
CallM mcause_code_v : Bit 4 (* methoddef regread *) <- mcause_code_read();
CallM mcause_interrupt_v : Bit 1 (* methoddef regread *) <- mcause_interrupt_read();
CallM mepc_v : Bit (DataSz - 2) (* methoddef regread *) <- mepc_read();
CallM mie_meie_v : Bit 1 (* methoddef regread *) <- mie_meie_read();
CallM mie_msie_v : Bit 1 (* methoddef regread *) <- mie_msie_read();
CallM mie_mtie_v : Bit 1 (* methoddef regread *) <- mie_mtie_read();
CallM mscratch_v : Bit DataSz (* methoddef regread *) <- mscratch_read();
CallM mstatus_mie_v : Bit 1 (* methoddef regread *) <- mstatus_mie_read();
CallM mstatus_mpie_v : Bit 1 (* methoddef regread *) <- mstatus_mpie_read();
CallM mtval_v : Bit DataSz (* methoddef regread *) <- mtval_read();
CallM mtvec_base_v : Bit (DataSz - 2) (* methoddef regread *) <- mtvec_base_read();
        LET result : Bit DataSz <- (* case expr *)
    (IF ((#csr_address == $$csrMVENDORID)) then 
$$(natToWord 16 0) else 
    (IF ((#csr_address == $$csrMARCHID)) then 
$$(natToWord 16 0) else 
    (IF ((#csr_address == $$csrMIMPID)) then 
$$(natToWord 16 0) else 
    (IF ((#csr_address == $$csrMHARTID)) then 
$$(natToWord 16 0) else 
    (IF ((#csr_address == $$csrMSTATUS)) then 
(BinBit (Concat (8 + 1 + 3 + 1) 3) (BinBit (Concat (8 + 1 + 3) 1) (BinBit (Concat (8 + 1) 3) (BinBit (Concat (8) 1) $$(natToWord 8 0) #mstatus_mpie_v) $$(natToWord 3 0)) #mstatus_mie_v) $$(natToWord 3 0)) else 
    (IF ((#csr_address == $$csrMISA)) then 
$$(natToWord 16 0) else 
    (IF ((#csr_address == $$csrMIE)) then 
(BinBit (Concat (4 + 1 + 3 + 1 + 3 + 1) 3) (BinBit (Concat (4 + 1 + 3 + 1 + 3) 1) (BinBit (Concat (4 + 1 + 3 + 1) 3) (BinBit (Concat (4 + 1 + 3) 1) (BinBit (Concat (4 + 1) 3) (BinBit (Concat (4) 1) $$(natToWord 4 0) #mie_meie_v) $$(natToWord 3 0)) #mie_mtie_v) $$(natToWord 3 0)) #mie_msie_v) $$(natToWord 3 0)) else 
    (IF ((#csr_address == $$csrMTVEC)) then 
(BinBit (Concat ((16 - 2)) 2) #mtvec_base_v $$(natToWord 2 0)) else 
    (IF ((#csr_address == $$csrMSCRATCH)) then 
#mscratch_v else 
    (IF ((#csr_address == $$csrMEPC)) then 
(BinBit (Concat ((16 - 2)) 2) #mepc_v $$(natToWord 2 0)) else 
    (IF ((#csr_address == $$csrMCAUSE)) then 
(BinBit (Concat (1 + 11) 4) (BinBit (Concat (1) 11) #mcause_interrupt_v $$(natToWord 11 0)) #mcause_code_v) else 
    (IF ((#csr_address == $$csrMTVAL)) then 
#mtval_v else 
    (IF ((#csr_address == $$csrMIP)) then 
(BinBit (Concat (4 + 1 + 3 + 1 + 3 + 1) 3) (BinBit (Concat (4 + 1 + 3 + 1 + 3) 1) (BinBit (Concat (4 + 1 + 3 + 1) 3) (BinBit (Concat (4 + 1 + 3) 1) (BinBit (Concat (4 + 1) 3) (BinBit (Concat (4) 1) $$(natToWord 4 0) $$mip_meip) $$(natToWord 3 0)) $$mip_mtip) $$(natToWord 3 0)) $$mip_msip) $$(natToWord 3 0)) else 
(* default 14 *)$$(natToWord 16 0)
)
)
)
)
)
)
)
)
)
)
)
)
)
;
        Ret #result    )

    with Method instancePrefix--"writeCSR" (csr_address : (Bit 12)) (csr_data : (Bit DataSz)) : Void :=
    (
    If (($$csrMSTATUS == #csr_address)) then (

        LET mpie_value : Bit 1 <- (#csr_data$[7:7]@16);
                LET mie_value : Bit 1 <- (#csr_data$[3:3]@16);
                CallM mstatus_mpie_write ( #mpie_value : Bit 1 );
                CallM mstatus_mie_write ( #mie_value : Bit 1 );
        Retv

   ) else (
    If (($$csrMIE == #csr_address)) then (

        LET meie_value : Bit 1 <- (#csr_data$[11:11]@16);
                LET mtie_value : Bit 1 <- (#csr_data$[7:7]@16);
                LET msie_value : Bit 1 <- (#csr_data$[3:3]@16);
                CallM mie_meie_write ( #meie_value : Bit 1 );
                CallM mie_mtie_write ( #mtie_value : Bit 1 );
                CallM mie_msie_write ( #msie_value : Bit 1 );
        Retv

   ) else (
    If (($$csrMTVEC == #csr_address)) then (

        LET mtvec_value : Bit (DataSz - 2) <- (#csr_data$[15:2]@16);
                CallM mtvec_base_write ( #mtvec_value : Bit (DataSz - 2) );
        Retv

   ) else (
    If (($$csrMSCRATCH == #csr_address)) then (

        CallM mscratch_write ( #csr_data : Bit DataSz );
        Retv

   ) else (
    If (($$csrMEPC == #csr_address)) then (

        LET mepc_value : Bit (DataSz - 2) <- (#csr_data$[15:2]@16);
                CallM mepc_write ( #mepc_value : Bit (DataSz - 2) );
        Retv

   ) else (
    If (($$csrMCAUSE == #csr_address)) then (

        LET mcause_interrupt_value : Bit 1 <- (#csr_data$[15:15]@16);
                LET mcause_code_value : Bit 4 <- (#csr_data$[3:0]@16);
                CallM mcause_interrupt_write ( #mcause_interrupt_value : Bit 1 );
                CallM mcause_code_write ( #mcause_code_value : Bit 4 );
        Retv

   ) else (
    If (($$csrMTVAL == #csr_address)) then (

        CallM mtval_write ( #csr_data : Bit DataSz );
        Retv

   ) else (

        Retv
) as retval; Ret #retval
) as retval; Ret #retval
) as retval; Ret #retval
) as retval; Ret #retval
) as retval; Ret #retval
) as retval; Ret #retval
) as retval;
        Ret #retval    )

    with Method instancePrefix--"interruptPending" () : Maybe (Bit 4) :=
    (
CallM mie_meie_v : Bit 1 (* methoddef regread *) <- mie_meie_read();
CallM mie_msie_v : Bit 1 (* methoddef regread *) <- mie_msie_read();
CallM mie_mtie_v : Bit 1 (* methoddef regread *) <- mie_mtie_read();
CallM mstatus_mie_v : Bit 1 (* methoddef regread *) <- mstatus_mie_read();
        If (#mstatus_mie_v == $1) then (
        
        If (($$mip_meip ~& #mie_meie_v) == $1) then (
        
        Ret (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $11 }%kami_expr
        ) else (
                If (($$mip_mtip ~& #mie_mtie_v) == $1) then (
        
        Ret (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $7 }%kami_expr
        ) else (
                If (($$mip_msip ~& #mie_msie_v) == $1) then (
        
        Ret (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $3 }%kami_expr
        ) else (
        
        Ret (* tagged union Invalid *) STRUCT {  "$tag" ::= $1; "Invalid" ::= $0; "Valid" ::= $0 }%kami_expr) as retval
;
                Ret #retval) as retval
;
                Ret #retval) as retval
;
        Ret #retval
        ) else (
        
        Ret (* tagged union Invalid *) STRUCT {  "$tag" ::= $1; "Invalid" ::= $0; "Valid" ::= $0 }%kami_expr) as retval
;
        Ret #retval    )

    with Method instancePrefix--"raiseTrap" (interrupt : Bool) (cause : (Bit 4)) (pc : (Bit DataSz)) (addr : (Bit DataSz)) : (Bit DataSz) :=
    (
CallM mstatus_mie_v : Bit 1 (* methoddef regread *) <- mstatus_mie_read();
CallM mtvec_base_v : Bit (DataSz - 2) (* methoddef regread *) <- mtvec_base_read();
        LET mepc_value : Bit (DataSz - 2) <- (#pc$[15:2]@16);
        CallM mepc_write ( #mepc_value : Bit (DataSz - 2) );
        LET mcause_interrupt_value : Bit 1 <- (IF #interrupt then $$(natToWord 1 0) else $$(natToWord 1 0));
        CallM mcause_interrupt_write ( #mcause_interrupt_value : Bit 1 );
        If #interrupt then (
        
        CallM mtval_write ( $$(natToWord 16 0) : Bit 16 );
        Retv
        ) else (
        
        LET new_mtval : Bit DataSz <- (* case expr *)
    (IF ((#cause == $$cause_INST_ADDR_MISALIGNED)) then 
#addr else 
    (IF ((#cause == $$cause_INST_ACCESS_FAULT)) then 
#pc else 
    (IF ((#cause == $$cause_ILLEGAL_INSTRUCTION)) then 
#pc else 
    (IF ((#cause == $$cause_BREAKPOINT)) then 
$0 else 
    (IF ((#cause == $$cause_LOAD_ADDRESS_MISALIGNED)) then 
#addr else 
    (IF ((#cause == $$cause_LOAD_ACCESS_FAULT)) then 
#addr else 
    (IF ((#cause == $$cause_STORE_AMO_ADDRESS_MISALIGNED)) then 
#addr else 
    (IF ((#cause == $$cause_STORE_AMO_ACCESS_FAULT)) then 
#addr else 
    (IF ((#cause == $$cause_ENVIRONMENT_CALL_FROM_M_MODE)) then 
$0 else 
(* default 10 *)$0
)
)
)
)
)
)
)
)
)
;
                CallM mtval_write ( #new_mtval : Bit DataSz );
        Retv) as retval
;
        CallM mstatus_mpie_write ( #mstatus_mie_v : Bit 1 );
        CallM mstatus_mie_write ( $$(natToWord 1 0) : Bit 1 );
        LET result : Bit DataSz <- (BinBit (Concat ((16 - 2)) 2) #mtvec_base_v $$(natToWord 2 0));
        Ret #result    )

    with Method instancePrefix--"returnFromTrap" () : (Bit DataSz) :=
    (
CallM mepc_v : Bit (DataSz - 2) (* methoddef regread *) <- mepc_read();
CallM mstatus_mpie_v : Bit 1 (* methoddef regread *) <- mstatus_mpie_read();
        CallM mstatus_mie_write ( #mstatus_mpie_v : Bit 1 );
        CallM mstatus_mpie_write ( $$(natToWord 1 1) : Bit 1 );
        LET result : Bit DataSz <- (BinBit (Concat ((16 - 2)) 2) #mepc_v $$(natToWord 2 0));
        Ret #result    )

    }). (* mkCSRFile *)

(* Module mkCSRFile type Bit#(1) -> Bit#(1) -> Bit#(1) -> Module#(CSRFile) return type Bit#(1) *)
    Definition mkCSRFile := Build_CSRFile mkCSRFileModule%kami (instancePrefix--"interruptPending") (instancePrefix--"isCSRValid") (instancePrefix--"raiseTrap") (instancePrefix--"readCSR") (instancePrefix--"returnFromTrap") (instancePrefix--"writeCSR").
    End Section'mkCSRFile.
End module'mkCSRFile.

Definition mkCSRFile := module'mkCSRFile.mkCSRFile.
Hint Unfold mkCSRFile : ModuleDefs.
Hint Unfold module'mkCSRFile.mkCSRFile : ModuleDefs.
Hint Unfold module'mkCSRFile.mkCSRFileModule : ModuleDefs.

Definition DecodedInstFields := (STRUCT {
    "ebreak" :: Bool;
    "ecall" :: Bool;
    "getsMemResp" :: Bool;
    "imm" :: Bit 32;
    "mret" :: Bool;
    "sendsMemReq" :: Bool;
    "unsupported" :: Bool;
    "usesRd" :: Bool;
    "usesRs1" :: Bool;
    "usesRs2" :: Bool;
    "usesShift" :: Bool;
    "writesCsr" :: Bool}).
Definition DecodedInst  := Struct (DecodedInstFields).

(* interface for module wrapper for decode *)
Record Interface'decode := {
    Interface'decode'modules: Modules;
    Interface'decode'decode: string;
}.
Hint Unfold Interface'decode'modules : ModuleDefs.
Hint Unfold Interface'decode'decode : ModuleDefs.

Module module'decode.
    Section Section'decode.
    Variable instancePrefix: string.
       Definition instance'getInstFields := function'getInstFields (instancePrefix--"getInstFields").

       Definition getInstFields := Interface'getInstFields'getInstFields instance'getInstFields.

    Definition Modules'decode: Modules :=
         (BKMODULE {
        Method instancePrefix--"decode" (inst: (Bit 32)): DecodedInst := 
    (
        CallM instFields : InstFields (* varbinding *) <-  getInstFields (#inst : Bit 32);
                LET opcode : Bit 7 <- (#instFields ! InstFieldsFields @. "opcode");
                LET funct3 : Bit 3 <- (#instFields ! InstFieldsFields @. "funct3");
                LET funct7 : Bit 7 <- (#instFields ! InstFieldsFields @. "funct7");
                LET rs1 : Bit 5 <- (#instFields ! InstFieldsFields @. "rs1");
                LET rs2 : Bit 5 <- (#instFields ! InstFieldsFields @. "rs2");
                LET rd : Bit 5 <- (#instFields ! InstFieldsFields @. "rd");
                LET csr : Bit 12 <- (#instFields ! InstFieldsFields @. "csr");
                LET writesCsr : Bool <- ((#opcode == $$opSYSTEM) && (* case expr *)
    (IF ((#funct3 == $$fnCSRRW) || (#funct3 == $$fnCSRRWI) || (#funct3 == $$fnCSRRS) || (#funct3 == $$fnCSRRSI) || (#funct3 == $$fnCSRRC) || (#funct3 == $$fnCSRRCI)) then 
($$true)%kami_expr else 
(* default 2 *)($$false)%kami_expr
)
);
                LET mret : Bool <- (#inst == $$instMRET);
                LET ecall : Bool <- (#inst == $$instECALL);
                LET ebreak : Bool <- (#inst == $$instEBREAK);
                LET imm : Bit 32 <- (* case expr *)
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC)) then 
(#instFields ! InstFieldsFields @. "immU") else 
    (IF ((#opcode == $$opJAL)) then 
(#instFields ! InstFieldsFields @. "immJ") else 
    (IF ((#opcode == $$opJALR) || (#opcode == $$opLOAD) || (#opcode == $$opOPIMM)) then 
(#instFields ! InstFieldsFields @. "immI") else 
    (IF ((#opcode == $$opBRANCH)) then 
(#instFields ! InstFieldsFields @. "immB") else 
    (IF ((#opcode == $$opSTORE)) then 
(#instFields ! InstFieldsFields @. "immS") else 
(* default 6 *)$$(natToWord 32 0)
)
)
)
)
)
;
                LET usesRd : Bool <- (* case expr *)
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opLOAD) || (#opcode == $$opOPIMM) || (#opcode == $$opOP)) then 
($$true)%kami_expr else 
    (IF ((#opcode == $$opBRANCH) || (#opcode == $$opSTORE)) then 
($$false)%kami_expr else 
    (IF ((#opcode == $$opSYSTEM)) then 
#writesCsr else 
(* default 4 *)($$false)%kami_expr
)
)
)
;
                LET usesRs1 : Bool <- (* case expr *)
    (IF ((#opcode == $$opJALR) || (#opcode == $$opBRANCH) || (#opcode == $$opLOAD) || (#opcode == $$opSTORE) || (#opcode == $$opOPIMM) || (#opcode == $$opOP)) then 
($$true)%kami_expr else 
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC) || (#opcode == $$opJAL)) then 
($$false)%kami_expr else 
    (IF ((#opcode == $$opSYSTEM)) then 
(* case expr *)
    (IF ((#funct3 == $$fnCSRRW) || (#funct3 == $$fnCSRRS) || (#funct3 == $$fnCSRRC)) then 
($$true)%kami_expr else 
(* default 2 *)($$false)%kami_expr
)
 else 
(* default 4 *)($$false)%kami_expr
)
)
)
;
                LET usesRs2 : Bool <- (* case expr *)
    (IF ((#opcode == $$opBRANCH) || (#opcode == $$opSTORE) || (#opcode == $$opOP)) then 
($$true)%kami_expr else 
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opLOAD) || (#opcode == $$opOPIMM) || (#opcode == $$opSYSTEM)) then 
($$false)%kami_expr else 
(* default 3 *)($$false)%kami_expr
)
)
;
                LET usesShift : Bool <- (* case expr *)
    (IF ((#opcode == $$opOP) || (#opcode == $$opOPIMM)) then 
(* case expr *)
    (IF ((#funct3 == $$fnSLL) || (#funct3 == $$fnSR)) then 
($$true)%kami_expr else 
    (IF ((#funct3 == $$fnADD) || (#funct3 == $$fnSLT) || (#funct3 == $$fnSLTU) || (#funct3 == $$fnXOR) || (#funct3 == $$fnOR) || (#funct3 == $$fnAND)) then 
($$false)%kami_expr else 
(* default 3 *)($$false)%kami_expr
)
)
 else 
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opBRANCH) || (#opcode == $$opLOAD) || (#opcode == $$opSTORE) || (#opcode == $$opSYSTEM)) then 
($$false)%kami_expr else 
(* default 3 *)($$false)%kami_expr
)
)
;
                LET sendsMemReq : Bool <- (* case expr *)
    (IF ((#opcode == $$opLOAD) || (#opcode == $$opSTORE)) then 
($$true)%kami_expr else 
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opBRANCH) || (#opcode == $$opOPIMM) || (#opcode == $$opOP) || (#opcode == $$opSYSTEM)) then 
($$false)%kami_expr else 
(* default 3 *)($$false)%kami_expr
)
)
;
                LET getsMemResp : Bool <- (* case expr *)
    (IF ((#opcode == $$opLOAD)) then 
($$true)%kami_expr else 
    (IF ((#opcode == $$opLUI) || (#opcode == $$opAUIPC) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opBRANCH) || (#opcode == $$opSTORE) || (#opcode == $$opOPIMM) || (#opcode == $$opOP) || (#opcode == $$opSYSTEM)) then 
($$false)%kami_expr else 
(* default 3 *)($$false)%kami_expr
)
)
;
                LET funct7_is_0_or_32 : Bool <- (((#funct7$[6:6]@7) == $0) && ((#funct7$[4:0]@7) == $0));
                LET funct7_is_0 : Bool <- (#funct7_is_0_or_32 && ((#funct7$[5:5]@7) == $0));
        LET regIndexSz : (Bit RegIndexSz) <- $4;
                LET illegal_register_index : Bool <- ((((IF #usesRs1 then (BinBit (Srl 5 4) #rs1 #regIndexSz) else $0) ~| (IF #usesRs2 then (BinBit (Srl 5 4) #rs2 #regIndexSz) else $0)) ~| (IF #usesRd then (BinBit (Srl 5 4) #rd #regIndexSz) else $0)) != $0);
        LET dataSz : (Bit 8) <- $16;
                LET illegal_shift_constant : Bool <- (IF (#dataSz == $16) then ((#inst$[24:24]@32) == $1) else ($$false)%kami_expr);
                LET unsupported_opcode_func : Bool <- (* case expr *)
    (IF ((#opcode == $$opLUI)) then 
($$false)%kami_expr else 
    (IF ((#opcode == $$opAUIPC)) then 
($$false)%kami_expr else 
    (IF ((#opcode == $$opJAL)) then 
($$false)%kami_expr else 
    (IF ((#opcode == $$opJALR)) then 
(#funct3 != $0) else 
    (IF ((#opcode == $$opBRANCH)) then 
(* case expr *)
    (IF ((#funct3 == $$fnBEQ) || (#funct3 == $$fnBNE) || (#funct3 == $$fnBLT) || (#funct3 == $$fnBGE) || (#funct3 == $$fnBLTU) || (#funct3 == $$fnBGEU)) then 
($$false)%kami_expr else 
(* default 2 *)($$true)%kami_expr
)
 else 
    (IF ((#opcode == $$opLOAD)) then 
(* case expr *)
    (IF ((#funct3 == $$fnLB) || (#funct3 == $$fnLH) || (#funct3 == $$fnLW) || (#funct3 == $$fnLBU) || (#funct3 == $$fnLHU)) then 
($$false)%kami_expr else 
(* default 2 *)($$true)%kami_expr
)
 else 
    (IF ((#opcode == $$opSTORE)) then 
(* case expr *)
    (IF ((#funct3 == $$fnSB) || (#funct3 == $$fnSH) || (#funct3 == $$fnSW)) then 
($$false)%kami_expr else 
(* default 2 *)($$true)%kami_expr
)
 else 
    (IF ((#opcode == $$opOPIMM)) then 
(* case expr *)
    (IF ((#funct3 == $$fnADD) || (#funct3 == $$fnSLT) || (#funct3 == $$fnSLTU) || (#funct3 == $$fnXOR) || (#funct3 == $$fnOR) || (#funct3 == $$fnAND)) then 
($$false)%kami_expr else 
    (IF ((#funct3 == $$fnSLL)) then 
((!#funct7_is_0) || #illegal_shift_constant) else 
    (IF ((#funct3 == $$fnSR)) then 
((!#funct7_is_0_or_32) || #illegal_shift_constant) else 
(* default 4 *)($$true)%kami_expr
)
)
)
 else 
    (IF ((#opcode == $$opOP)) then 
(* case expr *)
    (IF ((#funct3 == $$fnADD) || (#funct3 == $$fnSR)) then 
(!#funct7_is_0_or_32) else 
    (IF ((#funct3 == $$fnSLL) || (#funct3 == $$fnSLT) || (#funct3 == $$fnSLTU) || (#funct3 == $$fnXOR) || (#funct3 == $$fnOR) || (#funct3 == $$fnAND)) then 
(!#funct7_is_0) else 
(* default 3 *)($$false)%kami_expr
)
)
 else 
    (IF ((#opcode == $$opSYSTEM)) then 
((((!#writesCsr) && (!#mret)) && (!#ecall)) && (!#ebreak)) else 
(* default 11 *)($$true)%kami_expr
)
)
)
)
)
)
)
)
)
)
;
                LET unsupported : Bool <- (#illegal_register_index || #unsupported_opcode_func);
                LET decodedInst : DecodedInst <- STRUCT { "ebreak" ::= (#ebreak); "ecall" ::= (#ecall); "getsMemResp" ::= (#getsMemResp); "imm" ::= (#imm); "mret" ::= (#mret); "sendsMemReq" ::= (#sendsMemReq); "unsupported" ::= (#unsupported); "usesRd" ::= (#usesRd); "usesRs1" ::= (#usesRs1); "usesRs2" ::= (#usesRs2); "usesShift" ::= (#usesShift); "writesCsr" ::= (#writesCsr)  }%kami_expr;
                Ret #decodedInst
    )
    }). (* decode *)
    Definition decode := Build_Interface'decode Modules'decode (instancePrefix--"decode").
    End Section'decode.
End module'decode.

Definition function'decode := module'decode.decode.
Hint Unfold function'decode : ModuleDefs.
Hint Unfold module'decode.decode : ModuleDefs.
Hint Unfold module'decode.Modules'decode : ModuleDefs.


Definition ExecutedInstFields := (STRUCT {
    "csr_write_data" :: Bit DataSz;
    "mem_addr" :: Bit DataSz;
    "mem_write_data" :: Bit MemDataSz;
    "mem_write_en" :: Bit (MemDataSz / 8);
    "next_pc" :: Bit DataSz;
    "rd" :: Bit RegIndexSz;
    "reg_write_data" :: Bit DataSz}).
Definition ExecutedInst  := Struct (ExecutedInstFields).

(* interface for module wrapper for addN *)
Record Interface'addN := {
    Interface'addN'modules: Modules;
    Interface'addN'addN: string;
}.
Hint Unfold Interface'addN'modules : ModuleDefs.
Hint Unfold Interface'addN'addN : ModuleDefs.

Module module'addN.
    Section Section'addN.
    Variable instancePrefix: string.
    Definition Modules'addN: Modules :=
         (BKMODULE {
        Method instancePrefix--"addN" (a: (Bit DataSz)) (b: (Bit DataSz)) (c: (Bit 1)): Bit (DataSz + 1) := 
    (
        LET ax : (Bit (DataSz + 1)) <-  UniBit (SignExtendTrunc 16 (16 + 1)) #a;
        LET bx : (Bit (DataSz + 1)) <-  UniBit (SignExtendTrunc 16 (16 + 1)) #b;
        LET cx : (Bit (DataSz + 1)) <-  UniBit (SignExtendTrunc 1 (16 + 1)) #c;
                Ret ((#ax + #bx) + #cx)
    )
    }). (* addN *)
    Definition addN := Build_Interface'addN Modules'addN (instancePrefix--"addN").
    End Section'addN.
End module'addN.

Definition function'addN := module'addN.addN.
Hint Unfold function'addN : ModuleDefs.
Hint Unfold module'addN.addN : ModuleDefs.
Hint Unfold module'addN.Modules'addN : ModuleDefs.


(* interface for module wrapper for addNTest *)
Record Interface'addNTest := {
    Interface'addNTest'modules: Modules;
    Interface'addNTest'addNTest: string;
}.
Hint Unfold Interface'addNTest'modules : ModuleDefs.
Hint Unfold Interface'addNTest'addNTest : ModuleDefs.

Module module'addNTest.
    Section Section'addNTest.
    Variable instancePrefix: string.
       Definition instance'addN := function'addN (instancePrefix--"addN").

       Definition addN := Interface'addN'addN instance'addN.

    Definition Modules'addNTest: Modules :=
         (BKMODULE {
        Method instancePrefix--"addNTest" (add_op_a: (Bit DataSz)) (add_carry_in: (Bit 1)): Bit (DataSz + 1) := 
    (
        CallM add_output_with_carryout : Bit (DataSz + 1) (* varbinding *) <-  addN (#add_op_a : Bit DataSz) (#add_op_a : Bit DataSz) (#add_carry_in : Bit 1);
                Ret #add_output_with_carryout
    )
    }). (* addNTest *)
    Definition addNTest := Build_Interface'addNTest Modules'addNTest (instancePrefix--"addNTest").
    End Section'addNTest.
End module'addNTest.

Definition function'addNTest := module'addNTest.addNTest.
Hint Unfold function'addNTest : ModuleDefs.
Hint Unfold module'addNTest.addNTest : ModuleDefs.
Hint Unfold module'addNTest.Modules'addNTest : ModuleDefs.


(* interface for module wrapper for lognTest *)
Record Interface'lognTest := {
    Interface'lognTest'modules: Modules;
    Interface'lognTest'lognTest: string;
}.
Hint Unfold Interface'lognTest'modules : ModuleDefs.
Hint Unfold Interface'lognTest'lognTest : ModuleDefs.

Module module'lognTest.
    Section Section'lognTest.
    Variable instancePrefix: string.
    Definition Modules'lognTest: Modules :=
         (BKMODULE {
        Method instancePrefix--"lognTest" (v: (Bit (Nat.log2 DataSz))): Bit DataSz := 
    (
        LET vx : (Bit DataSz) <-  UniBit (SignExtendTrunc (Nat.log2 16) 16) #v;
                Ret #vx
    )
    }). (* lognTest *)
    Definition lognTest := Build_Interface'lognTest Modules'lognTest (instancePrefix--"lognTest").
    End Section'lognTest.
End module'lognTest.

Definition function'lognTest := module'lognTest.lognTest.
Hint Unfold function'lognTest : ModuleDefs.
Hint Unfold module'lognTest.lognTest : ModuleDefs.
Hint Unfold module'lognTest.Modules'lognTest : ModuleDefs.


(* interface for module wrapper for xorN *)
Record Interface'xorN := {
    Interface'xorN'modules: Modules;
    Interface'xorN'xorN: string;
}.
Hint Unfold Interface'xorN'modules : ModuleDefs.
Hint Unfold Interface'xorN'xorN : ModuleDefs.

Module module'xorN.
    Section Section'xorN.
    Variable instancePrefix: string.
    Definition Modules'xorN: Modules :=
         (BKMODULE {
        Method instancePrefix--"xorN" (a: (Bit DataSz)) (b: (Bit DataSz)): Bit DataSz := 
    (
                Ret (#a ~+ #b)
    )
    }). (* xorN *)
    Definition xorN := Build_Interface'xorN Modules'xorN (instancePrefix--"xorN").
    End Section'xorN.
End module'xorN.

Definition function'xorN := module'xorN.xorN.
Hint Unfold function'xorN : ModuleDefs.
Hint Unfold module'xorN.xorN : ModuleDefs.
Hint Unfold module'xorN.Modules'xorN : ModuleDefs.


(* interface for module wrapper for orN *)
Record Interface'orN := {
    Interface'orN'modules: Modules;
    Interface'orN'orN: string;
}.
Hint Unfold Interface'orN'modules : ModuleDefs.
Hint Unfold Interface'orN'orN : ModuleDefs.

Module module'orN.
    Section Section'orN.
    Variable instancePrefix: string.
    Definition Modules'orN: Modules :=
         (BKMODULE {
        Method instancePrefix--"orN" (a: (Bit DataSz)) (b: (Bit DataSz)): Bit DataSz := 
    (
                Ret (#a ~| #b)
    )
    }). (* orN *)
    Definition orN := Build_Interface'orN Modules'orN (instancePrefix--"orN").
    End Section'orN.
End module'orN.

Definition function'orN := module'orN.orN.
Hint Unfold function'orN : ModuleDefs.
Hint Unfold module'orN.orN : ModuleDefs.
Hint Unfold module'orN.Modules'orN : ModuleDefs.


(* interface for module wrapper for andN *)
Record Interface'andN := {
    Interface'andN'modules: Modules;
    Interface'andN'andN: string;
}.
Hint Unfold Interface'andN'modules : ModuleDefs.
Hint Unfold Interface'andN'andN : ModuleDefs.

Module module'andN.
    Section Section'andN.
    Variable instancePrefix: string.
    Definition Modules'andN: Modules :=
         (BKMODULE {
        Method instancePrefix--"andN" (a: (Bit DataSz)) (b: (Bit DataSz)): Bit DataSz := 
    (
                Ret (#a ~& #b)
    )
    }). (* andN *)
    Definition andN := Build_Interface'andN Modules'andN (instancePrefix--"andN").
    End Section'andN.
End module'andN.

Definition function'andN := module'andN.andN.
Hint Unfold function'andN : ModuleDefs.
Hint Unfold module'andN.andN : ModuleDefs.
Hint Unfold module'andN.Modules'andN : ModuleDefs.


(* interface for module wrapper for ltuN *)
Record Interface'ltuN := {
    Interface'ltuN'modules: Modules;
    Interface'ltuN'ltuN: string;
}.
Hint Unfold Interface'ltuN'modules : ModuleDefs.
Hint Unfold Interface'ltuN'ltuN : ModuleDefs.

Module module'ltuN.
    Section Section'ltuN.
    Variable instancePrefix: string.
    Definition Modules'ltuN: Modules :=
         (BKMODULE {
        Method instancePrefix--"ltuN" (a: (Bit DataSz)) (b: (Bit DataSz)): Bool := 
    (
                Ret (#a < #b)
    )
    }). (* ltuN *)
    Definition ltuN := Build_Interface'ltuN Modules'ltuN (instancePrefix--"ltuN").
    End Section'ltuN.
End module'ltuN.

Definition function'ltuN := module'ltuN.ltuN.
Hint Unfold function'ltuN : ModuleDefs.
Hint Unfold module'ltuN.ltuN : ModuleDefs.
Hint Unfold module'ltuN.Modules'ltuN : ModuleDefs.


(* interface for module wrapper for eqN *)
Record Interface'eqN := {
    Interface'eqN'modules: Modules;
    Interface'eqN'eqN: string;
}.
Hint Unfold Interface'eqN'modules : ModuleDefs.
Hint Unfold Interface'eqN'eqN : ModuleDefs.

Module module'eqN.
    Section Section'eqN.
    Variable instancePrefix: string.
    Definition Modules'eqN: Modules :=
         (BKMODULE {
        Method instancePrefix--"eqN" (a: (Bit DataSz)) (b: (Bit DataSz)): Bool := 
    (
                Ret (#a == #b)
    )
    }). (* eqN *)
    Definition eqN := Build_Interface'eqN Modules'eqN (instancePrefix--"eqN").
    End Section'eqN.
End module'eqN.

Definition function'eqN := module'eqN.eqN.
Hint Unfold function'eqN : ModuleDefs.
Hint Unfold module'eqN.eqN : ModuleDefs.
Hint Unfold module'eqN.Modules'eqN : ModuleDefs.


(* interface for module wrapper for rightShiftN *)
Record Interface'rightShiftN := {
    Interface'rightShiftN'modules: Modules;
    Interface'rightShiftN'rightShiftN: string;
}.
Hint Unfold Interface'rightShiftN'modules : ModuleDefs.
Hint Unfold Interface'rightShiftN'rightShiftN : ModuleDefs.

Module module'rightShiftN.
    Section Section'rightShiftN.
    Variable instancePrefix: string.
    Definition Modules'rightShiftN: Modules :=
         (BKMODULE {
        Method instancePrefix--"rightShiftN" (x: (Bit DataSz)) (shamt: (Bit LogDataSz)) (is_signed: Bool): Bit DataSz := 
    (
        LET result : (Bit DataSz) <- (BinBit (Sra 16 4) #x #shamt);
                Ret #result
    )
    }). (* rightShiftN *)
    Definition rightShiftN := Build_Interface'rightShiftN Modules'rightShiftN (instancePrefix--"rightShiftN").
    End Section'rightShiftN.
End module'rightShiftN.

Definition function'rightShiftN := module'rightShiftN.rightShiftN.
Hint Unfold function'rightShiftN : ModuleDefs.
Hint Unfold module'rightShiftN.rightShiftN : ModuleDefs.
Hint Unfold module'rightShiftN.Modules'rightShiftN : ModuleDefs.


(* interface for module wrapper for execute *)
Record Interface'execute := {
    Interface'execute'modules: Modules;
    Interface'execute'execute: string;
}.
Hint Unfold Interface'execute'modules : ModuleDefs.
Hint Unfold Interface'execute'execute : ModuleDefs.

Module module'execute.
    Section Section'execute.
    Variable instancePrefix: string.
       Definition instance'getInstFields := function'getInstFields (instancePrefix--"getInstFields").

       Definition getInstFields := Interface'getInstFields'getInstFields instance'getInstFields.

       Definition instance'addN := function'addN (instancePrefix--"addN").

       Definition addN := Interface'addN'addN instance'addN.

       Definition instance'msb_TAdd_DataSz_1_ := function'msb (DataSz + 1) (instancePrefix--"msb_TAdd_DataSz_1_").

       Definition msb_TAdd_DataSz_1_ := Interface'msb'msb instance'msb_TAdd_DataSz_1_.

       Definition instance'reverseBits_DataSz := function'reverseBits DataSz (instancePrefix--"reverseBits_DataSz").

       Definition reverseBits_DataSz := Interface'reverseBits'reverseBits instance'reverseBits_DataSz.

       Definition instance'rightShiftN := function'rightShiftN (instancePrefix--"rightShiftN").

       Definition rightShiftN := Interface'rightShiftN'rightShiftN instance'rightShiftN.

       Definition instance'ltuN := function'ltuN (instancePrefix--"ltuN").

       Definition ltuN := Interface'ltuN'ltuN instance'ltuN.

       Definition instance'msb_DataSz := function'msb DataSz (instancePrefix--"msb_DataSz").

       Definition msb_DataSz := Interface'msb'msb instance'msb_DataSz.

       Definition instance'xorN := function'xorN (instancePrefix--"xorN").

       Definition xorN := Interface'xorN'xorN instance'xorN.

       Definition instance'orN := function'orN (instancePrefix--"orN").

       Definition orN := Interface'orN'orN instance'orN.

       Definition instance'andN := function'andN (instancePrefix--"andN").

       Definition andN := Interface'andN'andN instance'andN.

       Definition instance'packBool := function'packBool (instancePrefix--"packBool").

       Definition packBool := Interface'packBool'packBool instance'packBool.

       Definition instance'eqN := function'eqN (instancePrefix--"eqN").

       Definition eqN := Interface'eqN'eqN instance'eqN.

    Definition Modules'execute: Modules :=
         (BKMODULE {
        Method instancePrefix--"execute" (inst: (Bit 32)) (dInst: DecodedInst) (rVal1: (Bit DataSz)) (rVal2: (Bit DataSz)) (csr_read_data: (Bit DataSz)) (pc: (Bit DataSz)): ExecutedInst := 
    (
        CallM instFields : InstFields (* varbinding *) <-  getInstFields (#inst : Bit 32);
                LET opcode : Bit 7 <- (#instFields ! InstFieldsFields @. "opcode");
                LET funct3 : Bit 3 <- (#instFields ! InstFieldsFields @. "funct3");
                LET funct7 : Bit 7 <- (#instFields ! InstFieldsFields @. "funct7");
                LET rs1 : Bit 5 <- (#instFields ! InstFieldsFields @. "rs1");
                LET rd : Bit 5 <- (#instFields ! InstFieldsFields @. "rd");
                LET csr : Bit 12 <- (#instFields ! InstFieldsFields @. "csr");
        LET imm : (Bit DataSz) <- UniBit (Trunc 16 (32 - 16)) (#dInst ! DecodedInstFields @. "imm");
                LET alu_a : Bit DataSz <- #rVal1;
                LET alu_b : Bit DataSz <- (* case expr *)
    (IF ((#opcode == $$opOP)) then 
#rVal2 else 
    (IF ((#opcode == $$opOPIMM)) then 
#imm else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
                LET add_op_a : Bit DataSz <- (* case expr *)
    (IF ((#opcode == $$opOP) || (#opcode == $$opOPIMM) || (#opcode == $$opJALR) || (#opcode == $$opLOAD) || (#opcode == $$opSTORE)) then 
#rVal1 else 
    (IF ((#opcode == $$opJAL) || (#opcode == $$opAUIPC) || (#opcode == $$opBRANCH)) then 
#pc else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
                LET inst_30 : Bit 1 <- (#inst$[30:30]@32);
                LET add_op_b : Bit DataSz <- (* case expr *)
    (IF ((#opcode == $$opOP)) then 
(IF (#inst_30 == $1) then (UniBit (Neg 16) #rVal2) else #rVal2) else 
    (IF ((#opcode == $$opOPIMM) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opAUIPC) || (#opcode == $$opBRANCH) || (#opcode == $$opLOAD) || (#opcode == $$opSTORE)) then 
#imm else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
                LET add_carry_in : Bit 1 <- (* case expr *)
    (IF ((#opcode == $$opOP)) then 
#inst_30 else 
    (IF ((#opcode == $$opOPIMM) || (#opcode == $$opJAL) || (#opcode == $$opJALR) || (#opcode == $$opAUIPC) || (#opcode == $$opBRANCH) || (#opcode == $$opLOAD) || (#opcode == $$opSTORE)) then 
$0 else 
(* default 3 *)$$(natToWord 1 0)
)
)
;
        CallM add_output_with_carryout : Bit (DataSz + 1) (* varbinding *) <-  addN (#add_op_a : Bit DataSz) (#add_op_b : Bit DataSz) (#add_carry_in : Bit 1);
        LET add_output : (Bit DataSz) <- UniBit (Trunc 16 ((16 + 1) - 16)) #add_output_with_carryout;
        CallM add_carryout : Bit 1 (* varbinding *) <-  msb_TAdd_DataSz_1_ (#add_output_with_carryout : Bit (DataSz + 1));
        CallM reversed_rVal1 : Bit DataSz (* varbinding *) <-  reverseBits_DataSz (#rVal1 : Bit DataSz);
                LET shift_in : Bit DataSz <- (* case expr *)
    (IF ((#funct3 == $$fnSR)) then 
#rVal1 else 
    (IF ((#funct3 == $$fnSLL)) then 
#reversed_rVal1 else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
        LET shift_amount : (Bit LogDataSz) <- UniBit (Trunc 4 (16 - 4)) #alu_b;
                LET shift_is_signed : Bool <- (* case expr *)
    (IF ((#funct3 == $$fnSR)) then 
(#inst_30 == $1) else 
    (IF ((#funct3 == $$fnSLL)) then 
($$false)%kami_expr else 
(* default 3 *)($$false)%kami_expr
)
)
;
        CallM shift_tmp : Bit DataSz (* varbinding *) <-  rightShiftN (#shift_in : Bit DataSz) (#shift_amount : Bit LogDataSz) (#shift_is_signed : Bool);
        CallM reversed_shift_tmp : Bit DataSz (* varbinding *) <-  reverseBits_DataSz (#shift_tmp : Bit DataSz);
                LET shift_output : Bit DataSz <- (* case expr *)
    (IF ((#funct3 == $$fnSR)) then 
#shift_tmp else 
    (IF ((#funct3 == $$fnSLL)) then 
#reversed_shift_tmp else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
                LET comparator_a : Bit DataSz <- #rVal1;
                LET comparator_b : Bit DataSz <- (* case expr *)
    (IF ((#opcode == $$opOP) || (#opcode == $$opBRANCH)) then 
#rVal2 else 
    (IF ((#opcode == $$opOPIMM)) then 
#imm else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
        CallM comparator_ltu : Bool (* varbinding *) <-  ltuN (#comparator_a : Bit DataSz) (#comparator_b : Bit DataSz);
        CallM comparator_lt : Bool (* varbinding *) <-  msb_DataSz (#comparator_b : Bit DataSz);
        CallM fnXOR_v : Bit DataSz (* varbinding *) <-  xorN (#alu_a : Bit DataSz) (#alu_b : Bit DataSz);
        CallM fnOR_v : Bit DataSz (* varbinding *) <-  orN (#alu_a : Bit DataSz) (#alu_b : Bit DataSz);
        CallM fnAND_v : Bit DataSz (* varbinding *) <-  andN (#alu_a : Bit DataSz) (#alu_b : Bit DataSz);
        CallM fnSLT_b : Bit 1 (* varbinding *) <-  packBool (#comparator_lt : Bool);
        CallM fnSLTU_b : Bit 1 (* varbinding *) <-  packBool (#comparator_ltu : Bool);
        LET fnSLT_v : (Bit DataSz) <-  UniBit (SignExtendTrunc 1 16) #fnSLT_b;
        LET fnSLTU_v : (Bit DataSz) <-  UniBit (SignExtendTrunc 1 16) #fnSLTU_b;
                LET alu_out : Bit DataSz <- (* case expr *)
    (IF ((#funct3 == $$fnADD)) then 
#add_output else 
    (IF ((#funct3 == $$fnXOR)) then 
#fnXOR_v else 
    (IF ((#funct3 == $$fnOR)) then 
#fnOR_v else 
    (IF ((#funct3 == $$fnAND)) then 
#fnAND_v else 
    (IF ((#funct3 == $$fnSLT)) then 
#fnSLT_v else 
    (IF ((#funct3 == $$fnSLTU)) then 
#fnSLTU_v else 
    (IF ((#funct3 == $$fnSLL)) then 
#shift_output else 
    (IF ((#funct3 == $$fnSR)) then 
#shift_output else 
(* default 9 *)$$(natToWord 16 0)
)
)
)
)
)
)
)
)
;
        CallM branch_eq : Bool (* varbinding *) <-  eqN (#rVal1 : Bit DataSz) (#rVal2 : Bit DataSz);
                LET branch_condition : Bool <- (* case expr *)
    (IF ((#funct3 == $$fnBEQ)) then 
#branch_eq else 
    (IF ((#funct3 == $$fnBNE)) then 
(!#branch_eq) else 
    (IF ((#funct3 == $$fnBLT)) then 
#comparator_lt else 
    (IF ((#funct3 == $$fnBGE)) then 
(!#comparator_lt) else 
    (IF ((#funct3 == $$fnBLTU)) then 
#comparator_ltu else 
    (IF ((#funct3 == $$fnBGEU)) then 
(!#comparator_ltu) else 
(* default 7 *)($$false)%kami_expr
)
)
)
)
)
)
;
                LET mem_addr : Bit DataSz <- #add_output;
                LET mem_addr_b1 : Bit 1 <- (#mem_addr$[1:1]@16);
                LET fnSH_shift : Bit 2 <- (BinBit (Concat (1) 1) #mem_addr_b1 $$(natToWord 1 0));
                LET fnSH_v : Bit 4 <- (BinBit (Sll 4 2) $$(natToWord 4 3) #fnSH_shift);
                LET fnSB_shift : Bit 2 <- (#mem_addr$[1:0]@16);
                LET fnSB_v : Bit 4 <- (BinBit (Sll 4 2) $$(natToWord 4 1) #fnSB_shift);
                LET mem_write_en : Bit (MemDataSz / 8) <- (* case expr *)
    (IF ((#opcode == $$opLOAD)) then 
$0 else 
    (IF ((#opcode == $$opSTORE)) then 
(* case expr *)
    (IF ((#funct3 == $$fnSW)) then 
$$(natToWord 4 15) else 
    (IF ((#funct3 == $$fnSH)) then 
#fnSH_v else 
    (IF ((#funct3 == $$fnSB)) then 
#fnSB_v else 
(* default 4 *)$$(natToWord 4 0)
)
)
)
 else 
(* default 3 *)$0
)
)
;
                LET rVal2_15_0 : Bit 16 <- (#rVal2$[15:0]@16);
                LET rVal2_7_0 : Bit 8 <- (#rVal2$[7:0]@16);
                LET fnSHv : Bit 32 <- (BinBit (Concat (16) 16) #rVal2_15_0 #rVal2_15_0);
                LET fnSBv : Bit 32 <- (BinBit (Concat (8 + 8 + 8) 8) (BinBit (Concat (8 + 8) 8) (BinBit (Concat (8) 8) #rVal2_7_0 #rVal2_7_0) #rVal2_7_0) #rVal2_7_0);
        LET fnSW_v : (Bit MemDataSz) <-  UniBit (SignExtendTrunc 16 32) #rVal2;
                LET mem_write_data : Bit MemDataSz <- (* case expr *)
    (IF ((#funct3 == $$fnSW)) then 
#fnSW_v else 
    (IF ((#funct3 == $$fnSH)) then 
#fnSHv else 
    (IF ((#funct3 == $$fnSB)) then 
#fnSBv else 
(* default 4 *)$$(natToWord 32 0)
)
)
)
;
        LET rs1_b16 : (Bit 16) <-  UniBit (SignExtendTrunc 5 16) #rs1;
                LET csr_operand : Bit DataSz <- (* case expr *)
    (IF ((#funct3 == $$fnCSRRW) || (#funct3 == $$fnCSRRS) || (#funct3 == $$fnCSRRC)) then 
#rVal1 else 
    (IF ((#funct3 == $$fnCSRRWI) || (#funct3 == $$fnCSRRSI) || (#funct3 == $$fnCSRRCI)) then 
#rs1_b16 else 
(* default 3 *)$$(natToWord 16 0)
)
)
;
                LET csr_write_data : Bit DataSz <- (* case expr *)
    (IF ((#funct3 == $$fnCSRRW) || (#funct3 == $$fnCSRRWI)) then 
#csr_operand else 
    (IF ((#funct3 == $$fnCSRRS) || (#funct3 == $$fnCSRRSI)) then 
(#csr_read_data ~| #csr_operand) else 
    (IF ((#funct3 == $$fnCSRRC) || (#funct3 == $$fnCSRRCI)) then 
(#csr_read_data ~& (UniBit (Neg 16) #csr_operand)) else 
(* default 4 *)$$(natToWord 16 0)
)
)
)
;
                LET pc_plus_4 : Bit DataSz <- (#pc + $4);
                LET reg_write_data : Bit DataSz <- (* case expr *)
    (IF ((#opcode == $$opLUI)) then 
#imm else 
    (IF ((#opcode == $$opAUIPC)) then 
#add_output else 
    (IF ((#opcode == $$opJAL)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opJALR)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opOPIMM)) then 
#alu_out else 
    (IF ((#opcode == $$opOP)) then 
#alu_out else 
    (IF ((#opcode == $$opSYSTEM)) then 
#csr_read_data else 
(* default 8 *)$$(natToWord 16 0)
)
)
)
)
)
)
)
;
                LET next_pc_all : Bit DataSz <- (* case expr *)
    (IF ((#opcode == $$opJAL)) then 
#add_output else 
    (IF ((#opcode == $$opJALR)) then 
#add_output else 
    (IF ((#opcode == $$opBRANCH)) then 
(IF #branch_condition then #add_output else #pc_plus_4) else 
    (IF ((#opcode == $$opLUI)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opAUIPC)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opLOAD)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opSTORE)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opOPIMM)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opOP)) then 
#pc_plus_4 else 
    (IF ((#opcode == $$opSYSTEM)) then 
#pc_plus_4 else 
(* default 11 *)$$(natToWord 16 0)
)
)
)
)
)
)
)
)
)
)
;
                LET next_pc : Bit DataSz <- (#next_pc_all ~& (UniBit (Neg 16) $$(natToWord 16 1)));
        LET rd_v : (Bit RegIndexSz) <- UniBit (Trunc 4 (5 - 4)) #rd;
                LET executedInst : ExecutedInst <- STRUCT { "csr_write_data" ::= (#csr_write_data); "mem_addr" ::= (#mem_addr); "mem_write_data" ::= (#mem_write_data); "mem_write_en" ::= (#mem_write_en); "next_pc" ::= (#next_pc); "rd" ::= (#rd_v); "reg_write_data" ::= (#reg_write_data)  }%kami_expr;
                Ret #executedInst
    )
    }). (* execute *)
    Definition execute := Build_Interface'execute Modules'execute (instancePrefix--"execute").
    End Section'execute.
End module'execute.

Definition function'execute := module'execute.execute.
Hint Unfold function'execute : ModuleDefs.
Hint Unfold module'execute.execute : ModuleDefs.
Hint Unfold module'execute.Modules'execute : ModuleDefs.


(* interface for module wrapper for complete_load *)
Record Interface'complete_load := {
    Interface'complete_load'modules: Modules;
    Interface'complete_load'complete_load: string;
}.
Hint Unfold Interface'complete_load'modules : ModuleDefs.
Hint Unfold Interface'complete_load'complete_load : ModuleDefs.

Module module'complete_load.
    Section Section'complete_load.
    Variable instancePrefix: string.
    Definition Modules'complete_load: Modules :=
         (BKMODULE {
        Method instancePrefix--"complete_load" (mem_data: (Bit MemDataSz)) (mem_addr_bottom_bits: (Bit 2)) (funct3: (Bit 3)): Bit DataSz := 
    (
                LET mem_addr_bottom_bits_1_1 : Bit 1 <- (#mem_addr_bottom_bits$[1:1]@2);
                LET mem_addr_bottom_bits_1_0 : Bit 2 <- (#mem_addr_bottom_bits$[1:0]@2);
                LET shift1 : Bit 5 <- (BinBit (Concat (1) 4) #mem_addr_bottom_bits_1_1 $$(natToWord 4 0));
                LET shift2 : Bit 5 <- (BinBit (Concat (2) 3) #mem_addr_bottom_bits_1_0 $$(natToWord 3 0));
                LET mem_data_shift1 : Bit MemDataSz <- (BinBit (Srl 32 5) #mem_data #shift1);
                LET mem_data_shift2 : Bit MemDataSz <- (BinBit (Srl 32 5) #mem_data #shift2);
                LET mem_data_shift2_LSB : Bit 8 <- (#mem_data_shift2$[7:0]@32);
                LET mem_data_shift2_MSB : Bit 8 <- (#mem_data_shift2$[15:8]@32);
        LET mem_data_shift1_b32 : (Bit MemDataSz) <-  UniBit (SignExtendTrunc 32 32) #mem_data_shift1;
        LET mem_data_shift2_b32 : (Bit MemDataSz) <-  UniBit (SignExtendTrunc 32 32) #mem_data_shift2;
        LET mem_data_shift2_LSB_b32 : (Bit 32) <-  UniBit (SignExtendTrunc 8 32) #mem_data_shift2_LSB;
                LET mem_result : Bit MemDataSz <- (* case expr *)
    (IF ((#funct3 == $$fnLW)) then 
#mem_data else 
    (IF ((#funct3 == $$fnLH)) then 
#mem_data_shift1_b32 else 
    (IF ((#funct3 == $$fnLB)) then 
#mem_data_shift2_LSB_b32 else 
    (IF ((#funct3 == $$fnLHU)) then 
#mem_data_shift2_b32 else 
    (IF ((#funct3 == $$fnLBU)) then 
#mem_data_shift2_LSB_b32 else 
(* default 6 *)$$(natToWord 32 0)
)
)
)
)
)
;
        LET result : (Bit DataSz) <- UniBit (Trunc 16 (32 - 16)) #mem_result;
                Ret #result
    )
    }). (* complete_load *)
    Definition complete_load := Build_Interface'complete_load Modules'complete_load (instancePrefix--"complete_load").
    End Section'complete_load.
End module'complete_load.

Definition function'complete_load := module'complete_load.complete_load.
Hint Unfold function'complete_load : ModuleDefs.
Hint Unfold module'complete_load.complete_load : ModuleDefs.
Hint Unfold module'complete_load.Modules'complete_load : ModuleDefs.


Definition MemReqFields := (STRUCT {
    "data" :: Bit MemDataSz;
    "word_addr" :: Bit (DataSz - LogMemDataBytes);
    "write_byte_en" :: Bit (MemDataSz / 8)}).
Definition MemReq  := Struct (MemReqFields).

(* * interface ProcMMode *)
Record ProcMMode := {
    ProcMMode'modules: Modules;
    ProcMMode'char_out : string;
    ProcMMode'proc_en : string;
    ProcMMode'mem_req : string;
    ProcMMode'mem_resp : string;
}.

Hint Unfold ProcMMode'modules : ModuleDefs.
Hint Unfold ProcMMode'char_out : ModuleDefs.
Hint Unfold ProcMMode'proc_en : ModuleDefs.
Hint Unfold ProcMMode'mem_req : ModuleDefs.
Hint Unfold ProcMMode'mem_resp : ModuleDefs.

Module module'mkReadOnlyReg.
    Section Section'mkReadOnlyReg.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable value: ConstT t.
    Definition mkReadOnlyRegModule: Modules :=
         (BKMODULE {
        Method instancePrefix--"_write" (x : t) : Void :=
    (
        Retv    )

    with Method instancePrefix--"_read" () : t :=
    (
        Ret $$value    )

    }). (* mkReadOnlyReg *)

(* Module mkReadOnlyReg type t -> Module#(Reg#(t)) return type Reg#(t) *)
    Definition mkReadOnlyReg := Build_Reg mkReadOnlyRegModule%kami (instancePrefix--"_read") (instancePrefix--"_write").
    End Section'mkReadOnlyReg.
End module'mkReadOnlyReg.

Definition mkReadOnlyReg := module'mkReadOnlyReg.mkReadOnlyReg.
Hint Unfold mkReadOnlyReg : ModuleDefs.
Hint Unfold module'mkReadOnlyReg.mkReadOnlyReg : ModuleDefs.
Hint Unfold module'mkReadOnlyReg.mkReadOnlyRegModule : ModuleDefs.

Definition MiniRiscvStateFields := (STRUCT { "$tag" :: (Bit 0) }).
Definition MiniRiscvState := (Struct MiniRiscvStateFields).
Notation InstFetch := (STRUCT { "$tag" ::= $$(natToWord 0 0) })%kami_expr.
Notation Execute := (STRUCT { "$tag" ::= $$(natToWord 0 0) })%kami_expr.
Notation LoadFinish := (STRUCT { "$tag" ::= $$(natToWord 0 0) })%kami_expr.
Module module'mkMiniRiscvMMode.
    Section Section'mkMiniRiscvMMode.
    Variable instancePrefix: string.
    Variable msip: ConstT (Bit 1).
    Variable mtip: ConstT (Bit 1).
    Variable meip: ConstT (Bit 1).
        (* method bindings *)
    Let pc := mkReg (Bit 16) (instancePrefix--"pc") ($$(natToWord 16 0))%bk.
    Let rf := mkCustomRFile2R1W (DataSz) (RegIndexSz) (instancePrefix--"rf").
    Let csrfile := mkCSRFile (instancePrefix--"csrfile") (msip)%bk (mtip)%bk (meip)%bk.
    Let state := mkRegU (MiniRiscvState) (instancePrefix--"state").
    Let funct3_reg := mkRegU (Bit 3) (instancePrefix--"funct3_reg").
    Let mem_addr_reg := mkRegU (Bit 2) (instancePrefix--"mem_addr_reg").
    Let rd_reg := mkRegU (Bit RegIndexSz) (instancePrefix--"rd_reg").
    Let char_out_wire := mkRegU (Maybe (Bit 8)) (instancePrefix--"char_out_wire").
    Let proc_en_wire := mkRegU (Bool) (instancePrefix--"proc_en_wire").
    Let mem_req_wire := mkRegU (Maybe MemReq) (instancePrefix--"mem_req_wire").
    Let mem_resp_wire := mkRegU (Maybe (Bit MemDataSz)) (instancePrefix--"mem_resp_wire").
    Let pc_read : string := (Reg'_read pc).
    Let proc_en_wire_read : string := (Reg'_read proc_en_wire).
    Let state_read : string := (Reg'_read state).
    Let mem_req_wire_write : string := (Reg'_write mem_req_wire).
    Let state_write : string := (Reg'_write state).
    Let mem_resp_wire_read : string := (Reg'_read mem_resp_wire).
    Let instance'isValid_Bit_MemDataSz_ := function'isValid (Bit MemDataSz) (instancePrefix--"isValid_Bit_MemDataSz_").
    Let isValid_Bit_MemDataSz_ := Interface'isValid'isValid instance'isValid_Bit_MemDataSz_.
    Let instance'fromMaybe_Bit_32_ := function'fromMaybe (Bit 32) (instancePrefix--"fromMaybe_Bit_32_").
    Let fromMaybe_Bit_32_ := Interface'fromMaybe'fromMaybe instance'fromMaybe_Bit_32_.
    Let instance'getInstFields := function'getInstFields (instancePrefix--"getInstFields").
    Let getInstFields := Interface'getInstFields'getInstFields instance'getInstFields.
    Let instance'decode := function'decode (instancePrefix--"decode").
    Let decode := Interface'decode'decode instance'decode.
    Let instance'execute := function'execute (instancePrefix--"execute").
    Let execute := Interface'execute'execute instance'execute.
    Let instance'isValid_Bit_4_ := function'isValid (Bit 4) (instancePrefix--"isValid_Bit_4_").
    Let isValid_Bit_4_ := Interface'isValid'isValid instance'isValid_Bit_4_.
    Let instance'fromMaybe_Bit_4_ := function'fromMaybe (Bit 4) (instancePrefix--"fromMaybe_Bit_4_").
    Let fromMaybe_Bit_4_ := Interface'fromMaybe'fromMaybe instance'fromMaybe_Bit_4_.
    Let pc_write : string := (Reg'_write pc).
    Let char_out_wire_write : string := (Reg'_write char_out_wire).
    Let rd_reg_write : string := (Reg'_write rd_reg).
    Let mem_addr_reg_write : string := (Reg'_write mem_addr_reg).
    Let funct3_reg_write : string := (Reg'_write funct3_reg).
    Let funct3_reg_read : string := (Reg'_read funct3_reg).
    Let mem_addr_reg_read : string := (Reg'_read mem_addr_reg).
    Let rd_reg_read : string := (Reg'_read rd_reg).
    Let instance'complete_load := function'complete_load (instancePrefix--"complete_load").
    Let complete_load := Interface'complete_load'complete_load instance'complete_load.
    Let proc_en_wire_write : string := (Reg'_write proc_en_wire).
    Let char_out_wire_read : string := (Reg'_read char_out_wire).
    Let mem_req_wire_read : string := (Reg'_read mem_req_wire).
    Let mem_resp_wire_write : string := (Reg'_write mem_resp_wire).
    (* instance methods *)
    Let csrfileinterruptPending : string := (CSRFile'interruptPending csrfile).
    Let csrfileisCSRValid : string := (CSRFile'isCSRValid csrfile).
    Let csrfileraiseTrap : string := (CSRFile'raiseTrap csrfile).
    Let csrfilereadCSR : string := (CSRFile'readCSR csrfile).
    Let csrfilereturnFromTrap : string := (CSRFile'returnFromTrap csrfile).
    Let csrfilewriteCSR : string := (CSRFile'writeCSR csrfile).
    Let rfrd1 : string := (RFile2R1W'rd1 rf).
    Let rfrd2 : string := (RFile2R1W'rd2 rf).
    Let rfwr : string := (RFile2R1W'wr rf).
    Definition mkMiniRiscvMModeModule: Modules :=
         (BKMODULE {
        (BKMod (Reg'modules pc :: nil))
    with (BKMod (RFile2R1W'modules rf :: nil))
    with (BKMod (CSRFile'modules csrfile :: nil))
    with (BKMod (Reg'modules state :: nil))
    with (BKMod (Reg'modules funct3_reg :: nil))
    with (BKMod (Reg'modules mem_addr_reg :: nil))
    with (BKMod (Reg'modules rd_reg :: nil))
    with (BKMod (Reg'modules char_out_wire :: nil))
    with (BKMod (Reg'modules proc_en_wire :: nil))
    with (BKMod (Reg'modules mem_req_wire :: nil))
    with (BKMod (Reg'modules mem_resp_wire :: nil))
    with Rule instancePrefix--"doInstFetch" :=
    (
        CallM pc_v : Bit DataSz (* regRead *) <- pc_read();
        CallM proc_en_wire_v : Bool (* regRead *) <- proc_en_wire_read();
        CallM state_v : MiniRiscvState (* regRead *) <- state_read();

        Assert(((#state_v == InstFetch) && #proc_en_wire_v));
       LET pc_shifted : (Bit DataSz) <- $2;
       LET word_addr : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) #pc_shifted;
               LET mem_req : MemReq <- STRUCT { "data" ::= ($0); "word_addr" ::= (#word_addr); "write_byte_en" ::= ($$(natToWord 4 0))  }%kami_expr;
               LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
               CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
               CallM state_write ( Execute : MiniRiscvState );
        Retv ) (* rule doInstFetch *)
    with Rule instancePrefix--"doExecute" :=
    (
        CallM mem_resp_wire_v : Maybe (Bit MemDataSz) (* regRead *) <- mem_resp_wire_read();
        CallM pc_v : Bit DataSz (* regRead *) <- pc_read();
        CallM proc_en_wire_v : Bool (* regRead *) <- proc_en_wire_read();
        CallM state_v : MiniRiscvState (* regRead *) <- state_read();
       CallM call0 : Bool <-  isValid_Bit_MemDataSz_ (#mem_resp_wire_v : Maybe (Bit MemDataSz));

        Assert((#call0 && (#state_v == Execute)) && #proc_en_wire_v);
       LET word_shift : (Bit 4) <- $2;
       CallM inst : Bit MemDataSz (* varbinding *) <-  fromMaybe_Bit_32_ ($$(natToWord 32 0) : Bit 32) (#mem_resp_wire_v : Maybe (Bit MemDataSz));
       CallM instFields : InstFields (* varbinding *) <-  getInstFields (#inst : Bit 32);
       LET rs1_truncated : (Bit RegIndexSz) <- UniBit (Trunc 4 (5 - 4)) (#instFields ! InstFieldsFields @. "rs1");
       LET rs2_truncated : (Bit RegIndexSz) <- UniBit (Trunc 4 (5 - 4)) (#instFields ! InstFieldsFields @. "rs2");
       CallM rVal1 : Bit DataSz (* varbinding *) <-  rfrd1 (#rs1_truncated : Bit RegIndexSz);
       CallM rVal2 : Bit DataSz (* varbinding *) <-  rfrd2 (#rs2_truncated : Bit RegIndexSz);
       CallM csrReadData : Bit DataSz (* varbinding *) <-  csrfilereadCSR ((#instFields ! InstFieldsFields @. "csr") : Bit 12);
       CallM dInst : DecodedInst (* varbinding *) <-  decode (#inst : Bit 32);
       CallM eInst : ExecutedInst (* varbinding *) <-  execute (#inst : Bit 32) (#dInst : DecodedInst) (#rVal1 : Bit DataSz) (#rVal2 : Bit DataSz) (#csrReadData : Bit DataSz) (#pc_v : Bit DataSz);
               LET sendsMemReq : Bool <- (#dInst ! DecodedInstFields @. "sendsMemReq");
               LET mem_addr_0 : Bit 1 <- ((#eInst ! ExecutedInstFields @. "mem_addr")$[0:0]@16);
               LET getsmemresp : Bool <- (#dInst ! DecodedInstFields @. "getsMemResp");
       CallM call1 : Bool <-  csrfileisCSRValid ((#instFields ! InstFieldsFields @. "csr") : Bit 12);
               LET exception_cause : Maybe (Bit 4) <- (IF (#sendsMemReq && ((((#instFields ! InstFieldsFields @. "funct3") == $$fnLW) && (((#eInst ! ExecutedInstFields @. "mem_addr")$[1:0]@16) != $0)) || ((((#instFields ! InstFieldsFields @. "funct3") == $$fnLH) || ((#instFields ! InstFieldsFields @. "funct3") == $$fnLHU)) && (#mem_addr_0 != $0)))) then (IF #getsmemresp then (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_STORE_AMO_ADDRESS_MISALIGNED }%kami_expr else (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_LOAD_ADDRESS_MISALIGNED }%kami_expr) else (IF (#dInst ! DecodedInstFields @. "ecall") then (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_ENVIRONMENT_CALL_FROM_M_MODE }%kami_expr else (IF (#dInst ! DecodedInstFields @. "ebreak") then (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_BREAKPOINT }%kami_expr else (IF (((#eInst ! ExecutedInstFields @. "next_pc")$[1:0]@16) != $0) then (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_INST_ADDR_MISALIGNED }%kami_expr else (IF ((#dInst ! DecodedInstFields @. "writesCsr") && (!#call1)) then (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_ILLEGAL_INSTRUCTION }%kami_expr else (IF (#dInst ! DecodedInstFields @. "unsupported") then (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= $$cause_ILLEGAL_INSTRUCTION }%kami_expr else (* tagged union Invalid *) STRUCT {  "$tag" ::= $1; "Invalid" ::= $0; "Valid" ::= $0 }%kami_expr))))));
       CallM validExceptionCause : Bool (* varbinding *) <-  isValid_Bit_4_ (#exception_cause : Maybe (Bit 4));
       CallM maybeInterruptPending : Maybe (Bit 4) (* varbinding *) <-  csrfileinterruptPending ();
       CallM validInterruptPending : Bool (* varbinding *) <-  isValid_Bit_4_ (#maybeInterruptPending : Maybe (Bit 4));
               If #validExceptionCause then (
        
CallM cause : Bit 4 (* varbinding *) <-  fromMaybe_Bit_4_ ($$(natToWord 4 0) : Bit 4) (#exception_cause : Maybe (Bit 4));
                CallM next_pc : Bit DataSz (* actionBinding *) <- csrfileraiseTrap (($$false)%kami_expr : Bool) (#cause : Bit 4) (#pc_v : Bit DataSz) ((#eInst ! ExecutedInstFields @. "mem_addr") : Bit DataSz);
        LET next_pc_shifted : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) (BinBit (Srl 16 4) #next_pc #word_shift);
                LET mem_req : MemReq <- STRUCT { "data" ::= ($0); "word_addr" ::= (#next_pc_shifted); "write_byte_en" ::= ($0)  }%kami_expr;
                LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
                CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
                CallM state_write ( Execute : MiniRiscvState );
                CallM pc_write ( #next_pc : Bit DataSz );
        Retv
        ) else (
                If #validInterruptPending then (
        
CallM cause : Bit 4 (* varbinding *) <-  fromMaybe_Bit_4_ ($$(natToWord 4 0) : Bit 4) (#maybeInterruptPending : Maybe (Bit 4));
                CallM next_pc : Bit DataSz (* actionBinding *) <- csrfileraiseTrap (($$true)%kami_expr : Bool) (#cause : Bit 4) (#pc_v : Bit DataSz) ((#eInst ! ExecutedInstFields @. "mem_addr") : Bit DataSz);
        LET next_pc_shifted : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) (BinBit (Srl 16 4) #next_pc #word_shift);
                LET mem_req : MemReq <- STRUCT { "data" ::= ($0); "word_addr" ::= (#next_pc_shifted); "write_byte_en" ::= ($0)  }%kami_expr;
                LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
                CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
                CallM state_write ( Execute : MiniRiscvState );
                CallM pc_write ( #next_pc : Bit DataSz );
        Retv
        ) else (
                If (#dInst ! DecodedInstFields @. "mret") then (
        
        CallM next_pc : Bit DataSz (* actionBinding *) <- csrfilereturnFromTrap ();
        LET next_pc_shifted : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) (BinBit (Srl 16 4) #next_pc #word_shift);
                LET mem_req : MemReq <- STRUCT { "data" ::= ($0); "word_addr" ::= (#next_pc_shifted); "write_byte_en" ::= ($0)  }%kami_expr;
                LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
                CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
                CallM state_write ( Execute : MiniRiscvState );
                CallM pc_write ( #next_pc : Bit DataSz );
        Retv
        ) else (
        
        If (#dInst ! DecodedInstFields @. "sendsMemReq") then (
        
LET word_addr : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) (BinBit (Srl 16 4) (#eInst ! ExecutedInstFields @. "mem_addr") #word_shift);
        LET write_byte_en_v : (Bit (MemDataSz / 8)) <-  UniBit (SignExtendTrunc (32 / 8) (32 / 8)) (#eInst ! ExecutedInstFields @. "mem_write_en");
                LET mem_req : MemReq <- STRUCT { "data" ::= ((#eInst ! ExecutedInstFields @. "mem_write_data")); "word_addr" ::= (#word_addr); "write_byte_en" ::= (#write_byte_en_v)  }%kami_expr;
                LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
                CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
                If (#dInst ! DecodedInstFields @. "getsMemResp") then (
        
        CallM state_write ( LoadFinish : MiniRiscvState );
        Retv
        ) else (
        
        CallM state_write ( InstFetch : MiniRiscvState );
        Retv) as retval
;
                If ((!(#dInst ! DecodedInstFields @. "getsMemResp")) && (((#eInst ! ExecutedInstFields @. "mem_addr")$[15:0]@16) == $$( (* 16'hf000 *) WO~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0 ))) then (
        
        LET b : Bit 8 <- ((#eInst ! ExecutedInstFields @. "mem_write_data")$[7:0]@32);
                LET mb : Maybe (Bit 8) <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #b }%kami_expr;
                CallM char_out_wire_write ( #mb : Maybe (Bit 8) );
        Retv) else (
            Retv
        ) as retval
;
        Ret #retval
        ) else (
        
        If (#dInst ! DecodedInstFields @. "usesRd") then (
        
CallM call2 : Void <-  rfwr ((#eInst ! ExecutedInstFields @. "rd") : Bit RegIndexSz) ((#eInst ! ExecutedInstFields @. "reg_write_data") : Bit DataSz);
        Retv) else (
            Retv
        ) as retval
;
                If (#dInst ! DecodedInstFields @. "writesCsr") then (
        
CallM call3 : Void <-  csrfilewriteCSR ((#instFields ! InstFieldsFields @. "csr") : Bit 12) ((#eInst ! ExecutedInstFields @. "csr_write_data") : Bit DataSz);
        Retv) else (
            Retv
        ) as retval
;
        LET next_pc_shifted : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) (BinBit (Srl 16 4) (#eInst ! ExecutedInstFields @. "next_pc") #word_shift);
                LET mem_req : MemReq <- STRUCT { "data" ::= ($0); "word_addr" ::= (#next_pc_shifted); "write_byte_en" ::= ($0)  }%kami_expr;
                LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
                CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
                CallM state_write ( Execute : MiniRiscvState );
        Ret #retval) as retval
;
                CallM pc_write ( (#eInst ! ExecutedInstFields @. "next_pc") : Bit DataSz );
        LET rd_reg_v : (Bit RegIndexSz) <- UniBit (Trunc 4 (4 - 4)) (#eInst ! ExecutedInstFields @. "rd");
        LET mem_addr_v : (Bit 2) <- UniBit (Trunc 2 (16 - 2)) (#eInst ! ExecutedInstFields @. "mem_addr");
                CallM rd_reg_write ( #rd_reg_v : Bit RegIndexSz );
                CallM mem_addr_reg_write ( #mem_addr_v : Bit 2 );
                CallM funct3_reg_write ( (#instFields ! InstFieldsFields @. "funct3") : Bit 3 );
        Ret #retval) as retval
;
                Ret #retval) as retval
;
                Ret #retval) as retval
;
        Retv ) (* rule doExecute *)
    with Rule instancePrefix--"doLoadFinish" :=
    (
        CallM funct3_reg_v : Bit 3 (* regRead *) <- funct3_reg_read();
        CallM mem_addr_reg_v : Bit 2 (* regRead *) <- mem_addr_reg_read();
        CallM mem_resp_wire_v : Maybe (Bit MemDataSz) (* regRead *) <- mem_resp_wire_read();
        CallM pc_v : Bit DataSz (* regRead *) <- pc_read();
        CallM proc_en_wire_v : Bool (* regRead *) <- proc_en_wire_read();
        CallM rd_reg_v : Bit RegIndexSz (* regRead *) <- rd_reg_read();
        CallM state_v : MiniRiscvState (* regRead *) <- state_read();
       CallM call4 : Bool <-  isValid_Bit_MemDataSz_ (#mem_resp_wire_v : Maybe (Bit MemDataSz));

        Assert((#call4 && (#state_v == LoadFinish)) && #proc_en_wire_v);
       LET word_shift : (Bit 4) <- $2;
       CallM mem_data : Bit MemDataSz (* varbinding *) <-  fromMaybe_Bit_32_ ($$(natToWord 32 0) : Bit 32) (#mem_resp_wire_v : Maybe (Bit MemDataSz));
       CallM read_data : Bit DataSz (* varbinding *) <-  complete_load (#mem_data : Bit MemDataSz) (#mem_addr_reg_v : Bit 2) (#funct3_reg_v : Bit 3);
       CallM call5 : Void <-  rfwr (#rd_reg_v : Bit RegIndexSz) (#read_data : Bit DataSz);
       LET next_pc_shifted : (Bit (DataSz - LogMemDataBytes)) <- UniBit (Trunc (16 - 2) (16 - (16 - 2))) (BinBit (Srl 16 4) #pc_v #word_shift);
               LET mem_req : MemReq <- STRUCT { "data" ::= ($0); "word_addr" ::= (#next_pc_shifted); "write_byte_en" ::= ($0)  }%kami_expr;
               LET maybe_mem_req : Maybe MemReq <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #mem_req }%kami_expr;
               CallM mem_req_wire_write ( #maybe_mem_req : Maybe MemReq );
               CallM state_write ( Execute : MiniRiscvState );
        Retv ) (* rule doLoadFinish *)
    with Method instancePrefix--"proc_en" (x : Bool) : Void :=
    (
        CallM proc_en_wire_write ( #x : Bool );
        Retv    )

    with Method instancePrefix--"char_out" () : Maybe (Bit 8) :=
    (
CallM char_out_wire_v : Maybe (Bit 8) (* methoddef regread *) <- char_out_wire_read();
        Ret #char_out_wire_v    )

    with Method instancePrefix--"mem_req" () : Maybe MemReq :=
    (
CallM mem_req_wire_v : Maybe MemReq (* methoddef regread *) <- mem_req_wire_read();
        Ret #mem_req_wire_v    )

    with Method instancePrefix--"mem_resp" (x : (Bit MemDataSz)) : Void :=
    (
        LET maybe_x : Maybe (Bit MemDataSz) <- (* tagged union Valid *) STRUCT {  "$tag" ::= $0; "Invalid" ::= $0; "Valid" ::= #x }%kami_expr;
        CallM mem_resp_wire_write ( #maybe_x : Maybe (Bit MemDataSz) );
        Retv    )

    }). (* mkMiniRiscvMMode *)

(* Module mkMiniRiscvMMode type Bit#(1) -> Bit#(1) -> Bit#(1) -> Module#(ProcMMode) return type Bit#(1) *)
    Definition mkMiniRiscvMMode := Build_ProcMMode mkMiniRiscvMModeModule%kami (instancePrefix--"char_out") (instancePrefix--"mem_req") (instancePrefix--"mem_resp") (instancePrefix--"proc_en").
    End Section'mkMiniRiscvMMode.
End module'mkMiniRiscvMMode.

Definition mkMiniRiscvMMode := module'mkMiniRiscvMMode.mkMiniRiscvMMode.
Hint Unfold mkMiniRiscvMMode : ModuleDefs.
Hint Unfold module'mkMiniRiscvMMode.mkMiniRiscvMMode : ModuleDefs.
Hint Unfold module'mkMiniRiscvMMode.mkMiniRiscvMModeModule : ModuleDefs.

