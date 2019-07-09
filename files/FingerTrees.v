Require Import Coq.Arith.Arith.
Require Import Coq.Arith.EqNat.
Require Import Coq.omega.Omega.
Require Import Coq.Lists.List.
Require Import Basics.
Require Import Logic.JMeq.
Require Import Coq.Logic.FunctionalExtensionality.

(** Module defining fingertrees ala Hinze and Paterson and verifying them*)

Module FingerTrees.

  Import List.ListNotations.

  Open Scope list_scope.

  (** ============================================================================== *)
  (**                                 type classes                                   *)
  (** ============================================================================== *)

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

  (** ============================================================================== *)
  (**                                 list instances                                 *)
  (** ============================================================================== *)

  (** All reducibles can be folded into a list *)
  Definition to_list {F: Type -> Type} {r: reduce F} {A : Type} (s : F A) : list A :=
    reducer cons s nil.

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

  (** ============================================================================== *)
  (**                                    node                                        *)
  (** ============================================================================== *)

  (** A node contains two or three values *)
  Inductive node (A:Type) : Type :=
  | node2: A -> A -> node A
  | node3: A -> A -> A -> node A.

  Arguments node2 {A} _ _.
  Arguments node3 {A} _ _ _.

  (** Right-reduce a node *)
  Definition nd_reducer {A B : Type} : (A -> B -> B) -> node A -> B -> B :=
    fun op nd z => match nd with
                | node2 a b => op a (op b z)
                | node3 a b c => op a (op b (op c z))
                end.

  (** Left-reduce a node *)
  Definition nd_reducel {A B : Type} : (B -> A -> B) -> B -> node A -> B :=
    fun op z nd => match nd with
                | node2 b a => op (op z b) a
                | node3 c b a => op (op (op z c) b) a
                end.

  (** Nodes can be reduced *)
  Instance node_reduce : reduce node :=
    {|
      reducer := @nd_reducer;
      reducel := @nd_reducel;
    |}.

  (** Right-reducing a node over an accumulator that is the concatenation
      of two lists xs and ys is the same as using just xs as the accumulator
      and then appending ys. I.e. reducer does not touch the accumulator.
      Only works if the operator associates over append.
  *)
  Lemma nd_reducer_app :
    forall {A B} (op : A -> list B -> list B) (a : node A) (xs ys : list B),
      (forall a (xs ys : list B), op a (xs ++ ys) = (op a xs) ++ ys) ->
      nd_reducer op a (xs ++ ys) = nd_reducer op a xs ++ ys.
  Proof.
    intros. destruct a; simpl; rewrite ?H; reflexivity.
  Qed.

  Definition nd_map {A B : Type} (fn : A -> B) (x : node A) :=
    match x with
    | node2 a b => node2 (fn a) (fn b)
    | node3 a b c => node3 (fn a) (fn b) (fn c)
    end.

  (** Nodes are functors *)
  Instance node_functor : functor node :=
    {|
      map := @nd_map
    |}.
  Proof.
    - intros. destruct f; reflexivity.
    - intros. destruct x; reflexivity.
  Defined.

  (** ============================================================================== *)
  (**                                    digit                                       *)
  (** ============================================================================== *)

  (** Digits hold one to four elements *)
  Inductive digit (A:Type) : Type :=
  | one : A -> digit A
  | two : A -> A -> digit A
  | three : A -> A -> A -> digit A
  | four : A -> A -> A -> A -> digit A.

  Arguments one {A} _.
  Arguments two {A} _ _.
  Arguments three {A} _ _ _.
  Arguments four {A} _ _ _ _.

  (** Digits can be reduced right *)
  Definition digit_reducer {A B : Type} (op: A -> B -> B) dg z :=
    match dg with
    | one a => op a z
    | two a b => op a (op b z)
    | three a b c => op a (op b (op c z))
    | four a b c d => op a (op b (op c (op d z)))
    end.

  (** Digits can be reduced left *)
  Definition digit_reducel {A B : Type} (op: B -> A -> B) z dg :=
    match dg with
    | one a => op z a
    | two b a => op (op z b) a
    | three c b a => op (op (op z c) b) a
    | four d c b a => op (op (op (op z d) c) b) a
    end.

  (** Digits can be reduced *)
  Instance digit_reduce : reduce digit :=
    {|
      reducer := @digit_reducer;
      reducel := @digit_reducel;
    |}.

  Definition digit_map {A B : Type} (fn : A -> B) (x : digit A) :=
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
  Fixpoint to_digit {A:Type} (nd:node A) : digit A :=
    match nd with
    | node2 a b => two a b
    | node3 a b c => three a b c
    end.

  (** ============================================================================== *)
  (**                                    fingertree                                  *)
  (** ============================================================================== *)

  (** A fingertree is either empty, a single thing, or a deeper fingertree
      along with a prefix digit and a suffix digit *)
  Inductive fingertree (A:Type) : Type :=
  | empty : fingertree A
  | single : A -> fingertree A
  | deep : digit A -> fingertree (node A) -> digit A -> fingertree A.

  Arguments empty {A}.
  Arguments single {A} _.
  Arguments deep {A} _ _ _.

  Example ft_ex_01 : fingertree nat :=
    deep (two 1 2)
         (deep (two (node2 3 4) (node2 5 6))
               empty
               (two (node3 7 8 9) (node2 10 11))
         )
         (three 12 13 14).

  (** Fingertrees can be reduced right *)
  Fixpoint ft_reducer {A:Type} {B:Type}
             (op: A -> B -> B) (tr : fingertree A) (z : B) : B :=
      match tr with
      | empty => z
      | single x => op x z
      | deep pr m sf =>
        let op' := reducer op in
        let op'' := ft_reducer (reducer op) in
        op' pr (op'' m (op' sf z))
      end.


  (** Fingertrees can be reduced left *)
  Fixpoint ft_reducel {A:Type} {B:Type}
           (op: B -> A -> B) (z : B) (tr : fingertree A) : B :=
      match tr with
      | empty => z
      | single x => op z x
      | deep pr m sf =>
        let op'  := reducel op in
        let op'' := ft_reducel (reducel op) in
        op' (op'' (op' z pr) m) sf
      end.

  (** Fingertrees can be reduced *)
  Instance fingertree_reduce : reduce fingertree :=
    {|
      reducer := @ft_reducer;
      reducel := @ft_reducel;
    |}.

  Example ft_ex_01_to_list : to_list ft_ex_01 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14].
  Proof. reflexivity. Qed.

  (** You can map over a fingertree *)
  Fixpoint ft_map {A B : Type} (fn : A -> B) (tr : fingertree A) : fingertree B :=
    match tr with
    | empty => empty
    | single a => single (fn a)
    | deep pf m sf =>
      deep (map fn pf)
            (ft_map (map fn) m)
            (map fn sf)
    end.

  (** ID law for functors for fingertrees *)
  Lemma ft_map_id : forall (A : Type) (tr : fingertree A),
   ft_map (fun x => x) tr = tr.
  Proof.
    Opaque map.
    induction tr; intros; simpl in *; [reflexivity | reflexivity |].
    rewrite !map_id.
    replace (map (fun x : A => x)) with (fun x : node A => x).
    rewrite IHtr. reflexivity.
    apply functional_extensionality. intros. symmetry. apply map_id.
    Transparent map.
  Qed.

  (** Composition law for functors for fingertrees *)
  Lemma ft_map_comp {A B C: Type} (f: B -> C) (g: A -> B) (tr: fingertree A) :
    ft_map (fun x => f (g x)) tr = ft_map f (ft_map g tr).
  Proof.
    Opaque map.
    intros. generalize dependent B. generalize dependent C.
    induction tr; intros; simpl in *; [reflexivity | reflexivity |].
    rewrite map_comp with (x := d).
    rewrite map_comp with (x := d0).
    replace (map (fun x : A => f (g x))) with (fun n : node A => map f (map g n)).
    rewrite (IHtr _ _ (map f) (map g)). reflexivity.
    apply functional_extensionality.
    intros. symmetry. apply map_comp.
    Transparent map.
  Qed.

  (** Fingertrees are functors *)
  Instance ft_functor : functor fingertree :=
    {|
      map := @ft_map;
      map_id := ft_map_id;
      map_comp := @ft_map_comp;
    |}.


  (** Tree equivalence relation!
      Two trees are equal if they reduce to the same thing no matter what
      operator.
   *)
  Definition tree_eq {A : Type} (t1 t2 : fingertree A) :=
    forall (B : Type) (acc : B) (op : A -> B -> B), reducer op t1 acc = reducer op t2 acc.

  Notation "t1 >=< t2" := (tree_eq t1 t2)
                            (at level 90, right associativity).

  (** ============================================================================== *)
  (**                                    adding                                      *)
  (** ============================================================================== *)

  (** Add to the left of a fingertree *)
  Fixpoint addl {A:Type} (a:A) (tr:fingertree A) : fingertree A  :=
    match tr with
    | empty => single a
    | single b => deep (one a) empty (one b)
    | deep (four b c d e) m sf => deep (two a b) (addl (node3 c d e) m) sf
    | deep (three b c d) m sf => deep (four a b c d) m sf
    | deep (two b c) m sf => deep (three a b c) m sf
    | deep (one b) m sf => deep (two a b) m sf
    end.

  (** Add to the right of a fingertree *)
  Fixpoint addr {A:Type} (tr:fingertree A) (a:A) : fingertree A  :=
    match tr with
    | empty => single a
    | single b => deep (one b) empty (one a)
    | deep pr m (four e d c b) => deep pr (addr m (node3 e d c)) (two b a)
    | deep pr m (three e c b) => deep pr m (four e c b a)
    | deep pr m (two c b) => deep pr m (three c b a)
    | deep pr m (one b) => deep pr m (two b a)
    end.

  (** Notation for adding to the left and right of fingertrees *)
  Notation "x <| t" := (addl x t)
                     (at level 60, right associativity).
  Notation "x |> t" := (addr x t)
                     (at level 61, left associativity).

  (** Mapping f over (x <| tr) is same as applying x to f and then adding it
      to map f tr.
   *)
  Lemma map_addl {A : Type} (tr : fingertree A) :
    forall B (f: A -> B) x, map f (x <| tr) = f x <| map f tr.
  Proof.
    unfold "<|". induction tr; intros; simpl in *; try reflexivity.
    - unfold map. destruct digit_functor.
      destruct d, d0; simpl; try (rewrite IHtr); try reflexivity.
  Qed.

  (** As above but with adding to the right *)
  Lemma map_addr {A : Type} (tr : fingertree A) :
    forall B (f: A -> B) x, ft_map f (tr |> x) = ft_map f tr |> f x .
  Proof.
    induction tr; intros; try reflexivity.
    destruct d, d0; simpl; try (rewrite IHtr); try reflexivity.
  Qed.

  (** Add all the things in a reducible value to the left of the tree *)
  Definition addl' {F: Type -> Type} {r:reduce F} {A:Type} :
    F A -> fingertree A -> fingertree A :=
      reducer addl.

  (** Add all the things in a reducible value to the right of the tree *)
  Definition addr' {F: Type -> Type} {r:reduce F} {A:Type} :
    fingertree A -> F A -> fingertree A :=
      reducel addr.

  (** Convert any reducible to a fingertree! *)
  Definition to_tree {F:Type -> Type} {A:Type} {r:reduce F} (s:F A) :
    fingertree A := addl' s empty.


  (** ============================================================================== *)
  (**                                  viewing                                       *)
  (** ============================================================================== *)

  (** View a tree from the left as empty or (an x and the rest of the tree) *)
  Inductive View_l (S:Type -> Type) (A:Type): Type :=
  | nil_l : View_l S A
  | cons_l : A -> S A -> View_l S A.

  Arguments nil_l {S} {A}.
  Arguments cons_l {S} {A} _ _.

  (** View a tree from the left! *)
  Fixpoint view_l {A:Type} (tr:fingertree A) : View_l fingertree A :=
    match tr with
    | empty => nil_l
    | single x => cons_l x empty
    | deep (one x) m sf =>
      let tail := match view_l m with
                  | nil_l => to_tree sf
                  | cons_l a m' => deep (to_digit a) m' sf
                  end
      in cons_l x tail
    | deep (two x y) m sf => cons_l x (deep (one y) m sf)
    | deep (three x y z) m sf => cons_l x (deep (two y z) m sf)
    | deep (four x y z u) m sf => cons_l x (deep (three y z u) m sf)
    end.

  (** Check if a tree is empty (with a boolean) *)
  Definition is_emptyb {A:Type} (tr:fingertree A) : bool :=
    match view_l tr with
    | nil_l => true
    | cons_l _ _ => false
    end.

  (** Check if a tree is empty (returning a proposition) *)
  Definition is_empty {A:Type} (tr:fingertree A) : Prop :=
    match view_l tr with
    | nil_l => True
    | cons_l _ _ => False
    end.


  (** Iff a view of a tree is empty, then it is empty *)
  Lemma view_l_nil_empty : forall {A : Type} (tr : fingertree A),
      view_l tr = nil_l <-> tr = empty.
  Proof.
    intros. split.
    - intros. destruct tr; [reflexivity | inversion H |]. simpl in H.
      destruct d, (view_l tr), d0; inversion H.
    - intros. destruct tr; [reflexivity | inversion H |].
      destruct d, (view_l tr), d0; inversion H.
  Qed.

  (** Converting an empty list to a tree gives an empty tree *)
  Lemma to_tree_empty : forall {A : Type}, @is_empty A (to_tree []).
  Proof.
    intros. simpl. unfold is_empty. destruct (view_l empty) eqn:Heq.
    - apply I.
    - inversion Heq.
  Qed.

  (** Adding something to the left of a tree can never result in an empty tree *)
  Lemma addl_not_empty : forall {A : Type} (tr : fingertree A) x, ~(addl x tr = empty).
  Proof.
    intros A tr x H. induction tr; inversion H.
    destruct d; inversion H1.
  Qed.

  (** Adding something to the left of a single can never result in a new single *)
  Lemma addl_not_2single : forall {A : Type} (x y z : A), ~(addl x (single y) = single z).
  Proof.
    intros A x y z H. simpl in H. inversion H.
  Qed.

  (** Adding something to the right of a tree can never result in an empty tree *)
  Lemma addr_not_empty : forall {A : Type} (tr : fingertree A) x, ~(addr tr x = empty).
    intros A tr x H. induction tr; inversion H.
    destruct d0; inversion H1.
  Qed.

  (** Viewing the result of adding somehing to a tree can never be nil *)
  Lemma addl_not_nil : forall {A : Type} (tr : fingertree A) x,
      ~(view_l (addl x tr) = nil_l).
  Proof.
    intros A tr x H. induction tr; inversion H.
    destruct d; inversion H1.
  Qed.

  (** Get the left head of a tree *)
  Definition head_l {A:Type} (a:A) (tr:fingertree A) : A :=
    match view_l tr with
    | nil_l => a
    | cons_l x _ => x
    end.

  (** Get the left tail of a tree *)
  Definition tail_l {A:Type} (tr:fingertree A) : fingertree A :=
    match view_l tr with
    | nil_l => tr
    | cons_l _ tl => tl
    end.

  (** If you add an x to the left of a tree tr and then convert it to a list, it is
     the same as converting tr to a list and then consing x.
     This is the general version of the above, i.e
     to_list (x <| tr) = x :: (to_list tr) <=>
     ft_reducer cons (x <| tr) [] = cons x (tr_reducer cons tr [])
  *)
  Lemma ft_reducer_addl : forall {A B : Type}
                         (tr : fingertree A) xs x
                         (op : A -> B -> B),
      ft_reducer op (x <| tr) xs = op x (ft_reducer op tr xs).
  Proof.
    intros A B tr.
    induction tr; intros; try reflexivity.
    destruct d; try reflexivity.  simpl.
    do 2 (apply f_equal).
    apply (IHtr (digit_reducer op d0 xs) (node3 a0 a1 a2) (nd_reducer op)).
  Qed.

  (** Converting a list to a tree and then back again gives you the same list.
      I.e. to_list and to_tree are inverses of each other (on lists).
      So there is an isomorphism between (fingertree A) and (list A).
   *)
  Theorem to_tree_to_list_id : forall {A:Type} (xs : list A),
      to_list (to_tree xs) = xs.
  Proof.
    intros. induction xs; [reflexivity |].
    simpl. rewrite (ft_reducer_addl _ [] a _).
    apply f_equal. simpl in IHxs. assumption.
  Qed.

  (** ============================================================================== *)
  (**                                    append                                      *)
  (** ============================================================================== *)


  (**
     We need this data structure to represent lists that can be converted into
     lists of nodes in a total way.
  **)
  Inductive app3_list (A : Type) : Type :=
  | app3_two   : A -> A -> app3_list A
  | app3_three : A -> A -> A -> app3_list A
  | app3_four  : A -> A -> A -> A -> app3_list A
  | app3_more  : A -> A -> A -> app3_list A -> app3_list A.

  Arguments app3_two {A} _ _.
  Arguments app3_three {A} _ _ _.
  Arguments app3_four {A} _ _ _ _.
  Arguments app3_more {A} _ _ _ _.

  (** app3_lists can be right-reduced *)
  Fixpoint a3_reducer {A B : Type} (op : A -> B -> B) (xs : app3_list A) (ys : B) : B :=
    match xs with
    | app3_two a b => op a (op b ys)
    | app3_three a b c => op a (op b (op c ys))
    | app3_four a b c d => op a (op b (op c (op d ys)))
    | app3_more a b c xs' => op a (op b (op c (a3_reducer op xs' ys)))
    end.

  (** app3_lists can be left-reduced *)
  Fixpoint a3_reducel {A B : Type} (op : B -> A -> B) (ys : B) (xs : app3_list A) : B :=
    match xs with
    | app3_two a b => op (op ys a) b
    | app3_three a b c => op (op (op ys a) b) c
    | app3_four a b c d => op (op (op (op ys a) b) c) d
    | app3_more a b c xs' => a3_reducel op (op (op (op ys a) b) c) xs'
    end.

  (** app3_lists are reducible *)
  Instance a3_reduce : reduce app3_list :=
    {|
      reducer := @a3_reducer;
      reducel := @a3_reducel;
    |}.

  (**
     Yeah, this is a doosie, but I don't know how to define it in more succint terms
     while still retaining its total properties.
     In the original paper, this is much simpler since we do not have to use an
     app3_list and can write partial functions, but we cannot do proper proofs
     if we do this (believe me, I've wasted many hours on trying).
   **)
  Fixpoint dig_app3 {A:Type} (d1 : digit A) (xs : list A) (d2 : digit A): app3_list A :=
    match d1, xs, d2 with
    | one a,        [], one b        => app3_two a b
    | one a,        [], two b c      => app3_three a b c
    | one a,        [], three b c d  => app3_four a b c d
    | one a,        [], four b c d e => app3_more a b c (app3_two d e)

    | two a b,      [], one c        => app3_three a b c
    | two a b,      [], two c d      => app3_four a b c d
    | two a b,      [], three c d e  => app3_more a b c (app3_two d e)
    | two a b,      [], four c d e f => app3_more a b c (app3_three d e f)

    | three a b c,  [], one d        => app3_four a b c d
    | three a b c,  [], two d e      => app3_more a b c (app3_two d e)
    | three a b c,  [], three d e f  => app3_more a b c (app3_three d e f)
    | three a b c,  [], four d e f g => app3_more a b c (app3_four d e f g)

    | four a b c d, [], one e        => app3_more a b c (app3_two d e)
    | four a b c d, [], two e f      => app3_more a b c (app3_three d e f)
    | four a b c d, [], three e f g  => app3_more a b c (app3_four d e f g)
    | four a b c d, [], four e f g h => app3_more a b c (app3_more d e f (app3_two g h))

    | one a,        (x :: xs), _     => dig_app3 (two a x) xs d2
    | two a b,      (x :: xs), _     => dig_app3 (three a b x) xs d2
    | three a b c,  (x :: xs), _     => dig_app3 (four a b c x) xs d2
    | four a b c d, (x :: xs), _     => app3_more a b c (dig_app3 (two d x) xs d2)
    end.

  (**
     group a list of A's into a list of nodes of A'
     uses the app3_list data type to ensure totality and make proofs
     about nodes possible
   **)
  Fixpoint nodes {A : Type} (xs : app3_list A) : list (node A) :=
    match xs with
    | app3_two a b        => [node2 a b]
    | app3_three a b c    => [node3 a b c]
    | app3_four a b c d   => [node2 a b; node2 c d]
    | app3_more a b c xs' => node3 a b c :: nodes xs'
    end.

  (**
     append two fingertrees with a list of "remainder-values".
     This does all the hard work of append. Should be amortized logarithmic time
   **)
  Fixpoint app3 {A:Type} (tr1:fingertree A) (rem : list A) (tr2:fingertree A)
    : fingertree A :=
    match tr1, tr2 with
    | empty, _ => addl' rem tr2
    | _, empty => addr' tr1 rem
    | single x, _ => x <| addl' rem tr2
    | _, single x => addr' tr1 rem |> x
    | deep pr1 m1 sf1, deep pr2 m2 sf2 =>
        let a3l := dig_app3 sf1 rem pr2 in
        deep pr1 (app3 m1 (nodes a3l) m2) sf2
    end.

  (** Two append two trees, we just call app3 with an empty remainder-list *)
  Definition append {A:Type}
           (tr1 : fingertree A) (tr2 : fingertree A) : fingertree A :=
    app3 tr1 [] tr2.


  Notation "t1 >< t2" := (append t1 t2)
                     (at level 62, left associativity).


  (** ============================================================================== *)
  (**                                 proving append                                 *)
  (** ============================================================================== *)

  (** Right-reducing a digit over an accumulator that is the concatenation
      of two lists xs and ys is the same as using just xs as the accumulator
      and then appending ys. I.e. reducer does not touch the accumulator.
      Only works if the operator associates over append.
  *)
  Theorem digit_reducer_app :
    forall {A B : Type} (xs ys : list B) d (op : A -> list B -> list B),
      (forall a xs ys, op a (xs ++ ys) = (op a xs) ++ ys) ->
      (digit_reducer op d (xs ++ ys) = digit_reducer op d xs ++ ys).
  Proof.
    intros.
    destruct d; simpl; rewrite ?H; reflexivity.
  Qed.

  (** Same as above, but with adding to the right of the list/tree *)
  Lemma ft_reducer_addr : forall {A B : Type}
                         (tr : fingertree A) xs x
                         (op : A -> B -> B),
      ft_reducer op (tr |> x) xs = (ft_reducer op tr (op x xs)).
  Proof.
    intros A B tr.
    induction tr; intros; simpl; [reflexivity | reflexivity |].
    destruct d0; simpl; try reflexivity.
    rewrite (IHtr (op a2 (op x xs)) (node3 a a0 a1) (nd_reducer op)).
    reflexivity.
  Qed.

  Lemma addl_addr_assoc {A : Type} (tr : fingertree A) :
    forall x y, x <| (tr |> y) >=< (x <| tr) |> y.
  Proof.
    unfold ">=<". induction tr; simpl in *; intros; [reflexivity | reflexivity |].
    destruct d0,d; simpl in *; try reflexivity.
    - apply f_equal. apply f_equal.
      rewrite IHtr. reflexivity.
  Qed.

  (**
     Reducing a fingertree with an accumulator that is the concatenation of two
     lists xs and ys, is the same as just reducing with xs and then appending ys
     given that the operation we use for reduction has the same property
   **)
  Theorem ft_reducer_app :
    forall {A : Type} {F : Type -> Type}
      (tr : fingertree (F A)) (xs ys : list A)
      (op : F A -> list A -> list A),
      (forall a (xs ys : list A), op a (xs ++ ys) = (op a xs) ++ ys) ->
      ft_reducer op tr (xs ++ ys) = (ft_reducer op tr xs) ++ ys.
  Proof.
    intros A F tr. induction tr; intros; [reflexivity | apply H |]; simpl.
    - rewrite (digit_reducer_app xs ys d0 op H).
      rewrite IHtr.
      + remember (ft_reducer (nd_reducer op) tr (digit_reducer op d0 xs)) as xs'.
        apply (digit_reducer_app xs' ys d op H).
      + intros. apply nd_reducer_app. assumption.
  Qed.

  (** Helper lemma for second single of ft_reducer_addl' *)
  Lemma ft_reducer_addl'_single : forall {A B : Type} a op (xs : list A) (ys : B),
      ft_reducer op (addl' xs (single a)) ys =
      ft_reducer op (to_tree xs) (op a ys).
  Proof.
    induction xs.
    - intros. reflexivity.
    - intros. simpl. rewrite ft_reducer_addl.
      simpl in IHxs. rewrite (ft_reducer_addl _ (op a ys) a0).
      rewrite IHxs. reflexivity.
  Qed.

  (** Helper lemma for second deep of ft_reducer_addl' *)
  Lemma ft_reducer_addl'_deep : forall {A B : Type} op (xs : list A) (ys : B) pf sf m,
      ft_reducer op (addl' xs (deep pf m sf)) ys =
      ft_reducer op (to_tree xs) (ft_reducer op (deep pf m sf) ys).
  Proof.
    induction xs.
    - reflexivity.
    - intros. simpl in *. rewrite (ft_reducer_addl _ ys a op).
      remember (
          digit_reducer op pf (ft_reducer (nd_reducer op) m (digit_reducer op sf ys))
        ) as ys'.
      rewrite (ft_reducer_addl _ ys' a op).
      rewrite IHxs. rewrite Heqys'. reflexivity.
  Qed.

  (** Adding all elements in xs to the left of a fingertree tr and then
      reducing the result from the right, is the same as
      simply reducing the tree-version of xs with an accumulator that
      is tr reduced. Can be seen as another form of the lemma:
      reducer op (tr1 >< tr2) xs = reducer op tr1 (reducer op tr2 xs)
   *)
  Theorem ft_reducer_addl' : forall {A B : Type} op (xs : list A) (ys : B) (tr : fingertree A),
      ft_reducer op (addl' xs tr) ys =
      ft_reducer op (to_tree xs) (ft_reducer op tr ys).
  Proof.
    destruct tr.
    - reflexivity.
    - rewrite ft_reducer_addl'_single. reflexivity.
    - rewrite ft_reducer_addl'_deep. reflexivity.
  Qed.

  (** Same as above, but with addr' instead of addl' *)
  Theorem ft_reducer_addr' : forall {A B : Type} op (xs : list A) (ys : B) (tr : fingertree A),
      ft_reducer op (addr' tr xs) ys =
      ft_reducer op tr (ft_reducer op (to_tree xs) ys).
  Proof.
    induction xs; intros; simpl in *; [reflexivity |].
    destruct tr; simpl.
    - rewrite (ft_reducer_addl (fold_right addl empty xs) ys a op).
      rewrite IHxs. reflexivity.
    - rewrite IHxs. simpl. rewrite (ft_reducer_addl _ ys a op). reflexivity.
    - rewrite IHxs. destruct d0;
                      simpl; rewrite (ft_reducer_addl _ ys a op); try reflexivity.
      rewrite (ft_reducer_addr tr _ (node3 a0 a1 a2) (nd_reducer op)).
      simpl. reflexivity.
  Qed.

  (** Helper lemma *)
  Lemma ft_reducer_deep : forall {A B : Type} op (m : fingertree (node A)) pf sf (ys : B),
      ft_reducer op (deep pf m sf) ys =
      digit_reducer op pf (ft_reducer (nd_reducer op) m (digit_reducer op sf ys)).
  Proof.
    intros. reflexivity.
  Qed.

  (**
     Converting an app3_list of as to a list of node of As and then
     reducing the list of nodes with a node reducer, is the same as
     simply reducing the original app3_list.
  **)
  Lemma nodes_reducer : forall {A B : Type} (xs : app3_list A) (op : A -> B -> B) ys,
      reducer (nd_reducer op) (nodes xs) ys =
      reducer op xs ys.
  Proof.
    induction xs; intros; simpl in *; try reflexivity.
    rewrite IHxs. reflexivity.
  Qed.

  (** Same as above, but with to_tree injected *)
  Lemma nodes_to_list : forall {A B : Type} xs (op : A -> B -> B) ys,
      reducer (nd_reducer op) (to_tree (nodes xs)) ys =
      reducer op (to_tree xs) ys.
  Proof.
    intros A B xs. induction xs; intros; simpl in *; try reflexivity.
    rewrite (ft_reducer_addl _ _ (node3 a a0 a1) _). simpl.
    rewrite 3!(ft_reducer_addl _ _ _ op). rewrite IHxs. reflexivity.
  Qed.

  (** Helper lemma. *)
  Lemma dig_app3_to_list : forall {A B : Type}
                             (m : list A) (op : A -> B -> B) (pf sf : digit A) (ys : B),
      ft_reducer (nd_reducer op) (to_tree (nodes (dig_app3 pf m sf))) ys =
      digit_reducer op pf (ft_reducer op (to_tree m) (digit_reducer op sf ys)).
  Proof.
    intros A B. induction m; intros.
    - destruct pf, sf; try reflexivity.
    - simpl. destruct pf; simpl in *;
               try (rewrite IHm; simpl; rewrite (ft_reducer_addl _ _ a _); reflexivity).
      rewrite (ft_reducer_addl _ _ (node3 a0 a1 a2) _). simpl.
      rewrite (ft_reducer_addl _ _ a _ ). do 3 (apply f_equal).
      simpl in *.  rewrite IHm. reflexivity.
  Qed.


  (**
     Reducing over app3 tr1 xs tr2 "distributes".
     So reducing over appending two trees tr1 and tr2 with some remainder xs,
     is the same as reducing over tr1 with the result of reducing over xs
     with the result of reducing over tr2 with ys as the accumulator.
  **)
  Theorem app3_to_list :
    forall {A B:Type} (op : A -> B -> B) (tr1 tr2 : fingertree A) xs (acc : B),
    ft_reducer op (app3 tr1 xs tr2) acc =
    ft_reducer op tr1 (ft_reducer op (to_tree xs) (ft_reducer op tr2 acc)).
  Proof.
    intros A B op tr1.
    Opaque addl' addr' to_tree. induction tr1 as [| A a | A pf1 m1 IH sf1 ]; intros.
    - simpl. rewrite (ft_reducer_addl' op xs acc tr2). reflexivity.
    - destruct tr2 as [| a0 | pf m sf]; simpl.
      + rewrite (ft_reducer_addr'). reflexivity.
      + rewrite (ft_reducer_addl _ acc a op).
        rewrite (ft_reducer_addl'_single a0 op xs). reflexivity.
      + rewrite (ft_reducer_addl _ acc a op).
        rewrite (ft_reducer_addl'_deep op xs acc pf sf m).
        reflexivity.
    - destruct tr2 as [| a | pf2 m2 sf2 ].
      + simpl. rewrite ft_reducer_addr'. reflexivity.
      + simpl. rewrite (ft_reducer_addr _ _ a op).
        rewrite ft_reducer_addr'. reflexivity.
      + simpl in *. rewrite IH. do 2 (apply f_equal).
        rewrite (@dig_app3_to_list A B). reflexivity.
        Transparent addr' addl' to_tree.
  Qed.

  (**
     Theorem!
     Appending to trees and converting the to lists is the same as converting
     them to lists separately and appending the lists together.
   *)
  Theorem tree_append_hom : forall {A:Type} (tr1 : fingertree A) (tr2 : fingertree A),
    to_list (tr1 >< tr2) = to_list tr1 ++ to_list tr2.
  Proof.
    intros A tr1 tr2. simpl. unfold "><". rewrite app3_to_list. simpl.
    rewrite <- (ft_reducer_app tr1 ); [reflexivity |].
    intros. reflexivity.
  Qed.

  (**
     Theorem!
     Appending two trees is associative with respect to to_list
  *)
  Theorem tree_append_assoc : forall {A : Type} (tr1 tr2 tr3 : fingertree A),
      (tr1 >< (tr2 >< tr3)) >=< ((tr1 >< tr2) >< tr3).
  Proof.
    intros A B tr1. unfold ">=<". unfold "><".
    induction tr1; intros; rewrite ?app3_to_list; reflexivity.
  Qed.

  (** Same as above, but with to_list *)
  Corollary tree_append_assoc_to_list :
    forall {A B : Type} (tr1 tr2 tr3 : fingertree A),
      to_list (tr1 >< (tr2 >< tr3)) = to_list ((tr1 >< tr2) >< tr3).
  Proof.
    intros. simpl. apply tree_append_assoc.
  Qed.

  (** Same as above, but with sums *)
  Corollary tree_append_assoc_sum :
    forall {A : Type} (tr1 tr2 tr3 : fingertree nat),
      reducer plus (tr1 >< (tr2 >< tr3)) 0 = reducer plus ((tr1 >< tr2) >< tr3) 0.
  Proof.
    intros. simpl. apply tree_append_assoc.
  Qed.

  (** ============================================================================== *)
  (**                                    reverse                                     *)
  (** ============================================================================== *)

  (** You can reverse a node *)
  Definition reverse_node {A: Type}
            (f: A -> A) (n: node A): node A  :=
    match n with
    | (node2  a b)  => node2 (f b) (f a)
    | (node3 a b c) => node3 (f c) (f b) (f a)
    end.

  (** You can reverse a digit *)
  Definition reverse_digit {A: Type}
           (f: A -> A) (d: digit A): digit A  :=
    match d with
    | one a        => one (f a)
    | two a b      => two (f b) (f a)
    | three a b c  => three (f c) (f b) (f a)
    | four a b c d => four (f d) (f c) (f b) (f a)
    end.

  (** You can reverse a fingertree *)
  Fixpoint reverse_tree {A: Type}
           (f: A -> A)(tr: fingertree A) : fingertree A :=
    match tr with
    | empty        => empty
    | single x     => single (f x)
    | deep pr m sf =>
      deep (reverse_digit f sf)
           (reverse_tree (reverse_node f) m)
           (reverse_digit f pr)
    end.

  (** the identity function *)
  Definition ident {A:Type} (x:A) :=  x.

  (** Reverse a tree by calling reverse_tree starting with the identity function *)
  Definition reverse {A: Type} : fingertree A -> fingertree A :=
    reverse_tree ident.

  (** Some examples *)
  Example reverse_ex01 :
     reverse (single 1)  = single 1.
  Proof. reflexivity. Qed.

  Example reverse_ex02:forall (A : Type),
      reverse (@empty A)  = (@empty A).
  Proof. reflexivity. Qed.

  Example reverse_ex03 :
    reverse (deep (two 0 1) (single (node2 2 3)) (three 4 5 6)) =
            deep (three 6 5 4) (single (node2 3 2)) (two 1 0).
  Proof. unfold reverse. unfold reverse_tree. unfold reverse_digit.
         simpl. reflexivity. Qed.

  (** ============================================================================== *)
  (**                               proving reverse                                  *)
  (** ============================================================================== *)

  (** Reversing (x <| tr) is the same as reversing tr and adding x to the right*)
  Lemma reverse_addl {A : Type} (tr : fingertree A) :
    forall x fn, reverse_tree fn (x <| tr) = reverse_tree fn tr |> fn x.
  Proof.
    unfold reverse. induction tr; simpl in *; intros; try reflexivity.
    destruct d; try reflexivity.
    simpl in *. rewrite IHtr. reflexivity.
  Qed.

  (**
     Theorem!
     Reversing a tree twice gives you an equivalent tree
   *)
  Theorem reverse_involutive {A B : Type} (tr : fingertree A) :
    forall fn (H : forall x, fn (fn x) = x),
          (reverse_tree fn (reverse_tree fn tr)) = tr.
  Proof.
    induction tr as [| A a | A pf m IH sf] ; intros; simpl in *; [reflexivity | |].
    - rewrite H. reflexivity.
    - rewrite IH.
      + destruct pf, sf; simpl in *;
          rewrite !H; reflexivity.
      + intros. destruct x; simpl; rewrite !H; reflexivity.
  Qed.

  (** Helper lemma *)
  Lemma nd_reducer_cons_app {A:Type} : forall (a1 : node A) (xs ys : list A),
      nd_reducer cons a1 (xs ++ ys) = nd_reducer cons a1 xs ++ ys.
  Proof. destruct a1; reflexivity. Qed.

  (**
    Reversing [x <| tr] is the same as just reversing [tr] and adding [fn x]
    to the right
  *)
  Lemma reverse_tree_addl {A : Type} (tr : fingertree A) (x : A) :
    forall fn, (forall x, fn (fn x) = x) ->
          reverse_tree fn (x <| tr) = reverse_tree fn tr |> fn x .
  Proof.
    induction tr; intros; simpl in *.
    - reflexivity.
    - reflexivity.
    - destruct d; simpl in *; try reflexivity.
      rewrite IHtr. reflexivity.
      intros. destruct x0; simpl; rewrite !H; reflexivity.
  Qed.

  (** [reverse_node] is involutive *)
  Lemma reverse_node_invol {A : Type} :
    forall fn (H: forall x, fn (fn x) = x) (n : node A),
      reverse_node fn (reverse_node fn n) = n.
  Proof.
    destruct n; simpl; intros; rewrite !H; reflexivity.
  Qed.

  (** [reverse_node] is also "cons-like" in the way it interacts with [reverse] *)
  Lemma reverse_node_helper {A B : Type} :
    forall op fn (H: forall x, fn (fn x) = x)
      (H0 : forall (a : A) (acc acc' : list B),
          rev acc' ++ op (fn a) acc = rev (op a acc') ++ acc)
      (n : node A) acc (acc' : list B),
      rev acc' ++ nd_reducer op (reverse_node fn n) acc =
      rev (nd_reducer op n acc') ++ acc.
  Proof.
    intros. destruct n; simpl; rewrite !H0; reflexivity.
  Qed.

  (** reducing a reversed tree to a list is like reducing the tree and
      then reversing the list (generalized)
  *)
  Lemma reverse_reducer
          {A B : Type} (tr : fingertree A) :
    forall acc acc' (fn : A -> A) (op : A -> list B -> list B),
      (forall x, fn (fn x) = x) ->
      (forall a acc acc', rev acc' ++ op (fn a) acc = rev (op a acc') ++ acc) ->
      rev acc' ++ reducer op (reverse_tree fn tr) acc =
      rev (reducer op tr acc') ++ acc.
  Proof.
    induction tr; intros.
    - reflexivity.
    - simpl. apply H0.
    - destruct d,d0; simpl in *; rewrite !H0;
        (rewrite IHtr; [ | apply (reverse_node_invol fn H)
                         | apply (reverse_node_helper op fn H H0)]);
        rewrite !H0; reflexivity.
  Qed.

  (** [cons] is well-behaved with [rev] *)
  Lemma cons_reverse {A : Type} : forall (a : A) (acc acc' : list A),
      rev acc' ++ a :: acc = rev (a :: acc') ++ acc.
  Proof.
    intros. simpl. rewrite <- app_assoc.
    replace ([a] ++ acc) with (a :: acc) by reflexivity.
    reflexivity.
  Qed.

  (**
     Theorem!
     reversing a (tree converted to a list) is the same as
     is reversing the tree and then converting it to a list.
   *)
  Theorem reverse_to_list {A : Type} (tr : fingertree A) :
    rev (to_list tr) = to_list (reverse tr).
  Proof.
    simpl.
    rewrite <- app_nil_r with (l := rev (ft_reducer cons tr [])).
    unfold reverse.
    symmetry.
    specialize (@reverse_reducer A A tr [] [] ident).
    unfold ident in *.
    intros. simpl in H.
    rewrite H; [|intros; reflexivity | apply cons_reverse ].
    reflexivity.
  Qed.


  (* ============================================================================== *)
  (*                      reverse_to_list  with node_lift                           *)
  (* ============================================================================== *)

  (** Lift a type n times into node *)
  Fixpoint node_lift (n:nat) (A:Type) : Type :=
    match n with
    | O => A
    | S n' => node (node_lift n' A)
    end.

  (** Reverse a value of a type lifted into node n times *)
  Fixpoint rev_lift (n:nat) {A:Type} (fn: A -> A) : (node_lift n A -> node_lift n A) :=
    match n with
    | O => fn
    | S n' => reverse_node (rev_lift n' fn)
    end.

  (** Reduce a type lifted into node n times *)
  Fixpoint nd_red_lift {A B : Type} (n:nat) (op : A -> B -> B) :
    (node_lift n A) -> B -> B :=
    match n with
    | O => op
    | S n' => nd_reducer (nd_red_lift n' op)
    end.

  (** (node A) lifted into node n times is the same as node (A lifted into node n times).
      So it describes an unfolding of node_lift.
   *)
  Lemma node_lift_eq (A : Type) (n : nat) :
    node_lift n (node A) = node (node_lift n A).
  Proof.
    induction n.
    - reflexivity.
    - simpl in *. rewrite IHn. reflexivity.
  Qed.

  (** Represent as fingertree of nodes by its node-lifted type. *)
  Program Fixpoint node_lift_tr {A : Type} (n : nat)
             (tr : fingertree (node_lift n (node A))) :
    fingertree (node (node_lift n A)) :=
    match n with
    | O => _
    | S n' => _
    end.
  Next Obligation.
    simpl in *. rewrite node_lift_eq in tr. assumption.
  Defined.

  (** A new induction principle for fingertrees whose types are described in terms of
      a type [A] lifted [n] times into [node].
      We cannot prove it, regrettably, because Coq chokes in the induction hypothesis,
      but we *think* it's consistent.
   *)
  Axiom fingertree_lift_ind
     : forall P : (forall (n : nat) (A : Type), fingertree (node_lift n A) -> Prop),
       (forall (n:nat) (A : Type), P n A empty) ->
       (forall (n:nat) (A : Type) (a : node_lift n A), P n A (single a)) ->
       (forall (n:nat) (A : Type) (d : digit (node_lift n A))
          (f1 : fingertree (node_lift (S n) A)),
           P (S n) A f1 -> forall d0 : digit (node_lift n A), P n A (deep d f1 d0)) ->
       forall (n:nat) (A : Type) (f2 : fingertree (node_lift n A)), P n A f2.

  (** nd_red_lift on cons distributes over append in the accumulator. *)
  Lemma nd_red_lift_app {A:Type} (n : nat) (x y : node_lift n A) :
    forall acc1 acc2,
      nd_red_lift n cons x acc1 ++ nd_red_lift n cons y acc2 =
      nd_red_lift n cons x (acc1 ++ nd_red_lift n cons y acc2).
  Proof.
    induction n; intros; simpl in *.
    - reflexivity.
    - destruct x, y; simpl in *; rewrite ?IHn; reflexivity.
  Qed.

  (** same as above, but specialized to empty lists *)
  Lemma nd_red_lift_app' {A:Type} (n : nat) (x y : node_lift n A) :
    forall acc,
      nd_red_lift n cons x [] ++ nd_red_lift n cons y acc =
      nd_red_lift n cons x (nd_red_lift n cons y acc).
  Proof.
    apply nd_red_lift_app with (acc1 := []).
  Qed.

  (** same as above, but specialized to a single nd_red_lift *)
  Lemma nd_red_lift_app'' {A:Type} (n : nat) (x : node_lift n A) :
    forall xs ys,
      nd_red_lift n cons x xs ++ ys =
      nd_red_lift n cons x (xs ++ ys).
  Proof.
    induction n; intros; simpl in *.
    - reflexivity.
    - destruct x; simpl;
        rewrite !IHn; reflexivity.
  Qed.

  (** specialize above *)
  Lemma nd_red_lift_app''' {A:Type} (n : nat) (x : node_lift n A) :
    forall ys,
      nd_red_lift n cons x [] ++ ys =
      nd_red_lift n cons x ys.
  Proof.
    apply nd_red_lift_app''.
  Qed.

  (**
     Proof of [reducer cons (reverse_node x) acc = rev (reducer cons x []) ++ acc],
     but lifted [n] times into [node].
   *)
  Lemma nd_red_lift_rev {A : Type} (n : nat) (x : node_lift n A) :
    forall acc,
    nd_red_lift n cons (rev_lift n ident x) acc =
    rev (nd_red_lift n cons x []) ++ acc.
  Proof.
    induction n; intros; simpl in *.
    - unfold ident. reflexivity.
    - destruct x; simpl in *.
      + rewrite !IHn. rewrite app_assoc. rewrite <- rev_app_distr.
        rewrite nd_red_lift_app'''. reflexivity.
      + rewrite !IHn. rewrite 2!app_assoc. rewrite <- 2!rev_app_distr.
        rewrite !nd_red_lift_app'''. reflexivity.
  Qed.

  (**
     Proof of
     [rev acc' ++ reducer cons (reverse_node nd) acc =
     rev (reducer cons nd acc') ++ acc]
     but lifted to node n times
   *)
  Lemma rev_node_lem {A : Type} (n : nat) (nd : node (node_lift n A)) :
    forall (acc acc' : list A) ,
      (rev acc') ++ reducer (nd_red_lift n cons) (reverse_node (rev_lift n ident) nd) acc =
      rev (reducer (nd_red_lift n cons) nd acc') ++ acc.
  Proof.
    destruct nd; simpl in *.
    - induction n; simpl in *; intros.
      + rewrite <- !app_assoc. reflexivity.
      +  destruct n0, n1; simpl in *; try (rewrite !IHn; reflexivity);
         rewrite !IHn;
           rewrite <- !nd_red_lift_app';
           remember (nd_red_lift n cons n1 []) as n1s;
           remember (nd_red_lift n cons n2 []) as n2s;
           remember (nd_red_lift n cons n3 []) as n3s;
           remember (nd_red_lift n cons n4 acc') as n4s;
           rewrite <- nd_red_lift_app''' with (x := n0);
           rewrite rev_app_distr with (x := nd_red_lift n cons n0 []);
           rewrite <- !app_assoc;
           apply f_equal; apply nd_red_lift_rev.
    - induction n; simpl in *; intros.
      + rewrite <- !app_assoc. reflexivity.
      +  destruct n0, n1, n2; simpl in *; try (rewrite !IHn; reflexivity);
         rewrite !IHn;
           rewrite <- !nd_red_lift_app';
           (* remember (nd_red_lift n cons n1 []) as n1s; *)
           (* remember (nd_red_lift n cons n2 []) as n2s; *)
           (* remember (nd_red_lift n cons n3 []) as n3s; *)
           (* remember (nd_red_lift n cons n4 []) as n4s; *)
           (* remember (nd_red_lift n cons n5 []) as n5s; *)
           (* remember (nd_red_lift n cons n6 []) as n6s; *)
           try (remember (nd_red_lift n cons n7 acc') as n7s);
           rewrite <- nd_red_lift_app''' with (x := n0);
           try (rewrite <- nd_red_lift_app''' with (x := n3));
           rewrite ?app_nil_r;
           rewrite rev_app_distr with (x := nd_red_lift n cons n0 []);
           try (rewrite rev_app_distr with (x := nd_red_lift n cons n3 []));
           rewrite <- !app_assoc;
           apply f_equal; rewrite !nd_red_lift_rev; rewrite ?app_nil_r;
             reflexivity.
  Qed.

  (** Same as above, just with digits instead *)
  Lemma reverse_rev_digit {A : Type} (n : nat) (d : digit (node_lift n A)) :
    forall (acc acc' : list A),
      (rev acc') ++ digit_reducer (nd_red_lift n cons) (reverse_digit (rev_lift n ident) d) acc =
      rev (digit_reducer (nd_red_lift n cons) d acc') ++ acc.
  Proof.
    unfold ident. remember n as m. induction m;
                    [ destruct d; intros; simpl; rewrite <- !app_assoc; reflexivity |].
    destruct d; intros; simpl in *; rewrite !rev_node_lem; reflexivity.
  Qed.

  (**
     Proof of
     [rev acc' ++ reducer cons (reverse tr) acc =
     rev (reducer cons tr acc') ++ acc]
     but lifted [n] times into [node].
     Uses the custom induction principle.
   *)
  Lemma reverse_reducer_lift {A : Type} (n : nat) (tr : fingertree (node_lift n A)) :
    forall (acc acc' : list A),
      rev acc' ++ ft_reducer (nd_red_lift n cons) (reverse_tree (rev_lift n ident) tr) acc =
      rev (ft_reducer (nd_red_lift n cons) tr acc') ++ acc.
  Proof.
    apply fingertree_lift_ind with (f2 := tr); simpl in *.
    - reflexivity.
    - induction n0; simpl in *.
      + intros. unfold ident. rewrite <- app_assoc. reflexivity.
      + intros. unfold ident. destruct a; simpl in *; rewrite !IHn0; reflexivity.
    - induction n0; intros.
      + simpl in *; unfold ident.
        destruct d; simpl in *;
          [ replace (a :: acc) with ([a] ++ acc)
            by reflexivity
          | replace (a0 :: a :: acc) with ([a0] ++ (a :: acc))
            by reflexivity
          | replace (a1 :: a0 :: a :: acc) with ([a1] ++ (a0 :: a :: acc))
            by reflexivity
          | replace (a2 :: a1 :: a0 :: a :: acc) with ([a2] ++ (a1 :: a0 :: a :: acc))
            by reflexivity
          ];
          rewrite <- H;
          rewrite <- !app_assoc;
          unfold ident;
          rewrite ft_reducer_app by (apply nd_reducer_cons_app);
          (destruct d0;
            simpl; rewrite <- !app_assoc; reflexivity).
      + rewrite reverse_rev_digit.
        rewrite H. rewrite reverse_rev_digit.
        reflexivity.
  Qed.


  (**
     Theorem!
     reversing a (tree converted to a list) is the same as
     is reversing the tree and then converting it to a list.
   *)
  Theorem reverse_to_list_lift {A : Type} (tr : fingertree A) :
    rev (to_list tr) = to_list (reverse tr).
  Proof.
    simpl.
    specialize @reverse_reducer_lift with (A := A) (n := O) (acc' := []) (acc := []).
    intros. simpl in H.
    rewrite <- app_nil_r with (l := rev (ft_reducer cons tr [])).
    rewrite <- H with (tr := tr) (acc := []) (acc' := []).
    reflexivity.
  Qed.

  (* ============================================================================== *)
  (*                   reverse_to_list with sequential induction                    *)
  (* ============================================================================== *)

  Axiom ft_left_ind :
    forall (P : (forall (A : Type), fingertree A -> Prop)),
           (forall (A : Type), P A empty) ->
           (forall (A : Type) (tr : fingertree A) (x : A), P A tr -> P A (x <| tr)) ->
           forall (A : Type) (tr : fingertree A), P A tr.

  Lemma reverse_reducer_left_ind {A : Type} (tr : fingertree A) :
    forall acc acc' fn, (forall x, fn (fn x) = x) ->
                   rev acc' ++ reducer cons (reverse_tree fn tr) acc =
                   rev (reducer cons (map fn tr) acc') ++ acc.
  Proof.
    induction tr using ft_left_ind; intros; simpl in *.
    - reflexivity.
    - rewrite reverse_tree_addl; [| apply H].
      rewrite ft_reducer_addr. rewrite IHtr; [| apply H].
      rewrite map_addl.
      rewrite ft_reducer_addl. simpl.
      rewrite <- app_assoc. reflexivity.
  Qed.

  Theorem reverse_to_list_left_ind {A : Type} (tr : fingertree A) :
    rev (to_list tr) = to_list (reverse tr).
  Proof.
    Opaque map.
    simpl.
    specialize (reverse_reducer_left_ind tr [] [] ident).
    intros. simpl in H.
    rewrite <- app_nil_r with (l := rev (ft_reducer cons tr [])).
    unfold reverse. unfold ident in *. rewrite map_id in H.
    symmetry.
    rewrite H; [|intros; reflexivity].
    reflexivity.
    Transparent map.
  Qed.

End FingerTrees.


