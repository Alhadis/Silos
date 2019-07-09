From iris.proofmode Require Import tactics.
From iris.algebra Require Import vector list.
From lrust.typing Require Export type.
From lrust.typing Require Import own programs cont.
Set Default Proof Using "Type".

Section fn.
  Context `{typeG Σ} {A : Type} {n : nat}.

  Record fn_params := FP { fp_E : lft → elctx; fp_tys : vec type n; fp_ty : type }.

  Definition FP_wf E (tys : vec type n) `{!TyWfLst tys} ty `{!TyWf ty} :=
    FP (λ ϝ, E ϝ ++ tys.(tyl_wf_E) ++ tys.(tyl_outlives_E) ϝ ++
                    ty.(ty_wf_E) ++ ty.(ty_outlives_E) ϝ)
       tys ty.

  (* The other alternative for defining the fn type would be to state
     that the value applied to its parameters is a typed body whose type
     is the return type.
     That would be slightly simpler, but, unfortunately, we are no longer
     able to prove that this is contractive. *)
  Program Definition fn (fp : A → fn_params) : type :=
    {| st_own tid vl := tc_opaque (∃ fb kb xb e H,
         ⌜vl = [@RecV fb (kb::xb) e H]⌝ ∗ ⌜length xb = n⌝ ∗
         ▷ ∀ (x : A) (ϝ : lft) (k : val) (xl : vec val (length xb)),
            □ typed_body ((fp x).(fp_E)  ϝ) [ϝ ⊑ₗ []]
                         [k◁cont([ϝ ⊑ₗ []], λ v : vec _ 1, [v!!!0 ◁ box (fp x).(fp_ty)])]
                         (zip_with (TCtx_hasty ∘ of_val) xl
                                   (box <$> (vec_to_list (fp x).(fp_tys))))
                         (subst_v (fb::kb::xb) (RecV fb (kb::xb) e:::k:::xl) e))%I |}.
  Next Obligation.
    iIntros (fp tid vl) "H". iDestruct "H" as (fb kb xb e ?) "[% _]". by subst.
  Qed.
  Next Obligation.
    unfold tc_opaque. apply _.
  Qed.

  (* FIXME : This definition is less restrictive than the one used in
     Rust. In Rust, the type of parameters are taken into account for
     well-formedness, and all the liftime constrains relating a
     generalized liftime are ignored. For simplicity, we ignore all of
     them, but this is not very faithful. *)
  Global Instance fn_wf fp : TyWf (fn fp) :=
    { ty_lfts := []; ty_wf_E := [] }.

  Global Instance fn_send fp : Send (fn fp).
  Proof. iIntros (tid1 tid2 vl). done. Qed.

  Definition fn_params_rel (ty_rel : relation type) : relation fn_params :=
    λ fp1 fp2,
      Forall2 ty_rel fp2.(fp_tys) fp1.(fp_tys) ∧ ty_rel fp1.(fp_ty) fp2.(fp_ty) ∧
      pointwise_relation lft eq fp1.(fp_E) fp2.(fp_E).

  Global Instance fp_tys_proper R :
    Proper (flip (fn_params_rel R) ==> (Forall2 R : relation (vec _ _))) fp_tys.
  Proof. intros ?? HR. apply HR. Qed.
  Global Instance fp_tys_proper_flip R :
    Proper (fn_params_rel R ==> flip (Forall2 R : relation (vec _ _))) fp_tys.
  Proof. intros ?? HR. apply HR. Qed.

  Global Instance fp_ty_proper R :
    Proper (fn_params_rel R ==> R) fp_ty.
  Proof. intros ?? HR. apply HR. Qed.

  Global Instance fp_E_proper R :
    Proper (fn_params_rel R ==> eq ==> eq) fp_E.
  Proof. intros ?? HR ??->. apply HR. Qed.

  Global Instance FP_proper R :
    Proper (pointwise_relation lft eq ==>
            flip (Forall2 R : relation (vec _ _)) ==> R ==>
            fn_params_rel R) FP.
  Proof. by split; [|split]. Qed.

  Global Instance fn_type_contractive n' :
    Proper (pointwise_relation A (fn_params_rel (type_dist2_later n')) ==>
            type_dist2 n') fn.
  Proof.
    intros fp1 fp2 Hfp. apply ty_of_st_type_ne. destruct n'; first done.
    constructor; unfold ty_own; simpl.
    (* TODO: 'f_equiv' is slow here because reflexivity is slow. *)
    (* The clean way to do this would be to have a metric on type contexts. Oh well. *)
    intros tid vl. unfold typed_body.
    do 12 f_equiv. f_contractive. do 16 ((eapply fp_E_proper; try reflexivity) || exact: Hfp || f_equiv).
    - rewrite !cctx_interp_singleton /=. do 5 f_equiv.
      rewrite !tctx_interp_singleton /tctx_elt_interp /=.
      do 5 f_equiv. apply type_dist2_dist. apply Hfp.
    - rewrite /tctx_interp !big_sepL_zip_with /=. do 4 f_equiv.
      cut (∀ n tid p i, Proper (dist n ==> dist n)
        (λ (l : list type),
            match l !! i with
            | Some ty => tctx_elt_interp tid (p ◁ ty) | None => emp
            end)%I).
      { intros Hprop. apply Hprop, list_fmap_ne; last first.
        - symmetry. eapply Forall2_impl; first apply Hfp. intros.
          apply dist_later_dist, type_dist2_dist_later. done.
        - apply _. }
      clear. intros n tid p i x y. rewrite list_dist_lookup=>/(_ i).
      case _ : (x !! i)=>[tyx|]; case  _ : (y !! i)=>[tyy|];
        inversion_clear 1; [solve_proper|done].
  Qed.

  Global Instance fn_ne n' :
    Proper (pointwise_relation A (fn_params_rel (dist n')) ==> dist n') fn.
  Proof.
    intros ?? Hfp. apply dist_later_dist, type_dist2_dist_later.
    apply fn_type_contractive=>u. split; last split.
    - eapply Forall2_impl; first apply Hfp. intros. simpl.
      apply type_dist_dist2. done.
    - apply type_dist_dist2. apply Hfp.
    - apply Hfp.
  Qed.
End fn.

Arguments fn_params {_ _} _.

(* We use recursive notation for binders as well, to allow patterns
   like '(a, b) to be used. In practice, only one binder is ever used,
   but using recursive binders is the only way to make Coq accept
   patterns. *)
(* FIXME : because of a bug in Coq, such patterns only work for
   printing. Once on 8.6pl1, this should work.  *)
Notation "'fn(∀' x .. x' ',' E ';' T1 ',' .. ',' TN ')' '→' R" :=
  (fn (λ x, (.. (λ x',
      FP_wf E%EL (Vector.cons T1%T .. (Vector.cons TN%T Vector.nil) ..) R%T)..)))
  (at level 99, R at level 200, x binder, x' binder,
   format "'fn(∀'  x .. x' ','  E ';'  T1 ','  .. ','  TN ')'  '→'  R") : lrust_type_scope.
Notation "'fn(∀' x .. x' ',' E ')' '→' R" :=
  (fn (λ x, (.. (λ x', FP_wf E%EL Vector.nil R%T)..)))
  (at level 99, R at level 200, x binder, x' binder,
   format "'fn(∀'  x .. x' ','  E ')'  '→'  R") : lrust_type_scope.
Notation "'fn(' E ';' T1 ',' .. ',' TN ')' '→' R" :=
  (fn (λ _:(), FP_wf E%EL (Vector.cons T1%T .. (Vector.cons TN%T Vector.nil) ..) R%T))
  (at level 99, R at level 200,
   format "'fn(' E ';'  T1 ','  .. ','  TN ')'  '→'  R") : lrust_type_scope.
Notation "'fn(' E ')' '→' R" :=
  (fn (λ _:(), FP_wf E%EL Vector.nil R%T))
  (at level 99, R at level 200,
   format "'fn(' E ')'  '→'  R") : lrust_type_scope.

Instance elctx_empty : Empty (lft → elctx) := λ ϝ, [].

Section typing.
  Context `{typeG Σ}.

  Lemma fn_subtype {A n} E0 L0 (fp fp' : A → fn_params n) :
    (∀ x ϝ, let EE := E0 ++ (fp' x).(fp_E) ϝ in
            elctx_sat EE L0 ((fp x).(fp_E) ϝ) ∧
            Forall2 (subtype EE L0) (fp' x).(fp_tys) (fp x).(fp_tys) ∧
            subtype EE L0 (fp x).(fp_ty) (fp' x).(fp_ty)) →
    subtype E0 L0 (fn fp) (fn fp').
  Proof.
    intros Hcons. apply subtype_simple_type=>//= qL. iIntros "HL0".
    (* We massage things so that we can throw away HL0 before going under the box. *)
    iAssert (∀ x ϝ, let EE := E0 ++ (fp' x).(fp_E) ϝ in □ (elctx_interp EE -∗
                 elctx_interp ((fp x).(fp_E) ϝ) ∗
                 ([∗ list] tys ∈ (zip (fp' x).(fp_tys) (fp x).(fp_tys)), type_incl (tys.1) (tys.2)) ∗
                 type_incl (fp x).(fp_ty) (fp' x).(fp_ty)))%I as "#Hcons".
    { iIntros (x ϝ). destruct (Hcons x ϝ) as (HE &Htys &Hty). clear Hcons.
      iDestruct (HE with "HL0") as "#HE".
      iDestruct (subtype_Forall2_llctx with "HL0") as "#Htys"; first done.
      iDestruct (Hty with "HL0") as "#Hty".
      iClear "∗". iIntros "!# #HEE".
      iSplit; last iSplit.
      - by iApply "HE".
      - by iApply "Htys".
      - by iApply "Hty". }
    iClear "∗". clear Hcons. iIntros "!# #HE0 * Hf".
    iDestruct "Hf" as (fb kb xb e ?) "[% [% #Hf]]". subst.
    iExists fb, kb, xb, e, _. iSplit. done. iSplit. done. iNext.
    rewrite /typed_body. iIntros (x ϝ k xl) "!# * #LFT #HE' Htl HL HC HT".
    iDestruct ("Hcons" with "[$]") as "#(HE & Htys & Hty)".
    iApply ("Hf" with "LFT HE Htl HL [HC] [HT]").
    - unfold cctx_interp. iIntros (elt) "Helt".
      iDestruct "Helt" as %->%elem_of_list_singleton. iIntros (ret) "Htl HL HT".
      unfold cctx_elt_interp.
      iApply ("HC" $! (_ ◁cont(_, _)) with "[%] Htl HL [> -]").
      { by apply elem_of_list_singleton. }
      rewrite /tctx_interp !big_sepL_singleton /=.
      iDestruct "HT" as (v) "[HP Hown]". iExists v. iFrame "HP".
      iDestruct (box_type_incl with "[$Hty]") as "(_ & #Hincl & _)".
      by iApply "Hincl".
    - iClear "Hf". rewrite /tctx_interp
         -{2}(fst_zip (fp x).(fp_tys) (fp' x).(fp_tys)) ?vec_to_list_length //
         -{2}(snd_zip (fp x).(fp_tys) (fp' x).(fp_tys)) ?vec_to_list_length //
         !zip_with_fmap_r !(zip_with_zip (λ _ _, (_ ∘ _) _ _)) !big_sepL_fmap.
      iApply (big_sepL_impl with "HT"). iIntros "!#".
      iIntros (i [p [ty1' ty2']]) "#Hzip H /=".
      iDestruct "H" as (v) "[? Hown]". iExists v. iFrame.
      rewrite !lookup_zip_with.
      iDestruct "Hzip" as %(? & ? & ([? ?] & (? & Hty'1 &
        (? & Hty'2 & [=->->])%bind_Some)%bind_Some & [=->->->])%bind_Some)%bind_Some.
      iDestruct (big_sepL_lookup with "Htys") as "#Hty'".
      { rewrite lookup_zip_with /=. erewrite Hty'2. simpl. by erewrite Hty'1. }
      iDestruct (box_type_incl with "[$Hty']") as "(_ & #Hincl & _)".
      by iApply "Hincl".
  Qed.

  (* This proper and the next can probably not be inferred, but oh well. *)
  Global Instance fn_subtype' {A n} E0 L0 :
    Proper (pointwise_relation A (fn_params_rel (n:=n) (subtype E0 L0)) ==>
            subtype E0 L0) fn.
  Proof.
    intros fp1 fp2 Hfp. apply fn_subtype=>x ϝ. destruct (Hfp x) as (Htys & Hty & HE).
    split; last split.
    - rewrite (HE ϝ). solve_typing.
    - eapply Forall2_impl; first eapply Htys. intros ??.
      eapply subtype_weaken; last done. by apply submseteq_inserts_r.
    - eapply subtype_weaken, Hty; last done. by apply submseteq_inserts_r.
  Qed.

  Global Instance fn_eqtype' {A n} E0 L0 :
    Proper (pointwise_relation A (fn_params_rel (n:=n) (eqtype E0 L0)) ==>
            eqtype E0 L0) fn.
  Proof.
    intros fp1 fp2 Hfp. split; eapply fn_subtype=>x ϝ; destruct (Hfp x) as (Htys & Hty & HE); (split; last split).
    - rewrite (HE ϝ). solve_typing.
    - eapply Forall2_impl; first eapply Htys. intros t1 t2 Ht.
      eapply subtype_weaken; last apply Ht; last done. by apply submseteq_inserts_r.
    - eapply subtype_weaken; last apply Hty; last done. by apply submseteq_inserts_r.
    - rewrite (HE ϝ). solve_typing.
    - symmetry in Htys. eapply Forall2_impl; first eapply Htys. intros t1 t2 Ht.
      eapply subtype_weaken; last apply Ht; last done. by apply submseteq_inserts_r.
    - eapply subtype_weaken; last apply Hty; last done. by apply submseteq_inserts_r.
  Qed.

  Lemma fn_subtype_specialize {A B n} (σ : A → B) E0 L0 fp :
    subtype E0 L0 (fn (n:=n) fp) (fn (fp ∘ σ)).
  Proof.
    apply subtype_simple_type=>//= qL.
    iIntros "_ !# _ * Hf". iDestruct "Hf" as (fb kb xb e ?) "[% [% #Hf]]". subst.
    iExists fb, kb, xb, e, _. iSplit. done. iSplit. done.
    rewrite /typed_body. iNext. iIntros "*". iApply "Hf".
  Qed.

  (* In principle, proving this hard-coded to an empty L would be sufficient --
     but then we would have to require elctx_sat as an Iris assumption. *)
  Lemma type_call_iris' E L (κs : list lft) {A} x (ps : list path) qκs qL tid
        p (k : expr) (fp : A → fn_params (length ps)) :
    (∀ ϝ, elctx_sat (((λ κ, ϝ ⊑ₑ κ) <$> κs) ++ E) L ((fp x).(fp_E) ϝ)) →
    AsVal k →
    lft_ctx -∗ elctx_interp E -∗ na_own tid ⊤ -∗ llctx_interp L qL -∗
    qκs.[lft_intersect_list κs] -∗
    tctx_elt_interp tid (p ◁ fn fp) -∗
    ([∗ list] y ∈ zip_with TCtx_hasty ps (box <$> vec_to_list (fp x).(fp_tys)),
                   tctx_elt_interp tid y) -∗
    (∀ ret, na_own tid top -∗ llctx_interp L qL -∗ qκs.[lft_intersect_list κs] -∗
             (box (fp x).(fp_ty)).(ty_own) tid [ret] -∗
             WP k [of_val ret] {{ _, cont_postcondition }}) -∗
    WP (call: p ps → k) {{ _, cont_postcondition }}.
  Proof.
    iIntros (HE [k' <-]) "#LFT #HE Htl HL Hκs Hf Hargs Hk".
    wp_apply (wp_hasty with "Hf"). iIntros (v) "% Hf".
    iApply (wp_app_vec _ _ (_::_) ((λ v, ⌜v = (λ: ["_r"], (#☠ ;; #☠) ;; k' ["_r"])%V⌝):::
               vmap (λ ty (v : val), tctx_elt_interp tid (v ◁ box ty)) (fp x).(fp_tys))%I
            with "[Hargs]").
    - rewrite /=. iSplitR "Hargs".
      { simpl. iApply wp_value. by unlock. }
      remember (fp_tys (fp x)) as tys. clear dependent k' p HE fp x.
      iInduction ps as [|p ps] "IH" forall (tys); first by simpl.
      simpl in tys. inv_vec tys=>ty tys. simpl.
      iDestruct "Hargs" as "[HT Hargs]". iSplitL "HT".
      + iApply (wp_hasty with "HT"). iIntros (?). rewrite tctx_hasty_val. iIntros "? $".
      + iApply "IH". done.
    - simpl. change (@length expr ps) with (length ps).
      iIntros (vl'). inv_vec vl'=>kv vl; csimpl.
      iIntros "[-> Hvl]". iDestruct "Hf" as (fb kb xb e ?) "[EQ [EQl #Hf]]".
      iDestruct "EQ" as %[=->]. iDestruct "EQl" as %EQl.
      revert vl fp HE. rewrite /= -EQl=>vl fp HE. wp_rec.
      iMod (lft_create with "LFT") as (ϝ) "[Htk #Hinh]"; first done.
      iSpecialize ("Hf" $! x ϝ _ vl). iDestruct (HE ϝ with "HL") as "#HE'".
      iMod (bor_create _ ϝ with "LFT Hκs") as "[Hκs HκsI]"; first done.
      iDestruct (frac_bor_lft_incl with "LFT [>Hκs]") as "#Hκs".
      { iApply (bor_fracture with "LFT"); first done. by rewrite Qp_mult_1_r. }
      iApply ("Hf" with "LFT [] Htl [Htk] [Hk HκsI HL]").
      + iApply "HE'". iIntros "{$# Hf Hinh HE' LFT HE %}".
        iInduction κs as [|κ κs] "IH"=> //=. iSplitL.
        { iApply lft_incl_trans; first done. iApply lft_intersect_incl_l. }
        iApply "IH". iAlways. iApply lft_incl_trans; first done.
        iApply lft_intersect_incl_r.
      + iSplitL; last done. iExists ϝ. iSplit; first by rewrite /= left_id.
        iFrame "#∗".
      + iIntros (y) "IN". iDestruct "IN" as %->%elem_of_list_singleton.
        iIntros (args) "Htl [Hϝ _] [Hret _]". inv_vec args=>r.
        iDestruct "Hϝ" as  (κ') "(EQ & Htk & _)". iDestruct "EQ" as %EQ.
        rewrite /= left_id in EQ. subst κ'. simpl. wp_rec. wp_bind Endlft.
        iSpecialize ("Hinh" with "Htk"). iClear "Hκs".
        iApply (wp_mask_mono _ (↑lftN)); first done.
        iApply (wp_step_fupd with "Hinh"); [solve_ndisj..|]. wp_seq.
        iIntros "#Htok !>". wp_seq. iMod ("HκsI" with "Htok") as ">Hκs".
        iApply ("Hk" with "Htl HL Hκs"). rewrite tctx_hasty_val. done.
      + rewrite /tctx_interp vec_to_list_map !zip_with_fmap_r
                (zip_with_zip (λ v ty, (v, _))) zip_with_zip !big_sepL_fmap.
        iApply (big_sepL_mono' with "Hvl"); last done. by iIntros (i [v ty']).
  Qed.

  Lemma type_call_iris E (κs : list lft) {A} x (ps : list path) qκs tid
        f (k : expr) (fp : A → fn_params (length ps)) :
    (∀ ϝ, elctx_sat (((λ κ, ϝ ⊑ₑ κ) <$> κs) ++ E) [] ((fp x).(fp_E) ϝ)) →
    AsVal k →
    lft_ctx -∗ elctx_interp E -∗ na_own tid ⊤ -∗
    qκs.[lft_intersect_list κs] -∗
    (fn fp).(ty_own) tid [f] -∗
    ([∗ list] y ∈ zip_with TCtx_hasty ps (box <$> vec_to_list (fp x).(fp_tys)),
                   tctx_elt_interp tid y) -∗
    (∀ ret, na_own tid top -∗ qκs.[lft_intersect_list κs] -∗
             (box (fp x).(fp_ty)).(ty_own) tid [ret] -∗
             WP k [of_val ret] {{ _, cont_postcondition }}) -∗
    WP (call: f ps → k) {{ _, cont_postcondition }}.
  Proof.
    iIntros (HE Hk') "#LFT #HE Htl Hκs Hf Hargs Hk". rewrite -tctx_hasty_val.
    iApply (type_call_iris' with "LFT HE Htl [] Hκs Hf Hargs [Hk]"); [done..| |].
    - instantiate (1 := 1%Qp). by rewrite /llctx_interp.
    - iIntros "* Htl _". iApply "Hk". done.
  Qed.

  Lemma type_call' E L (κs : list lft) T p (ps : list path)
                   {A} (fp : A → fn_params (length ps)) (k : val) x :
    Forall (lctx_lft_alive E L) κs →
    (∀ ϝ, elctx_sat (((λ κ, ϝ ⊑ₑ κ) <$> κs) ++ E) L ((fp x).(fp_E) ϝ)) →
    typed_body E L [k ◁cont(L, λ v : vec _ 1, (v!!!0 ◁ box (fp x).(fp_ty)) :: T)]
               ((p ◁ fn fp) ::
                zip_with TCtx_hasty ps (box <$> vec_to_list (fp x).(fp_tys)) ++
                T)
               (call: p ps → k).
  Proof.
    iIntros (Hκs HE tid) "#LFT #HE Htl HL HC (Hf & Hargs & HT)".
    iMod (lctx_lft_alive_tok_list _ _ κs with "HE HL") as (q) "(Hκs & HL & Hclose)"; [done..|].
    iApply (type_call_iris' with "LFT HE Htl HL Hκs Hf Hargs"); [done|].
    iIntros (r) "Htl HL Hκs Hret". iMod ("Hclose" with "Hκs HL") as "HL".
    iSpecialize ("HC" with "[]"); first by (iPureIntro; apply elem_of_list_singleton).
    iApply ("HC" $! [#r] with "Htl HL").
    rewrite tctx_interp_cons tctx_hasty_val. iFrame.
  Qed.

  (* Specialized type_call':  Adapted for use by solve_typing; fixed "list of
     alive lifetimes" to be the local ones. *)
  Lemma type_call {A} x E L C T T' T'' p (ps : list path)
                        (fp : A → fn_params (length ps)) k :
    p ◁ fn fp ∈ T →
    Forall (lctx_lft_alive E L) (L.*1) →
    (∀ ϝ, elctx_sat (((λ κ, ϝ ⊑ₑ κ) <$> (L.*1)) ++ E) L ((fp x).(fp_E) ϝ)) →
    tctx_extract_ctx E L (zip_with TCtx_hasty ps
                                   (box <$> vec_to_list (fp x).(fp_tys))) T T' →
    k ◁cont(L, T'') ∈ C →
    (∀ ret : val, tctx_incl E L ((ret ◁ box (fp x).(fp_ty))::T') (T'' [# ret])) →
    typed_body E L C T (call: p ps → k).
  Proof.
    intros Hfn HL HE HTT' HC HT'T''.
    rewrite -typed_body_mono /flip; last done; first by eapply type_call'.
    - etrans. eapply (incl_cctx_incl _ [_]); first by intros ? ->%elem_of_list_singleton.
      apply cctx_incl_cons_match; first done. intros args. by inv_vec args.
    - etrans; last by apply (tctx_incl_frame_l [_]).
      apply copy_elem_of_tctx_incl; last done. apply _.
  Qed.

  Lemma type_letcall {A} x E L C T T' p (ps : list path)
                        (fp : A → fn_params (length ps)) b e :
    Closed (b :b: []) e → Closed [] p → Forall (Closed []) ps →
    p ◁ fn fp ∈ T →
    Forall (lctx_lft_alive E L) (L.*1) →
    (∀ ϝ, elctx_sat (((λ κ, ϝ ⊑ₑ κ) <$> (L.*1)) ++ E) L ((fp x).(fp_E) ϝ)) →
    tctx_extract_ctx E L (zip_with TCtx_hasty ps
                                   (box <$> vec_to_list (fp x).(fp_tys))) T T' →
    (∀ ret : val, typed_body E L C ((ret ◁ box (fp x).(fp_ty))::T') (subst' b ret e)) -∗
    typed_body E L C T (letcall: b := p ps in e).
  Proof.
    iIntros (?? Hpsc ????) "He".
    iApply (type_cont_norec [_] _ (λ r, (r!!!0 ◁ box (fp x).(fp_ty)) :: T')).
    - (* TODO : make [solve_closed] work here. *)
      eapply is_closed_weaken; first done. set_solver+.
    - (* TODO : make [solve_closed] work here. *)
      rewrite /Closed /= !andb_True. split.
      + by eapply is_closed_weaken, list_subseteq_nil.
      + eapply Is_true_eq_left, forallb_forall, List.Forall_forall, Forall_impl=>//.
        intros. eapply Is_true_eq_true, is_closed_weaken=>//. set_solver+.
    - iIntros (k).
      (* TODO : make [simpl_subst] work here. *)
      change (subst' "_k" k (p ((λ: ["_r"], (#☠ ;; #☠) ;; "_k" ["_r"])%E :: ps))) with
             ((subst "_k" k p) ((λ: ["_r"], (#☠ ;; #☠) ;; k ["_r"])%E :: map (subst "_k" k) ps)).
      rewrite is_closed_nil_subst //.
      assert (map (subst "_k" k) ps = ps) as ->.
      { clear -Hpsc. induction Hpsc=>//=. rewrite is_closed_nil_subst //. congruence. }
      iApply type_call; try done. constructor. done.
    - simpl. iIntros (k ret). inv_vec ret=>ret. rewrite /subst_v /=.
      rewrite ->(is_closed_subst []); last set_solver+; last first.
      { apply subst'_is_closed; last done. apply is_closed_of_val. }
      (iApply typed_body_mono; last by iApply "He"); [|done..].
      apply incl_cctx_incl. set_solver+.
  Qed.

  Lemma type_rec {A} E L fb (argsb : list binder) ef e n
        (fp : A → fn_params n) T `{!CopyC T, !SendC T, Closed _ e} :
    IntoVal ef (funrec: fb argsb := e) →
    n = length argsb →
    □ (∀ x ϝ (f : val) k (args : vec val (length argsb)),
          typed_body ((fp x).(fp_E) ϝ) [ϝ ⊑ₗ []]
                     [k ◁cont([ϝ ⊑ₗ []], λ v : vec _ 1, [v!!!0 ◁ box (fp x).(fp_ty)])]
                     ((f ◁ fn fp) ::
                        zip_with (TCtx_hasty ∘ of_val) args
                                 (box <$> vec_to_list (fp x).(fp_tys)) ++ T)
                     (subst_v (fb :: BNamed "return" :: argsb) (f ::: k ::: args) e)) -∗
    typed_instruction_ty E L T ef (fn fp).
  Proof.
    iIntros (<- ->) "#Hbody /=". iIntros (tid) "#LFT _ $ $ #HT". iApply wp_value.
    rewrite tctx_interp_singleton. iLöb as "IH". iExists _. iSplit.
    { simpl. rewrite decide_left. done. }
    iExists fb, _, argsb, e, _. iSplit. done. iSplit. done. iNext.
    iIntros (x ϝ k args) "!#". iIntros (tid') "_ HE Htl HL HC HT'".
    iApply ("Hbody" with "LFT HE Htl HL HC").
    rewrite tctx_interp_cons tctx_interp_app. iFrame "HT' IH".
    by iApply sendc_change_tid.
  Qed.

  Lemma type_fn {A} E L (argsb : list binder) ef e n
        (fp : A → fn_params n) T `{!CopyC T, !SendC T, Closed _ e} :
    IntoVal ef (funrec: <> argsb := e) →
    n = length argsb →
    □ (∀ x ϝ k (args : vec val (length argsb)),
        typed_body ((fp x).(fp_E) ϝ) [ϝ ⊑ₗ []]
                   [k ◁cont([ϝ ⊑ₗ []], λ v : vec _ 1, [v!!!0 ◁ box (fp x).(fp_ty)])]
                   (zip_with (TCtx_hasty ∘ of_val) args
                             (box <$> vec_to_list (fp x).(fp_tys)) ++ T)
                   (subst_v (BNamed "return" :: argsb) (k ::: args) e)) -∗
    typed_instruction_ty E L T ef (fn fp).
  Proof.
    iIntros (??) "#He". iApply type_rec; try done. iIntros "!# *".
    iApply typed_body_mono; last iApply "He"; try done.
    eapply contains_tctx_incl. by constructor.
  Qed.
End typing.

Hint Resolve fn_subtype : lrust_typing.
