Require Import List ListSet ListSetFacts basic.
Generalizable All Variables.
Set Implicit Arguments.
Inductive PR_InDom {A B} : list (A * B) -> A -> Type :=
  | pr_dom_fst : `{PR_InDom ((a,b)::rst) a}
  | pr_dom_rst : `{PR_InDom l a -> PR_InDom ((a',b')::l) a}.

Inductive InDom {A B} : list (A * B) -> A -> Prop :=
  | dom_fst : `{InDom ((a,b)::rst) a}
  | dom_rst : `{InDom l a -> InDom ((a',b')::l) a}.

Inductive MapsTo {A B} : list (A * B) -> A -> B -> Prop :=
  | map_fst : `{MapsTo ((a,b)::rst) a b}
  | map_rst : `{a <> a' -> MapsTo l a b -> MapsTo ((a',b')::l) a b}.

Inductive Unmapped {A B} : list (A * B) -> A -> Prop :=
  | unil : forall a, Unmapped nil a
  | ucons : forall a a' b l, Unmapped l a' -> a <> a' -> Unmapped ((a,b)::l) a'.

Inductive Functional {A B} : list (A * B) -> Prop :=
  | empty_fn : Functional nil
  | extend_fn : `{Functional l -> Unmapped l a -> Functional ((a,b)::l)}.

Fixpoint in_dom {A B} (Aeq_dec : dec_type A) (l : list (A * B)) (a : A) : bool :=
  match l with
      nil => false
    | (a',b)::l => if (Aeq_dec a a') then true else in_dom Aeq_dec l a
  end.

Hint Constructors MapsTo Unmapped InDom : fmaplist.

Lemma MapsTo_In : forall A B (l : list (A * B)) a b (H: MapsTo l a b), In (a,b) l.
Proof.
  induction l as [|(a,b) l' IH];
  intros a' b' H; inversion H; (* finishes base case *)
  subst; [constructor|right; apply IH]; auto.
Qed.

Theorem InDom_is_mapped : forall A B (eq_dec : dec_type A) (l : list (A * B)) a, InDom l a <-> exists b, MapsTo l a b.
Proof.
  induction l as [|(a_,b_) l_ IH].
  split; [intro H; inversion H |intros [x H]; inversion H].
  intro a; destruct (eq_dec a_ a) as [Heq|Hneq].
  subst; split; [exists b_|]; constructor.
  split; intro H;
   [inversion H as [|? ? ? ? H']; subst;
    [contradict Hneq
    |rewrite IH in H'; destruct H' as [b H'']; exists b; constructor]
   |destruct H as [b H'']; inversion H''; subst; [contradict Hneq|constructor; rewrite IH; exists b]]; auto.
Qed.

Theorem InDom_In : forall A B (eq_dec : dec_type A) (l : list (A * B)) a, InDom l a <-> exists b, In (a,b) l.
Proof.
  intros; split; intro H;
  [rewrite InDom_is_mapped in H; auto; destruct H as [b H']; apply MapsTo_In in H'; exists b
  |destruct H as [b H']; induction l as [|(a_,b_) l_ IH]; inversion H'; [inject_pair|];constructor]; auto.
Qed. 

Theorem in_dom_reflect : forall A B (eq_dec : dec_type A) (l : list (A * B)) a, InDom l a <-> in_dom eq_dec l a = true.
Proof.
  induction l as [|(a',b') l IH]; intros; split; intro H;
  solve [inversion H
        |simpl; destruct (eq_dec a a');
         [|inversion H; subst; [bad_eq|rewrite <- IH]]; auto
        |simpl in H; destruct (eq_dec a a'); [subst; constructor|constructor; rewrite IH; auto]].
Qed.

Theorem unmapped_not_mapped : forall A B
                                     (eq_dec : dec_type A)
                                     (l : list (A*B)) a,
                                (Unmapped l a <-> forall b, ~ MapsTo l a b).
Proof.
  intros A B eq_dec l a; induction l as [|(a',b') l' [IHl'0 IHl'1]];
  split;
  [intros H b bad; inversion bad
  |constructor
  |intros H b0 bad;
    inversion H as [| ? ? ? ? Hunmapped Hbad];
    inversion bad as [| ? ? ? ? ? ? Hbadmap]; subst;
    [contradict Hbad; reflexivity
    |specialize IHl'0 with Hunmapped; apply IHl'0 in Hbadmap]  
  |intros H; constructor;
  [apply IHl'1; intros bb bad; destruct (eq_dec a a'); subst;
      [pose (HC := (H b')); contradict HC; constructor
      |pose (HC := (H bb)); contradict HC; constructor; auto]
     |intro Heq; subst; apply H with (b := b'); constructor]]; auto.
Qed.

Lemma in_not_unmapped : forall A B (l : list (A * B)) a b (H:In (a,b) l), ~ Unmapped l a.
Proof.
  induction l as [|(a,b) l' IH]; intros a0 b0 H bad; inversion H; subst.
  inject_pair;
    inversion bad; auto.
  inversion bad as [|? ? ? ? bad']; apply IH with (b:= b0) in bad'; auto.
Qed.


Lemma in_functional_mapsto : forall A B (eq_dec : dec_type A) (l : list (A * B)) (F : Functional l)
                                    a b (H : In (a,b) l), MapsTo l a b.
Proof.
  induction l as [|(a,b) l' IH];
  intros F a' b' H; inversion H;[ (* finishes base case *)
    inject_pair; subst; constructor; auto
  |inversion F as [|? ? ? Hfun Hunmapped]; subst;
   destruct (eq_dec a a'); [subst; contradict Hunmapped; apply in_not_unmapped with (b:=b')
                           |constructor]]; auto.
Qed.

Remark functional_exchange : forall A B (l : list (A * B)) a b (F: Functional ((a,b)::l)) b', Functional ((a,b')::l).
Proof. intros; inversion F; constructor; auto. Qed.

Lemma MapsTo_same : forall A B (l : list (A * B)) a b b', MapsTo l a b -> MapsTo l a b' -> b = b'.
Proof.
  induction l as [|a0 l_ IH]; intros;
   inversion H;
   subst; inversion H0; subst; solve [reflexivity | bad_eq | apply IH with (a := a); auto].
Qed. 

Section ExtendLookup.
Variables (A B : Type) (eq_dec : (dec_type A)).
Fixpoint extend_map (a : A) (b : B) (ρ : list (A * B)) :=
  match ρ with
    | nil => (a, b)::nil
    | (a',b')::ρ' => if eq_dec a a' then
                       (a,b)::ρ'
                     else (a',b')::(extend_map a b ρ')
  end.
Fixpoint lookup_map (a : A) (ρ : list (A * B)) : option B :=
  match ρ with
    | nil => None
    | (a',b)::ρ' => if eq_dec a a' then
                       Some b
                     else (lookup_map a ρ')
  end.

Theorem extend_map_MapsTo : forall a b (ρ : list (A * B)), MapsTo (extend_map a b ρ) a b.
Proof.
  induction ρ as [|(a_,b_) ρ_ IH];
  [constructor
  |simpl; destruct (eq_dec a a_); constructor; auto].
Qed.

Theorem extend_map_MapsTo_eq : forall a b c (ρ : list (A * B)), MapsTo (extend_map a b ρ) a c -> b = c.
Proof.
  intros a b c ρ Hmap.
  assert (Hmap' : MapsTo (extend_map a b ρ) a b) by apply extend_map_MapsTo.
  exact (MapsTo_same Hmap' Hmap).
Qed.

Theorem extend_map_old : forall (ρ : list (A * B)) a a' b c , a <> a' -> MapsTo (extend_map a b ρ) a' c -> MapsTo ρ a' c.
Proof.
  induction ρ as [|(a_,b_) ρ_ IH]; intros a a' b c Hneq Hmap;
  [inversion Hmap as [|? ? ? ? ? ? bad]; [subst; bad_eq |inversion bad]
  |simpl in Hmap; destruct (eq_dec a a_);
    [subst; constructor; [|inversion Hmap; subst; [bad_eq |]]
    |inversion Hmap; subst; [constructor|constructor; [|apply (IH a a' b)]]]; auto].
Qed.

Theorem extend_mapsto_elim : forall a a' b b' (ρ : list (A * B)), MapsTo (extend_map a b ρ) a' b' -> (a = a' /\ b = b') \/ (a <> a' /\ MapsTo ρ a' b').
Proof.
  intros; destruct (eq_dec a a') as [Heq|Hneq];
  [subst; left; split; [|apply (extend_map_MapsTo_eq _ _ H)]
  |right; split;[|apply (extend_map_old _ _ Hneq H)]]; auto.
Qed.

Theorem lookup_mapsto : forall (l : list (A * B)) a b,
                          (MapsTo l a b) <-> (lookup_map a l) = Some b.
Proof.
  induction l as [|(a,b) l' IH]; [intros a b; split; intro Hvac; inversion Hvac|].
  intros a' b'; split; intro H; simpl in *;
  destruct (eq_dec a' a) as [Hleft|Hright];
  solve
   [inversion H; 
   try solve [contradict Hleft; auto
             |contradict Hright; auto
             |apply IH; auto
             |auto]
   |injection H; intros; subst; constructor
   |constructor; [|apply IH];auto].
Qed.

Theorem InDom_lookup : forall (l : list (A * B)) a,
                         InDom l a -> exists b, lookup_map a l = Some b.
Proof.
  intros l a H; rewrite InDom_is_mapped in H;
                [destruct H as [b Hmap]; rewrite lookup_mapsto in Hmap;
                 exists b; auto
                |exact eq_dec].
Qed.
End ExtendLookup.

Section RangeRestriction.

Variables (A B : Type) (Aeq_dec : dec_type A) (Beq_dec : dec_type B).

Definition functional_restrict_to_set (l : list (A * B)) (s : set A) :=
  filter (fun ab => match ab with (a,b) => if (set_In_dec Aeq_dec a s) then true else false end) l.                

Fixpoint restrict_to_set (l : list (A * B)) (s : set A) : list (A * B) :=
  match l with
      nil => nil
    | (a,b)::l => if (set_In_dec Aeq_dec a s) then
                     (a,b)::(restrict_to_set l (set_remove Aeq_dec a s))
                  else restrict_to_set l s
  end.

Definition functional_range_in_set (l : list (A * B)) (s : set A) :=
  fold_right (fun ab acc =>
             match ab with (a,b) => if (set_In_dec Aeq_dec a s) then
                                       set_add Beq_dec b acc
                                    else acc
             end)
             (empty_set _) l.

Fixpoint collect_domain (l : list (A * B)) : set A :=
  match l with
      nil => (empty_set _)
    | (a,_)::l => set_add Aeq_dec a (collect_domain l)
  end.
Open Scope list_scope.

Lemma collect_domain_nodup : forall l, NoDup (collect_domain l).
Proof.
  induction l as [|(a,b) l IH]; simpl; [constructor|apply set_add_nodup; auto].
Qed.  

Fixpoint range_in_set (l : list (A * B)) (s : set A) : set B :=
  match l with 
      nil => (empty_set _)
    | (a,b)::l => if (set_In_dec Aeq_dec a s) then
                     set_add Beq_dec b (range_in_set l (set_remove Aeq_dec a s))
                  else range_in_set l s
  end.

Lemma range_in_set_nodup : forall l s, NoDup (range_in_set l s).
Proof.
  induction l as [|(a,b) l IH]; intros; [constructor|].
  simpl.
  destruct (set_In_dec Aeq_dec a s);[apply set_add_nodup|]; apply IH.
Qed.  

Definition collect_range (l : list (A * B)) : set B :=
  range_in_set l (collect_domain l).

Theorem collect_range_nodup : forall l, NoDup (collect_range l).
Proof.
  intro l; apply range_in_set_nodup.
Qed.

Theorem restrict_is_restriction : forall l s a b, MapsTo (restrict_to_set l s) a b ->
                                                  MapsTo l a b /\ set_In a s.
Proof.
  induction l as [|(a_,b_) l_ IH]; intros s a b Hmap.
  inversion Hmap.
  simpl in Hmap;
    destruct (set_In_dec Aeq_dec a_ s) as [Hin|Hnin].
  
  inversion Hmap as [|? ? ? ? ? ? Hmap']; subst;
  [|apply IH in Hmap'; destruct Hmap' as [? Hinrem];apply set_remove_in in Hinrem];auto with fmaplist.

   apply IH in Hmap; destruct Hmap; split; [constructor; [intro bad; subst; contradiction|] |]; auto.
Qed.

End RangeRestriction.