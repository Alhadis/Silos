Require Import Setoid Morphisms RelationClasses.

Class Equiv (A : Type) := equiv : relation A.
Infix "===" := equiv (at level 70, no associativity).

Instance Equiv_eq {A : Type} : Equiv A | 100 := {equiv := eq}.


Instance Equiv_option {A} {Heq: Equiv A} : Equiv (option A) | 0 := {
    equiv := fun a b => 
               (a = None /\ b = None) \/
               (exists x y, a = Some x /\ b = Some y /\ x === y)
}.

Instance Equiv_unit: Equiv unit | 0 := fun _ _ => True.

Instance Equivalence_unit : Equivalence (@equiv unit _).
Proof. firstorder. Qed.

Instance Equivalence_option {A} {Heq: Equiv A} {Hequiv : Equivalence equiv} :
  Equivalence (@equiv (option A) Equiv_option).
Proof.
  split.
  + intros x; destruct x; unfold equiv, Equiv_option; [right | left; firstorder].
    exists a; exists a; intuition.
  + intros x y Hxy. destruct x, y; [| intuition firstorder | intuition firstorder |].
    * unfold equiv, Equiv_option in *; right; 
      destruct Hxy as [| [x [y [Hx [Hy Hxy]]]]]; [intuition congruence|].
      exists y; exists x; intuition.
    * unfold equiv, Equiv_option; left; intuition.
  + intros x y z Hxy Hyz; unfold equiv, Equiv_option in *;
    destruct x, y, z; (try intuition congruence).
    * destruct Hxy as [| [x [y [Hx [Hy Hxy]]]]]; [intuition congruence|].
      destruct Hyz as [| [y' [z [Hy' [Hz Hyz]]]]]; [intuition congruence|].
      inversion Hx; inversion Hy; inversion Hy'; inversion Hz; repeat subst.
      right. exists x; exists z; intuition. etransitivity; eassumption.
    * destruct Hxy as [| [x [y [Hx [Hy Hxy]]]]]; [intuition congruence|].
      destruct Hyz as [| [y' [z [Hy' [Hz Hyz]]]]]; [intuition congruence|].
      inversion Hz.
    * destruct Hxy as [| [x [y [Hx [Hy Hxy]]]]]; [intuition congruence|].
      destruct Hyz as [| [y' [z [Hy' [Hz Hyz]]]]]; [intuition congruence|].
      inversion Hy.
    * destruct Hxy as [| [x [y [Hx [Hy Hxy]]]]]; [intuition congruence|].
      destruct Hyz as [| [y' [z [Hy' [Hz Hyz]]]]]; [intuition congruence|].
      inversion Hx.
Qed.

Section EquivProducts.
  Context {A B : Type} `{eA : Equiv A} `{eB : Equiv B}.
  Context {HA: Equivalence (@equiv _ eA)}.
  Context {HB: Equivalence (@equiv _ eB)}.

  Global Instance Equiv_prod : Equiv (A * B) :=
    fun p1 p2 => (fst p1 === fst p2) /\ (snd p1 === snd p2).

  Global Instance prod_proper : Proper (equiv ==> equiv ==> equiv) (@pair A B).
  Proof.
    intros a a' Ha b b' Hb; split; assumption.
  Qed.

  Global Instance equiv_prod : Equivalence equiv.
  Proof.
    split.
      intros [a b]; split; reflexivity.
      intros [a1 b1] [a2 b2] [Ha Hb]; split; symmetry; assumption.
    intros [a1 b1] [a2 b2] [a3 b3] [Ha12 Hb12] [Ha23 Hb23];
      split; etransitivity; eassumption.
  Qed.

End EquivProducts.