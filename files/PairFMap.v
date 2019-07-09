Require Import FMaps.
Require Import OrderedTypeEx.
Require Import PairOrderedType_Type.

Module PairOrderedType_Type_cast : PairOrderedType_Type := PairOrderedType.

Module Make (O1 O2:OrderedType) (P:PairOrderedType_Type O1 O2) 
  (OrdMap: Sord with Module Data := P).

  (* We can extract two FMaps from a pair ordered type.  Since PairOrderedTypes are 
     lexicographically sorted, the first type produces a sorted map, while the second type is 
     just a map.*)

  Module OrdMap1.
 
    Module Data := O1.
    Module MapS <: S.
      Module E := OrdMap.MapS.E.

    End MapS.

  End OrdMap1.

Module MapS2.

End MapS2.

