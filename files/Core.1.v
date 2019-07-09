Require Import Utf8.
Require Import Coq.Program.Equality.

(** printing Γ %\ensuremath{\Gamma}% #&Gamma;# *)
(** printing Γ' %\ensuremath{\Gamma}% #&Gamma;'# *)
(** printing Γ'' %\ensuremath{\Gamma}% #&Gamma;''# *)
(** printing τ %\ensuremath{\tau}% #&tau;# *)
(** printing σ %\ensuremath{\sigma}% #&sigma;# *)
(** printing ⊓ %\ensuremath{\sqcap}% #&cap;# *)
(** printing ⋂ %\ensuremath{\bigcap}% #&cap;# *)

(** * DSL Primitives
   Heaps, refined references, stability, etc. *)

Axiom heap : Set.
Definition hpred (A:Set) := A -> heap -> Prop.
Definition hrel (A:Set) := A -> A -> heap -> heap -> Prop.
Definition subhrel {A} (G R:hrel A) := forall x x' h h', G x x' h h' -> R x x' h h'.
Definition hreflexive {A}(R:hrel A) := forall x h, R x x h h.

(** Predicate and Relation Combinators *)
Definition pred_and {A:Set} (P:hpred A) (Q:hpred A) : hpred A :=
  fun a => fun h =>
    P a h /\ Q a h.
Infix "⊓" := (pred_and) (at level 40).

Definition pred_or {A:Set} (P Q:hpred A) : hpred A :=
  fun a => fun h => P a h \/ Q a h.
Infix "⊔" := (pred_or) (at level 41).

Definition rel_and {A:Set} (R:hrel A) (S:hrel A) : hrel A :=
  fun a a' h h' =>
    R a a' h h' /\ S a a' h h'.
Infix "⋂" := (rel_and) (at level 40).

Definition rel_or {A:Set} (R S:hrel A) : hrel A :=
  fun a a' h h' => R a a' h h' \/ S a a' h h'.
Infix "⋃" := (rel_or) (at level 41).

Definition rel_sub_eq {A:Set} (R S:hrel A) : Prop :=
  forall a a' h h', R a a' h h' -> S a a' h h'.
Infix "⊆" := (rel_sub_eq) (at level 45).

Definition stable {A} (P:hpred A) (R:hrel A) :=
  forall x x' h h', P x h -> R x x' h h' -> P x' h'.

(** * References
    ref must be defined completely, otherwise Coq's positivity checks are extremely conservative *)
Inductive ref (A:Set) (P:hpred A) (R G:hrel A) : Set :=
  | ref_placeholder : nat -> ref A P R G.
(*  mkref {ptr:nat}.*)
Notation "ref{ τ | P }[ R , G ]" := (ref τ P R G) (at level 80).
Axiom ref_stable : forall {A P R G}(r:ref{A|P}[R,G]), stable P R. 
(* TODO: Nuke this? if alloc only creates stable refs, then this is okay, though awkward. *)
Hint Resolve @ref_stable.

(** ** Heap interaction primitives
    Including reachability, containment, precision, and relation folding *)

Axiom heap_write : forall {A P R G} (p:ref A P R G) (v:A) (h:heap), heap.
Axiom heap_alloc : forall (A:Set) (a:A) (P:hpred A) (R G:hrel A), heap -> (ref A P R G * heap).
(** heap_deref doesn't need to fold types because it's entirely propositional; "inside the heap" if you will,
    and does not actually affect execution *)
Axiom heap_deref : forall {A P R G} (h:heap), ref{A|P}[R,G] -> A.
Notation "h [ r ]" := (heap_deref h r) (at level 40).
Axiom heap_lookup2 : forall {A P R G} (h:heap) (r:ref{A|P}[R,G]), P (h[r]) h.
(** Some concepts require a parameter-polymorphic reference equality. *)
Axiom ptr_eq : forall {A A' P P' R R' G G'}, ref A P R G -> ref A' P' R' G' -> Prop.
Infix "≡" := (ptr_eq) (at level 80).

Axiom type_based_nonaliasing : forall h τ σ P R G Q R' G' `(a:ref{τ|P}[R,G]) `(b:ref{σ|Q}[R',G']) v, τ<>σ ->
  (heap_write a v h)[b] = h[b].

(** ** Reachability
    We need to define what is reachable from a given type in order to define precise prediates and relations. *)
Class ImmediateReachability (A:Set) := {
  imm_reachable_from_in : forall {T:Set}{P R G} (p:ref{T|P}[R,G]) (a:A), Prop
}.
Global Instance ref_reach `{A:Set,P:hpred A,R:hrel A,G:hrel A}: ImmediateReachability (ref{A|P}[R,G]) :=
  { imm_reachable_from_in := fun T P' R' G' dst src => src≡dst}.
(** This is the reachability definition used globally.  Each structure must define a trusted
    ImmediateReachability instance to find pointers in a local structure.
    This relation adds the transitive and reflexive parts of reachability.
    This setup allows us to implement reference immutability generically over any
    type with an ImmediateReachability instance, and prove it precise without
    needing details about an unknown type's internal structure *)
Inductive reachable_from_in : forall {A:Set} {IRA:ImmediateReachability A}{T:Set}{P R G} (p:ref{T|P}[R,G]) (a:A) (h:heap), Prop :=
  | reflexively_reachable : forall (T:Set) P R G (r:ref{T|P}[R,G]) h, reachable_from_in r r h
  | directly_reachable : forall (U:Set) {IRU:ImmediateReachability U} {T:Set}{P R G}(p:ref{T|P}[R,G]) u h,
                           imm_reachable_from_in p u -> reachable_from_in p u h
  | trans_reachable : forall (A:Set){IRA:ImmediateReachability A} (a:A) (* value *)
                             (I:Set){ReI:ImmediateReachability I}{PI RI GI}(i:ref{I|PI}[RI,GI]) (* intermediate *)
                             {T:Set}{P R G}(p:ref{T|P}[R,G]) (* dest *)
                             h, (* heap *)
                        imm_reachable_from_in i a -> reachable_from_in p (h[i]) h ->
                        reachable_from_in p a h.
(** ** Precision
    Predicates and relations must be agnostic to changes outside the heap reachable
    from their target. *)
(** For predicates, precision really means stability over any heap changes that don't touch
    the predicates footprint *)
Definition precise_pred {A:Set}{AR:ImmediateReachability A} (P:hpred A) :=
  forall a h h', P a h -> 
                 (forall T P' R' G' (r:ref{T|P'}[R',G']), reachable_from_in r a h -> h[r]=h'[r]) ->
                 P a h'.
(** For relations, precision means they accept any heap changes outside their footprint. *)
Definition precise_rel {A:Set}{AR:ImmediateReachability A} (R:hrel A) :=
  forall a a' h h' h2 h2',
    (forall T P' R' G' (r:ref{T|P'}[R',G']), reachable_from_in r a h -> h[r]=h2[r]) ->
    (forall T P' R' G' (r:ref{T|P'}[R',G']), reachable_from_in r a' h' -> h'[r]=h2'[r]) ->
    (R a a' h h' -> R a a' h2 h2').

(** ** Relation Folding:
    Folding a rely-guarantee pair through a type to restrict the results of
    heap reads.  For any well-formed ref type the rely relation must already 
    contain the literal rely of any reachable refs, so the rely portion
    is essentially a no-op.  The guarantee, however, still needs to be
    projected and intersected component-wise in any structure. *)
Class rel_fold (A:Set) :=
  { rgfold : forall (R G:hrel A), Set ;
    fold : forall {R G}, A -> rgfold R G
  }.
(** In meta-proofs, of things like satisfying a guarantee, we use this
    identity fold instead of the appropriate developer instance so
    G and P don't have to have polymorphic arities and relation arguments
    to work on all sorts of folded versions of A. We place it in its
    own section so it isn't used as an instance by user programs.
*)
Section HideMetaFold.
Local Instance meta_fold {A:Set} : rel_fold A :=
  { rgfold := fun R G => A ;
    fold := fun _ _ x => x
  }.
End HideMetaFold.
Notation "{{{ e }}}" := (let mfold : forall A, rel_fold A := @meta_fold in e) (at level 50).

(** ** Containment 
    Containment means a reference's rely admits at least as much interference
    on references reachable from it as those reachable references themselves. *)
Class Containment (A:Set) := {
  contains : forall (R:hrel A), Prop
}.

(* TODO: relation folding on heap reads, and enforcing that G is reflexive/permits reads! *)
(** Ideally deref would have the type
<<
forall {A:Set}`{rel_fold A}{P:hpred A}{R G:hrel A}, hreflexive G -> ref A P R G -> rgfold R G.
>>
But unforunately, Coq's default type conversion procedure doesn't fully reduce the rgfold instance,
which in most cases is reduced naturally by
<<
cbv iota delta beta
>>
But that reduction is stronger than default conversion (at least in 8.3... still building 8.4).
*)
Axiom deref : forall {A:Set}{B:Set}`{rel_fold A}{P:hpred A}{R G:hrel A}, hreflexive G -> rgfold R G = B -> ref A P R G -> B.
(*Axiom deref : forall {A:Set}{P:hpred A}{R G:hrel A}, ref A P R G -> A.*)
Notation "! e" := (deref _ _ e) (at level 30). (* with reflexivity, add an _ in there *)

(* This axiom asserts that all folds that produce the same result type operate equally on
   the underlying values. This is fragile if a developer specifies multiple instances for
   folding the same type.  This is a weaker version of a more general axiom that
   the relationship between the results of folds of different result types depends on the
   relationship between results of the fold members of the instances when applied to the
   same value.  This version is really only useful for equating identity folds with
   the identity meta_fold instance results. *)
Axiom deref_conversion : forall (A B:Set)(f f':rel_fold A) P R G  rf1 rf2 fe1 fe2,
                         @deref A B f P R G rf1 fe1 = @deref A B f' P R G rf2 fe2.

Axiom ptr_eq_deref : forall A P P' R R' G G' h (p:ref{A|P}[R,G]) (r:ref{A|P'}[G',R']), p≡r -> h[p]=h[r].
Hint Resolve ptr_eq_deref.
Axiom ptr_eq_update : forall A P P' R R' G G' (p:ref{A|P}[R,G]) (r:ref{A|P'}[G',R']),
                        p≡r -> (forall h h' v, h'=heap_write p v h -> h'[r]=v).
(* ptr_eq_update is not likely to be effective for automated solving.  Possibly a good
   candidate for a custom tactic, or with experience with goals that need this
   perhaps we can rewrite it to be more useful as a general hint. *)
Require Import Coq.Setoids.Setoid.
Global Instance refl_ptr_eq {A P R G} : Reflexive (@ptr_eq A A P P R R G G). Admitted.
Global Instance trans_ptr_eq {A P R G} : Transitive (@ptr_eq A A P P R R G G). Admitted.

(** * Default Instances for reachability, containment, precision, folding *)
(** ** Reachability *)

(** A parameterized reachability instance useful for closed base types *)
Definition closed (A:Set) (T:Set){P R G} (p:ref{T|P}[R,G]) (a:A) : Prop := False.
Global Instance nat_reach : ImmediateReachability nat := {imm_reachable_from_in := closed nat}.
Global Instance bool_reach : ImmediateReachability bool := {imm_reachable_from_in := closed bool}.
Global Instance unit_reach : ImmediateReachability unit := {imm_reachable_from_in := closed unit}.
Global Instance pair_reach `{A:Set,B:Set,AR:ImmediateReachability A,BR:ImmediateReachability B} : ImmediateReachability (A*B) :=
  { imm_reachable_from_in :=
    fun T P R G v a => match a with
                   | (l,r) => imm_reachable_from_in v l \/ imm_reachable_from_in v r
                   end
  }.
Fixpoint list_reachable {A:Set}{AR:ImmediateReachability A} (T:Set){P R G} (v:ref{T|P}[R,G]) (a:list A) : Prop :=
  match a with
  | nil => False
  | cons hd tl => imm_reachable_from_in v hd \/ list_reachable T v tl
  end.
Global Instance list_reach `{A:Set,AR:ImmediateReachability A} : ImmediateReachability (list A) :=
  { imm_reachable_from_in := fun T P R G v a => list_reachable T v a }.
(** The reference immediate reachability instance (i.e. reflexivity) was defined earlier *)


(** TODO: Containment and folding are currently formulated as functions. I might get
    better expressiveness if they were formulated as relations (propositions) instead *)
(** ** Containment *)
(** For primitives, any relation contains the permitted interference (none) *)
Definition closed_contains (A:Set) (R:hrel A) : Prop := True.
Global Instance nat_contains : Containment nat := { contains := closed_contains nat }.
Global Instance bool_contains : Containment bool := { contains := closed_contains bool }.
Global Instance unit_contains : Containment unit := { contains := closed_contains unit }.
(** TODO: This pair contains is quite weak. If R cares assumes a certain domain
    of values for either component, this basically becomes unprovable. *)
Global Instance pair_contains `{A:Set,B:Set,CA:Containment A,CB:Containment B} : Containment (A*B) :=
  { contains :=
    fun R => contains (fun a a' h h' => forall b, R (a,b) (a',b) h h')
          /\ contains (fun b b' h h' => forall a, R (a,b) (a,b') h h')
  }.           
Global Instance ref_contains {A:Set}{P:hpred A}{R G:hrel A} : Containment (ref{A|P}[R,G]) :=
  { contains :=
    fun R' => forall a a' h h',
                R a a' h h' -> 
                forall (r:ref{A|P}[R,G]),
                  h[r]=a -> h'[r]=a' ->
                  R' r r h h'
  }.
(** TODO: polymorphic lists *)

(** ** Relation Folding *)
Definition const_rel_fold (A:Set) (R G:hrel A) : Set := A.
Definition const_id_fold {A:Set}(R G:hrel A)(x:A) := x.
Global Instance nat_fold : rel_fold nat := {rgfold := const_rel_fold nat; fold := const_id_fold}.
Global Instance bool_fold : rel_fold bool := {rgfold := const_rel_fold bool; fold := const_id_fold}.
Global Instance unit_fold : rel_fold unit := {rgfold := const_rel_fold unit; fold := const_id_fold}.
Global Instance pair_fold `{A:Set,B:Set,FA:rel_fold A,FB:rel_fold B}: rel_fold (A*B) :=
  { rgfold := fun R G => 
    prod (rgfold (fun _ _ _ _ => True) (fun a a' h h' => forall b, G (a,b) (a',b) h h'))
         (rgfold (fun _ _ _ _ => True) (fun b b' h h' => forall a, G (a,b) (a,b') h h')) ;
    fold := fun R G xy => match xy with (x,y) => (fold x, fold y) end
  }.
Global Instance ref_fold `{A:Set,P:hpred A,R:hrel A,G:hrel A} : rel_fold (ref{A|P}[R,G]) :=
  { rgfold := fun R' G' => ref{A|P}[R,G ⋂ (fun a a' h h' => 
                                             forall (r:ref{A|P}[R,G]), h[r]=a -> h'[r]=a' -> G' r r h h')]
  }.
(* We'll admit the runtime fold for references; the semantics for proofs will need an extensional treatment
   as an axiom. *)
Admitted.
Global Instance fn_fold {T : Set}{B : T -> Set} : rel_fold (forall x : T, B x) := {
    rgfold := fun _ _ => (forall x : T, B x);
    fold := fun _ _ x => x
  }.


(** TODO: polymorphic lists *)                             

(** ** Reachability, containment, and folding for pure types *)
(** A pure type is one that contains no references, anywhere.
    A polymorphic type is pure if all arguments to the type constructor
    and all data constructors are themselves pure. *)
Class pure_type (T:Set).
Global Instance pure_reachable `{A:Set,PA:pure_type A} : ImmediateReachability A :=
  { imm_reachable_from_in := fun _ _ _ _ _ _ => False }.
Global Instance pure_contains `{A:Set,PA:pure_type A} : Containment A :=
  { contains := fun _ => True }.
Global Instance pure_fold `{A:Set,PA:pure_type A} : rel_fold A :=
  { rgfold := fun _ _ => A ; fold := const_id_fold }.
Global Instance nat_pure : pure_type nat.
Global Instance bool_pure : pure_type bool.
Global Instance unit_pure : pure_type unit.
Global Instance list_pure `{A:Set,PA:pure_type A} : pure_type (list A).

(** ** Additional Axioms
    Things like heap dereference being the same between converted and unconverted references, etc. *)
(** For now we need an explicit subtyping operator *)
Axiom convert_P : forall {A:Set}{P P':hpred A}{R G}`{ImmediateReachability A},(forall v h, P v h -> P' v h) -> precise_pred P' -> stable P' R -> ref{A|P}[R,G] -> ref{A|P'}[R,G].
Axiom conversion_P_refeq : forall h A (P P':hpred A) (R G:hrel A)`{ImmediateReachability A} pf1 pf2 pf3 x, h[(@convert_P A P P' R G _ pf1 pf2 pf3 x)]=h[x].
Axiom convert : forall {A:Set}{P P':hpred A}{R R' G G':hrel A}`{ImmediateReachability A},
                ref{A|P}[R,G] ->
                (forall v h, P v h -> P' v h) ->
                (G' ⊆ G) -> (R ⊆ R') -> stable P' R' -> 
                (G' ⊆ R') -> (* <-- self-splitting, this is a pure conversion *)
                ref{A|P'}[R',G'].
Axiom convert_equiv : forall {A}{P P':hpred A}{R R' G G':hrel A}`{ImmediateReachability A}
                             (r:ref{A|P}[R,G]) pfP pfG pfR stab splt,
                             forall h, h[r]=h[@convert A P P' R R' G G' _ r pfP pfG pfR stab splt].

Axiom refine_ref : forall {A:Set}{P P' R G}{fld : rel_fold A}{rfl : hreflexive G}
                   (r : ref{A|P}[R,G])
                   (x : rgfold R G),
                   stable P' R ->
                   ((@deref _ _ fld _ _ _ rfl (eq_refl) r) = x) -> (* <-- This is only available in special match statements, and flow is restricted! *)
                   (forall h, (fold (h[r]))=(deref rfl (eq_refl) r) -> (deref rfl eq_refl r) = x -> P (h[r]) h -> P' (h[r]) h) ->
                   ref{A|P'}[R,G].
Axiom refinement_equiv : forall {A P P' R G}{fld : rel_fold A}{rfl : hreflexive G}
                                (r:ref{A|P}[R,G]) x stab pf refpf,
                                forall h, h[r] = h[@refine_ref A P P' R G fld rfl r x stab pf refpf].
