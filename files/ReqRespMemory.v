Require Import Bool String List Arith.
Require Import Omega.
Require Import micromega.Lia.
Require Import Kami.
Require Import Lib.Indexer.
Require Import Bsvtokami.

Require Import FunctionalExtensionality.

Set Implicit Arguments.


Require Import FIFO.
Require Import Serialize.
(* * interface ReqRespMemory#(logBytesPerWord, logNumWords) *)
Record ReqRespMemory := {
    ReqRespMemory'modules: Modules;
    ReqRespMemory'req : string;
    ReqRespMemory'resp : string;
}.

(* * interface ReqRespMemoryExternalPort#(logBytesPerWord, logNumWords) *)
Record ReqRespMemoryExternalPort := {
    ReqRespMemoryExternalPort'modules: Modules;
    ReqRespMemoryExternalPort'req : string;
    ReqRespMemoryExternalPort'resp : string;
}.

(* * interface ReqRespMemoryBridge#(logBytesPerWord, logNumWords) *)
Record ReqRespMemoryBridge := {
    ReqRespMemoryBridge'modules: Modules;
    ReqRespMemoryBridge'mem_ifc : ReqRespMemory;
    ReqRespMemoryBridge'ext_ifc : ReqRespMemoryExternalPort;
}.

Module module'mkReqRespMemoryBridge.
    Section Section'mkReqRespMemoryBridge.
    Variable logBytesPerWord : Kind.
    Variable logNumWords : Kind.
    Variable instancePrefix: string.
    Variable wordSz: nat.
    Variable bytesPerWord: nat.
    Hypothesis HDiv: (8 = wordSz / bytesPerWord)%nat.
    Variable TExp#(logBytesPerWord): nat.
    Variable TMul#(bytesPerWord,8): nat.
        (* method bindings *)
    Let reqFifo := mkLFIFO (Tuple3 (Bit bytesPerWord) (Bit logNumWords) (Bit wordSz)) (instancePrefix--"reqFifo").
    Let respFifo := mkLFIFO (Bit wordSz) (instancePrefix--"respFifo").
    Let instance'tuple3_Bit_TExp_logBytesPerWord___Bit_logNumWords__Bit_TMul_TExp_logBytesPerWord__8__ := function'tuple3 (Bit (exp2 logBytesPerWord)) (Bit logNumWords) (Bit (TMul (exp2 logBytesPerWord) 8)) (instancePrefix--"tuple3_Bit_TExp_logBytesPerWord___Bit_logNumWords__Bit_TMul_TExp_logBytesPerWord__8__").
    Let tuple3_Bit_TExp_logBytesPerWord___Bit_logNumWords__Bit_TMul_TExp_logBytesPerWord__8__ := Interface'tuple3'tuple3 instance'tuple3_Bit_TExp_logBytesPerWord___Bit_logNumWords__Bit_TMul_TExp_logBytesPerWord__8__.
    (* instance methods *)
    Let reqFifodeq : string := (FIFO'deq reqFifo).
    Let reqFifoenq : string := (FIFO'enq reqFifo).
    Let reqFifofirst : string := (FIFO'first reqFifo).
    Let respFifodeq : string := (FIFO'deq respFifo).
    Let respFifoenq : string := (FIFO'enq respFifo).
    Let respFifofirst : string := (FIFO'first respFifo).
    Definition mkReqRespMemoryBridgeModule: Modules.
        refine  (BKMODULE {
        (BKMod (FIFO'modules reqFifo :: nil))
    with (BKMod (FIFO'modules respFifo :: nil))
    with Method instancePrefix--"req" (byte_write_en : (Bit (exp2 logBytesPerWord))) (word_addr : (Bit logNumWords)) (data : (Bit (TMul (exp2 logBytesPerWord) 8))) : Void :=
    (
CallM call16 : Tuple3 t1 t2 t3 <-  tuple3_Bit_TExp_logBytesPerWord___Bit_logNumWords__Bit_TMul_TExp_logBytesPerWord__8__ (#byte_write_en : Bit (exp2 logBytesPerWord)) (#word_addr : Bit logNumWords) (#data : Bit (TMul (exp2 logBytesPerWord) 8));
CallM call15 : Void <-  reqFifoenq (#call16 : Tuple3 (Bit bytesPerWord) (Bit logNumWords) (Bit wordSz));
        Retv    )

    with Method instancePrefix--"resp" () : (Bit (TMul (exp2 logBytesPerWord) 8)) :=
    (
(#respFifo ! FIFOFields @. "deq");
        Ret (#respFifo ! FIFOFields @. "first")    )

    with Method instancePrefix--"req" () : (Tuple3 (Bit (exp2 logBytesPerWord)) (Bit logNumWords) (Bit (TMul (exp2 logBytesPerWord) 8))) :=
    (
(#reqFifo ! FIFOFields @. "deq");
        Ret (#reqFifo ! FIFOFields @. "first")    )

    with Method instancePrefix--"resp" (x : (Bit (TMul (exp2 logBytesPerWord) 8))) : Void :=
    (
CallM call17 : tvar1678 <-  respFifoenq (#x : Bit wordSz);
        Retv    )

    }); abstract omega. Qed. (* mkReqRespMemoryBridge *)

(* Module mkReqRespMemoryBridge type Module#(ReqRespMemoryBridge#(logBytesPerWord, logNumWords)) return type ReqRespMemoryBridge#(logBytesPerWord, logNumWords) *)
    Definition mkReqRespMemoryBridge := Build_ReqRespMemoryBridge mkReqRespMemoryBridgeModule%kami (instancePrefix--"ext_ifc") (instancePrefix--"mem_ifc").
    End Section'mkReqRespMemoryBridge.
End module'mkReqRespMemoryBridge.

Definition mkReqRespMemoryBridge := module'mkReqRespMemoryBridge.mkReqRespMemoryBridge.
Hint Unfold mkReqRespMemoryBridge : ModuleDefs.
Hint Unfold module'mkReqRespMemoryBridge.mkReqRespMemoryBridge : ModuleDefs.
Hint Unfold module'mkReqRespMemoryBridge.mkReqRespMemoryBridgeModule : ModuleDefs.

(* * interface ReqRespMemorySerDes#(logBytesPerWord, logNumWords) *)
Record ReqRespMemorySerDes := {
    ReqRespMemorySerDes'modules: Modules;
    ReqRespMemorySerDes'serial_req_tx : string;
    ReqRespMemorySerDes'serial_resp_rx : string;
}.

Module module'mkReqPacker.
    Section Section'mkReqPacker.
    Variable instancePrefix: string.
        (* method bindings *)
    Let instance'tpl_1_Tuple3_Bit_4__Bit_14__Bit_32___Bit_4_ := function'tpl_1 (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (Bit 4) (instancePrefix--"tpl_1_Tuple3_Bit_4__Bit_14__Bit_32___Bit_4_").
    Let tpl_1_Tuple3_Bit_4__Bit_14__Bit_32___Bit_4_ := Interface'tpl_1'tpl_1 instance'tpl_1_Tuple3_Bit_4__Bit_14__Bit_32___Bit_4_.
    Let instance'tpl_2_Tuple3_Bit_4__Bit_14__Bit_32___Bit_14_ := function'tpl_2 (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (Bit 14) (instancePrefix--"tpl_2_Tuple3_Bit_4__Bit_14__Bit_32___Bit_14_").
    Let tpl_2_Tuple3_Bit_4__Bit_14__Bit_32___Bit_14_ := Interface'tpl_2'tpl_2 instance'tpl_2_Tuple3_Bit_4__Bit_14__Bit_32___Bit_14_.
    Let instance'tpl_3_Tuple3_Bit_4__Bit_14__Bit_32___Bit_32_ := function'tpl_3 (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (Bit 32) (instancePrefix--"tpl_3_Tuple3_Bit_4__Bit_14__Bit_32___Bit_32_").
    Let tpl_3_Tuple3_Bit_4__Bit_14__Bit_32___Bit_32_ := Interface'tpl_3'tpl_3 instance'tpl_3_Tuple3_Bit_4__Bit_14__Bit_32___Bit_32_.
    Let instance'tuple3_Bit_4__Bit_14__Bit_32_ := function'tuple3 (Bit 4) (Bit 14) (Bit 32) (instancePrefix--"tuple3_Bit_4__Bit_14__Bit_32_").
    Let tuple3_Bit_4__Bit_14__Bit_32_ := Interface'tuple3'tuple3 instance'tuple3_Bit_4__Bit_14__Bit_32_.
    Definition mkReqPackerModule: Modules :=
         (BKMODULE {
        Method instancePrefix--"pack" (v : (Tuple3 (Bit 4) (Bit 14) (Bit 32))) : Bit 50 :=
    (
CallM v1 : Bit 4 (* varbinding *) <-  tpl_1_Tuple3_Bit_4__Bit_14__Bit_32___Bit_4_ (#v : Tuple3 (Bit 4) (Bit 14) (Bit 32));
CallM v2 : Bit 14 (* varbinding *) <-  tpl_2_Tuple3_Bit_4__Bit_14__Bit_32___Bit_14_ (#v : Tuple3 (Bit 4) (Bit 14) (Bit 32));
CallM v3 : Bit 32 (* varbinding *) <-  tpl_3_Tuple3_Bit_4__Bit_14__Bit_32___Bit_32_ (#v : Tuple3 (Bit 4) (Bit 14) (Bit 32));
        LET bits : Bit 50 <- (BinBit (Concat (4 + 14) 32) (BinBit (Concat (4) 14) #v1 #v2) #v3);
        Ret #bits    )

    with Method instancePrefix--"unpack" (bits : (Bit 50)) : Tuple3 (Bit 4) (Bit 14) (Bit 32) :=
    (
        LET v1 : Bit 4 <- (#bits$[49:46]@50);
        LET v2 : Bit 14 <- (#bits$[45:32]@50);
        LET v3 : Bit 32 <- (#bits$[31:0]@50);
CallM tpl : Tuple3 (Bit 4) (Bit 14) (Bit 32) (* varbinding *) <-  tuple3_Bit_4__Bit_14__Bit_32_ (#v1 : Bit 4) (#v2 : Bit 14) (#v3 : Bit 32);
        Ret #tpl    )

    }). (* mkReqPacker *)

(* Module mkReqPacker type Module#(Pack#(Tuple3#(Bit#(4), Bit#(14), Bit#(32)), 50)) return type Pack#(Tuple3#(Bit#(4), Bit#(14), Bit#(32)), 50) *)
    Definition mkReqPacker := Build_Pack mkReqPackerModule%kami (instancePrefix--"pack") (instancePrefix--"unpack").
    End Section'mkReqPacker.
End module'mkReqPacker.

Definition mkReqPacker := module'mkReqPacker.mkReqPacker.
Hint Unfold mkReqPacker : ModuleDefs.
Hint Unfold module'mkReqPacker.mkReqPacker : ModuleDefs.
Hint Unfold module'mkReqPacker.mkReqPackerModule : ModuleDefs.

Module module'mkBit32Packer.
    Section Section'mkBit32Packer.
    Variable instancePrefix: string.
    Definition mkBit32PackerModule: Modules :=
         (BKMODULE {
        Method instancePrefix--"pack" (v : (Bit 32)) : Bit 32 :=
    (
        Ret #v    )

    with Method instancePrefix--"unpack" (bits : (Bit 32)) : Bit 32 :=
    (
        Ret #bits    )

    }). (* mkBit32Packer *)

(* Module mkBit32Packer type Module#(Pack#(Bit#(32), 32)) return type Pack#(Bit#(32), 32) *)
    Definition mkBit32Packer := Build_Pack mkBit32PackerModule%kami (instancePrefix--"pack") (instancePrefix--"unpack").
    End Section'mkBit32Packer.
End module'mkBit32Packer.

Definition mkBit32Packer := module'mkBit32Packer.mkBit32Packer.
Hint Unfold mkBit32Packer : ModuleDefs.
Hint Unfold module'mkBit32Packer.mkBit32Packer : ModuleDefs.
Hint Unfold module'mkBit32Packer.mkBit32PackerModule : ModuleDefs.

Module module'mkReqRespMemorySerDes.
    Section Section'mkReqRespMemorySerDes.
    Variable instancePrefix: string.
    Variable proc_mem_ifc: ReqRespMemoryExternalPort.
        (* method bindings *)
    Let reqpacker := mkReqPacker (instancePrefix--"reqpacker").
    Let packer32 := mkBit32Packer (instancePrefix--"packer32").
    Let serialize := mkSerialize (50) (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (instancePrefix--"serialize") (reqpacker)%bk.
    Let deserialize := mkDeserialize (32) (Bit 32) (instancePrefix--"deserialize") (packer32)%bk.
    (* instance methods *)
    Let deserializeget : string := (Deserialize'get deserialize).
    Let deserializeput : string := (Deserialize'put deserialize).
    Let proc_mem_ifcreq : string := (ReqRespMemoryExternalPort'req proc_mem_ifc).
    Let proc_mem_ifcresp : string := (ReqRespMemoryExternalPort'resp proc_mem_ifc).
    Let serializeget : string := (Serialize'get serialize).
    Let serializeput : string := (Serialize'put serialize).
    Definition mkReqRespMemorySerDesModule: Modules :=
         (BKMODULE {
        (BKMod (Pack'modules reqpacker :: nil))
    with (BKMod (Pack'modules packer32 :: nil))
    with (BKMod (Serialize'modules serialize :: nil))
    with (BKMod (Deserialize'modules deserialize :: nil))
    with Rule instancePrefix--"serializeReq" :=
    (
               LET x : tvar1598 <- (#proc_mem_ifc ! ReqRespMemoryExternalPortFields @. "req");
       CallM call18 : Void <-  serializeput (#x : Tuple3 (Bit 4) (Bit 14) (Bit 32));
        Retv ) (* rule serializeReq *)
    with Rule instancePrefix--"deserializeResp" :=
    (
               LET x : tvar1599 <- (#deserialize ! DeserializeFields @. "get");
       CallM call19 : Void <-  proc_mem_ifcresp (#x : Bit (TMul (exp2 2) 8));
        Retv ) (* rule deserializeResp *)
    with Method instancePrefix--"serial_req_tx" () : (Bit 1) :=
    (
        LET x : tvar1601 <- (#serialize ! SerializeFields @. "get");
        Ret #x    )

    with Method instancePrefix--"serial_resp_rx" (x : (Bit 1)) : Void :=
    (
CallM call20 : Void <-  deserializeput (#x : Bit 1);
        Retv    )

    }). (* mkReqRespMemorySerDes *)

(* Module mkReqRespMemorySerDes type ReqRespMemoryExternalPort#(2, 14) -> Module#(ReqRespMemorySerDes#(2, 14)) return type ReqRespMemorySerDes#(2, 14) *)
    Definition mkReqRespMemorySerDes := Build_ReqRespMemorySerDes mkReqRespMemorySerDesModule%kami (instancePrefix--"serial_req_tx") (instancePrefix--"serial_resp_rx").
    End Section'mkReqRespMemorySerDes.
End module'mkReqRespMemorySerDes.

Definition mkReqRespMemorySerDes := module'mkReqRespMemorySerDes.mkReqRespMemorySerDes.
Hint Unfold mkReqRespMemorySerDes : ModuleDefs.
Hint Unfold module'mkReqRespMemorySerDes.mkReqRespMemorySerDes : ModuleDefs.
Hint Unfold module'mkReqRespMemorySerDes.mkReqRespMemorySerDesModule : ModuleDefs.

(* * interface ReqRespMemorySerDesMux#(logBytesPerWord, logNumWords) *)
Record ReqRespMemorySerDesMux := {
    ReqRespMemorySerDesMux'modules: Modules;
    ReqRespMemorySerDesMux'mem_ifc : ReqRespMemoryExternalPort;
    ReqRespMemorySerDesMux'serial_req_tx : string;
    ReqRespMemorySerDesMux'serial_resp_rx : string;
    ReqRespMemorySerDesMux'use_serial : string;
}.

Module module'mkReqRespMemorySerDesMux.
    Section Section'mkReqRespMemorySerDesMux.
    Variable instancePrefix: string.
    Variable proc_mem_ifc: ReqRespMemoryExternalPort.
        (* method bindings *)
    Let use_serial_wire := mkBypassWire (t1) (t2) (t3) (instancePrefix--"use_serial_wire").
    Let packer := mkReqPacker (instancePrefix--"packer").
    Let packer32 := mkBit32Packer (instancePrefix--"packer32").
    Let serialize := mkSerialize (50) (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (instancePrefix--"serialize") (packer)%bk.
    Let deserialize := mkDeserialize (32) (Bit 32) (instancePrefix--"deserialize") (packer32)%bk.
    Let use_serial_wire_write : string := (Reg'_write use_serial_wire).
    (* instance methods *)
    Let deserializeget : string := (Deserialize'get deserialize).
    Let deserializeput : string := (Deserialize'put deserialize).
    Let proc_mem_ifcreq : string := (ReqRespMemoryExternalPort'req proc_mem_ifc).
    Let proc_mem_ifcresp : string := (ReqRespMemoryExternalPort'resp proc_mem_ifc).
    Let serializeget : string := (Serialize'get serialize).
    Let serializeput : string := (Serialize'put serialize).
    Definition mkReqRespMemorySerDesMuxModule: Modules :=
         (BKMODULE {
        (BKMod (Wire'modules use_serial_wire :: nil))
    with (BKMod (Pack'modules packer :: nil))
    with (BKMod (Pack'modules packer32 :: nil))
    with (BKMod (Serialize'modules serialize :: nil))
    with (BKMod (Deserialize'modules deserialize :: nil))
    with Rule instancePrefix--"serializeReq" :=
    (

        Assert(#use_serial_wire);
               LET x : tvar1610 <- (#proc_mem_ifc ! ReqRespMemoryExternalPortFields @. "req");
       CallM call21 : Void <-  serializeput (#x : Tuple3 (Bit 4) (Bit 14) (Bit 32));
        Retv ) (* rule serializeReq *)
    with Rule instancePrefix--"deserializeResp" :=
    (

        Assert(#use_serial_wire);
               LET x : tvar1611 <- (#deserialize ! DeserializeFields @. "get");
       CallM call22 : Void <-  proc_mem_ifcresp (#x : Bit (TMul (exp2 2) 8));
        Retv ) (* rule deserializeResp *)
    with Method instancePrefix--"req" () : (Tuple3 (Bit 4) (Bit 14) (Bit 32)) :=
    (
        LET x : tvar1613 <- (#proc_mem_ifc ! ReqRespMemoryExternalPortFields @. "req");
        Ret #x    )

    with Method instancePrefix--"resp" (x : (Bit 32)) : Void :=
    (
CallM call23 : tvar1700 <-  proc_mem_ifcresp (#x : Bit (TMul (exp2 2) 8));
        Retv    )

    with Method instancePrefix--"serial_req_tx" () : (Bit 1) :=
    (
        LET x : tvar1616 <- (#serialize ! SerializeFields @. "get");
        Ret #x    )

    with Method instancePrefix--"serial_resp_rx" (x : (Bit 1)) : Void :=
    (
CallM call24 : Void <-  deserializeput (#x : Bit 1);
        Retv    )

    with Method instancePrefix--"use_serial" (x : Bool) : Void :=
    (
        CallM use_serial_wire_write ( #x : Bool );
        Retv    )

    }). (* mkReqRespMemorySerDesMux *)

(* Module mkReqRespMemorySerDesMux type ReqRespMemoryExternalPort#(2, 14) -> Module#(ReqRespMemorySerDesMux#(2, 14)) return type ReqRespMemorySerDesMux#(2, 14) *)
    Definition mkReqRespMemorySerDesMux := Build_ReqRespMemorySerDesMux mkReqRespMemorySerDesMuxModule%kami (instancePrefix--"mem_ifc") (instancePrefix--"serial_req_tx") (instancePrefix--"serial_resp_rx") (instancePrefix--"use_serial").
    End Section'mkReqRespMemorySerDesMux.
End module'mkReqRespMemorySerDesMux.

Definition mkReqRespMemorySerDesMux := module'mkReqRespMemorySerDesMux.mkReqRespMemorySerDesMux.
Hint Unfold mkReqRespMemorySerDesMux : ModuleDefs.
Hint Unfold module'mkReqRespMemorySerDesMux.mkReqRespMemorySerDesMux : ModuleDefs.
Hint Unfold module'mkReqRespMemorySerDesMux.mkReqRespMemorySerDesMuxModule : ModuleDefs.

(* * interface ReqRespMemoryOneWireSerDesMux#(logBytesPerWord, logNumWords) *)
Record ReqRespMemoryOneWireSerDesMux := {
    ReqRespMemoryOneWireSerDesMux'modules: Modules;
    ReqRespMemoryOneWireSerDesMux'mem_ifc : ReqRespMemoryExternalPort;
    ReqRespMemoryOneWireSerDesMux'serial_req_tx : string;
    ReqRespMemoryOneWireSerDesMux'serial_resp_rx : string;
    ReqRespMemoryOneWireSerDesMux'use_serial : string;
}.

Module module'mkMemReqOneWireSerialize.
    Section Section'mkMemReqOneWireSerialize.
    Variable instancePrefix: string.
        (* method bindings *)
    Let packer := mkReqPacker (instancePrefix--"packer").
    Let _m := mkOneWireSerialize (50) (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (instancePrefix--"_m") (packer)%bk.
    Definition mkMemReqOneWireSerializeModule: Modules :=
         (BKMODULE {
        (BKMod (Pack'modules packer :: nil))
    with (BKMod (OneWireSerialize'modules _m :: nil))
    with         Ret _m
    }). (* mkMemReqOneWireSerialize *)

(* Module mkMemReqOneWireSerialize type Module#(OneWireSerialize#(Tuple3#(Bit#(4), Bit#(14), Bit#(32)))) return type OneWireSerialize#(Tuple3#(Bit#(4), Bit#(14), Bit#(32))) *)
    Definition mkMemReqOneWireSerialize := Build_OneWireSerialize mkMemReqOneWireSerializeModule%kami (instancePrefix--"get") (instancePrefix--"put").
    End Section'mkMemReqOneWireSerialize.
End module'mkMemReqOneWireSerialize.

Definition mkMemReqOneWireSerialize := module'mkMemReqOneWireSerialize.mkMemReqOneWireSerialize.
Hint Unfold mkMemReqOneWireSerialize : ModuleDefs.
Hint Unfold module'mkMemReqOneWireSerialize.mkMemReqOneWireSerialize : ModuleDefs.
Hint Unfold module'mkMemReqOneWireSerialize.mkMemReqOneWireSerializeModule : ModuleDefs.

Module module'mkMemRespOneWireDeserialize.
    Section Section'mkMemRespOneWireDeserialize.
    Variable instancePrefix: string.
        (* method bindings *)
    Let packer32 := mkBit32Packer (instancePrefix--"packer32").
    Let _m := mkOneWireDeserialize (32) (Bit 32) (instancePrefix--"_m") (packer32)%bk.
    Definition mkMemRespOneWireDeserializeModule: Modules :=
         (BKMODULE {
        (BKMod (Pack'modules packer32 :: nil))
    with (BKMod (OneWireDeserialize'modules _m :: nil))
    with         Ret _m
    }). (* mkMemRespOneWireDeserialize *)

(* Module mkMemRespOneWireDeserialize type Module#(OneWireDeserialize#(Bit#(32))) return type OneWireDeserialize#(Bit#(32)) *)
    Definition mkMemRespOneWireDeserialize := Build_OneWireDeserialize mkMemRespOneWireDeserializeModule%kami (instancePrefix--"get") (instancePrefix--"put").
    End Section'mkMemRespOneWireDeserialize.
End module'mkMemRespOneWireDeserialize.

Definition mkMemRespOneWireDeserialize := module'mkMemRespOneWireDeserialize.mkMemRespOneWireDeserialize.
Hint Unfold mkMemRespOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkMemRespOneWireDeserialize.mkMemRespOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkMemRespOneWireDeserialize.mkMemRespOneWireDeserializeModule : ModuleDefs.

Module module'mkReqRespMemoryOneWireSerDesMux.
    Section Section'mkReqRespMemoryOneWireSerDesMux.
    Variable instancePrefix: string.
    Variable proc_mem_ifc: ReqRespMemoryExternalPort.
        (* method bindings *)
    Let use_serial_wire := mkBypassWire (t1) (t2) (t3) (instancePrefix--"use_serial_wire").
    Let packer := mkReqPacker (instancePrefix--"packer").
    Let serialize := mkMemReqOneWireSerialize (instancePrefix--"serialize").
    Let deserialize := mkMemRespOneWireDeserialize (instancePrefix--"deserialize").
    Let use_serial_wire_write : string := (Reg'_write use_serial_wire).
    (* instance methods *)
    Let deserializeget : string := (OneWireDeserialize'get deserialize).
    Let deserializeput : string := (OneWireDeserialize'put deserialize).
    Let proc_mem_ifcreq : string := (ReqRespMemoryExternalPort'req proc_mem_ifc).
    Let proc_mem_ifcresp : string := (ReqRespMemoryExternalPort'resp proc_mem_ifc).
    Let serializeget : string := (OneWireSerialize'get serialize).
    Let serializeput : string := (OneWireSerialize'put serialize).
    Definition mkReqRespMemoryOneWireSerDesMuxModule: Modules :=
         (BKMODULE {
        (BKMod (Wire'modules use_serial_wire :: nil))
    with (BKMod (Pack'modules packer :: nil))
    with (BKMod (OneWireSerialize'modules serialize :: nil))
    with (BKMod (OneWireDeserialize'modules deserialize :: nil))
    with Rule instancePrefix--"serializeReq" :=
    (

        Assert(#use_serial_wire);
               LET x : tvar1631 <- (#proc_mem_ifc ! ReqRespMemoryExternalPortFields @. "req");
       CallM call25 : Void <-  serializeput (#x : Tuple3 (Bit 4) (Bit 14) (Bit 32));
        Retv ) (* rule serializeReq *)
    with Rule instancePrefix--"deserializeResp" :=
    (

        Assert(#use_serial_wire);
               LET x : tvar1632 <- (#deserialize ! OneWireDeserializeFields @. "get");
       CallM call26 : Void <-  proc_mem_ifcresp (#x : Bit (TMul (exp2 2) 8));
        Retv ) (* rule deserializeResp *)
    with Method instancePrefix--"req" () : (Tuple3 (Bit 4) (Bit 14) (Bit 32)) :=
    (
        LET x : tvar1634 <- (#proc_mem_ifc ! ReqRespMemoryExternalPortFields @. "req");
        Ret #x    )

    with Method instancePrefix--"resp" (x : (Bit 32)) : Void :=
    (
CallM call27 : tvar1712 <-  proc_mem_ifcresp (#x : Bit (TMul (exp2 2) 8));
        Retv    )

    with Method instancePrefix--"serial_req_tx" () : Bit 1 :=
    (
        LET x : Bit 1 = (#serialize ! OneWireSerializeFields @. "get");
        Ret (IF #use_serial_wire then #x else $0)    )

    with Method instancePrefix--"serial_resp_rx" (x : (Bit 1)) : Void :=
    (
CallM call28 : Void <-  deserializeput ((IF #use_serial_wire then #x else $0) : Bit 1);
        Retv    )

    with Method instancePrefix--"use_serial" (x : Bool) : Void :=
    (
        CallM use_serial_wire_write ( #x : Bool );
        Retv    )

    }). (* mkReqRespMemoryOneWireSerDesMux *)

(* Module mkReqRespMemoryOneWireSerDesMux type ReqRespMemoryExternalPort#(2, 14) -> Module#(ReqRespMemoryOneWireSerDesMux#(2, 14)) return type ReqRespMemoryOneWireSerDesMux#(2, 14) *)
    Definition mkReqRespMemoryOneWireSerDesMux := Build_ReqRespMemoryOneWireSerDesMux mkReqRespMemoryOneWireSerDesMuxModule%kami (instancePrefix--"mem_ifc") (instancePrefix--"serial_req_tx") (instancePrefix--"serial_resp_rx") (instancePrefix--"use_serial").
    End Section'mkReqRespMemoryOneWireSerDesMux.
End module'mkReqRespMemoryOneWireSerDesMux.

Definition mkReqRespMemoryOneWireSerDesMux := module'mkReqRespMemoryOneWireSerDesMux.mkReqRespMemoryOneWireSerDesMux.
Hint Unfold mkReqRespMemoryOneWireSerDesMux : ModuleDefs.
Hint Unfold module'mkReqRespMemoryOneWireSerDesMux.mkReqRespMemoryOneWireSerDesMux : ModuleDefs.
Hint Unfold module'mkReqRespMemoryOneWireSerDesMux.mkReqRespMemoryOneWireSerDesMuxModule : ModuleDefs.

(* * interface ReqRespMemoryComboOneWireSerDes#(logBytesPerWord, logNumWords) *)
Record ReqRespMemoryComboOneWireSerDes := {
    ReqRespMemoryComboOneWireSerDes'modules: Modules;
    ReqRespMemoryComboOneWireSerDes'proc_ifc : ReqRespMemory;
    ReqRespMemoryComboOneWireSerDes'ext_ifc : ReqRespMemoryOneWireSerDesMux;
}.

Module module'mkMemReqComboOneWireSerialize.
    Section Section'mkMemReqComboOneWireSerialize.
    Variable instancePrefix: string.
    Variable do_parallel: ConstT Bool.
        (* method bindings *)
    Let packer := mkReqPacker (instancePrefix--"packer").
    Let _m := mkComboOneWireSerialize (50) (Tuple3 (Bit 4) (Bit 14) (Bit 32)) (instancePrefix--"_m") (packer)%bk (do_parallel)%bk.
    Definition mkMemReqComboOneWireSerializeModule: Modules :=
         (BKMODULE {
        (BKMod (Pack'modules packer :: nil))
    with (BKMod (ComboOneWireSerialize'modules _m :: nil))
    with         Ret _m
    }). (* mkMemReqComboOneWireSerialize *)

(* Module mkMemReqComboOneWireSerialize type Bool -> Module#(ComboOneWireSerialize#(Tuple3#(Bit#(4), Bit#(14), Bit#(32)))) return type ComboOneWireSerialize#(Tuple3#(Bit#(4), Bit#(14), Bit#(32))) *)
    Definition mkMemReqComboOneWireSerialize := Build_ComboOneWireSerialize mkMemReqComboOneWireSerializeModule%kami (instancePrefix--"get_parallel") (instancePrefix--"get_serial") (instancePrefix--"put").
    End Section'mkMemReqComboOneWireSerialize.
End module'mkMemReqComboOneWireSerialize.

Definition mkMemReqComboOneWireSerialize := module'mkMemReqComboOneWireSerialize.mkMemReqComboOneWireSerialize.
Hint Unfold mkMemReqComboOneWireSerialize : ModuleDefs.
Hint Unfold module'mkMemReqComboOneWireSerialize.mkMemReqComboOneWireSerialize : ModuleDefs.
Hint Unfold module'mkMemReqComboOneWireSerialize.mkMemReqComboOneWireSerializeModule : ModuleDefs.

Module module'mkMemRespComboOneWireDeserialize.
    Section Section'mkMemRespComboOneWireDeserialize.
    Variable instancePrefix: string.
    Variable do_parallel: ConstT Bool.
        (* method bindings *)
    Let packer := mkReqPacker (instancePrefix--"packer").
    Let packer32 := mkBit32Packer (instancePrefix--"packer32").
    Let _m := mkComboOneWireDeserialize (32) (Bit 32) (instancePrefix--"_m") (packer32)%bk (do_parallel)%bk.
    Definition mkMemRespComboOneWireDeserializeModule: Modules :=
         (BKMODULE {
        (BKMod (Pack'modules packer :: nil))
    with (BKMod (Pack'modules packer32 :: nil))
    with (BKMod (ComboOneWireDeserialize'modules _m :: nil))
    with         Ret _m
    }). (* mkMemRespComboOneWireDeserialize *)

(* Module mkMemRespComboOneWireDeserialize type Bool -> Module#(ComboOneWireDeserialize#(Bit#(32))) return type ComboOneWireDeserialize#(Bit#(32)) *)
    Definition mkMemRespComboOneWireDeserialize := Build_ComboOneWireDeserialize mkMemRespComboOneWireDeserializeModule%kami (instancePrefix--"get") (instancePrefix--"put_parallel") (instancePrefix--"put_serial").
    End Section'mkMemRespComboOneWireDeserialize.
End module'mkMemRespComboOneWireDeserialize.

Definition mkMemRespComboOneWireDeserialize := module'mkMemRespComboOneWireDeserialize.mkMemRespComboOneWireDeserialize.
Hint Unfold mkMemRespComboOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkMemRespComboOneWireDeserialize.mkMemRespComboOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkMemRespComboOneWireDeserialize.mkMemRespComboOneWireDeserializeModule : ModuleDefs.

Module module'mkReqRespMemoryComboOneWireSerDes.
    Section Section'mkReqRespMemoryComboOneWireSerDes.
    Variable instancePrefix: string.
        (* method bindings *)
    Let use_serial_wire := mkBypassWire (t1) (t2) (t3) (instancePrefix--"use_serial_wire").
    Let serialize := mkMemReqComboOneWireSerialize (instancePrefix--"serialize") ((!use_serial_wire))%bk.
    Let deserialize := mkMemRespComboOneWireDeserialize (instancePrefix--"deserialize") ((!use_serial_wire))%bk.
    Let instance'tuple3_Bit_4__Bit_14__Bit_32_ := function'tuple3 (Bit 4) (Bit 14) (Bit 32) (instancePrefix--"tuple3_Bit_4__Bit_14__Bit_32_").
    Let tuple3_Bit_4__Bit_14__Bit_32_ := Interface'tuple3'tuple3 instance'tuple3_Bit_4__Bit_14__Bit_32_.
    Let instance'unpack_Tuple3_Bit_4__Bit_14__Bit_32___tvar1662 := function'unpack (Tuple3 (Bit 4) (Bit 14) (Bit 32)) tvar1662 (instancePrefix--"unpack_Tuple3_Bit_4__Bit_14__Bit_32___tvar1662").
    Let unpack_Tuple3_Bit_4__Bit_14__Bit_32___tvar1662 := Interface'unpack'unpack instance'unpack_Tuple3_Bit_4__Bit_14__Bit_32___tvar1662.
    Let use_serial_wire_write : string := (Reg'_write use_serial_wire).
    (* instance methods *)
    Let deserializeget : string := (ComboOneWireDeserialize'get deserialize).
    Let deserializeput_parallel : string := (ComboOneWireDeserialize'put_parallel deserialize).
    Let deserializeput_serial : string := (ComboOneWireDeserialize'put_serial deserialize).
    Let serializeget_parallel : string := (ComboOneWireSerialize'get_parallel serialize).
    Let serializeget_serial : string := (ComboOneWireSerialize'get_serial serialize).
    Let serializeput : string := (ComboOneWireSerialize'put serialize).
    Definition mkReqRespMemoryComboOneWireSerDesModule: Modules :=
         (BKMODULE {
        (BKMod (Wire'modules use_serial_wire :: nil))
    with (BKMod (ComboOneWireSerialize'modules serialize :: nil))
    with (BKMod (ComboOneWireDeserialize'modules deserialize :: nil))
    with Method instancePrefix--"req" (byte_write_en : (Bit 4)) (word_addr : (Bit 14)) (data : (Bit 32)) : Void :=
    (
CallM call30 : Tuple3 t1 t2 t3 <-  tuple3_Bit_4__Bit_14__Bit_32_ (#byte_write_en : Bit 4) (#word_addr : Bit 14) (#data : Bit 32);
CallM call29 : Void <-  serializeput (#call30 : Tuple3 (Bit 4) (Bit 14) (Bit 32));
        Retv    )

    with Method instancePrefix--"resp" () : (Bit 32) :=
    (
        LET x : tvar1657 <- (#deserialize ! ComboOneWireDeserializeFields @. "get");
        Ret #x    )

    with Method instancePrefix--"req" () : (Tuple3 (Bit 4) (Bit 14) (Bit 32)) :=
    (
CallM x : Tuple3 (Bit 4) (Bit 14) (Bit 32) (* varbinding *) <-  unpack_Tuple3_Bit_4__Bit_14__Bit_32___tvar1662 ($0 : Bit tvar1662);
        If (!#use_serial_wire) then (
        
        Assign x <- (#serialize ! ComboOneWireSerializeFields @. "get_parallel");
        Retv) else (
            Retv
        ) as retval
;
        Ret #x    )

    with Method instancePrefix--"resp" (x : (Bit 32)) : Void :=
    (
        If (!#use_serial_wire) then (
        
CallM call31 : tvar1728 <-  deserializeput_parallel (#x : Bit 32);
        Retv) else (
            Retv
        ) as retval
;
        Ret #retval    )

    with Method instancePrefix--"serial_req_tx" () : Bit 1 :=
    (
        LET x : Bit 1 = (#serialize ! ComboOneWireSerializeFields @. "get_serial");
        Ret (IF #use_serial_wire then #x else $0)    )

    with Method instancePrefix--"serial_resp_rx" (x : (Bit 1)) : Void :=
    (
CallM call32 : Void <-  deserializeput_serial ((IF #use_serial_wire then #x else $0) : Bit 1);
        Retv    )

    with Method instancePrefix--"use_serial" (x : Bool) : Void :=
    (
        CallM use_serial_wire_write ( #x : Bool );
        Retv    )

    }). (* mkReqRespMemoryComboOneWireSerDes *)

(* Module mkReqRespMemoryComboOneWireSerDes type Module#(ReqRespMemoryComboOneWireSerDes#(2, 14)) return type ReqRespMemoryComboOneWireSerDes#(2, 14) *)
    Definition mkReqRespMemoryComboOneWireSerDes := Build_ReqRespMemoryComboOneWireSerDes mkReqRespMemoryComboOneWireSerDesModule%kami (instancePrefix--"ext_ifc") (instancePrefix--"proc_ifc").
    End Section'mkReqRespMemoryComboOneWireSerDes.
End module'mkReqRespMemoryComboOneWireSerDes.

Definition mkReqRespMemoryComboOneWireSerDes := module'mkReqRespMemoryComboOneWireSerDes.mkReqRespMemoryComboOneWireSerDes.
Hint Unfold mkReqRespMemoryComboOneWireSerDes : ModuleDefs.
Hint Unfold module'mkReqRespMemoryComboOneWireSerDes.mkReqRespMemoryComboOneWireSerDes : ModuleDefs.
Hint Unfold module'mkReqRespMemoryComboOneWireSerDes.mkReqRespMemoryComboOneWireSerDesModule : ModuleDefs.

