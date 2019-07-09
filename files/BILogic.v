Require Import Setoid Morphisms RelationClasses Program.Basics. 
Require Import ILogic ILTac ILInsts.
Require Import Equiv SepAlg.

Set Implicit Arguments.
Unset Strict Implicit.

Section BILogic.
  Context {A : Type}.
  Context `{IL: ILogic A}.

  Class BILOperators (A : Type) := {
    empSP : A;
    sepSP : A -> A -> A;
    wandSP : A -> A -> A
  }.

  Class BILogic {BILOp: BILOperators A} := {
    bilil :> ILogic A;
    sepSPC1 P Q : sepSP P Q |-- sepSP Q P;
    sepSPA1 P Q R : sepSP (sepSP P Q) R |-- sepSP P (sepSP Q R);
    wandSepSPAdj P Q R : sepSP P Q |-- R <-> P |-- wandSP Q R;
    bilsep P Q R : P |-- Q -> sepSP P R |-- sepSP Q R;
    empSPR P : sepSP P empSP -|- P
  }.

End BILogic.

Implicit Arguments BILogic [[BILOp] [ILOps]].

Notation "a '**' b"  := (sepSP a b)
  (at level 75, right associativity).
Notation "a '-*' b"  := (wandSP a b)
  (at level 77, right associativity).

Section CoreInferenceRules.

  Context {A} `{BILogic A}.

  Lemma wandSPAdj P Q C (HSep: C ** P |-- Q) : C |-- P -* Q.
  Proof.
    apply wandSepSPAdj; assumption.
  Qed.

  Lemma wandSPAdj' P Q C (HSep: P ** C |-- Q) : C |-- P -* Q.
  Proof.
    apply wandSepSPAdj. etransitivity; [apply sepSPC1|]. assumption.
  Qed.

  Lemma sepSPAdj P Q C (HWand: C |-- P -* Q) : C ** P |-- Q.
  Proof.
    apply wandSepSPAdj; assumption.
  Qed.

  Lemma sepSPAdj' P Q C (HWand: C |-- P -* Q) : P ** C |-- Q.
  Proof.
    etransitivity; [apply sepSPC1|]. apply wandSepSPAdj. assumption.
  Qed.

  Lemma sepSPC (P Q : A) : P ** Q -|- Q ** P.
  Proof.
    split; apply sepSPC1.
  Qed.

  Lemma sepSPA2 (P Q R : A) : P ** (Q ** R) |-- (P ** Q) ** R.
  Proof.
    rewrite sepSPC.
    etransitivity; [apply sepSPA1|].
    rewrite sepSPC.
    etransitivity; [apply sepSPA1|].
    rewrite sepSPC.
    reflexivity.
  Qed.

  Lemma sepSPA (P Q R : A) : (P ** Q) ** R -|- P ** (Q ** R).
  Proof.
    split; [apply sepSPA1 | apply sepSPA2].
  Qed.
    
  Lemma wandSPI (P Q R : A) (HQ : P ** Q |-- R) : (P |-- Q -* R).
  Proof.
    apply wandSPAdj; assumption.
  Qed.

  Lemma wandSPE (P Q R T : A) (HQR: Q |-- T -* R) (HP : P |-- Q ** T) : P |-- R.
  Proof.
    apply sepSPAdj in HQR.
    rewrite <- HQR, HP. reflexivity.
  Qed.

  Lemma empSPL P : empSP ** P -|- P.
  Proof.
    rewrite sepSPC; apply empSPR.
  Qed.

  Lemma bilexistsscL {T} (P : A) (Q : T -> A):
    Exists x : T, P ** Q x |-- P ** Exists x : T, Q x.
  Proof.
    apply lexistsL; intros x.
    rewrite sepSPC. etransitivity; [|rewrite <- sepSPC; reflexivity].
    apply bilsep. eapply lexistsR; reflexivity.
  Qed.

  Lemma bilexistsscR {T} (P : A) (Q : T -> A) :
    P ** (Exists x : T, Q x) |-- Exists x : T, P ** Q x.
  Proof.
    rewrite sepSPC; rewrite wandSepSPAdj.
    apply lexistsL; intros x; rewrite <- wandSPAdj. reflexivity.
    eapply lexistsR; rewrite sepSPC; reflexivity.
  Qed.

  Lemma bilexistssc {T} (P : A) (Q : T -> A) :
    Exists x : T, P ** Q x -|- P ** Exists x : T, Q x.
  Proof.
    split; [apply bilexistsscL | apply bilexistsscR].
  Qed.

  Lemma bilforallscR {T} (P : A) (Q : T -> A) :
    P ** (Forall x : T, Q x) |-- Forall x : T, P ** Q x.
  Proof.
    lforallR; intro x.
    rewrite sepSPC; etransitivity; [|rewrite <- sepSPC; reflexivity].
    apply bilsep. lforallL x; reflexivity.
  Qed.

End CoreInferenceRules.

Section BILogicMorphisms.
  Context {A : Type} `{BIL: BILogic A}.

  Global Instance sepSP_lentails_m:
    Proper (lentails ++> lentails ++> lentails) sepSP.
  Proof.
    intros P P' HP Q Q' HQ.
    etransitivity; [apply bilsep; exact HP|].
    rewrite -> sepSPC.
    etransitivity; [apply bilsep; exact HQ|].
    rewrite -> sepSPC. reflexivity.
  Qed.  

  Global Instance sepSP_lequiv_m:
    Proper (lequiv ==> lequiv ==> lequiv) sepSP.
  Proof.
    intros P P' HP Q Q' HQ.
    split; apply sepSP_lentails_m; (apply HP || apply HQ).
  Qed.  

  Global Instance wandSP_lentails_m:
    Proper (lentails --> lentails ++> lentails) wandSP.
  Proof.
    intros P P' HP Q Q' HQ. red in HP.
    apply wandSPAdj. rewrite <- HQ, -> HP.
    apply sepSPAdj. reflexivity.
  Qed.

  Global Instance wandSP_lequiv_m:
    Proper (lequiv ==> lequiv ==> lequiv) wandSP.
  Proof.
    intros P P' HP Q Q' HQ.
    split; apply wandSP_lentails_m; (apply HP || apply HQ).
  Qed.  

End BILogicMorphisms.

Section DerivedInferenceRules.

  Context {A} `{BILogic A}.

  Lemma sepSP_falseR P : P ** lfalse -|- lfalse.
  Proof.
    rewrite lfalse_is_exists, <- bilexistssc.
    split; apply lexistsL; intro x; destruct x.
  Qed.

  Lemma sepSP_falseL P : lfalse ** P -|- lfalse.
  Proof.
    rewrite -> sepSPC; apply sepSP_falseR.
  Qed.

  Lemma scME (P Q R S : A) (HPR: P |-- R) (HQS: Q |-- S) :
    P ** Q |-- R ** S.
  Proof.
    rewrite HPR, HQS; reflexivity.
  Qed.

  Lemma wandSPL P Q CL CR (HP: CL |-- P) (HR: Q |-- CR) :
    (P -* Q) ** CL |-- CR.
  Proof.
    rewrite <-HR, <-HP. apply sepSPAdj. reflexivity.
  Qed.

End DerivedInferenceRules.

Section BISepAlg.
  Context {A} `{sa : SepAlg A}.
  Context {B} `{IL: ILogic B}.

  Open Scope sa_scope.

  Program Definition SABIAtom (a: A) : ILPreFrm equiv B :=
    mkILPreFrm (fun a' => a === a' /\\ ltrue) _.
  Next Obligation.
    lpropandL; intro Ht; lpropandR; [apply ltrueR|].
    rewrite <- H; assumption.
  Qed.

  Instance EquivPreOrder : PreOrder equiv.
  Proof.
    firstorder.
  Qed.

  Program Instance SABIOps: BILOperators (ILPreFrm equiv B) := {
    empSP := ILPreAtom sa_unit;
    sepSP P Q := mkILPreFrm (fun x => Exists x1, Exists x2, sa_mul x1 x2 x /\\
                                                P x1 //\\ Q x2) _;
    wandSP P Q := mkILPreFrm (fun x => Forall x1, Forall x2, sa_mul x x1 x2 ->> 
                                                 P x1 -->> Q x2) _
  }.
  Next Obligation.
    lexistsL; intro x1; lexistsL; intro x2.
    lexistsR x1; lexistsR x2.
    lpropandL; intro Ht.
    lpropandR; [reflexivity |rewrite <- H; assumption].
  Qed.
  Next Obligation.
    lforallR; intro x1; lforallR; intro x2.
    lforallL x1; lforallL x2.
    lpropimplR Ht; lpropimplL; [rewrite H; assumption | reflexivity].
  Qed.

  Local Existing Instance ILPre_Ops.
  Local Existing Instance ILPre_ILogic.
  Local Transparent ILPre_Ops.

  Definition SABILogic : BILogic (ILPreFrm equiv B).
  Proof.
    split.
    + apply _.
    + intros P Q HPre x; simpl.
      lexistsL; intro x1. lexistsL; intro x2.
      lexistsR x2; lexistsR x1.
      lpropandL; intro H1.
      lpropandR; [intuition | apply sa_mulC; assumption].
    + intros P Q R HPre x; simpl.
      lexistsL; intro x1; lexistsL; intro x2; lexistsL; intro x3; lexistsL; intro x4.
      lexistsR x3.
      lpropandL; intro Hx; lpropandL; intro Hx1.
      pose proof @sa_mulA as H.
      specialize (H _ _ _ _ _ _ _ _ _ Hx1 Hx).
      destruct H as [x5 [Hx2 Hx5]].
      lexistsR x5; lpropandR; [|assumption].
      apply landR; [apply landL1; apply landL1; reflexivity|].
      lexistsR x4; lexistsR x2.
      apply sa_mulC in Hx5.
      lpropandR; [|assumption].
      rewrite landA; apply landL2; reflexivity.
    + intros P Q R; split; intros H HPre x; simpl.
      - lforallR; intro x1; lforallR; intro x2.
        apply lpropimplR; intro Hx1.
        apply limplAdj.
        specialize (H HPre x2); simpl in H.
        rewrite <- H.
        lexistsR x; lexistsR x1.
        lpropandR; [reflexivity|assumption].
      - lexistsL; intro x1; lexistsL; intro x2; lpropandL; intro Hx.
        specialize (H HPre x1); simpl in H.
        setoid_rewrite H.
        lforallL x2; lforallL x.
        lpropimplL; [assumption| apply landAdj; reflexivity].
    + intros P Q R H HPre x; simpl.
      lexistsL; intro x1; lexistsL; intro x2.
      lexistsR x1; lexistsR x2; specialize (H HPre x1); setoid_rewrite H.
      reflexivity.
    + intros P; split; intros HPre x; simpl.
      - lexistsL; intro x1; lexistsL; intro x2.
        lpropandL; intro H1; lpropandL; intro H2.
        apply landL1; rewrite <- H2 in H1.
        apply ILPreFrm_closed.
        apply sa_unit_eq. assumption.
      - lexistsR x; lexistsR sa_unit.
        lpropandR; [|apply sa_unitI].
        lpropandR; [apply landR; auto|].
        replace (e sa_unit sa_unit) with (sa_unit === sa_unit) by reflexivity.
        reflexivity.
  Qed.

  Global Instance SABIAtom_Proper: Proper (equiv ==> lequiv) SABIAtom.
  Proof.
    intros a a' Ha. split.
    - simpl. intros HPre a''. rewrite Ha. reflexivity.
    - simpl. intros HPre a''. rewrite Ha. reflexivity.
  Qed.

  Lemma SABIAtom_mul a b c:
    sa_mul a b c -> SABIAtom a ** SABIAtom b -|- SABIAtom c.
  Proof.
    intros Hmul. split.
    - intros HPre c'. simpl. lexistsL; intros a'. lexistsL; intros b'.
      lpropandL; intros Hmul'.
      lpropandL; intros Ha. lpropandL; intros Hb.
      rewrite <-Ha, <-Hb in *.
      lpropandR; auto. eapply sa_mul_eq; eassumption.
    - intros HPre c'. simpl. lpropandL; intros Hc'.
      lexistsR a. lexistsR b. rewrite <-Hc'. lpropandR; [|assumption].
      do 2 (lpropandR; [|reflexivity]). apply landR; auto.
   Qed.

  Lemma SABIAtom_emp: SABIAtom sa_unit -|- empSP.
  Proof. 
    split; intros HPre t; reflexivity.
  Qed.

End BISepAlg.

Global Opaque SABIOps.

Section SABIAtom_exists.
  Local Existing Instance ILPre_Ops.
  Local Existing Instance ILPre_ILogic.
  Local Transparent ILPre_Ops.

  Context {SA : Type} `{H: SepAlg SA}.

  Instance EquivPreOrder2 : PreOrder equiv.
  Proof.
    firstorder.
  Qed.

  Lemma SABIAtom_exists (P: ILPreFrm equiv Prop) :
    Exists a, P a /\\ SABIAtom a -|- P.
  Proof.
    split.
    - lexistsL; intros a. lpropandL; intros HP.
      intros HPre a' [Ha' _]. rewrite Ha' in HP. assumption.
    - intros HPre a HP. exists a. split; [assumption|].
      split; [reflexivity|apply I].
  Qed.
  
End SABIAtom_exists.

Section BILPre.
  Context T (ord: relation T).
  Context {A : Type} `{HBI: BILogic A}.
  Context {HIL : ILogic A}.

  Program Definition BILPre_Ops : BILOperators (ILPreFrm ord A) := {|
    empSP      := mkILPreFrm (fun t => empSP) _;
    sepSP  P Q := mkILPreFrm (fun t => P t ** Q t) _;
    wandSP P Q := mkILPreFrm (fun t => PreOrder ord ->> Forall t', ord t t' ->> P t' -* Q t') _
  |}.
  Next Obligation.
    apply scME; apply ILPreFrm_closed; simpl; assumption.
  Qed.
  Next Obligation.
    lpropimplR HPre; lpropimplL; [assumption|].
    lforallR; intro t''; lpropimplR H1.
    lforallL t''. lpropimplL; [transitivity t'; assumption|].
    reflexivity.
  Qed.

  Local Existing Instance ILPre_Ops.
  Local Existing Instance ILPre_ILogic.
  Local Existing Instance BILPre_Ops.

  Local Transparent ILPre_Ops.

  Definition BILPreLogic : BILogic (ILPreFrm ord A).
  Proof.
    split.
    + apply _.
    + intros P Q HPre x; simpl; apply sepSPC.
    + intros P Q R HPre x; simpl; apply sepSPA.
    + intros P Q R; split; intros H HPre t; simpl.
      * lpropimplR HPre'. lforallR; intro t'; lpropimplR H1.
        transitivity (P t'); [apply ILPreFrm_closed; assumption|].
        apply wandSepSPAdj; apply H. assumption.
      *  apply wandSepSPAdj; specialize (H HPre t); unfold wandSP in H; simpl in H.
         rewrite H. lpropimplL; [assumption|]. lforallL t; lpropimplL; reflexivity.
    + intros P Q R H HPre x; simpl; apply bilsep; apply H. assumption.
    + intros P; split; intros HPre x; simpl; apply empSPR.
  Qed.
End BILPre.

Global Opaque BILPre_Ops.

Section BILogic_Fun.
  Context (T: Type).
  Context {A : Type} `{BIL: BILogic A}.
  Context {HIL : ILogic A}.

  Local Transparent ILFun_Ops.

  Program Definition BILFun_Ops : BILOperators (T -> A) := {|
    empSP         := fun t => empSP;
    sepSP     P Q := fun t => P t ** Q t;
    wandSP    P Q := fun t => P t -* Q t
  |}.
  
  Local Existing Instance ILFun_Ops.
  Local Existing Instance ILFun_ILogic.
  Local Existing Instance BILFun_Ops.

  Program Definition BILFunLogic : BILogic (T -> A). 
  Proof.
    split.
    + apply _.
    + intros P Q x; simpl; apply sepSPC1.
    + intros P Q R x; simpl; apply sepSPA.
    + intros P Q R; split; intros H x; simpl;
      apply wandSepSPAdj; apply H.
    + intros P Q R H x; simpl; apply bilsep; apply H.
    + intros P; split; intros x; simpl; apply empSPR.
  Qed.

End BILogic_Fun.

Global Opaque BILFun_Ops.
