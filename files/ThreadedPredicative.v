Require Import Decidable.

Require Import DemonicComposition Statement LeastFixpoint Predicative.

Open Scope stmt_scope.

Definition old_pred { T : Type } := @pred T.

Fixpoint  pred_seq { T : Type } (C : @Stmt T) (spec : T >> T)
: Specification :=
  match C with
  | Void => fun s s' => False
  | Assignment effect => fun s s' => spec (effect s) s'
  | Seq cb ca => pred_seq cb (pred_seq ca spec)                                   
  | If p ct cf => fun s s' => (p s /\ pred_seq ct spec s s') \/ (~ p s /\ pred_seq cf spec s s')
  | While p cw => (while p (pred_seq cw (fun s s' => s = s'))) ⊟ spec
  | Spec call_spec => call_spec ⊟ spec
  | Block _ impl => pred_seq impl spec
  end.

Fixpoint pred_opt { T : Type } (C : @Stmt T) : T >> T :=
  match C with
  | Void => fun s s' => False
  | Assignment effect => fun s s' => effect s = s'
  | Seq c1 c2 => pred_seq c1 (pred_opt c2)
  | If p ct cf => fun s s' => (p s /\ pred_opt ct s s') \/ (~ p s /\ pred_opt cf s s')
  | While p c => while p (pred_opt c) 
  | Spec spec => spec
  | Block _ impl => pred_opt impl
  end.

Lemma pred_opt_pred_seq : forall { T : Type } (c1 c2 : @Stmt T) s s', pred_seq c1 (pred_opt c2) s s' <-> ((pred_opt c1) ⊟ (pred_opt c2)) s s'.
Proof.
  intros T c1.
  induction c1 as [ | effect | cc1 IHcc1 cc2 IHcc2 | p ct IHct cf IHcf | p cw IHcw | call_spec | bspec bimpl ]; simpl.
 { intros c2 s s'; split; intros HH.
    { contradiction. }
    { destruct HH as [[sx [HH _]] _ ]; auto. }
  }
  { intros c2 s s';  split; intros HH.
    { split.
      { exists (effect s); auto. }
      { intros sx HH1; subst sx; eauto. }
    }
    { destruct HH as [[sx [HHeql HHpred]] HH]; rewrite HHeql; exact HHpred. }
  }
  { intros c2 s s'.
    rewrite (DemonicComposition.left_extensionality _ _ _ (IHcc1 _)).
    rewrite (IHcc1 (Statement.Seq cc2 c2)); simpl.
    rewrite (DemonicComposition.right_extensionality _ _ _ (IHcc2 _)).
    split; intros HH; apply DemonicComposition.assoc; auto.
  }
  { intros c2 s s'; rewrite (IHcf _), (IHct _).
    split.
    { intros [ [HH1 [[sx [HH2 HH3]] HH4]] | [HH1 [[sx [HH2 HH3]] HH4]] ].
      { split; firstorder. }
      { split.
        { exists sx; split; auto. }
        { firstorder. }
      }
    }
    { intros [[sx [[[HH1 HH2] | [HH1 HH2]] HH3]] HH4].
      { left; split; auto; split; firstorder. }
      { right; split; auto; split; firstorder. }
    }
  }
  { intros c2 s s'; apply DemonicComposition.left_extensionality.
    intros r r'. apply while_extensionality.
    { reflexivity. }
    { clear s s' r r'; intros.
      rewrite (IHcw (Spec (fun s s' => s = s'))); simpl.
      rewrite DemonicComposition.right_identity_neutrality.
      reflexivity.
    }
  }
  { reflexivity. }
  { intros.
    rewrite IHc1_1.
    reflexivity.
  }
Qed.

Theorem pred_opt_IFF_old_pred : forall { S : Type } (c : @Stmt S) s s', old_pred c s s' <-> pred_opt c s s'.
Proof.
  induction c as [ | effect | c1 IHc1 c2 IHc2 | p ct IHct cf IHcf | p cw IHcw | call_spec | bspec bimpl ]; simpl; try reflexivity.
  { intros s s'; split; intros HHpred.
    { destruct HHpred as [[sx [HHpred1 HHpred2]] HHpred3].
      apply pred_opt_pred_seq; split.
      { exists sx; split; firstorder. }
      { intros sy HH1.
        rewrite <- IHc1 in HH1.
        destruct (HHpred3 _ HH1) as (sy',HH2).
        exists sy'; apply IHc2; auto.
      }
    }
    { apply pred_opt_pred_seq in HHpred.
      apply (DemonicComposition.extensionality _ _ _ _ IHc1 IHc2); auto.
    }
  }
  { intros s s'; rewrite IHct,IHcf; reflexivity. }
  { apply while_extensionality; auto; reflexivity. }
  { auto. }
Qed.

Definition old_while { S : Type } := @Predicative.while S.

Definition while { S : Type } (C : @Predicate S) P := lfp (fun X s s' => (C s /\ pred_seq P X s s') \/ (~ C s /\ s = s')).

Theorem old_while_while : forall { S : Type } (C : @Predicate S) P s s', old_while C (pred_opt P) s s' <-> while C P s s'.
Proof.
  intros S C P s s'.
  unfold old_while,while,while_functional.
  apply lfp_extensionality.
  clear s s'; intros X s s'.
  rewrite (pred_opt_pred_seq _ (Spec X)).
  simpl.
  reflexivity.
Qed.

Fixpoint pred { S : Type } (C : @Stmt S) : Specification :=
  match C with
  | Void => fun s s' => False
  | Assignment effect => fun s s' => effect s = s'
  | Seq c1 c2 => pred_seq c1 (pred_opt c2)
  | If p ct cf => fun s s' => (p s /\ pred_opt ct s s') \/ (~ p s /\ pred_opt cf s s')
  | While p c => while p c 
  | Spec spec => spec
  | Block _ bimpl => pred_opt bimpl
  end.

Lemma pred_pred_opt : forall { S : Type } (C : @Stmt S), forall s s', pred C s s' <-> pred_opt C s s'.
Proof.
  intros S C s s'.
  destruct C; simpl in *; try reflexivity.
  rewrite old_while_while.
  reflexivity.
Qed.

Theorem pred_old_pred : forall { S : Type } (C : @Stmt S), forall s s', pred C s s' <-> old_pred C s s'.
  intros S C s s'.
  apply (iff_trans (pred_pred_opt C s s')).
  apply iff_sym.
  apply pred_opt_IFF_old_pred.
Qed.

Theorem while_end : forall (S : Type) (C : @Predicate S) P s s', while C P s s' -> ~ C s'.
Proof.
  intros S C P s s'.
  rewrite <- old_while_while.
  apply Predicative.while_end.
Qed.

Theorem while_destruct : forall { S : Type } (C : @Predicate S) P s s',
    while C P s s' -> (C s /\ (pred_seq P (while C P)) s s') \/ (~ C s /\ s = s').
Proof.
  intros S C P s s'.
  rewrite <- old_while_while.
  rewrite (pred_opt_pred_seq P (Statement.Spec (while C P))); simpl.
  rewrite (DemonicComposition.extensionality (pred_opt P) (pred_opt P) (while C P) (old_while C (pred_opt P))); try reflexivity.
  { apply Predicative.while_destruct. }
  { clear s s'.
    intros s s'; rewrite old_while_while; reflexivity.
  }
Qed.

Theorem while_construct : forall { S : Type } (C : @Predicate S) P s s',
    (C s /\ (pred_seq P (while C P)) s s') \/ (~ C s /\ s = s') -> while C P s s'.
Proof.
  intros S C P s s'.
  rewrite <- old_while_while.
  rewrite (pred_opt_pred_seq P (Statement.Spec (while C P))); simpl.
  rewrite (DemonicComposition.extensionality (pred_opt P) (pred_opt P) (while C P) (old_while C (pred_opt P))); try reflexivity.
  { apply Predicative.while_construct. }
  { clear s s'.
    intros s s'; rewrite old_while_while; reflexivity.
  }
Qed.

Theorem while_fix : forall { S : Type } (C : @Predicate S) P s s', while C P s s' <-> (C s /\ (pred_seq P (while C P)) s s') \/ (~ C s /\ s = s').
Proof.
  intros S C P s s'.
  rewrite <- old_while_while.
  rewrite (pred_opt_pred_seq P (Statement.Spec (while C P))); simpl.
  rewrite (DemonicComposition.extensionality (pred_opt P) (pred_opt P) (while C P) (old_while C (pred_opt P))); try reflexivity.
  { apply Predicative.while_fix. }
  { clear s s'.
    intros s s'; rewrite old_while_while; reflexivity.
  }
Qed.

Theorem while_ind : forall { S : Type } (C : @Predicate S) P X s s',
    while C P s s' -> (forall s s', ((C s /\ (pred_seq P X) s s') \/ (~ C s /\ s = s')) -> X s s') -> X s s'.
Proof.
  intros S C P X s s' HHwhile HH.
  eapply (f_lfp _ _ _ _ _ HHwhile).
  Unshelve.
  auto.
Qed.

Theorem ex_while_ind : forall { S : Type } (C : @Predicate S) P (X : Predicate) s,
    (exists s', while C P s s') -> (forall s, ((C s /\ (forall sx, (pred P s sx -> X sx)) \/ (~ C s)) -> X s)) -> X s.
Proof.
  intros S C P X s (s',HHwhile).
  pattern s,s'; apply HHwhile.
  intros.
  apply H0.
  destruct H.
  { destruct H. left; split; auto.
    rewrite (pred_opt_pred_seq
               P (Statement.Spec (fun s _ : S => (forall s1 : S, C s1 /\ (forall sx : S, pred P s1 sx -> X sx) \/ ~ C s1 -> X s1) -> X s))) in H1.
    destruct H1.
    intros.
    rewrite pred_pred_opt in H3.
    destruct (H2 _ H3).
    apply H4.
    auto. 
  }
  { right; firstorder. }
Qed.

Theorem while_well_founded : forall { S : Type } (p : @Predicate S) C,
    well_founded (fun s s' => p s' /\ (pred C) s' s /\ (exists r, (while p C) s' r)).
Proof.
  intros S p C.
  constructor. 
  intros y [HHp [HHpred HHwhile]].
  generalize y HHp HHpred; clear y HHp HHpred.
  pattern a; apply (ex_while_ind _ _ _ _ HHwhile).
  intros.
  destruct H; try contradiction.
  destruct H.
  constructor; intros.
  destruct H1.
  destruct H2.
  apply (H0 y); auto.
Qed.

Lemma wfd_prefix_while : forall { S : Type } (C : @Predicate S) P (T : Specification),
    well_founded (fun s s' => C s' /\ pred P s' s)
    -> (forall s s', T s s' -> ((C s /\ pred_seq P T s s') \/ (~ C s /\ s = s')))
    -> forall s s', T s s' -> while C P s s'.
Proof.
  intros S C P T HHwfd HHT1 s.
  pattern s; apply (well_founded_ind HHwfd).
  intros sx HH s' HHT.
  pose proof (HHT1 _ _ HHT).
  rewrite (pred_opt_pred_seq _ (Statement.Spec T)) in H.
  destruct H as [(HHc,((sy,(HH11,HH12)),HH13)) | HH2]; simpl in *.
  { apply while_construct; left; split; auto.
    rewrite (pred_opt_pred_seq _ (Statement.Spec (while C P))).
    split; simpl; auto.
    { exists sy; split; auto.
      apply HH; auto; split; auto.
      apply pred_pred_opt; auto.
    }
    { intros sz HHp2.
      pose proof (HH13 _ HHp2) as (sz',HHT2).
      exists sz'.
      apply HH; auto; split; auto.
      apply pred_pred_opt; auto.
    }
  }
  { apply while_construct; right; auto. }
Qed.

Theorem wfd_fix_while : forall { S : Type } (C : @Predicate S) P (T : Specification),
    well_founded (fun s s' => C s' /\ pred P s' s)
    -> (forall s s', T s s' <-> ((C s /\ pred_seq P T s s') \/ (~ C s /\ s = s')))
    -> forall s s', while C P s s' <-> T s s'.
Proof.
  intros S C P T HHwfd HHT s s'.
  split.
  { intros HHwhile.
    apply (while_ind _ _ _ _ _ HHwhile).
    apply HHT.
  }
  { apply wfd_prefix_while; auto.
    apply HHT.
  }
Qed.


Theorem while_extensionality :
  forall { S : Type } (C1 : @Predicate S) P1 C2 P2,
    (forall s, C1 s <-> C2 s) -> (forall s s', pred P1 s s' <-> pred P2 s s') -> forall s s', while C1 P1 s s' <-> while C2 P2 s s'.
Proof.
  intros S C1 P1 C2 P2 HHequiv1 HHequiv2 s s'.
  assert ( forall s s' : S, pred_opt P1 s s' <-> pred_opt P2 s s') as HHequiv2'.
  { clear HHequiv1 s s'.
    intros s s'.
    repeat rewrite <- pred_pred_opt.
    auto.
  }
  clear HHequiv2.
  unfold while.
  apply lfp_extensionality.
  clear s s'.
  unfold while_functional.
  intros X s s'.
  rewrite HHequiv1.
  repeat rewrite (pred_opt_pred_seq _ (Statement.Spec X)).
  rewrite (DemonicComposition.left_extensionality _ _ _ HHequiv2').
  reflexivity.
Qed. 

Definition old_refines { S : Type } := @refines S.

Definition refines { S : Type } (S1 S2 : @Stmt S) :=
  forall s, (exists s', pred S2 s s') -> (forall s', pred S1 s s' -> pred S2 s s') /\ (exists s', pred S1 s s').

Lemma refines_old_refines : forall S (C1 C2 : @Stmt S), old_refines C1 C2 <-> refines C1 C2.
Proof.
  unfold old_refines, refines.
  intros S C1 C2.
  split; intros HHrefines.
  { intros s (t',HHc2).
    apply pred_old_pred in HHc2.
    destruct (HHrefines _ (ex_intro _ _ HHc2)) as (HHc1c2,(u',HHc1)).
    split.
    { intros s'; repeat rewrite pred_old_pred; apply HHc1c2. }
    { exists u'; rewrite pred_old_pred; exact HHc1. }
  }
  { intros s (t',HHc2).
    apply pred_old_pred in HHc2.
    destruct (HHrefines _ (ex_intro _ _ HHc2)) as (HHc1c2,(u',HHc1)).
    split.
    { intros s'; repeat rewrite <- pred_old_pred; apply HHc1c2. }
    { exists u'; rewrite <- pred_old_pred; exact HHc1. }
  }
Qed.

Notation "C1 ⊑ C2" := (refines C1 C2) (at level 60, format "C1  ⊑  C2").

Theorem if_extensionality :
  forall { S : Type } (C1 : @Predicate S) P1 C2 P2,
    (forall s, C1 s <-> C2 s) -> (forall s s', pred P1 s s' <-> pred P2 s s') -> forall s s', pred (IIf C1 Then P1 End) s s' <-> pred (IIf C2 Then P2 End) s s'.

Proof.
  intros S C1 P1 C2 P2 HHequiv1 HHequiv2 s s'.
  simpl. repeat rewrite <- pred_pred_opt.
  rewrite HHequiv1,HHequiv2.
  reflexivity.
Qed.

Theorem wfd_while_iff_if : forall { S : Type } (C : @Predicate S) P,
    well_founded (fun s s' => C s' /\ pred P s' s /\ C s)
    -> (⟨fun s s' => C s /\ pred P s s'⟩;⟨fun s s' => C s /\ pred P s s' \/ ~ C s /\ s = s'⟩) ⊑ ⟨fun s s' => C s /\ pred P s s'⟩
    -> forall s s', while C P s s' <-> pred (IIf C Then P End) s s' /\ ~ C s'.
Proof.
  intros S C P HHwfd HHrefines s s'.
  rewrite <- old_while_while.
  rewrite <- (Predicative.while_extensionality C (pred P) C (pred_opt P)); try reflexivity.
  { rewrite <- (if_extensionality C ⟨pred P⟩ C ); try reflexivity.
    apply Predicative.wfd_while_iff_if; auto.
  }
  { apply pred_pred_opt. }
Qed.

Theorem wfd_while_iff_if' : forall { S : Type } (C : @Predicate S) P,
    well_founded (fun s s' => C s' /\ pred P s' s /\ C s)
    -> (forall s s', C s /\ pred P s s' ->
               (forall sx, (C s' /\ pred P s' sx \/ ~ C s' /\ s' = sx) -> C s /\ pred P s sx)
               /\ exists sx, C s' /\ pred P s' sx \/ ~ C s' /\ s' = sx)
    -> forall s s', while C P s s' <-> pred (IIf C Then P End) s s' /\ ~ C s'.
Proof.
  intros S C P HHwfd HHrefines s s'.
  rewrite <- old_while_while.
  rewrite <- (Predicative.while_extensionality C (pred P) C (pred_opt P)); try reflexivity.
  { rewrite <- (if_extensionality C ⟨pred P⟩ C ); try reflexivity.
    apply Predicative.wfd_while_iff_if'; simpl; auto; apply HHrefines.
  }
  { apply pred_pred_opt. }
Qed.

Theorem wfd_while_refines_if : forall { S : Type } (C : @Predicate S) P,
    well_founded (fun s s' => C s' /\ pred P s' s /\ C s)
    -> (⟨fun s s' => C s /\ pred P s s'⟩;⟨fun s s' => C s /\ pred P s s' \/ ~ C s /\ s = s'⟩) ⊑ ⟨fun s s' => C s /\ pred P s s'⟩
    -> WWhile C Do P Done ⊑ IIf C Then ⟨fun s s' => pred P s s' /\ ~ C s'⟩ End.
Proof.
  intros * HHwfd HHrefines.
  unfold refines; simpl.
  intros * (s'',HHtrm).
  split.
  { intros s'.
    rewrite (wfd_while_iff_if _ _ HHwfd HHrefines).
    simpl.
    rewrite <- pred_pred_opt.
    clear.
    firstorder.
  }
  { exists s''.
    rewrite (wfd_while_iff_if _ _ HHwfd HHrefines).
    simpl.
    rewrite <- pred_pred_opt.
    destruct HHtrm.
    { firstorder. }
    { destruct H; subst s''; firstorder. }
  }
Qed.

Theorem wfd_while_refines_if' : forall { S : Type } (C : @Predicate S) P,
    well_founded (fun s s' => C s' /\ pred P s' s /\ C s)
    -> (forall s s', C s /\ pred P s s' ->
               (forall sx, (C s' /\ pred P s' sx \/ ~ C s' /\ s' = sx) -> C s /\ pred P s sx)
               /\ exists sx, C s' /\ pred P s' sx \/ ~ C s' /\ s' = sx)
    -> WWhile C Do P Done ⊑ IIf C Then ⟨fun s s' => pred P s s' /\ ~ C s'⟩ End.
Proof.
  intros * HHwfd HHrefines.
  unfold refines; simpl.
  intros * (s'',HHtrm).
  split.
  { intros s'.
    rewrite (wfd_while_iff_if' _ _ HHwfd HHrefines).
    simpl.
    rewrite <- pred_pred_opt.
    clear.
    firstorder.
  }
  { exists s''.
    rewrite (wfd_while_iff_if' _ _ HHwfd HHrefines).
    simpl.
    rewrite <- pred_pred_opt.
    destruct HHtrm.
    { firstorder. }
    { destruct H; subst s''; firstorder. }
  }
Qed.

Theorem if_refines_wfd_while : forall { S : Type } (C : @Predicate S) P,
    well_founded (fun s s' => C s' /\ pred P s' s /\ C s)
    -> (⟨fun s s' => C s /\ pred P s s'⟩;⟨fun s s' => C s /\ pred P s s' \/ ~ C s /\ s = s'⟩) ⊑ ⟨fun s s' => C s /\ pred P s s'⟩
    -> IIf C Then ⟨fun s s' => pred P s s' /\ ~ C s'⟩ End ⊑ WWhile C Do P Done.
Proof.
  intros * HHwfd HHrefines.
  unfold refines; simpl.
  intros * (s'',HHtrm).
  split.
  { intros s'.
    rewrite (wfd_while_iff_if _ _ HHwfd HHrefines).
    simpl.
    rewrite <- pred_pred_opt.
    intros [HHpred | HHskip].
    { firstorder. }
    { destruct HHskip; subst s'.
      clear - H. 
      firstorder.
    }
  }
  { exists s''.
    rewrite (wfd_while_iff_if _ _ HHwfd HHrefines) in HHtrm.
    simpl in HHtrm.
    rewrite <- pred_pred_opt in HHtrm.
    destruct HHtrm as ([ HHtrm | (HHc,HHeq) ], HHc').
    { firstorder. }
    { subst s''; firstorder. }
  }
Qed.

Require Import Wfd.

Theorem while_rule_sound_and_complete : forall { T : Type } (C : @Predicate T) P R,
    WWhile C Do P Done ⊑ R
    <-> exists K, P ⊑ K
           /\ well_founded (fun s s' => C s' /\ pred K s' s /\ C s)
           /\ (⟨fun s s' => C s /\ pred K s s'⟩;⟨fun s s' => C s /\ pred K s s' \/ ~ C s /\ s = s'⟩) ⊑ ⟨fun s s' => C s /\ pred K s s'⟩
           /\ IIf C Then ⟨fun s s' => pred K s s' /\ ~ C s'⟩ End ⊑ R.
Proof.
  intros *.
  repeat setoid_rewrite <- refines_old_refines.
  split; intros.
  { apply while_rule_sound_and_complete in H.
    unfold old_refines in *; simpl.
    destruct H as (K,(H1,(H2,(H3,H4)))).
    exists K.
    split.
    { auto. }
    { split.
      { apply (Wfd.by_inclusion _ _ _ H2).
        setoid_rewrite pred_old_pred; unfold old_pred; simpl.
        auto.
      }
      { unfold Predicative.refines in *; simpl in *.
        unfold DemonicComposition.fn in *.
        repeat setoid_rewrite (pred_old_pred K); unfold old_pred.
        auto.
      }
    }
  }
  { apply while_rule_sound_and_complete.
    unfold old_refines in *; simpl.
    destruct H as (K,(H1,(H2,H3))).
    exists K.
    split; auto.
    { split.
      { apply (Wfd.by_inclusion _ _ _ H2).
        setoid_rewrite pred_old_pred; unfold old_pred; simpl.
        auto.
      }
      { unfold Predicative.refines in *; simpl in *.
        unfold DemonicComposition.fn in *.
        repeat setoid_rewrite (pred_old_pred K) in H3; unfold old_pred.
        auto.
      }
    }
  }
Qed.

Theorem refines_reflexive : forall (T : Type)  (P : @Stmt T), refines P P.
Proof.
  intros T P.
  rewrite <- refines_old_refines.
  apply refines_reflexive.
Qed.

Theorem refines_trans : forall (S : Type)  (P Q R : @Stmt S), refines P Q -> refines Q R -> refines P R.
Proof.
  intros S P Q R.
  repeat rewrite <- refines_old_refines.
  apply refines_trans.
Qed.

Theorem Seq_left_monotonic_refines :
  forall (S : Type) (P1 P2 Q : @Stmt S), refines P1 P2 -> refines (Seq P1 Q) (Seq P2 Q).
Proof.
  intros S P1 P2 Q.
  repeat rewrite <- refines_old_refines.
  apply Seq_left_monotonic_refines.
Qed.

Theorem Seq_right_monotonic_refines :
  forall (S : Type) (P Q1 Q2 : @Stmt S), refines Q1 Q2 -> refines (Seq P Q1) (Seq P Q2).
Proof.
  intros S P Q1 Q2.
  repeat rewrite <- refines_old_refines.
  apply Seq_right_monotonic_refines.
Qed.

Theorem Seq_monotonic_refines :
  forall (S : Type) (P1 P2 Q1 Q2 : @Stmt S),
    refines P1 Q1
    -> refines P2 Q2
    -> refines (Seq P1 P2) (Seq Q1 Q2).
Proof.
  intros S P1 P2 Q1 Q2.
  repeat rewrite <- refines_old_refines.
  apply Seq_monotonic_refines.
Qed.

Theorem If_monotonic_refines :
  forall (S : Type) C (Pt Qt Pf Qf : @Stmt S),
    refines Pt Qt
    -> refines Pf Qf
    -> refines (If C Pt Pf) (If C Qt Qf).
Proof.
  intros S C Pt Pf Qt Qf.
  repeat rewrite <- refines_old_refines.
  apply If_monotonic_refines.
Qed.

Theorem While_monotonic_refines :
  forall (S : Type) C (P Q : @Stmt S),
    refines P Q
    -> refines (While C P) (While C Q).
Proof.
  intros S C P Q.
  repeat rewrite <- refines_old_refines.
  apply While_monotonic_refines.
Qed.

Theorem refines_extensionality_left : forall T (P1 P2 Q : @Stmt T), (forall s s', (pred P1) s s' <-> (pred P2) s s') -> refines P1 Q <-> refines P2 Q.
Proof.
  intros T P1 P2 Q HHequiv.
  unfold refines; split.
  { intros HHsnd s HHq.
    split.
    { intros s''; rewrite <- HHequiv; apply (HHsnd _ HHq). }
    { destruct (HHsnd _ HHq) as (_,(s',HHp1)); exists s'; rewrite <- HHequiv; exact HHp1. }
  }
  { intros HHsnd s HHq.
    split.
    { intros s''; rewrite HHequiv; apply (HHsnd _ HHq). }
    { destruct (HHsnd _ HHq) as (_,(s',HHp2)); exists s'; rewrite HHequiv; exact HHp2. }
  }
Qed.

Theorem while_fsim : forall T (C : @Predicate T) (P : @Stmt T) s s' f,
    (forall s, C s <-> C (f s))
    -> (forall s s', C s -> pred_opt P s s' -> pred_opt P (f s) (f s'))
    -> (forall s s', C (f s) -> pred_opt P (f s) s' -> exists r', pred_opt P s r' /\ f r' = s') 
    -> while C P s s' -> while C P (f s) (f s').
Proof.
  intros *.
  repeat rewrite <- old_while_while.
  apply Predicative.while_fsim.
Qed.

Close Scope stmt_scope.