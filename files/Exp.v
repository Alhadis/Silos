Require Import Esub.Literal.
Require Import Esub.Pattern.

Require Import Coq.Lists.List.

Import ListNotations.

Section mailbox.
  Variable Msg : Type.
  Hypothesis Msg_eq_dec : forall (x y : Msg), {x = y} + {x <> y}.

  Definition mailbox := list Msg.
  Definition selector := Msg -> bool.

  Fixpoint select (f : selector) (mb : mailbox) : option Msg :=
    match mb with
    | [] => None
    | msg :: msgs => if f msg then Some msg else select f msgs
    end.

  Fixpoint remove (f : selector) (mb : mailbox) : mailbox :=
    match mb with
    | [] => []
    | msg :: msgs => if f msg then msgs else msg :: (remove f msgs)
    end.

  Fixpoint receive_acc (f : selector) (mb : mailbox) (acc : mailbox) : (option Msg * mailbox) :=
    match mb with
    | [] => (None, rev acc)
    | msg :: msgs => if f msg then (Some msg, (rev acc) ++ msgs) else receive_acc f msgs (msg :: acc)
    end.
  
  Definition receive (f : selector) (mb : mailbox) : (option Msg * mailbox) :=
    receive_acc f mb [].

  Definition receive1 (f : selector) (mb : mailbox) : (option Msg * mailbox) :=
    (select f mb, remove f mb).
       
End mailbox.

Section exp.
  Variable V : Type.
  Hypothesis Veq_dec : forall (x y : V), {x = y} + {x <> y}.


  Inductive exp :=
  | Seq : exp -> exp -> exp
  | Lit : lit -> exp
  | ReceiveNil
  | ReceiveCons : pat V -> exp -> exp -> exp.

  Inductive aexp {A : Type} :=
  | ASeq : aexp -> aexp -> A -> aexp
  | ALit : lit -> A -> aexp
  | AReceiveNil : A -> aexp
  | AReceiveCons : pat V -> aexp -> aexp -> A -> aexp.

  Fixpoint size (e : exp) : nat :=
    match e with
    | Seq e1 e2 => 1 + (size e1) + (size e2)
    | Lit l => 1
    | ReceiveNil => 1
    | ReceiveCons p e rest => 1 + (size e) + (size rest)
    end.

  Fixpoint label (e : exp) (n : nat) : @aexp nat :=
    match e with
    | Seq e1 e2 => ASeq  (label e1 (n+1)) (label e2 ((size e1) + 1)) n
    | Lit l => ALit l n
    | ReceiveNil => AReceiveNil n
    | ReceiveCons p e rest =>
      AReceiveCons p (label e (n+1)) (label rest ((size e)+1)) n
    end.

  Fixpoint strip {A : Type} (e : @aexp A) : exp :=
    match e with
    | ASeq e1 e2 _ => Seq (strip e1) (strip e2)
    | ALit l _ => Lit l
    | AReceiveNil _ => ReceiveNil
    | AReceiveCons p e rest _ => ReceiveCons p (strip e) (strip rest)
    end.

  Lemma strip_m_n : forall e n m, strip (label e n) = strip (label e m).
  Proof.
    intros e. induction e; intros m n; simpl.
    - specialize IHe1 with (n+1) (m+1).
      specialize IHe2 with (n+1) (m+1).
      congruence.
    - reflexivity.
    - reflexivity.
    - specialize IHe1 with (n+1) (m+1).
      specialize IHe2 with (n+1) (m+1).
      congruence.
  Qed.
  

  Lemma label_strip_inv: forall e n, strip (label e n) = e.
  Proof.
    intros. induction e.
    - simpl.
      pose proof (strip_m_n e1 n (n+1)) as He1.
      pose proof (strip_m_n e2 n ((size e1 + 1))) as He2.
      congruence.
    - reflexivity.
    - reflexivity.
    - simpl.
      pose proof (strip_m_n e1 n (n+1)) as He1.
      pose proof (strip_m_n e2 n ((size e1 + 1))) as He2.
      congruence.
  Qed.
  
  
  
  
  Fixpoint eval (e : exp) (mb : mailbox lit) {struct e} : (exp * mailbox lit) :=
    match e with
    | Seq e1 e2 => eval e2 (snd (eval e1 mb))
    | Lit l => (Lit l, mb)
    | ReceiveNil => (ReceiveNil, mb)
    | ReceiveCons p e rest =>
      match (receive lit (pat_den V p) mb) with
      | (Some _, mb') => eval e mb'
      | (None, _) =>
        match eval rest mb with
        | (ReceiveNil, _) => (ReceiveCons p e rest, mb)
        | other => other
        end
      end
    end.

  Let mb1 := [(TupleCons Atom TupleNil)].
  Variable v1 : V.
  Let p1 := (PTupleCons V (PVar V v1) (PTupleNil V)).

  Variable e1 : exp.
  Let e := (ReceiveCons p1 (Lit Integer) ReceiveNil).
  Compute (eval e []).
  Compute (label e 0).
                   