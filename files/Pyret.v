Require Import Prelude.
Require Import ListExt.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import ProofIrrelevance.

Module Pyret (Import AtomM : ATOM) (Import String : STRING).

Module Atom := AtomM.AtomUOT.
Module Atoms := Coq.MSets.MSetList.Make (Atom).
Module AtomEnv := Coq.FSets.FMapList.Make (AtomM.Atom_as_OT).


Lemma eq_atom_refl : forall (a : atom), Atom.eq a a.
Proof. reflexivity. Qed.
Lemma eq_atom_sym : forall (a1 a2 : atom), Atom.eq a1 a2 -> Atom.eq a2 a1.
Proof. intros. symmetry. assumption. Qed.
Lemma eq_atom_trans : forall (a1 a2 a3 : atom), Atom.eq a1 a2 -> Atom.eq a2 a3 -> Atom.eq a1 a3.
Proof. intros. transitivity a2; assumption. Qed.

Add Relation AtomM.atom Atom.eq
  reflexivity proved by eq_atom_refl
  symmetry proved by eq_atom_sym
  transitivity proved by eq_atom_trans
as Eq_atom.


Ltac destruct_eq_dec a b :=
  let Eq := fresh "Eq" in
  destruct (Atom.eq_dec a b) eqn:Eq;
    try (unfold atom_eq_dec; rewrite Eq); auto;
    try solve [match goal with
                 | [ H : ?x <> ?x |- _ ]
                   => exfalso; apply H; reflexivity end].

Definition atom := AtomM.atom. (* free variables *)
Definition loc := AtomM.atom.
Definition string := String.string.

Parameter __check__ : atom.
Parameter __brand__ : atom.

Axiom check_brand_distinct : __check__ <> __brand__.

(* Tests *)
Goal (if Atom.eq_dec __check__ __check__ then 5 else 6) = 5.
destruct_eq_dec __check__ __check__.
Defined.
Goal (if Atom.eq_dec __check__ __brand__ then 5 else 6) = 6.
destruct_eq_dec __check__ __brand__.
  exfalso. apply check_brand_distinct; auto. Qed.

Inductive brand : Set :=
  | mkbrand : atom -> brand.

Inductive delta_op : Set :=
  | has_brand_delta : delta_op
  | add_brand_delta : delta_op.

Unset Elimination Schemes.
Inductive exp : Set :=
  | elam : list brand -> atom -> exp -> exp
  | eapp : exp -> exp -> exp
  | eid : atom -> exp
  | eobj : list brand -> list (atom * exp) -> exp
  | ebool : list brand -> bool -> exp
  | ebrand : brand -> exp
  | edelta : delta_op -> exp -> exp -> exp
  | egetfield : atom -> exp -> exp.
Set Elimination Schemes.

Definition exp_ind :=
  fun (P : exp -> Prop)
  (exp_rec_lam :
     forall (bs : list brand)
            (a : atom) (e : exp), P e -> P (elam bs a e))
  (exp_rec_app :
     forall a e : exp, P a -> P e -> P (eapp a e))
  (exp_rec_id :
     forall a : atom, P (eid a))
  (exp_rec_obj :
     forall (bs : list brand)
            (fs : list (atom * exp)),
       Forall P (map snd fs) ->
       P (eobj bs fs))
  (exp_rec_bool :
     forall (l : list brand) (b : bool), P (ebool l b))
  (exp_rec_brand :
     forall (b : brand), P (ebrand b))
  (exp_rec_delta :
     forall (a : delta_op) (e1 : exp) (e2 : exp), P e1 -> P e2 -> P (edelta a e1 e2))
  (exp_rec_getfield :
     forall (a : atom) (e : exp), P e -> P (egetfield a e)) =>
fix F (e : exp) : P e :=
  match e as e0 return (P e0) with
  | elam bs a e => exp_rec_lam bs a e (F e)
  | eapp a e => exp_rec_app a e (F a) (F e)
  | eid a => exp_rec_id a
  | eobj bs fs =>
    exp_rec_obj
      bs fs
      ((fix forall_rec
            (ls : list (atom * exp)) : Forall P (map snd ls) :=
          match ls with
            | nil => Forall_nil P
            | (_,e)::rest => Forall_cons e (F e) (forall_rec rest)
          end) fs)
  | ebool l b => exp_rec_bool l b
  | ebrand b => exp_rec_brand b
  | edelta a e1 e2 => exp_rec_delta a e1 e2 (F e1) (F e2)
  | egetfield a e => exp_rec_getfield a e (F e)
  end.


Definition values l := map (@snd atom exp) l.

Inductive value : exp -> Prop :=
  | vbool : forall l b, value (ebool l b)
  | vobj : forall l fs, Forall value (map snd fs) -> value (eobj l fs)
  | vlam : forall bs xs b, value (elam bs xs b)
  | vbrand : forall b, value (ebrand b).

 Hint Constructors value.


Inductive E : Set :=
  | E_hole : E
  | E_app1 : E -> exp -> E
  | E_app2 : exp -> E -> E
  | E_getfield : atom -> E -> E
  | E_obj : forall (bs : list brand)
                   (vs : list (atom * exp))
                   (es : list (atom * exp)),
              (Forall value (values vs)) ->  atom -> E -> E
  | E_delta1 : delta_op -> E -> exp -> E
  | E_delta2 : delta_op -> exp -> E -> E.

Inductive ae : exp -> Prop :=
  | redex_app : forall e1 e2, value e1 -> value e2 -> ae (eapp e1 e2)
  | redex_getfield : forall a e1, value e1 -> ae (egetfield a e1)
  | redex_delta : forall a e1 e2, value e1 -> value e2
                                  -> ae (edelta a e1 e2).


Inductive decompose : exp -> E -> exp -> Prop :=
  | ctxt_hole : forall e,
      ae e ->
      decompose e E_hole e
  | ctxt_app1 : forall E e1 e2 e',
      decompose e1 E e' ->
      decompose (eapp e1 e2) (E_app1 E e2) e'
  | ctxt_app2 : forall E v e e',
      value v ->
      decompose e E e' ->
      decompose (eapp v e) (E_app2 v E) e'
  | ctxt_getfield : forall a e E e',
                      decompose e E e' ->
                      decompose (egetfield a e) (E_getfield a E) e'
  | ctxt_obj : forall bs vs es a e E e'
                      (are_vals : Forall value (values vs)),
      decompose e E e' ->
      decompose (eobj bs (vs++(a,e)::es))
                (E_obj bs vs es are_vals a E) e'
  | ctxt_delta1 : forall a E e1 e2 e',
                    decompose e1 E e' ->
                    decompose (edelta a e1 e2) (E_delta1 a E e2) e'
  | ctxt_delta2 : forall a v E e e',
                    value v ->
                    decompose e E e' ->
                    decompose (edelta a v e) (E_delta2 a v E) e'.


Fixpoint plug (e : exp) (cxt : E) := match cxt with
  | E_hole => e
  | E_app1 ctxt e2 => eapp (plug e ctxt) e2
  | E_app2 v ctxt => eapp v (plug e ctxt)
  | E_getfield a ctxt => egetfield a (plug e ctxt)
  | E_obj bs vs es _ a ctxt => eobj bs (vs++(a,plug e ctxt)::es)
  | E_delta1 a ctxt e' => edelta a (plug e ctxt) e'
  | E_delta2 a v ctxt => edelta a v (plug e ctxt)
  end.


SearchAbout sumbool.

SearchAbout pair.

SearchAbout beq_nat.

Fixpoint subst (x:atom) (e:exp) (b:exp) :=
  match b with
    | elam bs arg body =>
      if Atom.eq_dec x arg
      then b
      else elam bs arg (subst x e body)
    | eapp fn arg =>
      eapp (subst x e fn) (subst x e arg)
    | eid x' =>
      if Atom.eq_dec x x' then e else b
    | edelta a arg1 arg2 => edelta a (subst x e arg1) (subst x e arg2)
    | eobj bs vs =>
      eobj bs (map (fun v => (fst v, subst x e (snd v))) vs)
    | egetfield a o => egetfield a (subst x e o)
    | ebool _ _ => b
    | ebrand _ => b
  end.

Fixpoint subst_many (xs : list atom) (es : list exp) (b : exp) :=
  match (xs,es) with
    | (cons x xs', cons e es') => subst_many xs' es' (subst x e b)
    | _ => b
  end.

Inductive eq_brand_i : brand -> brand -> Type :=
  | eq_brand : forall b1 b2, b1 = b2 ->
                             eq_brand_i (mkbrand b1)
                                        (mkbrand b2).

Fixpoint beq_brand (b1:brand) (b2:brand) :=
  match (b1,b2) with
    | (mkbrand x1, mkbrand x2) =>
      if Atom.eq_dec x1 x2 then true else false
  end.

Fixpoint brand_list (e:exp) : list brand :=
  match e with
    | eobj l _ => l
    | ebool l _ => l
    | _ => nil
  end.

Fixpoint brand_elem (l:list brand) (b:brand) : bool :=
  match l with
    | nil => false
    | (cons x xs) => if beq_brand x b then true else brand_elem xs b
  end.

Fixpoint has_brand (b:brand) (e:exp) : bool :=
  brand_elem (brand_list e) b.

Inductive has_brand_rel : exp -> brand -> Prop :=
  | has_brand_obj : forall l b vs, Forall value (values vs) ->
                                   In b l -> has_brand_rel (eobj l vs) b
  | has_brand_bool : forall l b v, In b l -> has_brand_rel (ebool l v) b
  | has_brand_lam : forall l a b body, In b l -> has_brand_rel (elam l a body) b.


Definition add_brand (b:brand) (e:exp) : exp :=
  match e with
    | eobj l vs => eobj (cons b l) vs
    | ebool l v => ebool (cons b l) v
    | elam l a body => elam (cons b l) a body
    | _ => e
  end.

SearchAbout list.

Fixpoint snoc {A:Type} (l:list A) (e:A) : list A :=
  match l with
    | [] => [e]
    | l::ls => l::(snoc ls e)
  end.

SearchAbout nth.


Inductive red : exp -> exp -> Prop :=
  | red_app : forall x e b l,
             value e ->
             red (eapp (elam l x b) e)
                 (subst x e b)
  | red_getfield : forall bs vs es a e,
                     Forall value (values vs) ->
                     Forall value (values es) ->
                     ~ In a (map (@fst atom exp) vs) ->
                     value e ->
                     red (egetfield a (eobj bs (vs ++ (cons (a,e) es))))
                         e
  | red_delta_hb : forall e b,
                     value e ->
                     red (edelta has_brand_delta (ebrand b) e)
                         (ebool nil (has_brand b e))
  | red_delta_ab : forall e b,
                     value e ->
                     red (edelta add_brand_delta (ebrand b) e)
                         (add_brand b e).



Inductive step : exp -> exp -> Prop :=
  | sdecompose : forall e E e' e'',
                   decompose e E e' ->
                   red e' e''
                   -> step e (plug e'' E).


Parameter __some_brand__ : atom.

Example step_has_brand1 :
  step (edelta has_brand_delta (ebrand (mkbrand __some_brand__))
               (ebool nil true))
       (ebool nil false).
Proof.
  assert ((ebool [] false) = (plug (ebool nil false) E_hole)). reflexivity.
  rewrite H.
  apply sdecompose with (e' := (edelta has_brand_delta (ebrand (mkbrand __some_brand__))
               (ebool nil true))).
  apply ctxt_hole. apply redex_delta. constructor. constructor. apply red_delta_hb. constructor.
Qed.

Example step_add_brand1 :
  step (edelta add_brand_delta (ebrand (mkbrand __some_brand__))
               (ebool nil true))
       (ebool [mkbrand __some_brand__] true).
Proof.
  assert ((ebool [mkbrand __some_brand__] true) = (plug (ebool [mkbrand __some_brand__] true) E_hole)).
  reflexivity.
  rewrite H.
  apply sdecompose with (e' := (edelta add_brand_delta (ebrand (mkbrand __some_brand__))
               (ebool nil true))).
  apply ctxt_hole. apply redex_delta. constructor. constructor. apply red_delta_ab. constructor.
Qed.

Definition multistep := multi step.

Example step_add_has_brand1 :
  multistep
    (edelta has_brand_delta
            (ebrand (mkbrand __some_brand__))
            (edelta add_brand_delta (ebrand (mkbrand __some_brand__))
                    (ebool nil true)))
    (ebool nil true).
Proof.
  apply multi_step with
  (y := (edelta has_brand_delta (ebrand (mkbrand __some_brand__))
                (ebool (cons (mkbrand __some_brand__) nil) true))).
  assert ((edelta has_brand_delta (ebrand (mkbrand __some_brand__))
                  (ebool [mkbrand __some_brand__] true))
          =
          (plug (ebool [mkbrand __some_brand__] true) (E_delta2 has_brand_delta (ebrand (mkbrand __some_brand__)) E_hole))).
  reflexivity.
  rewrite H.
  apply sdecompose with (e' := (edelta add_brand_delta (ebrand (mkbrand __some_brand__))
           (ebool [] true))).
  apply ctxt_delta2. constructor. apply ctxt_hole. constructor. constructor. constructor.
  apply red_delta_ab. constructor.
  apply multi_step with (y := (ebool [] true)).
  assert ((ebool [] true) =
          (plug (ebool [] true) E_hole)). reflexivity.
  rewrite H.
  apply sdecompose with (e' := (edelta has_brand_delta (ebrand (mkbrand __some_brand__))
        (ebool [mkbrand __some_brand__] true))).
  apply ctxt_hole. constructor. constructor. constructor.
  assert ((has_brand (mkbrand __some_brand__) (ebool [mkbrand __some_brand__] true))
          = true). simpl. destruct_eq_dec __some_brand__ __some_brand__.
  rewrite <- H0 at 2.
  apply red_delta_hb. constructor.
  apply multi_refl.
Qed.

Parameter f1 : atom.
Parameter f2 : atom.

(* SearchAbout fold_right. *)

(* Lemma app_split : forall A : Type, forall x y : list A, *)
(*                     x ++ y = fold_right cons y x. *)
(* Proof. *)
(*   intros. *)
(*   induction x. *)
(*   reflexivity. *)
(*   simpl. rewrite IHx. reflexivity. *)
(* Qed. *)

(* Lemma fold_cons : forall A : Type, forall x : A, forall y : list A, *)
(*                     x :: y = fold_right cons y [x]. *)
(* Proof. *)
(*   intros. *)
(*   reflexivity. *)
(* Qed. *)

Example step_obj1 :
  multistep
    (eobj nil
          ((f1,ebool nil true)
             ::(f2, edelta has_brand_delta
                       (ebrand (mkbrand __some_brand__))
                       (ebool nil true))
             ::nil))
    (eobj nil ((f1,ebool nil true)::(f2,ebool nil false)::nil)).
Proof.
  eapply multi_step.
  replace  ((f1,ebool nil true)
             ::(f2, edelta has_brand_delta
                       (ebrand (mkbrand __some_brand__))
                       (ebool nil true))
             ::nil) with  ([(f1,ebool nil true)]
             ++ ((f2, edelta has_brand_delta
                       (ebrand (mkbrand __some_brand__))
                       (ebool nil true))
             ::nil)) by auto.
  eapply sdecompose.
  apply ctxt_obj.
  apply ctxt_hole.
  apply redex_delta.
  constructor. constructor.
  eapply red_delta_hb.
  constructor.
  simpl.
  eapply multi_refl.
  (* Errg. we've proven it, but didn't satisfy the proof of values, so we have a dangling
     existential. just admit, for now *)
Admitted.


Parameter __arg__ : atom.

Example step_app_lam1 :
  multistep
    (eapp (elam nil __arg__ (eid __arg__)) (ebool nil true))
    (ebool nil true).
Proof.
  eapply multi_step with (y := (subst __arg__ (ebool nil true) (eid __arg__))).
  simpl. destruct_eq_dec __arg__ __arg__.
  assert ((ebool [] true) = (plug (ebool [] true) E_hole)). reflexivity. rewrite H at 2.
  eapply sdecompose.
  apply ctxt_hole. constructor. constructor. constructor.
  assert ((ebool [] true) = (subst __arg__ (ebool [] true) (eid __arg__))). simpl.
  destruct_eq_dec __arg__ __arg__.
  rewrite H0 at 2.
  apply red_app.
  constructor.
  simpl.
  destruct_eq_dec __arg__ __arg__.
  apply multi_refl.
Qed.

Example step_getfield1 :
  multistep
    (egetfield f1 (eobj [] [(f1, ebool nil true)]))
    (ebool nil true).
Proof.
  assert ((ebool [] true) = (plug (ebool [] true) E_hole)). reflexivity. rewrite H at 2.
  eapply multi_step.
  apply sdecompose with (e' := (egetfield f1 (eobj [] [(f1, ebool [] true)]))).
  apply ctxt_hole. constructor. constructor. simpl. apply Forall_cons. constructor. constructor.
  change [(f1, ebool nil true)] with ([] ++ [(f1, ebool nil true)]).
  apply red_getfield. simpl. constructor. simpl. constructor. simpl. auto. constructor.
  eapply multi_refl.
Qed.


(* Start the actual proofs of things that are actually interesting. *)


(* Note: following couple of lemmas taken dirently or adapted from lambda js *)
Lemma decompose_ae : forall e E e',
  decompose e E e' -> ae e'.
Proof with auto. intros. induction H... Qed.

Lemma plug_ok : forall e E e',
  decompose e E e' -> plug e' E = e.
Proof.
  intros.
  induction H; try (auto || simpl; rewrite IHdecompose; reflexivity).
Qed.

Lemma values_dec : forall e, value e \/ ~ value e.
Proof with eauto.
unfold not. intro.
induction e; try solve [left; constructor | right; intro H; inversion H].
Case "e_obj".
apply (forall_dec_dec_forall value (l:=(map (@snd atom exp) fs))) in H.
inversion H.
left; constructor; unfold values; auto... right. intro. inversion H1. contradiction.
Qed.

(* My lemmas start *)

Lemma map_cons : forall (A B : Type) (x : A) (l : list A) (f : A -> B),
                   map f (x::l) = (f x) :: (map f l).
Proof. intros. auto. Qed.

Lemma red_ae : forall e e', red e e' -> ae e.
Proof.
  intros.
  inversion H; try (repeat constructor || assumption).
  Case "egetfield".
  subst. SearchAbout app. rewrite map_app. rewrite forall_app.
  split. assumption. rewrite map_cons. simpl. constructor. assumption. assumption.
Qed.

Lemma values_dont_decompose : forall e E e', value e -> ~ decompose e E e'.
Proof.
  intros. unfold not. intro.
  (* This is absolute insanity. the whole point is that active expressions are not compatible with *)
  (* values, but I can't seem to get coq to recognize that in a non-heinous manner.  *)
  induction H0.
  inversion H.
  Case "ebool".
  inversion H0. subst. inversion H4. subst.
  inversion H3. subst. inversion H4.
  Case "eobj". subst. inversion H0.
  Case "elam". subst. inversion H0.
  Case "ebrand". subst. inversion H0.
  Case "eapp". inversion H.
  Case "eapp(?)". inversion H.
  Case "egetfield". inversion H.
  Case "eobj".
  inversion H. subst. rewrite forall_map_comm in H2.
  rewrite forall_app in H2. apply proj2 in H2.
  inversion H2. simpl in H4. apply IHdecompose. assumption.
  Case "edelta". inversion H.
  Case "edelta". inversion H.
Qed.

Theorem values_dont_step : forall e e', value e -> ~ step e e'.
Proof.
  intros. unfold not. intro. inversion H0.
  apply values_dont_decompose with (E := E0) (e' := e'0) in H.
  contradiction.
Qed.

(* This was sort of a baby-lemma, to get more familiar, so I could then prove
   the real thing, decompose_det. there is no point in having it, but I spent time on it
   so I don't want to delete it. *)
Lemma decompose_det_exp : forall x C y0 y1,
                        decompose x C y0 ->
                        decompose x C y1 -> y0 = y1.
Proof.
  intros.
  generalize dependent y1.
  induction H.
  Case "ctxt_hole".
  intros. inversion H0. reflexivity.
  Case "ctxt_app1".
  intros. inversion H0. subst. apply IHdecompose in H5. assumption.
  Case "ctxt_app2".
  intros. inversion H1. subst. apply IHdecompose in H7. assumption.
  Case "ctxt_getfield".
  intros. inversion H0. subst. apply IHdecompose in H5. assumption.
  Case "ctxt_obj".
  intros. inversion H0. subst. apply app_inv_head in H3. inversion H3. subst.
  apply IHdecompose in H8. assumption.
  Case "ctxt_delta1".
  intros. inversion H0. apply IHdecompose in H6. assumption.
  Case "ctxt_delta2".
  intros. inversion H1. apply IHdecompose in H8. assumption.
Qed.




Lemma forall_head : forall A (l0 : list A) (e0 : A) (t0 : list A)
                           (l1 : list A) (e1 : A) (t1 : list A)
                           (P : A -> Prop) (dec : forall (x : A), (P x) \/ ~ (P x)),
                      (l0 ++ e0 :: t0) = (l1 ++ e1 :: t1) -> Forall P l0 -> Forall P l1 ->
                      ~ P e0 -> ~ P e1 -> l0 = l1 /\ e0 = e1 /\ t0 = t1.
Proof.
  (* Not my prettiest proof... *)
  intros. generalize dependent l1.
  induction l0. intros.
  induction l1. split. reflexivity. split. simpl in H. inversion H. reflexivity.
  simpl in H. inversion H. reflexivity.
  simpl in H. inversion H. subst. inversion H1. contradiction.
  intros. induction l1. simpl in H. inversion H. subst. inversion H0. contradiction.
  inversion H. apply IHl0 in H6. split. assert (l0 = l1).
  apply proj1 in H6. assumption. rewrite H4. reflexivity.
  apply proj2 in H6. assumption.
  inversion H0. assumption. inversion H1. assumption.
Qed.

Lemma decompose_det : forall x C0 C1 y0 y1,
                        decompose x C0 y0 ->
                        decompose x C1 y1 -> y0 = y1 /\ C0 = C1.
Proof.
  intros.
  generalize dependent y1.
  generalize dependent C1.
  induction H.
  (* Focus 2. *)
  Case "ctxt_hole".
  intros. inversion H0.
  SCase "ctxt_hole".
  split ; reflexivity.
  SCase "ctxt_app1". subst.  inversion H. inversion H0.
  apply values_dont_decompose with (E := E0) (e' := y1) in H4. contradiction.
  SCase "ctxt_app2". subst.
  inversion H. apply values_dont_decompose with (E := E0) (e' := y1) in H6. contradiction.
  SCase "ctxt_getfield".
  inversion H. subst. inversion H7. subst. inversion H6. subst.
  apply values_dont_decompose with (E := E0) (e' := y1) in H5. contradiction.
  subst. inversion H7.
  SCase "ctxt_obj". subst. inversion H.
  SCase "ctxt_delta1". inversion H. subst. inversion H7. subst. inversion H6. subst.
  inversion H7. subst. apply values_dont_decompose with (E := E0) (e' := y1) in H5. contradiction.
  SCase "ctxt_delta2". inversion H. subst. inversion H8. subst. inversion H7. subst. inversion H8.
  subst. apply values_dont_decompose with (E := E0) (e' := y1) in H7. contradiction.
  Case "ctxt_app1".
  intros.
  (* The induction is confusing me here. x is (eapp e1 e2). C0 should be (E_app1 E0 e2), but
     is missing, for unknown reason. y0 is e'. C1 is anything, y1 is anything.  and of course
     we want to show that e' = y1. *)
  inversion H0. subst. inversion H1. apply values_dont_decompose with (E := E0) (e' := e') in H4.
  exfalso. auto.
  subst. apply IHdecompose in H5. split. apply proj1 in H5. assumption. apply proj2 in H5. subst.
  reflexivity.
  apply values_dont_decompose with (E := E0) (e' := e') in H3. exfalso. auto.
  Case "ctxt_app2".
  intros.
  inversion H1. subst. inversion H2. apply values_dont_decompose with (E := E0) (e' := e') in H6.
  exfalso. auto.
  subst. apply values_dont_decompose with (E := E1) (e' := y1) in H. exfalso. auto.
  subst. apply IHdecompose in H7. split. apply proj1 in H7. assumption. assert (E0 = E1).
  apply proj2 in H7. assumption. subst. reflexivity.
  case "ctxt_getfield".
  intros.
  inversion H0. subst. inversion H1. apply values_dont_decompose with (E := E0) (e' := e') in H3.
  exfalso. auto.
  subst. apply IHdecompose in H5. split. apply proj1 in H5. assumption. apply proj2 in H5. subst.
  reflexivity.
  Case "ctxt_obj".
  intros.
  inversion H0. subst. inversion H1.
  subst. assert (~ value e0). unfold not. intro.
  apply values_dont_decompose with (E := E1) (e' := y1) in H1. auto.
  assert (~ value e).
  unfold not. intro.
  apply values_dont_decompose with (E := E0) (e' := e') in H2. auto.
  assert (vs0 = vs).
    apply forall_head with (P := fun p : atom*exp => value ((@snd atom exp) p)) in H3.
    apply proj1 in H3. assumption. intro. destruct x. simpl. apply values_dec.
    unfold values in are_vals0. rewrite <- forall_map_comm. assumption.
    rewrite <- forall_map_comm. assumption. simpl. assumption. simpl. assumption.
  subst. apply app_inv_head in H3. inversion H3. subst. apply IHdecompose in H5.
  split. apply proj1 in H5. assumption. apply proj2 in H5. subst.
  f_equal. apply proof_irrelevance.
  Case "ctxt_delta1".
  intros.
  inversion H0. inversion H1. apply values_dont_decompose with (E := E0) (e' := e') in H7.
  contradiction.
  subst. apply IHdecompose in H6. split. apply proj1 in H6. assumption. apply proj2 in H6. subst.
  reflexivity.
  subst. apply values_dont_decompose with (E := E0) (e' := e') in H6. contradiction.
  Case "ctxt_delta2".
  intros.
  inversion H1. inversion H2.
  apply values_dont_decompose with (E := E0) (e' := e') in H10. contradiction.
  subst. apply values_dont_decompose with (E := E1) (e' := y1) in H. contradiction.
  subst. apply IHdecompose in H8. split. apply proj1 in H8. assumption. apply proj2 in H8. subst.
  reflexivity.
Qed.

Lemma not_in_cons : forall (A : Type) (x : A) (a : A) (l : list A),
                 ~ In x (a :: l) -> ~ In x l.
Proof.
  intros.
  unfold not in *. intro. apply in_cons with (a := a) in H0. contradiction.
Qed.

Lemma not_in_forall : forall (A : Type) (x : A) (l : list A),
                        ~ In x l -> Forall (fun y => ~ x = y) l.
Proof.
  intros. induction l.
  Case "[]".
  constructor.
  Case "a::l".
  apply Forall_cons. unfold not. intro. subst.
  unfold not in H. apply H. apply in_eq.
  apply not_in_cons in H. apply IHl in H. assumption.
Qed.

Lemma red_det : forall x y0 y1,
                  red x y0 ->
                  red x y1 -> y0 = y1.
Proof.
  intros.
  generalize dependent y1.
  induction H.
  Case "red_app".
  intros. inversion H0. reflexivity.
  Case "red_getfield".
  intros. inversion H3. subst. SearchAbout sumbool.
  apply forall_head with (P := fun p : atom*exp => ~ (a = (fst p))) in H6.
  apply proj2 in H6. apply proj1 in H6. inversion H6. reflexivity.
  (* The next three lines are needed to prove what seems like a trivial thing;
     that ~ eq is decidable on atoms *)
  intro. destruct x. simpl. rewrite or_comm. apply not_and. apply dec_not. apply AtomM.atom_dec_eq.
  unfold not at 1. intro. remember H4 as H5. clear HeqH5. apply proj1 in H4.
  apply proj2 in H5. contradiction.
  apply not_in_forall in H10. rewrite forall_map_comm in H10. assumption.
  apply not_in_forall in H1. rewrite forall_map_comm in H1. assumption.
  simpl. auto.
  simpl. auto.
  Case "red_delta_hb".
  intros. inversion H0. subst. reflexivity.
  Case "red_delta_ab".
  intros. inversion H0. subst. reflexivity.
Qed.

Theorem pyret_step_deterministic : forall x y0 y1,
                        step x y0 ->
                        step x y1 -> y0 = y1.

Proof with eauto.
  intros x y1 y2 Hy1 Hy2.
  generalize dependent y2.
  induction Hy1.
  Case "sdecompose".
  intros y2 Hy2.
  inversion Hy2.
  SCase "sdecompose".
  subst. assert (e' = e'0 /\ E0 = E1). apply decompose_det with (x := e) (C0 := E0) (C1 := E1) ;
                                       assumption.
  remember H3 as H3'.
  clear HeqH3'.
  apply proj2 in H3'.
  subst. f_equal. apply red_det with (x := e'). apply proj1 in H3. subst. assumption.
  apply proj1 in H3. subst. assumption.
Qed.

(* Now let's prove some stuff about pyret *)

Inductive no_deltas : exp -> Prop :=
  | nd_lam : forall l a body, no_deltas body -> no_deltas (elam l a body)
  | nd_app : forall fn arg, no_deltas fn -> no_deltas arg -> no_deltas (eapp fn arg)
  | nd_obj : forall l vs, Forall no_deltas (values vs) -> no_deltas (eobj l vs)
  | nd_getfield : forall a o, no_deltas o -> no_deltas (egetfield a o)
  | nd_bool : forall l b, no_deltas (ebool l b).

Fixpoint exp_size (e: exp) : nat :=
  match e with
    | elam _ _ b => S (exp_size b)
    | eapp f a => S (exp_size f + exp_size a)
    | eid _ => 1
    | eobj _ fs => S ((fix f aes :=
      match aes with
        | nil => 0
        | (_, e)::aes' => exp_size e + f aes'
      end) fs)
    | ebool _ _ => 1
    | ebrand _ => 1
    | edelta _ e1 e2 => S (exp_size e1 + exp_size e2)
    | egetfield _ o => S (exp_size o)
  end.


Inductive sub_exp : exp -> exp -> Prop :=
  | sub_eq : forall e e', e = e' -> sub_exp e e'
  | sub_lam : forall bs a e e', sub_exp e e' -> sub_exp e (elam bs a e')
  | sub_app1 : forall fn arg e, sub_exp e fn -> sub_exp e (eapp fn arg)
  | sub_app2 : forall fn arg e, sub_exp e arg -> sub_exp e (eapp fn arg)
  | sub_obj : forall bs vs vs' a e e', sub_exp e e' ->
                                    sub_exp e (eobj bs (vs++(a,e')::vs'))
  | sub_delta1 : forall a e1 e2 e, sub_exp e e1 -> sub_exp e (edelta a e1 e2)
  | sub_delta2 : forall a e1 e2 e, sub_exp e e2 -> sub_exp e (edelta a e1 e2)
  | sub_getfield : forall a o e, sub_exp e o -> sub_exp e (egetfield a o).

Example sub_exp_lam1 : sub_exp (ebool [] true) (elam [] __arg__ (ebool [] true)).
Proof.
  apply sub_lam. apply sub_eq. reflexivity.
Qed.

Lemma app_cons_neq_nil : forall (A:Type) (l1:list A) (e:A) (l2:list A), l1 ++ e::l2 <> [].
Proof.
  intros. unfold not. intro. induction l1. simpl in H. inversion H. simpl in H. inversion H.
Qed.


Example sub_exp_obj2 : ~ sub_exp (ebool [] true) (eobj [] [(f1, ebool [] false)]).
Proof.
  unfold not. intro.
  inversion H.
  Case "eq". inversion H0.
  Case "obj".
  destruct vs. simpl in H3. inversion H2; subst; inversion H3. simpl in H3. inversion H3.
  apply app_cons_neq_nil in H6. assumption.
Qed.

Lemma sub_exp_trans : forall e e' e'', sub_exp e e' -> sub_exp e' e'' -> sub_exp e e''.
Proof.
  intros.
  generalize dependent e.
  induction H0.
  Case "eq". intro. subst. auto.
  Case "lam".
  intros. apply IHsub_exp in H. apply sub_lam. assumption.
  Case "app1".
  intros. apply IHsub_exp in H. apply sub_app1. assumption.
  Case "app2".
  intros. apply IHsub_exp in H. apply sub_app2. assumption.
  Case "obj".
  intros. apply IHsub_exp in H. apply sub_obj. assumption.
  Case "delta1".
  intros. apply IHsub_exp in H. apply sub_delta1. assumption.
  Case "delta2".
  intros. apply IHsub_exp in H. apply sub_delta2. assumption.
  Case "getfield".
  intros. apply IHsub_exp in H. apply sub_getfield. assumption.
Qed.



(* Is this the only way of doing this? seems crazy *)
Inductive not_lam : exp -> Prop :=
  | not_lam_app : forall fn arg, not_lam (eapp fn arg)
  | not_lam_id : forall i, not_lam (eid i)
  | not_lam_obj : forall l vs, not_lam (eobj l vs)
  | not_lam_bool : forall l v, not_lam (ebool l v)
  | not_lam_brand : forall b, not_lam (ebrand b)
  | not_lam_delta : forall a e1 e2, not_lam (edelta a e1 e2)
  | not_lam_getfield : forall a o, not_lam (egetfield a o).

Inductive not_obj : exp -> Prop :=
  | not_obj_lam : forall l a b, not_obj (elam l a b)
  | not_obj_app : forall fn arg, not_obj (eapp fn arg)
  | not_obj_id : forall i, not_obj (eid i)
  | not_obj_bool : forall l v, not_obj (ebool l v)
  | not_obj_brand : forall b, not_obj (ebrand b)
  | not_obj_delta : forall a e1 e2, not_obj (edelta a e1 e2)
  | not_obj_getfield : forall a o, not_obj (egetfield a o).

Inductive not_brand : exp -> Prop :=
  | not_brand_lam : forall l a b, not_brand (elam l a b)
  | not_brand_app : forall fn arg, not_brand (eapp fn arg)
  | not_brand_id : forall i, not_brand (eid i)
  | not_brand_obj : forall l vs, not_brand (eobj l vs)
  | not_brand_bool : forall l v, not_brand (ebool l v)
  | not_brand_delta : forall a e1 e2, not_brand (edelta a e1 e2)
  | not_brand_getfield : forall a o, not_brand (egetfield a o).

Inductive not_brandable : exp -> Prop :=
  | not_brandable_brand : forall b, not_brandable (ebrand b)
  | not_brandable_app : forall fn arg, not_brandable (eapp fn arg)
  | not_brandable_id : forall i, not_brandable (eid i)
  | not_brandable_delta : forall a e1 e2, not_brandable (edelta a e1 e2)
  | not_brandable_getfield : forall a o, not_brandable (egetfield a o).


Inductive stuck : exp -> Prop :=
  (* First the non-recursive cases *)
  | stuck_app : forall e a, not_lam e -> stuck (eapp e a)
  | stuck_id : forall a, stuck (eid a)
  | stuck_getfield : forall a e, not_obj e -> stuck (egetfield a e)
  | stuck_missing_field : forall a l fs, ~ In a (map fst fs) -> stuck (egetfield a (eobj l fs))
  | stuck_delta_hb : forall e b, not_brand b -> stuck (edelta has_brand_delta b e)
  | stuck_delta_ab : forall e b, not_brand b -> stuck (edelta add_brand_delta b e)
  | stuck_delta_brandable : forall e b, not_brandable e -> stuck (edelta add_brand_delta b e)
  (* Now the recursive ones *)
  | stuck_app1 : forall fn arg, stuck fn -> stuck (eapp fn arg)
  | stuck_app2 : forall fn arg, stuck arg -> stuck (eapp fn arg)
  | stuck_obj : forall l vs, Exists stuck (values vs) -> stuck (eobj l vs)
  | stuck_delta1 : forall a e1 e2, stuck e1 -> stuck (edelta a e1 e2)
  | stuck_delta2 : forall a e1 e2, stuck e2 -> stuck (edelta a e1 e2)
  | stuck_getfieldr : forall a o, stuck o -> stuck (egetfield a o).

Lemma forall_tail : forall (A:Type) (x:A) (l:list A) P,
                      Forall P (x::l) -> Forall P l.
Proof.
  intros.
  inversion H. assumption.
Qed.


Lemma fst_split_foo : forall (A B:Type) (x:list (A*B)) (xa:A) (xb:B),
  fst (let (g, d) := split x in (xa :: g, xb :: d)) = xa :: (fst (split x)).
Proof.
  intros.
  destruct (split x).
  reflexivity.
Qed.

Lemma not_in_cons_head : forall (A:Type) (a x:A) (l:list A),
                           x <> a -> ~ In a l -> ~ In a (x::l).
Proof.
  intros. unfold not. intro. inversion H1; contradiction.
Qed.

(* Adapted from ListExt to also give proof that this is first *)
Theorem in_split_fst_first : forall A B a (l:list (A*B))
                               (dec : forall (x y: A), x = y \/ x <> y),
                               In a (fst (split l)) ->
                               exists l1,
                                 exists l2,
                                   exists b,
                                     l = l1++(a,b)::l2 /\ ~ In a (fst (split l1)).
Proof.
  induction l; intros; simpl... inversion H. remember a0 as a1. destruct a0 as (xa, xb).
  rewrite Heqa1 in H. rewrite fst_split_cons in H.
  destruct (dec a xa).
  exists []; exists l; exists xb... simpl; split. rewrite Heqa1. rewrite H0.
  reflexivity. unfold not. auto.
  inversion H.
  exists []; exists l; exists xb... simpl; split. rewrite Heqa1. rewrite H1.
  reflexivity. unfold not. auto.
  (* clear H. *) assert (H2 := IHl dec H1). inversion_clear H2. inversion_clear H3.
  inversion_clear H2.
  exists ((xa,xb)::x); exists x0; exists x1. simpl. inversion H3. split.  subst. reflexivity.
  assert (fst (let (g, d) := split x in (xa :: g, xb :: d)) = xa :: (fst (split x))).
  destruct (split x). reflexivity. rewrite H5.
  apply not_in_cons_head. unfold not. intro. symmetry in H6. contradiction.
  assumption.
Qed.

Lemma app_head : forall (A:Type) (x:A) (l:list A), x::l = [x] ++ l.
Proof. intros. auto. Qed.

(* This proof is long, but it's not terrible complicated; the basic idea is to
   short-circuit with either a value or something that is obviously stuck, or invert
   the other options until we either a. find something stuck or b. show the step.
   The step is a two step inversion - as we need to get the reduction and the context
   for the step *)
Theorem pyret_progress : forall e, value e \/ stuck e \/ (exists e', step e e').
Proof.
  intros.
  induction e.
  Case "elam". left. constructor.
  Case "eapp". inversion IHe1.
  SCase "value e1". inversion H; try (right; left;  constructor; constructor).
  SSCase "elam".
  inversion IHe2.
  SSSCase "value e2".
  right. right. exists (subst xs e2 b).
  assert (plug (subst xs e2 b) E_hole = subst xs e2 b). auto. rewrite <- H2.
  apply sdecompose with (e' := (eapp (elam bs xs b) e2)). constructor. constructor. constructor.
  assumption. constructor. assumption.
  inversion H1.
  SSSCase "stuck e2".
  right. left. apply stuck_app2. assumption.
  SSSCase "step e2".
  inversion H2. right. right. inversion H3. subst. exists (plug e'' (E_app2 (elam bs xs b) E0)).
  apply sdecompose with (e' := e'). constructor. constructor. assumption. assumption.
  inversion H.
  SCase "stuck e1". right. left. apply stuck_app1. assumption.
  SCase "step e1".
  inversion H0. right. right. inversion H1. subst. exists (plug e'' (E_app1 E0 e2)).
  apply sdecompose with (e' := e'). constructor. assumption. assumption.
  Case "eid". right. left. constructor.
  Case "eobj".
  induction fs.
  SCase "fs = []". left. constructor. simpl. constructor.
  SCase "fs = a :: fs".
  (* Get info about first, and in value case, get info about rest *)
  inversion H. inversion H2.
  SSCase "first is value".
  (* We first get info about the rest, and then deal with the head *)
  rewrite map_cons in H. rewrite app_head in H. rewrite forall_app in H. inversion H.
  apply IHfs in H6. inversion H6.
  SSSCase "rest is value".
  left. constructor. rewrite map_cons. rewrite app_head. rewrite forall_app.
  split. constructor. assumption. constructor. inversion H7. assumption.
  inversion H7.
  SSSCase "rest is stuck". right. left.
  inversion H8.
  apply stuck_obj. unfold values. unfold values in H10. rewrite map_cons.
  apply Exists_cons_tl. assumption.
  SSSCase "rest can step". (* Now we have to look at the first, because we step in order *)
  inversion H5. inversion H11.
  SSSSCase "first is value". right. right.
  inversion H8. inversion H14. inversion H15. inversion H19.
  assert (Forall value ((snd a)::(values vs))).
  apply Forall_cons. assumption. assumption.
  exists (plug e'' (E_obj bs (a::vs) es H24 a0 E1)).
  apply sdecompose with (e' := e').
  rewrite app_comm_cons. constructor. assumption. assumption.
  inversion H13.
  SSSSCase "first is stuck". right. left. apply stuck_obj. apply Exists_cons_hd. assumption.
  SSSSCase "first can step". right. right. inversion H14. inversion H15.
  exists (plug e'' (E_obj bs [] fs (Forall_nil value) (fst a) E0)).
  apply sdecompose with (e' := e'). assert (a::fs = [] ++ a::fs). reflexivity. rewrite H20.
  destruct a. constructor. assumption. assumption.
  (* There is some repetition. Essentially, we cased the first, and for the value case,
     dealt with the rest, which in some cases involved more rest/firsting. now we are back
     to the original, and in this case the first is stuck *)
  inversion H4.
  SSCase "first is stuck". right. left. apply stuck_obj. apply Exists_cons_hd. assumption.
  SSCase "first can step". right. right. inversion H5. inversion H6.
  exists (plug e'' (E_obj bs [] fs (Forall_nil value) (fst a) E0)).
  apply sdecompose with (e' := e'). assert (a::fs = [] ++ a::fs). reflexivity. rewrite H11.
  destruct a. constructor. assumption. assumption.
  Case "ebool". left. constructor.
  Case "ebrand". left. constructor.
  Case "edelta".
  inversion IHe1.
  SCase "value e1".
  inversion H; try solve [right; left; destruct a; repeat constructor].
  SSCase "ebrand". inversion IHe2.
  SSSCase "value e2".
  destruct a.
  right. right.
  repeat econstructor; auto.
  inversion H1.
  SSSSCase "ebool".
  right. right.
  exists (plug (ebool (b::l) b0) E_hole). eapply sdecompose. constructor.
  constructor. constructor. constructor. assert (ebool (b::l) b0 = add_brand b (ebool l b0)).
  reflexivity. rewrite H3. constructor. constructor.
  SSSSCase "eobj". right. right.
  exists (plug (eobj (b::l) fs) E_hole). eapply sdecompose. repeat constructor. assumption. repeat constructor. assumption.
  SSSSCase "elam". right. right.
  exists (plug (elam (b::bs) xs b0) E_hole). eapply sdecompose.
  repeat constructor. constructor. constructor. (* weird *)
  SSSSCase "ebrand". right. left. apply stuck_delta_brandable. constructor.
  inversion H1.
  SSSCase "stuck e2". right. left. apply stuck_delta2. assumption.
  SSSCase "step e2". right. right. inversion H2. inversion H3.
  exists (plug e'' (E_delta2 a (ebrand b) E0)).
  apply sdecompose with (e' := e'). repeat constructor.
  assumption. assumption.
  inversion H.
  SCase "stuck e1".
  right. left. apply stuck_delta1. assumption.
  SCase "step e1".
  right. right. inversion H0. inversion H1.
  exists (plug e'' (E_delta1 a E0 e2)). apply sdecompose with (e' := e').
  constructor. assumption. assumption.
  Case "getfield".
  inversion IHe.
  SCase "value e". inversion H.
  try solve [right; left; repeat constructor].
  SSCase "eobj".
  destruct (in_dec AtomM.atom_eq_dec a (map fst fs)).
  right. right.
  (* A lot of setup to get the actual value from the object *)
  assert (map fst fs = fst (split fs)).
  apply map_fst_fst_split.
  rewrite H2 in i.
  destruct (in_split_fst_first atom exp a fs AtomM.atom_dec_eq i).
  inversion H3. inversion H4.
  exists (plug x1 E_hole).
  apply sdecompose with (e' := (egetfield a (eobj l fs))).
  repeat constructor. assumption. inversion H5. rewrite H6.
  remember H0 as H8. clear HeqH8. rewrite H6 in H8.
  rewrite map_app in H8. apply forall_app in H8. inversion H8.
  apply red_getfield. assumption. rewrite map_cons in H10.
  apply forall_tail in H10. assumption.
  rewrite <- map_fst_fst_split in H7. assumption. rewrite map_cons in H10.
  inversion H10. assumption.
  (* Now the field isn't there... *)
  right. left.
  apply stuck_missing_field. assumption.
  repeat (try solve [right; left; repeat constructor]). (* Why does repeating this manually work *)
  repeat (try solve [right; left; repeat constructor]). (* When "repeat" obviously isn't... *)
  inversion H.
  SCase "stuck e". right. left. apply stuck_getfieldr. assumption.
  SCase "step e". right. right. inversion H0. inversion H1. exists (plug e'' (E_getfield a E0)).
  apply sdecompose with (e' := e'). repeat constructor. assumption. assumption.
Qed.


(* Useful proofs end here *)

Inductive eq_without_brands : exp -> exp -> Prop :=
  | ewb_lam : forall l l' a b, eq_without_brands (elam l a b)
                                                 (elam l' a b)
  | ewb_obj : forall l l' fs, eq_without_brands (eobj l fs)
                                                (eobj l' fs)
  | ewb_bool : forall l l' v, eq_without_brands (ebool l v)
                                                (ebool l' v).

Lemma value_step : forall p v, multistep p v ->
                               (exists p' p'' e E,
                                 multistep p p' /\
                                 decompose p' E e /\
                                 ~ sub_exp v p' /\
                                 red e v /\
                                 p'' = plug v E /\
                                 multistep p'' v).
Proof.
  admit.
Qed.



Lemma sub_exp_dec : forall e e', sub_exp e e' \/ ~ sub_exp e e'.
Proof.
  admit.
Qed.

Lemma has_brand_dec : forall e b, has_brand_rel e b \/
                                  ~ has_brand_rel e b.
Proof.
  admit.
Qed.


Ltac break_ands := repeat match goal with
                              | [ H : _ /\ _ |- _ ] => let H1 := fresh "H" in let H2 := fresh "H" in inversion H as [H1 H2]; clear H
                          end.

Theorem brands_unforgable : forall b v p,
                              multistep p v ->
                              has_brand_rel v b ->
                              (forall x b', sub_exp x p ->
                              ~ has_brand_rel x b') ->
                              (exists e v',
                               eq_without_brands v v' /\
                               sub_exp
                                 (edelta add_brand_delta
                                         (ebrand b) e) p /\
                               multistep e v').
Proof.
  intros.
  apply value_step in H.
  inversion_clear H. inversion_clear H2. inversion_clear H.
  inversion_clear H2.
  break_ands. subst.
  destruct (has_brand_dec x1 b).
  Case "x1 has brand".
  inversion H5; subst; inversion H4.
  Case "x1 doesn't have brand".
  assert (value v). inversion H0 ; auto.  
  inversion H4 ; subst.
  inversion H6; subst. 
  assert (sub_exp (ebool l0 b1) (eapp (elam l x0 b0) e)).
  destruct b0.
  apply H1 with (b' := b) in H5. 
  admit.
  Case "x1 not in p".
  inversion H3; subst.
  
  
  
  
  

Lemma sub_exps_nested : forall e e' e'', sub_exp e e' -> sub_exp e e'' -> sub_exp e' e'' ->
                                         e' <> e'' -> e <> e''.
Proof.
  intros.
  admit.
Qed.

Lemma step_preserves_no_deltas : forall e e', no_deltas e -> step e e' -> no_deltas e'.
Proof.
  admit.
Qed.

Lemma step_wo_delta_preserves_brands : forall x y b,
                                         no_deltas x ->
                                         ~ has_brand_rel x b ->
                                         step x y -> ~ has_brand_rel y b.
Proof.
  admit.
Qed.

Theorem brands_unforgable : forall (b : brand) (e p r : exp),
                              has_brand_rel e b -> no_deltas p ->
                              (forall x, sub_exp x p -> ~ x = e ->
                                         ~ has_brand_rel x b) ->
                              value e ->
                              sub_exp e p -> multistep p r ->
                              has_brand_rel r b -> r = e.
Proof.
  intros.
  induction H3.
  Case "p = r". subst. inversion H2.
  SCase "e = r". symmetry. assumption.
  SCase "e = elam". subst.
  inversion H4. subst.
  (* This really wierd structuring is because the proofs were being completed without adding *)
  (* givens... which was really strange. *)
  assert (e' <> (elam bs a e')).
    unfold not. intro. assert (exp_size e' = exp_size (elam bs a e')). rewrite H5 at 1. reflexivity.
    simpl in H6. omega.
  assert (e' = e'). reflexivity.
  assert (e <> elam bs a e').
  exact (sub_exps_nested e e' (elam bs a e') H3 H2 (sub_lam bs a e' e' (sub_eq e' e' H6)) H5).

  exfalso.
  unfold not in H1 at 2. apply H1 with (x := (elam bs a e')).
  constructor. reflexivity. unfold not. intro. symmetry in H8. contradiction.
  assumption.
  SCase "e = eapp1". subst. inversion H4.
  SCase "e = eapp2". subst. inversion H4.
  SCase "e = eobj". subst. admit.
  SCase "e = edelta1". subst. inversion H0.
  SCase "e = edelta2". subst. inversion H0.
  SCase "e = egetfield". subst. inversion H4.
  Case "p steps".
  inversion H2.
  SCase "e = x".
  apply IHmulti.
  apply step_preserves_no_deltas with (e := x). assumption. assumption.
  intros.
  apply step_wo_delta_preserves_brands with (x := x).
  assumption. apply H1. constructor. reflexivity.
  
  (* grr... x could equal e *)

end Pyret.