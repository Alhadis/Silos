Require Export RelationClasses.
Require Export Setoid.

Require Import List.
Require Import Permutation.
Require Import Arith. (* for gt_dec *)

(* This is pretty annoying: the tactic is currently not 
   generic in the type of the lists, it only works for nat lists... *)
Definition key := nat.

Module Type COMMUTATIVE_MONOID.
  Parameter A : Set.
  Parameter R : relation A.

  Declare Instance R_equiv : Equivalence R.

  Parameter i : A. 
  Parameter op : A -> A -> A.

  Parameter op_respectful : 
    forall x x', R x x' -> 
    forall y y', R y y' -> 
    R (op x y) (op x' y').

  Notation "x '~' y" := (R x y)
    (at level 70, no associativity).
  Notation "x '+' y" := (op x y)
    (at level 50, left associativity).

  Parameter id_left : forall (x:A), i+x ~ x.
  Parameter id_right : forall (x:A), x+i ~ x.
  Parameter op_assoc : forall (x y z : A), (x+y)+z ~ x+(y+z).
  Parameter op_comm : forall (x y : A), x+y ~ y+x.
End COMMUTATIVE_MONOID.

Module MonoidReflection (M : COMMUTATIVE_MONOID).
  Import M.
  
  Add Parametric Relation : A R
    reflexivity proved by Equivalence_Reflexive
    symmetry proved by Equivalence_Symmetric
    transitivity proved by Equivalence_Transitive
  as R_relation.

  Add Parametric Morphism : op with
    signature R ==> R ==> R as op_mor.
  Proof. exact op_respectful. Qed.

  Inductive FreeMon : Set := 
  | Var : nat -> A -> FreeMon
  | Id : FreeMon
  | Op : FreeMon -> FreeMon -> FreeMon.

  Fixpoint denote (e : FreeMon) : A :=
    match e with
    | Var _ x => x
    | Id => i 
    | Op e1 e2 =>  op (denote e1) (denote e2)
    end.

  (* A _normal form_ is a nondecreasing sequence of variables. *)
  Definition NF := list (nat * A).

  Notation "[ ]" := nil.
  Notation "[ x , .. , y ]" := (cons x .. (cons y nil) ..).

  Fixpoint NF_denote (xs : NF) :=
    match xs with
      | nil => i
      | (n,x)::xs => x + NF_denote xs
    end.

  Definition NF_insert  : forall (n : nat) (x : A) (vars : NF),
    { vars' | NF_denote vars' ~ (x + NF_denote vars) }.
  refine (
    fix NF_insert n x vars
    : { vars' | NF_denote vars' ~ (x + NF_denote vars) }
    :=
      match vars with 
        | [] => exist _ [ (n,x) ] _
        | (m,y) :: vars1 => 
          match gt_dec m n with
            | left _  => 
                 match NF_insert m y vars1 with exist _ rest IH =>
                   exist _ ((n,x) :: rest) _
                 end
            | right _ => 
                match NF_insert n x vars1 with exist _ rest IH =>
                  exist _ ((m,y) :: rest) _
                end
          end
      end).
  Proof.
    (* Case nil: *)
    reflexivity.
    (* Case cons, n>m : *)
    simpl. rewrite IH. reflexivity.
    (* Case cons, ~n>m : *)
    simpl. rewrite IH. repeat rewrite <- op_assoc.
    rewrite (op_comm y x). reflexivity.
  Defined.

  Definition normalize_helper : forall (e : FreeMon) (vars : NF), 
    { vars' | NF_denote vars' ~ denote e + NF_denote vars }.
  refine (
    fix normalize_helper e vars {struct e} :=
    match e as e return { vars' | NF_denote vars' ~ denote e + NF_denote vars }
       with
        | Var n x => NF_insert n x vars
        | Id => exist _ vars _
        | Op e1 e2 => 
          match normalize_helper e1 vars with 
            exist _ vars1 H1 =>
              match normalize_helper e2 vars1 with
                exist _ vars2 H2 =>
                  exist _ vars2 _
              end
          end
      end).
  Proof.
    (* Case for Id. *)
    simpl. rewrite id_left. reflexivity.
    (* Case for Op. *)
    rewrite H2. rewrite H1. simpl.  
    rewrite <- op_assoc. rewrite (op_comm (denote e2) (denote e1)).
    reflexivity.
  Defined.

  Definition normalize : forall (e : FreeMon), 
    { vars' | NF_denote vars' ~ denote e }.
  refine (
    fun e => match normalize_helper e [] with
               | exist _ vars H => exist _ vars _
             end).
  Proof.
    simpl in H. rewrite id_right in H. exact H.
  Defined.
  
  Theorem monoid_reflect : forall e1 e2,
    NF_denote (proj1_sig (normalize e1)) ~ NF_denote (proj1_sig (normalize e2)) ->
    denote e1 ~ denote e2.
  Proof.
    intros e1 e2.
    destruct (normalize e1) as [vars1 H1]. destruct (normalize e2) as [vars2 H2].
    simpl.
    rewrite H1. rewrite H2. auto.
  Qed.  
End MonoidReflection.

Module PermutationAppendMonoid <: COMMUTATIVE_MONOID.
  Definition A := list key.
  Definition R := (@Permutation key).

  Definition R_equiv := (Permutation_Equivalence key).

  Definition i := nil : list key.
  Definition op := (@app key).

  Lemma op_respectful : 
    forall x x', R x x' -> 
    forall y y', R y y' -> 
    R (op x y) (op x' y').
  intros. unfold R.  unfold op. auto using Permutation_app. Qed.

  Lemma id_left : forall (x : list key), Permutation (nil++x) x.
    simpl. apply Permutation_refl. Qed.
  Lemma id_right: forall (x : list key), Permutation (x++nil) x.
    intros. rewrite app_nil_r.  apply Permutation_refl. Qed.
  Lemma op_assoc: forall (x y z:list key), 
    Permutation ((x++y)++z) (x++y++z).
   intros. rewrite app_assoc. apply Permutation_refl. Qed.
  Definition op_comm := (@Permutation_app_comm key).
End PermutationAppendMonoid.

Module PermutationAppendMonoidReflect := MonoidReflection PermutationAppendMonoid.
Export PermutationAppendMonoidReflect.

(* Lookup, and possibly add, a.
   Returns (v, atoms') where v is the variable and atoms' the new list. *)
Ltac lookup_atom n a atoms :=
  match atoms with
  |  (Var ?m a) :: _ => constr:((Var m a , atoms))
  |  ?mb :: ?tl => match lookup_atom (S n) a tl with
                     (?v , ?atoms') => constr:((v, mb::atoms'))
                   end
  |  nil => constr:((Var n a, [Var n a]))
  end.

Ltac reify_atom a atoms :=
  lookup_atom 0 a atoms.

(* return: (reified_term, new_atoms) *)
Ltac reify l atoms :=
    match l with
      | nil => constr:((Id, atoms))
      | ?x :: ?xs =>
         match reify_atom [x] atoms with
          (?r, ?atoms') =>
            match reify xs atoms' with
              (?rs, ?atoms'') => 
                constr:((Op r rs, atoms''))
            end
         end
      | ?l1 ++ ?l2 =>
        match reify l1 atoms with
          (?r1, ?atoms') => 
          match reify l2 atoms' with
            (?r2, ?atoms'') =>
              constr:((Op r1 r2, atoms''))
          end
        end
      | ?x => reify_atom x atoms
    end.

(* Try to simplify (and maybe solve) a goal of the form
     Permutation x y
   by using the reflection function. *)
Ltac permutation :=
match goal with |- Permutation ?lhs ?rhs => 
  let atoms := constr:(@nil (list FreeMon))  in
    match reify lhs atoms with
      (?lhs_rei, ?atoms') => 
        match reify rhs atoms' with
          (?rhs_rei, _) => 
            change (Permutation (denote lhs_rei) (denote rhs_rei))
        end 
    end
end;
apply monoid_reflect;
simpl;
unfold PermutationAppendMonoid.R, PermutationAppendMonoid.op, PermutationAppendMonoid.i;
try reflexivity.
