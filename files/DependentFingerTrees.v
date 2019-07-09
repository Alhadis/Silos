Require Import Coq.Arith.Arith.
Require Import Coq.Arith.EqNat.
Require Import Coq.omega.Omega.
Require Import Coq.Lists.List.
Require Import Basics.
Require Import Logic.JMeq.
Require Import Program.
Require Import Coq.Logic.FunctionalExtensionality.

(** Module defining fingertrees ala Mathieu Sozeau (WIP) *)

Module FingerTrees.

  Import List.ListNotations.

  Open Scope list_scope.

  (** ============================================================================== *)
  (**                                 type classes                                   *)
  (** ============================================================================== *)


  Class monoid A := Monoid {
    mempty : A;
    mappend : A -> A -> A;
    mempty_l : forall x, mappend mempty x = x;
    mempty_r : forall x, mappend x mempty = x;
    mappend_assoc :
      forall x y z, mappend x (mappend y z) = mappend (mappend x y) z;
  }.
  Notation "a <+> b" := (mappend a b) (at level 51, right associativity).

  (** A Functor typeclass *)
  Class functor F := Functor {
    map : forall {A B : Type}, (A -> B) -> F A -> F B;

    map_id : forall {A : Type} (f : F A), map (fun x => x) f = f;
    map_comp : forall {A B C : Type} (f : B -> C) (g : A -> B) (x : F A),
        map (fun x => f (g x)) x = (fun x => map f (map g x)) x;
  }.

  (** Something that can be reduced *)
  Class reduce F := Reduce {
    reducer : forall {A} {B}, (A -> B -> B) -> (F A -> B -> B);
    reducel : forall {A} {B}, (B -> A -> B) -> (B -> F A -> B);
  }.

  Class measured (A v : Type) {mv:monoid v} := Measured {
    measure : A -> v;
  }.


  (** ============================================================================== *)
  (**                                 list instances                                 *)
  (** ============================================================================== *)

  (** All reducibles can be folded into a list *)
  Definition to_list {F: Type -> Type} {r: reduce F} {A : Type} (s : F A) : list A :=
    reducer cons s nil.

  (** List are monoids*)
  Instance list_monoid (A: Type) : monoid (list A) :=
    {|
      mempty := [];
      mappend := @app A;
    |}.
  Proof.
    - intros. reflexivity.
    - apply app_nil_r.
    - apply app_assoc.
  Qed.


  (** List can be reduced using fold_right/left *)
  Instance list_reduce : reduce list :=
    {|
      reducer := fun _ _ fn xs z => List.fold_right fn z xs;
      reducel := fun _ _ fn z xs => List.fold_left fn xs z;
    |}.

  (** Lists are functors *)
  Instance list_functor : functor list :=
    {|
      map := @List.map;
    |}.
  Proof.
    - intros. induction f; [reflexivity|]. simpl. rewrite IHf. reflexivity.
    - induction x; [reflexivity|]. simpl. rewrite IHx. reflexivity.
  Qed.

  Section Nodes.
    Variable (v : Type).
    Context {Mon : monoid v}.
    Variable (A : Type).
    Context {Meas : measured A v}.
    Notation "'<<' x '>>'" := (measure x) (at level 51, right associativity).

    (** ============================================================================ *)
    (**                                   node                                       *)
    (** ============================================================================ *)

    (** A node contains two or three values *)
    Inductive node : Type :=
    | node2: forall x y s, (s = <<x>> <+> <<y>>) -> node
    | node3: forall x y z s, (s = <<x>> <+> <<y>> <+> <<z>>) -> node.

    (** Right-reduce a node *)
    Definition nd_reducer {B : Type} : (A -> B -> B) -> node -> B -> B :=
      fun op nd z => match nd with
                  | node2 a b _ _  => op a (op b z)
                  | node3 a b c _ _ => op a (op b (op c z))
                  end.

    (** Left-reduce a node *)
    Definition nd_reducel {B : Type} : (B -> A -> B) -> B -> node -> B :=
      fun op z nd => match nd with
                  | node2 b a _ _   => op (op z b) a
                  | node3 c b a _ _ => op (op (op z c) b) a
                  end.

    Program Definition nd2 (a b : A) : node := node2 a b (<<a>> <+> <<b>>) _.
    Program Definition nd3 (a b c : A) : node :=
      node3 a b c (<<a>> <+> <<b>> <+> <<c>>) _.

  End Nodes.

  Arguments node2 {v} {Mon} {A} {Meas} _ _ _.
  Arguments node3 {v} {Mon} {A} {Meas} _ _ _ _ .
  Arguments nd2 {v} {Mon} {A} {Meas}.
  Arguments nd3 {v} {Mon} {A} {Meas}.

  Definition node_measure {v A : Type} {Mon : monoid v} {Meas : measured A v}
             (n : node v A) : v :=
    match n with
    | node2 x y s p => s
    | node3 x y z s p => s
    end.

  Instance nd_measured {v A : Type} (Mon : monoid v) (Meas:measured A v) :
    measured (node v A) v
    := {|
        measure := @node_measure v A Mon Meas;
      |}.
  
  Section Digit.
    Variable (A : Type).
    (** ============================================================================ *)
    (**                                  digit                                       *)
    (** ============================================================================ *)


    (** Digits hold one to four elements *)
    Inductive digit  : Type :=
    | one : A -> digit 
    | two : A -> A -> digit 
    | three : A -> A -> A -> digit 
    | four : A -> A -> A -> A -> digit.

    (** Digits can be reduced right *)
    Definition digit_reducer {B : Type} (op: A -> B -> B) dg z :=
      match dg with
      | one a => op a z
      | two a b => op a (op b z)
      | three a b c => op a (op b (op c z))
      | four a b c d => op a (op b (op c (op d z)))
      end.

    (** Digits can be reduced left *)
    Definition digit_reducel {B : Type} (op: B -> A -> B) z dg :=
      match dg with
      | one a => op z a
      | two b a => op (op z b) a
      | three c b a => op (op (op z c) b) a
      | four d c b a => op (op (op (op z d) c) b) a
      end.

  End Digit.

  Arguments one {A} _.
  Arguments two {A} _ _.
  Arguments three {A} _ _ _.
  Arguments four {A} _ _ _ _.

  (** Digits can be reduced *)
  Instance digit_reduce : reduce digit :=
    {|
      reducer := @digit_reducer;
      reducel := @digit_reducel;
    |}.

  Definition digit_map {A B : Type} (fn : A -> B) (x : digit A) : digit B :=
    match x with
    | one a => one (fn a)
    | two a b => two (fn a) (fn b)
    | three a b c => three (fn a) (fn b) (fn c)
    | four a b c d => four (fn a) (fn b) (fn c) (fn d)
    end.

  (** Digits are functors *)
  Instance digit_functor : functor digit :=
    {|
      map := @digit_map;
    |}.
  Proof.
    - intros. destruct f; reflexivity.
    - intros. destruct x; reflexivity.
  Defined.

  (** Convert a node to a digit *)
  Fixpoint to_digit {v A:Type} {Mon : monoid v} {Meas : measured A v}
           (nd : node v A) : digit A :=
    match nd with
    | node2 a b   _ _ => two a b
    | node3 a b c _ _ => three a b c
    end.

  Notation "'<<' x '>>'" := (measure x) (at level 51, right associativity).

  Definition digit_measure {v A : Type} {Mon : monoid v} {Meas : measured A v}
             (d : digit A) : v :=
    match d with
    | one a => <<a>>
    | two a b => <<a>> <+> <<b>>
    | three a b c => <<a>> <+> <<b>> <+> <<c>>
    | four a b c d => <<a>> <+> <<b>> <+> <<c>> <+> <<d>>
    end.

  Instance dg_measured {v A : Type} (Mon : monoid v) (Meas:measured A v) :
    measured (digit A) v
    := {|
        measure := @digit_measure v A Mon Meas;
      |}.

  (** ============================================================================ *)
  (**                                  fingertree                                  *)
  (** ============================================================================ *)

  (** A fingertree is either empty, a single thing, or a deeper fingertree
      along with a prefix digit and a suffix digit *)
  Inductive fingertree (v A : Type) {Mon : monoid v} {Meas : measured A v} : v -> Type :=
  | empty : fingertree v A mempty
  | single : forall (x:A), fingertree v A (<<x>>)
  | deep : forall (pf : digit A) (mms:v),
      @fingertree v (node v A) Mon (nd_measured Mon Meas) mms ->
      forall (sf : digit A), fingertree v A (<<pf>> <+> mms <+> <<sf>>).

  Arguments empty {v} {A} {Mon} {Meas}.
  Arguments single {v} {A} {Mon} {Meas} _.
  Arguments deep {v} {A} {Mon} {Meas} pf {mms}.


  Program Fixpoint addl {v A : Type} {Mon : monoid v} {Meas : measured A v}
          {ms : v} (x:A) (tr : fingertree v A ms) :
    fingertree v A (<<x>> <+> ms) :=
    match tr with
    | empty => single x
    | single a => deep (one x) empty (one a)
    | deep (one a) m sf => deep (two x a) m sf
    | deep (two a b) m sf => deep (three x a b) m sf
    | deep (three a b c) m sf => deep (four x a b c) m sf
    | deep (four a b c d) m sf => deep (two x a) (addl (nd3 b c d) m) sf
    end.

  Tactic Notation "monoid_tac" := simpl; rewrite ?mappend_assoc; rewrite ?mempty_r;
                                  try reflexivity.

  Obligation Tactic := program_simpl; simpl; monoid_tac.

  Program Fixpoint digit_to_tree {v A : Type} {Mon : monoid v} {Meas : measured A v}
          {ms : v} (d:digit A) : fingertree v A (<<d>>) :=
    match d with
    | one a => single a
    | two a b => deep (one a) empty (one b)
    | three a b c => deep (two a b) empty (one c)
    | four a b c d => deep (two a b) empty (two c d)
    end.

  Section Size.

    Definition digit_size {A : Type} (size : A -> nat) (d : digit A) := 
      match d with
        | one x => size x
        | two x y => size x + size y
        | three x y z => size x + size y + size z
        | four x y z w => size x + size y + size z + size w
      end.

    Definition node_size {v A : Type} {Mon : monoid v} {Meas : measured A v}
               (size : A -> nat) (d : node v A) :=
      match d with
        | node2 x y _ _  => size x + size y
        | node3 x y z _ _ => size x + size y + size z
      end.

    Fixpoint tree_size' {v A : Type} {Mon : monoid v} {Meas : measured A v}
             {ms : v} (size : A -> nat) (t : fingertree v A ms) : nat :=
      match t with
        | empty => 0
        | single x => size x
        | deep xs x ys =>
          digit_size size xs + tree_size' (node_size size) x + digit_size size ys
      end.

    Definition tree_size {v A : Type} {Mon : monoid v} {Meas : measured A v}
               {ms : v} (t : fingertree v A ms) : nat :=
      tree_size' (fun _ => 1) t.

  End Size.
  










  Check node.
