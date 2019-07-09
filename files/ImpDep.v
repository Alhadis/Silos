Require Export SfLib.

Inductive id : Type := 
  Id : nat -> id.

Definition state := id -> nat.

Definition empty_state : state := 
  fun _ => 0.
  
Definition beq_id X1 X2 :=
  match (X1, X2) with
    (Id n1, Id n2) => beq_nat n1 n2
  end.
  
Definition blt_nat (n m : nat) : bool :=
  match ble_nat n m with
  | false => false
  | true => 
      match beq_nat n m with
  	    | true => false
  		| false => true
  	  end
  end.

Theorem beq_id_refl : forall X,
  true = beq_id X X.
Proof.
  intros. destruct X.
  apply beq_nat_refl.  Qed.
 
Definition update (st : state) (X:id) (n : nat) : state :=
  fun X' => if beq_id X X' then n else st X'.

Theorem update_eq : forall n X st,
  (update st X n) X = n.
Proof.
  intros.
  unfold update.
  rewrite <- beq_id_refl.
  reflexivity.
Qed.

Theorem update_neq : forall V2 V1 n st,
  beq_id V2 V1 = false ->
  (update st V2 n) V1 = (st V1).
Proof.
  intros.
  unfold update.
  rewrite H.
  reflexivity.
Qed.

Theorem beq_id_eq : forall i1 i2,
  true = beq_id i1 i2 -> i1 = i2.
Proof.
  intros.
  destruct i1. destruct i2.
  apply beq_nat_eq in H.
  rewrite H. reflexivity.
Qed.

Theorem update_same : forall x1 k1 k2 (f : state),
  f k1 = x1 ->
  (update f k1 x1) k2 = f k2.
Proof.
  intros x1 k1 k2 f H.
  unfold update. subst.
  remember (beq_id k1 k2) as k1k2.
  destruct k1k2.
  	apply beq_id_eq in Heqk1k2.
  	subst. reflexivity.
  	
  	reflexivity.
Qed.

Theorem update_permute : forall x1 x2 k1 k2 k3 f,
  beq_id k2 k1 = false -> 
  (update (update f k2 x1) k1 x2) k3 = (update (update f k1 x2) k2 x1) k3.
Proof.
  intros.
  unfold update.
  remember (beq_id k1 k3) as k1k3.
  destruct k1k3.
  apply beq_id_eq in Heqk1k3.
  subst.
  rewrite H.
  reflexivity.
  remember (beq_id k2 k3) as k2k3.
  destruct k2k3.
  reflexivity.
  reflexivity.
Qed.

Theorem update_shadow : forall x1 x2 k1 k2 (f : state),
   (update (update f k2 x1) k2 x2) k1 = (update f k2 x2) k1.
Proof.
  intros.
  unfold update.
  destruct (beq_id k2 k1); reflexivity.
Qed.

(* aexp *)
Inductive aexp : Type := 
  | ANum : nat -> aexp
  | AId : id -> aexp
  | APlus : aexp -> aexp -> aexp
  | AMinus : aexp -> aexp -> aexp
  | AMult : aexp -> aexp -> aexp.
  
Tactic Notation "aexp_cases" tactic(first) ident(c) :=
  first;
  [ Case_aux c "ANum" | Case_aux c "AId" | Case_aux c "APlus"
  | Case_aux c "AMinus" | Case_aux c "AMult" ].


Fixpoint aeval (st : state) (e : aexp) : nat :=
  match e with
  | ANum n => n
  | AId X => st X
  | APlus a1 a2 => (aeval st a1) + (aeval st a2)
  | AMinus a1 a2  => (aeval st a1) - (aeval st a2)
  | AMult a1 a2 => (aeval st a1) * (aeval st a2)
  end.
(* /aexp *)

(* bexp *)
Inductive bexp : Type := 
  | BTrue : bexp
  | BFalse : bexp
  | BEq : aexp -> aexp -> bexp
  | BLe : aexp -> aexp -> bexp
  | BNot : bexp -> bexp
  | BAnd : bexp -> bexp -> bexp.
  
Tactic Notation "bexp_cases" tactic(first) ident(c) :=
  first;
  [ Case_aux c "BTrue" | Case_aux c "BFalse" | Case_aux c "BEq"
  | Case_aux c "BLe" | Case_aux c "BNot" | Case_aux c "BAnd" ].

Fixpoint beval (st : state) (e : bexp) : bool :=
  match e with 
  | BTrue       => true
  | BFalse      => false
  | BEq a1 a2   => beq_nat (aeval st a1) (aeval st a2)
  | BLe a1 a2   => ble_nat (aeval st a1) (aeval st a2)
  | BNot b1     => negb (beval st b1)
  | BAnd b1 b2  => andb (beval st b1) (beval st b2)
  end.
(* /bexp *)

Lemma or_commut : forall P Q : Prop,
  P \/ Q -> Q \/ P.
Proof.
  intros P Q H.
  inversion H as [HP | HQ].
    Case "left". apply or_intror. apply HP.
    Case "right". apply or_introl. apply HQ.  Qed.