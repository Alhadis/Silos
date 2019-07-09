Require Import References.
Require Import FSets.
Require Import OrderedTypeEx.
Require FSetAddEq.
Require FSetBridge.
Require FoldEqual.
Require FoldOrder.
Require FSetEqEqual.
Require FSetExists.
(* type_remove *)
Require Import RefSets.

Module Make (R: ReferenceType) : RefSetType R.

  Module RefSet := FSetList.Make R. 
  Module RefSetProps := FSetProperties.Properties RefSet.
  Module RefSetFacts := FSetFacts.Facts RefSet.
  Module RefSetDep := FSetBridge.DepOfNodep RefSet.
  Module RefSetEqProps := FSetEqProperties.EqProperties RefSet.
  Module RefSetAddEq := FSetAddEq.Make RefSet.
  Module RefSetFold := FoldEqual.Make RefSet.
  Module RefSetFoldOrder := FoldOrder.Make RefSet.
  Module RefSetEqEqual :=  FSetEqEqual.makeEqual RefSet.
  Module RefSetExists := FSetExists.makeExists RefSetDep.

End Make.