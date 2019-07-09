(* (c) Copyright Microsoft Corporation and Inria. All rights reserved. *)
Require Import ssreflect.
Require Import ssrbool.
Require Import funs.
Require Import eqtype.
Require Import ssrnat.
Require Import seq.
Require Import fintype.
Require Import paths.
Require Import finrel.
Require Import div.

Set Implicit Arguments.
Unset Strict Implicit.
Import Prenex Implicits.

Module Group.

Structure finGroupType : Type := FinGroupType {
  element :> finType;
  unit : element;
  inv : element -> element;
  mul : element -> element -> element;
  unitP : forall x, mul unit x = x;
  invP : forall x, mul (inv x) x = unit;
  mulP : forall x1 x2 x3, mul x1 (mul x2 x3) = mul (mul x1 x2) x3
}.

End Group.

Implicit Arguments Group.unit [].

Delimit Scope group_scope with G.
Bind Scope group_scope with Group.element.
Arguments Scope Group.mul [_ group_scope group_scope].
Arguments Scope Group.inv [_ group_scope].

Notation finGroupType := Group.finGroupType.
Notation FinGroupType := Group.FinGroupType.
Notation mulg := Group.mul (only parsing).
Notation invg := (@Group.inv _) (only parsing).

Notation "x1 * x2" := (mulg x1 x2): group_scope.
Notation "1" := (Group.unit _) : group_scope.
Notation "x '^-1'" := (invg x) (at level 9, format "x '^-1'") : group_scope.

Section GroupIdentities.

Open Scope group_scope.

Variable g : finGroupType.

Lemma mulgA : forall x1 x2 x3 : g, x1 * (x2 * x3) = x1 * x2 * x3.
Proof. exact: Group.mulP. Qed.

Lemma mul1g : forall x : g, 1 * x = x.
Proof. exact: Group.unitP. Qed.

Lemma mulVg : forall x : g, x^-1 * x = 1.
Proof. exact: Group.invP. Qed.

Lemma mulKg : forall x : g, cancel (mulg x) (mulg x^-1).
Proof.  by move=> x y; rewrite mulgA mulVg mul1g. Qed.

Lemma mulg_injl : forall x : g, injective (mulg x).
Proof. move=> x; exact: can_inj (mulKg x). Qed.

Implicit Arguments mulg_injl [].

Lemma mulgV : forall x : g, x * x^-1 = 1.
Proof. by move=> x; rewrite -{1}(mulKg x^-1 x) mulVg -mulgA mul1g mulVg. Qed.

Lemma mulKgv : forall x : g, cancel (mulg x^-1) (mulg x).
Proof. by move=> x y; rewrite mulgA mulgV mul1g. Qed.

Lemma mulg1 : forall x : g, x * 1 = x.
Proof. by move=> x; rewrite -(mulVg x) mulKgv. Qed.

Notation mulgr := (fun x y : g => y * x).

Lemma mulgK : forall x : g, cancel (mulgr x) (mulgr x^-1).
Proof. by move=> x y; rewrite -mulgA mulgV mulg1. Qed.

Lemma mulg_injr : forall x : g, injective (mulgr x).
Proof. move=> x; exact: can_inj (mulgK x). Qed.

Lemma mulgKv : forall x, cancel (mulgr x^-1) (mulgr x).
Proof. by move=> x y; rewrite -mulgA mulVg mulg1. Qed.

Lemma invg1 : 1^-1 = 1 :> g.
Proof. by rewrite -{2}(mulVg 1) mulg1. Qed.

Lemma invgK : @cancel g g invg invg.
Proof. by move=> x; rewrite -{2}(mulgK x^-1 x) -mulgA mulKgv. Qed.

Lemma invg_inj : @injective g g invg.
Proof. exact: can_inj invgK. Qed.

Lemma invg_mul : forall x1 x2 : g, (x2 * x1)^-1 = x1^-1 * x2^-1. 
Proof.
by move=> x1 x2; apply: (mulg_injl (x2 * x1)); rewrite mulgA mulgK !mulgV.
Qed.

End GroupIdentities.

Implicit Arguments mulg_injl [g].
Implicit Arguments mulg_injr [g].

Definition gsimpl :=
   (mulg1, mul1g, invg1, mulVg, mulgV, invgK, mulgK, mulgKv, invg_mul, mulgA).

Ltac gsimpl := rewrite ?gsimpl //.

Definition conjg (g : finGroupType) (x y : g) := (x^-1 * y * x)%G.

Notation "y '^g' x" := (conjg x y) (at level 30) : group_scope.

Section Conjugation.

Variable g : finGroupType.

Open Scope group_scope.

Lemma conjgE : forall x y : g, x ^g y = y^-1 * x * y. Proof. done. Qed.

Lemma conjg1 : conjg 1 =1 @id g.
Proof. by move=> x; rewrite conjgE invg1 mul1g mulg1. Qed.

Lemma conj1g : forall x : g, 1 ^g x = 1.
Proof. by move=> x; rewrite conjgE mulg1 mulVg. Qed.

Lemma conjg_mul : forall x1 x2 y : g, (x1 * x2) ^g y = x1 ^g y * x2 ^g y.
Proof. by move=> *; rewrite !conjgE !mulgA mulgK. Qed.

Lemma conjg_invg : forall x y : g, x^-1 ^g y = (x ^g y)^-1.
Proof. by move=> *; rewrite !conjgE !invg_mul invgK mulgA. Qed.

Lemma conjg_conj : forall x y1 y2 : g, (x ^g y1) ^g y2 = x ^g (y1 * y2).
Proof. by move=> *; rewrite !conjgE invg_mul !mulgA. Qed.

Lemma conjgK : forall y : g, cancel (conjg y) (conjg y^-1).
Proof. by move=> y x; rewrite conjg_conj mulgV conjg1. Qed.

Lemma conjgKv : forall y : g, cancel (conjg y^-1) (conjg y).
Proof. by move=> y x; rewrite conjg_conj mulVg conjg1. Qed.

Lemma conjg_inj : forall y : g, injective (conjg y).
Proof. move=> y; exact: can_inj (conjgK y). Qed.

Definition conjg_fp (y x : g) := x ^g y == x.

Definition commute (x y : g) := x * y = y * x.

Lemma commute_sym : forall x y, commute x y -> commute y x.
Proof. by rewrite /commute. Qed.

Lemma conjg_fpP : forall x y : g, reflect (commute x y) (conjg_fp y x).
Proof.
move=> *; rewrite /conjg_fp conjgE -mulgA (canF_eq (mulKgv _)); exact: eqP.
Qed.

Lemma conjg_fp_sym : forall x y : g, conjg_fp x y = conjg_fp y x.
Proof. move=> x y; apply/conjg_fpP/conjg_fpP; exact: commute_sym. Qed.

End Conjugation.

Implicit Arguments conjg_inj [g].
Implicit Arguments conjg_fpP [g x y].
Prenex Implicits conjg_fpP.

Section GroupSet.

Open Scope group_scope.

Variable g : finGroupType.

Variable h : set g.

(* Cosets *)

Definition lcoset x : set g := fun y => h (x^-1 * y).
Definition rcoset x : set g := fun y => h (y * x^-1).

Lemma lcosetP : forall y z, reflect (exists2 x, h x & z = y * x) (lcoset y z).
Proof.
move=> y z; apply: (iffP idP) => [Hx | [x Hx ->]]; last by rewrite /lcoset mulKg.
by exists (y^-1 * z); last rewrite /lcoset mulKgv.
Qed.

Lemma rcosetP : forall y z, reflect (exists2 x, h x & z = x * y) (rcoset y z).
Proof.
move=> y z; apply: (iffP idP) => [Hx | [x Hx ->]]; last by rewrite /rcoset mulgK.
by exists (z * y^-1); last rewrite /rcoset mulgKv.
Qed.

(* product *)

Section Prodg.

Variable k : set g.

Definition prodg : set g := fun z => ~~ disjoint k (fun y => rcoset y z).

CoInductive mem_prodg (z : g) : Prop :=
  MemProdg x y : h x -> k y -> z = x * y -> mem_prodg z.

Lemma prodgP : forall z, reflect (mem_prodg z) (prodg z).
Proof.
move=> z; apply: (iffP set0Pn) => [[y]|[x y Hx Hy ->]].
  by case/andP=> Hy; case/rcosetP=> x *; exists x y.
by exists y; rewrite /setI Hy; apply/rcosetP; exists x.
Qed.

End Prodg.

Definition group := h 1 && subset (prodg h) h.

Definition subgroup k := group && subset h k.

Lemma groupP : reflect (h 1 /\ forall x y, h x -> h y -> h (x * y)) group.
Proof.
apply: (iffP andP) => [] [H1 HM]; split=> {H1}//.
  by move=> x y Hx Hy; apply: (subsetP HM); apply/prodgP; exists x y.
by apply/subsetP=> z; case/prodgP=> [x y Hx Hy ->]; auto.
Qed.

Hypothesis Hh : group.

Lemma group1 : h 1. Proof. by case/groupP: Hh. Qed.

Lemma groupM : forall x y, h x -> h y -> h (x * y).
Proof. by case/groupP: Hh. Qed.

Lemma groupVr : forall x, h x -> h x^-1.
Proof.
move=> x Hx; rewrite -(finv_f (mulg_injl x) x^-1) mulgV /finv.
elim: pred => [|n IHn] /=; [exact: group1 | exact: groupM].
Qed.

Lemma groupV : forall x, h x^-1 = h x.
Proof. move=> x; apply/idP/idP; first rewrite -{2}[x]invgK; exact: groupVr. Qed.

Lemma groupMl : forall x y, h x -> h (x * y) = h y.
Proof.
move=> x y Hx; apply/idP/idP=> Hy; last exact: groupM.
rewrite -(mulKg x y); exact: groupM (groupVr _) _.
Qed.

Lemma groupMr : forall x y, h x -> h (y * x) = h y.
Proof.
move=> x y Hx; apply/idP/idP=> Hy; last exact: groupM.
rewrite -(mulgK x y); exact: groupM (groupVr _).
Qed.

Lemma groupVl : forall x,  h x^-1 ->  h x.
Proof. by move=> x; rewrite groupV. Qed.

Definition subFinGroupType : finGroupType.
pose d := sub_finType h.
pose d1 : d := EqSig h 1 group1.
pose dV (u : d) : d := EqSig h _ (groupVr (valP u)).
pose dM (u1 u2 : d) : d := EqSig h _ (groupM (valP u1) (valP u2)).
(exists d d1 dV dM => *; apply: val_inj);
  [exact: mul1g | exact: mulVg | exact: mulgA].
Defined.

Lemma pos_card_group : 0 < card h.
Proof. rewrite lt0n; apply/set0Pn; exists (1 : g); exact: group1. Qed.

Lemma prodg_subr : forall k, subset k (prodg k).
Proof. 
move=> k; apply/subsetP=> x Hx; apply/prodgP.
by exists (1 : g) x; [exact group1 | | rewrite mul1g].
Qed.

Lemma prodgg : prodg h =1 h.
Proof. by apply/subset_eqP; rewrite prodg_subr andbT; case/andP: Hh. Qed.

End GroupSet.

Lemma group_of_type : forall g : finGroupType, group g.
Proof. move=> g; exact/subsetP. Qed.

Coercion group_of_type : finGroupType >-> is_true.

Hint Resolve pos_card_group.

Section LaGrange.

Variables (g : finGroupType) (h k : set g).
Hypothesis Hh : group h.
Hypothesis Hk : group k.
Hypothesis Hhk : subset h k.
Let HhkP := subsetP Hhk.

Open Scope group_scope.

Lemma prodg_subl : subset h (prodg h k).
Proof.
apply/subsetP=> x Hx; apply/prodgP.
by exists x (1 : g); [ | exact: group1 | rewrite mulg1].
Qed.

Lemma rcoset_refl : forall x, rcoset h x x.
Proof. by move=> x; rewrite /rcoset mulgV group1. Qed.

Lemma rcoset_sym : forall x y, rcoset h x y = rcoset h y x.
Proof. by move=> *; apply/idP/idP; move/(groupVr Hh); rewrite invg_mul invgK. Qed.

Lemma rcoset_trans : forall x y z, rcoset h x y -> rcoset h y z -> rcoset h x z.
Proof. by move=> x y z Hxy; rewrite /rcoset -(groupMr Hh _ Hxy) -mulgA mulKg. Qed.

Lemma connect_rcoset : connect (rcoset h) =2 rcoset h.
Proof.
move=> x y; apply/idP/idP; [move/connectP=> [p Hp <- {y}] | exact: connect1].
elim: p x Hp => [|y p IHp] x /=; first by rewrite rcoset_refl.
case/andP=> Hxy; move/IHp; exact: rcoset_trans.
Qed.

Lemma rcoset_csym : connect_sym (rcoset h).
Proof. by move=> x y; rewrite !connect_rcoset rcoset_sym. Qed.

Lemma rcoset1 : rcoset h 1 =1 h.
Proof. by move=> x; rewrite /rcoset invg1 mulg1. Qed.

Lemma card_rcoset : forall x, card (rcoset h x) = card h.
Proof.
move=> x; apply: etrans (card_preimage (mulg_injr x^-1) _) _; apply: eq_card=> y.
rewrite /setI andbC; case Hy: (h y) => //=; apply/set0Pn; exists (y * x).
by rewrite /preimage mulgK set11.
Qed.

Lemma closed_rcoset : closed (rcoset h) k.
Proof. by move=> x y; move/HhkP => Hy; rewrite -(mulgKv x y) groupMl. Qed.

Definition indexg := n_comp (rcoset h).

Lemma rcoset_repr : forall y, rcoset h y (repr (rcoset h) y).
Proof. by move=> y; rewrite -connect_rcoset connect_repr. Qed.

Theorem LaGrange : (card h * indexg k)%N = card k.
Proof.
pose f y := let y0 := repr (rcoset h) y in EqPair (y * y0^-1) y0.
have Hf: injective f by move=> y z [Dy Dy0]; move: Dy0 Dy => ->; exact: mulg_injr.
rewrite /indexg /n_comp -card_prod -(card_image Hf k).
apply: eq_card => [[x y]]; apply/idP/set0Pn=> [|[z]]; rewrite /setI /preimage.
  move/and3P=> /= [Hx Dy Hy]; exists (x * y).
  rewrite /set1 /= (_ : repr _ _ = y); first by rewrite mulgK !set11 groupM // HhkP.
  rewrite -{2}(eqP Dy); apply/(reprP rcoset_csym).
  by rewrite connect_rcoset /rcoset invg_mul mulKgv groupV.
case/andP; move/eqP=> -> {x y} Hz; rewrite /eq_prod /= [h _]rcoset_sym rcoset_repr.
by rewrite (traversal_repr rcoset_csym) -(closed_rcoset (rcoset_repr _)).
Qed.

Lemma group_dvdn : dvdn (card h) (card k).
Proof. by apply/dvdnP; exists (indexg k); rewrite mulnC LaGrange. Qed.

Lemma group_divn : divn (card k) (card h) = indexg k.
Proof. by rewrite -LaGrange // divn_mulr; auto. Qed.

Lemma lcoset_inv : forall x y, lcoset h x y = rcoset h x^-1 y^-1.
Proof. by move=> x y; rewrite /rcoset -invg_mul groupV. Qed.

Lemma lcoset_refl : forall x, lcoset h x x.
Proof. by move=> x; rewrite /lcoset mulVg group1. Qed.

Lemma lcoset_sym : forall x y, lcoset h x y = lcoset h y x.
Proof. by move=> x y; rewrite !lcoset_inv rcoset_sym. Qed.

Lemma lcoset_trans : forall x y z, lcoset h x y -> lcoset h y z -> lcoset h x z.
Proof. move=> x y z; rewrite !lcoset_inv; exact: rcoset_trans. Qed.

Lemma connect_lcoset : connect (lcoset h) =2 lcoset h.
Proof.
move=> x y; apply/idP/idP; [move/connectP=> [p Hp <- {y}] | exact: connect1].
elim: p x Hp => [|y p IHp] x /=; first by rewrite lcoset_refl.
case/andP=> Hxy; move/IHp; exact: lcoset_trans.
Qed.

Lemma lcoset_csym : connect_sym (lcoset h).
Proof. by move=> x y; rewrite !connect_lcoset lcoset_sym. Qed.

Lemma lcoset1 : lcoset h 1 =1 h.
Proof. by move=> x; rewrite /lcoset invg1 mul1g. Qed.

Lemma card_lcoset : forall x, card (lcoset h x) = card h.
Proof.
move=> x; rewrite -(card_image (@invg_inj g)) -(card_rcoset x^-1).
apply: eq_card => y; rewrite -[y]invgK -lcoset_inv image_f //; exact: invg_inj.
Qed.

Lemma closed_lcoset : closed (lcoset h) k.
Proof.
by move=> x y; rewrite lcoset_inv; move/closed_rcoset; rewrite !groupV.
Qed.

Lemma lcoset_indexg : n_comp (lcoset h) k = indexg k.
Proof.
rewrite (adjunction_n_comp invg lcoset_csym rcoset_csym closed_lcoset).
  by apply: eq_n_comp_r => x; rewrite /preimage groupV.
apply: (strict_adjunction rcoset_csym closed_lcoset (@invg_inj _)).
  by apply/subsetP=> x _; rewrite -(invgK x) codom_f.
by move=> x y _; rewrite lcoset_inv !invgK.
Qed.

End LaGrange.

Section Eq.

Open Scope group_scope.

Variable g : finGroupType.

Lemma eq_lcoset : forall a1 a2 : set g, a1 =1 a2 -> lcoset a1 =2 lcoset a2.
Proof. move=> a1 a2 Da x y; exact: Da. Qed.

Lemma eq_rcoset : forall a1 a2 : set g, a1 =1 a2 -> rcoset a1 =2 rcoset a2.
Proof. move=> a1 a2 Da x y; exact: Da. Qed.

Lemma eq_prodg_l : forall a1 a2 b : set g, a1 =1 a2 -> prodg a1 b =1 prodg a2 b.
Proof.
move=> a1 a2 b; move/eq_rcoset=> Da x; congr negb; rewrite !(disjoint_sym b).
apply: eq_disjoint=> y; exact: Da.
Qed.

Lemma eq_prodg_r : forall a b1 b2 : set g, b1 =1 b2 -> prodg a b1 =1 prodg a b2.
Proof. move=> a b1 b2 Db x; congr negb; apply: eq_disjoint=> y; exact: Db. Qed.

Lemma eq_group: forall a b : set g, a =1 b -> group a = group b.
Proof.
move=> a b Da; rewrite /group Da (eq_subset_r Da); congr andb.
by apply: eq_subset=> x; rewrite (eq_prodg_l _ Da) (eq_prodg_r _ Da).
Qed.

End Eq.

(* Shows that given two sets h k, if hk=kh then hk is a subgroup *)
Section SubProd.

Open Scope group_scope.

Variable g : finGroupType.

Lemma prodgA : forall h1 h2 h3 : set g,
  prodg h1 (prodg h2 h3) =1 prodg (prodg h1 h2) h3.
Proof.
move=> h1 h2 h3 x; apply/prodgP/prodgP.
  case=> x1 x23 Hx1; case/prodgP=> x2 x3 Hx2 Hx3 ->{x23}; rewrite mulgA => Dx.
  by exists (x1 * x2) x3 => //; apply/prodgP; exists x1 x2.
case=> x12 x3; case/prodgP=> x1 x2 Hx1 Hx2 ->{x12} Hx3; rewrite -mulgA => Dx.
by exists x1 (x2 * x3) => //; apply/prodgP; exists x2 x3.
Qed.

Section GroupProdC.

Variables h k : set g.
Hypothesis Hh : group h.
Hypothesis Hk : group k.

Lemma prodC_group : prodg h k =1 prodg k h -> group (prodg h k).
Proof.
move=> Hhk; apply/andP; split.
  apply/prodgP; exists (1 : g) (1 : g); by [exact: group1 | rewrite mulg1].
have Hhkh : prodg (prodg h h) k =1 (prodg (prodg h k) h).
  move=> x; rewrite -!prodgA; exact: eq_prodg_r.
apply/subsetP=> x; rewrite prodgA -(eq_prodg_l _ Hhkh) -prodgA.
by rewrite (eq_prodg_l _ (prodgg Hh)) (eq_prodg_r _ (prodgg Hk)).
Qed.

Lemma group_prodC : group (prodg h k) -> prodg h k =1 prodg k h.
Proof.
move=> Hhk x; rewrite -{Hhk}(groupV Hhk).
by apply/idPn/idPn; case/prodgP=> y z;
  rewrite -(groupV Hh) -(groupV Hk) => Hy Hz Dx;
  apply/prodgP; exists z^-1 y^-1; rewrite // -invg_mul -Dx ?invgK.
Qed.

End GroupProdC.

Variables h k : set g.
Hypothesis Hh : group h.
Hypothesis Hk : group k.

Lemma group_prod_sym : group (prodg h k) = group (prodg k h).
Proof.
by apply/idP/idP; move/(group_prodC _ _)=> Hhk;
  apply: prodC_group => // x; rewrite Hhk.
Qed.

Definition disjointg := subset (setI h k) (set1 1).

Lemma disjointgP : reflect (setI h k =1 set1 1) disjointg.
Proof.
apply: (iffP subsetP) => Hhk x; last by rewrite Hhk.
by apply/idP/idP; [exact: Hhk | move/eqP <-; rewrite /setI !group1].
Qed.

Lemma disjointg_card : disjointg = (card (setI h k) == 1%nat).
Proof.
apply/idP/idP; first by move/disjointgP; move/eq_card->; rewrite card1.
rewrite (cardD1 1) {1}/setI !group1 //= add1n eqSS; move/set0P=> Hhk.
by apply/subsetP=> x Hx; case/nandP: (Hhk x); rewrite ?negbK ?Hx.
Qed.

Hypothesis Hhk : disjointg.

Lemma disjointg_mul_inj : forall x1 x2 y1 y2,
  h x1 -> h x2 -> k y1 -> k y2 -> x1 * y1 = x2 * y2 -> x1 = x2 /\ y1 = y2.
Proof.
move=> x1 x2 y1 y2 Hx1 Hx2 Hy1 Hy2 Dxy.
have Dx : x2^-1 * x1 = y2 * y1^-1 by rewrite -(mulgK y1 x1) Dxy -mulgA mulKg.
rewrite -(mulKgv x2 x1) -(mulgKv y1 y2) Dx (_ : y2 * _ = 1) ?gsimpl //.
by apply/eqP; rewrite eq_sym -(disjointgP Hhk) /setI -{1}Dx !groupM // groupVr.
Qed.

Lemma card_prodg_disjoint : card (prodg h k) = (card h * card k)%N.
Proof.
rewrite -card_prod; set d := eq_prod _ _; rewrite -(card_sub d).
pose f (u : eq_sig d) := let: EqSig (EqPair x y) _  := u in x * y.
have Hf: injective f.
  move=> [[x1 y1] Hxy1] [[x2 y2] Hxy2] /= Dxy; apply: val_inj => /=.
  case/andP: Hxy1 => Hx1 Hy1; case/andP: Hxy2 => Hx2 Hy2.
  by case/disjointg_mul_inj: Dxy => // -> ->.
rewrite -(card_image Hf); apply: eq_card => z.
apply/prodgP/set0Pn=> [[x y Hx Hy ->{z}]| [[[x y] Hxy]]].
  have Hxy: d (EqPair x y) by apply/andP.
  by exists (EqSig d _ Hxy); rewrite /setI /preimage /= set11.
by case/andP; move/eqP=> /= -> _; case/andP: Hxy; exists x y.
Qed.

End SubProd.

Unset Implicit Arguments.