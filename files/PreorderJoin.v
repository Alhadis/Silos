
Require Import Preorder.
Require Import Cat.Category.

Require Import Coq.Program.Basics.
Require Import Coq.Logic.Classical_Prop.

Definition gt_both {p : PrO} (s t gt : undertype_pro p) : Prop
    := ordering p s gt /\ ordering p t gt.

Definition is_join (p : PrO) (s t joined : undertype_pro p) : Prop
    := gt_both s t joined
        /\ (forall alternate : undertype_pro p,
                gt_both s t alternate -> ordering p joined alternate).

Class PreorderWithAllJoins (p : PrO)
    (join : undertype_pro p -> undertype_pro p -> undertype_pro p)
        : Prop := Build_PreorderWithAllJoins {
                is_actual_join : forall (s t : undertype_pro p),
                    is_join p s t (join s t)
            }.

Inductive PrOJ : Type
    := cons_proj
        (p : PrO)
        (join : undertype_pro p -> undertype_pro p -> undertype_pro p)
        (proj_inst : PreorderWithAllJoins p join) : PrOJ.

Definition underpro (p : PrOJ) : PrO := match p with cons_proj p' _ _ => p' end.

Definition undertype_proj (p : PrOJ) : Type := undertype_pro (underpro p).

Definition join (p : PrOJ) : undertype_proj p -> undertype_proj p -> undertype_proj p
    := match p with cons_proj _ join _ => join end.

Definition preserves_joins {P Q : PrOJ} (f : PrOHom (underpro P) (underpro Q)) : Prop
    := forall (x y : undertype_proj P),
            (join Q (pro_fn f x) (pro_fn f y) = pro_fn f (join P x y)).

Definition PrOJHom (P Q : PrOJ) : Type :=
    { f : PrOHom (underpro P) (underpro Q) | preserves_joins f }.

Definition proj_hom {P Q : PrOJ} (hom : PrOJHom P Q) : PrOHom (underpro P) (underpro Q)
    := match hom with exist f _ => f end.

Definition proj_fn {P Q : PrOJ} (hom : PrOJHom P Q) : undertype_proj P -> undertype_proj Q
   := pro_fn (proj_hom hom).

Theorem proj_hom_eq (P Q : PrOJ) (f g : PrOJHom P Q) : proj_fn f = proj_fn g -> f = g.
    destruct f as [f pf].
    destruct g as [g pg].
    unfold proj_fn; unfold proj_hom.
    intro H.
    assert (f = g).
       apply pro_hom_eq;
       exact H.
    subst f.
    f_equal.
    apply proof_irrelevance.
Qed.

Definition id_proj (P : PrOJ) : PrOJHom P P.
    refine (exist _ (id_pro (underpro P)) _).
    destruct P.
    unfold preserves_joins.
    reflexivity.
Defined.

Definition comp_proj {P Q R : PrOJ} (f : PrOJHom Q R) (g : PrOJHom P Q) : PrOJHom P R.
    refine (exist _ (comp_pro _ _ _ (proj_hom f) (proj_hom g)) _).
    destruct f as [f pF]; destruct g as [g pG].
    destruct P; destruct Q; destruct R.
    unfold preserves_joins in *.
    simpl in *.
    unfold compose.
    intros.
    rewrite pF.
    rewrite pG.
    reflexivity.
Defined.

Instance PrJIsCat : Category id_proj (@comp_proj).
    split;
        intros;
        apply proj_hom_eq;
        reflexivity.
Qed.

