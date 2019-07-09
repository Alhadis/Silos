Require Import DASL List.

Definition negb (b:bool) : bool := 
  match b with
  | true => false
  | false => true
  end.

Definition andb (b1:bool) (b2:bool) : bool := 
  match b1 with 
  | true => b2 
  | false => false
  end.

Definition orb (b1:bool) (b2:bool) : bool := 
  match b1 with 
  | true => true
  | false => b2
  end.

(* This is heavily inspired by Paulien de Wind's M.Sc. Thesis: "Modal Logic in Coq", University of Amsterdam, 2001.
And the work of Pierre Lescanne, which can be found here: http://perso.ens-lyon.fr/pierre.lescanne/COQ/
 *)

Record frame : Type := {
  W : Set;
  Rk : DASL.Agents -> W -> W -> Prop;
  Rb : DASL.Agents -> W -> W -> Prop
}.

Check frame.



Check Build_frame.

Record model : Type := {
  F : frame;
  Val : (W F) -> Atoms -> Prop;
  Agents: DASL.Agents
}.


Fixpoint satisfies (M : model) (x : (W (F M))) (phi : prop) {struct phi} : Prop :=
  match phi with
  | _|_ => False
  | (atm atom) => (Val M x atom)
  | (imp phi1 phi2) => (satisfies M x phi1) -> (satisfies M x phi2)
  | (negp phi') => (~ (satisfies M x phi'))
  | (K a phi') => (forall y : (W (F M)), (Rk (F M) a x y) -> (satisfies M y phi'))
  | (B a phi') => (forall y : (W (F M)), (Rb (F M) a x y) -> (satisfies M y phi'))
  end.


Notation "M x |== phi" := (satisfies M x phi) (at level 80).

Definition Model_satisfies (M : model) (phi : prop) := forall (w : (W (F M))),
  satisfies M w phi .


Notation "M |= phi" := (Model_satisfies M phi) (at level 80).

Definition Frame_validity (F : frame) (phi : prop) := forall (Val : (W F) -> Atoms -> Prop) (Ags : DASL.Agents),
  (Model_satisfies (Build_model F Val Ags) phi).


Notation "F ||= phi" := (Frame_validity F phi) (at level 80).

Definition valid (phi : prop) := forall (F : frame),
  (Frame_validity F phi).


Definition reflexive_Rk_frame (F : frame) : Prop := 
  forall (w : (W F)) (ags : DASL.Agents), (Rk F ags w w).

Definition serial_Rb_frame (F : frame) : Prop := 
  forall (w : (W F)) (ags : DASL.Agents), 
    exists (y : (W F)), (Rb F ags w y).

Definition euclidean_Rb_frame (F : frame) : Prop :=
  forall (w x y : (W F)) (ags : DASL.Agents),
    (Rb F ags w x) ->
    (Rb F ags w y) ->
    (Rb F ags x y).

Definition Rb_subset_Rk (F : frame) : Prop :=
  forall (w x : (W F)) (a : DASL.Agents),
  (Rb F a w x) ->
  (Rk F a w x).

Definition Rb_subset_Rb_compose_Rk (F : frame) : Prop :=
  forall (w x y : (W F)) (a :  DASL.Agents),
  (Rb F a w x) ->
  (Rk F a x y) ->
  (Rb F a w y).

Lemma K_is_refl : forall (phi : prop) (F : frame) (a : DASL.Agents),
  (reflexive_Rk_frame F) ->
  F ||= ((K a phi) ==> phi).
Proof.
  intros.
  unfold reflexive_Rk_frame in H.
  unfold Frame_validity. 
    intros.
    unfold Model_satisfies. 
      intros. pose proof H w; clear H. pose proof H0 a; clear H0.
      unfold satisfies.
        intros. pose proof H0 w; clear H0. simpl in H1. pose proof H1 H; clear H1.
        auto.
Qed.

Hint Resolve K_is_refl.

Lemma B_is_serial : forall (phi : prop) (F : frame) (a : DASL.Agents),
  (serial_Rb_frame F) ->
  F ||= ((B a phi) ==> NOT (B a (NOT phi))).
Proof.
  intros.
  unfold serial_Rb_frame in H.
  unfold Frame_validity. 
    intros.
    unfold Model_satisfies. 
      intros. pose proof H w; clear H. pose proof H0 a; clear H0.
      unfold satisfies.
        destruct H.
        intros. pose proof H0 x; clear H0. simpl in H1. pose proof H1 H; clear H1. simpl. unfold not.
        intros.
        pose proof H1 x H; clear H1. pose proof H2 H0. assumption.
Qed.

Hint Resolve B_is_serial.

Lemma B_is_euclidean : forall (phi : prop) (F : frame) (a : DASL.Agents),
  (euclidean_Rb_frame F) ->
  F ||= (NOT (B a phi) ==> B a (NOT (B a phi))).
Proof.
  intros; unfold euclidean_Rb_frame in H; 
    unfold Frame_validity; 
      intros; unfold Model_satisfies;
          intros; unfold satisfies; unfold NOT; unfold not; 
            intros; contradiction H0;
              intro x; intros; pose proof H2 x; clear H2;
                pose proof H w; clear H; pose proof H2 y; clear H2; pose proof H x; clear H;
                pose proof H2 a H1; clear H2; pose proof H H3; clear H; pose proof H4 H2; assumption.
Qed.

Hint Resolve B_is_euclidean.

Lemma KB_is_Rb_subset_Rk : forall (phi : prop) (F : frame) (a : DASL.Agents),
  (Rb_subset_Rk F) ->
  F ||= (K a phi ==> B a phi).
Proof.
  intros; unfold Rb_subset_Rk in H;
    unfold Frame_validity;
      intros; unfold Model_satisfies;
        intros; unfold satisfies; intro H0; intro x;
          pose proof H0 x; clear H0; intro;
          pose proof H w x a H0; clear H;
          pose proof H1 H2; clear H1; assumption.
Qed.

Hint Resolve KB_is_Rb_subset_Rk.

Lemma B_BK_is_Rb_subset_Rb_compose_Rk : forall (phi : prop) (F : frame) (a : DASL.Agents),
  (Rb_subset_Rb_compose_Rk F) ->
  F ||= (B a phi ==> B a (K a phi)).
Proof.
  unfold Rb_subset_Rb_compose_Rk; intros;
  unfold Frame_validity; intros; unfold Model_satisfies; intros; unfold satisfies;
  intro H0; intro x; intro H1; intro y;
    pose proof H w x y a H1; clear H; intro H3;
    pose proof H2 H3; clear H2;
    pose proof H0 y H; clear H0;
    assumption.
Qed.

Hint Resolve B_BK_is_Rb_subset_Rb_compose_Rk.

Lemma Hilbert_K_Frame_Valid : forall (p q : prop) (F : frame) (a : DASL.Agents),
  F ||= (p ==> q ==> p).
Proof.
  intros p q F a.
  repeat (try unfold Frame_validity; intros; try unfold Model_satisfies; intros; try unfold satisfies; intros; assumption).
Qed.

Hint Resolve Hilbert_K_Frame_Valid.

Lemma Hilbert_S_Frame_Valid : forall (p q r : prop) (F : frame) (a : DASL.Agents),
  F ||= ((p==>q==>r)==>(p==>q)==>(p==>r)).
Proof.
  intros p q r F a.
  
  repeat (try unfold Frame_validity; 
              intros; try unfold Model_satisfies; 
              intros; try unfold satisfies;  
              intros; try pose proof H H1; clear H; 
                      try pose proof H0 H1; clear H0; 
                      try pose proof H2 H; 
          assumption).
Qed.

Hint Resolve Hilbert_S_Frame_Valid.

Axiom base_double_negation : forall p,
  not (not p) <-> p.

Hint Resolve base_double_negation.

Lemma Classic_NOTNOT_Frame_Valid : forall (p : prop) (F : frame) (a : DASL.Agents),
  F ||= ((NOT (NOT p)) ==> p).
Proof.
  intros p F a.
   repeat (try unfold Frame_validity; 
              intros; try unfold Model_satisfies; 
              intros; try unfold satisfies;  
              intros; try unfold NOT in H; 
                      try rewrite base_double_negation in H; 
                      try assumption).
Qed.

Hint Resolve Classic_NOTNOT_Frame_Valid.

Lemma MP_Frame_Valid : forall (p q : prop) (F : frame) (a : DASL.Agents),
  F ||= (p ==> q) ->
  F ||= p ->
  F ||= q.
Proof.
  intros p q F a.
  unfold Frame_validity.
  unfold Model_satisfies.
  unfold satisfies.
  intros.
  pose proof H Val0 Ags; clear H.
  pose proof H0 Val0 Ags; clear H0.
  pose proof H w; clear H.
  pose proof H1 w H0; clear H1. assumption.
Qed.

Hint Resolve MP_Frame_Valid.

Lemma K_Nec_Frame_Valid : forall (p : prop) (F : frame) (a : DASL.Agents),
  F ||= p ->
  F ||= K a p.
Proof.
  intros p F a.
  unfold Frame_validity; unfold Model_satisfies; unfold satisfies; intros.
  pose proof H Val0 Ags y; clear H. assumption.
Qed.

Hint Resolve K_Nec_Frame_Valid.

Lemma K_K_Frame_Valid : forall (p q : prop) (F : frame) (a : DASL.Agents),
  F ||= (K a p ==> K a (p ==> q) ==> K a q).
Proof.
  intros p q F a.
  unfold Frame_validity; unfold Model_satisfies; unfold satisfies. intros.
  pose proof H0 y H1; clear H0.
  pose proof H y H1; clear H. pose proof H2 H0; assumption.
Qed.

Hint Resolve K_K_Frame_Valid.

Lemma B_K_Frame_Valid : forall (p q : prop) (F : frame) (a : DASL.Agents),
  F ||= (B a p ==> B a (p ==> q) ==> B a q).
Proof.
  intros p q F a.
  unfold Frame_validity; unfold Model_satisfies; unfold satisfies. intros.
  pose proof H0 y H1; clear H0.
  pose proof H y H1; clear H. pose proof H2 H0; assumption.
Qed.

Hint Resolve B_K_Frame_Valid.

Definition DASL_Frame (F : frame) : Prop :=
  reflexive_Rk_frame F /\
  serial_Rb_frame F /\
  euclidean_Rb_frame F /\
  Rb_subset_Rk F /\
  Rb_subset_Rb_compose_Rk F.


Theorem DASL_Soundness : forall (phi : prop) (F : frame) (a : DASL.Agents),
  DASL_Frame F ->
  |-- phi ->
  F ||= phi.
Proof.
   intros phi F.
    unfold DASL_Frame.
    intros. destruct H; destruct H1; destruct H2; destruct H3. 
    induction H0; eauto.  
Qed. 

Inductive schema : Type :=
  | SProp : prop -> schema
  | SAnd : schema -> schema -> schema
  | SOr : schema -> schema -> schema
  | SImp : schema -> schema -> schema
  | SNeg : schema -> schema
  | SK : DASL.Agents -> schema -> schema
  | SB : DASL.Agents -> schema -> schema.

Notation "\ p" := (SNeg p) (at level 70, right associativity).
Infix "=s=>" := SImp (right associativity, at level 85).

Infix "|s|" := SOr (right associativity, at level 75).

Infix "&s&" := SAnd (right associativity, at level 75).

Axiom and_simp_left : forall (phi1 phi2 : prop) (F : frame),
  F ||= (phi1 & phi2) ->
  F ||= phi1.

Axiom and_simp_right : forall (phi1 phi2 : prop) (F : frame),
  F ||= (phi1 & phi2) ->
  F ||= phi2.

Fixpoint normal_form (phi : schema) : schema :=
  match phi with
  | SProp phi'=> SProp phi'
  | SAnd phi1 phi2 => SAnd (normal_form phi1) (normal_form phi2)
  | SOr phi1 phi2 => SOr (normal_form phi1) (normal_form phi2)
  | SImp phi1 phi2 => SOr (SNeg (normal_form phi1)) (normal_form phi2)
  | SNeg phi' => SNeg (normal_form phi')
  | SK a phi' => SK a (normal_form phi')
  | SB a phi' => SB a (normal_form phi')
  end.

Definition basic_schema (phi : schema) : Prop :=
  match phi with
  | SProp p => True
  | _ => False
  end.

Fixpoint negative_formula (phi : schema) : Prop :=
  match phi with
  | SProp p => False
  | SAnd phi1 phi2 => (negative_formula phi1) /\ (negative_formula phi2)
  | SOr phi1 phi2 => (negative_formula phi1) /\ (negative_formula phi2)
  | SImp phi1 phi2 => (negative_formula phi1) /\ (negative_formula phi2)
  | SNeg phi' => not (negative_formula phi')
  | SK a phi' => negative_formula phi'
  | SB a phi' => negative_formula phi'
  end.

Fixpoint positive_formula (phi : schema) : Prop :=
  match phi with
  | SProp p => True
  | SAnd phi1 phi2 => (positive_formula phi1) /\ (positive_formula phi2)
  | SOr phi1 phi2 => (positive_formula phi1) /\ (positive_formula phi2)
  | SImp phi1 phi2 => (positive_formula phi1) /\ (positive_formula phi2)
  | SNeg phi' => not (positive_formula phi')
  | SK a phi' => positive_formula phi'
  | SB a phi' => positive_formula phi'
  end.

Fixpoint boxed_formula (phi : schema) : Prop :=
  match phi with
  | SProp p => True
  | SAnd phi1 phi2 => False
  | SOr phi1 phi2 => False
  | SImp phi1 phi2 => False
  | SNeg phi' => False
  | SK a phi' => boxed_formula phi'
  | SB a phi' => boxed_formula phi'
  end.

Fixpoint s_a_component (phi : schema) : Prop :=
  match phi with
  | SProp p => True
  | SAnd phi1 phi2 => (s_a_component phi1) /\ (s_a_component phi2)
  | SOr phi1 phi2 => (s_a_component phi1) /\ (s_a_component phi2)
  | SImp phi1 phi2 => not (s_a_component phi1) /\ (s_a_component phi2)
  | SNeg phi' => match phi' with
                 | SProp p => True
                 | SAnd p1 p2 => positive_formula p1 /\ positive_formula p2
                 | SOr p1 p2 => positive_formula p1 /\ positive_formula p2
                 | SImp p1 p2 => negative_formula p1 /\ positive_formula p2
                 | SNeg p' => s_a_component p'
                 | SK a p' => not (s_a_component p')
                 | SB a p' => not (s_a_component p')
                 end
  | SK a phi' => boxed_formula phi'
  | SB a phi' => boxed_formula phi'
  end.

Fixpoint sahlqvist_antecedent (phi : schema) : Prop :=
  s_a_component (normal_form phi).

Definition sahlqvist_implication (phi psi : schema) : Prop :=
  sahlqvist_antecedent (phi) /\ positive_formula (psi).

Fixpoint prop_in_schema (phi : prop) (psi : schema) : Prop :=
  match psi with
    | SProp psi' => phi = psi'
    | SAnd psi1 psi2 => (prop_in_schema phi psi1) \/ (prop_in_schema phi psi2)
    | SOr psi1 psi2 => (prop_in_schema phi psi1) \/ (prop_in_schema phi psi2)
    | SImp psi1 psi2 => (prop_in_schema phi psi1) \/ (prop_in_schema phi psi2)
    | SNeg psi' => (prop_in_schema phi psi')
    | SK a psi' => (prop_in_schema phi psi')
    | SB a psi' => (prop_in_schema phi psi')
  end.

Fixpoint share_prop_letter (phi psi : schema) {struct phi} : Prop :=
  match phi with
    | SProp phi' => match psi with
                      | SProp psi' => phi' = psi'
                      | SAnd psi1 psi2 => (prop_in_schema phi' psi1) \/ (prop_in_schema phi' psi2)
                      | SOr psi1 psi2 => (prop_in_schema phi' psi1) \/ (prop_in_schema phi' psi2)
                      | SImp psi1 psi2 => (prop_in_schema phi' psi1) \/ (prop_in_schema phi' psi2)
                      | SNeg psi' => (prop_in_schema phi' psi')
                      | SK a psi' => (prop_in_schema phi' psi')
                      | SB a psi' => (prop_in_schema phi' psi')
                    end
    | SAnd phi1 phi2 => (share_prop_letter phi1 psi) \/ (share_prop_letter phi2 psi)
    | SOr phi1 phi2 => (share_prop_letter phi1 psi) \/ (share_prop_letter phi2 psi)
    | SImp phi1 phi2 => (share_prop_letter phi1 psi) \/ (share_prop_letter phi2 psi)
    | SNeg phi' => (share_prop_letter phi' psi)
    | SK a phi' => (share_prop_letter phi' psi)
    | SB a phi' => (share_prop_letter phi' psi)
  end.

Example shared_and : forall (p q : prop),
share_prop_letter ((SProp p) &s& (SProp q)) (SProp p).
Proof.
intros. simpl. intuition.
Qed.

Example not_shared_and : forall (p q r : prop),
p <> r /\ q <> r ->
~ share_prop_letter ((SProp p) &s& (SProp q)) (SProp r).
Proof.
intros. unfold not. simpl. intuition.
Qed.

Theorem share_prop_letter_correct : forall (p q : prop),
  share_prop_letter (SProp p) (SProp q) <->
  p = q.
Proof.
intros. split; intros; simpl in H; auto.
Qed.

Fixpoint sahlqvist_formula (phi : schema) : Prop :=
  match phi with
    | SProp phi'=> True
    | SAnd phi1 phi2 => (sahlqvist_formula phi1) /\ (sahlqvist_formula phi2)
    | SOr phi1 phi2 => not (share_prop_letter phi1 phi2) /\ (sahlqvist_formula phi1) /\ (sahlqvist_formula phi2)
    | SImp phi1 phi2 => (sahlqvist_implication phi1 phi2)
    | SNeg phi' => ~ (positive_formula phi')
    | SK a phi' => sahlqvist_formula phi'
    | SB a phi' => sahlqvist_formula phi'
  end.


Lemma sahlqvist_antecedent_p_and_q : forall (p q : prop),
  sahlqvist_antecedent (SAnd (SProp p) (SProp q)).
Proof.
  intros. simpl; auto.
Qed.  
  
(* Fixpoint sahlqvist_formula (phi : prop) {struct phi} : Prop :=
  match phi with
  | _|_ => True
  | (atm atom) => True
  | (negp p') => sahlqvist_formula p'
  | (imp p1 p2) => (sahlqvist_antecedent p1) /\ (positive_formula p2)
  | (K a p') => sahlqvist_formula p'
  | (B a p') => sahlqvist_formula p'
  end.
 *)
Lemma K_T_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (SK a (SProp phi) =s=> (SProp phi)).
Proof.
  intros. simpl. unfold sahlqvist_implication; split; unfold positive_formula; simpl; intuition. 
Qed.

Hint Resolve K_T_is_sahlqvist.

Ltac sahlqvist_reduce := simpl; try (unfold sahlqvist_implication; split);
  try (unfold positive_formula; simpl; intuition);
  try (unfold sahlqvist_antecedent; simpl; intuition; unfold normal_form).
  

Ltac not_sahlqvist := try (unfold sahlqvist_formula; unfold sahlqvist_implication; simpl; intuition).

Lemma B_Serial_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (SB a (SProp phi) =s=> \ (SB a (\ SProp phi))).
Proof.
  intros; sahlqvist_reduce.
Qed.

Hint Resolve B_Serial_is_sahlqvist.

Lemma B_5_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (\ (SB a (\ SB a (SProp phi))) =s=> (SB a (SProp phi))).
Proof.
intros; sahlqvist_reduce. 
Qed.

Hint Resolve B_5_is_sahlqvist.

Example Lob_not_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  ~ sahlqvist_formula (SK a (SK a (SProp phi) =s=> (SProp phi)) =s=> SK a (SProp phi)).
Proof.
intros. unfold not. not_sahlqvist. 
Qed.

Lemma K_B_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (SK a (SProp phi) =s=> SB a (SProp phi)).
Proof.
  intros; sahlqvist_reduce.
Qed.

Hint Resolve K_B_is_sahlqvist.

Lemma B_BK_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (SB a (SProp phi) =s=> SB a (SK a (SProp phi))).
Proof.
  intros; sahlqvist_reduce.
Qed.

Hint Resolve B_BK_is_sahlqvist.

(* Lemma Hilbert_K_is_sahlqvist : forall (p q : prop) (a : DASL.Agents),
  sahlqvist_formula (normal_form ((SProp p) =s=> (SProp q) =s=> (SProp p))).
Proof.
  intros. simpl; auto.
Qed.

Hint Resolve Hilbert_K_is_sahlqvist. 

Lemma Hilbert_S_is_sahlqvist : forall (p q r : prop),
  sahlqvist_formula (normal_form (((SProp p) =s=> (SProp q) =s=> (SProp r)) =s=>
                    ((SProp p) =s=> (SProp q)) =s=>
                    ((SProp p) =s=> (SProp r)))).
Proof.
intros. simpl; auto. 
Qed. 

Hint Resolve Hilbert_S_is_sahlqvist. *)

Example McKinsey_not_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  ~ sahlqvist_formula (SK a (SNeg (SK a (SNeg (SProp phi)))) =s=> SNeg (SK a (SNeg (SK a (SProp phi))))).
Proof.
intros; not_sahlqvist.  
Qed.

Lemma Classic_NOTNOT_is_sahlqvist : forall (p : prop),
  sahlqvist_formula (SNeg (SNeg (SProp p)) =s=> (SProp p)).
Proof.
intros; sahlqvist_reduce. 
Qed.

Hint Resolve Classic_NOTNOT_is_sahlqvist.

Example Church_Rosser_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (\ (SK a (\ (SK a (SProp phi)))) =s=> (SK a (\ (SK a (\ (SProp phi)))))).
Proof.
  intros; sahlqvist_reduce.
Qed.

Example Brouwer_is_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula ((SProp phi) =s=> \ (SK a (\ (SK a (SProp phi))))).
Proof.
  intros; sahlqvist_reduce.
Qed.

Example Brouwer_is_not_sahlqvist : forall (phi : prop) (a : DASL.Agents),
  ~ ( sahlqvist_formula ((SProp phi) =s=> \ (SK a (\ (SK a (SProp phi))))) ).
Proof.
intros; not_sahlqvist. Abort.

Example Very_simple_Blackburn: forall (p : prop) (a : DASL.Agents),
  sahlqvist_formula (((SProp p) &s& (\ (SK a (\ (\ (SK a (\ (SProp p)))))))) =s=>
    (\ (SK a (\ (SProp p))))).
Proof.
intros; sahlqvist_reduce. 
Qed.

Example sahlqvist_Blackburn_example_1 : forall (phi : prop) (a : DASL.Agents),
  sahlqvist_formula (SK a ((SProp phi) =s=> (\ (SK a (\ (SProp phi)))))).
Proof.
  intros; sahlqvist_reduce. 
Qed.

Fixpoint schema_to_prop (phi : schema) : prop :=
  match phi with
  | SProp phi' => phi'
  | SAnd phi1 phi2 => (schema_to_prop phi1) & (schema_to_prop phi2)
  | SOr phi1 phi2 => (schema_to_prop phi1) V (schema_to_prop phi2)
  | SImp phi1 phi2 => (schema_to_prop phi1) ==> (schema_to_prop phi2)
  | SNeg phi' => ! (schema_to_prop phi')
  | SK a phi' => K a (schema_to_prop phi')
  | SB a phi' => B a (schema_to_prop phi')
  end.

Fixpoint prop_to_schema (phi : prop) : schema :=
  match phi with
  | _|_ => SProp (_|_)
  | (atm atom) => SProp (atm atom)
  | (imp phi1 phi2) => (prop_to_schema phi1) =s=> (prop_to_schema phi2)
  | (negp phi') => SNeg (prop_to_schema phi')
  | (K a phi') => SK a (prop_to_schema phi')
  | (B a phi') => SB a (prop_to_schema phi')
  end.


Inductive Stheorem : schema -> Prop :=
   |SHilbert_K: forall p q : prop, Stheorem ((SProp p) =s=> (SProp q) =s=> (SProp p))
   |SHilbert_S: forall p q r : prop, Stheorem (((SProp p)=s=>(SProp q)=s=>(SProp r))=s=>((SProp p)=s=>(SProp q))=s=>((SProp p)=s=>(SProp r)))
   |SClassic_NOTNOT : forall p : prop, Stheorem ((\ (\ (SProp p))) =s=> (SProp p))
   |SMP : forall p q : prop, Stheorem ((SProp p) =s=> (SProp q)) -> Stheorem (SProp p) -> Stheorem (SProp q)
   |SK_Nec : forall (a : DASL.Agents) (p : prop), Stheorem (SProp p) -> Stheorem (SK a (SProp p))
   |SK_K : forall (a : DASL.Agents) (p q : prop), Stheorem (SK a (SProp p) =s=> SK a ((SProp p) =s=> (SProp q)) =s=> SK a (SProp q))
   |SK_T : forall (a : DASL.Agents) (p : prop), Stheorem (SK a (SProp p) =s=> (SProp p))
   |SB_K : forall (a : DASL.Agents) (p q : prop), Stheorem (SB a (SProp p) =s=> SB a ((SProp p) =s=> (SProp q)) =s=> SB a (SProp q))
   |SB_Serial : forall (a : DASL.Agents) (p : prop), Stheorem (SB a (SProp p) =s=> \ (SB a (\ (SProp p))))
   |SB_5 : forall (a : DASL.Agents) (p : prop), Stheorem (\ (SB a (SProp p)) =s=> SB a (\ (SB a (SProp p))))
   |SK_B : forall (a : DASL.Agents) (p : prop), Stheorem (SK a (SProp p) =s=> SB a (SProp p))
   |SB_BK : forall (a : DASL.Agents) (p : prop), Stheorem (SB a (SProp p) =s=> SB a (SK a (SProp p))).

Notation "|s-" := Stheorem (at level 80).
Check Build_frame.
Check frame.


Definition DASL_Axioms (p q r : prop) (a : DASL.Agents) := 
(SK a (SProp p) =s=> SK a ((SProp p) =s=> (SProp q)) =s=> SK a (SProp q))
:: (SK a (SProp p) =s=> (SProp p))
:: (SB a (SProp p) =s=> SB a ((SProp p) =s=> (SProp q)) =s=> SB a (SProp q))
:: (SB a (SProp p) =s=> \ (SB a (\ (SProp p))))
:: (\ (SB a (\ (SB a (SProp p)))) =s=> SB a (SProp p))
:: (SK a (SProp p) =s=> SB a (SProp p))
:: (SB a (SProp p) =s=> SB a (SK a (SProp p)))
:: nil.


Fixpoint Complete_via_Sahlqvist (l : list schema) : Prop :=  
  match l with
  | nil => True
  | (l' :: els) => sahlqvist_formula (l') /\ Complete_via_Sahlqvist (els)
  end.


Axiom sahlqvist_is_canonical : forall (phi : schema) (F1 F2 : frame),
  sahlqvist_formula phi ->
    (F1 ||= (schema_to_prop phi) <->
    |-- (schema_to_prop phi)) /\ 
    (F2 ||= (schema_to_prop phi) <-> F2 = F1).


Ltac sahlqvist_complete_list :=
  match goal with [ |- ?P1 (?P2 _ _ _ _) ] => unfold P2; repeat (constructor; auto; sahlqvist_reduce) end.

Theorem DASL_Axioms_Complete : forall (p q r : prop) (a : DASL.Agents),
  Complete_via_Sahlqvist (DASL_Axioms p q r a).
Proof.
intros; sahlqvist_complete_list.
Qed.

Lemma schema_to_prop_completeness : forall (phi : schema),
  |s- phi ->
  |-- schema_to_prop phi.
Proof.
intros.
induction H; simpl; try constructor.
simpl in IHStheorem1.
simpl in IHStheorem2. pose proof MP p q IHStheorem1; auto.
simpl in IHStheorem; auto.
Qed.

Lemma prop_to_schema_completeness : forall (phi : schema),
  |-- schema_to_prop phi ->
  |s- phi.
Proof.
intros. induction phi. simpl in H. induction H. Focus 7. simpl. induction p; simpl. Abort.

Theorem weak_evidential_restraint_not_sahlqvist:  forall (phi : prop) (a : DASL.Agents),
   (sahlqvist_formula (SB a (SProp phi) =s=> (\ (SK a (\ (SK a (SProp phi))))))).
Proof.
  intros; sahlqvist_reduce. 
Qed.

Definition KDiamond (phi : schema) (a : DASL.Agents) :=
  SNeg (SK a (SNeg phi)).
Hint Resolve KDiamond.
Notation "<K>" := KDiamond.

Fixpoint standard_translation (p : schema) (M : model) (x : W (F M)) {struct p} : Prop :=
  match p with
  | SProp p' => satisfies M x p'
  | SAnd p1 p2 => (standard_translation p1 M x) /\ (standard_translation p2 M x)
  | SOr p1 p2 =>  (standard_translation p1 M x) \/ (standard_translation p2 M x)
  | SImp p1 p2 => ~(standard_translation p1 M x) \/ (standard_translation p2 M x)
  | SNeg p' => ~(standard_translation p' M x)  
  | SK a p' => forall (y : W (F M)), (Rk (F M) a x y) -> (standard_translation p' M y)
  | SB a p' => forall (y : W (F M)), (Rb (F M) a x y) -> (standard_translation p' M y)
  end.

Example T_Refl : forall (phi : prop) (M : model) (x : W (F M)) (a : DASL.Agents),
  standard_translation ((SK a (SProp phi)) =s=> (SProp phi)) M x
= ~(forall (y : W (F M)), (Rk (F M) a x y) -> satisfies M y phi)
   \/ (satisfies M x phi).
Proof.
intros. simpl. reflexivity.
Qed.

Example T_Refl' : forall (phi : prop) (M : model) (x : W (F M)) (a : DASL.Agents),
  standard_translation ((SK a (SProp phi)) =s=> (SProp phi)) M x
= reflexive_Rk_frame (F M).
Proof.
intros. simpl. unfold reflexive_Rk_frame.
unfold not. unfold satisfies.
intuition. 
              

(* 
Definition serial_Rb_frame (F : frame) : Prop := 
  forall (w : (W F)) (ags : DASL.Agents), 
    exists (y : (W F)), (Rb F ags w y).

Inductive prop : Type :=
   | atm : Atoms -> prop
   | imp : prop -> prop -> prop
   | negp : prop -> prop
   | falsum : prop
   | K : Agents -> prop -> prop
   | B : Agents -> prop -> prop.
Schema
  | SProp : prop -> schema
  | SAnd : schema -> schema -> schema
  | SOr : schema -> schema -> schema
  | SImp : schema -> schema -> schema
  | SNeg : schema -> schema
  | SK : DASL.Agents -> schema -> schema
  | SB : DASL.Agents -> schema -> schema.
*)


Theorem DASL_Completeness : forall (phi : schema) (F : frame) (val: (W F) -> Atoms -> Prop) (a : DASL.Agents),
  DASL_Frame F ->  
  F ||= (schema_to_prop phi) ->
  |-- (schema_to_prop phi).
Proof.
Abort.