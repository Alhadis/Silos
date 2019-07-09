(** Matus Tejiscak <functor.sk@ziman>, Coq & Type Theory 2011

This is a certified compiler of a simple language with multiplicative and additive
expressions, and variables. 

I decided to intersperse the required report with the source code for
illustrativeness.
*)

(** * Imports 
I like Unicode and we also postulate proof irrelevance. 

I am unsure how bad it is to require proof irrelevance, thus postulating
an additional axiom — but otherwise proving would be probably much more tedious. *)
Require Import
  Utf8 List String ListSet ProofIrrelevance.

(** * Operators and expressions
I figure that addition and multiplication is enough for binary operators. *)
Inductive op : Set :=
  | add : op
  | mul : op.

(** Then, an expression is either a number, a variable or an (applied) binary operator.
No unary operators; they aren't needed to prove the point, anyway. 

I use string-named variables; this is closer to practicality although then we need
to remember the context as finite sets of bound names. The other option would probably be
naming the variables by natural numbers (and the context, being a function
nat → nat, would be characterized just by the upper limit of its argument),
but let's just stick with strings. *)
Inductive expr : Set :=
  | num : nat → expr
  | var : string → expr
  | biop : op → expr → expr → expr.

(** We also want some fancy notation and also a sample expression
we can try our functions on. *)

Notation "x .+ y" := (biop add x y) (at level 50, left associativity).
Notation "x .* y" := (biop mul x y) (at level 40, left associativity).
Notation "[ x ]" := (num x).

Example sample_expr := [3] .* [4] .+ [5] .* ([9] .+ var "x").

(** * Variable bindings/contexts

A set of bindings is represented simply by a list of pairs (name, value).
The _shape_ of a context is represented by a _set_ of names bound within,
represented by [list string].

I wanted to keep things as simple as possible and these list representations,
along with some utilities from the standard library fit quite well.

Definitions of bindings and utility notation (operating on both bindings
and binding shapes), along with examples, follow.
 *)

(* Variable bindings. *)
Definition binds := list (string * nat).
Notation "x ∪ y" := (set_union string_dec x y) (at level 50, left associativity).
Notation "x ∈ S" := (set_In x S) (at level 30, no associativity).
Notation "M ⊆ N" := (forall x, x ∈ M → x ∈ N) (at level 30, no associativity).
Notation "f ∘ g" := (fun  x => f (g x)) (at level 55, left associativity).

(* An example for later use. *)
Example sample_binds := ("x"%string, 9) :: ("y"%string, 4) :: nil.

(* Getting the set of bound variables of a context is a simple matter. *)
Definition boundVars : binds → list string := map (@fst _ _).

(** First, we define an "unsafe" lookup, which returns an [option nat]. However,
we don't want to carry these values around, together with monadic plumbing.
Instead, we would like, given appropriate proofs, to produce safe unwrapped
values directly. *)

Fixpoint lookup (v : string) (bs : binds) : option nat :=
  match bs with
  | nil => None
  | (p,q) :: bs' => if string_dec p v then Some q else lookup v bs'
  end.

Lemma bound_weaken : forall s n v bs, s ≠ v → v ∈ boundVars ((s,n) :: bs) → v ∈ boundVars bs.
  intros; induction bs.
    simpl in H0; destruct H0; contradiction.
    simpl in H0; destruct H0.
      contradiction. destruct H0.
      simpl; left; assumption.
      simpl; right; assumption.
Qed.

Lemma lookup_pos : forall v bs, v ∈ boundVars bs → exists n, lookup v bs = Some n.
  intros.
  induction bs.
    simpl in H; contradiction.
    destruct a; simpl; destruct (string_dec s v).
      exists n; reflexivity.
      apply IHbs; apply (bound_weaken s n); assumption.
Qed.

Lemma lookup_pos_neg : forall v bs, v ∈ boundVars bs → lookup v bs ≠ None.
  intros; destruct (lookup_pos _ _ H) as [n H0]; rewrite H0; discriminate.
Qed.

(** Given the above lemmas, we can finally define a "safe" [lookup] that returns
[nat]s directly, without wrapping them in [option]s. 

For this, we use [Program] to avoid proof clutter getting in the way of understanding
the trivial nature of the computational content. *)

Program Definition slookup (v : string) (bs : binds) (pf : v ∈ boundVars bs) : nat :=
  match lookup v bs with
  | None => _
  | Some x => x
  end.
Next Obligation.
  destruct (lookup_pos_neg v bs pf (eq_sym Heq_anonymous)).
Defined.

(** We also need to determine sets of unbound variables of expressions, along
with some related lemmas. *)

Fixpoint freeVars_expr (e : expr) : list string :=
  match e with
  | num _ => nil
  | var v => v :: nil
  | biop _ l r => freeVars_expr l ∪ freeVars_expr r
  end.

Lemma expr_subvars_l : forall o l r, freeVars_expr l ⊆ freeVars_expr (biop o l r).
  intros; simpl; apply set_union_intro1; assumption.
Qed.

Lemma expr_subvars_r : forall o l r, freeVars_expr r ⊆ freeVars_expr (biop o l r).
  intros; simpl; apply set_union_intro2; assumption.
Qed.

(** Using the provided definitions, now we can prove that the [sample_expr]ession 
is safely covered by [sample_binds]. We will need this for demonstrations later. *)

Example sample_pf : freeVars_expr sample_expr ⊆ boundVars sample_binds.
  simpl; intros; destruct H; left. assumption. destruct H.
Qed.

(** * Denotational semantics

Denotation of operators is completely straightforward. *)
Definition d_op (o : op) : nat → nat → nat :=
  match o with
  | add => plus
  | mul => mult
  end.

Lemma elim_In : forall v bs, (forall x : string, v = x ∨ False → x ∈ boundVars bs) → v ∈ boundVars bs.
  intros; exact (H v (or_introl _ (eq_refl v))).
Qed.

(** For denotation of expressions, we also use [Program] to separate computational content
from proof clutter. Note that this function already accepts an [expr]ession and [binds], along with
a proof that the expression is covered by the bindings. Under such assumptions, denotation
of an expression is always a well-defined natural number. *)

Program Fixpoint denotation (e : expr) (bs : binds) (pf : freeVars_expr e ⊆ boundVars bs) {struct e} : nat :=
  match e with
  | num x => x 
  | var v => slookup v bs _
  | biop o l r => d_op o (denotation l bs _) (denotation r bs _)
  end.
Next Obligation.
  simpl in pf; apply elim_In; assumption.
Qed.
Next Obligation.
  apply pf; apply (expr_subvars_l o l r x H).
Qed.
Next Obligation.
  apply pf; apply (expr_subvars_r o l r x H).
Qed.

(** * Operational semantics

** Compilation

In this subsection, we introduce a stack machine along with instructions it provides
and we define what code expressions compile to. *)

(** We start by describing our virtual machine. The machine contains a stack,
which we model as size-indexed. A number of items is sufficient to characterize
the stack since we only ever push [nat]s on it. *)
Inductive stack (A : Set) : nat → Set :=
  | snil : stack A O
  | spush : forall {n}, A → stack A n → stack A (S n).

Definition pop {A} {s} (st : stack A (S s)) :=
  match st with
  | spush _ x xs => (x,xs)
  end.

(** An instruction of a stack machine of type [instr s t] transforms
a stack of size [s] into a stack of size [t].  Furthermore, instructions can also
have "free variables" — we need to keep track of what variables from the context
an instruction is about to access. *)
Inductive instr : nat → nat → Set :=
  | ipush : forall {s}, nat → instr s (S s)
  | iread : forall {s}, string → instr s (S s)
  | ibiop : forall {s}, op → instr (S (S s)) (S s).

Definition freeVars_instr {s t} (i : instr s t) : list string :=
  match i with
  | ipush _ _ => nil
  | iread _ v => v :: nil
  | ibiop _ _ => nil
  end.

(** Code is a snoc-sequence of instructions, indexed by its action on stack. Again,
we define _free variables_ of a code as the set of names that could possibly be
accessed/referenced by it. 

We also define concatenation of code sequences. *)
Inductive code : nat → nat → Set :=
  | cnil : forall {s}, code s s
  | csnoc : forall {s t u}, code s t → instr t u → code s u.

Notation "a ;; b" := (csnoc a  b) (at level 29, left associativity).

Fixpoint freeVars_code {s t} (c : code s t) : list string :=
  match c with
  | cnil _ => nil
  | csnoc _ _ _ c i => set_union string_dec (freeVars_code c) (freeVars_instr i)
  end.

(* Concatenation of code sequences. *)
Definition cappend {s t u : nat} (p : code s t) (q : code t u) : code s u :=
  let cappend' := fix cappend' {s t u : nat} (q : code t u) : code s t → code s u :=
    match q in code m n return code s m → code s n with
    | cnil _ => fun p => p
    | csnoc _ _ _ c i => fun  p => cappend' _ _ _ c p ;; i
    end
  in cappend' _ _ _ q p.

Notation "a ++ b" := (cappend a b).

(** Now we have everything ready for defining the compilation function,
which is completely straightforward. 

The function [compile] returns [∀ s, code s (S s)] so that
the code is not specialized for a specific stack size.

The type also indicates that the code created by compiling
of an expression is equivalent to pushing exactly one number
on the stack. *)
Fixpoint compile (e : expr) : forall s, code s (S s) :=
  match e with
  | num x => fun _ => cnil ;; ipush x
  | var v => fun _ => cnil ;; iread v
  | biop o l r => fun _ => compile l _ ++ compile r _ ;; ibiop o
  end.

(* We try to compile the expression for the empty stack to see for ourselves. *)
Eval compute in @compile sample_expr 0.

(** ** Semantics

Now we define the operational semantics of operators, instructions
and, finally, code sequences.

In the definition of [exec] and [run], I use [refine] instead of [Program],
just to try it off.*)

(* Action of an operator. *)
Definition exec_op (o : op) {s} (st : stack nat (S (S s))) : stack nat (S s) :=
  let (y,st') := pop st in
  let (x,st'') := pop st' in
  spush _ (d_op o x y) st''.
 
(* Action of an instruction. *)
Definition exec {s t} (i : instr s t) (bs : binds)
  : freeVars_instr i ⊆ boundVars bs → stack nat s → stack nat t.
Proof.
  refine ( 
    match i as i' in instr m n
      return freeVars_instr i' ⊆ boundVars bs → stack nat m → stack nat n
    with
    | ipush _ x => fun  _ => spush _ x
    | iread _ v => fun  pf => spush _ (slookup v bs _)
    | ibiop _ o => fun  _ => exec_op o
    end
  ).
  (* Program is able to solve the obligation automatically! *)
  exact (pf v (or_introl False (eq_refl v))).
Defined.

(* Action of a code sequence. *)
Fixpoint run {s t} (c : code s t) (bs : binds)
  : freeVars_code c ⊆ boundVars bs → stack nat s → stack nat t.
Proof.
  refine (
    match c as c' in code m n
      return freeVars_code c' ⊆ boundVars bs → stack nat m → stack nat n
    with
    | cnil _ => fun  _ => id
    | csnoc _ _ _ c i => fun  pf => exec i bs _  ∘ run _ _ c bs _
    end
  ).
  intros v H; exact (pf v (set_union_intro2 string_dec v (freeVars_code c0) (freeVars_instr i) H)).
  intros v H; exact (pf v (set_union_intro1 string_dec v (freeVars_code c0) (freeVars_instr i) H)).
Defined.

(** This concludes the definitional section of the development.
Both denotational and operational semantics have been
defined and what's left is to prove that they are equivalent. *)

(* Some utilities that belong to the definitional-operational part. *)
Definition empty_stack {A} := snil A.
Definition singleton {A : Set} (x : A) := spush A x empty_stack.

(** * Proofs 

In this section we prove that our translation into stack-machine code is correct.

Let us begin with some auxiliary results about [cappend].
*)

Lemma cappend_cnil : forall {s t} (p : code s t), cappend cnil p = p.
  intros s t; induction p;
    reflexivity ||
    simpl; rewrite IHp; reflexivity.
Qed.

Lemma cappend_fvars : forall {s t u c c'},
  freeVars_code (@cappend s t u c c') ⊆ (freeVars_code c ∪ freeVars_code c').
Proof.
  intros s t u c c' v; induction c'.
    intros; simpl; simpl in H; assumption.
    intros; simpl; simpl in H; pose proof (IHc' c); clear IHc'.
    apply set_union_intro; apply set_union_elim in H; case H.
      intros; pose proof (H0 H1); apply set_union_elim in H2.
        destruct H2.
          left; assumption.
          right; apply set_union_intro1; assumption.
      intros; right; apply set_union_intro2; assumption.
Qed.  

(** We also prove that the function [compile] does not create new free variables
(other than those that were free also in the source expression). *)
Lemma compile_fvars : forall {e s}, freeVars_code (@compile e s) ⊆ freeVars_expr e.
  intro e; induction e; try (intros; simpl in H; assumption).
  intros; simpl; simpl in H.
    pose proof (cappend_fvars x H).
    destruct (set_union_elim string_dec _ _ _ H0).
      apply set_union_intro1; exact (IHe1 s x H1).
      apply set_union_intro2; exact (IHe2 (S s) x H1).
Qed.

(** The following proves that (under a number of assumptions about context coverage),
running the code [a ++ b] is equivalent to running first [a], and then [b]. *)
Lemma run_cappend : forall {s t u} (p : code s t) (q : code t u) (st : stack nat s) (bs : binds)
  (pf_o : freeVars_code (cappend p q) ⊆ boundVars bs)
  (pf_p : freeVars_code p ⊆ boundVars bs)
  (pf_q : freeVars_code q ⊆ boundVars bs)
  , run (cappend p q) bs pf_o st = run q bs pf_q (run p bs pf_p st).
Proof.
  intros s t u p q; revert p; induction q.
    intros; simpl;
      rewrite (proof_irrelevance (freeVars_code p ⊆ boundVars bs) pf_o pf_p);
      reflexivity.
    intros; simpl.
      set (pf_r := fun  (v : string) (H : v ∈ freeVars_instr i) => pf_o v
        (set_union_intro2 string_dec v (freeVars_code (cappend p q)) (freeVars_instr i) H));
      set (pf_s := fun  (v : string) (H : v ∈ freeVars_code (cappend p q)) => pf_o v
        (set_union_intro1 string_dec v (freeVars_code (cappend p q)) (freeVars_instr i) H));
      set (pf_t := fun  (v : string) (H : v ∈ freeVars_instr i) => pf_q v
        (set_union_intro2 string_dec v (freeVars_code q) (freeVars_instr i) H));
      set (pf_u := fun  (v : string) (H : v ∈ freeVars_code q) => pf_q v
        (set_union_intro1 string_dec v (freeVars_code q) (freeVars_instr i) H)).
      rewrite <- (IHq p st bs pf_s pf_p).
      rewrite (proof_irrelevance (freeVars_instr i ⊆ boundVars bs) pf_r pf_t).
      reflexivity.
Qed.

(** Now we are ready to prove the corollary that if it is safe to evaluate an expression
within a context, then it is safe to run the corresponding compiled code in that context. *)
Corollary compiled_fv : forall {e bs s}, freeVars_expr e ⊆ boundVars bs
  → freeVars_code (@compile e s) ⊆ boundVars bs.
Proof.
  intros; apply H; pose proof (compile_fvars x H0); assumption.
Qed.

(** What follows is a variation of the correctness theorem, operating on any stack. This is the central
theorem about the correctness of the compiler and the bulk of the work is done here.

The theorem says that (given appropriate circumstances) running the code of an expression
on an arbitrary stack is equivalent to pushing the denotation of the expression onto that
stack. 

A weaker claim also follows from the type of code returned by [compile]. *)
Theorem correctness_strong
  : forall {e : expr} {s : nat} {st : stack nat s} {bs : binds}
  (pf_e : freeVars_expr e ⊆ boundVars bs) (pf_c : freeVars_code (compile e _) ⊆ boundVars bs),
  run (compile e _) bs pf_c st = spush _ (denotation e bs pf_e) st.
Proof.
  induction e; try reflexivity.
    simpl; intros. rewrite (
      proof_irrelevance _
        (pf_c s (set_union_intro2 string_dec s nil (s :: nil) (or_introl False (eq_refl s))))
        (denotation_obligation_1 (var s) bs pf_e s (eq_refl (var s)))
      ); reflexivity.
  intros; simpl.
    set (P1 := fun  (v : string) (H : v ∈ freeVars_code (cappend (compile e1 _) (compile e2 _))) =>
      pf_c v (set_union_intro1 string_dec v (freeVars_code (cappend (compile e1 _) (compile e2 _))) nil H)).
    set (P2 := denotation_obligation_2 (biop o e1 e2) bs pf_e o e1 e2 (eq_refl (biop o e1 e2))).
    set (P3 := denotation_obligation_3 (biop o e1 e2) bs pf_e o e1 e2 (eq_refl (biop o e1 e2))).
    rewrite (run_cappend (compile e1 _) (compile e2 _) st bs P1 (compiled_fv P2) (compiled_fv P3)).
    rewrite (IHe1 s st bs P2 (compiled_fv P2)).
    rewrite (IHe2 (S s) (spush nat (denotation e1 bs P2) st) bs P3 (compiled_fv P3)).
  reflexivity.
Qed.

(** ** Correctness

The main theorem, proving the correctness of the compiler and interpreter. 

(An instance of [pf_c] may be obtained as [compiled_fv pf_e]
but for convenience, this theorem accepts any proof of that hypothesis.)
*)
Corollary correctness : forall (e : expr) (bs : binds)
  (pf_e : freeVars_expr e ⊆ boundVars bs)
  (pf_c : freeVars_code (compile e _) ⊆ boundVars bs),
  run (compile e _) bs pf_c empty_stack = singleton (denotation e bs pf_e).
Proof.
  intros; apply (correctness_strong pf_e pf_c).
Qed.

(** For illustration, we run the code for the [sample_expr]ession. *)
Eval compute in run (compile sample_expr _) sample_binds (compiled_fv sample_pf) empty_stack.






























