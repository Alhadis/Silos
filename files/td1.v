Require Export ZArith. 
Open Scope Z_scope. 

(* Les formules du calcul des propositions *) 

Inductive CP:Set := 
  | X : Z -» CP 
  | et : CP -»CP -»CP 
  | ou : CP -» CP -» CP 
  | imp : CP -» CP -» CP 
  | non : CP -» CP. 

Notation "A /\ B" := (et A B). 
Notation "A \/ B":= (ou A B). 
Notation "A .-» B" := (imp A B) (at level 100). 

Definition A := X 1. 
Definition B := X 2. 
Definition C := X 3. 
Definition D := X 4. 
Definition E := X 5. 

Check (A /\ B .-» non A). 
(* Check (A \/ 1 .-» non A).*) 

(* Sémantique classique. Z2 est le corps à 2 éléments: {0,1} *) 
Require Export Z2. 

(* L'ensemble des interprétations: on identifie Z avec l'ensemble des variables propositionnelles *) 
Definition I := Z -» Z2. 

(* Interprétation d'une formule *) 

Fixpoint interp(v:I)(f:CP){struct f} : Z2 := 
  match f with 
   | X n =» v n 
   | et f1 g1 =» (interp v f1) * (interp v g1) 
   | ou f1 g1 =» (interp v f1)*(interp v g1) + (interp v f1) + (interp v g1) 
   | imp f1 g1 =» (interp v f1) *((interp v g1) + 1) + 1 
   | non f1 =» (interp v f1) + 1 
end. 

Definition tautologie (f:CP) := forall v:I, interp v f = 1. 

Definition Jack_Palmer :=  
   (non A .-» B \/ C) /\ ( non B .-» non A /\ D) /\ (D .-» B \/ non C) .-» B. 

Lemma Jack_Palmer_vrai: tautologie Jack_Palmer. 
unfold tautologie. (* unfold deplie les definitions *) 
intros. (* intros met en hypotheses les variables quantifiees *) 
unfold Jack_Palmer. 
simpl. 
simplify_Z2 v. 
trivial. 
Qed. 

Lemma exo0: tautologie (non (A \/ B) .-» non A /\ non B). 
unfold tautologie. 
intros. 
simpl. 
simplify_Z2 v. 
trivial. 
Qed. 

(* club ecossais: 

– Tout membre non écossais porte des chaussettes rouges. 
– Tout membre porte un kilt ou ne porte pas de chaussettes rouges. 
– Les membres mariés ne sortent pas le dimanche. 
– Un membre sort le dimanche si et seulement s’il est écossais. 
– Tout membre qui porte un kilt est écossais et marié. 
– Tout membre écossais porte un kilt. 
Montrer que ce club est si fermé qu’il ne peut accepter personne.  

A = écossais 
B = porte des chaussettes rouges 
f1 = non A .-» B 
C = porte un kilt 
D = marié 
E = sort le dimanche 

*) 

Definition f1 := non A .-» B. 
Definition f2 := C \/ non B. 
Definition f3 := D .-» non E. 
Definition f4 := (E .-» A) /\ (A .-» E). 
Definition f5 := C .-» A /\ D. 
Definition f6 := A .-» C.  

Definition club_ecossais:= non (f1 /\ f2 /\ f3 /\ f4 /\ f5 /\ f6). 

Lemma club_ecossais_ok: tautologie club_ecossais. 
unfold tautologie. 
unfold club_ecossais, f1, f2, f3, f4, f5, f6. 
intros. 
simpl. 
simplify_Z2 v. 
trivial. 
Qed. 

Lemma exo1:  
     tautologie ((non A .-» B \/ C)  
                        /\ ( non B .-» non A /\ D) 
                        /\ (D .-» B \/ non C) 
                        .-» A). 
unfold tautologie. 
intros. 
simpl. 
simplify_Z2 v.