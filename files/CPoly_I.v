From mathcomp Require Import all_ssreflect all_algebra.
Require Import String Rstruct Reals Psatz under.
Require Import Poly_complements CPoly CPoly_exec CPoly_interpolation.
Require Import Coquelicot.Coquelicot.
Require Import CFun_interpolation.
Set Implicit Arguments.
Unset Strict Implicit.
Import Prenex Implicits.

Import GRing.Theory.
Local Open Scope ring_scope.
Require Import ZArith.
From Interval Require Import Interval_specific_ops Interval_missing Interval_xreal.
From Interval Require Import Interval_definitions Interval_float_sig Interval_interval.
From Interval Require Import Interval_interval_float_full Interval_integral Interval_bisect.

Module SFBI2 := SpecificFloat Interval.Interval_bigint_carrier.BigIntRadix2.
Module I := FloatIntervalFull SFBI2.

Module CPoly_interval (F : FloatOps with Definition even_radix := true).

Module I := FloatIntervalFull F.

Section CPoly_interval.
Notation mant := Interval.Interval_bigint_carrier.BigIntRadix2.smantissa_type.
Notation xpnt := Interval.Interval_bigint_carrier.BigIntRadix2.exponent_type.

Notation D := F.type.
Notation ID := (Interval_interval_float.f_interval F.type).
Notation "x '\contained_in' I" := (contains (I.convert I) (Xreal x)) (at level 20).
Notation D2R := I.T.toR.
Notation I0 := (I.fromZ 0).
Notation scl2 I := (I.scale2 I (F.ZtoS 1)).
Variable prec: F.precision.
Notation add I J := (I.add prec I J).
Notation mul I J := (I.mul prec I J).
Notation sqr I := (I.sqr prec I).
Notation sub I J := (I.sub prec I J).
Notation div I J := (I.div prec I J).

Section Interval_lemmas.

Definition FtoI (a: D) := (Interval.Interval_interval_float.Ibnd a a).

Lemma FtoI_correct a: (D2R a) \contained_in (FtoI a).
Proof. by rewrite /= /D2R; split; case E: (F.toX a) => //=; lra. Qed.

Lemma I020 x : x \contained_in I0 -> x = 0%R.
Proof. rewrite /= F.fromZ_correct => /= [[]]; rewrite !/IZR; lra. Qed.

Lemma I00: 0 \contained_in I0.
Proof. by rewrite /=F.fromZ_correct/=; lra. Qed.

Lemma mul_correct x y I J:
	x \contained_in I -> y \contained_in J -> (x * y) \contained_in (mul I J).
Proof. by apply I.mul_correct. Qed.

Lemma sqr_correct x I :
	x \contained_in I -> (x * x) \contained_in sqr I.
Proof. by apply I.sqr_correct. Qed.

Lemma sub_correct x y I J:
	x \contained_in I -> y \contained_in J -> (x - y) \contained_in (sub I J).
Proof. by apply I.sub_correct. Qed.

Lemma add_correct x y I J:
	x \contained_in I -> y \contained_in J -> (x + y) \contained_in (add I J).
Proof. by apply I.add_correct. Qed.

Lemma inv_correct x I:
	x \contained_in I -> (/ x)%R \contained_in (I.inv prec I).
Proof.
move=> xI.
have /= := I.inv_correct prec I (Xreal x) xI.
by rewrite /Xinv'; case: is_zero => //; case: I.inv.
Qed.

Lemma div_correct x y I J:
	x \contained_in I -> y \contained_in J -> (x / y)%R \contained_in (div I J).
Proof.
move=> xI yJ.
have /= := I.div_correct prec I J (Xreal x) (Xreal y) xI yJ.
by rewrite /Xdiv'; case: is_zero => //; case: I.div.
Qed.

Lemma scl2_correct x I:
	x \contained_in I -> (x *+ 2) \contained_in (scl2 I).
Proof.
move=> xI.
suff -> :(Xreal (x *+ 2)) = (Xmul (Xreal x) (Xreal (bpow radix2 1))).
	by apply I.scale2_correct.
congr Xreal.
by have ->: (x*2 = x + x)%R by lra.
Qed.

Lemma scale2_correct x z I:
	x \contained_in I -> (x * (powerRZ 2 z)) \contained_in (I.scale2 I (F.ZtoS z)).
Proof.
move=> xI.
rewrite (_ : Xreal (x * (powerRZ 2 z)) = Xmul (Xreal x) (Xreal (bpow radix2 z))).
	by apply I.scale2_correct.
congr Xreal.
by rewrite bpow_powerRZ.
Qed.

Lemma neg_correct x I:
	x \contained_in I -> (-x) \contained_in (I.neg I).
Proof. by apply I.neg_correct. Qed.

Lemma abs_correct x I:
	x \contained_in I -> Rabs x \contained_in (I.abs I).
Proof. by apply I.abs_correct. Qed.

Lemma power_pos_correct x I (n : nat) :
  (0 < n)%nat ->
  x \contained_in I -> (x ^ n) \contained_in I.power_pos prec I (Pos.of_nat n).
Proof.
move=> nP.
have := I.power_pos_correct prec (Pos.of_nat n) I (Xreal x).
rewrite /= /I.extension /= Nat2Pos.id //.
by case: n nP.
Qed.

Lemma sin_correct x J:
	x \contained_in J -> (sin x) \contained_in (I.sin prec J).
Proof. by apply I.sin_correct. Qed.

Lemma cos_correct x I:
	x \contained_in I -> (cos x) \contained_in (I.cos prec I).
Proof. by apply I.cos_correct. Qed.

Lemma exp_correct x I:
	x \contained_in I -> (exp x) \contained_in (I.exp prec I).
Proof. by apply I.exp_correct. Qed.

Lemma ln_correct x I:
	x \contained_in I -> (ln x) \contained_in (I.ln prec I).
Proof.
move=> xI.
have /= := I.ln_correct prec _ _ xI.
by rewrite /Xln'; case: is_positive => //; case: I.ln.
Qed.

Lemma sqrt_correct x I:
	x \contained_in I -> (sqrt x) \contained_in (I.sqrt prec I).
Proof.
move=> xI.
have /= := I.sqrt_correct prec _ _ xI.
by rewrite /Xsqrt'; case: is_negative => //; case: I.sqrt.
Qed.

Lemma atan_correct x I:
	x \contained_in I -> (atan x) \contained_in (I.atan prec I).
Proof. by apply I.atan_correct. Qed.

End Interval_lemmas.

Section ExtraDef.

Definition I1 := I.fromZ 1.
Definition I2 := I.fromZ 2.
Definition I01 := I.bnd (F.fromZ 0) (F.fromZ 1).
Definition Im11 := I.bnd (F.fromZ (-1)) (F.fromZ 1).

Lemma I01_correct x z I :
   (0 <= x <= z)%R -> z \contained_in I -> x \contained_in I.mul prec I01 I.
Proof.
move=> xB zI.
pose t := x / z.
have [zZ|zNZ]: (z = 0%R) \/ (z <> 0%R) by lra.
  have -> : x = (0 * z)%R by lra.
  apply: mul_correct => //=.
  by rewrite !F.fromZ_correct; lra.
have->: x = ((x / z) * z)%R by field.
apply: mul_correct => //.
rewrite /= !F.fromZ_correct; split.
  by apply: Rdiv_pos_compat; lra.
by apply/Rle_div_l; lra.
Qed.

Lemma Rabs_join x I :
  Rabs x \contained_in I -> x \contained_in (I.join (I.neg I) I).
Proof.
move=> H.
apply: I.join_correct.
split_Rabs; [left|right]; last by [].
rewrite (_ : x = (--x)%R); last by lra.
by apply: neg_correct.
Qed.

Lemma Rabs_I01_max y i I J g :
  (i \contained_in I) ->
  (forall x, x \contained_in I -> Rabs (g x) \contained_in J)%R ->
  (forall z,
    (forall x, x \contained_in I -> Rabs (g x) <= z)%R ->
    (Rabs y <= z))%R ->
  (Rabs y \contained_in (I.mul prec I01 J)).
Proof.
move=> iII.
case: J => // l u.
move=> H1 H2.
case E : (F.toX u) => [|x1]; last first.
  pose z := x1.
  apply: I01_correct.
    split; first by split_Rabs; lra.
    apply: (H2 z) => x /H1 /= [_].
    by rewrite E.
  rewrite  /= E.
  case E1 : (F.toX l) => [|x2] //=.
    split=> //; rewrite /z; lra.
  have := H1 _ iII.
  rewrite /= E1 E /z; lra.
case E1 : (F.toX l) => [|x2].
  rewrite /= /I.sign_large_ /= !F.cmp_correct !F.fromZ_correct /= F.zero_correct /=.
  case: Rcompare_spec; try lra.
  case: Rcompare_spec; try lra.
  have := F.mul_correct rnd_DN prec (F.fromZ 1) l.
  have := F.mul_correct rnd_UP prec (F.fromZ 1) u.
  rewrite E1 /= E /= !F.fromZ_correct /= => -> -> //.
rewrite /= /I.sign_large_ /= !F.cmp_correct !F.fromZ_correct /= F.zero_correct /=.
case: Rcompare_spec; try lra.
case: Rcompare_spec; try lra.
rewrite E1 /= E /=.
case: Rcompare_spec => /=.
- have := F.mul_correct rnd_DN prec (F.fromZ 1) l.
  have := F.mul_correct rnd_UP prec (F.fromZ 1) u.
  rewrite E1 /= E /= !F.fromZ_correct /= => -> -> //.
- move=> HH1 _ _; split => //.
  apply: Rle_trans (_ : round F.radix rnd_DN (F.prec prec) 0 <= _)%R.
    apply: Generic_fmt.round_le; try lra.
  rewrite /round Generic_fmt.round_0; split_Rabs; lra.
- have := F.mul_correct rnd_DN prec (F.fromZ 0) l.
  have := F.mul_correct rnd_UP prec (F.fromZ 1) u.
  rewrite E1 /= E /= !F.fromZ_correct /= => -> ->.
  rewrite Rmult_0_l.
  rewrite /round Generic_fmt.round_0; split_Rabs; lra.
have := F.mul_correct rnd_DN prec (F.fromZ 0) l.
have := F.mul_correct rnd_UP prec (F.fromZ 1) u.
rewrite E1 /= E /= !F.fromZ_correct /= => -> ->.
rewrite Rmult_0_l.
rewrite /round Generic_fmt.round_0; split_Rabs; lra.
Qed.

(*****************************************************************************)
(*                             Factorial                                     *)
(*****************************************************************************)

Fixpoint mfact_rec n p :=
  if n is n1.+1 then (p * (mfact_rec n1 p.+1))%nat
  else 1%nat.

Lemma mfact_recE n p : mfact_rec n p.+1 = ((n + p)`! %/ p`!)%nat.
Proof.
elim: n p => //= [|n IH] p.
  by rewrite divnn add0n fact_gt0.
rewrite IH muln_divA; first by rewrite factS divnMl // addnS.
elim: (n) => //= n1 IH1.
apply: dvdn_trans IH1 _.
rewrite addSn factS.
by apply/dvdn_mull/dvdnn.
Qed.

Fixpoint Ifact_rec n p :=
  if n is n1.+1 then mul p (Ifact_rec n1 (add I1 p))
  else I1.

Definition Ifact n := Ifact_rec n I1.

Lemma Ifact_correct n : INR (n`!) \contained_in Ifact n.
Proof.
rewrite /Ifact (_ : n`! = (n + 0)`! %/ 0`!)%nat; last first.
  by rewrite addn0 divn1.
rewrite -mfact_recE.
have : INR 1 \contained_in I1 by apply: I.fromZ_correct.
elim: n 1%nat I1 => [|n IH] m M H; first by apply: I.fromZ_correct.
lazy iota beta delta [mfact_rec Ifact_rec].
rewrite mult_INR.
apply: mul_correct => //.
apply: IH.
rewrite S_INR Rplus_comm.
apply: add_correct => //.
by apply: I.fromZ_correct.
Qed.

(*****************************************************************************)
(* Naive way to check if an interval is of constant sign                     *)
(*****************************************************************************)

Definition s0P := I.bnd (F.fromZ 0) F.nan.
Definition sN0 := I.bnd F.nan (F.fromZ 0).

Definition csign i :=  (I.subset i s0P) || (I.subset i sN0).

Lemma csign_correct I :
  csign I ->    (forall x, x \contained_in I -> (x >= 0)%R)
             \/ (forall x, x \contained_in I -> (x <= 0)%R) .
Proof.
rewrite /csign.
have := I.subset_correct I s0P.
case: I.subset => /= [/(_ isT) H _|_].
  left => x; case: I H => //= l u.
  rewrite F.fromZ_correct /=.
  case: F.toX => //= [|r].
    by rewrite /le_lower /= => [] [].
  by rewrite /le_lower /=; lra.
have := I.subset_correct I sN0.
case: I.subset => /= [/(_ isT) H _|_] //.
right => x.
case: I H => //= l u.
rewrite F.fromZ_correct /=.
case: (F.toX l) => //= [|r]; case: (F.toX u) => //= [[]//|r1].
  by lra.
by lra.
Qed.

(*****************************************************************************)
(* Checking positivity                                                       *)
(*****************************************************************************)


Definition Fpos x := if F.cmp F.zero x is Xlt then true else false.

Lemma Fpos_correct x : (if Fpos x then 0 < D2R x else D2R x <= 0)%R.
Proof.
rewrite /Fpos /D2R F.cmp_correct /= F.zero_correct /=.
case: F.toX => //= [|r]; try lra.
by case: Rcompare_spec; lra.
Qed.

Definition Fneg x := if F.cmp x F.zero is Xlt then true else false.

Lemma Fneg_correct x : (if Fneg x then D2R x < 0 else 0 <= D2R x)%R.
Proof.
rewrite /Fneg /D2R F.cmp_correct /= F.zero_correct /=.
case: F.toX => //= [|r]; try lra.
by case: Rcompare_spec; lra.
Qed.

End ExtraDef.

(*****************************************************************************)
(* Clenshaw algorithm on [-1; 1] for interval arithmetic                     *)
(*****************************************************************************)

Section ICshaw.

Fixpoint ICb q (x : ID) : ID * ID :=
 if q is a :: q' then
   let t := ICb q' x in
   let a1 := sub (add a (mul (fst t) x)) (snd t) in
   (a1, (fst t)) else (I0, I0).

Definition ICshaw p x :=
  let: (i1, i2) := ICb p (scl2 x) in sub i1 (mul i2 x).

Lemma ICb_crct (p: seq R) (pI: seq ID) (x: R) (I: ID):
	(forall i, (p`_i) \contained_in (nth I0 pI i)) -> x \contained_in I  -> size p = size pI ->
		(Cb p x).1 \contained_in (ICb pI I).1 /\ (Cb p x).2 \contained_in (ICb pI I).2.
Proof.
move => prp xJ.
elim: pI p prp => [[ | a p]// prp _ | J pI ih [ | a p]// prp eq].
	by split; apply I00.
rewrite /=.
case: (ih p) => // [i | | ih1 ih2 ].
		by apply (prp (S i)).
	by case: eq.
split => //.
apply sub_correct => //.
apply add_correct; first exact: (prp 0%nat).
by apply: mul_correct.
Qed.

Lemma ICshaw_correct (p: seq R) (pI: seq ID) (x: R) (J: ID):
	(forall i, p`_i \contained_in (nth I0 pI i)) -> x \contained_in J -> size p = size pI ->
		(Cshaw p x) \contained_in (ICshaw pI J).
Proof.
move => prp xJ.
case: pI p prp => [p prp eq | I pI p prp eq].
	have ->: p = [::].
		by apply size0nil.
	rewrite /Cshaw /= /ICshaw/ICb.
	apply sub_correct; first exact I00.
	by apply mul_correct; first exact I00.
have := ICb_crct prp (scl2_correct xJ) eq.
rewrite /Cshaw/ICshaw; case: Cb => i1 j1; case: ICb => I1 J1 [H1 H2].
apply sub_correct => //.
by apply mul_correct.
Qed.
End ICshaw.

(*****************************************************************************)
(* Clenshaw algorithm on [a; b] for interval arithmetic                      *)
(*****************************************************************************)

Section IsCshaw.

Definition IsCshaw a b p x :=
  let x1 := (div (sub (sub (scl2 x) b) a) (sub b a)) in
  ICshaw p x1.

Lemma IsCshaw_correct n (p: seq R) (P: seq ID) (x a b : R) (X A B : ID) :
  a != b -> size p = n -> size P = n ->
	(forall i, p`_i \contained_in (nth I0 P i)) ->
  x \contained_in X ->
  a \contained_in A ->
  b \contained_in B ->
		(\sum_(i < n) p`_ i *: 'T^(a,b)_i).[x] \contained_in IsCshaw A B P X.
Proof.
move=> aDb Sp SP IP IX IA IB.
rewrite horner_sum.
have -> : \sum_(i < n) (p`_i *: 'T^(a,b)_i).[x] =
          \sum_(i < n) p`_i * ('T_i).[(Tab a b).[x]].
  apply: eq_bigr => i _.
  by rewrite /pTab !hornerE horner_comp !hornerE.
have -> : \sum_(i < n) p`_i * ('T_i).[(Tab a b).[x]] =
           (\sum_(i < n) p`_i *: 'T_i).[(Tab a b).[x]].
  by rewrite horner_sum; apply: eq_bigr => i _; rewrite !hornerE.
rewrite -Sp -Cshaw_spec.
apply: ICshaw_correct; rewrite ?SP //.
rewrite !hornerE.
toR;  rewrite /Rinvx ifT; last first.
  by apply/eqP; move/eqP: aDb; lra.
rewrite (_ : _ + _ = (2 * x - b - a) / (b - a))%R; last first.
  by field; move/eqP: aDb; lra.
apply: div_correct.
- apply: sub_correct => //.
  apply: sub_correct => //.
  rewrite (_ : 2 * x = x *+ 2)%R.
    by apply: scl2_correct.
  by rewrite mulr2n; toR; lra.
by apply: sub_correct.
Qed.

End IsCshaw.

(*****************************************************************************)
(* Chebyshev nodes on [-1; 1] : Icheby_nodes                                 *)
(* Chebyshev nodes on [ a; b] : Ischeby_nodes                                *)
(*****************************************************************************)


Section Icheby_nodes.

Fixpoint Iilist n (f g : ID -> ID) k :=
  if n is n.+1 then g k :: (Iilist n f g (f k))
  else [::].

Lemma size_Iilist n f g k : size (Iilist n f g k) = n.
Proof. by elim: n k => //= n IH k; rewrite IH. Qed.

Lemma nth_Iilist n u f g k i : (i < n)%nat ->
  nth u (Iilist n f g k) i = g (ssrnat.iter i f k).
Proof.
elim: n i k u => //= n IH [|i] //= k u L.
by rewrite IH // -iterSr.
Qed.

Definition m n i:=
  if n is 0 then 0 else (INR (i.*2.+1) / INR (n.*2))%R.

Definition mu n i:= cos (m n i * PI).

Lemma mu_cheby_nodes n i: (i < n)%nat -> mu n i = (cheby_nodes n)`_i.
Proof.
case: n => // n ineq.
rewrite /mu /m /cheby_nodes (nth_map 0%nat); last by rewrite size_iota.
congr cos; rewrite nth_iota //.
rewrite add0n /Rdiv !natr_INR.
lra.
Qed.

Definition Imlist n v2n :=
   Iilist n (fun x => add I2 x) (fun x => div x v2n) I1.

Lemma Iiter_add21 i :
  INR (i.*2.+1) \contained_in ssrnat.iter i [eta I.add prec I2] I1.
Proof.
have v1D : 1 \contained_in I1 by apply: I.fromZ_correct.
have v2D : 2 \contained_in I2 by apply: I.fromZ_correct.
elim: i => // j IH.
rewrite doubleS 2!S_INR Rplus_assoc Rplus_comm iterS.
by apply: add_correct.
Qed.

Lemma Imlist_correct n i u v2n :
   (i < n)%nat ->
   (2 * INR n)%R \contained_in v2n ->
   m n i \contained_in nth u (Imlist n v2n) i.
Proof.
case: n => // n iLb v2nD; rewrite /Im nth_Iilist //.
apply: div_correct; first by apply: Iiter_add21.
by rewrite -mul2n mult_INR.
Qed.

Definition Ipi := I.pi prec.

Definition Icheby_nodes n v2n :=
   Iilist n (fun x => add I2 x) (fun x => I.cos prec (div (mul x Ipi) v2n)) I1.

Lemma Imulist_correct n u v2n i:
   (i < n)%nat ->
   (2 * INR n)%R \contained_in v2n ->
    mu n i \contained_in nth u (Icheby_nodes n v2n) i.
Proof.
case: n =>  // n iLn v2nD.
rewrite nth_Iilist //.
apply: cos_correct => //.
have ->: (m n.+1 i * PI = INR i.*2.+1 * PI / INR n.+1.*2)%R.
  by rewrite /m /Rdiv; lra.
apply: div_correct.
- apply: mul_correct; first by apply: Iiter_add21.
  by apply: I.pi_correct.
by rewrite -mul2n mult_INR.
Qed.

Lemma size_Icheby_nodes n v2n: size (Icheby_nodes n v2n) = n.
Proof. by rewrite size_Iilist. Qed.

Lemma Icheby_nodes_correct n v2n i:
   (2 * INR n)%R \contained_in v2n ->
   (cheby_nodes n)`_ i \contained_in nth I0 (Icheby_nodes n v2n) i.
Proof.
move=> v2nD.
have [nLi|iLn] := leqP n i.
	rewrite !nth_default; first by exact: I00.
		by rewrite size_cheby_nodes.
	by rewrite size_Icheby_nodes.
case: n iLn v2nD => [|n] // iLn v2nD.
rewrite (nth_map 0%nat); last by rewrite size_iota.
rewrite nth_iota => //; rewrite add0n.
have -> : (i.*2.+1%:R * PI / n.+1.*2%:R = i.*2.+1%:R / n.+1.*2%:R * PI)%R.
  by lra.
rewrite !natr_INR.
rewrite -[cos _]/(mu n.+1 i).
by apply: Imulist_correct.
Qed.

Definition Ischeby_nodes (a b : D) (n : nat) v2n :=
  [seq I.scale2
         (add (add (mul (sub (FtoI b) (FtoI a)) i) (FtoI a)) (FtoI b))
         (F.ZtoS (-1)) | i <- Icheby_nodes n v2n].

Lemma size_Ischeby_nodes a b n v2n : size (Ischeby_nodes a b n v2n) = n.
Proof. by rewrite size_map size_Icheby_nodes. Qed.

Lemma Ischeby_nodes_correct a b n v2n i :
  (2 * INR n)%R \contained_in v2n ->
	(scheby_nodes (D2R a) (D2R b) n)`_ i \contained_in nth I0 (Ischeby_nodes a b n v2n) i.
Proof.
move=> v2nD.
have [nLi|iLn] := leqP n i.
	rewrite !nth_default; first exact: I00.
		by rewrite size_scheby_nodes.
	by rewrite size_map size_Icheby_nodes.
rewrite (nth_map I0); last by rewrite size_Icheby_nodes.
rewrite (nth_map 0%R) /Rdiv; last by rewrite size_cheby_nodes.
have ->: (/ 2 = powerRZ 2 (-1)) %R by rewrite /powerRZ Pos2Nat.inj_1 pow_1.
apply /scale2_correct /add_correct; last exact: FtoI_correct.
apply add_correct; last exact: FtoI_correct.
apply mul_correct; last exact: Icheby_nodes_correct.
by apply sub_correct; apply: FtoI_correct.
Qed.

End Icheby_nodes.

(*****************************************************************************)
(* Chebyshev coefficient on [-1; 1] for real numbers                         *)
(*****************************************************************************)

Section cheby_coefs.

Context (f: R -> R).
Notation iota:= seq.iota.

Definition value_list n:= [seq f i | i <- cheby_nodes n].

Lemma value_list_correct n i: (i < n)%nat ->
	(value_list n)`_ i = f (cheby_nodes n)`_i.
Proof.
by intros; rewrite (nth_map 0%RR); last rewrite size_cheby_nodes.
Qed.

Fixpoint Tvalues (n : nat) (i : nat) (j: nat) {struct i} : R :=
  if i is i1.+1 then
    if i1 is i2.+1 then mu n j *+2 * Tvalues n i1 j - Tvalues n i2 j
    else mu n j
  else 1.

Lemma TvaluesSS n i j:
	(Tvalues n i.+2 j) = (mu n j *+2* Tvalues n i.+1 j - Tvalues n i j)%R.
Proof. done. Qed.

Lemma Tvalues_correct n i j: Tvalues n i j = (pT _ i).[mu n j].
Proof.
elim/induc2: i => [ | | i ih1 ih2]; first by rewrite pT0 /= hornerC.
	by rewrite pT1 hornerX.
rewrite pTSS TvaluesSS ih1 ih2.
by rewrite hornerD hornerN hornerM mulr2n hornerD hornerX.
Qed.

Definition Tvalue_list n j := map (Tvalues n j) (iota 0 n).

Lemma Tvalue_list_correct n i j: (j < n)%nat ->
    (Tvalue_list n i)`_j = ('T_i).[(cheby_nodes n)`_j].
Proof.
move=> *; rewrite (nth_map 0%nat); last by rewrite size_iota.
by rewrite nth_iota // Tvalues_correct -mu_cheby_nodes.
Qed.

Lemma dsprod_coef_P2CP l n:
	(size l <= n.+1)%nat -> CPoly (map (dsprod_coef (Poly l) n) (iota 0 n.+1)) = CPoly (P2CP l).
Proof.
move => ineq.
rewrite P2CP_spec; last by  rewrite unitfE; apply /eqP; rewrite natr_INR; toR; lra.
rewrite /CPoly size_map size_iota.
under eq_bigr ? rewrite (nth_map 0%nat); last by rewrite size_iota.
under eq_bigr ? rewrite nth_iota.
rewrite -dsprod_cheby_eq //.
by apply /leq_trans; first exact/ size_Poly.
Qed.

Definition cheby_coefs n j :=
   ((if j == 0%nat then 1 else 2%R) / INR (n.+1))%R * \sum_(i < n.+1) (value_list n.+1)`_i * (Tvalue_list n.+1 j)`_i.

Lemma dsprod_coefs n j:
	cheby_coefs n j = dsprod_coef (interpolation f (cheby_nodes n.+1)) n j.
Proof.
intros.
rewrite dsprod_coef_interpolation //.
rewrite /cheby_coefs /value_list /Tvalue_list.
congr (_ * _) => //.
under [LHS] eq_bigr ? rewrite (nth_map 0%nat); last by rewrite size_iota.
under [LHS] eq_bigr ? rewrite Tvalues_correct nth_iota.
rewrite [RHS](big_nth 0%RR) big_mkord size_cheby_nodes.
apply eq_bigr => i _.
rewrite (nth_map 0%RR); last by rewrite size_cheby_nodes.
by congr (_ * _); last by rewrite mu_cheby_nodes // add0n.
Qed.

Definition cheby_coef_list n :=
  [seq cheby_coefs n.-1 i | i <- iota 0 n].

Lemma cheby_coef_list_spec n:
	CPoly (cheby_coef_list n) = interpolation f (cheby_nodes n).
Proof.
case: n => [ | n]; first by rewrite CPoly_nil.
intros; rewrite -[RHS]polyseqK.
rewrite -P2CP_spec; last by rewrite unitfE; apply /eqP; rewrite natr_INR; toR; lra.
rewrite -(@dsprod_coef_P2CP _ n); last by rewrite -{2}[n.+1](size_cheby_nodes) interpolation_size.
f_equal; apply (@eq_from_nth _ 0%RR) => [ | i]; first by rewrite !size_map.
rewrite size_map size_iota => ineq.
rewrite !(nth_map 0%nat); try by rewrite size_iota.
rewrite !nth_iota // dsprod_coefs //.
by f_equal; rewrite [RHS]polyseqK.
Qed.
End cheby_coefs.

Definition Ienv f a b F :=
	forall x I,
    (a <= x <= b)%R -> x \contained_in I -> (f x) \contained_in (F I).

Notation "F \is_envelope_of f":= (Ienv f (-1) 1 F) (at level 70).

Notation "F \is_envelope_of[ a , b ] f":= (Ienv f (D2R a) (D2R b) F) (at level 70).

(*****************************************************************************)
(* Chebyshev coefficient on [-1; 1] for interval arithmetic                  *)
(*****************************************************************************)

Section Icheby_coefs.

Context (f: R -> R).
Context (If: ID -> ID).
Hypothesis env: If \is_envelope_of f.

Definition Ivalue_list n v2n := [seq If i | i <- Icheby_nodes n v2n].

Lemma Ivalue_list_correct n v2n i: (i < n)%nat ->
  (2 * INR n)%R \contained_in v2n ->
	(f (cheby_nodes n)`_i) \contained_in nth I0 (Ivalue_list n v2n) i.
Proof.
move=> iLn v2nD.
rewrite (nth_map I0) ?size_Icheby_nodes //; last first.
apply: env; last by exact: Icheby_nodes_correct.
suff : (-1 < (cheby_nodes n)`_i < 1)%R by lra.
apply: cheby_nodes_bound.
by apply: mem_nth; rewrite size_cheby_nodes.
Qed.

Fixpoint IT3values l1 l2 l3 : seq ID :=
  if l1 is m::l1 then
    if l2 is v1::l2 then
      if l3 is v2::l3 then sub (mul (scl2 m)  v2) v1 :: IT3values l1 l2 l3
      else [::]
    else [::]
  else [::].

Lemma size_IT3values l1 l2 l3  :
  size l2 = size l1 -> size l3 = size l1 ->
  size (IT3values l1 l2 l3) = size l1.
Proof.
elim: l1 l2 l3 => // a l1 IH [|b l2] [|c l3] //= [] H1 [] H2.
by rewrite IH.
Qed.

Lemma IT3values_correct l1 l2 l3 n m k  :
  size l2 = size l1 -> size l3 = size l1 ->
  (forall i, (i < size l1)%nat -> (cheby_nodes n)`_(m + i) \contained_in nth I0 l1 i) ->
  (forall i, (i < size l2)%nat -> (pT _ k).[(cheby_nodes n)`_(m + i)] \contained_in nth I0 l2 i) ->
  (forall i, (i < size l3)%nat -> (pT _ k.+1).[(cheby_nodes n)`_(m + i)] \contained_in nth I0 l3 i) ->
  (forall i, (i < size (IT3values l1 l2 l3))%nat ->
      (pT _ k.+2).[(cheby_nodes n)`_(m + i)] \contained_in nth I0 (IT3values l1 l2 l3) i).
Proof.
elim: l1 l2 l3 m k => // a l1 IH  [|b l2] // [|c l3] //= m k [] Hs2 [] Hs3 Hl1 Hl2 Hl3 [|i] /= H.
  rewrite pTSS !hornerE.
  apply: sub_correct; last first.
    by have /= := Hl2 0%nat; rewrite addn0; apply.
  apply: mul_correct; last first.
    by have /= := Hl3 0%nat; rewrite addn0; apply.
  rewrite -mulr2n.
  apply: scl2_correct.
  by have /= := Hl1 0%nat; rewrite addn0; apply.
rewrite -addSnnS; apply: IH => //.
- by move=> i1 Hi1; rewrite addSnnS; apply: Hl1.
- by move=> i1 Hi1; rewrite addSnnS; apply: Hl2.
by move=> i1 Hi1; rewrite addSnnS; apply: Hl3.
Qed.

Fixpoint ITvalues_rec (n : nat) l1 l2 l3 : seq (seq ID) :=
  if n is n1.+1 then
    let l4 := IT3values l1 l2 l3 in
    l4 :: ITvalues_rec n1 l1 l3 l4
  else [::].

Lemma size_ITvalues_rec n l1 l2 l3  :
  size (ITvalues_rec n l1 l2 l3) = n.
Proof.
by elim: n l1 l2 l3 => //= n IH l1 l2 l3; rewrite IH.
Qed.

Lemma size_size_ITvalues_rec n l1 l2 l3 p :
  size l2 = size l1 -> size l3 = size l1 ->
  (p < n)%nat -> size (nth [::] (ITvalues_rec n l1 l2 l3) p) = size l1.
Proof.
elim: n l1 l2 l3 p => //= n IH l1 l2 l3 [H1 H2 _|p H1 H2 Hi] //=.
  by rewrite size_IT3values.
apply: IH => //.
by rewrite size_IT3values.
Qed.

Lemma ITvalues_rec_correct l1 l2 l3 n m k  :
  size l2 = size l1 -> size l3 = size l1 ->
  (forall i, (i < size l1)%nat -> (cheby_nodes n)`_i \contained_in nth I0 l1 i) ->
  (forall i, (i < size l2)%nat -> (pT _ k).[(cheby_nodes n)`_i] \contained_in nth I0 l2 i) ->
  (forall i, (i < size l3)%nat -> (pT _ k.+1).[(cheby_nodes n)`_i] \contained_in nth I0 l3 i) ->
  (forall i p,
      let l4 := nth [::] (ITvalues_rec m l1 l2 l3) p in
      (p < m)%nat ->
      (i < size l1)%nat ->
      (pT _(k.+2 + p)).[(cheby_nodes n)`_(i)] \contained_in nth I0 l4 i).
Proof.
elim: m k l1 l2 l3 => // m1 IH k l1 l2 l3 Hs2 Hs3 Hl1 Hl2 Hl3 i [/= _ H|p] /=.
  rewrite addn0 -{2}[i]add0n.
  apply: IT3values_correct => //.
  by rewrite size_IT3values.
move=> H11 H2; rewrite -addSnnS.
apply: IH => //.
- by rewrite size_IT3values.
move=> i1 Hi1.
rewrite -{2}[i1]add0n.
by apply: IT3values_correct.
Qed.

Definition ITvalues n l1 l2 :=
  if n is n1.+1 then
     l1 ::
     if n1 is n2.+1 then
       l2 :: ITvalues_rec n2 l2 l1 l2
     else [::]
  else [::].

Lemma size_ITvalue n l1 l2 : size (ITvalues n l1 l2) = n.
Proof.
case: n => // [] [|n] //=.
by rewrite size_ITvalues_rec.
Qed.

Lemma size_size_ITvalues n l1 l2 p :
  size l1 = n -> size l2 = n ->
  (p < n)%nat -> size (nth [::] (ITvalues n l1 l2) p) = n.
Proof.
case: n => // [] [|n] //=; first by case: p.
case: p => //=.
case => [|p] Hl1 Hl2 Hp //.
by rewrite size_size_ITvalues_rec ?Hl2.
Qed.

Lemma ITvalues_correct n l1 l2 v2n p i :
      l1 = nseq n I1 ->
      (2 * INR n)%R \contained_in v2n ->
      l2 = Icheby_nodes n v2n ->
      (p < n)%nat ->
      (i < n)%nat ->
      (pT _(i)).[mu n p] \contained_in nth I0 (nth [::] (ITvalues n l1 l2) i) p.
Proof.
case: n => // [] [|n] // l1D v2nD l2D.
  case: p => // _; case: i => //.
  rewrite pT0 hornerE [ITvalues _ _ _]/= {2}/nth => _.
  rewrite l1D nth_nseq.
  by apply: I.fromZ_correct.
move=> Hp Hi.
rewrite [ITvalues _ _]/=.
case: i Hi => [|[|i]].
- rewrite [ITvalues _ _ _]/= {2}/nth pT0 hornerE.
  rewrite l1D (@nth_nseq _ _ (n.+2)) Hp =>  _.
  by apply: I.fromZ_correct.
- rewrite [ITvalues _ _ _]/= l2D {2}/nth pT1 hornerE => _.
  rewrite mu_cheby_nodes //.
  by apply: Icheby_nodes_correct.
move=> Hi.
rewrite [nth [::] _ _]/=.
rewrite -{1}[i.+1]add1n -addSn.
rewrite mu_cheby_nodes //.
apply: ITvalues_rec_correct => //.
- by rewrite l1D l2D size_Icheby_nodes /= size_nseq.
- by move=> j Hj; rewrite l2D; apply: Icheby_nodes_correct.
- move=> j Hj.
  rewrite l1D pT0 hornerE (@nth_nseq _ _ (n.+2)).
  move: Hj; rewrite l1D /= size_nseq => ->.
  by apply: I.fromZ_correct.
- move=> j Hj.
  rewrite pT1 hornerE l2D.
  by apply: Icheby_nodes_correct.
by rewrite l2D size_Icheby_nodes.
Qed.

Fixpoint Isum (F : ID -> ID -> ID) l1 l2 :=
  if l1 is a :: l1 then
  if l2 is b :: l2 then
     add (F a b) (Isum F l1 l2)
  else I0
  else I0.

Lemma Isum_correct n a b c d g G (l1 l2 : seq R) Il1 Il2:
  (forall x y X Y,
     (a <= x <= b)%R -> (c <= y <= d)%R -> x \contained_in X -> y \contained_in Y
      -> g x y \contained_in G X Y) ->
  size l1 = n -> size l2 = n ->
  size Il1 = n -> size Il2 = n ->
  (forall i, (i < n)%nat -> nth 0 l1 i \contained_in nth I0 Il1 i) ->
  (forall i, (i < n)%nat -> nth 0 l2 i \contained_in nth I0 Il2 i) ->
  (forall i, (i < n)%nat -> (a <= nth 0 l1 i <= b)%R) ->
  (forall i, (i < n)%nat -> (c <= nth 0 l2 i <= d)%R) ->
  (\sum_(i < n) (g (nth 0 l1 i) (nth 0 l2 i)))
      \contained_in (Isum G Il1 Il2).
Proof.
move=> H; elim: l1 l2 Il1 Il2 n =>
   [|a1 l1 IH] [|b1 l2] [|A1 Il1] [|B1 Il2] [|n] //.
  move=> _ _ _ _ _ _ _ _.
  by rewrite big_ord0; apply: I.fromZ_correct.
move=> [sl1] [sl2] [sIl1] [sIl2] Cl1 Cl2 Inl1 Inl2.
rewrite big_ord_recl /=.
apply: add_correct.
  apply: H.
  - by apply: (Inl1 0%nat).
  - by apply: (Inl2 0%nat).
  - by have /= := Cl1 0%nat; apply.
  by have /= := Cl2 0%nat; apply.
apply: IH => // i Hi; first by apply: (Cl1 i.+1).
- by apply: (Cl2 i.+1).
- by apply: (Inl1 i.+1).
by apply: (Inl2 i.+1).
Qed.

Definition Icheby_coefs vn vl1 vl2 :=
  let g x y := mul (If x) y in
  let res := [seq div (mul I2 (Isum g vl1 i)) vn | i <- vl2] in
  if res is a :: res1 then (div a I2) :: res1
  else res.

Lemma size_Icheby_coefs vn vl1 vl2 :
  size (Icheby_coefs vn vl1 vl2) = size vl2.
Proof.
rewrite /Icheby_coefs.
case E : [seq _ | _ <- _] => [|a l].
  by rewrite -E size_map.
apply: etrans (_ : _ = size (a :: l)) _ => //.
by rewrite -E size_map.
Qed.

Lemma Icheby_coefs_correct n vn v2n l1 vl1 vl2 j :
   l1 = nseq n.+1 I1 ->
   (2 * INR n.+1)%R \contained_in v2n ->
   INR n.+1 \contained_in vn ->
   vl1 = Icheby_nodes n.+1 v2n ->
   vl2 = ITvalues n.+1 l1 vl1 ->
   (j < n.+1)%nat ->
	dsprod_coef (interpolation f (cheby_nodes n.+1)) n j \contained_in
             (nth I0 (Icheby_coefs vn vl1 vl2) j).
Proof.
move=> v1D v2nD vnD vl1D -> jL.
rewrite -dsprod_coefs.
rewrite /cheby_coefs /Icheby_coefs.
have := size_ITvalue n.+1 l1 vl1.
case E : ITvalues => [|a l] // _.
have -> : a = nth [::] (ITvalues n.+1 l1 vl1) 0 by rewrite E.
rewrite map_cons.
case: j jL => [|j] jL; set s := \sum_(i < _) _.
  rewrite eqxx {1}/nth.
  rewrite -[((1 / INR n.+1)%R * s)%RR]/((1 / INR n.+1 * s))%R.
  have -> : ((1 / INR n.+1) *  s =
             ((2 * s) / INR n.+1) / 2)%R.
    by field; apply: (not_INR _ 0).
  apply: div_correct; last first.
  - by apply: I.fromZ_correct.
  apply: div_correct => //.
  apply: mul_correct.
    by apply: I.fromZ_correct.
  have ->: s =
      \sum_(i < n.+1)
        f ((cheby_nodes n.+1)`_i) * (Tvalue_list n.+1 0)`_i.
    apply: eq_bigr => i _; congr (_ * _).
    by rewrite (nth_map 0) // size_cheby_nodes.
  apply: (@Isum_correct n.+1 (-1) (1) (-1) (1)
            (fun x y =>  f x * y)
            (fun x y =>  mul (If x)  y)) => //.
  - move=> x y X Y Ix Iy Hx Hy; apply: mul_correct => //.
    by apply: env.
  - by rewrite size_cheby_nodes.
  - by rewrite size_map size_iota.
  - by rewrite vl1D size_Icheby_nodes.
  - rewrite size_size_ITvalues //.
      by rewrite v1D size_nseq.
    by rewrite vl1D size_Icheby_nodes.
  - move=> i Hi; rewrite vl1D.
    by apply: Icheby_nodes_correct.
  - move=> i Hi.
    rewrite Tvalue_list_correct // -mu_cheby_nodes //.
    by apply: ITvalues_correct vl1D _ _.
  - move=> i Hi.
    suff : (-1 < nth 0 (cheby_nodes n.+1) i < 1)%R by lra.
    apply: cheby_nodes_bound.
    by apply: mem_nth; rewrite size_cheby_nodes.
  - move=> i Hi.
    by rewrite Tvalue_list_correct //= pT0 hornerE; toR; lra.
set u := (_ * _)%RR.
have {u}->: (u = (2 * s) / INR n.+1)%R.
  rewrite /u; set v := INR _.
  toR; rewrite /u /=.
  by field; apply: (not_INR _ 0).
have -> : forall a b, nth I0 (a ::  b) j.+1 = nth I0 b j by [].
rewrite (nth_map [::]); last first.
  by rewrite -ltnS  -[(size l).+1]/(size (a :: l)) -E size_ITvalue.
apply: div_correct => //.
apply: mul_correct.
  by apply: I.fromZ_correct.
have ->: s =
    \sum_(i < n.+1)
        f ((cheby_nodes n.+1)`_i) * (Tvalue_list n.+1 j.+1)`_i.
  apply: eq_bigr => i _; congr (_ * _).
  by rewrite (nth_map 0) // size_cheby_nodes.
apply: (@Isum_correct n.+1 (-1) 1 (-1) (1)
            (fun x y =>  f x * y)
            (fun x y =>  mul (If x)  y)) => //.
- move=> x y X Y Ix Iy Hx Hy; apply: mul_correct => //.
  by apply: env.
- by rewrite size_cheby_nodes.
- by rewrite size_map size_iota.
- by rewrite vl1D size_Icheby_nodes.
- rewrite -[nth [::] l j]/(nth [::] (a :: l) j.+1).
  rewrite -E size_size_ITvalues //.
    by rewrite v1D size_nseq.
  by rewrite vl1D size_Icheby_nodes.
- move=> i Hi; rewrite vl1D.
  by apply: Icheby_nodes_correct.
- move=> i Hi.
  rewrite Tvalue_list_correct // -mu_cheby_nodes //.
  rewrite -[nth [::] l j]/(nth [::] (a :: l) j.+1) -E.
  by apply: ITvalues_correct vl1D _ _.
- move=> i Hi.
  suff : (-1 < nth 0 (cheby_nodes n.+1) i < 1)%R by lra.
  apply: cheby_nodes_bound.
  by apply: mem_nth; rewrite size_cheby_nodes.
move=> i Hi.
rewrite Tvalue_list_correct //= -CPoly_trigo.pT_Cheby.
  apply: COS_bound.
suff : (-1 < (cheby_nodes n.+1)`_i < 1)%R by toR; lra.
apply: cheby_nodes_bound.
by apply: mem_nth; rewrite size_cheby_nodes.
Qed.

End Icheby_coefs.

(*****************************************************************************)
(* Chebyshev coefficient on [a; b] for real numbers                          *)
(*****************************************************************************)

Section scheby_coefs.

Context (a b : R).
Context (f : R -> R).

Definition svalue_list n:= [seq f i | i <- scheby_nodes a b n].

Lemma svalue_list_correct n i: (i < n)%nat ->
	(svalue_list n)`_i = f (scheby_nodes a b n)`_i.
Proof. by intros; rewrite (nth_map 0%RR); last rewrite size_scheby_nodes. Qed.

Definition scheby_coefs n j :=
   ((if j == 0%nat then 1 else 2) / INR (n.+1))%R * \sum_(i < n.+1)
            (svalue_list n.+1)`_i * (Tvalue_list n.+1 j)`_i.

Lemma sdsprod_coefs n j:
	a != b -> scheby_coefs n j = sdsprod_coef a b (interpolation f (scheby_nodes a b n.+1)) n j.
Proof.
intros.
rewrite sdsprod_coef_interpolation_pT //.
rewrite /scheby_coefs /svalue_list /Tvalue_list.
congr (_ * _) => //.
under [LHS] eq_bigr ? rewrite (nth_map 0%nat); last by rewrite size_iota.
under [LHS] eq_bigr ? rewrite Tvalues_correct nth_iota.
apply eq_bigr => i _.
rewrite (nth_map 0%RR); last by rewrite size_scheby_nodes.
congr (_ * _); last by rewrite mu_cheby_nodes // add0n.
by rewrite /scheby_nodes (nth_map 0%RR) // size_cheby_nodes.
Qed.

Definition scheby_coef_list n := [seq scheby_coefs n.-1 i | i <- seq.iota 0 n].

Lemma size_scheby_coef_list n :
  size (scheby_coef_list n) = n.
Proof. by rewrite size_map size_iota. Qed.

Lemma scheby_coef_list_spec n: b != a ->
	CPolyab a b (scheby_coef_list n) = interpolation f (scheby_nodes a b n).
Proof.
intros.
case: n => [ | n]; first by rewrite /CPolyab /= big_ord0.
rewrite [RHS](@sdsprod_cheby_eq a b n); [ | | ]; last first.
- by apply /leq_trans; first exact/interpolation_size; rewrite size_scheby_nodes.
- by apply /eqP => eq; move /eqP: H; rewrite eq.
rewrite /CPolyab size_map size_iota.
suff eq: forall i, (i < n.+1)%nat -> (scheby_coef_list n.+1)`_i = sdsprod_coef a b (interpolation f (scheby_nodes a b n.+1)) n i.
	by under eq_bigr ? rewrite eq.
move => i ineq.
rewrite (nth_map 0%nat); last by rewrite size_iota.
rewrite nth_iota //.
apply sdsprod_coefs.
by apply /eqP => eq; move /eqP: H; rewrite eq.
Qed.

End scheby_coefs.

(*****************************************************************************)
(* Chebyshev coefficient on [a; b] for interval arithmetic                   *)
(*****************************************************************************)

Section Ischeby_coefs.

Context (a b : D).
Context (f: R -> R).
Context (If: ID -> ID).
Hypothesis env: If \is_envelope_of[a, b] f.

Definition Isvalue_list n v2n := [seq If i | i <- Ischeby_nodes a b n v2n].

Lemma Isvalue_list_correct n v2n i: (i < n)%nat ->
  (F.cmp a b = Xlt) ->
  (2 * INR n)%R \contained_in v2n ->
  (f (scheby_nodes (D2R a) (D2R b) n)`_i) \contained_in nth I0 (Isvalue_list n v2n) i.
Proof.
move=> iLn aLb v2nD.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
rewrite (nth_map I0) ?size_Ischeby_nodes //.
apply: env; last by exact: Ischeby_nodes_correct.
apply: scheby_nodes_boundW => //.
by apply: mem_nth; rewrite size_scheby_nodes.
Qed.

Lemma Ischeby_coefs_correct n vn v2n l1 vl1 vl2 vl3 j :
   (F.cmp a b = Xlt) ->
   l1 = nseq n.+1 I1 ->
   (2 * INR n.+1)%R \contained_in v2n ->
   INR n.+1 \contained_in vn ->
   vl1 = Icheby_nodes n.+1 v2n ->
   vl2 = ITvalues n.+1 l1 vl1 ->
   vl3 = Ischeby_nodes a b n.+1 v2n ->
   (j < n.+1)%nat ->
	sdsprod_coef (D2R a) (D2R b)
    (interpolation f (scheby_nodes (D2R a) (D2R b) n.+1)) n j \contained_in
             (nth I0 (Icheby_coefs If vn vl3 vl2) j).
Proof.
move=> aLb v1D v2nD vnD vl1D -> -> jL.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
rewrite -sdsprod_coefs //; last by apply/eqP; lra.
rewrite /scheby_coefs /Icheby_coefs.
have := size_ITvalue n.+1 l1 vl1.
case E : ITvalues => [|a1 l] // _.
have -> : a1 = nth [::] (ITvalues n.+1 l1 vl1) 0 by rewrite E.
rewrite map_cons.
case: j jL => [|j] jL; set s := \sum_(i < _) _.
  rewrite eqxx {1}/nth.
  rewrite -[((1 / INR n.+1)%R * s)%RR]/((1 / INR n.+1 * s))%R.
  have -> : ((1 / INR n.+1) *  s =
             ((2 * s) / INR n.+1) / 2)%R.
    by field; apply: (not_INR _ 0).
  apply: div_correct; last first.
    by apply: I.fromZ_correct.
  apply: div_correct => //.
  apply: mul_correct.
    by apply: I.fromZ_correct.
  have ->: s =
      \sum_(i < n.+1)
        f ((scheby_nodes (D2R a) (D2R b) n.+1)`_i) * (Tvalue_list n.+1 0)`_i.
    apply: eq_bigr => i _; congr (_ * _).
    by rewrite (nth_map 0) // size_scheby_nodes.
  apply: (@Isum_correct n.+1 (D2R a) (D2R b) (-1) 1
            (fun x y =>  f x * y)
            (fun x y =>  mul (If x)  y)) => //.
  - move=> x y Ix Iy X Y Hx Hy; apply: mul_correct => //.
    by apply: env.
  - by rewrite size_scheby_nodes.
  - by rewrite size_map size_iota.
  - by rewrite size_Ischeby_nodes.
  - rewrite size_size_ITvalues //.
      by rewrite v1D size_nseq.
    by rewrite vl1D size_Icheby_nodes.
  - move=> i Hi.
    by apply: Ischeby_nodes_correct.
  - move=> i Hi.
    rewrite Tvalue_list_correct // -mu_cheby_nodes //.
    by apply: ITvalues_correct vl1D _ _.
  - move=> i Hi.
    apply: scheby_nodes_boundW => //.
    by apply: mem_nth; rewrite size_scheby_nodes.
  move=> i Hi.
  rewrite Tvalue_list_correct //= -CPoly_trigo.pT_Cheby.
    by apply: COS_bound.
  suff : (-1 < (cheby_nodes n.+1)`_i < 1)%R by toR; lra.
  apply: cheby_nodes_bound.
  by apply: mem_nth; rewrite size_cheby_nodes.
set u := (_ * _)%RR.
have {u}->: (u = (2 * s) / INR n.+1)%R.
  rewrite /u; set v := INR _.
  toR; rewrite /u /=.
  by field; apply: (not_INR _ 0).
have -> : forall a b, nth I0 (a ::  b) j.+1 = nth I0 b j by [].
rewrite (nth_map [::]); last first.
  by rewrite -ltnS  -[(size l).+1]/(size (a1 :: l)) -E size_ITvalue.
apply: div_correct => //.
apply: mul_correct.
  by apply: I.fromZ_correct.
have ->: s =
    \sum_(i < n.+1)
        f ((scheby_nodes (D2R a) (D2R b) n.+1)`_i) * (Tvalue_list n.+1 j.+1)`_i.
  apply: eq_bigr => i _; congr (_ * _).
  by rewrite (nth_map 0) // size_scheby_nodes.
apply: (@Isum_correct n.+1 (D2R a) (D2R b) (-1) 1
            (fun x y =>  f x * y)
            (fun x y =>  mul (If x)  y)) => //.
- move=> x y X Y Ix Iy Hx Hy; apply: mul_correct => //.
  by apply: env.
- by rewrite size_scheby_nodes.
- by rewrite size_map size_iota.
- by rewrite size_Ischeby_nodes.
- rewrite -[nth [::] l j]/(nth [::] (a1 :: l) j.+1).
  rewrite -E size_size_ITvalues //.
    by rewrite v1D size_nseq.
  by rewrite vl1D size_Icheby_nodes.
- move=> i Hi.
  by apply: Ischeby_nodes_correct.
- move=> i Hi.
  rewrite Tvalue_list_correct // -mu_cheby_nodes //.
  rewrite -[nth [::] l j]/(nth [::] (a1 :: l) j.+1) -E.
  by apply: ITvalues_correct vl1D _ _.
- move=> i Hi.
  apply: scheby_nodes_boundW => //.
  by apply: mem_nth; rewrite size_scheby_nodes.
move=> i Hi.
rewrite Tvalue_list_correct //= -CPoly_trigo.pT_Cheby.
  by apply: COS_bound.
suff : (-1 < (cheby_nodes n.+1)`_i < 1)%R by toR; lra.
apply: cheby_nodes_bound.
by apply: mem_nth; rewrite size_cheby_nodes.
Qed.

End Ischeby_coefs.

Record cms := CMS {
  P : seq ID;
  Delta : ID
 }.

Definition cms_correct n a b f (c : cms) :=
  let:  CMS P Delta  := c in
  size P = n.+1 /\
  exists p : seq R,
   [/\ size p = n.+1,
       forall i, p`_i \contained_in nth I0 P i &
     forall x, x \contained_in I.bnd a b ->
     exists d : R,
       d \contained_in Delta /\
       f x = ((CPolyab (D2R a) (D2R b) p).[x] + d)%R].

Lemma cms_correct_eval n a b f c x X :
  let:  CMS P Delta  := c in
  F.cmp a b = Xlt ->
  cms_correct n a b f c ->
  (x \contained_in X) -> (I.subset X (I.bnd a b)) ->
  f x \contained_in add (IsCshaw (I.bnd a a) (I.bnd b b) P X) Delta.
Proof.
case: c => P Delta aLb; case => SP [p [Sp pIP fE]] xIX XS.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have [] := fE x.
  have := subset_contains _ _ (I.subset_correct _ _ XS).
  by apply.
move=> y [Hy ->].
apply: add_correct => //.
apply: IsCshaw_correct => //.
- by rewrite SP.
- by rewrite /D2R /=; case: F.toX  => //= r; lra.
by rewrite /D2R /=; case: F.toX  => //= r; lra.
Qed.

Lemma cms_correct_ext n a b f g c :
  (forall x, x \contained_in I.bnd a b -> f x = g x) ->
  cms_correct n a b g c ->  cms_correct n a b f c.
Proof.
case: c=> P Delta H [SP [p [H1p H2p H3p]]].
split => //.
exists p; split => // x Hx.
have [d [Hd HHd]] := H3p x Hx; exists d; split => //.
by rewrite H.
Qed.

(*****************************************************************************)
(* Error Chebyshev model                                                     *)
(*****************************************************************************)

Definition error_cms n := CMS (nseq n.+1 I0) (I.bnd F.nan F.nan).

Lemma error_cms_correct n a b f :
   cms_correct n a b f (error_cms n).
Proof.
split; first by rewrite /= size_nseq.
exists (nseq n.+1 0); split => //.
- by rewrite /= size_nseq.
- move=> [|i]; first by rewrite /= F.fromZ_correct; toR; lra.
  by rewrite !nth_nseq; case: leqP => _; apply: I.fromZ_correct.
move=> y Hy; exists (f y); split.
  by split; rewrite F.nan_correct.
rewrite horner_CPolyab [CPoly _]big1 ?hornerE // => i _.
rewrite nth_nseq ifT ?scale0r //.
by have := ltn_ord i; rewrite {2}size_nseq.
Qed.

(*****************************************************************************)
(* Constant Chebyshev model                                                  *)
(*****************************************************************************)

Definition const_cms n x := CMS (x :: nseq n I0) I0.

Lemma const_cms_correct n a b x X :
   x \contained_in X ->
   cms_correct n a b (fun _ => x) (const_cms n X).
Proof.
split; first by rewrite /= size_nseq.
exists (x :: nseq n 0); split => //.
- by rewrite /= size_nseq.
- move=> [|i] /=.
    by rewrite /D2R; case: F.toX => //= r; lra.
  by rewrite !nth_nseq; case: leqP => _; apply: I.fromZ_correct.
move=> y Hy; exists 0; split; first by apply: I.fromZ_correct.
rewrite /CPolyab /= big_ord_recl big1 => [|i Hi] /=.
  by rewrite !hornerE horner_comp pT0 hornerE mulr1.
by rewrite nth_nseq if_same scale0r.
Qed.

Definition constZ_cms n z := const_cms n (I.fromZ z).

Lemma constZ_cms_correct n a b z :
   cms_correct n a b (fun _ => (IZR z)) (constZ_cms n z).
Proof. by apply/const_cms_correct/I.fromZ_correct. Qed.


(*****************************************************************************)
(* Variable Chebyshev model                                                  *)
(*****************************************************************************)

Definition var_cms a b n :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
   CMS (I.scale2 (add Ia Ib) (F.ZtoS (-1)) ::
        I.scale2 (sub Ib Ia) (F.ZtoS (-1)):: nseq n.-1 I0) I0.

Lemma var_cms_correct n a b :
   F.cmp a b = Xlt ->
   cms_correct n.+1 a b (fun x => x) (var_cms a b n.+1).
Proof.
move=> aLb.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
split; first by rewrite /= size_nseq.
have F x : (x / 2 = x * powerRZ 2 (-1))%R.
  by rewrite /=; field.
exists ((D2R a + D2R b) / 2 :: (D2R b - D2R a) / 2 :: nseq n 0)%R; split => //.
- by rewrite /= size_nseq.
- move=> [|[|i]].
  - rewrite F.
    by apply/scale2_correct/add_correct;
       rewrite /D2R /=; case: F.toX  => //= r; lra.
  - rewrite !F.
    by apply/scale2_correct/sub_correct;
       rewrite /D2R /=; case: F.toX  => //= r; lra.
  rewrite [_ `_ _]nth_nseq [nth _ _ _]nth_nseq !if_same.
  by apply: (I.fromZ_correct 0).
move=> y Hy; exists 0; split; first by apply: I.fromZ_correct.
rewrite /CPolyab /= !big_ord_recl big1 => [|i Hi] /=.
  rewrite !hornerE !horner_comp pT0 pT1 !hornerE /=.
  toR; rewrite /Rinvx ifT; last by apply/eqP; have/eqP:= F2; lra.
  by field; have/eqP:= F2; lra.
by rewrite nth_nseq if_same scale0r.
Qed.

(*****************************************************************************)
(* Opposite Chebyshev model                                                  *)
(*****************************************************************************)

Definition Iopp_Cpoly l := [seq I.neg i | i <- l].

Lemma size_Iopp_Cpoly P : size (Iopp_Cpoly P) = size P.
Proof. by rewrite size_map. Qed.

Notation "l '\lcontained_in' L" :=
 (forall i,  l`_i \contained_in nth I0 L i) (at level 20).

Lemma Iopp_Cpoly_correct p1 P1 :
  size p1 = size P1 ->
  p1 \lcontained_in P1 ->
  opp_Cpoly p1 \lcontained_in Iopp_Cpoly P1.
Proof.
elim: p1 P1 => [[|A P1]| a p1 IH [|b p2] Sp1 H1 [|i]] //.
  by apply: neg_correct (H1 0%nat).
apply: IH; first by case: Sp1.
by move=> i1; apply: (H1 i1.+1).
Qed.

Definition opp_cms (c : cms) :=
  let: CMS P Delta := c in
  CMS (Iopp_Cpoly P) (I.neg Delta).

Lemma opp_cms_correct n a b c f :
   cms_correct n a b f c ->
   cms_correct n a b (fun x => -(f x))%R (opp_cms c).
Proof.
case: c => [P Delta] [Sp [p [H1p H2p H3p]]].
split; first by rewrite size_map.
exists (opp_Cpoly p); split; first by rewrite size_map.
  by apply: Iopp_Cpoly_correct; rewrite ?Sp.
move=> x /H3p [d [H1d H2d]]; exists (- d); split => //.
  by apply: neg_correct.
rewrite horner_CPolyab opp_Cpoly_spec hornerE -horner_CPolyab.
rewrite H2d; toR; lra.
Qed.

(*****************************************************************************)
(* Addition Chebyshev model                                                  *)
(*****************************************************************************)

Fixpoint Iadd_Cpoly l1 l2 :=
  if l1 is a :: l3 then
    if l2 is b :: l4 then add a b :: Iadd_Cpoly l3 l4
    else l1
  else l2.

Lemma size_Iadd_Cpoly P1 P2 :
  size (Iadd_Cpoly P1 P2) = maxn (size P1) (size P2).
Proof.
elim: P1 P2 => [P2|a P1 IH [|b P2]] /=; first by rewrite max0n.
  by rewrite maxn0.
by rewrite IH maxnSS.
Qed.

Notation "l '\lcontained_in' L" :=
 (forall i,  l`_i \contained_in nth I0 L i) (at level 20).

Lemma Iadd_Cpoly_correct  p1 p2 P1 P2 :
  size p1 = size P1 -> size p2 = size P2 ->
  p1 \lcontained_in P1 ->
  p2 \lcontained_in P2 ->
  add_Cpoly p1 p2 \lcontained_in Iadd_Cpoly P1 P2.
Proof.
elim: p1 p2 P1 P2 => [[|b p2] [|A P1] [|B P2]|
                      a p1 IH [|b p2] [|A P1] [|B P2] Sp1 Sp2 H1 H2 [|i]] //.
- by apply: add_correct (H1 0%nat) (H2 0%nat).
apply: IH; first by case: Sp1.
- by case: Sp2.
- by move=> i1; apply: (H1 i1.+1).
by move=> i1; apply: (H2 i1.+1).
Qed.

Definition add_cms (c1 c2 : cms) :=
  let: CMS P1 Delta1 := c1 in
  let: CMS P2 Delta2 := c2 in
  CMS (Iadd_Cpoly P1 P2) (add Delta1 Delta2).

Lemma add_cms_correct n a b c1 c2 f1 f2 :
   cms_correct n a b f1 c1 -> cms_correct n a b f2 c2 ->
   cms_correct n a b (fun x => f1 x + f2 x)%R (add_cms c1 c2).
Proof.
case: c1 => [P1 Delta1] [Sp1 [p1 [H1p1 H2p1 H3p1]]].
case: c2 => [P2 Delta2] [Sp2 [p2 [H1p2 H2p2 H3p2]]].
split; first by rewrite size_Iadd_Cpoly Sp1 Sp2 maxnn.
exists (add_Cpoly p1 p2); split.
- by rewrite size_add_Cpoly H1p1 H1p2 maxnn.
- apply: Iadd_Cpoly_correct => //.
    by rewrite H1p1 Sp1.
  by rewrite H1p2 Sp2.
move=> x Hx.
have  [d1 [H1d1 H2d1]] := H3p1 _ Hx.
have  [d2 [H1d2 H2d2]] := H3p2 _ Hx.
exists (d1 + d2); split => //.
  by apply: add_correct.
rewrite horner_CPolyab add_Cpoly_spec hornerE.
rewrite -!horner_CPolyab ?H1p1 ?H1p2 //.
by rewrite H2d1 H2d2 hornerE; toR; lra.
Qed.

(*****************************************************************************)
(* Subtraction Chebyshev model                                               *)
(*****************************************************************************)

Fixpoint Isub_Cpoly l1 l2 :=
  if l1 is a :: l3 then
    if l2 is b :: l4 then sub a b :: Isub_Cpoly l3 l4
    else l1
  else [seq I.neg i | i <- l2].

Lemma size_Isub_Cpoly P1 P2 :
  size (Isub_Cpoly P1 P2) = maxn (size P1) (size P2).
Proof.
elim: P1 P2 => [P2|a P1 IH [|b P2]] /=; first by rewrite size_map max0n.
  by rewrite maxn0.
by rewrite IH maxnSS.
Qed.

Lemma Isub_Cpoly_correct  p1 p2 P1 P2 :
  size p1 = size P1 -> size p2 = size P2 ->
  p1 \lcontained_in P1 ->
  p2 \lcontained_in P2 ->
  sub_Cpoly p1 p2 \lcontained_in Isub_Cpoly P1 P2.
Proof.
elim: p1 p2 P1 P2 => [[|b p2] [|A P1] [|B P2]|
                      a p1 IH [|b p2] [|A P1] [|B P2] Sp1 Sp2 H1 H2 [|i]] //.
- move=> _ Sp2 _ H [|i] /=.
    by apply/neg_correct/(H 0%nat).
- apply: Iopp_Cpoly_correct; first by case: Sp2.
  by move=> i1; apply: (H i1.+1).
- by apply: sub_correct (H1 0%nat) (H2 0%nat).
apply: IH; first by case: Sp1.
- by case: Sp2.
- by move=> i1; apply: (H1 i1.+1).
by move=> i1; apply: (H2 i1.+1).
Qed.

Definition sub_cms (c1 c2 : cms) :=
  let: CMS P1 Delta1 := c1 in
  let: CMS P2 Delta2 := c2 in
  CMS (Isub_Cpoly P1 P2) (sub Delta1 Delta2).

Lemma sub_cms_correct n a b c1 c2 f1 f2 :
   cms_correct n a b f1 c1 -> cms_correct n a b f2 c2 ->
   cms_correct n a b (fun x => f1 x - f2 x)%R (sub_cms c1 c2).
Proof.
case: c1 => [P1 Delta1] [Sp1 [p1 [H1p1 H2p1 H3p1]]].
case: c2 => [P2 Delta2] [Sp2 [p2 [H1p2 H2p2 H3p2]]].
split; first by rewrite size_Isub_Cpoly ?Sp1 ?Sp2 maxnn.
exists (sub_Cpoly p1 p2); split.
- by rewrite size_sub_Cpoly H1p1 H1p2 maxnn.
- by apply: Isub_Cpoly_correct; rewrite ?Sp1 ?Sp2.
move=> x Hx.
have  [d1 [H1d1 H2d1]] := H3p1 _ Hx.
have  [d2 [H1d2 H2d2]] := H3p2 _ Hx.
exists (d1 - d2); split => //.
  by apply: sub_correct.
rewrite horner_CPolyab sub_Cpoly_spec hornerD hornerN ?H1p1 ?H1p2 //.
rewrite -!horner_CPolyab H2d1 H2d2 !hornerE /=; toR; lra.
Qed.

Definition eval_range_poly (P : seq ID) :=
  if P is p :: P1 then
        foldl (fun x y => add x (mul y Im11)) p P1 else I0.

Lemma eval_range_poly_correct n p P x (a b : D) :
       (F.cmp a b = Xlt)%R ->
       size p = n ->
       size P = n ->
       p \lcontained_in P ->
       x \contained_in (I.bnd a b)  ->
       (\sum_(i < n) p`_i *: 'T^(D2R a, D2R b)_i).[x] \contained_in
      eval_range_poly P.
Proof.
move=> aLb sp sP pIP xIab.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
rewrite /eval_range_poly.
case: n P p sP sp pIP => [/= [] // [] // _ _ _ /=|].
  by rewrite F.fromZ_correct /= big_ord0 hornerE; toR; lra.
elim=> [ [//|p1 [|]//] [//|p1p [|]// _ _ pIP]|
   n IH [|p1 [|p2 P]] // [|p1p [|p2p p]]// [] sP [] sp pIP].
  rewrite /CPolyab big_ord1 /= !hornerE horner_comp pT0 hornerE mulr1.
  by apply: (pIP 0%N).
rewrite [_ :: P]lastI big_ord_recr /=.
rewrite (eq_bigr (fun i : 'I_n.+1 =>
      (p1p :: seq.belast p2p p)`_i *: 'T^(D2R a,D2R b)_i)); last first.
  move=> i1 _.
  rewrite lastI nth_rcons size_belast ifT //=.
  by have := ltn_ord i1; rewrite -{2}sp.
rewrite foldl_rcons.
rewrite hornerE.
apply: add_correct; last first.
  rewrite hornerE.
  apply: mul_correct.
    have /= := pIP n.+1.
    by rewrite (last_nth I0) sP.
  rewrite I.bnd_correct /= !F.fromZ_correct.
  rewrite horner_comp -CPoly_trigo.pT_Cheby.
    apply: COS_bound.
  apply: Tab_bound => //.
  move: xIab aLb.
  rewrite F.cmp_correct I.bnd_correct /= /D2R.
  by do 2 case: F.toX.
apply:  (IH (p1 :: (seq.belast p2 P))) => //=.
- by rewrite size_belast sP.
- by rewrite size_belast sp.
move=> j /=.
case: (leqP n.+1 j) => [nLj|jLn].
  rewrite !nth_default //.
  - rewrite I.bnd_correct /= F.fromZ_correct; toR; lra.
  - by rewrite /= size_belast sp.
  by rewrite /= size_belast sP.
have := pIP j.
rewrite /= [p2p :: p]lastI [p2 :: P]lastI /=.
by rewrite -!rcons_cons !nth_rcons /= !size_belast sp sP jLn.
Qed.

Definition eval_range_cms (c : cms) :=
  let: CMS P Delta := c in
  add (eval_range_poly P) Delta.

Lemma CPolyabE n (a b : R) p x (sp : size p = n) :
   a != b ->
   (CPolyab a b p).[x] =
        (\sum_(i < n) p`_i *: 'T^(a,b)_i).[x].
Proof.
move=> aDb.
rewrite horner_CPolyab !horner_sum /= sp.
apply: eq_bigr => j _.
rewrite [LHS]hornerE [RHS]hornerE; congr (_ * _).
rewrite horner_pTab; congr (_.[_]).
rewrite !hornerE -mulr_natl natr_INR //=.
have F : b + - a != 0.
  have := (@subr_eq0 _ b a).
  by toR => ->; rewrite eq_sym.
toR; rewrite /Rinvx ifT //.
by field; apply/eqP.
Qed.

Lemma eval_range_cms_correct n a b f c i x :
   F.cmp a b = Xlt ->
   cms_correct n a b f c ->
   I.subset i (I.bnd a b) ->
   x \contained_in i -> f x \contained_in eval_range_cms c.
Proof.
move=> aLb.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
case: c => P Delta [Hs [p [H1p H2p H3p]]] Hi Hx.
have Hy : x \contained_in I.bnd a b.
  case: i Hi Hx; rewrite //= => l u.
  rewrite !F.cmp_correct /= !F.real_correct.
  (do 4! case: F.toX => //=);
     try (by move=> r1 r2; case: Rcompare_spec => //; lra);
     try (by move=> r1 r2 r3; case: Rcompare_spec => //; lra);
     try (by move=> r1 r2 r3 r4; do! case: Rcompare_spec => //; lra).
have [d [H1d ->]] := H3p _ Hy.
rewrite /=.
apply: add_correct => //.
rewrite (CPolyabE _ H1p) //.
by apply: eval_range_poly_correct.
Qed.

Lemma isubset_refl i : I.subset i i.
Proof.
case: i => //= l u; rewrite !F.cmp_correct !F.real_correct /=.
do 2 case: F.toX => //=.
move=> r; case: Rcompare_spec => //; lra.
move=> r; case: Rcompare_spec => //; lra.
(move=> r1 r2; do 2 case: Rcompare_spec)=> //; lra.
Qed.

(* Should be something simpler *)
Lemma eval_range_cms_subset n a b c d f cm x :
   F.cmp a b = Xlt ->
   F.cmp c d = Xlt ->
   cms_correct n a b f cm ->
   I.subset (eval_range_cms cm) (I.bnd c d) ->
   x \contained_in I.bnd a b -> f x \contained_in (I.bnd c d).
Proof.
move=> aLb cLd Hc /I.subset_correct Hi Hx.
have := eval_range_cms_correct aLb Hc (isubset_refl _) Hx.
case: eval_range_cms Hi => //= l u.
have := F.cmp_correct c d; rewrite cLd.
case: F.toX => // cr; case: F.toX => //= dr.
case El : (F.toX l) => [|xl] /=.
  case Eu : (F.toX u) => [|xu] //=.
    by move=> _ [_ []].
  by move=> _ [].
case: Rcompare_spec => //=.
rewrite /le_lower /le_upper /=.
case Eu : (F.toX u) => [|xu] //=.
  by move=> _ _ [].
by lra.
Qed.

(*****************************************************************************)
(* Multiplication Chebyshev model                                            *)
(*****************************************************************************)

Fixpoint Iabs_mul_Cpoly n (a : ID) acc l :=
 if n is n1.+1 then
   if l is b :: l1 then Iabs_mul_Cpoly n1 a ((I.scale2 (mul a b) (F.ZtoS (-1))) :: acc) l1
   else (ncons n.+1 I0 acc)
 else  Iadd_Cpoly (I0 :: acc) [seq (I.scale2 (mul a i) (F.ZtoS (-1))) | i <- l].

Lemma size_Iabs_mul_Cpoly n (a : R) A acc Acc l L :
  size acc = size Acc -> size l = size L ->
  size (Iabs_mul_Cpoly n A Acc L) = size (abs_mul_Cpoly n a acc l).
Proof.
elim: n acc Acc l L => [acc Acc l L H1 H2|n IH acc Acc [|b l] [|B L] H1 H2 //].
- by rewrite size_Iadd_Cpoly size_add_Cpoly /= !size_map H1 H2.
- by rewrite !size_ncons H1.
apply: IH => //=; first by rewrite H1.
by case: H2.
Qed.

Lemma Iabs_mul_Cpoly_correct n a A acc Acc l L :
  size acc = size Acc -> size l = size L ->
  a \contained_in A -> acc \lcontained_in Acc -> l \lcontained_in L ->
  abs_mul_Cpoly n a acc l \lcontained_in Iabs_mul_Cpoly n A Acc L.
Proof.
elim: n acc Acc l L => [acc Acc [|b l] [|B L] H1 H2 H3 H4 H5 i|
                        n IH acc Acc [|b l] [|B L] H1 H2 H3 H4 H5 i] //.
- apply: Iadd_Cpoly_correct => //=; first by rewrite H1.
  move=> [|i1]; first by apply: I.fromZ_correct.
  by apply: H4.
- apply: Iadd_Cpoly_correct => //=.
  - by rewrite H1.
  - by rewrite !size_map.
  - move=> [|i1]; first by apply: I.fromZ_correct.
    by apply: H4.
  move=> i1.
  have [lLi1|i1Ll] := leqP (size l).+1 i1.
    rewrite /= !nth_default ?size_map -?H2//.
    - by apply: I.fromZ_correct.
    - by rewrite /= size_map.
    by rewrite /= size_map; case: H2 => <-.
  pose f b :=  a * b / 2%:R.
  have /=-> := @nth_map _ 0 _ 0 f _ (_ :: _) => //.
  pose F b := I.scale2 (mul A b) (F.ZtoS (-1)).
  have /=-> := @nth_map _ I0 _ I0 F _ (_ :: _); last first.
    by case: H2 => <-.
  rewrite (_ :  f _ = (a * (b :: l)`_i1) * powerRZ 2 (-1)); last first.
    rewrite /f /=; toR; rewrite /Rinvx ifT; first by field.
    by apply/eqP; lra.
  by apply/scale2_correct/mul_correct.
- rewrite !nth_ncons; case: leqP => _ //.
  by apply: I.fromZ_correct.
apply: IH => //=.
- by rewrite H1.
- by case: H2.
- move=> [|i1].
    rewrite (_ : _ / _ = (a * b) * powerRZ 2 (-1)); last first.
      rewrite /=; toR; rewrite /Rinvx ifT; first by field.
      by apply/eqP; lra.
    apply/scale2_correct/mul_correct => //.
    by apply: H5 0%nat.
  by apply: H4 i1.
by move=> i1; apply: H5 i1.+1.
Qed.

Definition Iadd_mul_Cpoly n (a : ID) l :=
  ncons n I0 [seq I.scale2 (mul a i) (F.ZtoS (-1))| i <- l].

Lemma size_Iadd_mul_Cpoly n (a : R) A l L :
  size l = size L ->
  size (Iadd_mul_Cpoly n A L) = size (add_mul_Cpoly n a l).
Proof.
by move=> H; rewrite !size_ncons !size_map H.
Qed.

Lemma Iadd_mul_Cpoly_correct n a A l L :
  size l = size L ->
  a \contained_in A -> l \lcontained_in L ->
  add_mul_Cpoly n a l \lcontained_in Iadd_mul_Cpoly n A L.
Proof.
move=> Hs Ha Hl i.
rewrite !nth_ncons; case: leqP => H; last by apply: I.fromZ_correct.
have [lLi1|i1Ll] := leqP (size l) (i - n)%nat.
  rewrite !nth_default ?size_map -?Hs //.
  by apply: I.fromZ_correct.
rewrite (nth_map 0) // (nth_map I0) -?Hs //.
rewrite (_ : _ / _ = (a * l`_(i - n)) * powerRZ 2 (-1)); last first.
  rewrite /=; toR; rewrite /Rinvx ifT; first by field.
  by apply/eqP; lra.
by apply/scale2_correct/mul_correct.
Qed.

Fixpoint Imul_rec_Cpoly n l1 l2 :=
  if l1 is a :: l3 then
    let v1 := Iabs_mul_Cpoly n a [::] l2 in
    let v2 := Iadd_mul_Cpoly n a l2 in
    Iadd_Cpoly (Iadd_Cpoly v1 v2) (Imul_rec_Cpoly n.+1 l3 l2)
  else [::].

Lemma size_Imul_rec_Cpoly n (l1 : seq R) l2 L1 L2 :
  size l1 = size L1 -> size l2 = size L2 ->
  size (Imul_rec_Cpoly n L1 L2) = size (mul_rec_Cpoly n l1 l2).
Proof.
elim: l1 L1 n => [[|]|a l1 IH [|A L1] n // [H1] H2] //=.
rewrite !size_Iadd_Cpoly !size_add_Cpoly.
rewrite (@size_Iabs_mul_Cpoly _ a _ [::] _ l2) //.
rewrite (@size_Iadd_mul_Cpoly _ a _ l2) //.
by rewrite IH.
Qed.

Lemma Imul_rec_Cpoly_correct n p1 p2 P1 P2 :
  size p1 = size P1 -> size p2 = size P2 ->
  p1 \lcontained_in P1 ->
  p2 \lcontained_in P2 ->
  mul_rec_Cpoly n p1 p2 \lcontained_in Imul_rec_Cpoly n P1 P2.
Proof.
elim: p1 p2 P1 P2 n => [p2 [|A P1] P2 n |
                      a p1 IH p2 [|A P1] P2 n // [Sp1] Sp2 H1 H2] //.
apply: Iadd_Cpoly_correct => //.
- rewrite size_add_Cpoly size_Iadd_Cpoly.
  congr (maxn _ _).
    by apply/sym_equal/size_Iabs_mul_Cpoly.
  by apply/sym_equal/size_Iadd_mul_Cpoly.
apply/sym_equal/size_Imul_rec_Cpoly => //.
  apply: Iadd_Cpoly_correct.
  - by apply/sym_equal/size_Iabs_mul_Cpoly.
  - by apply/sym_equal/size_Iadd_mul_Cpoly.
  - apply: Iabs_mul_Cpoly_correct => //.
      by apply: H1 0%nat.
    by move=> i; rewrite !nth_nil; apply: I.fromZ_correct.
  apply: Iadd_mul_Cpoly_correct => //.
  by apply: H1 0%nat.
apply: IH => //.
by move=> i; apply: H1 i.+1.
Qed.

Definition Imul_Cpoly (l1 l2 : seq ID) := Imul_rec_Cpoly 0 l1 l2.

Lemma size_Imul_Cpoly (l1 : seq R) l2 L1 L2 :
  size l1 = size L1 -> size l2 = size L2 ->
  size (Imul_Cpoly L1 L2) = size (mul_Cpoly l1 l2).
Proof. exact: size_Imul_rec_Cpoly. Qed.

Lemma Imul_Cpoly_correct p1 p2 P1 P2 :
  size p1 = size P1 -> size p2 = size P2 ->
  p1 \lcontained_in P1 ->
  p2 \lcontained_in P2 ->
  mul_Cpoly p1 p2 \lcontained_in Imul_Cpoly P1 P2.
Proof. exact: Imul_rec_Cpoly_correct. Qed.

Fixpoint Isplit_Cpoly n l :=
  if n is n1.+1 then
    if l is a :: l1 then let: (l2,l3) := Isplit_Cpoly n1 l1 in (a :: l2, I0 :: l3)
    else (nseq n I0, [::])
  else ([::], l).

Lemma size_Isplit_Cpoly1 n l : size (Isplit_Cpoly n l).1 = n.
Proof.
elim: n l => //= n IH [|a l] /=; first by rewrite size_nseq.
by case: Isplit_Cpoly (IH l) => /= l1 _ ->.
Qed.

Lemma size_Isplit_Cpoly2 n (l : seq R) L :
 size l = size L ->
 size (Isplit_Cpoly n L).2 = size (split_Cpoly n l).2.
Proof.
elim: n l L => //= n IH [|a l] [|A L] //= [H].
by have := IH l L; case: Isplit_Cpoly => L1 L2; case: split_Cpoly => l1 l2 /= ->.
Qed.

Lemma Isplit_Cpoly_correct1 n (p : seq R) P :
  size p = size P ->
  p \lcontained_in P ->
  (split_Cpoly n p).1 \lcontained_in (Isplit_Cpoly n P).1.
Proof.
elim: n p P => [p P _ _| n IH [|a p] [|A P] H1 H2] //=.
- by move=> i; rewrite !nth_nil; apply: I.fromZ_correct.
- move=> i; rewrite !(@nth_nseq _ _ n.+1) !if_same.
  by apply: I.fromZ_correct.
case: H1 => /IH; case: split_Cpoly => p1 p2; case: Isplit_Cpoly => P1 P2 /= H [|i].
  by apply: H2 0%nat.
apply: H => i1.
by apply: H2 i1.+1.
Qed.

Lemma Isplit_Cpoly_correct2 n (p : seq R) P :
  size p = size P ->
  p \lcontained_in P ->
  (split_Cpoly n p).2 \lcontained_in (Isplit_Cpoly n P).2.
Proof.
elim: n p P => [p P _ _| n IH [|a p] [|A P] H1 H2] //=.
case: H1 => /IH; case: split_Cpoly => p1 p2; case: Isplit_Cpoly => P1 P2 /= H [|i].
  by apply: I.fromZ_correct.
apply: H => i1.
by apply: H2 i1.+1.
Qed.

Definition mul_cms n a b (c1 c2 : cms) :=
  let: CMS P1 Delta1 := c1 in
  let: CMS P2 Delta2 := c2 in
  let: P3 := Imul_Cpoly P1 P2 in
  let: (P4, P5) := Isplit_Cpoly n.+1 P3 in
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Iab := I.bnd a b in
  let Delta3 := eval_range_poly P1  in
  let Delta4 := eval_range_poly P2  in
  let Delta5 := eval_range_poly P5  in
  CMS P4 (add Delta5 (add (mul Delta1 Delta4)
                     (add (mul Delta2 Delta3)
                          (mul Delta1 Delta2)))).

Lemma mul_cms_correct n a b c1 c2 f1 f2 :
   F.cmp a b = Xlt ->
   cms_correct n a b f1 c1 -> cms_correct n a b f2 c2 ->
   cms_correct n a b (fun x => f1 x * f2 x)%R (mul_cms n a b c1 c2).
Proof.
move=> aLb.
have a_in_Ia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have b_in_Ib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
case: c1 => [P1 Delta1] [Sp1 [p1 [H1p1 H2p1 H3p1]]].
case: c2 => [P2 Delta2] [Sp2 [p2 [H1p2 H2p2 H3p2]]].
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
rewrite /cms_correct /mul_cms.
case E : Isplit_Cpoly => [P4 P5].
split.
  by rewrite -[P4]/(P4,P5).1 -E size_Isplit_Cpoly1.
pose p := mul_Cpoly p1 p2.
exists (split_Cpoly n.+1 p).1.
split => //.
- by rewrite split_Cpoly_size1.
- rewrite -[P4]/(P4, P5).1 -E.
  apply: Isplit_Cpoly_correct1.
  by rewrite (@size_Imul_Cpoly p1 p2) ?Sp1 ?Sp2.
- by apply: Imul_Cpoly_correct; rewrite ?Sp1 ?Sp2.
move=> x xIab.
have [d1 [H1d1 H2d1]] := H3p1 _ xIab.
have [d2 [H1d2 H2d2]] := H3p2 _ xIab.
pose sp := split_Cpoly n.+1 p.
pose Cp := CPolyab (D2R a) (D2R b).
exists ((Cp sp.2).[x] + d1 * (Cp p2).[x] +
           d2 * (Cp p1).[x] + d1 * d2).
split.
  rewrite -!addrA.
  apply: add_correct.
    apply: eval_range_poly_correct => //.
      rewrite -[P5]/(P4, P5).2 -E (@size_Isplit_Cpoly2 n.+1 p) //.
      by rewrite (@size_Imul_Cpoly p1 p2) ?Sp1 ?Sp2.
    rewrite -[P5]/(P4, P5).2 -E.
    apply: Isplit_Cpoly_correct2 => //.
      by rewrite (@size_Imul_Cpoly p1 p2) ?Sp1 ?Sp2.
    by apply: Imul_Cpoly_correct; rewrite ?Sp1 ?Sp2.
  apply: add_correct.
    apply: mul_correct => //.
    by apply: eval_range_poly_correct; rewrite ?Sp1 ?Sp2.
  apply: add_correct.
    apply: mul_correct => //.
    by apply: eval_range_poly_correct; rewrite ?Sp1 ?Sp2.
  by apply: mul_correct.
rewrite /Cp H2d1 H2d2 /p /sp -addrA.
set x1 := _.[_]; set x2 := _.[_].
set x3 := _.[_]; set x4 := _.[_].
suff F : x1 * x2 = x3 + x4.
  by move: F; toR => F; ring[F].
rewrite /x1 /x2 /x3 /x4 !horner_CPolyab.
rewrite -hornerM -hornerD -horner_split_Cpoly mul_Cpoly_correct //.
by apply/eqP; toR; lra.
Qed.

(*****************************************************************************)
(* Scale 2  Chebyshev model                                                  *)
(*****************************************************************************)

Definition Iscl2_Cpoly l := [seq scl2 i | i <- l].

Lemma size_Iscl2_Cpoly P : size (Iscl2_Cpoly P) = size P.
Proof. by rewrite size_map. Qed.

Lemma Iscl2_Cpoly_correct  p P :
  size p = size P -> p \lcontained_in P ->
  scl2_Cpoly p \lcontained_in Iscl2_Cpoly P.
Proof.
elim: p P => [[|A P1] | a p1 IH [|A P1] Sp H [|i]] //=.
  by apply: scl2_correct (H 0%nat).
apply: IH; first by case: Sp.
by move=> i1; apply: (H i1.+1).
Qed.

Definition scl2_cms (c: cms) :=
  let: CMS P Delta := c in
  CMS (Iscl2_Cpoly P) (scl2 Delta).

Lemma scl2_cms_correct n a b c f :
   cms_correct n a b f c ->
   cms_correct n a b (fun x => f x *+ 2)%R (scl2_cms c).
Proof.
case: c => [P Delta] [Sp [p [H1p H2p H3p]]].
split; first by rewrite size_Iscl2_Cpoly Sp.
exists (scl2_Cpoly p); split.
- by rewrite size_scl2_Cpoly H1p.
- by apply: Iscl2_Cpoly_correct; rewrite // H1p Sp.
move=> x Hx.
have  [d [H1d H2d]] := H3p _ Hx.
exists (d *+ 2); split => //.
  by apply: scl2_correct.
rewrite horner_CPolyab scl2_Cpoly_spec hornerE hornerMn /=.
rewrite -!horner_CPolyab ?H1p //.
by rewrite H2d mulrnDl [d *+ 2]mulr2n addrA.
Qed.

(*****************************************************************************)
(* Composition Chebyshev model                                               *)
(*****************************************************************************)

Section ICb.

Variable n : nat.
Variables a b : D.

Fixpoint ICb_cms (q : seq ID) (x : cms) : (cms * cms) :=
 if q is c :: q' then
   let t := ICb_cms q' x in
   let a1 := sub_cms (add_cms (const_cms n c) (mul_cms n a b (fst t) x)) (snd t) in
   (a1, (fst t)) else
   let cm := const_cms n I0 in (cm,cm).

Lemma ICb_cms_correct p P f c :
   F.cmp a b = Xlt ->
   p \lcontained_in P ->
   size p = size P ->
   cms_correct n a b f c ->
   cms_correct n a b (fun x => (Cb p (f x)).1) (ICb_cms P c).1
  /\
   cms_correct n a b (fun x => (Cb p (f x)).2) (ICb_cms P c).2.
Proof.
move=> aLb.
case: c => [P1 Delta1].
elim: p P => [[|//] _ _ H|a1 p IH [|A1 P] // H Hs Hc].
by split; apply/const_cms_correct/I.fromZ_correct.
case: (IH P) => [i|||IH1 IH2] //; first by apply: H i.+1.
  by case: Hs.
split => //.
apply: sub_cms_correct => //.
apply: add_cms_correct.
  by apply/const_cms_correct/(H 0%nat).
by apply: mul_cms_correct.
Qed.

Definition ICshaw_cms p x :=
  let: (i1, i2) := ICb_cms p (scl2_cms x) in sub_cms i1 (mul_cms n a b i2 x).

Lemma ICshaw_cms_correct p P f c :
   F.cmp a b = Xlt ->
   p \lcontained_in P ->
   size p = size P ->
   cms_correct n a b f c ->
   cms_correct n a b ((Cshaw p) \o f) (ICshaw_cms P c).
Proof.
move=> aLb Hp Hs Hc.
have [H1 H2] := ICb_cms_correct aLb Hp Hs (scl2_cms_correct Hc).
pose k x := (Cb p (f x *+ 2)).1 - (Cb p (f x *+ 2)).2 * f x.
apply: (@cms_correct_ext _ _ _ _ k) => [x Hx |].
  by rewrite /Cshaw /k /=; case: Cb.
rewrite /k /ICshaw_cms.
case: ICb_cms H1 H2 => I1 I2 H1 H2.
apply: sub_cms_correct => //.
by apply: mul_cms_correct.
Qed.

Definition IsCshaw_cms c d p x :=
  let C := I.bnd c c in
  let D := I.bnd d d in
  let cm := I.inv prec (sub D C) in
  let cm1 := scl2 cm in
  let cm2 := mul (add C D) cm in
  let x1 := sub_cms (mul_cms n a b (const_cms n cm1) x) (const_cms n cm2) in
  ICshaw_cms p x1.

Lemma IsCshaw_cms_correct c d p P f cm :
   F.cmp a b = Xlt ->
   F.cmp c d = Xlt ->
   (forall x, x \contained_in I.bnd a b -> f x \contained_in (I.bnd c d)) ->
   p \lcontained_in P ->
   size p = size P ->
   cms_correct n a b f cm ->
   cms_correct n a b (fun x => (CPolyab (D2R c) (D2R d) p).[f x]) (IsCshaw_cms c d P cm).
Proof.
move=> aLd cLd HI Hp Hs Hc.
have F1 : (D2R c < D2R d)%R.
  have := F.cmp_correct c d; rewrite cLd.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R c != D2R d by apply/eqP; lra.
apply: cms_correct_ext => [x Hx|].
  rewrite horner_CPolyab //.
pose k := (Cshaw p) \o (fun x => (Tab (D2R c) (D2R d)).[f x]).
apply: (@cms_correct_ext _ _ _ _ k) => [x Hx|] //.
  by rewrite /k /= Cshaw_spec //.
apply: ICshaw_cms_correct => //.
apply: cms_correct_ext => [x Hx|].
  rewrite !hornerE mulNr (_ : 1 + 1 = 2%:R); last by toR; ring.
  by rewrite [_/_]mulr_natl.
have Fc : D2R c \contained_in I.bnd c c.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Fb : D2R d \contained_in I.bnd d d.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have FF : (D2R d - D2R c)^-1 \contained_in
             I.inv prec (sub (I.bnd d d) (I.bnd c c)).
  rewrite /GRing.inv [_ _  (_ - _)]/= /Rinvx.
  rewrite ifT; last by rewrite subr_eq0 eq_sym.
  by apply/inv_correct/sub_correct.
apply: sub_cms_correct.
  apply: mul_cms_correct => //.
  apply: const_cms_correct.
  by apply: scl2_correct.
apply: const_cms_correct.
apply: mul_correct => //.
by apply: add_correct.
Qed.

End ICb.


Definition eval_shaw_cms a b (c : cms) I :=
  let: CMS P Delta := c in
  add (IsCshaw (I.bnd a a) (I.bnd b b) P I) Delta.

Lemma eval_shaw_cms_correct n a b f c i x :
   F.cmp a b = Xlt ->
   cms_correct n a b f c ->
   I.subset i (I.bnd a b) ->
   x \contained_in i -> f x \contained_in eval_shaw_cms a b c i.
Proof.
move=> aLb.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
case: c => P Delta [Hs [p [H1p H2p H3p]]] Hi Hx.
have Hy : x \contained_in I.bnd a b.
  case: i Hi Hx; rewrite //= => l u.
  rewrite !F.cmp_correct /= !F.real_correct.
  (do 4! case: F.toX => //=);
     try (by move=> r1 r2; case: Rcompare_spec => //; lra);
     try (by move=> r1 r2 r3; case: Rcompare_spec => //; lra);
     try (by move=> r1 r2 r3 r4; do! case: Rcompare_spec => //; lra).
have [d [H1d ->]] := H3p _ Hy.
apply: add_correct => //.
have->: (CPolyab (D2R a) (D2R b) p).[x] =
        (\sum_(i < n.+1) p`_i *: 'T^(D2R a, D2R b)_i).[x].
  rewrite horner_CPolyab !horner_sum H1p.
  apply: eq_bigr => j _.
  rewrite [LHS]hornerE [RHS]hornerE; congr (_ * _).
  rewrite horner_pTab; congr (_.[_]).
  rewrite !hornerE -mulr_natl natr_INR //=.
  have F : D2R b + - D2R a != 0.
    have := (@subr_eq0 _ (D2R b) (D2R a)).
    by toR => ->; rewrite eq_sym.
  toR; rewrite /Rinvx ifT //.
  by field; apply/eqP.
apply: IsCshaw_correct => //.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
by rewrite /D2R /=; case: F.toX  => //= r; lra.
Qed.

(* Should be something simpler *)
Lemma eval_shaw_cms_subset n a b c d f cm x :
   F.cmp a b = Xlt ->
   F.cmp c d = Xlt ->
   cms_correct n a b f cm ->
   I.subset (eval_shaw_cms a b cm (I.bnd a b)) (I.bnd c d) ->
   x \contained_in I.bnd a b -> f x \contained_in (I.bnd c d).
Proof.
move=> aLb cLd Hc /I.subset_correct Hi Hx.
have := eval_shaw_cms_correct aLb Hc (isubset_refl _) Hx.
case: eval_shaw_cms Hi => //= l u.
have := F.cmp_correct c d; rewrite cLd.
case: F.toX => // cr; case: F.toX => // dr.
case El : (F.toX l) => [|xl] /=.
  case Eu : (F.toX u) => [|xu] //=.
    by move=> _ [_ []].
  by move=> _ [].
case: Rcompare_spec => //=.
rewrite /le_lower /le_upper /=.
case Eu : (F.toX u) => [|xu] //=.
  by move=> _ _ [].
by lra.
Qed.


Definition eval_cms a b (c : cms) I :=
  I.meet (eval_shaw_cms a b c I) (eval_range_cms c).

Lemma eval_cms_correct n a b f c i x :
   F.cmp a b = Xlt ->
   cms_correct n a b f c ->
   I.subset i (I.bnd a b) ->
   x \contained_in i -> f x \contained_in eval_cms a b c i.
Proof.
move=> aLb cmsC iSab xIi.
apply: I.meet_correct.
  apply: eval_shaw_cms_correct cmsC _ _ => //.
by apply: eval_range_cms_correct cmsC iSab _.
Qed.

(* Should be something simpler *)
Lemma eval_cms_subset n a b c d f cm x :
   F.cmp a b = Xlt ->
   F.cmp c d = Xlt ->
   cms_correct n a b f cm ->
   I.subset (eval_cms a b cm (I.bnd a b)) (I.bnd c d) ->
   x \contained_in I.bnd a b -> f x \contained_in (I.bnd c d).
Proof.
move=> aLb cLd Hc /I.subset_correct Hi Hx.
have := eval_cms_correct aLb Hc (isubset_refl _) Hx.
case: eval_cms Hi => //= l u.
have := F.cmp_correct c d; rewrite cLd.
case: F.toX => // cr; case: F.toX => // dr.
case El : (F.toX l) => [|xl] /=.
  case Eu : (F.toX u) => [|xu] //=.
    by move=> _ [_ []].
  by move=> _ [].
case: Rcompare_spec => //=.
rewrite /le_lower /le_upper /=.
case Eu : (F.toX u) => [|xu] //=.
  by move=> _ _ [].
by lra.
Qed.

Definition comp_cms n a b c d (c1 c2 : cms) :=
  let: CMS P2 Delta2 := c2 in
  let: CMS P  Delta := IsCshaw_cms n a b c d P2 c1 in
  CMS P (add Delta Delta2).

Lemma comp_cms_correct n a b c d f1 f2 c1 c2 :
   F.cmp a b = Xlt ->
   F.cmp c d = Xlt ->
   I.subset (eval_range_cms c1) (I.bnd c d) ->
   cms_correct n a b f1 c1 ->
   cms_correct n c d f2 c2 ->
   cms_correct n a b (f2 \o f1) (comp_cms n a b c d c1 c2).
Proof.
move=> aLb cLd.
case: c2 => [P2 Delta2] Hs Hc1 [Sp2 [p2 [H1p2 H2p2 H3p2]]].
have Hsp2 : size p2 = size P2 by rewrite Sp2 H1p2.
have F x:
  x \contained_in I.bnd a b -> f1 x \contained_in I.bnd c d.
  move=> Hx.
  by apply: eval_range_cms_subset Hc1 Hs Hx.
have := IsCshaw_cms_correct aLb cLd F H2p2 Hsp2 Hc1.
rewrite /comp_cms.
case: IsCshaw_cms => P3 Delta3 [H1P3 [p3 [H1p3 H2p3 H3p3]]].
split => //.
exists p3; split => // x Hx.
have [d3 [H1d3 H2d3]] := H3p3 x Hx.
have F1 : (f1 x) \contained_in I.bnd c d.
  by apply: eval_range_cms_subset Hc1 _ _.
have [d2 [H1d2 H2d2]] := H3p2 _ F1.
exists (d3 + d2); split; first by apply: add_correct.
rewrite [_ x]H2d2 H2d3; toR; ring.
Qed.

Section CMSin.

Variable (a b : D).

(*****************************************************************************)
(* Derivative of sin for interval arithmetic                                 *)
(*****************************************************************************)

Lemma sin_env a1 b1 : I.sin prec \is_envelope_of[a1, b1] sin.
Proof.  by move=> *; exact: sin_correct. Qed.

Fixpoint bsin b x := if b then cos x else sin x.

Definition Ibsin b J := if b then I.cos prec J else I.sin prec J.

Notation "f ^( n )" := (Derive_n f n) (at level 2, format "f ^( n )").

Lemma Ibsin_correct a1 b1 n:
 (Ibsin (odd n)) \is_envelope_of[a1, b1] (fun x => (-1) ^ (odd n./2) * sin^(n) x)%R.
Proof.
move=> x X Ix Hx.
rewrite Derive_n_sin /Ibsin; case: odd.
  rewrite -!expr_Rexp -Rmult_assoc -[(-1) ^+ n./2]signr_odd.
  case: odd; rewrite ?expr0 ?expr1.
    rewrite (_ : -1 * -1  * cos x = cos x)%R; last by lra.
    by apply: cos_correct.
  rewrite (_ : 1 * 1  * cos x = cos x)%R; last by lra.
  by apply: cos_correct.
rewrite -!expr_Rexp -Rmult_assoc -[(-1) ^+ n./2]signr_odd.
case: odd; rewrite ?expr0 ?expr1.
  rewrite (_ : -1 * -1  * sin x = sin x)%R; last by lra.
  by apply: sin_correct.
rewrite (_ : 1 * 1  * sin x = sin x)%R; last by lra.
by apply: sin_correct.
Qed.

(*****************************************************************************)
(* Error of sin                                                              *)
(*****************************************************************************)

Definition sin_error (b1 : bool) P zn z2n nn :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Iab := I.bnd a b in
  let v := Ibsin b1 Iab in
  let Ic :=
    if csign v then
      let Ida := I.abs (I.sub prec (I.sin prec Ia) (IsCshaw Ia Ib P Ia)) in
      let Idb := I.abs (I.sub prec (I.sin prec Ib) (IsCshaw Ia Ib P Ib)) in
      I.mul prec I01 (I.join Ida Idb)
    else
      I.div prec
        (I.mul prec (I.power_pos prec (I.sub prec Ib Ia) zn)
                    (I.mul prec I01 (I.abs (Ibsin (~~b1) Iab))))
       (I.mul prec (I.power_pos prec I2 z2n) (Ifact nn))
   in  I.join (I.neg Ic) Ic.

Definition sin_cms n b1 vn zn z2n vl2 vl3 :=
  let P := Icheby_coefs (I.sin prec) vn vl3 vl2 in
  CMS P (sin_error b1 P zn z2n n.+1).

Lemma sin_cms_correct n b1 vn v2n zn z2n vl2 vl3 :
  F.cmp a b = Xlt ->
  b1 = odd n ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  zn = Pos.of_nat n.+1 ->
  z2n = Pos.of_nat n.*2.+1 ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b sin (sin_cms n b1 vn zn z2n vl2 vl3).
Proof.
move=> aLb b1E vnE v2nE znE z2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hiab x : (D2R a <= x <= D2R b)%R -> x \contained_in I.bnd a b.
  by rewrite /= /D2R; (do 2 case: F.toX) => //= r1; lra.
have Hiabr x : (F.cmp a b = Xlt) -> (x \contained_in I.bnd a b) -> (D2R a <= x <= D2R b)%R.
  by rewrite /= F.cmp_correct /D2R; (do 2 case: F.toX).
pose iv := interpolation sin (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /sin_cms; split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) sin n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.sin prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: sin_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (sin x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
  rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
have [/csign_correct H|_] := boolP (csign _).
  apply: I01_correct.
    split; first by split_Rabs; lra.
    apply: sin_scheby_ge => //.
    case: H => H.
      right => x1 /Hiab Hx1.
      apply: H.
      rewrite /Ibsin b1E; case: odd.
        by apply: cos_correct.
      by apply: sin_correct.
    left => x1 /Hiab Hx1.
    apply: H.
    rewrite /Ibsin b1E; case: odd.
      by apply: cos_correct.
    by apply: sin_correct.
  rewrite /Rmax; case: Rle_dec => _.
    apply: I.join_correct.
    right.
    apply/abs_correct/sub_correct.
      by apply/sin_correct/Hib.
    rewrite -scheby_coef_list_spec //.
    apply: IsCshaw_correct => //.
    by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
  apply: I.join_correct.
  left.
  apply/abs_correct/sub_correct.
    by apply/sin_correct/Hia.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
set u := (_ - _)%R.
pose e : R := (expn 2 n.+1.*2.-1 * n.+1 `!) %:R.
pose v := ((D2R b - D2R a)^+ n.+1).
have vP : (0 < v)%R.
  rewrite /v expr_Rexp.
  by apply: pow_lt; toR; lra.
have vE: (0 < e)%R.
  rewrite /e natr_INR.
  apply: (lt_INR 0).
  by apply/ltP; rewrite muln_gt0 expn_gt0 fact_gt0.
have -> : Rabs u = ((v * Rabs (u / v * e)) / e)%R.
  rewrite Rabs_mult Rabs_div; try lra.
  rewrite (Rabs_pos_eq v); try lra.
  rewrite (Rabs_pos_eq e); try lra.
  by field; lra.
apply: div_correct => //.
  apply: mul_correct.
    rewrite /v expr_Rexp znE.
    apply: power_pos_correct => //.
    by apply: sub_correct.
  apply: Rabs_I01_max => [||z Hz].
  - suff: (D2R a) \contained_in I.bnd a b by apply.
    by apply: Hiab; lra.
  - move=> y YC.
    apply: abs_correct.
    rewrite b1E.
    apply: (Ibsin_correct n.+1) => //.
    by apply: Hiabr.
  rewrite Rabs_mult Rabs_div; try lra.
  rewrite (Rabs_pos_eq v); try lra.
  rewrite (Rabs_pos_eq e); try lra.
  suff: (Rabs u <= v / e * z)%R.
    move=> HH.
    have-> : (z = (v / e * z) / v * e)%R by field; lra.
    apply: Rmult_le_compat_r; try lra.
    apply: Rmult_le_compat_r => //.
    by have := Rinv_0_lt_compat _ vP; lra.
  apply: ierror_sin => // y Hy.
  have /Hz : y \contained_in I.bnd a b by apply: Hiab.
  rewrite Derive_n_sin -[odd n.+1]/(~~ odd n).
  case: (odd n).
    rewrite -!expr_Rexp signr_odd -signr_odd expr_Rexp.
    case: odd => /=.
      by rewrite !(Ropp_mult_distr_l_reverse, Ropp_mult_distr_r_reverse) Ropp_involutive !Rmult_1_l.
    by rewrite !Rmult_1_l.
  rewrite -!expr_Rexp signr_odd -signr_odd expr_Rexp.
  case: odd => /=.
    by rewrite !(Ropp_mult_distr_l_reverse, Ropp_mult_distr_r_reverse) Ropp_involutive !Rmult_1_l.
  by rewrite !Rmult_1_l.
rewrite [e]natr_INR mult_INR.
apply: mul_correct.
  rewrite -pow_expn pow_INR z2nE.
  apply: power_pos_correct => //.
  by rewrite /= F.fromZ_correct; lra.
by apply: Ifact_correct.
Qed.

End CMSin.

Section CMAtan.

Variable (a b : D).

(*****************************************************************************)
(* Derivative of atan for interval arithmetic                                *)
(*****************************************************************************)

Lemma atan_env a1 b1 : I.atan prec \is_envelope_of[a1, b1] atan.
Proof.  by move=> *; exact: atan_correct. Qed.

(*****************************************************************************)
(* Error of atan                                                             *)
(*****************************************************************************)

Fixpoint Ieval_atan_rec m mZ (bv : bool) (iZ jZ : Z) (xI xI2 resI : ID) := 
  if m is m1.+2 then
  let iZ1 := (iZ + 2)%Z in 
  let jZ1 := ((jZ * mZ  / iZ1) * (mZ - 1) / (iZ1 + 1))%Z in
  let res1 := (I.add prec (I.mul prec resI xI2)
                   (if bv then I.neg (I.fromZ jZ1) else I.fromZ jZ1)) in
  Ieval_atan_rec m1 (mZ - 2)%Z (~~ bv) iZ1 jZ1 xI xI2 res1
  else if m is 1%nat then I.mul prec xI resI else resI.

Definition Ieval_atan m x := 
  let mZ := Z.of_nat m in
  let mZ1 := (mZ + 1)%Z in
  Ieval_atan_rec m mZ true 0%Z mZ1 x (I.sqr prec x) (I.fromZ mZ1).

Lemma Ieval_atan_rec_correct m mZ bv i iZ j jZ x xI xI2 res resI :
   mZ = Z.of_nat m ->
   iZ = Z.of_nat i ->
   jZ = Z.of_nat j ->
   x \contained_in xI ->
   (x * x)%RR \contained_in xI2 ->
   res \contained_in resI ->
   eval_atan_rec m bv i j x res
   \contained_in
   Ieval_atan_rec m mZ bv iZ jZ xI xI2 resI.
Proof.
elim: {m}m.+1 {-2}m (ltnSn m) mZ bv i iZ j jZ x xI xI2 res resI
   => //= k IH [|[|m]] //= mLk mZ bv i iZ j jZ x xI xI2 res resI mZE iZE jZE xC x2C resC.
  by  apply mul_correct.
have F : 
    Z.of_nat
     (j * m.+2 %/ i.+2 * m.+1 %/ i.+3) =
    ((jZ * mZ / (iZ + 2) * (mZ - 1) /
     (iZ + 2 + 1)))%Z.
  rewrite !(natDivP, Nat2Z.inj_mul, div_Zdiv)  //.
  congr  (_ * _ / _ * _ / _)%Z => //=.
  + by rewrite Pos2Z.inj_succ Zpos_P_of_succ_nat; lia.
  + by rewrite mZE Pos2Z.inj_succ Zpos_P_of_succ_nat; lia.
  by rewrite iZE !(Pos2Z.inj_succ, Zpos_P_of_succ_nat); lia.
apply IH => //.
  + by rewrite ltnS in mLk; apply: leq_trans mLk.
  + by rewrite mZE Pos2Z.inj_succ Zpos_P_of_succ_nat; lia.
  + by rewrite iZE /= Pos2Z.inj_succ Zpos_P_of_succ_nat; lia.
apply: add_correct.
  rewrite Rmult_assoc.
  by apply: mul_correct.
rewrite -IZR_Zof_nat F.
case: bv.
  rewrite -Ropp_mult_distr_l Rmult_1_l.
  apply: (@neg_correct _ (I.bnd _ _)).
  by apply: I.fromZ_correct.
rewrite Rmult_1_l.
by apply: I.fromZ_correct.
Qed.


Lemma Ieval_atan_correct m x xI :
   x \contained_in xI ->
   eval_atan m x \contained_in Ieval_atan m xI.
Proof.
move=> xIxI.
apply: Ieval_atan_rec_correct => //.
- by rewrite /= Zpos_P_of_succ_nat; lia.
- by apply sqr_correct.
rewrite -IZR_Zof_nat (_ : (Z.of_nat m.+1 = Z.of_nat m + 1)%Z).
  by apply: I.fromZ_correct.
by rewrite /= Zpos_P_of_succ_nat; lia.
Qed.

Definition atan_error (b1 : bool) P zn z2n nn :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Iab := I.bnd a b in
  let v := Ibsin b1 Iab in
  let Ic :=
    if csign v then
      let Ida := I.abs (I.sub prec (I.sin prec Ia) (IsCshaw Ia Ib P Ia)) in
      let Idb := I.abs (I.sub prec (I.sin prec Ib) (IsCshaw Ia Ib P Ib)) in
      I.mul prec I01 (I.join Ida Idb)
    else
      I.div prec
        (I.mul prec (I.power_pos prec (I.sub prec Ib Ia) zn)
                    (I.mul prec I01 (I.abs (Ibsin (~~b1) Iab))))
       (I.mul prec (I.power_pos prec I2 z2n) (Ifact nn))
   in  I.join (I.neg Ic) Ic.
(* 
Definition sin_cms n b1 vn zn z2n vl2 vl3 :=
  let P := Icheby_coefs (I.sin prec) vn vl3 vl2 in
  CMS P (sin_error b1 P zn z2n n.+1). *)

Lemma sin_cms_correct n b1 vn v2n zn z2n vl2 vl3 :
  F.cmp a b = Xlt ->
  b1 = odd n ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  zn = Pos.of_nat n.+1 ->
  z2n = Pos.of_nat n.*2.+1 ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b sin (sin_cms n b1 vn zn z2n vl2 vl3).
Proof.
move=> aLb b1E vnE v2nE znE z2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hiab x : (D2R a <= x <= D2R b)%R -> x \contained_in I.bnd a b.
  by rewrite /= /D2R; (do 2 case: F.toX) => //= r1; lra.
have Hiabr x : (F.cmp a b = Xlt) -> (x \contained_in I.bnd a b) -> (D2R a <= x <= D2R b)%R.
  by rewrite /= F.cmp_correct /D2R; (do 2 case: F.toX).
pose iv := interpolation sin (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /sin_cms; split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) sin n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.sin prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: sin_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (sin x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
  rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
have [/csign_correct H|_] := boolP (csign _).
  apply: I01_correct.
    split; first by split_Rabs; lra.
    apply: sin_scheby_ge => //.
    case: H => H.
      right => x1 /Hiab Hx1.
      apply: H.
      rewrite /Ibsin b1E; case: odd.
        by apply: cos_correct.
      by apply: sin_correct.
    left => x1 /Hiab Hx1.
    apply: H.
    rewrite /Ibsin b1E; case: odd.
      by apply: cos_correct.
    by apply: sin_correct.
  rewrite /Rmax; case: Rle_dec => _.
    apply: I.join_correct.
    right.
    apply/abs_correct/sub_correct.
      by apply/sin_correct/Hib.
    rewrite -scheby_coef_list_spec //.
    apply: IsCshaw_correct => //.
    by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
  apply: I.join_correct.
  left.
  apply/abs_correct/sub_correct.
    by apply/sin_correct/Hia.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
set u := (_ - _)%R.
pose e : R := (expn 2 n.+1.*2.-1 * n.+1 `!) %:R.
pose v := ((D2R b - D2R a)^+ n.+1).
have vP : (0 < v)%R.
  rewrite /v expr_Rexp.
  by apply: pow_lt; toR; lra.
have vE: (0 < e)%R.
  rewrite /e natr_INR.
  apply: (lt_INR 0).
  by apply/ltP; rewrite muln_gt0 expn_gt0 fact_gt0.
have -> : Rabs u = ((v * Rabs (u / v * e)) / e)%R.
  rewrite Rabs_mult Rabs_div; try lra.
  rewrite (Rabs_pos_eq v); try lra.
  rewrite (Rabs_pos_eq e); try lra.
  by field; lra.
apply: div_correct => //.
  apply: mul_correct.
    rewrite /v expr_Rexp znE.
    apply: power_pos_correct => //.
    by apply: sub_correct.
  apply: Rabs_I01_max => [||z Hz].
  - suff: (D2R a) \contained_in I.bnd a b by apply.
    by apply: Hiab; lra.
  - move=> y YC.
    apply: abs_correct.
    rewrite b1E.
    apply: (Ibsin_correct n.+1) => //.
    by apply: Hiabr.
  rewrite Rabs_mult Rabs_div; try lra.
  rewrite (Rabs_pos_eq v); try lra.
  rewrite (Rabs_pos_eq e); try lra.
  suff: (Rabs u <= v / e * z)%R.
    move=> HH.
    have-> : (z = (v / e * z) / v * e)%R by field; lra.
    apply: Rmult_le_compat_r; try lra.
    apply: Rmult_le_compat_r => //.
    by have := Rinv_0_lt_compat _ vP; lra.
  apply: ierror_sin => // y Hy.
  have /Hz : y \contained_in I.bnd a b by apply: Hiab.
  rewrite Derive_n_sin -[odd n.+1]/(~~ odd n).
  case: (odd n).
    rewrite -!expr_Rexp signr_odd -signr_odd expr_Rexp.
    case: odd => /=.
      by rewrite !(Ropp_mult_distr_l_reverse, Ropp_mult_distr_r_reverse) Ropp_involutive !Rmult_1_l.
    by rewrite !Rmult_1_l.
  rewrite -!expr_Rexp signr_odd -signr_odd expr_Rexp.
  case: odd => /=.
    by rewrite !(Ropp_mult_distr_l_reverse, Ropp_mult_distr_r_reverse) Ropp_involutive !Rmult_1_l.
  by rewrite !Rmult_1_l.
rewrite [e]natr_INR mult_INR.
apply: mul_correct.
  rewrite -pow_expn pow_INR z2nE.
  apply: power_pos_correct => //.
  by rewrite /= F.fromZ_correct; lra.
by apply: Ifact_correct.
Qed.

End CMAtan.


Section CMNorm.

Variable (a b : D).

Definition D2I d := I.bnd d d.

Definition norm_cms c :=
  let: CMS P1 Delta1 := c in
  let: P2 := [seq (D2I (I.midpoint i)) | i <- P1] in
  let  c1 := CMS (Isub_Cpoly P1 P2) Delta1 in
  CMS P2 (eval_range_cms c1).

Lemma norm_cms_correct n c f :
   F.cmp a b = Xlt ->
   cms_correct n a b f c -> cms_correct n a b f (norm_cms c).
Proof.
move=> aLb.
case: c => [] P1 Delta1 [SP1 [p [H1p H2p H3]]].
split; first by rewrite size_map.
exists [seq D2R (I.midpoint i) | i <- P1].
split; first by rewrite size_map.
  move=> i; have := H2p i.
  have [nLi|iLn] := leqP n.+1 i.
    by rewrite !nth_default ?size_map ?SP1 ?H1p.
  rewrite !(nth_map I0) ?SP1 // => Hn.
  have : exists p, contains (I.convert (nth I0 P1 i)) p.
    by exists (Xreal p`_i).
  move=> /(I.midpoint_correct _) [H1 H2].
  rewrite /= /D2R H1 /=; lra.
move=> x Hx.
have [d [H1d H2d]] := H3 x Hx.
set P2 := [seq _ | i <- _].
set P3 := [seq _ | i <- _].
exists (f x - (CPolyab (D2R a) (D2R b) P3).[x])%R.
split; last by rewrite H2d; lra.
rewrite H2d.
pose g x := ((CPolyab (D2R a) (D2R b) p).[x] + d -
             (CPolyab (D2R a) (D2R b) P3).[x])%R.
apply: (@eval_range_cms_correct _ _ _ g) aLb _ _ Hx => //; last first.
  by apply: isubset_refl.
split.
  by rewrite size_Isub_Cpoly size_map SP1 maxnn.
exists (sub_Cpoly p P3).
split.
- by rewrite size_sub_Cpoly size_map H1p SP1 maxnn.
- apply: Isub_Cpoly_correct => //.
  - by rewrite SP1.
  - by rewrite !size_map.
  move=> j.
  have [nLj|jLn] := leqP n.+1 j.
    rewrite !nth_default ?size_map ?SP1 ?H1p //.
    by apply: I.fromZ_correct.
  rewrite !(nth_map I0) ?SP1 // /D2R /D2I /=.
  by case: F.toX => //= r; lra.
move=> x1 Hx1.
exists (g x1 - (CPolyab (D2R a) (D2R b) (sub_Cpoly p P3)).[x1])%R.
split; last by lra.
rewrite /g !horner_CPolyab sub_Cpoly_spec.
rewrite (_ : _ - _ = d)%R // 2!hornerE; toR; lra.
Qed.

End CMNorm.

Section CMCos.

Variable (a b : D).

Notation "f ^( n )" := (Derive_n f n) (at level 2, format "f ^( n )").

(*****************************************************************************)
(* Derivative of cos for interval arithmetic                                 *)
(*****************************************************************************)

Lemma cos_env a1 b1 : I.cos prec \is_envelope_of[a1, b1] cos.
Proof. by move=> *; exact: cos_correct. Qed.

Fixpoint bcos b x := if b then sin x else cos x.

Definition Ibcos b J := if b then I.sin prec J else I.cos prec J.

Lemma Ibcos_correct a1 b1 n:
 (Ibcos (odd n)) \is_envelope_of[a1, b1]
   (fun x => (-1) ^ (odd n) * (-1) ^ (odd n./2) * cos^(n) x)%R.
Proof.
move=> x X Ix Hx.
rewrite Derive_n_cos /Ibcos; case: odd.
  rewrite -!expr_Rexp -Rmult_assoc -[(-1) ^+ n./2]signr_odd.
  case: odd; rewrite ?expr0 ?expr1.
    rewrite (_ : -1 * -1 * -1  * - sin x = sin x)%R; last by lra.
    by apply: sin_correct.
  rewrite (_ : -1 * 1 * 1  * - sin x = sin x)%R; last by lra.
  by apply: sin_correct.
rewrite -!expr_Rexp -Rmult_assoc -[(-1) ^+ n./2]signr_odd.
case: odd; rewrite ?expr0 ?expr1.
  rewrite (_ : 1 * -1 * -1  * cos x = cos x)%R; last by lra.
  by apply: cos_correct.
rewrite (_ : 1 * 1 * 1  * cos x = cos x)%R; last by lra.
by apply: cos_correct.
Qed.

(*****************************************************************************)
(* Error of cos                                                              *)
(*****************************************************************************)

Definition cos_error (b1 : bool) P zn z2n nn :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Iab := I.bnd a b in
  let v := Ibcos b1 Iab in
  let Ic :=
    if csign v then
      let Ida := I.abs (I.sub prec (I.cos prec Ia) (IsCshaw Ia Ib P Ia)) in
      let Idb := I.abs (I.sub prec (I.cos prec Ib) (IsCshaw Ia Ib P Ib)) in
      I.mul prec I01 (I.join Ida Idb)
    else
      I.div prec
         (I.mul prec (I.power_pos prec (I.sub prec Ib Ia) zn)
                     (I.mul prec I01 (I.abs (Ibcos (~~b1) Iab))))
         (I.mul prec (I.power_pos prec I2 z2n) (Ifact nn))
   in I.join (I.neg Ic) Ic.

Definition cos_cms n b1 vn zn z2n vl2 vl3 :=
  let P := Icheby_coefs (I.cos prec) vn vl3 vl2 in
  CMS P (cos_error b1 P zn z2n n.+1).

Lemma cos_cms_correct n b1 vn v2n zn z2n vl2 vl3 :
  F.cmp a b = Xlt ->
  b1 = odd n ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  zn = Pos.of_nat n.+1 ->
  z2n = Pos.of_nat n.*2.+1 ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b cos (cos_cms n b1 vn zn z2n vl2 vl3).
Proof.
move=> aLb b1E vnE v2nE znE z2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hiab x : (D2R a <= x <= D2R b)%R -> x \contained_in I.bnd a b.
  by rewrite /= /D2R; (do 2 case: F.toX) => //= r1; lra.
have Hiabr x : (F.cmp a b = Xlt) -> (x \contained_in I.bnd a b) -> (D2R a <= x <= D2R b)%R.
  by rewrite /= F.cmp_correct /D2R; (do 2 case: F.toX).
pose iv := interpolation sin (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /cos_cms; split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) cos n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.cos prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: cos_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (cos x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
  rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
have [/csign_correct H|_] := boolP (csign _).
  apply: I01_correct.
    split; first by split_Rabs; lra.
    apply: cos_scheby_ge => //.
    case: H => H.
      right => x1 /Hiab Hx1.
      apply: H.
      rewrite /Ibsin b1E; case: odd.
        by apply: sin_correct.
      by apply: cos_correct.
    left => x1 /Hiab Hx1.
    apply: H.
    rewrite /Ibsin b1E; case: odd.
      by apply: sin_correct.
    by apply: cos_correct.
  rewrite /Rmax; case: Rle_dec => _.
    apply: I.join_correct.
    right.
    apply/abs_correct/sub_correct.
      by apply/cos_correct/Hib.
    rewrite -scheby_coef_list_spec //.
    apply: IsCshaw_correct => //.
    by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
  apply: I.join_correct.
  left.
  apply/abs_correct/sub_correct.
    by apply/cos_correct/Hia.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
set u := (_ - _)%R.
pose e : R := (expn 2 n.+1.*2.-1 * n.+1 `!) %:R.
pose v := ((D2R b - D2R a)^+ n.+1).
have vP : (0 < v)%R.
  rewrite /v expr_Rexp.
  by apply: pow_lt; toR; lra.
have vE: (0 < e)%R.
  rewrite /e natr_INR.
  apply: (lt_INR 0).
  by apply/ltP; rewrite muln_gt0 expn_gt0 fact_gt0.
have -> : Rabs u = ((v * Rabs (u / v * e)) / e)%R.
  rewrite Rabs_mult Rabs_div; try lra.
  rewrite (Rabs_pos_eq v); try lra.
  rewrite (Rabs_pos_eq e); try lra.
  by field; lra.
apply: div_correct.
 apply: mul_correct.
    rewrite /v expr_Rexp znE.
    apply: power_pos_correct => //.
    by apply: sub_correct.
  apply: Rabs_I01_max => [||z Hz].
  - suff: (D2R a) \contained_in I.bnd a b by apply.
    by apply: Hiab; lra.
  - move=> y YC.
    apply: abs_correct.
    rewrite b1E.
    apply: (Ibcos_correct n.+1) => //.
    by apply: Hiabr.
  rewrite Rabs_mult Rabs_div; try lra.
  rewrite (Rabs_pos_eq v); try lra.
  rewrite (Rabs_pos_eq e); try lra.
  suff: (Rabs u <= v / e * z)%R.
    move=> HH.
    have-> : (z = (v / e * z) / v * e)%R by field; lra.
    apply: Rmult_le_compat_r; try lra.
    apply: Rmult_le_compat_r => //.
    by have := Rinv_0_lt_compat _ vP; lra.
  apply: ierror_cos => // y Hy.
  have /Hz : y \contained_in I.bnd a b by apply: Hiab.
  rewrite Derive_n_cos -[odd n.+1]/(~~ odd n).
  case: (odd n).
    rewrite -!expr_Rexp signr_odd -signr_odd expr_Rexp.
    case: odd => /=.
      by rewrite !(Ropp_mult_distr_l_reverse, Ropp_mult_distr_r_reverse) Ropp_involutive !Rmult_1_l.
    by rewrite !Rmult_1_l.
  rewrite -!expr_Rexp signr_odd -signr_odd expr_Rexp.
  case: odd => /=.
    by rewrite !(Ropp_mult_distr_l_reverse, Ropp_mult_distr_r_reverse) !Ropp_involutive !Rmult_1_l.
  rewrite expr0 !(Rmult_1_l, Rmult_1_r).
  by rewrite -Ropp_mult_distr_l -Ropp_mult_distr_r Rmult_1_l Ropp_involutive.
rewrite [e]natr_INR mult_INR.
apply: mul_correct.
  rewrite -pow_expn pow_INR z2nE.
  apply: power_pos_correct => //.
  by rewrite /= F.fromZ_correct; lra.
by apply: Ifact_correct.
Qed.

End CMCos.

Section CMExp.

Variable (a b : D).

(*****************************************************************************)
(* Chebyshev model for exp                                                   *)
(*****************************************************************************)

Definition exp_error P :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Ida := I.abs (I.sub prec (I.exp prec Ia) (IsCshaw Ia Ib P Ia)) in
  let Idb := I.abs (I.sub prec (I.exp prec Ib) (IsCshaw Ia Ib P Ib)) in
  let Ic := I.mul prec I01 (I.join Ida Idb) in
  I.join (I.neg Ic) Ic.

Definition exp_cms vn vl2 vl3 :=
  let P := Icheby_coefs (I.exp prec) vn vl3 vl2 in
  CMS P (exp_error P).

Lemma exp_env a1 b1 : I.exp prec \is_envelope_of[a1, b1] exp.
Proof. move=> *; exact: exp_correct. Qed.

Lemma exp_cms_correct n vn v2n vl2 vl3 :
  F.cmp a b = Xlt ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b exp (exp_cms vn vl2 vl3).
Proof.
move=> aLb vnE v2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
pose iv := interpolation exp (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /exp_cms; split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) exp n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.exp prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: exp_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (exp x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
  rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
apply: I01_correct.
  split; first by split_Rabs; lra.
  apply: exp_scheby_ge => //.
  rewrite /Rmax; case: Rle_dec => _.
  apply: I.join_correct.
  right.
  apply/abs_correct/sub_correct.
    by apply/exp_correct/Hib.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
apply: I.join_correct.
left.
apply/abs_correct/sub_correct.
  by apply/exp_correct/Hia.
rewrite -scheby_coef_list_spec //.
apply: IsCshaw_correct => //.
by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
Qed.

End CMExp.

Section CMLn.

Variable (a b : D).

(*****************************************************************************)
(* Chebyshev Model of ln                                                     *)
(*****************************************************************************)

Definition ln_error P :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Ida := I.abs (I.sub prec (I.ln prec Ia) (IsCshaw Ia Ib P Ia)) in
  let Idb := I.abs (I.sub prec (I.ln prec Ib) (IsCshaw Ia Ib P Ib)) in
  let Ic := I.mul prec I01 (I.join Ida Idb) in
  I.join (I.neg Ic) Ic.

Definition ln_cms n vn vl2 vl3 :=
  if Fpos a then
    let P := Icheby_coefs (I.ln prec) vn vl3 vl2 in
    CMS P (ln_error P)
  else error_cms n.

Lemma ln_env a1 b1 : I.ln prec \is_envelope_of[a1, b1] ln.
Proof. by move=> *; apply: ln_correct. Qed.

Lemma ln_cms_correct n vn v2n vl2 vl3 :
  F.cmp a b = Xlt ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b ln (ln_cms n vn vl2 vl3).
Proof.
move=> aLb vnE v2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
pose iv := interpolation ln (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /ln_cms.
have := Fpos_correct a; case: Fpos => [aP|aN]; last first.
  split; first by rewrite size_nseq.
  exists (nseq n.+1 0); split => //.
  - by rewrite size_nseq.
  - by move=> i; rewrite !nth_nseq !if_same; apply: I.fromZ_correct.
  move=> x Hx; set u := _.[_]; exists (ln x - u); split; last by toR; lra.
  by rewrite /= F.nan_correct.
split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) ln n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.ln prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: ln_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (ln x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
apply: I01_correct.
  split; first by split_Rabs; lra.
  apply: ln_scheby_ge => //.
  rewrite /Rmax; case: Rle_dec => _.
  apply: I.join_correct.
  right.
  apply/abs_correct/sub_correct.
    by apply: ln_correct.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
apply: I.join_correct.
left.
apply/abs_correct/sub_correct.
  by apply: ln_correct.
rewrite -scheby_coef_list_spec //.
apply: IsCshaw_correct => //.
by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
Qed.

End CMLn.

Section CMSqrt.

Variable (a b : D).

(*****************************************************************************)
(* Chebyshev Model of sqrt                                                   *)
(*****************************************************************************)

Definition sqrt_error P :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Ida := I.abs (I.sub prec (I.sqrt prec Ia) (IsCshaw Ia Ib P Ia)) in
  let Idb := I.abs (I.sub prec (I.sqrt prec Ib) (IsCshaw Ia Ib P Ib)) in
  let Ic := I.mul prec I01 (I.join Ida Idb) in
  I.join (I.neg Ic) Ic.

Definition sqrt_cms n vn vl2 vl3 :=
  if Fpos a then
    let P := Icheby_coefs (I.sqrt prec) vn vl3 vl2 in
    CMS P (sqrt_error P)
  else error_cms n.

Lemma sqrt_env a1 b1 : I.sqrt prec \is_envelope_of[a1, b1] sqrt.
Proof. by move=> *; apply: sqrt_correct. Qed.

Lemma sqrt_cms_correct n vn v2n vl2 vl3 :
  F.cmp a b = Xlt ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b sqrt (sqrt_cms n vn vl2 vl3).
Proof.
move=> aLb vnE v2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
pose iv := interpolation ln (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /sqrt_cms.
have := Fpos_correct a; case: Fpos => [aP|aN]; last first.
  split; first by rewrite size_nseq.
  exists (nseq n.+1 0); split => //.
  - by rewrite size_nseq.
  - by move=> i; rewrite !nth_nseq !if_same; apply: I.fromZ_correct.
  move=> x Hx; set u := _.[_]; exists (sqrt x - u); split; last by toR; lra.
  by rewrite /= F.nan_correct.
split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) sqrt n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.sqrt prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: sqrt_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (sqrt x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
apply: I01_correct.
  split; first by split_Rabs; lra.
  apply: sqrt_scheby_ge => //.
  rewrite /Rmax; case: Rle_dec => _.
  apply: I.join_correct.
  right.
  apply/abs_correct/sub_correct.
    by apply: sqrt_correct.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
apply: I.join_correct.
left.
apply/abs_correct/sub_correct.
  by apply: sqrt_correct.
rewrite -scheby_coef_list_spec //.
apply: IsCshaw_correct => //.
by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
Qed.

End CMSqrt.


Section CMInvx.

Variable (a b : D).

(*****************************************************************************)
(* Chebyshev model of invx                                                    *)
(*****************************************************************************)

Definition invx_error P :=
  let Ia := I.bnd a a in
  let Ib := I.bnd b b in
  let Ida := I.abs (I.sub prec (I.inv prec Ia) (IsCshaw Ia Ib P Ia)) in
  let Idb := I.abs (I.sub prec (I.inv prec Ib) (IsCshaw Ia Ib P Ib)) in
  let Ix := I.mul prec I01 (I.join Ida Idb) in
  I.join (I.neg Ix) Ix.

Definition invx_cms n vn vl2 vl3 :=
   if Fpos a || (Fneg b) then
     let P := Icheby_coefs (I.inv prec) vn vl3 vl2 in
     CMS P (invx_error P)
   else (error_cms n).

Lemma invx_env a1 b1 : I.inv prec \is_envelope_of[a1, b1] Rinv.
Proof. by move=> *; apply: inv_correct. Qed.

Lemma invx_cms_correct n vn v2n vl2 vl3 :
  F.cmp a b = Xlt ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl3 = Ischeby_nodes a b n.+1 v2n ->
  cms_correct n a b Rinv (invx_cms n vn vl2 vl3).
Proof.
move=> aLb vnE v2nE vl2E vl3E.
have F1 : (D2R a < D2R b)%R.
  have := F.cmp_correct a b; rewrite aLb.
  rewrite /D2R; case: F.toX; case: F.toX =>  //= r1 r2.
  by case: Rcompare_spec.
have F2 : D2R a != D2R b by apply/eqP; lra.
have F3 : D2R b != D2R a by rewrite eq_sym.
have Hia : D2R a \contained_in I.bnd a a.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
have Hib : D2R b \contained_in I.bnd b b.
  by rewrite /D2R /=; case: F.toX  => //= r; lra.
pose iv := interpolation ln (scheby_nodes (D2R a) (D2R b) n.+1).
rewrite /cms_correct /invx_cms.
case E : (_ || _); last first.
  split; first by rewrite size_nseq.
  exists (nseq n.+1 0); split => //.
  - by rewrite size_nseq.
  - by move=> i; rewrite !nth_nseq !if_same; apply: I.fromZ_correct.
  move=> x Hx; set u := _.[_]; exists (/x - u); split; last by toR; lra.
  by rewrite /= F.nan_correct.
split.
  by rewrite size_Icheby_coefs vl2E size_ITvalue.
pose p := scheby_coef_list (D2R a) (D2R b) Rinv n.+1.
have Hp i : p`_i \contained_in nth I0 (Icheby_coefs (I.inv prec) vn vl3 vl2) i.
  have [nLi|iLn] := leqP n.+1 i.
    rewrite /scheby_coef_list !nth_default //.
    - by apply: I.fromZ_correct.
    - by rewrite size_map size_iota.
    by rewrite size_Icheby_coefs vl2E size_ITvalue.
  rewrite (nth_map 0%nat) ?size_iota // nth_iota // add0n.
  rewrite sdsprod_coefs //.
  apply: Ischeby_coefs_correct => //.
  - by apply: invx_env.
  - by apply: v2nE.
  - by apply: vl2E.
  by apply: vl3E.
exists p; split => // [|x Hx].
  by rewrite size_scheby_coef_list.
exists (/x - (CPolyab (D2R a) (D2R b) p).[x])%R; split; last by lra.
rewrite scheby_coef_list_spec //.
have Ix : (D2R a <= x <= D2R b)%R.
  have := aLb; rewrite F.cmp_correct.
  by have := Hx; rewrite /D2R /=; (do 2 case: F.toX).
apply: Rabs_join.
apply: I01_correct.
  split; first by split_Rabs; lra.
  apply: inv_scheby_ge => //.
  have := Fpos_correct a; have := Fneg_correct b.
  by case: Fpos E => //; case: Fneg => //; lra.
rewrite /Rmax; case: Rle_dec => _.
  apply: I.join_correct.
  right.
  apply/abs_correct/sub_correct.
    by apply: inv_correct.
  rewrite -scheby_coef_list_spec //.
  apply: IsCshaw_correct => //.
  by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
apply: I.join_correct.
left.
apply/abs_correct/sub_correct.
  by apply: inv_correct.
rewrite -scheby_coef_list_spec //.
apply: IsCshaw_correct => //.
by rewrite size_Icheby_coefs size_scheby_coef_list vl2E size_ITvalue.
Qed.

End CMInvx.

Section CMInv.

Variable (a b : D).

(*****************************************************************************)
(* Chebyshev model of inv                                                    *)
(*****************************************************************************)

Definition inv_cms n vn vl2 vl1 f_cms :=
  let v := eval_range_cms f_cms in
  if I.bounded v then
    let c := I.lower v in
    let d := I.upper v in
    let t := F.cmp c d in
    if t is Xlt then
  (* could be optimized *)
      let vl3 := [seq I.scale2
         (add
            (add (mul (sub (FtoI d) (FtoI c)) i)
              (FtoI c)) (FtoI d)) (F.ZtoS (-1))
      | i <- vl1] in
      comp_cms n a b c d f_cms (invx_cms c d n vn vl2 vl3)
    else if t is Xeq then
            if F.cmp c F.zero is Xeq then error_cms n else const_cms n (I.inv prec (I.bnd c c))
         else error_cms n
  else error_cms n.

Lemma inv_cms_correct n vn v2n vl2 vl1 f f_cms :
  F.cmp a b = Xlt ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl1 = Icheby_nodes n.+1 v2n ->
  cms_correct n a b f f_cms ->
  cms_correct n a b (fun x => /(f x)) (inv_cms n vn vl2 vl1 f_cms).
Proof.
move=> aLb vnE v2nE vl2E vl1E Hf.
rewrite /inv_cms.
case E : I.bounded; last by apply: error_cms_correct.
case E1 : F.cmp; try by apply: error_cms_correct.
  pose k := (/(D2R (I.lower (eval_range_cms f_cms))))%R.
  apply: (@cms_correct_ext _ _ _ _ (fun _ => k)) => [x Hx|].
    have := eval_range_cms_correct aLb Hf (isubset_refl _) Hx.
    rewrite /k.
    case: eval_range_cms E E1 => //= u l.
    rewrite /D2R !F.real_correct F.cmp_correct; case: F.toX => [|xu] //=.
    case: F.toX => [|xl _] //.
    case: Rcompare_spec => // -> _ H.
    by congr (/ _); lra.
  rewrite F.cmp_correct F.zero_correct.
  case E2 : Xcmp.
  - by apply: error_cms_correct.
  - apply: const_cms_correct.
    apply: inv_correct => //=.
    rewrite /D2R; case: F.toX E2 => //= r.
    case: Rcompare_spec => //; lra.
  - apply: const_cms_correct.
    apply: inv_correct => /=.
    rewrite /D2R; case: F.toX E2 => //= r.
    by case: Rcompare_spec => //; lra.
  move: E1 E2; rewrite F.cmp_correct; case: F.toX => //= r.
  case: (Rcompare_spec r 0) => //.
  apply: comp_cms_correct => //.
  case: eval_range_cms E E1 => //= l u.
  rewrite !F.cmp_correct !F.real_correct.
  case: F.toX => // r; case: F.toX => //= r1.
  do 3 case: Rcompare_spec => //; lra.
apply: invx_cms_correct => //.
- by exact: v2nE.
- by exact: vl2E.
by rewrite vl1E.
Qed.

End CMInv.

Section CMDiv.

Variable (a b : D).

(*****************************************************************************)
(* Chebyshev model of div                                                    *)
(*****************************************************************************)

Definition div_cms n vn vl2 vl1 f_cms g_cms :=
   mul_cms n a b f_cms (inv_cms a b n vn vl2 vl1 g_cms).

Lemma div_cms_correct n vn v2n vl2 vl1 g1 g2 g1_cms g2_cms :
  F.cmp a b = Xlt ->
  INR n.+1 \contained_in vn ->
  (2 * INR n.+1) \contained_in v2n ->
  vl2 = ITvalues n.+1 (nseq n.+1 I1) (Icheby_nodes n.+1 v2n) ->
  vl1 = Icheby_nodes n.+1 v2n ->
  cms_correct n a b g1 g1_cms ->
  cms_correct n a b g2 g2_cms ->
  cms_correct n a b (fun x => (g1 x) / (g2 x))%R (div_cms n vn vl2 vl1 g1_cms g2_cms).
Proof.
move=> aLb vnE v2nE vl2E vl1E Hg1 Hg2.
apply: mul_cms_correct => //.
apply: inv_cms_correct => //.
- by exact: v2nE.
- by exact: vl2E.
- by exact: vl1E.
Qed.

End CMDiv.

Section CMFexpr.

Notation D := F.type.

(* language *)

Inductive fexpr :=
  fmul  (_ _ : fexpr) |
  fdiv  (_ _ : fexpr) |
  fadd  (_ _ : fexpr) |
  fsub  (_ _ : fexpr) |
  fcomp (_ _ : fexpr) |
  fvar | fconst (_ _ : Z) | fln | fsqrt | fexp | finv | fsin | fcos.

Delimit Scope fexpr_scope with fexpr.

Fixpoint fexpr_eval e :=
(match e with
| fmul  e1 e2 => (fun u => (fexpr_eval e1 u) *  (fexpr_eval e2 u))
| fdiv  e1 e2 => (fun x => (fexpr_eval e1 x) /  (fexpr_eval e2 x))%R
| fadd  e1 e2 => (fun x => (fexpr_eval e1 x) +  (fexpr_eval e2 x))
| fsub  e1 e2 => (fun x => (fexpr_eval e1 x) -  (fexpr_eval e2 x))
| fcomp e1 e2 => (fexpr_eval e1) \o (fexpr_eval e2)
| fvar => (fun x => x)
| fconst v1 v2 => (fun x => if Z.eqb v2 1%Z  then (IZR v1)
                             else (IZR v1 / IZR v2)%R)
| fln => ln
| fsqrt => sqrt
| fexp => exp
| finv => Rinv
| fsin => sin
| fcos => cos
end)%R.

Fixpoint fexpr_ieval e :=
match e with
| fmul  e1 e2 => (fun i => mul (fexpr_ieval e1 i) (fexpr_ieval e2 i))
| fdiv  e1 e2 => (fun i => div (fexpr_ieval e1 i) (fexpr_ieval e2 i))
| fadd  e1 e2 => (fun i => add (fexpr_ieval e1 i) (fexpr_ieval e2 i))
| fsub  e1 e2 => (fun i => sub (fexpr_ieval e1 i) (fexpr_ieval e2 i))
| fcomp e1 e2 => (fexpr_ieval e1) \o (fexpr_ieval e2)
| fvar => (fun x => x)
| fconst z1 z2 => (fun x => if Z.eqb z2 1 then I.fromZ z1
                            else div (I.fromZ z1) (I.fromZ z2))
| fln => I.ln prec
| fsqrt => I.sqrt prec
| fexp => I.exp prec
| finv => I.inv prec
| fsin => I.sin prec
| fcos => I.cos prec
end.

Lemma fexpr_ieval_correct e i x :
  x \contained_in i -> (fexpr_eval e) x \contained_in (fexpr_ieval e i).
Proof.
elim: e i x.
- move=> e1 IH1 e2 IH2 i x Hx.
  by apply: mul_correct (IH1 _ _ _) (IH2 _ _ _).
- move=> e1 IH1 e2 IH2 i x Hx.
  by apply: div_correct (IH1 _ _ _) (IH2 _ _ _).
- move=> e1 IH1 e2 IH2 i x Hx.
  by apply: add_correct (IH1 _ _ _) (IH2 _ _ _).
- move=> e1 IH1 e2 IH2 i x Hx.
  by apply: sub_correct (IH1 _ _ _) (IH2 _ _ _).
- move=> e1 IH1 e2 IH2 i x Hx.
  by apply/IH1/IH2.
- by [].
- move=> z1 z2 i x Hx.
  rewrite /fexpr_eval /fexpr_ieval.
  case: Z.eqb_spec => [_|z2D1]; first by apply: I.fromZ_correct.
  by apply: div_correct; apply: I.fromZ_correct.
- by move => i x Hx; apply: ln_correct.
- by move => i x Hx; apply: sqrt_correct.
- by move => i x Hx; apply: exp_correct.
- by move => i x Hx; apply: inv_correct.
- by move => i x Hx; apply: sin_correct.
by move => i x Hx; apply: cos_correct.
Qed.

Fixpoint fexpr_cms n b1 vn zn z2n a b (vl1 : seq ID) vl2 (vl3 : seq ID) e :=
match e with
| fmul  e1 e2 =>
    mul_cms n a b (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e1)
                  (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e2)
| fdiv  e1 e2 =>
    div_cms a b n vn vl2 vl1
        (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e1)
        (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e2)
| fadd  e1 e2 =>
    add_cms (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e1)
            (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e2)
| fsub  e1 e2 =>
    sub_cms (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e1)
            (fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e2)
| fcomp e1 e2 =>
    let c2 := fexpr_cms n b1 vn zn z2n a b vl1 vl2 vl3 e2 in
    let v := eval_range_cms c2 in
    if I.bounded v then
      let c := I.lower v in
      let d := I.upper v in
      let t := F.cmp c d in
      if t is Xlt then
        let vl4 :=
             [seq I.scale2
                  (add
                       (add (mul (sub (FtoI d) (FtoI c)) i)
                       (FtoI c)) (FtoI d)) (F.ZtoS (-1))
                | i <- vl1] in
        comp_cms n a b c d c2 (fexpr_cms n b1 vn zn z2n c d vl1 vl2 vl4 e1)
      else if t is Xeq then
         const_cms n (fexpr_ieval e1 (I.bnd c c))
         else error_cms n
  else error_cms n
| fvar => var_cms a b n
| fconst z1 z2 => const_cms n (if Z.eqb z2 1 then I.fromZ z1
                               else div (I.fromZ z1) (I.fromZ z2))
| fln => ln_cms a b n vn vl2 vl3
| fsqrt => sqrt_cms a b n vn vl2 vl3
| fexp => exp_cms a b vn vl2 vl3
| finv => invx_cms a b n vn vl2 vl3
| fsin => sin_cms a b n b1 vn zn z2n vl2 vl3
| fcos => cos_cms a b n b1 vn zn z2n vl2 vl3
end.

Lemma fexpr_cms_correct n b1 vn v2n zn z2n a b vl1 vl2 vl3 e :
       F.cmp a b = Xlt ->
       b1 = odd n.+1 ->
       INR n.+2 \contained_in vn ->
       (2 * INR n.+2) \contained_in v2n ->
       zn = Pos.of_nat n.+2 ->
       z2n = Pos.of_nat n.+1.*2.+1 ->
       vl1 = Icheby_nodes n.+2 v2n ->
       vl2 = ITvalues n.+2 (nseq n.+2 I1) (Icheby_nodes n.+2 v2n) ->
       vl3 = Ischeby_nodes a b n.+2 v2n ->
       cms_correct n.+1 a b (fexpr_eval e)
         (fexpr_cms n.+1 b1 vn zn z2n a b vl1 vl2 vl3 e).
Proof.
move=> aLb b1E vnE v2nE znE z2nE vl1E vl2E vl3E.
elim: e a b vl3 aLb vl3E.
- move=> e1 IH1 e2 IH2 a b vl3 aLb vl3E.
  apply: mul_cms_correct => //; first by apply: IH1.
  by apply: IH2.
- move=> e1 IH1 e2 IH2 a b vl3 aLb vl3E.
  apply: div_cms_correct v2nE vl2E _ _ _ => //; first by apply: IH1.
  by apply: IH2.
- move=> e1 IH1 e2 IH2 a b vl3 aLb vl3E.
  apply: add_cms_correct => //; first by apply: IH1.
  by apply: IH2.
- move=> e1 IH1 e2 IH2 a b vl3 aLb vl3E.
  apply: sub_cms_correct => //; first by apply: IH1.
  by apply: IH2.
- move=> e1 IH1 e2 IH2 a b vl3 aLb vl3E /=.
  case E: I.bounded; last by apply: error_cms_correct.
  case E1: F.cmp; try by apply: error_cms_correct.
    set u := I.lower _.
    apply: cms_correct_ext.
      move=> x Hx.
      have F1 : fexpr_eval e2 x \contained_in
                    (eval_range_cms (fexpr_cms n.+1 b1 vn zn z2n a
                                    b vl1 vl2 vl3 e2)).
        apply: eval_range_cms_correct (aLb) _ _ Hx => //.
        apply: IH2 => //.
        rewrite /= !F.cmp_correct !F.real_correct.
        (do 2 case: F.toX) => //= r; case: Rcompare_spec => //; try lra.
        by move=> _ r1; case: Rcompare_spec => //; lra.
      rewrite /= (_ : fexpr_eval e2 x = D2R u); first by apply: refl_equal.
      rewrite {}/u /D2R.
      case: eval_range_cms E E1 F1 => //= l u.
      rewrite !F.real_correct !F.cmp_correct.
      by case: F.toX => // r1; case: F.toX => //= r2;
         case: Rcompare_spec => //; lra.
    apply: const_cms_correct.
    apply: fexpr_ieval_correct.
    by rewrite /= /D2R; case: F.toX => //= r; lra.
  apply: comp_cms_correct => //.
  - case: eval_range_cms E => //= [] l1 u1.
    rewrite !F.real_correct !F.cmp_correct.
    by (do 2 case: F.toX) => //= r1 r2; do 2 case: Rcompare_spec => //; lra.
  - by apply: IH2.
  apply: IH1 => //.
  - by congr (map _ _).
- by move=> a b vl3 aLb vl3E; apply: var_cms_correct.
- move=> z1 z2 a b vl3 aLb vl3E.
  apply: const_cms_correct.
  case: Z.eqb_spec => [_|_]; first by apply: I.fromZ_correct.
  by apply: div_correct; apply: I.fromZ_correct.
- by move=> a b vl3 aLb vl3E; apply: ln_cms_correct v2nE _ _.
- by move=> a b vl3 aLb vl3E; apply: sqrt_cms_correct v2nE _ _.
- by move=> a b vl3 aLb vl3E; apply: exp_cms_correct v2nE _ _.
- by move=> a b vl3 aLb vl3E; apply: invx_cms_correct v2nE _ _.
- by move=> a b vl3 aLb vl3E; apply: sin_cms_correct v2nE _ _ _ _.
by move=> a b vl3 aLb vl3E; apply: cos_cms_correct v2nE _ _ _ _.
Qed.

End CMFexpr.


End CPoly_interval.

Notation "a * b" := (fmul a b) : fexpr_scope.
Notation "a / b" := (fdiv a b) : fexpr_scope.
Notation "a + b" := (fadd a b) : fexpr_scope.
Notation "a - b" := (fsub a b) : fexpr_scope.
Notation " 'x " := (fvar) : fexpr_scope.
Notation " 'ln(x)' " := (fln) : fexpr_scope.
Notation " 'ln(' e ')' " := (fcomp fln e)
  (format "'ln(' e ')' " ) : fexpr_scope.
Notation " 'sqrt(x)' " := (fsqrt) : fexpr_scope.
Notation " 'sqrt(' e ')' " := (fcomp fsqrt e)
  (format "'sqrt(' e ')' " ) : fexpr_scope.
Notation " 'exp(x)' " := (fexp) : fexpr_scope.
Notation " 'exp(' e ')' " := (fcomp fexp e)
  (format "'exp(' e ')'" ) : fexpr_scope.
Notation " '1/x' " := (finv) : fexpr_scope.
Notation "'/(' x ')'" := (fcomp finv x)
   (format "/( x )" ): fexpr_scope.
Notation "'c(' x , y ')'" := (fconst x y)
   (format "c( x ,  y ) " ): fexpr_scope.
Notation "'c(' x ')'" := (fconst x 1)
   (format "c( x ) " ): fexpr_scope.
Notation " '1' " := (fconst 1 1) : fexpr_scope.
Notation " '2' " := (fconst 2 1) : fexpr_scope.
Notation " 'sin(x)'" := (fsin) (at level 10) : fexpr_scope .
Notation " 'sin(' e ')'" := (fcomp fsin e)
  (format "'sin(' e ')'" ) : fexpr_scope.
Notation " 'cos(x)'" := (fcos) (at level 10) : fexpr_scope .
Notation " 'cos(' e ')'" := (fcomp fcos e)
  (format "'cos(' e ')'" ) : fexpr_scope.
Delimit Scope fexpr_scope with fexpr.

Section Solver.

Definition mk_cms prec n a b f :=
  let ob := odd n in
  let zn := Pos.of_nat n.+1 in
  let z2n :=  (2 * zn - 1)%positive in
  let vn :=  I.fromZ (Zpos zn) in
  let v2n :=  I.fromZ (Zpos z2n + 1) in
  let l1 :=  nseq n.+1 I1 in
  let vl1 := Icheby_nodes prec n.+1 v2n in
  let vl2 := ITvalues prec n.+1 l1 vl1 in
  let vl3 := Ischeby_nodes prec a b n.+1 v2n in
  let x := fexpr_cms prec n ob vn zn z2n a b vl1 vl2 vl3 f in x.

Let lem1 n : Z.pos (Pos.of_nat n.+2) = Z.of_nat n.+2.
Proof. by rewrite /Z.of_nat Pos.of_nat_succ. Qed.

Lemma mk_cms_correct prec n a b f :
    F.cmp a b = Xlt ->
    cms_correct n.+1 a b (fexpr_eval f) (mk_cms prec n.+1 a b f).
Proof.
move=> aLb.
rewrite /mk_cms.
set ob := odd _.
set zn := Pos.of_nat _.
set z2n :=  (_ - _)%positive.
set vn :=  I.fromZ _.
set v2n :=  I.fromZ _.
set l1 :=  nseq _ _.
set vl1 := Icheby_nodes _ _ _.
set vl2 := ITvalues _ _ _ _.
set vl3 := Ischeby_nodes _ _ _ _ _.
have z2nE : z2n = Pos.of_nat (n.+1).*2.+1.
  rewrite /z2n /zn [in LHS]Nat2Pos.inj_succ //.
  rewrite [RHS]Nat2Pos.inj_succ // !Pplus_one_succ_r.
  rewrite -muln2 Nat2Pos.inj_mul // [Pos.of_nat 2]/=; lia.
apply: fexpr_cms_correct => //.
  rewrite /vn /zn INR_IZR_INZ /Z.of_nat Pos.of_nat_succ.
  by apply: I.fromZ_correct.
rewrite /v2n z2nE INR_IZR_INZ /Z.of_nat Pos.of_nat_succ.
rewrite Nat2Pos.inj_succ // Pplus_one_succ_r.
rewrite -muln2 Nat2Pos.inj_mul // [Pos.of_nat 2]/=.
rewrite [Pos.of_nat n.+2]Nat2Pos.inj_succ // Pplus_one_succ_r.
rewrite -mult_IZR.
rewrite (_ : (Zpos(Pos.of_nat n.+1 * 2 + 1) + 1 =
              2 * Z.pos (Pos.of_nat n.+1 + 1))%Z); last by lia.
by apply: I.fromZ_correct.
Qed.

Fixpoint solve_rec test n a b:=
  if n is n1.+1 then
    if F.cmp a b is Xlt then
    if test a b then true else
    let a1 := I.midpoint (I.bnd a b) in
      let t :=  solve_rec test n1 a a1 in
      if t then solve_rec test n1 a1 b else false
    else false
  else false.

Lemma solve_recE test n a b :
  solve_rec test n.+1 a b =
    if F.cmp a b is Xlt then
    if test a b then true else
    let a1 := I.midpoint (I.bnd a b) in
      let t :=  solve_rec test n a a1 in
      if t then solve_rec test n a1 b else false
    else false.
Proof. by []. Qed.

Definition solve prec n Iab f obj depth :=
  let ob := odd n in
  let zn := Pos.of_nat n.+1 in
  let z2n :=  (2 * zn - 1)%positive in
  let vn :=  I.fromZ (Zpos zn) in
  let v2n :=  I.fromZ (Zpos z2n + 1) in
  let l1 :=  nseq n.+1 I1 in
  let vl1 := Icheby_nodes prec n.+1 v2n in
  let vl2 := ITvalues prec n.+1 l1 vl1 in
  let test a1 b1 :=
       let vl3 := Ischeby_nodes prec a1 b1 n.+1 v2n in
       let x := fexpr_cms prec n ob vn zn z2n a1 b1 vl1 vl2 vl3 f in
       let v := eval_range_cms prec x in I.subset v obj
  in  solve_rec test depth (I.lower Iab) (I.upper Iab).

Let D2R := I.T.toR.

Lemma contains_subset a b c:
   contains (I.convert a) (Xreal c) ->
   I.subset a b->
   contains (I.convert b) (Xreal c).
Proof.
move=> H /I.subset_correct; move: H.
case: I.convert => //= [|l1 u1].
  case: I.convert => //=.
case: I.convert => //= l2 u2.
rewrite /le_lower /le_upper.
case: l1 =>[[_]|r [H1]] //.
  case: u1 => [[[]]|r1 H1 []].
    case: l2 => //= _.
    case: u2 => //= r.
  case: l2 => //= _.
  case: u2 => //= r2.
  intuition; lra.
case: u1 => [_ []|r1 H2 []].
  case: l2 => [|r1 /=]; first by case: u2.
  case: u2 => //=.
  by intuition; lra.
case: l2 => /= [|r2 H3].
  case: u2 => // r2; intuition; lra.
case: u2 => [|r3]; intuition; lra.
Qed.

Definition is_interval a :=
  if a is Interval_interval_float.Ibnd u l then
   if (F.toX u, F.toX l) is (Xreal _, Xreal _) then true else false
  else false.

Lemma D2R_divWl prec a b a1 b1 x (i1 := I.div prec (I.fromZ a)  (I.fromZ b))
                                 (i2 := I.div prec (I.fromZ a1) (I.fromZ b1)) :
  is_interval i1 -> is_interval i2 -> Z.eqb b 0 = false -> Z.eqb b1 0 = false ->
  (IZR a / IZR b <= x <= IZR a1 / IZR b1 ->
   D2R (I.lower i1) <= x  <= D2R (I.upper i2))%R.
Proof.
move=> Hi1 Hi2 bP b1P H.
have := I.div_correct prec (I.fromZ a) (I.fromZ b)
              (Interval_xreal.Xreal (IZR a)) (Interval_xreal.Xreal (IZR b))
             (I.fromZ_correct _) (I.fromZ_correct _).
move: Hi1.
rewrite /i1 /D2R /I.T.toR /Xdiv'.
case: I.div => //= [] // l u.
rewrite ifN; last first.
  case: Interval_xreal.is_zero_spec => // /RIneq.eq_IZR_R0 //.
  by case: Z.eqb_spec bP.
case: F.toX => //= r; case: F.toX => //= r1 _ H1.
have := I.div_correct prec (I.fromZ a1) (I.fromZ b1)
              (Interval_xreal.Xreal (IZR a1)) (Interval_xreal.Xreal (IZR b1))
             (I.fromZ_correct _) (I.fromZ_correct _).
move: Hi2.
rewrite /i2 /I.T.toR /Xdiv'.
case: I.div => //= [] // l1 u1.
rewrite ifN; last first.
  case: Interval_xreal.is_zero_spec => // /RIneq.eq_IZR_R0 //.
  by case: Z.eqb_spec b1P.
case: F.toX => //= r2.
case: F.toX => //= r3 _ H2.
by lra.
Qed.

Lemma D2R_divWr prec a b a1 b1 x (i1 := I.div prec (I.fromZ a) (I.fromZ b))
                                 (i2 := I.div prec (I.fromZ a1) (I.fromZ b1)) :
  is_interval i1 -> is_interval i2 ->
  Z.eqb b 0 = false -> Z.eqb b1 0 = false ->
  (I.T.toR (I.upper i1) <= x <= I.T.toR (I.lower i2) ->
   IZR a / IZR b <= x <= IZR a1 / IZR b1)%R.
Proof.
move=> Hi1 Hi2 bP b1P.
have := I.div_correct prec (I.fromZ a) (I.fromZ b)
              (Interval_xreal.Xreal (IZR a)) (Interval_xreal.Xreal (IZR b))
             (I.fromZ_correct _) (I.fromZ_correct _).
move: Hi1.
rewrite /i1 /I.T.toR /Xdiv'.
case: I.div => //= [] // u l.
rewrite ifN; last first.
  case: Interval_xreal.is_zero_spec => // /RIneq.eq_IZR_R0 //.
  by case: Z.eqb_spec bP.
case: F.toX => //= r; case: F.toX => //= r1 _ H1.
have := I.div_correct prec (I.fromZ a1) (I.fromZ b1)
              (Interval_xreal.Xreal (IZR a1)) (Interval_xreal.Xreal (IZR b1))
             (I.fromZ_correct _) (I.fromZ_correct _).
move: Hi2.
rewrite /i2 /I.T.toR /Xdiv'.
case: I.div => //= [] // u1 l1.
rewrite ifN; last first.
  case: Interval_xreal.is_zero_spec => // /RIneq.eq_IZR_R0 //.
  by case: Z.eqb_spec b1P.
case: F.toX => //= r2; case: F.toX => //= r3 _ H2.
by lra.
Qed.

Lemma solve_correct prec depth n f a1 a2 b1 b2 c1 c2 d1 d2 x
     (i1 := I.div prec (I.fromZ a1) (I.fromZ b1))
     (i2 := I.div prec (I.fromZ a2) (I.fromZ b2))
     (j1 := I.div prec (I.fromZ c1) (I.fromZ d1))
     (j2 := I.div prec (I.fromZ c2) (I.fromZ d2))
     (Iab := I.bnd (I.lower i1) (I.upper i2))
     (obj := I.bnd (I.upper j1) (I.lower j2)) :
  is_interval i1 -> is_interval i2 -> is_interval j1 -> is_interval j2 ->
  Z.eqb b1 0 = false -> Z.eqb d1 0 = false ->
  Z.eqb b2 0 = false -> Z.eqb d2 0 = false ->
  F.cmp (I.upper j1) (I.lower j2) = Xlt ->
   solve prec n.+1 Iab f obj depth = true ->
   (IZR a1 / IZR b1 <= x <= IZR a2 / IZR b2)%R ->
   (IZR c1 / IZR d1 <= fexpr_eval f x <= IZR c2 / IZR d2)%R.
Proof.
move=> Ii1 Ii2 Ij1 Ij2 b1P d1P b2P d2P uLv Hs H1.
apply: D2R_divWr Ij1 Ij2 d1P d2P _.
have := D2R_divWl Ii1 Ii2 b1P b2P H1.
rewrite  -/i1 -/i2 -/j1 -/j2.
rewrite -[I.lower i1] / (I.lower Iab).
rewrite -[I.upper i2] / (I.upper Iab).
rewrite -[I.upper j1] / (I.lower obj).
rewrite -[I.lower j2] / (I.upper obj) => H2.
move: Hs.
rewrite /solve.
set ob := odd _.
set zn := Pos.of_nat _.
set z2n :=  (_ - _)%positive.
set vn :=  I.fromZ _.
set v2n :=  I.fromZ _.
set l1 :=  nseq _ _.
set vl1 := Icheby_nodes _ _ _.
set vl2 := ITvalues _ _ _ _.
elim: depth (I.lower Iab) (I.upper Iab) H2 => // m IH a b.
rewrite solve_recE.
case aLb : (F.cmp a b) => //.
have z2nE : z2n = Pos.of_nat (n.+1).*2.+1.
  rewrite /z2n /zn [in LHS]Nat2Pos.inj_succ //.
  rewrite [RHS]Nat2Pos.inj_succ // !Pplus_one_succ_r.
  rewrite -muln2 Nat2Pos.inj_mul // [Pos.of_nat 2]/=; lia.
have [HI aLxLb _|] := boolP (I.subset _ _).
  have: contains (I.convert obj) (Xreal (fexpr_eval f x)).
    apply: contains_subset HI.
    apply: eval_range_cms_correct => //.
    - by exact: aLb.
    - apply: fexpr_cms_correct => //.
    - rewrite /vn /zn INR_IZR_INZ /Z.of_nat Pos.of_nat_succ.
      by apply: I.fromZ_correct.
    - rewrite /v2n z2nE INR_IZR_INZ /Z.of_nat Pos.of_nat_succ.
    - rewrite Nat2Pos.inj_succ // Pplus_one_succ_r.
      rewrite -muln2 Nat2Pos.inj_mul // [Pos.of_nat 2]/=.
      rewrite [Pos.of_nat n.+2]Nat2Pos.inj_succ // Pplus_one_succ_r.
      rewrite -mult_IZR.
      rewrite (_ : (Zpos(Pos.of_nat n.+1 * 2 + 1) + 1 =
              2 * Z.pos (Pos.of_nat n.+1 + 1))%Z); last by lia.
      by apply: I.fromZ_correct.
    - suff: I.subset (I.bnd a b) (I.bnd a b) by apply.
      move: aLxLb aLb.
      rewrite /D2R /= /I.T.toR.
      rewrite  /= !F.cmp_correct.
      by case: F.toX => //=; case: F.toX => //= r1 r2;
         rewrite (Rcompare_Eq r2 r2) // (Rcompare_Eq r1 r1).
    move: aLxLb aLb.
    rewrite /D2R /= /I.T.toR.
    rewrite  /= !F.cmp_correct.
    by case: F.toX => //=; case: F.toX.
  move: uLv.
  rewrite -[I.upper j1] / (I.lower obj).
  rewrite -[I.lower j2] / (I.upper obj).
  case: (obj).
    rewrite /D2R /= /I.T.toR.
    by rewrite  /= !F.cmp_correct ?F.nan_correct.
  move=> u1 v1.
  rewrite /D2R /= /I.T.toR.
  rewrite  /= !F.cmp_correct.
  by case: F.toX => //=; case: F.toX.
set ma := I.midpoint _.
have := IH a ma.
lazy zeta.
case: solve_rec => //.
have := IH ma b.
case: solve_rec => //.
move=> / (_  _ isT) Hv1 / (_  _ isT) Hv2 MM aLxLb _.
have [] := I.midpoint_correct (I.bnd a b) => [|V1 V2].
  exists (Xreal (D2R a)) => /=.
  move: aLb.
  rewrite /D2R /= /I.T.toR.
  rewrite  /= !F.cmp_correct.
 case: F.toX => //=; case: F.toX => //= r1 r2.
 by case: Rcompare_spec => //; lra.
rewrite -/a1 in V1 V2.
have HH : (D2R a <= D2R ma <= D2R b)%R.
  move: aLb V2; rewrite F.cmp_correct /D2R /=.
  rewrite /I.T.toR.
  case: (F.toX a); case: (F.toX b) => //= r1 r2; case: Rcompare_spec => //.
  by case: (F.toX ma).
have [HH1|HH1]: (D2R a <= x <= D2R ma \/ D2R ma <= x <= D2R b)%R.
      by lra.
  by apply: Hv2.
by apply: Hv1.
Qed.

End Solver.

(* Tactic to solve box problems :
       a1/b1 <= x <= a2/b2 -> a3/b3 <= f x <= a4/b4
*)

Lemma Rpower_IZR a b :
   Rpower (IZR (Zpos a)) (IZR (Zpos b)) = IZR (Zpos a ^ Zpos b).
Proof.
by rewrite -powerRZ_Rpower ?Raux.IZR_Zpower_pos //; apply: RIneq.IZR_lt.
Qed.

Ltac cheby_solve_tac prec depth degr tang H :=
  rewrite ?Rpower_IZR -?RIneq.mult_IZR;
  match type of H with
  | (_ <= ?x <= _)%R =>
    match goal with
    |- (_ <= ?X <= _)%R =>
        rewrite (_ :  X = fexpr_eval tang x); last by apply: refl_equal
    end
  end;
  apply: (@solve_correct prec depth degr.-1 _ _ _) H;
  match goal with
  |  |- is_true (is_interval ?X) => native_cast_no_check (refl_equal true)
  |  |-  _ = ?X => native_cast_no_check (refl_equal X)
  end.

End CPoly_interval.
