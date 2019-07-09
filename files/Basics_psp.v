Inductive day : Type :=
  | monday : day
  | tuesday : day
  | wednesday : day
  | thursday : day
  | friday : day
  | saturday : day
  | sunday : day.


Definition day_inc (d:day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => saturday
  | saturday => sunday
  | sunday => monday
  end.

Compute (day_inc monday).
Compute (day_inc (day_inc sunday)).

Definition next_weekday (d:day) : day :=
  match d with
  | friday => monday
  | saturday => monday
  | _ => day_inc d
  end.



Compute (next_weekday friday).
Compute (next_weekday (next_weekday saturday)).

Example test_next_weekday:
  (next_weekday (next_weekday saturday)) = tuesday.
Proof.
  simpl.
  reflexivity.
Qed.

Inductive bool : Type :=
  | true : bool
  | false : bool.


Definition negb (b:bool) : bool :=
  match b with
  | true => false
  | false => true
  end.

Example test_negb_1:
  (negb true) = false.
Proof. simpl. reflexivity. Qed.

Example test_negb_2:
  (negb false) = true.
Proof. simpl. reflexivity. Qed.

Definition orb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => true
  | false => b2
  end.

Example test_orb1: (orb true true) = true.
Proof. simpl. reflexivity. Qed.

Example test_orb2: (orb true false) = true.
Proof. simpl. reflexivity. Qed.

Example test_orb3: (orb false false) = false.
Proof. simpl. reflexivity. Qed.

Definition andb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => b2
  | false => false
  end.

Example test_andb1: (andb true true) = true.
Proof. simpl. reflexivity. Qed.

Example test_andb2: (andb true false) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb3: (andb false false) = false.
Proof. simpl. reflexivity. Qed.


Notation "x && y" := (andb x y).
Notation "x || y" := (orb x y).

Example test_orb4: false || true = true.
Proof. simpl. reflexivity. Qed.

Definition nandb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true =>
        match b2 with
        | true => false
        | false => true
        end
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

Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
  match b1 with
  | true => andb b2 b3
  | false => false
  end.
  
Example test_andb3_1: (andb3 true true true) = true.
Proof. simpl. reflexivity. Qed.

Example test_andb3_2: (andb3 false true true) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb3_3: (andb3 false false false) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb3_4: (andb3 true true false) = false.
Proof. simpl. reflexivity. Qed.

Check true.

Check (negb true).

Check negb.

Inductive rgb : Type :=
  | red : rgb
  | green : rgb
  | blue : rgb.
  
Inductive color : Type :=
  | black : color
  | white : color
  | primary : rgb -> color.
  
Definition monochrome (c :color) : bool :=
  match c with
  | black => true
  | white => true
  | primary p => false
  end.

Example monochrome_1: monochrome white = true.
Proof. simpl. reflexivity. Qed.

Example monochrome_2: monochrome (primary red) = false.
Proof. simpl. reflexivity. Qed.

Definition isred (c : color) : bool :=
  match c with
  | primary red => true
  | _ => false
  end.

Example isred_1: isred (primary blue) = false.
Proof. simpl. reflexivity. Qed.

Example isred_2: isred (primary red) = true.
Proof. simpl. reflexivity. Qed.

Example isred_3: isred white = false.
Proof. simpl. reflexivity. Qed.

Module NatPlayground.

Inductive nat : Type :=
  | O : nat
  | S : nat -> nat.

Definition pred (n : nat) : nat :=
  match n with
  | O => O
  | S n' => n'
  end.

End NatPlayground.

Check (S (S (S (S (S O))))).

Definition minustwo (n : nat) : nat :=
  match n with
  | O => O
  | S O => O
  | S (S n') => n'
  end.

Example minustwo_1: minustwo 4 = 2.
Proof. simpl. reflexivity. Qed.

Check S.
Check pred.
Check minustwo.

Fixpoint evenb (n:nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n') => evenb n'
  end.

Definition oddb (n:nat) : bool := negb (evenb n).

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

Example plus_1: plus 1 3 = 4.
Proof. simpl. reflexivity. Qed.

Example plus_2: plus 4 5 = 9.
Proof. simpl. reflexivity. Qed.

Example plus_3: plus 134 2 = 136.
Proof. simpl. reflexivity. Qed.

Fixpoint mult (n m : nat) : nat :=
  match n with
  | O => O
  | S n' => plus m (mult n' m)
  end.

Example mult_1: mult 3 4 = 12.
Proof. simpl. reflexivity. Qed.

Example mult_2: mult 2 8 = 16.
Proof. simpl. reflexivity. Qed.

Fixpoint minus (n m:nat) : nat :=
  match (n, m) with
  | (O, _) => O
  | (S _, O) => n
  | (S n', S m') => minus n' m'
  end.

Example minus_1: minus 3 2 = 1.
Proof. simpl. reflexivity. Qed.

Example minus_2: minus 3 5 = 0.
Proof. simpl. reflexivity. Qed.

End NatPlayground2.

Fixpoint exp (base power : nat) : nat :=
  match power with
  | O => S O
  | S p => mult base (exp base p)
  end.

Example exp_1: exp 2 4 = 16.
Proof. simpl. reflexivity. Qed.

Fixpoint factorial (n:nat) : nat :=
  match n with
  | O => 1
  | S n' => mult n (factorial n')
  end.

Example test_factorial_1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.

Example test_factorial_2: (factorial 5) = (mult 10 12).
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

Fixpoint beq_nat (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => beq_nat n' m'
            end
  end.

Example test_beq_nat_1: beq_nat 2 3 = false.
Proof. simpl. reflexivity. Qed.

Example test_beq_nat_2: beq_nat 3 3 = true.
Proof. simpl. reflexivity. Qed.



Fixpoint leb (n m : nat) : bool :=
  match n with
  | O => true
  | S n' => match m with
            | O => false
            | S m' => leb n' m'
            end
  end.

Example test_leb_1: leb 2 3 = true.
Proof. simpl. reflexivity. Qed.

Example test_leb_2: leb 3 3 = true.
Proof. simpl. reflexivity. Qed.

Example test_leb_3: leb 4 3 = false.
Proof. simpl. reflexivity. Qed.

Definition blt_nat (n m : nat) : bool :=
  andb (leb n m) (negb (beq_nat n m)).
  
Example test_blt_nat_1: blt_nat 2 2 = false.
Proof. simpl. reflexivity. Qed.

Example test_blt_nat_2: blt_nat 2 4 = true.
Proof. simpl. reflexivity. Qed.

Example test_blt_nat_3: blt_nat 4 2 = false.
Proof. simpl. reflexivity. Qed.

Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof.
  intros n. simpl. reflexivity. Qed.

Theorem plus_O_n' : forall n : nat, 0 + n = n.
Proof.
  intros n. simpl. reflexivity. Qed.

Theorem plus_id_example : forall n m:nat,
  n = m ->
  n + m = m + m.
Proof. 
  intros n m.
  intros H.
  rewrite -> H.
  reflexivity. 
Qed.

Theorem plus_1_neq_0_firsttry : forall n : nat,
  beq_nat (n + 1) 0 = false.

Proof.
  intros n. destruct n as [| n'].
  - reflexivity.
  - reflexivity.
Qed.

Theorem negb_involutive : forall b : bool,
  negb (negb b) = b.
Proof.
  intros b. destruct b as [| b'].
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_commutative : forall b c, andb b c = andb c b.
Proof.
  intros b c.
  destruct b.
  - destruct c.
    + reflexivity.
    + reflexivity.
  - destruct c.
    + reflexivity.
    + reflexivity.
Qed.


Theorem plus_1_neq_0' : forall n : nat,
  beq_nat (n + 1) 0 = false.
Proof.
  intros [|n].
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_commutative'' :
  forall b c, andb b c = andb c b.
Proof.
  intros [] [].
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_true_elim2: forall b c : bool,
  andb b c = true -> c = true.
Proof.
  intros [] [].
  - intros H. reflexivity.
  - intros H. rewrite <- H. reflexivity.
  - intros H. reflexivity.
  - intros H. rewrite <- H. reflexivity. 
Qed.

Theorem zero_nbeq_plus_1 : forall n : nat,
  beq_nat 0 (n + 1) = false.
Proof.
  intros [].
  - reflexivity.
  - reflexivity.
Qed.

Notation "x + y" := (plus x y)
      (at level 50, left associativity)
      : nat_scope.

Notation "x * y" := (mult x y)
      (at level 40, left associativity)
      : nat_scope.

Fixpoint plus' (n : nat) (m : nat) : nat :=
  match m with
  | O => n
  | S m' => S (plus' n m')
  end.

Theorem identity_fn_applied_twice : 
  forall (f : bool -> bool), 
  (forall (x : bool), f x = x) -> 
  forall (b : bool), f (f b) = b.
Proof.
  intros H f.
  intros [].
  - rewrite -> f. rewrite -> f. reflexivity.
  - rewrite -> f. rewrite -> f. reflexivity.  
Qed.

Theorem negation_fn_applied_twice : 
  forall (f : bool -> bool), 
  (forall (x : bool), f x = negb x) -> 
  forall (b : bool), f (f b) = b.
Proof.
  intros H f.
  intros [].
  - rewrite -> f. rewrite -> f. reflexivity.
  - rewrite -> f. rewrite -> f. reflexivity.
Qed.


Theorem andb_eq_orb:
  forall (b c : bool),
  (andb b c = orb b c) ->
  b = c.
Proof.
  intros b c. destruct b as [| b']. 
  - simpl. intros H. rewrite -> H. reflexivity.
  - simpl. intros H. rewrite -> H. reflexivity.
Qed.

Inductive bin : Type :=
  | Zero : bin
  | Twice : bin -> bin
  | Twice_plus_1 : bin -> bin.

Check Zero. (** 0 **)
Check Twice_plus_1 Zero. (** 1 **)
Check Twice (Twice_plus_1 Zero). (** 2 **)
Check Twice_plus_1 (Twice_plus_1 Zero). (** 3 **)
Check Twice (Twice (Twice_plus_1 Zero)). (** 4 **)
Check Twice_plus_1 (Twice (Twice_plus_1 Zero)). (** 5 **)
Check Twice (Twice_plus_1 (Twice_plus_1 Zero)). (** 6 **)
Check Twice_plus_1 (Twice_plus_1 (Twice_plus_1 Zero)). (** 7 **)

Fixpoint incr (n : bin) : bin :=
  match n with
  | Zero => Twice_plus_1 Zero
  | Twice n' => Twice_plus_1 n'
  | Twice_plus_1 n' => Twice (incr n')
  end.

Example test_bin_incr1: incr (Zero) = Twice_plus_1 Zero.
Proof. simpl. reflexivity. Qed.

Example test_bin_incr2: incr (incr Zero) = Twice (Twice_plus_1 Zero).
Proof. simpl. reflexivity. Qed.

Example test_bin_incr3: incr (Twice_plus_1 (Twice_plus_1 Zero)) = Twice (Twice (Twice_plus_1 Zero)).
Proof. simpl. reflexivity. Qed.

Example test_bin_incr4: incr (incr (incr (incr Zero))) = Twice (Twice (Twice_plus_1 Zero)).
Proof. simpl. reflexivity. Qed.

Example test_bin_incr5: incr (incr (incr (incr (incr (incr Zero))))) = Twice (Twice_plus_1 (Twice_plus_1 Zero)).
Proof. simpl. reflexivity. Qed.

Fixpoint bin_to_nat (n : bin) : nat :=
  match n with
  | Zero => 0
  | Twice n' => mult 2 (bin_to_nat n')
  | Twice_plus_1 n' => plus 1 (mult 2 (bin_to_nat n'))
  end.

Example test_bin_to_nat_1: bin_to_nat (Twice (Twice_plus_1 Zero)) = 2.
Proof. simpl. reflexivity. Qed.

Example test_bin_to_nat_2: bin_to_nat (Twice (Twice (Twice_plus_1 Zero))) = 4.
Proof. simpl. reflexivity. Qed.

Example test_bin_to_nat_incr1: bin_to_nat (incr (incr (incr (incr Zero)))) = 4.
Proof. simpl. reflexivity. Qed.

Example test_bin_to_nat_incr2: bin_to_nat (incr (incr (incr (incr (incr (incr (incr Zero))))))) = 7.
Proof. simpl. reflexivity. Qed.








