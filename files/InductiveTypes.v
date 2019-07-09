Require Import HoTT.Basics Coq.Unicode.Utf8.

(* Indexed Inductive Definitions *)

(* Specify the operations of an inductive definition *)
Cumulative Inductive DataSpec@{i} (I : Type@{i}) : Type@{i+1} :=
  | inc (i : I)
  | inf (A : Type@{i}) (B : A → DataSpec I)
.
Cumulative Inductive OpSpec@{i} (I : Type@{i}) : Type@{i+1} :=
  | el (i : I)
  | ind_arg (A : DataSpec@{i} I) (B : OpSpec I)
  | nonind_arg (A : Type@{i}) (B : A → OpSpec I)
  | op_prod (A B : OpSpec I)
  | op_skip
.
Section el_op.
Universe i.
Context {I : Type@{i}} (X : I → Type@{i}).
Fixpoint ElDataSpec@{} (A : DataSpec@{i} I) : Type@{i}
  := match A with
     | inc i => X i
     | inf A B => ∀ a, ElDataSpec (B a)
     end.
Fixpoint Operations@{} (A : OpSpec@{i} I) : Type@{i}
  := match A with
     | el i => X i
     | ind_arg A B => ElDataSpec A → Operations B
     | nonind_arg A B => ∀ a, Operations (B a)
     | op_prod A B => Operations A * Operations B
     | op_skip => Unit
     end.

Universe j.
Constraint i <= j. (* Don't consider eliminating into smaller universes *)
Context (P : ∀ i, X i → Type@{j}).
Fixpoint InductiveHypothesis@{} (A : DataSpec@{i} I)
  : ElDataSpec A → Type@{j}
  := match A return ElDataSpec A → Type@{_} with
     | inc i => P i
     | inf A B => λ f, ∀ a, InductiveHypothesis (B a) (f a)
     end.
Fixpoint Methods@{} (A : OpSpec@{i} I)
  : Operations A → Type@{j}
  := match A return Operations A → Type@{_} with
     | el i => P i
     | ind_arg A B => λ f, ∀ x, InductiveHypothesis A x → Methods B (f x)
     | nonind_arg A B => λ f, ∀ a, Methods (B a) (f a)
     | op_prod A B => λ x, Methods A (fst x) * Methods B (snd x)
     | op_skip => λ _, Unit
     end.

Context (E : ∀ i x, P i x).
Fixpoint InductiveData@{} (A : DataSpec@{i} I)
  : ∀ x, InductiveHypothesis A x
  := match A return ∀ x, InductiveHypothesis A x with
     | inc i => E i
     | inf A B => λ f a, InductiveData (B a) (f a)
     end.
Fixpoint Equations@{} (A : OpSpec@{i} I)
  : ∀ op, Methods A op → Type@{j}
  := match A return ∀ op, Methods A op → Type@{_} with
     | el i => λ x y, E i x = y
     | ind_arg A B => λ f f',
       ∀ x, Equations B (f x) (f' x (InductiveData A x))
     | nonind_arg A B => λ f f',
       ∀ a, Equations (B a) (f a) (f' a)
     | op_prod A B => λ x x',
       Equations A (fst x) (fst x') * Equations B (snd x) (snd x')
     | op_skip => λ _ _,
       Unit
     end.
(* Alternatively, have InductiveData be a relation, like in general II elim *)
End el_op.

Module Initial.
Section initial.

(* TODO: prove we have sorts and operations that satisfy the eliminator *)

Universe i.
Context {I : Type@{i}} (A : OpSpec@{i} I).

Definition sorts : I → Type@{i}.
Admitted.

Definition operations : Operations@{i} sorts A.
Admitted.

Universe j.
Constraint i <= j.
Context
  (P : ∀ i, sorts i → Type@{j})
  (M : Methods@{i j} sorts P A operations)
.

Definition eliminators : ∀ i x, P i x.
Admitted.

Definition equations : Equations@{i j} sorts P eliminators A operations M.
Admitted.
End initial.
End Initial.

(* (* Specify the sorts of an inductive definition *)
Cumulative Inductive SortSpec@{i} : Type@{i+1} :=
  | u
  | nonind_ix (A : Type@{i}) (B : A → SortSpec)
  | sort_prod (A B : SortSpec)
.

(* The intended interpretation, as a bunch of families of types: *)
Fixpoint Sorts@{i ii | i < ii} (S : SortSpec@{i}) : Type@{ii}
  := match S with
     | u => Type@{i}
     | nonind_ix A B => ∀ a, Sorts (B a)
     | sort_prod A B => Sorts A * Sorts B
     end.
(* Could do an inductive version in Type@{i+1}, probably not worth it *)
(* Alternatively, just use Indices → Type@{i} *)

Fixpoint Indices (S : SortSpec@{i}) : Type@{i}
  := match S with
     | u => Unit
     | nonind_ix A B => { a : A & Indices (B a) }
     | sort_prod A B => Indices A + Indices B
     end.

Fixpoint get_sort@{i ii} {S : SortSpec@{i}}
  : Sorts@{i ii} S → Indices S → Type@{i}
  := match S return Sorts S → Indices S → Type@{i} with
     | u => λ X _, X
     | nonind_ix A B => λ X i, get_sort (X i.1) i.2
     | sort_prod A B => λ X i, match i with
       | inl a => get_sort (fst X) a
       | inr b => get_sort (snd X) b
       end
     end.
(*
Theorem isequiv_get_sort `{Funext} {S} : IsEquiv (get_sort@{i j k} (S := S)).
*)

Fixpoint Motives@{i j ii ijj} (S : SortSpec@{i})
  : Sorts@{i ii} S → Type@{ijj}
  := match S return Sorts S → Type@{ijj} with
     | u => λ X, X → Type@{j}
     | nonind_ix A B => λ f, ∀ a, Motives (B a) (f a)
     | sort_prod A B => λ x, Motives A (fst x) * Motives B (snd x)
     end.
Fixpoint Eliminators@{i j ii ijj ij} (S : SortSpec@{i})
  : ∀ A : Sorts@{i ii} S, Motives@{i j ii ijj} S A → Type@{ij}
  := match S return ∀ A : Sorts S, Motives S A → Type@{ij} with
     | u => λ X P,
       ∀ x, P x
     | nonind_ix A B => λ f f',
       ∀ a, Eliminators (B a) (f a) (f' a)
     | sort_prod A B => λ x x',
       Eliminators A (fst x) (fst x') * Eliminators B (snd x) (snd x')
     end. *)


(* Record IndSpec@{i} : Type@{i+1} := {
  IndSorts : SortSpec@{i};
  IndOps   : OpSpec@{i} (Indices IndSorts);
}.
Definition Algebra@{i ii | i < i} (S : IndSpec@{i}) : Type@{j}
  := { El : Sorts@{i ii} S.(IndSorts) & Operations (get_sort El) S.(IndOps) }. *)


