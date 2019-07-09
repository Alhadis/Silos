Definition negb (b : bool) : bool :=
  match b with
  | true => false
  | false => true
  end.

Definition andb (b1 : bool) (b2 : bool) : bool :=
  match b1 with
  | true => b2
  | false => false
  end.

Definition orb (b1 : bool) (b2 : bool) : bool :=
  match b1 with
  | true => true
  | false => b2
  end.

Check true.

Example test_orb1: (orb true false) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb2: (orb false false) = false.
Proof. simpl. reflexivity. Qed.
Example test_orb3: (orb false true) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb4: (orb true true) = true.
Proof. simpl. reflexivity. Qed.

Notation "x && y" := (andb x y).
Notation "x || y" := (orb x y).
Notation "~ x" := (negb x) (at level 75, right associativity).

Example test_orb5: false || false || true = true.
Proof. simpl. reflexivity. Qed.

Definition nandb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => ~ b2
  | false => true
  end.


Example test_nandb1: (nandb true false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb2: (nandb false false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb3: (nandb false true) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb4: (nandb true true) = false.
Proof. simpl. reflexivity. Qed.

Check negb.

Inductive rgb : Type :=
| red
| green
| blue.

Inductive color : Type :=
| black
| white
| primary (p : rgb).

Inductive megacolor : Type :=
| non_visible
| visible (v: color).

Definition monochrome (c : color) : bool :=
  match c with
  | black => true
  | white => true
  | primary q => false
  end.

Definition isred (c : megacolor) : bool :=
  match c with
  | visible (primary red) => true
  | _ => false
  end.

Check visible (primary red).

Compute isred(visible (primary blue)).

Inductive bit : Type :=
| B0
| B1.

Inductive nybble : Type :=
| bits (b0 b1 b2 b3 : bit).

Check (bits B1 B0 B1 B0).

Definition all_zero (nb : nybble) : bool :=
  match nb with
  | (bits B0 B0 B0 B0) => true
  | (bits _ _ _ _) => false
  end.

Compute (all_zero (bits B1 B0 B1 B0)).

Compute (all_zero (bits B0 B0 B0 B0)).

Module NatPlayground.

  Inductive nat : Type :=
  | O
  | S (n : nat).

  Definition pred (n : nat) : nat :=
    match n with
    | O => O
    | S n' => n'
    end.

  Compute (pred (S (S O))).

End NatPlayground.

Check (S (S (S (S O)))).


Definition minustwo (n : nat) : nat :=
  match n with
  | O => O
  | S O => O
  | S (S n') => n'
  end.

Compute (minustwo 1).

Check S.
Check pred.
Check minustwo.

Fixpoint evenb (n : nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n') => evenb n'
  end.

Check evenb.

Definition oddb (n : nat) : bool := negb (evenb n).


Example test_oddb1: oddb 1 = true.
Proof. simpl. reflexivity. Qed.

Example test_oddb2: oddb 4 = false.
Proof. simpl. reflexivity. Qed.


Module NatPlayground2.
  Fixpoint plus (n : nat) (m : nat) : nat :=
    match n with
    | O => m
    | S n' => S (plus n' m)
    end.


  Compute (plus 3 2).

  Fixpoint mult (n m : nat) : nat :=
    match n with
    | O => O
    | S n' => plus m (mult n' m)
    end.
  
  Example test_mult1: (mult 3 3) = 9.
  Proof. simpl. reflexivity. Qed.

  Fixpoint minus (n m:nat) : nat :=
    match n, m with
    | O , _ => O
    | S _ , O => n
    | S n', S m' => minus n' m'
    end.
  
End NatPlayground2.

Fixpoint exp (base power : nat) : nat :=
  match power with
    | O => S O
    | S p => mult base (exp base p)
  end.

Fixpoint factorial (n : nat) : nat :=
  match n with
  | 0 => S 0
  | S n' => mult n (factorial n')
  end.
  
                             
Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.

Example test_factorial2: (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.


Notation "x + y" := (plus x y)
                       (at level 50, left associativity)
                       : nat_scope.
Notation "x - y" := (minus x y)
                       (at level 50, left associativity)
                       : nat_scope.
Notation "x * y" := (mult x y)
                       (at level 40, left associativity)
                       : nat_scope.
Check ((0 + 1) + 1).

Fixpoint eqb (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => eqb n' m'
            end
  end.

Fixpoint leb (n m : nat) : bool :=
  match n with
  | O => true
  | S n' =>
      match m with
      | O => false
      | S m' => leb n' m'
      end
  end.
Example test_leb1: (leb 2 2) = true.
Proof. simpl. reflexivity. Qed.
Example test_leb2: (leb 2 4) = true.
Proof. simpl. reflexivity. Qed.
Example test_leb3: (leb 4 2) = false.
Proof. simpl. reflexivity. Qed.

Notation "x =? y" := (eqb x y) (at level 70) : nat_scope.
Notation "x <=? y" := (leb x y) (at level 70) : nat_scope.
Example test_leb3': (4 <=? 2) = false.
Proof. simpl. reflexivity. Qed.

Definition ltb (n m : nat) : bool :=
  match leb n m with
  | false => false
  | true => leb (S n) m
  end.


                             
Notation "x <? y" := (ltb x y) (at level 70) : nat_scope.

Example test_ltb1: (ltb 2 2) = false.
Proof. simpl. reflexivity. Qed.

Example test_ltb2: (ltb 2 3) = true.
Proof. simpl. reflexivity. Qed.

Example test_ltb3: (ltb 4 2) = false.
Proof. simpl. reflexivity. Qed.

Axiom plus_O_n : forall n : nat, 0 + n = n.


Theorem plus_1_l : forall n:nat, 1 + n = S n.
Proof.
  intros n. simpl. reflexivity.
Qed.

Theorem mult_0_l : forall n:nat, 0 * n = 0.
Proof.
  intros n. reflexivity.
Qed.

Theorem plus_id_example : forall n m k:nat,
  n = m ->
  n + n = m + m.

Proof.
  intros a b c H.
  rewrite -> H.
  reflexivity.
Qed.

Theorem plus_id_exercise : forall n m o : nat,
  n = m -> m = o -> n + m = m + o.
Proof.
  intros n m o H1 H2.
  rewrite -> H1.
  rewrite <- H2.
  reflexivity.
Qed.

Theorem mult_0_plus : forall n m : nat,
  (0 + n) * m = n * m.
Proof.
  intros n m.
  rewrite plus_O_n.
  reflexivity. Qed.



Theorem mult_S_1 : forall n m : nat,
  m = S n ->
  m * (1 + n) = m * m.

Proof.
  intros n m H.
  rewrite -> H.
  rewrite <- plus_1_l.
  reflexivity.
Qed.


Theorem plus_1_neq_0_firsttry : forall n : nat,
  (n + 1) =? 0 = false.
Proof.
  intros n.
  simpl. (* does nothing! *)
Abort.

Compute 1 + 1 =? S (S O).



Theorem plus_comm : forall a b: nat, a + b = b + a.
Proof.
  induction a as [| a0 a1].
  (* Case Z *)
  - induction b as [| b0 b1].
    + reflexivity.
    (* Case S b *)
    + simpl. rewrite <- b1. simpl. reflexivity.
  (* Case a = S a *)
  - induction b as [| b0 b1].
    (* Case Z  *)
    + simpl. rewrite (a1 0). reflexivity.
    (* Case S b *)
    + simpl. rewrite <- b1.
      simpl. rewrite (a1 (S b0)).
      simpl. rewrite (a1 b0).
      reflexivity.
Qed.

Theorem plus1: forall n, n + 1 = S n.
Proof. intros n. rewrite -> plus_comm. reflexivity. Qed.
  
Theorem plus_1_neq_0 : forall n : nat,
  (n + 1) =? 0 = false.
Proof.
  intros n.
  destruct n as [|n'] eqn:E.
  - simpl plus.
    reflexivity.
  - simpl plus.
    rewrite plus1.
    reflexivity.
Qed.

Theorem negb_involutive : forall b : bool,
  negb (negb b) = b.
Proof.
  intros b. destruct b eqn:E.
  - simpl (negb true). reflexivity.
  - simpl. reflexivity.
Qed.

Theorem andb_commutative : forall b c, andb b c = andb c b.
Proof.
  intros b c.
  destruct b eqn:Eb.
  - destruct c eqn:Ec.
    + reflexivity.
    + reflexivity.
  - destruct c eqn:Ec.
    + reflexivity.
    + reflexivity.
Qed.

Theorem andb_commutative' : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn:Eb.
  { destruct c eqn:Ec.
    { reflexivity. }
    { reflexivity. } }
  { destruct c eqn:Ec.
    { reflexivity. }
    { reflexivity. } }
Qed.

Theorem andb3_exchange :
  forall b c d, andb (andb b c) d = andb (andb b d) c.
Proof.
  intros b c d. destruct b eqn:Eb.
  - destruct c eqn:Ec.
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
  - destruct c eqn:Ec.
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
    { destruct d eqn:Ed.
      - reflexivity.
      - reflexivity. }
Qed.

Theorem plus_1_neq_0' :
  forall n : nat,
    (n + 1) =? 0 = false.

Proof.
  intros [|n].
  - reflexivity.
  - reflexivity. Qed.

Theorem andb_commutative'' :
  forall b c, andb b c = andb c b.
Proof.
  intros [] [].
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_true_elim2 :
  forall b c : bool, b && c = true -> c = true.

Proof.
  intros b c H.
  destruct b.
  - destruct c.
    + reflexivity. 
    + rewrite <- H. reflexivity.
  - destruct c.
    + reflexivity.
    + rewrite <- H. reflexivity.
Qed.

Theorem zero_nbeq_plus_1 :
  forall n : nat, 0 =? (n + 1) = false.

Proof.
  intros []; repeat reflexivity.
Qed.

Theorem identity_fn_applied_twice :
  forall (f : bool -> bool),
  (forall (x : bool), f x = x) ->
  forall (b : bool), f (f b) = b.

Proof.
  intros f H b.
  rewrite -> H.
  rewrite -> H.
  reflexivity.
Qed.

Theorem neg_fn_applied_twice :
  forall (f : bool -> bool),
  (forall (x : bool), f x = negb x) ->
  forall (b : bool), f (f b) = b.

Proof.
  intros f H b.
  rewrite -> H.
  rewrite -> H.
  destruct b; repeat reflexivity.
Qed.

Theorem andb_eq_orb :
  forall (b c : bool),
  (andb b c = orb b c) ->
  b = c.

Proof.
  
  intros b c H.
  destruct b, c; try reflexivity; try (simpl in H; rewrite H; reflexivity).
Qed.

Theorem andb_eq_orb' :
  forall (b c : bool),
  (andb b c = orb b c) ->
  b = c.

Proof.
  
  intros b c.
  destruct b.
  
  - simpl. intros H1. rewrite H1. reflexivity.
  - simpl. intros H2. rewrite H2. reflexivity.
Qed.

Inductive bin : Type :=
  | Z
  | A (n : bin)
  | B (n : bin).


Fixpoint incr (m:bin) : bin :=
  match m with
  | Z => B Z
  | B x => A (incr x)
  | A x => B x         
  end.

Example test_incr_1: incr(Z) = B Z.
Proof. simpl. reflexivity. Qed.

Example test_incr_2: incr(B (B Z)) = A (A (B Z)).
Proof. simpl. reflexivity. Qed.


Fixpoint bin_to_nat (m:bin) : nat :=
  match m with
  | Z => O
  | B Z => 1
  | B x => 1 + 2 * (bin_to_nat x)
  | A x => 2 * (bin_to_nat x)
  end.


Example test_bin_nat_1: bin_to_nat(A (B (B Z))) = 6.
Proof. simpl. reflexivity. Qed.

Example test_bin_nat_2: bin_to_nat(A (A (A (B Z)))) = 8.
Proof. simpl. reflexivity. Qed.

Compute incr(A (B (B Z))).

Example test_bin_inc_nat: bin_to_nat(incr(A (B (B Z)))) = 7.
Proof. simpl. reflexivity. Qed.

Theorem plus_n_O_firsttry : forall n:nat,
    n = n + 0.

Proof.
  intros n.
  simpl. (* Does nothing! *)
Abort.

Theorem plus_n_O_secondtry : forall n:nat,
  n = n + 0.
Proof.
  intros n. destruct n as [| n'] eqn:E.
  - (* n = 0 *)
    reflexivity. (* so far so good... *)
  - (* n = S n' *)
    simpl. (* ...but here we are stuck again *)
Abort.

Theorem plus_n_O : forall n:nat, n = n + 0.
Proof.
  intros n. induction n as [| n' IHn'].
  - (* n = 0 *) reflexivity.
  - (* n = S n' *) simpl. rewrite <- IHn'. reflexivity. Qed.


Theorem minus_diag : forall n,
  minus n n = 0.
Proof.
  (* WORKED IN CLASS *)
  intros n. induction n as [| n' IHn'].
  - (* n = 0 *)
    simpl. reflexivity.
  - (* n = S n' *)
    simpl. rewrite -> IHn'. reflexivity. Qed.

Theorem mult_0_r : forall n:nat,
  n * 0 = 0.
Proof.
  intros n. induction n as [| n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite -> IHn'. reflexivity. Qed.  

Theorem plus_n_Sm : forall n m : nat,
  S (n + m) = n + (S m).
Proof.
  intros n m. induction n as [| n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite <- IHn'. reflexivity. Qed.

Theorem plus_comm2 : forall n m : nat,
    n + m = m + n.

Proof.
  intros n m.
  induction n as [| n' Ihn'], m as [ | m'].
  - simpl. reflexivity.
  - simpl. rewrite <- plus_n_O. reflexivity.
  - simpl. rewrite <- plus_n_O. reflexivity.
  - simpl.  rewrite -> Ihn'. simpl. rewrite plus_n_Sm. reflexivity.

Qed.

Theorem plus_comm3 : forall n m : nat,
    n + m = m + n.

Proof.
  intros n m.
  induction n as [| n' Ihn'].
  - simpl. rewrite <- plus_n_O. reflexivity.
  - rewrite <- plus_n_Sm. rewrite <- Ihn'. simpl. reflexivity.
Qed.


Theorem plus_assoc : forall n m p : nat,
  n + (m + p) = (n + m) + p.
Proof.
  intros n m p.
  induction n as [| n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite <- IHn'. reflexivity.
Qed.

Fixpoint double (n:nat) :=
  match n with
  | O => O
  | S n' => S (S (double n'))
  end.

Lemma double_plus : forall n, double n = n + n .

Proof.
  induction n as [| n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite <- plus_n_Sm. rewrite <- IHn'. reflexivity.
Qed.

Theorem evenb_S :
  forall n : nat,
    evenb (S n) = negb (evenb n).

Proof.
  induction n as [| n' IHn'].
  - simpl. reflexivity.
  - rewrite -> IHn'. simpl. rewrite -> negb_involutive. reflexivity.
Qed.


Theorem mult_0_plus' : forall n m : nat,
  (0 + n) * m = n * m.
Proof.
  intros n m.
  assert (H: 0 + n = n). { reflexivity. }
  rewrite -> H.
  reflexivity.
Qed.


Theorem plus_rearrange_firsttry : forall n m p q : nat,
  (n + m) + (p + q) = (m + n) + (p + q).
Proof.
  intros n m p q.
  (* We just need to swap (n + m) for (m + n)... seems
     like plus_comm should do the trick! *)
  rewrite -> plus_comm.
  (* Doesn't work...Coq rewrites the wrong plus! *)
Abort.

Theorem plus_rearrange : forall n m p q : nat,
  (n + m) + (p + q) = (m + n) + (p + q).
Proof.
  intros n m p q.
  assert (H: n + m = m + n).
  { rewrite -> plus_comm. reflexivity. }
  rewrite -> H. reflexivity.
Qed.
