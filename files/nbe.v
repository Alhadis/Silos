(* $Header: /users/logical/garillot/RCS/nbe_lemma_reverted_eta.v,v 1.5 2007/06/07 12:05:38 garillot Exp $ *)

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


Require Import nbe_alpha_conversion.
Require Import List.


(* typing *)
Fixpoint inferc (t:term) : option ST :=
 match t with
| Var n  => Some n.(idT)
| App t u =>
   match inferc t, inferc u with
     | Some (Arr A B) , Some C =>
        if eqst C A then Some B else None
     | _, _ => None
  end
| Lam n t => match inferc t with
   | Some B => Some (Arr n.(idT) B)
   | _ => None
 end
end.

Definition WT t T := inferc t = Some T.

(* just for fun : traditional definition of typing *)

Inductive WT_rules : term -> ST -> Prop :=
| var : forall n T , (WT_rules (Var (n ^^ T)) T)
| lam : forall A B n t , (WT_rules t B) ->
                          (WT_rules (Lam (n^^A) t) (Arr A B))
| app : forall A B t u , (WT_rules t (Arr A B)) ->
                              (WT_rules u A) -> (WT_rules (App t u) B).

Lemma WT_WT_rules : forall t T, WT t T -> WT_rules t T.
Proof.
elim => [[x U]|[x U] t IHt| t IHt u IHu] T; rewrite /WT /=.
- move => [->]; constructor.
- case e : (inferc t) => [V|//][<-]; constructor; auto.
- case et : (inferc t) => [[//|A B]|//].
  case eu : (inferc u) => [C|//].
  case eC : (eqst _ _) => //.
  move => [<-]; apply app with A; auto.
  move/eqstP : eC<-; auto.
Qed.

Lemma WT_rules_WT : forall t T, WT_rules t T -> WT t T.
elim => [[x U] T|[x U] t IHt T| t IHt u IHu T]; rewrite /WT /=.
- inversion 1; trivial.
- inversion_clear 1; rewrite (IHt B) //.
- inversion_clear 1.
  rewrite (IHt (Arr A T)) // (IHu A) // /eqst cast_same //.
Qed.

(* These inversion lemmas may simplify proofs later *)

Lemma app_inv_l : forall t u V, WT (App t u) V -> {T:ST | WT t T}.
rewrite /WT /=.
move => t u V; case: (inferc t) => [T _ | //=]; split with T; done.
Qed.


Lemma app_inv_r : forall t u V, WT (App t u) V -> {U:ST | WT u U}.
rewrite /WT /=.
move => t u V.
case: (inferc t) => [T  | //=];
  case eU: (inferc u) => [U | //=] ; case T => //=;
  split with U; done.
Qed.

Lemma app_inv :
  forall t u T, WT (App t u) T -> {U:ST | WT u U /\ WT t (Arr U T)}.
Proof.
rewrite /WT /=; move => t u T;
 case: (inferc t) => [TT | //=];
 case eU: (inferc u) => [U | //=]; case: TT => //=.
by move => UU TT; case: eqstP => //= [<-] [<-]; exists U.
Qed.

Lemma lam_inv :
  forall x t T, WT (Lam x t) T ->    {A:ST | T=Arr x.(idT) A /\ WT t A}.
Proof.
rewrite /WT /=; move => [x A] /= t T; case: (inferc t) => [B | //=] => [[<-]].
exists B; auto.
Qed.

(* The key definition : lifting types to Coq *)
Fixpoint tr (alpha:Type)(T:ST) {struct T}: Type:=
  match T with
| Iota => alpha
| Arr A B => (tr alpha A)->(tr alpha B)
end.

(* The decompilation functions *)

Definition dummy := O^^Iota.

Fixpoint decomp (T:ST){struct T} : (tr term T)->term :=
 match T as U return (tr term U)->term with
| Iota => fun (t:term) =>t
| Arr A B => fun t =>
   let x:= gensym (FV (decomp B (t (long A (Var dummy))))) A in
           Lam x
            (decomp B (t (long A (Var x))))
 end
with
long (T:ST) {struct T}: term -> (tr term T) := fun t =>
 match T as U return (tr term U) with
| Iota =>  t
| Arr A B => fun x:(tr term A) =>
     (long B (App t (decomp A x)))
end.

(* condition for decomp to be WT -- not clear it will be useful *)

Fixpoint sem_WT (T:ST) :  (tr term T) -> Prop :=
 match T as T return (tr term T) -> Prop with
| Iota => fun t => WT t Iota
| Arr A B => fun t => forall x , (sem_WT A x) -> (sem_WT B (t x))
end.

Lemma decomp_WT_aux: forall T,
       (forall t, sem_WT T t -> WT (decomp T t) T)
    /\ (forall t, WT t T -> sem_WT T (long T t)).
Proof.
elim => [| T1 [IHT1 IHT12] T2 [IHT21 IHT22]] /= ; first by split.
split => [t Ht |t Ht x Hx] ; rewrite /WT /=.
 rewrite  IHT21// ; apply Ht ; exact: IHT12.
by apply IHT22 ; rewrite /WT /= Ht IHT1 // eqstE set11.
Qed.

Lemma decomp_WT : forall T t,
            sem_WT T t ->  WT (decomp T t) T.
by move => T; case (decomp_WT_aux T).
Qed.

(* For compilation, we need environements *)

(* sem_env : alpha -> a map from ids to alpha-based types*)
Definition sem_env (alpha : Type) := forall x , tr alpha x.(idT).

(* esc : extension of I with x -> e*)
Definition esc (alpha:Type)(I:(sem_env alpha)) x (e:(tr alpha x.(idT)))
                                                          : sem_env alpha:=
 fun y =>
 match id_cast x y with
| Cast f => f (tr alpha) e
| NoCast => I y
end.

Notation "I & x ~> e 'of' alpha" := (esc alpha I x e) (at level 68).

Inductive comp_res (al:Type) : Type :=
| Comp : forall T:ST , (sem_env al -> tr al T) -> comp_res al
| NoComp.

Fixpoint comp (al:Type)(t:term): comp_res al:=
  match t with
| Var i => Comp al i.(idT) (fun I => (I i))

| Lam i t =>
   match comp al t with
  | NoComp => NoComp _
  | Comp U f => Comp al (Arr i.(idT) U)
                        (fun I x => (f (I & i ~> x of al)))
   end

| App u v =>
   match comp al u , comp al v with
  | Comp (Arr U1 U2) su , Comp V sv =>
     match cast V U1 with
       | Cast f => Comp al U2 (fun I => (su I (f (tr al)(sv I))))
       | NoCast => NoComp _
     end
  | _,_ => NoComp _
 end
end.

Eval compute in (comp nat (Lam (O^^Iota) (Var  (O^^Iota)))).

(* reflection captures well-typed terms *)
Lemma comp_infer al t :
  inferc t =
     if (comp al t) is Comp U _ then Some U else None.
Proof.
move=> al; elim => //= [x t IHt | u -> v ->].
case: (inferc t) IHt => //=; case: (comp al t) => //=; by move => T _ U [->].
case: (comp al u) => //= [[ //=|V U]] su; case (comp al v) => //= VV sv;
 by rewrite /eqst; case: cast.
Qed.


(* WT_subst l := map (fun x t => WT t x.idT) l) *)

Fixpoint WT_subst  (l:(list (id*term))) : Prop :=
match l with
| nil => True
| cons ((n^^T),t) l => (WT t T)/\(WT_subst l)
end.

(* substitution by well-typed terms preserves type inference *)

Lemma WTs : forall t l , (WT_subst l) -> (inferc t)=(inferc (t [l])).
Proof.
elim => [[x U] | [x T] t IHt | u IHu v IHv]//=.
elim => //= [[[y V] v] l] IHl [wv wl].
move: wv ; case e: ((y^^V) == (x^^U)); last rewrite IHl //=.
 by rewrite /WT ; move/eqidP : e => [ _ <-] ->.
case: (inferc t) IHt T => //= T IHt; last by move => *; rewrite -T //=; split.
by move => U l wl; rewrite -IHt //=; split.
move => l wl; rewrite -(IHu l) //= -IHv //=.
Qed.

(* substitution by well-typed terms preserves typing *)

Lemma WTs' : forall t l T , (WT t T)->(WT_subst l)->(WT (t [l]) T).
Proof.
rewrite /WT; move => t l T wt wl; rewrite -WTs //=.
Qed.


Fixpoint sem_norm  T : (tr term T) -> Prop :=
 match T as T return (tr term T)->Prop with
 | Iota =>(fun t => normal t)
 | Arr A B =>(fun t => forall (u:(tr term A)), sem_norm A u -> sem_norm B (t u))
 end.

Hint Resolve normal_atomic atomic_var atomic_app normal_lam.

(* We want to define extentional equality on the semantics *)
(* let us allow to parameter everything by the semantic base type *)

Record setoid : Type :=
  { alpha :> Type ; base : alpha -> alpha -> Prop;
    base_refl : forall x, base x x;
    base_sym : forall x y, base x y -> base y x;
    base_trans : forall x y z, base x y -> base y z -> base x z}.


(* From now on, we are mainly interested by the interpretation by term *)

Definition stm := Build_setoid term  conv crefl csym ctrans.

(*
Definition ext_term := ext_eq stm.
Definition term_sym := base_sym stm.
Definition term_trans := base_trans stm.
Definition term_refl := base_refl stm.
*)

Hint Resolve crefl csym capp1 capp2.


Fixpoint ext_norm (T:ST) {struct T}
                   :  tr stm T -> tr stm T -> Prop :=
 match T as T return  tr stm T -> tr stm T -> Prop with
| Iota => fun t1 t2 => base stm t1 t2/\normal t1/\normal t2
| Arr A B =>
      fun t1 t2 =>
           forall u1 u2, ext_norm A u1 u2 ->
                ext_norm B (t1 u1)(t2 u2)
end.

Lemma norm_sym : forall T t1 t2, ext_norm T t1 t2 -> ext_norm T t2 t1.
elim=> /=[|A IHA B IHB] t1 t2; first by move=>[h1 [h2 h3]]; auto.
move=> h u1 u2 e; move/(_ u2 u1 (IHA _ _ e)): h; auto.
Qed.

Lemma norm_trans : forall T t1 t2 t3,
     ext_norm T t1 t2 -> ext_norm T t2 t3 -> ext_norm T t1 t3.
elim=> /=[|A IHA B IHB] t1 t2 t3.
 by move=>[h1 [h2 h3]][g1 [g2 g3]]; repeat split; trivial; apply ctrans with t2.
move=> h1 h2 u1 u2 e; apply IHB with (t2 u1); auto.
by apply h1; apply IHA with u2; trivial; apply norm_sym.
Qed.

Lemma norm_refl : forall T t1 t2, ext_norm T t1 t2 -> ext_norm T t1 t1.
by move=> T t1 t2 e; apply norm_trans with t2; trivial; apply norm_sym.
Qed.

(* decompilation returns normal forms *)
Lemma decomp_norm_aux :
 forall T, (forall t, sem_norm T t ->normal (decomp T t))
         /\(forall t,  atomic t -> sem_norm _ (long T t)).
Proof.
elim => //=; first by split ; trivial; constructor.
move => A [IHA1 IHA2] B [IHB1 IHB2]; split; auto.
Qed.

Lemma decomp_norm : forall T t, sem_norm T t -> normal (decomp T t).
move => T t; case (decomp_norm_aux T) => [h _]; auto.
Qed.

Lemma long_norm : forall T t, atomic t -> sem_norm _ (long T t).
Proof.
move => T t; case (decomp_norm_aux T) => [_ h]; auto.
Qed.


Lemma wt_comp : forall t T al,
     WT t T -> { st : sem_env al -> tr al T | comp al t = Comp al T st}.
Proof.
by move => t T al; rewrite /WT; rewrite (comp_infer al);
 case  (comp al t) => //= TT st [<-] ; by split with st.
Qed.

Lemma comp_norm :
 forall t T (I:(sem_env term)),
   (forall x, sem_norm (idT x)(I x)) ->
      WT t T ->
       match comp term t with
      | NoComp => False
      | Comp T st => sem_norm T (st I)
     end.
elim => [[x TT]| [x X] t IHt | u IHu v IHv] T I nI.
- move => [->]{TT} //=; exact (nI (mkid x T)).
- move => wlt; move: (wlt); case (lam_inv _ _ _ wlt) => A [-> wt]{wlt T} wlt.
  move: IHt => /=; case (wt_comp _ _ term wt) => [semt ->] /=.
  fold tr; move => IHt; move: {IHt} (IHt A) => IHt u nu /=.
  apply IHt; trivial.
  move => [y Y].
  rewrite /esc/= /set1 /EqType.eq /= /eqid /= /id_cast /=.
  case: eqP => [<-|_] /=; last exact (nI (mkid y Y)).
  rewrite neq_cast.
  case: eqP => [<-{T}|_] /=; last exact (nI (mkid x Y)).
  rewrite cast_same //=.
- move => wt; case (app_inv _ _ _ wt) => V [wv wu] /=;
  move: {IHu IHv} (IHu _ I nI wu) (IHv _ I nI wv);
   case (wt_comp _ _ term wu)=>[semu ->]; case (wt_comp _ _ term wv)=>[semv ->].
  rewrite cast_same; move => IHu IHv; auto.
Qed.

Lemma norm_norm :
 forall t T I, (forall x, sem_norm (idT x)(I x)) -> WT t T ->
 match comp term t with
| NoComp => False
| Comp T st => normal (decomp T (st I))
end.
move => t T I nI wt; case (wt_comp _ _ term wt) => st e.
rewrite e; apply decomp_norm.
move: (comp_norm _ _ I nI wt).
rewrite e //=.
Qed.

Require Import nbe_fvc.
Require Import seq.

(* decompilations equal mod. conv *)

Fixpoint sem_conv (T:ST) : term -> (tr term T) -> Prop :=
 match T as T return term -> (tr term T) -> Prop with
  | Iota =>fun t st => conv t st
| Arr A B => fun t st =>
    forall u su,
         sem_conv A u su -> sem_conv B (App t u) (st su)
end.

Lemma sem_conv_ext1 : forall T t st, sem_conv T t st ->
    forall t', conv t' t ->
         sem_conv T t' st.
Proof.
elim => /= [|A IHA B IHB].
 by move=> t *; apply ctrans with t.
move=> t st e t' e' u su esu.
apply IHB with (App t u); auto.
Qed.



Lemma sem_decomp_aux : forall T ,
  (forall t st, sem_conv T t st -> conv t (decomp T st))/\
  (forall t, sem_conv T t (long T t)).

elim => //= [A [IHA1 IHA2] B [IHB1 IHB2]].
split => [t st e|]; try split.
- assert (eax : (conv (App t (Var dummy))(decomp B (st  (long A
                 (Var dummy)))))) by auto.
case (real_fvc _ _ _ (gensym (FV (decomp B (st (long A (Var dummy))))) A)
        eax (gensym_gen _ _)) =>  [t' [ett' ft']].
apply ctrans with t'; trivial.
apply ctrans with
  (Lam (gensym (FV (decomp B (st (long A (Var dummy))))) A)
       (App t' (Var (gensym (FV (decomp B (st (long A (Var dummy))))) A))));
 first by apply ceta.
apply clam.
apply ctrans with
 (App t (Var (gensym (FV (decomp B (st (long A (Var dummy))))) A)));
 first by apply capp1; apply csym.
by apply IHB1; auto.
- move=> t u su esu.
by apply sem_conv_ext1 with (App t (decomp A su)); auto.
Qed.

Lemma sem_decomp :  forall T t st, sem_conv T t st -> conv t (decomp T st).
move=> T; case (sem_decomp_aux T); done.
Qed.

Lemma sem_long : forall T t, sem_conv T t (long T t).
move=> T; case (sem_decomp_aux T); done.
Qed.

Fixpoint ext_eq (T:ST) : tr term T -> tr term T -> Prop:=
match T as T return tr term T -> tr term T -> Prop with
| Iota => conv
| Arr A B => fun f g => forall t st1 st2,
   sem_conv A t st1 -> ext_eq A st1 st2 ->
      ext_eq B (f st1)(g st2)
end.

Lemma ext_refl_aux : forall T,
     (forall t st1 st2, sem_conv T t st1 -> sem_conv T t st2  -> ext_eq T st1 st2)
   /\(forall t st1 st2, sem_conv T t st1 -> ext_eq T st1 st2 -> sem_conv T t st2).
elim => /=.
- split; first by move=> t f g *; apply ctrans with t; auto.
by move=> t f g *; apply ctrans with f; auto.
- move=> A [IHA1 IHA2] B [IHB1 IHB2]; split.
move=> t st1 st2 es1 es2 u su1 su2 esu eu.
apply IHB1 with (App t u); first by auto.
by apply es2; apply IHA2 with su1.
- move=> t st1 st2 est e12 u su esu.
apply IHB2 with (st1 su); first by auto.
apply e12 with u; first done.
by apply IHA1 with u.
Qed.

Lemma ext_refl : forall T t st, sem_conv T t st -> ext_eq T st st.
by move=> T t st e; move: (ext_refl_aux T) => [h _]; apply h with t.
Qed.

Lemma sem_conv_ext2 : forall T t f g, ext_eq T f g -> sem_conv T t f ->
                     sem_conv T t g.
by move=> T t f g e es; move: (ext_refl_aux T) => [_ h]; apply h with f.
Qed.

Lemma ext_sym : forall T f g, ext_eq T f g -> ext_eq T g f.
elim=> //=; first by auto.
move=> A IHA B IHB f g efg t st1 st2 e1 e.
apply IHB.
apply efg with t; auto.
by apply sem_conv_ext2 with st1.
Qed.

Lemma ext_trans : forall T f g h, ext_eq T f g -> ext_eq T g h ->
  ext_eq T f h.
elim=> /=; first by move=> f g h *; apply ctrans with g.
move=> A IHA B IHB f g h e1 e2 t st1 st2 es1 e.
apply IHB with (g st1); [apply e1 with t|apply e2 with t];
by trivial; apply ext_refl with t.
Qed.

(* properties of the semantics *)

Definition comp_ext (I1:(sem_env stm))(I2:(sem_env stm))
                             (c1 : comp_res stm)(c2 : comp_res stm) : Prop :=
 match c1 , c2 with
| NoComp , NoComp  => True
| Comp T1 s1 , Comp T2 s2 =>
  match cast T2 T1 with
  | Cast f => ext_eq T1 (s1 I1) (f (tr stm) (s2 I2))
  | _ => False
 end
| _ , _ => False
end.

Fixpoint eq_ext (T:ST) : tr term T -> tr term T -> Prop :=
match T as T return  tr term T -> tr term T -> Prop with
| Iota => (@eq term)
| Arr A B => fun f g => forall x, eq_ext B (f x)(g x)
end.

Lemma eqaux_refl : forall T t, eq_ext T t t.
elim=> //=.
Qed.

Lemma lassoc_app : forall x l1,
       (exists u, forall l2, tassoc x (l1 ++ l2)=u)
     \/forall l2, tassoc x (l1 ++ l2)=tassoc x l2.
move => x; elim => [|[y u] l1 IHl1] /=; first by right.
case e: (y == x); first by left; exists u.
elim IHl1 => [[v  Hv]|H]; first by left; exists v.
right; trivial.
Qed.

Lemma subst_perm2 : forall t x tx y ty l l2, x<>y ->
  t [l2 ++ (x,tx) :: (y,ty) :: l] = t [l2 ++ (y,ty) :: (x,tx) :: l].
move => t x tx y ty l l2 H.
apply tassoc_sigma_equiv_equal.
move => x0 H0.
case e: (dom l2 x0);
[rewrite (tassoc_appF x0 l2 ((x,tx)::(y,ty)::l)) //= (tassoc_appF x0 l2 ((y,ty)::(x,tx)::l)) //=|
 rewrite (tassoc_appI x0 l2 ((x,tx)::(y,ty)::l)) /negb ?e //= (tassoc_appI x0 l2 ((y,ty)::(x,tx)::l)) /negb ?e //=].
case xx0: (x == x0); case yx0 : (y == x0) => //=.
move/eqP: xx0 => xx0; rewrite -xx0 in yx0; move/eqP: yx0 => yx0; symmetry in yx0.
contradiction H.
Qed.

Lemma subst_cons : forall t l x u y v,
 x<>y ->
     subst t (l ++ ((x,u) :: (y,v) :: nil))
   = subst t (l ++ ((y,v) :: (x,u) :: nil)).
move => t l x u y v ne; exact (subst_perm2 t x u y v nil l ne).
Qed.

Definition env_ext (I:sem_env stm)
               := forall x, ext_eq (idT x) (I x)(I x).

Definition env_eq (I1 I2:sem_env stm) :=
  forall x, ext_eq (idT x) (I1 x)(I2 x).

Lemma esc_eq : forall I1 I2 x u1 u2,
   env_eq I1 I2 ->
    ext_eq (idT x) u1 u2 ->
     env_eq (esc term I1 x u1)(esc term I2 x u2).
move => I1 I2 [x X] u1 u2 eI eu [y Y].
rewrite /esc /id_cast.
case EqType.eq => //=; last apply (eI (mkid y Y)).
case ee : (X == Y) => //; rewrite neq_cast ee; last apply (eI (mkid y Y)).
move/eqP: ee => <-; rewrite cast_same //=.
Qed.


Lemma esc_ext : forall I x u,
   ext_eq (idT x) u u -> env_ext I -> env_ext (esc term I x u).
move => I x u eu eI y.
apply (esc_eq I I x u u); auto.
Qed.


Definition id_env := fun x => (long (idT x)(Var x)).

Lemma comp_sem :
  forall t sigma I,
   (forall x,  (FV t) x ->
          sem_conv (idT x) (subst (Var x) sigma)(I x))->
  match comp term t with
  | NoComp => True
  | Comp T st => sem_conv T (subst t sigma)(st I)
end.
Proof.
move => t; elim: {t}(S _) {-2}t (ltnSn (tm_size t)) => // h IHh t_or Hh.
rewrite ltnS in Hh.
case et_or : t_or =>  [[y Y] //=| [y A] t| t u] sigma I eIS.
- by apply (eIS (mkid y Y)); rewrite /setU /setU1 orbF.
- have ht : (tm_size t) < h.
   move: Hh; rewrite et_or /=.
   by move => *; apply leq_trans with (S (tm_size t)).
  have ht1 :
    (tm_size
      (subst t  ((mkid y A, Var (gensym (cat (FV t) (FVS sigma)) A)) :: nil)))
     < h
   by rewrite size_rename.
  case wt : (inferc t) => [B|]; last by
   move => *; move: (comp_infer term (Lam (mkid y A) t)); rewrite /= wt;
   case (comp term  t).
  move: (comp_infer term t); case ct : (comp term t) => [T st|]; last by
   rewrite wt.
  rewrite wt; move=> ee; move: st ct;  move: ee =>[<-]{T}; move=> st ct.
  rewrite /= ct -/tr.
  move => u su eu.
  apply sem_conv_ext1 with
   (subst
      (subst t
              ((mkid y A, Var (gensym (eFVS (FV (Lam (y^^A) t)) sigma) A)) :: sigma))
      (((gensym (eFVS (FV (Lam (y^^A) t)) sigma) A),u) :: nil));
    last by apply cbeta.
 apply sem_conv_ext1 with
    (subst t
              ((mkid y A, u) :: sigma)).
move: (IHh t ht ((mkid y A, u) :: sigma)  (esc term I (mkid y A) su)).
rewrite ct.
move=>hh ; apply hh; clear hh.
move => x; move: (eIS x); rewrite /= /setU.
rewrite ?orbT ?orbF /= mem_filter /setC1 /setI.
case ee: ( mkid y A == x).
 move/eqP: ee.
move: x => [x X].
move=> ee.
move: su eu.
move: (ee)=> [-> _].
move: ee=>[_ ->].
move=> su.
rewrite /negb /= /esc id_cast_same //.
rewrite /negb /= /esc neq_idcast ee.
by move=> h1 h2; apply h1.
by apply alphac_beta ; apply subst_comp_var;
   move: (gensym_gen (eFVS (FV (Lam (y^^A) t)) sigma) A) => nn; apply nn.
- have ht : (tm_size t) < h.
   move: Hh; rewrite et_or /=.
   move => *; apply leq_trans with (S (tm_size t + tm_size u)); trivial.
   by rewrite -addSn leq_addr.
  have hu : (tm_size u) < h.
   move: Hh; rewrite et_or /=.
   move => *; apply leq_trans with (S (tm_size t + tm_size u)); trivial.
   by rewrite -addnS leq_addl.
  case wtu : (inferc (App t u)) =>  [T|]; last by
   move => *; move: (comp_infer term (App t u));  rewrite wtu;
   case (comp term (App t u)).
  move: (app_inv _ _ _ wtu) => [U [wu wt]].
  move: (wt_comp _ _ term wu) => [su esu].
  move: (wt_comp _ _ term wt) => [st est].
  rewrite /= est esu cast_same.
  move/(_ t ht sigma I _): (IHh) {t_or et_or Hh}.
  move/(_ u hu sigma I _): IHh =>{h ht hu} /=.
  rewrite esu est.
  move=> IHu IHt. simpl in IHt.
  apply IHt.
   by move=> x; move=> hx; apply (eIS x); rewrite /setU /= mem_cat;
     apply/orP; left.
move => *; apply IHu.
by move=> x; move=> hx; apply (eIS x); rewrite /= mem_cat /setU; apply/orP;
  right.
Qed.



Lemma id_env_sem : forall x, sem_conv (idT x)(Var x)(id_env x).
move=> x; apply (sem_long (idT x)(Var x)).
Qed.

Lemma subst_nil2 : forall t, conv (t [nil]) t.
move => t; apply alphac_beta; apply subst_nil.
Qed.

Lemma norm_conv : forall t,
  match (comp term t) with
| NoComp => True
| Comp T f => conv t (decomp T (f id_env))
end.
move=> t; case e: (comp term t) => //= [T f].
apply sem_decomp.
move: (comp_sem t nil id_env).
rewrite e /setU /subst /tassoc -/tassoc -/subst /=.
move=> h.
apply sem_conv_ext1 with (subst t nil); last by apply csym; apply subst_nil2.
apply h.
rewrite /env_ext /= /id_env; move=> *; apply sem_long.
Qed.



Notation LAM := (Var (mkid 0 (Arr (Arr Iota Iota) Iota))).
Notation APP := (Var (mkid 0 (Arr Iota (Arr Iota Iota)))).

Eval compute in (comp term LAM).

Eval compute in  (long (Arr (Arr Iota Iota) Iota) LAM).

Eval compute in (decomp (Arr (Arr Iota Iota) Iota) (long (Arr (Arr Iota Iota) (Iota))
                           (App (Lam (13^^Iota) (Var (0^^Iota))) (Var (0^^Iota))) ) ).

Definition CLAM := fun x : term -> term =>
       App LAM (decomp (Arr Iota Iota) x).

Definition CAPP := fun x x0 : term =>
       App (App APP x) x0.

Eval compute in (CAPP (CLAM (fun x => x))(Var (mkid 3 Iota))).
Eval compute in (comp term (CAPP (CLAM (fun x => x))(Var (mkid 3 Iota)))).
Eval compute in ((fun
            I : forall x : id,
                (fix tr (alpha : Type) (T : ST) {struct T} :
                 Type :=
                   match T with
                   | Iota => alpha
                   | Arr A B => tr alpha A -> tr alpha B
                   end) term (let (_, idT) := x in idT) =>
          I (mkid 0 (Arr Iota (Arr Iota Iota)))
            (I (mkid 0 (Arr (Arr Iota Iota) Iota)) (fun x : term => x))
            (I (mkid 3 Iota))) id_env).

Lemma ex_conv : forall T (f:tr term T),
 (exists t, sem_conv T t f)->
  (sem_conv T (decomp T f) f).
Proof.
move=> T f [t et].
apply sem_conv_ext1 with t; first done.
by apply csym; apply sem_decomp.
Qed.
