From Coq Require Import Strings.String.
From Coq Require Import Strings.Ascii.


(* Module ECC. *)

Inductive ECCuni: Type :=
  | uProp
  | uType (i: nat)
.

Inductive ECCexp: Type :=
  | eId (x: string)
  | eUni (U: ECCuni)
  | ePi (x: string) (A B: ECCexp)
  | eAbs (x: string) (A B: ECCexp)
  | eApp  (e1 e2: ECCexp)
  | eLet (x: string) (e1 e2: ECCexp)
(*
  |ECCSig (x: string) (A B: ECCexp)
  |ECCPair (e1 e2 A B: ECCexp)
  |ECCFst (e: ECCexp)
  |ECCSnd (e: ECCexp)
*)
.

Inductive ECCenv: Type :=
  | gDot
  | gTypeDec (x: string) (A: ECCexp)
  | gAssign (x: string) (e: ECCexp)
.


Local Open Scope string_scope.
Bind Scope ECC_scope with ECCexp.
Bind Scope ECC_scope with ECCuni.
Bind Scope ECC_scope with ECCenv.
Delimit Scope ECC_scope with ECC.
Coercion eId: string >-> ECCexp.

Definition X := "x".
Definition F := "f".

Notation "'type' x" := (eUni (uType x)) (at level 50):  ECC_scope.
Notation "'prop'" := (eUni uProp) (at level 50):  ECC_scope.
Definition example_Type := (type 3)%ECC: ECCexp.
Definition example_Prop := (prop)%ECC: ECCexp.

Notation "{ e1 e2 }" := (eApp e1 e2) (at level 50,e1 at level 9):  ECC_scope.
Definition example_App := { "x" "y" }%ECC: ECCexp.

Notation "'LET' x ':=' A 'in' B" := (eLet x A B) (at level 50, format "'[v' 'LET'  x  ':='  A '/' 'in' '['  B ']' ']'") : ECC_scope.
Definition example_Let := (LET "x" := "c" in "d")%ECC : ECCexp.
Print example_Let.
Definition example_Let2 := (LET X := (type 3) in LET F := (LET X := (type 2) in X) in ({X F}))%ECC.
Print example_Let2.

Notation "'P' x : A '->' B" := (ePi x A B) (at level 50, x at level 9, A at level 9) : ECC_scope.
Definition example_Pi := (P "x" : "f" -> "b")%ECC : ECCexp.
Notation "'\'  x : A  '->'  B" := (eAbs x A B) (at level 50, x at level 9, A at level 9) : ECC_scope.
Definition example_Abs := (\ "x" : "a" -> "b")%ECC : ECCexp.




Definition example_ycombinator := (\F:(type 3) -> ({(\X:(type 2) -> ({F {X X}})) (\X:(type 2) -> ({F {X X}}))}))%ECC. 
Print example_ycombinator.

(* End ECC.
Module ECCA. *)

(*
Inductive ECCAuni : Type :=
  | auProp
  | auType (i: nat)
.*)

Inductive ECCAsym: Type:=
  | asymStr (x: string)
  | asymNum (x: nat)
.

Inductive ECCAval: Type :=
  | avId (x: ECCAsym)
  | avUni (U: ECCuni)
  | avPi (x: ECCAsym) (A B: ECCAconf)
  | avAbs (x: ECCAsym) (A B: ECCAconf)
with
ECCAconf: Type :=
  | acfComp (e: ECCAcomp)
  | acfLet (x: ECCAsym) (A: ECCAcomp) (B: ECCAconf)
with 
ECCAcomp: Type :=
  | acpApp (e1 e2: ECCAval)
  | acpVal (e: ECCAval)
.

Inductive ECCAcont: Type :=
  | actHole
  | actLetHole (x: ECCAsym) (B: ECCAconf)
.


Bind Scope ECCA_scope with ECCAsym.
Bind Scope ECCA_scope with ECCAval.
Bind Scope ECCA_scope with ECCAconf.
Bind Scope ECCA_scope with ECCAcomp.
Bind Scope ECCA_scope with ECCAcont.
Delimit Scope ECCA_scope with ECCA.
Coercion asymStr: string >-> ECCAsym.
Coercion asymNum: nat >-> ECCAsym.
Coercion avId: ECCAsym >-> ECCAval.
Coercion acpVal: ECCAval >-> ECCAcomp.
Coercion acfComp: ECCAcomp >-> ECCAconf.
Notation "'type' x" := (avUni (uType x)) (at level 50):  ECCA_scope.
Notation "'prop'" := (avUni uProp) (at level 50):  ECCA_scope.
Definition example_aType := (type 3)%ECCA: ECCAval.
Definition example_aProp := (prop)%ECCA: ECCAval.

Notation "{ e1 e2 }" := (acpApp e1 e2) (at level 50,e1 at level 9):  ECCA_scope.
Definition example_aApp := { "x" "y" }%ECCA: ECCAcomp.

Notation "'LET' x ':=' A 'in' B" := (acfLet x A B) (at level 50, format "'[v' 'LET'  x  ':='  A '/' 'in' '['  B ']' ']'") : ECCA_scope.
Definition example_aLet := (LET "x" := "c" in "d")%ECCA : ECCAconf.
Print example_aLet.
Definition example_aLet2 := (LET X := (type 3) in LET F := (LET X := (type 2) in X) in ({X F}))%ECC.
Print example_aLet2.

Notation "'P' x : A '->' B" := (avPi x A B) (at level 50, x at level 9, A at level 9) : ECCA_scope.
Definition example_aPi := (P "x" : "f" -> "b")%ECCA : ECCAval.
Notation "'\' x : A '->' B" := (avAbs x A B) (at level 50, x at level 9, A at level 9) : ECCA_scope.
Definition example_aAbs := (\ "x" : "a" -> "b")%ECCA : ECCAval.

Notation "'[]'" := (actHole) (at level 50) : ECCA_scope.
Definition aHole := []%ECCA.
Notation "'LET' x ':=' '[]' 'in' B" := (actLetHole x B) (at level 50) : ECCA_scope.
Definition example_aLetHole := (LET "x" := [] in "x")%ECCA.
Print example_aLetHole.
(* End ECCA. *)

Fixpoint fill_hole (e: ECCAcomp) (K: ECCAcont): ECCAconf :=
  match K with
    | actHole => acfComp e
    | actLetHole x B => acfLet x e B
end.

(* {ns : NameState} *)
Fixpoint trans  (ns: nat) (e: ECCexp) (K: ECCAcont) : ECCAconf :=
  match e with
    | eId x => (fill_hole (acpVal (avId (asymStr x))) K)
    | eUni u => (fill_hole (acpVal (avUni u)) K)
    | ePi x A B => (fill_hole (acpVal (avPi (asymStr x) (trans ns A actHole) (trans ns B actHole))) K)
    | eAbs x A B => (fill_hole (acpVal (avAbs (asymStr x) (trans ns A actHole) (trans ns B actHole))) K)
    | eApp e1 e2 => 
        (trans (S ns) e1 (actLetHole (asymNum (S ns)) 
            (trans (S (S ns)) e2 (actLetHole (asymNum (S (S ns))) 
                (fill_hole (acpApp (avId (asymNum (S ns))) (avId (asymNum (S (S ns))))) K)))))
    | eLet x e1 e2 => (trans (S ns) e1 (actLetHole (asymNum (S ns)) 
                          (trans (S ns) e2 K)))
end.

Check eAbs "f" (eUni (uType 1)) (eApp (eAbs "x" (eUni (uType 1)) (eApp (eId "f") (eApp (eId "x") (eId "x")))) (eAbs "x" (eUni (uType 1)) (eApp (eId "f") (eApp (eId "x") (eId "x"))))).

Compute trans 0 (eAbs "f" (eUni (uType 1)) (eApp (eAbs "x" (eUni (uType 1)) (eApp (eId "f") (eApp (eId "x") (eId "x")))) (eAbs "x" (eUni (uType 1)) (eApp (eId "f") (eApp (eId "x") (eId "x")))))) actHole.