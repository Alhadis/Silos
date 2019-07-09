Require Import AccessRights.
Require Import FSets.
Require Import OrderedTypeEx.
Require FSetAddEq.
Require FSetBridge.
Require FoldEqual.
Require FoldOrder.
Require FSetEqEqual.

Module ARSet := FSetList.Make AccessRight. 
Module ARSetProps := FSetProperties.Properties ARSet.
Module ARSetFacts := FSetFacts.Facts ARSet.
Module ARSetDep := FSetBridge.DepOfNodep ARSet.
Module ARSetEqProps := FSetEqProperties.EqProperties ARSet.
Module ARSetAddEq := FSetAddEq.Make ARSet.
Module ARSetFold := FoldEqual.Make ARSet.
Module ARSetFoldOrder := FoldOrder.Make ARSet.
Module ARSetEqEqual := FSetEqEqual.makeEqual.

Definition all_rights := 
  ARSet.add rd
  (ARSet.add wr
    (ARSet.add wk
      (ARSet.singleton tx))).

