Require Import Bool String List Arith.
Require Import Omega.
Require Import micromega.Lia.
Require Import Kami.
Require Import Lib.Indexer.
Require Import Bsvtokami.

Require Import FunctionalExtensionality.

Set Implicit Arguments.


(* * interface Pack#(t, tSz) *)
Record Pack := {
    Pack'modules: Modules;
    Pack'pack : string;
    Pack'unpack : string;
}.

(* * interface Serialize#(t) *)
Record Serialize := {
    Serialize'modules: Modules;
    Serialize'put : string;
    Serialize'get : string;
}.

Module module'mkSerialize.
    Section Section'mkSerialize.
    Variable msz : nat.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable packer: Pack.
    Variable tSz: nat.
    Hypothesis HPos: (tSz > 0)%nat.
    (* let bindings *)
    Let counter_init_val : ConstT (Bit (msz + 1)) := ($0)%kami.
        (* method bindings *)
    Let shift_reg := mkRegU (Bit msz) (instancePrefix--"shift_reg").
    Let counter := mkReg (Bit (msz + 1)) (instancePrefix--"counter") (counter_init_val)%bk.
    Let shift_reg_write : string := (Reg'_write shift_reg).
    Let counter_write : string := (Reg'_write counter).
    Let counter_read : string := (Reg'_read counter).
    Let shift_reg_read : string := (Reg'_read shift_reg).
    (* instance methods *)
    Let packerpack : string := (Pack'pack packer).
    Definition mkSerializeModule: Modules.
        refine  (BKMODULE {
        (BKMod (Reg'modules shift_reg :: nil))
    with (BKMod (Reg'modules counter :: nil))
    with Method instancePrefix--"put" (x : t) : Void :=
    (
CallM new_shift_reg : Bit msz (* varbinding *) <-  packerpack (#x : t);
LET new_counter : (Bit (msz + 1)) <- $msz;
        CallM shift_reg_write ( #new_shift_reg : Bit msz );
        CallM counter_write ( #new_counter : Bit (msz + 1) );
        Retv    )

    with Method instancePrefix--"get" () : (Bit 1) :=
    (
CallM counter_v : Bit (msz + 1) (* methoddef regread *) <- counter_read();
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
LET out : (Bit 1) <- UniBit (Trunc 1 (msz - 1)) (castBits _ msz (1 + (msz - 1)) _ #shift_reg_v);
        LET shift_reg_shifted : Bit msz <- (BinBit (Srl msz 1) #shift_reg_v $$(natToWord 1 1));
        CallM shift_reg_write ( #shift_reg_shifted : Bit msz );
        LET new_counter : Bit (msz + 1) <- (#counter_v - $1);
        CallM counter_write ( #new_counter : Bit (msz + 1) );
        Ret #out    )

    }); abstract omega. Qed. (* mkSerialize *)

(* Module mkSerialize type Pack#(t, msz) -> Module#(Serialize#(t)) return type Serialize#(t) *)
    Definition mkSerialize := Build_Serialize mkSerializeModule%kami (instancePrefix--"get") (instancePrefix--"put").
    End Section'mkSerialize.
End module'mkSerialize.

Definition mkSerialize := module'mkSerialize.mkSerialize.
Hint Unfold mkSerialize : ModuleDefs.
Hint Unfold module'mkSerialize.mkSerialize : ModuleDefs.
Hint Unfold module'mkSerialize.mkSerializeModule : ModuleDefs.

(* * interface Deserialize#(t) *)
Record Deserialize := {
    Deserialize'modules: Modules;
    Deserialize'put : string;
    Deserialize'get : string;
}.

Module module'mkDeserialize.
    Section Section'mkDeserialize.
    Variable msz : nat.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable packer: Pack.
    Variable tSz: nat.
    Hypothesis HPos: (tSz > 0)%nat.
    (* let bindings *)
    Let counter_init_val : ConstT (Bit (msz + 1)) := $msz.
        (* method bindings *)
    Let shift_reg := mkRegU (Bit msz) (instancePrefix--"shift_reg").
    Let counter := mkReg (Bit (msz + 1)) (instancePrefix--"counter") (counter_init_val)%bk.
    Let counter_read : string := (Reg'_read counter).
    Let shift_reg_read : string := (Reg'_read shift_reg).
    Let shift_reg_write : string := (Reg'_write shift_reg).
    Let counter_write : string := (Reg'_write counter).
    (* instance methods *)
    Let packerunpack : string := (Pack'unpack packer).
    Definition mkDeserializeModule: Modules.
        refine  (BKMODULE {
        (BKMod (Reg'modules shift_reg :: nil))
    with (BKMod (Reg'modules counter :: nil))
    with Method instancePrefix--"put" (x : (Bit 1)) : Void :=
    (
CallM counter_v : Bit (msz + 1) (* methoddef regread *) <- counter_read();
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
        LET shift_reg_shifted : Bit msz <- (BinBit (Sll msz 1) #shift_reg_v $$(natToWord 1 1));
LET x_extended : (Bit msz) <-  UniBit (SignExtendTrunc 1 msz) (castBits _ 1 1 _ #x);
        LET new_shift_reg : Bit msz <- (#shift_reg_shifted ~| #x_extended);
        CallM shift_reg_write ( #new_shift_reg : Bit msz );
        CallM counter_write ( (#counter_v - $1) : Bit (msz + 1) );
        Retv    )

    with Method instancePrefix--"get" () : t :=
    (
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
        CallM counter_write ( #counter_init_val : Bit (msz + 1) );
CallM result : t (* varbinding *) <-  packerunpack (#shift_reg_v : Bit msz);
        Ret #result    )

    }); abstract omega. Qed. (* mkDeserialize *)

(* Module mkDeserialize type Pack#(t, msz) -> Module#(Deserialize#(t)) return type Deserialize#(t) *)
    Definition mkDeserialize := Build_Deserialize mkDeserializeModule%kami (instancePrefix--"get") (instancePrefix--"put").
    End Section'mkDeserialize.
End module'mkDeserialize.

Definition mkDeserialize := module'mkDeserialize.mkDeserialize.
Hint Unfold mkDeserialize : ModuleDefs.
Hint Unfold module'mkDeserialize.mkDeserialize : ModuleDefs.
Hint Unfold module'mkDeserialize.mkDeserializeModule : ModuleDefs.

(* * interface OneWireSerialize#(t) *)
Record OneWireSerialize := {
    OneWireSerialize'modules: Modules;
    OneWireSerialize'put : string;
    OneWireSerialize'get : string;
}.

Module module'mkOneWireSerialize.
    Section Section'mkOneWireSerialize.
    Variable msz : nat.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable packer: Pack.
    Variable tSz: nat.
    Hypothesis HPos: (tSz > 0)%nat.
    (* let bindings *)
    Let btsz : ConstT (Bit (msz + 1)) := $msz.
    Let counter_init_val : ConstT (Bit (msz + 1)) := ($0)%kami.
        (* method bindings *)
    Let shift_reg := mkRegU (Bit msz) (instancePrefix--"shift_reg").
    Let counter := mkReg (Bit (msz + 1)) (instancePrefix--"counter") (counter_init_val)%bk.
    Let start_tx := mkReg (Bool) (instancePrefix--"start_tx") (($$false)%kami_expr)%bk.
    Let tx_wire := mkDWire (Bit tvar1393) (Bit 1) (instancePrefix--"tx_wire") ($0)%bk.
    Let counter_read : string := (Reg'_read counter).
    Let shift_reg_read : string := (Reg'_read shift_reg).
    Let start_tx_read : string := (Reg'_read start_tx).
    Let start_tx_write : string := (Reg'_write start_tx).
    Let tx_wire_write : string := (Reg'_write tx_wire).
    Let shift_reg_write : string := (Reg'_write shift_reg).
    Let counter_write : string := (Reg'_write counter).
    (* instance methods *)
    Let packerpack : string := (Pack'pack packer).
    Definition mkOneWireSerializeModule: Modules.
        refine  (BKMODULE {
        (BKMod (Reg'modules shift_reg :: nil))
    with (BKMod (Reg'modules counter :: nil))
    with (BKMod (Reg'modules start_tx :: nil))
    with (BKMod (Wire'modules tx_wire :: nil))
    with Rule instancePrefix--"doTx" :=
    (
        CallM counter_v : Bit (msz + 1) (* regRead *) <- counter_read();
        CallM shift_reg_v : Bit msz (* regRead *) <- shift_reg_read();
        CallM start_tx_v : Bool (* regRead *) <- start_tx_read();

        Assert((#counter_v != $0));
               If #start_tx_v then (
        
        CallM start_tx_write ( ($$false)%kami_expr : Bool );
                CallM tx_wire_write ( $$(natToWord 1 1) : Bit 1 );
        Retv
        ) else (
        
LET b : (Bit 1) <-  UniBit (TruncLsb (msz - 1) 1) (castBits _ msz msz _ #shift_reg_v);
                CallM tx_wire_write ( #b : Bit 1 );
                CallM shift_reg_write ( (BinBit (Sll msz 1) #shift_reg_v $$(natToWord 1 1)) : Bit msz );
                CallM counter_write ( (#counter_v - $1) : Bit (msz + 1) );
        Retv) as retval
;
        Retv ) (* rule doTx *)
    with Method instancePrefix--"put" (x : t) : Void :=
    (
CallM new_shift_reg : Bit msz (* varbinding *) <-  packerpack (#x : t);
        LET new_counter : Bit (msz + 1) <- #btsz;
        CallM shift_reg_write ( #new_shift_reg : Bit msz );
        CallM counter_write ( #new_counter : Bit (msz + 1) );
        CallM start_tx_write ( ($$true)%kami_expr : Bool );
        Retv    )

    with Method instancePrefix--"get" () : Bit 1 :=
    (
        Ret #tx_wire    )

    }); abstract omega. Qed. (* mkOneWireSerialize *)

(* Module mkOneWireSerialize type Pack#(t, msz) -> Module#(OneWireSerialize#(t)) return type OneWireSerialize#(t) *)
    Definition mkOneWireSerialize := Build_OneWireSerialize mkOneWireSerializeModule%kami (instancePrefix--"get") (instancePrefix--"put").
    End Section'mkOneWireSerialize.
End module'mkOneWireSerialize.

Definition mkOneWireSerialize := module'mkOneWireSerialize.mkOneWireSerialize.
Hint Unfold mkOneWireSerialize : ModuleDefs.
Hint Unfold module'mkOneWireSerialize.mkOneWireSerialize : ModuleDefs.
Hint Unfold module'mkOneWireSerialize.mkOneWireSerializeModule : ModuleDefs.

(* * interface OneWireDeserialize#(t) *)
Record OneWireDeserialize := {
    OneWireDeserialize'modules: Modules;
    OneWireDeserialize'put : string;
    OneWireDeserialize'get : string;
}.

Module module'mkOneWireDeserialize.
    Section Section'mkOneWireDeserialize.
    Variable msz : nat.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable packer: Pack.
    Variable tSz: nat.
    Hypothesis HPos: (tSz > 0)%nat.
    (* let bindings *)
    Let btsz : ConstT (Bit (msz + 1)) := $msz.
    Let counter_init_val : ConstT (Bit (msz + 1)) := ($0)%kami.
        (* method bindings *)
    Let shift_reg := mkRegU (Bit msz) (instancePrefix--"shift_reg").
    Let counter := mkReg (Bit (msz + 1)) (instancePrefix--"counter") (counter_init_val)%bk.
    Let rx_valid := mkReg (Bool) (instancePrefix--"rx_valid") (($$false)%kami_expr)%bk.
    Let counter_read : string := (Reg'_read counter).
    Let shift_reg_read : string := (Reg'_read shift_reg).
    Let counter_write : string := (Reg'_write counter).
    Let rx_valid_write : string := (Reg'_write rx_valid).
    Let shift_reg_write : string := (Reg'_write shift_reg).
    (* instance methods *)
    Let packerunpack : string := (Pack'unpack packer).
    Definition mkOneWireDeserializeModule: Modules.
        refine  (BKMODULE {
        (BKMod (Reg'modules shift_reg :: nil))
    with (BKMod (Reg'modules counter :: nil))
    with (BKMod (Reg'modules rx_valid :: nil))
    with Method instancePrefix--"put" (x : (Bit 1)) : Void :=
    (
CallM counter_v : Bit (msz + 1) (* methoddef regread *) <- counter_read();
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
        If (#counter_v == $0) then (
        
        If (#x == $1) then (
        
        CallM counter_write ( #btsz : Bit (msz + 1) );
                CallM rx_valid_write ( ($$true)%kami_expr : Bool );
        Retv) else (
            Retv
        ) as retval
;
        Ret #retval
        ) else (
        
LET shift_reg_lsb : (Bit (msz - 1)) <- UniBit (Trunc (msz - 1) (msz - (msz - 1))) (castBits _ msz ((msz - 1) + (msz - (msz - 1))) _ #shift_reg_v);
                LET new_shift_reg : Bit msz <- castBits _ ((msz - 1) + 1) ((msz - 1) + 1) _ (BinBit (Concat ((msz - 1)) 1) #shift_reg_lsb #x);
                CallM shift_reg_write ( #new_shift_reg : Bit msz );
                CallM counter_write ( (#counter_v - $1) : Bit (msz + 1) );
        Retv) as retval
;
        Ret #retval    )

    with Method instancePrefix--"get" () : t :=
    (
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
        CallM rx_valid_write ( ($$false)%kami_expr : Bool );
CallM result : t (* varbinding *) <-  packerunpack (#shift_reg_v : Bit msz);
        Ret #result    )

    }); abstract omega. Qed. (* mkOneWireDeserialize *)

(* Module mkOneWireDeserialize type Pack#(t, msz) -> Module#(OneWireDeserialize#(t)) return type OneWireDeserialize#(t) *)
    Definition mkOneWireDeserialize := Build_OneWireDeserialize mkOneWireDeserializeModule%kami (instancePrefix--"get") (instancePrefix--"put").
    End Section'mkOneWireDeserialize.
End module'mkOneWireDeserialize.

Definition mkOneWireDeserialize := module'mkOneWireDeserialize.mkOneWireDeserialize.
Hint Unfold mkOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkOneWireDeserialize.mkOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkOneWireDeserialize.mkOneWireDeserializeModule : ModuleDefs.

(* * interface ComboOneWireSerialize#(t) *)
Record ComboOneWireSerialize := {
    ComboOneWireSerialize'modules: Modules;
    ComboOneWireSerialize'put : string;
    ComboOneWireSerialize'get_serial : string;
    ComboOneWireSerialize'get_parallel : string;
}.

Module module'mkComboOneWireSerialize.
    Section Section'mkComboOneWireSerialize.
    Variable msz : nat.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable packer: Pack.
    Variable do_parallel: ConstT Bool.
    Variable tSz: nat.
    Hypothesis HPos: (tSz > 0)%nat.
    (* let bindings *)
    Let btsz : ConstT (Bit (msz + 1)) := $msz.
    Let counter_init_val : ConstT (Bit (msz + 1)) := ($0)%kami.
        (* method bindings *)
    Let shift_reg := mkRegU (Bit msz) (instancePrefix--"shift_reg").
    Let counter := mkReg (Bit (msz + 1)) (instancePrefix--"counter") (counter_init_val)%bk.
    Let start_tx := mkReg (Bool) (instancePrefix--"start_tx") (($$false)%kami_expr)%bk.
    Let tx_wire := mkDWire (Bit tvar1461) (Bit 1) (instancePrefix--"tx_wire") ($0)%bk.
    Let counter_read : string := (Reg'_read counter).
    Let shift_reg_read : string := (Reg'_read shift_reg).
    Let start_tx_read : string := (Reg'_read start_tx).
    Let start_tx_write : string := (Reg'_write start_tx).
    Let tx_wire_write : string := (Reg'_write tx_wire).
    Let shift_reg_write : string := (Reg'_write shift_reg).
    Let counter_write : string := (Reg'_write counter).
    (* instance methods *)
    Let packerpack : string := (Pack'pack packer).
    Let packerunpack : string := (Pack'unpack packer).
    Definition mkComboOneWireSerializeModule: Modules.
        refine  (BKMODULE {
        (BKMod (Reg'modules shift_reg :: nil))
    with (BKMod (Reg'modules counter :: nil))
    with (BKMod (Reg'modules start_tx :: nil))
    with (BKMod (Wire'modules tx_wire :: nil))
    with Rule instancePrefix--"doSerialTx" :=
    (
        CallM counter_v : Bit (msz + 1) (* regRead *) <- counter_read();
        CallM shift_reg_v : Bit msz (* regRead *) <- shift_reg_read();
        CallM start_tx_v : Bool (* regRead *) <- start_tx_read();

        Assert(((!$$do_parallel) && (#counter_v != $0)));
               If #start_tx_v then (
        
        CallM start_tx_write ( ($$false)%kami_expr : Bool );
                CallM tx_wire_write ( $$(natToWord 1 1) : Bit 1 );
        Retv
        ) else (
        
LET b : (Bit 1) <-  UniBit (TruncLsb (msz - 1) 1) (castBits _ msz msz _ #shift_reg_v);
                CallM tx_wire_write ( #b : Bit 1 );
                CallM shift_reg_write ( (BinBit (Sll msz 1) #shift_reg_v $$(natToWord 1 1)) : Bit msz );
                CallM counter_write ( (#counter_v - $1) : Bit (msz + 1) );
        Retv) as retval
;
        Retv ) (* rule doSerialTx *)
    with Method instancePrefix--"put" (x : t) : Void :=
    (
CallM new_shift_reg : Bit msz (* varbinding *) <-  packerpack (#x : t);
        CallM shift_reg_write ( #new_shift_reg : Bit msz );
        CallM counter_write ( #btsz : Bit (msz + 1) );
        CallM start_tx_write ( ($$true)%kami_expr : Bool );
        Retv    )

    with Method instancePrefix--"get_serial" () : Bit 1 :=
    (
        Ret #tx_wire    )

    with Method instancePrefix--"get_parallel" () : t :=
    (
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
        If $$do_parallel then (
        
        LET zero : Bit (msz + 1) <- $0;
                CallM counter_write ( #zero : Bit (msz + 1) );
                CallM start_tx_write ( ($$false)%kami_expr : Bool );
        Retv) else (
            Retv
        ) as retval
;
CallM result : t (* varbinding *) <-  packerunpack (#shift_reg_v : Bit msz);
        Ret #result    )

    }); abstract omega. Qed. (* mkComboOneWireSerialize *)

(* Module mkComboOneWireSerialize type Pack#(t, msz) -> Bool -> Module#(ComboOneWireSerialize#(t)) return type Bool *)
    Definition mkComboOneWireSerialize := Build_ComboOneWireSerialize mkComboOneWireSerializeModule%kami (instancePrefix--"get_parallel") (instancePrefix--"get_serial") (instancePrefix--"put").
    End Section'mkComboOneWireSerialize.
End module'mkComboOneWireSerialize.

Definition mkComboOneWireSerialize := module'mkComboOneWireSerialize.mkComboOneWireSerialize.
Hint Unfold mkComboOneWireSerialize : ModuleDefs.
Hint Unfold module'mkComboOneWireSerialize.mkComboOneWireSerialize : ModuleDefs.
Hint Unfold module'mkComboOneWireSerialize.mkComboOneWireSerializeModule : ModuleDefs.

(* * interface ComboOneWireDeserialize#(t) *)
Record ComboOneWireDeserialize := {
    ComboOneWireDeserialize'modules: Modules;
    ComboOneWireDeserialize'put_serial : string;
    ComboOneWireDeserialize'put_parallel : string;
    ComboOneWireDeserialize'get : string;
}.

Module module'mkComboOneWireDeserialize.
    Section Section'mkComboOneWireDeserialize.
    Variable msz : nat.
    Variable t : Kind.
    Variable instancePrefix: string.
    Variable packer: Pack.
    Variable do_parallel: ConstT Bool.
    Variable tSz: nat.
    Hypothesis HPos: (tSz > 0)%nat.
    (* let bindings *)
    Let btsz : ConstT (Bit (msz + 1)) := $msz.
    Let counter_init_val : ConstT (Bit (msz + 1)) := ($0)%kami.
        (* method bindings *)
    Let shift_reg := mkRegU (Bit msz) (instancePrefix--"shift_reg").
    Let counter := mkReg (Bit (msz + 1)) (instancePrefix--"counter") (counter_init_val)%bk.
    Let rx_valid := mkReg (Bool) (instancePrefix--"rx_valid") (($$false)%kami_expr)%bk.
    Let rx_wire := mkBypassWire (Bit 1) (instancePrefix--"rx_wire").
    Let counter_read : string := (Reg'_read counter).
    Let shift_reg_read : string := (Reg'_read shift_reg).
    Let counter_write : string := (Reg'_write counter).
    Let rx_valid_write : string := (Reg'_write rx_valid).
    Let shift_reg_write : string := (Reg'_write shift_reg).
    Let rx_wire_write : string := (Reg'_write rx_wire).
    (* instance methods *)
    Let packerpack : string := (Pack'pack packer).
    Let packerunpack : string := (Pack'unpack packer).
    Definition mkComboOneWireDeserializeModule: Modules.
        refine  (BKMODULE {
        (BKMod (Reg'modules shift_reg :: nil))
    with (BKMod (Reg'modules counter :: nil))
    with (BKMod (Reg'modules rx_valid :: nil))
    with (BKMod (Wire'modules rx_wire :: nil))
    with Rule instancePrefix--"doSerialRx" :=
    (
        CallM counter_v : Bit (msz + 1) (* regRead *) <- counter_read();
        CallM shift_reg_v : Bit msz (* regRead *) <- shift_reg_read();

        Assert((!$$do_parallel));
               If (#counter_v == $0) then (
        
        If (#rx_wire == $1) then (
        
        CallM counter_write ( #btsz : Bit (msz + 1) );
                CallM rx_valid_write ( ($$true)%kami_expr : Bool );
        Retv) else (
            Retv
        ) as retval
;
        Ret #retval
        ) else (
        
LET shift_reg_lsb : (Bit (msz - 1)) <- UniBit (Trunc (msz - 1) (msz - (msz - 1))) (castBits _ msz ((msz - 1) + (msz - (msz - 1))) _ #shift_reg_v);
                LET new_shift_reg : Bit msz <- castBits _ ((msz - 1) + 1) ((msz - 1) + 1) _ (BinBit (Concat ((msz - 1)) 1) #shift_reg_lsb #rx_wire);
                CallM shift_reg_write ( #new_shift_reg : Bit msz );
                CallM counter_write ( (#counter_v - $1) : Bit (msz + 1) );
        Retv) as retval
;
        Retv ) (* rule doSerialRx *)
    with Method instancePrefix--"put_serial" (x : (Bit 1)) : Void :=
    (
        CallM rx_wire_write ( #x : Bit 1 );
        Retv    )

    with Method instancePrefix--"put_parallel" (x : t) : Void :=
    (
CallM new_shift_reg : Bit msz (* varbinding *) <-  packerpack (#x : t);
        CallM shift_reg_write ( #new_shift_reg : Bit msz );
        LET zero : Bit (msz + 1) <- $0;
        CallM counter_write ( #zero : Bit (msz + 1) );
        CallM rx_valid_write ( ($$true)%kami_expr : Bool );
        Retv    )

    with Method instancePrefix--"get" () : t :=
    (
CallM shift_reg_v : Bit msz (* methoddef regread *) <- shift_reg_read();
        CallM rx_valid_write ( ($$false)%kami_expr : Bool );
CallM result : t (* varbinding *) <-  packerunpack (#shift_reg_v : Bit msz);
        Ret #result    )

    }); abstract omega. Qed. (* mkComboOneWireDeserialize *)

(* Module mkComboOneWireDeserialize type Pack#(t, msz) -> Bool -> Module#(ComboOneWireDeserialize#(t)) return type Bool *)
    Definition mkComboOneWireDeserialize := Build_ComboOneWireDeserialize mkComboOneWireDeserializeModule%kami (instancePrefix--"get") (instancePrefix--"put_parallel") (instancePrefix--"put_serial").
    End Section'mkComboOneWireDeserialize.
End module'mkComboOneWireDeserialize.

Definition mkComboOneWireDeserialize := module'mkComboOneWireDeserialize.mkComboOneWireDeserialize.
Hint Unfold mkComboOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkComboOneWireDeserialize.mkComboOneWireDeserialize : ModuleDefs.
Hint Unfold module'mkComboOneWireDeserialize.mkComboOneWireDeserializeModule : ModuleDefs.

