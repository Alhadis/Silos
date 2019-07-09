Require Import List.


Inductive Agents: Type := Pilot | CoPilot | AutoPilot.
Check Agents.

(* Definition G := Pilot :: CoPilot :: AutoPilot :: nil.
*)
Inductive Inputs : Type := HardThrustPlus | ThrustPlus | HardNoseUp | NoseUp | HardWingLeft | WingLeft| HardThrustMinus | ThrustMinus
                         | HardNoseDown | NoseDown | HardWingRight | WingRight.
Check Inputs.

Inductive Side : Type := Left | Middle | Right .
Check Side.

Inductive Readings (s : Side) : Type := VertUp1 | VertUp2 | VertUp3 | VertUp4 | VertDown1 | VertDown2 | VertDown3 | VertDown4 | VertLevel
                          | HorLeft1 | HorLeft2 | HorLeft3 | HorRight1 | HorRight2 | HorRight3 | HorLevel
                          | AirspeedFast1 | AirspeedFast2 | AirspeedFast3 | AirspeedSlow1 | AirspeedSlow2 | AirspeedSlow3 | AirspeedCruise
                          | AltCruise | AltClimb | AltDesc | AltLand.
Check Readings.

Inductive Mode : Type := Normal | Alternate1 | Alternate2.
Check Mode.

Inductive GlobalReadings : Type := Global (m: Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right).
Check GlobalReadings. 

Inductive Atoms : Type := 
          | M (m : Mode)
          | Input (a : Inputs) 
          | InstrumentL (r : Readings Left) 
          | InstrumentM (r : Readings Middle) 
          | InstrumentR (r : Readings Right)
          | InstrumentsG (g : GlobalReadings).
Check Atoms.


Inductive prop : Type :=
   | atm : Atoms -> prop
   | imp : prop -> prop -> prop
   | negp : prop -> prop
   | falsum : prop
   | K : Agents -> prop -> prop
   | B : Agents -> prop -> prop.
 (*   | Ck : list Agents -> prop -> prop
   | Cb : list Agents -> prop -> prop. *)
Check prop.



Infix "==>" := imp (right associativity, at level 85).
Notation "! p" := (negp p) (at level 70, right associativity).
Notation "_|_" := (falsum).


Check prop.

(* Definition Exist A (P : A -> prop) :=  *)
(* \-/ (fun p => \-/ (fun a : A => P a ==> p) ==> p). *)

Definition FALSE := _|_.

Definition TRUE := ! _|_.

Definition NOT (p : prop) := ! p.

Definition OR (p q : prop) := imp (NOT p) q.

Definition AND (p q : prop) := ! (OR (! p) q).

Infix "&" := AND (left associativity, at level 50).
Infix "V" := OR (left associativity, at level 50).

Definition EQUIV (p q : prop) :=  ((p==>q)&(q==>p)).
Infix "<=>" := EQUIV (left associativity, at level 90).

Fixpoint Ek (G : list Agents) (p : prop) {struct G} : prop :=
 match G with
   |nil => TRUE
   |i :: G' => K i p & Ek G' p
   end.

Fixpoint Eb (G : list Agents) (p : prop) {struct G} : prop :=
 match G with
   |nil => TRUE
   |i :: G' => B i p & Eb G' p
   end.

Inductive theorem : prop -> Prop :=
   |Hilbert_K: forall p q : prop, theorem (p ==> q ==> p)
   |Hilbert_S: forall p q r : prop, theorem ((p==>q==>r)==>(p==>q)==>(p==>r))
   |Classic_NOTNOT : forall p : prop, theorem ((NOT (NOT p)) ==> p)
   |MP : forall p q : prop, theorem (p ==> q) -> theorem p -> theorem q
   |K_Nec : forall (a : Agents) (p : prop), theorem p -> theorem (K a p)
   |K_K : forall (a : Agents) (p q : prop), theorem (K a p ==> K a (p ==> q) ==> K a q)
   |K_T : forall (a : Agents) (p : prop), theorem (K a p ==> p)
   |B_K : forall (a : Agents) (p q : prop), theorem (B a p ==> B a (p ==> q) ==> B a q)
   |B_Serial : forall (a : Agents) (p : prop), theorem (B a p ==> NOT (B a (NOT p)))
   |B_5 : forall (a : Agents) (p : prop), theorem (NOT (B a p) ==> B a (NOT (B a p)))
   |K_B : forall (a : Agents) (p : prop), theorem (K a p ==> B a p)
   |B_BK : forall (a : Agents) (p : prop), theorem (B a p ==> B a (K a p)).

Notation "|-- p" := (theorem p) (at level 80).
Theorem B_Nec : forall (a : Agents) (p : prop), theorem p -> theorem (B a p).
Proof.
intros a p. intro H0. pose proof K_B. eapply MP. apply (H a p). apply K_Nec. assumption. Qed. 


Axiom double_negation_NN : forall p,
       |-- (NOT (NOT p)) -> |-- p.


Axiom double_negation : forall p,
       |-- p -> |-- NOT (NOT p).

Axiom double_negation_IMP: forall p,
|-- (p ==> NOT (NOT p)).

Axiom double_negation_IMP_NN : forall p,
|-- (NOT (NOT p) ==> p).

Axiom conjcomm_IMP : forall p q,
|-- ((p & q) ==> (q & p)).

Axiom simplifyL : forall p1 p2,
       |-- p1 & p2 -> |-- p1.

Axiom simplifyR : forall p1 p2,
       |-- p1 & p2 -> |-- p2.

Axiom conjunction : forall p1 p2,
       |-- p1 -> |-- p2 -> |-- p1 & p2.

Axiom imp_drop : forall p q r,
       |-- (p ==> q ==> r) ->
       |-- q ->
       |-- (p==>r).

Axiom not_and : forall p1 p2,
  |-- (NOT p1) V (NOT p2) <-> |-- NOT (p1 & p2).

Axiom addition_left: forall p1 p2,
|-- p1 -> |-- p1 V p2.

Axiom addition_right: forall p1 p2,
|--p2 -> |-- p1 V p2.

Axiom hyposyll : forall p1 p2 p3,
|-- (p1 ==> p2) -> 
|-- (p2 ==> p3) ->
|-- (p1 ==> p3).

Axiom conjcomm : forall p1 p2,
     |-- p1 & p2 <-> |-- p2&p1.

Axiom MT : forall p1 p2,
      |-- (p1 ==> p2) ->
      |-- NOT p2 ->
      |-- NOT p1.

Axiom contrapose : forall p1 p2,
      |-- (p1 ==> p2) <->
      |-- ((NOT p2) ==> (NOT p1)).

Axiom uncurry : forall p1 p2 p3,
     |-- (p1 ==> p2 ==> p3) ->
     |-- ((p1 & p2) ==> p3).

Axiom curry : forall p1 p2 p3,
     |-- ((p1&p2)==>p3) ->
     |-- (p1 ==> p2 ==> p3).

Axiom imp_conjcomm : forall p1 p2 p3,
    |-- (p1 ==> (p2 & p3)) ->
    |-- (p1 ==> (p3 & p2)).

Axiom distribution : forall p1 p2 p3 p4,
    |-- ((p1==>p2)&(p3==>p4)) <->
    |-- ((p1&p3)==>(p2&p4)).

Theorem antecedent_conj_comm : forall p1 p2 p3,
    |-- ((p1 & p2) ==> p3) ->
    |-- ((p2 & p1) ==> p3).
Proof.
intros. Abort.


Theorem B_K_imp : forall (a : Agents) (p : prop) (q : prop),
       |-- B a (p ==> q) ->
       |-- (B a p ==> B a q).
Proof.
intros. 
pose proof B_K a p q. 
pose proof imp_drop (B a p) (B a (p ==> q)) (B a q). 
apply H1 in H0.
assumption. assumption.
Qed.

Theorem B_4 : forall (a : Agents) (p : prop), theorem (B a p ==> B a (B a p)).
Proof.
intros.
pose proof B_BK a p.
pose proof B_K_imp a (K a p) (B a p).
pose proof K_B a p.
pose proof B_Nec a (K a p ==> B a p) H1; clear H1. apply H0 in H2; clear H0.
eapply hyposyll. eassumption. assumption.
Qed.

Axiom global_atms : forall (m: Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right),
             |-- (atm (InstrumentsG (Global m rl rm rr)) <=> atm (M m) & atm (InstrumentL rl) & atm (InstrumentM rm) & atm (InstrumentR rr)).

Inductive PI : Set := Pri | Pub | Grp (As : list Agents).

Record Action : Set := act {Ai : Agents; Aj : Agents; pi : PI; input : Inputs; c : GlobalReadings; c_s : GlobalReadings}.

Parameter ex_act : Action -> prop.

Parameter aft_ex_act : Action -> prop -> prop.

(*Record SafeAction : Set := act_s {Ai_s : Agents; Aj_s : Agents; pi_s : PI; input_s : Inputs; c_s : GlobalReadings}.*)

Parameter ex_act_s : Action -> prop.

Parameter aft_ex_act_s : Action -> prop -> prop.

Function pre (a:Action) : prop := atm (InstrumentsG (c a)).

Function pre_s (a : Action) : prop := atm (InstrumentsG (c_s a)).

Axiom safe_act_pre_CP : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (m: Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right)
                                                                        (ms : Mode) (rls : Readings Left) (rms : Readings Middle) (rrs : Readings Right) phi,
        |-- (NOT (aft_ex_act_s (act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi)) ==> atm (InstrumentsG (Global ms rls rms rrs))).

Lemma safe_act_pre : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (m: Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right) (ms: Mode) (rls : Readings Left) (rms : Readings Middle) (rrs : Readings Right) phi,
        |-- (NOT (aft_ex_act_s (act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi))) ->
        |-- (atm (InstrumentsG (Global ms rls rms rrs))).
Proof. intros.  pose proof safe_act_pre_CP A Ao pi0 inp m rl rm rr ms rls rms rrs phi. econstructor. eassumption. eassumption.
Qed.


Lemma pre_equals_pre : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (m : Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right) (ms : Mode) (rls : Readings Left) (rms : Readings Middle) (rrs : Readings Right),
      |-- pre(act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) ->
      |-- atm (InstrumentsG (Global m rl rm rr)).
Proof.
    intros. 
    apply H.
Qed.

Lemma K_Dist : forall (A : Agents) (p q : prop),
     |-- K A (p ==> q) ->
     |-- (K A p) -> 
     |-- (K A q).
Proof.
   intros.
   pose proof K_K A p q.
   pose proof MP (K A p) (K A (p ==> q) ==> K A q) H1 H0.
   pose proof MP (K A (p ==> q))(K A q) H2 H; assumption.
Qed.

Lemma B_Dist : forall (A : Agents) (p q : prop),
     |-- B A (p ==> q) ->
     |-- (B A p) -> 
     |-- (B A q).
Proof.
   intros.
   pose proof B_K A p q.
   pose proof MP (B A p) (B A (p ==> q) ==> B A q) H1 H0.
   pose proof MP (B A (p ==> q))(B A q) H2 H; assumption.
Qed.

Axiom BPS : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (m: Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right) (ms: Mode) (rls : Readings Left) (rms : Readings Middle) (rrs : Readings Right) phi,
        |-- (NOT (aft_ex_act (act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi)) ==>
           B A (NOT (aft_ex_act_s (act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi)))).

(*Axiom BPS : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right),
        |-- ex_act (act A Ao pi inp (Global rl rm rr)) -> 
        |-- B A (ex_act_s (act_s A Ao pi inp (Global rl rm rr))). *)

Axiom action_condition_true : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (m : Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right) (ms : Mode) (rls : Readings Left) (rms : Readings Middle) (rrs : Readings Right) phi,
        |-- (NOT (aft_ex_act (act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi)) ==> atm (InstrumentsG (Global m rl rm rr))).

Axiom atoms_consistent : forall (a1 a2:Atoms),
     not(a1=a2) ->
      |--((atm a1) <=> (NOT (atm a2))).
     

(*
Theorem BPS_left : forall A Ao pi inp (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right),
        |-- (ex_act (act A Ao pi inp (Global rl rm rr)) ==> B A (atm (InstrumentL rl))).
Proof.
   intros. pose proof BPS A Ao pi0 inp rl rm rr phi.
   pose proof action_condition_true A Ao pi0 inp rl rm rr 
 apply action_condition_true in H. apply global_atms in H. constructor. apply simplifyL in H. apply simplifyL in H. assumption.
Qed.
*)

Ltac Htrans := match goal with
             | [H: |-- (?p ==> ?q), H0: |-- (?q ==> ?r) |- _] => assert (|-- (p ==> r)); try (eapply hyposyll; eassumption); clear H H0 end.

Example EHtrans : forall p q r, |-- (p ==> q) -> |-- (q ==> r) -> |-- (p ==> r).
Proof. intros. Htrans. assumption.
Qed.


Ltac Hcontrapose H := match goal with
             | [H: |-- (?p ==> ?q) |- _] => apply (contrapose p q) in H  end.

Example EHcontrapose : forall p q,
             |-- (p ==> q) -> |-- ((NOT q) ==> (NOT p)).
Proof. intros. Hcontrapose H. assumption.
Qed.

Ltac Hconj H1 H2 := match goal with
                    |[H1: |-- ?p, H2: |-- ?q |-_]=> (assert (|--(p&q)); try (eapply conjunction); try assumption) end.

Example EHconj : forall p q,
      |-- p -> |-- q -> |-- p&q.
Proof. intros. Hconj H H0. Qed.

Ltac Hcurry H := match goal with
                |[H:|--(?p==>?q==>?r)|-_]=> (assert (|--(p&q ==> r)); try (eapply uncurry); try eassumption) end.

Example EHcurry : forall p q r,
      |-- (p ==> q ==> r) ->
      |-- (p&q ==>r).
Proof. intros. Hcurry H. Qed.

Ltac Hdistribution := match goal with
     |[H:|--((?p==>?q)&(?r==>?s))|-_]=> (assert (|--(p&r ==> q&s));  [eapply distribution|]; try assumption) end.

Example EHdist : forall p q r s,
     |-- ((p==>q)&(r==>s)) ->
     |-- ((p&r)==>(q&s)).
Proof. intros. Hdistribution. Qed. 

Ltac Himpdrop := match goal with
                 |[H: |-- (?p==>?q==>?r), H2: |--?q|-_]=> (assert(|--(p==>r)); [eapply imp_drop|]; try eassumption) end.

Example EHimpdrop : forall p q r,
      |-- (p==>q==>r) -> |-- q -> |--(p==>r).
Proof. intros. Himpdrop. Qed.

Theorem neg_intro_failure : forall (A Ao : Agents) (pi : PI) (inp : Inputs) (m : Mode) (rl : Readings Left) (rm : Readings Middle) (rr : Readings Right) (ms : Mode) (rls : Readings Left) (rms : Readings Middle) (rrs : Readings Right) phi,
        |--  (NOT (aft_ex_act (act A Ao pi inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi)) ==>
            NOT (atm (InstrumentsG (Global ms rls rms rrs))) ==>
        (NOT (K A (atm (InstrumentsG (Global ms rls rms rrs)))) & (NOT (K A (NOT (K A (atm (InstrumentsG (Global ms rls rms rrs))))))))).
Proof.
   intros. pose proof BPS A Ao pi0 inp m rl rm rr ms rls rms rrs phi.
   pose proof B_K A (NOT (aft_ex_act_s (act A Ao pi0 inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi))) (atm (InstrumentsG (Global ms rls rms rrs))). Htrans.
   pose proof safe_act_pre_CP A Ao pi0 inp m rl rm rr ms rls rms rrs phi.
   pose proof B_Nec A ( (NOT (aft_ex_act_s (act A Ao pi0 inp (Global m rl rm rr) (Global ms rls rms rrs)) (NOT phi)) ==> atm (InstrumentsG (Global ms rls rms rrs)))) H. clear H.
   Himpdrop.  clear H0.
   pose proof B_BK A (atm (InstrumentsG (Global ms rls rms rrs))). Htrans.
   pose proof B_Serial A (K A (atm (InstrumentsG (Global ms rls rms rrs)))). Htrans.
   pose proof K_B A (NOT (K A (atm (InstrumentsG (Global ms rls rms rrs))))). Hcontrapose H. Htrans.
   pose proof K_T A (atm (InstrumentsG (Global ms rls rms rrs))). Hcontrapose H. Hconj H2 H. clear H2 H.
   eapply curry.  Hdistribution.  eapply imp_conjcomm. assumption.
Qed.

Definition Config_1 :=  (atm (M Alternate2)) & (atm (InstrumentL (AirspeedSlow3 Left))) & 
                         (atm (InstrumentM (AirspeedSlow3 Middle))) & 
                         (atm (InstrumentR (AirspeedCruise Right))).

Definition Input1 := act Pilot Pilot Pri HardNoseUp 
                          (Global Alternate2 (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedCruise Right))
                           (Global Normal (AirspeedCruise Left) (AirspeedCruise Middle) (AirspeedCruise Right)).

Definition Act_1 :=  NOT (aft_ex_act Input1 (NOT TRUE)).
                 
Theorem NegIntroFailMode : |-- (Config_1 ==> Act_1 ==>((NOT (K Pilot (pre_s(Input1))))
                                  & (NOT (K Pilot (NOT (K Pilot (pre_s(Input1)))))))).
Proof. unfold Act_1. unfold Config_1. unfold pre_s. unfold Input1. simpl. fold Input1.
assert (|-- (Config_1 ==> NOT (pre_s(Input1)))).
unfold Config_1. unfold Input1. unfold pre_s. simpl. pose proof atoms_consistent (InstrumentsG (Global Alternate2 (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedCruise Right)))
                                                                                  (InstrumentsG (Global Normal (AirspeedCruise Left) (AirspeedCruise Middle) (AirspeedCruise Right))) .
match goal with [H: ?p -> |--?q|-_]=>assert(p)end. unfold not. intros. inversion H0. pose proof H H0. clear H H0.
unfold EQUIV in H1. eapply simplifyL in H1. pose proof global_atms Alternate2 (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedCruise Right). unfold EQUIV in H. eapply simplifyR in H. Htrans. assumption.
unfold Config_1 in H. unfold Input1 in H. unfold pre_s in H. simpl in H.
 eapply hyposyll. eassumption. eapply curry. match goal with [|-|--((?p&?q)==>?r)]=>assert(|--((p&q)==>(q&p))) end. eapply conjcomm_IMP. eapply hyposyll. eassumption. eapply uncurry. eapply neg_intro_failure.
Qed.

Definition Config_2 := (atm (M Normal))
                       & (atm (InstrumentL (HorLeft2 Left))) 
                       & (atm (InstrumentM (HorLevel Middle)))
                       & (atm (InstrumentR (HorLevel Right))).

Definition Input2 := act Pilot Pilot Pri HardWingRight
                      (Global Normal (HorLeft2 Left) (HorLevel Middle) (HorLevel Right))
                      (Global Normal (HorLeft2 Left) (HorLeft2 Middle) (HorLeft2 Right)).

Definition Act_2 := NOT (aft_ex_act Input2 (NOT TRUE)).

Theorem NegIntroFailHorLevel : |-- (Config_2 ==> Act_2 ==>((NOT (K Pilot (pre_s(Input2))))
                                   & (NOT (K Pilot (NOT (K Pilot (pre_s(Input2)))))))).
Proof. unfold Act_2. unfold Config_2. unfold pre_s. unfold Input2. simpl. fold Input2.
assert (|-- (Config_2 ==> NOT (pre_s(Input2)))).
unfold Config_2. unfold Input2. unfold pre_s. simpl. pose proof atoms_consistent (InstrumentsG (Global Normal (HorLeft2 Left) (HorLevel Middle) (HorLevel Right)))
                                                                                  (InstrumentsG (Global Normal (HorLeft2 Left) (HorLeft2 Middle) (HorLeft2 Right))).
match goal with [H: ?p -> |--?q|-_]=>assert(p)end. unfold not. intros. inversion H0. pose proof H H0. clear H H0.
unfold EQUIV in H1. eapply simplifyL in H1. pose proof global_atms Normal (HorLeft2 Left) (HorLevel Middle) (HorLevel Right). unfold EQUIV in H. eapply simplifyR in H. Htrans. assumption.
unfold Config_2 in H. unfold Input1 in H. unfold pre_s in H. simpl in H.
 eapply hyposyll. eassumption. eapply curry. match goal with [|-|--((?p&?q)==>?r)]=>assert(|--((p&q)==>(q&p))) end. eapply conjcomm_IMP. eapply hyposyll. eassumption. eapply uncurry. eapply neg_intro_failure.
Qed.

Definition Config_3 := (atm (M Alternate1))
                       & (atm (InstrumentL (AirspeedSlow3 Left)))
                       & (atm (InstrumentM (AirspeedSlow3 Middle)))
                       & (atm (InstrumentR (AirspeedSlow3 Right))).

Definition Input3 := act Pilot Pilot Pri HardThrustMinus
                     (Global Alternate1 (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedSlow3 Right))
                     (Global Normal (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedSlow3 Right)).

Definition Act_3 := NOT (aft_ex_act Input3 (NOT TRUE)).

Theorem NegIntroFailATOff : |-- (Config_3 ==> Act_3 ==>((NOT (K Pilot (pre_s(Input3))))
                                   & (NOT (K Pilot (NOT (K Pilot (pre_s(Input3)))))))).
Proof. unfold Act_3. unfold Config_3. unfold pre_s. unfold Input3. simpl. fold Input3.
assert (|-- (Config_3 ==> NOT (pre_s(Input3)))).
unfold Config_3. unfold Input3. unfold pre_s. simpl. 
pose proof atoms_consistent (InstrumentsG (Global Alternate1 (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedSlow3 Right)))
                            (InstrumentsG (Global Normal (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedSlow3 Right))).
match goal with [H: ?p -> |--?q|-_]=>assert(p)end. unfold not. intros. inversion H0. pose proof H H0. clear H H0.
unfold EQUIV in H1. eapply simplifyL in H1. pose proof global_atms Alternate1 (AirspeedSlow3 Left) (AirspeedSlow3 Middle) (AirspeedSlow3 Right). 
unfold EQUIV in H. eapply simplifyR in H. Htrans. assumption.
unfold Config_3 in H. unfold Input3 in H. unfold pre_s in H. simpl in H.
 eapply hyposyll. eassumption. eapply curry. match goal with [|-|--((?p&?q)==>?r)]=>assert(|--((p&q)==>(q&p))) end. eapply conjcomm_IMP. eapply hyposyll. eassumption. eapply uncurry. eapply neg_intro_failure.
Qed.

