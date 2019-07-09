Require Import Bool String List Arith.
Require Import Omega.
Require Import micromega.Lia.
Require Import Kami.
Require Import Lib.Indexer.
Require Import Bsvtokami.

Require Import FunctionalExtensionality.

Set Implicit Arguments.


(* * interface RFile2R1W#(dataSz, regIndexSz) *)
Record RFile2R1W := {
    RFile2R1W'modules: Modules;
    RFile2R1W'rd1 : string;
    RFile2R1W'rd2 : string;
    RFile2R1W'wr : string;
}.

Hint Unfold RFile2R1W'modules : ModuleDefs.
Hint Unfold RFile2R1W'rd1 : ModuleDefs.
Hint Unfold RFile2R1W'rd2 : ModuleDefs.
Hint Unfold RFile2R1W'wr : ModuleDefs.

Module module'mkCustomRFile2R1W.
    Section Section'mkCustomRFile2R1W.
    Variable dataSz : nat.
    Variable regIndexSz : nat.
    Variable instancePrefix: string.
    Definition mkCustomRFile2R1WModule: Modules :=
         (BKMODULE {
        Method instancePrefix--"rd1" (rindx : (Bit regIndexSz)) : Bit dataSz :=
    (
        Ret $0    )

    with Method instancePrefix--"rd2" (rindx : (Bit regIndexSz)) : Bit dataSz :=
    (
        Ret $0    )

    with Method instancePrefix--"wr" (rindx : (Bit regIndexSz)) (data : (Bit dataSz)) : Void :=
    (
        Retv    )

    }). (* mkCustomRFile2R1W *)

(* Module mkCustomRFile2R1W type Module#(RFile2R1W#(dataSz, regIndexSz)) return type RFile2R1W#(dataSz, regIndexSz) *)
    Definition mkCustomRFile2R1W := Build_RFile2R1W mkCustomRFile2R1WModule%kami (instancePrefix--"rd1") (instancePrefix--"rd2") (instancePrefix--"wr").
    End Section'mkCustomRFile2R1W.
End module'mkCustomRFile2R1W.

Definition mkCustomRFile2R1W := module'mkCustomRFile2R1W.mkCustomRFile2R1W.
Hint Unfold mkCustomRFile2R1W : ModuleDefs.
Hint Unfold module'mkCustomRFile2R1W.mkCustomRFile2R1W : ModuleDefs.
Hint Unfold module'mkCustomRFile2R1W.mkCustomRFile2R1WModule : ModuleDefs.

