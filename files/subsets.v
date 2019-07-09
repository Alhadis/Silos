
(*B 
{section 3|Prelude}

We start with this classical command, everything else
we need for now is already in Coq's pre-loaded module of the standard
library
(the {link http://coq.inria.fr/stdlib/Coq.Init.Prelude.html
|Prelude} module). B*)
Set Implicit Arguments.

(*B 

The type {t|sig}{note|The name comes from {q|Sigma};
{link http://en.wikipedia.org/wiki/Intuitionistic_type_theory#.CE.A3-types
|Σ-Types}.}
is defined in the
{link http://coq.inria.fr/stdlib/Coq.Init.Specif.html
|Specif} module  together with the associated notations:
[coq[
Inductive sig (A : Type) (P : A -> Prop) : Type :=
    exist : forall x : A, P x -> sig P
    
Notation "{ x | P }" := (sig (fun x => P)) : type_scope.
Notation "{ x : A | P }" :=
    (sig (fun x:A => P)) : type_scope.
]coq]
For instance, {t|{text}{x : nat | x > 42}{end}} is the type of the
naturals strictly bigger than {i|42}.
{p}

We also need {t|False_rec} (defined while defining the {t|False}
#proposition:
#{t|Inductive False : Prop :=.}
in the
{link http://coq.inria.fr/stdlib/Coq.Init.Logic.html |Logic} module).
It will be useful to be able to put {q|something}
for the cases which {i|never} happen 
(i.e. an {q|{t|assert false}} in OCaml).
{p}

This deserves a few more notations:
 B*)
Notation "'Sig_no'"  := (False_rec _ _) (at level 42).
Notation "'Sig_yes' e" := (exist _ e _) (at level 42).
Notation "'Sig_take' e" := 
  (match e with Sig_yes ex => ex end) (at level 42). 

(*B {section 3|Examples} 

{section 4|The Trivial One}

Let's start with the simplest example I could find.
A function returning the successor of a natural number, and telling so in
its type:
B*)
Definition succ_strong: forall (n : nat), {m : nat | m = S n}.
  refine (fun n => Sig_yes (S n)). trivial.
Defined.
(*B
It uses the
{link http://coq.inria.fr/refman/Reference-Manual011.html#@tactic5 |refine}
tactic
{note|see also
this
{link http://coq.inria.fr/refman/Reference-Manual013.html#@tactic186 |example}}
which
{quote|{i|allows to give an exact proof, [{...}] like {t|exact},
with a big difference: the user can leave
some holes (denoted by {t|_} or {t|(_:type)}) in the term. {t|refine} will
generate as many subgoals as they are holes in the term.}}
The {i|hack} is to use {t|refine} to provide the {i|body} of the
function definition
while in proof mode; and hence be able to provide the
proof(s) of the specification part later.

In our case, there is only one generated subgoal (by the second
{q|{t|_}} in the {t|Sig_yes} notation) and it is (solved by)
{i|trivial}. {p}

Without the {t|refine} tactic we would have to provide
the {t|(P x)} argument
of the {t|exist} constructor {q|by hand}: B*)
Definition succ_strong_by_hand: 
  forall (n : nat), {m : nat | m = S n} :=
    fun n => 
      exist (* The P : A -> Prop  *) _ 
            (* The x : A   *) (S n)
            (* The P x *) (eq_refl (S n)).
(*B The first underscore is inferred by Coq (not through {t|refine}): B*)
Definition succ_strong_no_inference_at_all: 
  forall (n : nat), {m : nat | m = S n} :=
    fun n => 
      exist (* The P : A -> Prop  *) (fun t => eq t (S n)) 
            (* The x : A   *) (S n)
            (* The P x *) (eq_refl (S n)).
(*B
Anyway, this would not scale to more complex types
(it took me already quite some time to come up with the right {t|eq}
and {t|eq_refl}).
With {t|refine} instead, we let
{i|underscores} for the {q|proofs} and we provide them later
with usual Coq tactics.
{p}

Do not forget the {t|Defined} instead of {t|Qed}, so that Coq keeps
the {i|proof} of the definition (with {t|Qed}, 
{link http://coq.inria.fr/refman/Reference-Manual003.html#@command26
|it would become} {q|Opaque}). {p}

We can already check the generated OCaml code:
B*)
Extraction succ_strong.
(*B [caml[
(** val succ_strong : nat -> nat **)
let succ_strong n =
  S n
]caml]
{p}
 B*)

(*B 

{section 4|A Non-Total Function}

Let's see another example:
{t|pred_strong} which can be called only for {t|n > 0}.
 B*)
Definition pred_strong :
    forall n : nat, n > 0 -> {m : nat | n = S m}.
  refine (fun n =>
    match n with
      | O => fun _ => Sig_no
      | S pn => fun _ => Sig_yes pn
    end).
  (*B
    # The function has two arguments, {t|n} and a proof that {t|n > 0}.
    This time two goals remain to fill{~}{...} B*)
  (* n : nat    _H : 0 > 0  |-   False *)
  inversion _H.
  (*  n : nat   pn : nat    _H : S pn > 0 |-    S pn = S pn *)
  reflexivity. 
  (* Proof Completed. *)
  (*B
     {t|pred_strong} would be now perfectly usable, but
     we are not yet completely 
     happy because the proof is not {q|well engineered}:
     it references internal-state stuff like {q|{t|_H}}, and it
     depends on the order of the
     subgoals{note|CPDT has plenty of very interesting discussions and 
     justifications about the subject, e.g. in the
     {q|{link http://adam.chlipala.net/cpdt/html/Intro.html |Intro}} or the
     {q|{link http://adam.chlipala.net/cpdt/html/Large.html |Large}} chapters.}.
     B*)
  Restart.
  (*B We can  put everything together in one {q|chain of tactics}
  without having references to local variables. We use the
  {t|{link http://coq.inria.fr/refman/Reference-Manual012.html#@tactic181 |solve}}
  tactic which simply tries to {i|solve} the goal with one of the branches
  given as arguments.
  We match the goal looking for hypotheses looking like the previous
  {t|_H} to invert them, for the other goal, we call {t|auto}.
  B*)
  refine (fun n =>
    match n with
      | O => fun _ => Sig_no
      | S pn => fun _ => Sig_yes pn
    end);
  solve 
  [ match goal with H: 0 > 0 |- _ =>  inversion H end
    | auto ].
  (* Proof Completed. *)
  (*B That's nicer.
  For posterity, we can also define the two following pieces of {t|Ltac}
  which are reusable and {i|mostly} clean.
  B*)
  Restart.
  (*B 
     {t|solve_by_inversion} will try to solve the goal by inverting
     all the hypotheses{note|There is a more complete/searching one {link
     http://coq.inria.fr/cocorico/solve%20by%20inversion%20%28tactic%29
     |on Cocorico}, the Coq wiki.}.
  B*)
  Ltac solve_by_inversion :=
    match goal with
      | H:_ |- _ =>
        solve [  inversion H | clear H; solve_by_inversion
          | fail 2 "Could not solve by inversion" ]
    end.
  (*B {t|invert_or_auto} tries the previous one, and if it fails then
  {t|auto}. B*)
  Ltac invert_or_auto := 
    try solve_by_inversion;
      solve [ auto 
        | fail 2 "Could not solve by inversion nor auto" ].
  (*B With them, we can solve this even more elegantly: B*)
  refine (fun n =>
    match n with
      | O => fun _ => Sig_no
      | S pn => fun _ => Sig_yes pn
    end); invert_or_auto.
  (* Proof Completed. *)
Defined.

(*B {ignore} B*)
(*
   Test the tactics
   Lemma ttt: forall (n : nat), False.  invert_or_auto. *)
(*B {end} B*)

(*B {p}

Now the funny part:
the function {t|pred_strong} takes as input
an implicit natural number {i|n} and a {q|proof that {i|n > 0}}: B*)
Theorem two_gt_0 : 2 > 0.
  auto.
Qed.
Eval compute in pred_strong two_gt_0.
(*B {code}
= Sig_yes 1
: {m : nat | 2 = S m}
{end} B*)

(*B Anyway, in OCaml, it still looks pretty {i|normal}: B*)
Extraction pred_strong.
(*B [caml[
(** val pred_strong : nat -> nat **)

let pred_strong = function
| O -> assert false (* absurd case *)
| S pn -> pn ]caml] B*)

(*B 
The eager reader can continue with CPDT's
{link http://adam.chlipala.net/cpdt/html/Subset.html
|Subset} chapter to see more implementations of {q|{t|pred}} with
other rich dependent types.
B*)

(*B {section 4|A {t|List.map}}

Here is an implementation of {t|List.map} with a {t|sig} return type
specifying what the result actually {i|is}.

B*)
Section List_map.
(*B We use Coq's basic lists B*)
  Require Import List.
  
  (*B and we describe what the map function should do with an
     inductive proposition. {t|map_spec} links
     the input list, the input function and the resulting function.
     B*)
  Inductive map_spec (A B: Set):
    (A -> B) -> (list A) -> (list B) -> Prop :=
  | ms_empty: forall f, map_spec  f nil nil
  | ms_step: forall f a la b lb,
    (b = f a) -> map_spec f la lb ->
    map_spec f (a :: la) (b :: lb).

  (*B  {p}
     Here is the signature of the {t|specified_map}: B*)
  Definition specified_map (A B: Set): 
    forall (f: A -> B) (l: list A),
      { lm : list B | map_spec f l lm }.
  (*B 
     Simply because it is fun, we use the
     {t|{link http://coq.inria.fr/refman/Reference-Manual011.html#@command230
     |Proof with}} command which gives a meaning to the {q|{t|...}} notation.
     We feed {t|auto} with the constructors of {t|map_spec} (this
     could have been done also with a
      {link http://coq.inria.fr/refman/Reference-Manual011.html#@command218 |Hint}).
     B*)
  Proof with eauto using ms_empty, ms_step.
  (*B Without the notation {t|Sig_take}, we simply do pattern matching
     with one case: B*)
    refine (fix fx (f: A -> B) (l: list A):
      { lm : list B | map_spec f l lm } :=
      match l with
        | nil => Sig_yes nil
        | cons h t =>
          match fx f t with
            | Sig_yes ll => Sig_yes (f h :: ll)  
          end
      end)...
    (* Proof Completed. *)

    (*B and that's {i|done}.
       But If we want to play with the notation, we
       introduce a tiny problem: B*)
    Restart.
    refine (fix fx (f: A -> B) (l: list A):
      { lm : list B | map_spec f l lm } :=
      match l with
        | nil => Sig_yes nil
        | cons h t => Sig_yes (f h :: (Sig_take fx f t))
      end)... 
    (*B There we are stuck with a {t|(let (ex, _) := fx f t in ex)}
       in the middle of the goal 
       which {t|auto} does not want to expand any more{~}{...} B*)
    Restart.
    
    (*B We can ask Coq to force it: B*)
    refine (fix fx (f: A -> B) (l: list A):
      { lm : list B | map_spec f l lm } :=
      match l with
        | nil => Sig_yes nil
        | cons h t => Sig_yes (f h :: (Sig_take fx f t))
      end);
    try (destruct (fx f t))...
    (*B And get the {q|{t|Proof Completed}} 
       but we can still try to make something cleaner. B*) 
    Restart.
    (*B
       After a bit of 
       {link
http://thread.gmane.org/gmane.science.mathematics.logic.coq.club/1115/focus=1119
       |googling}-trial-and-error, we get a tactic to force the {t|destruct}
       on our notation.
       B*)
    Ltac with_sig_take :=
      repeat
        match goal with
          | [ |- context[ match ?E with Sig_yes x => _ end ] ] =>
            idtac "Destructing" E; destruct E
        end.
    refine (fix fx (f: A -> B) (l: list A):
      { lm : list B | map_spec f l lm } :=
      match l with
        | nil => Sig_yes nil
        | cons h t => Sig_yes (f h :: (Sig_take fx f t))
      end);
      with_sig_take...
    (* Proof Completed. *)  
  Defined.

End List_map.

(*B
{p}
Let's do some tests{~}{...} B*)
Eval compute in
  (specified_map (fun x => x + 42) (0 :: 1 :: 2 :: 4 :: nil)).
(*B {code}
= Sig_yes (42 :: 43 :: 44 :: 46 :: nil)
: {lm : list nat |
 map_spec (fun x : nat => x + 42) (0 :: 1 :: 2 :: 4 :: nil) lm}
{end}
{p}

We can also call {t|pred_strong} on a list of {i|wrapped} positive
naturals: B*)
Inductive strictly_positive : Set :=
| gt_0: forall n : nat, (n > 0) -> strictly_positive.

Lemma one_gt_0: 1 > 0. auto. Qed.
Lemma three_gt_0: 3 > 0. auto. Qed.

Eval compute in 
  (specified_map 
    (fun t => 
      match t with
        | gt_0 x x_gt_0 => Sig_take pred_strong x_gt_0
      end)
    ((gt_0 one_gt_0) :: (gt_0 two_gt_0) :: 
      (gt_0 three_gt_0) :: nil)).
(*B {code}
= Sig_yes (0 :: 1 :: 2 :: nil)
: {lm : list nat |
  map_spec
    (fun t : strictly_positive =>
     match t with
     | gt_0 x x_gt_0 => let (ex, _) := pred_strong x_gt_0 in ex
     end) (gt_0 one_gt_0 :: gt_0 two_gt_0 :: gt_0 three_gt_0 :: nil) lm}
{end} B*)

(*B {p}
Finally, let's have a look at the OCaml code: B*)
Recursive Extraction specified_map.
(*B [caml[
type 'a list =
| Nil
| Cons of 'a * 'a list

type 'a sig0 =
  'a
  (* singleton inductive, whose constructor was exist *)

(** val specified_map : ('a1 -> 'a2) -> 'a1 list -> 'a2 list **)

let rec specified_map f = function
| Nil -> Nil
| Cons (h, t) -> Cons ((f h), (specified_map f t))
]caml] B*)

