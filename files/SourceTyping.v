
Require Import Vec.
Require Import Source.
Require Import SourceAux.
Require Import Target.
Require Import TargetAux.

(*****************************************************************)
(*                       SOURCE LOOKUPS                          *)
(*****************************************************************)

(* Lookup a term variable and elaborate *)
Inductive HsTmVarIn : nat -> Poly -> HsTyEnv -> nat -> Prop :=
  | HsTmVarInTmHere Γ σ
      : HsTmVarIn 0 σ (HsConsTm Γ σ) 0
  | HsTmVarInTmThere x σ Γ σ' y (there : HsTmVarIn x σ Γ y)
      : HsTmVarIn (S x) σ (HsConsTm Γ σ') (S y)
  | HsTmVarInRuleThere x σ Γ rule y (there : HsTmVarIn x σ Γ y)
      : HsTmVarIn (S x) σ (HsConsRule Γ rule) (S y)
  | HsTmVarInTyThere x σ Γ y (there : HsTmVarIn x σ Γ y)
      : HsTmVarIn x ((* TODO: SHIFT-TY *) σ) (HsConsTy Γ) y
  | HsTmVarInClsThere x σ Γ cls y (there : HsTmVarIn x σ Γ y)
      : HsTmVarIn x ((* TODO: SHIFT-CLS *) σ) (HsConsCls Γ cls) y
  | HsTmVarInInsThere x σ Γ ins y (there : HsTmVarIn x σ Γ y)
      : HsTmVarIn x σ (HsConsIns Γ ins) y.

(* Lookup a dictionary variable *)
Inductive HsRuleIn : nat -> Rule -> HsTyEnv -> Prop :=
  | HsRuleInRuleHere Γ rule
      : HsRuleIn 0 rule (HsConsRule Γ rule)
  | HsRuleInRuleThere d rule Γ rule' (there : HsRuleIn d rule Γ)
      : HsRuleIn (S d) rule (HsConsRule Γ rule')
  | HsRuleInTmThere d rule Γ σ (there : HsRuleIn d rule Γ)
      : HsRuleIn (S d) rule (HsConsTm Γ σ)
  | HsRuleInTyThere d rule Γ (there : HsRuleIn d rule Γ)
      : HsRuleIn d ((* TODO: SHIFT-TY *) rule) (HsConsTy Γ)
  | HsRuleInClsThere d rule Γ cls (there : HsRuleIn d rule Γ)
      : HsRuleIn d ((* TODO: SHIFT-CLS *) rule) (HsConsCls Γ cls)
  | HsRuleInInsThere d rule Γ ins (there : HsRuleIn d rule Γ)
      : HsRuleIn d rule (HsConsIns Γ ins).

(* Lookup a type variable and elaborate *)
Inductive HsTyVarIn : nat -> HsTyEnv -> nat -> Prop :=
  | HsTyVarInTyHere Γ
      : HsTyVarIn 0 (HsConsTy Γ) 0
  | HsTyVarInTyThere n m Γ (there : HsTyVarIn n Γ m)
      : HsTyVarIn (S n) (HsConsTy Γ) (S m)
  | HsTyVarInTmThere n m Γ σ (there : HsTyVarIn n Γ m)
      : HsTyVarIn n (HsConsTm Γ σ) m
  | HsTyVarInRuleThere n m Γ rule (there : HsTyVarIn n Γ m)
      : HsTyVarIn n (HsConsRule Γ rule) m
  | HsTyVarInClsThere n m Γ cls (there : HsTyVarIn n Γ m)
      : HsTyVarIn n (HsConsCls Γ cls) m
  | HsTyVarInInsThere n m Γ ins (there : HsTyVarIn n Γ m)
      : HsTyVarIn n (HsConsIns Γ ins) m.

(* Lookup a class name; elaborate to the tycon name (identity) *)
Inductive HsCnIn : nat -> HsTyEnv -> nat -> Prop :=
  | HsCnInClsHere Γ cls
      : HsCnIn 0 (HsConsCls Γ cls) 0
  | HsCnInClsThere n m Γ cls (there : HsCnIn n Γ m)
      : HsCnIn (S n) (HsConsCls Γ cls) (S m)
  | HsCnInTyThere n m Γ (there : HsCnIn n Γ m)
      : HsCnIn n (HsConsTy Γ) m
  | HsCnInTmThere n m Γ σ (there : HsCnIn n Γ m)
      : HsCnIn n (HsConsTm Γ σ) m
  | HsCnInRuleThere n m Γ rule (there : HsCnIn n Γ m)
      : HsCnIn n (HsConsRule Γ rule) m
  | HsCnInInsThere n m Γ ins (there : HsCnIn n Γ m)
      : HsCnIn n (HsConsIns Γ ins) m.

(* Lookup a family name using the class name (identity) *)
Inductive HsFnIn : nat -> HsTyEnv -> nat -> Prop :=
  | HsFnInClsHere Γ cls
      : HsFnIn 0 (HsConsCls Γ cls) 0
  | HsFnInClsThere n m Γ cls (there : HsFnIn n Γ m)
      : HsFnIn (S n) (HsConsCls Γ cls) (S m)
  | HsFnInTyThere n m Γ (there : HsFnIn n Γ m)
      : HsFnIn n (HsConsTy Γ) m
  | HsFnInTmThere n m Γ σ (there : HsFnIn n Γ m)
      : HsFnIn n (HsConsTm Γ σ) m
  | HsFnInRuleThere n m Γ rule (there : HsFnIn n Γ m)
      : HsFnIn n (HsConsRule Γ rule) m
  | HsFnInInsThere n m Γ ins (there : HsFnIn n Γ m)
      : HsFnIn n (HsConsIns Γ ins) m.

(*****************************************************************)
(*            ELABORATION OF TYPES AND CONSTRAINTS               *)
(*****************************************************************)

(* ELABORATE MONOTYPES *)
Inductive HsTcMono (Γ : HsTyEnv) : Mono -> FcTy -> Prop :=
  | HsTcTyVar a fcA (ainΓ : HsTyVarIn a Γ fcA)
      : HsTcMono Γ (TyVar a) (FcTyVar fcA)
  | HsTcTyArr τ₁ τ₂ υ₁ υ₂ (wfτ₁ : HsTcMono Γ τ₁ υ₁) (wfτ₂ : HsTcMono Γ τ₂ υ₂)
      : HsTcMono Γ (TyArr τ₁ τ₂) (FcTyArr υ₁ υ₂).

(* Elaborate a bunch of monotypes *)
Inductive HsTcMonos (Γ : HsTyEnv) : forall n, Vec Mono n -> Vec FcTy n -> Prop :=
  | HsTcMonosNil
    :  HsTcMonos Γ 0 (VN Mono) (VN FcTy)
  | HsTcMonosCons n τ τs υ υs
      (wfτ : HsTcMono Γ τ υ)
      (wfτs : HsTcMonos Γ n τs υs)
    : HsTcMonos Γ (S n) (VC Mono τ n τs) (VC FcTy υ n υs).

(* ELABORATE CLASS CONSTRAINTS *)
Inductive HsTcCt (Γ : HsTyEnv) : Ct -> FcTy -> Prop :=
  | HsTcMkCt cn τ tc υ (cninΓ : HsCnIn cn Γ tc) (wfτ : HsTcMono Γ τ υ)
      : HsTcCt Γ (MkCt cn τ) (FcTyCon tc υ).

(* ELABORATE A BUNCH OF CLASS CONSTRAINTS *)
Inductive HsTcCs (Γ : HsTyEnv) : forall n, Vec Ct n -> Vec FcTy n -> Prop :=
  | HsTcCsNil
      : HsTcCs Γ 0 (VN Ct) (VN FcTy)
  | HsTcCsCons n π πs υ υs (elabπ : HsTcCt Γ π υ) (elabπs : HsTcCs Γ n πs υs)
       : HsTcCs Γ (S n) (VC Ct π n πs) (VC FcTy υ n υs).

(* ELABORATE QUALIFIED TYPES *)
Inductive HsTcQual (Γ : HsTyEnv) : Qual -> FcTy -> Prop :=
  | HsTcQMono τ υ (wfτ : HsTcMono Γ τ υ)
      : HsTcQual Γ (QMono τ) υ
  | HsTcQQual π ρ υ₁ υ₂ (wfπ : HsTcCt Γ π υ₁) (wfρ : HsTcQual Γ ρ υ₂)
      : HsTcQual Γ (QQual π ρ) (FcTyArr υ₁ υ₂).

(* ELABORATE POLYTYPES *)
Inductive HsTcPoly (Γ : HsTyEnv) : Poly -> FcTy -> Prop :=
  | HsTcPQual ρ υ (wfρ : HsTcQual Γ ρ υ)
      : HsTcPoly Γ (PQual ρ) υ
  | HsTcPPoly σ υ   (wfσ : HsTcPoly (HsConsTy Γ) σ υ)
      : HsTcPoly Γ (PPoly σ) (FcTyAll υ).

(*****************************************************************)
(*      CONSTRAINT ENTAILMENT WITH DICTIONARY CONSTRUCTION       *)
(*****************************************************************)

(* Entailment of a class constraint *)
Inductive HsEntailCt (Γ : HsTyEnv) : FcTm -> Ct -> Prop :=
  | HsEntailSLD d bs n π πs τs υs ts
      (dinΓ : HsRuleIn d (MkRule bs n πs π) Γ)
      (wfτs : HsTcMonos Γ bs τs υs)
      (entπs : HsEntailCs Γ n ts (hsSubstTysInCs bs n τs πs))
    : HsEntailCt Γ (appToTms (appToTys (FcTmVar d) bs υs) n ts) (hsSubstTysInCt bs τs π)
(* Entailment of a bunch of constraints *)
with HsEntailCs (Γ : HsTyEnv) : forall n, Vec FcTm n -> Vec Ct n -> Prop :=
  | HsEntailNil
    : HsEntailCs Γ 0 (VN FcTm) (VN Ct)
  | HsEntailCons n t ts π πs
      (tct  : HsEntailCt Γ t π)
      (tcts : HsEntailCs Γ n ts πs)
    : HsEntailCs Γ (S n) (VC FcTm t n ts) (VC Ct π n πs).

(*****************************************************************)
(*                TERM TYPING WITH ELABORATION                   *)
(*****************************************************************)

Inductive HsTcTm (Γ : HsTyEnv) : HsTm -> Poly -> FcTm -> Prop :=
  (* TmVar *)
  | HsTcTmVar x σ x' (xinΓ : HsTmVarIn x σ Γ x')
    : HsTcTm Γ (TmVar x) σ (FcTmVar x')
  (* TmAbs *)
  | HsTcTmAbs e τ₁ τ₂ t υ₁
              (tce : HsTcTm (HsConsTm Γ (PQual (QMono τ₁))) e (PQual (QMono τ₂)) t)
              (tcτ : HsTcMono Γ τ₁ υ₁)
    : HsTcTm Γ (TmAbs e) (PQual (QMono (TyArr τ₁ τ₂))) (FcTmAbs υ₁ t)
  (* TmApp *)
  | HsTcTmApp e₁ e₂ τ₁₁ τ₁₂ t₁ t₂
              (tce₁ : HsTcTm Γ e₁ (PQual (QMono (TyArr τ₁₁ τ₁₂))) t₁)
              (tce₂ : HsTcTm Γ e₂ (PQual (QMono τ₁₁)) t₂)
    : HsTcTm Γ (TmApp e₁ e₂) (PQual (QMono τ₁₂)) (FcTmApp t₁ t₂)
  (* TmTyAbs *)
  | HsTcTmTyAbs e σ t (tce : HsTcTm (HsConsTy Γ) e σ t)
    : HsTcTm Γ e (PPoly σ) (FcTyAbs t)
  (* TmTyApp *)
  |  HsTmTyApp e σ τ υ t
               (tce : HsTcTm Γ e (PPoly σ) t)
               (wfτ : HsTcMono Γ τ υ)
     : HsTcTm Γ e (subst_ty_in_poly (S 0) (uni_sub τ) 0 σ) (FcTyApp t υ)
  (* Introduction of Qualified Types *)
  | HsTcTmDAbs e π ρ υ t
               (wfπ : HsTcCt Γ π υ)
               (tce : HsTcTm (HsConsRule Γ (MkRule 0 0 (VN Ct) π)) e (PQual ρ) t)
    : HsTcTm Γ e (PQual (QQual π ρ)) (FcTmAbs υ t)
  (* Elimination of Qualified Types *)
  | HsTcTmDApp e π ρ t₁ t₂ υ
               (wfπ : HsTcCt Γ π υ)
               (tce : HsTcTm Γ e (PQual (QQual π ρ)) t₁)
               (entail : HsEntailCt Γ t₂ π)
    : HsTcTm Γ e (PQual ρ) (FcTmApp t₁ t₂).

(*****************************************************************)
(*                ELABORATION OF TYPING ENVIRONMENTS             *)
(*****************************************************************)

Inductive ElabTyEnv : HsTyEnv -> FcTyEnv -> Prop :=
  | ElabEnvNil
    : ElabTyEnv HsEnvNil FcEnvNil
  | ElabConsTy Γ Δ (eΓ : ElabTyEnv Γ Δ)
    : ElabTyEnv (HsConsTy Γ) (FcConsTy Δ)
  | ElabConsTm Γ Δ σ υ (eΓ : ElabTyEnv Γ Δ) (eσ : HsTcPoly Γ σ υ)
    : ElabTyEnv (HsConsTm Γ σ) (FcConsTm Δ υ)
  | ElabConsCt Γ Δ π υ (eΓ : ElabTyEnv Γ Δ) (eπ : HsTcCt Γ π υ)
    : ElabTyEnv (HsConsRule Γ (MkRule 0 0 (VN Ct) π)) (FcConsTm Δ υ)       (* it's a term variable *)
  | ElabConsCls Γ Δ n πs τ υ υs
                (eΓ : ElabTyEnv Γ Δ)
                (elabτ : HsTcMono (HsConsTy Γ) τ υ)
                (elabscs : HsTcCs (HsConsTy Γ) n πs υs)
    : ElabTyEnv (HsConsCls Γ (MkCls n πs τ))
                (FcConsDt (FcConsFn Δ) (MkFcData (FcTyFam 0 (FcTyVar 0)) n υs υ))
  (* (1) type family, (2) datatype *)
  | ElabConsIns Γ Δ bnds n πs cn τ e υ υs fn
                (eΓ : ElabTyEnv Γ Δ)
                (elabτ : HsTcMono (bindTyVars bnds Γ) τ υ)
                (elabctx : HsTcCs (bindTyVars bnds Γ) n πs υs)
                (fninΓ : HsFnIn cn (bindTyVars bnds Γ) fn)
    : ElabTyEnv (HsConsIns Γ (MkIns bnds n πs cn τ e)) (FcConsAx Δ (MkFcAx bnds fn υ n υs)).

(*****************************************************************)
(*                    DECLARATION ELABORATION                    *)
(*****************************************************************)

(* TODO: Class declaration typing *)
Inductive HsTcCls (Γ : HsTyEnv) : Cls -> HsTyEnv -> Prop :=.

(* TODO: Instance declaration typing *)
Inductive HsTcIns (Γ : HsTyEnv) : Ins -> HsTyEnv -> Prop :=.

(* TODO: Top-level annotation-free binding typing *)
Inductive HsTcVal (Γ : HsTyEnv) : Val -> Poly -> FcVal -> Prop :=.

(* TODO: Top-level annotated (possibly recursive) binding typing *)
Inductive HsTcSig (Γ : HsTyEnv) : Sig -> Poly -> FcVal -> Prop :=.


(*
(* Class Declaration *)
Inductive Cls : Set :=
  | MkCls n (scs : Vec Ct n) (md : Mono).

(* Instance Declaration *)
Inductive Ins : Set :=
  | MkIns (bnds : nat) n (ctx : Vec Ct n) (cn : nat) (τ : Mono) (e : HsTm).

(* Top-level Value Binding *)
Inductive Val : Set :=
  | MkVal (e : HsTm).

(* Top-level Value Binding with a Signature *)
Inductive Sig : Set :=
  | MkSig (e : HsTm) (σ : Poly).
*)


(*
(* Constraint Scheme *)
Inductive Rule : Set :=
  | MkRule (bnds : nat) n (lhs : Vec Ct n) (rhs : Ct).

(* Source Typing Environments *)
Inductive HsTyEnv : Set :=
  | HsEnvNil
  | HsConsTy   (Γ : HsTyEnv)
  | HsConsTm   (Γ : HsTyEnv) (σ : Poly)
  | HsConsRule (Γ : HsTyEnv) (S : Rule)
  | HsConsCls (Γ : HsTyEnv) (cls : Cls)
  | HsConsIns (Γ : HsTyEnv) (ins : Ins).   (* FOR GENERATING THE EQUALITY AXIOM *)
*)

(*****************************************************************)
(*                    PROGRAM ELABORATION                        *)
(*****************************************************************)

(* TODO: Elaboration of programs *)
Inductive HsTcPgm (Γ : HsTyEnv) : Pgm -> FcPgm -> Prop :=.

(*
(* Source Program *)
Inductive Pgm : Set :=
  | PgmEmpty
  | PgmCls (cls : Cls) (pgm : Pgm)
  | PgmIns (ins : Ins) (pgm : Pgm)
  | PgmVal (val : Val) (pgm : Pgm)
  | PgmSig (sig : Sig) (pgm : Pgm).
*)