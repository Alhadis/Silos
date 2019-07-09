Require Import Maps.
Require Import String Ascii.
Require Import Compare_dec.
Require Import OrderedType.
Require Import SepAlg.
(* This requires the Containers library from 
   http://coq.inria.fr/pylons/contribs/view/Containers/v8.4 *)
Require Import MapInterface MapFacts.

Definition ascii_lt a b := nat_of_ascii a <<< nat_of_ascii b.
Definition ascii_compare a b := nat_compare (nat_of_ascii a) (nat_of_ascii b).

Instance StrictOrderAscii : StrictOrder ascii_lt eq.
Proof.
  split.
  + intros a b c Hab Hac. unfold ascii_lt in *. etransitivity; eassumption.
  + intros a b H Hab. unfold ascii_lt in H. rewrite Hab in H. apply lt_antirefl in H. assumption.
Qed.

Lemma nat_of_ascii_inj (a b : ascii) (H : nat_of_ascii a = nat_of_ascii b) : a = b.
Proof.
  assert (ascii_of_nat(nat_of_ascii a) = ascii_of_nat(nat_of_ascii b)) as H1
         by (rewrite H; reflexivity).
  do 2 rewrite ascii_nat_embedding in H1. assumption.
Qed.
 
Instance OrderedTypeAscii : OrderedType ascii := {
   _eq := Equivalence.equiv;
   _lt := ascii_lt;
   _cmp := ascii_compare
}.
Proof.
  intros x y.
  unfold ascii_compare, ascii_lt.
  destruct (compare_dec (nat_of_ascii x) (nat_of_ascii y)).
  + assert (nat_compare (nat_of_ascii x) (nat_of_ascii y) = Lt) as H1 by (apply nat_compare_lt; assumption).
    rewrite H1. apply compare_spec_lt. assumption.
  + assert (nat_compare (nat_of_ascii x) (nat_of_ascii y) = Eq) as H1 by (apply nat_compare_eq_iff; assumption).
    rewrite H1. apply compare_spec_eq. apply nat_of_ascii_inj. assumption.
  + assert (nat_compare (nat_of_ascii x) (nat_of_ascii y) = Gt) as H1 by (apply nat_compare_gt; assumption).
    rewrite H1. apply compare_spec_gt. assumption.
Qed.

Inductive string_lt : string -> string -> Prop :=
| s_emp a s : string_lt EmptyString (String a s)
| s_neq a b s t : a <<< b -> string_lt (String a s) (String b t)
| s_eq a b s t : a === b -> string_lt s t -> string_lt (String a s) (String b t).

Fixpoint string_compare s t := 
  match s, t with
      | EmptyString, EmptyString => Eq
      | EmptyString, String _ _ => Lt
      | String _ _, EmptyString => Gt
      | String a s, String b t =>
        match a =?= b with
          | Eq => string_compare s t 
          | c => c
        end
  end.
  
Lemma string_lt_empty a s (H: string_lt (String a s) "") : False.
Proof.
  remember (String a s) as s'; remember EmptyString as e. destruct H.
  + inversion Heqs'.
  + inversion Heqe.
  + inversion Heqe.
Qed.

Inductive stringEq : string -> string -> Prop :=
| s_empty : stringEq EmptyString EmptyString 
| s_cons a b s t : a === b -> stringEq s t -> stringEq (String a s) (String b t).                       

Instance StringEqEquiv : Equivalence stringEq.
Proof.
  split.
  + unfold Reflexive; intros x; induction x.
    apply s_empty. apply s_cons; [reflexivity | assumption].
  + unfold Symmetric; intros x y Hxy.
    induction Hxy. apply s_empty.
    apply s_cons; [symmetry|]; assumption.
  + unfold Transitive; intros x y z Hxy Hyz. generalize dependent z; 
    induction Hxy; intros; inversion Hyz.
    apply s_empty.
    inversion Hyz; subst.
    apply s_cons. transitivity b; assumption.
    apply IHHxy. assumption.
Qed.

Instance StrictOrderString : StrictOrder string_lt stringEq.
Proof.
  split.
  + intros a b c Hab Hac. generalize dependent c. induction Hab. 
    * intros c Hac. destruct c. apply string_lt_empty in Hac. destruct Hac.
      apply s_emp.
    * intros c Hac. destruct c. apply string_lt_empty in Hac. destruct Hac.
      inversion Hac; subst.
      - apply s_neq. etransitivity; eassumption.
      - apply s_neq. rewrite H3 in H. assumption.
    * intros c Hac. destruct c.  apply string_lt_empty in Hac. destruct Hac.
      inversion Hac; subst.
      - apply s_neq. rewrite <- H in H1. assumption.
      - apply s_eq. etransitivity; eassumption. apply IHHab; assumption.
  + intros x y Hxy H; induction Hxy.
    * inversion H.
    * inversion H; subst; rewrite H4 in H0. apply lt_antirefl in H0. destruct H0.
    * apply IHHxy. inversion H; subst. apply H6.
Qed.

Instance OrderedTypeString : OrderedType string := {
   _eq := stringEq;
   _lt := string_lt;
   _cmp := string_compare
}.
Proof.  
  intros x. induction x.
  + intros y. destruct y; simpl; try (repeat constructor).
  + intros y. destruct y; simpl; try (repeat constructor).    
    destruct (compare_dec a a0).
    * apply compare_spec_lt. apply s_neq. assumption.
    * eapply compare_spec_ind; [| | | apply IHx]; intros H1.
      - apply compare_spec_lt. apply s_eq; assumption.
      - apply compare_spec_eq. apply s_cons; assumption.
      - apply compare_spec_gt. apply s_eq; [symmetry|]; assumption.
    * apply compare_spec_gt. apply s_neq; assumption.
Qed.

Section SepAlgMap.
  Context {K} `{H: FMap K}.
  Context `{Spec: FMapSpecs K}.

  Global Instance MapSepAlgOps A : SepAlgOps (Map [K, A]) := {
    sa_unit := empty A;
    sa_mul :=  fun a b c => 
                 forall k, match find k c with
                             | Some y  => (MapsTo k y a /\ ~ In k b) \/ 
                                          (MapsTo k y b /\ ~ In k a)
                             | None => ~ In k a /\ ~ In k b
                           end
  }.

  Lemma sa_mul_add {A : Type} {a b c : Map [K, A]} {k : K} {y : A}
    (Habc : sa_mul a b c) (Hnotin : ~ In k b) :
      sa_mul (add k y a) b (add k y c).
  Proof.
    simpl in *; intros l.
    destruct (eqb_dec k l) as [e | e].
    rewrite add_eq_o; [|assumption].
    left; split.
    rewrite find_mapsto_iff. rewrite add_eq_o; [reflexivity | assumption].
    rewrite <- e. assumption.
    rewrite add_neq_o; [|assumption].
    specialize (Habc l); destruct (find l c).
    destruct Habc as [Habc | Habc].
    left. rewrite add_neq_mapsto_iff; assumption.
    right. rewrite add_neq_in_iff; assumption.
    rewrite add_neq_in_iff; assumption.
  Qed.

  Lemma sa_mul_inL {A : Type} {a b c : Map [K, A]} {k : K} 
        (Habc : sa_mul a b c) (Hin: In k a) : ~ In k b /\ In k c.
  Proof.        
    simpl in Habc.
    specialize (Habc k).
    remember (find k c) as o; destruct o; intuition.
    rewrite in_find_iff. rewrite <- Heqo. congruence.
  Qed.

  Lemma sa_mul_inR {A : Type} {a b c : Map [K, A]} {k : K}
        (Habc : sa_mul a b c) (Hin: In k c) :
    (In k a /\ ~ In k b) \/ (In k b /\ ~ In k a).
  Proof.
    simpl in Habc. specialize (Habc k).
    rewrite in_find_iff in Hin.
    destruct (find k c); [|intuition].
    destruct Habc as [[H2 H3] | [H2 H3]]; [left | right]; split; try assumption;
    rewrite in_find_iff;
    rewrite find_mapsto_iff in H2; rewrite H2; intuition.
  Qed.

  Lemma sa_mul_mapstoR {A : Type} {a b c : Map [K, A]} {k : K} {y : A}
        (Habc: sa_mul a b c) (Hc: MapsTo k y c) :
    (MapsTo k y a /\ ~ In k b) \/ (MapsTo k y b /\ ~ In k a).
  Proof.
    simpl in Habc.
    specialize (Habc k).
    rewrite find_mapsto_iff in Hc. destruct (find k c); inversion Hc; subst.
    assumption.
  Qed.
    
  Lemma map_sa_mul_notinR {A : Type} {a b c : Map [K, A]} {k : K}
        (Habc: sa_mul a b c) (Hc: ~ In k c) :
    ~ In k a /\ ~ In k b.
  Proof.
    simpl in Habc.
    specialize (Habc k).
    rewrite in_find_iff in Hc. assert (find k c = None) by admit.
    destruct (find k c); inversion H2; subst.
    assumption.
  Qed.
        
  Lemma find_fold_none A x (a b : dict K A) :
    find x (fold add a b) = None <->
    find x a = None /\ find x b = None.
  Proof.
    apply fold_rec_weak.
    intros. rewrite <- H2. apply H3.
    rewrite empty_o. intuition.
    intros.
    repeat rewrite add_o.
    destruct (k == x);
    intuition congruence.
  Qed.

 Lemma find_fold_some_left A x (a b : dict K A) y :
   find x (fold add a b) = Some y ->
   find x a = Some y \/ find x b = Some y.
 Proof.
   apply fold_rec_weak.
   intros. rewrite <- H2. apply H3. apply H4.
   rewrite empty_o. intuition. 
   intros. rewrite add_o.
   destruct (eq_dec k x). rewrite add_eq_o in H4; intuition.
   rewrite add_neq_o in H4; intuition.
 Qed. 

 Lemma find_fold_some_right A x (a b : dict K A) y :
   (find x a = Some y /\ find x b = None) \/ 
   (find x b = Some y /\ find x a = None) ->
   find x (fold add a b) = Some y.
 Proof.
   apply fold_rec.
   + intros m Hm [[H2 H3] | [H2 H3]].
     unfold Empty in Hm.
     assert False. eapply Hm. rewrite find_mapsto_iff. apply H2. destruct H4.
     apply H2.
   + intros k e c m' m'' Ha Hm' Hm'' IH [[H2 H3] | [H2 H3]];
     unfold Add in Hm''; rewrite find_mapsto_iff in Ha;
     rewrite add_o; destruct (eq_dec k x).
     * rewrite Hm'' in H2. rewrite add_eq_o in H2; assumption.
     * rewrite Hm'' in H2. rewrite add_neq_o in H2; intuition.
     * rewrite Hm'' in H3. rewrite add_eq_o in H3. inversion H3. assumption.
     * apply IH; rewrite Hm'' in H3. rewrite add_neq_o in H3; intuition.
 Qed. 

 Ltac SepOpSolve :=
    match goal with
      | H : (match find ?k ?d with | Some _ => _ | None => _ end) |- _ =>
        let e := fresh "e" in let y := fresh "y" in remember (find k d) as e;
            destruct e as [y |]; SepOpSolve
      | H : _ \/ _ |- _ => destruct H as [H | H]; SepOpSolve
      | H : _ /\ _ |- _ => let H1 := fresh "H" in destruct H as [H H1]; SepOpSolve
      | |- context [match find ?x (fold add ?a ?b) with | Some _ => _ | None => _ end] =>
        let e := fresh "e" in 
        let H := fresh "Heq" e in 
        remember (find x (fold add a b)) as e;
        symmetry in H; destruct e;
        [apply find_fold_some_left in H |
         rewrite find_fold_none in H]; SepOpSolve
      | H : forall x : K, _ |- _ => 
                   match goal with
                       | x : K |- _ => specialize (H x)
                   end; SepOpSolve
      | |- context [find _ (fold add _ _) = None] =>
        rewrite find_fold_none; SepOpSolve
      | |- context [MapsTo _ _ _] => repeat rewrite find_mapsto_iff; SepOpSolve
      | |- context [In _ _] => repeat rewrite in_find_iff; SepOpSolve
      | H : context [MapsTo _ _ _] |- _ => rewrite find_mapsto_iff in H; SepOpSolve
      | H : context [In _ _] |- _ => rewrite in_find_iff in H; SepOpSolve
      | |- context [find _ (fold add _ _) = Some _] =>
        first [intuition congruence | 
        try (erewrite find_fold_some_right; intuition congruence)]
      | _ => subst; try intuition congruence
    end.
 
 Require Import SepAlg Equiv.

  Global Instance MapEquiv A : Equiv (Map [K, A]) | 0 := Equal.

  Global Instance MapSepAlg A : SepAlg (Map [K, A]).
  Proof.
    split; simpl.
    + apply _.
    + intros * H2 H3 k; SepOpSolve.
    + intros * H2 H3 k; SepOpSolve.
    + intros * H2 k. SepOpSolve.
    + intros * H2 H3. 
      exists (fold add b c).
      split; intro x; SepOpSolve.
      right.
      erewrite find_fold_some_right.
      intuition congruence. left. 
      rewrite H3 in Heqe0. inversion Heqe0. subst. 
      split. assumption. admit. (* find decidable *)
      right. erewrite find_fold_some_right.
      intuition congruence.
      right. split; [assumption|].
      admit.
    + intros *; remember (find k a) as e; destruct e; simpl;
      repeat rewrite find_mapsto_iff; repeat rewrite in_find_iff;
      rewrite empty_o; intuition.
  Qed.

End SepAlgMap.