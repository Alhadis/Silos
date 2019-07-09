Require Export Lattice.
Require Export Monads.
Require Export Strategy.
Require Export StrategyUtils.
Require Import FSetInterface.
Require Import FMapInterface.
Require Import Program.Basics.
Require Import Utf8.

Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Module Type CSysJoinSemiLat.
  Declare Module V : UsualDecidableTypeBoth.
  Declare Module D : JoinSemiLattice.

  Parameter F : V.t -> FuncType V.t D.t D.t.
End CSysJoinSemiLat.

Module Type CSys <: CSysJoinSemiLat.
  Declare Module V : UsualDecidableTypeBoth.
  Declare Module D : Lattice.
  
  Parameter F : V.t -> FuncType V.t D.t D.t.
  (*Parameter F :
    forall (M : monadType), V.t -> (V.t -> M D.t) -> M D.t.*)
End CSys.

(* TODO *)
Module Type WNCSys.
  Declare Module V : UsualDecidableTypeBoth.
  Declare Module D : WNLattice.
  
  Parameter F : forall (M : monadType), V.t -> (V.t -> M D.t) -> M D.t.
End WNCSys.

Module Type NatWNCSys.
  Declare Module V : UsualDecidableTypeBoth.
  Declare Module D : WNLattice.

  Parameter VarIsNat : V.t = nat.
  
  Parameter F : forall (M : monadType), V.t -> (V.t -> M D.t) -> M D.t.
End NatWNCSys.

(*Module Type CSysLocalSolver (Import C : CSys).
  Include D.

  Declare Module VSet : FSetInterface.WSfun (V).
  Declare Module VMap : FMapInterface.WSfun (V).

  Parameter solve : ∀ (X : VSet.t), VMap.t t.

  Infix "∈" := VSet.In (at level 65, no associativity).


  Infix "∈₁" := VMap.In (at level 65, no associativity).
  Infix "⊆" := VSet.Subset (at level 70, no associativity).
  Module PD := OptionLattice (D).
  Infix "⊑₁" := PD.Leq (at level 70, no associativity).

  Section correctness.
    Variable X : VSet.t.
    Let sol := solve X.
    Let σ   := λ x, VMap.find x sol .

    Variable x : V.t.
    Axiom A1: x ∈ X -> x ∈₁ sol.
    Axiom A2: x ∈₁ sol -> (@F Error x σ) ≠ None.    
    Axiom A3: x ∈₁ sol -> (@F Error x σ) ⊑₁ σ x.
  End correctness.
End CSysLocalSolver.*)

(*Module HSys (Import C:WNCSys) <: WNCSys.
  Module V := V.
  Module D := D.
  Import D.
  Definition F (m:monadType) (v:V.t) (get:V.t->m t) : m t :=
    do old <- get v;
       do new <- @F m v get;
          return m (if leq new old then old Δ new else old ∇ new).    
End HSys.*)

