Require Export Reify.Dynamic.
Require Import Quote.

Declare ML Module "reify_plugin".

Implicit Arguments varmap_find [[A]].
Implicit Arguments Empty_vm [[A]].
Implicit Arguments Node_vm [[A]].

Fixpoint varmap_add {A:Type} (a:A) (v:varmap A) (i:index) : varmap A :=
  match v, i with
    | Empty_vm, End_idx => Node_vm a Empty_vm Empty_vm
    | Empty_vm, Left_idx i =>
      Node_vm a (varmap_add a Empty_vm i) Empty_vm
    | Empty_vm, Right_idx i =>
      Node_vm a Empty_vm (varmap_add a Empty_vm i)
    | Node_vm a' l r, End_idx => Node_vm a l r
    | Node_vm a' l r, Left_idx i => Node_vm a' (varmap_add a l i) r
    | Node_vm a' l r, Right_idx i => Node_vm a' l (varmap_add a r i)
  end.
