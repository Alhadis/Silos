Set Warnings "-notation-overridden,-parsing".

(* Add LoadPath "/Users/developer/development/software-foundations/logical-foundations". *)
Require Export Poly.

Theorem silly1 : forall (n m o p : nat),
  n = m ->
  [n;o] = [n;p] ->
  [n;o] = [m;p].
Proof.
  intros n m o p H1 H2.
  rewrite <- H1.
  apply H2.
Qed.

Theorem silly2 : forall (n m o p : nat),
  n = m ->
  (forall (q r : nat), q = r -> [q;o] = [r;p]) ->
  [n;o] = [m;p].
Proof.
  intros n m o p eq1 eq2.
  apply eq2. apply eq1.
Qed.

Theorem silly2a : forall (n m : nat),
  (n,n) = (m,m) ->
  (forall (q r : nat), (q,q) = (r,r) -> [q] = [r]) ->
  [n] = [m].
Proof.
  intros n m eq1 eq2.
  apply eq2. apply eq1.
Qed.

Theorem silly_ex : 
  (forall n, evenb n = true -> oddb (S n) = true) ->
  evenb 3 = true ->
  oddb 4 = true.
Proof.
  intros eq1 eq2.
  apply eq1.
  apply eq2.
Qed.

Theorem silly3_firsttry : forall (n : nat),
  true = beq_nat n 5 ->
  beq_nat (S (S n)) 7 = true.
Proof.
  intros n H.
  symmetry.
  simpl.
  apply H.
Qed.

Theorem rev_exercise1 : forall (l l' : list nat),
  l = rev l' ->
  l' = rev l.
Proof.
  intros l l' H.
  rewrite -> H.
  symmetry.
  apply rev_involutive.
Qed.


Example trans_eq_example : forall (a b c d e f : nat),
  [a;b] = [c;d] ->
  [c;d] = [e;f] ->
  [a;b] = [e;f].
Proof.
  intros a b c d e f eq1 eq2.
  rewrite -> eq1. rewrite -> eq2.
  reflexivity.
Qed.

Theorem trans_eq : forall (X:Type) (n m o : X),
  n = m -> m = o -> n = o.
Proof.
  intros X n m o eq1 eq2.
  rewrite -> eq1.
  rewrite -> eq2.
  reflexivity.
Qed.

Example trans_eq_example' : forall (a b c d e f : nat),
  [a;b] = [c;d] ->
  [c;d] = [e;f] ->
  [a;b] = [e;f].
Proof.
  intros a b c d e f eq1 eq2.
  apply trans_eq with (m:=[c;d]).
  apply eq1. apply eq2.
Qed.

Example trans_eq_exercise : forall (n m o p : nat),
  m = (minustwo o) ->
  (n + p) = m ->
  (n + p) = (minustwo o).
Proof.
  intros n m o p eq1 eq2.
  apply trans_eq with (m:=m).
  - apply eq2.
  - apply eq1.
Qed.

Theorem S_injective : forall (n m : nat),
  S n = S m ->
  n = m.
Proof.
  intros n m H.
  inversion H.
  reflexivity.
Qed.

Theorem inversion_ex1 : forall (n m o : nat),
  [n; m] = [o; o] ->
  [n] = [m].
Proof.
  intros n m o H.
  inversion H.
  reflexivity.
Qed.

Theorem inversion_ex2 : forall (n m : nat),
  [n] = [m] ->
  n = m.
Proof.
  intros n m H.
  inversion H as [Hnm].
  reflexivity.
Qed.


(* Exercise: 1 star (inversion ex3) *)
Example inversion_ex3 : forall (X : Type) (x y z : X) (l j : list X),
  x :: y :: l = z :: j ->
  y :: l = x :: j ->
  x = y.
Proof.
  intros X x y z l j eq1 eq2.
  inversion eq1.
  inversion eq2.
  rewrite -> H0.
  reflexivity.
Qed.

Theorem beq_nat_0_1 : forall n,
  beq_nat O n = true -> 
  n = O.
Proof.
  intros n. destruct n.
  - intros H. reflexivity.
  - simpl. intros H. inversion H.
Qed.

Theorem inversion_ex4 : forall (n : nat),
  S n = O ->
  2 + 2 = 5.
Proof.
  intros n contra.
  inversion contra.
Qed.

Theorem inversion_ex5 : forall (n m : nat),
  false = true ->
  [n] = [m].
Proof.
  intros n m contra.
  inversion contra.
Qed.


(* Exercise: 1 star (inversion ex6) *)
Example inversion_ex6 : forall (X : Type)
        (x y z : X) (l j : list X),
  x :: y :: l = [] ->
  y :: l = z :: j ->
  x = z.
Proof.
  intros X x y z l j eq1 eq2.
  inversion eq1.
Qed.

Theorem f_equal : forall (A B : Type) (f: A -> B) (x y: A),
  x = y -> f x = f y.
Proof.
  intros A B f x y eq.
  rewrite eq.
  reflexivity.
Qed.


(* Using Tactics on Hypotheses *)
Theorem S_inj : forall (n m : nat) (b : bool),
  beq_nat (S n) (S m) = b ->
  beq_nat n m = b.
Proof.
  intros n m b H.
  simpl in H.
  apply H.
Qed.

Theorem silly3' : forall (n : nat),
  (beq_nat n 5 = true -> beq_nat (S (S n)) 7 = true) ->
  true = beq_nat n 5 ->
  true = beq_nat (S (S n)) 7.
Proof.
  intros n eq H.
  symmetry in H.
  apply eq in H.
  symmetry in H.
  apply H.
Qed.

(* plus_n_Sm : S (n + m) = n + (S m). *)

Theorem plus_n_n_injective : forall n m,
  n + n = m + m ->
  n = m.
Proof.
  intros n. induction n as [| n'].
  - intros m. destruct m as [| m'].
    + reflexivity.
    + intros contra. inversion contra.
  - intros m. destruct m as [| m'].
    + intros H. simpl in H. inversion H.
    + intros eq. inversion eq.
      rewrite <- plus_n_Sm in H0. rewrite <- plus_n_Sm in H0. 
      inversion H0. apply IHn' in H1. rewrite H1.
      reflexivity.
Qed.

Theorem double_injective_FAILED : forall n m,
  double n = double m ->
  n = m.
Proof.
  intros n m. induction n.
  - simpl. destruct m as [| m'].
    + reflexivity.
    + intros contra. inversion contra.
  - destruct m as [| m'].
    + intros contra. inversion contra.
    + intros H. inversion H. apply f_equal.
Abort.


Theorem double_injective : forall n m,
  double n = double m -> n = m.
Proof.
  intros n. induction n as [| n'].
  - (* n = 0 *) simpl. intros m. destruct m as [| m'].
    + (* m = 0 *) reflexivity.
    + (* m = S m' *) intros contra. inversion contra.
  - (* n = S n' *) simpl. intros m. destruct m as [| m'].
    + (* m = 0 *) intros contra. inversion contra.
    + (* m = S m' *) intros H. apply f_equal. apply IHn'. inversion H. reflexivity.
Qed.


(* Exercise: 2 stars (beq_nat_true) *)

Theorem beq_nat_true : forall n m,
  beq_nat n m = true -> n = m.
Proof.
  intros n. induction n as [| n'].
  - (* n = 0 *) intros m. destruct m as [| m'].
    + reflexivity.
    + intros contra. inversion contra.
  - (* n = S n' *) intros m. destruct m as [| m'].
    + intros contra. inversion contra.
    + intros eq. inversion eq. apply f_equal. apply IHn'. apply H0.
Qed.


(* Exercise: 2 stars, advanced (beq_nat_true_informal) *)

(**
Theorem beq_nat_true_informal
  For all n m, if beq_nat n m = true then n = m.
Proof:
  By induction on n.
  * First, suppose n = 0, we must show:
    For all m, if beq_nat 0 m = true then 0 = m.
    
    To show that, lets perform induction on m.
    ** Suppose m = 0, we must show:
    if beq_nat 0 0 = true, then 0 = 0.
    This follows directly from the definition of beq_nat.
    ** Next, suppose m = S m', then we must show:
    if beq_nat 0 Sm' = true, then 0 = S m'.
    This is a false assumption, 
  * (the induction hypothesis) now we suppose n = S n', we must show:
    

**)


Theorem double_injective_take2_FAILED : forall n m,
  double n = double m ->
  n = m.
Proof.
  intros n m. induction m.
  - simpl. intros eq. destruct n.
    + reflexivity.
    + inversion eq.
  - intros eq. destruct n.
    + inversion eq.
    + apply f_equal.
Abort.

Theorem double_injective_take2 : forall n m,
  double n = double m ->
  n = m.
Proof.
  intros n m.
  generalize dependent n.
  induction m as [| m'].
  - simpl. intros n eq. destruct n.
    + reflexivity.
    + inversion eq.
  - simpl. intros n eq. destruct n.
    + inversion eq.
    + inversion eq. apply f_equal. apply IHm'. apply H0.
Qed.


Theorem beq_id_true : forall x y,
  beq_id x y = true -> x = y.
Proof.
  intros [m] [n]. simpl. intros H.
  assert (H' : m = n). { apply beq_nat_true. apply H. }
  rewrite H'. reflexivity.
Qed.

(* Exercise: 3 stars, recommended (gen_dep_practice) *)

Theorem nth_error_after_last : forall (n : nat) (X : Type) (l : list X),
  length l = n ->
  nth_error l n = None.
Proof.
  intros n X l.
  generalize dependent n.
  induction l.
  - reflexivity.
  - intros n H. destruct n.
    + inversion H.
    + simpl. apply IHl. simpl in H. inversion H. reflexivity.
Qed.


Definition square n := n * n.

Lemma square_mult: forall n m,
  square (n * m) = square n * square m.
Proof.
  intros n m.
  unfold square.
  rewrite mult_assoc.
  assert (H: n * m * n = n * n * m).
  { rewrite mult_comm. apply mult_assoc. }
  rewrite H. rewrite mult_assoc. reflexivity.
Qed.


Definition foo (x: nat) := 5.

Fact silly_fact_1: forall m, foo m + 1 = foo (m + 1) + 1.
Proof.
  intros. simpl. reflexivity.
Qed.

Definition sillyfun (n : nat) : bool :=
  if beq_nat n 3 then false
  else if beq_nat n 5 then false
  else false.

Theorem sillyfun_false : forall (n : nat),
  sillyfun n = false.
Proof.
  intros n. unfold sillyfun.
  destruct (beq_nat n 3).
  - reflexivity.
  - destruct (beq_nat n 5).
    + reflexivity.
    + reflexivity.
Qed.

(* Exercise: 3 stars, optional (combine_split) *)

Fixpoint split {X Y : Type} (l : list (X * Y))
            : (list X) * (list Y) :=
  match l with
  | [ ] => ([], [])
  | (x, y) :: t =>
        match split t with
        | (lx, ly) => (x :: lx, y :: ly)
        end
  end.

(*
Lemma split_p_l : forall X Y (p: X*Y) l1 l2 (l: list (X * Y)),
  split l = (l1, l2) ->
  split (p :: l) = ((fst p :: l1), (snd p :: l2)).
Proof.
  intros.
  destruct l.
  - unfold split, fst, snd.
*)

Theorem eq_pair : forall X Y (x : X*Y), x = (fst x, snd x).
Proof. destruct x. reflexivity. Qed.


Theorem combine_split : forall X Y (l : list (X * Y)) l1 l2,
  split l = (l1, l2) ->
  combine l1 l2 = l.
Proof.
  induction l as [|(x,y) l'].
  - intros. inversion H. reflexivity.
  - simpl.
    destruct (split l') as [xs ys].
    intros l1 l2 h1.
    inversion h1.
    simpl.
    rewrite IHl'.
    reflexivity. reflexivity.
Qed.

Definition sillyfun1 (n : nat) : bool :=
  if beq_nat n 3 then true
  else if beq_nat n 5 then true
  else false.

Theorem sillyfun1_odd : forall (n : nat),
  sillyfun1 n = true ->
  oddb n = true.
Proof.
  intros n eq. unfold sillyfun1 in eq.
  destruct (beq_nat n 3) eqn:Heqe3.
  - apply beq_nat_true in Heqe3.
    rewrite Heqe3. reflexivity.
  - destruct (beq_nat n 5) eqn:Heqe5.
    + apply beq_nat_true in Heqe5.
      rewrite Heqe5. reflexivity.
    + inversion eq.
Qed.


(* Exercise; 2 stars (destruct_eqn_practice) *)
Theorem bool_fn_applied_thrice_firsttry :
  forall (f : bool -> bool) (b : bool),
  f (f (f b)) = f b.
Proof.
  intros f b.
  destruct (f b) eqn:H1.
  - destruct (f true) eqn:H2.
    + rewrite H2. reflexivity. 
    + rewrite <- H1. destruct b.
      { - symmetry in H2. rewrite H2.  rewrite H1. rewrite H1. reflexivity. }
      { - reflexivity. }
  - destruct (f false) eqn:H2.
    + rewrite <- H1. destruct b.
    { - reflexivity. }
    { - symmetry in H2. rewrite H2. rewrite H1. rewrite H1. reflexivity. }
    + rewrite H2. reflexivity.
Qed.

Theorem bool_fn_applied_thrice :
  forall (f : bool -> bool) (b : bool),
  f (f (f b)) = f b.
Proof.
  intros.
  destruct (f (f b)) eqn:H1.
  - destruct (f b) eqn:H2.
    + rewrite H1. reflexivity.
    + destruct b.
      { - rewrite H2. reflexivity. }
      { - symmetry in H1. rewrite H1. rewrite H2. rewrite H2. reflexivity. }
  - destruct (f b) eqn:H2.
    + destruct b.
      { - symmetry in H1. rewrite H1. rewrite H2. rewrite H2. reflexivity. }
      { - rewrite H2. reflexivity. }
    + rewrite H1. reflexivity.
Qed.


(* Additional Exercises *)

(* Exercise: 3 stars (beq_nat_sym) *)

Theorem beq_nat_sym : forall (n m : nat),
  beq_nat n m = beq_nat m n.
Proof.
  induction n, m.
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - simpl. apply IHn.
Qed.

(* Exercise: 3 stars, optional (beq_nat_trans) *)

Theorem beq_nat_trans_firsttry : forall n m p,
  beq_nat n m = true ->
  beq_nat m p = true ->
  beq_nat n p = true.
Proof.
  intros.
  induction n, m, p.
  - apply H0.
  - apply H0.
  - reflexivity.
  - inversion H.
  - apply H.
  - inversion H.
  - apply H0.
  - simpl in H, H0, IHn. simpl.
    rewrite <- IHn. 
Abort.

Theorem beq_nat_trans : forall n m p,
  beq_nat n m = true ->
  beq_nat m p = true ->
  beq_nat n p = true.
Proof.
  intros n.
  induction n as [| n'].
  - intros m. induction m as [| m'].
    + intros p eq1 eq2. apply eq2.
    + intros p eq1 eq2. inversion eq1.
  - intros m. induction m as [| m'].
    + intros p eq1 eq2. inversion eq1.
    + intros p eq1 eq2. induction p.
      { - inversion eq2. }
      { - simpl. simpl in eq1, eq2. apply IHn' with m'. apply eq1. apply eq2. }
Qed.


Definition split_combine_statement : Prop
  (* (": Prop" means that we are giving a name to a logical proposition here.) *)
:= forall (X:Type) (l1 l2: list X),
  length l1 = length l2 ->
  split (combine l1 l2) = (l1, l2).

Theorem split_combine : split_combine_statement.
Proof.
  unfold split_combine_statement.
  induction l1, l2.
  - reflexivity.
  - intros H. inversion H.
  - intros H. inversion H.
  - intros H. inversion H. simpl in H. 
    simpl. rewrite IHl1.
    + reflexivity.
    + apply H1.
Qed.


(* Exercise: 4 stars, advanced, recommended (forall_exists_challenge) *)
Fixpoint forallb X (test : X -> bool) (l : list X) : bool :=
  match l with
  | [] => true
  | x :: l' => test x && forallb X test l'
  end.

Arguments forallb {X}.

Example test_forallb_1 : forallb oddb [1;3;5;7;9] = true.
Proof. reflexivity. Qed.

Example test_forallb_2 : forallb negb [false;false] = true.
Proof. reflexivity. Qed.

Example test_forallb_3 : forallb evenb [0;2;4;5] = false.
Proof. reflexivity. Qed.

Example test_forallb_4 : forallb (beq_nat 5) [] = true.
Proof. reflexivity. Qed.


Fixpoint existsb X (test : X -> bool) (l : list X) : bool :=
  match l with
  | [] => false
  | x :: l' => test x || existsb X test l'
  end.

Arguments existsb {X}.

Example test_existsb_1 : existsb (beq_nat 5) [0;2;3;6] = false.
Proof. reflexivity. Qed.

Example test_existsb_2 : existsb (andb true) [true;true;false] = true.
Proof. reflexivity. Qed.

Example test_existsb_3 : existsb oddb [1;0;0;0;0;3] = true.
Proof. reflexivity. Qed.

Example test_existsb_4 : existsb evenb [] = false.
Proof. reflexivity. Qed.


Definition existsb' X (test : X -> bool) (l : list X) : bool :=
  negb (forallb (fun x => negb (test x)) l).

Arguments existsb' {X}.

Example test_existsb'_1 : existsb' (beq_nat 5) [0;2;3;6] = false.
Proof. reflexivity. Qed.

Example test_existsb'_2 : existsb' (andb true) [true;true;false] = true.
Proof. reflexivity. Qed.

Example test_existsb'_3 : existsb' oddb [1;0;0;0;0;3] = true.
Proof. reflexivity. Qed.

Example test_existsb'_4 : existsb' evenb [] = false.
Proof. reflexivity. Qed.

Theorem existsb_existsb': forall X (test : X -> bool) (l : list X),
  existsb test l = existsb' test l.
Proof.
  intros.
  induction l.
  - unfold existsb'. reflexivity.
  - simpl. unfold existsb'. symmetry. 
    rewrite <- negb_involutive. apply f_equal. 
    unfold existsb' in IHl. simpl. destruct (test x).
    + reflexivity.
    + simpl. rewrite IHl. rewrite negb_involutive. reflexivity.
Qed.

(* Exercise: 3 stars, advanced (filter_exercise) *)

Lemma filter_single_el : forall (X : Type) (test : X -> bool)
                            (x : X) (l : list X),
  filter test (x :: []) = x :: [] ->
  test x = true.
Proof.
  unfold filter.
  intros.
  destruct (test x) eqn:H1.
  + auto.
Abort.


Lemma list_head_el : forall (X : Type) (x : X) (l1 l2 : list X),
  x :: l1 = x :: l2 ->
  l1 = l2.
Proof.
  intros. induction l1.
  - Search app. rewrite <- app_nil_r.
Admitted.

Lemma filter_single_el_inverse : forall (X : Type) (test : X -> bool) (x : X) (l: list X),
  test x = true ->
  filter test (x :: l) = x :: l.
Proof.
  intros. generalize dependent l.
  induction l.
  - unfold filter. rewrite H. reflexivity.
  - unfold filter. rewrite H.
    destruct (test x0) eqn:H0.
Abort.


(* Exercise: 3 stars, advanced (filter_exercise) 
Theorem filter_exercise : forall (X : Type) (test : X -> bool)
                            (x : X) (l lf : list X),
  filter test l = x :: lf ->
  test x = true.
Proof.
  induction lf.
  - unfold filter.
  - intros. simpl in H. rewrite IHl.
    + auto.
    + simpl. induction (filter test l).
      { - rewrite <- H.
          + reflexivity.
Abort.
*)

(* Exercise: 3 stars, advanced (filter_exercise) *)
Theorem filter_exercise : 
  forall (X : Type) (test : X -> bool) (x : X) (l lf : list X),
  filter test l = x :: lf ->
  test x = true.
Proof.
  intros X test x l lf.
  induction (filter test l).
  - intros H. inversion H. 
  - induction (x :: lf).
    + intros H. inversion H.
    + intros H. inversion H. apply IHl1.
      * intros H3. apply IHl0.
     
    +  unfold filter. destruct (test x).
    + reflexivity.
    + 

(* Semi successful

  intros.
  induction (filter test l).
  - inversion H.
  - inversion H. rewrite H2 in IHl0. 
    induction (test x).
    + auto.
    + apply IHl0. 
    + inversion H. rewrite H2. rewrite <- H. symmetry in H2.
    
    rewrite H2 in H. rewrite H2.
  
  
  destruct (test x) eqn:H1.
    + auto.
    + rewrite <- H1 in IHl0. rewrite <- H1.
  
  inversion H. apply IHl0. rewrite <- H1. rewrite <- H2. rewrite H.  
  
  
  - simpl. destruct (test x0) eqn:H1.
    + rewrite <- H1. rewrite f_equal as x.
    + destruct (test x0) eqn:H2.
      { - intros. rewrite IHl.
    destruct (test x) as [] eqn:H2.
    + auto.
    + simpl.
    
      
      assumption.
      
    simpl in IHl.
    rewrite <- H in IHl.
    rewrite IHl.
    + reflexivity.
    + apply f_equal.



** End Gave Up *)
























