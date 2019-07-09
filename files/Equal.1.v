(* This program is free software; you can redistribute it and/or      *)
(* modify it under the terms of the GNU Lesser General Public License *)
(* as published by the Free Software Foundation; either version 2.1   *)
(* of the License, or (at your option) any later version.             *)
(*                                                                    *)
(* This program is distributed in the hope that it will be useful,    *)
(* but WITHOUT ANY WARRANTY; without even the implied warranty of     *)
(* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the      *)
(* GNU General Public License for more details.                       *)
(*                                                                    *)
(* You should have received a copy of the GNU Lesser General Public   *)
(* License along with this program; if not, write to the Free         *)
(* Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA *)
(* 02110-1301 USA                                                     *)


(**********************************************************************)
(*                  Typed LambdaFactor Calculus                       *)
(*                                                                    *)
(* is implemented in Coq by adapting the implementation of            *) 
(* Lambda Calculus from Project Coq                                   *) 
(* 2015                                                               *)
(**********************************************************************)

(**********************************************************************)
(*                      Equal.v                                       *)
(*                                                                    *)
(*                     Barry Jay                                      *)
(*                                                                    *)
(**********************************************************************)


Require Import ArithRing.
Require Import List. 
Require Import Max. 
Require Import Test.
Require Import General. 
Require Import LamSF_Terms.
Require Import LamSF_Tactics.
Require Import LamSF_Substitution_term.
Require Import Components.
Require Import Compounds.
Require Import LamSF_reduction.
Require Import LamSF_Closed.
Require Import LamSF_Normal.
Require Import LamSF_Eval.
Require Import type_derivation. 
Require Import type_derivation_rwf. 
Require Import operator_types. 


Ltac K_tac := 
match goal with 
| |- multi_step lamSF_red1 (App (App _ ?M)?N) _ => 
apply transitive_red with (App (App k_op M)N) ; 
[ eapply2 preserves_app_lamSF_red; eapply2 preserves_app_lamSF_red | eval_lamSF]
end. 

Ltac KI_tac := 
match goal with 
| |- multi_step lamSF_red1 (App (App _ ?M)?N) _ => 
apply transitive_red with (App (App (App k_op i_op) M)N) ; 
[ eapply2 preserves_app_lamSF_red; eapply2 preserves_app_lamSF_red |eval_lamSF; eval_lamSF]
end. 



(* General equality *) 


Definition equal_body :=  
(* Ref 2 is the recursion ref; 
   Ref 1 is the first argument, x
   Ref 0 is the second argument, y
   
*) 
App (App (App (App (Op Eop) (Ref 1)) (Ref 1)) 
         (App (App e_op (Ref 1)) (Ref 0)))
    (App (App (App (App (Op Eop) (Ref 0)) (Ref 0)) (App k_op i_op))
         (App (App (Op Gop) 
                   (Abs(Abs (App (App (Op Gop) 
                                      (Abs(Abs (App(App(App(App (Ref 6) (Ref 3)) (Ref 1))
                                                       (App(App (Ref 6) (Ref 2)) (Ref 0)))
                                                   (App k_op i_op))))) (Ref 2)))))
              (Ref 1)))
.

Definition equal_fn := Abs (Abs (Abs equal_body)). 
Definition equal :=  App (App a_op y_op) equal_fn.


Lemma equal_fn_closed: maxvar equal_fn = 0.
Proof. unfold equal_fn; split_all.  Qed. 
Lemma equal_closed : maxvar equal = 0.
Proof. split_all; omega. Qed. 

Ltac unfold_equal M N := 
unfold equal at 1; eval_lamSF0; 
unfold equal_fn at 1; unfold equal_body;  unfold iff; unfold not.

Ltac eval_lamSF := eval_lamSF0;  relocate_lt; unfold insert_Ref; split_all.

Lemma equal_op : forall o, lamSF_red  (App (App (App (App (Op Aop) (Op Yop)) equal_fn) (Op o)) (Op o)) k_op.
Proof. 
split_all. unfold equal, equal_fn. repeat eval_lamSF. K_tac. red; one_step. 
unfold lift; simpl; eval_lamSF. one_step. 
Qed. 



Lemma unequal_op : 
forall M o, normal M -> maxvar M = 0 -> M <> (Op o) -> 
              lamSF_red  (App (App (App (App (Op Aop) (Op Yop)) equal_fn) (Op o)) M) (App k_op i_op). 
Proof. 
split_all.
assert(factorable M). eapply2 programs_are_factorable. unfold program; auto. 
eval_lamSF. unfold equal_fn at 1. eval_lamSF. eval_lamSF.  eval_lamSF.  K_tac. red; one_step. 
unfold lift; rewrite lift_rec_null.
one_step. 
Qed. 


Lemma unequal_compound_op : 
forall M o, compound M -> lamSF_red (App (App (App (App (Op Aop) (Op Yop)) equal_fn) M) (Op o)) (App k_op i_op). 
Proof. 
split_all.
eval_lamSF. eval_lamSF. unfold equal_fn at 1.  eval_lamSF.  
unfold lift; rewrite subst_rec_lift_rec; try omega. repeat rewrite lift_rec_null. 
KI_tac. 
eapply succ_red. 
eapply appl_lamSF_red. eapply2 e_compound_lamSF_red. eval_lamSF. 
K_tac. red; one_step. 
Qed. 

Lemma unequal_op2 : 
forall M o, normal M -> maxvar M = 0 -> M <> (Op o) -> 
              lamSF_red (App (App (App (App (Op Aop) (Op Yop)) equal_fn) M) (Op o))(App k_op i_op).
Proof. 
split_all.
assert(factorable M). eapply2 programs_are_factorable. unfold program; auto. 
gen3_case H0 H1 H2 M. 
(* 3 *) 
eapply2 unequal_op. 
(* 2 *) 
eapply2 unequal_compound_op. eapply2 factorable_abstractions_are_compounds. 
(* 1 *) 
eapply2 unequal_compound_op. eapply2 factorable_applications_are_compounds. 
Qed. 


Ltac eval_lamSF0 := unfold_op; 
match goal with 
| |-  lamSF_red ?M _ => red; eval_lamSF0
| |-  multi_step lamSF_red1 ?M _ =>
  (apply transitive_red with (eval0 M); 
[eapply2 eval0_from_lamSF |  
  unfold eval0, eval_app;  unfold subst; unfold subst_rec; fold subst_rec; fold eval_app; fold eval0])
| _ => auto
end.


Lemma equal_compounds : 
forall M N, compound M -> compound N -> 
lamSF_red (App (App (App (App (Op Aop) (Op Yop)) equal_fn) M) N) (App
        (App
           (App (App (App (App (Op Aop) (Op Yop)) equal_fn) (left_component M)) (left_component N))
           (App (App (App (App (Op Aop) (Op Yop)) equal_fn) (right_component M)) (right_component N))) 
        (App k_op i_op))
.
Proof. 
intros. eval_lamSF.  eval_lamSF. 
unfold equal_fn at 1.   
unfold equal_body; unfold_op. 
eapply transitive_red. eapply preserves_app_lamSF_red. eapply preserves_app_lamSF_red. 
red; one_step. eauto. eauto. 
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (lift_rec_closed equal_fn); try (split_all; omega).
eapply transitive_red. eapply preserves_app_lamSF_red. 
red; one_step. eauto. 
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (subst_rec_closed equal_fn); try (split_all; omega).
eapply succ_red. auto. 
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (subst_rec_closed equal_fn); try (split_all; omega).
rewrite subst_rec_lift_rec; try omega. repeat rewrite lift_rec_null. 
eapply transitive_red. eapply preserves_app_lamSF_red. eapply preserves_app_lamSF_red. 
red; one_step. red; one_step. 
eapply transitive_red. eapply preserves_app_lamSF_red. eapply preserves_app_lamSF_red. 
red; one_step. eauto.
red; g_tac. 
eapply2 compounds_are_factorable. 
eapply transitive_red. eapply preserves_app_lamSF_red. 
red; one_step. eauto.
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (subst_rec_closed equal_fn); try (split_all; omega).
eval_lamSF. eval_lamSF.  eval_lamSF.  eval_lamSF.
eapply transitive_red. one_step. 
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (subst_rec_closed equal_fn); try (split_all; omega).
rewrite subst_rec_lift_rec; try omega. 
repeat rewrite subst_rec_lift_rec; try omega. repeat rewrite lift_rec_null. 
g_tac. 
eapply2 compounds_are_factorable. 
eapply transitive_red. eapply preserves_app_lamSF_red. 
red; one_step. eauto.
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (subst_rec_closed equal_fn); try (split_all; omega).
repeat rewrite subst_rec_lift_rec; try omega.
eapply transitive_red. one_step. 
unfold subst; unfold subst_rec; fold subst_rec. insert_Ref_out. 
rewrite (subst_rec_closed equal_fn); try (split_all; omega).
repeat rewrite subst_rec_lift_rec; try omega.
 repeat rewrite lift_rec_null. 
auto. 
Qed. 




Ltac equal_compounds_tac := 
match goal with 
| |-  lamSF_red (App (App equal ?M) ?N) _ => 
apply transitive_red with 
(App (App (App (App equal (left_component M)) (left_component N))
          (App (App equal (right_component M)) (right_component N)))
     (App k_op i_op))
; 
[eapply2 equal_compounds|]
end. 


Lemma equal_fn_programs: forall M, program M -> lamSF_red (App (App (App (App (Op Aop) (Op Yop)) equal_fn) M) M) k_op.
Proof.
rank_tac. 
split_all. 
assert(factorable M) by eapply2 programs_are_factorable. 
assert(compound M \/ exists o, M = Op o) by eapply2 factorable_implies_compound_or_operator. 
inversion H2. 
eapply transitive_red. eapply2 equal_compounds.
eapply transitive_red. eapply preserves_app_lamSF_red. eapply preserves_app_lamSF_red. 
eapply2 IHp. 
assert(rank (left_component M) < rank M) by eapply2 rank_compound_l. 
omega. 
unfold program in *; split_all. 
eapply2 normal_component_l. 
assert(maxvar (left_component M) <= maxvar M) by 
(eapply2 left_component_preserves_maxvar). 
omega. 
eapply2 IHp. 
assert(rank (right_component M) < rank M) by eapply2 rank_compound_r. 
omega. 
unfold program in *; split_all. 
eapply2 normal_component_r. 
assert(maxvar (right_component M) <= maxvar M) by 
(eapply2 right_component_preserves_maxvar). 
omega. 
eauto. 
eval_lamSF. 
split_all. subst. 
eapply2 equal_op. 
Qed. 

Theorem equal_programs : forall M, program M -> lamSF_red (App (App equal M) M) k_op.
Proof. split_all. unfold equal. eapply2 equal_fn_programs. Qed. 


Theorem unequal_programs : 
forall M N, program M -> program N -> M<>N ->  
lamSF_red (App (App equal M) N) (App k_op i_op)
.
Proof. 
cut(forall M N, program M -> program N -> M<>N -> lamSF_red (App (App (App (App (Op Aop) (Op Yop)) equal_fn) M) N) (App k_op i_op)). 
split_all. 

rank_tac. 
split_all. 
assert(factorable M) by eapply2 programs_are_factorable. 
assert(compound M \/ exists o, M = Op o) by eapply2 factorable_implies_compound_or_operator. 
assert(factorable N) by eapply2 programs_are_factorable. 
assert(compound N \/ exists o, N = Op o) by eapply2 factorable_implies_compound_or_operator. 
inversion H4; inversion H6. 
(* both compounds *)
eapply transitive_red. 
eapply2 equal_compounds.
assert(left_component M = left_component N \/ left_component M <> left_component N) by eapply2 decidable_term_equality. 
assert(right_component M = right_component N \/ right_component M <> right_component N) by eapply2 decidable_term_equality. 
inversion H9.
(* 5 *) 
rewrite H11. 
apply transitive_red with (App (App k_op  (App (App (App (App (Op Aop) (Op Yop)) equal_fn) (right_component M))
              (right_component N))) (App k_op i_op)); auto. 
eapply2 preserves_app_lamSF_red. 
eapply2 preserves_app_lamSF_red. 
eapply2 equal_fn_programs.
split_all. 
eapply2 normal_component_l. 
inversion H1; auto. 
assert(maxvar (left_component N) <= maxvar N) by 
(eapply2 left_component_preserves_maxvar). 
inversion H1; omega. 
eval_lamSF. 
inversion H10. 
(* 3 *) 
assert False. eapply2 H2. 
eapply2 components_monotonic; split_all. noway. 
(* 2 *)
eapply2 IHp.
assert(rank(right_component M) < rank M) by eapply2 rank_compound_r. omega. 
split_all.  eapply2 normal_component_r. inversion H0; auto. 
assert(maxvar (right_component M) <= maxvar M) by 
(eapply2 right_component_preserves_maxvar). 
inversion H0; omega. 
split_all. 
eapply2 normal_component_r. inversion H1; auto. 
assert(maxvar (right_component N) <= maxvar N) by 
(eapply2 right_component_preserves_maxvar). 
inversion H1; omega. 
(* 4 *) 
eapply transitive_red. eapply preserves_app_lamSF_red. eapply preserves_app_lamSF_red. 
eapply2 IHp. 
assert(rank(left_component M) < rank M) by eapply2 rank_compound_l. omega. 
split_all.  eapply2 normal_component_l. inversion H0; auto. 
assert(maxvar (left_component M) <= maxvar M) by 
(eapply2 left_component_preserves_maxvar). 
inversion H0; omega. 
split_all. 
eapply2 normal_component_l. inversion H1; auto. 
assert(maxvar (left_component N) <= maxvar N) by 
(eapply2 left_component_preserves_maxvar). 
inversion H1; omega. 
(* 6 *) 
eauto. eauto. eval_lamSF. eval_lamSF. 
(* 3 *) 
split_all. subst. eapply2 unequal_compound_op. 
(* 2 *) 
split_all. subst.  eapply2 unequal_op; inversion H1; auto. 
(* 1 *) 
split_all; subst. eapply2 unequal_op. 
Qed. 


Lemma equal_fn_type: 
derivation nil equal_fn (funty (opty Eop) (opty Eop)). 
Proof. 
unfold equal_fn, equal_body. 
eapply derive_abs. 
unfold opty at 2. unfold quant, op_abs, opty_core, opty_core0. 
repeat eapply2 derive_gen1. 
unfold lift, map. repeat (rewrite lift_rec_closed; try (split_all; omega)). 
repeat eapply derive_abs. 
eapply derive_app. 
eapply derive_app. 
eapply derive_app. 
eapply derive_app. 
eapply derive_instance. 
eapply derive_op. 
wfcs_tac. 
eapply instance_E. 
4: eapply derive_weak. 4: eapply derive_var. 
wfcs_tac. 
2: wfcs_tac. 
2: wfcs_tac. 
2: wfcs_tac. 
2: wfcs_tac. 
2: eapply derive_weak. 2: eapply derive_var. 
wfcs_tac. 
wfcs_tac. 
wfcs_tac. 
wfcs_tac. 
eapply derive_app. 
2: eapply2 derive_var. 
2: wfcs_tac. 
eapply derive_app. 
2: eapply2 derive_weak. 2: eapply derive_var. 
eapply2 derive_E. wfcs_tac. wfcs_tac. wfcs_tac. 
eapply derive_app. 
eapply derive_app. 
eapply derive_app. 
eapply derive_app. 
2: eapply derive_var. 
2: wfcs_tac. 
2: wfcs_tac. 
2: eapply2 derive_var. 2: wfcs_tac. 
eapply derive_instance. 
eapply2 derive_op. 
wfcs_tac. 
eapply instance_E. 
wfcs_tac. 
wfcs_tac. 
wfcs_tac. 
eapply2 derive_KI. 
wfcs_tac. 
eapply derive_app.
eapply derive_app.
eapply derive_instance. 
eapply2 derive_op. 
wfcs_tac. 
eapply instance_G. 
2: wfcs_tac. 
3: eapply2 derive_weak. 3: eapply derive_var.  3:wfcs_tac. 3:wfcs_tac. 
wfcs_tac. 
eapply derive_gen1.
unfold lift; simpl. relocate_lt. simpl. 
repeat eapply derive_abs. 
eapply derive_app.
2: repeat eapply2 derive_weak. 2: eapply derive_var. 
2: wfcs_tac. 
2: wfcs_tac. 
eapply derive_app.
eapply derive_instance. 
eapply2 derive_op. 
wfcs_tac. 
eapply instance_G. 
wfcs_tac. 
wfcs_tac. 
eapply derive_gen1. 
repeat eapply derive_abs. 
unfold lift; simpl. relocate_lt. simpl. 
eapply derive_app.
eapply derive_app.
eapply derive_app.
2: repeat eapply derive_weak. 2: eapply derive_var. 2: wfcs_tac. 2: wfcs_tac. 2: wfcs_tac. 
eapply derive_app.
2: repeat eapply derive_weak. 2: eapply derive_var. 2: wfcs_tac. 2: wfcs_tac. 2: wfcs_tac. 
2: wfcs_tac. 2: wfcs_tac. 
repeat eapply derive_weak. 
2: wfcs_tac. 2: wfcs_tac. 2: wfcs_tac. 2: wfcs_tac. 2: wfcs_tac. 2: wfcs_tac. 
eapply derive_instance. eapply derive_var. wfcs_tac. wfcs_tac. 
3: eapply derive_KI. 3: wfcs_tac. 
2: eapply derive_app. 3: eapply derive_var. 3: wfcs_tac. 3: wfcs_tac. 
2: eapply derive_app. 2: repeat eapply derive_weak. 
3: wfcs_tac. 3: wfcs_tac.  3: wfcs_tac. 3: wfcs_tac. 
3: wfcs_tac. 3: wfcs_tac.  
3: repeat eapply derive_weak.  3: eapply derive_var. 
3: wfcs_tac. 3: wfcs_tac.  3: wfcs_tac. 3: wfcs_tac. 
2: eapply derive_instance. 2: eapply2 derive_var. 2: wfcs_tac. 
(* choices now *) 
eapply succ_red. eapply instance_rule. 2: wfcs_tac. 
instantiate(1:= (App (App (Op Sop) (Ref 1)) (Ref 4))). 
wfcs_tac. unfold subst; simpl. insert_Ref_out. relocate_lt. 
eapply succ_red. eapply instance_rule. 2: wfcs_tac. instantiate(1:= (funty (varty 0) (Ref 3))).
wfcs_tac. unfold subst; simpl. insert_Ref_out. 
eapply succ_red. eapply instance_rule. 2: wfcs_tac. 2: simpl. 2: relocate_lt. 2: simpl.
2: unfold subst; simpl; insert_Ref_out; simpl; relocate_lt; simpl; rewrite lift_rec_null.
2: eapply2 preserves_funty_r_instance. 2: wfcs_tac.  
2: eapply2 preserves_funty_r_instance. 2: wfcs_tac.  
instantiate(1:= (App (App (Op Sop) (Ref 2)) (App (App (Op Sop) (Ref 2)) (Ref 2)))).
wfcs_tac. eapply2 zero_red. 
2: wfcs_tac. 
eapply succ_red. eapply instance_rule. 2: wfcs_tac. 
instantiate(1:= Ref 1).
wfcs_tac. unfold subst; simpl. insert_Ref_out. relocate_lt. 
eapply succ_red. eapply instance_rule. 2: wfcs_tac. instantiate(1:= Ref 0). 
wfcs_tac. unfold subst; simpl. insert_Ref_out. 
eapply succ_red. eapply instance_rule. 2: wfcs_tac. 2: simpl. 2: relocate_lt. 2: simpl.
2: unfold subst; simpl; insert_Ref_out; simpl; relocate_lt; simpl; rewrite lift_rec_null.
2: eapply2 zero_red. wfcs_tac. 
Qed. 



Theorem equal_type: derivation nil equal (opty Eop). 
Proof. 
assert(wfs (opty Eop)) by eapply2 derive_implies_wfcs. 
unfold equal. 
eapply derive_app.
2: eapply equal_fn_type.
unfold a_op, y_op. eapply2 derive_app. eapply2 derive_Y. 
Qed. 

