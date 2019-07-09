Require Import HoTT.Basics Coq.Unicode.Utf8.

(* Can explore replacing U with i+1 everywhere, but probably difficult *)

(* Infinitary arguments/indices are hard. *)
(* Do we care that El ((a : A) -> B a) = (a : A) -> El (B a) ? *)

(* Is it actually worth splitting TySort and TyOp? *)

Module Sem.
  Record t@{i U | i < U} := {
    Ctx              : Type@{U};
    TySort (Γ : Ctx) : Type@{U};
    TyOp   (Γ : Ctx) : Type@{U};
    Data   (Γ : Ctx) : Type@{U};

    data_to_op {Γ} : Data Γ → TyOp Γ;

    Indices : Ctx → Type@{i}; (* a small set *)

    emp : Ctx;
    ext_sort (Γ : Ctx) (A : TySort Γ) : Ctx;
    ext_op   (Γ : Ctx) (A : TyOp   Γ) : Ctx;
    ext_data (Γ : Ctx) (A : Data   Γ) : Ctx := ext_op Γ (data_to_op A);

    u          {Γ}                                                  : TySort Γ;
    ind_ix     {Γ} (A : Data Γ) (B : TySort (ext_data Γ A))         : TySort Γ;
    nonind_ix  {Γ} (A : Type@{i}) `{IsTrunc 1 A} (B : A → TySort Γ) : TySort Γ;

    el         {Γ} (i : Indices Γ)                                  : TyOp   Γ;
    ind_arg    {Γ} (A : Data Γ) (B : TyOp   (ext_data Γ A))         : TyOp   Γ;
    nonind_arg {Γ} (A : Type@{i}) `{IsHSet A}    (B : A → TyOp Γ)   : TyOp   Γ;

    inc        {Γ} (i : Indices Γ)                                  : Data   Γ;
    inf        {Γ} (A : Type@{i}) `{IsHSet A}    (B : A → Data Γ)   : Data   Γ;

    (* We expect that:
    data_to_op (inc i) = el i,
    data_to_op (inf A f) = nonind_arg A (data_to_op o f)
    *)
  }.
End Sem.

Section specs.
Universes i U.
Constraint i < U.
Context (sem : Sem.t@{i U}).

(* Close Indices under external products *)
Inductive Data (Indices : Type@{i}) : Type@{i+1} :=
  | inc (i : Indices)
  | inf (A : Type@{i}) `{IsHSet A} (B : A → Data Indices)
.
Global Arguments inc {Indices} i.
Global Arguments inf {Indices} A {_} B.
Fixpoint ElData {Γ : sem.(Sem.Ctx)} (A : Data (sem.(Sem.Indices) Γ))
  : sem.(Sem.Data) Γ
  := match A with
     | inc i => sem.(Sem.inc) i
     | inf A _ B => sem.(Sem.inf) A (ElData o B)
     end.

(*TySort and TyOp use Γ as a large non-uniform parameter, but not essentially*)
Inductive TySort (Γ : sem.(Sem.Ctx)) : Type@{i+1} :=
  | u
  | ind_ix    (A : Data (sem.(Sem.Indices) Γ))
              (B : TySort (sem.(Sem.ext_data) Γ (ElData A)))
  | nonind_ix (A : Type@{i}) `{IsTrunc@{i} 1 A} (B : A → TySort Γ)
.
Global Arguments u {Γ}.
Global Arguments ind_ix {Γ} A B.
Global Arguments nonind_ix {Γ} A {_} B.
Fixpoint ElTySort {Γ} (A : TySort Γ) : sem.(Sem.TySort) Γ
  := match A with
     | u => sem.(Sem.u)
     | ind_ix A B => sem.(Sem.ind_ix) (ElData A) (ElTySort B)
     | nonind_ix A _ B => sem.(Sem.nonind_ix) A (ElTySort o B)
     end.

Inductive TyOp (Γ : sem.(Sem.Ctx)) : Type@{i+1} :=
  | el         (i : sem.(Sem.Indices) Γ)
  | ind_arg    (A : Data (sem.(Sem.Indices) Γ))
               (B : TyOp (sem.(Sem.ext_data) Γ (ElData A)))
  | nonind_arg (A : Type@{i}) `{IsHSet A} (B : A → TyOp Γ)
.
Global Arguments el {Γ} i.
Global Arguments ind_arg {Γ} A B.
Global Arguments nonind_arg {Γ} A {_} B.
Fixpoint ElTyOp {Γ} (A : TyOp Γ) : sem.(Sem.TyOp) Γ
  := match A with
     | el i => sem.(Sem.el) i
     | ind_arg A B => sem.(Sem.ind_arg) (ElData A) (ElTyOp B)
     | nonind_arg A _ B => sem.(Sem.nonind_arg) A (ElTyOp o B)
     end.

(* Data is a subset of TyOp *)
Fixpoint data_to_op {Γ} (A : Data (sem.(Sem.Indices) Γ)) : TyOp Γ
  := match A with
     | inc i => el i
     | inf A _ B => nonind_arg A (data_to_op o B)
     end.
(*
If the equations in the semantics hold definitionally then
ElTyOp o sem.(Sem.data_to_op) = data_to_op o ElData definitionally
on concrete specifications. (an outrageous coincidence)
Proving this internally requires function extensionality.
*)

(* Here we define Ctx as the inductive recursive:
data Ctx : Type@{j}
ElCtx : Ctx → sem.(Sem.Ctx)
data Ctx where
  emp : Ctx
  ext_sort : (Γ : Ctx) → TySort (ElCtx Γ) → Ctx
  ext_op   : (Γ : Ctx) → TyOp   (ElCtx Γ) → Ctx
ElCtx emp = sem.(Sem.emp)
ElCtx (ext_sort Γ A) = sem.(Sem.ext_sort) (ElCtx Γ) (ElTySort A)
ElCtx (ext_op   Γ A) = sem.(Sem.ext_op  ) (ElCtx Γ) (ElTyOp   A)

We don't include ext_data, expecting data_to_op to work by coincidence.
*)
(*
If sem.(Sem.Ctx) : Type@{i+1}, can take Ctx to be (indexing by final sem ctx)
data PreCtx : sem.(Sem.Ctx) → Type@{i+1} where
  pre_emp : PreCtx sem.(Sem.emp)
  pre_ext_sort { γ : sem.(Sem.Ctx) & PreCtx γ } (A : TySort γ)
  pre_ext_op   { γ : sem.(Sem.Ctx) & PreCtx γ } (A : TyOp   γ)
Ctx := { γ : sem.(Sem.Ctx) & PreCtx γ }

or in the reverse order (right-nested):
data PreCtx (γ : sem.(Sem.Ctx)) : Type@{i+1} where
  pre_end
  pre_push_sort (A : TySort γ) (Γ : PreCtx (sem.(Sem.ext_sort) γ A))
  pre_push_op   (A : TyOp   γ) (Γ : PreCtx (sem.(Sem.ext_op  ) γ A))
Ctx := PreCtx sem.(Sem.emp)

Both of these have the advantage that Ctx lands in Type@{i+1} not Type@{U > i}.

However, the first keeps semantic contexts around,
while the second has a bad induction principle.

Probably best is to do everything as an ornament,
exploiting the fact that we never branch on the semantics,
and that the extra information is small.
*)

Inductive PreCtx : Type@{i} :=
  | pre_emp
  | pre_ext_sort (Γ : PreCtx)
  | pre_ext_op   (Γ : PreCtx)
.
Record CtxPair := { GoodCtx : Type@{U} ; ElGoodCtx : GoodCtx → sem.(Sem.Ctx) }.
Fixpoint ElPreCtx (Γ : PreCtx) : CtxPair
  := match Γ with
     | pre_emp        => {| GoodCtx := Unit; ElGoodCtx _ := sem.(Sem.emp) |}
     | pre_ext_sort Γ => {|
         GoodCtx := { γ : _ & TySort ((ElPreCtx Γ).(ElGoodCtx) γ) };
         ElGoodCtx x := sem.(Sem.ext_sort) _ (ElTySort x.2);
       |}
     | pre_ext_op   Γ => {|
         GoodCtx := { γ : _ & TyOp ((ElPreCtx Γ).(ElGoodCtx) γ) };
         ElGoodCtx x := sem.(Sem.ext_op) _ (ElTyOp x.2);
       |}
     end.
Definition Ctx : Type@{U} := { Γ : PreCtx & (ElPreCtx Γ).(GoodCtx) }.
Definition ElCtx (Γ : Ctx) : sem.(Sem.Ctx) := (ElPreCtx Γ.1).(ElGoodCtx) Γ.2.
Definition emp : Ctx := (pre_emp ; tt).
Definition ext_sort (Γ : Ctx) (A : TySort (ElCtx Γ)) : Ctx
  := (pre_ext_sort Γ.1; Γ.2; A).
Definition ext_op (Γ : Ctx) (A : TyOp (ElCtx Γ)) : Ctx
  := (pre_ext_op Γ.1; Γ.2; A).

(* TODO: Define the recursion principle for Ctx *)
End specs.

(* inductive-inductive specifications are given by Ctx. *)
