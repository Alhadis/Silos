Require Import Coq.Lists.List.
Import ListNotations.

Inductive fn (A : Type) :=
  | TVar : nat -> fn A
  | TApp : A -> A -> fn A
  | TAbs : A -> fn A.

Inductive expr :=
  | EBool : bool -> expr
  | EFn : fn expr -> expr.

Inductive ty :=
  | TyBool : ty
  | TyFn : ty -> ty -> ty.

(* Problems and solutions:

  + Use a (list option ty) as the typing environment, that's fine.
  + 

*)

Definition ctxt := list (option ty).

Inductive has_ty_bool : bool -> ty -> Prop :=
  | HasTyBool : forall b, has_ty_bool b TyBool.

(* Here we have the chief problem with this approach *)
(* We can't meaningfully create TApp e1 e2, as e1 and e2
   have type (fn A), but need to have type A.
*)
Inductive has_ty_fn {A} : ctxt -> fn A -> ty -> Prop :=
  | HasTyVar t : has_ty_fn [Some t] (TVar A 0) t
  | HasTyApp E e1 e2 t1 t2
      (TyAppL : has_ty_fn E e1 (TyFn t1 t2))
      (TyAppR : has_ty_fn E e2 t1) :
      has_ty_fn E (TApp A e1 e2) e2.
