
From mathcomp Require Import ssreflect ssrfun ssrbool ssrint eqtype ssrnat seq choice fintype rat finfun.
From mathcomp Require Import bigop ssralg div ssrnum ssrint order finmap.
Require Import PIOA.Posrat PIOA.Premeas Aux.

(*****************************************************************************)
(* {meas A} = linear combinations of posrat over A, where A is choicetype    *)


(* Section about integ *)
(* Section about mass *)
(* Section about support *)



Section MeasDef.
  Variables (A : choiceType).
  Structure Meas : Type :=
    {
      _pmeas :> PMeas A;
      _ : canonical_keys _pmeas && nubbed _pmeas
    }.
  Definition meas_of (_ : phant A) := Meas.
End MeasDef.

Arguments _pmeas [A].
Identity Coercion type_of_meas : meas_of >-> Meas.
Notation meas T := (@meas_of _ (Phant T)).

Section MeasCanonicals.
  Variables (A : choiceType).

Canonical meassub  := Eval hnf in [subType for (@_pmeas A)].
Definition measEqmix  := Eval hnf in [eqMixin of meas A by <:].
Canonical measEqtype := Eval hnf in EqType (meas A) (measEqmix).
Definition measChoicemix  := Eval hnf in [choiceMixin of (meas A) by <: ].
Canonical measChoicetype := Eval hnf in ChoiceType (meas A) (measChoicemix).
End MeasCanonicals.

Section MeasCount.
  Variables (A : countType).
  Definition measCountmix := Eval hnf in [countMixin of (meas A) by <: ].
  Canonical measCount := Eval hnf in CountType (meas A) measCountmix.
End MeasCount.

Definition mkMeas_ {A : choiceType} (d : PMeas A) : meas A.
  econstructor.
  apply/andP; split.
  instantiate (1 := sort_keys (measUndup d)).
  apply canonical_sort_keys.
  apply nubbed_sort_keys.
  apply measUndup_nubbed.
Defined.

Definition mkMeas {A : choiceType} (d : PMeas A) := locked (mkMeas_ d).

Lemma integ_mkMeas {A : choiceType} (d : PMeas A) f :
  integ (mkMeas d) f = integ d f.
  unlock mkMeas.
  have: integ (mkMeas d) f = integ (measUndup d) f.
  remember (mkMeas d) as c.
  unlock mkMeas in Heqc.
  destruct c as [cd h1 h2].
  rewrite //=.
  simpl.
  injection Heqc.
  move => ->.
  rewrite /integ.
  eapply eq_big_perm.
  have: measUndup d = undup (measUndup d).
  symmetry; apply undup_id.
  apply uniq_proj_uniq.
  have: nubbed (measUndup d).
  apply measUndup_nubbed.
  move/andP; elim; done.
  move => heq.
  rewrite {2}heq.
  rewrite SortKeys.perm; done.
  unlock mkMeas.
  move => ->.
  rewrite -measUndupE //=.
Qed.

Lemma in_pmeas_neq0 {A : choiceType} (m : meas A) x :
  x \in _pmeas m -> x.1 != 0.
  destruct m; simpl.
  move/andP: i; elim => [_ h].
  move/andP: h; elim => h1 h2.
  rewrite /measReduced in h1.
  intros.
  apply/contraT; rewrite negbK => hc.
  move/mapP: h1.
  elim.
  exists x.
  done.
  rewrite (eqP hc); done.
Qed.


Section MeasOps.
  Context {A : choiceType}.
  Definition mass (d : meas A) :=
    integ d (fun _ => 1).
  Definition isdist (d : meas A) :=
    mass d == 1.
  Definition issubdist (d : meas A) :=
    mass d <= 1.
  Definition support (d : meas A) := map snd (_pmeas d).
End MeasOps.

Section MeasMonad.
  Context {A B : choiceType}.

  Definition mret (a : A) : meas A := nosimpl mkMeas ((1%PR,a) :: nil).


  Definition mscale (r : posrat) (d : meas B) : meas B :=
    mkMeas (map (fun p => (r * p.1, p.2))%PR (_pmeas d)).

  Definition msum (ds : list (meas B)) : meas B :=
    mkMeas (flatten (map (@_pmeas B) ds)).

  Definition mjoin (d : meas (meas B)) : meas B :=
    msum (map (fun p => mscale p.1 p.2) (_pmeas d)).

  Definition mmap {C : choiceType} (d : meas A) (f : A -> C) : meas C :=
    mkMeas (map (fun p => (p.1, f p.2)) (_pmeas d)).

  Definition mbind (d : meas A) (f : A -> meas B) : meas B :=
    nosimpl mkMeas (mjoin (mmap d (fun a => (f a)) )).
End MeasMonad.

Lemma mkMeas_nil {A : choiceType} : _pmeas (mkMeas (nil : PMeas A)) = nil.
  unlock mkMeas;
  rewrite //= sort_keys_nil //=.
Qed.


Notation "'ret' x" := (@mret  _ x) (at level 75).
Notation "x <- c1 ; c2" := (@mbind _ _ c1 (fun x => c2))
   (right associativity, at level 81, c1 at next level).                       
Notation "m <$> f" := (x <- m; ret (f x)) (at level 50). (* mmap is only used internally *)

Notation "a ** b" := (x <- a; y <- b; ret (x,y)) (at level 30).

Definition mbind_dep {A B : choiceType} (c : meas A) (f : forall x, x \in support c -> meas B) : meas B :=
  (x <- c; odflt_dep (fun x => x \in support c) f (mkMeas nil) x).

(* For each section: 
   need:
    1.  how it interacts with: 
        * ret
        * bind
        * fmap
        * prod
        * scale

    2. any other useful properties
*)

(* Properties about integ, along with basic equivalences between return and bind *)

Lemma integ_ple_fun {A : choiceType} (M : meas A) (f1 f2 : A -> posrat) :
  (forall x, x \in support M -> f1 x <= f2 x) -> integ M f1 <= integ M f2.
  rewrite /integ.
  rewrite big_seq_cond.
  rewrite (big_seq_cond _ (fun p => p.1 * f2 p.2)).
  move => H.
  apply ple_sum => x.
  rewrite andbT => Hx.
  apply ple_mul_l.
  apply H.
  apply/mapP; exists x; done.
Qed.

Lemma integ_eq_fun {A : choiceType} (M : meas A) (f1 f2 : A -> posrat) :
  (forall x, x \in support M -> f1 x = f2 x) -> integ M f1 = integ M f2.
  intros.
  
  rewrite /integ.

  rewrite big_seq_cond.
  rewrite (big_seq_cond _ (fun p => p.1 * f2 p.2)).
  apply eq_big; rewrite //=.
  intros.
  move/andP: H0 => [H0 _].

  rewrite H.
  done.
  apply/mapP; exists i; done.
Qed.


Definition measP {A : choiceType} (d1 d2 : meas A) :
  (d1 = d2) <-> (forall f, integ d1 f = integ d2 f).
  destruct d1, d2; rewrite //=.
  split; intros.
  apply nubbed_sortedP; rewrite //=.
  injection H; rewrite //=.
  have: _pmeas0 = _pmeas1.
  apply nubbed_sortedP; rewrite //=.
  elim (andP i); done.
  elim (andP i0); done.
  elim (andP i); done.
  elim (andP i0); done.
  intros.
  injection H; move => ->; done.
  intros; elim (andP i); done.
  intros; elim (andP i0); done.
  intros; elim (andP i); done.
  intros; elim (andP i0); done.
  injection H; done.
  have: _pmeas0 = _pmeas1.
  apply nubbed_sortedP; elim (andP i); elim (andP i0); rewrite //=.
  intros.

  move: i i0.
  rewrite x; intros.
  have: i = i0.
  apply bool_irrelevance.
  move => ->.
  done.
Qed.

Lemma integ_ret {A : choiceType} (x : A) g :
  integ (ret x) g = g x.
  rewrite /mret integ_mkMeas integ_cons integ_nil paddr0.
  have -> : (1, x).1 = 1 by rewrite //=.
  have -> : (1, x).2 = x by rewrite //=.
  rewrite pmul1r //=.
Qed.

Lemma integ_mscale {A : choiceType} (d1 : meas A) r f :
  integ (mscale r d1) f = r * (integ d1 f).
  unfold mscale; rewrite //=.
  rewrite integ_mkMeas /integ.
  rewrite big_map //=.
  rewrite big_distrr //=.
  apply eq_big.
  intros; done.
  intros.
  rewrite pmulrA.
  done.
Qed.

Lemma integ_mjoin {A : choiceType} (d : meas (meas A)) (f : A -> posrat) :
  integ (mjoin d) f = integ d (fun d' => integ d' f).
  rewrite /mjoin /msum integ_mkMeas.
  destruct d as [d h]; rewrite //=.
  clear h.
  induction d.
  rewrite /mjoin /integ //= !big_nil.
  done.
  rewrite //=.
  rewrite integ_app.
  rewrite integ_mkMeas integ_cons IHd.
  congr (_ + _).
  rewrite /integ !big_map //=.
  rewrite big_distrr //=.
  apply eq_big.
  done.
  intros; rewrite pmulrA //=.
Qed.

Lemma integ_mbind {A B : choiceType} (d : meas A) (df : A -> meas B) f :
  integ (mbind d df) f = integ d (fun x => integ (df x) f).
  unfold mbind.
  rewrite integ_mkMeas.
  rewrite integ_mjoin.
  destruct d as [d h]; simpl.
  unlock mkMeas.
  rewrite /mmap //=; clear h.
  rewrite integ_mkMeas.
  induction d.
  rewrite /integ big_map big_nil //=.
  rewrite integ_cons //= -IHd //= integ_cons //=.
Qed.

(* HERE: basic monadic stuff *)

Lemma mbindA {A B C : choiceType} : forall (c1 : meas A) (c2 : A -> meas B) (c3 : B -> meas C),
  (x <- (y <- c1; c2 y); c3 x) = (y <- c1; x <- c2 y; c3 x).
  intros; apply/measP => f.
  rewrite !integ_mbind.
  apply integ_eq_fun => x Hx.
  rewrite integ_mbind.
  apply integ_eq_fun => y Hy.
  done.
Qed.

Lemma bind_ret {A : choiceType} (c : meas A) :
  (x <- c; ret x) = c.
  apply/measP => f.
  rewrite integ_mbind.
  apply integ_eq_fun => x Hx.
  rewrite integ_mkMeas //= integ_cons integ_nil .
  rewrite pmul1r paddr0 //=.
Qed.

Lemma ret_bind {A B : choiceType} (a : A) (c : A -> meas B) :
  (x <- (ret a); c x) = c a.
  apply/measP => f; rewrite integ_mbind integ_ret //=.
Qed.

Lemma mbind_swap {A B C : choiceType} (D1 : meas A) (D2 : meas B) (D3 : A -> B -> meas C) :
  (x <- D1; y <- D2; D3 x y) = (y <- D2; x <- D1; D3 x y).
  apply/measP => f.
  rewrite !integ_mbind.
  erewrite integ_eq_fun; last first.
  move => x; rewrite integ_mbind; done.
  symmetry; 
  erewrite integ_eq_fun; last first.
  move => x; rewrite integ_mbind; done.
  rewrite /integ.

  have:
    \big[padd/0]_(p <- (_pmeas D2))
     (p.1 * \big[padd/0]_(p0 <- (_pmeas D1)) (p0.1 * \big[padd/0]_(p1 <- _pmeas (D3 p0.2 p.2)) (p1.1 * f p1.2))) =
    \big[padd/0]_(p <- _pmeas D2)
     (\big[padd/0]_(p0 <- _pmeas D1) (p.1 * p0.1 * \big[padd/0]_(p1 <- _pmeas (D3 p0.2 p.2)) (p1.1 * f p1.2))).
  apply eq_bigr => i _.
  rewrite big_distrr //=.
  apply eq_bigr => j _.
  rewrite pmulrA //=.
  move => ->.

  rewrite exchange_big; apply eq_bigr => i _.
  rewrite big_distrr; apply eq_bigr => j _ //=.

  rewrite (pmulrC j.1 i.1).
  rewrite pmulrA //=.
Qed.

Lemma integ_mfmap {A B : choiceType} (m : meas A) (f : A -> B) g :
  integ (m <$> f) g = integ m (fun x => g (f x)).
  rewrite integ_mbind; apply integ_eq_fun => x Hx; rewrite integ_ret //=.
Qed.

Lemma integ_mprod {A B : choiceType} (m1 : meas A) (m2 : meas B) f :
  integ (m1 ** m2) f =
  integ m1 (fun x => integ m2 (fun y => f (x,y))).
  rewrite !integ_mbind.
  apply integ_eq_fun => x Hx.
  rewrite integ_mbind; apply integ_eq_fun => y Hy.
  rewrite integ_ret //=.
Qed.

Lemma integ_mprod_sym {A B : choiceType} (m1 : meas A) (m2 : meas B) f :
  integ (m1 ** m2) f =
  integ (m2 ** m1) (fun p => f (p.2, p.1)).
  rewrite mbind_swap.
  rewrite !integ_mbind.
  apply integ_eq_fun => x Hx.
  rewrite !integ_mbind.
  apply integ_eq_fun => y Hy.
  rewrite !integ_ret //=.
Qed.


Lemma integ_neq0 {A : choiceType} (m : meas A) f :
  (integ m f != 0) = (has (fun x => f x != 0) (support m)).
  rewrite /integ.
  rewrite psum_neq0.
  rewrite has_map.
  apply eq_in_has => x Hx.
  rewrite //=.
  rewrite -pmul0 negb_or.
  have: x.1 != 0.
  eapply in_pmeas_neq0.
  apply Hx.
  move => ->; rewrite //=.
Qed.

Lemma integ_const_fun_val {A B : choiceType} (m1 : meas A) (m2 : meas B) (f : A -> posrat) (g : B -> posrat) :
  mass m1 = mass m2 ->
  (exists a, (forall x, x \in support m1 -> f x = a) /\ (forall y, y \in support m2 -> g y = a)) ->
  integ m1 f = integ m2 g.
  
  move => h1 h2.
  elim h2 => a; elim => h3 h4.

  have: integ m1 f = a * mass m1.
  rewrite /mass /integ big_distrr //=.
  rewrite big_seq_cond.
  rewrite (big_seq_cond _ (fun i => a * (i.1 * 1))).
  apply eq_big; rewrite //=.
  move => i; move/andP => [Hi _].
  rewrite h3.
  rewrite pmulr1 pmulrC //=.
  apply/mapP; exists i; done.
  move => ->.

  have: integ m2 g = a * mass m2.
  rewrite /mass /integ big_distrr //=.
  rewrite big_seq_cond.
  rewrite (big_seq_cond _ (fun i => a * (i.1 * 1))).
  apply eq_big; rewrite //=.
  move => i; move/andP => [Hi _].
  rewrite h4.
  rewrite pmulr1 pmulrC //=.
  apply/mapP; exists i; done.
  move => ->.

  rewrite h1 //=.
Qed.

Lemma integ_const {A : choiceType} (m : meas A) (c : posrat) :
  integ m (fun _ => c) = mass m * c.
  rewrite /integ; destruct m.
  rewrite -big_distrl //=.
  rewrite /mass /integ //=.
  congr (_ * _).
  apply eq_big.
  done.
  move => i0 _; rewrite pmulr1 //=.
Qed.

(* end integ *)

(* equality lemmas *)

Lemma mbind_eqP {A B : choiceType} (m : meas A) (c1 c2 : A -> meas B) :
  (forall x, x \in support m -> c1 x = c2 x) -> ((x <- m; c1 x) = (x <- m; c2 x)).
  move=> H; apply/measP => f.
  rewrite !integ_mbind; apply integ_eq_fun => x Hx.
  rewrite (H x Hx) //=.
Qed.
 
Lemma prod_dirac_Pr {A B : choiceType} (m : meas (A * B)) a u :
  (forall x, x \in support m -> x.2 = a) ->
  (u = m <$> fst) ->
  m = u ** (ret a).
  intros; subst; apply/measP => f.
  rewrite integ_mprod.
  rewrite integ_mbind.
  apply integ_eq_fun => x Hx.
  rewrite !integ_ret.
 
  rewrite -(H _ Hx); destruct x; done.
Qed.

Lemma mbind_unused {A B : choiceType} (m1 : meas A) (f : meas B) :
  (x <- m1; f) = mscale (mass m1) f.
  apply measP => g; rewrite integ_mbind.
  rewrite integ_const.
  rewrite integ_mscale //=.
Qed.



(* begin support and mass *)

Lemma uniq_support {A : choiceType} (c : meas A) :
  uniq (support c).
  destruct c; elim (andP i) => i1 i2.
  move/andP: i2; elim => i2 i3.
  done.
Qed.

Lemma supportP {A : choiceType} (c : meas A) x :
  (x \in support c) = (integ c (indicator x) != 0).
  apply Bool.eq_true_iff_eq; split => H.
  rewrite /support in H.
  elim (mapP H) => h1 h2 h3.
  rewrite h3.
  rewrite (integ_nubbed_indicator_in c h1).
  destruct c; rewrite //=.
  elim (andP i) => _ /andP; elim => c1 c2.
  apply/contraT; rewrite negbK => hc.
  move/mapP: c1; elim; exists h1; rewrite //=.
  rewrite (eqP hc); done.
  destruct c as [c h]; rewrite //=; elim (andP h); done.
  done.
  apply/mapP; exists (integ c (indicator x), x).
  apply integ_nubbed_indicator_in_l; rewrite //=.
  destruct c as [c h]; rewrite //=; elim (andP h); done.
  done.
Qed.

Lemma support_nil {A : choiceType} : support (mkMeas (nil : PMeas A)) = nil.
  rewrite /support mkMeas_nil //=.
Qed.

Lemma support_ret {A : choiceType} (x : A) :
  support (ret x) = [:: x].
  have: perm_eq (support (ret x)) [:: x].
  apply uniq_perm_eq.
  destruct (ret x).
  elim (andP i) => i1 i2.
  move/andP: i2; elim => i2 i3.
  apply i3.
  done.
  move => y; rewrite supportP integ_ret /Premeas.indicator in_cons in_nil orbF; case (y ==x); done.
  move => H; by apply perm_eq_small.
Qed.

Lemma in_ret {A : choiceType} (x y : A) :
  x \in (support (ret y)) = (x == y).
  rewrite support_ret mem_seq1 //=.
Qed. 


Lemma support_bindE {A B : choiceType} (c : meas A) (d : A -> meas B) :
  support (x <- c; d x) =i flatten [seq (support (d x)) | x <- support c].
  move => x.
  rewrite supportP !integ_mbind integ_neq0.
  apply Bool.eq_true_iff_eq; split.
  move/hasP; elim => a Ha Ha2.
  rewrite integ_neq0 in Ha2.
  move/hasP: Ha2; elim => b Hb.
  rewrite indicator_neq0; move/eqP => ->.
  apply/flattenP; exists (support (d a)).
  apply/mapP; exists a; done.
  done.
  move/flattenP; elim => b.
  move/mapP; elim => a Ha -> Hx.
  apply/hasP; exists a; rewrite //=.
  rewrite integ_neq0; apply/hasP; exists x; rewrite ?indicator_neq0 //=.
Qed.

Lemma support_bindP {A B : choiceType} (c : meas A) (d : A -> meas B) x :
  reflect (exists a, a \in support c /\ x \in support (d a)) (x \in support (x <- c; d x)).
  apply/(iffP idP); rewrite support_bindE.
  move/flattenP; elim => b; move/mapP; elim => a Ha -> Hb.
  exists a; done.

  elim => a; elim => h1 h2; apply/flattenP; exists (support (d a)); rewrite //=.
  apply/mapP; exists a; done.
Qed.

Lemma support_bind_dep {A B : choiceType} (c : meas A) (f : forall x, x \in support c -> meas B) x :
  x \in support (mbind_dep c f) -> exists y (H : y \in support c), x \in support (f y H).
  rewrite /mbind_dep.
  intros.
  move/support_bindP: H; elim => y; elim; intros.
  exists y, H.
  rewrite odflt_depP in H0.
  done.
Qed.

Lemma support_mprodE {A B : choiceType} (m1 : meas A) (m2 : meas B) :
  (support (m1 ** m2)) =i [seq (x,y) | x <- support m1, y <- support m2].
  move => x.
  apply Bool.eq_true_iff_eq; split.
  move/support_bindP; elim => a; elim => Ha.
  move/support_bindP; elim => b; elim => Hb.
  rewrite support_ret mem_seq1; move/eqP => ->.
  apply/allpairsP; exists (a,b); split; rewrite //=.

  move/allpairsP; elim => p; elim => H1 H2 ->.
  apply/support_bindP; exists p.1; split; rewrite //=.
  apply/support_bindP; exists p.2; split; rewrite //=.
  rewrite support_ret mem_seq1 //=.
Qed.

Lemma support_fmap {A B : choiceType} (m1 : meas A) (f : A -> B) :
  support (m1 <$> f) =i map f (support m1).
  move => x;
  apply Bool.eq_true_iff_eq; split.
  move/support_bindP; elim => a [H1 H2].
  apply/mapP; exists a; rewrite //=.
  rewrite support_ret mem_seq1 in H2; rewrite (eqP H2) //=.
  move/mapP; elim  => a [h1 h2].
  apply/support_bindP; exists a; split; rewrite //=.
  rewrite support_ret h2  in_cons eq_refl in_nil //=.
Qed.

Lemma support_mscale_neq0 {A B : choiceType} (m : meas A) (r : posrat) (Hr : r != 0) :
  support (mscale r m) =i support m.
  move => x; rewrite !supportP integ_mscale -pmul0 negb_or Hr andTb //=.
Qed.

Lemma support_mscale_eq0 {A B : choiceType} (m : meas A) :
  support (mscale 0 m) = nil.
  have: perm_eq (support (mscale 0 m)) nil.
  apply uniq_perm_eq.
  apply uniq_support.
  done.
  move => x; rewrite in_nil supportP integ_mscale pmul0r //=.
  move => H; apply perm_eq_small; done.
Qed.  

(* Subdist and dist *)  

Lemma mass_ret {A : choiceType} (c : A) : mass (ret c) = 1.
  rewrite /mass integ_ret //=.
Qed.

Lemma mass_bind_eq {A B : choiceType} (c : meas A) (d : A -> meas B) r :
  mass c = r -> (forall x, x \in support c -> mass (d x) = r) -> mass (x <- c; d x) = r * r.
  move => Hc Hd.
  rewrite /mass integ_mbind.
  have -> : r * r = integ c (fun _ => r).
  by rewrite integ_const Hc //=.
  apply integ_eq_fun => x Hx.
  rewrite /mass in Hd.
  rewrite (Hd x Hx) //=.
Qed.

Lemma mass_bind_le {A B : choiceType} (c : meas A) (d : A -> meas B) r :
  mass c <= r -> (forall x, x \in support c -> mass (d x) <= r) -> mass (x <- c; d x) <= r * r.
  move => Hc Hd.
  rewrite /mass integ_mbind.
  have Hi: integ c (fun _ => r) = (mass c) * r.
  by rewrite integ_const pmulrC //=.

  eapply ple_trans.
  instantiate (1 := integ c (fun _ => r)).
  apply integ_ple_fun => x Hx.
  rewrite /mass in Hd; apply Hd.
  done.
  rewrite integ_const.
  apply ple_mul_r.
  done.
Qed.

Lemma isdist_subisdist {A : choiceType} (c : meas A) : isdist c -> issubdist c.
  rewrite /isdist /issubdist; move/eqP => ->; done.
Qed.

Lemma isdist_ret {A : choiceType} (c : A) : isdist (ret c).
  rewrite /isdist mass_ret //=.
Qed.

Lemma isdist_bind {A B : choiceType} (c : meas A) (d : A -> meas B) :
  isdist c -> (forall x, x \in support c -> isdist (d x)) -> isdist (mbind c d).
  move => h1 h2; rewrite /isdist (mass_bind_eq _ _ 1).
  by rewrite pmulr1.
  move/eqP:  h1; done.
  move => x Hx; move/eqP: (h2 x Hx); done.
Qed.

Lemma isdist_fst {A B : choiceType} (c : meas (A * B)) :
  isdist c -> isdist (c <$> fst).
  intro; rewrite isdist_bind.
  done.
  done.
  intros; rewrite isdist_ret; done.
Qed.

Lemma isdist_snd {A B : choiceType} (c : meas (A * B)) :
  isdist c -> isdist (c <$> snd).
  intro; rewrite isdist_bind.
  done.
  done.
  intros; rewrite isdist_ret; done.
Qed.

Lemma mass_nil {A : choiceType} : mass (mkMeas (nil : PMeas A)) = 0.
  rewrite /mass integ_mkMeas integ_nil //=.
Qed.

Lemma mass_eq0 {A : choiceType} (m : meas A) : (mass m == 0) = (m == mkMeas nil).
  apply Bool.eq_true_iff_eq; split.
  move/eqP.
  move => H; apply/eqP; apply measP => f.
  rewrite integ_mkMeas integ_nil //=.

  apply/eqP/contraT; rewrite /integ.
  rewrite psum_neq0; move/hasP; elim => x Hx.
  rewrite -pmul0; rewrite negb_or; move/andP => [h1 h2].

  have Hc1: x.2 \in support m.
  apply/mapP; exists x; done.

  have Hc2 : x.2 \notin support m.
  rewrite supportP negbK.
  rewrite /mass in H.
  have: integ m (indicator x.2) <= integ m (fun _ => 1).
  apply integ_ple_fun.
  move => y; rewrite /indicator; case (x.2 == y); done.
  move => Hle.
  rewrite -ple_le0.
  eapply ple_trans.
  apply Hle.
  rewrite H; done.
  rewrite Hc1 in Hc2; done.

  move/eqP => ->; rewrite /mass integ_mkMeas integ_nil //=.
Qed.  

Lemma mass_neq0 {A : choiceType} (m : meas A) :
  reflect (exists a, a \in support m) (mass m != 0).
  apply (iffP idP).

  rewrite /mass psum_neq0; move/hasP; elim => x Hx _; exists x.2.
  apply/mapP; exists x; done.

  elim => a Ha.
  rewrite /mass psum_neq0; apply/hasP.
  move/mapP: Ha; elim => x Hx Heq; subst.
  exists x.
  done.
  rewrite pmulr1.
  apply (in_pmeas_neq0 m); done.
Qed.

Lemma mass_neq0_bind {A B : choiceType} (m : meas A) (c : A -> meas B) :
  mass m != 0 -> (forall x, x \in support m -> mass (c x) != 0) -> mass (mbind m c) != 0.
  intros.
  move/mass_neq0: H; elim => a Ha.
  move/mass_neq0: (H0 _ Ha); elim => b Hb.
  rewrite /mass integ_neq0; apply/hasP.
  exists b.
  apply/support_bindP; exists a; split; done.
  done.
Qed.

Lemma mass_bindE {A B : choiceType} (m1 : meas A) (c : A -> meas B) :
  mass (x <- m1; c x) = integ m1 (fun x => mass (c x)).
  rewrite /mass integ_mbind //=.
Qed.

Lemma mass_fmap {A B : choiceType} (m : meas A) (f : A -> B):
  mass (m <$> f) = mass m.
  rewrite mass_bindE /mass.
  apply integ_eq_fun => x Hx; rewrite integ_ret //=.
Qed.


Lemma in_support_ret {A : choiceType} (x : A) y :
  (y \in support (ret x)) = (y == x).
  rewrite support_ret in_cons in_nil orbF //=.
Qed.

(* adding measures together *)

Definition madd {A : choiceType} (m1 m2 : meas A) : meas A :=
  mkMeas ((_pmeas m1) ++ (_pmeas m2)).

Notation "m1 +m m2" := (madd m1 m2) (at level 30).

Lemma integ_madd {A : choiceType} (m1 m2 : meas A) f :
  integ (m1 +m m2) f = integ m1 f + integ m2 f.
  rewrite /madd integ_mkMeas integ_app //=.
Qed.

Lemma madd_bind {A B : choiceType} (m1 m2 : meas A) (c : A -> meas B) :
  (x <- (m1 +m m2); c x) = (x <- m1; c x) +m (x <- m2; c x).
  apply/measP => g.
  rewrite !integ_mbind !integ_madd !integ_mbind //=.
Qed.

Lemma integ_add_f {A : choiceType} (m : meas A) (f1 f2 : A -> posrat) :
  integ m (fun x => f1 x + f2 x) = integ m f1 + integ m f2.
  rewrite /integ.
  have -> : \big[padd/0]_(p <- _pmeas m) (p.1 * (f1 p.2 + f2 p.2))
         = \big[padd/0]_(p <- _pmeas m) ((p.1 * f1 p.2) + (p.1 * f2 p.2)).
  apply eq_big; rewrite //=.
  intros; rewrite pmulrDr //=.
  rewrite big_split //=.
Qed.

Lemma bind_madd {A B : choiceType} (m : meas A) (c1 c2 : A -> meas B) :
  (x <- m; (c1 x) +m (c2 x)) = (x <- m; c1 x) +m (x <- m; c2 x).
  apply/measP => g.
  rewrite !integ_mbind !integ_madd !integ_mbind. 
  have -> : 
  integ m (fun x : A => integ (c1 x +m c2 x) g) =
  integ m (fun x => integ (c1 x) g + integ (c2 x) g).
  apply integ_eq_fun => x Hx; rewrite integ_madd //=.
  rewrite integ_add_f //=.
Qed.

Lemma maddA {A : choiceType} (m1 m2 m3 : meas A) :
  madd m1 (madd m2 m3) = madd (madd m1 m2) m3.
  apply/measP => f; rewrite !integ_madd paddrA //=.
Qed.

Lemma mprod_bind {A B C : choiceType} (ma : meas A) (mb : meas B) (c : B -> meas C) :
  ma ** (mbind mb c) = mbind mb (fun x => ma ** (c x)).
  rewrite mbind_swap mbindA; apply mbind_eqP => x Hx.
  rewrite mbind_swap //=.
Qed.

Definition measE A :=
  (@ret_bind A, @bind_ret A, @mbindA A).

Ltac munder_ l :=
  multimatch goal with
  | |- context [mbind ?c ?f] =>
    erewrite (mbind_eqP _ f _); last first; [intros ? _; l; reflexivity | idtac]; simpl
                                                                             end.

Tactic Notation "munder" tactic(l) :=
  (munder_ l; repeat (munder_ l)).

Lemma integ_filter {A : choiceType} (m : PMeas A) f (p : A -> bool) :
  integ (filter (fun x => p x.2) m) f =
  integ m (fun x => if p x then f x else 0).
  induction m.
  simpl.
  rewrite !integ_nil //=.
  simpl.
  remember (p a.2) as b; destruct b.
  rewrite !integ_cons IHm -Heqb //=.
  rewrite !integ_cons -Heqb pmulr0 padd0r IHm //=.
Qed.

Definition mfilter {A : choiceType} (m : meas A) (p : A -> bool) :=
  mkMeas (filter (fun x => p x.2) (_pmeas m)).

Lemma integ_mfilter {A : choiceType} (m : meas A) p f :
  integ (mfilter m p) f =
  integ m (fun x => if p x then f x else 0).
rewrite /mfilter integ_mkMeas integ_filter //=.
Qed.  

Lemma support_mfilter {A : choiceType} (m : meas A) p x :
  (x \in support (mfilter m p)) = ((x \in support m) && p x).
rewrite supportP integ_mfilter integ_neq0.
case: hasP.
elim => y Hy.
remember (p y) as b; destruct b.
rewrite indicator_neq0; move/eqP => ->.
rewrite Hy -Heqb //=.
done.
move => H.
apply/eqP/contraT; rewrite eq_sym.
rewrite eqbF_neg negbK; move/andP => [h1 h2].
elim H; exists x; rewrite //=.
rewrite h2 /indicator eq_refl //=.
Qed.

Lemma mfilter_disj {A : choiceType} (m : meas A) p :
  m = (mfilter m p) +m (mfilter m (fun x => ~~ p x)).
  apply/measP => f.
  rewrite integ_madd !integ_mfilter -integ_add_f.
  apply integ_eq_fun => x Hx.
  elim (p x).
  rewrite paddr0 //=.
  rewrite padd0r //=.
Qed.



Definition Pr {A : choiceType} (m : meas A) (p : A -> bool) := integ m (fun x => if p x then 1 else 0).

Lemma integ_eq0 {A : choiceType} (m : meas A) (f : A -> posrat) :
  (integ m f == 0) = (all (fun x => f x == 0) (support m)).
  rewrite -(negbK (integ m f == 0)).
  rewrite integ_neq0. 
  rewrite -all_predC.
  apply eq_in_all => x Hx.
  rewrite /predC //=.
  rewrite negbK //=.
Qed.


Lemma Pr_lem {A : choiceType} (m : meas A) (p : A -> bool) :
  Pr m p = 0 ->
  Pr m (fun x => ~~ p x) = 0 ->
  m = mkMeas nil.
  move => h1 h2.
  apply/eqP.
  rewrite -mass_eq0.
  apply/contraT.
  move/mass_neq0; elim => x Hx.
  remember (p x) as px; destruct px.
  move: h1; rewrite /Pr.
  move/eqP; rewrite integ_eq0.
  move/allP/(_ x Hx); rewrite -Heqpx.
  done.
  move: h2; rewrite /Pr; move/eqP; rewrite integ_eq0; move/allP/(_ x Hx); rewrite -Heqpx //=.
Qed.

Lemma Pr_0P {A : choiceType} (m : meas A) (p : A -> bool) :
  Pr m p == 0 =
  all (fun x => ~~ p x) (support m).
  rewrite /Pr.
  rewrite integ_eq0.
  apply eq_all => x.
  destruct (p x); done.
Qed.

Lemma Pr_eq0 {A : choiceType} (m : meas A) a :
  Pr m (fun y => y == a) == 0 = (a \notin support m).
  rewrite /Pr.
  have -> : integ m (fun x : A => if x == a then 1 else 0) =
        integ m (indicator a).
    apply integ_eq_fun => x Hx; rewrite /indicator; rewrite eq_sym; destruct (a == x); done.
  rewrite supportP negbK //=.
Qed.

Lemma Pr_eq_n0 {A : choiceType} (m : meas A) a :
  (Pr m (fun y => y == a) != 0) = (a \in support m).
  rewrite Pr_eq0 negbK //=.
Qed.

Lemma Pr_eq_in {A : choiceType} (m : meas A) x :
  x \in _pmeas m -> Pr m (fun y => y == x.2) = x.1.
  intro; rewrite /Pr.
  have -> : integ m (fun x0 : A => if x0 == x.2 then 1 else 0) =
        integ m (indicator x.2).
  rewrite /indicator. 
  apply integ_eq_fun => y Hy.
  rewrite eq_sym //=.
  rewrite integ_nubbed_indicator_in.
  done.
  destruct m as [m Hm]; elim (andP Hm); done.
  done.
Qed.

Lemma Pr_eq_val {A : choiceType} (m : meas A) a :
  (Pr m (fun y => y == a) != 0) <-> (exists x, [/\ x \in _pmeas m, Pr m (fun y => y == a) = x.1 & x.2 = a]).
  rewrite Pr_eq0 negbK; split.
  move/mapP; elim => x Hx Hx2.
  exists x; split; rewrite //=.
  subst.
  rewrite (Pr_eq_in m x) //=.
  elim => x; elim => h1 h2 h3; subst.
  apply/mapP; exists x; done.
Qed.

Lemma Pr_eq_mbind {A B :  choiceType} (m: meas A) (c : A -> meas B) a :
  Pr (mbind m c) (fun y => y == a) =
  integ m (fun x => Pr (c x) (fun y => y == a)).
  rewrite /Pr integ_mbind //=.
Qed.

Lemma Pr_fmap {A B : choiceType} (m : meas A) (f : A -> B) p :
  Pr (m <$> f) p = Pr m (fun x => p (f x)).
  rewrite /Pr integ_mbind.
  apply integ_eq_fun => x Hx.
  rewrite integ_ret //=.
Qed.


Definition mnormalize {A : choiceType} (m : meas A) := mscale (1 / mass m) m.
Definition mcombine {A  : choiceType} (ms : seq (meas A)) :=
  mkMeas (map (fun m => (mass m, mnormalize m)) ms).

Lemma mcombineE {A : choiceType} (ms : seq (meas A)) :
  foldr madd (mkMeas nil) ms = mjoin (mcombine ms).
  unlock mkMeas.
  induction ms.
  simpl.
  rewrite /mcombine //=.
  rewrite /mjoin //=.
  rewrite mkMeas_nil.
  rewrite /msum //=; unlock mkMeas; done.
  rewrite /mcombine //= -/(mcombine ms).
  rewrite IHms.
  apply measP => f.
  rewrite integ_madd !integ_mjoin integ_mkMeas integ_cons.
  rewrite /mcombine integ_mkMeas.
  congr (_ + _).
have H : forall (m : meas A), integ m f = mass m * integ (mscale (1 / mass m) m) f.
move => m.
case (eqVneq (mass m) 0).
move/eqP; rewrite mass_eq0; move/eqP => ->.
rewrite integ_mkMeas mass_nil pmul0r integ_nil //=.
move => H.
rewrite integ_mscale pmulrA pmul1r pdivK.
rewrite pmul1r //=.
done.
rewrite -H //=.
Qed.

Lemma support_mkMeas {A : choiceType} (l : seq (posrat * A)) x :
  (x \in support (mkMeas l)) -> (x \in map snd l).
  induction l.
  rewrite supportP integ_mkMeas integ_nil //=.
  simpl.
  rewrite supportP.
  rewrite integ_mkMeas integ_cons.
  rewrite supportP in IHl.
  rewrite -padd0 negb_and; move/orP; elim.
  rewrite -pmul0 negb_or; move/andP; elim.
  move => _.
  rewrite indicator_neq0; move/eqP => ->.
  rewrite in_cons eq_refl //=.
  move => H; rewrite in_cons IHl.
  rewrite orbT //=.
  rewrite integ_mkMeas //=.
Qed.

Lemma madd_nil {A : choiceType} (m : meas A) :
  m +m mkMeas nil = m.
  apply/measP => f; rewrite integ_madd integ_mkMeas integ_nil paddr0 //=.
Qed.

Lemma msplit {A : choiceType} (m : meas A) p :
  m = mjoin (mcombine (mfilter m p :: mfilter m (fun x => ~~ p x) :: nil)).
rewrite {1}(mfilter_disj m p) -mcombineE //= madd_nil //=.
Qed.

Definition Punif_on {A : choiceType} (l : seq A) : PMeas A :=
  (map (fun x => (1 / (posrat_of_nat (size l)), x)) l).

Lemma integ_Punif {A : choiceType} (l : seq A) f :
  integ (Punif_on l) f =
  (1 / (posrat_of_nat (size l))) * \big[padd/0]_(x <- l) f x.
  rewrite /Punif_on /integ.
  rewrite big_map //.
  rewrite big_distrr.
  apply eq_big.
  done.
  move => i _.
  done.
Qed.

Lemma integ_map {A : choiceType} (m : PMeas A) f (h : A -> posrat) :
  integ (map (fun x => (x.1, f x.2)) m) h = integ m (fun x => h (f x)).
  rewrite /integ big_map //=.
Qed.

Lemma punif_on_bij {A : choiceType} (l : seq A) (f : A -> A) (h : A -> posrat) :
  perm_eq l (map f l) -> integ (Punif_on l) h = integ (map (fun x => (x.1, f x.2)) (Punif_on l)) h.
  move => H.
  rewrite integ_Punif integ_map integ_Punif.
  congr (_ * _).
  rewrite (eq_big_perm _ H) big_map.
  done.
Qed.

Definition munif_on {A : choiceType} (s : seq A) :=
  mkMeas (Punif_on s).

Definition munif (A : finType) : meas A := munif_on (enum A).

Lemma integ_munif_on {A : choiceType} (s : seq A) f :
  integ (munif_on s) f =
  (1 / (posrat_of_nat (size s))) * \big[padd/0]_(x <- s) f x.
  rewrite /munif_on integ_mkMeas integ_Punif //=.
Qed.

Lemma munif_on_bij {A : choiceType} (s : seq A) (f : A -> A) g :
  uniq s ->
  cancel f g ->
  cancel g f ->
  (forall x, x \in s -> g x \in s) ->
  (forall x, x \in s -> f x \in s) ->
  munif_on s = munif_on s <$> f.
  intros.
  apply/measP => h.
  rewrite integ_mbind integ_munif_on.
  have: (perm_eq s (map f s)).
    apply uniq_perm_eq.
    done.
    rewrite map_inj_uniq.
    done.
    apply bij_inj.
    econstructor.
    apply H0; done.
    done.
    move => x.
    caseOn (x \in s) => Hx.
    rewrite Hx; symmetry; apply/mapP; exists (g x).
    apply H2; done.
    rewrite H1; done.
    rewrite (negbTE Hx); symmetry; apply/mapP; elim.
    move => a ha ha'.
    rewrite ha' in Hx.
    move: (H3 _ ha); rewrite (negbTE Hx); done.

  move => P.
  rewrite (eq_big_perm _ P) integ_munif_on.
  congr (_ * _).
  rewrite big_map.
  apply eq_big; rewrite //=.
  move => i _.
  rewrite integ_ret //=.
Qed.

Lemma munif_bij {A : finType} (f : A -> A) :
  bijective f ->
  munif A = munif A <$> f.
  case => g H1 H2.
  rewrite /munif {1}(munif_on_bij (enum A) f g); rewrite //=.
  apply enum_uniq.
  simpl.
  intros; rewrite mem_enum; done.
  intros; rewrite mem_enum; done.
Qed.

Lemma isdist_munif {A : finType} :
  #|A| != 0%N ->
       isdist (munif A).
  rewrite /isdist => H.
  rewrite /mass /munif integ_mkMeas /Punif_on.
  rewrite /integ big_map.
  simpl.
  rewrite big_const_seq.
  have -> : count xpredT (enum A) = #|A|.
    rewrite count_predT cardE //=.

  rewrite pmulr1 -cardE.
  remember (#|A|) as n; rewrite -Heqn; clear Heqn A.
  rewrite iter_padd padd0r.
  induction n.
  done.
  rewrite pmulrA pmulr1.
  rewrite pdivK.
  done.
  apply posrat_of_nat_neq0.
Qed.
  

Lemma mscale_1 {A : choiceType} (m : meas A) : mscale 1 m = m.
  apply/measP => f.
  rewrite integ_mscale pmul1r //=.
Qed.

Lemma mbind_irrel {A B : choiceType} (m : meas A) (f : A -> meas B) (m' : meas B) :
  isdist m ->
  (forall x, f x = m') ->
  (x <- m; f x) = m'.
  intros.
  have: exists x, x \in support m.
  apply/mass_neq0.
  rewrite (eqP H); done.
  elim => x Hx.
  have: (x <- m; f x) = (a <- m; f x).
  apply mbind_eqP => a Ha.
  rewrite !H0 //=.
  move => ->.
  rewrite mbind_unused.
  rewrite (eqP H).
  rewrite mscale_1 H0 //=.
Qed.

Lemma integ_supportsum {A : choiceType} (m : meas A) f :
  integ m f = \big[padd/0]_(x <- support m) (Pr m (fun y => y == x) * f x).
  rewrite /integ; rewrite big_map. 
  rewrite (big_seq_cond predT (fun p => Pr m (eq_op^~ p.2) * f p.2)).
  rewrite (big_seq_cond predT (fun p => p.1 * f p.2)).
  apply eq_big; rewrite //=.
  move => x ; rewrite andbT => Hx.
  rewrite (Pr_eq_in m x); done.
Qed.

Lemma measPI {A : choiceType} (m m' : meas A) :
  (forall x, Pr m (fun y => y == x) = Pr m' (fun y => y == x)) <->
  m = m'.
  split.
  intro; apply/measP => f.
  rewrite !integ_supportsum.
  have Hp: perm_eq (support m) (support m').
    apply uniq_perm_eq.
    apply uniq_support.
    apply uniq_support.
    move => x.
    rewrite -!Pr_eq_n0.
    rewrite H; done.
  have -> : 
  \big[padd/0]_(x <- support m) (Pr m (eq_op^~ x) * f x) =
  \big[padd/0]_(x <- support m) (Pr m' (eq_op^~ x) * f x).
    apply eq_big; rewrite //=.
    move => x _.
    rewrite H; done.
 apply eq_big_perm.
 done.
 move => ->.
 done.
Qed.

Definition meas_of_fn {A : choiceType} (s : seq A) (f : A -> posrat) :=
  mkMeas (map (fun x => (f x, x)) (undup s)).

Lemma integ_meas_of_fn {A : choiceType} (s : seq A) f h :
  integ (meas_of_fn s f) h = \big[padd/0]_(x <- undup s) ((f x) * (h x)).
  rewrite /meas_of_fn.
  rewrite integ_mkMeas /integ big_map; apply eq_big; rewrite //=.
Qed.

Lemma Pr_eq_meas_of_fn {A : choiceType} (s : seq A) f x :
  Pr (meas_of_fn s f) (fun y => y == x) = (if x \in s then f x else 0).
  rewrite /Pr integ_meas_of_fn.
  induction s.
  rewrite big_nil in_nil //=.
  simpl.
  caseOn (a \in s) => h.
  rewrite h.
  rewrite IHs.
  have -> //= : x \in s = (x \in a :: s).
    rewrite in_cons.
    caseOn (x == a) => heq.
    rewrite (eqP heq) h orbT //=.
    rewrite (negbTE heq) orFb //=.

  rewrite (negbTE h) big_cons in_cons.
  rewrite IHs.
  caseOn (x == a).
  move/eqP => ->; rewrite eq_refl //=.
  rewrite (negbTE h) pmulr1 paddr0 //=.
  move => heq; rewrite (negbTE heq) eq_sym (negbTE heq) pmulr0 padd0r //=.
Qed.

(* pr [ y = b | x = a] = pr [x = a /\ y = b] / pr [x = a] *)
Definition joint_cond_r {A B : choiceType} (m : meas (A * B)) (a : A) : meas B :=
  meas_of_fn ((map snd (support m))) (fun b => Pr m (fun p => p == (a,b)) / Pr m (fun p => p.1 == a)).

Lemma joint_cond_r_prP {A B : choiceType} (m : meas (A * B)) (a : A) b :
  Pr (joint_cond_r m a) (fun y => y == b) = Pr m (fun y => y == (a,b)) / Pr m (fun p => p.1 == a).
  rewrite Pr_eq_meas_of_fn.
  caseOn (b \in (map snd (support m))).
  move => h; rewrite h.
  done.
  move => h; rewrite (negbTE h).
  have: Pr m (eq_op^~ (a,b)) == 0.
  rewrite Pr_eq0; apply/contraT; rewrite negbK => hc.
  have: b \in (map snd (support m)).
  apply/mapP; exists (a,b).
  done.
  done.
  rewrite (negbTE h) //=.
  move/eqP => ->; rewrite pmul0r //=.
Qed.

Lemma notin_eq_nil {A : eqType} (x : seq A) :
  reflect (forall a, a \notin x) (x == [::]).
  apply/(iffP idP).
  move/eqP => ->.
  move => a; rewrite in_nil //=.
  intro.
  induction x.
  done.
  move: (H a); rewrite in_cons eq_refl negb_or andFb; done.
Qed.

Lemma joint_cond_r_support {A B : choiceType} (m : meas (A * B)) a :
  if a \in map fst (support m) then
    perm_eq (support (joint_cond_r m a)) (undup (map snd (filter (fun p => p.1 == a) (support m))))
  else
    support (joint_cond_r m a) == nil.
  caseOn (a \in map fst (support m)) => h.
  rewrite h.
  apply uniq_perm_eq.
  apply uniq_support.
  apply undup_uniq.
  move => x.
  rewrite -Pr_eq_n0 joint_cond_r_prP mem_undup.
  rewrite -pmul0 negb_or.
  apply Bool.eq_true_iff_eq; split.
  move/andP; elim => h1 h2.
  apply/mapP; exists (a,x).
  rewrite mem_filter; apply/andP; split; rewrite //=.
  rewrite -Pr_eq_n0; done.
  done.
  move/mapP; elim => y Hy1 Hy2; subst.
  apply/andP; split.
  rewrite Pr_eq_n0.
  rewrite mem_filter in Hy1; elim (andP Hy1); move/eqP => <-.
  destruct y; done.
  apply pinv_neq0.
  rewrite /Pr integ_neq0; apply/hasP; exists y.
  rewrite mem_filter in Hy1; elim (andP Hy1); done.
  rewrite mem_filter in Hy1; elim (andP Hy1) => ->; done.
  rewrite (negbTE h).
  apply/notin_eq_nil => x.
  rewrite -Pr_eq0 joint_cond_r_prP -pmul0.
  apply/orP; right.
  have -> : Pr m (fun p : prod_choiceType A B => p.1 == a) = 0.
    rewrite /Pr; apply/eqP; rewrite integ_eq0; apply/allP => p Hp.
    caseOn (p.1 == a).
    move => H.
    move/mapP: h; elim; exists p.
    done.
    rewrite (eqP H); done.
    move => h2; rewrite (negbTE h2); done.
    rewrite pinv_0 //=.
Qed.

Lemma mass_pr_eq_sum {A : choiceType} (m : meas A) :
  \big[padd/0]_(x <- undup (support m)) (Pr m (fun y => y == x)) = 1 -> isdist m.
  rewrite /isdist /mass /integ.
  rewrite (undup_id).
  rewrite big_map.
  intro H.
  rewrite -{2}H; apply/eqP.
  rewrite big_seq_cond.
  rewrite (big_seq_cond predT).
  apply eq_big; rewrite //=.
  move => i h.
  rewrite Pr_eq_in.
  rewrite pmulr1 //=.
  rewrite andbT in h; done.
  apply uniq_support.
Qed.

(*
Lemma joint_cond_r_isdist {A B : choiceType} (m : meas A * B) (a : A) :
  isdist m -> isdist (joint_cond_r m a).
  intro.
  apply mass_pr_eq_sum.
  move: (joint_cond_r_support m a).
  caseOn (a \in map fst (support m)) => h.
  rewrite h => h2.
  rewrite undup_id; last by apply uniq_support.
  rewrite (eq_big_perm _ h2).
  move
  
  SearchAbout undup.
  SearchAbout perm_eq.
  caseOn
  rewrite undup_id; last by apply uniq_support.
  rewrite /isdist /mass.
  rewrite -big_isdistrl; simpl.
  rewrite -big_isdistrl; simpl.
  SearchAbout (uniq (map _
  SearchAbout undup.
  have -> : 
    \big[padd/0]_(i <- undup [seq i.2 | i <- support m]) Pr m (eq_op^~ (a, i)) =
    \big[padd/0]_(i <- undup (support m)) Pr m (fun y => y == (a, i.2)).
  admit.
  rewrite undup_id.
  have -> :
*)
    
  



Lemma joint_split_l {A B : choiceType} (m : meas (A * B)) :
  exists m' f,
    [/\ m = (a <- m'; b <- f a; ret (a,b)) & mass m' = mass m].
  exists (m <$> fst); exists (fun x => joint_cond_r m x).
  split; last first.
  rewrite mass_fmap //=.
  apply/measPI => x.
  rewrite Pr_eq_mbind.
  symmetry; etransitivity.
  apply integ_eq_fun => a Ha; rewrite Pr_fmap.
  have -> : Pr (joint_cond_r m a) (fun y : B => (a, y) == x) =
            (if a == x.1 then Pr (joint_cond_r m a) (fun y => y == x.2) else 0).
    caseOn (a == x.1) => Ha2.
    rewrite Ha2; rewrite /Pr; apply integ_eq_fun => y Hy.
    rewrite (eqP Ha2); destruct x; simpl; rewrite /eq_op //= eq_refl andTb; done.
    rewrite (negbTE Ha2).
    rewrite /Pr; apply/eqP; rewrite integ_eq0; apply/allP => y Hy.
    rewrite /eq_op //= (negbTE Ha2) andFb //=.
  rewrite joint_cond_r_prP; done.

  caseOn (x \in support m).
  move/mapP; elim => p Hp1 Hp2; subst; simpl in *.
  rewrite Pr_eq_in; rewrite //=.
  rewrite integ_mbind; etransitivity.
  apply integ_eq_fun => x Hx; rewrite integ_ret //=.
  destruct p as [p [a b]]; simpl in *.
  rewrite integ_supportsum.
  have -> : 
    \big[padd/0]_(x <- support m)
        (Pr m (eq_op^~ x) *
         (if x.1 == a then Pr m (eq_op^~ (x.1, b)) / Pr m (fun p0 : A * B => p0.1 == x.1) else 0)) =
    \big[padd/0]_(x <- support m)
     if x.1 == a then
       Pr m (eq_op^~ x) * p / Pr m (fun p0 => p0.1 == a) else 0.
      apply eq_big; rewrite //=.
      move => i _.
      caseOn (i.1 == a) => Hi.
        rewrite (eqP Hi) eq_refl //=.
        rewrite pmulrA.
        congr (_ * _).
        have -> : Pr m (eq_op^~ (p,(a,b)).2) = p by rewrite Pr_eq_in //=.
        done.
        rewrite (negbTE Hi) pmulr0 //=.

  have -> :
    (\big[padd/0]_(x <- support m)
     if x.1 == a then
       Pr m (eq_op^~ x) * p / Pr m (fun p0 => p0.1 == a) else 0) =
    p / Pr m (fun p0 => p0.1 == a) * (\big[padd/0]_(x <- support m) if x.1 == a then Pr m (eq_op^~ x) else 0).                                                             
  rewrite big_distrr; apply eq_big; rewrite //=.
  move => i _.
  caseOn (i.1 == a) => Hi.
    rewrite (eqP Hi) eq_refl //=.
    rewrite pdiv_pmul_num pmulrC //=.
    rewrite (negbTE Hi) pmulr0 //=.

  have -> : \big[padd/0]_(x <- support m) (if x.1 == a then Pr m (eq_op^~ x) else 0) =
        Pr m (fun p0 => p0.1 == a).
  rewrite /Pr; simpl.
  rewrite integ_supportsum.
  apply eq_big; rewrite //=. 
  move => i _.
  caseOn (i.1 == a) => Hi.
  rewrite (eqP Hi) eq_refl.
  rewrite pmulr1 /Pr; done.
  rewrite (negbTE Hi) pmulr0 //=.

  rewrite -pmulrA.
  simpl.
  rewrite (pmulrC (pinv _)).
  rewrite pdivK.
  rewrite pmulr1 //=.
  rewrite /Pr.
  rewrite integ_neq0; apply/hasP; exists (a,b).
  apply/mapP; exists (p, (a,b)); done.
  rewrite eq_refl //=.

  move => Hn.
  rewrite -Pr_eq0 in Hn; rewrite (eqP Hn); rewrite Pr_eq0 in Hn.
  apply/eqP.
  rewrite integ_eq0; apply/allP => y Hy.
  caseOn (y == x.1) => Hy2.
  rewrite (eqP Hy2) eq_refl.
  have: Pr m (eq_op^~ (x.1, x.2)) == 0.
  rewrite Pr_eq0; destruct x; done.
  move/eqP => ->.
  rewrite pmul0r //=.
  rewrite (negbTE Hy2) //=.
Qed.

Definition swap {A B} (x : A * B) := (x.2, x.1).

Lemma joint_split_r {A B : choiceType} (m : meas (A * B)) :
  exists m' f,
    [/\ m = (b <- m'; a <- f b; ret (a,b)) & mass m' = mass m].

  have: m = (m <$> swap) <$> swap.
    rewrite -(bind_ret m) !mbindA; apply mbind_eqP => x Hx; rewrite !measE //=.
    destruct x; done.
 
  generalize (m <$> swap) => m0 Hm0.
  move: (joint_split_l m0) => Hm02.
  destruct Hm02 as [m' [f Hf]].
  exists m'; exists f.
  destruct Hf; subst; split.
  rewrite measE; apply mbind_eqP => x Hx; rewrite measE; munder (rewrite measE); done.
  done.

  rewrite mass_fmap; done.
Qed.

Lemma joint_split_mid {A B C : choiceType} (m : meas (A * B * C)) :
  exists m' f,
    [/\ m = (b <- m'; p <- f b; ret (p.1, b, p.2)) &
        mass m' = mass m].
  have -> : m = (p <- m; ret (p.1.2, (p.1.1, p.2))) <$> (fun p => ((p.2.1, p.1), p.2.2)).
  rewrite -(bind_ret m) !mbindA; apply mbind_eqP => x Hx; rewrite !measE //=.
  destruct x as [[x0 x1] x2]; done.
  move: (joint_split_l (p <- m; ret (p.1.2, (p.1.1, p.2)))).
  elim => m'; elim => f Hf.
  exists m'; exists f; split.
  destruct Hf.
  rewrite H !measE.
  munder (rewrite measE; munder (rewrite measE)).
  done.

  destruct Hf.
  rewrite mass_fmap; done.
Qed.

Lemma joint_factor_mid {A B C : choiceType} (m : meas (A * B * C)) :
  exists m' f,
    [/\ m = (p <- m'; b <- f p; ret (p.1, b, p.2)) &
       mass m' = mass m].
  have -> : m = (p <- m; ret ((p.1.1, p.2), p.1.2)) <$> (fun p => (p.1.1, p.2, p.1.2)).
  rewrite -(bind_ret m) !mbindA; apply mbind_eqP => x Hx; rewrite !measE //=.
  destruct x as [[x0 x1] x2]; done.
  move: (joint_split_l (p <- m; ret (p.1.1, p.2, p.1.2))).
  elim => m'; elim => f Hf; exists m'; exists f; split.
  destruct Hf as [Hf H].
  rewrite Hf !measE; munder (rewrite measE; munder (rewrite measE)); done.
  done.

  rewrite mass_fmap; destruct Hf; done.
Qed.

Lemma support_case {A : choiceType} (m : meas A) :
  (m = mkMeas nil) \/ (exists a, a \in support m).
caseOn (mass m == 0).
rewrite mass_eq0; move/eqP => ->; left; done.
move/mass_neq0; elim => a Ha; right; exists a; done.
Qed.


  Ltac msimp :=
   repeat ( (rewrite !measE) || (munder (rewrite !measE)) || (munder (munder (rewrite !measE))) || (munder (munder (munder (rewrite !measE))))).

  Lemma mbind_nil {A B : choiceType} (f : A -> meas B) :
    (mbind (mkMeas nil) f) = mkMeas nil.
    apply/measP => h; rewrite integ_mbind !integ_mkMeas !integ_nil //=.
  Qed.

Lemma constant_rP {A A' B : choiceType} (def : B) (m : meas (A' * B)) (m' : meas (A * B)) :
  mass m != 0 -> mass m' != 0 -> 
  reflect (exists S S' x, [/\ m = S ** ret x & m' = S' ** ret x]) (all (fun x => all (fun y => x.2 == y.2) (support m')) (support m)).
  intros;
  apply/(iffP idP); move/mass_neq0: H; elim => a Ha; move/mass_neq0: H0; elim => b Hb.
  intro; exists (m <$> fst); exists (m' <$> fst); exists a.2; split; msimp.
    rewrite -(bind_ret m) !mbindA; apply mbind_eqP => x Hx; msimp.
    have -> : a.2 = x.2.
    move/eqP: (allP (allP H _ Hx) _ Hb).
    move/eqP: (allP (allP H _ Ha) _ Hb).
    move => <- -> //=.
    destruct x; done.

    rewrite -(bind_ret m') !mbindA; apply mbind_eqP => x Hx; msimp.
    have -> : a.2 = x.2.
    move/eqP: (allP (allP H _ Ha) _ Hx).
    move/eqP: (allP (allP H _ Ha) _ Hb).
    move => -> //=; destruct x; done.
    destruct x; done.

  elim => s; elim => S'; elim => x; elim => -> ->; apply/allP => y.
  move/support_bindP; elim => Y; elim => HY.
  msimp; rewrite in_ret; move/eqP => ->.
  apply/allP => x0; move/support_bindP; elim => X; elim => HX; rewrite in_ret; move/eqP ->; done.
Qed.

Lemma isdist_fmap {A B : choiceType} (m: meas A) (f : A -> B) :
  isdist (m <$> f) = isdist (m).
  rewrite /isdist mass_fmap //=.
Qed.

Lemma mass_mprod {A B : choiceType} (m : meas A) (m' : meas B) :
  mass (m ** m') = mass m * mass m'.
  rewrite mass_bindE.
  etransitivity.
  apply integ_eq_fun => x Hx.
  rewrite mass_fmap //=.
  rewrite /mass /integ -big_distrl //=.
  congr (_ * _).
  apply eq_big ; rewrite //=.
  intros; rewrite pmulr1 //=.
Qed.

Section DistribDef.
  Variables (A : choiceType).
  Structure Distrib : Type :=
    {
      _dval :> meas A;
      _ : isdist _dval
    }.
  Definition distrib_of (_ : phant A) := Distrib.
End DistribDef.

Arguments _dval [A].
Identity Coercion type_of_distrib : distrib_of >-> Distrib.
Notation "{dist T }" := (@distrib_of _ (Phant T)) (format "{dist  T }") : type_scope.

Canonical dist_subType {A : choiceType} := Eval hnf in [subType for (@_dval A)].
Definition distEqmix {A : choiceType} := Eval hnf in [eqMixin of {dist A} by <:].
Canonical distEqtype {A : choiceType} := Eval hnf in EqType {dist A} (distEqmix).
Definition distChoicemix {A : choiceType} := Eval hnf in [choiceMixin of {dist A} by <: ].
Canonical distChoicetype {A : choiceType}:= Eval hnf in ChoiceType {dist A} (distChoicemix).
Definition distCountmix {A : countType} := Eval hnf in [countMixin of {dist A} by <: ].
Canonical distCountType {A : countType} := Eval hnf in CountType {dist A} (distCountmix).

Lemma dist_isdist {A : choiceType} (x : {dist A}) : isdist x.
  by destruct x.
Qed.

Check Build_Distrib.

Section CanonicalDist.
  Variables (A B : choiceType).
  Lemma fmap_distP (x : {dist A}) (f : A -> B) : isdist (x <$> f).
    apply isdist_bind.
    apply dist_isdist.
    intros; apply isdist_ret.
  Qed.

  Canonical dist_ret (x : A) : {dist A} :=
    Build_Distrib A (ret x) (isdist_ret x).

Lemma dist_bindP (m : {dist A}) (f : A -> {dist B}) : isdist (x <- m; f x).
  apply isdist_bind.
  apply dist_isdist.
  intros; apply dist_isdist.
Qed.

Canonical bind_dist (m : {dist A}) (f : A -> {dist B}) : {dist B} :=
  Build_Distrib B (x <- m; f x) (dist_bindP m f).

  Canonical fmap_dist (x : {dist A}) (f : A -> B) : {dist B} :=
    Build_Distrib B (x <$> f) (fmap_distP x f).
  SearchAbout munif.
End CanonicalDist.


Definition distrib {A : choiceType} (d : {dist A}) (mkD : isdist d -> {dist A}) : {dist A} :=
  mkD (let: Build_Distrib _ tP := d return isdist d in tP).


Notation "[ 'dist' 'of' d ]" := (distrib _ (fun sP => @Build_Distrib _ d sP))
  (at level 0, format "[ 'dist'  'of'  d ]") : form_scope.

  Definition mkDist {A : choiceType} (m : meas A) (p : isdist m) := @Build_Distrib A m p.

  Definition liftR {A B C : choiceType} (R : C -> meas A -> meas B -> bool) (mu : meas (A * C)) (eta : meas (B * C)) :=
    all (fun x => all (fun y => x.2 == y.2) (support mu)) (support eta) &&
        all (fun p => R p (mu <$> fst) (eta <$> fst)) (support (mu <$> snd)).

  Lemma liftRP {A B C : choiceType} `{Inhabited C} (R : C -> meas A -> meas B -> bool) (mu : meas (A * C)) (eta : meas (B * C)) : mass mu != 0 -> mass eta != 0 ->
    reflect (exists S S' t, [/\ mu = S ** ret t, eta = S' ** ret t & R t S S']) (liftR R mu eta).
    move => hmu heta.
    apply/(iffP idP).
    move/andP; elim.
    move/constant_rP.
    move/(_ witness heta hmu).
    elim => S; elim => S'; elim => t; elim => heq1 heq2; subst => HR.
    exists S'; exists S; exists t; split.
    done.
    done.

    move/allP: HR.
    move/(_ t); msimp.
    rewrite mbind_unused.
    rewrite support_mscale_neq0.
    rewrite in_ret; move/(_ (eq_refl _)).
    done.
    done.
    rewrite mass_mprod mass_ret pmulr1 in hmu; done.


    elim => S; elim => S'; elim => t; elim => heq1 heq2 HR.
    subst.
    apply/andP; split.
    apply/allP => x.
    move/support_bindP; elim => a; elim => Ha.
    msimp; rewrite in_ret; move/eqP => ->.
    apply/allP => y.
    move/support_bindP; elim => b; elim => Hb.
    rewrite in_ret; move/eqP => ->.
    done.


    apply/allP => x.
    msimp.
    rewrite mbind_unused.
    rewrite support_mscale_neq0.
    rewrite in_ret; move/eqP => ->.
    done.
    done.
    rewrite mass_mprod mass_ret pmulr1 //= in hmu.
  Qed.
 
Definition liftO {A B : choiceType} `{Inhabited A} `{Inhabited B} (R : meas A -> meas B -> bool) (mu : meas (option A)) (eta : meas (option B)) :=
  [&& all isSome (support mu), all isSome (support eta) &
  R (mu <$> fun x => match x with | Some x => x | None => witness end)
    (eta <$> fun x => match x with | Some x => x | None => witness end)] ||
  [&& mu == ret None & eta == ret None].

Lemma liftOP {A B : choiceType} `{Inhabited A} `{Inhabited B} (R : meas A -> meas B -> bool) mu eta :
  reflect ((exists S S', [/\  mu = S <$> Some, eta = S' <$> Some & R S S']) \/ [/\ mu = ret None & eta = ret None]) (liftO R mu eta).
  apply (iffP idP).
  move/orP; elim.
  move/and3P; elim => h1 h2 h3; left.
  exists (p <- mu; match p with | Some m => ret m | None => ret witness end).
  exists (p <- eta; match p with | Some m => ret m | None => ret witness end); split.

  rewrite -(bind_ret mu) !mbindA; apply mbind_eqP => x Hx; msimp.
  move: (allP h1 _ Hx) => Hxs.
  destruct x; [msimp ; done | done].

  rewrite -(bind_ret eta) !mbindA; apply mbind_eqP => x Hx; msimp.
  move: (allP h2 _ Hx) => Hxs.
  destruct x; [msimp ; done | done].

  have -> :
    (p <- mu; match p with
              | Some m => ret m
              | None => ret witness 
              end) =
    (x <- mu; ret match x with
                       | Some x0 => x0
                       | None => witness
                       end).
  apply mbind_eqP => x Hx; destruct x; done.
  have -> :
    (p <- eta; match p with
              | Some m => ret m
              | None => ret witness
              end) =
    (x <- eta; ret match x with
                       | Some x0 => x0
                       | None => witness
                       end).
  apply mbind_eqP => x Hx; destruct x; done.

  done.
  move/andP; elim => /eqP -> /eqP ->; right; split; done.

  elim.
  elim => S; elim => S'; elim => h1 h2 h3; subst.
  apply/orP; left; apply/and3P; split.
  apply/allP => x; move/support_bindP; elim => xa; elim => Hxa.
  rewrite in_ret; move/eqP => ->; done.
  apply/allP => x; move/support_bindP; elim => xa; elim => Hxa.
  rewrite in_ret; move/eqP => ->; done.

  msimp; done.

  elim => -> ->; apply/orP; right; rewrite !eq_refl //=.
Qed.

Lemma liftOP_fmap_some {A B : choiceType} `{Inhabited A} `{Inhabited B} (R : meas A -> meas B -> bool) mu eta :
  R mu eta = (liftO R (mu <$> Some) (eta <$> some)).
  rewrite /liftO.
  msimp.
  have h : forall m, (all isSome (support (m <$> Some))).
    move => t m; apply/allP => x; move/support_bindP; elim => a; elim => _; rewrite in_ret; move/eqP => ->; done.
   rewrite !h //=.
  have h2 : forall m, (m <$> Some == (ret None)) = false.
    move => t m.
    apply/eqP.
    apply/eqP.
    apply/contraT; rewrite negbK; move/eqP => hc.
    have: None \in support (m <$> Some).
    rewrite hc in_ret //=.
    move/support_bindP; elim => a; elim => _; rewrite in_ret //=.
    rewrite !h2 //= orbF //=.
Qed.

Lemma liftOP_none {A B : choiceType} `{Inhabited A}`{Inhabited B} (R : meas A -> meas B -> bool) :
  liftO R (ret None) (ret None).
  apply/orP; right; rewrite !eq_refl //=.
Qed.

(*
  
Lemma liftR2P {A B C D : choiceType} `{Inhabited C} `{Inhabited D} (R : meas A -> meas B -> bool) (mu : meas A * C * D}) ( eta : meas B * C * D})  :
  mass mu != 0 ->
  mass eta != 0 ->
  reflect (exists S S' t t', [/\ mu = S ** (ret t) ** ret t', eta = S' ** (ret t) ** ret t' & R S S'])
          (liftR (liftR R) mu eta).
  move => hmu heta.
  Check iffP.
  apply/(iffP idP).
  move/(liftRP).
  move/(_ hmu heta).
  elim => S; elim => S'; elim => t; elim => heq1 heq2; subst.
  rewrite !mass_mprod !mass_ret !pmulr1 in hmu, heta.
  move/(liftRP).
  move/(_ hmu heta); elim => S0; elim => S0'; elim => t'; elim => heq1 heq2 HR; subst.
  exists S0; exists S0'; eexists; eexists; split.
  done.
  done.
  done.

  elim => S; elim => S'; elim => t; elim => t'; elim => heq1 heq2 HR; subst.
  apply/(liftRP).
  done.
  done.
  exists (S ** ret t); exists (S' ** ret t); exists t'; split.
  done.
  done.
  apply/(liftRP).
  rewrite !mass_mprod !mass_ret !pmulr1 in hmu; rewrite !mass_mprod !mass_ret !pmulr1 //=.
  rewrite !mass_mprod !mass_ret !pmulr1 in heta; rewrite !mass_mprod !mass_ret !pmulr1 //=.
  exists S; exists S'; exists t; split; done.
Qed.
*)

Definition coerce_dep {A : eqType} {F : A -> Type} `{forall a, Inhabited (F a)} (a : A) (t : {x : A & F x}) : (F a).
  destruct t as [t0 t1].
  case (eqVneq a t0) => heq.
  rewrite heq.
  apply (t1).
  apply H.
Defined.

Import EqNotations.

Lemma coerce_dep_eq {A : eqType} {F : A -> eqType} `{forall a, Inhabited (F a)} a (t : {x : A & F x}) (h : tag t = a) :
  coerce_dep a t = (rew -> h in projT2 t).
  rewrite /coerce_dep.
  destruct t.
  simpl in *.
  destruct (eqVneq a x).
  destruct h.
  have: e = erefl.
    apply eq_irrelevance.
    move => ->.
    simpl.
  clear e.
  rewrite /eq_rect_r //=.
  rewrite h eq_refl in i; done.
Qed.

Definition liftSigT {A A' : finType} {F : A -> choiceType} {F' : A' -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a b, meas (F a) -> meas (F' b) -> bool) (mu : meas {x : A & F x}) (eta : meas {x : A' & F' x}) :=
  [exists a, [exists a',
                 [&& all (fun x => tag x == a) (support mu),
                     all (fun y => tag y == a') (support eta) &
                     (R a a') (mu <$> coerce_dep a) (eta <$> coerce_dep a')]]].

Lemma liftSigTP {A A' : finType} {F : A -> choiceType} {F' : A' -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a b, meas (F a) -> meas (F' b) -> bool) (mu : meas {x : A & F x}) (eta : meas {x : A' & F' x}) :
  reflect (exists (a : A) (a' : A') (S : meas (F a)) (S' : meas (F' a')),
              [/\ mu = (s <- S; ret (existT _ a s)),
                  eta = (s <- S'; ret (existT _ a' s)) &
                  R a a' S S']) (liftSigT R mu eta).
  apply (iffP idP).
  move/existsP; elim => a.
  move/existsP; elim => a'.
  move/and3P; elim => h1 h2 h3.
  exists a; exists a'.
  exists (mu <$> coerce_dep a).
  exists (eta <$> coerce_dep a').
  split.

  rewrite -(bind_ret mu); rewrite !mbindA.
  apply mbind_eqP => t Ht.
  msimp.
  have heq : tag t = a by apply (eqP (allP h1 _ Ht)).
  rewrite (coerce_dep_eq _ _ heq).
  destruct heq.
  simpl.
  by destruct t.

  rewrite -(bind_ret eta); rewrite !mbindA.
  apply mbind_eqP => t Ht.
  msimp.
  have heq : tag t = a' by apply (eqP (allP h2 _ Ht)).
  rewrite (coerce_dep_eq _ _ heq).
  destruct heq.
  simpl.
  by destruct t.

  done.

  elim => a; elim => a'; elim => S; elim => S'.
  elim => heq1 heq2 HR; subst.
  apply/existsP.
  exists a.
  apply/existsP; exists a'.
  apply/and3P; split.

  apply/allP => x.
  move/support_bindP; elim => f; elim => Hf.
  rewrite in_ret; move/eqP => ->.
  done.

  apply/allP => x.
  move/support_bindP; elim => f; elim => Hf.
  rewrite in_ret; move/eqP => ->.
  done.

  have -> : (S <$> existT (fun i : A => F i) a) <$> coerce_dep a = S.
    msimp.
    rewrite -(bind_ret S) mbindA.
    apply mbind_eqP => x Hx.
    msimp.
    destruct (eqVneq a a).
    have -> : e = erefl by apply eq_irrelevance; simpl.
    rewrite /eq_rect_r //=.
    rewrite eq_refl //= in i.
  have -> : (S' <$> existT (fun i : A' => F' i) a') <$> coerce_dep a' = S'.
    msimp.
    rewrite -(bind_ret S') mbindA.
    apply mbind_eqP => x Hx.
    msimp.
    destruct (eqVneq a' a').
    have -> : e = erefl by apply eq_irrelevance; simpl.
    rewrite /eq_rect_r //=.
    rewrite eq_refl //= in i.
  done.
Qed.

(* for meas *)
(*
Lemma liftR2P_fmap {A B C D E E' : choiceType} `{Inhabited C} `{Inhabited D} 
      (R : meas A -> meas B -> bool) {R' : meas E} -> meas E'} -> bool} {mu : meas A * C * D}} {eta} (f : A -> E) (f' : B -> E') :
  mass mu != 0 ->
  mass eta != 0 ->
  liftR (liftR R) mu eta ->
  (forall mu eta, R mu eta -> R' (mu <$> f) (eta <$> f')) ->
  liftR (liftR R') (x <- mu; ret (f x.1.1, x.1.2, x.2)) (x <- eta; ret (f' x.1.1, x.1.2, x.2)).

  intros.
  move/liftR2P: H3.
  rewrite H1 H2; move/(_ is_true_true is_true_true).
  elim => S; elim => S'; elim => t; elim => t'; elim => heq1 heq2 hr; subst.
  msimp.
  apply/liftR2P.
  rewrite mass_fmap //=; rewrite !mass_mprod !mass_ret !pmulr1 in H1; done.
  rewrite mass_fmap //=; rewrite !mass_mprod !mass_ret !pmulr1 in H2; done.
  exists (S <$> f); exists (S' <$> f'); exists t; exists t' ;split.
  msimp; done.
  msimp; done.
  apply H4; done.
Qed.
*)

Lemma liftRP_ret {A B C : choiceType} `{Inhabited C} 
      (R : C -> meas A -> meas B -> bool) (x : A * C) (y : B * C) :
    x.2 = y.2 ->
    R x.2 (ret x.1) (ret y.1) ->
    liftR R (ret x) (ret y).
  intros; rewrite /liftR; apply/andP; split.
  rewrite !support_ret //= H0 //= eq_refl //=.
  msimp.
  rewrite support_ret //= andbT //=.
Qed.

(* for meas *)
Lemma liftSigT_fmap_existT {A A' : finType} {F : A -> choiceType} {F' : A' -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a b, meas (F a) -> meas (F' b) -> bool) (a : A) (b : A') S S' :
  R a b S S' ->
  liftSigT R (S <$> existT F a) (S' <$> existT F' b).
  intro; apply/liftSigTP; exists a; exists b; exists S; exists S'; split; done.
Qed.

Lemma liftSigT_ret {A A' : finType} {F : A -> choiceType} {F' : A' -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a b, meas (F a) -> meas (F' b) -> bool) (t1 : {x : A & F x}) (t2 : {x : A' & F' x}) :
  R (tag t1) (tag t2) (ret (projT2 t1)) (ret (projT2 t2)) ->
  liftSigT R (ret t1) (ret t2).
  intros; apply/liftSigTP.
  exists (tag t1); exists (tag t2); exists (ret (projT2 t1)); exists (ret (projT2 t2)); split; rewrite //=.
  msimp.
  destruct t1; done.
  msimp; destruct t2; done.
Qed.

Lemma liftO_ret_some {A B : choiceType} `{Inhabited A}`{Inhabited B} (R : meas A -> meas B -> bool) x y :
  R (ret x) (ret y) ->
  liftO R (ret (Some x)) (ret (Some y)).
  intros; rewrite /liftO; apply/orP; left; apply/and3P; split.
  rewrite support_ret //=.
  rewrite support_ret //=.
  msimp; done.
Qed.

Definition liftSigT_sameT {A : finType} {F F' : A -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a, meas (F a) -> meas (F' a) -> bool) (mu : meas {x : A & F x}) (eta : meas {x : A & F' x}) : bool.
  eapply @liftSigT.
  apply H0.
  apply H.
  move => a b.
  case (eqVneq a b).
  move => <-.
  apply (fun x y => R _ y x).
  intros; apply false.
  apply eta.
  apply mu.
Defined.

Lemma liftSigT_sameTP {A : finType} {F F' : A -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a, meas (F a) -> meas (F' a) -> bool) mu eta :
  reflect (exists (a : A) S S', [/\ mu = S <$> existT F a, eta = S' <$> existT F' a & R a S S']) (liftSigT_sameT R mu eta).
  apply (iffP idP).
  rewrite /liftSigT_sameT.
  move/liftSigTP.
  elim => a; elim => a'; elim => S; elim => S'; elim.
  move => -> ->.
  destruct (eqVneq a a').
  destruct e.
  simpl => HR.
  exists a; exists S'; exists S; split; done.
  done.

  elim => a; elim => S; elim => S'; elim => hmu heta hr.
  rewrite /liftSigT_sameT; apply/liftSigTP.
  exists a; exists a.
  exists S'; exists S; split.
  done.
  done.
  destruct (eqVneq a a).
  have -> : e = erefl by apply eq_irrelevance.
  done.
  rewrite eq_refl //= in i.
Qed.

Lemma liftSigT_sameT_fmap_existT {A : finType} {F F' : A -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a, meas (F a) -> meas (F' a) -> bool) a mu eta  :
  R a mu eta -> liftSigT_sameT R (mu <$> existT F a) (eta <$> existT F' a).
  intros; apply/liftSigT_sameTP; exists a; exists mu; exists eta; split; done.
Qed.

Lemma liftSigT_sameT_ret {A : finType} {F F' : A -> choiceType} `{forall a, Inhabited (F a)} `{forall a, Inhabited (F' a)} (R : forall a, meas (F a) -> meas (F' a) -> bool) a x y:
  R a (ret x) (ret y) -> liftSigT_sameT R (ret (existT F a x)) (ret (existT F' a y)).
  intros; apply/liftSigT_sameTP; exists a; exists (ret x); exists (ret y); split; try msimp; done.
Qed.

  Lemma pull_fmap {T T' T'' : choiceType} (m : meas T) (f1 : T -> T') (f2 : T' -> T'') :
    (x <- m; ret f2 (f1 x)) = (x <- m; ret (f1 x)) <$> f2.
    msimp; done.
  Qed.

  Lemma mbind_swap3 {A B C D : choiceType} (m1 : meas A) (m2 : meas B) (m3 : meas C) (f : A -> B -> C -> meas D) :
    (x <- m1; y <- m2; z <- m3; f x y z) =
    (x <- m1; z <- m3; y <- m2; f x y z).
    apply mbind_eqP => x Hx; apply mbind_swap.
  Qed.