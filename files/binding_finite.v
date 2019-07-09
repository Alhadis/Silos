(** * RIS.binding_finite : binding-finite and memory-finite expressions. *)
Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Require Import tools algebra language regexp alpha_regexp factors.

Section s.
  Context {atom : Set}{𝐀 : Atom atom}.
  Context {X : Set} {𝐗 : Alphabet 𝐀 X}.
  (** * Definitions *)

  Fixpoint bindings (e : regexp) a : list 𝖡 :=
    match e with
    | e_un => [ε]
    | e_zero => []
    | e_add e f => bindings e a ++ bindings f a
    | e_prod e f => lift_prod prod_binding (bindings e a) (bindings f a)
    | e_star e => ε::(is_square :> bindings e a)
    | ⟪x⟫ => [𝗳 a x]
    end.

  Definition is_binding_finite e := exists A, forall a u, ⟦e⟧ u -> 𝗙 a u ∈ A.
  
  Fixpoint binding_finite e :=
    match e with
    | e_un | e_zero | ⟪_⟫ => true
    | e_add e f => binding_finite e && binding_finite f
    | e_prod e f => test0 e || test0 f || (binding_finite e && binding_finite f)
    | e_star e => binding_finite e && (forallb (fun a => forallb is_square (bindings e a)) ⌊e⌋)
    end.

  Definition sqExpr e := is_binding_finite e /\ forall a b, b ∈ bindings e a -> square b.

  Definition weight u := sum (fun a => size (𝗙 a u)) {{⌊u⌋}}.

  Definition MaxBind L := fold_right (fun β N => max (size β) N) 0 L.
  
  Definition weightExpr e := sum (fun a =>  MaxBind (bindings e a)) {{⌊e⌋}}.

  Definition bindFinList L := forall e, e ∈ L -> is_binding_finite e.

  Definition sqListExpr L := forall e, e ∈ L -> sqExpr e.

  Definition homogeneous e := forall a, exists β, forall u, ⟦e⟧ u -> 𝗙 a u = β.

  Fixpoint bindPref e a : list 𝖡 :=
    match e with
    | e_zero => []
    | e_un => [ε]
    | ⟪x⟫ => [ε;𝗳 a x]
    | e_add e f => (bindPref e a) ++ (bindPref f a)
    | e_prod e f =>
      if test0 e || test0 f
      then []
      else (bindPref e a) ++ lift_prod prod_binding (bindings e a) (bindPref f a)
    | e_star e => ε::(bindPref e a)++(lift_prod prod_binding (bindings e a) (bindPref e a))
    end.

  (** * Elementary facts *)
  
  Remark homogeneous_is_binding_finite e : homogeneous e -> is_binding_finite e.
  Proof.
    intro H.
    cut (forall A, exists B, forall a u, a ∈ A -> ⟦e⟧ u -> 𝗙 a u ∈ B).
    - intros h;destruct (h ⌊e⌋) as (B&hB);clear h.
      exists (ε::B);intros a u Iu.
      case_in a ⌊e⌋.
      + right;apply hB;tauto.
      + left;symmetry.
        apply αfresh_support.
        intro Ia. 
        apply I,(support_lang Iu),Ia.
    - intro A;induction A as [|a A].
      + exists [];intros a u F;exfalso;apply F.
      + destruct IHA as (B&hB).
        destruct (H a) as (β&hβ).
        exists (β::B);intros b u [<-|Ib] Iu.
        * left;symmetry;apply hβ,Iu.
        * right;apply hB;assumption.
  Qed.

  Remark bindings_witness e a β : β ∈ bindings e a -> exists u, ⟦e⟧ u /\ 𝗙 a u = β.
  Proof.
    revert β;induction e;intros β;simpl;simpl_In.
    - tauto.
    - intros [<-|F];[|tauto].
      exists [];split;reflexivity.
    - intros [I|I].
      + apply IHe1 in I as (u&I1&E1);exists u;split;[left|];tauto.
      + apply IHe2 in I as (u&I2&E2);exists u;split;[right|];tauto.
    - rewrite lift_prod_spec;intros (β1&β2&I1&I2&->).
      apply IHe1 in I1 as (u1&I1&E1);apply IHe2 in I2 as (u2&I2&E2).
      exists (u1++u2);split.
      + exists u1,u2;tauto.
      + simpl_binding;subst;reflexivity.
    - intros [<-|(I&_)].
      + exists [];split;[exists 0|];reflexivity.
      + apply IHe in I as (u&I&E).
        exists u;split;[exists 1,u,[];rewrite app_nil_r;repeat split|];assumption.
    - intros [<-|F];[|tauto].
      exists [x];split;[|simpl_binding];reflexivity.
  Qed.

  Remark unbounded_binding e a u :
    ⟦ e ⟧ u -> c_binding (𝗙 a u) <> d_binding (𝗙 a u) ->
    forall N, exists v, ⟦ e ⋆⟧ v /\ N < size (𝗙 a v).
  Proof.
    intro Iu;unfold size;destruct_ltb (c_binding (𝗙 a u)) (d_binding (𝗙 a u));
      [destruct_ltb (d_binding (𝗙 a u)) (c_binding (𝗙 a u));[lia|clear L]|];intros _.
    - cut (forall N, exists v, ⟦ e ⋆⟧ v /\ N < c_binding (𝗙 a v)
                     /\ d_binding (𝗙 a v) = d_binding (𝗙 a u)).
      + intros h N;destruct (h N) as (v&Iv&L&E);exists v;split;[assumption|lia].
      + induction N.
        * exists u;split.
          -- exists 1,u,[];rewrite app_nil_r;repeat split;assumption.
          -- lia.
        * destruct IHN as (v&(n&Iv)&Lv&Ev).
          exists (u++v);split.
          -- exists (S n),u,v;tauto.
          -- simpl_binding;lia.
    - cut (forall N, exists v, ⟦ e ⋆⟧ v /\ N < d_binding (𝗙 a v)
                     /\ c_binding (𝗙 a v) = c_binding (𝗙 a u)).
      + intros h N;destruct (h N) as (v&Iv&L'&E);exists v;split;[assumption|lia].
      + induction N.
        * exists u;split.
          -- exists 1,u,[];rewrite app_nil_r;repeat split;assumption.
          -- lia.
        * destruct IHN as (v&(n&Iv)&Lv&Ev).
          exists (v++u);split.
          -- exists (S n);apply iter_lang_last;exists v,u;tauto.
          -- simpl_binding;lia.
  Qed.

  Lemma bindings_Σ L a : bindings (Σ L) a ≈ flat_map (fun e => bindings e a) L.
  Proof.
    induction L as [|f L];[reflexivity|].
    simpl;rewrite IHL;reflexivity.
  Qed.

  Lemma bindings_fresh a e : a # e -> bindings e a = [] \/ bindings e a ≈ [ε].
  Proof.
    intros Ia;induction e.
    - left;reflexivity.
    - right;reflexivity.
    - simpl;cut (a # e1 /\ a # e2).
      + intros (I1&I2);apply IHe1 in I1 as [->|E1];apply IHe2 in I2 as [->|E2].
        * left;reflexivity.
        * right;rewrite E2;reflexivity.
        * right;rewrite E1;reflexivity.
        * right;rewrite E1,E2;intro;simpl;tauto.
      + split;intro I;apply Ia,in_app_iff;[left|right];apply I.
    - simpl;cut (a # e1 /\ a # e2).
      + intros (I1&I2);apply IHe1 in I1 as [->|E1];[|apply IHe2 in I2 as [->|E2]].
        * left;reflexivity.
        * left;clear;induction (bindings e1 a);simpl;tauto.
        * right;intro;rewrite lift_prod_spec;setoid_rewrite E1;setoid_rewrite E2.
          clear;simpl;firstorder subst.
          -- left;reflexivity.
          -- exists ε,ε;repeat split;left;reflexivity.
      + split;intro I;apply Ia,in_app_iff;[left|right];apply I.
    - cut (a # e);[|apply Ia];simpl;intro I;right.
      apply IHe in I as [->|E].
      + reflexivity.
      + rewrite E;intro;simpl;tauto.
    - simpl.
      unfold support in Ia;simpl in Ia.
      apply αfresh_letter in Ia as ->.
      right;reflexivity.
  Qed.

  Lemma test0_bindings e : test0 e = true -> forall a, bindings e a = [].
  Proof.
    induction e;simpl;try reflexivity||discriminate.
    - rewrite andb_true_iff;intros (h1&h2) a.
      rewrite IHe1,IHe2 by assumption;reflexivity.
    - rewrite orb_true_iff;intros [h|h] a.
      + rewrite IHe1 by assumption;reflexivity.
      + rewrite IHe2 by assumption;clear.
        induction (bindings e1 a);simpl;tauto.
  Qed.

  Lemma bindings_ε f a : ⟦ f ⟧ [] -> ε ∈ bindings f a.
  Proof.
    induction f;simpl;simpl_In;intro I0;try tauto.
    - destruct I0 as [I0|I0];tauto.
    - destruct I0 as (u1&u2&E&I1&I2).
      symmetry in E;apply app_eq_nil in E as (->&->).
      apply lift_prod_spec;exists ε,ε;tauto.
    - simpl_words.
  Qed.
 

  Lemma binding_finite_false e :
    binding_finite e = false -> ~ is_binding_finite e.
  Proof.
    intro hyp;cut (exists a, forall N, exists u, ⟦e⟧ u /\ N < size (𝗙 a u)).
    - intros (a&Infinite) (A&hA).
      set (N := fold_right (fun x k => max (size x) k) 0 A).
      destruct (Infinite N) as (u&Iu&L).
      apply (hA a) in Iu.
      clear hyp hA Infinite e.
      generalize dependent (𝗙 a u);clear a u.
      unfold N;clear N;induction A;simpl.
      + tauto.
      + intros b [->|Iu].
        * lia.
        * intros;apply IHA in Iu;lia.
    - induction e;try discriminate.
      + simpl in hyp;apply andb_false_iff in hyp as [hyp|hyp].
        * destruct (IHe1 hyp) as (a&IH);exists a;intros N;destruct (IH N) as (u&Iu&Lu);
            exists u;split;[left;assumption|lia].
        * destruct (IHe2 hyp) as (a&IH);exists a;intros N;destruct (IH N) as (u&Iu&Lu);
            exists u;split;[right;assumption|lia].
      + simpl in hyp;repeat rewrite orb_false_iff in hyp || rewrite andb_false_iff in hyp.
        destruct hyp as ((N1&N2)&[hyp|hyp]);apply test0_false in N1 as (u1&Iu1);
          apply test0_false in N2 as (u2&Iu2).
        * destruct (IHe1 hyp) as (a&IH);clear IHe1 IHe2;exists a;intro N.
          destruct (IH (N+d_binding (𝗙 a u2))) as (u1'&I&L).
          exists (u1'++u2);split;[exists u1',u2;tauto|].
          unfold size in *;simpl_binding;lia.
        * destruct (IHe2 hyp) as (a&IH);clear IHe1 IHe2;exists a;intro N.
          destruct (IH (N+c_binding (𝗙 a u1))) as (u2'&I&L).
          exists (u1++u2');split;[exists u1,u2';tauto|].
          unfold size in *;simpl_binding;lia.
      + simpl in hyp;apply andb_false_iff in hyp as [hyp|hyp].
        * apply IHe in hyp as (a&hyp);clear IHe.
          exists a;intro N.
          destruct (hyp N) as (u&Iu&L);exists u;split.
          -- exists 1,u,[];rewrite app_nil_r;repeat split;assumption.
          -- assumption.
        * clear IHe;apply forallb_false_exists in hyp as (a&Ia&hyp).
          apply forallb_false_exists in hyp as (β&Iβ&hyp).
          apply EqNat.beq_nat_false in hyp.
          apply bindings_witness in Iβ as (u&Iu&<-).
          exists a;intro N.
          destruct (unbounded_binding Iu hyp N) as (v&Iv&L).
          exists v;split;assumption.
  Qed.
  
  Lemma binding_finite_true e :
    binding_finite e = true -> forall a u, ⟦e⟧ u -> 𝗙 a u ∈ bindings e a.
  Proof.
    intros h a;revert h;induction e;simpl.
    - tauto.
    - intros _ u ->;left;reflexivity.
    - rewrite andb_true_iff;intros (h1&h2) u [I|I];simpl_In.
      + left;apply IHe1;assumption.
      + right;apply IHe2;assumption.
    - rewrite orb_true_iff,orb_true_iff,andb_true_iff.
      repeat rewrite test0_spec;intros [[E|E]|(h1&h2)].
      + apply soundness in E;intros u (w&v2&_&F&_).
        apply E in F;exfalso;apply F.
      + apply soundness in E;intros u (v1&w&_&_&F).
        apply E in F;exfalso;apply F.
      + intros u (v1&v2&->&I1&I2).
        apply lift_prod_spec;exists (𝗙 a v1),(𝗙 a v2);simpl_binding;repeat split.
        * apply IHe1;assumption.
        * apply IHe2;assumption.
    - rewrite andb_true_iff,forallb_forall;setoid_rewrite forallb_forall.
      intros (h1&h2).
      case_in a ⌊e⌋.
      + pose proof (h2 a I) as Ia;clear I h2.
        intros u (n&Iu);revert u Iu;induction n;intros u.
        * intros ->;left;reflexivity.
        * intros (u1&u2&->&I1&I2);simpl_binding.
          apply IHn in I2 as [<-|I2].
          -- rewrite prod_unit_r;simpl_In.
             apply (IHe h1) in I1.
             right;split;[assumption|].
             apply Ia,I1.
          -- right;apply (IHe h1) in I1.
             apply filter_In in I2 as (I2&Sq).
             pose proof (Ia _ I2) as E2.
             pose proof (Ia _ I1) as E1.
             clear IHn IHe Ia h1.
             destruct (𝗙 a u1) as ((N,k),n1),(𝗙 a u2) as ((N',k'),n2).
             apply PeanoNat.Nat.eqb_eq in E2.
             apply PeanoNat.Nat.eqb_eq in E1.
             unfold d_binding in *;simpl in E1,E2;subst.
             unfold prod_binding;simpl_In;unfold is_square;rewrite PeanoNat.Nat.eqb_eq;simpl.
             destruct_ltb N N';[destruct_ltb N' N|].
             ++ replace N with N' in * by lia;unfold d_binding;simpl.
                split;[|reflexivity].
                destruct k;destruct k';assumption.
             ++ replace (N' + N - N') with N in * by lia;split;
                  [assumption|unfold d_binding;simpl;reflexivity].
             ++ replace (N + N' - N) with N' in * by lia;split;
                  [assumption|unfold d_binding;simpl;reflexivity].
      + intros u Iu;left;symmetry.
        apply αfresh_support;intros Ia.
        rewrite support_lang with (e0:=e⋆) in Ia by (apply Iu).
        simpl in Ia;apply I,Ia.
    - intros _ ? ->;left;simpl_binding;reflexivity.
  Qed.
          
  Lemma binding_finite_spec e : binding_finite e = true <-> is_binding_finite e.
  Proof.
    case_eq (binding_finite e);intro E;split.
    - exists (ε::(flat_map (bindings e) ⌊e⌋)).
      intros a u Iu;case_in a ⌊e⌋.
      + right;apply in_flat_map;exists a;split;[assumption|].
        apply binding_finite_true;assumption.
      + left;symmetry.
        apply αfresh_support;intros Ia.
        eapply support_lang in Ia;[|apply Iu].
        simpl in Ia;apply I,Ia.
    - reflexivity.
    - discriminate.
    - apply binding_finite_false in E;tauto.
  Qed.

  Lemma is_binding_finite_bindings e :
    is_binding_finite e -> forall a u, ⟦e⟧ u -> (𝗙 a u) ∈ bindings e a.
  Proof.
    intros B a u Iu;apply binding_finite_true,Iu.
    apply binding_finite_spec,B.
  Qed.


  Lemma sqExpr_bindings_finite_star e : sqExpr e -> is_binding_finite (e⋆).
  Proof.
    intros (B&Sq);apply binding_finite_spec,andb_true_iff;split.
    - apply binding_finite_spec,B.
    - apply forallb_forall;intros a Ia;apply forallb_forall;intros β Iβ.
      apply PeanoNat.Nat.eqb_eq;apply (Sq a β Iβ).
  Qed.
    
  Lemma bind_fin_ind e (P : regexp -> Prop) :
    is_binding_finite e -> 
    P 𝟬 ->
    P 𝟭 ->
    (forall x, P ⟪x⟫) ->
    (forall e f, is_binding_finite e -> is_binding_finite f -> P e -> P f -> P (e ∪ f)) ->
    (forall e f, is_binding_finite e -> is_binding_finite f -> P e -> P f -> test0 e || test0 f = false ->
            P (e · f)) ->
    (forall e f, test0 e || test0 f = true -> P (e · f)) ->
    (forall e, sqExpr e -> P e -> P (e⋆)) -> P e.
  Proof.
    setoid_rewrite <- binding_finite_spec.
    intros B p0 p1 px pj pp pz ps;revert B.
    induction e.
    - intros _;apply p0.
    - intros _;apply p1.
    - simpl;rewrite andb_true_iff;intros (h1&h2);apply pj;tauto.
    - simpl;rewrite orb_true_iff,andb_true_iff.
      case_eq (test0 e1||test0 e2);intro T.
      + intros _;apply pz,T.
      + intros [F|h];[discriminate|].
        apply pp;tauto.
    - simpl;rewrite andb_true_iff.
      intros (h1&h2);apply ps.
      + split;[apply binding_finite_spec,h1|].
        intros a b Ib.
        case_in a ⌊e⌋.
        * repeat setoid_rewrite forallb_forall in h2.
          apply PeanoNat.Nat.eqb_eq;eapply h2;eauto.
        * revert Ib;destruct (bindings_fresh I) as [-> | ->];simpl;
            [tauto|intros [<-|F];[reflexivity|tauto]].
      + apply IHe,h1.
    - intros _;apply px.
  Qed.

  Ltac induction_bin_fin e B:=
    apply bind_fin_ind with (e:=e);
    [ apply B | | | | | | | ];
    clear B e;
    [ |
    |let x:= fresh "x" in intro x
    |let e1:= fresh "e1" in
     let e2:= fresh "e2" in
     let B1:= fresh "B1" in
     let B2:= fresh "B2" in
     let IH1:= fresh "IHe1" in
     let IH2:= fresh "IHe2" in
     intros e1 e2 B1 B2 IH1 IH2
    |let e1:= fresh "e1" in
     let e2:= fresh "e2" in
     let B1:= fresh "B1" in
     let B2:= fresh "B2" in
     let IH1:= fresh "IHe1" in
     let IH2:= fresh "IHe2" in
     let T:= fresh "T" in
     intros e1 e2 B1 B2 IH1 IH2 T
    |let e1:= fresh "e1" in
     let e2:= fresh "e2" in
     let T:= fresh "T" in
     intros e1 e2 T
    |let IH:= fresh "IHe" in
     let Sq:= fresh "Sq" in
     let e:= fresh "e" in
     intros e Sq IH].
        
  
  Lemma weight_incr_sup l u : weight u = sum (fun a => size (𝗙 a u)) {{⌊u⌋++l}}.
  Proof.
    unfold weight;eapply sum_incr_0_right.
    intros a Ia.
    apply αfresh_support in Ia as ->;reflexivity.
  Qed.
    
    
  Lemma weight_app u v : weight (u++v) <= weight u + weight v.
  Proof.
    rewrite (weight_incr_sup ⌊v⌋ u).
    rewrite (weight_incr_sup ⌊u⌋ v).
    unfold weight.
    pose proof (support_list_app u v) as E.
    rewrite <- undup_equivalent,<- (undup_equivalent (⌊u⌋++_)) in E.
    rewrite (sum_eq_ND _ E) by apply NoDup_undup.
    rewrite (app_comm ⌊u⌋⌊v⌋),support_list_app in E.
    rewrite <- (sum_eq_ND _ E) by apply NoDup_undup;clear E.
    rewrite sum_add_distr;apply sum_le.
    intros a Ia;unfold size;simpl_binding.
    lia.
  Qed.
  Lemma weight_app_left v u : weight u <= weight (u++v) + weight v.
  Proof.
    rewrite (weight_incr_sup ⌊v⌋ u).
    rewrite (weight_incr_sup ⌊u⌋ v).
    unfold weight.
    pose proof (support_list_app u v) as E.
    rewrite <- undup_equivalent,<- (undup_equivalent (⌊u⌋++_)) in E.
    rewrite (sum_eq_ND _ E) by apply NoDup_undup.
    rewrite (app_comm ⌊u⌋⌊v⌋),support_list_app in E.
    rewrite <- (sum_eq_ND _ E) by apply NoDup_undup;clear E.
    rewrite sum_add_distr;apply sum_le.
    intros a Ia;unfold size;simpl_binding.
    lia.
  Qed.
  Lemma weight_app_right u v : weight v <= weight (u++v) + weight u.
  Proof.
    rewrite (weight_incr_sup ⌊v⌋ u).
    rewrite (weight_incr_sup ⌊u⌋ v).
    unfold weight.
    pose proof (support_list_app u v) as E.
    rewrite <- undup_equivalent,<- (undup_equivalent (⌊u⌋++_)) in E.
    rewrite (sum_eq_ND _ E) by apply NoDup_undup.
    rewrite (app_comm ⌊u⌋⌊v⌋),support_list_app in E.
    rewrite <- (sum_eq_ND _ E) by apply NoDup_undup;clear E.
    rewrite sum_add_distr;apply sum_le.
    intros a Ia;unfold size;simpl_binding.
    lia.
  Qed.

  
  Lemma bindFind_weight_weightExpr e :
    is_binding_finite e -> forall u, ⟦e⟧ u -> weight u <= weightExpr e.
  Proof.
    intros B u Iu.
    rewrite (weight_incr_sup ⌊e⌋ u).
    assert (E:{{⌊u⌋++⌊e⌋}}≈{{⌊e⌋}}).
    - intros a;simpl_In;split;[intros [I|I]|intro I;right];try apply I.
      apply (support_lang Iu),I.
    - rewrite (sum_eq_ND _ E) by apply NoDup_undup;clear E.
      apply sum_le;intros a _.
      apply binding_finite_spec in B;apply (binding_finite_true B) with (a:=a) in Iu.
      revert Iu; generalize (𝗙 a u);generalize (bindings e a);clear e B u a.
      induction l as [|α l];intro β;simpl;[tauto|].
      intros [<-|I];[lia|].
      rewrite (IHl _ I);lia.
  Qed.

  Lemma MaxBind_app L M : MaxBind (L++M) = max (MaxBind L) (MaxBind M).
  Proof. induction L;simpl;lia. Qed.

  
  Lemma MaxBind_fresh a e : a # e -> MaxBind (bindings e a) = 0.
  Proof.
    intros Ia;apply bindings_fresh in Ia as [->|E].
    - reflexivity.
    - induction (bindings e a);[reflexivity|].
      simpl;replace a0 with ε in *.
      + destruct l as [|b l].
        * reflexivity.
        * rewrite IHl.
          -- reflexivity.
          -- replace b with ε in *.
             ++ rewrite <- E;intro;simpl;tauto.
             ++ cut (b ∈ (ε::b::l));[|simpl;tauto].
                rewrite E;simpl;tauto.
      + cut (a0 ∈ (a0::l));[|simpl;tauto].
        rewrite E;simpl;tauto.
  Qed.

  Lemma weightExpr_incr_sup_left l e : weightExpr e = sum (fun a =>  MaxBind (bindings e a)) {{l++⌊e⌋}}.
  Proof. apply sum_incr_0_left;intros;rewrite MaxBind_fresh;tauto. Qed.
  
  Lemma weightExpr_incr_sup_right l e : weightExpr e = sum (fun a =>  MaxBind (bindings e a)) {{⌊e⌋++l}}.
  Proof.  apply sum_incr_0_right;intros;rewrite MaxBind_fresh;tauto. Qed.

  Lemma MaxBind_filter f L : MaxBind (f :> L) <= MaxBind L.
  Proof. induction L as [|a L];simpl;[|destruct (f a);simpl];lia. Qed.
  
  Lemma bounded_weightExpr e : weightExpr e <= sizeExpr e.
  Proof.
    induction e.
    - reflexivity.
    - reflexivity.
    - transitivity (sum (fun a => max (MaxBind (bindings e1 a))(MaxBind (bindings e2 a))) {{⌊e1⌋++⌊e2⌋}}).
      + unfold weightExpr.
        replace ⌊e_add e1 e2⌋ with (⌊e1⌋++⌊e2⌋) by reflexivity.
        apply PeanoNat.Nat.eq_le_incl,sum_ext;intros a;simpl.
        clear;generalize (bindings e2 a);intros m;induction (bindings e1 a) as [|x l];
          clear a e1 e2;simpl;lia.
      + assert (h: forall k1 k2, max k1 k2 <= k1 + k2) by (intros;lia).
        etransitivity;[apply sum_le;intros;apply h|].
        rewrite <- sum_add_distr.
        rewrite <- weightExpr_incr_sup_right.
        rewrite <- weightExpr_incr_sup_left.
        simpl;lia.
    - simpl.
      unfold weightExpr.
      replace ⌊e_prod e1 e2⌋ with (⌊e1⌋++⌊e2⌋) by reflexivity.
      transitivity (weightExpr e1 + weightExpr e2);[clear|lia].
      rewrite (weightExpr_incr_sup_right ⌊e2⌋).
      rewrite (weightExpr_incr_sup_left ⌊e1⌋).
      rewrite sum_add_distr.
      apply sum_le;intros a _;simpl.
      generalize (bindings e2 a);generalize (bindings e1 a);clear e1 e2 a.
      intros l m;induction l as [|a l];simpl.
      + lia.
      + rewrite MaxBind_app.
        transitivity (Nat.max (MaxBind (map (prod_binding a) m)) (MaxBind l + MaxBind m));[lia|].
        clear IHl.
        induction m;simpl;[lia|].
        unfold size in *;simpl_binding;lia.
    - simpl.
      unfold weightExpr;simpl.
      replace ⌊e_star e⌋ with ⌊e⌋ by reflexivity.
      rewrite <- IHe;apply sum_le.
      intros a _;apply MaxBind_filter.
    - unfold weightExpr;destruct x;simpl;simpl_eqX;simpl.
      + reflexivity.
      + reflexivity.
      + rewrite sum_zero_in;[lia|tauto].
  Qed.

  
  Lemma bindPref_ε e a : test0 e = false -> ε ∈ bindPref e a.
  Proof.
    induction e;simpl;simpl_In;firstorder.
    - apply andb_false_iff in H;firstorder.
    - apply orb_false_iff in H as (h1&h2).
      rewrite h1 in *;rewrite h2 in *;simpl;simpl_In;firstorder.
  Qed.
  Lemma test0_bindPref e a : test0 e = true -> bindPref e a = [].
  Proof.
    induction e;simpl;simpl_In;firstorder (try discriminate).
    - apply andb_true_iff in H;rewrite IHe1,IHe2 by tauto;reflexivity.
    - rewrite H;reflexivity.
  Qed.

  Lemma bindPref_prefixes e a :
    is_binding_finite e -> bindPref e a ≈ flat_map (fun f => bindings f a) (prefixes e).
  Proof.
    intro B;induction_bin_fin e B;simpl;try reflexivity.
    - rewrite IHe1,IHe2;clear IHe1 IHe2.
      intro;simpl_In;repeat rewrite in_flat_map;setoid_rewrite in_app_iff;firstorder.
    - rewrite T;rewrite IHe1,IHe2;clear IHe1 IHe2.
      intro α;simpl_In.
      rewrite lift_prod_spec.
      setoid_rewrite in_flat_map.
      setoid_rewrite in_app_iff.
      setoid_rewrite in_map_iff.
      split.
      + intros [(f&I1&I2)|(β&γ&I1&(f&I2&I3)&->)].
        * exists f;tauto.
        * exists (e1·f);split.
          -- right;exists f;tauto.
          -- simpl;apply lift_prod_spec;exists β,γ;tauto.
      + intros (f&[I|(g&<-&Ig)]&Ia).
        * left;exists f;tauto.
        * simpl in Ia;apply lift_prod_spec in Ia as (β&γ&I1&I2&->).
          right;exists β,γ;split;[assumption|split;[exists g;split;assumption|reflexivity]].
    - rewrite T;reflexivity.
    - rewrite IHe;clear IHe.
      case_eq (test0 e).
      + intro T;rewrite (test0_prefixes T),(test0_bindings T);simpl;reflexivity.
      + intros T α;simpl;simpl_In.
        repeat setoid_rewrite in_flat_map||rewrite lift_prod_spec||setoid_rewrite in_map_iff.
        split.
        * intros [<-|[(f&If&Iα)|(β&Iβ&(γ&<-&f&If&Iγ))]].
          -- assert (I : ⟦Σ (prefixes e)⟧[])
              by (apply test0_false in T as (u&Iu);apply prefixes_spec;exists u;apply Iu).
             apply Σ_lang in I as (f&If&I0).
             exists (e⋆·f);split;[exists f;tauto|].
             simpl;simpl_In;left.
             apply in_map_iff;exists ε;split;[reflexivity|].
             apply bindings_ε,I0.
          -- exists (e⋆·f);split;[exists f;tauto|].
             simpl;simpl_In.
             left;apply in_map_iff;exists α;split;auto.
             apply prod_unit_l.
          -- exists (e⋆·f);split;[exists f;tauto|].
             simpl;simpl_In.
             right;apply lift_prod_spec;exists β,γ;split;[|tauto].
             simpl_In;split;[assumption|].
             apply PeanoNat.Nat.eqb_eq.
             destruct Sq as (_&Sq);apply (Sq a β Iβ).
        * intros (f&(g&<-&Ig)&Iα).
          simpl in Iα;simpl_In in Iα.
          rewrite in_map_iff,lift_prod_spec in Iα.
          destruct Iα as [(β&<-&Iβ)|(β&γ&Iβ&Iγ&->)].
          -- right;left;exists g;rewrite prod_unit_l;tauto.
          -- simpl_In in Iβ.
             right;right;exists β;split;[tauto|exists γ;split;[reflexivity|exists g;tauto]].
  Qed.
      
  Lemma bindPref_binding_finite e :
    is_binding_finite e -> forall u v a, ⟦e⟧ (u++v) -> 𝗙 a u ∈ bindPref e a.
  Proof.
    intros b u v a;revert u v.
    induction_bin_fin e b.
    - tauto.
    - intros ? ? E;apply app_eq_nil in E as (->&->);left;reflexivity.
    - intros u v E;destruct u;simpl in E;inversion E;subst.
      + left;reflexivity.
      + apply app_eq_nil in H1 as (->&->);clear E.
        simpl_binding;right;left;reflexivity.
    - intros u v;simpl;firstorder.
    - intros u v (u1&u2&E&I1&I2);simpl.
      rewrite T;simpl_In;levi E;subst;clear E.
      + left;apply (IHe1 _ []).
        rewrite app_nil_r;apply I1.
      + right.
        apply (is_binding_finite_bindings B1 a) in I1. 
        rewrite app_comm_cons in I2;apply IHe2 in I2.
        rewrite 𝗙_app,lift_prod_spec;firstorder.
      + left;apply (IHe1 _ _ I1).
    - intros u v (u1&u2&_&I1&I2);exfalso;apply orb_true_iff in T as [T|T].
      + apply test0_spec,soundness in T.
        apply T in I1;apply I1.
      + apply test0_spec,soundness in T.
        apply T in I2;apply I2.
    - intros u v Iuv.
      apply split_star in Iuv as [(->&->)|(u1&u2&v1&v2&->&->&I1&I2&I3)].
      + left;reflexivity.
      + simpl;simpl_In; rewrite lift_prod_spec,𝗙_app.
        apply (IHe _ _) in I2.
        apply is_binding_finite_bindings with (a:=a) in I1 as [<-|I1];[| | ].
        * rewrite prod_unit_l;tauto.
        * apply filter_In in I1 as (I1&Sq').
          right;right;firstorder.
        * apply sqExpr_bindings_finite_star,Sq.
  Qed.

  Lemma bindings_finite_prefixes e : is_binding_finite e -> forall f, f ∈ prefixes e -> is_binding_finite f.
  Proof.
    intros (B&h) f If.
    exists (ε::flat_map (fun a => bindPref e a) ⌊e⌋).
    intros a u Iu;simpl;rewrite in_flat_map.
    cut (exists v, ⟦e⟧ (u++v)).
    - intros (v&Iv).
      case_in a ⌊e⌋;[right|left].
      + exists a;split;[assumption|].
        eapply bindPref_binding_finite,Iv.
        exists B;apply h.
      + symmetry;apply αfresh_support;intro Ia.
        apply I,(support_lang Iv).
        rewrite support_list_app;simpl_In;tauto.
    - apply prefixes_spec,Σ_lang;exists f;tauto.
  Qed.

  Lemma bindings_prefixes_support e a : a # prefixes e -> bindings e a ⊆ [ε].
  Proof.
    induction e;simpl.
    - intros;apply incl_nil.
    - reflexivity.
    - intros I;rewrite IHe1,IHe2.
      + intro;simpl;tauto.
      + intro;apply I;rewrite support_list_app;simpl_In;tauto.
      + intro;apply I;rewrite support_list_app;simpl_In;tauto.
    - case_eq (test0 e1 || test0 e2);intro F.
      + apply orb_true_iff in F as [F|F];intros _;eapply test0_bindings in F as ->.
        * apply incl_nil.
        * replace (lift_prod _ _ _) with (@nil 𝖡);[apply incl_nil|].
          clear;induction (bindings e1 a);simpl;tauto.
      + intros Ia;rewrite IHe1,IHe2.
        * reflexivity.
        * intro I;apply Ia;clear Ia.
          rewrite support_list_app,in_app_iff;right.
          apply In_support_list in I as (f&If&Ia).
          apply In_support_list;exists (e1·f);split.
          -- apply in_map_iff;exists f;tauto.
          -- apply in_app_iff;right;apply Ia.
        * intro I;apply Ia.
          rewrite support_list_app,in_app_iff;left;assumption.
    - case_eq (test0 e);intro F.
      + intros _;eapply test0_bindings in F as ->.
        reflexivity.
      + intros Ia;rewrite IHe;simpl.
        * intro;simpl;tauto.
        * intro I;apply Ia;clear Ia.
          apply In_support_list in I as (f&If&Ia).
          apply In_support_list;exists (e⋆·f);split.
          -- apply in_map_iff;exists f;tauto.
          -- apply in_app_iff;right;apply Ia.
    - intros I ? [<-|F];[|simpl in F;tauto].
      left;symmetry;apply αfresh_letter.
      intro Ia;apply I;simpl.
      unfold support,SupportList;simpl.
      rewrite app_nil_r;simpl_In;apply Ia.
  Qed.
      
  Lemma bindPref_prefixes_support e a : a # prefixes e -> bindPref e a ⊆ [ε].
  Proof.
    induction e;simpl.
    - intros;apply incl_nil.
    - reflexivity.
    - intros I;rewrite IHe1,IHe2.
      + intro;simpl;tauto.
      + intro;apply I;rewrite support_list_app;simpl_In;tauto.
      + intro;apply I;rewrite support_list_app;simpl_In;tauto.
    - case_eq (test0 e1 || test0 e2);intro F.
      + intros _;apply incl_nil.
      + intros Ia;rewrite IHe1,IHe2,bindings_prefixes_support.
        * clear;simpl;intro;simpl;firstorder.
        * intro I;apply Ia.
          rewrite support_list_app,in_app_iff;left;assumption.
        * intro I;apply Ia;clear Ia.
          rewrite support_list_app,in_app_iff;right.
          apply In_support_list in I as (f&If&Ia).
          apply In_support_list;exists (e1·f);split.
          -- apply in_map_iff;exists f;tauto.
          -- apply in_app_iff;right;apply Ia.
        * intro I;apply Ia.
          rewrite support_list_app,in_app_iff;left;assumption.
    - case_eq (test0 e);intro F.
      + intros _;rewrite (test0_bindings F);eapply test0_bindPref in F as ->.
        reflexivity.
      + intros Ia;rewrite IHe,bindings_prefixes_support;simpl.
        * intro;simpl;tauto.
        * intro I;apply Ia;clear Ia.
          apply In_support_list in I as (f&If&Ia).
          apply In_support_list;exists (e⋆·f);split.
          -- apply in_map_iff;exists f;tauto.
          -- apply in_app_iff;right;apply Ia.
        * intro I;apply Ia;clear Ia.
          apply In_support_list in I as (f&If&Ia).
          apply In_support_list;exists (e⋆·f);split.
          -- apply in_map_iff;exists f;tauto.
          -- apply in_app_iff;right;apply Ia.
    - intros I ? [<-|[<-|F]];[| |simpl in F;tauto].
      + left;reflexivity.
      + left;symmetry;apply αfresh_letter.
        intro Ia;apply I;simpl.
        unfold support,SupportList;simpl.
        rewrite app_nil_r;simpl_In;apply Ia.
  Qed.


  Lemma bindPref_get_witness e a b : b ∈ bindPref e a -> exists u v, ⟦e⟧ (u++v) /\ 𝗙 a u = b.
  Proof.
    revert b;induction e;intro b;simpl;simpl_In.
    - firstorder subst.
    - firstorder subst; exists [],[];split;reflexivity.
    - intros [I|I].
      + apply IHe1 in I as (u&v&I&<-);exists u,v;split;[left|];tauto.
      + apply IHe2 in I as (u&v&I&<-);exists u,v;split;[right|];tauto.
    - case_eq (test0 e1 || test0 e2);intro F;simpl;[tauto|].
      apply orb_false_iff in F as (_&F).
      simpl_In;rewrite lift_prod_spec.
      intros [I|(x&y&I1&I2&->)].
      + apply IHe1 in I as (u&v&I&<-).
        apply test0_false in F as (w&Iw).
        exists u,(v++w);split;[|reflexivity].
        exists (u++v),w;rewrite app_ass;tauto.
      + apply bindings_witness in I1 as (w&Iw&<-).
        apply IHe2 in I2 as (u&v&I2&<-).
        exists (w++u),v;split.
        * rewrite app_ass;exists w,(u++v);tauto.
        * apply 𝗙_app.
    - rewrite lift_prod_spec;intros [<-|[I|(x&y&I1&I2&->)]].
      + exists [],[];split;[exists 0|];reflexivity.
      + apply IHe in I as (u&v&I&<-).
        exists u,v;split;[|reflexivity].
        exists 1,(u++v),[].
        rewrite app_nil_r;repeat split;assumption.
      + apply bindings_witness in I1 as (w&Iw&<-).
        apply IHe in I2 as (u&v&I&<-).
        exists (w++u),v;rewrite app_ass;simpl_binding;split;[|reflexivity].
        exists 2,w,(u++v);repeat split.
        * assumption.
        * exists (u++v),[];rewrite app_nil_r;repeat split.
          assumption.
    - firstorder subst.
      + exists [],[x];split;reflexivity.
      + exists [x],[];split;simpl_binding;reflexivity.
  Qed.

  Lemma MaxBind_cons a L : a ∈ L -> MaxBind L = MaxBind (a::L∖ a).
  Proof.
    induction L as [|b L];simpl;[tauto|].
    unfold_eqX.
    - intros _;simpl.
      case_in b L.
      + rewrite IHL by assumption;simpl;lia.
      + rewrite (rm_notin I);reflexivity.
    - intros [<-|I];[tauto|].
      simpl;rewrite (IHL I);simpl;lia.
  Qed.
    
  Global Instance MaxBind_equiv : Proper (@equivalent _ ==> eq) MaxBind.
  Proof.
    intro L;induction L as [|a L].
    - intros [|b M].
      + reflexivity.
      + intro E;exfalso;cut (b ∈ []);[intro F;apply F|].
        apply E;now left.
    - intros M E.
      case_in a L.
      + simpl;rewrite <- (IHL M);[|rewrite <- E;intros x;simpl;split;[|intros [<-|h]];tauto].
        rewrite (MaxBind_cons I);simpl;lia.
      + assert (IM: a ∈ M) by (apply E;now left).
        rewrite (MaxBind_cons IM).
        simpl;rewrite (IHL (M∖a));[reflexivity|].
        intros b;rewrite rm_In;split.
        * intros Ib;split;[|intros ->;tauto].
          apply E;now right.
        * intros (Ib&N);apply E in Ib as [->|Ib];tauto.
  Qed.

  Lemma MaxBind_lub n L :
    MaxBind L <= n <-> forall β, β ∈ L -> (size β) <= n.
  Proof.
    induction L;simpl.
    - split;[tauto|lia].
    - rewrite PeanoNat.Nat.max_lub_iff,IHL;clear IHL.
      firstorder subst.
      assumption.
  Qed.

  Lemma MaxBind_le n L :
    n <= MaxBind L <-> n = 0 \/ exists β, β ∈ L /\ n <= (size β).
  Proof.
    induction L;simpl.
    - firstorder.
    - rewrite PeanoNat.Nat.max_le_iff,IHL;clear IHL.
      firstorder subst;tauto.
  Qed.


  Lemma MaxBind_fresh_Pref e a : a # e -> MaxBind (bindPref e a) = 0.
  Proof.
    intros F.
    apply PeanoNat.Nat.le_antisymm;[|lia].
    apply MaxBind_lub;intros b I.
    apply bindPref_prefixes_support in I as [<-|I].
    - reflexivity.
    - exfalso;apply I.
    - intros h;apply F,prefixes_support,h.
  Qed.

  Lemma bindings_bindPref e a : bindings e a ⊆ bindPref e a.
  Proof.
    induction e;simpl;try reflexivity.
    - rewrite IHe1,IHe2;reflexivity.
    - case_eq (test0 e1||test0 e2);intro F.
      + assert (E: test0 (e_prod e1 e2) = true) by apply F.
        eapply test0_bindings in E;simpl in E;rewrite E; reflexivity.
      + rewrite IHe2;apply incl_appr;reflexivity.
    - rewrite IHe at 1;clear IHe.
      intro;simpl_In;tauto.
    - intro;simpl;tauto.
  Qed.

  
  Lemma MaxBind_sizeAt e a : MaxBind (bindings e a) <= sizeAt e a.
  Proof.
    induction e;simpl.
    - reflexivity.
    - reflexivity.
    - rewrite MaxBind_app;lia.
    - apply MaxBind_lub.
      intro b;rewrite lift_prod_spec;intros (x&y&Ix&Iy&->).
      rewrite MaxBind_lub in IHe1,IHe2.
      unfold size in *;simpl_binding.
      apply IHe1 in Ix;apply IHe2 in Iy;lia.
    - rewrite MaxBind_filter;apply IHe.
    - destruct x;simpl;[| |reflexivity];unfold_eqX;simpl;reflexivity.
  Qed.

  Lemma MaxBind_In a L : a ∈ L -> size a <= MaxBind L.
  Proof. intros;apply MaxBind_le;right;exists a;split;[assumption|reflexivity]. Qed.

  Lemma MaxBind_lift_prod L M : MaxBind (lift_prod prod_binding L M) <= MaxBind L + MaxBind M.
  Proof.
    apply MaxBind_lub;intro b;rewrite lift_prod_spec;intros (x&y&Ix&Iy&->).
    apply MaxBind_In in Ix;apply MaxBind_In in Iy;unfold size in *;simpl_binding;lia.
  Qed.

  Lemma memory_bound_aux e a b :
    binding_finite e = true ->
    b ∈ bindPref e a ->
    size b <= 2 * sizeAt e a
    /\ c_binding b - sizeAt e a <= d_binding b <= c_binding b + sizeAt e a.
  Proof.
    intro f;revert f b;induction e;intros f b;revert f;simpl;simpl_In.
    - tauto.
    - firstorder subst;reflexivity.
    - rewrite andb_true_iff;intros (f1&f2).
      intros [I|I].
      + apply (IHe1 f1) in I as (I1&I2);clear IHe1 IHe2.
        split;lia.
      + apply (IHe2 f2) in I as (I1&I2);clear IHe1 IHe2.
        split;lia.
    - destruct (test0 e1||test0 e2);[simpl;tauto|].
      simpl;rewrite andb_true_iff;intros (f1&f2).
      simpl_In;rewrite lift_prod_spec;intros [I|(x&y&I1&I2&->)].
      + apply (IHe1 f1) in I as (I1&I2);clear IHe1 IHe2.
        split;lia.
      + unfold size in *;simpl_binding.
        apply MaxBind_In in I1;rewrite MaxBind_sizeAt in I1.
        apply (IHe2 f2) in I2 as (D&I2);clear IHe1 IHe2.
        unfold size in *;split;lia.
    - unfold size in *;rewrite lift_prod_spec.
      rewrite andb_true_iff;intros (f&Sq).
      intros [<-|[I|(x&y&Ix&Iy&->)]].
      + unfold d_binding;simpl;split;lia.
      + apply (IHe f) in I as (D&I);split;lia.
      + rewrite forallb_forall in Sq;setoid_rewrite forallb_forall in Sq.
        apply (IHe f) in Iy as (D&Iy);clear IHe;simpl_binding;simpl_nat.
        case_in a ⌊e⌋.
        * pose proof (Sq a I _ Ix) as sq;clear I Sq.
          apply PeanoNat.Nat.eqb_eq in sq.
          apply MaxBind_In in Ix;rewrite MaxBind_sizeAt in Ix.
          unfold size in *;rewrite sq in *;clear sq.
          split; lia.
        * revert Ix;apply bindings_fresh in I as [->| ->];simpl;[tauto|].
          intros [<-|F];[|tauto].
          unfold d_binding at 1;simpl;lia.
    - unfold size in *;destruct x;firstorder subst;unfold d_binding;simpl;unfold_eqX;simpl;lia.
  Qed.

  Lemma binding_finite_memory_bindPref e :
    is_binding_finite e -> weightExpr (Σ (prefixes e)) = sum (fun a => MaxBind (bindPref e a)) {{⌊e⌋}}.
  Proof.
    intros fn; cut (forall a, bindings (Σ (prefixes e)) a ≈ bindPref e a).
    - intro hyp.
      pose proof (@prefixes_support _ _ _ _ e) as E.
      rewrite (Σ_support (prefixes e)) in E.
      etransitivity;[eapply sum_ext;intros;rewrite hyp;reflexivity|].
      apply PeanoNat.Nat.le_antisymm.
      + rewrite <- undup_equivalent,<-(undup_equivalent ⌊e⌋) in E.
        apply sum_incl_ND,NoDup_undup;eassumption.
      + assert (rmk : forall A (l m : list A), l ⊆ m -> m ≈ m++l).
        * clear;intros A l;induction l as [|a l];intros m;simpl.
          -- rewrite app_nil_r;reflexivity.
          -- intros I;rewrite IHl.
             ++ intro b;simpl_In;firstorder subst.
             ++ rewrite <-I;apply incl_tl;reflexivity.
        * apply rmk in E;clear rmk.
          rewrite <- undup_equivalent in E at 1.
          rewrite <-(undup_equivalent (_++_)) in E.
          rewrite (sum_eq_ND _ E) by apply NoDup_undup.
          clear hyp E.
          induction ⌊e⌋;simpl.
          -- reflexivity.
          -- case_in a {{l++⌊Σ(prefixes e)⌋}}.
             ++ apply IHl.
             ++ simpl;replace (MaxBind _) with 0;[lia|].
                symmetry;clear IHl.
                cut (~ a ∈ ⌊Σ (prefixes e)⌋);[clear I;intro I|intro;apply I;simpl_In;tauto].
                rewrite <- Σ_support in I.
                clear fn.
                cut (MaxBind (bindPref e a) <= 0);[lia|].
                apply MaxBind_lub;intros ? I';apply (bindPref_prefixes_support I) in I' as [<-|F].
                ** reflexivity.
                ** exfalso;apply F.
    - intros a b;split;intro I.
      + apply bindings_witness in I as (u&Iu&<-).
        apply prefixes_spec in Iu as (v&Iu).
        eapply (bindPref_binding_finite fn),Iu.
      + apply bindPref_get_witness in I as (u&v&Iu&<-).
        apply binding_finite_true.
        * pose proof (bindings_finite_prefixes fn) as hyp.
          setoid_rewrite <- binding_finite_spec in hyp.
          clear fn Iu u v a;generalize dependent (prefixes e);clear e.
          intro l;induction l as [|e l];simpl;[reflexivity|].
          rewrite andb_true_iff;firstorder.
        * apply prefixes_spec;exists v;apply Iu.
  Qed.

  Lemma memory_bound e :
    is_binding_finite e -> weightExpr (Σ (prefixes e)) <= 2 * sizeExpr e.
  Proof.
    intro B.
    rewrite binding_finite_memory_bindPref by assumption.
    rewrite (@sum_le _ _ (fun a => sizeAt e a + sizeAt e a)).
    - simpl;simpl_nat;rewrite <- size_sizeAt.
      rewrite sum_add_distr;reflexivity.
    - intros a Ia.
      apply MaxBind_lub.
      intros β Iβ.
      apply binding_finite_spec in B;destruct (memory_bound_aux B Iβ) as (->&_).
      lia.
  Qed.

  Proposition is_binding_finite_memory_finite e :
    is_binding_finite e <-> forall a, exists N,forall u v, ⟦e⟧ (u++v) -> size (𝗙 a u) <= N.
  Proof.
    split.
    - intros B a;exists (MaxBind (bindPref e a));intros u v Iuv.
      apply MaxBind_In.
      eapply bindPref_binding_finite;eauto.
    - intro h;cut (exists N, forall a u, ⟦e⟧ u -> size (𝗙 a u) <= N).
      + clear h;intros (N&IN).
        exists (Bindupto N);intros a u Iu.
        apply Bindupto_spec,IN,Iu.
      + remember ⌊e⌋ as L.
        intros;cut (exists N, forall a, a ∈ L -> forall u, ⟦ e ⟧ u -> size (𝗙 a u) <= N).
        * subst;intros (N&IN).
          exists N;intros a u Iu.
          case_in a ⌊e⌋.
          -- apply IN;tauto.
          -- rewrite <- (support_lang Iu) in I.
             apply αfresh_support in I as ->.
             unfold size;simpl;lia.
        * clear HeqL;induction L as [|b L];simpl.
          -- exists 0;tauto.
          -- destruct IHL as (NL&INL).
             destruct (h b) as (Nb&INb).
             exists (max NL Nb);intros a [<-|Ia] u Iu.
             ++ rewrite <- app_nil_r in Iu.
                apply INb in Iu;lia.
             ++ rewrite INL by assumption;lia.
  Qed.

  Corollary is_binding_finite_memory_bound e :
    is_binding_finite e <-> forall u v, ⟦e⟧ (u++v) -> weight u <= 2*sizeExpr e.
  Proof.
    split.
    - intros B u v Iuv.
      rewrite <- (memory_bound B).
      apply bindFind_weight_weightExpr.
      + cut (forall f, f ∈ (prefixes e) -> is_binding_finite f).
        * clear;setoid_rewrite <- binding_finite_spec.
          induction (prefixes e) as [|f L];simpl;[reflexivity|].
          rewrite andb_true_iff;firstorder.
        * apply bindings_finite_prefixes,B.
      + apply prefixes_spec;exists v;tauto.
    - intro h;apply is_binding_finite_memory_finite.
      intros a;exists (2*sizeExpr e);intros u v Iuv.
      rewrite <- (h _ _ Iuv).
      unfold weight;clear.
      case_in a {{⌊u⌋}}.
      + remember {{⌊u⌋}} as L;replace  {{⌊u⌋}} with L by tauto;clear HeqL.
        induction L as [|b L].
        * simpl in I;tauto.
        * destruct I as [<-|I];simpl;[|apply IHL in I];lia.
      + rewrite undup_equivalent in I.
        apply αfresh_support in I as ->;simpl.
        unfold size;simpl;lia.
  Qed.
          
  Lemma bindFinList_incl L M : bindFinList M -> L ⊆ M -> bindFinList L.
  Proof. intro hM;intros I e Ie;apply hM,I,Ie. Qed.

  Lemma bindFin_inf e f : is_binding_finite f -> ⟦e⟧ ≲ ⟦f⟧ -> is_binding_finite e.
  Proof.
    rewrite <- binding_finite_spec.
    intros hf I;exists (ε::flat_map (bindings f) ⌊e⌋).
    intros a u Iu.
    case_in a ⌊e⌋;[right|left].
    - apply in_flat_map;exists a;split;[assumption|].
      apply binding_finite_true.
      + assumption.
      + apply I,Iu.
    - symmetry;apply αfresh_support.
      intro Ia;apply I0,(support_lang Iu),Ia.
  Qed.

  (** * Square expressions *)

  
  Lemma sqExpr_inf e f : sqExpr f -> ⟦e⟧ ≲ ⟦f⟧ -> sqExpr e.
  Proof.
    intros (B&S) L;split.
    - apply (bindFin_inf B L).
    - intros a b Ib;apply (S a b).
      apply bindings_witness in Ib as (u&Iu&<-).
      apply binding_finite_true.
      + apply binding_finite_spec,B.
      + apply L,Iu.
  Qed.

  Lemma sqExpr_prod e f : sqExpr e -> sqExpr f -> sqExpr (e·f).
  Proof.
    intros (B1&h1) (B2&h2);split.
    - replace (e·f) with (e_prod e f) by reflexivity;simpl.
      rewrite <- binding_finite_spec in *;simpl.
      rewrite B1,B2;auto with bool.
    - replace (e·f) with (e_prod e f) by reflexivity;simpl.
      intros a b;rewrite lift_prod_spec.
      intros (b1&b2&I1&I2&->).
      apply h1 in I1;apply h2 in I2;unfold square;simpl_binding.
      rewrite I1,I2;lia.
  Qed.
  Lemma sqExpr_add e f : sqExpr e -> sqExpr f -> sqExpr (e∪f).
  Proof.
    intros (B1&h1) (B2&h2);split.
    - replace (e∪f) with (e_add e f) by reflexivity;simpl.
      rewrite <- binding_finite_spec in *;simpl.
      rewrite B1,B2;auto with bool.
    - replace (e∪f) with (e_add e f) by reflexivity;simpl.
      intros a b;simpl_In;intros [I|I].
      + apply (h1 a),I.
      + apply (h2 a),I.
  Qed.
                              
  Lemma binding_finite_sqExpr_star e : is_binding_finite (e⋆) -> sqExpr (e⋆).
  Proof.
    intro h;split;[assumption|].
    apply binding_finite_spec in h.
    replace (e⋆) with (e_star e) in * by reflexivity.
    simpl in *.
    intros a b [<-|Ib];[reflexivity|].
    apply andb_true_iff in h as (_&h).
    apply PeanoNat.Nat.eqb_eq.
    apply filter_In in Ib;tauto.
  Qed.
    
  Lemma sqExpr_star e : sqExpr e -> sqExpr (e⋆).
  Proof.
    intros (h1&h2);apply binding_finite_sqExpr_star.
    rewrite <- binding_finite_spec in *.
    apply andb_true_iff;split;[assumption|].
    apply forallb_forall;intros a Ia.
    apply forallb_forall;intros b Ib.
    apply PeanoNat.Nat.eqb_eq,(h2 a b Ib).
  Qed.
    
  Lemma sqExpr_Π L : sqListExpr L -> sqExpr (Π L).
  Proof.
    induction L.
    - intros _;split.
      + exists [ε];intros a u ->;left;reflexivity.
      + intros a b [<-|F];[|simpl in F;tauto].
        reflexivity.
    - intros h;simpl;apply sqExpr_prod.
      + apply h;now left.
      + apply IHL;intros e Ie;apply h;now right.
  Qed.
  Lemma sqExpr_Σ L : sqListExpr L -> sqExpr (Σ L).
  Proof.
    induction L.
    - intros _;split.
      + exists [];intros a u F;exfalso;apply F.
      + intros a b F;exfalso;apply F.
    - intros h;simpl;apply sqExpr_add.
      + apply h;now left.
      + apply IHL;intros e Ie;apply h;now right.
  Qed.
      
  Lemma sqListExpr_Π_In L a : sqListExpr L -> bindings (Π L) a ⊆ ε::flat_map (fun e => bindings e a) L.
  Proof.
    induction L;simpl.
    - reflexivity.
    - Transparent regProduct.
      intros h b;simpl;intro I.
      apply lift_prod_spec in I as (b1&b2&I1&I2&->).
      assert (S: sqListExpr L) by (intros e Ie;apply h;now right).
      assert (square b1 /\ square b2) as (s1&s2)
          by (split;[eapply h;[now left|eauto]
                    |apply (sqExpr_Π S) in I2;apply I2]).
      apply (IHL S) in I2 as [<-|I2];right;simpl_In.
      + rewrite prod_unit_r;tauto.
      +
        rewrite <- prod_binding_maxBind by assumption.
        destruct (maxBind_square_disj s1 s2) as [-> | ->];tauto.
        Opaque regProduct.
  Qed.
  
  (** * Homogeneous expressions *)


  Remark homogeneous_alt e :
    homogeneous e <-> forall u v a, ⟦e⟧ u -> ⟦e⟧ v -> 𝗙 a u = 𝗙 a v.
  Proof.
    split.
    - intros h u v a Iu Iv.
      destruct (h a) as (β&hβ).
      rewrite (hβ v Iv);apply hβ,Iu.
    - intros h a.
      case_eq (test0 e);intro T.
      + exists ε;intros u Iu;exfalso.
        apply test0_spec,soundness in T.
        apply T in Iu;apply Iu.
      + apply test0_false in T as (w&Iw).
        exists (𝗙 a w);intros u Iu.
        apply (h u w a Iu Iw).
  Qed.
  
  Lemma homogeneous_prod e f : homogeneous e -> homogeneous f -> homogeneous (e·f).
  Proof.
    intros h1 h2 a;destruct (h1 a) as (β1&I1),(h2 a) as (β2&I2).
    exists (β1⋅β2);intros w (u&v&->&Iu&Iv);simpl.
    simpl_binding;rewrite I1,I2;tauto.
  Qed.


  Fixpoint 𝐇 (e : @regexp letter) :=
    match e with
    | e_un => [un]
    | e_zero => []
    | ⟪x⟫ => [⟪x⟫]
    | e_add e1 e2 => 𝐇 e1 ++ 𝐇 e2
    | e_prod e1 e2 => lift_prod prod (𝐇 e1) (𝐇 e2)
    | e_star e =>
      flat_map
        (fun P => map (fun l => Π (pad ((Σ l) ⋆) l)) (shuffles P))
        (subsets (𝐇 e))
    end.
  Lemma test0_𝐇 e : test0 e = true -> 𝐇 e = [].
  Proof.
    induction e;simpl.
    - reflexivity.
    - discriminate.
    - rewrite andb_true_iff.
      intro;rewrite IHe1,IHe2;tauto.
    - rewrite orb_true_iff;intros [h|h].
      + rewrite IHe1;tauto.
      + rewrite IHe2 by assumption.
        clear;induction (𝐇 e1);simpl;tauto.
    - discriminate.
    - discriminate.
  Qed.

  Lemma 𝐇_eq e : e =KA Σ (𝐇 e).
  Proof.
    induction e;simpl.
    - reflexivity.
    - eauto.
    - replace e_add with join by reflexivity; rewrite IHe1,IHe2 at 1.
      apply KA_ACI0,Σ_app.
    - replace e_prod with prod by reflexivity.
      rewrite IHe1,IHe2 at 1;clear IHe1 IHe2.
      generalize (𝐇 e2);generalize (𝐇 e1);clear e1 e2.
      intros L M;induction L as [|e L];simpl;auto.
      etransitivity;[|apply KA_ACI0,Σ_app].
      rewrite <- Σ_distr_l,<- IHL.
      auto.
    - replace e_star with star by reflexivity.
      symmetry;apply antisymmetry.
      + apply Σ_bounded;intros f I.
        symmetry in IHe.
        apply ax_eq_inf in IHe.
        rewrite <- (Σ_bounded e (𝐇 e)) in IHe.
        apply in_flat_map in I as (L&IL&I).
        apply subsets_In in IL.
        apply in_map_iff in I as (L'&<-&EL').
        apply shuffles_equiv in EL'.
        pose proof IL as IL';rewrite EL' in IL';clear EL' L IL.
        assert (EL: Σ L' <=KA e).
        * induction L' as [|f L];simpl.
          -- unfold ax_inf;auto.
          -- rewrite (IHe f) by (apply IL';now left).
             rewrite IHL by (intros ? ?;apply IL';now right).
             apply ax_eq_inf;auto.
        * apply proper_star_inf in EL;replace (e_star e) with (e⋆) by reflexivity.
          generalize dependent (Σ L' ⋆);intros.
          rewrite <- ka_star_dup; apply proper_prod_inf;[assumption|].
          induction L' as [|f L'];simpl.
          -- apply one_inf_star.
          -- transitivity (e⋆·(e⋆·e⋆));[|rewrite ka_star_dup,ka_star_dup;reflexivity].
             repeat apply prod_ax_inf.
             ++ rewrite <- star_incr;apply (IHe f),IL';now left.
             ++ assumption.
             ++ apply IHL';rewrite <- IL';intros ? ?;simpl;tauto.
      + rewrite <- (ax_eq_ax _ (KA_un_right (e⋆))).
        etransitivity;[apply prod_ax_inf;[reflexivity|]|apply star_left_ind].
        * assert (L: [𝟬⋆·𝟭] ⊆ 
                            (flat_map
                               (fun P =>
                                  map (fun l => Σ l ⋆ · Π (flat_map (fun a => [a; Σ l ⋆]) l))
                                      (shuffles P)) (subsets (𝐇 e)))).
          -- intros ? [<-|F];[|exfalso;apply F].
             apply in_flat_map;exists [];split.
             ++ clear;induction (𝐇 e);simpl;simpl_In;tauto.
             ++ apply in_map_iff;exists [];split;[|now left].
                reflexivity.
          -- apply Σ_incl in L as <-.
             simpl;etransitivity;[|apply inf_cup_left].
             rewrite ka_zero_star;apply ax_eq_inf;auto.
        * rewrite IHe at 1;clear IHe.
          generalize (𝐇 e);intro L.
          rewrite Σ_distr_l;apply Σ_bounded.
          intro f;rewrite in_map_iff.
          intros (g&<-&I).
          apply in_flat_map in I as (M&IM&I).
          apply in_map_iff in I as (m&<-&Im).
          rewrite Σ_distr_r;apply Σ_bounded.
          intros f I;apply in_map_iff in I as (g&<-&Ig).
          case_in g m.
          -- transitivity (Σ m ⋆ · Π (flat_map (fun a : regexp => [a; Σ m ⋆]) m)).
             ++ rewrite (ax_eq_ax _ (KA_prod_assoc _ _ _)).
                apply prod_ax_inf;[|reflexivity].
                rewrite <- ka_star_dup at 2.
                apply prod_ax_inf;[|reflexivity].
                rewrite <- star_incr.
                apply Σ_bigger;assumption.
             ++ apply Σ_bigger,in_flat_map.
                exists M;split;[assumption|].
                apply in_map_iff;exists m;split;tauto.
          -- assert (exists M', M' ∈ subsets L /\ (g::m) ∈ shuffles M') as (M'&IM'&Ig').
             ++ revert M m IM Im I;induction L;simpl in *;[tauto|].
                destruct Ig as [<-|Ig].
                ** intros M m;simpl_In.
                   rewrite in_map_iff.
                   intros [(M'&<-&IM')|IM].
                   --- simpl;intro I;apply in_flat_map in I as (m'&Im'&Im).
                       apply insert_spec in Im as (?&?&_&->);simpl_In;tauto.
                   --- intros Im Ia;exists (a::M);split.
                       +++ simpl_In;left;apply in_map_iff;exists M;tauto.
                       +++ simpl;apply in_flat_map;exists m;split;[assumption|].
                           apply insert_spec;exists [],m;tauto.
                ** intros M m;simpl_In.
                   rewrite in_map_iff.
                   intros [(M'&<-&IM')|IM].
                   --- simpl;intro I;apply in_flat_map in I as (m'&Im'&Im).
                       intros Ig';destruct (IHL Ig M' m') as (M''&IM''&IH);try assumption.
                       +++ intro I;apply Ig'.
                           apply insert_spec in Im as (?&?&->&->);simpl_In in *;tauto.
                       +++ exists (a::M'');split.
                           *** simpl_In;left;apply in_map_iff;exists M'';tauto.
                           *** simpl;apply in_flat_map;exists (g::m');split;[assumption|].
                               apply insert_spec in Im as (m1&m2&->&->);simpl_In in *.
                               apply insert_spec;exists (g::m1),m2;tauto.
                   --- intros Im Ig';destruct (IHL Ig M m) as (M'&IM'&IH);try assumption.
                       exists M';split;[|assumption].
                       simpl_In;tauto.
             ++ transitivity (Π (pad (Σ (g :: m) ⋆) (g::m))).
                ** rewrite <- (ax_eq_ax _ (KA_un_left g)) at 1.
                   repeat rewrite <- (ax_eq_ax _ (KA_prod_assoc _ _ _)).
                   assert (hyp: Σ m ⋆ <=KA Σ (g :: m) ⋆)
                     by (apply proper_star_inf,Σ_incl;intro;simpl;tauto).
                   repeat apply prod_ax_inf.
                   --- apply one_inf_star.
                   --- reflexivity.
                   --- apply hyp.
                   --- transitivity (Π (flat_map (fun a : regexp => [a; Σ (g::m) ⋆]) m));[|reflexivity].
                       revert hyp;clear.
                       generalize (Σ m⋆);generalize (Σ (g::m)⋆).
                       intros e f hyp;induction m;simpl;[reflexivity|].
                       repeat apply prod_ax_inf.
                       +++ reflexivity.
                       +++ assumption.
                       +++ assumption.
                ** apply Σ_bigger,in_flat_map;exists M';split;[assumption|].
                   apply in_map_iff;exists (g::m);split;[|assumption].
                   reflexivity.
    - eauto.
  Qed.
  
  Corollary 𝐇_lang e : ⟦e⟧ ≃ ⟦Σ (𝐇 e)⟧.
  Proof. apply soundness,𝐇_eq. Qed.
  
  Transparent regProduct. 
  Lemma homogeneous_𝐇 e f : is_binding_finite e -> f ∈ 𝐇 e -> homogeneous f.
  Proof.
    intro b;revert f;induction_bin_fin e b;simpl.
    - tauto.
    - intros ? [<-|F];[|tauto].
      exists ε;intros ? ->;reflexivity.
    - intros ? [<-|F];[|tauto];intro a;exists (𝗳 a x);intros ? ->;simpl_binding;reflexivity.
    - intro f;simpl_In;intros [I|I].
      + apply IHe1;tauto.
      + apply IHe2;tauto.
    - intros f;simpl;rewrite lift_prod_spec.
      intros (f1&f2&I1&I2&->).
      apply homogeneous_prod.
      * apply IHe1;tauto.
      * apply IHe2;tauto.
    - rewrite orb_true_iff,test0_spec,test0_spec in T.
      destruct T as [E|E];apply soundness in E;
        intros f;rewrite lift_prod_spec;
          intros (f1&f2&I1&I2&->); exists ε;intros u (u1&u2&->&F&F2);exfalso.
      + apply (E u1),𝐇_lang,Σ_lang.
        exists f1;tauto.
      + apply (E u2),𝐇_lang,Σ_lang.
        exists f2;tauto.
    - assert (S1 : sqExpr (e⋆))
        by (apply binding_finite_sqExpr_star,binding_finite_spec;simpl;apply andb_true_iff;
            destruct Sq as (B&Sq);split;[apply binding_finite_spec,B
                                        |apply forallb_forall;intros a Ia;apply forallb_forall;
                                         intros β Iβ;apply PeanoNat.Nat.eqb_eq,(Sq a),Iβ]).
      intros f.
      rewrite in_flat_map.
      intros (l&Il&If).
      apply in_map_iff in If as (m&<-&Im).
      assert (sqH : sqListExpr (𝐇 e)).
      + intros f If;apply (sqExpr_inf S1).
        rewrite <- (ax_inf_lang_incl (star_incr _)).
        rewrite (𝐇_lang e).
        intros u I;apply Σ_lang;exists f;tauto.
      + apply shuffles_equiv in Im.
        apply subsets_In in Il;rewrite Im in Il;clear l Im.
        assert (Sm : sqListExpr m)
          by (intros f If;apply sqH,Il,If).
        assert (Spad : sqListExpr (pad ((Σ m)⋆) m))
          by (intros f If;rewrite pad_contents in If;
              destruct If as [<-|If];[apply sqExpr_star,sqExpr_Σ,Sm|apply Sm,If]).
        intro a.
        assert (exists (k : list 𝖡), ⎢k⎥ = ⎢m⎥ /\ forall n, forall u, ⟦nth n m zero⟧ u -> 𝗙 a u = nth n k ε) as (K&lenK&hK).
        * clear Sm Spad;induction m as [|f m].
          -- exists [];split;[reflexivity|];intros [] u;simpl;intro F;exfalso;apply F.
          -- assert (If: f ∈ 𝐇 e) by (apply Il;now left).
             destruct (IHe f If a) as (β&h).
             destruct IHm as (k&len&hk);[rewrite <- Il;intro;simpl;tauto|].
             exists (β::k);split;[simpl;lia|intros [|n] u;simpl].
             ++ apply h.
             ++ apply hk.
        * exists (fold_right maxBind ε K);clear IHe.
          intros u Iu.
          apply (Π_lang (pad (e_star (Σ m)) m)) in Iu as (U&->&len&Iu).
          assert (Lm : ⟦Σ m ⋆⟧ ≲ ⟦e ⋆⟧)
            by (simpl;apply joinOrderLang,proper_star_inf,joinOrderLang;rewrite (𝐇_lang e);
                apply ax_inf_lang_incl,Σ_incl,Il).
          assert (hyp:forall u, u ∈ U -> ⟦e⋆⟧ u).
          -- intros u IU.
             cut (exists f, f ∈ pad (e_star (Σ m)) m /\ ⟦f⟧ u).
             ++ intros (f&If&L).
                rewrite pad_contents in If;destruct If as [<-|If].
                ** apply Lm,L.
                ** simpl;pose proof (star_incr ⟦e⟧) as h;apply joinOrderLang in h.
                   apply (h u);clear h.
                   apply Il in If;apply 𝐇_lang,Σ_lang;exists f;tauto.
             ++ apply In_nth with (d := []) in IU as (n&Ln&<-).
                exists (nth n (pad (e_star (Σ m)) m) 𝟭);split.
                ** apply nth_In;rewrite <- len;assumption.
                ** apply Iu.
          -- transitivity (fold_right prod_binding ε (map (𝗙 a) U));
               [clear;induction U;simpl;[reflexivity|simpl_binding;f_equal;assumption]|].
             transitivity (fold_right maxBind ε (map (𝗙 a) U)).
             ++ revert hyp S1;clear;intros.
                cut (fold_right prod_binding ε (map (𝗙 a) U) = fold_right maxBind ε (map (𝗙 a) U)
                     /\ square (fold_right maxBind ε (map (𝗙 a) U)));[tauto|].
                induction U as [|u U];[split;reflexivity|simpl].
                destruct IHU as (->&S).
                ** intros;apply hyp;now right.
                ** assert (square (𝗙 a u))
                    by (pose proof S1 as (_&h);apply (h a);apply binding_finite_true;
                        [apply binding_finite_spec,S1|apply hyp;now left]).
                   split.
                   --- symmetry;apply prod_binding_maxBind;assumption.
                   --- apply maxBind_square;assumption.
             ++ transitivity (fold_right maxBind ε  (ε::map (𝗙 a) U));
                  [simpl;rewrite maxBind_comm,maxBind_neutral;reflexivity|].
                transitivity (fold_right maxBind ε  (ε::K));
                  [|simpl;rewrite maxBind_comm,maxBind_neutral;reflexivity].
                apply maxBind_lists;intro b;simpl_In;rewrite in_map_iff;split.
                ** intros [<-|(w&<-&Iw)];[tauto|].
                   apply In_nth with (d:= []) in Iw as (n&Ln&E).
                   assert (h: nth n (pad (e_star (Σ m)) m) 𝟭 ∈ pad (e_star (Σ m)) m)
                     by (apply nth_In;rewrite <- len;assumption).
                   assert (Eb : ⟦ nth n (pad (e_star (Σ m)) m) 𝟭 ⟧ w)
                     by (rewrite <- E;apply Iu).
                   apply (pad_contents (e_star (Σ m)) m) in h as [h|h].
                   --- rewrite <- h in Eb.
                       apply sqExpr_Σ,sqExpr_star in Sm.
                       pose proof Sm as (B&_).
                       apply binding_finite_spec in B.
                       apply (binding_finite_true B) with (a:= a) in Eb as [Ib|Ib].
                       +++ rewrite <- Ib;tauto.
                       +++ simpl_In in Ib;destruct Ib as (Ib&Sq').
                           apply bindings_witness in Ib as (u&L&Ib).
                           apply Σ_lang in L as (f&If&L);rewrite <- Ib in *.
                           apply In_nth with (d:=zero) in If as (k&lenk&<-).
                           apply hK in L as ->.
                           right;apply nth_In;lia.
                   --- apply In_nth with (d:=zero) in h as (k&lenk&Ek).
                       rewrite <- Ek in Eb.
                       apply hK in Eb as ->.
                       right;apply nth_In;lia.
                ** intros [<-|Ib];[tauto|].
                   apply In_nth with (d:=ε) in Ib as (n&In&<-).
                   right;exists (nth (S(n+n)) U []).
                   split.
                   --- apply hK.
                       replace (nth n m zero) with (nth (S(n+n)) (pad (e_star (Σ m)) m) 𝟭);
                         [apply Iu|].
                       rewrite lenK in In;revert In;clear;symmetry.
                       generalize (e_star (Σ m));intro E.
                       revert n In;induction m;intros [|n];simpl;try lia||reflexivity.
                       intros I;rewrite IHm by lia;simpl.
                       rewrite PeanoNat.Nat.add_succ_r;reflexivity.
                   --- apply nth_In.
                       cut (⎢U⎥ = S(⎢m⎥ + ⎢m⎥));[lia|].
                       rewrite len;clear.
                       generalize (e_star (Σ m));intro E.
                       unfold pad;induction m;simpl;auto.
                       simpl in *;rewrite IHm;lia.
  Qed.
  Lemma ϵ_𝐇 e f : e ∈ 𝐇 f -> ϵ e = e_un -> e =KA un.
  Proof.
    revert e;induction f;intro e;simpl;simpl_In.
    - tauto.
    - intros [<-|F];[reflexivity|tauto].
    - intros [I|I] E;[apply IHf1|apply IHf2];assumption.
    - rewrite lift_prod_spec;intros (e1&e2&I1&I2&->).
      simpl;destruct (ϵ_zero_or_un e1) as [E1|E1];rewrite E1;
        [destruct (ϵ_zero_or_un e2) as [E2|E2];rewrite E2|];try discriminate.
      intros _;rewrite (IHf1 _ I1 E1);rewrite (IHf2 _ I2 E2).
      auto.
    - rewrite in_flat_map;intros (A&IA&Ie).
      apply in_map_iff in Ie as (B&<-&IB).
      intro E;cut (forall e', e' ∈ B -> e' =KA un).
      + clear;intro E.
        cut (Σ B ⋆=KA un).
        * generalize (Σ B ⋆);intros g Eg.
          induction B;simpl.
          -- rewrite Eg;auto.
          -- rewrite IHB,Eg,left_unit,right_unit.
             ++ rewrite E by (now left); reflexivity.
             ++ intros e' Ie';apply E;now right.
        * induction B;simpl.
          -- apply ka_zero_star.
          -- rewrite (E a) by (now left).
             rewrite star_join.
             rewrite IHB.
             ++ rewrite right_unit,un_star,left_unit,(ka_idem _);reflexivity.
             ++ intros e' I;apply E;right;apply I.
      + intros e' Ie';apply IHf.
        * apply (subsets_In IA),(shuffles_equiv IB),Ie'.
        * revert E e' Ie';generalize (Σ B⋆);clear;intros f.
          induction B as [|e B];simpl;intros Ef e' Ie;[tauto|].
          revert Ef;destruct (ϵ_zero_or_un f) as [E1|E1];rewrite E1;[|discriminate];
            destruct (ϵ_zero_or_un e) as [E2|E2];rewrite E2;[|discriminate].
          destruct (ϵ_zero_or_un (Π (flat_map (fun a : regexp => [a; f]) B))) as [E3|E3];
            rewrite E3;[|discriminate].
          intros _;destruct Ie as [->|Ie].
          -- assumption.
          -- apply IHB;[|assumption].
             simpl;rewrite E1,E3;reflexivity.
    - intros [<-|F];simpl;[discriminate|tauto].
  Qed.

  Opaque 𝐇.

  (** * Spines *)
  
  Fixpoint spines (e : @regexp letter) :=
    match e with
    | e_zero => []
    | e_un => [(e_un,e_un)]
    | ⟪x⟫ => [(⟪x⟫,e_un);(e_un,⟪x⟫)]
    | e_add e1 e2 => spines e1 ++ spines e2
    | e_prod e1 e2 =>
      flat_map (fun s => map (fun f => (fst s,snd s·f))(𝐇 e2)) (spines e1)
               ++ flat_map (fun s => map (fun f => (f · fst s,snd s))(𝐇 e1)) (spines e2)
    | e_star e =>
      flat_map (fun s => flat_map (fun e1 => map (fun e2 => (e1·fst s,snd s·e2))
                                           (𝐇 (e⋆)))
                               (𝐇 (e⋆)))
               ((e_un,e_un)::(spines e))
    end.
  
  Transparent 𝐇.
  Lemma test0_spines e : test0 e = true -> spines e = [].
  Proof.
    induction e;simpl.
    - reflexivity.
    - discriminate.
    - rewrite andb_true_iff.
      intro;rewrite IHe1,IHe2;tauto.
    - rewrite orb_true_iff;intros [h|h].
      + rewrite IHe1 by tauto.
        rewrite (test0_𝐇 h).
        simpl.
        clear;induction (spines e2);simpl;tauto.
      + rewrite IHe2 by assumption.
        rewrite (test0_𝐇 h).
        simpl.
        clear;induction (spines e1);simpl;tauto.
    - discriminate.
    - discriminate.
  Qed.
  Opaque 𝐇.

  Lemma spines_eq e : e =KA Σ (map (fun s => fst s · snd s) (spines e)).
  Proof.
    induction e.
    - eauto.
    - simpl;transitivity (prod un un);eauto. 
    - replace e_add with join by reflexivity; simpl;rewrite map_app.
      rewrite <- (KA_ACI0 (Σ_app _ _)),<-IHe1,<-IHe2;reflexivity.
    - replace e_prod with prod by reflexivity.
      transitivity (e1·e2∪e1·e2);[eauto|].
      simpl;rewrite map_app.
      rewrite <- (KA_ACI0 (Σ_app _ _)).
      apply join_ax_eq.
      + rewrite IHe1 at 1;rewrite Σ_distr_r,map_map;clear IHe1 IHe2.
        induction (spines e1) as [|e L];[reflexivity|].
        simpl;rewrite map_app, <- (KA_ACI0 (Σ_app _ _));simpl.
        apply join_ax_eq;[|apply IHL].
        rewrite (𝐇_eq e2) at 1.
        rewrite Σ_distr_l,map_map;simpl;clear.
        induction (𝐇 e2) as [|f L];[reflexivity|].
        apply join_ax_eq;[eauto|apply IHL].
      + rewrite IHe2 at 1;rewrite Σ_distr_l,map_map;clear IHe1 IHe2.
        induction (spines e2) as [|e L];[reflexivity|].
        simpl;rewrite map_app, <- (KA_ACI0 (Σ_app _ _));simpl.
        apply join_ax_eq;[|apply IHL].
        rewrite (𝐇_eq e1) at 1.
        rewrite Σ_distr_r,map_map;simpl;clear.
        induction (𝐇 e1) as [|f L];[reflexivity|].
        apply join_ax_eq;[eauto|apply IHL].
    - simpl;replace e_star with star by reflexivity.
      rewrite map_app,<- (KA_ACI0 (Σ_app _ _)).
      transitivity (e⋆∪e⋆·e·e⋆);[|apply join_ax_eq].
      + symmetry;transitivity (e⋆·e·e⋆∪e⋆);[auto|].
        symmetry;apply ka_star_mid_split.
      + rewrite <- ka_star_dup at 1.
        rewrite (𝐇_eq (e⋆)) at 1 2.
        remember (𝐇 (e⋆)) as L.
        remember (𝐇 (e⋆)) as M.
        rewrite HeqL at 1 3;clear HeqM HeqL IHe.
        rewrite Σ_distr_r;induction M;[reflexivity|].
        simpl;rewrite map_app, <- (KA_ACI0 (Σ_app _ _));simpl.
        apply join_ax_eq;[clear|apply IHM].
        rewrite Σ_distr_l;induction L;[reflexivity|].
        simpl;apply join_ax_eq;[clear|apply IHL].
        transitivity ((a·𝟭)·a0);eauto.
      + rewrite (𝐇_eq (e⋆)) at 1 2.
        rewrite IHe at 2;clear IHe.
        generalize (spines e);intros L.
        generalize (𝐇 (e⋆));intros M.
        rewrite Σ_distr_r,Σ_distr_l;clear.
        induction L as [|e L];simpl.
        * rewrite <- Σ_distr_l,<-Σ_distr_r.
          transitivity (𝟬·Σ M);eauto.
        * simpl;rewrite map_app, <- (KA_ACI0 (Σ_app _ _));simpl.
          rewrite <- IHL;clear.
          rewrite <- Σ_distr_l,<-Σ_distr_r.
          rewrite <- Σ_distr_l,<-Σ_distr_r.
          transitivity
            ( (Σ M · (fst e · snd e) ∪ Σ M ·Σ (map (fun s => fst s · snd s) L) )· Σ M);
            [apply prod_ax_eq;[eauto|reflexivity]|].
          transitivity
            ( (Σ M · (fst e · snd e)· Σ M ∪ Σ M ·Σ (map (fun s => fst s · snd s) L) · Σ M));[eauto|].
          apply join_ax_eq;[|reflexivity].
          transitivity( Σ M · ((fst e · snd e)· Σ M));[eauto|].
          clear;remember M as L;rewrite HeqL at 1 3;clear HeqL.
          clear;induction M as [|f M];simpl;[eauto|].
          simpl;rewrite map_app, <- (KA_ACI0 (Σ_app _ _));simpl.
          transitivity (f · ((fst e · snd e) · Σ L) ∪ Σ M · ((fst e · snd e) · Σ L));[eauto|].
          apply join_ax_eq;[clear|apply IHM].
          rewrite map_map;simpl.
          rewrite Σ_distr_l,Σ_distr_l.
          rewrite map_map;simpl.
          induction L as [|g L];simpl;[reflexivity|].
          apply join_ax_eq;[clear|apply IHL].
          transitivity (f · (fst e · (snd e · g)));eauto.
    - simpl;replace e_un with un by reflexivity.
      transitivity (⟪x⟫∪(𝟭· ⟪ x ⟫ ∪ 𝟬));[|eauto].
      transitivity (⟪x⟫∪(𝟭· ⟪ x ⟫));[|apply join_ax_eq;eauto].
      transitivity (⟪x⟫∪⟪ x ⟫);[|apply join_ax_eq;eauto].
      eauto.
  Qed.
  
    
  Lemma spines_split e u v : ⟦e⟧ (u++v) -> exists e1 e2, (e1,e2) ∈ spines e /\ ⟦e1⟧ u /\ ⟦e2⟧ v.
  Proof.
    revert u v;induction e;intros u v;simpl.
    - firstorder.
    - intros E;apply app_eq_nil in E as (->&->).
      exists e_un,e_un;split;[tauto|split;reflexivity].
    - intros [I|I].
      + apply IHe1 in I as (f1&f2&I1&I2&I3).
        exists f1,f2;simpl_In;tauto.
      + apply IHe2 in I as (f1&f2&I1&I2&I3).
        exists f1,f2;simpl_In;tauto.
    - intros (u1&u2&E&I1&I2).
      levi E;subst;clear E.
      + apply (IHe2 [] u2) in I2 as (g1&g2&I2&Ig1&Ig2).
        apply 𝐇_lang,Σ_lang in I1 as (f&If&I1).
        exists (f·g1),g2;split.
        * apply in_app_iff;right.
          apply in_flat_map;exists (g1,g2);split;[assumption|].
          apply in_map_iff;exists f;split;[|assumption].
          reflexivity.
        * split;[|assumption].
          exists u1,[];rewrite app_nil_r;tauto.
      + apply (IHe2 (a::w) v) in I2 as (g1&g2&I2&Ig1&Ig2).
        apply 𝐇_lang,Σ_lang in I1 as (f&If&I1).
        exists (f·g1),g2;split.
        * apply in_app_iff;right.
          apply in_flat_map;exists (g1,g2);split;[assumption|].
          apply in_map_iff;exists f;split;[|assumption].
          reflexivity.
        * split;[|assumption].
          exists u1,(a::w);tauto.
      + apply IHe1 in I1 as (g1&g2&I1&Ig1&Ig2).
        apply 𝐇_lang,Σ_lang in I2 as (f&If&I2).
        exists g1,(g2 ·f);split.
        * apply in_app_iff;left.
          apply in_flat_map;exists (g1,g2);split;[assumption|].
          apply in_map_iff;exists f;split;[|assumption].
          reflexivity.
        * split;[assumption|].
          exists (a::w),u2;tauto.
    - intros I;apply (@split_star _ e u v) in I as [(->&->)|(u1&u2&v1&v2&->&->&I1&I2&I3)].
      + assert (I: ⟦e⋆⟧ []) by (exists 0;reflexivity).
        apply 𝐇_lang,Σ_lang in I as (e'&Ie'&I1).
        exists (e'·e_un),(e_un·e');repeat split.
        * simpl_In;left;apply in_flat_map;exists e';split;[assumption|].
          apply in_map_iff;exists e';split;[|assumption].
          reflexivity.
        * exists [],[];repeat split;assumption.
        * exists [],[];repeat split;assumption.
      + apply 𝐇_lang,Σ_lang in I1 as (e1&Ie1&I1).
        apply 𝐇_lang,Σ_lang in I3 as (e4&Ie4&I4).
        apply IHe in I2 as (e2&e3&I&I2&I3).
        exists (e1·e2),(e3·e4);repeat split.
        * simpl_In;right;apply in_flat_map.
          exists (e2,e3);split;[assumption|].
          apply in_flat_map;exists e1;split;[assumption|].
          apply in_map_iff;exists e4;split;[|assumption].
          reflexivity.
        * exists u1,u2;tauto.
        * exists v1,v2;tauto.
    - destruct u;simpl;intro E;inversion E;subst.
      + exists e_un,⟪x⟫;repeat split;tauto.
      + apply app_eq_nil in H1 as (->&->);exists ⟪x⟫,e_un;repeat split;tauto.
  Qed.
  
  Lemma spines_homogeneous e e1 e2 :
    is_binding_finite e -> (e1,e2) ∈ spines e -> homogeneous e1 /\ homogeneous e2.
  Proof.
    rewrite <- binding_finite_spec;revert e1 e2;induction e;intros f1 f2;simpl.
    - tauto.
    - intros _ [E|F];[inversion E|tauto];split;intro a;exists ε;intros u ->;reflexivity.
    - rewrite andb_true_iff;simpl_In;intros (h1&h2) [I|I].
      + apply IHe1,I;assumption.
      + apply IHe2,I;assumption. 
    - rewrite orb_true_iff,orb_true_iff,andb_true_iff.
      intros [h|(h1&h2)];
        [destruct h as [h|h];rewrite (test0_spines h),(test0_𝐇 h);
         simpl;intro I;exfalso;revert I;
         clear;[induction (spines e2)|rewrite app_nil_r;induction (spines e1)];simpl;tauto|].
      simpl_In;intros [I|I];apply in_flat_map in I as ((s1&s2)&I1&I);
        apply in_map_iff in I as (e2'&E&I2);inversion E;subst;clear E;split;
          try apply homogeneous_prod;apply IHe1 in I1 || apply IHe2 in I1;try tauto.
      + apply binding_finite_spec in h2;apply (homogeneous_𝐇 h2 I2).
      + apply binding_finite_spec in h1;apply (homogeneous_𝐇 h1 I2).
    - intro h;assert (B:is_binding_finite (e⋆)) by (apply binding_finite_spec,h);revert h.
      rewrite andb_true_iff;intros (IH&_).
      simpl_In;repeat setoid_rewrite in_flat_map||setoid_rewrite in_map_iff.
      intros [h|h].
      + destruct h as (e1&I1&(e2&E&I2)).
        inversion E;split;apply homogeneous_prod.
        * eapply homogeneous_𝐇;eauto.
        * intro a;exists ε;intros u ->; reflexivity.
        * intro a;exists ε;intros u ->; reflexivity.
        * eapply homogeneous_𝐇;eauto.
      + destruct h as ((e2&e3)&I2&e1&I1&e4&E&I4).
        inversion E;subst;clear E.
        apply IHe in I2;[|assumption].
        split;apply homogeneous_prod;try tauto.
        * eapply homogeneous_𝐇;eauto.
        * eapply homogeneous_𝐇;eauto.
    - intros _ [E|[E|E]];inversion E;subst;split.
      + intro a;exists (𝗳 a x);intros u ->;simpl_binding; reflexivity.
      + intro a;exists ε;intros u ->; reflexivity.
      + intro a;exists ε;intros u ->; reflexivity.
      + intro a;exists (𝗳 a x);intros u ->;simpl_binding; reflexivity.
  Qed.

  Lemma ϵ_spines e1 e2 f : (e1,e2) ∈ spines f -> (ϵ e1 = e_un -> e1 =KA un) /\ (ϵ e2 = e_un -> e2 =KA un).
  Proof.
    revert e1 e2;induction f;simpl.
    - tauto.
    - intros e1 e2 [E|E];inversion E;subst;split;reflexivity.
    - intros e1 e2;simpl_In;intros [I|I];[apply IHf1|apply IHf2];assumption.
    - intros e1 e2;simpl_In;repeat rewrite in_flat_map;setoid_rewrite in_map_iff.
      intros [I|I];destruct I as ((g1&g2)&IH&(h&E&Ih));inversion E;subst;clear E;
        [apply IHf1 in IH|apply IHf2 in IH];pose proof (ϵ_𝐇 Ih) as E';split;try tauto;simpl;
          [destruct (ϵ_zero_or_un g2) as [E|E]|destruct (ϵ_zero_or_un g1) as [E|E]];rewrite E;
            try discriminate;destruct (ϵ_zero_or_un h) as [Eh|Eh];rewrite Eh;discriminate||intros _.
      + destruct IH as (_&->);[| assumption].
        rewrite E' by assumption.
        rewrite left_unit;reflexivity.
      + destruct IH as (->&_);[| assumption].
        rewrite E' by assumption.
        rewrite left_unit;reflexivity.
    - intros e1 e2;simpl_In;repeat rewrite in_flat_map;setoid_rewrite in_map_iff;intros [I|I].
      + destruct I as (e&Ie&g&E&Ig).
        inversion E;clear E;subst.
        split;simpl.
        * destruct (ϵ_zero_or_un e) as [E|E];rewrite E;[|discriminate].
          rewrite (ϵ_𝐇 Ie E),left_unit;reflexivity.
        * destruct (ϵ_zero_or_un g) as [E|E];rewrite E;[|discriminate].
          rewrite (ϵ_𝐇 Ig E),right_unit;reflexivity.
      + setoid_rewrite in_flat_map in I;setoid_rewrite in_map_iff in I.
        destruct I as ((e1'&e2')&IH&g&Ig&h&E&Ih).
        inversion E;clear E;subst.
        apply IHf in IH.
        split;simpl.
        * destruct (ϵ_zero_or_un g) as [E|E];rewrite E;[|discriminate].
          destruct (ϵ_zero_or_un e1') as [E'|E'];rewrite E';[|discriminate].
          rewrite (ϵ_𝐇 Ig E),left_unit.
          intros _;apply IH;assumption.
        * destruct (ϵ_zero_or_un e2') as [E'|E'];rewrite E';[|discriminate].
          destruct (ϵ_zero_or_un h) as [E|E];rewrite E;[|discriminate].
          rewrite (ϵ_𝐇 Ih E),right_unit.
          intros _;apply IH;assumption.
    - intros e1 e2 [E|[E|E]];inversion E;subst;simpl;split;discriminate||reflexivity.
  Qed.

  Lemma binding_finite_Σ L :
    binding_finite (Σ L) = forallb binding_finite L.
  Proof. induction L;simpl;congruence. Qed.

  Lemma is_binding_finite_Σ L : (forall e , e ∈ L -> is_binding_finite e) -> is_binding_finite (Σ L).
  Proof.
    setoid_rewrite <- binding_finite_spec.
    induction L as [|e L];simpl;[reflexivity|rewrite andb_true_iff;firstorder].
  Qed.

  Lemma bindings_act a p e : bindings (p ∙ e) a = bindings e (p∗∙a).
  Proof.
    induction e;simpl; replace actReg with act by reflexivity;try reflexivity.
    - rewrite <-IHe1, <-IHe2;reflexivity.
    - rewrite <-IHe1, <-IHe2;reflexivity.
    - rewrite IHe;reflexivity.
    - rewrite 𝗳_perm;reflexivity.
  Qed.
    
  Lemma is_binding_finite_act p e : is_binding_finite (p∙e) <-> is_binding_finite e.
  Proof.
    setoid_rewrite <- binding_finite_spec.
    induction e;simpl;try tauto.
    - repeat rewrite andb_true_iff.
      rewrite IHe1,IHe2;tauto.
    - repeat rewrite andb_true_iff||rewrite orb_true_iff.
      replace actReg with act by reflexivity.
      repeat rewrite test0_act.
      rewrite IHe1,IHe2;reflexivity.
    - repeat rewrite andb_true_iff.
      replace actReg with act by reflexivity.
      rewrite IHe.
      repeat setoid_rewrite forallb_forall.
      setoid_rewrite bindings_act.
      setoid_rewrite support_action.
      setoid_rewrite In_act_lists.
      firstorder.
      apply (H2 (p∙x));rewrite act_pinv_p;assumption.
  Qed.

End s.

Ltac induction_bin_fin e B:=
  apply (@bind_fin_ind _ _ _ _ e);
  [ apply B | | | | | | | ];
  clear B e;
  [ |
    |let x:= fresh "x" in intro x
    |let e1:= fresh "e1" in
     let e2:= fresh "e2" in
     let B1:= fresh "B1" in
     let B2:= fresh "B2" in
     let IH1:= fresh "IHe1" in
     let IH2:= fresh "IHe2" in
     intros e1 e2 B1 B2 IH1 IH2
    |let e1:= fresh "e1" in
     let e2:= fresh "e2" in
     let B1:= fresh "B1" in
     let B2:= fresh "B2" in
     let IH1:= fresh "IHe1" in
     let IH2:= fresh "IHe2" in
     let T:= fresh "T" in
     intros e1 e2 B1 B2 IH1 IH2 T
    |let e1:= fresh "e1" in
     let e2:= fresh "e2" in
     let T:= fresh "T" in
     intros e1 e2 T
    |let IH:= fresh "IHe" in
     let Sq:= fresh "Sq" in
     let e:= fresh "e" in
     intros e Sq IH].
