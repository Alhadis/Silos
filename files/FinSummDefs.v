Require Import Arith Substitution JMeq Containers.
Require Export FiniteTypes.

(** * Repeated Sums of Finite Types  *)

Definition Lst := ucont Fin.

Set Implicit Arguments.

Section FinSumm_defs.

(** summing a vector of nats  *)
Fixpoint sum_n (n : nat) :  (Fin n -> nat) -> nat :=
  match n as e return (Fin e -> nat) -> nat with  
  | O => fun _ => 0
  | S n' => fun f => f (fz n') + sum_n (fun i => f (fs i))
  end.

Lemma f_emb : forall (n : nat) (f : Fin (S n) -> nat) ,
   f (tp n) + sum_n (fun i : Fin n => f (emb (rv i))) =
  sum_n  (fun i : Fin n => f (fs (rv i))) + f (fz n) .
 Proof. 
  induction n; simpl; auto.
  intro f; rewrite (IHn (fun i : Fin (S n) => f (emb i)) ).
  rewrite (plus_assoc_reverse
  (f (fs (tp n)))
  (sum_n (fun i : Fin n => f (fs (emb (rv i)))))
  (f (fz (S n)))
   ); reflexivity.
Qed.

Lemma sum_n_rv (n : nat) (f : Fin n -> nat) : sum_n (fun i : Fin n => f (rv i)) = sum_n f.
Proof.
  induction n; simpl; trivial.
  intro f; rewrite <-  (IHn (fun x : Fin n => f (fs x)) ).
  rewrite  (plus_comm (f (fz n)) (sum_n (fun i : Fin n => f (fs (rv i))))).
  apply (f_emb f).
 Qed.


Lemma sum_nm (n m : nat) (f : Fin n -> nat) (g : Fin m -> nat) : 
          sum_n (fun i : Fin (n + m) =>
                match FinCase n m i with
                | inl z => f z
                | inr z => g z
                end) = sum_n f + sum_n g.
Proof.
  intros n m f0 g0. induction n. 
  simpl. 
  rewrite (extensionality (fun i : Fin m => g0 i) g0 (fun i : Fin m => refl_equal (g0 i))); 
  reflexivity. simpl.
  rewrite <-  (extensionality 
                       (fun i : Fin (n + m) =>
                         match FinCase n m i with
                         | inl z => f0 (fs z)
			 | inr z => g0 z
                         end) 
                          (fun i : Fin (n + m) => 
                          match FinCase (S n) m (fs i) with
			  | inl z => f0 z 
			  | inr z => g0 z
			  end) (fincaseS f0 g0 )
                        ). 
  rewrite (IHn (fun i : Fin n => f0 (fs i)) ).
  rewrite <- plus_assoc; trivial.
Qed. 

Lemma sumLastLem (n : nat) (F : Fin (S n) -> nat) :
    sum_n F = sum_n (fun i => F (emb i)) + F (tp n).
Proof.
  intros n F; induction n; simpl.
  apply (sym_equal (plus_n_O (F (fz 0)))).
  rewrite (plus_assoc_reverse (F (fz (S n)))
       (sum_n (fun i : Fin n => F (fs (emb i))))
       (F (fs (tp n)))).  
 rewrite <- (IHn (fun i => F (fs i))); trivial.
Qed.

 Lemma sumLem (n : nat) (F : Fin (S n) -> nat) :
     sum_n F  =  F (tp n) +  sum_n (fun i0 : Fin n => F (emb (rv i0))).
 Proof.
 induction n; simpl; trivial. 
 intro F.
 generalize (IHn (fun i => F (emb i))).
 intro H; simpl in H.
 rewrite <- H.
 rewrite (plus_permute (F (fs (tp n)))
          (F (fz (S n))) (sum_n (fun i : Fin n => F (fs (emb i)))) ).
 set (R := sumLastLem (fun i => F (fs i))); simpl in R;
 rewrite (trans_equal R
    (plus_comm (sum_n (fun i => F (fs (emb i)))) (F (fs (tp n))))); trivial.
Qed.

  
Fixpoint finj' (n : nat) (i : Fin n)  :  
       forall f : Fin n -> nat,  Fin (f i) -> Fin (sum_n f) :=
   match i in Fin e return  forall f : Fin e -> nat, Fin (f i) -> Fin (sum_n f) with
   | fz m => fun f k => fin_inl  (sum_n (fun z : Fin m => f (fs z))) k
   | fs m x => fun f k => fin_inr (f (fz m)) (finj' x (fun z => f (fs z)) k)
   end.

 Definition finj (n : nat) ( f : Fin n -> nat) (i : Fin n)  :  
        Fin (f i) -> Fin (sum_n f) := fun x => finj' i f x.
  

(** View for repeated sums *)
Inductive FinSumm (n : nat) (f : Fin n -> nat) : Fin (sum_n f) -> Set :=
  finPair : forall (i: Fin n) (k : Fin (f i)), FinSumm f (finj f i k).

 Fixpoint finSumm n : forall (f: Fin n -> nat) (x : Fin (sum_n f)),  FinSumm f x :=
  match n as e return (forall (f: Fin e -> nat) (x : Fin (sum_n f)),  FinSumm f x) with
  | O => fun f x => nofin (FinSumm f x) x
  | S n0 => fun f0 (x0 : Fin (sum_n f0)) =>
      let f1 := finsplit (f0 (fz n0)) (sum_n (fun i : Fin n0 => f0 (fs i))) x0 in
     match f1 in (FinSum _ _ f2) return (FinSumm f0 f2) with
     | is_inl i => finPair f0 (fz n0) i
     | is_inr j => let f2 := finSumm (fun a : Fin n0 => f0 (fs a)) j in
        match f2 in (FinSumm _ f3) return (FinSumm f0 (fin_inr (f0 (fz n0)) f3)) with
        | finPair x1 fx => finPair f0 (fs x1) fx
        end
     end
  end. 

(** * Results *)
Lemma finjF (n : nat) (i : Fin n) (f : Fin n -> nat) 
     (f1 f2 : Fin (f i)) : finj f i f1 = finj f i f2 -> f1 = f2.
Proof.
 intros n i f0 ff1 f2 H; induction  i; simpl in H.
 apply (fin_inl_inject (sum_n (fun z : Fin n => f0 (fs z))) ff1 f2 H).
 apply (IHi (fun a : Fin n => f0 (fs a)) ff1 f2 
   (fin_inr_inject (f0 (fz n)) (finj (fun z : Fin n => f0 (fs z)) i ff1) 
      (finj (fun z : Fin n => f0 (fs z)) i f2) H)).
Qed. 

Lemma finj_inj (n : nat)  (i j: Fin n) (f : Fin n -> nat) (fi : Fin (f i)) 
  (fj : Fin (f j)) :  finj f i fi =  finj f j  fj -> i = j  /\ JMeq fi fj .
Proof.
 intros n i j f0 f0i f0j H; induction i. 
 destruct j using FinSn_rect. 
 case (fin_inl_inr f0i (finj  (fun z : Fin n => f0 (fs z)) j f0j) H).
 rewrite (finjF (fz n) f0 f0i f0j H); auto.
 destruct j using FinSn_rect.
 destruct (IHi j (fun a : Fin n => f0 (fs a)) f0i f0j
 (fin_inr_inject (f0 (fz n)) (finj (fun z : Fin n => f0 (fs z)) i f0i) (finj (fun z : Fin n => f0 (fs z)) j f0j) H)).
 split; congruence.
 case (fin_inl_inr f0j (finj (fun z : Fin n =>f0 (fs z)) i f0i) (sym_equal H)).
Qed.

Lemma finSumm_uniq (n : nat) (f : Fin n -> nat) (i : Fin n) (k : Fin (f i))
     (fx :FinSumm f (finj f i k)) : fx  = finSumm f (finj f i k) .
Proof.
  intros n f i k fx; destruct fx.
  induction i0; simpl.
  rewrite (finsplit_inl (sum_n (fun i0 : Fin n => f (fs i0))) k0); trivial.
  rewrite (finsplit_inr (f (fz n)) (finj (fun z: Fin n => f (fs z)) i0 k0)).
  rewrite <- (IHi0 (fun a : Fin n => f (fs a)) i0 k0); trivial.
Qed. 

Lemma finjFmLem (n : nat ) (F : Fin (S n) -> nat) (j : Fin (F (tp n))) : 
            JMeq (finj F (tp n) j) (fin_inr (sum_n (fun i  => F (emb i)))  j).
Proof.
 intros; induction n; simpl.
 exact (fin_inl_O  j).
  apply  (dp_rwt Fin (fun (a : nat) (fn : Fin a) =>
          JMeq (fin_inr (F (fz (S n)))  fn) 
                    (fin_inr (F (fz (S n)) + sum_n (fun i => F (fs (emb i)))) j))
             (sym_equal (sumLastLem (fun x => F (fs x)))) 
      (sym_JMeq (IHn (fun i => F (fs i)) j)) ).
 apply (fin_inr_inr (F (fz (S n))) (sum_n (fun i => F (fs (emb i)))) j).
Qed.
   
 Lemma finjFmLem2 (n : nat ) (F : Fin (S n) -> nat)  (i : Fin n) 
    (j : Fin (F (emb i))) (jt : Fin (F (tp n))) : 
 JMeq (finj F (emb i) j) (fin_inr (sum_n (fun i  => F (emb (rv i))))  jt) -> False . 
 Proof.
  intros n F i j jt; induction i; simpl in *. 
  set (R := f_emb (fun i => F (emb i))) ; simpl in R; rewrite R; clear R.
  set (R := sumLem (fun i => F (fs i)) ); simpl in R.
  intro H; rewrite (plus_comm (sum_n (fun i : Fin n => F (fs (emb (rv i))))) (F (fz (S n))))in H . 
  case (fin_inl_inrN (F (fs (fz n))) (sum_n (fun i : Fin n => F (fs (fs i)))) 
        (sum_n (fun i : Fin n => F (fs (emb (rv i))))) 
        (trans_equal R (plus_comm (F (fs (tp n))) (sum_n (fun i => F (fs (emb (rv i)))))))
         j jt H).
  set (R := sumLem (fun i => F (emb i))); simpl in R; rewrite <- R; clear R .
  set (R := sumLastLem (fun i => F (fs i))); simpl in R.
  set (R' := sum_n_rv (fun i => F (fs  i))); simpl in R'.
  rewrite <- ( plus_reg_l (sum_n (fun i : Fin n => F (fs (emb (rv i))))) 
                      (sum_n (fun i : Fin n => F (fs (emb i)))) (F (fs (tp n)))
          (trans_equal 
          (sym_equal (trans_equal (sym_equal R) (sym_equal R')))
          (plus_comm (sum_n (fun i : Fin n => F (fs (emb  i))))  (F (fs (tp n)))))) .
  apply (fun H =>  fin_inr_inrPlus (F (fz (S n))) (F (fs (fz n))) (sum_n (fun i : Fin n => F (fs (fs i))))
            (sum_n (fun i0 : Fin n => F (fs (emb (rv i0)))))
         (trans_equal (sym_equal R') (plus_comm (F (fs (tp n))) (sum_n (fun i : Fin n => F (fs (emb (rv i))))))) 
           jt (IHi (fun i => F (fs i)) j jt) H).
 Qed.

Lemma finjFmLem3 (n : nat ) (F : Fin (S n) -> nat)  (i : Fin n) (j : Fin (F (emb i))): 
            JMeq (finj F (emb i) j) (fin_inl  (F (tp n))
               (finj (fun i => F (emb i)) i j )).
 Proof.
 intros n F i j. induction i; simpl. 
 set ( R := sumLastLem (fun i => F (fs i)) ); simpl in R; rewrite R.
 apply (finl_inl_inlx (sum_n (fun i : Fin n => F (fs (emb i)))) (F (fs (tp n))) j).
 set ( R := sumLastLem (fun i => F (fs i)) ); simpl in R.
 set (X := IHi (fun i => F (fs i)) j); simpl in X.
 apply (dp_rwt Fin (fun (x : nat) (fx : Fin x) => 
            JMeq
     (fin_inr (F (fz (S n)))  fx)
     (fin_inl (*F (fz (S n)) + sum_n (fun i0 : Fin n => F (fs (emb i0))) *)
        (F (fs (tp n)))
        (fin_inr (F (fz (S n))) 
           (finj (fun z : Fin n => F (fs (emb z))) i j))))
       (sym_equal R) (sym_JMeq X) ).
  set (x := F (fz (S n))); induction x; simpl; trivial.
 apply ( fin_fs (plus_assoc_reverse x (sum_n (fun i : Fin n => F (fs (emb i)))) (F (fs (tp n))))
            IHx ).
Qed.
  
Lemma finjLem (n : nat) (F : Fin n -> nat) (i : Fin n) (fi : Fin (F i)) (j : Fin n) (rj : Fin (F (rv j))) :
         JMeq (finj F i fi) (rv (finj (fun z  => F (rv z)) j rj)) ->
           i = (rv j)   /\ JMeq fi (rv rj)  . 
Proof.
  intros n F i fi j rj H.
  induction j.
  destruct (finEmtp i). 
  split; trivial.
  simpl in *.
  generalize (trans_JMeq H (rvFin_inl (sum_n (fun z => F (emb (rv z)))) rj)). 
  clear H; intro H; generalize (trans_JMeq (sym_JMeq (finjFmLem F fi)) H); clear H.
  intro H; rewrite (sum_n_rv (fun i => F (emb i))) in H.
  case (fin_inr_inject (sum_n (fun i => F (emb i))) fi (rv rj) (JMeq_eq H)); trivial.
  generalize (trans_JMeq H (rvFin_inl (sum_n (fun z => F (emb (rv z)))) rj)).
  clear H; intro H; simpl in *.
  case (finjFmLem2 F i fi (rv rj) H ).
  destruct (finEmtp i); simpl in *.
  generalize (trans_JMeq H (rvFin_inr (F (tp n))
             (finj (fun z : Fin n => F (emb (rv z))) j rj))); 
  clear H; intro  H.
  set (P := trans_JMeq (sym_JMeq (finjFmLem F fi)) H).  
  set (R := sumLastLem F); simpl in R.
  set (R' := sum_n_rv F ); simpl in R'.
  rewrite <- ( plus_reg_l (sum_n (fun i : Fin n => F (emb (rv i)))) 
                      (sum_n (fun i : Fin n => F (emb i))) (F (tp n)) 
          (trans_equal 
          (sym_equal (trans_equal (sym_equal R) (sym_equal R')))
          (plus_comm (sum_n (fun i : Fin n => F (emb  i)))  (F (tp n))))) in P .
  case (finsplit_inl_inr (rv (finj (fun z : Fin n => F (emb (rv z))) j rj)) fi (sym_equal (JMeq_eq P))).
  generalize (trans_JMeq H (rvFin_inr (F (tp n)) (finj (fun z : Fin n => F (emb (rv z))) j rj))); clear H.
  intro H; generalize (trans_JMeq (sym_JMeq H) (finjFmLem3 F i fi)); clear H; intro H.
  set (R := sumLastLem F); simpl in R.
  set (R' := sum_n_rv F ); simpl in R'.
  destruct ((IHj (fun i => F (emb i)) i fi rj)  (sym_JMeq (fin_inl_JM (F (tp n))
          ( plus_reg_l (sum_n (fun i : Fin n => F (emb (rv i)))) (sum_n (fun i : Fin n => F (emb i))) (F (tp n)) 
          (trans_equal (sym_equal (trans_equal (sym_equal R) (sym_equal R')))
          (plus_comm (sum_n (fun i : Fin n => F (emb  i)))  (F (tp n)))))
          (rv (finj (fun z : Fin n => F (emb (rv z))) j rj))
          (finj (fun i : Fin n => F (emb i)) i fi)  H )));
  split; auto.
  rewrite <- H0; trivial.
  Qed.
 
Axiom  jm_ext  : forall ( X A B: Set)  
                           (f : A -> X) (g : B -> X) ,  
                          (forall (a: A) (b : B), JMeq a b  -> f  a = g b) -> JMeq f g.

Lemma Fnm (n m : nat)(i : Fin n)  (F : Fin (S n) -> nat) (G : Fin m -> nat) (FG : Fin (S n + m) -> nat)
   (H : FG = fun x : Fin (S n + m) =>
          match FinCase (S n) m (fin_inl  m (fs i))  with
          | inl z => F z
          | inr z => G z
          end)
   : 
   (forall (x : Fin n) (b : Fin (S n)), b = fs x) ->   JMeq FG  F . 
 intros.
 apply jm_ext.
 rewrite  H.
 intros.
 rewrite  (FinCase_inl m (fs i)).
 case  (H0 i b); trivial.
Qed.
 
Lemma finjInl_fz (n m : nat) (F  :Fin (S n) -> nat)(G : Fin m -> nat) (j : Fin (F(fz n))) :
 JMeq
     (fin_inl 
        (sum_n (fun  z : Fin(n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end)) j)
     (fin_inl 
        (sum_n G) (fin_inl (sum_n (fun z : Fin n => F (fs z))) j)).
 Proof.
   intros.
   induction j; simpl.
   set (R := sum_nm (fun z : Fin n => F (fs z)) G ); simpl in R.
   apply (eq_subs (fun x : nat =>  JMeq
     (fz( n0 + (sum_n
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end))))
     (fz x) )
   (plus_assoc  n0 (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) ).
    rewrite (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) in R; 
   rewrite  R; trivial.
   set (R := sum_nm F G ); simpl in R.
   rewrite <-  (plus_assoc ( F (fz n)) (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) in R.
   apply  (fin_fs  (sym_equal (trans_equal (f_equal (plus n0)  ( plus_reg_l ( sum_n
         (fun i : Fin (n + m) =>
         match FinCase (S n) m (fs i) with
         | inl z => F z
         | inr z => G z
         end)) (sum_n (fun i : Fin n => F (fs i)) + sum_n G) (F (fz n)) R ))
         (plus_assoc  n0  (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) )
         ) IHj).
   Qed.

Lemma finj_f (n : nat) (F G : Fin n -> nat) (H : F = G) (i : Fin n) 
             (fi : Fin (F i)) (gi : Fin (G i)) :
             JMeq fi gi -> JMeq (finj F i fi) (finj G i gi).
Proof.
  intros n F G H; case H.
  intros i fi gi H1; 
  case (JMeq_eq H1);
  trivial.
Qed.
 
Definition finJmeq (n m : nat) (H : n = m) (i: Fin n) :
   JMeq i (eq_subs (fun x : nat => Fin x) H i).
 intros n m H; case H.
 intro i; auto.
Qed. 

Lemma finjInl_Inl (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat) (i  : Fin n) 
      (Fj : Fin (F i))
     (k : Fin  match FinCase n m (fin_inl  m i) with
        | inl z => F  z
        | inr z => G  z
        end )  : JMeq Fj k ->
 JMeq (finj (fun a : Fin (n + m) =>
       match FinCase n m a with
       | inl z => F z
       | inr z => G z
       end) (fin_inl  m i) k) (fin_inl (sum_n G) (finj F i Fj)). 
 Proof.
 intros n m F G i  Fj k H .
 induction i; simpl in *.
 case (JMeq_eq H).
 apply (finjInl_fz  F G Fj).
 simpl in *.
 set (R := sum_nm F G); simpl in R. 
 rewrite <-  (plus_assoc ( F (fz n)) (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) in R.
 set (R1 := eq_subs (fun FF : Fin (n +m) -> nat =>  sum_n FF =  sum_n  (fun z : Fin (n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end) )
  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
     (refl_equal(sum_n
          (fun z : Fin (n + m) =>
           match FinCase (S n) m (fs z) with
           | inl z0 => F z0
           | inr z0 => G z0
           end)))); simpl in R1.
 apply  (dp_rwt Fin (fun (x : nat ) (fx : Fin x) => 
          JMeq
     (fin_inr (F (fz n))  fx)
     (fin_inl  
        (sum_n G)
        (fin_inr (F (fz n)) 
           (finj (fun z : Fin n => F (fs z)) i Fj)))) R1   
      (sym_JMeq (finj_f  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
      (fin_inl  m i) 
    (finJmeq (sym_equal (fincaseS F G (fin_inl  m i))) k))) ).
 rewrite <- R1 in R.
 apply (dp_rwt Fin (fun (x : nat) (fx : Fin x) =>
         JMeq
     (fin_inr (F (fz n))  fx)
     (fin_inl  
        (sum_n G)
        (fin_inr (F (fz n)) 
           (finj (fun z : Fin n => F (fs z)) i Fj))))
      (sym_equal ( plus_reg_l ( sum_n
        (fun i : Fin (n + m) =>
         match FinCase n m  i with
         | inl z => F (fs z)
         | inr z => G z
         end))  (sum_n (fun i : Fin n => F (fs i)) + sum_n G) (F (fz n)) R ))
 (sym_JMeq   (IHi (fun i : Fin n => F (fs i)) Fj 
   (eq_subs (fun x : nat => Fin x) (sym_equal (fincaseS F G (fin_inl  m i))) k )
    (trans_JMeq H (finJmeq (sym_equal (fincaseS F G (fin_inl  m i))) k ))
    ))
). clear H ; clear R; clear R1.
set (Y := F (fz n)).
induction Y; simpl; trivial.
apply (fin_fs  
     (sym_equal (plus_assoc Y (sum_n (fun i : Fin n => F (fs i))) (sum_n G)))
     IHY).
Qed.

Lemma fincF (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat) (i : Fin n) : 
   (match FinCase n m (fin_inl  m i ) with
        | inl z => F z
        | inr z => G z
        end) = (F i).
 Proof.
  intros n m F G i.
  rewrite (FinCase_inl m i);
  trivial.
Qed.
  

Lemma finjInlr_false (n m : nat) (F : Fin (S n) -> nat) (G : Fin m -> nat) 
  (j : Fin n ) (Fj : Fin (F (fz n)))
  ( k : Fin
        match FinCase (S n) m (fin_inl m (fs j)) with
        | inl z => F z
        | inr z => G z
        end ):

 JMeq
     (finj
        (fun a : Fin (S n + m) =>
         match FinCase (S n) m a with
         | inl z => F z
         | inr z => G z
         end) (fin_inl  m (fs j)) k)
     (fin_inl  (sum_n G) (finj F (fz n) Fj)) -> False.
 Proof.
   intros n m F G j Fj k ; destruct j; simpl. intro H. 
  set  (H1 :=  trans_JMeq (sym_JMeq H)  (fin_inr_inlJm (F (fz (S n))) (sum_n
           (fun i : Fin (n + m) =>
            match FinCase (S (S n)) m (fs (fs i)) with
            | inl z => F z
            | inr z => G z
            end)) k)). 
  rewrite  (extensionality (fun i : Fin (n + m) =>
                match FinCase (S (S n)) m (fs (fs i)) with
                | inl z => F z
                | inr z => G z
                end)
               (fun i : Fin (n + m) =>
                match FinCase n m  i with
                | inl z => F (fs (fs z))
                | inr z => G z
                end) ) in H1.
  rewrite (sum_nm (fun i : Fin n => F (fs (fs i))) G) in H1.
  case  (fin_inl_inl_inr1 (sum_n (fun i : Fin n => F (fs (fs i))))
            (sum_n G) (fincF F G (fs (fz n)) )  Fj k H1 ).
  intro a.
  destruct (finsplit n m a).
   set (R := FinCase_inl m  (fs (fs i))); simpl in R; rewrite R.
  rewrite (FinCase_inl m i); trivial.
  set (R := FinCase_inr (S (S n)) j); simpl in R; rewrite R.
  rewrite (FinCase_inr n j); trivial.
  intro H.
   set (R := sum_nm (fun i => (F (fs (fs i)))) G); simpl in R.
   rewrite <- (extensionality (fun i : Fin (n + m) =>
                match FinCase (S (S n)) m (fs (fs i)) with
                | inl z => F z
                | inr z => G z
                end)
               (fun i : Fin (n + m) =>
                match FinCase n m  i with
                | inl z => F (fs (fs z))
                | inr z => G z
                end) ) in R.
  case (fin_inl_inr_lr (F (fs (fz n)))
        (sum_n (fun i : Fin n => F (fs (fs i))))
        (sum_n G)
        R    (finj
                 (fun z : Fin (n + m) =>
                  match FinCase (S (S n)) m (fs (fs z)) with
                  | inl z0 => F z0
                  | inr z0 => G z0
                  end) (fin_inl  m j) k)  Fj H).
   intro a.
  destruct (finsplit n m a).
   set (R1 := FinCase_inl m  (fs (fs i))); simpl in R1; rewrite R1.
  rewrite (FinCase_inl m i); trivial.
  set (R1 := FinCase_inr (S (S n)) j0); simpl in R1; rewrite R1.
  rewrite (FinCase_inr n j0); trivial.
Qed.

Lemma finjInl_false (n m : nat) (F : Fin (S n) -> nat) (G : Fin m -> nat) (i : Fin n)
        (Fi : Fin (F (fs i))) (j : Fin (F (fz n))) :
   JMeq (fin_inl  (sum_n (fun a : Fin (n + m) =>
                      match FinCase (S n) m (fs a) with
                     | inl z =>  F z
                     | inr z => G z
                     end)) j)
        (fin_inl (sum_n G)
         (fin_inr (F (fz n)) (finj (fun z : Fin n => F (fs z)) i Fi))) -> False.
 Proof.
  intros n m F G i Fi j.
  induction j; simpl .
  set (R := sum_nm F G); simpl in R.
  rewrite <-  (plus_assoc ( F (fz n)) (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) in R.
   rewrite <- (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) .
  set (R1 := eq_subs (fun FF : Fin (n +m) -> nat =>  sum_n FF =  sum_n  (fun z : Fin (n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end) )
  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
     (refl_equal(sum_n
          (fun z : Fin (n + m) =>
           match FinCase (S n) m (fs z) with
           | inl z0 => F z0
           | inr z0 => G z0
           end)))) ; simpl in R1.
     rewrite <- R1 in R.
   rewrite  ( plus_reg_l ( sum_n
        (fun i : Fin (n + m) =>
         match FinCase n m  i with
         | inl z => F (fs z)
         | inr z => G z
         end))  (sum_n (fun i : Fin n => F (fs i)) + sum_n G) (F (fz n)) R) .
   apply  ( eq_subs (fun x : nat => JMeq (fz x) 
                    (fs
           (fin_inl (*n0 + sum_n (fun z : Fin n => F (fs z))*) 
              (sum_n G)
              (fin_inr n0 (*sum_n (fun z : Fin n => F (fs z))*)
                 (finj (fun z : Fin n => F (fs z)) i Fi)))) -> False )
          (sym_equal (plus_assoc  n0 (sum_n (fun i : Fin n => F (fs i))) (sum_n G))) ).
   intro H; set (H1 := JMeq_eq H); discriminate  H1.
     set (R1 := eq_subs (fun FF : Fin (n +m) -> nat =>  sum_n FF =  sum_n  (fun z : Fin (n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end) )
  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
     (refl_equal(sum_n
          (fun z : Fin (n + m) =>
           match FinCase (S n) m (fs z) with
           | inl z0 => F z0
           | inr z0 => G z0
           end)))) ; simpl in R1.
   rewrite <- R1 in IHj.
   rewrite <- R1 .
   rewrite  (sum_nm (fun i : Fin n => F (fs i)) G).
    rewrite  (sum_nm (fun i : Fin n => F (fs i)) G) in IHj.
 apply (fun i => IHj (Jmeq_fsInject (plus_assoc n0 (sum_n (fun i : Fin n => F (fs i)))  (sum_n G)) i ) ).
  Qed.
 
Lemma finj_feq_inj (n : nat) (F F1 : Fin n -> nat) (H : F = F1) (i j : Fin n) (Fi  :Fin (F i)) (F1j : Fin (F1 j)) :
     JMeq (finj F i Fi) (finj F1 j F1j ) -> i = j /\ JMeq Fi F1j.
Proof.
 intros n F F1 H; case H; clear H.
 intros i j Fi F1j H.
 apply (finj_inj i j F Fi F1j (JMeq_eq H) ). 
Qed.

 Lemma Jmeq_fin_inr1 (x z y A: nat) (H : A = z + y) (j : Fin A) (i : Fin y) :
   JMeq (fin_inr x j) (fin_inr (x + z)  i) -> JMeq j (fin_inr z  i).
 Proof.
  intros x z y A H; rewrite H.  
  clear H. 
  intros .
  induction x; simpl in *;  auto.
   apply (IHx (Jmeq_fsInject (plus_assoc x z y) H)).
Qed.

Lemma finjInr_inj (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat) (i j : Fin m) 
      (Gj : Fin (G j))
     (k : Fin  match FinCase n m (fin_inr n  i) with
        | inl z => F  z
        | inr z => G  z
        end )  :  
 JMeq (finj (fun a : Fin (n + m) =>
       match FinCase n m a with
       | inl z => F z
       | inr z => G z
       end) (fin_inr n  i) k) (fin_inr (sum_n F)  (finj G j Gj)) -> i = j /\ JMeq Gj k. 
 Proof.
  intros n m F G i j Gj k.
  induction n; simpl in *.
  intro H.
  destruct (finj_feq_inj 
     (extensionality (fun a : Fin m => G a) G (fun x : Fin m => (refl_equal (G x))))
     i j  k Gj H); split; trivial.
  apply (sym_JMeq H1).
  intro H.
  set (R := sum_nm (fun z : Fin n => F (fs z)) G); simpl in R.
  rewrite  (extensionality   (fun i : Fin (n + m) =>
               match FinCase  n m  i with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun i : Fin (n + m) =>
               match FinCase (S n) m (fs i) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fun i : Fin (n + m) => fincaseS F G i)) in R.
    destruct  (IHn (fun z => F (fs z))
       (eq_subs (fun z : nat => Fin z)(sym_equal (fincaseS F G (fin_inr n  i)))k )
    
      (trans_JMeq  (finj_f (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end)(fun a : Fin (n + m) => fincaseS F G a))(fin_inr n  i)
          (sym_JMeq ( finJmeq (sym_equal (fincaseS F G (fin_inr n  i))) k)))
            (Jmeq_fin_inr1 (F (fz n)) (sum_n (fun i : Fin n => F (fs i))) R
            (finj
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fin_inr n  i) k) (finj G j Gj) H))).
    split; trivial.
   apply (trans_JMeq H1 (sym_JMeq (finJmeq (sym_equal (fincaseS F G (fin_inr n  i))) k))).
  Qed.



(* finjInl_inj proof starts here!  *)
Lemma finjInl_inj (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat) (i j : Fin n) 
      (Fj : Fin (F i))
     (k : Fin  match FinCase n  m  (fin_inl  m  j) with
        | inl z => F  z
        | inr z => G  z
        end )  :  
 JMeq (finj (fun a : Fin (n + m) =>
       match FinCase n m a with
       | inl z => F z
       | inr z => G z
       end) (fin_inl  m j) k) (fin_inl  (sum_n G) (finj F i Fj)) -> i = j /\ JMeq Fj k.  
Proof. 
  intros n m F G i j Fj k.
  induction j.
  destruct i using FinSn_rect; simpl in *.
  intro H; case (finjInl_false F G i Fj k H).
  trivial.
    set (R1 := eq_subs (fun FF : Fin (n +m) -> nat =>  sum_n FF =  sum_n  (fun z : Fin (n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end) )
  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
     (refl_equal(sum_n
          (fun z : Fin (n + m) =>
           match FinCase (S n) m (fs z) with
           | inl z0 => F z0
           | inr z0 => G z0
           end)))) ; simpl in R1.
    intro H; 
    set (H1 := eq_subs (fun x : nat => JMeq (fin_inl  x k)
              (fin_inl (*F (fz n) + sum_n (fun i : Fin n => F (fs i))*) 
           (sum_n G)
           (fin_inl (*F (fz n)*) (sum_n (fun z : Fin n => F (fs z))) Fj)))
          (sym_equal R1) H  ); simpl in H1. 
   rewrite (sum_nm (fun x : Fin n => F (fs x)) G) in H1.
   case (fin_inl_inject (sum_n (fun x : Fin n => F (fs x)) + sum_n G) k Fj
     (JMeq_eq (trans_JMeq H1 (sym_JMeq (finl_inl_inlx (sum_n (fun x : Fin n => F (fs x))) (sum_n G) Fj))))); 
   split; trivial. 
   destruct i using FinSn_rect. simpl. 
 set (R := sum_nm F G); simpl in R.
 set (R1 := eq_subs (fun FF : Fin (n +m) -> nat =>  sum_n FF =  sum_n  (fun z : Fin (n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end) )
  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
     (refl_equal(sum_n
          (fun z : Fin (n + m) =>
           match FinCase (S n) m (fs z) with
           | inl z0 => F z0
           | inr z0 => G z0
           end)))) ; simpl in R1.
     apply  (dp_rwt Fin (fun (x : nat) (fx : Fin x) =>
              JMeq (fin_inr (F (fz n))  fx )
              (fin_inl (*F (fz n) + sum_n (fun i : Fin n => F (fs i))*) 
           (sum_n G)
           (fin_inr (F (fz n)) (*sum_n (fun z : Fin n => F (fs z))*)
              (finj (fun z : Fin n => F (fs z)) i Fj))) -> fs i = fs j /\ JMeq Fj k )
               R1
       (sym_JMeq (finj_f (sym_equal (extensionality (fun a : Fin ( n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin  (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)))
       (fin_inl  m j) 
       (finJmeq (sym_equal (fincaseS F G (fin_inl  m j))) k)))  ).
  intro h.
  set (X := trans_JMeq h (fin_inl_inrJm (F (fz n)) (sum_n G)  (finj (fun z : Fin n => F (fs z)) i Fj))).
   rewrite <-  (plus_assoc ( F (fz n)) (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) in R. 
   rewrite <- R1 in R. 
   destruct  (IHj (fun x : Fin n => F (fs x)) i Fj 
         (eq_subs (fun x : nat => Fin x) 
         (sym_equal (fincaseS F G (fin_inl  m j))) k)
     
        (fin_inrJm (F (fz n)) ( plus_reg_l ( sum_n
        (fun i : Fin (n + m) =>
         match FinCase n m  i with
         | inl z => F (fs z)
         | inr z => G z
         end))  (sum_n (fun i : Fin n => F (fs i)) + sum_n G) (F (fz n)) R)
         (finj
              (fun a : Fin (n + m) =>
               match FinCase n m a with
               | inl z => F (fs z)
               | inr z => G z
               end) (fin_inl  m j)
              (eq_subs (fun x : nat => Fin x)
                 (sym_equal (fincaseS F G (fin_inl  m j))) k)) 
         (fin_inl (*sum_n (fun z : Fin n => F (fs z))*) 
              (sum_n G) (finj (fun z : Fin n => F (fs z)) i Fj))
          X) ).
 apply  (eq_subs (fun x  : Fin n => fs x = fs j /\ JMeq Fj k) (sym_equal  H) ).
 split; trivial.
 apply (trans_JMeq H0 (sym_JMeq (finJmeq (sym_equal (fincaseS F G (fin_inl m j))) k))).
 intro H.
 case (finjInlr_false F G j Fj k H).
 Qed.

Lemma finjInr_Inr (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat) (j  : Fin m) 
      (Gj : Fin (G j))
     (k : Fin  match FinCase n m (fin_inr n  j) with
        | inl z => F  z
        | inr z => G  z
        end )  : JMeq Gj k ->
 JMeq (finj (fun a : Fin (n + m) =>
       match FinCase n m a with
       | inl z => F z
       | inr z => G z
       end) (fin_inr n  j) k) (fin_inr (sum_n F) (finj G j Gj)). 
Proof.
  intros.
  induction n; simpl.
  apply (sym_JMeq  (finj_f (extensionality G (fun a : Fin m => G a)  
       (fun a  :Fin m => refl_equal (G a))) j H)).
 simpl in *.
 set (R := sum_nm F G); simpl in R;
 rewrite <-  (plus_assoc ( F (fz n)) (sum_n (fun i : Fin n => F (fs i))) (sum_n G)) in R.
  set (R1 := eq_subs (fun FF : Fin (n +m) -> nat =>  sum_n FF =  sum_n  (fun z : Fin (n + m) =>
            match FinCase (S n) m (fs z) with
            | inl z0 => F z0
            | inr z0 => G z0
            end) )
  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
     (refl_equal(sum_n
          (fun z : Fin (n + m) =>
           match FinCase (S n) m (fs z) with
           | inl z0 => F z0
           | inr z0 => G z0
           end)))); simpl in R1.
     rewrite <- R1 in R.
 apply  (dp_rwt Fin (fun (x : nat ) (fx : Fin x) => 
          JMeq
     (fin_inr (F (fz n))  fx)
     (fin_inr (F (fz n) + sum_n (fun i : Fin n => F (fs i))) 
        (*sum_n G*) (finj G j Gj)))
       R1   
      (sym_JMeq (finj_f  (sym_equal (extensionality (fun a : Fin (n + m) =>
          match FinCase n m a with
       | inl z => F (fs z)
       | inr z => G z
       end )
     (fun a :  Fin (n + m) => 
       match FinCase (S n) m (fs a) with
       | inl z => F z
       | inr z => G z
       end) (fincaseS F G)) )
      (fin_inr n  j) 
    (finJmeq (sym_equal (fincaseS F G (fin_inr n  j))) k)))).
 clear R1.
 apply (dp_rwt Fin (fun (x : nat) (fx : Fin x) =>
         JMeq
     (fin_inr (F (fz n))  fx)
     (fin_inr (F (fz n) + sum_n (fun i : Fin n => F (fs i))) 
        (*sum_n G*) (finj G j Gj)))
      (sym_equal ( plus_reg_l ( sum_n
        (fun i : Fin (n + m) =>
         match FinCase n m  i with
         | inl z => F (fs z)
         | inr z => G z
         end))  (sum_n (fun i : Fin n => F (fs i)) + sum_n G) (F (fz n)) R ))

   (sym_JMeq (IHn (fun i : Fin n => F (fs i))
             (eq_subs (fun x  : nat => Fin x) (sym_equal (fincaseS F G (fin_inr n  j))) k) 
    (trans_JMeq H (finJmeq (sym_equal (fincaseS F G (fin_inr n  j))) k))
     ))
 ). clear H; clear R.
 set (X := F (fz n)).
 induction X; simpl; trivial.
  apply (fin_fs  
     (sym_equal (plus_assoc X (sum_n (fun i : Fin n => F (fs i))) (sum_n G)))
     IHX).
Qed.

Lemma finjInr_Inl_false (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat)(i : Fin n) (j  : Fin m) 
      (Fi : Fin (F i))
     (k : Fin  match FinCase n m (fin_inr n  j) with
        | inl z => F  z
        | inr z => G  z
        end )  : 
 JMeq (finj (fun a : Fin (n + m) =>
       match FinCase n m a with
       | inl z => F z
       | inr z => G z
       end) (fin_inr n  j) k) (fin_inl (sum_n G) (finj F i Fi)) -> False. 
Proof. 
  intros.
  induction  i; simpl in *.
  case (Jmeq_fin_inl_inr3 (sum_n (fun i : Fin n => F (fs i))) (sum_n G)
           
     (trans_equal (sym_equal (eq_subs (fun Q : Fin (n + m) -> nat => 
            sum_n Q = (sum_n
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end)))
          (sym_equal   (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end)
          (fincaseS F G)))
          (refl_equal (sum_n
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end)))))
          (sum_nm (fun i => F (fs i)) G))

        (finj
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fin_inr n  j) k) Fi H ).
 set (H1:= trans_JMeq H
       (sym_JMeq (fin_inr_inlJm (F (fz n)) (sum_n G) (finj (fun z : Fin n => F (fs z)) i Fi)))).
 set (R := sum_nm (fun z => F (fs z)) G); simpl in R.
 rewrite (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end)
          (fincaseS F G)) in R.
  apply (IHi (fun z => F (fs z)) Fi 
          (eq_subs (fun x : nat => Fin x)
               (sym_equal (fincaseS F G (fin_inr n  j))) k)
        (sym_JMeq (trans_JMeq (Jmeq_fin_inr (F (fz n))  (sym_equal R)
         (finj
               (fun z : Fin (n + m) =>
                match FinCase (S n) m (fs z) with
                | inl z0 => F z0
                | inr z0 => G z0
                end) (fin_inr n  j) k)
           (fin_inl (*sum_n (fun z : Fin n => F (fs z))*) 
               (sum_n G) (finj (fun z : Fin n => F (fs z)) i Fi))
           H1)
         (sym_JMeq (finj_f (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fincaseS F G)) (fin_inr n  j)
  (sym_JMeq (finJmeq (sym_equal (fincaseS F G (fin_inr n  j))) k))))))).
Qed.

Lemma finjInl_Inr_false (n m : nat) (F : Fin n -> nat) (G : Fin m -> nat)(i : Fin n) (j  : Fin m) 
      (Gj : Fin (G j))
     (k : Fin  match FinCase n m (fin_inl  m i) with
        | inl z => F  z
        | inr z => G  z
        end )  : 
 JMeq (finj (fun a : Fin (n + m) =>
       match FinCase n m a with
       | inl z => F z
       | inr z => G z
       end) (fin_inl  m i) k) (fin_inr (sum_n F)  (finj G j Gj)) -> False.  
 Proof.
  intros. 
  induction i; simpl in *.
  set (R := sum_nm (fun z => F (fs z)) G); simpl in R.
  rewrite  (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fun i : Fin (n + m) => fincaseS F G i)) in R.
  case (fin_inl_inrZ1 (sum_n (fun i : Fin n => F (fs i))) R k (finj G j Gj) H ).
   set (R := sum_nm (fun z => F (fs z)) G); simpl in R.
  rewrite  (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fun i : Fin (n + m) => fincaseS F G i)) in R.
   apply   (IHi (fun x => F (fs x)) 
           (eq_subs (fun z => Fin z) (sym_equal (fincaseS F G (fin_inl  m i))) k)
          (trans_JMeq 
           (finj_f (extensionality   (fun z : Fin (n + m) =>
               match FinCase  n m  z with
               | inl z0 => F (fs z0)
               | inr z0 => G z0
               end)
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end)(fun a : Fin (n + m) => fincaseS F G a))(fin_inl  m i)
          (sym_JMeq ( finJmeq (sym_equal (fincaseS F G (fin_inl  m i))) k)))

          (Jmeq_fin_inr1 (F (fz n)) (sum_n (fun i : Fin n => F (fs i))) R
            (finj
              (fun z : Fin (n + m) =>
               match FinCase (S n) m (fs z) with
               | inl z0 => F z0
               | inr z0 => G z0
               end) (fin_inl  m i) k)
             (finj G j Gj) H)) ).
  Qed.



 (* some lemmas for dealing with lists *)
  Definition rv_elim3 (n : nat) (i : Fin n) (P : Fin n -> Fin n -> Type):
        (forall j : Fin n, j =  (rv i) ->  P (rv j) j) ->  P i (rv i) . 
   exact ( fun (n : nat) (i : Fin n) (P : Fin n -> Fin n -> Type)
     (H : forall j : Fin n, j =  (rv i) ->  P (rv j) j) =>
    eq_subs (fun x : Fin n => P x (rv i)) (idem_rvFin i) (H (rv i) (refl_equal (rv i)))).
 Qed.

 (* Check finPair.*)

 Lemma finSumm_push_rv : 
    forall (a : Ext (ucont Fin) nat)
      (i : Fin (u a))  (p : Fin (sum_n (f a))) (k : Fin (f a (rv i))),
    JMeq (finj (fun a0 : Fin (u a) => f a (rv a0)) i k) p ->  
    cpos (ucont Fin) a (rv i) (rv k) =
      match finSumm (f a) (rv p) with
     | finPair j k0 => cpos (ucont Fin) a j k0
      end.
 Proof.
   intros.  
   cut ( sum_n (f a) = sum_n (fun a0 : Fin (u a) => f a (rv a0))). 
   intros.
   apply  (rv_elim3 _ (fun _ => fun b => cpos (ucont Fin) a (rv i) (rv k) =
                                        match finSumm (f a) b with
                                        | finPair j k0 => cpos (ucont Fin) a j k0
                                        end)).
    intros j H1; destruct (finSumm (f a) j). 
     rewrite (rvdist _  (sym_eq H1)) in H. 
   destruct (finjLem _ _ _ _ _ (rvdistJM H0 _  (sym_JMeq H) )). 
   exact (cpos_eq (cpos (ucont Fin) a (rv i) (rv k)) (cpos (ucont Fin) a i0 k0) (sym_eq H2)
         (sym_JMeq H3)). symmetry; apply (sum_n_rv (f a)).
  Qed.
      

 (* Lemma fsfz_jm (n m : nat) (i : Fin m) : n = m -> JMeq (fz n) (fs i) -> False.
Proof.
  intros n m i H; destruct H.
  intro H1; generalize (JMeq_eq H1).
  intro a; discriminate a.
Qed. *)

 Lemma inl_cpos_aux  (e e0 : Ext (ucont Fin) nat) (i i0  : Fin (u e)) (H :  i = i0)
  (A : Fin (u e) + Fin (u e0)) (H1 : A = FinCase (u e) (u e0) (fin_inl (u e0) i) )
   (a : Fin (match A  with
	       | inl z => f e z
	       | inr y => f e0 y
              end ) )  (k : Fin (f e i0)) 
 : JMeq a k ->  (forall (k1 : Fin (f e i)), JMeq a k1 -> 
  inl (CPos (ucont Fin) e0) (cpos (ucont Fin) e i k1) = 
    inl (CPos (ucont Fin) e0) (cpos (ucont Fin) e i0 k)) ->
   (*CPos Lst e0*) (*CPos Lst e0*)

   (match A as s0 return ( Fin (match s0 with
				 | inl z => f e z
				 | inr y => f e0 y
				 end) -> CPos (ucont Fin) e + CPos (ucont Fin) e0) 
      with
    | inl f0 =>
       fun cp0 : Fin (f e f0) => inl (CPos (ucont Fin) e0) (cpos (ucont Fin) e f0 cp0)  
   | inr f0 =>
       fun cp0 : Fin (f e0 f0) => inr (CPos (ucont Fin) e) (cpos (ucont Fin) e0 f0 cp0) 
   end a  =   inl (CPos (ucont Fin) e0) (cpos (ucont Fin) e i0 k) ). 
 Proof.
   intros e e0 i ; rewrite  (FinCase_inl (u e0) i).
   intros i0 h; rewrite h.   
   intros A H;   rewrite  H.
   intros a k H0 H1; apply (H1 _ (JMeq_refl a)).
 Qed. 


 

Lemma inr_cpos_aux  (e e0 : Ext (ucont Fin) nat) (j i0  : Fin (u e0)) (H :  j = i0)
  (A : Fin (u e) + Fin (u e0)) (H1 : A = FinCase (u e) (u e0) (fin_inr (u e) j) )
   (a : Fin (match A  with
	       | inl z => f e z
	       | inr y => f e0 y
              end ) )  (k : Fin (f e0 i0)) 
 : JMeq a k ->  (forall (k1 : Fin (f e0 j)), JMeq a k1 -> 
  inr  (CPos (ucont Fin) e) (cpos (ucont Fin) e0 j k1) = 
  inr (CPos (ucont Fin) e) (cpos (ucont Fin) e0 i0 k)) ->
 

   (match A as s0 return ( Fin (match s0 with
				 | inl z => f e z
				 | inr y => f e0 y
				 end) -> CPos (ucont Fin) e + CPos (ucont Fin) e0) 
      with
    | inl f0 =>
       fun cp0 : Fin (f e f0) => inl _ (cpos (ucont Fin) e f0 cp0) 
   | inr f0 =>
       fun cp0 : Fin (f e0 f0) => inr _ (cpos (ucont Fin) e0 f0 cp0)
   end a  =   inr _  (cpos (ucont Fin) e0 i0 k) ). 
 Proof.
   intros e e0 j; rewrite (FinCase_inr (u e) j).
   intros i0 h; case h.
   intros A H; rewrite H.
   intros a k H0 H1; apply (H1 _ (JMeq_refl a)).
 Qed.

  Lemma FinCase_inl_rwt (e e0 : Ext (ucont Fin) nat)
  ( i0 : Fin (u e))
     (k : Fin
        match FinCase (u e) (u e0) (fin_inl (u e0) i0) with
        | inl z => f e z
        | inr z => f e0 z
        end) (i : Fin (u e))
       (k0 : Fin (f e i)) : 
      JMeq
        (finj
           (fun a : Fin (u e + u e0) =>
            match FinCase (u e) (u e0) a with
            | inl z => f e z
            | inr z => f e0 z
            end) (fin_inl (u e0) i0) k)
        (fin_inl (sum_n (f e0)) (finj (f e) i k0)) -> 
   match
     FinCase (u e) (u e0) (fin_inl (u e0) i0) as s
     return
       (Fin match s with
            | inl z => f e z
            | inr z => f e0 z
            end -> CPos (ucont Fin) e + CPos (ucont Fin) e0)
   with
   | inl f0 => fun cp : Fin (f e f0) => inl _ (cpos (ucont Fin) e f0 cp)
   | inr f0 => fun cp : Fin (f e0 f0) => inr _ (cpos (ucont Fin) e0 f0 cp)
   end k = inl _ (cpos (ucont Fin) e i k0).
  Proof.
     intros. destruct  (finjInl_inj _ _ _ _ _ _ H).
     apply (inl_cpos_aux (sym_equal H0) 
          (refl_equal (FinCase _ _ (fin_inl (u e0) i0))) (sym_JMeq H1) ).
     intros. rewrite (cpos_eq (cpos (ucont Fin) e i0 k1) (cpos (ucont Fin) e i k0)
         (sym_eq H0) (sym_JMeq (trans_JMeq H1 H2))); trivial.
  Qed.


   Lemma FinCase_inr_rwt (e e0: Ext (ucont Fin) nat) (j0 : Fin (u e0) )
     (k : Fin
        match FinCase (u e) (u e0) (fin_inr (u e) j0) with
        | inl z => f e z
        | inr z => f e0 z
        end) (i : Fin (u e0)) (k0 : Fin (f e0 i)) : 
        JMeq
        (finj
           (fun a : Fin (u e + u e0) =>
            match FinCase (u e) (u e0) a with
            | inl z => f e z
            | inr z => f e0 z
            end) (fin_inr (u e) j0) k)
        (fin_inr (sum_n (f e)) (finj (f e0) i k0)) -> 
    match
     FinCase (u e) (u e0) (fin_inr (u e) j0) as s
     return
       (Fin match s with
            | inl z => f e z
            | inr z => f e0 z
            end -> CPos (ucont Fin) e + CPos (ucont Fin) e0)
    with
    | inl f0 => fun cp : Fin (f e f0) => inl _ (cpos (ucont Fin) e f0 cp)
    | inr f0 => fun cp : Fin (f e0 f0) => inr _ (cpos (ucont Fin) e0 f0 cp)
    end k = inr _ (cpos (ucont Fin) e0 i k0).
  Proof.
    intros. destruct (finjInr_inj _ _ _ _ _ _  H ).
     apply (inr_cpos_aux H0 (refl_equal (FinCase _ _ (fin_inr (u e) j0)))
            (sym_JMeq H1)). intros k1 H2; 
    rewrite (cpos_eq (cpos (ucont Fin) e0 j0 k1)  (cpos (ucont Fin) e0 i k0) H0
            (sym_JMeq (trans_JMeq H1 H2))); trivial.
  Qed.
 

 End FinSumm_defs.

(**  Exporting hints and tactics  *)

  Ltac finSumn_rewrite :=
    match goal with
     | [ H : JMeq (finj ?x _ _ ) ?p |- _ ] =>
           match goal with
           | [ |- context [finSumm _ (rv p)] ] => 
              let Eq := constr:(finSumm_push_rv  _ _ _ H) in
                 match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end ; auto
           end

    | [ H : JMeq ?p (finj ?x _ _) |- _ ] =>
           match goal with
           | [ |- context [finSumm _ (rv p)] ] =>  
              let Eq := constr:(finSumm_push_rv  _ _ _ (sym_JMeq H)) in
                 match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end 
           end; auto
   
      | [ H : JMeq (finj  _ (fin_inl _ ?b) _) (fin_inl (sum_n _ ) (finj _ _ _ )) |- _ ] =>
               let Eq := constr:(FinCase_inl_rwt _ _ _ _ _ _ H) in
                  match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end 
       | [ H : JMeq (fin_inl (sum_n _ ) (finj _ _ _ )) (finj  _ (fin_inl _ ?b) _) |- _ ] =>
               let Eq := constr:(FinCase_inl_rwt _ _ _ _ _ _ (sym_JMeq H)) in
                  match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end 
 
      | [ H : JMeq (finj  _ (fin_inr _ ?b) _) (fin_inr (sum_n _ ) (finj _ _ _ )) |- _ ] =>
              let Eq := constr:(FinCase_inr_rwt _ _ _ _ _ _ H) in
                 match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end 
      | [ H : JMeq (fin_inr (sum_n _ ) (finj _ _ _ )) (finj  _ (fin_inr _ ?b) _) |- _ ] =>
              let Eq := constr:(FinCase_inr_rwt _ _ _ _ _ _ (sym_JMeq H)) in
                 match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end 
   end.
 

 Ltac finSumn_simplify_aux :=
    match goal with
    | [ |- context [finSumm ?f ?i] ] =>
            match i with
            | rv _ => fail 1
            | _    =>  destruct (finSumm f i)
            end
    | [ H : finj _ _ _ = finj _ _ _ |- _  ] =>
        first [ (let dterm := constr:(finj_inj _ _ _ _ H) in  
                destruct dterm ; subst) |
                  (let dterm := constr:(finj_feq_inj _ _ _ _ H) in 
                       destruct dterm ; subst)]
       (* these are fine *)
  

    (* not necessarily an Ext *)
    | [ H : JMeq (finj _ _ _ ) (fin_inr _ _ ) |- _ ] => 
           let dterm := constr:(finjFmLem2 _ _ _ _ H) in destruct H 

    | [ H : JMeq (finj _ _ _ ) (rv (finj _ _ _ )) |- _ ] => 
            let dterm := constr:(finjLem _ _ _ _ _ H) in destruct H
   
    | [ H :  JMeq (finj  (fin_inl  _ _ ) _) (fin_inl _ (finj _ _ _)) |- _ ] => 
                  let dterm := constr:(finjInlr_false _ _ _ _ _ _ H) in
                          destruct dterm 
    | [ H : JMeq (fin_inl _ _ ) (fin_inl _ (fin_inr _ (finj _ _ _ ))) |- _ ] =>
                   let dterm := constr:(finjInl_false _ _ _ _ _ _ H) in
                                destruct dterm 
    | [ H : JMeq (finj _ (fin_inr _ _ ) _) (fin_inr _ (finj _ _ _ )) |- _ ] =>
                   let dterm := constr:(finjInr_inj _ _ _ _ _ _ _ H) in
                                destruct dterm 
     | [ H : JMeq (finj _ (fin_inl _ _ ) _) (fin_inl _ (finj _ _ _ )) |- _ ] =>
                   let dterm := constr:(finjInl_inj _ _ _ _ _ _ _ H) in
                                destruct dterm 
    
    | [ H : JMeq (finj  _ (fin_inr _ ?b) _ ) (fin_inl (sum_n _ ) (finj _ _ _ )) |- _ ] =>
                   let dterm := constr:(finjInr_Inl_false _ _ _ _ _ _ H) in
                                destruct dterm 
    | [ H : JMeq (fin_inl (sum_n _ ) (finj _ _ _ )) (finj  ?a (fin_inr _ ?b) ?c )  |- _ ] =>
                   let dterm := constr:(finjInr_Inl_false _ _ _ _ _ _ (sym_JMeq H)) in
                                destruct dterm 

     | [ H : JMeq (finj  _ (fin_inl _ ?b) _ ) (fin_inr (sum_n _ ) (finj _ _ _ )) |- _ ] =>
                   let dterm := constr:(finjInl_Inr_false _ _ _ _ _ _ H) in
                                destruct dterm 
     | [ H : JMeq (fin_inr (sum_n _ ) (finj _ _ _ )) (finj  _ (fin_inl _ ?b) _ ) |- _ ] =>
                   let dterm := constr:(finjInl_Inr_false _ _ _ _ _ _ (sym_JMeq H)) in
                                destruct dterm  
      
     | [ H : FinSumm ?f (finj ?f ?i ?k) |- _ ] => 
          let Eq := constr:(finSumm_uniq _ _ _ H) in rewrite Eq || rewrite <- Eq
    
    end.

   Ltac finSumn_simplify :=  finSumn_simplify_aux || finSumn_rewrite.


  

