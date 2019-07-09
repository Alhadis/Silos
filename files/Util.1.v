Require Export ImpDependencies.

Definition blt_id X1 X2 :=
  match (X1, X2) with
    (n1, n2) => blt_nat n1 n2
  end.

(**
Theorem beq_id_sym : forall n m,
  true = beq_id n m <-> true = beq_id m n.
Proof.
  split; unfold beq_id; destruct n, m.
  Case "->".
    
    rewrite <- beq_nat_sym.
    intros. assumption.
  Case "<-".
    rewrite beq_nat_sym.
    intros. assumption.
Qed.   

Theorem beq_id_trans : forall n m o,
  true = beq_id n m -> true = beq_id m o -> true = beq_id n o.
Proof.
  intros n m o.
  intros.
  apply beq_id_eq in H.
  apply beq_id_eq in H0.
  subst.
  unfold beq_id.
  destruct o.
  apply beq_nat_refl.
Qed.

Theorem blt_id_trans : forall n m o,
  true = blt_id n m -> true = blt_id m o -> true = blt_id n o.
Proof.
  intros.
  unfold blt_id in *.
  destruct n, m, o.
  transitivity (blt_nat n n0).
  apply H.
  assert(blt_nat n n1 = true).
  admit.
  rewrite <- H.
  rewrite H1.
  reflexivity.
Qed.

*)
(** 
Lemma not_None_iff_Some : forall n (m : nat),
   (n = Some m <-> n <> None).
Proof.
Admitted.

Program Definition hassn_sub (X: id) a (Q : Assertion) : Assertion :=
  mk_asn (fun h st => forall n, (find (aeval st a) h) = Some n -> Q h (ImpDependencies.update st X n)) _.
Next Obligation.
  unfold read.
(**
  unfold ImpDependencies.update, read.
  rewrite <- H.
 *) 
Admitted.

Lemma in_update_extend : forall (st : state) (h : Heap) (e : aexp) (e' : nat) (X : id),
  In (aeval st e) h -> 
  aeval st e = aeval (ImpDependencies.update st X e') e ->
  In (aeval (ImpDependencies.update st X e') e) h.
Proof.
  intros.
  rewrite <- H0.
  assumption.
Qed.

Lemma aeval_update_extend : forall (st : state) (e : aexp) (e' : nat) (X : id),
  aeval st e = aeval (ImpDependencies.update st X e') e.
Proof.
  intros.
  induction e.
  simpl. reflexivity.
  simpl. rewrite update_neq. reflexivity.
  
Admitted.

Fixpoint free_in_heap_prop (a n : nat) (h : Heap) : Prop :=
  match n with
  | 0    => True
  | S n' => not (In a h) /\ free_in_heap_prop (a+1) (n') h
  end.
  
Program Definition free a n : Assertion :=
  mk_asn (fun h st => free_in_heap_prop (aeval st a) n h) _.
Next Obligation.
Admitted.


(**
Theorem hoare_allocate : forall X n a Q,
  {{ free a n //\\ ((a |-> (ANum 0)) -* assn_sub X a Q) }} X &= ALLOC n {{ Q }}.
Proof.
  intros X n a Q st st' Hc Pre.
  inversion Hc. subst. simpl in *.
  inversion Pre.
  apply H0.
  
  split.
    inversion Hc. subst.
    simpl in *.
*)  *)  

(** 
{{ empSP }} X &= ALLOC n {{ aexp_eq (AId X) a //\\ ((ANum a) |-> (ANum 0)) ** (((APlus (ANum a) (ANum 1)) |-> ANum 0)) }}.
*)

(**
  | E_FuncDef : forall i,
      (* prog ? *)
      FuncDef / st || Some st
  | E_FuncCall : forall X name params body prog st st',
      body = prog [ name ] ->
      ps = parameters body ->
      comm = commands body ->
      comm / (substitute (cstack st)...., (cheap st)) || Some st'
      (X ::= name ( params )) / Some (update (cstack st) X result, (cheap st'))

  | CFuncDef : id -> FunctionBody -> com
  | CFuncCall: id -> id -> list id -> com.
*)