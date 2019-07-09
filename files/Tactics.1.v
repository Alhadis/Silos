Require Import Model.

Ltac notHyp P :=
  match goal with
    | [ _ : P |- _] => fail 1
    | _ => match P with
           | ?P1 /\ ?P2 => first [notHyp P1 | notHyp P2 | fail 2]
           | _ => idtac
           end
  end.

Ltac extend pf :=
  let t := type of pf in
    notHyp t; generalize pf; intro.

Ltac focale_rewrite :=
  repeat match goal with
    | [ _ : ?P |- ?P ] => assumption
    | [ |- forall x, _ ] => intro
    | [ |- ?fn ?P ] => focale_rewrite P (* There HAS to be a better way to do this, but the only thing I found was a coq-club question with no replies. *)
    | [ |- ?fn ?P1 ?P2] => focale_rewrite P1; focale_rewrite P2
    | [ |- ?fn ?P1 ?P2 ?P3] => focale_rewrite P1; focale_rewrite P2; focale_rewrite P3
    | [ H : d_Eq _ ?d _ |- ?d] => rewrite H
    | [ H : d_Eq _ ?d ?d' |- _] => extend (equiv_refl H)
    | [ H : p_Eq _ ?p _ |- ?p] => rewrite H
    | [ H : p_Eq _ ?p ?p' |- _] => extend (p_Eq_refl H)
    | _ => auto
end.
