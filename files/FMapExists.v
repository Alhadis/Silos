Require Import FMapInterface2.
Require Import FMapFacts2.
Require Import SetoidList.
Require Import Sumbool_dec.
(* The pattern on which this is built.

(* from SetoidList *)
Definition compat_P (P : A->Prop) := forall x y, eqA x y -> P x -> P y.

(* from FMapInterface *)
Definition Exists (P : elt -> Prop) s := exists x, In x s /\ P x.

(* from FMapBridge *)
Definition exists_ :
  forall (P : elt -> Prop) (Pdec : forall x : elt, {P x} + {~ P x}) (s : t),
    {compat_P E.eq P -> Exists P s} + {compat_P E.eq P -> ~ Exists P s}.
Proof. 
  intros. 
  generalize (exists_1 (s:=s) (f:=fdec Pdec))
    (exists_2 (s:=s) (f:=fdec Pdec)).
  case (exists_ (fdec Pdec) s); unfold Exists in |- *; [ left | right ];
    intros.
  elim H0; auto; intros.
  exists x; intuition.
  generalize H4.
  unfold fdec in |- *. 
  case (Pdec x); intuition.
  inversion H2.
  intuition. 
  elim H2; intros.    
  absurd (false = true); [ auto with bool | apply H; auto ].
  exists x; intuition.
  unfold fdec in |- *. 
  case (Pdec x); intuition.
Qed.

*)

Module MakeExists_fun (E:OrderedType) (MapS: Sfun E) (Data:OrderedType) (M : Sord_fun E MapS Data).
  
  Definition Exists (P : MapS.key -> Data.t -> Prop) m := 
    exists k, exists e, MapS.MapsTo k e m /\ P k e.

  Definition Exists_1 (P : MapS.key * Data.t -> Prop) m := 
    exists p, InA (@MapS.eq_key_elt Data.t) p (MapS.elements m) /\ P p.
  
  Set Implicit Arguments.
  
    Definition compat_P2 (P : MapS.key->Data.t->Prop) := forall a a' b b', 
       E.eq a a' -> Data.eq b b' -> P a b -> P a' b'.

    Definition pair_fn (P : MapS.key -> Data.t->Prop) := (fun p => (P (fst p) (snd p))).

    Definition pair_eq p p':= E.eq (fst p) (fst p') /\ Data.eq (snd p) (snd p').

    Theorem compat_P2_pair: forall (P : MapS.key -> Data.t ->Prop),
      compat_P2 P 
      <-> 
      compat_P pair_eq (pair_fn P).
    Proof.
      intros; split; intros; unfold compat_P in *; unfold compat_P2 in *. 
      repeat progress red; intros.
      unfold pair_fn. destruct H0. 
      apply (H (fst x) (fst y) (snd x) (snd y)); auto;
        rewrite H2; apply Data.eq_refl.
      intros. do 2 red in H. unfold pair_eq in H; unfold pair_fn in H.
      generalize (H (a,b) (a',b')); intros H'.
      unfold MapS.eq_key_elt in *; unfold pair_fn in *; unfold pair_eq in *.
      simpl in H'; intuition eauto.
    Qed.

  Unset Implicit Arguments.

  Module MOrdProps := FMapFacts2.OrdProperties_fun E MapS.
  Module MProps := MOrdProps.P.
  Module MFacts := MProps.F.

  Theorem pair_fn_dec: 
      forall (P : MapS.key -> Data.t -> Prop) (Pdec : forall k e, {P k e} + {~ P k e}),
        forall p, {(pair_fn P) p} + {~ (pair_fn P) p}.
    Proof.
      intros.
      unfold pair_fn; simpl; apply Pdec.
    Qed.
    Implicit Arguments pair_fn_dec [P].

    (* exists_2 was used as a template for exists_1, I'm hanging on to it. *)

    Theorem exists_2:  forall (P : MapS.key * Data.t -> Prop) 
      (Pdec : forall p, {P p} + {~ P p}) (m : M.t),
      compat_P pair_eq P ->
      {Exists_1 P m} + {~ Exists_1 P m}.
    Proof.
      intros.
      unfold Exists_1.
      unfold compat_P in *.
      induction (MapS.elements m).
      (* base *)
      right.
      intro Hex.
      destruct Hex as [p Hex]; destruct Hex as [Hex Hex'].
      inversion Hex.
      destruct IHl as [He|Hne].
      (* exists *)
      left.
      destruct He as [p Hex]; destruct Hex as [Hex Hex'].
      eapply ex_intro with p.
      split; auto.
      (* ~ exists *)
      (* either a is the pair we are looking for or not. *)
      case (Pdec a); intros Hp.
      (*  P a *)
      left; apply ex_intro with a; split; unfold MapS.eq_key_elt; auto.
      (* ~ P a *)
      right.
      intro Hex.
      destruct Hex as [p Hex]. destruct Hex as [Hex Hex'].
      inversion Hex.
      (* p = a *)
      unfold MapS.eq_key_elt in H1.
      destruct H1.
      apply Hp.
      apply H with p; auto;
        unfold pair_eq;
          split; unfold MapS.key in *; try rewrite H3; auto. 
      (* p <> a /\ InA MapS.eq_key_elt p l *)
      apply Hne.
      apply ex_intro with p. auto.
    Qed.

  Definition exists_1 :
    forall (P : MapS.key * Data.t -> Prop) 
      (Pdec : forall p, {P p} + {~ P p}) (m : M.t),
      {compat_P pair_eq P -> Exists_1 P m} + 
      {compat_P pair_eq P -> ~ Exists_1 P m}.
    intros.
      unfold Exists_1.
      unfold compat_P in *.
      induction (MapS.elements m).
      (* base *)
      right.
      intro Heq.
      intro Hex.
      destruct Hex as [p Hex]; destruct Hex as [Hex Hex'].
      inversion Hex.
      (* induction *)
      destruct IHl as [He|Hne].
      (* exists *)
      left; intro Heq.
      generalize (He Heq). intros Hex.
      destruct Hex as [p Hex]; destruct Hex as [Hex Hex'].
      eapply ex_intro with p.
      split; auto.
      (* ~ exists *)
      (* either a is the pair we are looking for or not. *)
      case (Pdec a); intros Hp.
      (*  P a *)
      left.  intro Heq. apply ex_intro with a. split; unfold MapS.eq_key_elt; auto.
      (* ~ P a *)
      right. intro Heq. generalize (Hne Heq); intros Hne'.
      intro Hex.
      destruct Hex as [p Hex]. destruct Hex as [Hex Hex'].
      inversion Hex.
      (* p = a *)
      unfold MapS.eq_key_elt in H0.
      destruct H0.
      apply Hp.
      apply Heq with p; auto;
        unfold pair_eq;
          split; unfold MapS.key in *; try rewrite H2; auto. 
      (* p <> a /\ InA MapS.eq_key_elt p l *)
      apply Hne'.
      apply ex_intro with p. auto.
    Qed.


    Definition exists_ :    
      forall (P : MapS.key ->  Data.t -> Prop) 
        (Pdec : forall k e, {P k e} + {~ P k e}) (m : M.t),
        {compat_P2 P -> Exists P m} + 
        {compat_P2 P -> ~ Exists P m}.
    intros.
    generalize (exists_1 (pair_fn P) (pair_fn_dec Pdec) m); intros Hexists_1.
    (* destruct Hexists_1 and reduce *)
    destruct Hexists_1 as [Hexists_1|Hexists_1]; [left|right]; intro Hcompat;
      apply compat_P2_pair in Hcompat; apply Hexists_1 in Hcompat; clear Hexists_1;
        unfold Exists; unfold Exists_1 in Hcompat.
    (* exists *)
    destruct Hcompat as [p H]; destruct H as [H H'].
    destruct p as [k e]; apply ex_intro with k;
      apply ex_intro with e; split; try apply MapS.elements_2; auto.
    (* ~ exists *)
    intro Hexists; apply Hcompat; clear Hcompat.
    destruct Hexists as [k H]; destruct H as [e H]; destruct H as [H H'];
      apply ex_intro with (k,e); split; try apply MapS.elements_1; auto.
  Qed.
  
End MakeExists_fun.


Module MakeExists (M : Sord).

  Include MakeExists_fun M.MapS.E M.MapS M.Data M.

End MakeExists.


    