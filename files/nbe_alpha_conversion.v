Add LoadPath "ssreflect041206/group_theories".
Require Arith.
Require Eqdep.
Require Wf_nat.
Require Import Omega.
Require Import finrel.
Require Import ssreflect.
Require Import ssrnat.
Require Import ssrbool.
Require Import eqtype.


(* Types and type equality *)

Inductive ST : Set :=
  Iota : ST | Arr : ST -> ST -> ST.


Inductive cast_result (a1 a2 : ST) : Type :=
  | Cast (k : forall P, P a1 -> P a2)
  | NoCast.

Implicit Arguments NoCast [a1 a2].

Notation idcast := (Cast _ _ (fun _ x => x)).

Fixpoint cast (a1 a2 : ST) {struct a2} : cast_result a1 a2 :=
  match a1 as d1, a2 as d2 return cast_result d1 d2 with
  | Iota, Iota => idcast
  | Arr b1 c1, Arr b2 c2 =>
    match cast b1 b2, cast c1 c2 with
    | Cast kb, Cast kc =>
      let ka P :=
        let Pb d := P (Arr d c1) in let Pc d := P (Arr b2 d) in
        fun x => kc Pc (kb Pb x)
      in Cast _ _ ka
    | _, _ => NoCast
    end
  | _, _ => NoCast
  end.

Lemma cast_same : forall a, cast a a = idcast.
Proof. by elim=> //= [b -> c ->]. Qed.

Definition eqst a1 a2 := if cast a1 a2 is Cast _ then true else false.

Lemma eqst_arrow : forall b1 c1 b2 c2,
  eqst (Arr b1 c1) (Arr b2 c2) = eqst b1 b2 && eqst c1 c2.
Proof. by move=> *; rewrite /eqst /=; do 2 case: (cast _ _). Qed.

Lemma eqstP : reflect_eq eqst.
Proof.
elim=> [|b1 IHb c1 IHc] [|b2 c2]; try by constructor.
by rewrite eqst_arrow; apply: (iffP andP); case; move/IHb->; move/IHc->.
Qed.

Canonical Structure simple_type_dom := EqType eqstP.

Lemma eqstE : eqst = (@set1 simple_type_dom). Proof. done. Qed.

Lemma eq_arrow :  forall b1 c1 b2 c2,
  (Arr b1 c1 == Arr b2 c2) = (b1 == b2) && (c1 == c2).
Proof. exact eqst_arrow. Qed.

Lemma castPn : forall a1 a2, reflect (cast a1 a2 = NoCast) (negb (a1 == a2)).
Proof.
by move=> *; rewrite -eqstE /eqst; case: (cast _ _); constructor.
Qed.

Lemma neq_cast :
   forall a1 a2, cast a1 a2 = if a1 == a2 then cast a1 a2 else NoCast.
Proof. by rewrite /set1 /EqType.eq /= /eqst => *; case cast. Qed.


(* Variable identifiers and equality *)

Record id : Type := mkid {idx : nat_eqType ; idT : ST}.

Notation " x ^^ T " := (mkid x T) (at level 68).

Definition id_cast a b : cast_result a.(idT) b.(idT) :=
 if a.(idx) == b.(idx) then cast a.(idT) b.(idT) else NoCast.

Lemma id_cast_same : forall a , id_cast a a = idcast.
Proof.
by elim =>[x T] ; rewrite /id_cast cast_same eq_refl.
Qed.

Definition eqid a1 a2 := if id_cast a1 a2 is Cast _ then true else false.

Lemma eqidP : reflect_eq eqid.
move => [x1 T1][x2 T2].
rewrite /eqid /id_cast /=.
case e: (x1 == x2); move/eqP : e => e;
  last by constructor ; move => [e1 e2] ; elim e.
case eT : (cast T1 T2) ; constructor ;
 last by move => [_ e2] ; move /castPn : eT => eT ; move/eqstP : eT.
rewrite  -e {e x2}.
have e : eqst T1 T2 by rewrite /eqst eT.
by move/eqstP : e->.
Qed.

Canonical Structure idd := EqType eqidP.

Lemma id_castPn : forall a1 a2, reflect (id_cast a1 a2 = NoCast)
                                        (negb (a1 == a2)).
Proof.
move => a1 a2; rewrite /set1 /EqType.eq /= /eqid /id_cast.
case e:   (idx a1 == idx a2) => //=; last by constructor.
exact (castPn _ _).
Qed.

Lemma neq_idcast : forall a1 a2,
     id_cast a1 a2 = if a1 == a2 then id_cast a1 a2 else NoCast.
Proof. by rewrite /set1 /EqType.eq /= /eqid => *; case id_cast. Qed.

(* lambda-terms *)

Inductive term : Type :=
 Var : id -> term
| Lam : id -> term -> term
| App : term -> term -> term.

(* sructural size of a term *)
Fixpoint tm_size (t:term) : nat :=
 match t with
| Var x  => 0
| Lam _  t => S (tm_size t)
| App u v => S ((tm_size u)+(tm_size v))
end.

(* Free variables -- note that definitions are computational *)

Require Import seq.

Notation "x 'notin' L" := (negb (mem L x)) (at level 68).

Fixpoint FV (t:term): seq idd :=
 match t with
| Var n  => Seq n
| App t u => cat (FV t)(FV u)
| Lam n t =>  filter (setC1 n) (FV t)
end.

Lemma FV_lam_bool: forall x t y, FV (Lam x t) y = (FV t y && negb (x == y)).
 by move => x t y; rewrite /FV -/FV mem_filter /setU /setC1 /setI;
 apply andbC.
Qed.

(* For defining substitution, we need renaming *)

(* max_ident l T := 1+(fold_left max (fst (filter (a,b => b=t) l))) *)
(*  for the non-empty list*)
Fixpoint max_ident (l:seq idd)(T:ST){struct l} : nat :=
match l with
| Seq0 => 0
| Adds (n^^U) l =>
   let m := max_ident l T in
   if (U == T) && (m <= n) then S n else m
end.

(* max_ident is an UB of the elements of the list *)
Lemma max_ident_max :
   forall  T  (l:seq idd) i, l (i^^T) ->  i < (max_ident l T).
Proof.
move => T ; elim => [ // | [n U] l Hl]/= i e.
Print setU1.
case/orP : e  => [e | il].
  case/eqP : e => -> ->.
  rewrite set11 /=; case Hi: (max_ident l T <= i) ; first exact: leqnn.
  by rewrite ltnNge Hi.
case Hi: (_ && _); auto.
case/andP: Hi=> _ Hi; exact: ltn_trans (Hl _ _) _.
Qed.

(* max_ident is the lowest UB *)
Lemma max_max_ident :
   forall T (l:seq idd) i, i < (max_ident l T) ->
   exists j, l (j^^T) && (i <= j).
Proof.
move => T; elim => /= [//| [n U] l Hl] i.
case e: (andb _ _).
  move/andP: e => [e _]; move/eqP :e => ->;
  move => Hi; exists n; rewrite /setU1;
  by rewrite eq_refl orTb andTb.
  move => Hi; move : (Hl i Hi) => [j Hj]; exists j;
    apply/andP; move/andP: Hj => [Hj1 Hj2]; split; trivial;
      rewrite /setU1 Hj1 orbT //.
Qed.

(* max_idents of set-equivalent lists are the same *)

Lemma max_equiv : forall T (l l' : seq idd),
  (forall x, l x <-> l' x) -> (max_ident l' T <= max_ident l T).
Proof.
move => T l l'; move : (max_max_ident T l (max_ident l' T));
case f:(max_ident l' T < max_ident l T) => H.
- by move/(_ is_true_true) : H => [j Hj1]; move/andP:Hj1=> [Hj1 Hj2];
  move : (max_ident_max T l j Hj1) => H; auto.
- by move/negbT: f; rewrite -leqNgt => f;
  move :(max_max_ident T l' (max_ident l T));
  rewrite ltn_neqAle f andbT leq_eqVlt eq_sym;
  case e: (max_ident l' T == max_ident l T)=>//;
  rewrite orFb => H0;
  move/(_ is_true_true) : H0 => [j Hj1]; move/andP:Hj1 => [Hj1 Hj2] H0;
  rewrite -(H0 (j^^T)) in Hj1; move : (max_ident_max T l j Hj1);
  rewrite ltnNge => H1; move/negP: H1 => H1; contradiction H1.
Qed.


Definition gensym (l:seq idd)(T:ST) : id :=
 (max_ident l T)^^T.

Lemma gensym_gen : forall (l:seq idd) T, (gensym l T) notin l.
Proof.
move => l T ; rewrite /gensym.
apply/negP => i;  move: (max_ident_max T l _ i) => H ; rewrite ltnn in H; done.
Qed.

Tactic Notation "casebool" ident(e) ":" constr(b) := case e:(b); [change b in e|idtac].
Tactic Notation "contradictionbool" hyp(e) := move/negP: e => e; contradiction e.
Tactic Notation "rwbooleq" hyp(e) "in" hyp(f) := move/eqP: e => e; rewrite e in f.
Tactic Notation "rwbooleqrev" hyp(e) "in" hyp(f) := move/eqP: e => e; rewrite <- e in f.

(* gensyms of set-equivalent lists are the same*)

Lemma gensym_equiv : forall T (l l' : seq idd),
  (forall x, l x <-> l' x) -> (gensym l T = gensym l' T).
Proof.
move => T l l' H; move : (max_equiv T l l' H).
(*WARNING: direct symmetry applications raise typing errors here,
  e.g. iff_sym & symmetry ; some 'non-implemented' errors on
  redex selection also raised*)
assert (forall x : idd, l' x <-> l x) as H0;
first by move => x; move : (H x) => H1; symmetry in H1.
move : (max_equiv T l' l H0); rewrite /gensym leq_eqVlt;
casebool e1 :(max_ident l' T <= max_ident l T).
casebool e : (max_ident l T == max_ident l' T);
  [rewrite orTb; move/eqP:e=>->; reflexivity|
  rewrite leqNgt in e1; rewrite orFb => e2; contradictionbool e1].
by casebool e: (max_ident l T == max_ident l' T);
  [rewrite orTb; move/eqP:e=>->; reflexivity| move => H1 H2].
Qed.

(* free variables in substitutions *)

Require Import List.

(* term associated to an index in a substitution*)
(* note that we return the first term of the list :*)

Fixpoint tassoc (i : id)(l:(list (id*term))) {struct l} : term :=
match l with
| nil => Var i
| cons (j,t) l => if j == i then t else (tassoc i l)
end.

Lemma tassoc_nil : forall i, tassoc i nil = Var i.
Proof. done. Qed.

Hint Resolve tassoc_nil.

(* free variables of the codomain of a substitution = (id * term) list*)
Definition ctxt := (seq.seq idd).

(* note that we do _not_ have :
   forall x, tassoc x tau = tassoc x sigma ->
   FVS sigma = FVS tau.
   because identities are accounted in substs *)

Fixpoint FVS (sigma:(list (id*term))) : ctxt :=
 match sigma with
| nil => seq0
| cons (i,t) l => cat (FV t) (FVS l)
end.

(* domain of a substitution *)

Fixpoint dom (sigma: list (id*term)) : ctxt :=
 match sigma with
| nil => seq0
| cons (i,t) l => cat (dom l) (Seq i)
end.

(* FVS captures the free vars produced by a substitution *)

Lemma FVS_tassoc_dom : forall sigma x, (dom sigma) x ->
  forall y, (FV (tassoc x sigma)) y -> (FVS sigma) y.
  elim => [| [i t] q IH] x //=.
  rewrite mem_cat /setU //= /setU1 orbF.
  case (i == x).
  - by rewrite orbT => H y; rewrite mem_cat /setU => H1;
    rewrite H1.
  - by rewrite orbF => H y H0; rewrite mem_cat /setU //=;
    rewrite (IH x H y H0) orbT.
Qed.

(* More efficient definition of free vars for substitutions : we generate a gensym linked to
    {FV(tassoc z sigma) | z in (FV t)} *)

Fixpoint eFVS (l:ctxt) (sigma:list (id*term)) {struct l} : ctxt :=
  match l with
    | seq0 => seq0
    | Adds a q => cat (FV (tassoc a sigma)) (eFVS q sigma)
  end.

Lemma eFVS_nil : forall l, (eFVS l nil) = l.
by elim => [|a q IH] //=; rewrite IH.
Qed.

Hint Resolve eFVS_nil.

(* eFVS grow with the FVs of the term it's generated from *)

Lemma eFVS_cresc : forall (l l':ctxt) sigma,
  (forall x, (l x) -> (l' x)) -> (forall y, (eFVS l sigma) y -> (eFVS l' sigma) y).
Proof.
elim => [|a q IH] l' sigma.
by case l' => //=; move => x s H; move: (H x); rewrite /setU1 eq_refl //=; auto.
rewrite /eFVS -/eFVS => H;
assert (forall x, q x -> l' x) as H0;
first by move => x; move: (H x); rewrite mem_adds /setU1; case (a == x) => //=; auto.
move => y; rewrite mem_cat /setU => H1; move/orP: H1 => H1; elim H1 => {H1}[H2|H2];
last by apply (IH _ _ H0 _ H2).
move : (H a) => {H H0}; rewrite mem_adds /setU1 eq_refl orTb; elim list:l'=> [|x s IH1]; auto;
rewrite mem_adds /setU1 /eFVS -/eFVS mem_cat /setU; casebool xa: (x == a) => H1.
by move/eqP : xa => ->; rewrite H2.
by rewrite IH1 ?orbT.
Qed.

(* caracterisation of elements *)

Lemma eFVS_in : forall x (l:ctxt) sigma,
 (exists x0, (l x0) && (FV (tassoc x0 sigma)) x) <-> (eFVS l sigma) x.
Proof.
intuition (eauto).
- elim H => x0; elim l => [|a q IH] //=;
  rewrite /setU1 mem_cat /setU => H0;
  move/andP : H0 => [H0 H1]; casebool ax0 : (a == x0).
  - by move/eqP :ax0 =>->; rewrite H1.
  - by rewrite IH ?orbT //= H1; rewrite ax0 orFb in H0; rewrite H0.
- move : H; elim l => [| a q IH] //=; rewrite mem_cat /setU /setU1 => H;
  casebool e: (FV (tassoc a sigma) x).
  - by exists a; rewrite eq_refl.
  - by rewrite e orFb in H; move : {IH H} (IH H) => {e} H;
    elim H => {H} [x0 H0]; exists x0;
    move/andP: H0 => [H0 H]; rewrite H H0 orbT.
Qed.

(* substitutions equiv wrt a ctxt *)

Lemma eFVS_equiv : forall (l:ctxt) sigma tau,
  (forall x, (l x) -> (tassoc x sigma) = (tassoc x tau)) -> (eFVS l sigma) = (eFVS l tau).
Proof.
elim => [| a q IH] sigma tau H //=.
move: (H a); rewrite mem_adds /setU1 eq_refl orTb => ->; auto.
assert (forall x : idd, q x -> tassoc x sigma = tassoc x tau) as H1;
first by move => x H1; move :(H x); rewrite mem_adds /setU1 H1 orbT => H2; auto.
rewrite (IH _ _ H1); auto.
Qed.

(* Substitution  *)

Fixpoint subst (t:term) (sigma:(list (id*term))) {struct t}: term :=
 match t with
| App u v => App (subst u sigma)(subst v sigma)
| Var x => tassoc x sigma
| Lam (x^^T) t =>
  let x' := gensym (eFVS (FV (Lam (x^^T) t)) sigma) T in
   Lam x' (subst t (((x^^T),Var x')::sigma))
end.

Notation "t [ s ]" := (subst t s) (at level 67).

(* caracterisation of free vars, note similarity w/ eFVS_in above *)

Lemma FV_in : forall (t:term) sigma x,
 (exists x0, ((FV t) x0) && (FV (tassoc x0 sigma)) x) <-> (FV (t [sigma]) x).
Proof.
elim => [i | [i T] t IH| u IHu v IHv]; move => sigma x;
split; move => H.
- by move: H => [x0 H0]; move/andP : H0 => [H0 H1]; rewrite /FV //= /setU1 orbF in H0;
  move/eqP: H0 => ->; rewrite /subst.
- by exists i; rewrite H /subst /FV //= /setU1 eq_refl.
- by rewrite FV_lam_bool -/subst; move: H =>{H} [x0 H0]; move/andP : H0 => [H0 H1];
  move : (gensym_gen (eFVS (FV (Lam (i ^^ T) t)) sigma) T) => Hx;
    casebool e: (gensym (eFVS (FV (Lam (i ^^ T) t)) sigma) T == x);
    [rwbooleq e in Hx;
      assert (eFVS (FV (Lam (i ^^ T) t)) sigma x);
        [rewrite -eFVS_in; exists x0; rewrite H0 H1|contradictionbool Hx]|
          rewrite FV_lam_bool in H0; move/andP : H0 => [H0 H2];
            rewrite andbT  -(IH ((i^^T, Var (gensym (eFVS (FV (Lam (i ^^ T) t)) sigma) T))::sigma) x);
              exists x0; rewrite H0 /tassoc -/tassoc andTb; move : H2; case (i ^^ T == x0); [trivial|rewrite H1]].
- by rewrite FV_lam_bool -/subst in H; move /andP: H => [H0 H1]; rewrite -IH in H0;
  move : H0 => [x0 H0]; move/andP : H0 => [H0 H2]; exists x0; rewrite FV_lam_bool;
    casebool e: (i ^^T == x0); [rwbooleqrev e in H2;
      rewrite /tassoc eq_refl /FV -/FV /mem /setU1 orbF in H2; contradictionbool H1|
        rewrite /tassoc -/tassoc e in H2; rewrite H0 H2].
- by rewrite /subst -/subst /FV -/FV mem_cat /setU; move : H => [x0 H0]; move/andP : H0 => [H0 H1];
  rewrite /FV -/FV mem_cat /setU in H0; move/orP: H0 => [H0u|H0v];[
  assert (FV (u [sigma]) x); [rewrite -(IHu sigma x); exists x0; rewrite H0u H1|rewrite H orTb]|
  assert (FV (v [sigma]) x); [rewrite -(IHv sigma x); exists x0; rewrite H0v H1|rewrite H orbT]].
- by rewrite /subst -/subst /FV -/FV mem_cat /setU in H; move/orP: H => [Hu| Hv];
  [rewrite -IHu in Hu; inversion Hu as [xu Hu0]; exists xu; move/andP: Hu0 => [Hu0 Hu1];
    rewrite Hu1 /FV -/FV mem_cat /setU Hu0 orTb
  |rewrite -IHv in Hv; inversion Hv as [xv Hv0]; exists xv; move/andP: Hv0 => [Hv0 Hv1];
    rewrite Hv1 /FV -/FV mem_cat /setU Hv0 orbT].
Qed.

(* that similarity is now made explcit *)

Lemma eFVS_FV : forall t sigma x,
  (eFVS (FV t) sigma) x <-> (FV (t[sigma])) x.
by move => t sigma x; rewrite -eFVS_in - FV_in.
Qed.

(* composition of two substitutions *)

Fixpoint subst_comp (tau sigma : list (id * term)) {struct sigma} : (list (id*term)):=
match sigma with
  | nil => tau
  | cons (x, t) q => cons (x, t[tau]) (subst_comp tau q)
end.

Notation "tau '@' sigma" := (subst_comp tau sigma) (at level 67).

Lemma subst_comp_comm_tassoc : forall sigma tau x,
  tassoc x (tau@sigma) = (tassoc x sigma) [tau].
elim => [|[n u] q IH] tau x //=;
by case (n == x).
Qed.

(* substitution preserves variables not in their domains*)
Lemma subs_dom : forall x s , x notin (dom s) -> (Var x) [s] = Var x.
Proof.
move => x /=; elim => [ | [y t] s IHs]//=.
rewrite mem_cat /setU negb_orb /= /setU1 orbF; move/andP => [sx ys].
move/negbET: ys => ->; auto.
Qed.

(* alpha-eta-beta-convertibility *)
Inductive conv : term -> term -> Prop :=
| crefl : forall t, conv t t
| csym : forall t u, conv t u -> conv u t
| ctrans : forall t u v, conv t u -> conv u v -> conv t v
| cbeta : forall t u x, conv (App (Lam x t) u)(subst t ((x,u) :: nil))
| calpha : forall x y T t1 t2,
  (y^^T) notin (FV (Lam (x^^T) t1)) -> conv (t1 [((x^^T), Var (y^^T))::nil]) t2 ->
              conv (Lam (x^^T) t1)(Lam (y^^T) t2)
| ceta : forall x t, x notin (FV t) -> conv t (Lam x (App t (Var x)))
| capp1 : forall u1 u2 v, conv u1 u2 -> conv (App u1 v)(App u2 v)
| capp2 : forall u v1 v2, conv v1 v2 -> conv (App u v1)(App u v2)
| clam : forall x t1 t2, conv t1 t2 -> conv (Lam x t1)(Lam x t2).

(* atomic and normal terms *)
Inductive atomic : term -> Prop :=
| atomic_var : forall x, atomic (Var x)
| atomic_app : forall t u, atomic t -> normal u -> atomic (App t u)
with
  normal : term -> Prop :=
| normal_atomic : forall t, atomic t -> normal t
| normal_lam : forall t x, normal t -> normal (Lam x t).

(* alpha-convertibility *)
Inductive alphac : term -> term -> Prop :=
| arefl : forall t, alphac t t
| asym : forall t u, alphac t u -> alphac u t
| atrans : forall t u v, alphac t u -> alphac u v -> alphac t v
| aalphac : forall x y  T t1 t2,
  (y^^T) notin (FV (Lam (x^^T) t1)) ->
  alphac (t1 [((x^^T), Var (y^^T))::nil]) t2 ->
  alphac (Lam (x^^T) t1)(Lam (y^^T) t2)
| aapp1 : forall u1 u2 v, alphac u1 u2 -> alphac (App u1 v)(App u2 v)
| aapp2 : forall u v1 v2, alphac v1 v2 -> alphac (App u v1)(App u v2)
| alam : forall x t1 t2, alphac t1 t2 -> alphac (Lam x t1)(Lam x t2).

Hint Constructors conv alphac atomic normal.

(* alpha-convertibility implies alpha-eta-beta-convertibility*)
Lemma alphac_beta : forall t t', alphac t t' -> conv t t'.
by move=> t t'; elim=>//=; auto; move => t0 u v *; apply ctrans with u.
Qed.

(* PAPER : 3.1.(i) admissibility of old aalphac case *)
Lemma subst_lam : forall t x y T, (y^^T) notin (FV (Lam (x^^T) t)) ->
  alphac (Lam (x^^T) t) (Lam (y^^T) (t[((x^^T),Var (y^^T))::nil])).
 by move => t x y T H //=; apply aalphac; auto; apply arefl.
Qed.

(* PAPER : 3.1(vi) nil substitution *)
Lemma subst_nil : forall t, alphac (t [nil]) t.
Proof.
elim => [i | [x T] t IHt | u IHt1 v IHt2] //=.
- apply asym; rewrite /gensym; apply aalphac; auto; last by
  rewrite eFVS_nil; apply (gensym_gen (seq.filter (setC1 (d:=idd) (mkid x T)) (FV t)) T).
- by apply atrans with (App u (v [nil])); auto.
Qed.

Hint Resolve subst_nil.

(* precedence in parallel substitutions *)

Lemma tassoc_app : forall x tau sigma,
   ((dom tau x) /\ (tassoc x (tau ++ sigma) = tassoc x tau))
 \/(x notin (dom tau) /\ (tassoc x (tau ++ sigma) = tassoc x sigma)).
Proof.
move=> x; elim=> [|[y u] tau IHtau] sigma.
 by right; split.
move/(_ sigma): IHtau=>[[dtx ex] | [dtx ex]];
 rewrite /= mem_cat /setU; move:dtx;  case dtx : (dom tau x)=> //= _.
 by left; rewrite /setU1 ?orbF -ex; split.
by rewrite /setU1; case yx: (y == x); [left|right].
Qed.

(* simplification for inactive substitutions *)

Lemma tassoc_appI : forall x tau sigma,
(x notin (dom tau)) -> (tassoc x (tau ++ sigma) = tassoc x sigma).
Proof.
move => x tau sigma //=; move : (tassoc_app x tau sigma).
intuition (eauto 7);
move: H H1; by case (dom tau x).
Qed.

Lemma tassoc_appF : forall x tau sigma,
(dom tau x) -> (tassoc x (tau++sigma)) = (tassoc x tau).
Proof.
move => x tau sigma //=; move :(tassoc_app x tau sigma) => H.
intuition (eauto 7).
move: H0 H; by case (dom tau x).
Qed.

(* inactive substitutions *)

Lemma tassoc_dom: forall z sigma,
  z notin (dom sigma) -> (tassoc z sigma) = Var z.
Proof.
move => [i T]; elim => [|[x t] s].
by rewrite /tassoc /dom.
by rewrite /tassoc -/tassoc /dom -/dom cats1 mem_add_last /mem /setU1; case (x == mkid i T).
Qed.

Ltac expose_equals :=
  match goal with
    | H: (_ /\ _ \/ _ /\ _) |- _ => inversion H; clear H; expose_equals
    | H: (_ /\ _ ) |- _ => let N := fresh "Hn" with O:= fresh "Ho" in
                          inversion H as [N O]; clear H;
                          try solve [move : N => //=]; expose_equals
    || idtac
end.

(* things you can prune out of substitutions for tassoc *)

Lemma tassoc_prune : forall x tau sigma j k,
 (x != j) -> (tassoc x (tau ++ (j,k)::sigma) = tassoc x (tau ++ sigma)).
move => x tau sigma j k.
move: (tassoc_app x tau ((j,k)::sigma)).
move: (tassoc_app x tau sigma).
case (dom tau x) => H1 H2 H3 //=;
expose_equals;
rewrite Ho Ho0 => //=.
rewrite eq_sym in H3; move: H3; case (j == x) => //=.
Qed.

Lemma tassoc_comp : forall x tau sigma sigma',
  (tassoc x sigma) = (tassoc x sigma') -> tassoc x (tau@sigma) = tassoc x (tau@sigma').
move => x tau.
elim => [|[n u] q IH] sigma' //=; last case (n == x);
by rewrite !subst_comp_comm_tassoc => H; rewrite -H.
Qed.

(* PAPER : 3.1.(ii) free vars of a substituted term *)

Lemma subst_FV : forall t x sigma,
  (FV (t[sigma])) x <-> (exists y, (FV t) y && (FV (tassoc y sigma)) x).
elim => [i0 | [i T] t IH | u IH1 v IH2] //=.
split; move => H;
[by exists i0; rewrite /setU1 orbF eq_refl andTb
|by move : H => [x0 H0]; rewrite /setU1 orbF in H0;
move : H0; case ix : (i0 == x0); first move/eqP : ix=>->].
split; move => H.
- rewrite mem_filter /setU /setC1 /setI in H; move/andP : H => [H0 H1];
  move: (IH x ( (mkid i T, Var (gensym (eFVS (FV (Lam (mkid i T) t)) sigma) T))::sigma)) => H2;
  elim H2 =>{H2 H3} [H _]; move: (H H1) => {H H1} H2; elim H2 => {H H2}[x0 H4];
  exists x0;
  move: (tassoc_prune x0 nil sigma (i^^T) (Var (gensym (eFVS (FV (Lam (i^^T) t)) sigma) T)));
  rewrite /app mem_filter /setU /setC1 /setI {1}eq_sym /tassoc -/tassoc; rewrite /tassoc -/tassoc in H4;
  case b: ((i^^T) == x0).
  - by rewrite b /tassoc {2}/FV //= /setU1 orbF in H4;
    move/andP: H4; move/negbET: H0=>->; move => [H2 H4].
  - by rewrite b in H4.
- rewrite mem_filter /setU /setC1 /setI;
  elim H => {H} [x0 H0]; rewrite mem_filter /setU /setC1 /setI andbC andbCA andbC in H0;
  move/andP : H0 => [H1 H2]; rewrite andbC in H1;
  move: (IH x ( (mkid i T, Var (gensym (eFVS (FV (Lam (mkid i T) t)) sigma) T))::sigma)) => H4;
  elim H4 => {H4} [_ H6].
  assert (exists y : idd, (FV t) y && FV (tassoc y ( (mkid i T, Var (gensym
    (eFVS (FV (Lam (mkid i T) t)) sigma) T))::sigma)) x);
  first by exists x0 => //=; move/negbET : H2 =>->.
  move : {H H6} (H6 H) =>->; rewrite andbT; move : (FVS_tassoc_dom sigma x0);
  casebool f: (dom sigma x0) => H0 //=.
  - move/andP :H1 => [H1 H3];
    assert ((eFVS (FV (Lam (i^^T) t)) sigma) x);
    first by elim (eFVS_in x (FV (Lam (i^^T) t)) sigma) => [H5 _]; apply H5;
    exists x0; rewrite (FV_lam_bool (i^^T) t x0) H1 H3 H2.
    by move: (gensym_gen (eFVS (FV (Lam (i^^T) t)) sigma) T);
    case e: ((gensym (eFVS (FV (Lam (i^^T) t)) sigma) T) == x) => //=; move/eqP : e=>->; rewrite H.
  - move: (tassoc_appI x0 sigma nil); rewrite f => H3;
    rewrite -app_nil_end in H3; rewrite H3 in H1 => //=; move/andP : H1 => [H1 H4];
    rewrite /FV /tassoc //= /setU1 orbF in H4; move/eqP : H4 => H4; rewrite H4 in H2;
    assert ((eFVS (FV (Lam (mkid i T) t)) sigma) x);
    [move : (eFVS_in x (FV (Lam (mkid i T) t)) sigma) => H5; inversion H5 as [H6 H7]; clear H5 H7; apply H6;
      exists x0; rewrite (FV_lam_bool (mkid i T) t x0) H1 H3 //= /setU1 H4 eq_refl H2 //= |
     by move: (gensym_gen (eFVS (FV (Lam (mkid i T) t)) sigma) T);
       case e: ((gensym (eFVS (FV (Lam (mkid i T) t)) sigma) T) == x) => //=; move/eqP : e=>->; rewrite H].
- intuition (eauto).
  - rewrite mem_cat /setU in H; move/orP : H => H;
    inversion H as [H0|H0].
    - by move: {IH1}(IH1 x sigma) => [ H1 H2]; clear H2;
      move: {H0 H1} (H1 H0) => H0; inversion H0 as [x0 H1];
      exists x0; move/andP : H1 => [H1 H2]; rewrite mem_cat /setU H1 H2 //=.
    - by move: {IH2}(IH2 x sigma) => [ H1 H2]; clear H2;
      move: {H0 H1} (H1 H0) => H0; inversion H0 as [x0 H1];
      exists x0; move/andP : H1 => [H1 H2]; rewrite mem_cat /setU H1 H2 orbT.
  - rewrite mem_cat /setU; inversion H as [x0 H0]; rewrite mem_cat /setU in H0;
    move/andP : H0 => [H1 H2]; move/orP: H1 => H1;
    inversion H1 as [H0 | H0].
    - by move: {IH1}(IH1 x sigma) => [H3 H4]; clear H3;
      assert (exists y : idd, FV u y && FV (tassoc y sigma) x);
      [exists x0; rewrite H0 H2 => //=|
      move : {H3 H4}(H4 H3) => H4; rewrite H4].
    - by move: {IH2}(IH2 x sigma) => [H3 H4]; clear H3;
      assert (exists y : idd, FV v y && FV (tassoc y sigma) x);
      [exists x0; rewrite H0 H2 => //=|
      move : {H3 H4}(H4 H3) => H4; rewrite H4 orbT].
Qed.

(* decomposition of substitutions *)

Lemma subst_decomp : forall x z tau sigma,
(FV (tassoc x (tau @ sigma))) z <-> exists y, (FV (tassoc x sigma)) y && (FV (tassoc y tau)) z.
move => x z tau.
elim => [|[i t] q IH]; split.
- by rewrite //= /setU1; move => H; exists x; rewrite eq_refl.
- by rewrite //= /setU1; move => H; inversion H as [x0 H0]; clear H; move/andP : H0 => {H0}[H H0]; rewrite orbF in H; move/eqP: H=>->.
- by rewrite /subst_comp -/subst_comp /tassoc -/tassoc; case (i == x); [rewrite subst_FV|rewrite IH].
- by rewrite -subst_FV /subst_comp -/subst_comp /tassoc -/tassoc;
  case (i == x); [auto|rewrite -subst_FV in IH; rewrite IH].
Qed.

(* substitutions that only rename variables*)
Fixpoint is_renaming (s:list (id*term)) : Prop :=
match s with
| nil => True
| (_,Var(_)):: s => is_renaming s
| _ => False
end.

Lemma renaming_tassoc_inv : forall sigma x,
  is_renaming sigma ->
  exists y, (tassoc x sigma) = Var y.
elim => [|[a b] q IH] x H.
by exists x.
rewrite /tassoc -/tassoc; casebool e: (a == x).
  move : H; rewrite //=; case b; try by auto;
    by move => i; exists i.
    by move => t t0 H; inversion H.
  apply IH; move: H; rewrite //=; case b; intros; auto; try inversion H.
Qed.

(* renamings preserve the size*)
Lemma size_rename_aux : forall t s, is_renaming s -> tm_size (subst t s) = tm_size t.
elim=> [x|[x X] t IHt|t IHt u IHu][|[y [z|h1 h2//|h1 h2//]] s]//=;
 try by rewrite IHt.
- case (y==x) => //.
 elim s => //= [[zz u]ss IHs]; case u => //=; case (zz == x) => //=  rewrite IHt.
-by intros;  rewrite IHt.
-by intros;  simpl; rewrite IHt // IHu.
-by intro hs; simpl; rewrite IHt // IHu.
Qed.

(* renaming one variable preserves the size *)
Lemma size_rename : forall t x y, tm_size (subst t ((x,Var y)::nil)) = tm_size t.
by intros; apply size_rename_aux.
Qed.

(* if x is a free variable of t[sigma], either: *)
(*         - it is a free variable of codom(sigma)*)
(*         - or it is not in dom(sigma) and a free variable of t*)
Lemma FV_subst : forall t sigma x, FV (t [sigma]) x ->
         ((FV t x) && (x notin (dom sigma))) || (FVS sigma x).
elim=> [y /=|[y Y] t IHt|t IHt u IHu] sigma x.
- elim sigma => /=[|[z v] s IHs]{sigma}; rewrite /setU1 !orbF ?andbT //.
  case e: (z==y);
  first by move => *; rewrite /setC1; apply/orP; right ; rewrite mem_cat; apply /orP; left.
  move=> f; move: (IHs f); rewrite /setU1 orbF !mem_cat /setU;
  move/orP => [h1|h]. move/andP: h1 => [h1 h2];
  apply/orP; left.
  apply/andP; split; trivial; rewrite negb_orb; apply/andP; split; trivial.
  rewrite /= /setU1 orbF. move/eqP: h1 => <- //. rewrite e //.
  by do 2 (apply/orP; right).
- rewrite /subst -/subst.
  rewrite /FV -/FV !mem_filter /setI /setC1.
  move/andP=> [ne f]. move/(_ _ _ f): IHt => h.
  move/orP: h=> /= ; rewrite mem_cat /setU /setU1 negb_orb.
  move=> [h|h]; apply/orP; [left|right].
   move/andP: h => [h1 h2]; move/andP: h2 => [h2 h3]; apply/andP.
   split; trivial; apply/andP; split; trivial.
   rewrite /= /setU1 orbF // in h3.
   by move/orP: h => [h|h]; first by move/negP: ne => ne; elim ne.
- rewrite /= !mem_cat /setU.
  move/orP=>[h|h].
   move/(_ sigma x h): IHt; move/orP=>[h1|h1]; last by apply/orP; right.
   by move/andP: h1 => [h1 h2]; apply/orP; left; apply/andP; split;  trivial; apply/orP; left.
  move/(_ sigma x h): IHu; move/orP=>[h1|h1]; last by apply/orP; right.
   by move/andP: h1 => [h1 h2]; apply/orP; left; apply/andP; split;  trivial; apply/orP; right.
Qed.

(* substitutions preserve free variables not in their domain*)

Lemma FV_subst2 : forall t sigma x,
    (FV t x) && (x notin (dom sigma)) -> FV (t [sigma]) x.
elim=> [y /=|/=[y Y] t IHt|/= t IHt u IHu] sigma x.
- rewrite /setU1 orbF; move/andP => [e d].
  move/eqP: e => -> {y}; move: d; elim sigma =>{sigma} //=;
   first by rewrite /setU1 eq_refl.
  move=> [y t] sigma.
  elim sigma => /=[|[z v] s IHs]{sigma}; rewrite /setU1 ?andbT ?orbF //.
   by case: (y == x) => //=; rewrite /setU1 orbF.
  move: IHs; case yx : (y == x) => //=.
   move => IH h c; apply IH.
    elim s => [|[a b] s1 IHs]; rewrite /= /setU1 ?eq_refl // mem_cat /setU /= /setU1.
    case (a == x); rewrite /= ?orbF ?orbT //.
  move: c; rewrite !mem_cat /setU mem_cat /setU.
  case: dom; case: ((Seq y) x); do 2 (rewrite ?orbF ? orbT //);
   move=> ee ff; do 2 (rewrite ?orbF ? orbT //).
  case: (Adds ee ff x)=>//.
  case zx: (z == x).
   move/eqP: zx=>->.
   move=> h1 h2 h3; apply h2.
  move: h3; rewrite !mem_cat /setU !mem_cat /setU.
  case: (dom s x); case: ((Seq x) x) => //.
 move=> h1 h2 h3; apply h2; move: h3.
  rewrite !mem_cat /setU !mem_cat /setU.
  case: (dom s x); case: ((Seq z) x) => //.
- rewrite mem_filter /setI /setC1.
  move/andP=>[h ds]; move/andP: h =>[yx tx].
  rewrite /= mem_filter /setC1 /setI; apply/andP; split.
  - assert ((eFVS (FV (Lam (mkid y Y) t)) sigma) x);
    [move : (eFVS_in x (FV (Lam (mkid y Y) t)) sigma) => H4; inversion H4 as [H5 H6]; clear H4 H6; apply H5;
    exists x; rewrite (FV_lam_bool (mkid y Y) t x) tx yx tassoc_dom //= /setU1 eq_refl //=|
    by move: (gensym_gen (eFVS (FV (Lam (mkid y Y) t)) sigma) Y);
    case e: ((gensym (eFVS (FV (Lam (mkid y Y) t)) sigma) Y) == x) => //=; move/eqP : e=>->; rewrite H].
  apply IHt; apply/andP; split; trivial; simpl.
  rewrite mem_cat /setU; apply/norP; split; trivial; rewrite /= /setU1 orbF //.
- rewrite 2!mem_cat /setU.
  by move/andP=>[c dx]; move/orP: c => [ty | uy]; apply/orP;
   [left; apply IHt |right; apply IHu]; apply/andP; split.
Qed.

(* PAPER : 3.1.(iii) alpha-convertible terms have the same free variables *)

Lemma FV_alpha : forall t t', alphac t t' -> forall x, FV t x = FV t' x.
induction 1; auto.
- by move=> x; apply trans_equal with (FV u x).
- move=> z; rewrite /= !mem_filter /setI /setC1.
 case xz : ((x^^T) == z) => /=.
  rewrite -(IHalphac z).
  move/eqP: xz=>->.
  move: (FV_subst t1 ((z,Var (y^^T)) :: nil) z).
  case yz : ((y^^T) == z) => //=.
  rewrite //= /setU1 yz !orbF eq_refl /negb andbF; case: FV => //=.
  move=> a e. case: setU1=> //=.
  by intro h; assert false; auto.
 case yz: ((y^^T) == z) => //=.
  move/eqP: yz xz =><-.
  rewrite /negb /andb in H; move: H; case xy: ( (x^^T)== (y^^T) ) => //=;
  case FV => x0 s //=.
  rewrite /setC1 /setU1.
  case f: ((x^^T) == x0) => //=.
  rewrite mem_filter /setI xy //=.
  case (s (y^^T)) => //=; move/eqP: f=><-.
  by rewrite xy.
  rewrite /setU1;  case (x0 == (y^^T)) => //=.
  rewrite mem_filter /setI xy.
  by case (s (y^^T)).
  rewrite -(IHalphac z).
 by move: (FV_subst t1 (((x^^T), Var (y^^T)) :: nil) z);
 move: (FV_subst2 t1 (((x^^ T), Var (y^^T)) :: nil) z);
 rewrite /= /setU1 xz //= /setU1 yz /= orbF andbT; case (FV t1 z);
 case: (FV _ z) => //= h1 h2; try (by elim h1); try elim h2.
- by move=> x; rewrite /= 2!mem_cat /setU IHalphac.
- by move=> x; rewrite /= 2!mem_cat /setU IHalphac.
- by move=> y; rewrite /= 2!mem_filter /setC1 /setI IHalphac.
Qed.

(* PAPER : 3.1.(v) equivalent substitutions produce equal terms, since they are normalizing *)

Lemma tassoc_sigma_equiv_equal : forall t sigma tau,
  (forall x, (FV t) x -> (tassoc x sigma) = (tassoc x tau)) ->
 (t[sigma]) = (t[tau]).
elim => [i|[i T] t0 IH|u H1 v H2] sigma tau.
- by rewrite /FV //= /setU1 => H; rewrite (H i); [idtac|rewrite eq_refl orbF].
- move => H //=.
  rewrite (IH ((mkid i T,
       Var
         (gensym
            (eFVS (seq.filter (setC1 (d:=idd) (mkid i T)) (FV t0)) sigma) T))
       :: sigma) ((mkid i T,
       Var
         (gensym (eFVS (seq.filter (setC1 (d:=idd) (mkid i T)) (FV t0)) tau)
            T)) :: tau)).
  by rewrite (eFVS_equiv (FV (Lam (mkid i T) t0)) sigma tau H).
  move => x H0; rewrite /tassoc -/tassoc; case e:( mkid i T == x).
  - by rewrite (eFVS_equiv (FV (Lam (mkid i T) t0)) sigma tau H).
  - by apply H; rewrite FV_lam_bool e H0.
- rewrite /subst -/subst;
  move => H; rewrite /FV -/FV in H.
  rewrite (H1 sigma tau); first rewrite (H2 sigma tau); first by trivial.
  by move => x Hx; move : (H x); rewrite mem_cat /setU Hx ?orTb ?orbT => H0; apply H0.
  by move => x Hx; move : (H x); rewrite mem_cat /setU Hx ?orTb ?orbT => H0; apply H0.
Qed.

 (* PAPER : 3.1.(vii) alpha_equal abstractions produce the same bounds on free variables *)

Lemma eFVS_alpha_equiv : forall t u x y sigma,
  alphac (Lam x t) (Lam y u) ->
  forall T, (gensym (eFVS (FV(Lam x t)) sigma) T) = (gensym (eFVS (FV (Lam y u)) sigma) T).
by move => t u x y sigma Halpha T;
apply (gensym_equiv T); move => z;
rewrite -(eFVS_in z (FV (Lam x t)) sigma) -(eFVS_in z (FV (Lam y u)) sigma); split;
move: (FV_alpha (Lam x t) (Lam y u) Halpha); move => Ha H;
inversion H as [x0 H0]; exists x0; move/andP :H0 => [H0 H1];
rewrite H1 andbT; [rewrite -(Ha x0)| rewrite (Ha x0)].
Qed.

(* PAPER : 3.1.(viii) free variables of a composed substitution *)

Lemma FV_comp : forall y x t sigma tau,
  y notin (eFVS (FV (Lam x t)) sigma) -> forall z,
(eFVS (FV (Lam x t)) (tau @ sigma)) z <-> (eFVS (FV (Lam y (t [(x, Var y)::sigma]))) tau) z.
move => y x t sigma tau H w; move/negP : H; rewrite -(eFVS_in y (FV (Lam x t)) sigma) => H;
split; rewrite -(eFVS_in w (FV (Lam y (t [(x, Var y) :: sigma]))) tau);
rewrite -(eFVS_in w (FV (Lam x t)) (tau @ sigma)) => H0; inversion H0; move/andP:H1 => {H0 H1} [H1 H2].
- rewrite subst_decomp in H2; inversion H2; clear H2; exists x1;
  rewrite FV_lam_bool; move/andP: H0 => [H0 H2];
    case e: (x1 == y);
    [by move/eqP:e => e; rewrite e in H0; contradiction H; exists x0; rewrite H1 H0|
      by clear H; rewrite eq_sym e H2 !andbT subst_FV; rewrite FV_lam_bool in H1;
        exists x0; move/andP : H1 => [H H1]; rewrite H andTb /tassoc -/tassoc;
          move/negbET: H1 =>->].
- rewrite FV_lam_bool in H1; move/andP: H1 => [H1 H3]; rewrite subst_FV in H1;
  inversion H1; clear H1; rewrite /tassoc -/tassoc in H0; move : H0; case e:(x == x1) => H0.
  - by move/andP: H0=> [H0 H1] //=; rewrite //= /setU1 orbF in H1; rewrite H1 in H3.
  - by exists x1; move/andP: H0 => [H0 H1]; rewrite FV_lam_bool e H0 //= subst_decomp;
    exists x0; rewrite H2 H1.
Qed.

 (* consequence of the above on the upper bounds*)

Lemma FV_comp_set : forall y x t sigma tau T,
  y notin (eFVS (FV (Lam x t)) sigma) ->
(gensym (eFVS (FV (Lam x t)) (tau @ sigma)) T) = (gensym (eFVS (FV (Lam y (t [(x, Var y)::sigma]))) tau) T).
move => y x t sigma tau T H;
apply (gensym_equiv T (eFVS (FV (Lam x t)) (tau @ sigma))
  (eFVS (FV (Lam y (t [(x, Var y)::sigma]))) tau) (FV_comp y x t sigma tau H)).
Qed.

(* PAPER : 3.2 decomposition of a composed substitution *)

Lemma subst_comp_unfold : forall t sigma tau,
  (t [sigma])[tau] = t [tau @ sigma].
elim => [i | [i0 T] t0 IH | u Hu v Hv] sigma tau.
- rewrite /subst -/subst;
  elim sigma => [| [x t] q IHsigma].
  - by rewrite tassoc_nil /subst_comp /subst.
  - by rewrite /subst_comp -/subst_comp /tassoc -/tassoc; case (x == i).
- rewrite /subst -/subst;
  case e: (gensym (eFVS (FV (Lam (mkid i0 T) t0)) sigma) T) => [i T0];
  rewrite (IH ((mkid i0 T, Var (mkid i T0)) :: sigma)
             ((mkid i T0,
       Var (gensym (eFVS (FV (Lam (mkid i T0) (t0 [(mkid i0 T, Var (mkid i T0)) :: sigma]))) tau) T0)) :: tau))
  -(FV_comp_set (mkid i T0) (mkid i0 T) t0 sigma tau T0).
  inversion e; rewrite -H1
  (tassoc_sigma_equiv_equal t0
    ((mkid (max_ident
      (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T) T,
        Var (gensym (eFVS (FV (Lam (mkid i0 T) t0)) (tau @ sigma)) T)) :: tau @
       (mkid i0 T,
         Var(mkid (max_ident (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T) T)) :: sigma)
    ((mkid i0 T, Var (gensym (eFVS (FV (Lam (mkid i0 T) t0)) (tau @ sigma)) T))
       :: (tau @ sigma)) ) //=;
  rewrite eq_refl; move => [x0 Tx] H; case i0x0: (mkid i0 T == mkid x0 Tx); first by trivial.
  rewrite !subst_comp_comm_tassoc;
  rewrite (tassoc_sigma_equiv_equal (tassoc (mkid x0 Tx) sigma) ((mkid
       (max_ident
          (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T) T,
    Var
      (gensym
         (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0))
            (tau @ sigma)) T)) :: tau) tau); first by trivial.
  move => x H2; rewrite (tassoc_prune x nil tau (mkid
         (max_ident
            (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T)
         T) (Var
        (gensym
           (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0))
              (tau @ sigma)) T)) ) //=;
  move :(gensym_gen (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T); rewrite /gensym=>H3;
  assert ((eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) x);
  first by rewrite -(eFVS_in x (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma);
  exists (mkid x0 Tx);
  rewrite mem_filter/setI /setC1 i0x0 H H2.
  case f :( x ==  mkid
        (max_ident
           (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T)
        T); last by trivial.
  by move/eqP :f => f; rewrite f in H4; move/negP: H3 => H3; contradiction H3.
  by move :(gensym_gen (eFVS (seq.filter (setC1 (d:=idd) (mkid i0 T)) (FV t0)) sigma) T); rewrite /gensym =>H2; rewrite -e.
- by rewrite /subst -/subst (Hu sigma tau) (Hv sigma tau).
Qed.

(* PAPER : 3.3 incorporation of a single renaming at the beginning *)

Lemma subst_head_collapse : forall t sigma u x y,
  y notin (FV (Lam x t)) ->
  (t [(x, Var y)::nil])[(y,u)::sigma] = t [(x,u)::sigma].
move => t sigma u x y H; rewrite (subst_comp_unfold t ((x, Var y)::nil) ((y,u)::sigma)).
apply (tassoc_sigma_equiv_equal t ((y, u) :: sigma @ (x, Var y) :: nil) ((x, u) :: sigma)).
move => x0 Hx0; rewrite subst_comp_comm_tassoc /tassoc -/tassoc; case e:(x == x0) => //=; first by rewrite eq_refl.
case f: ( y == x0 ); last by trivial.
by move/eqP : f => f; rewrite -f in Hx0; rewrite FV_lam_bool Hx0 f andTb e in H.
Qed.

(* PAPER : 3.5 substitutions normalize alpha-convertible terms *)

Lemma alpha_norm : forall t u,
  (alphac t u) -> forall sigma, t[sigma] = u[sigma].
move => t u.
elim => []//=.
by move => t0 u0 v Ha1 H1 Ha2 H2 sigma; rewrite (H1 sigma) (H2 sigma).
move => x y T t1 t2 Hy Ha H sigma.
rewrite -(subst_head_collapse t1 sigma
    (Var (gensym
    (eFVS (seq.filter (setC1 (d:=idd) (x^^T)) (FV t1)) sigma) T))
    (x^^T) (y^^T) ); last by trivial.
rewrite (H ((y^^T,Var (gensym
    (eFVS (seq.filter (setC1 (d:=idd) (x^^T)) (FV t1)) sigma) T))::sigma)).
by rewrite (eFVS_alpha_equiv t1 t2 (x^^T) (y^^T) sigma
  (aalphac x y T t1 t2 Hy Ha) T).
by move => u1 u2 v Ha H sigma; rewrite (H sigma).
by move => u0 v1 v2 Ha H sigma; rewrite (H sigma).
by move => [x T] t1 t2 Ha H sigma;
rewrite (eFVS_alpha_equiv t1 t2 (x^^T) (x^^T) sigma
  (alam (x^^T) t1 t2 Ha) T) (H ((x^^T,
    Var (gensym (eFVS (seq.filter (setC1 (d:=idd) (x^^T)) (FV t2)) sigma) T))
    ::sigma)).
Qed.

(* PAPER : 3.6.(i) so if you just want to normalize, apply the nil substitution *)

Lemma alpha_norm_equiv : forall t1 t2, alphac t1 t2 <-> t1 [nil] = t2 [nil].
move => t1 t2; split. move => H; apply (alpha_norm t1 t2 H nil).
move => H; apply atrans with (t1[nil]); first by apply asym; apply subst_nil.
apply atrans with (t2[nil]); first by rewrite H. apply subst_nil.
Qed.

(* PAPER : 3.6.(ii) *)

Lemma alpha_norm_subst : forall sigma tau X, (forall x, (mem X x) -> alphac (tassoc x sigma) (tassoc x tau)) <->
  (forall x, (mem X x) -> (tassoc x (nil@sigma)) = (tassoc x (nil@tau))).
by move => sigma tau; split; move => H x; [idtac|move:(H x)];
rewrite !subst_comp_comm_tassoc;
[rewrite -alpha_norm_equiv; apply (H x)|rewrite alpha_norm_equiv].
Qed.

(* PAPER : 3.8 equivalent substitutions on alpha-convertible terms yield alpha-convertible terms*)

Lemma subst_alpha_compat: forall t1 t2 sigma tau,
  (alphac t1 t2) ->
  (forall x, (FV t1) x -> alphac (tassoc x sigma) (tassoc x tau)) ->
  alphac (t1 [sigma]) (t2[tau]).
move => t1 t2 sigma tau Ha H;
move : (alpha_norm_subst sigma tau (FV t1))=> [H1 H2]; move: (H1 H)=> {H1 H2} H1.
apply atrans with ((t1[sigma])[nil]); first by apply asym; apply subst_nil.
rewrite subst_comp_unfold.
apply atrans with (t1 [nil@tau]);
first by rewrite (tassoc_sigma_equiv_equal t1 (nil@sigma) (nil@tau) H1); apply arefl.
rewrite (alpha_norm t1 t2 Ha (nil@tau)).
rewrite -subst_comp_unfold.
apply subst_nil.
Qed.

(* PAPER : 3.9 incorporation of a single substitution at the end *)
(* Proof is muuuch harder than advertised *)

Lemma subst_collapse_inv: forall y x t sigma u,
  y notin (eFVS (FV (Lam x t)) sigma) ->
  alphac ((t[(x, Var y)::sigma]) [(y, u)::nil]) (t[(x,u)::sigma]).
move => y x t sigma u H.
rewrite subst_comp_unfold; apply subst_alpha_compat; first by trivial.
rewrite /subst_comp -/subst_comp /subst -/subst {2}/tassoc -/tassoc eq_refl //= => x0 H0;
case e: (x == x0) => //=.
rewrite subst_comp_comm_tassoc (tassoc_sigma_equiv_equal (tassoc x0 sigma) ((y,u)::nil) nil);
first by apply subst_nil.
move => x1 Hx1; rewrite /tassoc -/tassoc; case f: (y == x1) => //=.
by move/eqP: f => f; rewrite -f in Hx1; move/negP: H => H; contradiction H;
rewrite -eFVS_in; exists x0; rewrite FV_lam_bool Hx1 H0 e.
Qed.

(* PAPER : 3.11 our definition of substitution is actually compatible with alpha-conversion *)

Lemma lam_alpha : forall t x y Tx sigma,
  (y ^^ Tx) notin (eFVS (FV (Lam (x^^Tx) t)) sigma) ->
  alphac ((Lam (x^^Tx) t) [sigma]) (Lam (y^^Tx) (t [((x^^Tx),Var (y ^^Tx))::sigma])).
move => t x y Tx sigma H //=.
rewrite /gensym.
case e: ((max_ident
           (eFVS (seq.filter (setC1 (d:=idd) (x ^^ Tx)) (FV t)) sigma) Tx) ^^ Tx == y ^^ Tx).
by move/eqP: e =>->; trivial.
 apply (aalphac (max_ident
           (eFVS (seq.filter (setC1 (d:=idd) (x ^^ Tx)) (FV t)) sigma) Tx) (y) Tx (t
         [(x ^^ Tx,
          Var
            (max_ident
               (eFVS (seq.filter (setC1 (d:=idd) (x ^^ Tx)) (FV t)) sigma) Tx
             ^^ Tx)) :: sigma]) (t [(x ^^ Tx, Var (y ^^ Tx)) :: sigma])).
rewrite FV_lam_bool e andbT;
(* TODO : find a cleaner way to do abs. proof *)
case f: (FV
        (t
         [(x ^^ Tx,
          Var
            (max_ident
               (eFVS (seq.filter (setC1 (d:=idd) (x ^^ Tx)) (FV t)) sigma) Tx
             ^^ Tx)) :: sigma]) (y ^^ Tx));
    last by trivial.
    by change (is_true (FV
      (t
        [(x ^^ Tx,
          Var
          (max_ident
            (eFVS (seq.filter (setC1 (d:=idd) (x ^^ Tx)) (FV t)) sigma) Tx
            ^^ Tx)) :: sigma]) (y ^^ Tx))) in f;
    rewrite -FV_in in f; assert (eFVS (FV (Lam (x ^^ Tx) t)) sigma (y ^^ Tx));
      [rewrite -eFVS_in;
       inversion f as [x0 H0]; clear f; exists x0;
       move/andP: H0 => [H0 H1]; rewrite /tassoc -/tassoc in H1; case f:(x ^^ Tx == x0); rewrite f in H1;
         [rewrite /FV -/FV //= /setU1 orbF in H1; move/negP: e=> e; contradiction e
         |rewrite H1 andbT FV_lam_bool f H0]
      |move/negP : H => H; contradiction H].
apply subst_collapse_inv.
by rewrite /FV -/FV ; rewrite gensym_gen.
Qed.

(* WORKING : permutation lemma,
   standard version of McK-P*)

Lemma subst_perm : forall t tau sigma x y,
  x notin (dom tau) ->
  t [tau ++ (x,y) :: sigma] = t [(x,y) :: tau ++sigma].
move => t tau sigma x y H;
apply (tassoc_sigma_equiv_equal t (tau ++ (x,y) :: sigma) ((x,y) :: tau ++sigma)).
move => x0 H0; case e:(x == x0).
  - by move/eqP: e => e; rewrite e in H; rewrite e (tassoc_appI x0 tau ((x0,y)::sigma)) //= /tassoc -/tassoc eq_refl.
  - by rewrite /tassoc -/tassoc e tassoc_prune /negb //= eq_sym e.
Qed.

(* extensions of the domain of a substitution that do not
   change its result on a given term*)

Lemma subst_dom_aux : forall t x u sigma tau,
 (x notin (FV t) \/ dom sigma x) ->
 alphac (t [sigma ++ (x,u) :: tau])(t [sigma ++ tau]).
move => t x u sigma tau H;
rewrite (tassoc_sigma_equiv_equal t (sigma++(x,u)::tau) (sigma++tau)).
- by apply arefl.
- move => x0 H0; case e: ( x0 == x).
  - by move/eqP: e=>e; rewrite e in H0; rewrite H0 in H; move/orP: H => H; rewrite orFb in H;
    rewrite e; rewrite (tassoc_appF x sigma ((x,u)::tau)) => //=; rewrite (tassoc_appF x sigma tau).
  - by apply tassoc_prune; rewrite /negb e.
Qed.

Lemma subst_dom : forall t s,
  (forall x, FV t x -> ~~dom s x) ->
  alphac (t [s]) t.
Proof.
move => t s H; apply atrans with (t[nil]); last by apply subst_nil.
rewrite (tassoc_sigma_equiv_equal t s nil); [apply arefl|
move => x0 H0; by rewrite (app_nil_end s) (tassoc_appI x0 s nil (H x0 H0))].
Qed.

(* an extension of subst_collapse_inv above, where the collapse point is prec. by a subst.*)

Lemma subst_comp_var_aux : forall t u x y sigma tau,
   y notin (eFVS (FV t) sigma) -> ~~FVS tau y ->
     alphac ( (t [tau ++ (x,(Var y))::sigma]) [(y,u)::nil])
            ( t [tau ++ (x,u)::sigma]).
Proof.
move=> t u x y sigma tau Hsigmay Htauy; rewrite subst_comp_unfold;
apply subst_alpha_compat; first by trivial.
move => x0 H0; case e0:((dom tau) x0).
- rewrite (tassoc_comp x0 ((y,u)::nil) (tau++(x,Var y)::sigma) (tau)) //=;
  [rewrite (tassoc_appF x0 tau ((x,u)::sigma)) //=| rewrite (tassoc_appF x0 tau ((x,Var y)::sigma)) //=].
  - rewrite subst_comp_comm_tassoc; rewrite (tassoc_sigma_equiv_equal (tassoc x0 tau) ((y,u)::nil) nil);
    first by apply subst_nil.
    move => x1 Hx1; rewrite /tassoc -/tassoc; case f: (y == x1) => //=.
      by move/eqP: f => f; rewrite -f in Hx1; move/negP: Htauy => Htauy; contradiction Htauy;
      apply (FVS_tassoc_dom tau x0).
- move/negP : e0 => e0; move/negP : e0 => e0.
  rewrite (tassoc_comp x0 ((y,u)::nil) (tau++(x, Var y)::sigma) ((x,Var y)::sigma))//=;
  [rewrite (tassoc_appI x0 tau ((x,u)::sigma))//= eq_refl|rewrite (tassoc_appI x0 tau ((x, Var y)::sigma))//=].
  case (x == x0) => //=;
  rewrite subst_comp_comm_tassoc; rewrite (tassoc_sigma_equiv_equal (tassoc x0 sigma) ((y,u)::nil) nil);
  first by apply subst_nil.
  - move => x1 Hx1; rewrite /tassoc -/tassoc; case f: (y == x1) => //=.
      by move/eqP: f => f; rewrite -f in Hx1; move/negP: Hsigmay => Hsigmay; contradiction Hsigmay;
      rewrite -eFVS_in; exists x0; rewrite Hx1 H0.
Qed.

(* case description of subst & subst_head_collapse above*)

Lemma subst_dom_aux2 :
   forall t, (forall s, (forall x, FV t x -> ~~dom s x) ->
                  alphac (t[s]) t)
           /\(forall x y sigma tau, y notin (dom sigma) ->
              y notin (dom tau)-> x notin (dom tau) ->
              alphac ((t [(x,Var y)::nil]) [tau ++ sigma])
                     (t [tau ++ (x,Var y)::sigma])).
move => t; split.
exact (subst_dom t).
move => x y sigma tau Hsigmay Htauy Htaux.
rewrite subst_comp_unfold; apply subst_alpha_compat; first by trivial.
move => x0 H0.
rewrite /subst_comp -/subst_comp /subst -/subst.
rewrite (tassoc_appI y tau sigma) //= {1}(app_nil_end sigma) (tassoc_appI y sigma nil) //=.
change (alphac (Var x0 [(x, Var y)::tau++sigma]) (Var x0 [tau++(x,Var y)::sigma])).
rewrite subst_perm //=; apply arefl.
Qed.

Lemma subst_comp_var : forall t u x y sigma,
  y notin (eFVS (FV (Lam x t)) sigma) ->
  alphac (subst (subst t ((x,(Var y))::sigma)) ((y,u)::nil))
       (subst t ((x,u)::sigma)).
move => t u x y sigma H;
apply (subst_collapse_inv) => //=.
Qed.
