Require Import Kami Lib.NatLib Puar.Processor Puar.Useful.

Set Implicit Arguments.
Set Asymmetric Patterns.

Open Scope string.
Notation fst := "fst".
Notation snd := "snd".
Notation isTrap := "isTrap".
Notation isInterrupt := "isInterrupt".
Notation trapValue := "trapValue".
Close Scope string.

Definition Pair (A B: Kind) := STRUCT { fst :: A ; snd :: B }.

Definition Trap := STRUCT {
                       isTrap :: Bool ;
                       isInterrupt :: Bool ;
                       trapValue :: Bit 4 }.

Definition SYSTEM := WO~1~1~1~0~0~0~0.
Definition ECALL := natToWord 12 0.
Definition EBREAK := natToWord 12 1.
Definition xRET := WO~0~0~0~1~0.
Definition URET := WO~0~0~0~0~0~0~0.
Definition SRET := WO~0~0~0~1~0~0~0.
Definition MRET := WO~0~0~1~1~0~0~0.
Definition WFI_funct7 := WO~0~0~0~1~0~0~0.
Definition WFI_rs2 := WO~0~0~1~0~1.
Definition SFENCE_VMA := WO~0~0~0~1~0~0~1.

Definition InstAddrMisaligned := 0.
Definition InstAccessFault := 1.
Definition IllegalInst := 2.
Definition Breakpoint := 3.
Definition LoadAddrMisaligned := 4.
Definition LoadAccessFault := 5.
Definition StoreAMOAddrMisaligned := 6.
Definition StoreAMOAccessFault := 7.
Definition EnvCallU := 8.
Definition EnvCallS := 9.
Definition EnvCallM := 11.
Definition InstPageFault := 12.
Definition LoadPageFault := 13.
Definition StoreAMOPageFault := 15.

Definition USoftwareInterrupt := 0.
Definition SSoftwareInterrupt := 1.
Definition MSoftwareInterrupt := 3.
Definition UTimerInterrupt := 4.
Definition STimerInterrupt := 5.
Definition MTimerInterrupt := 7.
Definition UExternalInterrupt := 8.
Definition SExternalInterrupt := 9.
Definition MExternalInterrupt := 11.

Section RV64.
  Definition LgXlenBytes := 3.
  Definition XlenBytes := ltac:(let y := eval compute in (Lib.NatLib.pow2 LgXlenBytes) in exact y).
  Definition VAddrSz := 64.
  Variable PAddrSz: nat.

  Definition RIndexSz := 5.

  Definition VAddr := Bit VAddrSz.
  Definition PAddr := Bit PAddrSz.
  Definition InstSz := 32.
  Definition Inst := ltac:(let y := eval compute in (Bit InstSz) in exact y).

  Definition Mode := Bit 2.

  Definition prvU := 0.
  Definition prvS := 1.
  Definition prvM := 3.
  
  Variable PcInit: ConstT VAddr.
  Definition RegFileInit := getDefaultConst (Vector (Data XlenBytes) RIndexSz).

  Definition LgXlen := ltac:(let y := eval compute in (3 + LgXlenBytes) in exact y).
  Definition Xlen := ltac:(let y := eval compute in (Lib.NatLib.pow2 LgXlen) in exact y).

  Open Scope string.
  Notation bInstAddr := "bInstAddr".
  Notation bAddr := "bAddr".
  Notation extF := "extF".
  Notation extM := "extM".
  Notation extC := "extC".
  Notation other := "other".
  Close Scope string.

  Variable FpuException : Kind.
  
  Definition ExecException :=
    STRUCT {
        bInstAddr :: Bool ;
        bAddr :: Bool ;
        extF :: Bool ;
        extC :: Bool ;
        other :: Bool }.

  Definition XlateInfo := STRUCT {
                              "satp" :: Bit Xlen;
                              "permission" :: Bit 10 }.
          
  Notation Exec := (Exec XlenBytes VAddr (Struct ExecException)).

  Notation "a $[ i :>: j ]@ w":=
    (UniBit
       (ConstExtract
          j
          (* (ltac:(let y := eval cbv in (i + 1 - j)%nat in exact y)) *)
          (i + 1 - j)%nat
          (* (ltac:(let y := eval cbv in (31 - i)%nat in exact y)) *)
          (w - 1 - i)%nat
       ) a) (at level 12).
  
  Notation "{ a , b }" := (BinBit (Concat _ _) a b).

  Open Scope kami_expr.
  Local Definition opcode ty (inst: ty Inst) :=
    #inst$[6 :>: 0]@InstSz.

  Local Definition op1_0 ty (inst: ty Inst) :=
    #inst$[1 :>: 0]@InstSz.

  Local Definition op4_2 ty (inst: ty Inst) :=
    #inst$[4 :>: 2]@InstSz.

  Local Definition op6_5 ty (inst: ty Inst) :=
    #inst$[6 :>: 5]@InstSz.
  
  Local Definition funct3 ty (inst: ty Inst) :=
    #inst$[14 :>: 12]@InstSz.

  Local Definition funct7 ty (inst: ty Inst) :=
    #inst$[31 :>: 25]@InstSz.

  Local Definition rd ty (inst: ty Inst) :=
    #inst$[11 :>: 7]@InstSz.

  Local Definition rs1 ty (inst: ty Inst) :=
    #inst$[19 :>: 15]@InstSz.

  Local Definition rs2 ty (inst: ty Inst) :=
    #inst$[24 :>: 20]@InstSz.

  Local Definition iImm ty (inst: ty Inst): (Bit Xlen) @ ty :=
    UniBit (SignExtendTrunc _ Xlen) {#inst$[31 :>: 31]@32,
                                     {#inst$[30 :>: 25]@32,
                                      {#inst$[24 :>: 21]@32,
                                       #inst$[20 :>: 20]@32}}}.
                                         
  Local Definition sImm ty (inst: ty Inst) :=
    UniBit (SignExtendTrunc _ Xlen) {#inst$[31 :>: 31]@32,
                                     {#inst$[30 :>: 25]@32,
                                      {#inst$[11 :>: 8]@32,
                                       #inst$[7 :>: 7]@32}}}.
                                         
  Local Definition bImm ty (inst: ty Inst) :=
    UniBit (SignExtendTrunc _ Xlen) {{#inst$[31 :>: 31]@32,
                                      #inst$[7 :>: 7]@32},
                                     {#inst$[30 :>: 25]@32,
                                      {#inst$[11 :>: 8]@32,
                                       #inst$[7 :>: 7]@32}}}.
                                         
  Local Definition uImm ty (inst: ty Inst) :=
    UniBit (ZeroExtendTrunc _ Xlen) {#inst$[31 :>: 31]@32,
                                     {#inst$[30 :>: 20]@32,
                                      {#inst$[19 :>: 12]@32,
                                       ($ 0: (Bit 12) @ ty) }}}.

  Local Definition jImm ty (inst: ty Inst) :=
    UniBit (SignExtendTrunc _ Xlen) {{#inst$[31 :>: 31]@32,
                                      {#inst$[19 :>: 12]@32,
                                       #inst$[20 :>: 20]@32}},
                                     {#inst$[30 :>: 25]@32,
                                      {#inst$[24 :>: 21]@32,
                                       ($ 0: (Bit 1) @ ty)}}}.

  Local Definition alu ty (d1 d2: (Bit Xlen) @ ty) (f3: (Bit 3) @ ty) (f7: Bool @ ty) :=
    (IF (f3 == $ 0)
     then (IF f7
           then d1 + d2
           else d1 - d2) 
    else (IF (f3 == $ 1)
           then (d1 << (d2$[5 :>: 0]@64))
           else (IF (f3 == $ 2)
                 then (IF (d1 < d2) then $ 1 else $ 0)
                 else (IF (f3 == $ 3)
                       then (IF (BinBitBool (Slt _) d1 d2) then $ 1 else $ 0)
                       else (IF (f3 == $ 4)
                             then d1 ~+ d2
                             else (IF (f3 == $ 5)
                                   then (IF f7
                                         then d1 >> (d2$[5 :>: 0]@64)
                                         else d1 ~>> (d2$[5 :>: 0]@64))
                                   else (IF (f3 == $ 6)
                                         then d1 ~| d2
                                         else d1 ~& d2 ))))))).

  Local Definition getExecException ty (pc: ty VAddr) (inst: ty Inst) (nextPcVal: VAddr @ ty) :=
    STRUCT {
        bInstAddr ::= #pc$[1 :>: 0]@Xlen != $ 0 ;
        bAddr ::= nextPcVal$[1 :>: 0]@Xlen != $ 0 ;
        extF ::= ((op4_2 _ inst == $ 1 && (op6_5 _ inst)$[1 :>: 1]@2 == $ 0) ||
                  (op4_2 _ inst == $ 4 && op6_5 _ inst == $ 2) ||
                  ((op4_2 _ inst)$[2 :>: 2]@3 == $ 0 && op6_5 _ inst == $ 2)) ;
        extC ::= op1_0 _ inst != $ 3 ;
        other ::= ((op4_2 _ inst == $ 2 && op6_5 _ inst != $ 2)
                     ||
                     (((op6_5 _ inst)$[1 :>: 1]@2 == $ 1) && (op4_2 _ inst)$[1 :>: 1]@3 != (op4_2 _ inst)$[0 :>: 0]@3)
                     || op4_2 _ inst == $ 7) }.

  (*
    OP-IMM:    00, 100
    OP:        01, 100, funct7[5]
    OP-IMM-32: 00, 110
    OP-32:     01, 110, funct7[5] 
    AUIPC:     00, 101
    LUI:       01, 101
    JALR:      11, 001
    JAL:       11, 011
    Branch:    11, 000
    LoadS:     00, 000, funct3[2] 0
    LoadU:     00, 000, funct3[2] 1
    Store:     01, 000
    AMO:       01, 011
   *)
  Definition execNotLongLatFn ty (pc: ty VAddr) (inst: ty Inst) (src1 src2: ty (Bit Xlen))
    : ((Struct Exec) @ ty) :=
    (*
          Branch operations:
          Branch: pc + bImm,      11, 000
          JALR: pc + src1 + iImm, 11, 001
          JAL: pc + jImm,         11, 011
     *)
    let nextPcVal :=
        (#pc +
         (IF (op4_2 _ inst)$[1 :>: 0]@3 == $ 0
          then (IF ((funct3 _ inst == $ 0 && #src1 == #src2) ||
                    (funct3 _ inst == $ 1 && #src1 != #src2) ||
                    (funct3 _ inst == $ 4 && BinBitBool (Slt _) #src1 #src2) ||
                    (funct3 _ inst == $ 5 &&
                                        !(BinBitBool (Slt _) #src2 #src1)) ||
                    (funct3 _ inst == $ 6 && (#src1 < #src2)) ||
                    (funct3 _ inst == $ 7 && (#src1 >= #src2)))
                then bImm _ inst
                else$ 4)
          else (IF (op4_2 _ inst)$[1 :>: 1]@3 == $ 0
                then #src1 + iImm _ inst
                else jImm _ inst)
         )) in
    (*
            ALU operations:
            OP-IMM: src1 op iImm,    00, 100
            OP-IMM-32: src1 op iImm, 00, 110 
            OP: src1 op src2,        01, 100
            OP-32: src1 op src2,     01, 110 
            LUI: uImm,               01, 101
            AUIPC: pc + uImm,        00, 101
            JAL, JALR: pc + 4,       11, 0x1
     *)
    let aluRes :=
             alu
             (IF (op4_2 _ inst)$[0 :>: 0]@3 == $ 1
              then (IF (op6_5 _ inst)$[0 :>: 0]@2 == (op6_5 _ inst)$[1 :>: 1]@2
                    then #pc
                    else $ 0)
              else {(IF (op4_2 _ inst)$[1 :>: 1]@3 == $ 0
                     then #src1$[63 :>: 32]@Xlen
                     else $ 0), #src1$[31 :>: 0]@Xlen})
             (IF (op4_2 _ inst)$[0 :>: 0]@3 == $ 0
              then (IF (op6_5 _ inst)$[0 :>: 0]@2 == $ 0
                    then iImm _ inst
                    else {(IF (op4_2 _ inst)$[1 :>: 1]@3 == $ 0
                           then #src2$[63 :>: 32]@Xlen
                           else $ 0), #src2$[31 :>: 0]@Xlen})
              else (IF (op6_5 _ inst)$[1 :>: 1]@2 == $ 0
                    then uImm _ inst
                    else $ 4))
             (funct3 _ inst)
             ((funct7 _ inst)$[5 :>: 5]@7 == $ 0) in
        STRUCT {
          (*
            ALU operations:
            OP-IMM: src1 op iImm,    00, 100
            OP-IMM-32: src1 op iImm, 00, 110 
            OP: src1 op src2,        01, 100
            OP-32: src1 op src2,     01, 110 
            LUI: uImm,               01, 101
            AUIPC: pc + uImm,        00, 101
            JAL, JALR: pc + 4,       11, 0x1
           *)
        data ::= (IF (op4_2 _ inst)$[1 :>: 1]@3 == $ 0
                  then aluRes
                  else UniBit (SignExtendTrunc _ 64) (aluRes$[31 :>: 0]@64)) ;

        (*
          Memory operations:
          Load (signed), Store: src1 + iImm, 0x, 000, funct3[2] 0
          Load (unsigned): src1 + sImm,      00, 000, funct3[2] 1
          AMO: src1,                         01, 011
         *)
        memVAddr ::=
             (#src1 + (IF (op4_2 _ inst)$[0 :>: 0]@3 == $ 0
                       then (IF (funct3 _ inst)$[2 :>: 2]@2 == $ 0
                             then sImm _ inst
                             else iImm _ inst)
                       else $ 0)) ;

        (*
          Exception:
          JAL, JALR: instruction address misaligned
          AMO: misaligned address
          _: illegal instruction
         *)
        exception ::= getExecException pc inst nextPcVal ;

        nextPc ::= nextPcVal
        }.

  Local Definition isLongLat ty (pc: ty VAddr) (inst: ty Inst) (nextPcVal: VAddr @ ty) :=
    ((getExecException pc inst nextPcVal)!ExecException@.extF)
      ||
      ((op4_2 _ inst)$[2 :>: 2]@3 == $ 1 && (op4_2 _ inst)$[0 :>: 0]@3 == $ 0)
      && (op6_5 _ inst == $ 1) &&
      (funct7 _ inst)$[0 :>: 0]@7 == $ 1.

  Definition isNotLongLat ty (pc: ty VAddr) (inst: ty Inst) (nextPcVal: VAddr @ ty) :=
    ! (isLongLat pc inst nextPcVal).

  Definition useSrc1 ty (inst: ty Inst) :=
    (op4_2 _ inst == $ 0 && op6_5 _ inst != $ 2)
    || (op4_2 _ inst == $ 1 && op6_5 _ inst == $ 3)
    || (op4_2 _ inst == $ 3 && op6_5 _ inst == $ 1)
    || ((op4_2 _ inst == $ 4 || op4_2 _ inst == $ 6)
           && (((op6_5 _ inst)$[1 :>: 1]@2 == $ 0)))
    || (op4_2 _ inst == $ 4 && op6_5 _ inst == $ 3 && (funct3 _ inst)$[2 :>: 2]@3 == $ 0).

  Definition useSrc2 ty (inst: ty Inst) :=
    op6_5 _ inst == $ 1 && (op4_2 _ inst == $ 0 || op4_2 _ inst == $ 4 || op4_2 _ inst == $ 6).


  Definition useDst ty (inst: ty Inst) :=
    (rd _ inst != $ 0)
      && ((op4_2 _ inst == $ 0 && op6_5 _ inst == $ 0)
          || ((op4_2 _ inst == $ 1 || op4_2 _ inst == $ 3) && op6_5 _ inst == $ 3)
          || ((op4_2 _ inst == $ 4 || op4_2 _ inst == $ 6) && (op6_5 _ inst)$[1 :>: 1]@2 == $ 0)
          || (op4_2 _ inst == $ 4 && op6_5 _ inst == $ 3)
          || (op4_2 _ inst == $ 5 && (op6_5 _ inst)$[1 :>: 1]@2 == $ 0)).

  Definition isAmo ty (inst: ty Inst) := op4_2 _ inst == $ 3 && op6_5 _ inst == $ 1.
  Definition isLd ty (inst: ty Inst) := (op4_2 _ inst == $ 0 && op6_5 _ inst == $ 0) || isAmo _ inst.
  Definition isSt ty (inst: ty Inst) := (op4_2 _ inst == $ 0 && op6_5 _ inst == $ 1) || isAmo _ inst.

  Definition toCauseCsr ty (x: ty (Struct Trap)) :=
    {((IF #x!Trap@.isInterrupt then $ 1 else $ 0): ((Bit 1) @ ty)),
     UniBit (@ZeroExtendTrunc _ (Xlen - 1)) #x!Trap@.trapValue }.

  Definition getExceptionInfo ty
             (exceptionValue: (Bit 4) @ ty)
             (pcVal: VAddr @ ty)
             (instVal: Inst @ ty)
             (memVAddr: VAddr @ ty): (Bit Xlen) @ ty :=
    (IF ((exceptionValue == $ InstAddrMisaligned)
           || (exceptionValue == $ InstAccessFault)
           || (exceptionValue == $ Breakpoint)
           || (exceptionValue == $ InstPageFault))
     then pcVal
     else (IF ((exceptionValue == $ IllegalInst))
           then UniBit (ZeroExtendTrunc _ Xlen) instVal
           else (IF ((exceptionValue == $ LoadAddrMisaligned)
                       || (exceptionValue == $ LoadAccessFault)
                       || (exceptionValue == $ StoreAMOAddrMisaligned)
                       || (exceptionValue == $ StoreAMOAccessFault)
                       || (exceptionValue == $ LoadPageFault)
                       || (exceptionValue == $ StoreAMOPageFault))
                 then memVAddr
                 else $ 0))).
  Close Scope kami_expr.
  
  Definition MemPrivT := (MemPrivT XlenBytes VAddr PAddr Inst Mode (Struct XlateInfo) (Struct ExecException)).
  Definition CExec := (CExec XlenBytes VAddr).
  Definition VToPRp := (VToPRp PAddr Mode (Struct XlateInfo)).
  
  Definition MemRqT := STRUCT {
                           "funct7" :: Bit 7 ;
                           "isLd" :: Bool ;
                           "isSt" :: Bool ;
                           "addr" :: PAddr ;
                           "data" :: Bit Xlen
                         }.

  Definition MemRpT := STRUCT {
                           "success" :: Bool ;
                           "data" :: Bit Xlen
                         }.

  Definition getMemRqT ty (inst: ty Inst) (addr: ty PAddr) (data : ty (Bit Xlen)) :=
    STRUCT {
        "funct7" ::= funct7 _ inst ;
        "isLd" ::= isLd _ inst ;
        "isSt" ::= isSt _ inst ;
        "addr" ::= #addr ;
        "data" ::= #data }%kami_expr.
  
  Definition execMem := MethodSig "execMem" (Struct MemRqT): (Struct MemRpT).

  Definition priv :=
    SIN {

        Register "prv": Mode <- (natToWord 2 prvM)

        (* misa -- read only *)
        (* mvendorid -- read only *)
        (* marchid -- read only *)
        (* mimpid -- read only *)
        (* mhartid -- read only *)
                             
        (* mstatus *)
        with Register "uie": Bit 1 <- Default  (* 0 *)
        with Register "sie": Bit 1 <- Default  (* 1 *)
        with Register "mie": Bit 1 <- Default  (* 3 *)
                                 
        with Register "upie": Bit 1 <- Default (* 4 *)
        with Register "spie": Bit 1 <- Default (* 5 *)
        with Register "mpie": Bit 1 <- Default (* 7 *)
                                  
        with Register "spp": Bit 1 <- Default  (* 8 *)      (* WLRL *)
        with Register "mpp": Bit 2 <- Default  (* 12:11 *)  (* WLRL *)

        (* fs = 0, 14:13 *)
        (* xs = 0, 16:15 *)

        with Register "mprv": Bit 1 <- Default (* 17 *)
        with Register "sum": Bit 1 <- Default  (* 18 *)
        with Register "mxr": Bit 1 <- Default  (* 19 *)

        with Register "tvm": Bit 1 <- Default  (* 20 *)
        with Register "tw": Bit 1 <- Default   (* 21 *)
        with Register "tsr": Bit 1 <- Default  (* 22 *)

        (* uxl = 2, 33:32, WARL *)
        (* sxl = 2, 35:34, WARL *)

        (* sd = 0, 63 *)

        (* mtvec *)
        with Register "mtvec_base": Bit (Xlen - 2) <- Default     (* WARL *)
        with Register "mtvec_mode": Bit 2 <- Default              (* WARL *)

        with Register "medeleg": Bit Xlen <- Default            (* WARL *)
        with Register "mideleg": Bit Xlen <- Default            (* WARL *)

        (* mip *)
        with Register "usip": Bit 1 <- Default (* 0 *)
        with Register "ssip": Bit 1 <- Default (* 1 *)
        with Register "msip": Bit 1 <- Default (* 3 *)
        with Register "utip": Bit 1 <- Default (* 4 *)
        with Register "stip": Bit 1 <- Default (* 5 *)
        with Register "mtip": Bit 1 <- Default (* 7 *)
        with Register "ueip": Bit 1 <- Default (* 8 *)
        with Register "seip": Bit 1 <- Default (* 9 *)
        with Register "meip": Bit 1 <- Default (* 11 *)

        (* mie *)
        with Register "usie": Bit 1 <- Default (* 0 *)
        with Register "ssie": Bit 1 <- Default (* 1 *)
        with Register "msie": Bit 1 <- Default (* 3 *)
        with Register "utie": Bit 1 <- Default (* 4 *)
        with Register "stie": Bit 1 <- Default (* 5 *)
        with Register "mtie": Bit 1 <- Default (* 7 *)
        with Register "ueie": Bit 1 <- Default (* 8 *)
        with Register "seie": Bit 1 <- Default (* 9 *)
        with Register "meie": Bit 1 <- Default (* 11 *)

        with Register "mtime": Bit 64 <- Default
        with Register "mtimecmp": Bit 64 <- Default

        with Register "mcycle": Bit 64 <- Default
        with Register "minstret": Bit 64 <- Default

        with Register "hpmcounter": Vector (Bit 64) 5 <- Default (* WARL *)
        with Register "mhpmevent": Vector (Bit Xlen) 5 <- Default

        with Register "mcounteren": Bit 32 <- Default

        with Register "mscratch": Bit Xlen <- Default

        with Register "mepc": Bit Xlen <- Default

        with Register "mcause": Bit Xlen <- Default (* WLRL *)

        with Register "mtval": Bit Xlen <- Default

        (* sstatus = mstatus, with appropriate permissions *)

        (* stvec *)
        with Register "stvec_base": Bit (Xlen - 2) <- Default     (* WARL *)
        with Register "stvec_mode": Bit 2 <- Default              (* WARL *)

        (* sip, sie = mip, mie, with appropriate permissions *)

        (* ?? stime, stimecmp, scycle, sinstret, shpmcounter, shpmevent ?? *)
                                        
        with Register "scounteren": Bit 32 <- Default

        with Register "sscratch": Bit Xlen <- Default

        with Register "sepc": Bit Xlen <- Default

        with Register "scause": Bit Xlen <- Default (* WLRL *)

        with Register "stval": Bit Xlen <- Default

        (* satp *)
        with Register "satp_mode": Bit 1 <- Default (* WARL *)
        with Register "satp_asid": Bit 9 <- Default (* WARL *)
        with Register "satp_ppn": Bit 22 <- Default (* WARL *)
                                   
        with Method memPriv (inp: Struct MemPrivT):
               (Struct CExec) :=
          LET pcVal <- #inp!MemPrivT@.pc;
          LET instVToPRpVal <- #inp!MemPrivT@.instVToPRp;
          LET instVal <- #inp!MemPrivT@.inst;
          LET execVal <- #inp!MemPrivT@.exec;
          LET memVToPRpVal <- #inp!MemPrivT@.memVToPRp ;

          (* If (opcode _ instVal == $$ SYSTEM) *)
          (* then ( *)
          (*     Ret $$ Default *)
          (*   ) *)
          (* else ( *)
          (*     Ret ((STRUCT { *)
          (*               "isTrap" ::= $$ true ; *)
          (*               "isInterrupt" ::= $$ false ; *)
          (*               "trapValue" ::= (IF #instVToPRpVal!VToPRp@.exception *)
          (*                                then $ InstPageFault *)
          (*                                else $ 0) }): (Struct Trap) @ _) *)
          (*   ) as trap; *)
          LET trap : (Struct Trap) <- $$ Default ;

          If #trap!Trap@.isTrap
          then (
               Read prv: Mode <- "prv";
               Read medeleg : Bit Xlen <- "medeleg";
               Read mideleg : Bit Xlen <- "mideleg";
               
               Read mtvec_base: Bit (Xlen - 2) <- "mtvec_base";
               Read mtvec_mode: Bit 2 <- "mtvec_mode";
               LET mtvec <- {#mtvec_base, #mtvec_mode};

               Read stvec_base: Bit (Xlen - 2) <- "stvec_base";
               Read stvec_mode: Bit 2 <- "stvec_mode";
               LET stvec <- {#stvec_base, #stvec_mode};

               LET delegToS <- (#prv <= $ prvS) &&
                   (((IF #trap!Trap@.isInterrupt then #mideleg else #medeleg)
                       >> (#trap!Trap@.trapValue)) ~& $ 1) != $ 0;

               Read uie <- "uie";
               Read sie <- "sie";
               Read mie: Bit 1 <- "mie";

               LET exceptionInfo <- getExceptionInfo 
                   #trap!Trap@.trapValue
                   #pcVal
                   #instVal
                   #execVal!Exec@.memVAddr;
               
               If #delegToS
               then (
                   Write "sepc" <- #pcVal;
                   Write "scause" <- toCauseCsr _ trap;
                   Write "stval" <- #exceptionInfo;
                   Write "spp" <- UniBit (ZeroExtendTrunc _ 1) #prv;
                   Write "spie" <- (IF (#prv == $ prvU)
                                    then #uie
                                    else #sie);
                   Write "sie": Bit 1 <- $ 0;
                   Write "prv": Mode <- $ prvS;
                   Ret #stvec
                 )
               else (
                   Write "mepc" <- #pcVal;
                   Write "mcause" <- toCauseCsr _ trap;

                   Write "mtval" <- #exceptionInfo;

                   Write "mpp" <- #prv;
                   Write "mpie" <- (IF #prv == $ prvU
                                    then #uie
                                    else (IF #prv == $ prvS
                                          then #sie
                                          else #mie));
                   Write "mie": Bit 1 <- $ 0;
                   Write "prv": Mode <- $ prvM;
                   Ret #mtvec
                 ) as nextPcVal;
                 Ret ((STRUCT {
                           exception ::= $$ true;
                           nextPc ::= #nextPcVal;
                           dst ::= #execVal!Exec@.dst }): ((Struct CExec) @ _))
            )
        else
          (
            If (isSome #memVToPRpVal)
            then (
                LET pAddrVal <- (getSome #memVToPRpVal)!VToPRp@.pAddr;
                LET dataVal <- #execVal!Exec@.data;
                Call ldVal <- execMem (getMemRqT _ instVal pAddrVal dataVal);
                Ret #ldVal!MemRpT@.data
              )
            else (
                Ret #execVal!Exec@.dst
              )
            as dstVal;
            Ret ((STRUCT {
                      exception ::= $$ false ;
                      nextPc ::= #execVal!Exec@.nextPc ;
                      dst ::= #dstVal
                     }): ((Struct CExec) @ _))
          )
          as retVal;
        Ret #retVal
      }.

  Eval compute in (natToWord 3 1).

  Print Scopes.

  (* MUST CHECK HERE ONWARDS *)
  
  Definition execLongLatFn ty (pc: ty VAddr) (inst: ty Inst) (src1 src2: ty (Bit Xlen))
    : ((Struct Exec) @ ty) :=
    STRUCT {
        data ::= $$ Default ;
        memVAddr ::= $$ Default ;
        exception ::= getExecException pc inst ($$ Default) ;
        nextPc ::= $$ Default }%kami_expr.
  
  Definition next ty (pc: ty VAddr) := (#pc + $ 4)%kami_expr.

  (* Definition getNextBtb ty (btbState: ty BtbState) (pc: ty VAddr) := *)
  (*   let btbIndex := UniBit (Trunc BtbSz 2) *)
  (*                          (UniBit (Trunc (BtbSz + 2) (VAddrSz - (BtbSz + 2))) #pc) in *)
  (*   (IF #btbState@[btbIndex]!(opt (Struct (Pair (Bit BtbTagSz) BtbData)))@.valid && *)
  (*       (#btbState@[btbIndex]!(opt (Struct (Pair (Bit BtbTagSz) BtbData)))@.data! *)
  (*         (Pair (Bit BtbTagSz) BtbData)@.fst == *)
  (*        (UniBit (TruncLsb (BtbSz + 2) (VAddrSz - (BtbSz + 2))) #pc)) *)
  (*    then {#btbState@[btbIndex]!(opt (Struct (Pair (Bit BtbTagSz) BtbData)))@.data! *)
  (*           (Pair (Bit BtbTagSz) BtbData)@.snd, ($$ Default) : (Bit 2) @ ty } *)
  (*    else #pc + $ 4). *)

  (* Definition updBtb ty (btbState: ty BtbState) (pc: ty VAddr) (isException: ty Bool) *)
  (*            (nextPcVal: ty VAddr) := *)
  (*   let btbIndex := UniBit (Trunc BtbSz 2) *)
  (*                          (UniBit (Trunc (BtbSz + 2) (VAddrSz - (BtbSz + 2))) #pc) in *)
  (*   #btbState@[btbIndex <- *)
  (*                       (IF (#nextPcVal != (#pc + $ 4)) *)
  (*                        then STRUCT { *)
  (*                                 valid ::= $$ true; *)
  (*                                 data ::= STRUCT { *)
  (*                                        fst ::= UniBit (TruncLsb (BtbSz + 2) *)
  (*                                                                 (VAddrSz - (BtbSz + 2))) #pc; *)
  (*                                        snd ::= UniBit (TruncLsb 2 BtbDataSz) #nextPcVal } *)
  (*                               } *)
  (*                        else STRUCT { *)
  (*                                 valid ::= $$ false; *)
  (*                                 data ::= $$ Default *)
  (*                               } *)
  (*             )]. *)

  (* Definition getNextBp ty (bpState: ty BpState) (pc: ty VAddr) := *)
  (*   let bpIndex := UniBit (Trunc BpSz 2) *)
  (*                          (UniBit (Trunc (BpSz + 2) (VAddrSz - (BpSz + 2))) #pc) in *)
  (*   (IF #bpState@[bpIndex]!(opt (Struct (Pair (Bit BpTagSz) BpData)))@.valid && *)
  (*       (#bpState@[bpIndex]!(opt (Struct (Pair (Bit BpTagSz) BpData)))@.data! *)
  (*         (Pair (Bit BpTagSz) BpData)@.fst == *)
  (*        (UniBit (TruncLsb (BpSz + 2) (VAddrSz - (BpSz + 2))) #pc)) *)
  (*    then {#bpState@[bpIndex]!(opt (Struct (Pair (Bit BpTagSz) BpData)))@.data! *)
  (*           (Pair (Bit BpTagSz) BpData)@.snd, ($$ Default) : (Bit 2) @ ty } *)
  (*    else #pc + $ 4). *)

  (* Definition updBp ty (bpState: ty BpState) (pc: ty VAddr) (isException: ty Bool) *)
  (*            (nextPcVal: ty VAddr) := *)
  (*   let bpIndex := UniBit (Trunc BpSz 2) *)
  (*                          (UniBit (Trunc (BpSz + 2) (VAddrSz - (BpSz + 2))) #pc) in *)
  (*   #bpState@[bpIndex <- *)
  (*                       (IF (#nextPcVal != (#pc + $ 4)) *)
  (*                        then STRUCT { *)
  (*                                 valid ::= $$ true; *)
  (*                                 data ::= STRUCT { *)
  (*                                        fst ::= UniBit (TruncLsb (BpSz + 2) *)
  (*                                                                 (VAddrSz - (BpSz + 2))) #pc; *)
  (*                                        snd ::= UniBit (TruncLsb 2 BpDataSz) #nextPcVal } *)
  (*                               } *)
  (*                        else STRUCT { *)
  (*                                 valid ::= $$ false; *)
  (*                                 data ::= $$ Default *)
  (*                               } *)
  (*             )]. *)


  Definition BtbSz := 10.
  Definition BpSz := 20.

  Definition BtbTagSz := (VAddrSz - (BtbSz + 2))%nat.
  Definition BtbDataSz := (VAddrSz - 2)%nat.
  Definition BtbData := Bit BtbDataSz.

  Definition BtbState := Vector (optT (Struct (Pair (Bit BtbTagSz) BtbData))) BtbSz.
  Definition BpState := Vector (Bit 2) BpSz.
  
  Definition BtbInit := getDefaultConst BtbState.
  Definition BpInit := getDefaultConst BpState.

  Close Scope kami_expr.
End RV64.
