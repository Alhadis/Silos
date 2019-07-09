Require Import References.
Require Import FSets.
Require Import OrderedTypeEx.
Require Import AccessEdge.
Require FSetAddEq.
Require FSetBridge.
Require FoldEqual.
Require Import Morphisms.
Require FSetEqEqual.
Require FSetExists.
(* type_remove *)
Require Import AccessGraphs.

Module Make (R: ReferenceType) (Edges: AccessEdgeType R) : AccessGraphType R Edges.
  
(*   Module Edges := !AccessEdge.Make R. *)

  Module Edge := Edges.AccessEdge.

  Module AG := !FSetList.Make Edge.

  Module AGFacts := !FSetFacts.Facts(AG).

  Module AGAddEq := !FSetAddEq.Make AG.

  Module AGProps := !AGAddEq.Properties.

  Module AGEqProps := !FSetEqProperties.EqProperties(AG).

  Module AGDep := !FSetBridge.DepOfNodep AG.

  Module AGFold := !FoldEqual.Make AG.

  Definition ag_nondecr Fa := forall ag ag', AG.Subset ag ag' -> AG.Subset ag (Fa ag').

  Module AGEqEqual := !FSetEqEqual.makeEqual AG.

  Module AGExists := FSetExists.makeExists AGDep.

  Definition ag_eq_Equal := AGEqEqual.eq_Equal.

  (* Theorem ag_eq_Equal: forall ag ag', *)
  (*   AG.eq ag ag' <-> AG.Equal ag ag'. *)
  (* Proof. *)
  (*   intros; split;intros; eapply H. *)
  (* Qed. *)
  Hint Resolve ag_eq_Equal.


  Definition AG_EQ : Equivalence AG.Equal.
  split; 
    [unfold Reflexive; eapply AG.eq_refl
    |unfold Symmetric; eapply AG.eq_sym
    |unfold Transitive; eapply AG.eq_trans]. 
  Defined.

  Definition AG_Pre : PreOrder AG.Subset.
  split;
    [unfold Reflexive; eapply AGProps.subset_refl
    |unfold Transitive; eapply AGProps.subset_trans].
  Defined.    

  Hint Resolve AG_EQ.
  Hint Resolve AG_Pre.

  Definition AG_PO : @PartialOrder _ _ AG_EQ _ AG_Pre.
  split;
    repeat progress (red; simpl; unfold Basics.flip; unfold relation_conjunction; unfold predicate_intersection);
      intros; intuition.
  Defined.

    Theorem Proper_add_mkedge: forall src tgt, 
     Proper ((@eq _) ==> AG.Equal ==> AG.Equal) 
      (fun rgt ag => AG.add (Edges.mkEdge src tgt rgt) ag).
    Proof.
      unfold Proper.
      unfold respectful.
      intros.
      rewrite H.
      intro; split; intros; eapply AGFacts.add_iff in H1; 
        eapply AGFacts.add_iff; simpl in *;
      (destruct H1; [left|right];eauto; eapply H0; eauto).
    Qed.



End Make.