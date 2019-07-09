
Require Import Arith.EqNat.
Require Import List.

Fixpoint fib (n: nat) :=
  match n with
    | O => S O
    | S m => match m with
      | O => S O
      | S k => fib m + fib k
    end
  end.

Fixpoint bgt_nat (a b: nat) :=
  match a, b with
    | S x, S y => bgt_nat x y
    | S _, O   => true
    | _,   _   => false
  end.

Definition max_fib_le (n: nat) :=  
  let fix loop (t a b: nat) {struct t} := 
    match t with
      | O => a
      | S t' => if bgt_nat b n then a else loop t' b (a+b)
    end
    in loop n 1 1.

Lemma not_zero_max_fib_le: forall n: nat, max_fib_le n > O.
Proof.
  intros; unfold max_fib_le.
  induction n.
    auto.
    Admitted.


Definition ze (n: nat) :=
  let fix loop (t n: nat) :=
    match t with
      | O => nil
      | S t' =>
        let m := max_fib_le n
          in m :: if beq_nat m n then nil else loop t' (n-m)
    end
    in loop n n.

Eval cbv in (ze 123).
Eval cbv in (89+34).

Definition lst_sum (xs: list nat) :=
  fold_left (fun x y => x + y) xs 0.

Theorem ze_correct: forall n: nat, lst_sum (ze n) = n.
Proof.
  intros.
  induction n.
    trivial.
    (* max_fib_le (S n)
    *)   
    unfold lst_sum, ze. 

(*
Require Import Program.Wf.

Program Fixpoint ze (n: nat) {measure id n} :=
  if beq_nat n 0 then nil
    else let m := max_fib_le n
      in m :: if beq_nat m n then nil else ze (n-m).
Obligation 1.
  Proof.
    unfold id.
    generalize (max_fib_le n).
Print id.
    simpl.

*)