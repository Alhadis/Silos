(** Lattice constructor: cartesian product.  *)

Set Implicit Arguments.

Require Import OrderedTypeEx.
Require Import hpattern vgtac.
Require Import beVocab beLat.

Module ProdKey (A : KEY) (B : KEY) <: KEY := PairOrderedType A B.

Module Prod (A : LAT) (B : LAT) <: LAT.

Definition t : Type := (A.t * B.t)%type.

(** * Lattice operations *)

Local Open Scope sumbool.

Definition le (x y : t) : Prop := A.le (fst x) (fst y) /\ B.le (snd x) (snd y).

Definition le_dec (x y : t) : {le x y} + {~ le x y}.
refine
  (match x as x', y as y' return
         x = x' -> y = y' -> {le x y} + {~ le x y} with
     | (x1, x2), (y1, y2) =>
       fun Hx Hy =>
         if A.le_dec x1 y1 &&& B.le_dec x2 y2 then left _ else right _
   end eq_refl eq_refl); subst.
+ des; econs; by vauto.
+ des; inversion 1; by vauto.
Qed.

Definition eq (x y : t) : Prop := A.eq (fst x) (fst y) /\ B.eq (snd x) (snd y).

Definition eq_dec (x y : t) : {eq x y} + {~ eq x y}.
refine
  (match x as x', y as y' return
         x = x' -> y = y' -> {eq x y} + {~ eq x y} with
     | (x1, x2), (y1, y2) =>
       fun Hx Hy =>
         if A.eq_dec x1 y1 &&& B.eq_dec x2 y2 then left _ else right _
   end eq_refl eq_refl); subst.
+ des; econs; by vauto.
+ des; inversion 1; by vauto.
Qed.

Lemma le_refl : forall (x y : t) (Heq : eq x y), le x y.
Proof. inversion 1; econs; by eauto using A.le_refl, B.le_refl. Qed.
Lemma le_antisym : forall (x y : t) (le1 : le x y) (le2 : le y x), eq x y.
Proof.
  inversion 1; inversion 1; econs; by eauto using A.le_antisym, B.le_antisym.
Qed.
Lemma le_trans : forall (x y z : t) (le1 : le x y) (le2 : le y z), le x z.
Proof.
  inversion 1; inversion 1; econs; by eauto using A.le_trans, B.le_trans.
Qed.

Lemma eq_refl : forall (x : t), eq x x.
Proof. destruct x; econs; by eauto using A.eq_refl, B.eq_refl. Qed.
Lemma eq_sym : forall (x y : t) (Heq : eq x y), eq y x.
Proof. inversion 1; econs; by eauto using A.eq_sym, B.eq_sym. Qed.
Lemma eq_trans :
  forall (x y z : t) (eq1 : eq x y) (eq2 : eq y z), eq x z.
Proof.
  inversion 1; inversion 1; econs; by eauto using A.eq_trans, B.eq_trans.
Qed.

Definition bot : t := (A.bot, B.bot).

Lemma bot_prop : forall (x : t), le bot x.
Proof. i; split; auto using A.bot_prop, B.bot_prop. Qed.

Definition join (x y : t) : t :=
  (A.join (fst x) (fst y), B.join (snd x) (snd y)).

Definition meet (x y : t) : t :=
  (A.meet (fst x) (fst y), B.meet (snd x) (snd y)).

End Prod.

(** Modules for generating lookup functions. *)

Module Get2.
  Definition fst {A B : Type} : A * B -> A :=
    Datatypes.fst.
  Definition snd {A B : Type} : A * B -> B :=
    Datatypes.snd.
End Get2.
Module Get3.
  Definition fst {A B C : Type} : A * B * C -> A :=
    Get2.fst <*> Datatypes.fst.
  Definition snd {A B C : Type} : A * B * C -> B :=
    Get2.snd <*> Datatypes.fst.
  Definition thrd {A B C : Type} : A * B * C -> C :=
    Datatypes.snd.
End Get3.
Module Get4.
  Definition fst {A B C D : Type} : A * B * C * D -> A :=
    Get3.fst <*> Datatypes.fst.
  Definition snd {A B C D : Type} : A * B * C * D -> B :=
    Get3.snd <*> Datatypes.fst.
  Definition thrd {A B C D : Type} : A * B * C * D -> C :=
    Get3.thrd <*> Datatypes.fst.
  Definition frth {A B C D : Type} : A * B * C * D -> D :=
    Datatypes.snd.
End Get4.
Module Get5.
  Definition fst {A B C D E : Type} : A * B * C * D * E -> A :=
    Get4.fst <*> Datatypes.fst.
  Definition snd {A B C D E : Type} : A * B * C * D * E -> B :=
    Get4.snd <*> Datatypes.fst.
  Definition thrd {A B C D E : Type} : A * B * C * D * E -> C :=
    Get4.thrd <*> Datatypes.fst.
  Definition frth {A B C D E : Type} : A * B * C * D * E -> D :=
    Get4.frth <*> Datatypes.fst.
  Definition fifth {A B C D E : Type} : A * B * C * D * E -> E :=
    Datatypes.snd.
End Get5.

(** * Cartesian product for multiple lattices *)

Module ProdKey2 (A:KEY) (B:KEY).
  Include ProdKey A B.
  Include Get2.
End ProdKey2.

Module ProdKey3 (A:KEY) (B:KEY) (C:KEY).
  Module E2 := ProdKey A B.
  Include ProdKey E2 C.
  Include Get3.
End ProdKey3.

Module ProdKey4 (A:KEY) (B:KEY) (C:KEY) (D:KEY).
  Module E2 := ProdKey A B.
  Module E3 := ProdKey E2 C.
  Include ProdKey E3 D.
  Include Get4.
End ProdKey4.

Module ProdKey5 (A:KEY) (B:KEY) (C:KEY) (D:KEY) (E:KEY).
  Module E2 := ProdKey A B.
  Module E3 := ProdKey E2 C.
  Module E4 := ProdKey E3 D.
  Include ProdKey E4 E.
  Include Get5.
End ProdKey5.

Module Prod2 (A:LAT) (B:LAT).
  Include Prod A B.
  Include Get2.
End Prod2.

Module Prod3 (A:LAT) (B:LAT) (C:LAT).
  Module E2 := Prod A B.
  Include Prod E2 C.
  Include Get3.
End Prod3.

Module Prod4 (A:LAT) (B:LAT) (C:LAT) (D:LAT).
  Module E2 := Prod A B.
  Module E3 := Prod E2 C.
  Include Prod E3 D.
  Include Get4.
End Prod4.

Module Prod5 (A:LAT) (B:LAT) (C:LAT) (D:LAT) (E:LAT).
  Module E2 := Prod A B.
  Module E3 := Prod E2 C.
  Module E4 := Prod E3 D.
  Include Prod E4 E.
  Include Get5.
End Prod5.
