Require Import CatSem.CAT.mon_cats.
Require Import CatSem.CAT.NT.
Require Import CatSem.CAT.CatFunct.
Require Import CatSem.CAT.cat_SET.
Require Import CatSem.CAT.monad_def.
Require Import CatSem.CAT.monic_epi.
Require Import funct_set_monoidal.

Set Implicit Arguments.
Unset Strict Implicit.

Unset Automatic Introduction.


Section CatSets.
Record Cat_set := { objs :> Set ; mors : objs -> objs -> Set ; cats_struct :> Cat_struct mors }.

Program Instance Cat_CATs : Cat_struct (fun C D : Cat_set => Functor C D) :=
  { mor_oid a b := EXT_Functor_oid a b ; id c := Id c ; comp := fun (a b c : Cat_set) (F : (fun C D : Cat_set => Functor C D) a b)
          (G : (fun C D : Cat_set => Functor C D) b c) => 
        G O F}.
Next Obligation.                                                                    
intros F G H0 H I H1.
simpl.
intros x y f.
eapply Equal_hom_trans.
apply H1.
eapply F_equal_helper3.
apply H0.
Qed.

Next Obligation.
apply Equal_hom_refl.
Qed.

Next Obligation.
  apply Equal_hom_refl.
Qed.

Next Obligation.
repeat eapply F_equal_helper3.
apply Equal_hom_refl.
Qed.

End CatSets.

Section Monoid.
Variable C:Cat.
Context (MonC:@mon_cat (obj C) _ (cat_struct C)).
Notation "x ⊗ y" := (tens (x,y)) (at level 40).
Class Monoid_struct (M:C) :=
  { mappend : M⊗M ---> M ; mempty : I ---> M ;
    monoid_assoc_l := (inverse (Alpha (M,M,M)) ;; # (tens O eleft C M) mappend ;; mappend) ;
    monoid_assoc_r := # (tens O eright _ M) mappend ;; mappend ;
    monoid_assoc : monoid_assoc_l == monoid_assoc_r ;
    monoid_unit_l : Lambda M == #(tens O eright _ M) mempty ;; mappend ;
    monoid_unit_r : Rho M == #(tens O eleft _ M) mempty ;; mappend
  }.
  Record Monoid := { monoid_obj :> C ; monoid_struct :> Monoid_struct monoid_obj }.
End Monoid.

Section Monoid_as_Monad.
  Context (Mon:Monoid FunctCat_Monoidal).
  Program Instance MonoidObjInEndoFUNCT_Monad_struct : MonaD_struct (monoid_obj Mon) :=
    {| Eta := {| trafo := trafo (mempty (Monoid_struct:=Mon)) |} ;
       Mu := {| trafo := mappend (Monoid_struct:=Mon) |}
    |}.
  Next Obligation.
    hnf.
    simpl.
    intros c x.
    assert (H:= monoid_assoc (Monoid_struct:=Mon)).
    simpl in H.
    rewrite H.
    assert (H0 := (preserve_ident (Functor_struct:=(monoid_obj Mon)))).
    simpl in H0.
    rewrite H0.
    reflexivity.
  Qed.
  Next Obligation.
    hnf; simpl; intros c x.
    assert (H:=monoid_unit_r (Monoid_struct:=Mon)).
    simpl in H.
    congruence.
  Qed.
  Next Obligation.
    hnf; simpl; intros c x.
    assert (H:=monoid_unit_l (Monoid_struct:=Mon)).
    simpl in H.
    rewrite H.
    f_equal.
    assert (H0 := preserve_ident (Functor_struct:=monoid_obj Mon)).
    simpl in H0.
    rewrite H0.
    reflexivity.
  Qed.
End Monoid_as_Monad.

Section Monad_as_Monoid.
  Context (M:MonaD SET).
  Program Instance MonadAsMonoid_struct : Monoid_struct (FunctCat_Monoidal) M := {|
    mappend := Mu (MonaD_struct:=M) ; mempty := Eta (MonaD_struct:=M) |}.
  Next Obligation.
    assert (H:=preserve_ident (Functor_struct:=M) (M c)).
    simpl in H.
    rewrite H.
    assert (H0:= Subst_ax (MonaD_struct:=M)).
    unfold Subst_ax,subst_ax in H0; simpl in H0.
    rewrite H0; reflexivity.
  Qed.
  Next Obligation.
    assert (H:=preserve_ident (Functor_struct:=M) (M c)).
    simpl in H.
    rewrite H.
    assert (H0 := Eta2_ax (MonaD_struct:=M)).
    unfold eta_mu_ax2 in H0.
    simpl in H0.
    rewrite H0.
    reflexivity.
  Qed.
  Next Obligation.
    assert (H0 := Eta1_ax (MonaD_struct:=M)).
    unfold eta_mu_ax1 in H0.
    simpl in H0.
    rewrite H0.
    reflexivity.
  Qed.    
End Monad_as_Monoid.