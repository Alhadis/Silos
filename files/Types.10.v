From mathcomp.ssreflect Require Import ssreflect ssrnat seq eqtype ssrbool.
From mathcomp.algebra Require Import ssrint.
Require Import Common.

Fixpoint In {A:Type} (a:A) (l: seq A) : Prop :=
match l with
  | [::] => False
  | b :: m => b = a \/ In a m
end.

Inductive numeric := | S8 | U8 | S16 | U16 | S32 | U32 | S64 | U64 .
Scheme Equality for numeric.
                       
Inductive ctype :=
| Int (_:numeric) 
| Pointer : ctype -> ctype
| Struct: seq ctype -> ctype
| Bot | Unit | ErrorType.

Definition Int8 := Int S8.
Definition UInt8 := Int U8.
Definition Int16 := Int S16.
Definition UInt16 := Int U16.
Definition Int32 := Int S32.
Definition UInt32 := Int U32.
Definition Int64 := Int S64.
Definition UInt64 := Int U64.


Fixpoint SizeOf (t:ctype) :=
    match t with 
    | Pointer _ => 8
    | Struct els => foldl (fun x y=>x + y) 0 (map SizeOf els) 
    | Int S8 | Int U8 => 1
    | Int S16 | Int U16 => 2
    | Int S32 | Int U32 => 4
    | Int S64 | Int U64 => 8
    | _ => 0
    end.


Theorem ctype_better_ind (P: ctype -> Prop):
(forall nt, (P (Int nt)))->
(forall p: ctype, P p -> P (Pointer p) ) ->
(forall l, (forall e, In e l -> P e) -> P (Struct l)) -> P Unit ->
(P Bot) -> (P ErrorType) ->
(forall t:ctype, P t).
Proof.
  move=> Hnt Hptr Hstr Hunit Hbot Herr. 
  fix 1.
  have StructProof: forall l : seq ctype, P (Struct l). {
    move=> l. apply Hstr. elim: l.
    - by move=> _ [].
    - move=> a l Hin e /= [].
      + by move=><-; exact (ctype_better_ind a).
      + apply Hin.
  }    
  move=>[]; try by [clear ctype_better_ind].
  - elim; try by [ clear ctype_better_ind; try move=> c; apply Hptr].
Qed.

Fixpoint ctype_beq (x y: ctype) {struct x} : bool  :=
let fix process (xs ys: seq ctype) := match xs,ys with
                                        | nil, nil => true
                                        | x::xs, y::ys => ctype_beq x y && process xs ys
                                        | _, nil
                                        | nil, _ => false
                                      end in
match x, y with
  | Int x, Int y => numeric_beq x y
  | Bot, Bot
  | ErrorType, ErrorType => true
  | Pointer px, Pointer py => ctype_beq px py
  | Struct xs, Struct ys => process xs ys
  | Unit, Unit => true
  | _, _ => false
end.

Local Lemma Struct_cons: forall x xs y ys, Struct xs = Struct ys /\ x = y <-> Struct (x::xs) = Struct (y::ys).
Proof. by move=> x xs y ys; split; [move=> [[]] => -> -> | move=> [] -> ->]. Defined.      

Theorem ctype_eqP: Equality.axiom ctype_beq.
Proof.
rewrite /Equality.axiom.
fix 1.
move=> x.
elim x; try do [ by case; constructor ].
(* Pointer *)
- move=>[];  move=> y; elim y; try do [try case; by constructor].
  move => z H2 //=.
  elim; try by constructor.
  move=> c H.
  move: (H2 c).
  move: (ctype_beq z c) => [] [].
    by move=> ->; constructor.
    by move=> *;  constructor; case.
    by move=> ->; constructor.
    by move=> *;  constructor; case.
(* Struct *)
- move =>l.
  elim ; try by constructor.
  
  clear x. 
  elim: l.
  + case; by [apply ReflectT | move=> a l; apply ReflectF]. 
  + move=> a l H []; first by apply ReflectF.
    move=> b m.
    move: (H m) => Hm.
    inversion  Hm as [Hstructs Hstreq| Hstructs Hstreq].
    * destruct (ctype_beq (Struct (a :: l)) (Struct (b :: m))) eqn: Heq_str_big.
      ** apply ReflectT. apply Struct_cons.
      simpl in Heq_str_big.
      split; first by exact Hstructs.
      destruct (ctype_eqP a b) as [Hab|Hab]; [ by exact Hab| by exfalso].
    * apply ReflectF => H_str_big. move: (H m) => Hrefl_eqlm.
      move: (ctype_eqP a b) => Hrefl_ab.
      inversion Hrefl_ab as [Hab Heq_ab|Hab Heq_ab].
      simpl in Heq_str_big. rewrite <- Heq_ab in Heq_str_big. 
      simpl in Heq_str_big. rewrite <-Hstreq in Heq_str_big.
        by inversion Heq_str_big.
    * inversion H_str_big. by exact (Hab H1).
      destruct  (ctype_beq (Struct (a :: l)) (Struct (b :: m))) eqn: Hsab; [apply ReflectT| apply ReflectF].
      ** simpl in Hsab.
      rewrite <-Hstreq in Hsab.
      rewrite Bool.andb_false_r in Hsab. by inversion Hsab.
      **  move=> Heq.
      inversion Heq.
      rewrite H2 in Hstructs. by exfalso.
Defined.      

Canonical ctype_eqMixin := EqMixin ctype_eqP.
Canonical ctype_eqType := EqType ctype ctype_eqMixin.

Theorem numeric_eqP: Equality.axiom numeric_beq.
Proof. by case; case; constructor. Qed.

Canonical numeric_eqMixin := EqMixin numeric_eqP.
Canonical numeric_eqType := EqType numeric numeric_eqMixin.

(*Definition int_union (x y: numeric) : numeric := match x,y with *)

Definition ctype_eq_dec  := (@dec_from_reflect ctype_eqType) (ctype_eqP): eq_dec ctype.

(* Pointer value *)
Inductive ptr (t: ctype) := | Goodptr (at_block: nat) (offset: nat) | Nullptr.

Definition ptr_eq_dec t : eq_dec (ptr t).  by rewrite /eq_dec; repeat decide equality. Defined.

Definition ptr_eqP t := reflect_from_dec (ptr_eq_dec t).
Canonical ptr_eqMixin t := EqMixin (ptr_eqP t).
Canonical ptr_eqType t := EqType (ptr t) (ptr_eqMixin t).

(* Holders for different value types *)
(*Definition coq_type_eq_dec : forall t:ctype, eq_dec (coq_type t).
  rewrite /eq_dec;case; try by apply unit_eq_dec.
  - move=> *; apply int_eq_dec.
  - apply ptr_eq_dec.
  - move=>*; apply (seq_eq_dec _ nat_eq_dec).
Defined.*)

Inductive anyptr := |AnyPtr t : ptr t-> anyptr.
      Theorem anyptr_eq_dec: eq_dec anyptr.
         rewrite /eq_dec.
         move=> x y.
         case x; case y.
         move=> t p t0 p0.
         move: (ctype_eq_dec t t0) =>[Ht|Ht].
         subst.
         move: (ptr_eq_dec t0 p p0) => [Hp|Hp].
         subst.
           by left.
           right.
           case.
           move=> H.
           depcomp H.
             by symmetry in H.
             right.
             case => H.
               by symmetry in H.
      Defined.

   
       Canonical anyptr_eqMixin := EqMixin ( reflect_from_dec anyptr_eq_dec ).
       Canonical anyptr_eqType := EqType anyptr anyptr_eqMixin.
                
       
Inductive value : Set := | Garbage | Deallocated | Error
                      | ValueI64 (_:int)
                      | ValueI32 (_:int)
                      | ValueI16 (_:int)
                      | ValueI8 (_:int)

                      | ValueU64 (_:int)
                      | ValueU32 (_:int)
                      | ValueU16 (_:int)
                      | ValueU8 (_:int)
                      | ValuePtr (_:anyptr)
                      | ValueStruct (_:seq (ctype*nat))
                      | ValueBot
                      | ValueUnit
                      | ValueError.

Fixpoint type_of_val v : ctype :=
  match v with
    | Garbage => Bot
    | Deallocated => ErrorType
    | Error => ErrorType
    | ValueI64 x => Int64
    | ValueI32 x => Int32 
    | ValueI16 x => Int16 
    | ValueI8 x => Int8
    | ValueU64 x => UInt64
    | ValueU32 x =>  UInt32
    | ValueU16 x =>  UInt16
    | ValueU8 x =>  UInt8
    | ValuePtr (AnyPtr p _) => p
    | ValueStruct x => Struct (map fst x)
    | ValueBot => Bot
    | ValueUnit => Unit
    | ValueError => ErrorType
  end
                          
.
(*  Lemma value_inj t x y: Value t x = Value t y -> x = y.
    move=> [] H. by depcomp H.
  Qed.
  
  Lemma value_surj t x y: x = y -> Value t x = Value t y. by move =>->. Qed.
 *)

Definition value_beq (x y: value) : bool :=
  match x,y with
    | Garbage, Garbage
    | Deallocated, Deallocated
    | Error, Error => true
    | ValueI64 x, ValueI64 y 
    | ValueI32 x, ValueI32 y
    | ValueI16 x, ValueI16 y
    | ValueI8 x, ValueI8 y
    | ValueU64 x, ValueU64 y
    | ValueU32 x, ValueU32 y
    | ValueU16 x, ValueU16 y
    | ValueU8 x, ValueU8 y
                         => x == y
    | ValuePtr x, ValuePtr y => x == y
    | ValueStruct x, ValueStruct y => x == y
    | ValueBot , ValueBot
    | ValueUnit, ValueUnit
    | ValueError, ValueError => true
    | _,_ => false
  end.

   Theorem value_eqP: Equality.axiom value_beq.
     move=> x y.
     case (value_beq x y) eqn:Heq; [left|right];
     destruct x, y =>//=; move /eqP in Heq; try by subst; try by case.
   Defined.
      
  Canonical value_eqMixin := EqMixin value_eqP.
  Canonical value_eqType := EqType value value_eqMixin.
  Definition value_eq_dec := @dec_from_reflect value_eqType value_eqP: eq_dec value.


  Definition coq_type (t: ctype) : Set :=
    match t with
      | Int _ => int
      | Pointer t => ptr t
      | Struct ls => seq nat
      | Bot => unit
      | Unit => unit
      | ErrorType => unit
    end.
  
                                                                                                              
 


Definition eq_value_or_error_arith {A:Type} (tl tr: ctype) (v: ctype -> ctype -> A) (err: A):A :=
 match tl, tr  with
    |Int S8, Int S8 
    |Int U8, Int U8 
    |Int S16, Int S16 
    |Int U16, Int U16 
    |Int S32, Int S32 
    |Int U32, Int U32 
    |Int S64, Int S64 
    |Int U64, Int U64 => v tl tr
    | _, _=> err 
  end
.

Definition eq_value_or_error_proved {A:Type} (tl tr: ctype) (v: tl = tr-> ctype -> ctype -> A) (err: A):A.
  refine(
    match tl == tr as t return tl==tr=t -> A with
   | true => fun Ht =>  v _ tl tr
    | false => fun Ht => err
    end _).
  exact: eqP Ht.
  reflexivity.
Defined.

Definition eq_value_or_error_proved_arith {A:Type} (tl tr: ctype) (v: tl = tr-> ctype -> ctype -> A) (err: A):A.
refine( match tl as tl_, tr as tr_ return tl = tl_-> tr = tr_ -> A with
    |Int S8, Int S8
    |Int U8, Int U8
    |Int S16, Int S16 
    |Int U16, Int U16 
    |Int S32, Int S32 
    |Int U32, Int U32 
    |Int S64, Int S64 
    |Int U64, Int U64 => fun Hl Hr =>  v _ tl tr
    | _, _=> fun _ _ => err 
  end _ _)
; try by [rewrite Hl;rewrite Hr].
reflexivity.
reflexivity.
Defined.


Definition for_eq_carriers {R} (x y: ctype) (def:R)
            (fint: int->int->R)
            (fptr: forall T, ptr T -> ptr T -> R)
            (fstruct: seq nat -> seq nat -> R)
            (fbot: unit->R)
            (ferror: unit->R)
            (xv: coq_type x)
            (yv: coq_type y)
 : R. refine (
   match x as x' , y as y' return x = x' -> y = y' -> R with
     | Int S8 as x', Int S8 as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _)
     | Int U8  as x', Int U8  as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _) 
     | Int S16 as x', Int S16 as y' =>
              fun Hx: x = x' => fun Hy: y = y' =>
                                  fint (cast xv _) (cast yv _)
     | Int U16 as x', Int U16 as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _)
     | Int S32 as x', Int S32 as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _)
     | Int U32 as x', Int U32 as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _)
     | Int S64 as x', Int S64 as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _)
     | Int U64 as x', Int U64 as y' =>
       fun Hx: x = x' => fun Hy: y = y' =>
                           fint (cast xv _) (cast yv _)
     | Pointer tx as x', Pointer ty as y'=>
       fun Hx: x = x' => fun Hy: y=y' =>
                           match tx == ty as r return r = (tx == ty) -> R with
                             | true => fun Heq : true = (tx == ty) => fptr tx (cast xv _) (cast yv _)
                             | false => fun Heq : false = (tx == ty) => def
                           end _
     | Bot, Bot => fun _ _ => fbot tt
     | ErrorType, ErrorType => fun _ _ => ferror tt
     | _, _=> fun _ _ => def
   end Logic.eq_refl Logic.eq_refl); try by subst.
      subst.
      by rewrite (eqP (Logic.eq_sym Heq)).
Defined.



       
Definition ptr_add {t} (p: ptr t) (z:int) : ptr t ? :=
  match p with
    | Nullptr => None
    | Goodptr b o => @Some _ $ Goodptr t b $ add_n_z o z
  end.
