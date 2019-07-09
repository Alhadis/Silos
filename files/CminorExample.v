Require Import csrc.bar.

Require Import compcert.exportclight.Clightdefs.
Require Import compcert.cfrontend.Cshmgen.
Require Import compcert.exportclight.Clightdefs.
Require Import compcert.cfrontend.Cminorgen.
Require Import compcert.common.Errors.
Require Import List.
Require Import compcert.backend.Cminor.
Local Open Scope error_monad_scope.

(* XXX ugh global variables are broken... *)

Definition find_fresh (lst : list ident) : ident :=
  (1 + fold_right (fun x r => Pos.max x r) 1 lst)%positive.

Fixpoint is_pure_expr (e : Cminor.expr) : bool :=
  match e with
  | Cminor.Eunop _ e1 => is_pure_expr e1
  | Cminor.Ebinop _ e1 e2 => andb (is_pure_expr e1) (is_pure_expr e2)
  | Cminor.Eload _ _ => false
  | _ => true
  end.

(* Should just run this as a translation on the whole program. *)
(* Annoyingly, fn_params and fn_vars seem to share the same namespace. *)
Fixpoint purify_ifs_stores_stmt (s : stmt) (fn_vars : list positive) (fn_params : list positive)
    : (stmt * list positive) :=
  match s with
  | Sseq s1 s2 =>
    let (s1', fn_vars') := purify_ifs_stores_stmt s1 fn_vars fn_params in
    let (s2', fn_vars'') := purify_ifs_stores_stmt s2 fn_vars' fn_params in
    (Sseq s1' s2', fn_vars'')
  | Sstore mc e1 e2 =>
    (* Better way to do this? *)
    match (is_pure_expr e1, is_pure_expr e2) with
    | (true, true) => (s, fn_vars)
    | (true, false) =>
      let x := find_fresh (fn_vars ++ fn_params) in
      (Sseq (Sassign x e2) (Sstore mc e1 (Evar x)), (x::fn_vars))
    | (false, true) =>
      let x := find_fresh (fn_vars ++ fn_params) in
      (Sseq (Sassign x e1) (Sstore mc (Evar x) e2), (x::fn_vars))
    | (false, false) =>
      let x := find_fresh (fn_vars ++ fn_params) in
      let y := find_fresh (x :: fn_vars ++ fn_params) in
      (Sseq (Sseq (Sassign x e1) (Sassign y e2)) (Sstore mc (Evar x) (Evar y)), (x::y::fn_vars))
    end
  | Sifthenelse e s1 s2 =>
    let (s1', fn_vars') := purify_ifs_stores_stmt s1 fn_vars fn_params in
    let (s2', fn_vars'') := purify_ifs_stores_stmt s2 fn_vars' fn_params in
    if is_pure_expr e then (Sifthenelse e s1' s2', fn_vars'')
    else
      let x := find_fresh (fn_vars'' ++ fn_params) in
      (Sseq (Sassign x e) (Sifthenelse (Evar x) s1' s2'), (x::fn_vars''))
  | Sloop s1 =>
    let (s1', fn_vars') := purify_ifs_stores_stmt s1 fn_vars fn_params in
    (Sloop s1', fn_vars')
  | Sblock s1 =>
    let (s1', fn_vars') := purify_ifs_stores_stmt s1 fn_vars fn_params in
    (Sblock s1', fn_vars')
  | Slabel l s1 =>
    let (s1', fn_vars') := purify_ifs_stores_stmt s1 fn_vars fn_params in
    (Slabel l s1', fn_vars')
  | _ => (s, fn_vars)
  end.

Definition purify_ifs_stores_func (f : function) : function :=
  (* Better way to deal with records? *)
  let (fn_body, fn_vars) := purify_ifs_stores_stmt f.(fn_body) f.(fn_vars) f.(fn_params) in
  {| fn_sig := f.(fn_sig);
     fn_params := f.(fn_params);
     fn_vars := fn_vars;
     fn_stackspace := f.(fn_stackspace);
     fn_body := fn_body |}.


(* Compile Clight -> C#minor -> Cminor *)
Definition cm_prog' := 
  do csh_p <- Cshmgen.transl_program prog ;
  Cminorgen.transl_program csh_p.

Definition cm_prog := Eval vm_compute in cm_prog'.
Print _foo.
Print _x.
Print _y.
Print _z.
Print cm_prog.
Print _bar.
Lemma compiles_ok : exists prog, cm_prog = OK prog.
  unfold cm_prog; eauto.
Qed.

(* Pull out our foo function definition *)
Definition foo' :=
  do cmp <- cm_prog ;
  match List.filter (fun x => BinPosDef.Pos.eqb (fst x) _bar) cmp.(AST.prog_defs) with
  | (_, (Gfun (AST.Internal f)))::nil => OK (purify_ifs_stores_func f)
  | _ => Error (MSG "Couldn't find function" :: nil)
  end.

Definition foo := Eval vm_compute in foo'.

Lemma found_foo : exists f, foo = OK f.
  unfold foo; eauto.
Qed.

Print foo.

Notation "s1 ;; s2" := (Cminor.Sseq s1 s2) (at level 75, right associativity, format
      "'[v' s1 ';;' '/' s2 ']'").

Print foo.

Notation "'IF' e 'THEN' s1 'ELSE' s2" := (Cminor.Sifthenelse e s1 s2) (at level 71, right associativity, format
      "'IF' '[    ' '//'  e ']' '//' 'THEN' '[    ' '//' s1 ']' '//' 'ELSE' '[    ' '//' s2 ']'").

Print foo.


Notation "'Int_t' n" := (Cminor.Econst
              (Cminor.Ointconst
               {| Int.intval := n;
                 Int.intrange := Int.Z_mod_modulus_range' n
               |})) (at level 11, no associativity).

Notation "'Int64_t' n" := (Cminor.Econst
              (Cminor.Ointconst
               {| Int64.intval := n;
                 Int64.intrange := Int64.Z_mod_modulus_range' n
               |})) (at level 11, no associativity).

Notation "'Long_t' n" := (Cminor.Econst
                       (Cminor.Olongconst
                          {|
                          Int64.intval := n;
                          Int64.intrange := Int64.Z_mod_modulus_range' n |})
                     ) (at level 11, no associativity).


Notation "'StackPtr' n" := (Cminor.Econst
              (Cminor.Oaddrstack
               {| Ptrofs.intval := n;
                 Ptrofs.intrange := Ptrofs.Z_mod_modulus_range' n
               |})) (at level 11, no associativity).

Notation "'function' n" := (Cminor.Econst
  (Cminor.Oaddrsymbol n%positive
     {|
     Ptrofs.intval := 0;
     Ptrofs.intrange := Ptrofs.Z_mod_modulus_range' 0 |})) (at level 11, no associativity).

Print foo.

Notation "'tmp' n" := (Cminor.Evar n%positive) (at level 11, no associativity).

Print foo.

Notation "'tmp' m  := ( 'function' f ::: t1 --> .. --> t2 --> t3  )(  a1 .. a2  )" :=
  (Cminor.Scall (Some m%positive)
                       {|
                       sig_args := (cons t1 .. (cons t2 nil) ..);
                       sig_res := Some t3;
                       sig_cc := {|
                                 cc_vararg := false;
                                 cc_unproto := false;
                                 cc_structret := false |} |}
                       (function f)
                       (cons a1 .. (cons a2 nil) ..)) (at level 29, no associativity).

Print foo.

Notation "'tmp' m  := ( 'function' f ::: t1 --> .. --> t2 --> 'Void'  )(  a1 .. a2  )" :=
  (Cminor.Scall (Some m%positive)
                       {|
                       sig_args := (cons t1 .. (cons t2 nil) ..);
                       sig_res := None;
                       sig_cc := {|
                                 cc_vararg := false;
                                 cc_unproto := false;
                                 cc_structret := false |} |}
                       (function f)
                       (cons a1 .. (cons a2 nil) ..)) (at level 29, no associativity).

Notation "( 'function' f ::: t1 --> .. --> t2 --> t3 )( a1 .. a2  )" :=
  (Cminor.Scall (None)
                       {|
                       sig_args := (cons t1 .. (cons t2 nil) ..);
                       sig_res := t3;
                       sig_cc := {|
                                 cc_vararg := false;
                                 cc_unproto := false;
                                 cc_structret := false |} |}
                       (function f)
                       (cons a1 .. (cons a2 nil) ..)) (at level 31, no associativity).

Notation "( 'function' f ::: t1 --> .. --> t2 --> 'Void' ) ( a1 .. a2  )" :=
  (Cminor.Scall (None)
                       {|
                       sig_args := (cons t1 .. (cons t2 nil) ..);
                       sig_res := None;
                       sig_cc := {|
                                 cc_vararg := false;
                                 cc_unproto := false;
                                 cc_structret := false |} |}
                       (function f)
                       (cons a1 .. (cons a2 nil) ..)) (at level 31, no associativity).


Print foo.

Notation "'tmp' n  := 'tmp' m" :=
  (Cminor.Sassign n%positive (Cminor.Evar m%positive)) (at level 31, no associativity).

Print foo.

Notation "[[ 'tmp' n  ]] := m " := (Cminor.Sstore Mint32 (Cminor.Evar n%positive)
                        ( m )) (at level 31, no associativity).



Print foo.

Notation "'return' n" :=
  (Cminor.Sreturn (Some (Int_t n))) (at level 31, no associativity).

Print foo.

Notation "[[ 'StackPtr' n + m ]]  := o" :=
  (Cminor.Sstore Mint32
            (Cminor.Ebinop Cminor.Oaddl (StackPtr n) (Long_t m))
            (Int_t o)) (at level 31, no associativity).

Print foo.

Notation "'tmp' t := s" :=
  (Cminor.Sassign t%positive s) (at level 31, no associativity).

Notation "[[ ( t )  + n  ]]" :=
  (Eload Mint32 (Ebinop Oaddl (t) (Long_t n))) (at level 29, no associativity).

Notation "x '=C=' y" :=
  (Ebinop (Ocmp Ceq) (x) (y)) (at level 29, no associativity).

Print cm_prog.

Print foo.
Print _x.
Ltac fold_external := fold _my_malloc _my_free _bar.

Lemma blah : exists x, foo = OK x.
  unfold foo.
  fold_external.
  eauto.
Qed.

