(* comment *)

Inductive day : Type :=
  | monday : day
  | tuesday : day
  | wednesday : day
  | thursday : day
  | friday : day
  | saturday : day
  | sunday : day.
  
Definition next_weekday (d:day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Eval simpl in (next_weekday friday).

Eval simpl in (next_weekday (next_weekday saturday)).

Example test_next_weekday:
  (next_weekday (next_weekday saturday)) = tuesday.

Proof. simpl. reflexivity. Qed.

Inductive bool : Type :=
  | true : bool
  | false : bool.

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

Example test_orb1: (orb true false) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb2: (orb false false) = false.
Proof. simpl. reflexivity. Qed.
Example test_orb3: (orb false true) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb4: (orb true true) = true.
Proof. simpl. reflexivity. Qed.

Definition admit {T: Type} : T. Admitted.

Definition nandb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | false => true
  | true => (negb b2)
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
  | false => false
  | true => (andb b2 b3)
  end.

Example test_andb31: (andb3 true true true) = true.
Proof. simpl. reflexivity. Qed.
Example test_andb32: (andb3 false true true) = false.
Proof. simpl. reflexivity. Qed.
Example test_andb33: (andb3 true false true) = false.
Proof. simpl. reflexivity. Qed.
Example test_andb34: (andb3 true true false) = false.
Proof. simpl. reflexivity. Qed.

Check true.
Check (negb true).
Check negb.
Check andb.

(************************
 ** Module Playground1 **
 ************************)
Module Playground1.

Inductive nat : Type :=
  | O : nat
  | S : nat -> nat.

Definition pred (n : nat) : nat :=
  match n with
    | O => O
    | S n' => n'
  end.

End Playground1.

Definition minustwo (n : nat) : nat :=
  match n with
    | O => O
    | S O => O
    | S (S n') => n'
  end.

Check (S (S (S (S 0)))).
Eval simpl in (minustwo 4).

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

Example test_oddb1: (oddb (S O)) = true.
Proof. simpl. reflexivity. Qed.
Example test_oddb2: (oddb (S (S (S (S O))))) = false.
Proof. simpl. reflexivity. Qed.

(************************
 ** Module Playground2 **
 ************************)
Module Playground2.

Fixpoint plus (n:nat) (m:nat) : nat :=
  match n with
    | O => m
    | S n' => S (plus n' m)
  end.

Eval simpl in (plus (S (S (S O))) (S (S O))).

Fixpoint mult (n m : nat) : nat :=
  match n with
    | O => O
    | S n' => plus m (mult n' m)
  end.
Fixpoint minus (n m : nat) : nat :=
  match n,m with
    | O , _ => O
    | S _ , O => n
    | S n' , S m' => minus n' m'
  end.

End Playground2.

Fixpoint exp (base power : nat) : nat :=
  match power with
    | O => S O
    | S p => mult base (exp base p)
  end.

Example test_mult1: (mult 3 3) = 9.
Proof. simpl. reflexivity. Qed.

Fixpoint factorial (n:nat) : nat :=
  match n with
    | O => (S O)
    | S n' => mult n (factorial n')
  end.

Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.
Example test_factorial2: (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.

Notation "x + y" := (plus x y)
(at level 50, left associativity) : nat_scope.
Notation "x - y" := (minus x y)
(at level 50, left associativity) : nat_scope.
Notation "x * y" := (mult x y)
(at level 40, left associativity) : nat_scope.

Check ((0+1)+1).

Check S(0*0).
Check (false,false).
Check 0%nat.
(* Check 0%Z. *)

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

Fixpoint ble_nat (n m : nat) : bool :=
  match n with
  | O => true
  | S n' => match m with
            | O => false
            | S m' => ble_nat n' m'
            end
  end.

Example test_ble_nat1: (ble_nat 2 2) = true.
Proof. simpl. reflexivity. Qed.
Example test_ble_nat2: (ble_nat 2 4) = true.
Proof. simpl. reflexivity. Qed.
Example test_ble_nat3: (ble_nat 4 2) = false.
Proof. simpl. reflexivity. Qed.

Definition blt_nat (n m : nat) : bool := 
  andb (ble_nat n m) (negb (beq_nat n m)).

Example test_blt_nat1: (blt_nat 2 2) = false.
Proof. simpl. reflexivity. Qed.
Example test_blt_nat2: (blt_nat 2 4) = true.
Proof. simpl. reflexivity. Qed.
Example test_blt_nat3: (blt_nat 4 2) = false.
Proof. simpl. reflexivity. Qed.

(**********************************
 ** Sec: Proof by Simplification **
 **********************************)

(* Notation is supposed to be in uf8 library, but "require utf8" 
   doesnt work, so the following is just copy-pasted from
   http://coq.inria.fr/stdlib/Coq.Unicode.Utf8.html *)

Notation "∀ x : t , P" := (forall x : t , P)
  (at level 200, x ident, right associativity) : type_scope.

Theorem plus_O_n : ∀n:nat, 0 + n = n.
Proof. simpl. reflexivity. Qed.

Theorem plus_O_n' : ∀n:nat, 0+n=n.
Proof. reflexivity. Qed.

Eval simpl in ∀n:nat,n+0=n.
(*  = ∀n : nat, n + 0 = n : Prop *)
Eval simpl in ∀n:nat,0+n=n.
(*  = ∀n : nat, n = n : Prop *)
(* difference is because plus matches on 1st operand? *)

(****************************
 ** Sec: The intros Tactic **
 ****************************)

Theorem plus_O_n'' : ∀n:nat,0+n=n.
Proof. intros n. reflexivity. Qed.

Theorem plus_1_l : ∀n:nat,1+n=S n.
Proof. intros n. reflexivity. Qed.

Theorem mult_0_l : ∀n:nat, 0*n=0.
Proof. intros n. reflexivity. Qed.

(* Note: all these examples dont seem to need intros
   What is an example that would fail without intros? *)

(*****************************
 ** Sec: Proof by Rewriting **
 *****************************)

Notation "∀ x y : t , P" := (forall x y : t , P)
  (at level 200, x ident, y ident, right associativity) : type_scope.

Theorem plus_id_example : ∀n m:nat,
  n = m -> n+n = m+m.

Proof.
  intros n m.
  intros H.
  rewrite -> H.
  reflexivity. Qed.

Notation "∀ x y z : t , P" := (forall x y z : t , P)
  (at level 200, x ident, y ident, z ident, right associativity) : type_scope.

Theorem plus_id_exercise : ∀n m o : nat,
  n=m -> m=o -> n+m=m+o.
Proof.
  intros n m o.
  intros H1.
  intros H2.
  rewrite -> H1.
  rewrite -> H2.
  reflexivity. Qed.

Theorem mult_0_plus : ∀n m: nat,
  (0+n)*m=n*m.
Proof.
  intros n m.
  rewrite -> plus_O_n.
  reflexivity. Qed.

Theorem mult : ∀n m:nat, S n * m = m + n*m.
Proof. intros n m. reflexivity. Qed.

Theorem mult_1_plus : ∀n m: nat,
  (1+n)*m=m+(n*m).
Proof.
  intros n m.
  rewrite -> plus_1_l.
  rewrite -> mult.
  reflexivity. Qed.

(************************
 ** Sec: Case Analysis **
 ************************)

Theorem plus_1_neq_0_firsttry : ∀n:nat,
  beq_nat (n+1) 0 = false.
Proof. intros n. simpl. Admitted.

Theorem plus_1_neq_0 :∀n:nat,
  beq_nat (n+1) 0 = false.
Proof.
  intros n. destruct n as [|n'].
  reflexivity. reflexivity. Qed.

Theorem negb_involutive : ∀b:bool,
  negb (negb b) = b.
Proof.
  intros b. destruct b. reflexivity. reflexivity. Qed.

Theorem zero_nbeq_plus_1 : ∀n : nat,
  beq_nat 0 (n+1) = false.
Proof.
  intros n. destruct n as [|n']. reflexivity. reflexivity. Qed.

(***********************
 ** Sec: Naming Cases **
 ***********************)

Require String. Open Scope string_scope.

Ltac move_to_top x :=
  match reverse goal with
  | H : _ |- _ => try move x after H
  end.

Tactic Notation "assert_eq" ident(x) constr(v) :=
  let H := fresh in
  assert (x = v) as H by reflexivity;
  clear H.

Tactic Notation "Case_aux" ident(x) constr(name) :=
  first [
    set (x := name); move_to_top x
  | assert_eq x name; move_to_top x
  | fail 1 "because we are working on a different case" ].

Tactic Notation "Case" constr(name) := Case_aux Case name.
Tactic Notation "SCase" constr(name) := Case_aux SCase name.
Tactic Notation "SSCase" constr(name) := Case_aux SSCase name.
Tactic Notation "SSSCase" constr(name) := Case_aux SSSCase name.
Tactic Notation "SSSSCase" constr(name) := Case_aux SSSSCase name.
Tactic Notation "SSSSSCase" constr(name) := Case_aux SSSSSCase name.
Tactic Notation "SSSSSSCase" constr(name) := Case_aux SSSSSSCase name.
Tactic Notation "SSSSSSSCase" constr(name) := Case_aux SSSSSSSCase name.


Theorem andb_true_elim1 : ∀b c : bool,
  andb b c = true -> b = true.
Proof.
  intros b c H.
  destruct b.
  Case "b = true".
    reflexivity.
  Case "b = false".
    rewrite <- H. reflexivity. Qed.


Theorem andb_false : ∀b :bool,
  andb b false =  false.
Proof. intros. destruct b.
  Case "b = true".  reflexivity. 
  Case "b = false". reflexivity. Qed.

Theorem andb_true_elim2 : ∀b c: bool,
  andb b c = true -> c = true.
Proof.
  intros b c H.
  destruct c.
  Case "c = true". reflexivity.
  Case "c = false". 
    rewrite <- H. 
    rewrite -> andb_false.
    reflexivity. Qed.


(********************
 ** Sec: Induction **
 ********************)

Theorem plus_0_r_firsttry : ∀n:nat, n+0=n.
Proof. intros n. simpl. Admitted.

Theorem plus_0_r_secondtry : ∀n:nat, n+0=n.
Proof.
  intros n. destruct n as [|n'].
  Case "n=0". reflexivity.
  Case "n=S n'". simpl.
Admitted.

Theorem plus_0_r : ∀n:nat,n+0=n.
Proof.
  intros n. induction n as [|n'].
  Case "n=0". reflexivity.
  Case "n=S n'". simpl. rewrite -> IHn'. reflexivity. Qed.

Theorem minus_diag : ∀n:nat, minus n n = 0.
Proof.
  intros n. induction n as [|n'].
  Case "n=0". 
    simpl. reflexivity.
  Case "n=S n'".
    simpl. rewrite -> IHn'. reflexivity. Qed.

Theorem mult_0_r : ∀n:nat, n*0=0.
Proof. 
  intros n. induction n as [|n'].
  Case "n=0". reflexivity.
  Case "n= Sn'". simpl. rewrite -> IHn'. reflexivity. Qed.

Theorem plus_n_Sm : ∀n m:nat, S (n+m)=n+(S m).
Proof.
  intros n m. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n=S n'". simpl. rewrite -> IHn'. reflexivity. Qed.

Theorem plus_comm : ∀n m: nat, n+m=m+n.
Proof.
  intros n m. induction n as [|n'].
  Case "n=0". simpl. rewrite -> plus_0_r. reflexivity.
  Case "n=S n'".
    simpl. 
    rewrite -> IHn'. 
    rewrite -> plus_n_Sm. 
    reflexivity. Qed.

Fixpoint double (n:nat) :=
  match n with
  | O => O
  | S n' => S ( S (double n'))
  end.

Notation "∀ x , P" := (forall x , P)
  (at level 200, x ident, right associativity) : type_scope.

Lemma double_plus : ∀n, double n=n+n.
Proof.
  intros n. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n=S n'".
    simpl.
    rewrite -> IHn'.
    rewrite -> plus_n_Sm.
    reflexivity. Qed.

(* difference between destruct and induction: 
   induction allows rewriting with IH *)


(***********************************
 ** Sec: Formal vs Informal proof **
 ***********************************)

Theorem plus_assoc' : ∀n m p : nat, n+(m+p)=(n+m)+p.
Proof.
  intros n m p. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n= S n'". 
    simpl.
    rewrite -> IHn'.
    reflexivity. Qed.

Theorem plus_assoc : ∀n m p : nat, n+(m+p)=(n+m)+p.
Proof.
  intros n m p. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n=S n'".
    simpl. rewrite -> IHn'. reflexivity. Qed.

Theorem beq_nat_refl : ∀n:nat, true=beq_nat n n.
Proof.
  intros n. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n= Sn'". simpl. rewrite -> IHn'. reflexivity. Qed.

(*******************************
 ** Sec: Proofs within Proofs **
 *******************************)

Theorem mult_0_plus' : ∀n m:nat, (0+n)*m=n*m.
Proof.
  intros n m.
  assert (H: 0+n=n).
    Case "Proof of assertion". reflexivity.
  rewrite -> H.
  reflexivity. Qed.

Notation "∀ x y z u : t , P" := (forall x y z u : t , P)
  (at level 200, x ident, y ident, z ident, u ident, right associativity)
  : type_scope.

Theorem plus_rearrange_firsttry : ∀n m p q:nat,
  (n+m)+(p+q)=(m+n)+(p+q).
Proof.
  intros n m p q.
  rewrite -> plus_comm.
Admitted.

Theorem plus_rearrange : ∀n m p q : nat,
  (n+m)+(p+q)=(m+n)+(p+q).
Proof.
  intros n m p q.
  assert (H: n + m = m + n).
    Case "Proof of assertion".
    rewrite -> plus_comm. reflexivity.
  rewrite -> H. reflexivity. Qed.

Theorem plus_swap : ∀n m p : nat,
  n+(m+p)=m+(n+p).
Proof.
  intros m n p.
  assert (H: m+n=n+m). rewrite -> plus_comm. reflexivity.
  rewrite -> plus_assoc.
  rewrite -> H.
  rewrite -> plus_assoc.
  reflexivity. Qed.

(*
Theorem mult_unfold : ∀n m: nat, S n*m=m+m*n.
Proof.
  intros n m. induction n as [|n'].
  Case "n=0". simpl. rewrite -> mult_0_r. reflexivity. 
  Case "n= S n'". simpl. rewrite <- IHn'. reflexivity.
  Qed.
*)

Theorem plus_swap2 : ∀m n p q:nat, m+n+p+q=m+p+n+q.
Proof.
  intros m n p. assert (H: p+n=n+p). rewrite->plus_comm. reflexivity.
  rewrite <- plus_assoc.
  rewrite <- H.
  rewrite -> plus_assoc.
  reflexivity.
Qed.
Theorem dist: ∀n m p:nat, m*(n+p)=m*n+m*p.
Proof.
  intros m n p. induction n. simpl. reflexivity.
  simpl. rewrite -> IHn.
  rewrite->plus_assoc. rewrite->plus_assoc.
  rewrite->plus_swap2. reflexivity.
Qed.

Theorem mult_1_r: ∀n:nat, n*1=n.
Proof.
  intros n. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n=S n'". simpl. rewrite->IHn'. reflexivity.
Qed.

Theorem mult_comm: ∀m n : nat, m*n=n*m.
Proof.
  intros n m.
  induction n as [|n'].
  Case "n=0". simpl.  rewrite -> mult_0_r. reflexivity.
  Case "n= S n'".
    simpl.
    rewrite -> IHn'.
    rewrite <- plus_1_l.
    rewrite -> dist.
    rewrite -> mult_1_r.
    reflexivity.
Qed.

Theorem evenb_SSn: ∀n:nat,evenb (S (S n))=evenb n.
Proof.
  intros n. simpl. reflexivity.
Qed.

Theorem evenb_n__oddb_Sn : ∀n : nat,
  evenb n = negb (evenb (S n)).
Proof.
  intros n. induction n as [|n'].
  Case "n=0". simpl. reflexivity.
  Case "n=S n'".
  rewrite->evenb_SSn. rewrite->IHn'. rewrite->negb_involutive.
  reflexivity. 
Qed.

(** **** Exercise: 3 stars, optional *)
Theorem bool_fn_applied_thrice : 
  forall (f : bool -> bool) (b : bool), 
  f (f (f b)) = f b.
Proof.
  intros f b.
  destruct b.
  Case "b = true".
  remember (f true) as ftrue.
    destruct ftrue.
    SCase "f true = true".
      rewrite <- Heqftrue.
      symmetry.
      apply Heqftrue.
    SCase "f true = false".
      remember (f false) as ffalse.
      destruct ffalse.
      SSCase "f false = true".
        symmetry.
        apply Heqftrue.
      SSCase "f false = false".
        symmetry.
        apply Heqffalse.
  remember (f false) as ffalse.
    destruct ffalse.
    SCase "f false = true".
      remember (f true) as ftrue.
      destruct ftrue.
      SSCase "f true = true".
        symmetry.
        apply Heqftrue.
      SSCase "f true = false".
        symmetry.
        apply Heqffalse.
    SCase "f false = false".
      rewrite <- Heqffalse.
      symmetry.
      apply Heqffalse.
Qed.



