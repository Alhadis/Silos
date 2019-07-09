(***************************************************************************
* Safety for Lambda Mu Mutilde (CBV) - Infrastructure                      *
* Étienne Miquey, June 2015                                                *
***************************************************************************)


(* Penser à renommer bien ! *)

Set Implicit Arguments.
Require Import LibLN.
Require Import L_Core_Definitions.

(*********************************************************************** *)
(** ** Additional Definitions used in the Proofs *)

Fixpoint size_prf (p:prf) {struct p} : nat :=
  match p with
    | prf_bvar i    => 1
    | prf_fvar a    => 1
    | prf_abs p1    => 1+(size_prf p1)
    | prf_mu c => 1+(size_clos c)
  end
with size_cont (e : cont) {struct e} : nat :=
  match e with
    | co_bvar i    => 1
    | co_fvar a    => 1
    | co_stack p f    => (size_prf p) + (size_cont f)
    | co_mut c => 1+(size_clos c)
  end
with size_clos (c:clos) {struct c} : nat :=
  match c with
    | cl p e =>  (size_prf p) + (size_cont e)
  end.


Inductive size_prf_prop : prf -> nat -> Prop :=
| size_prf_bvar : forall n, size_prf_prop (prf_bvar n) 1
| size_prf_fvar : forall a, size_prf_prop (prf_fvar a) 1
| size_abs : forall p n,  size_prf_prop p n -> size_prf_prop (prf_abs p) (S n)
| size_mu : forall c n, size_clos_prop c n -> size_prf_prop (prf_mu c) (S n)
with size_cont_prop : cont -> nat -> Prop :=
     | size_co_bvar : forall n, size_cont_prop (co_bvar n) 1
     | size_co_fvar : forall a, size_cont_prop (co_fvar a) 1
     | size_mut : forall c n, size_clos_prop c n -> size_cont_prop (co_mut c) (S n)
     | size_stack : forall q e n m, size_prf_prop q n -> size_cont_prop e m -> size_cont_prop (co_stack q e ) (n+m)
with size_clos_prop : clos -> nat ->Prop :=
  | size_closure : forall p e n m, size_prf_prop p n -> size_cont_prop e m -> size_clos_prop (cl p e ) (n+m).

Fixpoint size_prf_ok p {struct p}: size_prf_prop p (size_prf p)
with size_cont_ok e {struct e}: size_cont_prop e (size_cont e)
with size_clos_ok c {struct c}: size_clos_prop c (size_clos c).
Proof.
  - induction p; simpl in *.
    + apply size_prf_bvar.
    + apply size_prf_fvar.      
    + apply* size_abs.
    + apply* size_mu.
  - induction e.
    + apply size_co_bvar.
    + apply size_co_fvar.
    + apply* size_stack.
    + apply* size_mut.
  - induction c.
    apply* size_closure.
Qed.

Lemma size_prf_ge_1: forall p, 1 <= size_prf p.
Proof.
  intro p.
  destruct p;simpl;intuition.
Qed.

Lemma size_cont_ge_1: forall e, 1 <= size_cont e.
Proof.
  intro e.
  destruct e;simpl;intuition.
  assert (ok:=size_prf_ge_1 p).
  intuition.
Qed.

Lemma size_clos_le_1: forall c, 2 <= size_clos c.
Proof.
  intro c.
  destruct c as (p,e);simpl.
  assert (ok:=size_prf_ge_1 p).
  assert (ok':=size_cont_ge_1 e).
  intuition.
Qed.



(* Scheme size_prf_ind := Induction for size_prf_prop Sort Prop
  with size_cont_ind := Induction for size_cont_prop Sort Prop
  with size_clos_ind := Induction for size_clos_prop Sort Prop.
Combined Scheme size_ind from size_prf_ind, size_cont_ind, size_clos_ind.
Print size_ind.
*)
Lemma induction_size :
  forall (Pp:prf-> Prop) (Pe:cont-> Prop) (Pc:clos -> Prop),
    (forall (n:nat), (forall p, size_prf p<=n -> Pp p)
                     -> (forall e, size_cont e<=n -> Pe e)
                     -> (forall c, size_clos c<=n -> Pc c)
                     -> (forall p, size_prf p = S n -> Pp p)
                        /\ (forall e, size_cont e = S n -> Pe e)
                        /\ (forall c, size_clos c = S n -> Pc c))
    -> forall n,(forall p, size_prf p<=n-> Pp p) /\ (forall e, size_cont e<=n -> Pe e)
                /\ (forall c, size_clos c<=n ->Pc c).
Proof.
  intros.
  assert (forall p : prf, size_prf p <= 0 -> Pp p) as Hp0.
  intros p H0.
  destruct p; simpl in H0;intuition.
  assert (forall e : cont, size_cont e <= 0 -> Pe e) as He0.
  intros e H0.
  destruct e; simpl in H0;intuition.
  destruct p; simpl in H0;intuition.
  assert (forall c : clos, size_clos c <= 0 -> Pc c) as Hc0.
  intros c H0.
  destruct c;destruct p; simpl in H0;intuition.
  induction n.
  - split.
  + intros p Hp.
    apply Hp0; intuition.
  + split.
    * intros e He.
      now apply He0.
    * intros c Hc.
      now apply Hc0.
  - repeat split.
    + intros p Hp.
      destruct (Compare_dec.le_lt_eq_dec _ _ Hp).
      * apply Lt.lt_n_Sm_le in l.
      destruct IHn as (IHp, _).
      apply (IHp p l).
      * destruct IHn as (IHp,(IHe,IHc)).
        destruct* (H n IHp IHe IHc) as (Ok,_).
    + intros e He.
      destruct (Compare_dec.le_lt_eq_dec _ _ He).
      * apply Lt.lt_n_Sm_le in l.
      destruct* IHn as (_,(IHe, _)).
      * destruct IHn as (IHp,(IHe,IHc)).
        destruct* (H n IHp IHe IHc) as (_,(Ok,_)).
    + intros c Hc.
      destruct (Compare_dec.le_lt_eq_dec _ _ Hc).
      * apply Lt.lt_n_Sm_le in l.
      destruct* IHn as (_,(_, IHc)).
      * destruct IHn as (IHp,(IHe,IHc)).
        destruct* (H n IHp IHe IHc) as (_,(_,Ok)).
Qed.

Lemma generalize_size_ind:
  forall (Pp:prf-> Prop) (Pe:cont-> Prop) (Pc:clos -> Prop),
  (forall n,(forall p, size_prf p<=n-> Pp p) /\ (forall e, size_cont e<=n -> Pe e)
           /\ (forall c, size_clos c<=n ->Pc c))
           -> (forall p, Pp p) /\ (forall e, Pe e)/\ (forall c, Pc c).
Proof.
  intros.
  repeat split;intros.
  - destruct (H (size_prf p)) as (Hp,_).
    apply* Hp.
  - destruct (H (size_cont e)) as (_,(He,_)).
    apply* He.
  - destruct (H (size_clos c)) as (_,(_,Hc)).
    apply* Hc.
Qed.


Lemma size_ind :
  forall (Pp:prf-> Prop) (Pe:cont-> Prop) (Pc:clos -> Prop),
    (forall (n:nat), (forall p, size_prf p<=n -> Pp p)
                     -> (forall e, size_cont e<=n -> Pe e)
                     -> (forall c, size_clos c<=n -> Pc c)
                     -> (forall p, size_prf p = S n -> Pp p)
                        /\ (forall e, size_cont e = S n -> Pe e)
                        /\ (forall c, size_clos c = S n -> Pc c))
    -> (forall p, Pp p) /\ (forall e, Pe e)/\ (forall c, Pc c).
Proof.
intros.  
apply generalize_size_ind.
apply* induction_size.
Qed.
    (* raffinable avec size_*_ok pour faire disparaître la taille de la conclusion ? *)


(** Computing free variables of a term. *)

Fixpoint fv_prf (p : prf) {struct p} : vars :=
  match p with
  | prf_bvar i    => \{}
  | prf_fvar a    => \{a}
  | prf_abs p1    => (fv_prf p1)
  | prf_mu c => (fv_clos c)
  end
with fv_cont (e : cont) {struct e} : vars :=
  match e with
  | co_bvar i    => \{}
  | co_fvar a    => \{a}
  | co_stack p f    => (fv_prf p) \u (fv_cont f)
  | co_mut c => (fv_clos c)
  end
with fv_clos (c:clos) {struct c} : vars :=
       match c with
         | cl p e =>  (fv_prf p) \u (fv_cont e)
       end.

(** Substitution for names *)

(* substitute z in p by q *)

Fixpoint subst_prf_prf (z : var) (p: prf) (q : prf) {struct p} : prf :=
  match p with
  | prf_bvar i    => prf_bvar i
  | prf_fvar x    => If x = z then q else (prf_fvar x)
  | prf_abs p1    => prf_abs (subst_prf_prf z p1 q)
  | prf_mu c => prf_mu (subst_clos_prf z c q) 
end
with subst_cont_prf (z : var) (e:cont) (q:prf) {struct e}:cont :=
  match e with
    | co_bvar i => co_bvar i
    | co_fvar x => co_fvar x
    | co_stack p f => co_stack (subst_prf_prf z p q) (subst_cont_prf z f q)
    | co_mut c => co_mut (subst_clos_prf z c q)
  end
with subst_clos_prf (z:var) (c:clos) (q:prf) {struct c} : clos :=
       match c with
         | cl p e =>  cl (subst_prf_prf z p q)  (subst_cont_prf z e q)
       end.

Fixpoint subst_prf_cont (z : var) (p: prf) (f : cont) {struct p} : prf :=
  match p with
  | prf_bvar i    => prf_bvar i
  | prf_fvar x    => (prf_fvar x)
  | prf_abs p1    => prf_abs (subst_prf_cont z p1 f)
  | prf_mu c => prf_mu (subst_clos_cont z c f) 
end
with subst_cont_cont (z : var) (e:cont) (f:cont) {struct e}:cont :=
  match e with
    | co_bvar i => co_bvar i
    | co_fvar x => If x=z then f else co_fvar x
    | co_stack p e1 => co_stack (subst_prf_cont z p f) (subst_cont_cont z e1 f)
    | co_mut c => co_mut (subst_clos_cont z c f)
  end
with subst_clos_cont (z:var) (c:clos) (f:cont) {struct c} : clos :=
       match c with
         | cl p e =>  cl (subst_prf_cont z p f)  (subst_cont_cont z e f)
       end.

(* UNIFORMISABLE AVEC TYPE CLASS ? *)

Notation "[ z ~+> q ]+ p" := (subst_prf_prf z p q) (at level 68).
Notation "[ z ~+> q ]- e" := (subst_cont_prf z e q) (at level 68).
Notation "[ z ~+> q ]* c" := (subst_clos_prf z c q) (at level 68).
Notation "[ z ~-> f ]+ p" := (subst_prf_cont z p f) (at level 68).
Notation "[ z ~-> f ]- e" := (subst_cont_cont z e f) (at level 68).
Notation "[ z ~-> f ]* c" := (subst_clos_cont z c f) (at level 68).
(** Definition of the body of an abstraction *)

Definition body_prf_prf p :=
  exists L, forall x, x \notin L -> proof (p +^+ x).
Definition body_prf_cont p :=
  exists L, forall x, x \notin L -> proof (p+^-x). 
Definition body_cont_prf e :=
  exists L, forall x, x \notin L -> context (e -^+ x).
Definition body_cont_cont e :=
  exists L, forall x, x \notin L -> context (e -^- x).
Definition body_clos_prf e :=
  exists L, forall x, x \notin L -> closure (e *^+ x).
Definition body_clos_cont e :=
  exists L, forall x, x \notin L -> closure (e *^- x).


(* ********************************************************************** *)
(** ** Instanciation of tactics *)

(** Tactic [gather_vars] returns a set of variables occurring in
    the context of proofs, including domain of environments and
    free variables in terms mentionned in the context. *)

Ltac gather_vars :=
  let A := gather_vars_with (fun x : vars => x) in
  let B := gather_vars_with (fun x : var => \{x}) in
  let C := gather_vars_with (fun x : env => dom x) in
  let D := gather_vars_with (fun x : prf => fv_prf x) in
  let E := gather_vars_with (fun x : cont => fv_cont x) in
  let F := gather_vars_with (fun x : clos => fv_clos x) in
  constr:(A \u B \u C \u D \u E \u F).

(** Tactic [pick_fresh x] adds to the context a new variable x
    and a proof that it is fresh from all of the other variables
    gathered by tactic [gather_vars]. *)

Ltac pick_fresh Y :=
  let L := gather_vars in (pick_fresh_gen L Y).

(** Tactic [apply_fresh T as y] takes a lemma T of the form 
    [forall L ..., (forall x, x \notin L, P x) -> ... -> Q.]
    instanciate L to be the set of variables occuring in the
    context (by [gather_vars]), then introduces for the premise
    with the cofinite quantification the name x as "y" (the second
    parameter of the tactic), and the proof that x is not in L. *)

Tactic Notation "apply_fresh" constr(T) "as" ident(x) :=
  apply_fresh_base T gather_vars x.
Tactic Notation "apply_fresh" "*" constr(T) "as" ident(x) :=
  apply_fresh T as x; auto_star.
Tactic Notation "apply_fresh" constr(T) :=
  apply_fresh_base T gather_vars ltac_no_arg.
Tactic Notation "apply_fresh" "*" constr(T) :=
  apply_fresh T; auto_star.

Hint Constructors proof context closure value red.


(* ********************************************************************** *)
(** ** Properties of substitution *)

(** Substitution on indices is identity on well-formed terms. *)

Fixpoint open_rec_prf_prf_id_core p j q i r {struct p}: i <> j ->
                    {j ~+> q}+ p = {i ~+> r}+ ({j ~+> q}+ p) -> p = {i ~+> r}+ p
with open_rec_cont_prf_id_core e j q i r {struct e}: i <> j ->
                    {j ~+> q}- e = {i ~+> r}- ({j ~+> q}- e) -> e = {i ~+> r}- e
with open_rec_clos_prf_id_core c j q i r {struct c}: i <> j ->
                    {j ~+> q}* c = {i ~+> r}* ({j ~+> q}* c) -> c = {i ~+> r}* c
.
Proof.
  - revert j q i r.
    induction p; simpls;introv Neq Equ; inversion Equ;try tauto.
    + case_nat.
      * rewrite If_r;trivial.
      * exact Equ.
    + rewrite (IHp (S j) q (S i) r) at 1;
      [reflexivity | intuition | assumption].
    + now rewrite (open_rec_clos_prf_id_core c j q i r) at 1.
  - revert j q i r.
    induction e; simpls;introv Neq Equ; inversion Equ;try tauto.
    + now rewrite (open_rec_prf_prf_id_core p j q i r), (open_rec_cont_prf_id_core e j q i r) at 1. 
    + rewrite (open_rec_clos_prf_id_core c (S j) q (S i) r) at 1;
      [reflexivity | intuition | assumption].
  - destruct c as [p e];simpls;introv Neq Equ;inversion Equ.
    rewrite (open_rec_prf_prf_id_core p j q i r), (open_rec_cont_prf_id_core e j q i r) at 1;
      [reflexivity |intuition | assumption |intuition |assumption ].
Qed.

Fixpoint open_rec_prf_cont_id_core p j q i r {struct p}: i <> j ->
                    {j ~-> q}+ p = {i ~-> r}+ ({j ~-> q}+ p) -> p = {i ~-> r}+ p
with open_rec_cont_cont_id_core e j q i r {struct e}: i <> j ->
                    {j ~-> q}- e = {i ~-> r}- ({j ~-> q}- e) -> e = {i ~-> r}- e
with open_rec_clos_cont_id_core c j q i r {struct c}: i <> j ->
                    {j ~-> q}* c = {i ~-> r}* ({j ~-> q}* c) -> c = {i ~-> r}* c
.
Proof.
  - revert j q i r.
    induction p; simpls;introv Neq Equ; inversion Equ;try tauto.
    + fequals*.
    + fequals*.
  - revert j q i r.
    induction e; simpls;introv Neq Equ; inversion Equ;try tauto.
    + case_nat*. rewrite* If_r.
    + now rewrite (open_rec_prf_cont_id_core p j q i r), (open_rec_cont_cont_id_core e j q i r) at 1. 
    + rewrite (open_rec_clos_cont_id_core c (j) q (i) r) at 1;
      [reflexivity | intuition | assumption].

  - destruct c as [p e];simpls;introv Neq Equ;inversion Equ.
    rewrite (open_rec_prf_cont_id_core p j q i r), (open_rec_cont_cont_id_core e j q i r) at 1;
      [reflexivity |intuition | assumption |intuition |assumption ].
Qed.



Fixpoint open_rec_prf_prf_id_core_1 p j q i r {struct p}:
                    {j ~-> q}+ p = {i ~+> r}+ ({j ~-> q}+ p) -> p = {i ~+> r}+ p
with open_rec_cont_prf_id_core_1 e j q i r {struct e}:
                    {j ~-> q}- e = {i ~+> r}- ({j ~-> q}- e) -> e = {i ~+> r}- e
with open_rec_clos_prf_id_core_1 c j q i r {struct c}:
                    {j ~-> q}* c = {i ~+> r}* ({j ~-> q}* c) -> c = {i ~+> r}* c
.
Proof.
  - revert j q i r;induction p; simpls;intros j q i r Equ;inversion Equ;fequals*.
  - revert j q i r;induction e; simpls;intros j q i r Equ;inversion Equ;fequals*.
  - destruct c as [p e];simpls;introv Equ;inversion Equ;fequals*.
Qed.


Fixpoint open_rec_prf_cont_id_core_1 p j q i r {struct p}:
                    {j ~+> q}+ p = {i ~-> r}+ ({j ~+> q}+ p) -> p = {i ~-> r}+ p
with open_rec_cont_cont_id_core_1 e j q i r {struct e}:
                    {j ~+> q}- e = {i ~-> r}- ({j ~+> q}- e) -> e = {i ~-> r}- e
with open_rec_clos_cont_id_core_1 c j q i r {struct c}:
                    {j ~+> q}* c = {i ~-> r}* ({j ~+> q}* c) -> c = {i ~-> r}* c
.
Proof.
  - revert j q i r;induction p; simpls;intros j q i r Equ;inversion Equ;fequals*.
  - revert j q i r;induction e; simpls;intros j q i r Equ;inversion Equ;fequals*.
  - destruct c as [p e];simpls;introv Equ;inversion Equ;fequals*.
Qed.



Fixpoint open_rec_prf_prf_id (p:prf) q (H:proof p) {struct H}:
   forall k, p = {k ~+> q}+ p
with open_rec_cont_prf_id e q (H:context e) {struct H}:
   forall k, e = {k ~+> q}- e
with open_rec_clos_prf_id c q (H:closure c) {struct H}:
   forall k, c = {k ~+> q}* c.
Proof.
  - destruct H; intro k; simpl;fequal.
    + unfolds open_prf_prf.
      pick_fresh x.
      apply (@open_rec_prf_prf_id_core p 0 (prf_fvar x) (S k) q).
      * discriminate.
      * apply open_rec_prf_prf_id.
        apply* H.
    + unfolds open_clos_cont.
      pick_fresh x.
      apply (@open_rec_clos_prf_id_core_1 c 0 (co_fvar x) k ).
      apply open_rec_clos_prf_id.
      apply* H.
  -destruct H;intros;simpl;fequal.
   + apply open_rec_prf_prf_id.
     apply H.
   + apply open_rec_cont_prf_id.
     apply H0.
   + unfolds open_clos_prf.
     pick_fresh x.
     apply (@open_rec_clos_prf_id_core c 0 (prf_fvar x) (S k) ).
     * discriminate.
     * apply (open_rec_clos_prf_id).
       apply* H.

  - destruct H as [p  e Hp He];intro k;simpl;fequal;[apply open_rec_prf_prf_id|apply open_rec_cont_prf_id];assumption.
Qed.


Fixpoint open_rec_prf_cont_id (p:prf) (f:cont) (H:proof p) {struct H}:
   forall k, p = {k ~-> f}+ p
with open_rec_cont_cont_id e f (H:context e) {struct H}:
   forall k, e = {k ~-> f}- e
with open_rec_clos_cont_id c f (H:closure c) {struct H}:
   forall k, c = {k ~-> f}* c.
Proof.
  - destruct H; intro k; simpl;fequal.
    + unfolds open_prf_prf.
      pick_fresh x.
      apply (@open_rec_prf_cont_id_core_1 p 0 (prf_fvar x) (k) f).
      apply open_rec_prf_cont_id.
      apply* H.
    + unfolds open_clos_cont.
      pick_fresh x.
      apply (@open_rec_clos_cont_id_core c 0 (co_fvar x) (S k) ).
      * discriminate.
      * apply open_rec_clos_cont_id.
        apply* H.
   -destruct H;intros;simpl;fequal.
   + apply open_rec_prf_cont_id.
     apply H.
   + apply open_rec_cont_cont_id.
     apply H0.
   + unfolds open_clos_cont.
     pick_fresh x.
     apply (@open_rec_clos_cont_id_core_1 c 0 (prf_fvar x) (k) ).
     apply (open_rec_clos_cont_id).
     apply* H.
  - destruct H as [p  e Hp He];intro k;simpl;fequal;[apply open_rec_prf_cont_id|apply open_rec_cont_cont_id];assumption.
Qed.


(** Substitution for a fresh name is identity. *)

Fixpoint subst_prf_fresh x p q f{struct p}:
  x \notin fv_prf p ->  [x ~+> q]+ p = p /\ [x ~->f]+ p = p
with subst_cont_fresh x e q f{struct e}: 
       x \notin fv_cont e ->  [x ~+> q]- e = e  /\ [x ~->f]- e = e
with subst_clos_fresh x c q f{struct c}: 
       x \notin fv_clos c ->  [x ~+> q]* c = c  /\ [x ~->f]* c = c.
Proof.
  - intro Hx;destruct p; simpls.
    + split;reflexivity.
    + case_var*.
    + destruct (subst_prf_fresh x p q f Hx) as [IHx IHf];split;fequals*.
    + destruct (subst_clos_fresh x c q f Hx) as [IHx IHf];split;fequals*.
  - intro Hx;destruct e;simpls;fequals*.
    + case_var*.
    + destruct (notin_union_r Hx) as [Hpx Hex].
      destruct (subst_prf_fresh x p q f Hpx) as [IHpx IHpf] .
      destruct (subst_cont_fresh x e q f Hex) as [IHex IHef] .
      split;fequals*.
    + destruct (subst_clos_fresh x c q f Hx) as [IHcx IHcf];split;fequals*.
  - intro Hx;destruct c as [p e];simpls;fequals*.
    destruct (notin_union_r Hx) as [Hpx Hex].
    destruct (subst_prf_fresh x p q f Hpx) as [IHpx IHpf] .
    destruct (subst_cont_fresh x e q f Hex) as [IHex IHef] .
    split;fequals*.
Qed.

(* Note that [x ~-> f] could be ill-defined when x is refering to a proof-free-variable *)


(** Substitution distributes on the open operation. *)
 
Fixpoint subst_open_prf_prf_core x q p1 n p2  (H:proof q) : 
  [x ~+> q]+ {n ~+> p2}+ p1  = {n~+>([x ~+> q]+ p2)}+ ([x ~+> q]+ p1)
with subst_open_cont_prf_core x q e n p2 (H:proof q) : 
       [x ~+> q]- {n ~+> p2}- e  = {n~+>([x ~+> q]+ p2)}- ([x ~+> q]- e)
with subst_open_clos_prf_core x q c n p2  (H:proof q) : 
  [x ~+> q]* {n ~+> p2}* c  = {n~+>([x ~+> q]+ p2)}* ([x ~+> q]* c)                          
.
Proof.
 - generalize n.
    destruct p1; intros;simpls.
    + case_nat*.
    + case_var*.
      apply* open_rec_prf_prf_id.
    + fequals*.
    + fequals*.
 - destruct e;intros;simpls.
   + reflexivity.
   + reflexivity.
   + fequals*.
   + fequals*.
 - destruct c;intros;simpl;fequals*.
Qed.

Lemma subst_open_prf_prf:
 forall x q p1 p2, proof q -> [x ~+> q]+ p1 +^^+p2  = ([x ~+> q]+ p1) +^^+ ([x ~+> q]+ p2).
Proof.
  intros x q p1 p2 H;exact (@subst_open_prf_prf_core x q p1 0 p2 H).
Qed.

Lemma subst_open_cont_prf:
 forall x q e p2, proof q -> [x ~+> q]- e -^^+p2  = ([x ~+> q]- e) -^^+ ([x ~+> q]+ p2).
Proof.
  intros x q e p2 H;exact (@subst_open_cont_prf_core x q e 0 p2 H).
Qed.

Lemma subst_open_clos_prf:
 forall x q c p2, proof q -> [x ~+> q]* c *^^+p2  = ([x ~+> q]* c) *^^+ ([x ~+> q]+ p2).
Proof.
  intros x q c p2 H;exact (@subst_open_clos_prf_core x q c 0 p2 H).
Qed.



Fixpoint subst_open_prf_cont_core x (f:cont) p n e2 (H:context f) : 
  [x ~-> f]+ {n ~-> e2}+ p  = {n~->([x ~-> f]- e2)}+ ([x ~-> f]+ p)
with subst_open_cont_cont_core x f e n e2 (H:context f) : 
       [x ~-> f]- {n ~-> e2}- e  = {n~->([x ~-> f]- e2)}- ([x ~-> f]- e)
with subst_open_clos_cont_core x f c n e2 (H:context f) : 
  [x ~-> f]* {n ~-> e2}* c  = {n~->([x ~-> f]- e2)}* ([x ~-> f]* c)                          
.
Proof.
  - generalize n.
    destruct p; intros;simpls.
    + reflexivity.
    + reflexivity.
    + fequals*.
    + fequals*.
  - destruct e;intros;simpls.
    + case_nat*. 
    + case_var*.
      apply* open_rec_cont_cont_id.
    + fequals*.
    + fequals*.
  - destruct c;intros;simpl;fequals*.
Qed.


Lemma subst_open_prf_cont:
 forall x f p1 e2, context f -> [x ~-> f]+ p1 +^^-e2  = ([x ~-> f]+ p1) +^^- ([x ~-> f]- e2).
Proof.
  intros x f p1 e2 H;exact (@subst_open_prf_cont_core x f p1 0 e2 H).
Qed.


Lemma subst_open_cont_cont:
 forall x f e1 e2, context f -> [x ~-> f]- e1 -^^-e2  = ([x ~-> f]- e1) -^^- ([x ~-> f]- e2).
Proof.
  intros x f e1 e2 H;exact (@subst_open_cont_cont_core x f e1 0 e2 H).
Qed.

Lemma subst_open_clos_cont:
 forall x f c e2, context f -> [x ~-> f]* c *^^-e2  = ([x ~-> f]* c) *^^- ([x ~-> f]- e2).
Proof.
  intros x f c e2 H;exact (@subst_open_clos_cont_core x f c 0 e2 H).
Qed.



(* Same thing, mixing positive & negatives substitutions *)

Fixpoint subst_open_prf_prf_core1 x q p1 n e2  (H:proof q) : 
  [x ~+> q]+ {n ~-> e2}+ p1  = {n~->([x ~+> q]- e2)}+ ([x ~+> q]+ p1)
with subst_open_cont_prf_core1 x q e n e2 (H:proof q) : 
       [x ~+> q]- {n ~-> e2}- e  = {n~->([x ~+> q]- e2)}- ([x ~+> q]- e)
with subst_open_clos_prf_core1 x q c n e2  (H:proof q) : 
  [x ~+> q]* {n ~-> e2}* c  = {n~->([x ~+> q]- e2)}* ([x ~+> q]* c)                          
.
Proof.
 - generalize n.
    destruct p1; intros;simpls.
    + reflexivity.
    + case_var*.
      apply* open_rec_prf_cont_id.
    + fequals*.
    + fequals*.
 - destruct e;intros;simpls.
   + case_nat*. 
   + reflexivity.
   + fequals*.
   + fequals*.
 - destruct c;intros;simpl;fequals*.
Qed.

Lemma subst_open_prf_prf1:
 forall x q p1 e2, proof q -> [x ~+> q]+ p1 +^^-e2  = ([x ~+> q]+ p1) +^^- ([x ~+> q]- e2).
Proof.
  intros x q p1 e2 H;exact (@subst_open_prf_prf_core1 x q p1 0 e2 H).
Qed.

Lemma subst_open_cont_prf1:
 forall x q e e2, proof q -> [x ~+> q]- e -^^-e2  = ([x ~+> q]- e) -^^- ([x ~+> q]- e2).
Proof.
  intros x q e e2 H;exact (@subst_open_cont_prf_core1 x q e 0 e2 H).
Qed.

Lemma subst_open_clos_prf1:
 forall x q c e2, proof q -> [x ~+> q]* c *^^-e2  = ([x ~+> q]* c) *^^- ([x ~+> q]- e2).
Proof.
  intros x q c e2 H;exact (@subst_open_clos_prf_core1 x q c 0 e2 H).
Qed.



Fixpoint subst_open_prf_cont_core1 x (f:cont) p n q (H:context f) : 
  [x ~-> f]+ {n ~+> q}+ p  = {n~+>([x ~-> f]+ q)}+ ([x ~-> f]+ p)
with subst_open_cont_cont_core1 x f e n q (H:context f) : 
       [x ~-> f]- {n ~+> q}- e  = {n~+>([x ~-> f]+ q)}- ([x ~-> f]- e)
with subst_open_clos_cont_core1 x f c n q (H:context f) : 
  [x ~-> f]* {n ~+> q}* c  = {n~+>([x ~-> f]+ q)}* ([x ~-> f]* c)                          
.
Proof.
  - generalize n.
    destruct p; intros;simpls.
    + case_nat*.
    + reflexivity.
    + fequals*.
    + fequals*.
  - destruct e;intros;simpls.
    + reflexivity. 
    + case_var*.
      apply* open_rec_cont_prf_id.
    + fequals*.
    + fequals*.
  - destruct c;intros;simpl;fequals*.
Qed.


Lemma subst_open_prf_cont1:
 forall x f p1 q, context f -> [x ~-> f]+ p1 +^^+q  = ([x ~-> f]+ p1) +^^+ ([x ~-> f]+ q).
Proof.
  intros x f p1 q H;exact (@subst_open_prf_cont_core1 x f p1 0 q H).
Qed.


Lemma subst_open_cont_cont1:
 forall x f e1 q, context f -> [x ~-> f]- e1 -^^+q  = ([x ~-> f]- e1) -^^+ ([x ~-> f]+ q).
Proof.
  intros x f e1 q H;exact (@subst_open_cont_cont_core1 x f e1 0 q H).
Qed.

Lemma subst_open_clos_cont1:
 forall x f c q, context f -> [x ~-> f]* c *^^+q  = ([x ~-> f]* c) *^^+ ([x ~-> f]+ q).
Proof.
  intros x f c q H;exact (@subst_open_clos_cont_core1 x f c 0 q H).
Qed.


(** Substitution and open_var for distinct names commute. *)

Fixpoint subst_open_prf_prf_var x y p q (Hxy: y <> x) (Hq:proof q) {struct Hq}:
  ([x ~+> q]+ p) +^+ y = [x ~+> q]+ (p +^+ y)
with subst_open_cont_prf_var x y e q (Hxy: y <> x) (Hq:proof q) {struct Hq}:
       ([x ~+> q]- e) -^+ y = [x ~+> q]- (e -^+ y)
with subst_open_clos_prf_var x y c q (Hxy: y <> x) (Hq:proof q) {struct Hq}:
  ([x ~+> q]* c) *^+ y = [x ~+> q]* (c *^+ y).
Proof.
  unfolds open_prf_prf_var.
  rewrite* subst_open_prf_prf.
  simpl. case_var*.
  unfolds open_cont_prf_var.
  rewrite* subst_open_cont_prf.
  simpl. case_var*.
    unfolds open_clos_prf_var.
  rewrite* subst_open_clos_prf.
  simpl. case_var*.
Qed.

Fixpoint subst_open_prf_cont_var x y p f (Hxy: y <> x) (Hf:context f) {struct Hf}:
  ([x ~-> f]+ p) +^- y = [x ~-> f]+ (p +^- y)
with subst_open_cont_cont_var x y e f (Hxy: y <> x) (Hf:context f) {struct Hf}:
       ([x ~-> f]- e) -^- y = [x ~-> f]- (e -^- y)
with subst_open_clos_cont_var x y c f (Hxy: y <> x) (Hf:context f) {struct Hf}:
  ([x ~-> f]* c) *^- y = [x ~-> f]* (c *^- y).
Proof.
  unfolds open_prf_prf_var.
  rewrite* subst_open_prf_cont.
  simpl. case_var*.
  rewrite* subst_open_cont_cont.
  simpl. case_var*.
  rewrite* subst_open_clos_cont.
  simpl. case_var*.
Qed.


Fixpoint subst_open_prf_prf_var1 x y p q (Hxy: y <> x) (Hq:proof q) {struct Hq}:
  ([x ~+> q]+ p) +^- y = [x ~+> q]+ (p +^- y)
with subst_open_cont_prf_var1 x y e q (Hxy: y <> x) (Hq:proof q) {struct Hq}:
       ([x ~+> q]- e) -^- y = [x ~+> q]- (e -^- y)
with subst_open_clos_prf_var1 x y c q (Hxy: y <> x) (Hq:proof q) {struct Hq}:
  ([x ~+> q]* c) *^- y = [x ~+> q]* (c *^- y).
Proof.
  rewrite* subst_open_prf_prf1.
  rewrite* subst_open_cont_prf1.
  rewrite* subst_open_clos_prf1.
Qed.

Fixpoint subst_open_prf_cont_var1 x y p f (Hxy: y <> x) (Hf:context f) {struct Hf}:
  ([x ~-> f]+ p) +^+ y = [x ~-> f]+ (p +^+ y)
with subst_open_cont_cont_var1 x y e f (Hxy: y <> x) (Hf:context f) {struct Hf}:
       ([x ~-> f]- e) -^+ y = [x ~-> f]- (e -^+ y)
with subst_open_clos_cont_var1 x y c f (Hxy: y <> x) (Hf:context f) {struct Hf}:
  ([x ~-> f]* c) *^+ y = [x ~-> f]* (c *^+ y).
Proof.
  rewrite* subst_open_prf_cont1.
  rewrite* subst_open_cont_cont1.
  rewrite* subst_open_clos_cont1.
Qed.


(** Opening up an abstraction of body t with a term u is the same as opening
  up the abstraction with a fresh name x and then substituting u for x. *)

Fixpoint subst_intro_prf_prf  x p q:
  x \notin (fv_prf p) -> proof q -> p +^^+ q = [x ~+> q]+ (p +^+ x)
with subst_intro_cont_prf  x e q:
  x \notin (fv_cont e) -> proof q -> e -^^+ q = [x ~+> q]- (e -^+ x)
with subst_intro_clos_prf  x c q:
  x \notin (fv_clos c) -> proof q -> c *^^+ q = [x ~+> q]* (c *^+ x)
.
Proof.
  - intros Fr Wu.
    rewrite* subst_open_prf_prf.
    destruct (@subst_prf_fresh x p q  (co_bvar 0) Fr) as [H _].
    rewrite* H.
    simpl. case_var*.
  - intros Fr Wu.
    rewrite* subst_open_cont_prf.
    destruct (@subst_cont_fresh x e q  (co_bvar 0) Fr) as [H _].
    rewrite* H.
    simpl. case_var*.
  - intros Fr Wu.
    rewrite* subst_open_clos_prf.
    destruct (@subst_clos_fresh x c q  (co_bvar 0) Fr) as [H _].
    rewrite* H.
    simpl. case_var*.
Qed.

Fixpoint subst_intro_prf_cont  x p f:
  x \notin (fv_prf p) -> context f -> p +^^- f = [x ~-> f]+ (p +^- x)
with subst_intro_cont_cont  x e f:
  x \notin (fv_cont e) -> context f -> e -^^- f = [x ~-> f]- (e -^- x)
with subst_intro_clos_cont  x c f:
  x \notin (fv_clos c) -> context f-> c *^^- f = [x ~-> f]* (c *^- x)
.
Proof.
  - intros Fr Wu.
    rewrite* subst_open_prf_cont.
    destruct (@subst_prf_fresh x p (prf_bvar 0) f Fr) as  [_ H].
    rewrite* H.
    simpl. case_var*.
  - intros Fr Wu.
    rewrite* subst_open_cont_cont.
    destruct (@subst_cont_fresh x e (prf_bvar 0) f Fr) as [_ H].
    rewrite* H.
    simpl. case_var*.
  - intros Fr Wu.
    rewrite* subst_open_clos_cont.
    destruct (@subst_clos_fresh x c (prf_bvar 0) f Fr) as [_ H].
    rewrite* H.
    simpl. case_var*.
Qed.



(* ********************************************************************** *)
(** ** Terms are stable through substitutions *)

(** Terms are stable by substitution *)

Fixpoint proof_subst_prf_prf x p q (Hp:proof p) (Hq:proof q) {struct Hp}:
  proof ([x ~+> q]+ p)
with context_subst_cont_prf x e q (He:context e) (Hq:proof q) {struct He}:
  context ([x ~+> q]- e)
with closure_subst_clos_prf x c q (Hc:closure c) (Hq:proof q) {struct Hc}:
  closure ([x ~+> q]* c).
Proof.
  - induction Hp; simpls.
    + case_var*.
    + apply_fresh (proof_abs).
      intros.
      rewrite* subst_open_prf_prf_var.
    + apply_fresh proof_mu.
      rewrite* subst_open_clos_prf_var1.
  - induction He;simpls.
    + apply context_var.
    + apply* context_stack.
    + apply_fresh (context_mut).
      rewrite* subst_open_clos_prf_var.
  - induction Hc;simpls.
    apply* closure_cl.
Qed.

Fixpoint proof_subst_prf_cont x p f (Hp:proof p) (Hf:context f) {struct Hp}:
  proof ([x ~-> f]+ p)
with context_subst_cont_cont x e f (He:context e) (Hf:context f) {struct He}:
  context ([x ~-> f]- e)
with closure_subst_clos_cont x c f (Hc:closure c) (Hf:context f) {struct Hc}:
  closure ([x ~-> f]* c).
Proof.
  - induction Hp; simpls.
    + apply proof_var.
    + apply_fresh (proof_abs).
      rewrite* subst_open_prf_cont_var1.
    + apply_fresh proof_mu.
      rewrite* subst_open_clos_cont_var.
  - induction He;simpls.
    + case_var*. 
    + apply* context_stack.
    + apply_fresh (context_mut).
      rewrite* subst_open_clos_cont_var1.
  - induction Hc;simpls.
    apply* closure_cl.
Qed.


Hint Resolve proof_subst_prf_prf context_subst_cont_prf closure_subst_clos_prf.
Hint Resolve proof_subst_prf_cont context_subst_cont_cont closure_subst_clos_cont.


(* ********************************************************************** *)
(** ** Proofs/contexts are stable through open *)

(** Conversion from locally closed abstractions and bodies *)

Lemma prf_abs_to_body : forall p, 
  proof (prf_abs p) -> body_prf_prf p.
Proof. intros. unfold body_prf_prf. inversion* H. Qed.

Lemma body_to_prf_abs : forall p, 
  body_prf_prf p -> proof (prf_abs p).
Proof. intros. inversion* H. Qed.

Lemma prf_mu_to_body : forall c, 
  proof (prf_mu c) -> body_clos_cont c.
Proof. intros. unfold body_clos_cont. inversion* H. Qed.
Lemma body_to_prf_mu : forall c, 
 body_clos_cont c ->  proof (prf_mu c).
Proof. intros. inversion* H. Qed.

Lemma cont_mut_to_body : forall c, 
  context (co_mut c) -> body_clos_prf c.
Proof. intros. unfold body_clos_prf. inversion* H. Qed.
Lemma body_to_cont_mut : forall c, 
 body_clos_prf c ->  context (co_mut c).
Proof. intros. inversion* H. Qed.


Hint Resolve prf_abs_to_body body_to_prf_abs.
Hint Resolve prf_mu_to_body body_to_prf_mu.
Hint Resolve cont_mut_to_body body_to_cont_mut.



(** ** Opening a body with a term gives a term *)

Lemma open_prf_prf : forall p q,
  body_prf_prf p -> proof q -> proof (p +^^+ q).
Proof.
  intros. destruct H. pick_fresh y. rewrite* (@subst_intro_prf_prf y).
Qed.
Lemma open_prf_cont : forall p e,
  body_prf_cont p -> context e -> proof (p +^^- e).
Proof.
  intros. destruct H. pick_fresh y. rewrite* (@subst_intro_prf_cont y).
Qed.

Lemma open_cont_prf : forall e q,
  body_cont_prf e -> proof q -> context (e -^^+ q).
Proof.
  intros. destruct H. pick_fresh y. rewrite* (@subst_intro_cont_prf y).
Qed.
Lemma open_cont_cont : forall e f,
  body_cont_cont e -> context f -> context (e -^^- f).
Proof.
  intros. destruct H. pick_fresh y. rewrite* (@subst_intro_cont_cont y).
Qed.

Lemma open_clos_prf : forall c q,
  body_clos_prf c -> proof q -> closure (c *^^+ q).
Proof.
  intros. destruct H. pick_fresh y. rewrite* (@subst_intro_clos_prf y).
Qed.
Lemma open_clos_cont : forall c e,
  body_clos_cont c -> context e -> closure (c *^^- e).
Proof.
  intros. destruct H. pick_fresh y. rewrite* (@subst_intro_clos_cont y).
Qed.


Hint Resolve open_prf_prf open_prf_cont.
Hint Resolve open_cont_prf open_cont_cont.
Hint Resolve open_clos_prf open_clos_cont.


(* ********************************************************************** *)
(** ** Regularity of relations *)

(** A typing relation holds only if the environment has no
   duplicated keys and the pre-term is locally-closed. *)

(*
Lemma typing_regular:
  (forall E p T (Hp :typing_prf E p T),
  ok E /\ proof p)
/\ (forall E e T (He:typing_cont E e T),
   ok E /\ context e)
/\ (forall E c (Hc:typing_clos E c ),
   ok E /\ closure c).
Proof.
  apply typing_mut_ind.
  - intros e a T Ok Binds.  
    auto.
  - intros L E U T p Hp IH.
    split.
    + pick_fresh x.
      forwards~ : (IH x).
      destruct* H.
    + apply (@proof_abs L).
      intros a Ha; destruct* (IH a Ha).
  - intros L E T c q Ha Hc (IH,IHc).
    split.
    + inversion* IH.
    + apply_fresh (proof_mu).
      intros.
      
      * destruct* (typing_regular_clos (E & a ~ neg T) (c*^-a) ).
   + inductions Hp.
     * apply proof_var.
     * apply (proof_abs p1 H0).
     * apply (@proof_mu L c).
       destruct* (typing_regular_prf E p T Hp).
   Guarded.
   + apply_fresh (proof_mu).
    rewrite open_clos_cont_def.
     destruct* (typing_regular_clos (E & y~ neg T) (c*^-y)).
     (* rewrite* <- (@open_rec_clos_cont_id c (co_fvar y) H1 0). *)
  -split; induction* He.
    + pick_fresh a.
     destruct* (typing_regular_clos (E & a ~ pos T) (c*^+a) ).
    + apply_fresh context_mut.
      rewrite open_clos_prf_def.
     destruct* (typing_regular_clos (E & y~ pos T) (c*^+y)).
     (* rewrite* <- (@open_rec_clos_prf_id c (prf_fvar y) H1 0). *)
    + apply* context_stack.
      destruct* (typing_regular_prf E q T H).
  -induction Hc.
   destruct (typing_regular_prf E p T H);destruct* (typing_regular_cont E e (neg T) H0).
Qed

  *)  
 Fixpoint typing_regular_prf E p T (Hp:typing_prf E p T):
  ok E /\ proof p
with typing_regular_cont E e T (He:typing_cont E e T):
   ok E /\ context e
with typing_regular_clos E c (Hc:typing_clos E c ):
   ok E /\ closure c.
Proof.
  -split; induction* Hp.
   + pick_fresh y. forwards~ : (H0 y).
   + pick_fresh y. destruct* (typing_regular_clos (E & y ~ neg T) (c*^-y) ).
   + apply_fresh (proof_mu).
     destruct* (typing_regular_clos (E & y~ neg T) (c*^-y)).
     (* rewrite* <- (@open_rec_clos_cont_id c (co_fvar y) H1 0). *)
  -split; induction* He.
    + pick_fresh a.
     destruct* (typing_regular_clos (E & a ~ pos T) (c*^+a) ).
    + apply_fresh context_mut.
      rewrite open_clos_prf_def.
     destruct* (typing_regular_clos (E & y~ pos T) (c*^+y)).
    + apply* context_stack.
      destruct* (typing_regular_prf E q T H).
  -induction Hc.
   destruct (typing_regular_prf E p T H);destruct* (typing_regular_cont E e ( T) H0).
Qed.

(** The value predicate only holds on locally-closed terms. *)

Lemma value_regular p (Hp:value p): proof p.
Proof.
  inversion* Hp.
Qed.


(** A reduction relation only holds on pairs of locally-closed terms. *)

  
Fixpoint open_rec_prf_mix_comm p q e i j {struct p}:
  proof(q) -> context(e) -> ({i ~+> q}+ ({j ~-> e }+ p)) = ({j ~-> e }+ ({i ~+> q}+ p))
with open_rec_cont_mix_comm f q e i j {struct f}:
       proof(q) -> context(e) -> ({i ~+> q}- ({j ~-> e }- f)) = ({j ~-> e }- ({i ~+> q}- f))
with open_rec_clos_mix_comm c q e i j {struct c}:
       proof(q) -> context(e) -> ({i ~+> q}* ({j ~-> e }* c)) = ({j ~-> e }* ({i ~+> q}* c)).
Proof.
- induction p;simpl;intros.
  + case_nat.
    * apply* open_rec_prf_cont_id.
    * unfold open_rec_prf_cont. reflexivity.
  + reflexivity.
  + assert ({S i ~+> q }+ ({j ~-> e }+ p) ={j ~-> e }+ ({S i ~+> q }+ p)) as Heq.
    * apply* open_rec_prf_mix_comm.
    * now rewrite Heq.
  + assert ({i ~+> q }* ({S j ~-> e }* c) ={S j ~-> e }* ({i ~+> q }* c)) as Heq.
    * apply* open_rec_clos_mix_comm.
    * now rewrite Heq.
- induction f;simpl;intros.
  +  case_nat.
    * now rewrite <- (open_rec_cont_prf_id q H0 i).
    * unfold open_rec_cont_prf. reflexivity.
  + reflexivity.
  + rewrite (open_rec_prf_mix_comm p q e i j H H0).
    now rewrite (open_rec_cont_mix_comm f q e i j H H0).
  + now (rewrite (open_rec_clos_mix_comm c q e (S i) j H H0)).
- induction c as (p,f);simpl;intros.
  rewrite (open_rec_prf_mix_comm p q e i j H H0).
  now rewrite (open_rec_cont_mix_comm f q e i j H H0).
Qed.


Fixpoint open_rec_prf_cont_comm p e f i j {struct p}:
  i<> j -> context(e) -> context(f) -> ({i ~-> e}+ ({j ~-> f }+ p)) = ({j ~-> f }+ ({i ~-> e}+ p))
with open_rec_cont_cont_comm e f g i j {struct e}:
  i<> j -> context(f) -> context(g) -> ({i ~-> f}- ({j ~-> g }- e)) = ({j ~-> g }- ({i ~-> f}- e)) 
with open_rec_clos_cont_comm c e f i j {struct c}:
  i<> j -> context(e) -> context(f) -> ({i ~-> e}* ({j ~-> f }* c)) = ({j ~-> f }* ({i ~-> e}* c)).
Proof.
- destruct p;simpl;intros;try tauto.
  + now rewrite (open_rec_prf_cont_comm p e f i j H H0 H1).
  + apply not_eq_S in H. 
    now rewrite (open_rec_clos_cont_comm c e f (S i) (S j) H H0 H1).
- destruct e;simpl;intros;try tauto.
  + case_nat;simpl.
    * rewrite* If_r.
      simpl.
      rewrite* If_l.
      rewrite* <- (open_rec_cont_cont_id f H1 i).
    * case_nat;simpl.
      rewrite* <- (open_rec_cont_cont_id g H0 j).  
      rewrite* If_r.
  + rewrite (open_rec_prf_cont_comm p f g i j H H0 H1).
    now rewrite (open_rec_cont_cont_comm e f g i j H H0 H1).
  + now rewrite (open_rec_clos_cont_comm c f g  i j H H0 H1).
- destruct c as (p,g);simpl;intros.
  rewrite (open_rec_prf_cont_comm p e f i j H H0 H1).
  now rewrite (open_rec_cont_cont_comm g e f i j H H0 H1).
Qed.


Fixpoint size_prf_subst_var p k y {struct p} :
  size_prf ({k ~+> prf_fvar y }+ p) = size_prf p
with size_cont_subst_var e k y {struct e} :
       size_cont ({k ~+> prf_fvar y }- e) = size_cont e
with size_clos_subst_var c k y {struct c} :
       size_clos ({k ~+> prf_fvar y }* c) = size_clos c.
Proof.
- revert k y; induction p;simpl;intros.  
  + case_nat*.
  + reflexivity.
  + now rewrite (IHp (S k) y).
  + now rewrite (size_clos_subst_var c k y).
- revert k y; induction e;simpl;intros;try tauto.  
  + rewrite (IHe (k) y).
    now rewrite (size_prf_subst_var p k y).
  + now rewrite (size_clos_subst_var c (S k) y).
- destruct c as (p,e);simpl.
  rewrite (size_prf_subst_var p k y).
  now rewrite (size_cont_subst_var e k y).
Qed.

Fixpoint size_prf_subst_covar p k y {struct p} :
  size_prf ({k ~-> co_fvar y }+ p) = size_prf p
with size_cont_subst_covar e k y {struct e} :
       size_cont ({k ~-> co_fvar y }- e) = size_cont e
with size_clos_subst_covar c k y {struct c} :
       size_clos ({k ~-> co_fvar y }* c) = size_clos c.
Proof.
- revert k y; induction p;simpl;intros;try tauto.  
  + now rewrite (IHp k y).
  + now rewrite (size_clos_subst_covar c (S k) y).
- revert k y; induction e;simpl;intros;try tauto.
  + case_nat*.
  + rewrite (IHe (k) y).
    now rewrite (size_prf_subst_covar p k y).
  + now rewrite (size_clos_subst_covar c k y).
- destruct c as (p,e);simpl.
  rewrite (size_prf_subst_covar p k y).
  now rewrite (size_cont_subst_covar e k y).
Qed. 



Lemma subst_context: (forall p e f k,
  (context (e) -> context(f) -> proof ({k ~-> e}+ p) ->  proof ({k ~-> f}+ p)))
/\(forall f e e' k,
       context (e) -> context(e') -> context ({k ~-> e}- f) ->  context ({k ~-> e'}- f))
/\(forall c e f k,
 context (e) -> context(f) -> closure ({k ~-> e}*c) ->  closure ({k ~-> f}*c)).
Proof.
  apply size_ind.
  intros n Hp He Hc.
  repeat split;intros.
  - destruct p;simpl in *.
    + assumption.
    + assumption.
    + inversion H2.
      apply_fresh proof_abs.
      apply eq_add_S in H.
      assert (y \notin L) as Ly by intuition.
      specialize (H4 y Ly).
      rewrite open_prf_prf_var_def in *.
      rewrite* (@open_rec_prf_mix_comm p (prf_fvar y) f 0 k).
      rewrite* (@open_rec_prf_mix_comm p (prf_fvar y) e 0 k) in H4.
      assert (size_prf ({0 ~+> prf_fvar y }+ p) <= n) as Size.
      rewrite size_prf_subst_var.
      intuition.
      apply (Hp (({0 ~+> prf_fvar y }+ p)) Size e f k H0 H1 H4).
    + inversion H2.
      apply_fresh proof_mu.
      assert (y \notin L) as Ly by intuition.
      specialize (H4 y Ly).
      rewrite open_clos_cont_var_def in *.
      rewrite* open_rec_clos_cont_comm.
      rewrite* open_rec_clos_cont_comm in H4.
      apply eq_add_S in H.
      assert (size_clos ({0 ~-> co_fvar y }* c) <= n) as Size.
      rewrite size_clos_subst_covar.
      intuition.
      apply (Hc _ Size e f (S k) H0 H1 H4).
  - destruct e; simpl in *.
    + case_nat*.
    + assumption.
    + inversion H2.
      assert (Sp1:=size_prf_ge_1 p).
      assert (Se1:=size_cont_ge_1 e).
      assert (size_prf p <= n) as Sp by intuition.
      assert (size_cont e <= n) as Se  by intuition.
      apply context_stack.
      * apply (Hp p Sp _ _ _ H0 H1 H5).
      * apply (He e Se _ _ _ H0 H1 H6).
    + inversion H2.
      apply_fresh context_mut.
      assert (y \notin L) as Ly by intuition.
      specialize (H4 y Ly).
      rewrite open_clos_prf_var_def in *.
      rewrite* (@open_rec_clos_mix_comm c (prf_fvar y) e' 0 (k)).
      rewrite* (@open_rec_clos_mix_comm c (prf_fvar y) e0 0 (k)) in H4.
      assert (size_clos ({0 ~+> prf_fvar y }* c) <= n) as Size.
      rewrite size_clos_subst_var.
      apply eq_add_S in H.
      intuition.
      apply* (Hc _  Size e0 e').
  - destruct c as (p,g);simpl in *.
    inversion H2.
    assert (Sp1:=size_prf_ge_1 p).
    assert (Se1:=size_cont_ge_1 g).
    assert (size_prf p <= n) as Sp by intuition.
    assert (size_cont g <= n) as Se  by intuition.
    apply closure_cl.
    + apply* (Hp _ Sp e f).
    + apply* (He _ Se e f).
Qed.

      
(* Lemma subst_context: (forall p q r e f k, *)
(*                         (context (e) -> context(f) -> proof ({k ~-> e}+ p) ->  proof ({k ~-> f}+ p)) *)
(*                        /\ (proof (q) -> proof(r) -> proof ({k ~+> q}+ p) ->  proof ({k ~+> r}+ p))) *)
(* /\(forall f e e' k, *)
(*        context (e) -> context(f) -> context ({k ~-> e}- f) ->  context ({k ~-> e'}- f)) *)
(* /\(forall c e f k, *)
(*  context (e) -> context(f) -> closure ({k ~-> e}*c) ->  closure ({k ~-> e}*c)). *)
(* Proof. *)
(*   apply size_ind. *)
(*   intros n Hp He Hc. *)
(*   repeat split;intros. *)
(*   - induction p;simpl in *. *)
(*     + assumption. *)
(*     + assumption. *)
(*     + (* Check open_prf_prf. *) *)
(* (*       Check prf_abs_to_body. *) *)
(* (*       assert (body:=prf_abs_to_body H2). *) *)
(* (*       unfold body_prf_prf in body. *) *)
(*       inversion H2. *)
(*       apply_fresh proof_abs. *)
(*       apply eq_add_S in H. *)
(*       assert (y \notin L) as Ly by intuition. *)
(*       specialize (H4 y Ly). *)
(*       rewrite open_prf_prf_var_def in *. *)
      


(*       rewrite open_prf_prf_var_def in H4. *)
(*       destruct* (Hp ({k ~-> f }+ p) _ ). *)
      
(* Lemma subst_context :  p e f k (H: proof ({k ~-> e}+ p)): *)
(*   context (e) -> context(f) ->  proof ({k ~-> f}+ p) *)
(* with context_subst_context  f e e' k (H:context ({k ~-> e}- f)){struct H}: *)
(*   context (e) -> context(f) ->   context ({k ~-> e'}- f) *)
(* with closure_subst_context c e f k (H:closure ({k ~-> e}*c)) {struct H}: *)
(*  context (e) -> context(f) ->  closure ({k ~-> f}*c). *)
(* Proof. *)
(*   inductions H;intros. *)
(*   - destruct p;simpl in*;intuition; try (discriminate x). *)
(*   - pick_fresh a. *)
(*     assert (a\notin L) by intuition. *)
(*     destruct p;simpl in*;intuition;try (discriminate x). *)
(*     apply (H0 a H3 (p+^+a)) . *)

(* Fixpoint proof_subst_context p e f k {struct p}: *)
(*   context (e) -> context(f) -> proof ({k ~-> e}+ p) ->  proof ({k ~-> f}+ p) *)
(* with context_subst_context  f e e' k {struct e}: *)
(*        context (e) -> context(f) -> context ({k ~-> e}- f) ->  context ({k ~-> e'}- f) *)
(* with closure_subst_context c e f k {struct c}: *)
(*  context (e) -> context(f) -> closure ({k ~-> e}*c) ->  closure ({k ~-> e}*c). *)
(* Proof. *)
(* - intros He Hf Hp. *)
(*   induction p;simpl in *. *)
(*   + assumption. *)
(*   + assumption. *)
(*   + inversion Hp. *)


Lemma red_regular : forall c c',
  red c c' -> closure c /\ closure c'.
Proof.
  intros.
  induction H.
  - split.
    + apply closure_cl.
      apply (value_regular H0).
      exact H.
    + apply open_clos_prf.
      unfold body_clos_prf.
      inversion H.
      exists L.
      exact H2.
      exact (value_regular H0).
  - split.
    + apply* closure_cl.
    + apply* closure_cl.
      inversion H.
      apply_fresh context_mut.
      rewrite open_clos_prf_def.
      simpls.
      apply closure_cl.
      * apply* H3.
      * rewrite<- (@open_rec_cont_prf_id  e (prf_fvar y) H1 0).
        exact H1.
  - split.
    + apply* closure_cl.
    + rewrite open_clos_cont_def.
      inversion H.
      pick_fresh a.
      assert (a\notin L) by intuition.
      specialize (H2 a H3).
      rewrite open_clos_cont_var_def in H2.
      destruct subst_context as (_,(_,Hs)).
      apply* (Hs c (co_fvar a) e).
Qed.

(** Automation for reasoning on well-formedness. *)

Hint Extern 1 (ok ?E) =>
  match goal with
    | H: typing_prf E _ _ |- _ => apply (proj1 (typing_regular_prf H))
    | H: typing_cont E _ _ |- _ => apply (proj1 (typing_regular_cont H))
    | H: typing_clos E _  |- _ => apply (proj1 (typing_regular_clos H))
  end.

Hint Extern 1 (proof ?p) =>
  match goal with
  | H: typing_prf _ p _ |- _ => apply (proj2 (typing_regular_prf H))
   | H: value p |- _ => apply (value_regular H)
  end.

Hint Extern 1 (context ?e) =>
  match goal with
  | H: typing_cont _ e _ |- _ => apply (proj2 (typing_regular_cont H))
  end.

Hint Extern 1 (closure ?c) =>
  match goal with
  | H: typing_clos _ c _ |- _ => apply (proj2 (typing_regular_clos H))
  | H: red c _ |- _ => apply (proj1 (red_regular H))
  | H: red _ c |- _ => apply (proj2 (red_regular H))
  end.
