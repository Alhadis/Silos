(*B {section 2|The {t|sumor} Type}


{t|sumor} is also defined in the
{link http://coq.inria.fr/stdlib/Coq.Init.Specif.html |Specif} module:
[coq[
Inductive sumor (A:Type) (B:Prop) : Type :=
  | inleft : A -> A + {B}
  | inright : B -> A + {B}
 where "A + { B }" := (sumor A B) : type_scope.

Add Printing If sumor.
]coq]
And described as:
{quote|{t|sumor} is an option type equipped with the justification of why
it may not be a regular value}

 B*)

Set Implicit Arguments.

(*B Let's start with a simple case: {t|pred_sumor} returns a {t|nat}
{i|or} a proof of {i|nullity:} B*)
Definition pred_sumor: forall n, nat + { n = 0 }.
refine (fun n => 
  match n with
    | O => inright _ _
    | S x => inleft _ x
  end); intuition.
Defined.
(*B 

{p}

In the standard library, usually,
 {t|sumor} comes with another funny type. For instance: B*)
Require Peano_dec.
Check Peano_dec.O_or_S.
(*B {code}
Peano_dec.O_or_S
     : forall n : nat, {m : nat | S m = n} + {0 = n}
{end}
It is a {t|sig} inside a {t|sumor}. 
We can re-implement it with the same type:
 B*)
Definition pred_sumor_sig:
  forall n, { m : nat | S m = n } + { n = 0 }.
refine (fun n => 
  match n with
    | O => inright _ _
    | S x => inleft _ (exist _ x _)
  end); intuition.
Defined.
(*B The type of {t|pred_sumor_sig} cannot be more expressive from an
input/output point of view;
it takes {i|any} natural and returns either a natural with a proof
that it is the predecessor, or a proof that the input is zero.
{p}
 B*)

Require Compare_dec.
Check Compare_dec.lt_eq_lt_dec.
(*B {code}
Compare_dec.lt_eq_lt_dec
     : forall n m : nat, {n < m} + {n = m} + {m < n}
{end}
There, we have a {t|sumbool} inside a {t|sumor}.  
We can also re-implement it:
 B*)

Require Omega.

Definition lt_eq_lt_dec:
  forall n m, {n < m} + {n = m} + {m < n}.

refine (fix frec n m : {n < m} + {n = m} + {m < n} :=
  match n, m with
    | O, O => inleft _ (right _ _)
    | O, S _ => inleft _ (left _ _)
    | S _, O => inright _ _
    | S pn, S pm => 
      match frec pn pm with
        | inleft  (left  _) => inleft _ (left _ _)
        | inleft  (right  _) => inleft _ (right _ _)
        | inright _  => inright _ _
      end 
  end
);  omega.
Defined.
(*B Note the last {t|match-with} on the recursive call; it looks a bit
silly but actually the {i|underscores} are filled differently by Coq
and {t|refine}. {p}

Let's check some OCaml code:
 B*)
Extraction lt_eq_lt_dec.
(*B [caml[
(** val lt_eq_lt_dec : nat -> nat -> sumbool sumor **)

let rec lt_eq_lt_dec n m =
  match n with
  | O ->
    (match m with
     | O -> Inleft Right
     | S n0 -> Inleft Left)
  | S pn ->
    (match m with
     | O -> Inright
     | S pm -> lt_eq_lt_dec pn pm)
]caml]
 B*)

(*B {section 2|Notations} B*)

(*B Let's try to choose some notations for {t|sig}, {t|sumbool}, 
{t|sumor}, and their combinations. {p}

 B*)
Notation "'Sumbool' 'left'" := (left _ _) (at level 42).
Notation "'Sumbool' 'right'" := (right _ _) (at level 42).
Notation "'Sumbool' 'reduce' x" :=
  (if x then Sumbool left else Sumbool right) (at level 42).
(*B  {p} B*)
Notation "'Sig' 'no'" := (False_rec _ _) (at level 42).
Notation "'Sig' 'yes' e" := (exist _ e _) (at level 42).
Notation "'Sig' 'take' e" := 
  (match e with Sig yes ex => ex end) (at level 42).
(*B {t|(Sig map {i|f})} will be a function passing {i|f} inside a
{t|sig}:  B*)
Notation "'Sig' 'map' f" :=
  (fun x => match x with Sig yes x => Sig yes (f x) end) 
  (at level 42).
(*B {p} B*)

Notation "'Sumor' 'left' x " := (inleft _ x) (at level 42).
Notation "'Sumor' 'right'" := (inright _ _) (at level 42).
Notation "'Sumor' 'map' f 'in' x" := 
  (match x with
     | Sumor left ex => Sumor left (f ex)
     | Sumor right => Sumor right end) (at level 42).
(*B {p}
{t|(Sumorbool propagate {i|stuff})} embellishes things like the last
match-with in our previously implemented {t|lt_eq_lt_dec}:
 B*)
Notation "'Sumorbool' 'propagate' x" :=
  (match x with
     | Sumor left (Sumbool left) => Sumor left (Sumbool left)
     | Sumor left (Sumbool right) => Sumor left (Sumbool right)
     | Sumor right => Sumor right
   end) (at level 42).


(*B {section 2|Two Functions Like {t|List.find}} B*)


(*B Now we build two {t|List.find}-like functions, with their
specifications. B*)
Require Import List.
(*B
We will use
{begin list}
{*} 
{t|{b|{link http://coq.inria.fr/stdlib/Coq.Lists.List.html#nth |nth}}:
} #  forall A : Type, nat -> list A -> A -> A} 
#{br}
{t|(nth i l d)} returns the i-th element of l, or d in case of overflow.
{*} 
{t|{b|{link http://coq.inria.fr/stdlib/Coq.Lists.List.html#nth_ok |nth_ok}}:
} #  forall A : Type, nat -> list A -> A -> bool}
#{br}
{t|(nth i l d)} returns {t|true} if there is no overflow.
{*} 
{t|{b|{link http://coq.inria.fr/stdlib/Coq.Lists.List.html#In |In}}:
} #  forall A : Type, A -> list A -> Prop}
#{br}
{t|(In a l)} is a {t|Prop} telling that {t|a} is an element of {t|l}.
{end} {p}
B*)

(*B We define another proposition telling who/what is the {i|n-th}
element of a list: B*)
Definition Nth_is A (l : list A) (i : nat) (a : A) : Prop :=
  forall b, nth_ok i l b = true /\ nth i l b = a.
(*B A 
{t|{link http://coq.inria.fr/refman/Reference-Manual011.html#@command223
|Hint Unfold}} should help {t|auto}-based tactics:
 B*)
Hint Unfold Nth_is.
(*B 
{p}

We just give a name to the type of functions which decide equality on
a given type:
 B*)
Definition Eq_decision A :=
  forall a b : A, { a = b } + { a <> b }.
(*B 
{p}

And here is the first {t|List.find}.
Given a {t|list A}, an element and an equality decision function,
it returns either a natural which is the index at which the element
was found, or a proof that the element is absent from the list:
 B*)
Definition find_one_index A (eq_dec: Eq_decision A):
  forall (l : list A)  (a : A), 
    { ia : nat | Nth_is l ia a } + { ~ In a l }.

refine (fix frec l a : 
  { ia : nat | Nth_is l ia a } + { ~ In a l } :=
  match l with
    | nil => Sumor right
    | cons h t =>
      match eq_dec h a with
        | Sumbool left => Sumor left (Sig yes 0)
        | Sumbool right => 
          Sumor map (Sig map S) in (frec t a) 
      end
  end); 
  intuition;
  try match goal with | H: In _ _ |- False =>
        inversion H; intuition
      end.
Defined.
(*B 
That was astonishingly easy. {br}
The tactic
{t|{link http://coq.inria.fr/refman/Reference-Manual011.html#@tactic158
|intuition}} gets rid of all the {i|true} subgoals, 
the last {t|False} one just requires one {t|inversion}.
{p}

I tried to add mistakes to persuade myself{~}{...} 
for instance, I replaced 
{t|Sumor left (Sig yes 0)}
by {t|Sumor right} or by {t|Sumor left (Sig yes 1)},
and, indeed, the proof was impossible in these cases
(for instance, you may end up
having to prove {t|False} without any contradiction in
the hypotheses, etc.).
{p}

That was nice but this implementation can be used for an even more
precise type:
we can say that the index found is the one of the {i|first} element
matching. {p}

My first attempt at a specification got stuck in the mud because of an
operator precedence problem:
 B*)
Definition First_is_nth_wrong A (l : list A) (i : nat) (a : A) :=
    forall before, before < i -> ~ (Nth_is l before a)
    /\
    Nth_is l i a.
(*B With parentheses it is much better: B*)
Definition First_is_nth A (l : list A) (i : nat) (a : A) :=
    (forall before, before < i -> ~ (Nth_is l before a))
    /\
    Nth_is l i a.
Hint Unfold First_is_nth.
(*B  {p}

The implementation of {t|find_one_index} has the same {i|function body},
but a more tedious proof. {br}
First, one thing to remember: when using {t|destruct} or {t|induction}
after the definition of a {i|fixpoint}, it is useful
to remove the recursive call with a {t|clear frec}{note|The
problem is that the thing {i|deconstructed} is also deconstructed {i|inside}
the fixpoint, which is then kind of not equal to itself{~}{...}
you get a {q|Proof Completed} and then it breaks while type checking.
See also the comments of
{link http://www.lix.polytechnique.fr/coq/bugs/show_bug.cgi?id=2558
|bug 2558}.}. {br}
Second, there is a tricky subgoal which is not discharged by {t|intuition} or
{t|inversion}; I did not manage to {i|clean} that yet: it is  bad proof
which depends on the order of subgoals and references Coq-generated
variable names (like {t|H2}, {t|H3}, {t|x0}, etc.).

 B*)
Definition find_first_index A (eq_dec: Eq_decision A):
  forall (l : list A)  (a : A), 
    { ia : nat | First_is_nth l ia a } + { ~ In a l }.
refine (fix frec l a : 
  { ia : nat | First_is_nth l ia a } + { ~ In a l } :=
  match l with
    | nil => Sumor right
    | cons h t =>
      match eq_dec h a with
        | Sumbool left => Sumor left (Sig yes 0)
        | Sumbool right => 
          Sumor map (Sig map S) in (frec t a) 
      end
  end
); clear frec; (* we need to remove frec from the context *)
unfold First_is_nth in *; unfold Nth_is in *;
intuition;
try match goal with | H: In _ _ |- False =>
      inversion H; intuition
    end;
try match goal with H: _ < 0 |- _ => inversion H end.
(* The tricky goal: *)
destruct before.
(* case 0 *)
  assert (nth 0 (h :: t) h = a) as first_is_a. apply (H2 h).
  simpl in first_is_a. intuition.
(* case S *)
  assert (before < x0) as before_lt_x0. omega.
  simpl in H2.
  apply H in before_lt_x0. auto.
  auto.
Defined.
(*B  {p}

Let's test {t|find_first_index} with lists of naturals:
 B*)
Check Peano_dec.eq_nat_dec.
(*B {code}
Peano_dec.eq_nat_dec
     : forall n m : nat, {n = m} + {n <> m}
{end}
 B*)
Definition find_first_index_nat :=
  find_first_index Peano_dec.eq_nat_dec.
(*B  {p}
 B*)
Eval compute in
  (find_first_index_nat (42 :: 51 :: 69 :: 82 :: nil) 51).
(*B {code}
= Sumor left (Sig yes 1)
: {ia : nat | First_is_nth (42 :: 51 :: 69 :: 82 :: nil) ia 51} +
 {~ In 51 (42 :: 51 :: 69 :: 82 :: nil)}
{end}
 B*)
Time Eval compute in 
  (find_first_index_nat (42 :: 51 :: 69 :: 82 :: nil) 82).
(*B {code}
= Sumor left (Sig yes 3)
: {ia : nat | First_is_nth (42 :: 51 :: 69 :: 82 :: nil) ia 82} +
 {~ In 82 (42 :: 51 :: 69 :: 82 :: nil)}
Finished transaction in 9. secs (0.u,9.163606s)
{end}
 B*)
Time Eval compute in
  (find_first_index_nat (42 :: 51 :: 69 :: 82 :: nil) 666).
(*B {code}
= Sumorright
: {ia : nat | First_is_nth (42 :: 51 :: 69 :: 82 :: nil) ia 666} +
 {~ In 666 (42 :: 51 :: 69 :: 82 :: nil)}
Finished transaction in 1. secs (0.u,0.636903s)
{end} B*)

(*B  {p}
With a few 
{t|{link http://coq.inria.fr/refman/Reference-Manual027.html#@command318
|Extract Inductive}} commands,
the OCaml code is still quite pretty:
 B*)
Extract Inductive sumbool => "bool" ["true" "false"].
Extract Inductive sumor => "option" ["Some" "None"].
Extract Inductive list => "list" ["[]" "(::)"].
Recursive Extraction find_first_index.
(*B [caml[
type nat =
| O
| S of nat

type 'a sig0 =
  'a
  (* singleton inductive, whose constructor was exist *)

type 'a eq_decision = 'a -> 'a -> bool

(** val find_first_index :
    'a1 eq_decision -> 'a1 list -> 'a1 -> nat option **)

let rec find_first_index eq_dec l a =
  match l with
  | [] -> None
  | h::t ->
    if eq_dec h a
    then Some O
    else (match find_first_index eq_dec t a with
          | Some ex -> Some (S ex)
          | None -> None)

]caml]
{p}

Note that of course, without an {t|.mli} file, OCaml then infers a
more permissive type:
[caml[
val find_first_index :
  ('a -> 'b -> bool) -> 'a list -> 'b -> nat option
]caml]

 B*)



(*B {section 2|Embedding a Comparison For 31-bit Integers} B*)

(*B 
We make a three-options decision function
({t|{text}{ _ } + { _ } + { _ }{end}}) on the 31-bit integers
of the standard library.
 B*)
Require Import Int31.
(*B  {p}
We will wrap fancy types around the existing comparison function:
 B*)
Print compare31.
(*B {code}
compare31 = 
fun n m : int31 => (phi n ?= phi m)%Z
     : int31 -> int31 -> comparison

Argument scopes are [int31_scope int31_scope]
{end}
where
 B*)
Print comparison.
(*B {code}
Inductive comparison : Set :=
    Eq : comparison | Lt : comparison | Gt : comparison
{end} {p}

There is no algorithm {i|per se}, but we can learn 
a bit more to hack the construction of a function with tactics:
 B*)
Definition int31_comparison:
  forall (a b : int31),
    { compare31 a b = Lt } + 
    { compare31 a b = Eq } +
    { compare31 a b = Gt }.
Proof.
  intros.
  remember (compare31 a b) as cab.
  destruct cab;
  repeat match goal with
           | H: Lt = _ |- _ =>
             refine (Sumor left (Sumbool left))
           | H: Eq = _ |- _ =>
             refine (Sumor left (Sumbool right))
           | H: Gt = _ |- _ =>
             refine (Sumor right)
         end; 
  auto.
Defined.
(*B
There we build the {i|match-with} by matching the goal and then using
{t|refine} in each case.
Finally, the OCaml is simple and stupid:
 B*)
Extraction int31_comparison.
(*B [caml[
(** val int31_comparison : int31 -> int31 -> bool option **)

let int31_comparison a b =
  let cab = compare31 a b in
  (match cab with
   | Eq -> Some false
   | Lt -> Some true
   | Gt -> None)
]caml]
 B*)


(*B {ignore unfinished_business} B*)
Fixpoint for_all_bits_left_aux 
  (n:nat) (A:Type) (case0:A) (caserec:digits->int31->A->A) (i:int31) : A :=
  match n with
  | O => case0
  | S next =>
    let si := shiftl i in
      caserec (firstl i) si
        (for_all_bits_left_aux next case0 caserec si)
  end.
Definition for_all_bits_left := for_all_bits_left_aux 31.

Require Import String Ascii.
Definition int31_to_string: int31 -> string :=
  for_all_bits_left  ""%string
    (fun bit _ s => String (match bit with
                                | D0 => "0"%char
                                | D1 => "1"%char
                            end) s).
Eval compute in int31_to_string On.
(*B {code}
     = "0000000000000000000000000000000"%string
     : string
{end}
 B*)
Eval compute in int31_to_string In.
(*B {code}
     = "0000000000000000000000000000001"%string
     : string
{end}
 B*)
Eval compute in int31_to_string Tn.
(*B {code}
     = "1111111111111111111111111111111"%string
     : string
{end}
 B*)
Eval compute in int31_to_string Twon.
(*B {code}
     = "0000000000000000000000000000010"%string
     : string
{end}
 B*)


Fixpoint shift_based_comparison_aux (n : nat) (a b : int31) :=
  match n with
    | O => Eq
    | S pn =>
      match firstl a, firstl b with
        | D1, D0 => Gt
        | D0, D1 => Lt
        | _, _ => 
          shift_based_comparison_aux pn (shiftl a) (shiftl b)
      end
  end.

Lemma shift_based_comparison_ok_with_compare31:
  forall a b : int31, shift_based_comparison_aux 31 a b = compare31 a b.
intros.
destruct a. destruct b.

destruct d; destruct d30.  
Abort.

Definition shift_based_comparison:
  forall (a b : int31), { lt31 a b } + { gt31 a b } + { eq31 a b }.
(* Proof with auto using c31_eq, c31_lt, c31_gt. *)
  intros.
  remember (shift_based_comparison_aux 31 a b) as cab.
  destruct cab.
    (* refine (Sumor left (Sumbool right)). *)
    (*   induction a; induction b. *)
    (* refine (Sumor left (Sumbool left)). *)
    (* refine (Sumor right). *)
Abort.

(*B {unfinished_business} B*)