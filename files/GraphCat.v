

Require Import Grph.Graph.
Require Import Cat.Category.
Require Import Coq.Program.Basics.
Require Import Coq.Logic.Classical_Prop.

Inductive Grph : Type :=
    grph (V A : Type) (g : Graph V A) : Grph.

Arguments grph {V A} g.

Definition vert_of (X : Grph) : Type :=
    match X with grph V _ _ => V end.

Definition arr_of (X : Grph) : Type :=
    match X with grph _ A _ => A end.

Definition graph_of (g : Grph) : Graph (vert_of g) (arr_of g) :=
    match g with grph _ _ g => g end.

Definition src_of (X : Grph) : arr_of X -> vert_of X :=
    match X with grph _ _ g => match g with graph src _ => src end end.

Definition tgt_of (X : Grph) : arr_of X -> vert_of X :=
    match X with grph _ _ g => match g with graph _ tgt => tgt end end.

Inductive GrphHom (X Y : Grph) : Type :=
    grph_hom
        (vert_fn : vert_of X -> vert_of Y)
        (arr_fn : arr_of X -> arr_of Y)
        (proof_src : compose (src_of Y) arr_fn = compose vert_fn (src_of X))
        (proof_tgt : compose (tgt_of Y) arr_fn = compose vert_fn (tgt_of X))
            : GrphHom X Y.

Definition vert_fn {X Y : Grph} (g : GrphHom X Y) : vert_of X -> vert_of Y :=
    match g with grph_hom v _ _ _ => v end.

Definition arr_fn {X Y : Grph} (g : GrphHom X Y) : arr_of X -> arr_of Y :=
    match g with grph_hom _ a _ _ => a end.

Theorem grph_hom_eq {X Y : Grph} {f g : GrphHom X Y} :
        vert_fn f = vert_fn g -> arr_fn f = arr_fn g -> f = g.
    intros proof_v proof_a.
    destruct f as [vf af psf ptf].
    destruct g as [vg ag psg ptg].
    simpl in *.
    subst.
    f_equal; apply proof_irrelevance.
Qed.

Definition id_grph (X : Grph) : GrphHom X X.
    refine (grph_hom X X id id _ _);
        reflexivity.
Defined.

Definition comp_grph (X Y Z : Grph) (f : GrphHom Y Z) (g : GrphHom X Y) : GrphHom X Z.
    refine (grph_hom X Z (compose (vert_fn f) (vert_fn g)) (compose (arr_fn f) (arr_fn g)) _ _);
        destruct f as [vf af psf ptf]; destruct g as [vg ag psg ptg];
        simpl in *;
        [
            pose (fn := src_of); pose (proof_f := psf); pose (proof_g := psg) |
            pose (fn := tgt_of); pose (proof_f := ptf); pose (proof_g := ptg)
        ];
        assert (chase1 : compose (fn Z) (compose af ag) = compose (compose (fn Z) af) ag) by trivial;
        assert (chase2 : compose (compose vf vg) (fn X) = compose vf (compose vg (fn X))) by auto;
        unfold fn in *;
        rewrite chase1;
        rewrite chase2;
        rewrite proof_f;
        rewrite <- proof_g;
        reflexivity.
Defined.

Instance GrphIsCat : Category id_grph comp_grph.
    split;
        intros;
        apply grph_hom_eq;
        reflexivity.
Qed.

Definition GrphCat : Cat :=
    cons_cat Grph GrphHom id_grph comp_grph GrphIsCat.


