Section Belief.

  Require Import Syntax.
  Require Import ProofSystem.
  Require Import Coq.Bool.Bool.
  Require Import Setoid.
  Require Import Coq.Arith.Peano_dec.
  Require Export FirstOrder.

  Record belief_model : Type := {
                            B_W : Set;
                            B_lt : B_W -> B_W -> Prop; 
                            B_s : B_W -> fo_model; 
                            B_P : Set; 
                            B_worldview : B_P -> forall (w : B_W), (var -> D (B_s w)) -> formula -> Prop;
                            B_coerce_p_to_d : forall (w : B_W), B_P -> (D (B_s w));
                            B_coerce_d_to_p : forall (w : B_W), (D (B_s w)) -> B_P
                          }.

Axiom B_non_empty : forall (B : belief_model), exists w : B_W B, True.

  (****************************************************************************)
  (*              Eq_p iff forall worlds Equivalent under d_Eq                *)
  (****************************************************************************)

  Definition B_p_Eq (B : belief_model) (p1 p2 : B_P B) := 
    forall (w : B_W B), 
      d_Eq (B_s B w) (B_coerce_p_to_d B w p1) (B_coerce_p_to_d B w p2).

  (****************************************************************************)
  (*                              lt is monotonic                             *)
  (****************************************************************************)

  (* If w' is accessible from w, then the domain of w can reach the domain 
   * of w'. *)
  Axiom B_extend_d_lt : forall (B : belief_model) (w w' : B_W B), 
                        B_lt B w w' ->  D (B_s B w) -> D (B_s B w').

  (* Extend d-equivalent things produces d-equivalent things *)
  Axiom B_extend_d_lt_respects : forall (B : belief_model) (w w' : B_W B) 
                                      (l : B_lt B w w') (d d' : D (B_s B w)),
    d_Eq (B_s B w) d d' -> 
    d_Eq (B_s B w') (B_extend_d_lt B w w' l d) (B_extend_d_lt B w w' l d').

  (* Extending once and then extending again is the same as just extending 
   * all the way the first time. *)
  Axiom B_extend_d_lt_idempotent : 
    forall (B : belief_model) (w w' w'' : B_W B) (l : B_lt B w w') (l' : B_lt B w' w'') 
           (l'' : B_lt B w w'') (d : D (B_s B w)), 
      (B_extend_d_lt B w' w'' l' (B_extend_d_lt B w w' l d)) 
      = B_extend_d_lt B w w'' l'' d.

  (* extending to the current world is the identity *)
  Axiom B_extend_d_once : forall (B : belief_model) (w : B_W B) 
                               (l : B_lt B w w) (d : D (B_s B w)),
                          (B_extend_d_lt B w w l d) = d.

  (* Cannot be proven as stated. Can if p_Eq defined with exists instead 
   * of forall. *)
  Axiom B_coerce_d_same : forall (B : belief_model) (w w' : B_W B) (l : B_lt B w w') 
                               (d : D (B_s B w)) (d' : D (B_s B w')), 
                        d_Eq (B_s B w') (B_extend_d_lt B w w' l d) d' -> 
                        (B_p_Eq B) (B_coerce_d_to_p B w d) (B_coerce_d_to_p B w' d').

  (* Coercing D-equivalent things produces P-equivalent things *)
  Axiom B_coerce_d_respects : forall (B : belief_model) (w : B_W B) 
                                   (d d' : D (B_s B w)),
                            d_Eq (B_s B w) d d' -> 
                            B_p_Eq B (B_coerce_d_to_p B w d) (B_coerce_d_to_p B w d').

  (* Coerceing P-equivalent things produces D-equivalent things *)
  Axiom B_coerce_p_respects : forall (B : belief_model) (w : B_W B) (p p' : B_P B),
    B_p_Eq B p p' -> d_Eq (B_s B w) (B_coerce_p_to_d B w p) (B_coerce_p_to_d B w p').
  
  (* coerce_p_to_d is the inverse of B_coerce_d_to_p *)
  Axiom B_coerce_p_inverse : forall (B : belief_model) (w : B_W B) (d : D (B_s B w)),
                         d_Eq (B_s B w) 
                              (B_coerce_p_to_d B w (B_coerce_d_to_p B w d)) d.

  (* B_coerce_d_to_p is the inverse of coerce_p_to_d *)
  Axiom B_coerce_d_inverse : forall (B : belief_model) (w : B_W B) (p : B_P B),
                           B_p_Eq B (B_coerce_d_to_p B w (B_coerce_p_to_d B w p)) p.

  (* extend_d_lt is injective. This means that different elements of w can not
   * be "glued together" by extend_d_lt. Hence, each element of w' is assigned
   * up to one element of w, and each element of w is assigned an element of w' 
   * Hence, w is a subset of w', up to relabeling. *)
  Axiom B_extend_d_lt_inj : forall (B : belief_model) (w w' : B_W B) (l : B_lt B w w') 
                                 (d1 d2 : D (B_s B w)),
                            d_Eq (B_s B w') 
                               (B_extend_d_lt B w w' l d1) (B_extend_d_lt B w w' l d2)
                            -> d_Eq (B_s B w) d1 d2.

  (* If w' is accessible from w, then two domain elements that are equivalent
   * in w are also equivalent in w'. *)
  Axiom B_eq_subset_lt : forall (B : belief_model) (w w' : B_W B) (l : B_lt B w w') 
                              (d d' : D (B_s B w)), 
                         d_Eq (B_s B w) d d' -> 
                         d_Eq (B_s B w') 
                             (B_extend_d_lt B w w' l d) (B_extend_d_lt B w w' l d').

  (* If w' is accessible from w, then every relation in w has a superset in w'. *)
  Axiom B_r_subset_lt : forall (B : belief_model) (w w' : B_W B) (l : B_lt B w w') 
                             (ds : list (D (B_s B w))) (i : nat), 
                        R (B_s B w) i ds -> 
                        R (B_s B w') i (map (B_extend_d_lt B w w' l) ds).

  (*If w' is accessible from w, then every function on w has a superset on w'. *)
  Axiom B_f_subset_lt : forall (B : belief_model) (w w' : B_W B) (l : B_lt B w w') 
                             (ds : list (D (B_s B w))) (j : nat), 
                        d_Eq (B_s B w') 
                             (B_extend_d_lt B w w' l (F (B_s B w) j ds))
                             (F (B_s B w') j (map (B_extend_d_lt B w w' l) ds)).

  (****************************************************************************)
  (*                         lt is a partial order                            *)
  (****************************************************************************)

  (* Reflexivity *)
  Axiom B_lt_refl : forall (B : belief_model) (w : B_W B), B_lt B w w.
  
  (* Antisymmetry *)
  Axiom B_lt_antisymm : forall (B : belief_model) (w w' : B_W B), 
    B_lt B w w' -> B_lt B w' w -> w = w'.

  (* Transitivity *)
  Axiom B_lt_trans : forall (B : belief_model) (w w' w'' : B_W B),
    B_lt B w w' -> B_lt B w' w'' -> B_lt B w w''.
      
  (***************************************************************************)
  (*                  P is a subset of all possible domains.                 *)
  (***************************************************************************)

  (* d is injective. Thus, P is a subset of each domain. *)
  (* (See extend_d_lt for an explaination.) *)
  Axiom B_d_inj : forall (B : belief_model) (w : B_W B) (p1 p2 : B_P B),
                  d_Eq (B_s B w) (B_coerce_p_to_d B w p1) (B_coerce_p_to_d B w p2)
                  -> p1 = p2.

  (****************************************************************************)
  (*                            Helper Functions                              *)
  (****************************************************************************)

  (* A helper function that relativizes interpretation functions to 
   * constructively accessible worlds. *)
  Function B_extend_v (B : belief_model) (w w': (B_W B)) (l : B_lt B w w') 
           (v : var -> D (B_s B w)) : var -> D (B_s B w') := 
    fun v1 => B_extend_d_lt B w w' l (v v1).

  (* Substitute a domain element for a variable in a valuation function. *)
  Function B_subst_map (B : belief_model) (w : B_W B) (v : var -> D(B_s B w)) 
           (x : var)(d : D (B_s B w)) : var -> D (B_s B w) :=
    fun v1 => if var_dec v1 x 
              then d
              else v v1.

  (****************************************************************************)
  (*     The mu fixpoint interprets terms as domain elements in a world.      *)
  (*     This is mutually recursive with models, due to group principals.     *)
  (****************************************************************************)
  Fixpoint B_mu (B : belief_model) (w : B_W B) (v : var -> D (B_s B w)) 
           (t : term) {struct t} : D (B_s B w) :=
    match t with
      | Var_t v1 => v v1 
      | Fun_t (Fn i) ts => F (B_s B w) i (map (B_mu B w v) ts) 
    end.
  (************************************************************************************)
  (*    Models is the heart of the model theory. Models describes when a FOCALE model    *)
  (*  witnesses a FOCALE formula. It is mutually recursive with both mu and world_d_Eq. *)
  (************************************************************************************)
  Fixpoint B_models (B : belief_model) (w : B_W B) (v : var -> D (B_s B w)) (phi : formula) {struct phi} : Prop := 
    match phi with
       | FocalTrue => True 
       | FocalFalse => False 
       | Rel_f (Rel i) ts => R (B_s B w) i (map (fun x => B_mu B w v x) ts) 
       | Eq t1 t2 => d_Eq (B_s B w) (B_mu B w v t1) (B_mu B w v t2)
       | And phi1 phi2 => B_models B w v phi1 /\ B_models B w v phi2 
       | Or phi1 phi2 => B_models B w v phi1 \/ B_models B w v phi2 
       | Implies phi1 phi2 => forall (w' : B_W B) (l :B_lt B w w'), 
                                B_models B w' (B_extend_v B w w' l v) phi1 
                                -> B_models B w' (B_extend_v B w w' l v) phi2
       | Not phi => forall (w' : B_W B) (l : B_lt B w w'), 
                      ~(B_models B w' (B_extend_v B w w' l v) phi)
       | Forall v1 phi => forall (w' : B_W B) (d : D (B_s B w')) 
                            (l : (B_lt B w w')), 
                            B_models B w' (B_subst_map B w' 
                                            (B_extend_v B w w' l v) 
                                              v1 d) phi
       | Exists v1 phi => exists d : D (B_s B w), 
                            B_models B w (B_subst_map B w v v1 d) phi
       | Says tau phi => 
           let p : B_P B := B_coerce_d_to_p B w (B_mu B w v tau) in
             B_worldview B p w v phi
       | Speaksfor tau1 tau2 => 
           let p2 : B_P B := (B_coerce_d_to_p B w (B_mu B w v tau2)) in 
           let p1 : B_P B := (B_coerce_d_to_p B w (B_mu B w v tau1)) in
              forall (phi : formula) (w' : B_W B) (l : B_lt B w w'), 
                B_worldview B p1 w' (B_extend_v B w w' l v) phi 
             -> B_worldview B p2 w' (B_extend_v B w w' l v) phi
      end.

Axiom B_handoff : forall (B : belief_model) (w : B_W B) (v : var -> D (B_s B w))
                         (tau1 tau2 : term),
  
  B_worldview B (B_coerce_d_to_p B w (B_mu B w v tau2)) w v (Speaksfor tau1 tau2) ->
  (forall phi : formula,
      B_worldview B (B_coerce_d_to_p B w (B_mu B w v tau1)) w v phi 
   -> B_worldview B (B_coerce_d_to_p B w (B_mu B w v tau2)) w v phi).
  
(* Extend the above to lists of formulas. *)
Fixpoint B_modelsAll (B : belief_model) (w : B_W B) 
         (v : var -> D (B_s B w)) (Gamma : list formula) : Prop := 
  match Gamma with 
    | nil => True
    | phi :: Gamma' => B_models B w v phi /\ B_modelsAll B w v Gamma'
  end.


  (***************************************************************************)
  (*                              Worldview Axioms                           *)
  (***************************************************************************)

  Axiom B_worldview_monotonic : forall (B : belief_model) (w w' : B_W B) 
                                       (v : var -> D (B_s B w)) 
                                       (l : B_lt B w w') (p : B_P B) 
                                       (phi : formula),
                                  B_worldview B p w v phi ->
                                  B_worldview B p w' (B_extend_v B w w' l v) phi.


  Axiom B_worldview_respects : forall (B : belief_model) (w : B_W B) (p p' : B_P B)
                                      (v : var -> D (B_s B w)),
                               B_p_Eq B p p' -> forall phi : formula,
                                                B_worldview B p w v phi -> 
                                                B_worldview B p' w v phi.

  Axiom B_worldview_closed : forall (B : belief_model) (w : B_W B) (p : B_P B)
                                  (v : var -> D (B_s B w))
                                  (Gamma : list formula) (phi : formula),
                             (forall psi: formula, 
                                In psi Gamma -> 
                                B_worldview B p w v psi) -> 
                             (forall (w' : B_W B) (v' : var -> D (B_s B w')),
                                B_modelsAll B w' v' Gamma ->
                                B_models B w' v' phi) -> 
                             B_worldview B p w v phi.
                             
  Axiom B_worldview_transparent : forall (B : belief_model) (w : B_W B) 
                                       (v : var -> D (B_s B w))
                                       (tau : term) (phi : formula),
                                  let p := B_coerce_d_to_p B w (B_mu B w v tau) 
                                  in
                                  B_worldview B p w v phi <->
                                  B_worldview B p w v (Says tau phi).


  Axiom B_worldview_contains : forall (B : belief_model) (p : B_P B)
                                      (phi : formula),
                                 (forall (w : B_W B) (v : var -> D (B_s B w)), B_models B w v phi) ->
                                 forall (w : B_W B) (v : var -> D (B_s B w)), B_worldview B p w v phi.

  Axiom B_worldview_cond1 : forall (B : belief_model) (p : B_P B)
                                   (w : B_W B) (v : var -> D (B_s B w))
                                   (phi : formula) (x : var),
                              is_true (notfree_in_formula x phi) ->
                              (B_worldview B p w v phi <-> 
                               forall d : D (B_s B w), B_worldview B p w (B_subst_map B w v x d) phi).

  Axiom B_worldview_cond2 : forall (B : belief_model) (p : B_P B)
                                   (w : B_W B) (v : var -> D (B_s B w))
                                   (phi : formula) (x y : var),
                              ~ (is_true (notfree_in_formula x phi)) ->
                              is_true (notfree_in_formula y phi) ->
                              forall d : D (B_s B w),
                                B_worldview B p w (B_subst_map B w v x d) phi ->
                                B_worldview B p w (B_subst_map B w v y d) (subst x (Var_t y) phi).

  Axiom non_principal : forall B : belief_model, B_P B.
  Axiom non_principal_worldview : forall (B : belief_model) (w : B_W B) (v : var -> D (B_s B w)) (phi : formula),
                                    B_worldview B (non_principal B) w v phi.


End Belief.




