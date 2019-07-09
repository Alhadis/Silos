(* This module is used for defining generic Module Types,
   and then using them by replacing this Module Type by its child,
   declaring the Type T explicitly. *)

Module Type ModuleType.

  Parameter T : Type.

End ModuleType.

(* This is an explicit type. *)

Module Type ModuleNat <: ModuleType.

  Definition T := nat.

End ModuleNat.

(* Resolver *)

Module Type Resolver ( MT : ModuleType ).

  Parameter rsl : MT.T -> MT.T -> MT.T.

  Parameter self_rsl : forall t, rsl t t = t.
  Parameter comm_rsl : forall t t', rsl t t' = rsl t' t.
  Parameter assoc_rsl : forall t t' t'', rsl t (rsl t' t'') = rsl (rsl t t') t''.

End Resolver.