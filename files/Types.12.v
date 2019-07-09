(************************************************************************************)
(* Copyright (c) 2009 Santosh Nagarakatte, Milo M. K. Martin. All rights reserved.  *)
(*                                                                                  *)
(* Developed by: Santosh Nagarakatte, Milo M.K. Martin,                             *)
(*               Jianzhou Zhao, Steve Zdancewic                                     *)
(*               Department of Computer and Information Sciences,                   *)
(*               University of Pennsylvania                                         *)
(*               http://www.cis.upenn.edu/acg/softbound/                            *)
(*                                                                                  *)
(* Permission is hereby granted, free of charge, to any person obtaining a copy     *)
(* of this software and associated documentation files (the "Software"), to         *)
(* deal with the Software without restriction, including without limitation the     *)
(* rights to use, copy, modify, merge, publish, distribute, sublicense, and/or      *)
(* sell copies of the Software, and to permit persons to whom the Software is       *)
(* furnished to do so, subject to the following conditions:                         *)
(*                                                                                  *)
(*   1. Redistributions of source code must retain the above copyright notice,      *)
(*      this list of conditions and the following disclaimers.                      *)
(*                                                                                  *)
(*   2. Redistributions in binary form must reproduce the above copyright           *)
(*      notice, this list of conditions and the following disclaimers in the        *)
(*      documentation and/or other materials provided with the distribution.        *)
(*                                                                                  *)
(*   3. Neither the names of Santosh Nagarakatte, Milo M. K. Martin,                *)
(*      Jianzhou Zhao, Steve Zdancewic, University of Pennsylvania, nor             *)
(*     the names of its contributors may be used to endorse or promote              *)
(*     products derived from this Software without specific prior                   *)
(*     written permission.                                                          *)
(*                                                                                  *)
(* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR       *)
(* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,         *)
(* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE     *)
(* CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *)
(* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING          *)
(* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS     *)
(* WITH THE SOFTWARE.                                                               *)
(************************************************************************************)

Require Import EqNat.
Require Import List.
Require Import Compare_dec.
Require Import Omega.
Require Import Zdiv.

(*
  Softbound does the following translation
  1) multi-D array to single-D array, i.e.
      int a[10][9]; -> int a[90];
      d = a [4][5]; -> d = a[41];
  2) single-D array to ptr, such as
       int a[10];
     ->
       int a'[10];
       int* a = &a';
  The reason for the translation is
    The memory layout of array is different from ptr's.
    the data ptr refers to is allocated in heap, the data 
    which ptr stores is the address of the data on heap.

    but, the data of array are stored in the stack, the
    data of the array stored are the data on stack, rather
    than on heap.
  Recall, the representation of TAME is
    for each data v which is at the location loc,
       M(loc) = v
       M(loc+offset) = base
       M(loc+2*offset) = bound.
  If v is the address, like ptr, this is ok,
  but if the layout of array does not work, 
     because M(loc) is data in this case
  So, type array can be safely removed.
    FIXME, do we need to prove 'the removement is sound'?
*)

(*
  nested structure is illegal in C, such as 
  struct A {  ... A a; ... }. This doesnot matter to
  our system, because we dont name any type,
  so that the nested infinit struct can not be 
  defined in practice.

  However, like C, nested structure pointer is ok.
*)
Definition c_ident := nat.
Inductive Qualifier : Set :=
  | Safe
  | Seq
  | Tame
  .
(*
  Lets show struct can be unrolled into atomic types.
  The data and operation about struct can also be translated
  into atomic-type-level things.

  struct A {
    int * a1;
    int a2;
  }

  struct B {
    struct A b1;
    int * b2;
    struct B* b3;
  }

   B b,*bb;
   b.b2 = 0;
   bb = &b;
   b =  *bb;  
   bb->b3 = 0;

   int * b;  //b_b1_a1
   int   b_b1_a2;
   int * b_b2;
   int * b_b3 = &b;
   int** bb;

   *(&b + 2)  = 0;
   *bb = &b;

   *(&b) = *bb;
   *(&b+1) = *(bb+1);
   *(&b+2) = *(bb+2);   
   *(&b+2) = *(bb+3);

   *(bb+3) = 0;
*)
Inductive AType : Set :=
  | A_Int: AType
  | A_Pointer: PType -> Qualifier -> AType          (* T *Q *)
with Struct : Set :=
  | S_Nil : Struct
  | S_Cons : c_ident -> AType -> Struct -> Struct
with PType : Set :=
  | P_AType : AType -> PType
  | P_Struct : Struct -> PType
  | P_Func : PType
  | P_Name : c_ident -> PType 
  | P_VoidPtr: PType
  .

Parameter typeTable : c_ident -> option Struct.

(* SE project 2017 *)
Fixpoint isSensitive_A (t : AType) : Prop :=
  match t with
  | A_Int => False
  | A_Pointer p _ => isSensitive_P p
  end

with isSensitive_P (t : PType) : Prop :=
  match t with
  | P_AType t' => isSensitive_A t'
  | P_Struct s => match s with
                  | S_Nil => True
                  | S_Cons _ t' s' => isSensitive_A t' \/ isSensitive_S s'
                  end
  | P_Func => True
  | P_Name n => True (* TODO: lookup typeTable and return sensitive of struct *)
  | P_VoidPtr => True
  end

with isSensitive_S (t : Struct) : Prop :=
  match t with
  | S_Nil => True
  | S_Cons _ t' s' => isSensitive_A t' \/ isSensitive_S s'
  end.

Parameter isSensitiveDec : forall t : AType, {isSensitive_A t} 
                                              + {~isSensitive_A t}.
(* SE project 2017 *)

Scheme AType_mut_ind := Induction for AType Sort Prop
with Struct_mut_ind := Induction for Struct Sort Prop
with PType_mut_ind := Induction for PType Sort Prop.

Definition mutual_AType_Struct_ind P P' P'':=
  fun h1 h2 h3 h4 h5 h6 h7 h8 h9=>
    conj (@AType_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9)
           (conj  (@Struct_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9)
                     (@PType_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9)).

Fixpoint sizeOfAType (t : AType) : nat :=
  match t with
  | A_Int => 1
  | A_Pointer _ _ => 1
  end.

Fixpoint sizeOfStruct (s : Struct) : nat :=
  match s with 
  | S_Nil => 0
  | S_Cons _ t s' => sizeOfStruct s' + sizeOfAType t
  end
  .

Definition sizeOfPType (p : PType) : option nat :=
  match p with
  | P_AType t => Some (sizeOfAType t)
  | P_Struct s => Some (sizeOfStruct s)
  | P_Func => Some 1
  | P_Name n => 
     match (typeTable n) with 
     | Some s => Some (sizeOfStruct s)
     | None => None
     end 
  | P_VoidPtr => Some 1
  end
  .

Fixpoint getStructOffset (s : Struct) (id : c_ident) {struct s}: option nat :=
  match s with
  | S_Nil => None
  | S_Cons i t s' => 
    if (beq_nat i id)
    then
      Some 0
    else
      match (getStructOffset s' id) with 
      | Some n => Some (n + sizeOfAType t)
      | None => None
      end
  end. 

Fixpoint getStructType (s : Struct) (id : c_ident) {struct s}: option AType :=
  match s with
  | S_Nil => None
  | S_Cons i t s' => 
    if (beq_nat i id)
    then
      Some t
    else
      getStructType s' id
  end. 

Fixpoint getStructNthType (s : Struct) (ith : nat) {struct s}: option AType :=
  match s with
  | S_Nil => None
  | S_Cons i t s' =>
    match ith with
    | O => Some t
    | S ith' => getStructNthType s' ith'
    end
  end. 

Definition getNthPType (p: PType) (ith : nat): option AType :=
  match p with 
  | P_AType t => 
    match ith with 
    | O => Some t
    | _ => None
    end
  | P_Struct s => getStructNthType s ith
  | P_Func => None
  | P_Name n => 
    match (typeTable n) with
    | Some s => getStructNthType s ith
    | None => None
    end
  | P_VoidPtr => None
  end.

Inductive atypeEqual : AType -> AType ->  Prop :=
  | atypeEqual_Int : atypeEqual A_Int A_Int
  | atypeEqual_Pointer : forall p1 p2 q1 q2,
      ptypeEqual p1 p2 ->
      q1 = q2 -> 
      atypeEqual (A_Pointer p1 q1) (A_Pointer p2 q2)
with structEqual : Struct -> Struct -> Prop :=
  | structEqual_Nil : structEqual S_Nil S_Nil
  | structEqual_Cons : forall t1 t2 s1 s2 id1 id2,
      atypeEqual t1 t2 ->
      structEqual s1 s2 ->
      structEqual (S_Cons id1 t1 s1) (S_Cons id2 t2 s2)
with ptypeEqual : PType -> PType -> Prop :=
  | ptypeEqual_AType : forall t1 t2,
       atypeEqual t1 t2  ->
       ptypeEqual (P_AType t1) (P_AType t2)
  | ptypeEqual_Struct : forall s1 s2,
       structEqual s1 s2 ->
       ptypeEqual (P_Struct s1) (P_Struct s2)
  | ptypeEqual_Func : ptypeEqual P_Func P_Func
  | ptypeEqual_Name : forall n1 n2 s1 s2,
       typeTable n1 = Some s1 ->
       typeTable n2 = Some s2 ->
       structEqual s1 s2 ->
       ptypeEqual (P_Name n1) (P_Name n2)
  | ptypeEqual_EqName : forall n,
       ptypeEqual (P_Name n) (P_Name n)
  | ptypeEqual_VoidPtr : ptypeEqual P_VoidPtr P_VoidPtr
  .

Inductive optionAtypeEqual : option AType -> option AType ->  Prop :=
  | optionAtypeEqual_none : optionAtypeEqual None None
  | optionAtypeEqual_some : forall a a',
                            atypeEqual a a' ->
                            optionAtypeEqual (Some a) (Some a')
  .

Scheme atypeEqual_mut_ind := Induction for atypeEqual Sort Prop
with structEqual_mut_ind := Induction for structEqual Sort Prop
with ptypeEqual_mut_ind := Induction for ptypeEqual Sort Prop.

Definition mutual_atype_struct_ptype_Equal_ind P P' P'':=
  fun h1 h2 h3 h4 h5 h6 h7 h8 h9 h10=>
    conj (@atypeEqual_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9 h10)
         (conj (@structEqual_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9 h10)
                  (@ptypeEqual_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9 h10)).

Definition convertible (t1 t2: AType) : Prop :=
  match (t1, t2) with
  | (A_Int, A_Int) => True
  | (A_Int, A_Pointer _ _ ) => True
 
  | (A_Pointer _ q, A_Int) =>
    match q with
    | Safe => False
    | _=> True
    end
  | (A_Pointer p1 q1, A_Pointer p2 q2) =>
    match (q1, q2) with
    | (Safe, Safe) => ptypeEqual p1 p2
    | (Seq, Seq) => ptypeEqual p1 p2
    | (Safe, Seq) => ptypeEqual p1 p2
    | (Seq, Safe) => ptypeEqual p1 p2
    | (Tame, Tame) => True
    | _=> False
    end
  end
  .

Definition isPtr (t: AType) : Prop :=
   match t with
   | A_Pointer _ _ => True
   | _=> False
   end
   .

Inductive isTameAType : AType -> Prop :=
  | isTameAType_Int : isTameAType A_Int
  | isTameAType_Pointer: forall p,
     isTamePType p -> isTameAType (A_Pointer p Tame)
with  isTameStruct : Struct -> Prop :=
  | isTameStruct_Nil : isTameStruct S_Nil
  | isTameStruct_Cons : forall id t s,
     isTameAType t ->
     isTameStruct s ->
     isTameStruct (S_Cons id t s)
with  isTamePType : PType -> Prop :=
  | isTamePType_AType : forall t,
     isTameAType t -> isTamePType (P_AType t)
  | isTamePType_Struct : forall s,
     isTameStruct s -> isTamePType (P_Struct s)
  | isTamePType_Func : isTamePType P_Func
  | isTamePType_Name : forall n s,
     typeTable n = Some s ->
     isTameStruct s ->
     isTamePType (P_Name n)
  | isTamePType_VoidPtr : isTamePType P_VoidPtr
   .

Definition isNotVoid (p : PType) : Prop :=
  match p with
  | P_VoidPtr => False
  | _ => True
  end
  .

Inductive wf_AType : AType -> Prop :=
  | wf_A_Int: wf_AType A_Int
  | wf_A_SafePointer: forall p,  
    wf_PType p -> 
    isNotVoid p ->
    wf_AType (A_Pointer p Safe)
  | wf_A_SeqPointer: forall p,  
    wf_PType p -> 
    isNotVoid p ->
    wf_AType (A_Pointer p Seq)
  | wf_A_TamePointer: forall p,  
    isTamePType p -> 
    wf_PType p -> 
    wf_AType (A_Pointer p Tame)
with  wf_Struct : Struct -> Prop :=
  | wf_S_Nil : wf_Struct S_Nil
  | wf_S_Cons : forall id t s,
    wf_AType t -> wf_Struct s -> wf_Struct (S_Cons id t s)
with  wf_PType : PType -> Prop :=
  | wf_P_AType : forall t,
    wf_AType t -> 
    wf_PType (P_AType t)
  | wf_P_Struct: forall s,  
    wf_Struct s -> wf_PType (P_Struct s)
  | wf_P_Func: wf_PType P_Func
  | wf_P_Name: forall n s,  
    typeTable n = Some s ->
    wf_Struct s -> 
    wf_PType (P_Name n)
  | wf_P_VoidPtr: wf_PType P_VoidPtr
  .

Scheme wf_AType_mut_ind := Induction for wf_AType Sort Prop
with wf_Struct_mut_ind := Induction for wf_Struct Sort Prop
with wf_PType_mut_ind := Induction for wf_PType Sort Prop.

Definition mutual_wf_AType_Struct_PType_ind P P' P'':=
  fun h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11=>
    conj (@wf_AType_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11)
         (conj (@wf_Struct_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11)
                  (@wf_PType_mut_ind P P' P'' h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11)).

Definition nat_of_Z (z: Z) : nat :=
  match z with
  | Z0 => O
  | Zpos p => nat_of_P p
  | Zneg p => O
  end.

Definition mmod (q p m: nat) : option nat :=
  match m with 
  | O => None
  | S _ =>
    (* le_lt_dec p q : {p <= q} + {p > q} *)
    match (le_lt_dec p q) with
    | left _ =>                                   (* {p <= q} *)
         Some (nat_of_Z (Zmod (Z_of_nat (q - p)) (Z_of_nat m)))
    | right _ =>                                 (* {p > q} *)
         Some (m - (nat_of_Z (Zmod (Z_of_nat (p - q)) (Z_of_nat m))))
    end
  end.
