Section Model.

  Require Import Syntax.
  Require Import Coq.Bool.Bool.
  Require Import Setoid.
  Require Import Coq.Arith.Peano_dec.
  Require Export FirstOrder.

  (************************************************************************************)
  (*                                  The FOCALE Model                                   *)
  (************************************************************************************)


  (* The FOCALE model. Based off of Kripke frames. *)
  Record focal_model : Type := {
                            W : Set; (* Set of possible worlds *)
                            lt : W -> W -> Prop; (* Constructive accessibility *)
                            s : W -> fo_model; (* Interpretation of worlds as first-order models *)
                            P : Set; (* Set of principals; a subset of all possible first-order model domains *)
                            A : P -> (W -> W -> Prop); (* Principal accessibility relations. *)
                            coerce_p_to_d : forall (w : W), P -> (D (s w)); (* Coercion function for principals. *)
                            coerce_d_to_p : forall (w : W), (D (s w)) -> P (* Coercion function for domain elements *)
                          }.

  (* 
   NOTE: 
   bottom_p is the principal that represents non-principal domain elements in the FOCALE model.
   The belief set of the bottom principal is only those formulas that are valid. I.e.,
   those formuas that ALL principals believe.
*)

(* Every FOCALE model is non-empty. *)
Axiom non_empty : forall (M : focal_model), exists w : W M, True.


  (************************************************************************************)
  (*                  Eq_p iff forall worlds Equivalent under d_Eq                   *)
  (************************************************************************************)

  Definition p_Eq (M : focal_model) (p1 p2 : P M) := forall (w : W M), d_Eq (s M w) (coerce_p_to_d M w p1) (coerce_p_to_d M w p2).

  (************************************************************************************)
  (*                                lt is monotonic                                   *)
  (************************************************************************************)


  (* If w' is accessible from w, then the domain of w can reach the domain of w' *)
  Axiom extend_d_lt : forall (M : focal_model) (w w' : W M), 
                        lt M w w' ->  D (s M w) -> D (s M w').

  (* Extend d-equivalent things produces d-equivalent things *)
  Axiom extend_d_lt_respects : forall (M : focal_model) (w w' : W M) (l : lt M w w') (d d' : D (s M w)),
    d_Eq (s M w) d d' -> d_Eq (s M w') (extend_d_lt M w w' l d) (extend_d_lt M w w' l d').

  (* Extending once and then extending again is the same as just extending all the way the first time. *)
  Axiom extend_d_lt_idempotent : forall (M : focal_model) (w w' w'' : W M) (l : lt M w w') (l' : lt M w' w'') (l'' : lt M w w'') (d : D (s M w)), 
                                   (extend_d_lt M w' w'' l' (extend_d_lt M w w' l d)) = extend_d_lt M w w'' l'' d.

  (* extending to the current world is the identity *)
  Axiom extend_d_once : forall (M : focal_model) (w : W M) (l : lt M w w) (d : D (s M w)),
    (extend_d_lt M w w l d) = d.

  (* Cannot be proven as stated. Can if p_Eq defined with exists instead of forall. *)
  Axiom coerce_d_same : forall (M : focal_model) (w w' : W M) (l : lt M w w') (d : D (s M w)) (d' : D (s M w')), 
    d_Eq (s M w') (extend_d_lt M w w' l d) d' -> (p_Eq M) (coerce_d_to_p M w d) (coerce_d_to_p M w' d').

  (* Coercing D-equivalent things produces P-equivalent things *)
  Axiom coerce_d_respects : forall (M : focal_model) (w : W M) (d d' : D (s M w)),
    d_Eq (s M w) d d' -> p_Eq M (coerce_d_to_p M w d) (coerce_d_to_p M w d').

  (* Coerceing P-equivalent things produces D-equivalent things *)
  Axiom coerce_p_respects : forall (M : focal_model) (w : W M) (p p' : P M),
    p_Eq M p p' -> d_Eq (s M w) (coerce_p_to_d M w p) (coerce_p_to_d M w p').
  
  (* coerce_p_to_d is the inverse of coerce_d_to_p *)
  Axiom coerce_p_inverse : forall (M : focal_model) (w : W M) (d : D (s M w)),
                         d_Eq (s M w) (coerce_p_to_d M w (coerce_d_to_p M w d)) d.

  (* coerce_d_to_p is the inverse of coerce_p_to_d *)
  Axiom coerce_d_inverse : forall (M : focal_model) (w : W M) (p : P M),
                           p_Eq M (coerce_d_to_p M w (coerce_p_to_d M w p)) p.

  (* Two P-equivalent principals have the same accessibility relations *)
  Axiom A_P_Eq : forall (M : focal_model) (w w': W M) (p p' : P M),
    p_Eq M p p' -> (A M p w w' <-> A M p' w w').

  (* extend_d_lt is injective. This means that different elements of w can not *)
  (* be "glued together" by extend_d_lt. Hence, each element of w' is assigned *)
  (* up to one element of w, and each element of w is assigned an element of w' *)
  (* Hence, w is a subset of w', up to relabeling. *)
  Axiom extend_d_lt_inj : forall (M : focal_model) (w w' : W M) (l : lt M w w') (d1 d2 : D (s M w)),
                            d_Eq (s M w') (extend_d_lt M w w' l d1) (* d_Eq *) (extend_d_lt M w w' l d2)
                            -> d_Eq (s M w) d1 (* d_Eq *) d2.

  (* If w' is accessible from w, then two domain elements that are equivalent in w 
   are also equivalent in w'. *)
  Axiom eq_subset_lt : forall (M : focal_model) (w w' : W M) (l : lt M w w') (d d' : D (s M w)), 
                         d_Eq (s M w) d d' -> d_Eq (s M w') (extend_d_lt M w w' l d) (extend_d_lt M w w' l d').

  (* If w' is accessible from w, then every relation in w has a superset in w'. *)
  Axiom r_subset_lt : forall (M : focal_model) (w w' : W M) (l : lt M w w') (ds : list (D (s M w))) (i : nat), 
                        R (s M w) i ds -> R (s M w') i (map (extend_d_lt M w w' l) ds).

  (*If w' is accessible from w, then every function on w has a superset on w'. *)
  Axiom f_subset_lt : forall (M : focal_model) (w w' : W M) (l : lt M w w') (ds : list (D (s M w))) (j : nat), 
                        d_Eq (s M w') (extend_d_lt M w w' l (F (s M w) j ds)) (* `d_Eq` *) (F (s M w') j (map (extend_d_lt M w w' l) ds)).

  (************************************************************************************)
  (*                             lt is a partial order                                *)
  (************************************************************************************)

  (* Reflexivity *)
  Axiom lt_refl : forall (M : focal_model) (w : W M), lt M w w.
  
  (* Antisymmetry *)
  Axiom lt_antisymm : forall (M : focal_model) (w w' : W M), 
    lt M w w' -> lt M w' w -> w = w'.

  (* Transitivity *)
  Axiom lt_trans : forall (M : focal_model) (w w' w'' : W M),
    lt M w w' -> lt M w' w'' -> lt M w w''.
      
  (************************************************************************************)
  (*                      P is a subset of all possible domains.                      *)
  (************************************************************************************)

  (* d is injective. Thus, P is a subset of each domain. *)
  (* (See extend_d_lt for an explaination.) *)
  Axiom d_inj : forall (M : focal_model) (w : W M) (p1 p2 : P M),
                  d_Eq (s M w) (coerce_p_to_d M w p1) (coerce_p_to_d M w p2)
                  -> p1 = p2.

    
  (************************************************************************************)
  (*                           A_p is dense and transitive                            *)
  (************************************************************************************)
  
  (* R o R \subseteq <= o R *)
  Axiom A_Intuitive_Trans : forall (M : focal_model) (p : P M) (w u v : W M), 
    (A M p w u /\ A M p u v) -> exists w' : W M, lt M w w' /\ A M p w' v.

  (* R \subseteq <= o R o R *)
  Axiom A_Intuitive_Dense : forall (M : focal_model) (p : P M) (w u : W M),
    A M p w u -> exists v : W M, exists v' : W M, lt M w v /\ A M p v v' /\ A M p v' u.

  (************************************************************************************)
  (*                              A_p is monotonic                                    *)
  (************************************************************************************)

  (* If w' is accessible from w according to p, then the domain of w is a subset of the domain of w'. *)
  Axiom extend_d_A : forall (M : focal_model) (w w' : W M) (p : P M), 
                       A M p w w' -> D (s M w) -> D (s M w').

  (* Extending D-equivalent elements gives a D-equivalent result *)
  Axiom extend_d_A_respects : forall (M : focal_model) (w w' : W M) (p : P M) (a : A M p w w') (d d' : D (s M w)),
    d_Eq (s M w) d d' -> d_Eq (s M w') (extend_d_A M w w' p a d) (extend_d_A M w w' p a d').

  (* Exteinding to the same world always returns the same result, no matter why we can extend. *)
  Axiom extend_d_A_same : forall (M : focal_model) (w w' : W M) (p p' : P M) (a1 : A M p w w') (a2 : A M p' w w') (d : D (s M w)),
                              d_Eq (s M w') (extend_d_A M w w' p a1 d) (extend_d_A M w w' p' a2 d).

  (* extend_d_A is injective, allowing it to act as proof of a subset relation. *)
  Axiom extend_d_A_inj : forall (M : focal_model) (w w' : W M) (p : P M) (a : A M p w w') (d1 d2 : D (s M w)),
                           d_Eq (s M w') (extend_d_A M w w' p a d1) (* `d_Eq` *) (extend_d_A M w w' p a d2)
                           -> d_Eq (s M w) d1 (* `d_Eq` *) d2.

  (* If w' is accessible from w according to P, then equivalence on w is a subset of equivalence of w'. *)
  Axiom eq_subset_A : forall (M : focal_model) (w w' : W M) (p : P M) (a :A M p w w') (d d' : D (s M w)) , 
                        d_Eq (s M w) d d' -> d_Eq (s M w') (extend_d_A M w w' p a d) (extend_d_A M w w' p a d).

  (* If w' is accessible from w according to P, then all relations on w have a superset on w'. *)
  Axiom r_subset_A : forall (M : focal_model) (w w' : W M) (p : P M) (a : A M p w w') (ds : list (D (s M w))) (i : nat), 
                       R (s M w) i ds -> R (s M w') i (map (extend_d_A M w w' p a) ds).

  (* If w' is accessible from w according to P, then all functions on w have a function on w' that produces equivalent results. *)
  Axiom f_subset_A : forall (M : focal_model) (w w' : W M) (p : P M) (a : A M p w w') (ds : list (D (s M w))) (j : nat), 
                       d_Eq (s M w') (extend_d_A M w w' p a (F (s M w) j ds)) (* `d_Eq` *) (F (s M w') j (map (extend_d_A M w w' p a) ds)).

  (************************************************************************************)
  (*                                Helper Functions                                  *)
  (************************************************************************************)

  (* A helper function that relativizes interpretation functions to constructively accessible worlds. *)
  Function extend_v (M : focal_model) (w w': (W M)) (l : lt M w w') (v : var -> D (s M w)) 
    : var -> D (s M w') := 
    fun v1 => extend_d_lt M w w' l (v v1).

  (* A helper function that relativizes interpretation functions to principal accessible worlds. *)
  Function extend_v_A (M : focal_model) (w w' : W M) (p : P M) (a : A M p w w') (v : var -> D (s M w)) 
    : var -> D (s M w') := 
    fun v1 => extend_d_A M w w' p a (v v1).

  (* Substitute a domain element for a variable in a valuation function. *)
  Function subst_map (M : focal_model) (w : W M) (v : var -> D(s M w))(x : var)(d : D (s M w)) 
    : var -> D (s M w) :=
    fun v1 => if var_dec v1 x 
              then d
              else v v1.

  (* Describes a connection between two worlds, in an undirected graph. *)
  Inductive connection (M : focal_model) (p : P M) (w w' : W M) : Set :=
    | eqw : (w = w') -> connection M p w w'
    | lte : forall w'' : W M, lt M w w'' -> connection M p w'' w' -> connection M p w w'
    | ltp : forall w'' : W M, A M p w w'' -> connection M p w'' w' -> connection M p w w'
    | gte : forall w'' : W M, lt M w'' w -> connection M p w'' w' -> connection M p w w'
    | gtp : forall w'' : W M, A M p w'' w -> connection M p w'' w' -> connection M p w w'
    | con_symm : connection M p w' w -> connection M p w w'
    | con_trans : forall w'': W M, connection M p w w'' -> connection M p w'' w' -> connection M p w w'.

  (* Two worlds are connected if there is a connection between them. *)
  Definition connected (M : focal_model) (p : P M) (w w' : W M) : Prop := exists _ : connection M p w w', True.

  (* The accessibility relation of a principal restricted to the worlds that are connected to w. *)
  Definition restricted_A (M : focal_model) (p : P M) (w w' w'' : W M) : Prop := connected M p w w' /\ connected M p w w'' /\ A M p w' w''.

  (* It doesn't matter what way we get from A to A, we can get there.  *)
  Axiom restricted_A_irrelevant : forall (M : focal_model) (p : P M) (w w' w'' : W M) (r1 r2 : restricted_A M p w w' w''), r1 = r2.
  
  (* Retrieve the component of a restricted_A proof that proves that p believes the worlds are accessible. *)
  Definition restricted_A_to_A (M : focal_model) (p : P M) (w w' w'' : W M) (r : restricted_A M p w w' w'') : A M p w' w''.
    unfold restricted_A in r. decompose [and] r. exact H2.
  Defined.
  
  (************************************************************************************)
  (*                       Relationship between A_p and lt                            *)
  (************************************************************************************)

  (* We can "complete the square" if we have a certain type of right angle. *)
  Axiom F1 : forall (M : focal_model) (p : P M) (w w' u : W M),
    (A M p w u /\ lt M w w') -> exists u' : W M, lt M u u' /\ A M p w' u'.

  (* We can "complete the square" in the other type of right angle. *)
  Axiom F2 : forall (M : focal_model) (p : P M) (w u u' : W M),
    (A M p w u /\ lt M u u') -> exists w' : W M, lt M w w' /\ A M p w' u'.

  (* These next two axioms both state special cases of a further axiom we would like to be true: it doesn't matter how you get there, extending a valuation function from one world to another is the same. *)
  (* Special case 1: Used for saysRI *)
  Axiom saysRI_v_same : forall (M : focal_model) (p p' p'' : P M) (w w' w'' w''' u u' t : W M) (l : lt M w w') (l' : lt M w' w'') 
                               (l'' : lt M w'' w''') (l''' : lt M u u') (a : A M p' w' u) (a' : A M p u' t) (a'' : A M p'' w''' t) 
                               (v : var -> D (s M w)),
                          p_Eq M p p' ->
                          p_Eq M p' p'' ->
                          (extend_v_A M u' t
                             p a'
                               (extend_v M u u' l'''
                                 (extend_v_A M w' u p' a
                                   (extend_v M w w' l v)))) =
                          (extend_v_A M w''' t
                             p'' a''
                               (extend_v M w'' w''' l'' (extend_v M w' w'' l' (extend_v M w w' l v)))).

  (* Special case 2: Used for saysLI *)
  Axiom saysLI_v_same : forall (M : focal_model) (p p' p'' : P M) (w w' w'' w''' u : W M) (a : A M p w' u) (l : lt M w''' w''') 
                               (a' : A M p'' w'' w''') (l' : lt M w' w'') (l'' : lt M w w') (a'' : A M p' w''' u) (v : var -> D (s M w)), 
                          (extend_v_A M w' u p a (extend_v M w w' l'' v)) = 
                          (extend_v_A M w''' u p' a'' 
                              (extend_v M w''' w''' l (extend_v_A M w'' w''' p'' a' 
                                  (extend_v M w' w'' l' (extend_v M w w' l'' v))))).

  (* A principal that says false must have the locally smallest accessibility relation  *)
  Axiom handoff_necc : forall (M : focal_model) (w : W M) (p : P M),
                         ~(exists w' : W M, exists u : W M, lt M w w' /\ A M p w' u) ->
                         forall (p' : P M) (u u' : W M), restricted_A M p w u u' -> restricted_A M p' w u u'.

  (************************************************************************************)
  (* The mu fixpoint interprets terms as domain elements in a world. This is mutually *)
  (*                 recursive with models, due to group principals.                  *)
  (************************************************************************************)
  Fixpoint mu (M : focal_model) (w : W M) (v : var -> D (s M w)) (t : term) {struct t} : D (s M w) :=
    match t with
      (* Variables should be interpreted by v. *)
      | Var_t v1 => v v1 
      (* Functions are applied to the domain elements found by mapping mu over ts, the list of terms. *)
      | Fun_t (Fn i) ts => F (s M w) i (map (mu M w v) ts) 
    end.
  (************************************************************************************)
  (*    Models is the heart of the model theory. Models describes when a FOCALE model    *)
  (*  witnesses a FOCALE formula. It is mutually recursive with both mu and world_d_Eq. *)
  (************************************************************************************)


  Inductive iModels : forall (M : focal_model) (w : W M) (v : var -> D (s M w)), formula -> Prop :=
    trueM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)), iModels M w v FocalTrue
  | relM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (i : nat) (taus : list term),
             R (s M w) i (map (fun x => mu M w v x) taus)
             -> iModels M w v (Rel_f (Rel i) taus)
  | eqM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (tau tau' : term),
            d_Eq (s M w) (mu M w v tau) (mu M w v tau')
            -> iModels M w v (Eq tau tau')
  | andM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi psi : formula),
            iModels M w v phi -> iModels M w v psi ->
            iModels M w v (And phi psi)
  | orM1 : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi psi : formula),
             iModels M w v phi ->
             iModels M w v (Or phi psi)
  | orM2 : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi psi : formula),
             iModels M w v psi ->
             iModels M w v (Or phi psi)

  | impM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi psi : formula) (iModels' : forall (M : focal_model) (w : W M) (v : var -> D (s M w)), formula -> Prop),
             (forall (w : W M) (v : var -> D (s M w)) (phi : formula), iModels' M w v phi -> iModels M w v phi) ->
             (forall (w' : W M) (l : lt M w w'), iModels' M w' (extend_v M w w' l v) phi -> iModels' M w' (extend_v M w w' l v) psi) ->
             iModels M w v (Implies phi psi)
  | notM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi : formula)(iModels' : forall (M : focal_model) (w : W M) (v : var -> D (s M w)), formula -> Prop), 
             (iModels' M w v phi -> iModels M w v phi) ->
             (iModels' M w v phi -> iModels' M w v FocalFalse) -> 
             iModels M w v (Not phi)
  | forallM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (x : var) (phi : formula),
                     (forall (w' : W M) (l : lt M w w') (d : D (s M w')), iModels M w' (subst_map M w' (extend_v M w w' l v) x d) phi) ->
                     iModels M w v (Forall x phi)
  | existsM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (x : var) (phi : formula),
                (exists (d : D (s M w)), iModels M w (subst_map M w v x d) phi) ->
                iModels M w v (Exists x phi)
  | saysM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (tau : term) (phi : formula),
              (forall (w' : W M) (l : lt M w w') (w'' : W M)(a : A M (coerce_d_to_p M w' (mu M w' (extend_v M w w' l v) tau)) w' w''),
                 iModels M w'' (extend_v_A M w' w'' (coerce_d_to_p M w' (mu M w' (extend_v M w w' l v) tau)) a (extend_v M w w' l v)) phi) ->
              iModels M w v (Says tau phi)
  | speaksforM : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (tau tau' : term),
                 (forall w' w'' : W M, restricted_A M (coerce_d_to_p M w (mu M w v tau')) w w' w'' -> restricted_A M (coerce_d_to_p M w (mu M w v tau)) w w' w'') ->
                 iModels M w v (Speaksfor tau tau').
             

  Fixpoint models (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi : formula) {struct phi} : Prop := 
             match phi with
               (* True is always modeled. *)
               | FocalTrue => True 
               (* False is never modeled. *)
               | FocalFalse => False 
               (* A relation among terms is modeled iff the corresponding relation of domain elements is. *)
               | Rel_f (Rel i) ts => R (s M w) i (map (fun x => mu M w v x) ts) 
               (* Two terms are equal if their domain elements are equivalent. *)
               | Eq t1 t2 => d_Eq (s M w) (mu M w v t1) (mu M w v t2)
               (* The "and" of two formulas is modeled if both formulas are modeled. *)
               | And phi1 phi2 => models M w v phi1 /\ models M w v phi2 
               (* The "or" of two formulas is modeled if either formula is modeled. *)
               | Or phi1 phi2 => models M w v phi1 \/ models M w v phi2 
               | Implies phi1 phi2 => forall (w' : W M) (l :lt M w w'), (* An implication is modeled if for 
                                                            all worlds that are constructivally 
                                                            accessible from the current one *)
                                        models M w' (extend_v M w w' l v) phi1 (* if the hypothesis is modeled *) 
                                        -> models M w' (extend_v M w w' l v) phi2 (* than so is the conclusion *)

               | Not phi => forall (w' : W M) (l : lt M w w'), (* A not of a formula is modeled if, for all 
                                                   worlds constructivally accessible from the 
                                                   current one *)
                              ~(models M w' (extend_v M w w' l v) phi) (* that formula is never modeled. *)

               (* A formula of the type forall x, phi is modeled if, for all worlds contructivally accessible from the 
   current one, and all domain elements d of this world *)
               | Forall v1 phi => forall (w' : W M) (d : D (s M w')) (l : (lt M w w')), 
                                    (* the formula obtained by replacing the image of d for x in phi is modeled *)
                                    models M w' (subst_map M w' (extend_v M w w' l v) v1 d) phi
               | Exists v1 phi => exists d : D (s M w), (* A formula of the form exists x, phi is modeled if there is a 
                                            domain element d such that *)
                                    models M w (subst_map M w v v1 d) phi (* the formula obtained by replacing d 
                                                                     for x in phi is modelled. *)
               | Says tau phi => forall (w' : W M) (l : lt M w w') (w'' : W M)(a : A M (coerce_d_to_p M w' (mu M w' (extend_v M w w' l v) tau)) w' w''),  (* tau says phi is modeled 
                                                                                    if, for every world that
                                                                                    is accessible according 
                                                                           
         to tau *)
                                   models M w'' (extend_v_A M w' w'' (coerce_d_to_p M w' (mu M w' (extend_v M w w' l v) tau)) a (extend_v M w w' l v)) phi (* phi is modeled. *)

               | Speaksfor tau1 tau2 => 
let p2 : P M := (coerce_d_to_p M w (mu M w v tau2)) in 
                 let p1 : P M := (coerce_d_to_p M w (mu M w v tau1)) in
                 forall w' w'' : W M, restricted_A M p2 w w' w'' -> restricted_A M p1 w w' w''
             end.

(*Theorem inductive_implies_fixpoint : forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi : formula),
                                       (forall (w : W M) (v : var -> D (s M w)) pmodels M w v phi -> iModels M w v phi) -> iModels M w v phi -> models M w v phi.
Proof.
  intros. induction H0.
  (* Case FocalTrue *)
    simpl; trivial.
  (*Case Relation *)
    simpl. exact H0.
  (* Case Equality *)
    simpl. exact H0.
  (* Case And *)
    simpl. split.
    apply IHiModels1. intros. exact H0_.
    apply IHiModels2. intros. exact H0_0.
  (* Case Or1 *)
    simpl. left. apply IHiModels. intro; exact H0.
  (* Case Or2 *)
    simpl. right. apply IHiModels. intro; exact H0.
  (* Case Implies *)
    simpl. intros.
    apply H1. apply H2.
  *)  

(* Should be provable with inversion, however, 
 * inversion gives me equality of some sigTs, and I can't figure out how to 
 * get what I need from those. It should be simple, since the sigTs are
 * just pairs, the projection functions should work. However,
 * Coq's rewrite functionality is having problems.
 *)
(*
Theorem models_equiv :  forall (M : focal_model) (w : W M) (v : var -> D (s M w)) (phi : formula),
                         models M w v phi <-> iModels M w v phi.
*)


(* Extend the above to lists of formulas. *)
Fixpoint modelsAll (M : focal_model) (w : W M) (v : var -> D (s M w)) (Gamma : list formula) : Prop := 
  match Gamma with 
    | nil => True
    | phi :: Gamma' => models M w v phi /\ modelsAll M w v Gamma'
  end.

                       

Axiom non_principal : forall (M : focal_model), P M.

Axiom non_principal_A : forall (M : focal_model) (w w' : W M),
                          ~(A M (non_principal M) w w').

End Model.

  Hint Resolve ind_R ind_F : ModelTheory.
  Hint Resolve extend_d_lt : ModelTheory.
  Hint Resolve extend_d_lt_inj : ModelTheory.
  Hint Resolve eq_subset_lt r_subset_lt f_subset_lt : ModelTheory.
  Hint Resolve lt_refl lt_antisymm lt_trans : ModelTheory.
  Hint Resolve d_inj : ModelTheory.
  Hint Resolve extend_d_A extend_d_A_inj : ModelTheory.
  Hint Resolve eq_subset_A r_subset_A f_subset_A : ModelTheory.
  Hint Unfold extend_v extend_v_A subst_map : ModelTheory.
  Hint Unfold p_Eq modelsAll : ModelTheory.
  Hint Resolve equiv_refl equiv_symm equiv_trans : ModelTheory.  
  Hint Resolve var_dec : ModelTheory.
