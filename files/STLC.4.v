Set Implicit Arguments.
Require Import List.
Require Import Eqdep_dec.
Require Import Peano_dec.

(* 
 *   In this section we define simply typed lambda-terms and prove some of its properties.
 *)
Section STLC.

    (* 
     *   Fist we assume a set of base types (atomic types, sorts) 
     *)
  Parameter BaseType: Set.

    (* 
     *   We also assume that equality on base types is decidable.
     *   This means that we have an algorithm at hand that given two base types 
     * tells us whether they are equal or not. 
     *   {A} + {B} construct is defined in standard library (Coq.Init.Specif.sum_bool).
     * Basically it is a disjunction (A \/ B), just defined on sort Set instead of Prop.
     *)
    Parameter eq_BaseType_dec: forall (a b: BaseType), {a = b} + {a <> b}.

    (*
     *  Now we define simple types inductively. 
     *  Simple type is either:
     * - a base type, or
     * - an arrow type A --> B, where A and B are simple types
     *)
  Inductive SimpleType : Set :=
  | BasicType (T: BaseType)
  | ArrowType (A B : SimpleType).

    (*
     *   We introduce some notation to improve the readability.
     *   We will write '#x' to denote a simple type being atomic type a (for 
     * instance '#nat' will denote type of natural numbers provided there is
     * a sort called nat).
     *   For arrow types we will write 'x --> y' where x and y are simple types.
     *   So for instance unary function on natural numbers will have type:
     * #nat --> #nat
     *)
  Notation "x --> y" := (ArrowType x y) (at level 55, right associativity) : type_scope.
  Notation "# x " := (BasicType x) (at level 0) : type_scope.

    (* 
     *  We also assume a set of constants, also refeered to as function symbols.
     *)
  Parameter FunctionSymbol: Set.
    (* 
     *  Again we assume that equality on constants is decidable 
     *)
  Parameter eq_FunctionSymbol_dec: forall (f g: FunctionSymbol), {f = g} + {f <> g}.

    (* 
     *   We also assume that constants have types. Function 'f_type' takes a
     * constant as a parameter and returns its type.
     *)
  Parameter f_type: FunctionSymbol -> SimpleType.

    (* 
     *   We will use de Bruijn indices to represent terms. This deserves some explanation.
     *   In simply typed lambda calculus we usually don't want to distinguish terms that
     * differ only on the names of bounded variables. So \x.x and \y.y both represent
     * identity and the fact that we use different names for binders doesn't really matter. 
     *   This concept is captured by the notion of alpha-conversion. But working modulo
     * alpha-conversion is very tedious. The idea of de Bruijn is a work around for
     * this problem. It is as follows:
     *   Instead of using names for variables we use natural numbers. A number of a
     * variable tells us where it is bounded. So think of terms as trees, then variable
     * number 0 is bound by its closest lambda ancestor and basically a number of a 
     * variable tells us how many lambdas do we have to skip on the way to the root to
     * find its binder. Now, if the number of a variable is greater than a total 
     * number of lambdas on the way to the root then a variable is free in this term. 
     *   Now we do not need to give any names for lambda operator, only type of bounded 
     * variable and thanks to that we have unique representation for all alpha-convertible 
     * terms - the problem is gone.
     *   Examples: (we use '\' to represent lambda)
     *     \ #nat . 0           - identity on natural numbers (\x.x)
     *     \ #nat . \ #nat . 0  - right projection (\x.\y.y)
     *     \ #nat . \ #nat . 1  - left projection (\x.\y.x)
     *     0                    - free variable (x)
     *     \ #nat . 1           - and what that will be?
     *
     *   Now since variables are just numbers we can represent environments simply as
     * list of types. So a number of a variable tells us which declaration in the
     * environment we need to consult to get its types.
     *    Examples:
     *      #nat :: nil |- 0 : #nat  - free variable of type #nat
     *     but be careful with lambdas:
     *      #nat :: nil |- \ #nat. 1 - equivalent to: (y:#nat |- \(x:#nat) . y)
     *)
  Definition Env := list (SimpleType).

    (* 
     *   Now we introduce some shorthands for consulting the type of free variable.
     *   'VarD E x A' is a predicate stating that in environment 'E' variable with number 
     *  'x' has type 'A'. We will denote it as 'E |= x := A'.
     *   'VarUD E x' is a predicate stating that in environment 'E' variable with number
     *  'x' is undeclared. We will write 'E |= x :!' for that.
     *   We use function 'nth_error' defined in Coq.Lists.List. 'nth_error l n' returns
     * 'Some a', if n'th element of list 'l' is 'a' or 'None' if list l has less than 
     * 'n' elements.
     *)
  Definition VarD (E: Env) x A := nth_error E x = Some A.
  Definition VarUD (E: Env) x := nth_error E x = None.
  Notation "E |= x := A" := (VarD E x A) (at level 60).
  Notation "E |= x :!" := (VarUD E x) (at level 60).

    (* 
     *   Preterm represents the set of untyped terms (raw terms). Raw term is either:
     * - a variable or
     * - a constant or
     * - abstraction with given type of abstracted variable or
     * - application of two raw terms.
     *)
  Inductive Preterm : Set :=
  | Var (x: nat)
  | Fun (f: FunctionSymbol)
  | Abs (A: SimpleType) (M: Preterm)
  | App (M N: Preterm).

   (* 
    *   To make things more readable we introduce some notations.
    *   We will write '^f' for 'Fun f'
    *                 '%x' for 'Var x'
    *                 't @@ u' for 'App t u'
    *                 '\A => t' for 'Abs A t'
    *)
  Notation "^ f" := (Fun f) (at level 20).
  Notation "% x" := (Var x) (at level 20).
  Infix "@@" := App (at level 25, left associativity).
  Notation "\ A => M" := (Abs A M) (at level 35).

   (*
    *   Now we introduce typing judgements. 'Typing E T A' states that in the
    * environment 'E' raw term 'T' has type 'A'. We will abbreviate it with
    * 'E |- T := A'. 
    *   In the below definition you should be able to recoginize the typing
    * rules for simply typed lambda calculus as presented during the course.
    *)
  Reserved Notation "E |- Pt := A" (at level 60).
  Inductive Typing : Env -> Preterm -> SimpleType -> Set :=
  | TVar: forall E x A, 
          (E |= x := A) -> 
          (E |- %x := A)
  | TFun: forall E f, 
          (E |- ^f := f_type f)
  | TAbs: forall E A B Pt, 
          ((A :: E) |- Pt := B) -> 
          (E |- \A => Pt := A --> B) 
  | TApp: forall E A B Pt0 Pt1, 
          (E |- Pt0 := A --> B) -> 
          (E |- Pt1 := A) -> 
          (E |- Pt0 @@ Pt1 := B)
   where "E |- Pt := A" := (Typing E Pt A).

   (*
    *   Now a term simply couples all those things together. So a term is a 
    * quadruple of environment, raw term, type and a typing judgment stating that
    * in this given environment given raw term has given type. That simple.
    *)
  Record Term : Set := buildT { 
    env: Env;
    term: Preterm;
    type: SimpleType; 
    typing: Typing env term type
  }.

   (* 
    *   Do not worry if you are not familiar with Record construct. Basically it
    * defines Term as an inductive type along with a number of auxiliary functions:
    *   buildT to construct terms
    *   env to get the environment of given term
    *   term to get the raw term of given term
    *   type to get the type of given term
    *   and typing to get the typing judgement of given term.
    * You can check their types with Check command.
    *)
  Check buildT.
  Check Term.
  Check env.
  Check term.
  Check type.
  Check typing.

   (* 
    *  This is an auxiliary function for nth_error. It says that 'nth_error l i' is
    * either 'None' or there is an element 'a' such that 'nth_error l i = Some a'.
    *)
  Fact nth_error_In: forall (A: Set) (l: list A) i,
    {a: A | nth_error l i = Some a} + {nth_error l i = None}.
  Proof.
    induction l.
    right; compute; case i; trivial.
    intro i.
    case i.
    left; exists a; trivial.
    intro n.
    destruct (IHl n) as [[a' a'nth] | nth_none].
    left; exists a'; trivial.
    right; trivial.
  Qed.
  
   (* 
    *   We will need some more decidability results. From the fact that equality
    * on base types and constants is decidable we prove that equality on environments,
    * simple types, raw terms and finally typed terms are decidable as well.
    *   Do not worry, you don't need to understand the proofs; but you should be
    * able to understand what do those lemmas state and use them later on. 
    *)

   (* 
    * Equality on simple types is decidable
    *)
  Lemma eq_SimpleType_dec : forall (A B: SimpleType), 
    {A = B} + {A <> B}.
  Proof. 
    decide equality.
    apply eq_BaseType_dec.
  Qed.

   (* 
    * Equality on environments is decidable
    *)
  Lemma eq_Env_dec : forall (E1 E2 : Env), 
    {E1 = E2} + {E1 <> E2}.
  Proof.
    decide equality.
    apply eq_SimpleType_dec.
  Qed.

   
   (* 
    * Equality on raw terms is decidable
    *)
  Lemma eq_Preterm_dec : forall (F G: Preterm), 
    {F = G} + {F <> G}.
  Proof. 
    decide equality.
    apply eq_nat_dec.
    apply eq_FunctionSymbol_dec.
    apply eq_SimpleType_dec.
  Qed.

   (* 
    * Whether variable is declared in a given environment or not is decidable as well.
    *)
  Lemma isVarDecl_dec : forall E x, 
    {A: SimpleType | E |= x := A} + {E |= x :!}.
  Proof.
    intros; unfold VarUD.
    destruct (nth_error_In E x) as [[A ExA] | Exn].
    left; exists A; trivial.
    right; auto.
  Qed.

   (*
    * Auxiliary. Decidability of equality of triple (environment, raw term, simple type).
    *)
  Lemma eq_EPS_dec: forall (a b: Env * Preterm * SimpleType), 
    {a = b} + {a <> b}.
  Proof.
    decide equality.
    apply eq_SimpleType_dec.
    generalize a p; decide equality.
    apply eq_Preterm_dec.
    apply eq_Env_dec.
  Qed.

   (*
    * Uniqueness of variable declaration.
    *)
  Lemma VarD_unique : forall E x A (v1 v2 : VarD E x A), 
    v1 = v2.
  Proof.
    unfold VarD; intros; generalize v1 v2; rewrite v1.
    intros; apply K_dec_set.
    decide equality.
    apply eq_SimpleType_dec.
    pattern v0; apply K_dec_set; trivial.
    decide equality.
    apply eq_SimpleType_dec.
  Qed.
  
   (* 
    * Auxiliary lemma
    *)
  Lemma Type_unique : forall Pt E A B (d1 : Typing E Pt A) (d2 : Typing E Pt B), 
    A = B.
  Proof.
    induction Pt; intros; inversion d1; inversion d2; trivial.
    unfold  VarD in * .
    rewrite H5 in H1.
    inversion H1; trivial.
    rewrite(@IHPt _ _ _ H3 H8); auto.
    set (e0 := IHPt1 _ _ _ H2 H8); injection e0; auto.
  Qed.

   (*
    * Auxiliary lemma, uniqueness of typing judgements.
    *)
  Lemma typing_unique : forall E Pt A (d1 d2 : Typing E Pt A), 
    d1 = d2.
  Proof.
    refine(
      fix Deriv_unique e t T (d1 d2 : Typing e t T) 
	{struct d1 } : d1 = d2 :=
	match d1 as d1' in Typing e1 t1 T1, 
	  d2 as d2' in Typing e2 t2 T2 
	    return 
            forall (cast : (e1,t1,T1) = (e2,t2,T2)), 
              (e1,t1,T1) = (e,t,T) ->
              eq_rect (e1,t1,T1) 
	      (fun etT => 
		match etT with 
		  (e,t,T) => Typing e t T 
		end) 
	      d1' _ cast = d2'
	      with
	  | TVar _ _ _ _, TVar _ _ _ _ => _
	  | TFun _ _, TFun _ _ => _
	  | TAbs _ _ _ _ _, TAbs _ _ _ _ _ => _
	  | TApp _ _ _ _ _ _ _, TApp _ _ _ _ _ _ _ => _
	  | _, _ => _
	end (refl_equal _) (refl_equal _));
    intros; destruct t; try discriminate;
      try discriminate cast; try discriminate dis;
      injection cast; intros; generalize cast; clear cast.
    generalize v v0; clear v v0.
    rewrite H0; rewrite H1; rewrite H2.
    intros; pattern cast; apply (K_dec_set eq_EPS_dec).
    rewrite (VarD_unique v v0); apply refl_equal.    
    rewrite H1; rewrite H2.
    intros; pattern cast; apply (K_dec_set eq_EPS_dec); 
      apply refl_equal.    
    generalize t1; clear t1.
    rewrite <- H0; rewrite <- H1; rewrite <- H2; rewrite <- H4.
    intros; pattern cast; apply (K_dec_set eq_EPS_dec).
    rewrite(Deriv_unique _ _ _ t0 t1); apply refl_equal.    
    generalize t2 t3; clear t2 t3.
    rewrite <- H0; rewrite <- H1; rewrite <- H2; rewrite <- H3.
    intros t2 t3.
    intros; pattern cast; apply (K_dec_set eq_EPS_dec).
    set(e0 := Type_unique t0 t2); injection e0; intro H7.
    generalize t2 t3; clear e0 t2 t3; rewrite <- H7.
    intros; rewrite(Deriv_unique _ _ _ t0 t2); 
      rewrite(Deriv_unique _ _ _ t1 t3);
	apply refl_equal.
  Qed.

   (* 
    *   Important result. If we have two terms with equal environments, equal term 
    * structure and equal types then their typing judgments are equal as well (this 
    * means that typing judgements are unique).
    *)
  Theorem deriv_uniq: forall M N, 
    env M = env N -> 
    term M = term N -> 
    type M = type N -> 
    M = N.
  Proof.
    intros; destruct M; destruct N; simpl in * .
    generalize typing0; clear typing0.
    rewrite H; rewrite H0; rewrite H1.
    intros.
    rewrite(typing_unique typing0 typing1).
    apply refl_equal.
  Qed.

   (*
    *   Another important result. If two typed terms have equal environments
    * and equal term structure then they have the same type. This means that terms
    * have unique type.
    *)
  Lemma typing_uniq: forall M N, 
    env M = env N -> 
    term M = term N -> 
    type M = type N.
  Proof.
    intros; destruct M; destruct N; simpl in * .
    generalize typing0; clear typing0.
    rewrite H; rewrite H0; intros.
    apply (Type_unique typing0 typing1).
  Qed.

   (* 
    *   Yet another important result, combining the above one. If we have two terms
    * with the same envrionment and the same term structure then they are actually
    * equal (as they must have the same type and the typing judgements are unique)
    *)
  Lemma term_eq: forall M N, 
    env M = env N -> 
    term M = term N -> 
    M = N.
  Proof.
    intros; apply deriv_uniq; auto.
    apply typing_uniq; auto.
  Qed.

   (* 
    *   Now this is the main result to be proven. Roughly speaking it says that given
    * environment and raw term either there exists a typed term with this environment
    * and this term structure (raw term) or such term does not exist.
    *   In other words this expresses the fact that typing is decidable. Completion of
    * this proof gives you a function that given environment and raw term either
    * finds a typing judgement for it or concludes that this term is not typable in 
    * given environment.
    *  Good luck!
    *)
  Definition autoType Pt E: 
    {N: Term | env N = E & term N = Pt} +
    {~exists N: Term, env N = E /\ term N = Pt}.
  Proof.
    (* ... *)
  Admitted. (* once you are done you should be able to change this Admitted to Qed  *)
            (* Admitted is a way to tell Coq to accept some lemma without providing *)
            (* a (complete) proof                                                   *)

