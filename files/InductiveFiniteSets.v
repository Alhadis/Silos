Require Import  Eqdep_dec Image Peano_dec Arith.

(** Inductive Finite Types *)

Set Implicit Arguments.

 Inductive Fin : nat -> Set :=
 | fz : forall n, Fin (S n)
 | fs : forall n, Fin n -> Fin (S n).

 Derive Inversion FinO_rect with (Fin 0) Sort Type.

 (* fs /fz View *)
 Inductive FinSN (n : nat) : Fin (S n) -> Set :=
  | isfz : FinSN  (fz n)
  | isfs : forall i, FinSN  (fs i).


 Definition finSN (n : nat) (i : Fin (S n)) : FinSN i :=
   match i in (Fin k) return match k return Fin k -> Set with
                             | O => fun _ => unit
                             | S n' => @FinSN _
                             end i with 
   | fz _ => isfz _
   | fs _ j => isfs  j
   end.

 Definition FinSn_rect :  forall n,  forall (P:Fin (S n)->Type), 
                   (forall y:Fin n, P (fs y)) ->  P (fz n)  -> forall x, P x :=
 fun n P H0 H1 x => match (finSN x) in (FinSN  e) return (P e) with
                    | isfz => H1
                    | isfs i => (H0 i)
                    end.

 Lemma fsInject : forall n, forall x y:Fin n, (fs x)=(fs y) -> x=y.
 Proof.
  induction x; intro y. destruct (finSN y); trivial.
  intro H; try discriminate H.
   destruct (finSN y).
  intro H; try discriminate H.
  intro H; injection H.
   intro H0; 
    rewrite (inj_pair2_eq_dec _  eq_nat_dec (fun n : nat => Fin n) n x i H0);
    trivial.
Qed.

Hint Resolve fsInject : fin_scope.

Lemma FinDecideEquality : forall n, forall (x y:Fin n), {x=y}+{x<>y}.
Proof.
  induction x. intro y ; destruct (finSN y) ; auto.
  try (right;  discriminate).
  intro y; destruct (finSN y).
  right; discriminate.
  destruct (IHx i); subst.
  left ; trivial.
  right; intuition. 
Defined.

Lemma FinForallOrExist : forall n (P Q:Fin n->Prop), 
                  (forall x, {P x}+{Q x}) -> {x:Fin n | P x}+{forall x, Q x}.
Proof.
induction n. intros; right; inversion x.
intros P Q H. destruct (H ( fz n)).
left; exists (fz n); auto.
destruct (IHn (fun x=>(P (fs x))) (fun x=>(Q (fs x))) (fun x=> (H (fs x)))).
destruct s. left; exists (fs x); auto.
right. intros x; destruct x using FinSn_rect; auto.
Defined.
 
 (* boolean equality for finite sets*)
  Fixpoint eqFin (n :nat) (i : Fin n)  {struct i}: Fin n -> bool :=
     match i in Fin e return (Fin e -> bool) with
     | fz _  => fun j => match (finSN j) with
                    | isfz => true
                    | isfs _ => false
                   end
     | fs _ k => fun j => match (finSN j) with
                      | isfz => false 
                      | isfs k' => eqFin k k'
                     end
    end.

 Lemma eqFin_ok : forall n (i j : Fin n), eqFin i j = true -> i = j.
 Proof.
   induction i; simpl. intros j; destruct (finSN j);
   try (intro h; discriminate h); trivial. 
    intro j; destruct (finSN j); try (intro h; discriminate h).
    intro h; rewrite (IHi i0 h); trivial.
 Qed.  


(* boolean less or equal for finite sets *)
Fixpoint lefin (n : nat) (i  : Fin n) {struct i}: Fin n -> bool :=
 match i as e in (Fin n) return (Fin n -> bool) with
 | fz _  => fun _ => true
 | fs _ i' => fun x => 
      match (finSN x) with
      | isfs z  =>  lefin i' z
      |  _   => false  
      end
 end.

 (* inductive less or equal *)
 Inductive Lefin : forall n, Fin n -> Fin n -> Set :=
   | leq  : forall n, Lefin (fz n) (fz n)
   | lefz : forall n ( i : Fin n) , Lefin (fz n) (fs i)
   | lefs : forall n (i j : Fin n), Lefin i j -> Lefin (fs i) (fs j).
 (*Infix " x =<= y " := Lefin (at level 30) : fin.*)

 Lemma Le_refl : forall n (i : Fin n), Lefin i i.
 Proof.
   induction i; try apply leq.
   exact (lefs IHi).
 Qed.

 Lemma Le_fs_inj : forall n (i j : Fin n), Lefin (fs i) (fs j) -> Lefin i j.
 Proof.
   intros n i j H; try inversion H.
  rewrite <- (inj_pair2_eq_dec  _ eq_nat_dec  (fun n : nat => Fin n) n i0 i  H1);
  rewrite <- (inj_pair2_eq_dec  _ eq_nat_dec  (fun n : nat => Fin n) n j0 j  H2);
  trivial.
 Qed.
  
 Lemma Le_trans : 
   forall n (i j k: Fin n), Lefin i j -> Lefin j k -> Lefin i k.
 Proof.
   induction i. destruct j using FinSn_rect.
   destruct k using FinSn_rect. intros.
   apply lefz. intros. inversion H0.
   destruct k using FinSn_rect.
   intros. apply lefz.
   intros. apply leq. destruct j using FinSn_rect;
   destruct k using FinSn_rect.
   intros H H1. exact (lefs (IHi _ _ (Le_fs_inj H) (Le_fs_inj H1)) ).
   intros. inversion H0.
   intros. inversion H.
   intros. inversion H.
 Qed.

 (* inductive Le correspond to the boolean le*)
 Lemma Le_ind_bool : forall n (i j : Fin n), Lefin i j -> lefin i j = true.
 Proof.
   induction i. destruct j using FinSn_rect; simpl; auto.
   destruct j using FinSn_rect; simpl; auto.
   intros. exact (IHi _ (Le_fs_inj H)).
   intros. inversion H.
  Qed.
   

(* Fin 0 is empty *)
 Lemma fin_0_empty: (Fin 0) -> False.
 Proof.
  intro i; inversion i.
 Qed.

 (* the natural number represented by Fin n*)
 Fixpoint foo  n (i : Fin n)  :=
     match i with
     | fz _ => 0
     | fs _ i => S (foo i)
    end.

 Fixpoint nat_finite (n:nat) k : k<n -> Fin n :=
 match n return ( k<n -> Fin n) with
  O => fun (h:k<O)  =>
         match (lt_n_O k h) return (Fin 0) with end
 | (S n') =>   match k return (k<(S n') -> Fin (S n')) with
                O => fun _ => (fz n')
              | (S k') => fun h:S k' < S n' =>
                            fs (nat_finite (lt_S_n _ _ h))
              end
 end.

Implicit Arguments nat_finite [n].


Lemma nat_finite_id:
  forall (n k:nat)(h:k<n), (foo (nat_finite k h)) = k.
Proof.
 induction n.
 intros k h; destruct (lt_n_O k h).
 induction k;  auto.
 exact (fun h => f_equal S (IHn k (lt_S_n k n h))).
Qed.

 Fixpoint finite_lt_n (n : nat) (i : Fin n) : (foo i) < n :=
   match i as e in Fin m return (foo e) < m with
   | fz x => lt_O_Sn x
   | fs _ j => lt_n_S (foo j) _ (finite_lt_n j)
   end.

 Definition finite_le_n (n : nat) (i : Fin n) :=
    lt_le_weak _ _ (finite_lt_n i). 
   

Lemma finite_nat_id_general:
  forall (n:nat)(i:Fin n)(h:(foo i)<n),  (nat_finite (foo i) h) = i.
Proof.
 induction i; auto;
 try (intro h; simpl; rewrite IHi; auto).
Qed.

Lemma finite_nat_id:
  forall (n:nat)(i:Fin n), (nat_finite (foo i) (finite_lt_n i)) = i.
Proof.
 intros; apply finite_nat_id_general; auto.
Qed.

(* similarity *)

 (* turn (forall n, Fin n -> Fin n) to  N x N -> N *)
 Definition FinFn (H : forall n, Fin n -> Fin n) := 
     fun n m => match le_lt_dec n m  with
                | left _ => 0
                | right l => foo (H _ (nat_finite m l))
                end.


 Definition FinFn1 (f : nat -> nat) (H : forall n, Fin (f n) -> Fin n) := 
     fun n m => match le_lt_dec (f n) m  with
                | left _ => 0
                | right l => foo (H _ (nat_finite m l))
                end.

 Definition FinFnEx 
   (f : nat -> nat) (H : forall n, Fin (f n) -> Fin n) :
      forall n, {k | k < f n} -> Fin n :=
   fun n ex => let (_, l) := ex in  H n (nat_finite _ l).

 Definition FinFn_inv (H : nat -> nat -> nat) : forall n, Fin n -> Fin n :=
   fun n i =>   match le_lt_dec n (H n (foo i)) with
                | left _ => i
                | right l => nat_finite (H n (foo i)) l
                end .


 (* correctness *)
 Lemma foo_not_le : forall n (i : Fin n), ~ n <= foo i.
   induction i; simpl; auto with arith.
 Qed.

  Lemma FinFn_l (H : forall n, Fin n -> Fin n) :
              forall n (i : Fin n),   FinFn_inv (FinFn H)  i =  H n i .
  Proof.
   unfold FinFn_inv; unfold FinFn; simpl; intros.
   destruct (le_lt_dec n (foo i)); simpl.
   case (foo_not_le i l).
   rewrite (finite_nat_id_general i l).
   destruct (le_lt_dec n (foo (H n i)) ).
   case (foo_not_le (H n i) l0 ).  
   apply (finite_nat_id_general (H n i) l0 ).
 Qed.

 Lemma FinFn_l1 (H : nat -> nat -> nat) :
       forall n m, m < n -> H n m < n ->  FinFn (FinFn_inv H) n m   =  H n m .
 Proof.
   unfold FinFn; unfold FinFn_inv; intros.
   destruct (le_lt_dec n m) as [ l | r ].
   case (le_not_lt _ _ l H0).
   rewrite (nat_finite_id r).
   destruct (le_lt_dec n (H n m ));
   [case (le_not_lt _ _ l H1) | apply (nat_finite_id l)].
  Qed.

 (* the conversions preserves equality *)
 Lemma FinFn_eq_ok : forall (h h1 : forall n, Fin n -> Fin n), h  = h1 -> 
   FinFn h = FinFn h1.
  Proof.
    intros h h1 H; destruct H; trivial.
  Qed.

 Lemma FinFn_inv_eq_ok : forall (h h1 : nat -> nat -> nat), h = h1 ->
    FinFn_inv h  = FinFn_inv h1.
  Proof.
   intros h h1 H; destruct H; trivial.
 Qed.
   

