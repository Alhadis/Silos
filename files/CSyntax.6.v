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
Require Import Compare_dec.
Require Import Types.
Require Import Envs.

(*
  a[i] = ... <-> p = a+i; *p=...
  ... = ... a[i] ... <-> p = a+i; ... =... *p ...
  ... = ... &a[i] ... <-> p = a+i; ... =... p ...

  ...a.offset... <-> ...(&a)->offset ...
*)
Inductive c_lhs : Set :=
  | C_Var : Var -> c_lhs                                             (* x *)
  | C_Deref : c_lhs -> c_lhs                                       (* *lhs *)
  | C_StructPos : c_lhs -> c_ident -> c_lhs              (* lhs->id *)  
  | C_NamePos : c_lhs -> c_ident -> c_lhs              (* lhs->id *)  
  .

Inductive c_rhs : Set :=
  | C_Const : nat -> c_rhs                                           (* n *)
  | C_FuncRef : PType -> Qualifier -> c_lhs -> c_rhs        (* (T*Q)&f *)
  | C_Lhs : c_lhs -> c_rhs                                           (* lhs *)
  | C_Ref : PType -> Qualifier -> c_lhs -> c_rhs                     (*(T*Q)&lhs *)
  | C_Add : c_rhs -> c_rhs -> c_rhs                           (* rhs+rhs *)
  | C_Cast : AType -> c_rhs -> c_rhs                        (* (T)rhs *)
  | C_Size : PType -> c_rhs                                        (* sizeof(T) *)
  | C_Alloc : PType -> Qualifier -> c_rhs -> c_rhs    (* (T*Q)malloc(rhs) *)
  .

Inductive c_cmd : Set :=
  | C_Skip : c_cmd                                                      (* skip *)
  | C_Seq : c_cmd -> c_cmd -> c_cmd                     (* c1;c2 *)
  | C_Assign : c_lhs -> c_rhs -> c_cmd                     (* lhs=rhs *)
  | C_FuncCall : c_lhs -> c_cmd                           (* f() *)
  | C_AddrCall : c_lhs -> c_cmd                           (* ( *lhs)() *)
  .

(* 
  wf_lhs/rhs/cmd check the errors during compilation
  such as
    syntax error
    undefined vars

  The var of the type struct is unrolled into the var of simple
  type,  non-struct type. such as 
  struct S1{
    int i1, i2;
  }
  struct S2{
    S1 s;
    int i3;
  }
  S2 a b;
  a = b; --->  a
*)

Inductive wf_lhs : Stack -> c_lhs -> AType -> Prop :=
  (*
     S(x) = (loc, t)
    ----------------------
     S |- x: t
  *)
  | WF_Var : forall S (v: Var) l t,
     lookUpStack S v = Some (l, t) ->
     wf_AType t ->
     wf_lhs S (C_Var v) t

  (*
     S |- lhs: t*
     ---------------------
     S |- *lhs: t
  *)
  | WF_Deref : forall S lhs t q,
     wf_lhs S lhs (A_Pointer (P_AType t) q) ->     
     wf_lhs S (C_Deref lhs) t

  (*
     S |- lhs: struct
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
    ----------------------
     S |- lhs.id: t'
  *)
  | WF_StructPos : forall S lhs id s q t' offset,
     wf_lhs S lhs (A_Pointer (P_Struct s) q) ->
     getStructOffset s id = Some offset ->
     getStructType s id = Some t' ->
     wf_lhs S (C_StructPos lhs id) t' 

  (*
     S |- lhs: struct
     typeTable n = s
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
    ----------------------
     S |- lhs.id: t'
  *)
  | WF_NamePos : forall S lhs id n s q t' offset,
     wf_lhs S lhs (A_Pointer (P_Name n) q) ->
     typeTable n = Some s ->
     getStructOffset s id = Some offset ->
     getStructType s id = Some t' ->
     wf_lhs S (C_NamePos lhs id) t' 
  .

(*
  lhs can be taken as the operand of &.
  Because &( *lhs) can be simplified into lhs.
*)
Inductive wf_nontame_ref_lhs : Stack -> c_lhs -> AType -> Prop :=
  (*
     S(x) = (loc, t)
    ----------------------
     S |- x: t
  *)
  | WF_NTR_Var : forall S (v: Var) l t,
     lookUpStack S v = Some (l, t) ->
     wf_AType t ->
     wf_nontame_ref_lhs S (C_Var v) t

  (*
     S |- lhs: struct
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
    ----------------------
     S |- lhs.id: t'
  *)
  | WF_NTR_StructPos : forall S lhs id s q t' offset,
     wf_lhs S lhs (A_Pointer (P_Struct s) q) ->
     q <> Tame ->
     getStructOffset s id = Some offset ->
     getStructType s id = Some t' ->
     wf_nontame_ref_lhs S (C_StructPos lhs id) t' 

  (*
     S |- lhs: struct
     typeTable n = s
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
    ----------------------
     S |- lhs.id: t'
  *)
  | WF_NTR_NamePos : forall S lhs id n s q t' offset,
     wf_lhs S lhs (A_Pointer (P_Name n) q) ->
     q <> Tame ->
     typeTable n = Some s ->
     getStructOffset s id = Some offset ->
     getStructType s id = Some t' ->
     wf_nontame_ref_lhs S (C_NamePos lhs id) t' 
  .

Inductive wf_tame_ref_lhs : Stack -> c_lhs -> AType -> Prop :=
  (*
     S(x) = (loc, void* )
    ----------------------
     S |- x: void*
  *)
  | WF_TR_Var : forall S (v: Var) l,
     lookUpStack S v = Some (l, (A_Pointer P_VoidPtr Tame)) ->
     wf_tame_ref_lhs S (C_Var v) (A_Pointer P_VoidPtr Tame)

  (*
     S |- lhs: struct
     getStructOffSet(t, id) = offset
     getStructType(t, id) = void*
    ----------------------
     S |- lhs.id: void*
  *)
  | WF_TR_StructPos : forall S lhs id s offset,
     wf_lhs S lhs (A_Pointer (P_Struct s) Tame) ->
     getStructOffset s id = Some offset ->
     getStructType s id = Some (A_Pointer P_VoidPtr Tame) ->
     wf_tame_ref_lhs S (C_StructPos lhs id) (A_Pointer P_VoidPtr Tame)

  (*
     S |- lhs: struct
     typeTable n = s
     getStructOffSet(t, id) = offset
     getStructType(t, id) = void*
    ----------------------
     S |- lhs.id: void*
  *)
  | WF_TR_NamePos : forall S lhs id n s offset,
     wf_lhs S lhs (A_Pointer (P_Name n) Tame) ->
     typeTable n = Some s ->
     getStructOffset s id = Some offset ->
     getStructType s id = Some (A_Pointer P_VoidPtr Tame) ->
     wf_tame_ref_lhs S (C_NamePos lhs id) (A_Pointer P_VoidPtr Tame)
  .

Inductive  wf_rhs : Stack -> c_rhs -> AType -> Prop :=
  (*
    S |- n: int
  *)
  | WF_Const : forall S n,
     wf_rhs S (C_Const n) A_Int
  
  (*
    S |- lhs: t
    ----------------------------------
    S |- lhs: t
  *)
  | WF_Lhs : forall S lhs t,
     wf_lhs S lhs t ->
     wf_rhs S (C_Lhs lhs) t

  (*
    S |- lhs: t
    ----------------------------------
    S |- &lhs: t*
  *)
  | WF_Safe_Ref : forall S lhs t,
     wf_nontame_ref_lhs S lhs t ->
     wf_AType (A_Pointer (P_AType t) Safe) -> 
     wf_rhs S (C_Ref (P_AType t) Safe lhs) (A_Pointer (P_AType t) Safe)
  | WF_Seq_Ref : forall S lhs t,
     wf_nontame_ref_lhs S lhs t->
     wf_AType (A_Pointer (P_AType t) Seq) -> 
     wf_rhs S (C_Ref (P_AType t) Seq lhs) (A_Pointer (P_AType t) Seq)
  | WF_Tame_Ref : forall S lhs t,
     wf_tame_ref_lhs S lhs t->
     wf_AType (A_Pointer (P_AType t) Tame) -> 
     wf_rhs S (C_Ref (P_AType t) Tame lhs) (A_Pointer (P_AType t) Tame)

  (*
    S |- r1: int
    S |- r2: int
    ----------------------------------
    S |- r1+r2 => (n1+n2, int)
  *)
  | WF_Add_Int_Int : forall S rhs1 rhs2,
     wf_rhs S rhs1 A_Int ->
     wf_rhs S rhs2 A_Int ->
     wf_rhs S (C_Add rhs1 rhs2) A_Int

  (*
    S |- r1: t*
    S |- r2: int
    ----------------------------------
    S |- r1+r2 => (n1+n2, t* )
  *)
  | WF_Add_Ptr_Int : forall S rhs1 rhs2 p q,
     wf_rhs S rhs1 (A_Pointer p q) ->
     wf_rhs S rhs2 A_Int ->
     wf_AType (A_Pointer p q) ->
     q = Tame -> (*FIXME: it should be q <> Safe *)
     wf_rhs S (C_Add rhs1 rhs2) (A_Pointer p q)

  (*
    S |- r:  t
    ----------------------------------
    S |- (T)r: T
  *)
  | WF_Cast : forall S rhs t t',
     wf_rhs S rhs t ->
     convertible t' t ->
     wf_AType t' ->
     wf_rhs S (C_Cast t' rhs) t'

  (*
    S |- sizeof(T): int
  *)
  | WF_Size : forall S t,
     wf_PType t ->
     wf_rhs S (C_Size t) A_Int

  (*
    S |- rhs: int
    -------------------------------
    S |- malloc(rhs)
  *)
  | WF_Alloc : forall S rhs p q size,
    wf_rhs S rhs A_Int ->
    wf_AType (A_Pointer p q) ->
    sizeOfPType p = Some size ->
    size > 0 ->
    wf_rhs S (C_Alloc p q rhs) (A_Pointer p q)
  .

Inductive wf_cmd : Stack -> c_cmd -> Prop :=
  (*
    S |-C skip
  *)
  | WF_Skip : forall S,
    wf_cmd S (C_Skip)

  (*
    S |-C c1;c2
  *)
  | WF_Seq : forall S c1 c2,
    wf_cmd S c1 ->
    wf_cmd S c2 ->
    wf_cmd S (C_Seq c1 c2)
 
  (*
    S |- lhs: tl
    S |- rhs: tr
    -------------------------------
    S |- lhs = rhs
  *)
  | WF_Assign : forall S lhs rhs tl tr, 
    wf_lhs S lhs tl ->
    wf_rhs S rhs tr ->
    convertible tl tr ->
    wf_cmd S (C_Assign lhs rhs)
  .
