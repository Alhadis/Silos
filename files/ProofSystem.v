Section ProofSystem.

Require Import Syntax.
Require Import Coq.Arith.EqNat.

(************************************************************************************)
(*              Move all formulas into the belief space of a term.                  *)
(************************************************************************************)
Function relativize (p : term) (Gamma : list formula) {struct Gamma}: list formula :=
  map (fun psi => (Says p psi)) Gamma.

(************************************************************************************)
(* Proves is the heart of the proof theory. Proves describes when a FOCALE formula can *)
(* be proven given some assumed FOCALE formulas. We write Gamma |- phi if FOCALE formula  *)
(*     phi can be proven by assuming ALL of the focale formulas in the set Gamma.      *)
(************************************************************************************)

Inductive proves : list formula -> formula -> Prop :=
  (* Hypothesis: We can prove something that is assumed. *)
  hyp : forall (Gamma : list formula) (phi : formula), 
    In phi Gamma 
    -> proves Gamma phi
  (* We can always prove that something is true. *)
| trueI : forall (Gamma : list formula),
    proves Gamma FocalTrue
  (* If we assume falsity, then we can prove anything. *)
| falseE : forall (Gamma : list formula) (phi : formula), 
    proves Gamma FocalFalse 
    -> proves Gamma phi
  (* If we can prove both phi and psi, we can prove phi /\ psi. *)
| andI : forall (Gamma : list formula) (phi : formula) (psi : formula), 
    proves Gamma phi -> proves Gamma psi 
    -> proves Gamma (And phi psi)
  (* If we can prove phi /\ psi, we can prove phi. *)
| andE1 : forall (Gamma : list formula) (phi : formula) (psi : formula),
    proves Gamma (And phi psi) 
    -> proves Gamma phi
  (* If we can prove phi /\ psi, we can prove psi. *)
| andE2 : forall (Gamma : list formula) (phi : formula) (psi : formula),
    proves Gamma (And phi psi) 
    -> proves Gamma psi
  (* If we can prove phi, we can prove phi \/ psi *)
| orI1 : forall (Gamma : list formula) (phi : formula) (psi : formula),
    proves Gamma phi 
    -> proves Gamma (Or phi psi)
  (* If we can prove psi, we can prove phi \/ psi *)
| orI2 : forall (Gamma : list formula) (phi : formula) (psi : formula),
    proves Gamma psi 
    -> proves Gamma (Or phi psi)
  (* If we can prove A \/ B, and assuming either A or B proves C, we can prove C *)
| orE: forall (Gamma : list formula) (phi1 : formula) (phi2 : formula) (psi : formula),
    proves Gamma (Or phi1 phi2) 
       -> proves (phi1::Gamma) psi 
       -> proves (phi2::Gamma) psi 
    -> proves Gamma psi
  (* If assuming phi along with the other assumptions in Gamma proves psi, then *)
  (* assuming Gamma proves phi -> psi. *)
| impI : forall (Gamma : list formula) (phi : formula) (psi : formula),
    proves (phi::Gamma) psi
    -> proves Gamma (Implies phi psi)
  (* If we can prove phi and phi -> psi, we can prove psi. *)
| impE : forall (Gamma : list formula) (phi : formula) (psi : formula), 
    proves Gamma phi -> proves Gamma (Implies phi psi)
    -> proves Gamma psi
  (* If we can prove that phi is true, and phi has some variable x not free in *)
  (* it, then we've proven phi for all x. *)
| forallI : forall (Gamma : list formula) (phi : formula) (x : var),
    proves Gamma phi -> is_true(notfree x Gamma)
    -> proves Gamma (Forall x phi)
  (* If we can prove that phi is true for all x, then  we can substitute any *)
  (* term for x. *)
| forallE : forall (Gamma : list formula) (phi : formula) (x : var) (tau : term),
    proves Gamma (Forall x phi)
    -> proves Gamma (subst x tau phi)
  (* If we can substitute some term for x in phi, then we can prove that there *)
  (* exists an x such that phi. *)
| existsI : forall (Gamma : list formula) (phi : formula) (x : var) (tau : term),
    proves Gamma (subst x tau phi)
    -> proves Gamma (Exists x phi)
  (* If we can prove that there is an x such that phi, and from assuming phi we *)
  (* can prove psi, where x is not free in any of psi or gamma, then we can *)
  (* prove psi from gamma. *)
| existsE : forall (Gamma : list formula) (phi : formula) (x : var) (psi : formula),
    proves Gamma (Exists x phi) 
      -> proves (phi::Gamma) psi
      -> is_true(notfree x (psi::Gamma))
    -> proves Gamma psi
  (* If we can prove phi from assumptions Gamma, we can prove that p says phi *)
  (* if we can assume that p says everything in Gamma. In other words, the belief *)
  (* space of a principal is closed under deduction. *)
| saysILR : forall (Gamma : list formula) (p : term) (phi : formula),
    proves Gamma phi
    -> proves (relativize p Gamma) (Says p phi)
  (* If we can prove phi from the assumption that P says everything in Gamma, *)
  (* then we can prove that p says phi from the same assumption. In other words, *)
  (* all principals are introspective. This allows us to prove p says p says phi.*)
| saysIR :  forall (Gamma : list formula) (p : term) (phi : formula),
    proves (relativize p Gamma) phi
    -> proves (relativize p Gamma) (Says p phi)
  (* If we can prove that p says phi from Gamma, we can prove the same from *)
  (* the assumption that p says everything in Gamma. This allows us to prove *)
  (* {p says phi->psi, p says (p says phi)} |- p says psi *)
| saysIL :  forall (Gamma : list formula) (p : term) (phi : formula),
    proves Gamma (Says p phi)
    -> proves (relativize p Gamma) (Says p phi)
  (* We can always prove that a term equals itself. *)
| eqRefl : forall (Gamma : list formula) (tau : term),
  proves Gamma (Eq tau tau)
  (* If we can prove that two terms are equal, we can prove it in either direction. *)
| eqSymm : forall (Gamma : list formula) (tau1 tau2 : term),
  proves Gamma (Eq tau1 tau2)
  -> proves Gamma (Eq tau2 tau1)
  (* If we can prove that A = B, and B = C, then we can prove that A = C. *)
| eqTrans : forall (Gamma : list formula) (tau1 tau2 tau3 : term),
  proves Gamma (Eq tau1 tau2) -> proves Gamma (Eq tau2 tau3)
  -> proves Gamma (Eq tau1 tau3)
  (* Functions cannot distinguish between equal arguments. *)    
| eqIndF : forall (Gamma : list formula) (f : fn) (taus taus' : list term),
   taus = taus'
  -> proves Gamma (Eq (Fun_t f taus) (Fun_t f taus'))
  (* Relations cannot distinguish between equal tuples. *)
| eqIndR : forall (Gamma : list formula) (r : rel) (taus taus' : list term),
  taus = taus'
  -> proves Gamma (Rel_f r taus) -> proves Gamma (Rel_f r taus')
  (* A principal always speaks correctly about another speaking for them. *)
| handOff : forall (Gamma : list formula) (tau1 tau2 : term),
  proves Gamma (Says tau2 (Speaksfor tau1 tau2))
  -> proves Gamma (Speaksfor tau1 tau2)
  (* A principal always speaks correctly about another speaking for them about *)
  (* restricted statements. *)
| speaksSays : forall (Gamma : list formula)(tau1 tau2 : term)(phi : formula),
  proves Gamma (Speaksfor tau1 tau2) -> proves Gamma (Says tau1 phi)
  -> proves Gamma (Says tau2 phi)
  (* Same as above, but for restricted statement forms. *)
| speaksForRefl : forall (Gamma : list formula)(tau : term),
  proves Gamma (Speaksfor tau tau)
  (* A term always speaks for itself for all statement forms. *)
| speaksForTrans : forall (Gamma : list formula)(tau1 tau2 tau3 : term),
  proves Gamma (Speaksfor tau1 tau2) -> proves Gamma (Speaksfor tau2 tau3)
  -> proves Gamma (Speaksfor tau1 tau3).
(************************************************************************************)  
(*  Since we're representing environments with lists instead of some kind of set,   *)
(*   we need to axiomatize what one can do with the elements of an environment---   *)
(*      namely, that they behave like elements of a set.  These axioms attempt      *)
(*               to do so.  We haven't really tested them, though.                 *)
(************************************************************************************)  
Axiom env_reorder : forall (gamma : list formula) (P a1 a2 : formula), proves (a1::a2::gamma) P -> proves (a2::a1::gamma) P. 
Axiom env_cons : forall (gamma : list formula) (P a1 : formula), proves gamma P -> proves (a1::gamma) P.
Axiom env_unique : forall (gamma : list formula) (P a1 : formula), proves (a1::gamma) P -> proves (a1::a1::gamma) P.

End ProofSystem.
