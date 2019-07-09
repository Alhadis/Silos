Inductive Functional {A B} : list (A * B) -> Prop :=
  | empty_fn : Functional nil
  | extend_fn : `{Functional l -> Unmapped l a -> Functional ((a,b)::l)}.
Hint Constructors Functional.

Lemma in_functional_mapsto : forall A B (eq_dec : dec_type A) (l : list (A * B)) (F : Functional l)
                                    a b (H : In (a,b) l), MapsTo l a b.
Proof.
  induction l as [|(a,b) l' IH];
  intros F a' b' H; inversion H;[ (* finishes base case *)
    inject_pair; subst; constructor; auto
  |inversion F as [|? ? ? Hfun Hunmapped]; subst;
   destruct (eq_dec a a'); [subst; contradict Hunmapped; apply in_not_unmapped with (b:=b')
                           |constructor]]; auto.
Qed.

Remark functional_exchange : forall A B (l : list (A * B)) a b (F: Functional ((a,b)::l)) b', Functional ((a,b')::l).
Proof. intros; inversion F; crush. Qed.

Lemma functional_join : `{Functional l -> Functional (list_join eq_dec combine base l' a c l)}.
Proof.
  induction l as [|(a,b) l_ IH]; simpl;
  [intros; repeat constructor
  |intros l' a' c F].
  destruct (eq_dec a' a) as [Heq|Hneq];
  [subst; apply functional_exchange with (b := b)
  |constructor; inversion F; [apply IH|apply unmapped_join]]; auto.
Qed.

(*
  
Lemma unmapped_join2 : forall l a a' b c l'
                             (Hcontain : (forall a c, in_list_list l a c -> in_list_list l' a c)
                                          \/ (b = (base l' c))),
                        Unmapped l a' ->
                        MapsTo (list_join eq_dec combine base l' a c l) a' b ->
                        (b = (base l' c)) /\ a = a'.
Proof.
  induction l as [|(a_,b_) l_ IH];
  simpl; intros a a' b c l' Hcontain Hunmap Hmap;
  [inversion Hmap as [|? ? ? ? ? ? Hbad]; subst; split; solve [auto|reflexivity|inversion Hbad]
  |].
  destruct (eq_dec a a_) as [Heq | Hneq];
    [inversion Hunmap as [|? ? ? ? Hunmap' Hneq]; subst;
     inversion Hmap as [|? ? ? ? ? ? Hbad]; split; try solve [reflexivity|
                                             rewrite unmapped_not_mapped in Hunmap';
                                             [apply Hunmap' in Hbad; contradiction
                                             |auto]]
    |].
  inversion Hmap as [|? ? ? ? ? ? Hbad]; subst; contradict Hneq; auto.
  apply IH with (b := b) (c := c) (l' := l').
  inversion Hcontain as [L|R].
  specialize L with a_ b_
  intros a_' c_' Hin; inversion Hin as [bs_ [Hmap_ Hsetin_]];
  apply Hcontain; destruct (eq_dec a_' a_) as [Heq_|Hneq_];
  [subst
    |exists bs_; repeat constructor]; auto.
  unfold in_list_list.
  Focus 2.
  
    [intros a_' c_' Hin
    |inversion Hunmap
    |]; auto.

; 
  inversion Hmap; [(* a_' = a_ *)
                   rewrite unmapped_not_mapped in Hunmap; [
                    (* rewritten *)
                    subst; match goal with [bad : ?a <> ?a |- _] => contradict bad; auto end
                    |(* satisfy hyp *)assumption]
                   |subst]. 
  Check unmapped_not_mapped.
                       
   [specialize Hunmap with b; contradict Hunmap; constructor
   |assumption
   |
   |assumption].
  .
  ; constructor; auto | auto].
    

 subst; repeat constructor|]
  constructor.
Qed.
Admitted.*)

(*
Require Import Setoid.


Lemma no_longer_tail_replacement : forall κ κ' κ'' κmore,
                                     length κmore > 0 ->
                                     ~ Tail_replacement κ (κmore ++ κ) κ' κ''.
Proof.
  induction κ as [|φ κ_].
  intros; intro bad; inversion bad; rewrite app_nil_r in H2; contradict H; subst; simpl; omega.
  intros; intro bad; inversion bad; subst.
  apply no_circular_app in H2; [contradiction|assumption].
  assert (~ Tail_replacement κ_ ((κmore ++ [φ]) ++ κ_) κ' κ''').
  apply IHκ_ with (κmore := κmore ++ [φ]).
  rewrite app_length; omega.
  rewrite app_assoc_reverse in H0; simpl in H0; contradiction.
Qed.

Lemma replace_is_replacement : forall κ κ' κ'' κ''',
                       (Tail_replacement κ κ' κ'' κ''' <-> replacetail_kont κ κ' κ'' = Some κ''').
Proof.
  induction κ as [|φ κ_ IH];
  [(* base case *)
  intros; inversion H; subst; split; intro H'; inversion H'; subst; simpl; constructor; auto
  |
  intros; inversion H; subst; split; intro H';
  [(* inversion case 1, first split *)
  inversion H' as [| foo bar baz qux boo baa]; subst; unfold replacetail_kont; split_refl kont_eq_dec (φ :: κ_);
    inversion baa; [match goal with [B : ?k = ?f :: ?k |- _] => apply no_circular_cons in B; contradiction end
                 |subst;apply no_longer_tail_replacement with (κmore := [φ]) in baa; [contradiction|simpl;omega]]
  (* second split *)
  |unfold replacetail_kont in H'; split_refl kont_eq_dec (φ :: κ_);
  injection H'; intros; subst; constructor; auto
  (* inversion case 2, first split *)
  |inversion H'; subst;
   [unfold replacetail_kont; split_refl kont_eq_dec (φ0 :: κ'0)
   |rewrite IH in H6;
   apply kont_tail_cons in H; auto]
  |]].

  unfold replacetail_kont; fold replacetail_kont; rewrite H6;
  destruct (kont_eq_dec (φ :: κ_) (φ0 :: κ'0)) as [Heq | Hneq];
    [inversion H0; subst;
     [apply no_circular_app with (l := [φ0]) in Heq; [contradiction|simpl;omega]
     |injection Heq; intros; subst;
      assert (bad : replacetail_kont (φ1 :: κ') (φ0 :: φ1 :: κ') κ'' = None) by
          (apply no_longer_tail_replacement2 with (κmore := [φ0]); simpl; auto);
      rewrite bad in H6; discriminate]
    |auto].

  unfold replacetail_kont in H'; fold replacetail_kont in H'.
  destruct (kont_eq_dec (φ :: κ_) (φ0 :: κ'0)) as [Heq | Hneq];
    [injection H'; injection Heq; intros; subst; constructor
    |].
  
  assert (R : exists κ''_, (replacetail_kont κ_ (φ0 :: κ'0) κ'') = Some κ''_).
  destruct (replacetail_kont κ_ (φ0 :: κ'0) κ'') as [κ''_|];
    [injection H';intros;subst; exists κ''_; auto
    |discriminate].
  destruct R as [κ''_ repeq].
  assert (R' : φ :: κ''_ = κ''').
  destruct (replacetail_kont κ_ (φ0 :: κ'0) κ'') as [κ''__|];
    [injection H'; injection repeq; intros; subst; auto
    |discriminate].
  rewrite <- R'.
  apply push_replacement.
  rewrite <- IH in repeq; [| apply kont_tail_cons in H]; auto.
Qed.
*)  

(* inv_invariant *)
(*
  intros s s' Hinv Hord Hstep.
  inversion Hord as [? ? ? ? ? Mord Kord ctxord];
  inversion Hinv as [? ? ? ? ? Hdom tκctx Φ seq]; subst; injection seq; intros; subst; clear seq.
  Ltac doinvert Un κ tκ φ H ctx Hin :=
    inversion Un as [|κ tκ φ H|ctx tκ κ H Hin];
    try (set (ctx := (context (var 0) (@nil (Name * Addr)) (@nil (Addr * AbsVal))));
         set (Hin := 0)).
  Ltac noinvert Un κ tκ φ H ctx Hin := set (κ := (@nil Frame));
                                       set (tκ := mt);
                                       set (φ := (ar (var 0) (@nil (Name * Addr))));
                                       set (H := 0);
                                       set (ctx := (context (var 0) (@nil (Name * Addr)) (@nil (Addr * AbsVal))));
                                       set (Hin := 0).
  Ltac part1 ctx tκctx := apply inv; try solve [apply unroll_push; auto
                           |repeat constructor; auto
                           |auto
                           |apply Dom_join_left; firstorder
                           |apply Dom_join_right; firstorder
                           |intros blah blorg; apply tκctx; inversion blorg; subst; auto
                           |inversion Hctx; subst; try solve [discriminate
                                                              |constructor; auto
                                                             |auto]].
  set (idκ := fun κ : Kont => κ).
  Ltac part2 p Φ M Ξ inpoint fnκ trypop :=
    let κ' := fresh "κ'" in
    let κ'' := fresh "κ''" in
    let φ := fresh "φ" in
    intros [ce cρ cσ ct] Hindom tκ' Hinctx;
    constructor;
    [(* reach *)
      destruct (Φ (context ce cρ cσ ct) Hindom tκ') as [Hreach Hmemo]; auto;
     subst p; auto;
     intros κ' unroll'; pose (Hreach' := Hreach κ' unroll'); destruct Hreach' as [κ [eunroll [t' [t'' [π HT]]]]];
     ((trypop;
       match goal with
           [H : StackUnroll Ξ ?κ (kpush (ar ?e ?ρ) ?tκ) |- _] =>
           pose (φ := (ar e ρ)); inversion H as [|κ''|]
       | [H : StackUnroll Ξ ?κ (kpush (fn ?v) ?tκ) |- _] =>
         pose (φ := (fn v)); inversion H as [|κ''|]
       end;
       exists (fnκ κ κ'' φ))
        || exists (fnκ κ));
      split; [|exists t', (tick inpoint)];
     [|exists (shell inpoint κ t'' :: π)]; subst; repeat constructor; auto
    |(* memo *)
    let v := fresh "v" in
    intros v σ'' t' Hmemo;
      assert (HindomM : InDom M (context ce cρ cσ ct)) by
        (destruct Hmemo as [ress [Hmapress Hinress]]; rewrite InDom_is_mapped; [exists ress|exact context_eq_dec]; auto);
      assert (HindomΞ : InDom Ξ (context ce cρ cσ ct)) by (apply Dom_InDom with (l := M); [exact context_eq_dec| | ]; auto);
      destruct (Φ (context ce cρ cσ ct) HindomΞ tκ'); auto]. 

  inversion Hstep as [x ρ σ a tκs ts Ms Ξs ps Hmap Hpeq Hs'eq |
                      e0 e1 ρ σ tκs ts Ms Ξs ps Hpeq |
                      x e ρ σ tκs ts Ms Ξs ps Hpeq Hs'eq |
                      v σ e ρ tκs ts Ms Ξs ps Hpeq Hs'eq |
                      v σ x e ρ fnv tκs ts Ms Ξs ps Hin_force Hpeq Hs'eq |
                      x e ρ v σ tκs ts Ms Ξs ps a ρ' σ' ts' ctx Hunmapped Hpeq Hs'eq |
                      x e ρ v σ tκs ts Ms Ξs vm σm tm ps a ρ' σ' ctx Hinmemos Hpeq Hs'eq |
                      v σ ctx tκs Ms Ξs t's M's Hin_ctxs Hpeq Hs'eq]; subst;
  [(* var: ε *)
    constructor; auto; part2 p Φ M Ξ (ev (var x) ρ σ) idκ fail
   |(* app: push *)
   constructor; auto;
   [(* ctx_in_dom *)
     intros ctx Hctx; destruct (tκctx ctx); inversion Hctx; auto
    |part2 p Φ M Ξ (ev (app e0 e1) ρ σ) (fun (κ : Kont) => (ar e1 ρ :: κ)) fail]
   |(* lam: ε *)
    constructor; auto; part2 p Φ M Ξ (ev (lam x e) ρ σ) idκ fail
   |(* ar : exchange *)
    constructor; auto;
    [intros ctx Hctx; destruct (tκctx ctx) as [X]; inversion Hctx; subst; [constructor|exists X]; auto
    |part2 p Φ M Ξ (co v σ) (fun (κ κ' : Kont) (φ : Frame) => (fn v :: κ')) idtac]
   |(* fn -> ap : pop *)
   constructor; auto;
    [intros ctx Hctx; destruct (tκctx ctx) as [X]; inversion Hctx; subst;
     solve [constructor; auto | exists X; auto]
    |part2 p Φ M Ξ (co v σ) (fun (κ κ' : Kont) (φ : Frame) => κ') idtac]
   |(* do ap : ε *)
   constructor; auto
   |(* ap memo : ? *)
   |(* ret: pop *)].

  apply Dom_join_right; firstorder.
  intros ctx' Hctx'; inversion Hctx'; subst; try solve [discriminate
                                                              |constructor; auto
                                                             |auto].

  destruct (in_list_join context_eq_dec
                         κs_join
                         κ_singleton
                         κs_join_extensive
                         κ_singleton_extensive
                         Ξ Ξ
                         (context e ρ' σ' ts')
                         tκ
                         (fun (ab : Context * TrunKonts) (H : In ab Ξ) => H)) as [omg [? ?]];
    exists omg; apply MapsTo_In; auto.
    let κ' := fresh "κ'" in
    let κ'' := fresh "κ''" in
    let φ := fresh "φ" in
    intros [ce cρ cσ ct] Hindom tκ' Hinctx;
    constructor.
    (* reach *)
    intros κ' unroll';
    destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec Ξ Ξ ctx tκ Hinctx) as [[ctxeq tκeq]|Hinrest];
    [subst; injection ctxeq; intros; subst ce cρ cσ ct;
     exists κ'; split;[apply unroll_rt with (tκ := tκ'); auto |exists ts',ts',nil; constructor]
    |assert (Hneed : InDom Ξ (context ce cρ cσ ct)) by
        (destruct Hinrest as [tκs [Hmap ?]]; rewrite InDom_is_mapped; [exists tκs|exact context_eq_dec]; auto);
      destruct (Φ (context ce cρ cσ ct) Hneed tκ') as [Hreach Hmemo]; auto].                              
    .
(* Stuck *)
    destruct Hreach as 
    [(* reach *)
      
      
     subst p; auto;
     intros κ' unroll'; pose (Hreach' := Hreach κ' unroll'); destruct Hreach' as [κ [t' [t'' [eunroll [π HT]]]]];
     exists (rt ctx);
     exists t', (tick (ap x e ρ v σ)); split;
     [|exists (shell (ap x e ρ v σ) κ t'' :: π)]; subst; repeat constructor; auto
    |(* memo *)
    let v := fresh "v" in
    intros v σ'' t' Hmemo;
      assert (HindomM : InDom M (context ce cρ cσ ct)) by
        (destruct Hmemo as [ress [Hmapress Hinress]]; rewrite InDom_is_mapped; [exists ress|exact context_eq_dec]; auto);
      assert (HindomΞ : InDom Ξ (context ce cρ cσ ct)) by (apply Dom_InDom with (l := M); [exact context_eq_dec| | ]; auto);
      destruct (Φ (context ce cρ cσ ct) HindomΞ tκ'); auto]. 

  part2 p Φ M Ξ (ap x e ρ v σ) (fun (κ κ' : Kont) (φ : Frame) => (rt ctx)) fail.
                         (*                          (l := Ξ) (l' := Ξ)

(a := (context e ρ' σ' ts'))
                         (c := tκ) *)). forall l l' a c,
    (forall ab, In ab l -> In ab l') ->
  in_list_list (list_join eq_dec combine base l' a c l) a c.


  unfold
  apply in_list_join.
  apply Dom_in_D
    constructor; auto; part2 p Φ M Ξ (ap x e ρ v σ) idκ fail
  .
    
  part2 p Φ M Ξ (ev (app e0 e1) ρ σ) (fun (κ κ' : Kont) (φ : Frame) => (ar e1 ρ :: κ')) idtac.

  constructor; auto.
  intros ctx Hctx; destruct (tκctx ctx) as [X]; inversion Hctx; subst; [constructor|exists X];auto.
  intros [ce cρ cσ ct] Hindom tκ' Hinctx;
    constructor;
    [(* reach *)
      destruct (Φ (context ce cρ cσ ct) blarg tκ') as [Hreach Hmemo]; auto;
     subst p; auto;
     intros κ' unroll'; pose (Hreach' := Hreach κ' unroll'); destruct Hreach' as [κ [t' [t'' [eunroll [π HT]]]]]
     |].
     ;
     exists (fnκ κ), t', (tick inpoint); split;
     [|exists (shell inpoint κ t'' :: π)]; repeat constructor; auto
    |(* memo *)
    let v := fresh "v" in
    intros v σ'' t' Hmemo;
      assert (HindomM : InDom M (context ce cρ cσ ct)) by
        (destruct Hmemo as [ress [Hmapress Hinress]]; rewrite InDom_is_mapped; [exists ress|exact context_eq_dec]; auto);
      assert (HindomΞ : InDom Ξ (context ce cρ cσ ct)) by (apply Dom_InDom with (l := M); [exact context_eq_dec| | ]; auto);
      destruct (Φ (context ce cρ cσ ct) HindomΞ tκ'); auto]. 

  part2 p Φ M Ξ (co v σ) (fun κ => (fn v :: κ)).

  Ltac solve_inner point t reach :=
    let tκ' := fresh "tκ'" in
    let cκ := fresh "cκ" in
    let cunroll := fresh "cunroll" in
    let creach := fresh "creach" in
    let cmemo := fresh "cmemo" in
    let t'_ := fresh "t'_" in
    let π := fresh "π" in
    let chκ := fresh "chκ" in
    let cH := fresh "cH" in
    split; [assumption
           |split;[intros chκ cH; destruct (reach chκ) as [t'_ [π ?]];
                   try solve [auto | constructor; auto];
                   exists t'_;
                   exists (Cons (shell point chκ t) π);
                   constructor; [assumption
                                |compute; rewrite <- comparable_ticks with (κ := chκ);
                                 solve [repeat constructor; auto | auto]]
                  |]];
    repeat constructor; auto.
  (* Var lookup *)
  subst; part1 (context ce cρ cσ) tκctx. 
  intro tκ'; destruct (Hctx tκ') as [cκ [cunroll [creach cmemo]]];
  exists cκ; solve_inner (ev (var x) ρ σ) t creach.
  intros [cce ccρ ccσ] ccH; pose (Φinst := Φ (context cce ccρ ccσ) ccH); simpl in Φinst.
  intro tκ'; destruct (Φinst tκ') as [κ' [un' [reach' memo']]];
  exists κ'; solve_inner (ev (var x) ρ σ) t reach'.
  (* function eval *)
  subst; part1 (context ce cρ cσ) tκctx.
  intro tκ'; destruct (Hctx (kpush (ar e1 ρ) tκ')) as [cκ [cunroll [creach cmemo]]].
  exists cκ_;
    split; [assumption
           |split;[intros chκ cH
                                                            |]].
  destruct (creach ((ar e1 ρ)::cκ_)) as [t'_ [π ?]]
    inversion cH; subst; auto.
                   try solve [auto | constructor; auto];


 solve_inner (ev (app e0 e1) ρ σ) t creach.
  
  destruct ctx
  inversion Hctx; subst; try solve [discriminate
                                                              |constructor; auto
                                                             |auto].
 part2 Φ mumble t idκ; repeat split; auto.
    let κ_ := fresh "κ_" in
    let Hunroll_ := fresh "Hunroll_" in    
    repeat split; auto;
    intros κ_ Hunroll_;
    inversion Hunroll_ as [|κ__ ? ? Hu__|]; subst;
    destruct (mumble κ__) as [t'_ [π Φreach_path]]; auto;
    exists t'_;
        exists (Cons (shell (ev (app e0 e1) ρ σ) κ__ t) π);
        constructor; [assumption|
                      compute;
                        rewrite <- (comparable_ticks _ _ _ (κ := κ__));
                        solve [constructor; auto
                              |auto]].
  (* lam *)
  subst; part1; part2 Φ mumble t idκ; repeat split; auto.
    let κ_ := fresh "κ_" in
    let Hunroll_ := fresh "Hunroll_" in    
    repeat split; auto;
    intros κ_ Hunroll_;
    destruct (mumble κ_) as [t'_ [π Φreach_path]]; auto;
    exists t'_;
        exists (Cons (shell (ev (lam x e) ρ σ) κ_ t) π);
        constructor; [assumption|
                      compute;
                        rewrite <- (comparable_ticks _ _ _ (κ := κ_));
                        solve [constructor; auto
                              |auto]].  
  (* evaluated fn, now arg eval *)
    subst; part1; part2 Φ mumble t idκ; repeat split; auto;
    let κ_ := fresh "κ_" in
    let Hunroll_ := fresh "Hunroll_" in    
    repeat split; auto;
    intros κ_ Hunroll_;
    inversion Hunroll_ as [|κ__|]; subst;
    destruct (mumble ((ar e ρ)::κ__)) as [t'_ [π Φreach_path]];
      [constructor|];auto;
    exists t'_;
        exists (Cons (shell (co v σ) ((ar e ρ)::κ__) t) π);
        constructor; [assumption
                     |compute; rewrite <- (comparable_ticks _ _ _ (κ := ((ar e ρ)::κ__)));
                      solve [constructor; auto | auto]].
  (* fn -> ap *)
    subst; part1; part2 Φ mumble t idκ; repeat split; auto.
    let κ_ := fresh "κ_" in
    let Hunroll_ := fresh "Hunroll_" in    
    repeat split; auto;
    intros κ_ Hunroll_;
    destruct (mumble ((fn fnv)::κ_)) as [t'_ [π Φreach_path]];
    [constructor|]; auto;
    exists t'_;
        exists (Cons (shell (co v σ) ((fn fnv)::κ_) t) π);
        constructor; [assumption|
                      compute;
                        rewrite <- (comparable_ticks _ _ _ (κ := ((fn fnv)::κ_)));
                        solve [constructor; auto
                              |auto]].
  (* do unmemoized ap *)
    part1.
    constructor.
    destruct in_list_join with (eq_dec := context_eq_dec) (combine := κs_join) (base := κ_singleton)
                                                          (l := Ξ) (l' := Ξ) (a := ctx) (c := tκ)
                                                          as [κs [? ?]];
      [intros; apply set_add_intro2
       |intros; simpl
       |
      |exists κs;apply MapsTo_In]; auto.    
    let e' := fresh "e'" in
    let ρ'' := fresh "ρ''" in
    let σ'' := fresh "σ''" in
    let tκ' := fresh "tκ'" in
    let κ' := fresh "κ'" in
    let Htκ' := fresh "Htκ'" in
    let Hunroll:= fresh "Hunroll" in
    intros e' ρ'' σ'' tκ' Htκ'.
    destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec)
    with (l := Ξ) (l' := Ξ) (a := ctx) (a' := (context e' ρ'' σ'')) (c := tκ) (c' := tκ')
                  as [[? ?]|ble];
      [unfold in_ctxs in Htκ'; auto
      |(* considered context is the one we extended Ξ with *)
      subst ctx;
        match goal with [H : (context ?uu ?vv ?hh) = (context ?ww ?xx ?yy) |- _] =>
                        injection H; intros aaa bbb ccc; subst ww xx yy end
      |].
    inversion Hctx as [HH|? ? HH|? HH].
    (* mt case *)
    assert (R : tκ' = mt) by congruence; rewrite R.
    exists nil; repeat constructor; auto.
    subst p.
    pose (mar := Φ e ρ' σ' tκ').
    
    
match goal with [H' : mt = t
    destruct (Φ e ρ' σ' tκ0) as [stuff boo].
    injection H3; intros aaa bbb ccc; subst e' ρ'' σ''.
    
    [apply in_list_join2
      |
      |].

    

    Check in_list_join_split.
    destruct (in_list_join_split context_eq_dec κs_join κ_singleton) with
      (l := Ξ)
      (l' := Ξ)
      (a := ctx)
      (a' := (context e' ρ'' σ''))
      (c := tκ)
      (c' := tκ') as [S0|[S1|S2]]; auto.
    destruct (Φ e' ρ'' σ'' tκ' S0) as [κseen [seenunroll [seenreach seenmemo]]].
    exists κseen; repeat split;
    [apply unroll_with_extension
    |intros κreach reachunroll
    |]; auto.


; specialize seenreach with κreach
 [intros;  | ]; auto.
.: forall l l' a a' c c'
                             (Hcontain : (forall ab, In ab l -> In ab l')),
    
    destruct Φrinst as [κ' [Hunroll [Φreach Φmemo]]].
    exists (κfn1 κ').


 part2 Φ mumble t idκ; repeat split; auto.
  Focus 3.
  (* return and memoize *)
  inversion Htail as [| | ? ? ? Hunroll Hctxin]; subst;
  [discriminate
  |discriminate
  |match goal with [H : rt ?ctx0 = rt ctx |- _] => injection H; intros; subst end].
  destruct ctx as [e_ ρ_ σ_];
    destruct (Φ e_ ρ_ σ_ tκ' Hin_ctxs) as [κ' [? [? ?]]].

  apply (inv (κ := κ')); try solve [apply unroll_push; auto
                                  |constructor; auto
                                  |auto
                                  |apply Dom_join_left; firstorder].
  intros e'' ρ'' σ'' tκ'' Htκ'';
    pose (Φrinst := (Φ e'' ρ'' σ'' tκ'' Htκ''));
    destruct Φrinst as [κ'' [Hunroll' [Φreach Φmemo]]];
    exists κ'';
    destruct Φreach as [t'_ [π Φreach_path]];
    repeat split; [auto
                  |exists t'_|].

 solve [auto |
      (* reach *)
      exists t'_;
        exists (Cons (shell (co v σ) (rt (context e_ ρ_ σ_)) t) π);
        constructor; [assumption|
                      compute;
                        rewrite <- (comparable_ticks _ _ _ (κ := κ));
                        solve [constructor; auto
                              |auto]]
            |(* memo *) auto].
      part2 Φ point κ t.

  subst; common Φ κ' (co v σ) κ t.
  
  constructor.
  subst; common Φ κ (co v σ) (rt ctx) t.

  apply inv with (κ := κ); auto; subst.
  (* satisfy hyps of inv first *)
  apply Dom_join_right; auto.
  apply unroll_rt with (tκ := tκ); [apply unroll_with_extension; auto
                                   |apply in_list_join; solve [
                                                            intros; apply set_add_intro1; auto
                                                          | intros; apply set_add_intro2; auto 
                                                          | auto]];
  subst.
  intros e'' ρ'' σ'' tκ'' κ'' Htκ'' Hunroll'.
  destruct (in_list_join_split context_eq_dec
                               κs_join
                               κ_singleton
                               κs_join_extensive
                               Ξ
                               Ξ
                               ctx
                               tκ
                               (fun a b => b)
                               (a' := (context e'' ρ'' σ''))
                               (c' := tκ'')) as [Hctx|[Hctx|Hctx]];
    auto.
  (* first case: already there *)
  pose (Φrinst := (Φ e'' ρ'' σ'' tκ'' κ'' Hctx)).
    destruct Φrinst as [Φreach Φmemo];
    destruct Φreach as [t'_ [π Φreach_path]].
    
                               Ξ' (* l *)
                               Ξ' (* l' *)
                               ctx (* a *)
                               (context e'' ρ'' σ'') (* a' *)
                               tκ (* c *)
                               tκ'' (* c' *).
  (* unmemoized ap inv needs to split on ctx mapped before or is new *)
  part2 Φ (ap x e ρ v σ) κ t.
  inversion Htκ'' as [tκs [Hinp Hinr]].
  

  pose (Φparinst := (Φ e'' ρ'' σ'' tκ'' κ'' n'')).
  red in Hinp.
  pose (Φrinst := ).
    destruct Φrinst as [Φreach Φmemo];
    destruct Φreach as [t'_ [π Φreach_path]].


  part2 Φ (ap x e ρ v σ) κ t n.
  (* do memoized ap *)
  
  assert (Htail' : StackUnroll Ξ' κ tκ (ctx :: G)).
  apply unroll_with_extension with (G := G);[assumption|].
  apply sublist_extension with (l'' := [ ctx ]).
 with (G' := (set_add context_eq_dec ctx G)); try solve [auto | apply subset_refl].
  apply unroll_rt with (tκ := tκ); try solve [intro bad; inversion bad].
  unfold in_ctxs.
  apply in_list_join; auto;
  intros; apply set_add_intro2; auto.
  pose (Φrinst := (Φ e ρ' σ' (rt ctx) κ' Htκ' Htail));
    destruct Φrinst as [Φreach Φmemo];
    destruct Φreach as [t'_ [π Φreach_path]].
*)