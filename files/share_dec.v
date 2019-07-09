(* Aquinas Hobor, Le Xuan Bach *)

Require Import msl.msl_standard.
Require Import share_dec_base.

Module Type SIMPLIFIER.
  Declare Module sv : SV.
  Declare Module es : INTERNAL_EQUATION_SYSTEM with Module sv := sv.
  Import es.

  Parameter simplify : equation_system -> option equation_system.
  Axiom simplify_Some: forall es es',
    simplify es = Some es' ->
    equiv es es'.
  Axiom simplifiy_None: forall es,
    simplify es = None ->
    forall ctx, ~ eval ctx es.
End SIMPLIFIER.

Module Type DECOMPOSER.
  Declare Module sv : SV.
  Declare Module es : INTERNAL_EQUATION_SYSTEM with Module sv := sv.
  Declare Module simp : SIMPLIFIER with Module sv := sv with Module es := es.
  Import es.

  Parameter decompose_context : context -> (context * context).
  Parameter decompose : equation_system -> (equation_system * equation_system).
  Axiom decompose_ok: forall es es' es'',
    decompose es = (es', es'') ->
    forall ctx ctx' ctx'', 
      decompose_context ctx = (ctx', ctx'') ->
      (@eval _ _ Prop _ ctx es <-> ((eval ctx' es') /\ (eval ctx'' es''))).
End DECOMPOSER.

Module Share_Dec (sv : SV) 
                 (es : INTERNAL_EQUATION_SYSTEM with Module sv := sv)
                 (simp : SIMPLIFIER with Module sv := sv with Module es := es)
                 (dcomp : DECOMPOSER with Module sv := sv with Module es := es with Module simp := simp).
  Import es.
  
  Definition oneStage (es : equation_system) : option (equation_system * equation_system) :=
    option_map dcomp.decompose (simp.simplify es).
  Lemma oneStage_Some : forall es es' es'',
    oneStage es = Some (es', es'') ->
    forall ctx ctx' ctx'',
      dcomp.decompose_context ctx = (ctx', ctx'') ->
      (@eval _ _ Prop _ ctx es <-> ((eval ctx' es') /\ (eval ctx'' es''))).
  Proof.
    intros.
    unfold oneStage in H.
    remember (simp.simplify es).
    icase o.
    symmetry in Heqo.
    apply simp.simplify_Some in Heqo.
    simpl in H. inversion H.
    apply dcomp.decompose_ok with (ctx := ctx) (ctx' := ctx') (ctx'' := ctx'') in H2.
    rewrite <- H2.
    unfold equiv in Heqo.
    unfold impl in *.
    destruct Heqo.
    spec H1 ctx. spec H3 ctx. tauto.
    trivial.
  Qed.

  Definition share_dec (es : equation_system) : bool :=
    true.
  Lemma 
    spec H1 ctx. spec H3 ctx. tauto.

    tauto.

 tauto.
    simpl in *.

 tauto.
    apply Heqo.
    rewrite <- Heqo in H2.
    spec 
  Axiom simplify_Some: forall es es',
    simplify es = Some es' ->
    equiv es es'.


(* Extraction Magic *)
Extraction Language Ocaml.

Set Extraction AutoInline.

Require Import ExtrOcamlBasic.
Require Import ExtrOcamlString.
 
Extraction Inline proj1_sig sigT_of_sig projT1.
Extract Inductive bool => "bool" [ "true" "false" ].
Extract Inductive sumbool => "bool" [ "true" "false" ].
Extract Inductive prod => "(*)"  [ "(,)" ].
Extract Inductive sigT => "(*)"  [ "(,)" ].

Extraction "share_dec.ml" Solver.
