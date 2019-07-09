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

Require Import List.
Require Import EqNat.
Require Import Compare_dec.
Require Import Types.
Require Import Envs.
Require Import CSyntax.

Set Implicit Arguments.

Definition Data := (Value*Meta)%type.

Inductive Result: Set :=  
| ROK : Result
| RLoc : Loc -> Result
| RLocUnsafe : Loc -> Result
| RVal : (Data*AType) -> Result
| Abort : Result
| OutofMem : Result
.

Definition Error (R: Result) := (R = Abort) \/ (R = OutofMem).
(*
    int    v  b e   <- ptr *  v  b e
    safe*  0  0 0   <- int    v  b e
    seq*   v  0 0   <- int    v  b e
    tame*  v  0 0   <- int    v  b e
    safe*  v  b e   <- seq*   v  b e
    seq*   v  v v+s <- safe*  v  b e
    _      v  b e   <- _      v  b e

    Integers can be cast to Seq and Tame with the restriction that
    the base and end fields are set to null. In conjunction with 
    assertion_ptr checks, this restriction ensures that Seq and Tame 
    pointers obtained from Integers cannot be dereferenced. Because in 
    reality, casts from pointers to integers and back to pointers are actually quite 
    rare in C programs. This is consistent with Softbound's implementation. 

*)
Definition dataCast (to:AType) (d:Data) (from:AType) : option Data :=
  if isSensitiveDec to then
    match (to, d, from) with
    | (A_Int, (v, (b, e)), (A_Pointer _ _)) => Some (v, (b, e))
    | (A_Pointer p Safe, (v, (b, e)), A_Int) => Some (0, (0, 0))
    | (A_Pointer p Seq, (v, (b, e)), A_Int) => Some (v, (0, 0))
    | (A_Pointer p Tame, (v, (b, e)), A_Int) => Some (v, (0, 0))
    | (A_Pointer _ Safe, (v, (b, e)), (A_Pointer _ Seq)) => Some (v, (b, e))
    | (A_Pointer _ Seq, (v, (b, e)), (A_Pointer p Safe)) => 
       match (sizeOfPType p) with 
       | None => None
       | Some s => Some (v, (v, v+s))
       end
    | _ => Some d
    end
  else
    match d with
    | (v, (b, e)) => Some (v, (0, 0))
    end.

Definition assertion_dataCast (to:AType) (d:Data) (from:AType) : Prop :=
  match (to,d, from) with
  | (A_Pointer p Safe, (v, (b, e)), A_Int) => 
     v = 0
  | (A_Pointer _ Safe, (v, (b, e)), (A_Pointer p Seq)) =>
    (v = 0) \/ 
    (match (sizeOfPType p) with 
    | None => False
    | Some s => (b <> 0 /\ b <= v <= e-s)
    end)
  | (_, _, _) => True
  end.

Definition assertion_ptr (v:Value) (be:Meta) (t:AType) :=
  match (v, be) with
  | (l, (b, e)) => 
     match t with 
     | A_Pointer (P_AType t) q =>
       match q with 
       | Safe => l <> 0
       | _ => b <> 0 /\ b <= l /\ l + sizeOfAType t <= e
       end
     | A_Pointer (P_Struct s) q =>
       match q with 
       | Safe => l <> 0
       | _ => b <> 0 /\ b <= l /\ l + sizeOfStruct s <= e
       end
     | A_Pointer (P_Name n) q =>
       match (typeTable n) with
       | Some s =>
         match q with 
         | Safe => l <> 0
         | _ => b <> 0 /\ b <= l /\ l + sizeOfStruct s <= e
         end
       | None => False
       end
     | A_Pointer P_Void q => False
     | A_Int => True
     end
  end.

(*
  lhs is reduced to the location of mem
  rhs is reduced to the values block of mem
  such as 
    int x y;
    x = y;
  lhs x is reduced to &x, while rhs y is reduced to y.
  The assignment does *(&x) = y, so that M(&x) = M(&y)

    int *x, *y;
    x = y;
  lhs x is reduced to &x, while rhs y is reduced to y.
  This means x and y refer to the same location by this assignment
*)
Inductive s_lhs : Env -> c_lhs -> Result -> AType -> Prop :=
  (*
     S(x) = (loc, t)
    ----------------------
     E |-L x => (loc, t)
  *)
  | S_Var : forall (E:Env) (v: Var) (l: nat) (t: AType),
     lookUpStack E.(stack) v = Some (l, t) ->  (* syntax check *)
     wf_AType t ->
     s_lhs E (C_Var v) (RLoc l) t

  (*
     sensitive t (* SE 2017 *)
     E |-L lhs => (loc, t* )
     M(loc) = Some loc' be
     assert loc' be t*
     ---------------------
     E |-L *lhs => (loc', t)
  *)
  | S_Deref : forall E lhs loc be' loc' t q,
     isSensitive_A t -> (* SE 2017: sensitive type check *)
     s_lhs E lhs (RLoc loc) (A_Pointer (P_AType t) q)  -> (* syntax check *)
     accessMemMeta E.(mem) loc = Some (loc', be') ->  (* runtime violation check *)
     assertion_ptr loc' be' (A_Pointer (P_AType t) q) -> 
     s_lhs E (C_Deref lhs) (RLoc loc') t 
  (*
     sensitive t (* SE 2017 *)
     E |-L lhs => (loc, t* )
     M(loc) = None
     M_Unsafe(loc) = Some loc_unsafe'
     --------------------------------
     E |-L *lhs => (loc_unsafe', t)
  *)
  | S_Deref_Unsafe1 : forall E lhs loc loc_unsafe' t q,
     isSensitive_A t -> (* SE 2017: sensitive type check *)
     s_lhs E lhs (RLoc loc) (A_Pointer (P_AType t) q)  -> (* syntax check *)
     accessMem E.(mem) loc = None ->  (* runtime violation check *)
     accessMem E.(mem_unsafe) loc = Some loc_unsafe' ->  (* runtime violation check *)
     s_lhs E (C_Deref lhs) (RLocUnsafe loc_unsafe') t 
  (*
     ~sensitive t (* SE 2017 *)
     E |-L lhs => (loc, t* )
     M_Unsafe(loc) = Some loc_unsafe'
     --------------------------------
     E |-L *lhs => (loc_unsafe', t)
  *)
  | S_Deref_Unsafe2 : forall E lhs loc loc_unsafe' t q,
     isSensitive_A t -> (* SE 2017: sensitive type check *)
     s_lhs E lhs (RLoc loc) (A_Pointer (P_AType t) q)  -> (* @@@@ CHECK @@@@ : neither s & u?  syntax check *)
     accessMem E.(mem_unsafe) loc = Some loc_unsafe' ->  (* runtime violation check *)
     s_lhs E (C_Deref lhs) (RLocUnsafe loc_unsafe') t 
  | S_Deref_ErrorProp : forall E lhs R t t',
     s_lhs E lhs R t -> Error R -> (* Error *)
     s_lhs E (C_Deref lhs) R t'
  | S_Deref_Abort : forall E lhs loc be' loc' t q,
     isSensitive_A t -> (* SE 2017: sensitive type check *)
     s_lhs E lhs (RLoc loc) (A_Pointer (P_AType t) q) -> (* syntax check *)
     accessMemMeta E.(mem) loc = Some (loc', be') ->  (* runtime violation check *)
     ~assertion_ptr loc' be' (A_Pointer (P_AType t) q) -> 
     s_lhs E (C_Deref lhs) Abort t
  
  (* SE 2017 
     sensitive t 
     E |-L lhs => (loc_unsafe, t* ) 
     ------------------------------
     E |-L *lhs => Abort 
  *)
  | S_Deref_Abort_Unsafe : forall E lhs loc t q,
      isSensitive_A t -> 
      s_lhs E lhs (RLocUnsafe loc) (A_Pointer (P_AType t) q) ->
      s_lhs E (C_Deref lhs) Abort t

  (*
     sensitive t (* SE 2017 *)
     E |-L lhs => (loc, struct)
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
     size t' > 0
    ----------------------
     E |-L lhs.id => (loc+offset, t')
  *)
  | S_StructPos : forall E lhs id loc s q t' offset be' loc',
     isSensitive_S s -> (* SE 2017: sensitive type check *)
     s_lhs E lhs (RLoc loc) (A_Pointer (P_Struct s) q) ->
     accessMemMeta E.(mem) loc = Some (loc', be') ->  (* runtime violation check *)
     getStructOffset s id = Some offset ->  (* Syntax check *)
     getStructType s id = Some t' ->            (* Syntax check *)
     assertion_ptr loc' be' (A_Pointer (P_Struct s) q) -> 
     s_lhs E (C_StructPos lhs id) (RLoc (loc'+offset)) t'
  | S_StructPos_ErrorProp : forall E lhs id R t t',
     s_lhs E lhs R t -> Error R ->
     s_lhs E (C_StructPos lhs id) R t'
  | S_StructPos_Abort : forall E lhs id loc s q t' offset be' loc',
     isSensitive_S s -> (* SE 2017: sensitive type check *)
     s_lhs E lhs (RLoc loc) (A_Pointer (P_Struct s) q) ->
     accessMemMeta E.(mem) loc = Some (loc', be') ->  (* runtime violation check *)
     getStructOffset s id = Some offset ->  (* Syntax check *)
     getStructType s id = Some t' ->            (* Syntax check *)
     ~ assertion_ptr loc' be' (A_Pointer (P_Struct s) q) -> 
     s_lhs E (C_StructPos lhs id) Abort t'
  (* SE 2017 
     sensitive t
     E |-L lhs => (loc_unsafe, struct)
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
     -----------------------------
     E |-L lhs.id => Abort t' 
  *)
  | S_StructPos_Abort_Unsafe : forall E lhs id loc s q t' offset,
     isSensitive_S s ->
     s_lhs E lhs (RLocUnsafe loc) (A_Pointer (P_Struct s) q) ->
     getStructOffset s id = Some offset -> (* Syntax check *)
     getStructType s id = Some t' -> (* Syntax check *)
     s_lhs E (C_StructPos lhs id) Abort t'

  (*
     E |-L lhs => (loc, struct)
     typeTable n = s
     sensitive s (* SE 2017 *)
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
     size t' > 0
    ----------------------
     E |-L lhs.id => (loc+offset, t')
  *)
  | S_NamePos : forall E lhs id loc n s q t' offset be' loc',
     s_lhs E lhs (RLoc loc) (A_Pointer (P_Name n) q) ->
     accessMemMeta E.(mem) loc = Some (loc', be') ->  (* runtime violation check *)
     typeTable n = Some s ->
     isSensitive_S s -> (* SE 2017: sensitive type check *)
     getStructOffset s id = Some offset ->  (* Syntax check *)
     getStructType s id = Some t' ->            (* Syntax check *)
     assertion_ptr loc' be' (A_Pointer (P_Name n) q) -> 
     s_lhs E (C_NamePos lhs id) (RLoc (loc'+offset)) t'
  | S_NamePos_ErrorProp : forall E lhs id R t t',
     s_lhs E lhs R t -> Error R ->
     s_lhs E (C_NamePos lhs id) R t'
  | S_NamePos_Abort : forall E lhs id loc n s q t' offset be' loc',
     s_lhs E lhs (RLoc loc) (A_Pointer (P_Name n) q) ->
     accessMemMeta E.(mem) loc = Some (loc', be') ->  (* runtime violation check *)
     typeTable n = Some s ->
     isSensitive_S s -> (* SE 2017: sensitive type check *)
     getStructOffset s id = Some offset ->  (* Syntax check *)
     getStructType s id = Some t' ->            (* Syntax check *)
     ~ assertion_ptr loc' be' (A_Pointer (P_Name n) q) -> 
     s_lhs E (C_NamePos lhs id) Abort t'
  (* SE 2017 
     E |-L lhs => (loc_unsafe, struct)
     typeTable n = s
     sensitive s
     getStructOffSet(t, id) = offset
     getStructType(t, id) = t'
     ----------------------------------
     E |-L lhs.id => Abort t' 
  *)
  | S_NamePos_Abort_Unsafe : forall E lhs id loc n s q t' offset,
      s_lhs E lhs (RLocUnsafe loc) (A_Pointer (P_Name n) q) ->
      typeTable n = Some s ->
      isSensitive_S s ->
      getStructOffset s id = Some offset ->
      getStructType s id = Some t' ->
      s_lhs E (C_NamePos lhs id) Abort t'
     
  .

Inductive  s_rhs : Env -> c_rhs -> Result  -> AType -> Env -> Prop :=
  (*
    E |-R n => (n 0 0, int)
  *)
  | S_Const : forall E n,
     s_rhs E (C_Const n) (RVal ((n, (0,0)), (A_Int))) A_Int E

  (*
    E |-L lhs => (loc, t)
    M(loc, sizeOfType t) = vs
    ----------------------------------
    E |-R lhs => (vs, t)

    We do not check whether vs is a block including only the valid data.
    Because reading invalid data does not hurt anything.
  *)
  | S_Lhs : forall E lhs loc t ds,
     s_lhs E lhs (RLoc loc) t ->
     accessMemMeta E.(mem) loc = Some ds->  (* runtime violation check *)
     s_rhs E (C_Lhs lhs) (RVal (ds, (E.(typeInfo) loc))) t E
  | S_Lhs_ErrorProp : forall E lhs R t t',
     s_lhs E lhs R t -> Error R -> (* Error *)
     s_rhs E (C_Lhs lhs) R t' E

  (*
    E |-L lhs => (loc, t)
    ----------------------------------
    E |-R &lhs => (loc loc loc+size t, t* q) 
  *)
  | S_Ref_Safe : forall E lhs loc t,
     s_lhs E lhs (RLoc loc) t ->
     wf_nontame_ref_lhs E.(stack) lhs t->
     wf_AType (A_Pointer (P_AType t) Safe) -> 
     s_rhs E (C_Ref (P_AType t) Safe lhs) 
                   (RVal 
                      ((loc, (0, 0)),
                      (A_Pointer (P_AType t) Safe))) 
                   (A_Pointer (P_AType t) Safe) E
  | S_Ref_Seq : forall E lhs loc t (*n be*),
     s_lhs E lhs (RLoc loc) t ->
     wf_nontame_ref_lhs E.(stack) lhs t ->
     wf_AType (A_Pointer (P_AType t) Seq) -> 
     s_rhs E (C_Ref (P_AType t) Seq lhs) 
                   (RVal 
                      ((loc, (loc, loc+sizeOfAType t)),
                      (A_Pointer (P_AType t) Seq))) 
                   (A_Pointer (P_AType t) Seq) E
  | S_Ref_Tame : forall E lhs loc t (*n be*),
     s_lhs E lhs (RLoc loc) t ->
     wf_tame_ref_lhs E.(stack) lhs t ->
     wf_AType (A_Pointer (P_AType t) Tame) -> 
     s_rhs E (C_Ref (P_AType t) Tame lhs) 
                   (RVal 
                      ((loc, (loc, loc+sizeOfAType t)),
                      (A_Pointer (P_AType t) Tame))) 
                   (A_Pointer (P_AType t) Tame) E
  | S_Ref_ErrorProp : forall E lhs R t q,
     s_lhs E lhs R t -> Error R -> (* Error *)
     s_rhs E (C_Ref (P_AType t) q lhs) R (A_Pointer (P_AType t) q) E

  (*
    E |-R r1 => (n1 be1, int)
    E |-R r2 => (n2 be2, int)
    ----------------------------------
    E |-R r1+r2 => (n1+n2 0 0, int)
  *)
  | S_Add_Int_Int : forall E E' E'' rhs1 ds1 rhs2 ds2 n1 n2 be1 be2,
     s_rhs E rhs1 (RVal ds1) A_Int E' -> (* syntax check *)
     s_rhs E' rhs2 (RVal ds2) A_Int E'' -> (* syntax check *)
     fst ds1 = (n1, be1) ->
     fst ds2 = (n2, be2) ->
     s_rhs E (C_Add rhs1 rhs2) 
                   (RVal ((n1+n2, (0,0)), A_Int))
                   A_Int E''
  | S_Add_Int_Int_ErrorProp1 : forall E E' rhs1 R t rhs2 t',
     s_rhs E rhs1 R t E' -> Error R -> (* error *)
     s_rhs E (C_Add rhs1 rhs2) R t' E'
  | S_Add_Int_Int_ErrorProp2 : forall E E' E'' rhs1 ds1 rhs2 R t t',
     s_rhs E rhs1 (RVal ds1) A_Int E' -> (* syntax check *)
     s_rhs E' rhs2 R t E'' -> Error R -> (* error *)
     s_rhs E (C_Add rhs1 rhs2) R t' E''

  (*
    E |-R r1 => (n1 be1, t* )
    E |-R r2 => (n2 be2, int)
    ----------------------------------
    E |-R r1+r2 => ((n1 + n2 *size t) be1, t* ) 
  *)
  | S_Add_Ptr_Int : forall E E' E'' rhs1 ds1 rhs2 ds2 p n1 n2 be1 be2 size q,
     s_rhs E rhs1 (RVal ds1) (A_Pointer p q) E' -> (* syntax check *)
     s_rhs E' rhs2 (RVal ds2) A_Int E'' -> (* syntax check *)
     fst ds1 = (n1, be1) ->
     fst ds2 = (n2, be2) ->
     wf_AType (A_Pointer p q) ->
     sizeOfPType p = Some size ->
     q = Tame -> (*FIXME: it should be q <> Safe *)
     s_rhs E (C_Add rhs1 rhs2) 
                   (RVal ((n1+n2*size, be1), ((A_Pointer p q))))
                   (A_Pointer p q) E''
  | S_Add_Ptr_Int_ErrorProp1 : forall E E' rhs1 R t rhs2 t',
     s_rhs E rhs1 R t E' -> Error R -> (* error *)
     s_rhs E (C_Add rhs1 rhs2) R t' E'
  | S_Add_Ptr_Int_ErrorProp2 : forall E E' E'' rhs1 ds1 rhs2 R p t' t'' q,
     s_rhs E rhs1 (RVal ds1) (A_Pointer p q) E' -> (* syntax check *)
     s_rhs E' rhs2 R t' E'' -> Error R -> (* error *)
     q = Tame ->
     s_rhs E (C_Add rhs1 rhs2) R t'' E''

  (*
    S, H, M |-R r => (n, t)
    ----------------------------------
    S, H, M |-R (T)r => (n, T)

    By convertible, only the t's with the same type size can
    be convertable into each other. So vs got from rhs can
    be safely reused by (C_Cast t' rhs).
  *)
  | S_Cast : forall E E' rhs ds t t' d,
     s_rhs E rhs (RVal ds) t E' -> 
     convertible t' t ->
     wf_AType t' ->
     dataCast t' (fst ds) t = Some d ->
     assertion_dataCast t' (fst ds) t ->
     s_rhs E (C_Cast t' rhs) (RVal (d, snd ds)) t' E'
  | S_Cast_ErrorProp : forall E E' rhs R t t' t'',
     s_rhs E rhs R t E'  -> Error R -> (* error *)
     s_rhs E (C_Cast t' rhs) R t'' E'
  | S_Cast_Abort : forall E E' rhs ds t t' d,
     s_rhs E rhs (RVal ds) t E' -> 
     convertible t' t ->
     wf_AType t' ->
     dataCast t' (fst ds) t = Some d ->
     ~ assertion_dataCast t' (fst ds) t ->
     s_rhs E (C_Cast t' rhs) Abort t' E'

  (*
    E |-R sizeof(T) => (sizeOfType t 0 0, int)
  *)
  | S_Size : forall E t size,
     wf_PType t ->
     sizeOfPType t = Some size ->
     s_rhs E (C_Size t) (RVal ((size, (0,0)), A_Int)) A_Int E

  (*
    E |-R rhs => (n, int)
    malloc E n = Some (E', loc)
    M'[ll -> loc, loc, loc+n] = Some M'' // meta is updated
    -------------------------------
    E |-R malloc(rhs) => E''
  *)
  | S_Alloc_Safe : forall E E' E'' rhs ds loc n be size p,
    s_rhs E rhs (RVal ds) A_Int E'-> (* syntax check *)
    wf_AType (A_Pointer p Safe) ->
    fst ds = (n, be) ->
    sizeOfPType p = Some size -> 
    n >= size -> size > 0 ->
    malloc E' n = Some (E'', loc)->  (* outOfMem checking *)
    s_rhs E (C_Alloc p Safe rhs) 
                  (RVal ((loc, (0, 0)), (A_Pointer p Safe))) 
                  (A_Pointer p Safe) 
                  (MkEnv E''.(mem) E''.(mem_unsafe) E''.(stack) (updateTypeInfo E''.(typeInfo) loc p n))
  | S_Alloc_Seq : forall E E' E'' rhs ds loc n be size p,
    s_rhs E rhs (RVal ds) A_Int E'-> (* syntax check *)
    wf_AType (A_Pointer p Seq) ->
    fst ds = (n, be) ->
    sizeOfPType p = Some size -> 
    size > 0 ->
    malloc E' n = Some (E'', loc)->  (* outOfMem checking *)
    s_rhs E (C_Alloc p Seq rhs) 
                  (RVal ((loc, (loc, loc+n)), (A_Pointer p Seq))) 
                  (A_Pointer p Seq) 
                  (MkEnv E''.(mem) E''.(mem_unsafe) E''.(stack) (updateTypeInfo E''.(typeInfo) loc p n))
  | S_Alloc_Tame : forall E E' E'' rhs ds loc n be p size,
    s_rhs E rhs (RVal ds) A_Int E'-> (* syntax check *)
    wf_AType (A_Pointer p Tame) ->
    fst ds = (n, be) ->
    sizeOfPType p = Some size -> 
    size > 0 ->
    malloc E' n = Some (E'', loc)->  (* outOfMem checking *)
    s_rhs E (C_Alloc p Tame rhs) 
                  (RVal ((loc, (loc, loc+n)), (A_Pointer p Tame))) 
                  (A_Pointer p Tame)
                  (MkEnv E''.(mem) E''.(mem_unsafe) E''.(stack) (updateTypeInfo E''.(typeInfo) loc p n))
  | S_Alloc_ErrorProp : forall E E' rhs R t t' p q,
    s_rhs E rhs R t E'-> Error R -> (* error *)
    wf_AType (A_Pointer p q) ->
    s_rhs E (C_Alloc p q rhs) R t' E'
  | S_Alloc_OutofMem : forall E E' rhs ds n be t' p q size,
    s_rhs E rhs (RVal ds) A_Int E'-> (* syntax check *)
    wf_AType (A_Pointer p q) ->
    fst ds = (n, be) ->
    sizeOfPType p = Some size -> 
    size > 0 ->
    malloc E' n = None->  (* outOfMem*)
    s_rhs E (C_Alloc p q rhs) OutofMem t' E'
  | S_Alloc_Safe_Abort : forall E E' rhs ds n be p t' size,
    s_rhs E rhs (RVal ds) A_Int E'-> (* syntax check *)
    wf_AType (A_Pointer p Safe) ->
    fst ds = (n, be) ->
    sizeOfPType p = Some size -> 
    n < size ->
    s_rhs E (C_Alloc p Safe rhs) Abort t' E'
  .

Inductive s_cmd : Env -> c_cmd -> Result-> Env->Prop :=
  (*
    E |-C skip => E
  *)
  | S_Skip : forall E,
    s_cmd E (C_Skip) ROK E

  (*
    E  |-C c1 => E'
    E' |-C c2 => E''
   -------------------------- 
    E |-C c1;c2 => E''
  *)
  | S_Seq : forall E E' E'' c1 c2,
    s_cmd E c1 ROK E' ->
    s_cmd E' c2 ROK E'' ->
    s_cmd E (C_Seq c1 c2) ROK E''
  | S_Seq_ErrorProp1 : forall E E' R c1 c2,
    s_cmd E c1 R E' -> Error R->
    s_cmd E (C_Seq c1 c2) R E'
  | S_Seq_ErrorProp2 : forall E E' E'' c1 c2 R,
    s_cmd E c1 ROK E' ->
    s_cmd E' c2 R E'' -> Error R->
    s_cmd E (C_Seq c1 c2) R E''

  (*
    SHM |-L lhs => (loc, tl)
    SHM |-R rhs => ((n, be), tr)
     tl <- tr
     M[ll -> n] = Some M' // copy meta data if tl is ptr
                                               // dont copy meta data if tl is non-ptr     
    -------------------------------
    SHM |-C lhs = rhs => S,H,M[loc->n]
  *)
  | S_Assign_Ptr : forall E E' lhs rhs loc tl ds tr M'' d, 
    s_lhs E lhs (RLoc loc) tl ->
    s_rhs E rhs (RVal ds) tr E' ->
    isPtr tl -> 
    dataCast tl (fst ds) tr = Some d ->
    assertion_dataCast tl (fst ds) tr ->
    storeMemMeta E'.(mem) loc d = Some M''->
    convertible tl tr ->      (* syntax checking *)
    s_cmd E (C_Assign lhs rhs) ROK (MkEnv M'' E'.(mem_unsafe) E'.(stack) E'.(typeInfo))
  | S_Assign_NPtr : forall E E' lhs rhs loc tl ds tr M'' d, 
    s_lhs E lhs (RLoc loc) tl ->
    s_rhs E rhs (RVal ds) tr E' ->
    ~isPtr tl -> 
    dataCast tl (fst ds) tr = Some d ->
    assertion_dataCast tl (fst ds) tr ->
    storeMem E'.(mem) loc (fst d) = Some M''->
    convertible tl tr ->      (* syntax checking *)
    s_cmd E (C_Assign lhs rhs) ROK (MkEnv M'' E'.(mem_unsafe) E'.(stack) E'.(typeInfo))
  | S_Assign_ErrorProp1 : forall E lhs rhs tl R, 
    s_lhs E lhs R tl -> Error R->
    s_cmd E (C_Assign lhs rhs) R E
  | S_Assign_ErrorProp2 : forall E E' lhs rhs loc tl R tr, 
    s_lhs E lhs (RLoc loc) tl ->
    s_rhs E rhs R tr E' -> Error R->
    s_cmd E (C_Assign lhs rhs) R E'
  | S_Assign_Ptr_Abort : forall E E' lhs rhs loc tl ds tr d, 
    s_lhs E lhs (RLoc loc) tl ->
    s_rhs E rhs (RVal ds) tr E' ->
    isPtr tl -> 
    dataCast tl (fst ds) tr = Some d ->
    ~ assertion_dataCast tl (fst ds) tr ->
    convertible tl tr ->      (* syntax checking *)
    s_cmd E (C_Assign lhs rhs) Abort E'
  (* SE 2017
    sensitive t
    E |-L lhs => (loc_unsafe, t)
    ----------------------------
    E |-C lhs = rhs => (Abort, E)
  *)
  | S_Assign_Abort_Unsafe : forall E lhs rhs loc t,
    isSensitive_A t ->
    s_lhs E lhs (RLocUnsafe loc) t ->
    s_cmd E (C_Assign lhs rhs) Abort E
  (* SE 2017
    sensitive t 
    E |- lhs => (loc, tl)
    E |- rhs => (v, tr)
    M_Unsafe[loc] = Some M_Unsafe'
    ------------------------------
    E |-C lhs = rhs => E'[loc->v]
  *)
  | S_Assign_Unsafe_Write1 : forall E E' lhs rhs loc tl ds tr M'' d,
    isSensitive_A tl ->
    s_lhs E lhs (RLoc loc) tl ->
    s_rhs E rhs (RVal ds) tr E' ->
    dataCast tl (fst ds) tr = Some d ->
    storeMem E'.(mem_unsafe) loc (fst d) = Some M''->
    (*storeMem E'.(mem) loc NONE = Some M'' -> (* XXX: NONE???? *) *)
    convertible tl tr ->    (* CHECK convertible ? *)
    s_cmd E (C_Assign lhs rhs) ROK (MkEnv M'' E'.(mem_unsafe) E'.(stack) E'.(typeInfo))
  (* SE 2017
    ~sensitive t
    E |- lhs => (loc, tl)
    E |- rhs => (v, tr)
    M_Unsafe[loc] = Some M_Unsafe'
    ------------------------------
    E |-C lhs = rhs => E'[loc->v]
  *)
  | S_Assign_Unsafe_Write2 : forall E E' lhs rhs loc tl ds tr M'' d,
    ~isSensitive_A tl ->
    s_lhs E lhs (RLocUnsafe loc) tl ->
    s_rhs E rhs (RVal ds) tr E' ->
    dataCast tl (fst ds) tr = Some d ->
    storeMem E'.(mem_unsafe) loc (fst d) = Some M''->
    convertible tl tr ->    (* CHECK convertible ? *)
    s_cmd E (C_Assign lhs rhs) ROK (MkEnv M'' E'.(mem_unsafe) E'.(stack) E'.(typeInfo))
  .
