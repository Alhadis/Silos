Require Import ZArith NArith List ListSet CpdtTactics stutter basic fmaplist joins.
Require Import ListSetFacts.
Require Import Relation_Operators Wellfounded ListSetFacts.
Import ListNotations.
Definition Name := nat.

Definition name_eq_dec : dec_type Name. decide equality. Defined.
Hint Immediate name_eq_dec.

Generalizable All Variables.
Set Implicit Arguments.

Inductive Expr : Type :=
| var : Name -> Expr
| app : Expr -> Expr -> Expr
| lam : Name -> Expr -> Expr.

Fixpoint fv (e : Expr) : set Name :=
  match e with
      var x => singleton name_eq_dec x
    | app e0 e1 => set_union name_eq_dec (fv e0) (fv e1)
    | lam x e => set_remove name_eq_dec x (fv e)
  end.

Definition expr_eq_dec : dec_type Expr. decide equality. Defined.
Hint Immediate expr_eq_dec.

Section Data.
Variables Addr Time : Type.
Variable addr_eq_dec : dec_type Addr.
Variable time_eq_dec : dec_type Time.

Definition Env := list (Name * Addr).
Inductive storeable := s_closure : Name -> Expr -> Env -> storeable.

Definition touch_closure (e : Expr) (ρ : Env) : set Addr :=
  range_in_set name_eq_dec addr_eq_dec ρ (fv e).

Definition touch_storeable (s : storeable) : set Addr :=
  match s with s_closure x e ρ => touch_closure e ρ end.

Definition AbsVal := set storeable.

Definition touch_absval (ss : AbsVal) := union_map addr_eq_dec touch_storeable ss.

Inductive val :=
  | closure : Name -> Expr -> Env -> val
  | adelay : Addr -> val
  | amany : AbsVal -> val.

Definition touch_val (v : val) : set Addr :=
  match v with
      closure x e ρ => touch_closure e ρ
    | adelay a => singleton addr_eq_dec a
    | amany ss => touch_absval ss
  end.

Definition Store := list (Addr * AbsVal).
Inductive Frame :=
  | ar : Expr -> Env -> Frame
  | fn : val -> Frame.

Definition touch_frame (φ : Frame) : set Addr :=
  match φ with
      ar e ρ => touch_closure e ρ
    | fn v => touch_val v
  end.

Definition Kont : Type := list Frame.
Definition touch_kont (κ : Kont) : set Addr :=
  union_map addr_eq_dec touch_frame κ.

Inductive Shell (P : Type) :=
  shell : P -> Kont -> Time -> Shell P.
Inductive CES_point :=
  | ev : Expr -> Env -> Store -> CES_point
  | co : val -> Store -> CES_point
  | ap : Name -> Expr -> Env -> (* Closure *)
         val -> (* Argument *)
         Store -> CES_point.

Definition touch_point (p : CES_point) : set Addr :=
  match p with
      ev e ρ s => touch_closure e ρ
    | co v σ => touch_val v
    | ap x e ρ v σ => set_union addr_eq_dec (touch_closure e ρ) (touch_val v)
  end.
Definition CESK := Shell CES_point.
Definition root_CESK (s : CESK) : set Addr :=
  match s with shell p κ t => set_union addr_eq_dec (touch_point p) (touch_kont κ) end.

Inductive twiddle (σ : Store) : Addr -> Addr -> Prop :=
  twiddle_intro : forall a b ss, MapsTo σ b ss -> set_In a (touch_absval ss) -> twiddle σ a b.
Definition reach_addr (σ : Store) : Addr -> Addr -> Prop := clos_refl_trans _ (twiddle σ).                        

Hint Immediate addr_eq_dec time_eq_dec.
Definition env_eq_dec : dec_type Env. apply list_eq_dec; decide equality. Defined.
Hint Immediate env_eq_dec.
Definition storeable_eq_dec : dec_type storeable. decide equality. Defined.
Hint Immediate storeable_eq_dec.
Definition absval_eq_dec : dec_type AbsVal. apply list_eq_dec; auto. Defined.
Hint Immediate absval_eq_dec.
Definition val_eq_dec : dec_type val. decide equality. Defined.
Hint Immediate val_eq_dec.
Definition store_eq_dec : dec_type Store. apply list_eq_dec; decide equality. Defined.
Hint Immediate store_eq_dec.
Definition frame_eq_dec : dec_type Frame. decide equality. Defined.
Hint Immediate frame_eq_dec.
Definition kont_eq_dec : dec_type Kont. apply list_eq_dec,frame_eq_dec. Defined.
Hint Immediate kont_eq_dec.
Hint Constructors Shell.

Definition store_of (p : CES_point) : Store :=
  match p with
      ev _ _ σ => σ
    | co _ σ => σ
    | ap _ _ _ _ σ => σ
  end.
Hint Unfold Kont CESK store_of.

Definition ces_point_eq_dec : dec_type CES_point. decide equality. Defined.
Hint Immediate ces_point_eq_dec.
Definition cesk_eq_dec : dec_type CESK. decide equality. Defined.
Hint Immediate cesk_eq_dec.
Definition CESK_edge := (CESK * CESK)%type.
Definition cesk_edge_eq_dec : dec_type CESK_edge. decide equality. Defined.
Hint Immediate cesk_edge_eq_dec.

Definition in_aval := @In storeable.

Inductive in_force (σ : Store) : forall (s : storeable) (v : val), Prop :=
| forced : `{in_force σ (s_closure x e ρ) (closure x e ρ)}
| do_force : `{MapsTo σ a vs -> in_aval s vs -> in_force σ s (adelay a)}
| many_force : `{set_In s vs -> in_force σ s (amany vs)}.

Definition extend_ρ := extend_map name_eq_dec (B := Addr).

Definition lookup_ρ := lookup_map name_eq_dec (B := Addr).
Definition lookup_σ := lookup_map addr_eq_dec (B := AbsVal).

Definition all_InDom {A B} (l: list (A * B)) (s : set A) : Prop :=
  Forall (InDom l) s.
Lemma all_InDom_subset : forall {A B} (l : list (A * B)) (s s' : set A),
                           Subset s s' -> all_InDom l s' -> all_InDom l s.
Proof.
  intros A B l s s' Hsub Hall; unfold all_InDom in *;
  rewrite Forall_forall in *. 
  intros; apply Hall,Hsub; auto.
Qed.

Lemma storeable_subset_absval : forall s ss, in_aval s ss -> Subset (touch_storeable s) (touch_absval ss).
Proof.
  intros s ss Hin a Hain;
  apply (union_map_subset _ addr_eq_dec _ touch_storeable ss s Hin); auto.
Qed.

Definition wellformed_σ (σ : Store) := forall a ss, MapsTo σ a ss -> all_InDom σ (touch_absval ss).
Lemma wellformed_in_list_list : forall σ, wellformed_σ σ ->
                                          forall a ss, MapsTo σ a ss ->
                                               forall s, in_aval s ss ->
                                                 all_InDom σ (touch_storeable s).
Proof.
  intros σ Hwf a ss Hmap s Hin.
  specialize (Hwf _ _ Hmap).
  apply (all_InDom_subset (storeable_subset_absval s ss Hin)); assumption.
Qed.

Inductive reaching_input (σ : Store) := ri_intro : set Addr -> set Addr -> reaching_input σ.
Inductive good_reaching_input {σ} : (reaching_input σ) -> Prop :=
  good_ri : forall todo seen, NoDup todo -> NoDup seen ->
                              all_InDom σ todo -> all_InDom σ seen ->
                              set_inter addr_eq_dec todo seen = (empty_set _) ->
                              good_reaching_input (ri_intro σ todo seen).
Definition ri_measure {σ} (ri : reaching_input σ) :=
  match ri with
      ri_intro todo seen =>
      let σsize := (length (union_map addr_eq_dec touch_absval (collect_range addr_eq_dec absval_eq_dec σ))) in
      (σsize - (length (set_union addr_eq_dec seen todo)))
  end.

Definition reaching_order {σ} (ri0 ri1 : reaching_input σ) : Prop := lt (ri_measure ri0) (ri_measure ri1).
Definition greaching_order {σ} (gri0 gri1 : sigT (fun ri : reaching_input σ => good_reaching_input ri)) : Prop :=
  match gri0,gri1 with
      existT ri0 _, existT ri1 _ => reaching_order ri0 ri1
  end.

Lemma reaching_wf' : forall σ len (ri : reaching_input σ), le (ri_measure ri) len
                      -> Acc (@reaching_order σ) ri.
Proof.
  unfold reaching_order; induction len; intros [todo seen] Hord;
  constructor; intros; [elimtype False|apply IHlen]; omega.
Qed.

Lemma greaching_wf' : forall σ len (ri : reaching_input σ) (g : good_reaching_input ri),
                        le (ri_measure ri) len -> Acc (@greaching_order σ) (existT _ ri g).
Proof.
  unfold greaching_order,reaching_order; induction len; intros [todo seen] Hord;
  constructor; intros [ri' g'] Hbad; [elimtype False|apply IHlen]; omega.
Qed.

Lemma reaching_wf : forall σ, well_founded (@reaching_order σ).
Proof.
  intros σ ri0; constructor; intros ri1 Hord; eapply reaching_wf'; eauto.
Qed.
Lemma greaching_wf : forall σ, well_founded (@greaching_order σ).
Proof.
  intros σ [r0 g0]; constructor; unfold greaching_order; intros [ri1 g1] Hord.
  eapply greaching_wf'; eauto.
Qed.
(*
Definition reaching_addrs_aux : forall σ (gri : sigT (fun ri : reaching_input σ => good_reaching_input ri)), set Addr.
  refine (fun σ =>
    Fix (@greaching_wf σ)
        (fun _ => set Addr)
        (fun gx reaching_addrs_aux =>
              (match gx with
                   existT ri g =>
                   (fun Hg : gx = existT _ ri g =>
                   (match ri with 
                        ri_intro todo seen =>
                        (fun Hr : ri = (ri_intro σ todo seen) =>
                        (match todo with
                             nil => (fun _ => seen)
                           | a::todo' =>
                             fun (Ht : todo = a::todo') =>
                             if set_In_dec addr_eq_dec a seen then
                               reaching_addrs_aux (existT _ (ri_intro σ todo' seen)
                                                          _) _
                             else match lookup_σ a σ with
                                      None => seen (* rule out with well-formedness *)
                                    | Some ss =>
                                      reaching_addrs_aux
                                        (existT
                                           _
                                           (ri_intro
                                              σ (set_union addr_eq_dec todo' 
                                                           (set_diff addr_eq_dec (touch_absval ss) seen))
                                              (set_add addr_eq_dec a seen))
                                           _)
                                        _
                                  end
                         end) (eq_refl todo))
                    end) (eq_refl ri))
               end) (eq_refl gx))).
  subst.
  unfold greaching_order.
  
  Focus 2.
  subst.
  unfold reaching_order, greaching_order, ri_measure.
  assert (simplify : forall (l x y : nat), x <= l -> y <= l -> y < x -> l - x < l - y) by (intros; omega).
  apply (simplify (length
                     (union_map addr_eq_dec touch_absval
                                (collect_range addr_eq_dec absval_eq_dec σ)))
                  (length
                     (set_union addr_eq_dec (set_union addr_eq_dec todo' (touch_absval ss))
                                (set_add addr_eq_dec a seen)) + 1)
                  (length (set_union addr_eq_dec (a :: todo') seen))).
  Focus 3.
  inversion g as [? ? ndt nds allt alls]; subst.
  assert (nds' : NoDup (a :: seen)) by (constructor; auto).

  SearchAbout minus.
  rewrite (NPeano.Nat.lt_sub_lt_add_l l x (l - y)).
  assert (lenunionleft : length (set_union addr_eq_dec (set_union addr_eq_dec todo0 (touch_absval ss))
                                           (set_add addr_eq_dec a seen))
                                = 
*)
Definition force (σ : Store) (v:val) : AbsVal :=
  match v with
      | adelay a => match lookup_σ a σ with
                        None => nil
                      | Some vs => vs
                    end
      | amany vs => vs
      | closure x e ρ => singleton storeable_eq_dec (s_closure x e ρ)
  end.

Lemma in_force_In_force : forall σ v s, in_force σ s v <-> set_In s (force σ v).
Proof.
intros; split; intro H.
inversion H as [|? ? ? Hmap|s_ Hmany]; simpl;
[intuition
|rewrite lookup_mapsto in Hmap; unfold lookup_σ; rewrite Hmap; auto
|subst; auto].
destruct v as [x e ρ | a |vs];
simpl in H;[inversion H; [subst|contradiction]; constructor
           |case_eq (lookup_σ a σ);[intros ss Hsseq; rewrite Hsseq in H; unfold lookup_σ in Hsseq; rewrite <- lookup_mapsto in Hsseq; apply do_force with (vs := ss); auto|intro bad; rewrite bad in H; inversion H]
           |constructor; auto].
Qed.

Definition absval_join (vs vs' : AbsVal) :=
  set_union storeable_eq_dec vs vs'.

Definition σ_combine := (fun σ_orig vs v => (absval_join vs (force σ_orig v))).
Definition σ_join (σ : Store) (a : Addr) (v : val) : Store :=
  list_join addr_eq_dec σ_combine force σ a v σ.

Lemma σ_combine_extensive : forall (σ : Store) (vs : AbsVal)
                                   (v : val)
                                   (s : storeable)
                                   (Hin : set_In s vs),
                              set_In s (σ_combine σ vs v).
Proof.
  intros; unfold σ_combine;
  destruct v; simpl; solve [apply set_add_intro1; auto
                           |apply set_union_intro1; auto].
Qed.

Lemma σ_join_ordering : forall σ a v, MappingLE σ (σ_join σ a v).
Proof.
intros; apply (list_join_ordering addr_eq_dec σ_combine force σ_combine_extensive).
Qed.

(* needs to be proof-relevant for an always-correct replacetail *)
Inductive KontTail : Kont -> Kont -> Prop :=
| same_tail : `{KontTail κ κ}
| push_tail : `{KontTail κ κ' -> KontTail κ (φ :: κ')}.
Hint Constructors KontTail.

Fixpoint kont_tailp (κ κ' : Kont) : bool :=
  match (kont_eq_dec κ κ') with
      | left eqprf => true
      | right neqprf => match κ' with
                            nil => false
                          | φ :: κ' => kont_tailp κ κ'
                        end
  end.

Lemma kont_tailp_correct1 : forall κ κ',
                             kont_tailp κ κ' = true -> KontTail κ κ'.
Proof.
  induction κ'; simpl;
  [destruct (kont_eq_dec κ nil); intro H; subst; try solve [auto
                                                           |inversion H; contradiction]
  |destruct (kont_eq_dec κ (a :: κ')) as [Heq|Hneq]; intro H; subst; auto;
   apply IHκ' in H]; auto.
Qed.

Lemma kont_tailp_correct2 : forall κ κ',
                              KontTail κ κ' -> kont_tailp κ κ' = true.
Proof.
  induction κ'; simpl;
  [destruct (kont_eq_dec κ nil); intro H; subst; try solve [auto
                                                           |inversion H; contradiction]
  |destruct (kont_eq_dec κ (a :: κ')) as [Heq|Hneq]; intro H; subst; try solve [constructor];
   apply IHκ'; inverts H; [contradict Hneq|]; auto].
Qed.

Lemma kont_tail_nil : `{KontTail nil κ}.
Proof. induction κ as [|φ κ_ IH]; constructor; auto. Qed.

Lemma kont_tail_cons : forall φ κ κ' (H : KontTail (φ::κ) κ'), KontTail κ κ'.
Proof.
  induction κ' as [|φ_ κ_ IH]; intros; inverts H.
  apply push_tail; constructor.
  apply push_tail,IH; auto.
Qed.

Lemma kont_tail_app : forall κ κ' κ'' (H : KontTail (κ ++ κ') κ''), KontTail κ' κ''.
Proof.
  induction κ as [|φ κ_ IH]; intros;
  simpl in H; auto.
  apply kont_tail_cons in H; apply IH; auto.
Qed.

Section StandardSemantics.
Variable alloc : CES_point -> Addr.
Variable tick : CES_point -> Time.
Variable time0 : Time.
Definition inject_cesk (e : Expr) := shell (ev e nil nil) nil time0.

(* Proof relevant or not? *)
Inductive red_cesk : CESK -> CESK -> Prop :=
  ev_var : `{let p := (ev (var x) ρ σ) in
             MapsTo ρ x a ->
             red_cesk (shell p κ t) (shell (co (adelay a) σ) κ (tick p))}
| ev_app : `{let p := (ev (app e0 e1) ρ σ) in
             red_cesk (shell p κ t) (shell (ev e0 ρ σ) ((ar e1 ρ)::κ) (tick p))}
| ev_lam : `{let p := (ev (lam x e) ρ σ) in
             red_cesk (shell p κ t) (shell (co (closure x e ρ) σ) κ (tick p))}
| co_ar : `{let p := (co v σ) in
            red_cesk (shell p ((ar e ρ)::κ) t) (shell (ev e ρ σ) ((fn v)::κ) (tick p))}
| co_fn : `{let p := (co v σ) in
            in_force σ (s_closure x e ρ) fnv ->
            red_cesk (shell p ((fn fnv)::κ) t) (shell (ap x e ρ v σ) κ (tick p))}
| do_ap : `{let p := (ap x e ρ v σ) in
            let a := alloc p in
            let ρ' := extend_ρ x a ρ in
            let σ' := σ_join σ a v in
            red_cesk (shell p κ t) (shell (ev e ρ' σ') κ (tick p))}.

Inductive PR_red_cesk : CESK -> CESK -> Type :=
  pr_ev_var : `{let p := (ev (var x) ρ σ) in
             MapsTo ρ x a ->
             PR_red_cesk (shell p κ t) (shell (co (adelay a) σ) κ (tick p))}
| pr_ev_app : `{let p := (ev (app e0 e1) ρ σ) in
             PR_red_cesk (shell p κ t) (shell (ev e0 ρ σ) ((ar e1 ρ)::κ) (tick p))}
| pr_ev_lam : `{let p := (ev (lam x e) ρ σ) in
             PR_red_cesk (shell p κ t) (shell (co (closure x e ρ) σ) κ (tick p))}
| pr_co_ar : `{let p := (co v σ) in
            PR_red_cesk (shell p ((ar e ρ)::κ) t) (shell (ev e ρ σ) ((fn v)::κ) (tick p))}
| pr_co_fn : `{let p := (co v σ) in
            in_force σ (s_closure x e ρ) fnv ->
            PR_red_cesk (shell p ((fn fnv)::κ) t) (shell (ap x e ρ v σ) κ (tick p))}
| pr_do_ap : `{let p := (ap x e ρ v σ) in
            let a := alloc p in
            let ρ' := extend_ρ x a ρ in
            let σ' := σ_join σ a v in
            PR_red_cesk (shell p κ t) (shell (ev e ρ' σ') κ (tick p))}.
Hint Constructors red_cesk PR_red_cesk in_force.

Definition fresh_ρ_inv (σ : Store) (ρ : Env) : Prop :=
  forall x a, MapsTo ρ x a -> InDom σ a.

Lemma fresh_ρ_inv_join : forall σ ρ a v, fresh_ρ_inv σ ρ -> fresh_ρ_inv (σ_join σ a v) ρ.
Proof.
  intros σ ρ a v freshρ x a' Hmap; apply InDom_join2'; apply freshρ with (x := x); auto.
Qed.

Definition fresh_storeable_inv (σ : Store) (s : storeable) :=
  match s with
      s_closure x e ρ => fresh_ρ_inv σ ρ
  end.

Lemma fresh_storeable_inv_join : forall σ a s v, fresh_storeable_inv σ s -> fresh_storeable_inv (σ_join σ a v) s.
Proof.
  intros; destruct s; apply fresh_ρ_inv_join; auto.
Qed.

Definition fresh_setmap_inv {A B}
           (Beq_dec : dec_type B)
           (l : list (A * list B))
           (Bprop : list (A * list B) -> B -> Prop) : Prop :=
  forall a bs, MapsTo l a bs -> exists b, bs = (singleton Beq_dec b) /\ Bprop l b.

Definition fresh_σ_inv (σ : Store) := fresh_setmap_inv storeable_eq_dec σ fresh_storeable_inv.

Definition fresh_val_inv (σ : Store) (v : val) : Prop :=
  match v with
      closure x e ρ => fresh_ρ_inv σ ρ
    | (adelay a) => InDom σ a
    | (amany vs) => exists s, vs = (singleton storeable_eq_dec s) /\ fresh_storeable_inv σ s
  end.

Lemma fresh_val_inv_join : forall σ a v v', fresh_val_inv σ v -> fresh_val_inv (σ_join σ a v') v.
Proof.
  intros; destruct v; simpl;
  [apply fresh_ρ_inv_join
  |apply InDom_join2'
  |destruct H as [s [Heq freshs]];
   exists s; split; [|apply fresh_storeable_inv_join]];auto.
Qed.

Definition fresh_φ_inv (σ : Store) (φ : Frame) : Prop :=
  match φ with
      | ar e ρ => fresh_ρ_inv σ ρ
      | fn v => fresh_val_inv σ v
  end.

Lemma fresh_φ_inv_join : forall σ a v φ, fresh_φ_inv σ φ -> fresh_φ_inv (σ_join σ a v) φ.
Proof.
  intros ? ? ? [e ρ|fnv] H; simpl; [apply fresh_ρ_inv_join|apply fresh_val_inv_join]; auto.
Qed.

Inductive fresh_point_inv : CES_point -> Prop :=
  fresh_ev : `{fresh_σ_inv σ -> fresh_ρ_inv σ ρ -> fresh_point_inv (ev e ρ σ)}
| fresh_co : `{fresh_val_inv σ v -> fresh_σ_inv σ -> fresh_point_inv (co v σ)}
| fresh_ap : `{fresh_val_inv σ v -> fresh_ρ_inv σ ρ -> fresh_σ_inv σ -> fresh_point_inv (ap x e ρ v σ)}.
Hint Constructors fresh_point_inv.
Hint Unfold fresh_φ_inv fresh_val_inv fresh_ρ_inv fresh_σ_inv.
(* what do we know of states when the allocation function gives fresh allocations? *)
Definition fresh_inv (s : CESK) : Prop :=
  match s with
      shell p κ t => Forall (fresh_φ_inv (store_of p)) κ /\ fresh_point_inv p
  end.

Definition alloc_fresh (alloc : CES_point -> Addr) :=
  forall p, Unmapped (store_of p) (alloc p).

Lemma σ_join_mapsto_elim : forall σ a v a' ss, MapsTo (σ_join σ a v) a' ss ->
                                               (a = a' /\ Subset (force σ v) ss) \/
                                               (a <> a' /\ MapsTo σ a' ss).
Proof.
  intros; apply (join_mapsto_elim' addr_eq_dec σ_combine); auto; intros.
  unfold σ_combine; destruct b as [x e ρ | a_ | ss']; simpl;
  [intros ? Hin; apply set_add_intro2; inversion Hin as [|bad]; [|destruct bad]; auto
  |destruct (lookup_σ a_ l); [intros ? ?; apply set_union_intro2|simpl; intros ? bad; destruct bad]
  |intros ? ?; apply set_union_intro2]; auto.
Qed.

Lemma fresh_force_singleton : forall σ v, fresh_σ_inv σ -> fresh_val_inv σ v ->
                                          exists s, (singleton storeable_eq_dec s) = (force σ v) /\ (fresh_storeable_inv σ s).
Proof.
  intros σ [x e ρ|a|ss] freshσ freshv;
  [exists (s_closure x e ρ)
  |simpl in freshv;
    rewrite (InDom_is_mapped addr_eq_dec) in freshv;
    destruct freshv as [? Hmap];
    remember Hmap as Hmap'; clear HeqHmap';
    apply freshσ in Hmap;
    destruct Hmap as [ss' [? ?]];
    exists ss'; simpl;
    rewrite (lookup_mapsto addr_eq_dec) in Hmap'; unfold lookup_σ; rewrite Hmap'
  |destruct freshv as [s [? ?]]; exists s]; auto.
Qed.

Lemma fresh_σ_join : forall (fresh : alloc_fresh alloc) p v
                            (freshσ : fresh_σ_inv (store_of p))
                            (freshv : fresh_val_inv (store_of p) v),
                       fresh_σ_inv (σ_join (store_of p) (alloc p) v).
Proof.
  intros; intros a' ss Hmap.
  destruct (σ_join_mapsto_elim _ _ _ Hmap) as [[Haeq Hsub]|[Haneq Hmap']].

  subst a';
  assert (Hmap' : MapsTo (σ_join (store_of p) (alloc p) v) (alloc p) (force (store_of p) v))
    by (apply join_an_unmapped'; apply (fresh p));
  destruct v as [x_ e_ ρ_ | a_ | ss_];
    [exists (s_closure x_ e_ ρ_); split; [rewrite (MapsTo_same Hmap Hmap')|simpl; apply fresh_ρ_inv_join]
    |apply (InDom_lookup addr_eq_dec) in freshv;
      destruct freshv as [ss' ss'eq];
      remember ss'eq as ss'eq_;
      clear Heqss'eq_; rewrite <- lookup_mapsto in ss'eq;
      apply freshσ in ss'eq; destruct ss'eq as [s [seq freshs]];
      exists s; split; [rewrite (MapsTo_same Hmap Hmap'); simpl; unfold lookup_σ; rewrite ss'eq_
                       |apply fresh_storeable_inv_join]
    |destruct freshv as [s [seq freshs]];
      exists s; split;[rewrite (MapsTo_same Hmap Hmap')|apply fresh_storeable_inv_join]]; auto.

  apply freshσ in Hmap';
    destruct Hmap' as [s [seq freshs]]; exists s; split; [|apply fresh_storeable_inv_join]; auto.
Qed.

Theorem CESK_fresh_inv : forall s s' (fresh : (alloc_fresh alloc))
                                (Hinv : fresh_inv s)
                                (Hstep : red_cesk s s'), fresh_inv s'.
Proof.
  Ltac subgoal Hall :=
    repeat split;
    try (rewrite Forall_forall);
    try solve [auto
              |intros φ Hin; ((inversion Hin; [subst; simpl; auto|]) || idtac); apply Hall; (right || idtac); auto].
  intros; inversion Hstep as [x ρ σ a κ t p Hmap
                        |e0 e1 ρ σ κ t p Hpeq
                        |x elam ρ σ κ t p Hpeq Hs'eq
                        |v σ e ρ κ t p Hpeq Hs'eq
                        |v σ x e ρ fnv κ t p Hin_force Hpeq Hs'eq
                        |x e ρ v σ κ t p a ρ' σ' Hpeq Hs'eq];
  subst; subst p; destruct Hinv as [Hall Hfpoint];
  inversion_clear Hfpoint as [? ? ? freshσ freshρ|? ? freshv freshσ|? ? ? ? ? freshv freshρ freshσ];
  rewrite Forall_forall in Hall; subst;
  try solve [subgoal Hall].

  split; [subgoal Hall
         |constructor; [apply freshρ with (x := x)|]; auto].

  split; [subgoal Hall
         |constructor; [|specialize (Hall (ar e ρ) (or_introl (eq_refl _))); simpl in Hall]; assumption].

  split; [subgoal Hall
         |constructor;
    [|specialize (Hall (fn fnv) (or_introl (eq_refl _)));
       inversion Hin_force as [|a vs ? Hmap Hin|]; subst; simpl in Hall;
       [|apply freshσ in Hmap; destruct Hmap as [s [Heq freshs]]; subst;
         inversion Hin as [|bad]; [subst|inversion bad]; auto
        |destruct Hall as [s [Heq freshs]];
          inversion Hin_force as [| |? ? Hin]; subst; inversion Hin as [|bad]; [subst|inversion bad]]|]; auto].

  assert (subgoal' : fresh_σ_inv σ') by (subst σ' a; apply fresh_σ_join with (p := (ap x e ρ v σ)); auto).

  split;
    [rewrite Forall_forall; intros φ Hin;
     destruct φ as [κe κρ | κv]; simpl;
     [apply fresh_ρ_inv_join
     |apply fresh_val_inv_join]; apply (Hall _ Hin); auto
    |constructor;
      [auto
      |intros x_ a_ Hmap;
        destruct (name_eq_dec x x_) as [Heq|Hneq];
        [subst x_; subst ρ'; unfold extend_ρ in Hmap; rewrite <- (@extend_map_MapsTo_eq _ _ name_eq_dec x a a_ ρ Hmap);
         apply InDom_join'
        |assert (Hmap' : MapsTo ρ x_ a_) by
            (apply (@extend_map_old _ _ name_eq_dec ρ x x_ a a_ Hneq); auto);
          apply InDom_join2'; apply freshρ in Hmap'; auto]]].
Qed.

Remark fresh_inject_cesk : forall e, fresh_inv (inject_cesk e).
Proof.
intros; constructor; constructor; intros ? ? vac; inversion vac.
Qed.

Theorem fresh_CESK_deterministic : (alloc_fresh alloc) -> deterministic_modulo red_cesk fresh_inv.
Proof.
  intros fresh s s' freshs Hstep; constructor;[auto|intros s'' Hstep'];
  pose (freshs' := CESK_fresh_inv fresh freshs Hstep);
  pose (freshs'' := CESK_fresh_inv fresh freshs Hstep');
  inversion Hstep as [x ρ σ a κ t p Hmap Hpeq Hseq
                     |e0 e1 ρ σ κ t p Hpeq Hseq
                     |x e ρ σ κ t p Hpeq Hseq
                     |v σ e ρ κ t p Hpeq Hseq
                     |v σ x e ρ fnv κ t p Hin_force Hpeq Hseq
                     |x e ρ v σ κ t p a ρ' σ' Hpeq Hseq];
  inversion Hstep' as [x_ ρ_ σ_ a_ κ_ t_ p_ Hmap_ Hpeq_ Hseq_
                      |e0_ e1_ ρ_ σ_ κ_ t_ p_ Hpeq_ Hseq_
                      |x_ e_ ρ_ σ_ κ_ t_ p_ Hpeq_ Hseq_
                      |v_ σ_ e_ ρ_ κ_ t_ p_ Hpeq_ Hseq_
                      |v_ σ_ x_ e_ ρ_ fnv_ κ_ t_ p_ Hin_force_ Hpeq_ Hseq_
                      |x_ e_ ρ_ v_ σ_ κ_ t_ p_ a_ ρ'_ σ'_ Hpeq_ Hseq_];
    try (subst s s'; (injection Hpeq_ || discriminate Hpeq_); intros; try subst p_; try subst p;
         try subst ρ' ρ'_ a a_ σ' σ'_; subst);
    auto;
    destruct freshs as [freshκ freshp].

  rewrite (MapsTo_same Hmap Hmap_); reflexivity.

  inversion Hin_force as [xf ef ρf xeq inj
                         |af vs s Hmap Hin seq inj
                         |vsf vs Hin seq inj];
  inversion Hin_force_ as [xf_ ef_ ρf_ xeq_ inj_
                          |af_ vs_ s_ Hmap_ Hin_ seq_ inj_
                          |vsf_ vs_ Hin_ seq_ inj_];
  try solve [subst; ((injection inj_; intros; subst; reflexivity) || discriminate inj_)];
  inversion freshp as [|? ? freshv freshσ|]; subst.

  (* same delays *)
  subst; injection inj_; intros; subst;
  rewrite (MapsTo_same Hmap Hmap_) in Hin;
  apply freshσ in Hmap_;
  destruct Hmap_ as [s [seq freshs]]; repeat rewrite seq in *;
  inversion Hin as [Heq | bad];
    inversion Hin_ as [Heq_ | bad_];
    solve [subst s; injection Heq_; intros; subst; auto
          |inversion bad | inversion bad_].
  remember freshκ as mumble.
  clear Heqmumble.
  rewrite Forall_forall in freshκ.
  specialize (freshκ (fn (amany vs)) (or_introl (eq_refl _))).
  simpl in freshκ.
  destruct freshκ as [s [seq freshs]].
  subst; injection inj_; intros; subst.
  repeat rewrite seq in *.
  inversion Hin as [Heq | bad];
  inversion Hin_ as [Heq_ | bad_];
  solve [subst s; injection Heq_; intros; subst; auto
        |inversion bad | inversion bad_].
Qed.

Definition cesk_step_all (s : CESK) : set CESK :=
  match s with
    | (shell (ev (var x) ρ σ) κ t)  =>
      match (lookup_ρ x ρ) with
       | None => empty_set _
       | Some a => singleton cesk_eq_dec (shell (co (adelay a) σ) κ (tick (ev (var x) ρ σ)))
      end
    | (shell (ev (app e0 e1) ρ σ) κ t) =>
      singleton cesk_eq_dec (shell (ev e0 ρ σ) ((ar e1 ρ)::κ) (tick (ev (app e0 e1) ρ σ)))
    | (shell (ev (lam x e) ρ σ) κ t) =>
      singleton cesk_eq_dec (shell (co (closure x e ρ) σ) κ (tick (ev (lam x e) ρ σ)))
    | (shell (co v σ) ((ar e ρ)::κ) t) =>
              singleton cesk_eq_dec (shell (ev e ρ σ) ((fn v)::κ) (tick (co v σ)))
    | (shell (co v σ) ((fn fnv)::κ) t) =>
      (* Append forces *)
      set_fold_right (fun fv acc =>
                        match fv with
                            s_closure x e ρ => set_add cesk_eq_dec
                                                       (shell (ap x e ρ v σ) κ (tick (co v σ)))
                                                       acc
                        end)
                     (force σ fnv)
                     (empty_set _)
    | (shell (ap x e ρ v σ) κ t) =>
      let a := alloc (ap x e ρ v σ) in
      let ρ' := extend_ρ x a ρ in
      let σ' := σ_join σ a v in
      let t' := (tick (ap x e ρ v σ)) in
      singleton cesk_eq_dec (shell (ev e ρ' σ') κ t')
    | (shell (co v σ) nil t) => empty_set _
  end.

Theorem CESK_finite_steps : forall s s', red_cesk s s' <-> set_In s' (cesk_step_all s).
Proof.
  intros s s'; split; [intro Hstep|intro Hin].
  inversion Hstep as [x ρ σ a κ t p Hmap Hpeq Hseq
                     |e0 e1 ρ σ κ t p Hpeq Hseq
                     |x e ρ σ κ t p Hpeq Hseq
                     |v σ e ρ κ t p Hpeq Hseq
                     |v σ x e ρ fnv κ t p Hin_force Hpeq Hseq
                     |x e ρ v σ κ t p a ρ' σ' Hpeq Hseq]; subst; subst p; simpl; auto.
  rewrite lookup_mapsto in Hmap; unfold lookup_ρ; rewrite Hmap; left; auto.

  unfold set_fold_right, fold_right;
  induction Hin_force as [|a_ vs_ st Hmap_ Hin_|s ss Hin]; simpl;
  inversion Hstep as [| | | |? ? ? ? ? ? ? ? ? Hin_force_ |];
    [inversion Hin_force_; auto
    |inversion Hin_force_ as [|a_' vs_' st' Hmap_' Hin_'|]; subst st' a_';
      remember Hmap_ as Hmaprem; clear HeqHmaprem;
      rewrite (lookup_mapsto addr_eq_dec) in Hmap_; unfold lookup_σ; rewrite Hmap_;
      rewrite (MapsTo_same Hmaprem Hmap_');
      clear Hmap_'; (* buggers up the IH *)
      induction vs_' as [|v_ vs_' IH]; (inversion Hin_' as [Heq|Hrest] || inversion Hin_');
      [rewrite Heq; apply set_add_intro2
      |specialize (IH Hrest); destruct v_; apply set_add_intro1]; auto
    |inversion Hin_force_ as [| |st sts Hins Hseq]; subst sts st;
     clear Hstep Hin_force_ Hin;
     match goal with [H : fnv = _ |- _] => clear H end;
     induction ss as [|v_ vs_' IH]; (inversion Hins as [Heq|Hrest] || inversion Hins);
     [rewrite Heq; apply set_add_intro2
     |specialize (IH Hrest); destruct v_; apply set_add_intro1]; auto].

  Ltac only_one := solve [inversion Hin as [seq|bad]; [rewrite <- seq; auto|destruct bad]].
  destruct s as [[e ρ σ | v σ | x e ρ v σ] κ t];
    try only_one;
    [destruct e as [x | e0 e1 | x e];
      simpl in Hin;
      [case_eq (lookup_ρ x ρ);
        [intros a Heq; rewrite Heq in Hin; inversion Hin as [seq|bad];
         [rewrite <- seq; unfold lookup_ρ in Heq; rewrite <- lookup_mapsto in Heq; apply ev_var|inversion bad]
        |intro Hbad; rewrite Hbad in Hin; inversion Hin]; auto
      |only_one
      |only_one]
    |destruct κ as [|[e ρ|fnv] κ_];
      simpl in Hin; try (contradiction || only_one)].
  destruct fnv as [x e ρ | a | ss]; simpl in Hin;
    [only_one
    |case_eq (lookup_σ a σ);
      [intros ss Hins; rewrite Hins in Hin;
       destruct s' as [[| |x0 e0 ρ0 v0 σ0] κ0 t0];
       try solve
           [elimtype False;
             clear Hins; induction ss as [|[x1 e1 ρ1] ss IH];
             [contradiction
             |simpl in Hin;apply set_add_elim in Hin; inversion Hin as [seq|Hrest];
              [discriminate seq|apply IH; auto]]];
       assert (cut : in_force σ (s_closure x0 e0 ρ0) (adelay a) /\ v0 = v /\ σ0 = σ /\ κ0 = κ_ /\ t0 = (tick (co v σ)))
         by (unfold lookup_σ in Hins; rewrite <- lookup_mapsto in Hins;
             repeat split;
             try (eapply (do_force Hins));
             clear Hins;
             induction ss as [|[x1 e1 ρ1] ss IH];
             solve [contradiction
                   |simpl in Hin; apply set_add_elim in Hin;
                    inversion Hin as [seq | Hrest];
                    [injection seq; intros; subst; repeat split; solve [left; auto|auto]
                    |try right; apply IH; auto]]);
       destruct cut as [Hin_force [veq [σeq [κeq teq]]]];
         subst; constructor; auto
      |intro Hnone;rewrite Hnone in Hin; contradiction]
    |destruct s' as [[| |x0 e0 ρ0 v0 σ0] κ0 t0];
      try solve [elimtype False;
                  induction ss as [|[x1 e1 ρ1] ss IH];
                  [contradiction
                  |simpl in Hin;apply set_add_elim in Hin; inversion Hin as [seq|Hrest];
                   [discriminate seq|apply IH; auto]]];
      assert (cut : in_force σ (s_closure x0 e0 ρ0) (amany ss) /\ v0 = v /\ σ0 = σ /\ κ0 = κ_ /\ t0 = (tick (co v σ)));
      try apply many_force;
      induction ss as [|[x1 e1 ρ1] ss IH];
      try solve [contradiction
                |simpl in Hin; apply set_add_elim in Hin;
                 inversion Hin as [seq | Hrest];
               [injection seq; intros; subst; repeat split; solve [constructor; left; auto|auto]
               |specialize (IH Hrest);
                 destruct IH as [Hin_force [veq [σeq [κeq teq]]]];
                 repeat split; solve [auto | constructor; right; inversion Hin_force; auto]]];
      destruct cut as [Hin_force [veq [σeq [κeq teq]]]]; subst; constructor; auto].
Qed.

Inductive CESK_System :=
  cesk_system : set CESK -> set CESK -> set CESK_edge -> CESK_System.

Inductive red_CESK_frontier : CESK_System -> CESK_System -> Prop :=
  cesk_sys_step : `{cesk_steps ss = cesk_step_all s ->
                    red_CESK_frontier (cesk_system Seen (s::F) E)
                                      (cesk_system (set_union cesk_eq_dec Seen ss)
                                                   (set_union cesk_eq_dec F ss)
                                                   (set_union cesk_edge_eq_dec E
                                                              (set_map cesk_edge_eq_dec (fun s' => (s,s')) ss)))}.

Definition CESK_System_to_reduction_relation (S : CESK_System) : CESK -> CESK -> Prop :=
  match S with cesk_system _ _ E => fun s s' => In (s,s') E end.

Definition CESK_trace (e : Expr) := Trace red_cesk (inject_cesk e).
Section NonStandardData.
Inductive Context := context : Expr -> Env -> Store -> Time -> Context.
Inductive Result := res: val -> Store -> Time -> Result.
Definition Results := set Result.

Inductive TrunKont :=
| mt : TrunKont
| kpush : Frame -> TrunKont -> TrunKont
| rt : Context -> TrunKont.

Definition TrunKonts := set TrunKont.
Definition Memo := list (Context * Results).
Definition KTable := list (Context * TrunKonts).

Definition context_eq_dec : dec_type Context. decide equality. Defined.
Hint Immediate context_eq_dec.
Definition result_eq_dec : dec_type Result. decide equality. Defined.
Hint Immediate result_eq_dec.
Definition trunkont_eq_dec : dec_type TrunKont. decide equality. Defined.
Hint Immediate trunkont_eq_dec.

Inductive TrunKontTail : TrunKont -> TrunKont -> Prop :=
| same_ttail : `{TrunKontTail κ κ}
| push_ttail : `{TrunKontTail κ κ' -> TrunKontTail κ (kpush φ κ')}.
Hint Constructors TrunKontTail.
Lemma trunkont_tail_kpush : forall tκ φ tκ', TrunKontTail (kpush φ tκ) tκ' -> TrunKontTail tκ tκ'.
Proof.
  induction tκ'; intro H; inverts H; constructor; [|apply IHtκ']; auto.
Qed.

Definition memo_eq_dec : dec_type Memo. do 3 (decide equality). Defined.
Definition ktable_eq_dec : dec_type KTable. do 3 (decide equality). Defined.
Hint Immediate memo_eq_dec ktable_eq_dec.

Definition trunckonts_join (κs κs' : TrunKonts) := set_union trunkont_eq_dec κs κs'.
Definition lookup_M := lookup_map context_eq_dec (B := Results).
Definition lookup_Ξ := lookup_map context_eq_dec (B := TrunKonts).

Definition κs_join := (fun (_ : KTable) κs κ => (set_add trunkont_eq_dec κ κs)).
Definition κ_singleton := (fun (_ : KTable) κ => singleton trunkont_eq_dec κ).
Definition res_join := (fun (_ : Memo) rs r => (set_add result_eq_dec r rs)).

Lemma κs_join_extensive (_ : KTable) (b : TrunKonts) (tκ : TrunKont) : In tκ (set_add trunkont_eq_dec tκ b).
Proof. apply set_add_intro2; auto. Qed.
Hint Resolve κs_join_extensive.
(*
Lemma κs_join_extensive' (_ : KTable) (b : TrunKonts) (tκ : TrunKont) := (set_add_intro1 trunkont_eq_dec).
*)
Definition κ_singleton_extensive : forall (Ξ : KTable) (tκ : TrunKont), In tκ (κ_singleton Ξ tκ).
intros; apply κs_join_extensive; auto.
Defined.

Definition Ξ_join (Ξ : KTable) (ctx : Context) (κ : TrunKont) : KTable :=
  list_join context_eq_dec
            κs_join
            κ_singleton Ξ ctx κ Ξ.
Definition M_join (M : Memo) (ctx : Context) (r : Result) : Memo :=
  list_join context_eq_dec
            res_join
            (fun _ r => singleton result_eq_dec r) M ctx r M.

Definition InΞ_join (Ξ : KTable) (ctx : Context) (tκ : TrunKont) :=
  (in_list_join context_eq_dec
                κs_join
                κ_singleton
                κs_join_extensive
                κ_singleton_extensive
                Ξ Ξ
                ctx
                tκ
                (fun (ab : Context * TrunKonts) (H : In ab Ξ) => H)).

Fixpoint map_join {A B} (join1 : list (A * B) -> A -> B -> list (A * B)) (l l' : list (A * B)) :=
  match l with
      nil => l'
    | (a,b)::l'' => join1 (map_join join1 l'' l') a b
  end.
Section MapJoin.
Variables (A B : Type) (Aeq_dec : dec_type A) (Beq_dec : dec_type B).
Definition mjoiner (l : list (A * set B)) a bs :=
  list_join Aeq_dec
            (fun _ bs' bs => set_union Beq_dec bs' bs)
            (fun _ bs => bs)
            l a bs l.
Lemma mjoiner_forget_orig : forall l a bs l' l'',
                              list_join Aeq_dec
                                        (fun _ bs' bs => set_union Beq_dec bs' bs)
                                        (fun _ bs => bs)
                                        l' a bs l
                                        =
                              list_join Aeq_dec
                                        (fun _ bs' bs => set_union Beq_dec bs' bs)
                                        (fun _ bs => bs)
                                        l'' a bs l.
Proof.
  induction l as [|(a,b) l IH]; intros a' bs l' l''; simpl; auto.
  destruct (Aeq_dec a' a); [|f_equal];auto.
Qed.

Lemma in_mjoiner_split : forall (l l' : list (A * set B))
                                (a a' : A)
                                (c : set B)
                                (b : B)
                                (Hin : in_list_list (list_join Aeq_dec
                                                               (fun _ bs' bs => set_union Beq_dec bs' bs)
                                                               (fun _ bs => bs)
                                                               l' a c l)
                                                    a' b),
                           ((a = a') /\ (set_In b c) /\ (~ in_list_list l a b)) \/
                           (in_list_list l a' b).
Proof.
  induction l as [|(a_,bs) l IH]; simpl; intros l' a a' c b [bs' [Hmap Hin]];
  [inversion Hmap as [|? ? ? ? ? ? bad];
    [subst; left; repeat split; auto; intros [? [bad ?]]; inversion bad
    |inversion bad]
  |destruct (Aeq_dec a a_);
    [inverts Hmap;
      [subst a_; destruct (set_union_elim_LEM _ Beq_dec _ _ _ Hin) as [inbs|[inc ninb]];
       [right; exists bs; split; [constructor|]; auto
       |left; repeat split; auto; intros [? [bad ?]];inverts bad; [contradiction|bad_eq]]
      |right; exists bs'; repeat constructor; auto]
    |inversion Hmap as [|? ? ? ? ? ? Hmap']; subst;
     [right; exists bs'; repeat constructor; auto
     |destruct (IH l' a a' c b) as [[? [? neg]]|[w [map Hin']]];
       [exists bs'; split; auto
              |subst; left; repeat constructor; auto;
               intros [w [bad ?]]; inverts bad; [bad_eq|apply neg; exists w; auto]
              |right; exists w; split; [constructor|]; auto]]]].
Qed.

Lemma mjoiner_maps : forall l a bs, exists bs', MapsTo (mjoiner l a bs) a bs'.
Proof.
  induction l as [|(a,bs) l IH]; intros a' bs'.
  exists bs'; constructor.
  destruct (IH a' bs') as [w Hmap].
  destruct (Aeq_dec a a').
  subst; exists (set_union Beq_dec bs bs'); unfold mjoiner,list_join; split_refl Aeq_dec a'; constructor.
  exists w; unfold mjoiner,list_join; split_refl2 Aeq_dec a' a; constructor; auto;
  rewrite mjoiner_forget_orig with (l'' := l); auto.
Qed.

Theorem in_mjoiner_still_in : forall l a b bs, set_In b bs -> in_list_list (mjoiner l a bs) a b.
Proof.
  induction l as [|(a,bs) l IH]; simpl; intros a' b bs' Hin.
  exists bs'; split; [constructor|]; auto.
  unfold mjoiner,list_join; destruct (Aeq_dec a' a);
  [subst; exists (set_union Beq_dec bs bs'); split; [constructor|apply set_union_intro2]
  |destruct (IH a' _ _ Hin) as [bs_ [Hmap Hin']];
    rewrite mjoiner_forget_orig with (l'' := l); exists bs_; split; [constructor|]]; auto.
Qed.

Theorem mjoiner_neq_eq : forall l a bs a' bs', MapsTo l a bs -> a <> a' ->
                                          MapsTo (mjoiner l a' bs') a bs.
Proof.
  induction l as [|(a,bs) l IH]; simpl; intros a' bs' a'' bs'' Hmap Hneq;
  inversion Hmap as [|? ? ? ? ? ? Hmap']; subst.
  unfold mjoiner,list_join; destruct (Aeq_dec a'' a');
  [subst; bad_eq|rewrite mjoiner_forget_orig with (l'' := l);constructor; apply IH].

  unfold mjoiner,list_join; destruct (Aeq_dec a'' a);
  [subst; constructor
  |rewrite mjoiner_forget_orig with (l'' := l); constructor; [|apply IH]]; auto.
Qed.

Theorem in_map_join_intro1 : forall (l l' : list (A * set B)) a b,
                               in_list_list l a b ->
                               in_list_list (map_join mjoiner l l') a b.
Proof.
  induction l as [|(a,bs) l IH]; intros l' a' b [w [Hmap Hin]];
  inversion Hmap as [|? ? ? ? ? ? Hmap']; subst.
  destruct (in_mjoiner_still_in (map_join mjoiner l l') a' b w Hin) as [w' [Hmap' Hin']];
  exists w'; split; auto.

  simpl.
  destruct (IH l' a' b) as [w' [Hmap'' Hin'']];
    [exists w; split; auto
    |exists w'; split; [apply mjoiner_neq_eq|]; auto].
Qed.

Lemma map_join_nil : forall (l : list (A * set B)) a b, in_list_list (map_join mjoiner l []) a b <->
                                                        in_list_list l a b.
Proof.
  induction l as [|(a,bs) l IH]; intros a' b'; split; intros H; auto.
  simpl in H.
  destruct (in_mjoiner_split _ _ _ _ H) as [[? [innew ninold]]|inold].
  subst; exists bs; split; [constructor|]; auto.
  rewrite IH in inold.
Abort.

Lemma in_map_join_commute : forall (l l' : list (A * set B)) a b,
                              in_list_list (map_join mjoiner l l') a b <->
                              in_list_list (map_join mjoiner l' l) a b.
Proof.
  induction l; intros; split; intro H.
  unfold map_join.
Abort.

Theorem in_map_join_elim : forall (l l' : list (A * set B)) a b,
                             in_list_list (map_join mjoiner l l') a b ->
                             (in_list_list l a b /\ ~ in_list_list l' a b) \/ in_list_list l' a b.
Proof.
  induction l as [|(a,bs) l IH]; intros l' a' b injoin.
  auto.
  simpl in injoin;
  destruct (in_mjoiner_split _ _ _ _ injoin) as [[? [hin hnin]]|inold].
  subst. left; split; [exists bs; split; [constructor|];auto|].
  intro bad; apply in_map_join_intro1 with (l' := l) in bad.
Abort.

Lemma map_join_ordering1 : forall (l l' : list (A * set B)),
                            MappingLE l (map_join mjoiner l l').
Proof.
Admitted.

Lemma map_join_ordering2 : forall (l l' : list (A * set B)),
                            MappingLE l (map_join mjoiner l' l).
Proof.
Admitted.
End MapJoin.
Definition Ξs_join := map_join (mjoiner context_eq_dec trunkont_eq_dec).
Definition Ms_join := map_join (mjoiner context_eq_dec result_eq_dec).

Definition in_ctxs (Ξ : KTable) (ctx : Context) (κ : TrunKont) : Prop :=
  in_list_list Ξ ctx κ.
Definition in_ctxs_tail (Ξ : KTable) (ctx : Context) (tκ : TrunKont) : Prop :=
  exists tκ', in_list_list Ξ ctx tκ' /\ TrunKontTail tκ tκ'.

Definition in_memos (M : Memo) (ctx : Context) (r : Result) : Prop :=
  in_list_list M ctx r.

Inductive WShell (P : Type) :=
  wshell : P -> TrunKont -> Time -> WShell P.

Definition WCESKMΞ := WShell CES_point.
Inductive CESKMΞ :=
  | widemk : WCESKMΞ -> Memo -> KTable -> CESKMΞ.

Definition wceskmξ_eq_dec : dec_type WCESKMΞ. decide equality. Defined.
Hint Immediate wceskmξ_eq_dec.
Definition WCESKMΞ_edge := (WCESKMΞ * WCESKMΞ)%type.
Definition wceskmξ_edge_eq_dec : dec_type WCESKMΞ_edge. decide equality. Defined.
Hint Immediate wceskmξ_edge_eq_dec.
Definition ceskmξ_eq_dec : dec_type CESKMΞ. decide equality. Defined.
Hint Immediate ceskmξ_eq_dec.
Section NonStandardSemantics.

Definition inject_wceskmk (e : Expr) : WCESKMΞ := (wshell (ev e nil nil) mt time0).
Definition inject_ceskmk (e : Expr) : CESKMΞ := widemk (inject_wceskmk e) nil nil.

(* Proof relevant or not? *)
Inductive red_ceskmk : CESKMΞ -> CESKMΞ -> Prop :=
  evmk_var : forall x ρ σ a tκ t M Ξ,
               let p := (ev (var x) ρ σ) in
               MapsTo ρ x a ->
               red_ceskmk (widemk (wshell p tκ t) M Ξ)
                          (widemk (wshell (co (adelay a) σ) tκ (tick p)) M Ξ)
| evmk_app : forall e0 e1 ρ σ tκ t M Ξ,
               let p := (ev (app e0 e1) ρ σ) in
               red_ceskmk (widemk (wshell p tκ t) M Ξ)
                          (widemk (wshell (ev e0 ρ σ) (kpush (ar e1 ρ) tκ) (tick p)) M Ξ)
| evmk_lam : forall x e ρ σ tκ t M Ξ,
               let p := (ev (lam x e) ρ σ) in
               red_ceskmk (widemk (wshell p tκ t) M Ξ)
                          (widemk (wshell (co (closure x e ρ) σ) tκ (tick p)) M Ξ)
| comk_ar : forall v σ e ρ tκ t M Ξ,
              let p := (co v σ) in
              red_ceskmk (widemk (wshell p (kpush (ar e ρ) tκ) t) M Ξ)
                         (widemk (wshell (ev e ρ σ) (kpush (fn v) tκ) (tick p)) M Ξ)
| comk_fn : forall v σ x e ρ fnv tκ t M Ξ,
              let p := (co v σ) in
              in_force σ (s_closure x e ρ) fnv ->
              red_ceskmk (widemk (wshell p (kpush (fn fnv) tκ) t) M Ξ)
                         (widemk (wshell (ap x e ρ v σ) tκ (tick p)) M Ξ)
| do_apmk : forall x e ρ v σ tκ t M Ξ,
              let p := (ap x e ρ v σ) in
              let a := alloc p in
              let ρ' := extend_ρ x a ρ in
              let σ' := σ_join σ a v in
              let t' := (tick p) in
              let ctx := (context e ρ' σ' t') in
              Unmapped M ctx ->
              red_ceskmk (widemk (wshell p tκ t) M Ξ)
                         (widemk (wshell (ev e ρ' σ') (rt ctx) t') M (Ξ_join Ξ ctx tκ))
| do_memo : forall x e ρ v σ tκ t M Ξ vm σm tm,
              let p := (ap x e ρ v σ) in
              let a := alloc p in
              let ρ' := extend_ρ x a ρ in
              let σ' := σ_join σ a v in
              let ctx := (context e ρ' σ' (tick p)) in
              in_memos M ctx (res vm σm tm) ->
              (* There is no tick here. We must use the memoized timestamp in order to match
                 a CESK trace to the result *)
              red_ceskmk (widemk (wshell p tκ t) M Ξ)
                         (widemk (wshell (co vm σm) tκ tm) M (Ξ_join Ξ ctx tκ))
| do_rt : forall v σ ctx t tκ M Ξ,
            let M' := M_join M ctx (res v σ t) in
            in_ctxs Ξ ctx tκ ->
            (* return/memoize DO NOT TICK so that the traces match up with the CESK machine.
               This is an administrative step that is not mirrored in the CESK machine *)
            red_ceskmk (widemk (wshell (co v σ) (rt ctx) t) M Ξ)
                       (widemk (wshell (co v σ) tκ t) M' Ξ).
Inductive PR_red_ceskmk : CESKMΞ -> CESKMΞ -> Type :=
  pr_evmk_var : forall x ρ σ a tκ t M Ξ,
               let p := (ev (var x) ρ σ) in
               MapsTo ρ x a ->
               PR_red_ceskmk (widemk (wshell p tκ t) M Ξ)
                          (widemk (wshell (co (adelay a) σ) tκ (tick p)) M Ξ)
| pr_evmk_app : forall e0 e1 ρ σ tκ t M Ξ,
               let p := (ev (app e0 e1) ρ σ) in
               PR_red_ceskmk (widemk (wshell p tκ t) M Ξ)
                          (widemk (wshell (ev e0 ρ σ) (kpush (ar e1 ρ) tκ) (tick p)) M Ξ)
| pr_evmk_lam : forall x e ρ σ tκ t M Ξ,
               let p := (ev (lam x e) ρ σ) in
               PR_red_ceskmk (widemk (wshell p tκ t) M Ξ)
                          (widemk (wshell (co (closure x e ρ) σ) tκ (tick p)) M Ξ)
| pr_comk_ar : forall v σ e ρ tκ t M Ξ,
              let p := (co v σ) in
              PR_red_ceskmk (widemk (wshell p (kpush (ar e ρ) tκ) t) M Ξ)
                         (widemk (wshell (ev e ρ σ) (kpush (fn v) tκ) (tick p)) M Ξ)
| pr_comk_fn : forall v σ x e ρ fnv tκ t M Ξ,
              let p := (co v σ) in
              in_force σ (s_closure x e ρ) fnv ->
              PR_red_ceskmk (widemk (wshell p (kpush (fn fnv) tκ) t) M Ξ)
                         (widemk (wshell (ap x e ρ v σ) tκ (tick p)) M Ξ)
| pr_do_apmk : forall x e ρ v σ tκ t M Ξ,
              let p := (ap x e ρ v σ) in
              let a := alloc p in
              let ρ' := extend_ρ x a ρ in
              let σ' := σ_join σ a v in
              let t' := (tick p) in
              let ctx := (context e ρ' σ' t') in
              Unmapped M ctx ->
              PR_red_ceskmk (widemk (wshell p tκ t) M Ξ)
                         (widemk (wshell (ev e ρ' σ') (rt ctx) t') M (Ξ_join Ξ ctx tκ))
| pr_do_memo : forall x e ρ v σ tκ t M Ξ vm σm tm,
              let p := (ap x e ρ v σ) in
              let a := alloc p in
              let ρ' := extend_ρ x a ρ in
              let σ' := σ_join σ a v in
              let ctx := (context e ρ' σ' (tick p)) in
              in_memos M ctx (res vm σm tm) ->
              PR_red_ceskmk (widemk (wshell p tκ t) M Ξ)
                         (widemk (wshell (co vm σm) tκ tm) M (Ξ_join Ξ ctx tκ))
| pr_do_rt : forall v σ t ctx tκ M Ξ,
            let M' := M_join M ctx (res v σ t) in
            in_ctxs Ξ ctx tκ ->
            PR_red_ceskmk (widemk (wshell (co v σ) (rt ctx) t) M Ξ)
                       (widemk (wshell (co v σ) tκ t) M' Ξ).
Hint Constructors red_ceskmk PR_red_ceskmk.

Definition step_all (s : CESKMΞ) : set CESKMΞ :=
  match s with
    | widemk (wshell (ev (var x) ρ σ) tκ t) M Ξ  =>
      match (lookup_ρ x ρ) with
       | None => empty_set _
       | Some a => singleton ceskmξ_eq_dec (widemk (wshell (co (adelay a) σ) tκ (tick (ev (var x) ρ σ))) M Ξ)
      end
    | widemk (wshell (ev (app e0 e1) ρ σ) tκ t) M Ξ =>
      singleton ceskmξ_eq_dec (widemk (wshell (ev e0 ρ σ) (kpush (ar e1 ρ) tκ) (tick (ev (app e0 e1) ρ σ))) M Ξ)
    | widemk (wshell (ev (lam x e) ρ σ) tκ t) M Ξ =>
      singleton ceskmξ_eq_dec (widemk (wshell (co (closure x e ρ) σ) tκ (tick (ev (lam x e) ρ σ))) M Ξ)
    | widemk (wshell (co v σ) (kpush (ar e ρ) tκ) t) M Ξ =>
              singleton ceskmξ_eq_dec (widemk (wshell (ev e ρ σ) (kpush (fn v) tκ) (tick (co v σ))) M Ξ)
    | widemk (wshell (co v σ) (kpush (fn fnv) tκ) t) M Ξ =>
      (* Append forces *)
      fold_right (fun fv acc =>
                    match fv with
                        s_closure x e ρ => set_add ceskmξ_eq_dec
                                                 (widemk (wshell (ap x e ρ v σ) tκ (tick (co v σ))) M Ξ)
                                                 acc
                 end)
                 (empty_set _)
                 (force σ fnv)
    | widemk (wshell (ap x e ρ v σ) tκ t) M Ξ =>
      let a := alloc (ap x e ρ v σ) in
      let ρ' := extend_ρ x a ρ in
      let σ' := σ_join σ a v in
      let t' := (tick (ap x e ρ v σ)) in
      let ctx := (context e ρ' σ' t') in
      let Ξ' := Ξ_join Ξ ctx tκ in
      (* both call and use memo table *)
      match (lookup_M ctx M) with
            | None => singleton ceskmξ_eq_dec (widemk (wshell (ev e ρ' σ') (rt ctx) t') M Ξ')
            | Some rs =>
              fold_right (fun r acc =>
                            match r with
                                res vm σm tm => set_add ceskmξ_eq_dec
                                                     (widemk (wshell (co vm σm) tκ tm) M Ξ')
                                                     acc
                            end)
                         (empty_set _)
                         rs
      end
    | widemk (wshell (co v σ) (rt ctx) t) M Ξ =>
      let M' := M_join M ctx (res v σ t) in
      match (lookup_Ξ ctx Ξ) with
          | None => (empty_set _)
          | Some tκs =>
            fold_right (fun tκ acc =>
                          set_add ceskmξ_eq_dec
                                  (widemk (wshell (co v σ) tκ t) M' Ξ)
                                  acc)
                       (empty_set _) tκs
      end
    | widemk (wshell (co v σ) mt t) M Ξ => empty_set _
  end.

Inductive Wide_step :=
  wide_step : set WCESKMΞ -> set WCESKMΞ_edge -> Memo -> KTable -> Wide_step.

Inductive System :=
  system : set WCESKMΞ -> set WCESKMΞ -> set WCESKMΞ_edge -> Memo -> KTable -> System.

Fixpoint smusher
         (start : WCESKMΞ) (S : set WCESKMΞ) (ss : set CESKMΞ) (nexts : set WCESKMΞ)
         (edges : set WCESKMΞ_edge) (M : Memo) (Ξ : KTable) :=
  match ss with
      nil => wide_step (filter (fun s => if In_dec wceskmξ_eq_dec s S then false else true) nexts) edges M Ξ
    | (widemk s M' Ξ')::ss' => smusher start S ss'
                                       (set_add wceskmξ_eq_dec s nexts)
                                       (set_add wceskmξ_edge_eq_dec (start, s) edges)
                                       (Ms_join M' M)
                                       (Ξs_join Ξ' Ξ)
  end.

Definition smush_steps
           (s : WCESKMΞ) (E : set WCESKMΞ_edge) (M: Memo)
           (Ξ: KTable) (S : set WCESKMΞ) : Wide_step :=
  smusher s S (step_all (widemk s M Ξ)) nil E nil nil.

Definition fresh_ctx (Ξ : KTable) (ctx : Context) : Prop :=
  InDom Ξ ctx /\
  match ctx with
      context e ρ σ t => fresh_ρ_inv σ ρ /\ fresh_σ_inv σ
  end.

Definition fresh_result (r : Result) : Prop :=
  match r with res v σ t => fresh_val_inv σ v /\ fresh_σ_inv σ end.
Definition fresh_memo (M : Memo) (Ξ : KTable) : Prop :=
  forall ctx rs, MapsTo M ctx rs -> fresh_ctx Ξ ctx /\ exists r, rs = (singleton result_eq_dec r) /\ fresh_result r.

Inductive fresh_TrunKont (σ : Store) (Ξ : KTable) : TrunKont -> Prop :=
  mt_fresh : fresh_TrunKont σ Ξ mt
| push_fresh : `{fresh_φ_inv σ φ -> fresh_TrunKont σ Ξ tκ -> fresh_TrunKont σ Ξ (kpush φ tκ)}
| ctx_fresh : `{fresh_ctx Ξ ctx -> fresh_TrunKont σ Ξ (rt ctx)}.

Definition fresh_ktable (σ : Store) (Ξ : KTable) : Prop :=
  forall ctx tκs, MapsTo Ξ ctx tκs -> fresh_ctx Ξ ctx /\ Forall (fresh_TrunKont σ Ξ) tκs.

Definition fresh_inv_wceskmξ (s : WCESKMΞ) (Ξ : KTable) : Prop :=
  match s with
      wshell p tκ t => fresh_TrunKont (store_of p) Ξ tκ /\ fresh_point_inv p
  end.

Definition fresh_inv_ceskmk (s : CESKMΞ) : Prop :=
  match s with
      widemk (wshell p tκ t) M Ξ =>
      fresh_inv_wceskmξ (wshell p tκ t) Ξ /\
      fresh_memo M Ξ /\
      Dom_in_Dom M Ξ /\
      fresh_ktable (store_of p) Ξ
  end.

Lemma fresh_extend_ρ_with_σ_join : forall p ρ x v (fresh : alloc_fresh alloc)
                                          (freshp : fresh_point_inv p)
                                          (freshρ : fresh_ρ_inv (store_of p) ρ)
                                          (freshv : fresh_val_inv (store_of p) v),
                                          fresh_ρ_inv (σ_join (store_of p) (alloc p) v)
                                                      (extend_ρ x (alloc p) ρ).
Proof.
  intros; intros x' a' Hmap; destruct (extend_mapsto_elim name_eq_dec _ _ _ Hmap) as [[Hxeq Haeq]|[Hxneq Hrest]];
  [subst; apply InDom_join'
  |apply freshρ in Hrest; apply InDom_join2']; auto.
Qed.

Lemma fresh_tκ_inv_join : forall σ a v tκ Ξ, fresh_TrunKont σ Ξ tκ -> fresh_TrunKont (σ_join σ a v) Ξ tκ.
Proof.
  intros ? ? ? ? ? H; induction H; try solve [constructor; auto |constructor; [apply fresh_φ_inv_join|]; auto].
Qed.

Lemma fresh_ctx_inv_join : forall Ξ ctx ctx' tκ, fresh_ctx Ξ ctx -> fresh_ctx (Ξ_join Ξ ctx' tκ) ctx.
Proof.
  intros ? [ce cρ cσ ct] ? ? H; destruct H as [Hindom [huh wuh]]; constructor;
  [apply InDom_join2'|]; auto.
Qed.

Lemma fresh_tκ_inv_join2 : forall σ a v tκ Ξ ctx tκ', fresh_TrunKont σ Ξ tκ ->
                                              fresh_TrunKont (σ_join σ a v) (Ξ_join Ξ ctx tκ') tκ.
Proof.
  intros ? ? ? ? ? ? ? H; induction H; try solve [constructor; auto |constructor; [apply fresh_φ_inv_join|]; auto].
  constructor; apply fresh_ctx_inv_join; auto.
Qed.
(*
Inductive fresh_trace (s0 : CESKMΞ) (π : list CESKMΞ) :=
  fresh_inject : fresh_inv_ceskmk s0 -> fresh_trace s0 [s0]
| fresh_step : forall w M Ξ π,
                 fresh_trace s0 (widemk w M Ξ :: π) ->
                 red_ceskmk (widemk w M Ξ) (widemk w' M' Ξ') ->
                 (forall ctx tκs, Unmapped M ctx -> MapsTo Ξ ctx tκs -> (*TODO*)
                                  (~ exists tκ, tκs = singleton trunkont_eq_dec tκ) ->
                                  Unmapped M' ctx) ->
                 fresh_trace s0 ((widemk w' M' Ξ') :: (widemk w M Ξ) :: π).
  


(* Not enough for determinism since we need to know that when |Ξ(ctx)) > 1 and |M(ctx)| = 0,
   then |M(ctx)| will always be 0.
 This will tell us that we will never reach ((co v σ) (rt ctx)) and thus not hit the non-determinism from
 the several tκs in Ξ(ctx). TODO: formally state and prove. *)
Theorem CESKMΞ_fresh_inv : forall s s' (fresh : (alloc_fresh alloc)) 
                                  (Hinv : fresh_inv_ceskmk s)
                                  (Hstep : red_ceskmk s s'),
                             fresh_inv_ceskmk s'.
Proof.
  intros; inversion Hstep as [x ρ σ a tκs ts Ms Ξs ps Hmap Hpeq Hs'eq |
                              e0 e1 ρ σ tκs ts Ms Ξs ps Hpeq |
                              x e ρ σ tκs ts Ms Ξs ps Hpeq Hs'eq |
                              v σ e ρ tκs ts Ms Ξs ps Hpeq Hs'eq |
                              v σ x e ρ fnv tκs ts Ms Ξs ps Hin_force Hpeq Hs'eq |
                              x e ρ v σ tκs ts Ms Ξs ps a ρ' σ' ts' ctx Hunmapped Hpeq Hs'eq |
                              x e ρ v σ tκs ts Ms Ξs vm σm tm ps a ρ' σ' ctx Hinmemos Hpeq Hs'eq |
                              v σ ctx tκs Ms Ξs t's M's Hin_ctxs Hpeq Hs'eq]; subst; try subst ps;
  inversion_clear Hinv as [[freshtκ freshp] [freshM [Hdom freshΞ]]]; simpl in *;
  inversion_clear freshp as [? ? ? freshσ freshρ | ? ? freshv freshσ | ? ? ? ? ? freshv freshρ freshσ]; subst;
  repeat split; auto;
  try solve [inversion freshtκ; auto
            |match goal with [H : MapsTo ?Ms ?ctx ?rs |- _] => apply freshM in H; destruct H; auto end
            |match goal with [H : MapsTo ?Ξ ?ctx ?tκ |- _] =>  apply freshΞ in H; destruct H as [[? ?] ?]; auto end
            |inversion freshtκ; constructor; auto
            |constructor; auto
            |apply MapsTo_In in H;
              assert (Hneed : exists rs, In (ctx,rs) Ms) by (exists rs; auto);
              rewrite <- (InDom_In context_eq_dec) in Hneed;
              apply (Dom_InDom context_eq_dec Hdom Hneed)
            |constructor;
              [apply freshρ in Hmap; unfold fresh_σ_inv,fresh_setmap_inv in freshσ|]; auto
            |match goal with [H : MapsTo ?Ms ?ctx ?rs |- _] =>
                destruct (did_mapsto context_eq_dec Hdom H) as [Tκ Hmaptκ];
                destruct (freshΞ _ _ Hmaptκ) as [[indom mum] ble]; destruct ctx; auto
             end
            |destruct (freshΞ _ _ H) as [[indom mum] ble]; destruct ctx; auto
            |match goal with [H : MapsTo ?Ξs ?ctx ?tκs |- InDom ?Ξs ?ctx] => rewrite (InDom_is_mapped context_eq_dec); exists tκs; auto end
            |match goal with
                 [H : MapsTo ?Ms ?ctx ?rs |- _] =>
                 apply InDom_join2;
                   rewrite (InDom_is_mapped context_eq_dec);
                   apply (did_mapsto context_eq_dec Hdom H)
             end
            |apply Dom_join_right; auto].

  constructor;
    solve [auto
          |inversion Hin_force as [? ? ?|a ss ? Hmap Hin|? ss Hin]; subst;
           inversion freshtκ as [|? ? freshφ|]; subst; auto;
           [apply freshσ in Hmap; destruct Hmap as [s [seq freshs]];
            subst; inversion Hin as [Heq|bad]; [subst;auto|destruct bad]
           |destruct freshφ as [s [seq freshs]]; subst; inversion Hin as [Heq|bad];[subst; auto|destruct bad]]].

  constructor; subst ctx; constructor;
  [apply InDom_join
  |split;[intros x' a' Hmap;
           subst ρ'; unfold extend_ρ in Hmap;
           destruct (extend_mapsto_elim name_eq_dec _ _ _ Hmap) as [[Hxeq Haeq]|[Hxneq Hmap']];
           [subst σ' ts' a' a; subst; apply InDom_join'
           |apply freshρ in Hmap'; apply InDom_join2']
         |subst σ'; apply fresh_σ_join with (p := (ap x e ρ v σ))]]; auto.

  constructor; [subst σ'; apply fresh_σ_join with (p := (ap x e ρ v σ))
               |apply fresh_extend_ρ_with_σ_join with (p := (ap x e ρ v σ))]; auto.

  unfold Ξ_join in H;
    destruct (join_mapsto_elim context_eq_dec κs_join κ_singleton κs_join_extensive κ_singleton_extensive
                               _ _ _ _ (fun ab H => H) H) as [[Hctxeq Hin]|[Hctxneq Hrest]];
    [subst ctx; subst; split;
     [subst σ' ρ'; apply fresh_extend_ρ_with_σ_join with (p := (ap x e ρ v σ))
     |subst σ' ρ' a ts'; apply fresh_σ_join with (p := (ap x e ρ v σ))]
    |apply freshΞ in Hrest; destruct Hrest as [[? ?] ?]]; auto.

  rewrite Forall_forall; intros tκf Hinf;
  assert (Hctx : in_ctxs (Ξ_join Ξs ctx tκs) ctx0 tκf) by (exists tκs0; auto);
  destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec)
       with (l := Ξs) (l' := Ξs) (a := ctx) (a' := ctx0) (c := tκs) (c' := tκf)
    as [[? [? ?]]|[tκsf [Hmap Hin]]];
    [|subst; apply fresh_tκ_inv_join2
     |apply freshΞ in Hmap; destruct Hmap as [? use]; 
      rewrite Forall_forall in use; apply use in Hin; apply fresh_tκ_inv_join2]; auto.

  destruct Hinmemos as [rs [Hmap Hin]].
  apply freshM in Hmap; destruct Hmap as [freshctx [r [rsingleq freshr]]].
  subst; inversion Hin as [|bad]; [subst; inversion freshr; subst|destruct bad].
  (* TODO: use order invariant to get that σm ⊒ σ'. [not necessarily with GC!!! FSCK] *)

  unfold Ξ_join in H;
    destruct (join_mapsto_elim context_eq_dec κs_join κ_singleton κs_join_extensive κ_singleton_extensive
                               _ _ _ _ (fun ab H => H) H) as [[Hctxeq Hin]|[Hctxneq Hrest]].
  subst ctx0; subst.
  apply fresh_tκ_inv_join2.  
  apply

  Ltac bad_fresh_context H Hunmapped :=
    destruct H as [bad' ?];
    rewrite (InDom_is_mapped context_eq_dec) in bad';
    destruct bad' as [badtκs Hbadmap];
    rewrite (unmapped_not_mapped context_eq_dec) in Hunmapped;
    apply Hunmapped in Hbadmap; destruct Hbadmap.

  unfold Ξ_join in H;
    destruct (join_mapsto_elim context_eq_dec κs_join κ_singleton κs_join_extensive κ_singleton_extensive
                               _ _ _ _ (fun ab H => H) H) as [[Hctxeq Hin]|[Hctxneq Hrest]].
  destruct (list_join_mapsto_elim context_eq_dec κs_join κ_singleton _ _ _ _ H)
    as [[ctxeq [[Hunmapped'' Hsingle]|[tκs' [Hmap Hjoin]]]]|[ctxneq Hrest]].
  subst; exists tκs; split;
       [left; split;
        [|subst ctx0; subst; intro bad; subst; inversion freshtκ as [| |? freshctx];
          subst; bad_fresh_context freshctx Hunmapped'']
       |apply fresh_tκ_inv_join2]; auto.

  subst; apply freshΞ in Hmap;
  destruct Hmap as [freshctx unsingle]; subst ctx0;
  specialize (unsingle Hunmapped');
  destruct unsingle as [singletκ [[[singleq nrt]|botheq] freshsingle]];  
  destruct (trunkont_eq_dec (rt (context e ρ' σ' ts')) tκs) as [Hrt|Hnrt].
  
  subst; exists singletκ; split; [|apply fresh_tκ_inv_join2]; auto.
  exists tκs; split; [left;split|]; auto.
  subst.
         |].

      |]
    |]; auto.
  subst;
  destruct (trunkont_eq_dec singletκ tκs) as [|bad];
    [subst; simpl; split_refl trunkont_eq_dec tκs
    |simpl].
  simpl.

  exists tκs; split;
  [unfold Ξ_join in H;
    destruct (join_mapsto_elim context_eq_dec κs_join κ_singleton κs_join_extensive κ_singleton_extensive
                               _ _ _ _ (fun ab H => H) H) as [[Hctxeq Hin]|[Hctxneq Hrest]];
    [destruct (list_join_mapsto_elim context_eq_dec κs_join κ_singleton _ _ _ _ H)
      as [[ctxeq [[Hunmapped' Hsingle]|[tκs' [Hmap Hjoin]]]]|[ctxneq Hrest]];
      [left; split;[|subst ctx0; subst; intro bad; subst; inversion freshtκ as [| |? freshctx];
                     subst; bad_fresh_context freshctx Hunmapped']
      |subst
      |]
    |]
  |apply fresh_tκ_inv_join]; auto.

  apply freshΞ in Hmap;
  destruct Hmap as [freshctx [singletκ [[[singleeq nonrt]|botheq] freshsingle]]];
  [subst
  |].
  destruct (trunkont_eq_dec singletκ tκs) as [tκeq|tκneq];
    [subst; left; split; [simpl; split_refl trunkont_eq_dec tκs|]
    |]; auto.
  assert (lhseq : κs_join Ξs (singleton trunkont_eq_dec singletκ) tκs = [singletκ; tκs]) by
    (simpl; split_refl2 trunkont_eq_dec tκs singletκ);
  rewrite lhseq;
  unfold set_add;
  destruct (trunkont_eq_dec (rt (context e ρ' σ' ts')) tκs) as [eqrt|neqrt].
  [subst;
  inversion freshtκ as [| |? [bad ?]].
  assert (singleq : (singleton trunkont_eq_dec tκs) = [tκs]) by (compute; auto).
  unfold singleton,set_add.
  fold set_add.
  unfold set_add.
  cbv beta.
  simpl.
  remember Hmap as rHmap; clear HeqrHmap.
  subst; apply freshΞ in Hmap.
  destruct Hmap as [freshctx [tκold [[singlemap | withrt] freshtκold]]].
  subst.
  destruct (trunkont_eq_dec tκold tκs) as [tκeq | tκneq].
  left; simpl;subst; split_refl trunkont_eq_dec tκs.
  destruct (trunkont_eq_dec
  right; simpl.
      |

       [subst
       |]
      |]



  case_eq (lookup_Ξ ctx0 Ξs).
  intro tκ_look; unfold lookup_Ξ; rewrite <- lookup_mapsto; intro Hlookeq.
  apply freshΞ in Hlookeq;
  destruct Hlookeq as [freshctx0 [tκex [[singlex|bothex] freshex]]].
  unfold κs_join.
  apply join_an_unmapped in H.
  destruct (freshΞ _ _ H).

  [subst; subst σ' a'; unfold σ_join in Hmap; pose (use := (join_an_unmapped' addr_eq_dec σ_combine force (fresh (ap x e ρ v σ)) (l' := σ) (c := v)))|]]; auto.
  destruct (fresh_force_singleton _ freshσ freshv) as [s seq].
  exists s; rewrite (MapsTo_same Hmap use); split; auto. apply freshM in H; destruct H; auto; au

  destruct Hmap as [ss Hσmap].
  apply freshσ in Hσmap.
  unfold fresh_val_inv.
  inversion freshws as [freshtκ freshp].
  Ltac subgoal Hall :=
    repeat split;
    try (rewrite Forall_forall);
    try solve [auto
              |intros φ Hin; ((inversion Hin; [subst; simpl; auto|]) || idtac); apply Hall; (right || idtac); auto].

(* Tedious, just like CESK's. Omitted for now. *)
Admitted.
*)
Definition unroll_fresh (unroll_fresh_f : KTable -> TrunKont -> Kont) (Ξ : KTable) (tκ : TrunKont) : Kont :=
  match tκ with
      mt => nil
    | kpush φ tκ => φ :: (unroll_fresh_f Ξ tκ)
    | rt ctx => match (lookup_Ξ ctx Ξ) with
                    | None => nil (* should be killable *)
                    | Some tκs => match tκs with
                                     tκ :: nil => unroll_fresh_f Ξ tκ
                                    | (rt ctx') :: tκ :: nil => if context_eq_dec ctx ctx' then
                                                                  unroll_fresh_f Ξ tκ
                                                                else (* must be that tκ is (rt rtx) *)
                                                                  unroll_fresh_f Ξ (rt ctx')
                                    | tκ :: (rt ctx') :: nil => unroll_fresh_f Ξ tκ
                                    | _ => nil (* should be killable *)
                                  end
                end
  end.

(* difficult part: same context seen with no memo table -> context will never be used due to infinite loop *)
Theorem CESKMΞ_deterministic : (alloc_fresh alloc) -> deterministic_modulo red_ceskmk fresh_inv_ceskmk.
Admitted.

Inductive ForallT {A} (P:A->Type) : list A -> Type :=
 | ForallT_nil : ForallT P nil
 | ForallT_cons : forall x l, P x -> ForallT P l -> ForallT P (x::l).
Hint Constructors ForallT.

Theorem PR_finite_steps1 : forall s, forall s', red_ceskmk s s' -> InT s' (step_all s).
Proof.
Admitted.

Theorem PR_finite_steps2 : forall s, forall s', InT s' (step_all s) -> red_ceskmk s s'.
Proof.
Admitted.

Theorem finite_steps : forall s, forall s', red_ceskmk s s' <-> In s' (step_all s).
Proof.
Admitted.

(* Proof relevant or not? *)
Inductive Wide_CESKMΞ : System -> System -> Prop :=
  | big_step : forall s M Ξ Seen F E ss E' M' Ξ',
                 (wide_step ss E' M' Ξ') = (smush_steps s E M Ξ Seen) ->
                 Wide_CESKMΞ (**) (system Seen (s::F) E M Ξ) (**)
                                  (system
                                  (set_union wceskmξ_eq_dec ss (set_add wceskmξ_eq_dec s Seen))
                                  (set_union wceskmξ_eq_dec F ss)
                                  E' M' Ξ').

Definition inject_wide_ceskmk (e : Expr) := (system [(inject_wceskmk e)] [(inject_wceskmk e)] nil nil nil).
Definition CESKMΞ_trace (e : Expr) :=
  Trace red_ceskmk (inject_ceskmk e).
Definition WCESKMΞ_trace (e : Expr) :=
  Trace Wide_CESKMΞ (system [(inject_wceskmk e)] [(inject_wceskmk e)] nil nil nil).

Inductive StackUnroll (Ξ : KTable) : Kont -> TrunKont -> Prop :=
  unroll_mt : `{StackUnroll Ξ nil mt}
| unroll_push : forall κ tκ φ, StackUnroll Ξ κ tκ -> StackUnroll Ξ (φ :: κ) (kpush φ tκ)
| unroll_rt : forall ctx tκ κ,
                StackUnroll Ξ κ tκ ->
                in_ctxs Ξ ctx tκ ->
                StackUnroll Ξ κ (rt ctx).

Ltac textend_map := apply in_list_join2;solve [
                             intros; apply set_add_intro1; auto
                            | intros; apply set_add_intro2; auto
                            | auto].

Theorem unroll_with_extension : forall
        (Ξ : KTable) (ctx : Context) (κ : Kont) (tκ tκ' : TrunKont)
        (hyp : StackUnroll Ξ κ tκ), StackUnroll (Ξ_join Ξ ctx tκ') κ tκ.
Proof.
  intros Ξ ctx κ tκ tκ' hyp; induction hyp;[
    constructor
   |constructor; assumption
   |apply unroll_rt with (tκ := tκ); [|textend_map]; auto].
Qed.

Ltac inject_push :=
  match goal with [H: kpush ?φ0 ?tκ0 = kpush ?φ1 ?tκ1 |- _] => injection H; intros;
                                                               try (subst φ1 tκ1); try subst end.

Inductive Unroll_inv : KTable -> TrunKont -> Prop :=
  unroll_inv : forall Ξ κ tκ,
                 StackUnroll Ξ κ tκ ->
                 (forall ctx tκ', in_ctxs Ξ ctx tκ' -> exists κ', StackUnroll Ξ κ' tκ') ->
                 Unroll_inv Ξ tκ.

Lemma unrolling_inv : forall p p' tκ tκ' t t' M M' Ξ Ξ'
                             (Hstep : red_ceskmk (widemk (wshell p tκ t) M Ξ)
                                                 (widemk (wshell p' tκ' t') M' Ξ'))
                             (Hinv : Unroll_inv Ξ tκ),
                             Unroll_inv Ξ' tκ'.
Proof with auto.
  intros; inversion Hstep as [x ρ σ a tκs ts Ms Ξs ps Hmap Hpeq Hs'eq |
                              e0 e1 ρ σ tκs ts Ms Ξs ps Hpeq |
                              x e ρ σ tκs ts Ms Ξs ps Hpeq Hs'eq |
                              v σ e ρ tκs ts Ms Ξs ps Hpeq Hs'eq |
                              v σ x e ρ fnv tκs ts Ms Ξs ps Hin_force Hpeq Hs'eq |
                              x e ρ v σ tκs ts Ms Ξs ps a ρ' σ' ts' ctx Hunmapped Hpeq Hs'eq |
                              x e ρ v σ tκs ts Ms Ξs vm σm tm ps a ρ' σ' ctx Hinmemos Hpeq Hs'eq |
                              v σ ctx tκs Ms Ξs t's M's Hin_ctxs Hpeq Hs'eq];
  inversion Hinv as [? κ ? Hunroll HΞ]; subst;
  try solve [apply unroll_inv with (κ := κ); auto
            |apply unroll_inv with (κ := ((ar e1 ρ)::κ)); [constructor|];auto
            |inversion Hunroll as [|κκ|]; subst;
             solve [discriminate | apply unroll_inv with (κ := ((fn v)::κκ)); [constructor|];auto]
            |inversion Hunroll as [|κκ|]; subst;
             solve [discriminate | apply unroll_inv with (κ := ((fn fnv)::κκ)); [constructor|];auto]].
  (* fn -> ap *)
  inversion Hunroll as [|κκ|]; apply unroll_inv with (κ := κκ); auto.
  (* unmemoized ap *)
  apply unroll_inv with (κ := κ);[
  apply unroll_rt with (tκ := tκ);
      [apply unroll_with_extension
      |apply in_list_join; solve [intros; apply set_add_intro2; auto | auto]]; auto
  |].
  intros ctx_ tκ_ Hin_;
  destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec)
       with (l := Ξ) (l' := Ξ) (a := ctx) (a' := ctx_) (c := tκ) (c' := tκ_)
    as [[? ?]|S1]; auto;
  [exists κ; apply unroll_with_extension; subst; intuition (subst; auto)
  |destruct (HΞ ctx_ tκ_) as [κ' ?]; auto;
    unfold in_ctxs; subst; exists κ'; apply unroll_with_extension; auto].
  (* memoized ap *)
  subst;
  apply unroll_inv with (κ := κ);
    [apply unroll_with_extension
    |intros ctx_ tκ_ Hin_;
      destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec)
       with (l := Ξ) (l' := Ξ) (a := ctx) (a' := ctx_) (c := tκ') (c' := tκ_)
       as [[? ?]|S1]; auto;[intuition; subst tκ_; exists κ; apply unroll_with_extension
       |destruct (HΞ ctx_ tκ_) as [κ' ?]; solve [exists κ'; apply unroll_with_extension; auto
                                                       |auto]]]; auto.
  (* return and memoize *)
  subst;
  destruct (HΞ ctx tκ') as [κ' ?]; auto.
  apply unroll_inv with (κ := κ'); auto.
Qed.

Section StackIrrelevance.
Inductive hastail (κ : Kont) : list CESK -> Prop :=
  Nil_tail : hastail κ nil
| Cons_tail : forall π p κ' t, hastail κ π -> KontTail κ κ' ->
                           hastail κ ((shell p κ' t) :: π).
Hint Constructors hastail.

Lemma hastail_nil : forall π, hastail [] π.
Proof. induction π; solve [auto | destruct a; apply (Cons_tail _ _ IHπ kont_tail_nil)]. Qed.

Lemma hastail_app : forall κ π π', hastail κ π -> hastail κ π' -> hastail κ (π ++ π').
Proof.
  induction π as [|s π IH]; intros π' πT π'T; [|simpl;inverts πT]; auto.
Qed.

(* Tail_replacement κorig κtail κreplacement κresult *)
Inductive Tail_replacement : Kont -> Kont -> Kont -> Kont -> Prop :=
| tail_replacement : `{Tail_replacement κ κ κ'' κ''}
| push_replacement : `{Tail_replacement κ κ' κ'' κ''' ->
                       Tail_replacement (φ::κ) κ' κ'' (φ::κ''')}.

Lemma good_tailrep : forall κorig κtail κrep,
                       Tail_replacement (κorig++κtail) κtail κrep (κorig ++ κrep).
Proof.
  induction κorig as [|φ κ_ IH]; intros;simpl; constructor; apply IH.
Qed.

Fixpoint replacetail_kont (κ κ' κ'' : Kont) : option Kont :=
  match (kont_eq_dec κ κ') with
  | left _ => Some κ''
  | right _ => match κ with
               | nil => None
               | φ::κ_ => match replacetail_kont κ_ κ' κ'' with
                            | None => None
                            | Some κ''_ => Some (φ::κ''_)
                          end
               end
  end.

Definition replacetail_kont_good : forall κ κ' κ'' (Htail : KontTail κ' κ),
                                     exists κ''', replacetail_kont κ κ' κ'' = Some κ'''.
induction κ as [|φ κ_ IH]; intros;
[exists κ''; inverts Htail; simpl; reflexivity
|inversion Htail as [|? ? ? Htail']; subst;
  [(* tail base case: κ = κ' *) exists κ''; unfold replacetail_kont; split_refl kont_eq_dec (φ :: κ_)
  |destruct (kont_eq_dec (φ :: κ_) κ') as [Heq | Hneq];
    [subst; exists κ''; unfold replacetail_kont; split_refl kont_eq_dec (φ :: κ_)
    |set (mumble := IH κ' κ'' Htail');
      inversion mumble as [κ''' Heq]; subst;
      exists (φ :: κ'''); unfold replacetail_kont; split_refl2 kont_eq_dec (φ :: κ_) κ'; fold replacetail_kont; rewrite Heq]; auto]].
Qed.

Definition replacetail_state (s : CESK) (κ' κ'' : Kont) :=
  match s with
      shell p κ t => match replacetail_kont κ κ' κ'' with
                         None => None
                       | Some κ_ => Some (shell p κ_ t)
                     end
  end.

Lemma replacetail_state_good : forall s κ' κ'' (Htail : match s with shell p κ t => KontTail κ' κ end),
                                 exists s', replacetail_state s κ' κ'' = Some s'.
Proof.
  intros; destruct s as [p κ t]; set (good := replacetail_kont_good κ'' Htail);
  inversion good as [κ''' Hgood]; subst;
  exists (shell p κ''' t);
  unfold replacetail_state; rewrite Hgood; auto.
Qed.

Fixpoint replacetail (π : list CESK) (κ' κ'' : Kont) : list (option CESK) :=
  match π with
      nil => nil
    | ς :: π' => (replacetail_state ς κ' κ'') :: (replacetail π' κ' κ'')
  end.

Theorem replacetail_good : forall (π : list CESK) (κ' κ'' : Kont) (Htail : hastail κ' π),
  exists (π' : list CESK), (replacetail π κ' κ'') = (map (@Some CESK) π').
Proof.
  induction π; intros.
  exists nil; simpl; auto.
  inversion Htail as [|? p κ_ t Htail' κtail]; subst.
  destruct (replacetail_state_good (shell p κ_ t) κ' κ'' κtail) as [s' Heq].
  destruct (IHπ κ' κ'' Htail') as [π' Heq'].
  exists (s' :: π'); simpl.
  unfold replacetail_state in Heq; rewrite Heq, Heq'; auto.
Qed.

Lemma replacetail_kont_complete : forall κ κ' κ'' κ''', replacetail_kont κ κ' κ'' = Some κ''' ->
                                                        KontTail κ'' κ'''.
Proof.
  induction κ as [|φ κ IH]; intros κ' κ'' κ''' Heq; unfold replacetail_kont in Heq.  
destruct (kont_eq_dec [] κ'); [injects Heq; constructor|discriminate].
destruct (kont_eq_dec (φ :: κ) κ') as [Heq'|Hneq].
injects Heq; constructor.
fold replacetail_kont in Heq; case_eq (replacetail_kont κ κ' κ'');
[intros κ'''_ Heq_; rewrite Heq_ in Heq; apply IH in Heq_;injects Heq; auto
|intro Heq_; rewrite Heq_ in Heq; discriminate].
Qed.

Lemma replacetail_state_complete : forall s κ' κ'' s', replacetail_state s κ' κ'' = Some s' ->
                                                       match s' with
                                                           shell _ κ''' _ => KontTail κ'' κ'''
                                                       end.
Proof.
  intros [? κ ?] κ' κ'' [? κ'''_ ?] Hrep;
  simpl in Hrep;
  case_eq (replacetail_kont κ κ' κ''); [intro κ'''|]; intros Heq; rewrite Heq in Hrep;
  [injects Hrep;apply replacetail_kont_complete in Heq; auto|discriminate].
Qed.  

Lemma replacetail_kont_same : forall κ κ', replacetail_kont κ κ κ' = Some κ'.
Proof.
  intros; destruct κ as [|φ κ];
  [reflexivity
  |unfold replacetail_kont; destruct (kont_eq_dec (φ :: κ) (φ :: κ)); [reflexivity|bad_eq]].
Qed.

Lemma replacetail_complete : forall π κ' κ'' π', replacetail π κ' κ'' = map (@Some CESK) π' ->
                                                 hastail κ'' π'.
Proof.
  induction π as [|s π IH]; intros κ' κ'' π' Heq; simpl in Heq.
  destruct π';[constructor|simpl in Heq; discriminate].
  destruct π' as [|[p κ''' t] π'];[discriminate|injection Heq; intros H H0; apply IH in H].
  pose (L:= replacetail_state_complete _ _ _ H0); 
  constructor; auto.
Qed.

Lemma no_circular_cons : forall A a (l : list A), l <> a :: l.
Proof.
  intros; intro bad;
  assert (H : length l = S (length l)) by (rewrite bad at 1; simpl; auto);
  contradict H; omega.
Qed.

Lemma no_circular_app : forall A (l l' : list A), length l > 0 -> l' <> l ++ l'.
Proof.
  intros; intro bad.
  assert (H' : length l' = (length l) + (length l')) by (rewrite bad at 1; rewrite app_length; reflexivity).
  contradict H; omega.
Qed.

Lemma no_longer_kont_tail : forall κ κmore, length κmore > 0 -> ~ KontTail (κmore ++ κ) κ.
Proof.
  induction κ.
  induction κmore; intros; [inversion H|intro bad; inversion bad].
  intros κmore H bad.
  apply IHκ with (κmore := κmore ++ [a]).
  rewrite app_length; omega.
  rewrite app_assoc_reverse; simpl.
  inversion bad as [bad0 bad1 bad2|bad0 bad1 bad2 bad3 bad4 bad5];
                             [symmetry in bad2; apply no_circular_app in bad2; [contradiction|]
                             |subst]; auto.
Qed.

Lemma no_conflicting_kont_tail : forall κ φ φ' (H : φ <> φ'), ~ KontTail (φ :: κ) (φ' :: κ).
Proof.
  induction κ; intros φ φ' H bad;
  inversion bad as [|? ? ? bad3];
  solve [contradiction|inversion bad3
         |subst;
           assert (goal : ~ KontTail ([φ] ++ (a :: κ)) (a :: κ)) by (apply no_longer_kont_tail; simpl; omega);
           simpl in goal; auto].
Qed.

Lemma no_longer_tail_replacement : forall κ κ' κmore,
                                      length κmore > 0 ->
                                      replacetail_kont κ (κmore ++ κ) κ' = None.
Proof.
  induction κ as [|φ κ_ IH].
  intros; simpl; rewrite app_nil_r; destruct κmore; [contradict H;simpl; omega|reflexivity].
  intros.
  unfold replacetail_kont.
  destruct (kont_eq_dec (φ :: κ_) (κmore ++ φ :: κ_)) as [bad|Hneq].
  apply no_circular_app in bad; [contradiction|auto].
  fold replacetail_kont.
  intros.
  assert (R : κmore ++ φ :: κ_ = κmore ++ [φ] ++ κ_) by (simpl; reflexivity).
  rewrite R.
  rewrite app_assoc with (m := [φ]).
  rewrite IH; [auto| rewrite app_length; omega].
Qed.

Lemma no_longer_tail_replacement2 : forall κ κ' φ, replacetail_kont κ (φ :: κ) κ' = None.
Proof.
  intros; assert (goalapp : replacetail_kont κ ([φ] ++ κ) κ' = None);
  [apply no_longer_tail_replacement; simpl;omega|simpl].
  simpl in goalapp; auto.
Qed.

Lemma no_conflicting_tail_replacement : forall κ κ' φ φ' (H : φ <> φ'), replacetail_kont (φ :: κ) (φ' :: κ) κ' = None.
Proof.
  induction κ as [|φ κ_ IH]; intros.
  unfold replacetail_kont; destruct (kont_eq_dec [φ] [φ']) as [bad|]; [injection bad; intros; contradiction|auto].
  unfold replacetail_kont; destruct (kont_eq_dec (φ0 :: φ :: κ_) (φ' :: φ :: κ_)) as [bad|];
  [injection bad; intros; contradiction
  |fold replacetail_kont].
  destruct (kont_eq_dec (φ :: κ_) (φ' :: φ :: κ_)) as [bad|];
    [injection bad; intros toolong;apply no_circular_cons in toolong; contradiction
    |rewrite no_longer_tail_replacement with (κmore := [φ' ; φ]); [reflexivity | simpl; omega]].
Qed.

Lemma replacetail_preserves_trace : forall s π, Trace red_cesk s π ->
                                                forall κ' κ'' s',
                                                  replacetail_state s κ' κ'' = Some s' ->
                                                  forall π',
                                                    replacetail π κ' κ'' = map (@Some CESK) π' ->
                                                    Trace red_cesk s' π'.
Proof.
  intros [p κ t] π HT; induction HT; intros κ' κ'' s' Hreps π' Hrep;
  (destruct π' as [|sr π']; simpl in Hrep; [discriminate|injection Hrep; intros H_ H0; destruct π';[|try discriminate]];
  simpl in Hreps;
  (case_eq (replacetail_kont κ κ' κ''); [intro κ_|]; intro Hreq; try discriminate; try rewrite Hreq in H0; try discriminate; try rewrite Hreq in Hreps; try injects H0; try injects Hreps; try rewrite Hreq in Hreps; try discriminate)).
  constructor.
  injection Hrep; intros Hπ Hs Hs'.
  cut (replacetail_state (shell p κ t) κ' κ'' = Some (shell p κ_ t));
    [intro use; specialize (IHHT _ _ _ use (c :: π'))|simpl; rewrite Hreq; reflexivity].
  cut (replacetail (ς :: π) κ' κ'' = map (@Some CESK) (c :: π'));
    [intro use'; specialize (IHHT use')|simpl; f_equal; auto].
  constructor; auto.
  destruct c as [cp cκ ct]; destruct ς as [sp sκ st]; destruct sr as [rp rκ rt]; destruct ς' as [sp' sκ' st'].
  simpl in Hs,Hs'.
  inversion H as [x ρ σ a κs ts ps Hmap
                 |e0 e1 ρ σ κs ts ps Hpeq
                 |x elam ρ σ κs ts ps Hpeq Hs'eq
                 |v σ e ρ κs ts ps Hpeq Hs'eq
                 |v σ x e ρ fnv κs ts ps Hin_force Hpeq Hs'eq
                 |x e ρ v σ κs ts ps a ρ' σ' Hpeq Hs'eq]; subst; subst;
  try
  (case_eq (replacetail_kont sκ' κ' κ''); [intro sκ_'|];
   intro Hseq'; rewrite Hseq' in Hs',Hs;
   [injects Hs'; injects Hs; try (constructor; auto)|discriminate]).

  case_eq (replacetail_kont sκ κ' κ''); [intro sκ_|];
   intro Hseq; try rewrite Hseq in Hs; [injects Hs|discriminate];
   unfold replacetail_kont in Hs'; fold replacetail_kont in Hs';
  destruct (kont_eq_dec (ar e1 ρ :: sκ) κ') as [Heq|Hneq];
    [injects Hs'; rewrite no_longer_tail_replacement2 in Hseq; discriminate
    |rewrite Hseq in Hs'; injects Hs';constructor; auto].

  unfold replacetail_kont in Hs,Hs'; fold replacetail_kont in Hs,Hs';
  destruct (kont_eq_dec (ar e ρ :: κs) κ') as [Heq|Hneq];
  [subst;
    destruct (kont_eq_dec (fn v :: κs) (ar e ρ :: κs)) as [bad|Hneq'];
    [|rewrite no_longer_tail_replacement2 in Hs'];discriminate
  |case_eq (replacetail_kont κs κ' κ''); [intro κs_|];
   intro Hseq; rewrite Hseq in Hs,Hs'; [injects Hs|discriminate];
   destruct (kont_eq_dec (fn v :: κs) κ') as [Heq'|Hneq']; injects Hs';
   [rewrite no_longer_tail_replacement2 in Hseq; discriminate
   |constructor; auto]].
  
  case_eq (replacetail_kont sκ' κ' κ''); [intro sκ'_|]; intro Heq'; rewrite Heq' in Hs';
  [injects Hs'|discriminate].
  unfold replacetail_kont in Hs; fold replacetail_kont in Hs;
  destruct (kont_eq_dec (fn fnv :: sκ') κ') as [Heq|Hneq];
  [injects Hs; rewrite no_longer_tail_replacement2 in Heq'; discriminate
  |rewrite Heq' in Hs; injects Hs; constructor; auto].
Qed.

Inductive ctx_of : TrunKont -> Context -> Prop :=
  | push_ctx : `{ctx_of tκ ctx -> ctx_of (kpush φ tκ) ctx}
  | rt_ctx : `{ctx_of (rt ctx) ctx}.
Inductive no_ctx : TrunKont -> Prop :=
  | push_noctx : `{no_ctx tκ -> no_ctx (kpush φ tκ)}
  | mt_noctx : no_ctx mt.
Hint Constructors ctx_of no_ctx.

Fixpoint get_ctx (tκ : TrunKont) : option Context :=
  match tκ with
      mt => None
    | kpush _ tκ => get_ctx tκ
    | rt ctx => Some ctx
  end.
Theorem reflect_ctx : forall tκ ctx, ctx_of tκ ctx <-> get_ctx tκ = Some ctx.
Proof. induction tκ; intuition solve [inversion H; auto
                                     |constructor; rewrite IHtκ; auto
                                     |inverts H; simpl; rewrite <- IHtκ; auto].
Qed.

Theorem reflect_no_ctx : forall tκ, no_ctx tκ <-> get_ctx tκ = None.
Proof. induction tκ; intuition.
inversion H1; auto.
inversion H.
discriminate.
Qed.

(* not only is the context mapped, there is at least one thing in there *)
Definition ctx_in_dom (Ξ : KTable) (tκ : TrunKont) :=
  forall ctx : Context, `{ctx_of tκ ctx -> exists tκ, in_ctxs Ξ ctx tκ}.

Inductive Tailed_Trace : forall (p : CES_point) (κ : Kont) (t : Time) (p' : CES_point) (κ' : Kont) (t' : Time), Prop :=
  tailt : `{Trace red_cesk
                  (shell p κ t)
                  ((shell p' κ' t') :: π)
            -> (hastail κ π) -> KontTail κ κ' ->
            Tailed_Trace p κ t p' κ' t'}.

(* prove option versions save with hastail so this goes through *)

Inductive Stack_Irrelevant : CESK -> Kont -> Kont -> list CESK -> Prop :=
  irrelevant_intro : forall s s' π π' κ' κ'',
                       (replacetail_state s κ' κ'') = Some s' ->
                       (replacetail π κ' κ'') = (map (@Some CESK) π') ->
                       Trace red_cesk s' π' ->
                       Stack_Irrelevant s κ' κ'' π.

Ltac grumble H_ := try solve [simpl; rewrite H_; reflexivity | constructor].
Lemma stack_irrelevance : forall p κ t π κ' κ''
                                 (orig : Trace red_cesk (shell p κ t) π)
                                 (tail0 : KontTail κ' κ)
                                 (Htail : hastail κ' π),
                            Stack_Irrelevant (shell p κ t) κ' κ'' π.
Proof.
  intros; destruct (replacetail_kont_good κ'' tail0) as [κ_ H_]; subst.
  induction orig as [|s0 π0 s1 HT ? Hstep].
  apply irrelevant_intro with (s' := (shell p κ_ t)) (π' := [shell p κ_ t]); grumble H_.
  (* Step *)
  inversion Htail as [|? pt κt tt Htail' κtail];
  destruct (replacetail_kont_good κ'' κtail) as [κt_ Ht_]; subst.
  set (use := IHorig Htail'); inversion use as [? s' ? [|[p0' κ0' t0'] π'] ? ? Hreps Hrep HT'];
    subst; clear use; try solve [inversion HT'].
  assert (s'eq : s' = shell p κ_ t) by (simpl in Hreps; rewrite H_ in Hreps; injection Hreps; auto); subst.
  simpl in Hrep; injection Hrep; intros πeq seq; clear Hrep.
  Ltac ε out p0' κ0' t0' pp κt_ ts s0'eq Ht_ H_ πeq initial pfrom pto π' σ := assert (out : shell p0' κ0' t0' = shell pp κt_ ts); (subst; simpl in s0'eq; rewrite Ht_ in s0'eq; try injection s0'eq; intros; subst; subst p0'; auto);
       apply (irrelevant_intro _ _ (s' := initial)
              (π' := (shell pto κ0' (tick pfrom)) :: (shell pfrom κ0' t0') :: π'));
  [grumble H_
  |unfold replacetail,replacetail_state,map; fold replacetail; fold map; f_equal;
   rewrite Ht_;[auto|f_equal; apply πeq]
  |repeat constructor; auto].

  Ltac push out p0' κ0' t0' κs κ' κ'' pp φ κt_ ts seq Ht_ :=
    assert (out : (shell p0' (φ :: κ0') t0') = shell pp κt_ ts) by
      (subst; simpl in seq; unfold replacetail_kont in Ht_;
       destruct (kont_eq_dec (φ :: κs) κ') as [Heq | Hneq];
       [injection Ht_; intros; subst; rewrite (no_longer_tail_replacement2 κs κt_ φ) in seq; discriminate
       |fold replacetail_kont in Ht_;
         destruct (replacetail_kont κs κ' κ'') as [preκt|]; [|discriminate];
         injection Ht_; injection seq; intros; subst; subst p0'; auto]).

  inversion Hstep as [x ρ σ a κs ts (* <- time *) pp Hmap Hpeq Hs'eq | (* var *)
                      e0 e1 ρ σ κs ts pp Hpeq | (* app *)
                      x e ρ σ κs ts pp Hpeq Hs'eq | (* lam *)
                      v σ e ρ κs ts pp Hpeq Hs'eq | (* arg *)
                      v σ x e ρ fnv κs ts pp Hin_force Hpeq Hs'eq | (* fn -> ap *)
                      x e ρ v σ κs ts pp a ρ' σ' Hpeq Hs'eq];
    [(* var : ε*)
      ε s0'eq p0' κ0' t0' pp κt_ ts seq Ht_ H_ πeq (shell p κ_ t) (ev (var x) ρ σ) (co (adelay a) σ) π' σ
    |(* app : push*)
    push s0'eq' p0' κ0' t0' κs κ' κ'' pp (ar e1 ρ) κt_ ts seq Ht_;
  apply irrelevant_intro with (s' := (shell p κ_ t)) (π' := (shell (ev e0 ρ σ) ((ar e1 ρ)::κ0') tt) :: (shell (ev (app e0 e1) ρ σ) κ0' t0') :: π'); injection s0'eq'; intros; subst;
   [grumble H_
   |unfold replacetail,replacetail_state,map; fold replacetail; fold map; f_equal;
    [rewrite Ht_|repeat f_equal]; auto
   |repeat constructor; auto]
    |(* lam : ε*)
    ε s0'eq p0' κ0' t0' pp κt_ ts seq Ht_ H_ πeq (shell p κ_ t) (ev (lam x e) ρ σ) (co (closure x e ρ) σ) π' σ
    |(* arg : exchange *)
    subst;
      assert (unf0 : exists κt_t, κt_ = fn v :: κt_t /\ replacetail_kont κs κ' κ'' = Some κt_t) by
        (unfold replacetail_kont in Ht_; fold replacetail_kont in Ht_;
         destruct (kont_eq_dec (fn v :: κs) κ') as [Heq | Hneq];
         [injection Ht_; intros; subst;
          unfold replacetail_state in seq;
          assert (badframe : (ar e ρ) <> (fn v)) by discriminate;
          rewrite (no_conflicting_tail_replacement κs κt_ badframe) in seq; discriminate
         |destruct (replacetail_kont κs κ' κ'') as [κt_t|];
           [exists κt_t; injection Ht_; intros; subst; split; auto
                  |discriminate]]);
      destruct unf0 as [κt_t [Hκt Hκs]];

      assert (Ht_' : replacetail_kont (ar e ρ :: κs) κ' κ'' = Some (ar e ρ :: κt_t)) by
          (unfold replacetail_kont; fold replacetail_kont;
           rewrite Hκs;
           destruct (kont_eq_dec (ar e ρ :: κs) κ') as [Heq | Hneq];
           [(* can't be equal, since then ar e ρ :: κs is a tail of fn v :: κs *)
             inversion Htail as [bad0|bad0 bad1 bad2 bad3 bad4 bad5]; subst;
            assert (badframe : (ar e ρ) <> (fn v)) by discriminate;
            apply (no_conflicting_kont_tail badframe) in bad5; contradiction
            |auto]);

      assert (unf1 : κ0' = ar e ρ :: κt_t /\ p0' = pp) by
          (unfold replacetail_state,replacetail_kont in seq; fold replacetail_kont in seq;
           rewrite Hκs in seq;
           destruct (kont_eq_dec (ar e ρ :: κs) κ') as [Heq | Hneq];
           [(* can't be equal, since then ar e ρ :: κs is a tail of fn v :: κs *)
             inversion Htail as [bad0|bad0 bad1 bad2 bad3 bad4 bad5]; subst;
            assert (badframe : (ar e ρ) <> (fn v)) by discriminate;
            apply (no_conflicting_kont_tail badframe) in bad5; contradiction
            |injection seq; intros; subst; split; auto]);
      destruct unf1 as [Hκ0' Hpeq];

      assert (s0'eq' : (shell p0' (fn v :: κt_t) t0') = shell pp κt_ ts) by
          (unfold replacetail_state in seq;
           destruct (replacetail_kont (ar e ρ :: κs) κ' κ''); [|discriminate];
           injection seq; intros; subst; auto);

      apply irrelevant_intro with (s' := (shell p κ_ t))
                                    (π' := (shell (ev e ρ σ) (fn v :: κt_t) (tick pp)) ::
                                           (shell pp ((ar e ρ)::κt_t) t0') :: π');
      [grumble H_
      |unfold replacetail, replacetail_state,map; fold replacetail; fold map; f_equal;
       [rewrite Ht_; subst; auto
       |f_equal; [rewrite Ht_';injection s0'eq'; intros; subst; auto
                 |apply πeq]]
    |subst; repeat constructor; auto]
    |(* fn -> ap : pop*)
    subst;
      assert (Ht_' : replacetail_kont (fn fnv :: κt) κ' κ'' = Some (fn fnv :: κt_)) by
        (unfold replacetail_kont; fold replacetail_kont;
         destruct (kont_eq_dec (fn fnv :: κt) κ') as [Heq | Hneq];
         [(* can't be equal, since then ar e ρ :: κs is a tail of fn v :: κs *)
           inversion Htail as [bad0|bad0 bad1 bad2 bad3 bad4 bad5]; subst;
          assert (badframe : (ar e ρ) <> (fn v)) by discriminate;
          assert (contr : ~ KontTail ([fn fnv] ++ κt) κt) by (apply no_longer_kont_tail; simpl; omega);
          simpl in contr; contradiction
          |rewrite Ht_; auto]);

      unfold replacetail_state in seq; rewrite Ht_' in seq; injection seq; intros; subst;
      apply irrelevant_intro with (s' := (shell p κ_ t))
                                    (π' := (shell (ap x e ρ v σ) κt_ (tick p0')) ::
                                           (shell p0' ((fn fnv)::κt_) t0') :: π');
    [grumble H_
    |unfold replacetail, replacetail_state,map; fold replacetail; fold map; f_equal;
     [rewrite Ht_; subst
     |f_equal; [rewrite Ht_'|]]; auto
    |subst p0'; repeat constructor; auto]
    |(* do ap : ε *)
     ε s0'eq p0' κ0' t0' pp κt_ ts seq Ht_ H_ πeq (shell p κ_ t) (ap x e ρ v σ) (ev e ρ' σ') π' σ].
Qed.

End StackIrrelevance.

(* should only be used when we know that κ results from unrolling rt. *)
Fixpoint trunkont_append_kont (tκ : TrunKont) (κ : Kont) :=
  match tκ with
      mt => []
    | kpush φ tκ' => φ::(trunkont_append_kont tκ' κ)
    | rt _ => κ
  end.

Lemma append_unroll : forall Ξ tκ κ ctx,
                        (ctx_of tκ ctx /\ StackUnroll Ξ κ (rt ctx)) \/ no_ctx tκ ->
                        StackUnroll Ξ (trunkont_append_kont tκ κ) tκ.
induction tκ; intros κ ctx H; destruct H as [[Hctx Hunroll]|Hmt];
try solve [inversion Hctx
          |simpl; constructor; apply (IHtκ κ ctx); inversion Hctx; auto
                              |inverts Hctx; assumption].
simpl; constructor; apply (IHtκ κ ctx); right; inversion Hmt; auto.
inversion Hmt.
Qed.


Lemma append_unroll_rt : forall Ξ tκ' κ ctx,
                         in_ctxs Ξ ctx tκ' ->
                         match get_ctx tκ' with
                             Some ctx' => StackUnroll Ξ κ (rt ctx')
                           | None => κ = []
                         end ->
                        StackUnroll Ξ (trunkont_append_kont tκ' κ) (rt ctx).
Proof.
  intros Ξ tκ' κ ctx Hinctx Hunroll.
  eapply (unroll_rt _ Hinctx).
  Grab Existential Variables.
  case_eq (get_ctx tκ'); [intros ctx' Heqctx|intros Hnone].
  - rewrite Heqctx in Hunroll.
  rewrite <- reflect_ctx in Heqctx.
  apply append_unroll with (ctx := ctx'); auto.
  - rewrite Hnone in Hunroll.
    rewrite <- reflect_no_ctx in Hnone.
    subst; apply (@append_unroll Ξ _ [] ctx (or_intror Hnone)).
Qed. 

Lemma append_tail : forall tκ κ ctx, ctx_of tκ ctx -> KontTail κ (trunkont_append_kont tκ κ).
Proof.
  induction tκ;
  [intros ? ? bad; inversion bad
  |intros ? ? toinv; inverts toinv; simpl; constructor; apply (IHtκ _ ctx)
  |]; auto.
Qed. 

Fixpoint trunkont_length (tκ : TrunKont) :=
  match tκ with
      mt => 0
    | kpush φ tκ' => S (trunkont_length tκ')
    | rt _ => 0
  end.

Lemma trunkont_append_kont_length : forall tκ κ ctx, ctx_of tκ ctx -> length (trunkont_append_kont tκ κ) = trunkont_length tκ + length κ.
Proof.
  induction tκ as [|φ tκ IH|ctx']; intros κ ctx H.
  inversion H.
  simpl; f_equal.
  inversion H; apply (IH _ ctx); auto.
  simpl; reflexivity.
Qed.

Lemma no_circular_trunkont_append : forall φ tκ κ ctx, ctx_of tκ ctx -> ~ φ :: trunkont_append_kont tκ κ = κ.
Proof.
  intros.
  intro bad.
  cut (length (φ :: trunkont_append_kont tκ κ) = length κ);[intro crap|rewrite bad; reflexivity].
  simpl in crap.
  rewrite (@trunkont_append_kont_length _ _ ctx H) in crap.
  omega.
Qed.

Lemma append_with_ctx_exists :
  forall tκ ctx, ctx_of tκ ctx ->
                 forall κ κ',
                 exists κ'', replacetail_kont (trunkont_append_kont tκ κ) κ κ' = Some κ''.
Proof.
  induction tκ as [|φ tκ IH|ctx]; intros ctx' Hctx κ κ'; inversion Hctx as [? ? ? Hctx'|]; subst.

  destruct (IH _ Hctx' κ κ') as [κ'' Heq].
  exists (φ::κ''); unf trunkont_append_kont; unf replacetail_kont.
  destruct (kont_eq_dec (φ :: trunkont_append_kont tκ κ) κ) as [bad|];
    [destruct (@no_circular_trunkont_append _ _ _ _ Hctx' bad)|rewrite Heq; auto].

  exists κ'; simpl; rewrite replacetail_kont_same; reflexivity.
Qed.

Lemma append_replace : forall tκ ctx,
                         ctx_of tκ ctx ->
                         forall (κ' κ'' : Kont),
                         replacetail_kont (trunkont_append_kont tκ κ') κ' κ'' = Some (trunkont_append_kont tκ κ'').
Proof.
  induction tκ as [|φ tκ IH|ctx]; intros ctx_ Hctx κ' κ''.
  inversion Hctx.  

  unf trunkont_append_kont; unf replacetail_kont;
  destruct (kont_eq_dec (φ :: (trunkont_append_kont tκ κ')) κ');
  [inversion Hctx as [? ? ? Hctx'|];
    apply (@no_circular_trunkont_append _ _ _ _ Hctx') in e; contradiction
  |inversion Hctx as [? ? ? Hctx'|]; case_eq (replacetail_kont (trunkont_append_kont tκ κ') κ' κ''); [intro κ'''_|]; intro Heq_].
  subst; f_equal; f_equal; rewrite (IH ctx_ Hctx') in Heq_; injects Heq_; reflexivity.
  destruct (@append_with_ctx_exists _ _ Hctx' κ' κ'') as [? bad]; rewrite bad in Heq_; discriminate.

  unf trunkont_append_kont; rewrite replacetail_kont_same; reflexivity.
Qed.

Lemma trunkont_append_tail_grow : forall tκ ctx, ctx_of tκ ctx -> forall κ κ',
                                                               KontTail κ κ' ->
                                                               KontTail κ (trunkont_append_kont tκ κ').
Proof.
  induction tκ as [|φ tκ IH|ctx]; intros ctx' Hctx κ κ' Htail; inversion Hctx as [? ? ? Hctx'|]; subst.
  simpl; constructor; apply (IH _ Hctx'); auto.
  auto.
Qed.

Lemma trunkont_append_tail_shrink : forall tκ ctx, ctx_of tκ ctx -> forall κ κ',
                                                                      KontTail (trunkont_append_kont tκ κ) κ' ->
                                                                      KontTail κ κ'.
Proof.
  induction tκ as [|φ tκ IH|ctx]; intros ctx' Hctx κ κ' Htail; inversion Hctx as [? ? ? Hctx'|]; subst.
  apply (IH _ Hctx'); auto; simpl in Htail;
  inversion Htail as [|? ? ? Htail']; [|constructor; apply kont_tail_cons in Htail']; auto.
  auto.
Qed.

Lemma hastail_shrink : forall tκ ctx, ctx_of tκ ctx ->
                                      forall κ π, hastail (trunkont_append_kont tκ κ) π ->
                                                  hastail κ π.
Proof.
  intros ? ? ? ? ? HT; induction HT as [|s π IH]; constructor; auto.
  apply (trunkont_append_tail_shrink H); auto.
Qed.

Ltac pathex wit := exists wit;
                     [constructor; [assumption|constructor]
                     |constructor; assumption
                     |assumption].

(* XXX: Will this need tweaking when tick can consider a portion of the stack? *)
Lemma tailed_trace_append_replace : forall tκ ctx, ctx_of tκ ctx ->
                                                   forall p κ t p' t',
                                                     Tailed_Trace p κ t p' (trunkont_append_kont tκ κ) t' ->
                                                     forall κ',
                                                     Tailed_Trace p κ' t p' (trunkont_append_kont tκ κ') t'.
Proof.
  intros ? ? Hctx ? ? ? ? ? HT κ'.
  inversion HT as [? ? ? ? ? ? π HT' πtail κtail]; subst.
  pose (rew := stack_irrelevance κ' HT' (@same_tail _) (Cons_tail _ _ πtail κtail)).
  inversion rew as [? ? ? π' ? ? Hreps Hrep HrT]; subst.
  destruct π' as [|s'' π']; [discriminate|injection Hrep; intros H_ H__; subst].
  rewrite (append_replace Hctx) in H__.
  simpl in Hreps; rewrite replacetail_kont_same in Hreps; injects Hreps; injects H__.
  exists π';
    [
    |apply replacetail_complete in H_
    |eapply append_tail]; eauto.
Qed.

Inductive KontUpto Ξ e_initial p tκ t : Prop :=
  mtupto : no_ctx tκ -> Tailed_Trace (ev e_initial nil nil) nil time0
                                       p (trunkont_append_kont tκ nil) t ->
           KontUpto Ξ e_initial p tκ t
| rtupto_intro : forall e' ρ' σ' t',
                   ctx_of tκ (context e' ρ' σ' t') ->
                   (* It works for all unrollings *)
                   (forall κ, 
                      StackUnroll Ξ κ (rt (context e' ρ' σ' t')) ->
                      Tailed_Trace (ev e' ρ' σ') κ t'
                                   p (trunkont_append_kont tκ κ) t) ->
                   (* and there's at least one *)
                   forall κ, 
                      StackUnroll Ξ κ (rt (context e' ρ' σ' t')) ->
                      Tailed_Trace (ev e' ρ' σ') κ t'
                                   p (trunkont_append_kont tκ κ) t
                      -> KontUpto Ξ e_initial p tκ t.

(* Proof relevant or not? *)
Inductive MemoTrace e ρ σ t v σ'' t' : Prop :=
  memotrace_intro : forall κ_irrelevant,
                      Tailed_Trace (ev e ρ σ) κ_irrelevant t (co v σ'') κ_irrelevant t' ->
                      MemoTrace e ρ σ t v σ'' t'.

(*
Food for thought:
(1) Ξ embodies the "reachable stacks" of the system.
    forall ctx in dom(Ξ), κ ∈ unroll(Ξ,tκ), inject(e) ↦* <ctx,κ>
 I think this is a derived property of (2), but it might also be necessary to establish (2) or the memo result.
(2) A local property:
    if ctx_of tκ = ctx,
       κ ∈ unroll(Ξ, rt(ctx)) and
       tκ in Ξ(ctx') then
     There is a path from <ctx, κ> to <ctx', tκ++κ> with κ in the tail.
      (this also holds for the current state's tκ)
     We concatenate tκ with κ by removing rt and treating the kpush'd frames as a kont.
     This only makes sense when κ itself is an unrolling of the rt trunkont.
We can patch traces together this way via stack_irrelevance.
*)
Inductive Context_inv e_initial M Ξ ctx : Prop :=
  context_inv_intro :
    forall e ρ σ t
           (ctxform : ctx = (context e ρ σ t))
           (Hctx : forall tκ,
                     in_ctxs Ξ (context e ρ σ t) tκ ->
                     KontUpto Ξ e_initial (ev e ρ σ) tκ t)
           (Hmemo :
              (forall v σ'' t',
                 in_memos M (context e ρ σ t) (res v σ'' t') ->
                 MemoTrace e ρ σ t v σ'' t')),
              Context_inv e_initial M Ξ ctx.

Definition ContextLE (ctx ctx' : Context) : Prop :=
  match ctx, ctx' with
      context e ρ σ t, context e' ρ' σ' t' => MappingLE σ σ'
  end.
Definition KTableOrd (Ξ : KTable) := forall ctx tκ (Hin : in_ctxs Ξ ctx tκ) ctx' (Hctx : ctx_of tκ ctx'), ContextLE ctx' ctx /\ InDom Ξ ctx'.
Definition MTableOrd (M : Memo) := forall e ρ σ t vm σm tm (Hin : in_memos M (context e ρ σ t) (res vm σm tm)), MappingLE σ σm.
Inductive StateOrd : WCESKMΞ -> Memo -> KTable -> Prop :=
  stateord_intro : forall p tκ t M Ξ
                          (Mord : MTableOrd M)
                          (Kord : KTableOrd Ξ)
                          (ctxord : match (get_ctx tκ) with
                                        None => True
                                      | Some ctx =>
                                        InDom Ξ ctx /\
                                        match ctx with
                                            (context _ _ σ _) => MappingLE σ (store_of p)
                                        end
                                    end),
                     StateOrd (wshell p tκ t) M Ξ.

Lemma InDom_join : forall Ξ ctx tκ, InDom (Ξ_join Ξ ctx tκ) ctx.
Proof.
  intros; rewrite (InDom_is_mapped context_eq_dec);
  destruct (InΞ_join Ξ ctx tκ) as [damn [? ?]];
  exists damn; auto.
Qed.

Lemma InDom_join2 : forall Ξ ctx ctx' tκ',
                      InDom Ξ ctx -> InDom (Ξ_join Ξ ctx' tκ') ctx.
Proof.
intros;
rewrite (InDom_In context_eq_dec);
rewrite (InDom_In context_eq_dec) in H;
inversion H as [b ?]; apply In_join with (b := b); solve [auto | exact context_eq_dec].
Qed.

(* This ordering invariant I believe is important to make sure that unrolled continuations
   cannot refer to a table extension "deep" in the unrolling. The contexts a continuation is
   unrolled through are partially ordered, so once the contexts differ, no "later" unrolling can
   use the trunkonts mapped at that context.
XXX: This still leaves the tricky case of [ctx ↦ ...rt ctx...].
     Semantically, this is a case where a function calls itself with the same context it was itself called with.
     There could be many locations in the function for these self calls, and marks an infinite self-loop. *)
Lemma ord_invariant : forall s M Ξ s' M' Ξ'
                             (Hstep : red_ceskmk (widemk s M Ξ) (widemk s' M' Ξ'))
                             (Hinv : StateOrd s M Ξ), StateOrd s' M' Ξ'.
Proof.
intros;
  inversion Hinv;
  inversion Hstep as [x ρ σ a tκs ts Ms Ξs ps Hmap Hpeq Hs'eq |
                      e0 e1 ρ σ tκs ts Ms Ξs ps Hpeq |
                      x e ρ σ tκs ts Ms Ξs ps Hpeq Hs'eq |
                      v σ e ρ tκs ts Ms Ξs ps Hpeq Hs'eq |
                      v σ x e ρ fnv tκs ts Ms Ξs ps Hin_force Hpeq Hs'eq |
                      x e ρ v σ tκs ts Ms Ξs ps a ρ' σ' ts' ctx Hunmapped Hpeq Hs'eq |
                      x e ρ v σ tκs ts Ms Ξs vm σm tm ps a ρ' σ' ctx Hinmemos Hpeq Hs'eq |
                      v σ ctx ts tκs Ms Ξs M's Hin_ctxs Hpeq Hs'eq]; subst;
  try (injection Hpeq; intros; subst; clear Hpeq); apply stateord_intro;
  try solve [auto
            |subst p; simpl;
             match goal with
               |[ctx : context[get_ctx (kpush ?φ ?tκ)] |- _] =>
                simpl in ctx; destruct (get_ctx tκ) as [[e'' ρ'' σ'' t'']|]; destruct ctx; split; auto
               |[ctx : context[get_ctx ?tκ] |- _] => destruct (get_ctx tκ) as [[e'' ρ'' σ'' t'']|];
                                                    destruct ctx; split; auto end
           (* Kord for unmapped ap *)
            |intros ctx' tκ' Hin ctx'' Hctx;
              subst p; destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec)
                       with (l := Ξ) (l' := Ξ) (a := ctx) (a' := ctx') (c := tκ) (c' := tκ')
                       as [[mum ble]|S1]; auto;
              [subst; rewrite reflect_ctx in Hctx; rewrite Hctx in ctxord; destruct ctx',ctx''; simpl in *; auto;
               injection mum; intros; subst t0 s e1 e0;
               apply maple_trans with (l' := σ); [|apply σ_join_ordering]; auto
              |apply Kord with (tκ := tκ'); auto]
            (* unmapped ap memo *)
            |simpl; split;[
               apply InDom_join|apply maple_refl]
            (* memoizing memo *)
            |destruct (get_ctx tκ) as [[_ _ σ_ _]|]; [|auto];
             simpl;
             apply maple_trans with (l' := σ');
             [subst p; simpl in ctxord; apply maple_trans with (l' := σ);
              [auto|apply σ_join_ordering]
             |apply (Mord _ _ _ _ _ _ _ Hinmemos)]
               (* stupid goal dependencies... *)
            |injection Hpeq; intros; subst M t tκ p Ξ; auto
            |(* Kord for unmapped ap *)
            intros ctx' tκ' Hin ctx'' Hctx;
              subst p; destruct (in_list_join_set_split context_eq_dec trunkont_eq_dec)
                       with (l := Ξ) (l' := Ξ) (a := ctx) (a' := ctx') (c := tκ) (c' := tκ')
                       as [[mum [? ble]]|S1]; auto;
              [subst; rewrite reflect_ctx in Hctx; rewrite Hctx in ctxord; destruct ctxord; destruct ctx',ctx''; simpl in *; auto;
               injection mum; intros; subst t0 s e1 e0;
               split;
               [apply maple_trans with (l' := σ); [|apply σ_join_ordering]; auto
               |apply InDom_join2]
              |destruct (Kord _ _ S1 ctx'' Hctx); split; [|apply InDom_join2]]; auto].

(* memoized ap context ordering *)
subst p; simpl;
destruct (get_ctx tκ) as [[e'' ρ'' σ'' t'']|]; destruct ctxord; split; [apply InDom_join2|];auto;
apply maple_trans with (l' := σ'); [apply maple_trans with (l' := σ);[|apply σ_join_ordering]|apply (Mord _ _ _ _ _ _ _ Hinmemos)];auto.

(* memoizing memo table ordering *)
unfold MTableOrd; (* injection Hpeq; *) intros; subst; simpl in ctxord; destruct ctxord.
(* intros ce cρ cσ ct cvm cσm ctm Hinmemos. *)
Check in_list_join_set_split.
destruct (@in_list_join_set_split _ _ context_eq_dec result_eq_dec M M ctx (context e ρ σ0 t0) (res v σ t) (res vm σm tm)) as [[mum [ble ?]]|S1]; auto.
destruct ctx as [? ρblah σblah ?];
  injection mum; intros; subst e ρ σ0 t0;
  injection ble; intros; subst vm σm tm; auto.
pose (grumble := Mord _ _ _ _ _ _ _ S1); auto.

subst; simpl in ctxord; destruct ctxord; destruct ctx as [? ρblah σblah ?];
case_eq (get_ctx tκs); [intros [e_ ρ_ σ_ t_] Hctxeq; rewrite <- reflect_ctx in Hctxeq; simpl;
                        pose (mumble := Kord _ _ Hin_ctxs _ Hctxeq);
                        simpl in mumble; destruct mumble; split; [|apply maple_trans with (l' := σblah)]|];auto.
Qed.

Remark ord_invariant0 : forall e, StateOrd (inject_wceskmk e) nil nil.
intro e; apply stateord_intro;
[intros ? ? ? ? ? ? ? H|intros ? ? H|simpl; trivial]; inversion H as [? [bad ?]]; inversion bad.
Qed.

(* Proof relevant or not? *)
Inductive WInv (e_initial : Expr) : WCESKMΞ -> Memo -> KTable -> Prop :=
  winv : forall p tκ t M Ξ,
          Dom_in_Dom M Ξ ->
          ctx_in_dom Ξ tκ ->
          KontUpto Ξ e_initial p tκ t ->
          (forall ctx, ctx_of tκ ctx -> Context_inv e_initial M Ξ ctx) ->
          (forall ctx', (InDom Ξ ctx') ->
                        (* no empty mappings *)
                        (exists tκ, in_ctxs Ξ ctx' tκ) /\ Context_inv e_initial M Ξ ctx')
           ->
          WInv e_initial (wshell p tκ t) M Ξ.

Inductive WideInv (e_initial : Expr) : System -> Prop :=
  wideinv : forall Seen F E M Ξ
                (SeenInv : forall s, set_In s Seen -> WInv e_initial s M Ξ /\ StateOrd s M Ξ)
                (FrontierInv : forall s, set_In s F -> WInv e_initial s M Ξ /\ StateOrd s M Ξ),
           WideInv e_initial (system Seen F E M Ξ).

Inductive Inv (e_initial : Expr) : CESKMΞ -> Prop :=
  inv : forall s M Ξ, WInv e_initial s M Ξ -> Inv e_initial (widemk s M Ξ).

Remark inject_ceskmk_inv : forall e, Inv e (inject_ceskmk e) /\ StateOrd (inject_wceskmk e) nil nil.
Proof.
  intro e0; split.
  constructor.
  constructor.
  constructor.
  intros ctx bad; inversion bad.
  constructor; [constructor|exists []; constructor]. 
  intros ? bad; inversion bad.
  intros ? bad; inversion bad.
  constructor.
  intros ? ? ? ? ? ? ? [? [bad ?]]; inversion bad.
  intros ? ? [? [bad ?]]; inversion bad.
  simpl; exact I.
Qed.

Lemma inv_invariant : forall e0 s M Ξ s' M' Ξ' (Hinv : WInv e0 s M Ξ) (Hord : StateOrd s M Ξ)
                             (Hstep : red_ceskmk (widemk s M Ξ) (widemk s' M' Ξ')),
                        WInv e0 s' M' Ξ'.
Proof.
intros; inversion Hstep.
Focus 8.
subst; inversion Hinv as [? ? ? ? ? Hdomdom Hctxdom locpath Htκctx Hctxs]; subst.
constructor.
apply Dom_join_left; auto;
destruct (Hctxdom _ (@rt_ctx ctx)) as [? [tκs [Hmap ?]]]; exact (ex_intro _ tκs Hmap).

intros ctx' Hctxof; inversion Hord as [? ? ? ? ? Mord Kord' ctxord]; subst;
destruct (Kord' _ _ H0 _ Hctxof) as [? indom]; destruct (Hctxs _ indom); auto.

(* the goal here is to fetch the path fragment from tκ's context up to the call
   and prepend that on HT *)
inversion locpath as [Hnoctx HT|? ? ? ? Hctxof Hunrolltrace κ Hunroll HT]; (* Hunroll is from something in ctx, not nec. tκ*)
[inversion Hnoctx|simpl in HT; inversion Hctxof as [|ctx']; subst ctx ctx'; clear Hctxof].
inversion Hunroll as [| | ? tκunroll κunroll Hκunroll Hunrollin]; subst.

destruct (Htκctx _ (@rt_ctx (context e' ρ' σ' t'))) as [aa bb cc dd ctxform Hctx Hmemo]; injection ctxform; intros ? ? ? ?; subst aa bb cc dd.

specialize (Hctx _ H0);
inversion Hctx as [Hnoctx HKT|se sρ sσ st HKctxof HKunrolltrace HKκ HKunroll HKT];
[apply mtupto;
  [auto
  |pose (Hunroll' := @append_unroll Ξ' _ [] (context e' ρ' σ' t') (or_intror Hnoctx));
    specialize (Hunrolltrace _ (unroll_rt Hunroll' H0));
    inversion Hunrolltrace as [? ? ? ? ? ? π HπT πtail κtail]; subst;
    inversion HKT as [? ? ? ? ? ? sπ HsπT sπtail sκtail]; subst;
    exists (π ++ sπ);
    [apply (trace_app HsπT HπT)
    |apply hastail_nil
    |apply kont_tail_nil]]
|pose (Hunroll' := @append_unroll Ξ' _ HKκ _ (or_introl (conj HKctxof HKunroll)));
  specialize (Hunrolltrace _ (unroll_rt Hunroll' H0));
  inversion Hunrolltrace as [? ? ? ? ? ? π HπT πtail κtail]; subst].

assert (subgoal : forall κ' : Kont,
                    StackUnroll Ξ' κ' (rt (context se sρ sσ st)) ->
                    Tailed_Trace (ev se sρ sσ) κ' st (co v σ) (trunkont_append_kont tκ κ') t).

(* the goal here is to fetch the path fragment from tκ's context up to the call
   and prepend that on HT *)
intros κ'' Hunroll'';
cut (hastail (trunkont_append_kont tκ HKκ)
             (shell (co v σ) (trunkont_append_kont (rt (context e' ρ' σ' t'))
                                                   (trunkont_append_kont tκ HKκ)) t :: π));
[intro πtail'|constructor; auto];
pose (rewT := stack_irrelevance (trunkont_append_kont tκ κ'') HπT κtail πtail');
inversion HKT as [? ? ? ? ? ? sπ HsπT sπtail sκtail]; subst;
cut (hastail HKκ (shell (ev e' ρ' σ') (trunkont_append_kont tκ HKκ) t' :: sπ));
[intro sπtail'|constructor; auto];
pose (rewS := stack_irrelevance κ'' HsπT (@same_tail _) sπtail');
inversion rewT as [? [p pκ pt] ? π' ? ? Hreplaces Hreplaceπ HrT];
inversion rewS as [? [sp spκ spt] ? sπ' ? ? Hreplacess Hreplacesπ HsT]; subst;
destruct sπ' as[|s' sπ'];[discriminate|injection Hreplacesπ; intros Hreplaces_state Hreplacess'];
case_eq (replacetail_kont (trunkont_append_kont tκ HKκ) HKκ κ'');[intro blah|]; intro blaheq; rewrite blaheq in Hreplacess';[|discriminate];
destruct π' as [|ps π'];[discriminate|simpl in Hreplaceπ; rewrite replacetail_kont_same in Hreplaceπ;
                                      injection Hreplaceπ; intros Hreplaceπ_ Hrepeq; subst ps];
injects Hreplacess';
rewrite (append_replace HKctxof) in blaheq; injects blaheq;
simpl in Hreplacess; rewrite replacetail_kont_same in Hreplacess; injects Hreplacess;
simpl in Hreplaces; rewrite replacetail_kont_same in Hreplaces; injects Hreplaces;

exists (π' ++ sπ');
[apply (trace_app HsT HrT)
|apply hastail_app;[apply replacetail_complete in Hreplaceπ_;apply (hastail_shrink HKctxof)
                   |apply replacetail_complete in Hreplacesπ;inversion Hreplacesπ]; auto
|eapply append_tail; eauto].

eapply (@rtupto_intro Ξ' _ _ _ _ _ _ _ _ HKctxof); eauto.

(* the current tκ has tho context inv with the extended memo table *)
intros [se sρ sσ st] Hctxof';
apply (@context_inv_intro _ _ _ _ se sρ sσ st (eq_refl _));
[intros tκ' Hinctx; cut (InDom Ξ' (context se sρ sσ st));
 [intro Hindom; destruct (Hctxs _ Hindom) as [? []]; injects ctxform; eapply Hctx; eauto
 |rewrite (InDom_is_mapped context_eq_dec); destruct Hinctx as [tκs [? ?]]; exists tκs; auto]
|intros v' σ'' t' Hinmemos;
destruct (@in_list_join_set_split _ _ context_eq_dec result_eq_dec M M ctx (context se sρ sσ st) (res v σ t) (res v' σ'' t') Hinmemos) as [[mum [ble ?]]|S1];
  [subst ctx; injects ble;
   destruct (Htκctx _ (@rt_ctx (context se sρ sσ st))); injects ctxform;
   inversion locpath as [Hnoctx HT|? ? ? ? Hctxof Hunrolltrace κ Hunroll HT];[inversion Hnoctx|inverts Hctxof];
   inversion HT as [? ? ? ? ? ? π HT' πtail κtail]; subst; exists κ;
   eapply (@tailt _ _ _ _ _ _ π HT' πtail (@same_tail _))
  |cut (InDom Ξ' (context se sρ sσ st));
     [intro Hindom; destruct (Hctxs _ Hindom) as [? []]; injects ctxform; eapply Hmemo; eauto
     |apply (Dom_InDom context_eq_dec Hdomdom); destruct S1 as [ress [Hmap ?]];
      rewrite (InDom_is_mapped context_eq_dec); exists ress; auto]]].


intros [se sρ sσ st] Hindom'; split; (* COPY-PASTA YURRRZZ *)
[destruct (Hctxs _ Hindom'); auto
|apply (@context_inv_intro _ _ _ _ se sρ sσ st (eq_refl _));
[intros tκ' Hinctx; cut (InDom Ξ' (context se sρ sσ st));
 [intro Hindom; destruct (Hctxs _ Hindom) as [? []]; injects ctxform; eapply Hctx; eauto
 |rewrite (InDom_is_mapped context_eq_dec); destruct Hinctx as [tκs [? ?]]; exists tκs; auto]
|intros v' σ'' t' Hinmemos;
destruct (@in_list_join_set_split _ _ context_eq_dec result_eq_dec M M ctx (context se sρ sσ st) (res v σ t) (res v' σ'' t') Hinmemos) as [[mum [ble ?]]|S1];
  [subst ctx; injects ble;
   destruct (Htκctx _ (@rt_ctx (context se sρ sσ st))); injects ctxform;
   inversion locpath as [Hnoctx HT|? ? ? ? Hctxof Hunrolltrace κ Hunroll HT];[inversion Hnoctx|inverts Hctxof];
   inversion HT as [? ? ? ? ? ? π HT' πtail κtail]; subst; exists κ;
   eapply (@tailt _ _ _ _ _ _ π HT' πtail (@same_tail _))
  |cut (InDom Ξ' (context se sρ sσ st));
     [intro Hindom; destruct (Hctxs _ Hindom) as [? []]; injects ctxform; eapply Hmemo; eauto
     |apply (Dom_InDom context_eq_dec Hdomdom); destruct S1 as [ress [Hmap ?]];
      rewrite (InDom_is_mapped context_eq_dec); exists ress; auto]]]].

Focus 6. (* non-memoized function call *)
subst; inversion Hinv as [? ? ? ? ? Hdomdom Hctxdom locpath Htκctx Hctxs]; subst.
constructor;
[apply Dom_join_right; assumption
|intros ctx' toinv;
 inversion toinv as [|ctx'' foo toinj]; subst ctx' ctx'';
 exists tκ; apply (InΞ_join Ξ ctx tκ)
|
|(* ctx of current cont *)
intros ctx' toinv; inversion toinv as [|ctx'' foo toinj]; subst ctx ctx' ctx'';
apply (@context_inv_intro _ _ _ _ e ρ' σ' t' (eq_refl _));
[(* fulfill Hctx of Context_inv *)
  intros tκ' HinΞ;
  destruct (@in_list_join_set_split _ _ context_eq_dec trunkont_eq_dec
         Ξ Ξ (context e ρ' σ' t') (context e ρ' σ' t') tκ tκ' HinΞ) as [[? [? Hnotincur]]|tκ'inctx];
[subst|];
(case_eq (get_ctx tκ'); [intros [e_ ρ_ σ_ t_] Heqctx';rewrite <- reflect_ctx in Heqctx'|intro Hnone]) |]|];

try solve
[
inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
[eapply (@rtupto_intro _ _ _ _ _ _ _ _ _ (@rt_ctx ctx));
  [intros κ Hunroll; exists []; constructor
  |apply (@append_unroll_rt _ tκ []); [apply InΞ_join|rewrite reflect_no_ctx in Hnoctx; rewrite Hnoctx; reflexivity]
  |exists []; constructor]
|eapply (@rtupto_intro _ _ _ _ _ _ _ _ _ (@rt_ctx ctx));
  [intros κ_ Hunroll_; exists []; constructor
  |apply (@append_unroll_rt _ tκ κ); [apply InΞ_join|rewrite reflect_ctx in Hctxof; rewrite Hctxof;
                                     apply unroll_with_extension; auto]
  |exists []; constructor]]
|
inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
  [rewrite reflect_ctx in Heqctx'; rewrite reflect_no_ctx,Heqctx' in Hnoctx; discriminate|];
cut (context e_ ρ_ σ_ t_ = context ce' cρ' cσ' ct');
[intro toinj; injects toinj
|rewrite reflect_ctx in Heqctx',Hctxof; rewrite Hctxof in Heqctx'; injects Heqctx'; reflexivity];

assert (subgoal : forall κ0 : Kont,
                    StackUnroll (Ξ_join Ξ (context e ρ' σ' t') tκ') κ0
                                (rt (context ce' cρ' cσ' ct')) ->
                    Tailed_Trace (ev ce' cρ' cσ') κ0 ct' (ev e ρ' σ')
                                 (trunkont_append_kont tκ' κ0) t') by
    (intros κ_ Hunroll_;
     inversion Htrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
     pose (rewS := stack_irrelevance κ_ HT (@same_tail _) (Cons_tail _ _ πtail κtail));
     inversion rewS as [? ? ? π' ? ? Hreps Hrep HrT]; subst;
     destruct π' as [|cs π']; [discriminate
                              |simpl in Hrep; rewrite (append_replace Heqctx') in Hrep;
                               injection Hrep; intros pr κr; subst cs];
     simpl in Hreps; rewrite replacetail_kont_same in Hreps; injects Hreps;
     exists ((shell p (trunkont_append_kont tκ' κ_) t) :: π');
            [constructor;[auto|constructor]
            |constructor; [apply replacetail_complete in pr; auto|apply (append_tail _ Hctxof)]
            |apply (append_tail _ Hctxof)]);
eapply (@rtupto_intro _ _ _ _ _ _ _ _ _ Heqctx'); 
  [auto
  |apply unroll_with_extension; exact Hunroll
  |inversion Htrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' κ) t :: π)]
|
apply mtupto;
[rewrite reflect_no_ctx; auto
|inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
  [inversion mttrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' []) t :: π)
  |rewrite reflect_ctx,Hnone in Hctxof;discriminate]]

|
intros v' σ'' t'' Hinmemos;
  cut (InDom Ξ (context e ρ' σ' t'));
  [intro inΞdom; specialize (Hctxs _ inΞdom);
   destruct Hctxs as [[wtκ wthere] []];
   injection ctxform; intros ? ? ? ?; subst e1 ρ0 σ0 t0;
   subst p a ρ' t' σ'; apply Hmemo; auto
  |apply (Dom_InDom context_eq_dec Hdomdom);
    destruct Hinmemos as [ress [Hmap Hin]];
    rewrite (InDom_is_mapped context_eq_dec); exists ress; auto]

|
cut (InDom Ξ (context e ρ' σ' t'));
[intro Hindom; destruct (Hctxs _ Hindom) as [Hw [aa bb cc dd ctxform Hctx Hmemo]];
 injection ctxform; intros ? ? ? ?; subst aa bb cc dd;
 specialize (Hctx _ tκ'inctx);
 inversion Hctx as [Hnoctx mttrace|? ? ? ? Hctxof Hunrolltrace κ Hunroll HT];
   [apply mtupto; auto|rewrite reflect_ctx,Hnone in Hctxof; discriminate]
|destruct tκ'inctx as [tκs [? ?]]; rewrite (InDom_is_mapped context_eq_dec); exists tκs; auto]

|
cut (InDom Ξ (context e ρ' σ' t'));
[intro Hindom; destruct (Hctxs _ Hindom) as [Hw [aa bb cc dd ctxform Hctx Hmemo]];
 injection ctxform; intros ? ? ? ?; subst aa bb cc dd;
 specialize (Hctx _ tκ'inctx);
 inversion Hctx as [Hnoctx mttrace|? ? ? ? Hctxof Hunrolltrace κ Hunroll HT];
 [rewrite reflect_no_ctx in Hnoctx; rewrite reflect_ctx,Hnoctx in Heqctx'; discriminate
 |eapply (@rtupto_intro _ _ _ _ _ _ _ _ _ Hctxof);
   [intros κ' Hunroll'; apply (tailed_trace_append_replace Hctxof HT κ')
   |apply unroll_with_extension
   |]; eauto]
|destruct tκ'inctx as [tκs [? ?]]; rewrite (InDom_is_mapped context_eq_dec); exists tκs; auto]].

intros ctx' Hindom'; split;
(* supply witness via invariant or current tκ *)
[destruct (@InDom_join_set_split _ _ context_eq_dec trunkont_eq_dec Ξ Ξ ctx ctx' tκ Hindom') as [[? Hnonin]|Hindom];
  [subst ctx'; exists tκ; apply InΞ_join
  |destruct (Hctxs _ Hindom) as [[wtκ Hwin] ?]; exists wtκ; textend_map]
|destruct ctx' as [ce cρ cσ ct]; apply (context_inv_intro (eq_refl _))].

intros tκ' Hinctx;
destruct (@in_list_join_set_split _ _ context_eq_dec trunkont_eq_dec
                                  Ξ Ξ ctx (context ce cρ cσ ct) tκ tκ' Hinctx) as [[Hinj [? Hnotincur]]|tκ'inctx];
[subst; injection Hinj; intros ? ? ? ?; subst ce cρ cσ ct;
inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
[apply mtupto;
  [auto
  |inversion mttrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' []) t :: π)]
|eapply (rtupto_intro _ Hctxof);
  [intros κ' Hunroll';
    pose (L := (tailed_trace_append_replace Hctxof Htrace κ'));
    inversion L as [? ? ? ? ? ? π HT πtail κtail]; subst;
    pathex (shell p (trunkont_append_kont tκ' κ') t :: π)
  |apply unroll_with_extension; eauto
  |inversion Htrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' κ) t :: π)]]

|].
destruct (Hctxs (context ce cρ cσ ct)) as [? [aa bb cc dd ctxform Hctx Hmemo]];
[rewrite (InDom_is_mapped context_eq_dec); destruct tκ'inctx as [tκs [? ?]]; exists tκs; auto
|injection ctxform; intros ? ? ? ?; subst aa bb cc dd].
specialize (Hctx _ tκ'inctx);
inversion Hctx as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
[apply mtupto; auto
|eapply (rtupto_intro _ Hctxof);
  [intros κ' Hunroll';apply (tailed_trace_append_replace Hctxof Htrace κ')
  |apply unroll_with_extension; eauto
  |auto]].

intros v'' σ'' t'' Hinmemos;
cut (InDom Ξ (context ce cρ cσ ct));
[intro Hindom
|cut (InDom M' (context ce cρ cσ ct));
  [intro inM; apply (Dom_InDom context_eq_dec Hdomdom inM)
  |rewrite (InDom_is_mapped context_eq_dec); destruct Hinmemos as [ress [? ?]]; exists ress; auto]];
destruct (Hctxs _ Hindom) as [? [aa bb cc dd ctxform Hctx Hmemo]];
injection ctxform; intros ? ? ? ?; subst aa bb cc dd; apply Hmemo; auto.

Focus 6. (* memoized function call *)
subst; inversion Hinv as [? ? ? ? ? Hdomdom Hctxdom locpath Htκctx Hctxs]; subst;
constructor;
[apply Dom_join_right; assumption
|intros ctx' Hctxof;destruct (Hctxdom _ Hctxof) as [tκ' Hin]; exists tκ'; textend_map
|
|
|].
cut (InDom Ξ ctx);
  [intro Hindom|cut (InDom M' ctx);
     [intro inM; apply (Dom_InDom context_eq_dec Hdomdom inM)
     |rewrite (InDom_is_mapped context_eq_dec); destruct H0 as [ress [? ?]]; exists ress; auto]];
destruct (Hctxs _ Hindom) as [? [aa bb cc dd ctxform Hctx Hmemo]]; subst ctx; injection ctxform;
intros ? ? ? ?; subst aa bb cc dd;
specialize (Hmemo _ _ _ H0);
inversion Hmemo as [κ_irr Hbal];
inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace].

apply mtupto; auto;
inversion mttrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
(* use a dummy context to make it simplify to the same continuation *)
pose (Hmemo' := tailed_trace_append_replace (@rt_ctx (context e ρ' σ' t)) Hbal (trunkont_append_kont tκ []));
simpl in Hmemo';
inversion Hmemo' as [? ? ? ? ? ? π' HT' πtail' κtail']; subst;
exists (π' ++ shell p (trunkont_append_kont tκ []) t :: π);
[cut (Trace red_cesk (shell (ev e0 [] []) [] time0)
            (shell (ev e ρ' σ') (trunkont_append_kont tκ []) (tick p) ::
                   shell p (trunkont_append_kont tκ []) t :: π));
  [intro HT_; exact (trace_app HT_ HT')
  |constructor; [assumption|constructor]]
|apply hastail_nil
|apply kont_tail_nil].

eapply (rtupto_intro _ Hctxof);
[intros κ' Hunroll';
pose (Htrace' := tailed_trace_append_replace Hctxof Htrace κ');
inversion Htrace' as [? ? ? ? ? ? π HT πtail κtail]; subst;
pose (Hmemo' := tailed_trace_append_replace (@rt_ctx (context e ρ' σ' t)) Hbal (trunkont_append_kont tκ κ'));
simpl in Hmemo';
inversion Hmemo' as [? ? ? ? ? ? π' HT' πtail' κtail']; subst;
exists (π' ++ shell p (trunkont_append_kont tκ κ') t :: π);
[cut (Trace red_cesk (shell (ev ce' cρ' cσ') κ' ct')
            (shell (ev e ρ' σ') (trunkont_append_kont tκ κ') (tick p) ::
                   shell p (trunkont_append_kont tκ κ') t :: π));
  [intro HT_; exact (trace_app HT_ HT')
  |constructor; [assumption|constructor]]
|apply hastail_app;[eapply hastail_shrink|constructor; [|eapply append_tail]];eauto
|eapply append_tail; eauto]
|apply unroll_with_extension; eauto

|
inversion Htrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
 pose (Hmemo' := tailed_trace_append_replace (@rt_ctx (context e ρ' σ' t)) Hbal (trunkont_append_kont tκ κ));
 simpl in Hmemo';
 inversion Hmemo' as [? ? ? ? ? ? π' HT' πtail' κtail']; subst;
 exists (π' ++ shell p (trunkont_append_kont tκ κ) t :: π);
 [cut (Trace red_cesk (shell (ev ce' cρ' cσ') κ ct')
             (shell (ev e ρ' σ') (trunkont_append_kont tκ κ) (tick p) ::
                    shell p (trunkont_append_kont tκ κ) t :: π));
   [intro HT_; exact (trace_app HT_ HT')
   |constructor; [assumption|constructor]]
 |apply hastail_app;[eapply hastail_shrink|constructor; [|eapply append_tail]];eauto
 |eapply append_tail; eauto]].

intros ctx' Hctxof'; destruct (Htκctx _ Hctxof') as [ce cρ cσ ct ctxform Hctx Hmemo];
subst ctx'; apply (context_inv_intro (eq_refl _)).
intros tκ' Hinctx';
destruct (@in_list_join_set_split _ _ context_eq_dec trunkont_eq_dec
                                  Ξ Ξ ctx (context ce cρ cσ ct) tκ tκ' Hinctx') as [[Hinj [? Hnotincur]]|tκ'inctx];
[subst; injection Hinj; intros ? ? ? ?; subst ce cρ cσ ct
|specialize (Hctx _ tκ'inctx);
  inversion Hctx as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
  [apply mtupto; auto
  |eapply (rtupto_intro _ Hctxof);
    [intros κ' ?; specialize (Hunrolltrace _ Hunroll);
    apply (tailed_trace_append_replace Hctxof Hunrolltrace κ')
    |apply unroll_with_extension; eauto
    |auto]]].
inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
[apply mtupto;
  [auto
  |inversion mttrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' []) t :: π)]
|eapply (rtupto_intro _ Hctxof);
  [intros κ' Hunroll';
    pose (Htrace' := tailed_trace_append_replace Hctxof Htrace κ');
    inversion Htrace' as [? ? ? ? ? ? π HT πtail κtail]; subst;
    pathex (shell p (trunkont_append_kont tκ' κ') t :: π)
  |apply unroll_with_extension; eauto
  |inversion Htrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
    pathex (shell p (trunkont_append_kont tκ' κ) t :: π)]].

auto.

intros ctx' Hindom'; split;
(* supply witness via invariant or current tκ *)
[destruct (@InDom_join_set_split _ _ context_eq_dec trunkont_eq_dec Ξ Ξ ctx ctx' tκ Hindom') as [[? Hnonin]|Hindom];
  [subst ctx'; exists tκ; apply InΞ_join
  |destruct (Hctxs _ Hindom) as [[wtκ Hwin] ?]; exists wtκ; textend_map]
|destruct ctx' as [ce cρ cσ ct]; apply (context_inv_intro (eq_refl _))].

intros tκ' Hinctx;
destruct (@in_list_join_set_split _ _ context_eq_dec trunkont_eq_dec
                                  Ξ Ξ ctx (context ce cρ cσ ct) tκ tκ' Hinctx) as [[Hinj [? Hnotincur]]|tκ'inctx];
[subst; injection Hinj; intros ? ? ? ?; subst ce cρ cσ ct;
inversion locpath as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
[apply mtupto;
  [auto
  |inversion mttrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' []) t :: π)]
|eapply (rtupto_intro _ Hctxof);
  [intros κ' Hunroll';
    pose (L := (tailed_trace_append_replace Hctxof Htrace κ'));
    inversion L as [? ? ? ? ? ? π HT πtail κtail]; subst;
    pathex (shell p (trunkont_append_kont tκ' κ') t :: π)
  |apply unroll_with_extension; eauto
  |inversion Htrace as [? ? ? ? ? ? π HT πtail κtail]; subst;
   pathex (shell p (trunkont_append_kont tκ' κ) t :: π)]]

|].
destruct (Hctxs (context ce cρ cσ ct)) as [? [aa bb cc dd ctxform Hctx Hmemo]];
[rewrite (InDom_is_mapped context_eq_dec); destruct tκ'inctx as [tκs [? ?]]; exists tκs; auto
|injection ctxform; intros ? ? ? ?; subst aa bb cc dd].
specialize (Hctx _ tκ'inctx);
inversion Hctx as [Hnoctx mttrace|ce' cρ' cσ' ct' Hctxof Hunrolltrace κ Hunroll Htrace];
[apply mtupto; auto
|eapply (rtupto_intro _ Hctxof);
  [intros κ' Hunroll';apply (tailed_trace_append_replace Hctxof Htrace κ')
  |apply unroll_with_extension; eauto
  |auto]].

intros v'' σ'' t'' Hinmemos;
cut (InDom Ξ (context ce cρ cσ ct));
[intro Hindom
|cut (InDom M' (context ce cρ cσ ct));
  [intro inM; apply (Dom_InDom context_eq_dec Hdomdom inM)
  |rewrite (InDom_is_mapped context_eq_dec); destruct Hinmemos as [ress [? ?]]; exists ress; auto]];
destruct (Hctxs _ Hindom) as [? [aa bb cc dd ctxform Hctx Hmemo]];
injection ctxform; intros ? ? ? ?; subst aa bb cc dd; apply Hmemo; auto.

(* TODO: the rest are trivial *)
Admitted.

Lemma ForallT_forall1 : forall A (P : A -> Type) x l, ForallT P l -> InT x l -> P x.
Proof.
induction l; intros HF H; [inversion H|inverts HF; inversion H as [? ? HH|];[inversion HH|]; auto].
Defined.
Lemma ForallT_forall2 : forall A (P : A -> Type) l, (forall x, InT x l -> P x) -> ForallT P l.
Proof.
induction l; intros H; [|constructor; [apply H; left; constructor|apply IHl; intros; apply H; right]];auto.
Defined.

Lemma PR_step_all_invariant : forall e0 s M Ξ, WInv e0 s M Ξ -> StateOrd s M Ξ -> ForallT (Inv e0) (step_all (widemk s M Ξ)).
Proof.
intros ? ? ? ? Hwinv Hoinv; apply ForallT_forall2; intros [? ? ?]. intro H; apply PR_finite_steps2 in H;
exact (inv (inv_invariant Hwinv Hoinv H)).
Qed.

Lemma step_all_invariant : forall e0 s M Ξ, WInv e0 s M Ξ -> StateOrd s M Ξ -> Forall (Inv e0) (step_all (widemk s M Ξ)).
Proof.
intros ? ? ? ? Hwinv Hoinv; rewrite Forall_forall; intros [? ? ?]. intro H; rewrite <- finite_steps in H;
exact (inv (inv_invariant Hwinv Hoinv H)).
Qed.

Lemma PR_step_all_ord_invariant : forall s M Ξ, StateOrd s M Ξ -> ForallT (fun ws => match ws with widemk s' M' Ξ' => StateOrd s' M' Ξ' end) (step_all (widemk s M Ξ)).
Proof.
intros ? ? ? Hoinv; apply ForallT_forall2; intros [? ? ?]; intro H; apply PR_finite_steps2 in H;
exact (ord_invariant H Hoinv).
Qed.

Lemma step_all_ord_invariant : forall s M Ξ, StateOrd s M Ξ -> Forall (fun ws => match ws with widemk s' M' Ξ' => StateOrd s' M' Ξ' end) (step_all (widemk s M Ξ)).
Proof.
intros ? ? ? Hoinv; rewrite Forall_forall; intros [? ? ?]; intro H; rewrite <- finite_steps in H;
exact (ord_invariant H Hoinv).
Qed.

Definition TableContains (M : Memo) (Ξ: KTable) (ss : set CESKMΞ) :=
  Forall (fun s => match s with widemk ws M' Ξ' => MappingLE M' M /\ MappingLE Ξ' Ξ end) ss.

Lemma filter_InT1: forall (A : Type) (f : A -> bool) x l, InT x (filter f l) -> (InT x l) * (f x = true).
Proof.
induction l; auto; intro H; [inversion H|].
simpl in H.
case_eq (f a); [intro Hfatrue|intro Hfafalse];
[rewrite Hfatrue in H; inversion H as [? ? Heq|]; [inversion Heq|destruct IHl; auto]; subst; split; auto|rewrite Hfafalse in H; destruct IHl; auto].
Defined.

Lemma ktable_join_invariant : forall e0 Ξ Ξ'
                                     (Inv0 :
                                        (forall e ρ σ t tκ, in_ctxs Ξ (context e ρ σ t) tκ ->
                                                            KontUpto Ξ e0 (ev e ρ σ) tκ t))
                                     (Inv1 :
                                        (forall e ρ σ t tκ, in_ctxs Ξ' (context e ρ σ t) tκ ->
                                                            KontUpto Ξ' e0 (ev e ρ σ) tκ t)),
                                forall e ρ σ t tκ,
                                  in_ctxs (Ξs_join Ξ Ξ') (context e ρ σ t) tκ ->
                                  KontUpto (Ξs_join Ξ Ξ') e0 (ev e ρ σ) tκ t.
Proof.
  intros.
Abort.

Lemma smush_invariant : forall e0 Seen ss E M Ξ nexts s0
                               (SeenInv : Forall (fun s => WInv e0 s M Ξ) Seen)
                               (MΞinv : TableContains M Ξ ss)
                               (ssInv : Forall (Inv e0) ss)
                               (s0Inv : WInv e0 s0 M Ξ)
                               (nextsInv : Forall (fun s => WInv e0 s M Ξ) nexts),
                          match smusher s0 Seen ss nexts E M Ξ with
                              wide_step ss E' M' Ξ' => Forall (fun s => WInv e0 s M' Ξ') ss
                          end.
Proof.
  induction ss as [|[s' M' Ξ'] ss' IH]; intros.
  (* base *)
  simpl; rewrite Forall_forall; intros ? H; rewrite filter_In in H;
  rewrite Forall_forall in nextsInv; intuition auto.
  (* induction step *)
  simpl.
apply IH; repeat match goal with [H : context[Forall ?p ?l] |- _] => rewrite Forall_forall in H end;
try match goal with [|- context[Forall ?p ?l]] => rewrite Forall_forall; intros x Hin end;
[
|
hnf; rewrite Forall_forall;
hnf in MΞinv; rewrite Forall_forall in MΞinv;
intros mum ble;
assert (blahneed : In mum (widemk s' M' Ξ' :: ss')) by (right; exact ble);
pose (blah := (MΞinv mum blahneed));
destruct mum; intuition ((apply maple_trans with (l' := M)
                       || apply maple_trans with (l' := Ξ));
                          solve [apply map_join_ordering2; auto | auto])
|apply ssInv; right; auto
|
|].
(* TODO 02/17: figure out a way to combine Winv with Ms_join/Ξs_join *)


Abort.

Lemma wideinv_invariant : forall e0 Seen F E M Ξ Seen' F' E' M' Ξ'
                                 (Hinv: WideInv e0 (system Seen F E M Ξ))
                                 (Hstep : Wide_CESKMΞ (system Seen F E M Ξ) (system Seen' F' E' M' Ξ')),
                            WideInv e0 (system Seen' F' E' M' Ξ').
Proof.
intros; inversion Hstep as [ws ? ? ? F_ Seen_ ? ? Hstepeq]; subst; constructor; intros ws' Hin.
destruct ws as [[e ρ σ | v σ | x e ρ v σ] tκ t]; [|destruct tκ|].
(* ev case *)
Abort.

Inductive state_rel : CESK -> System -> Prop :=
  point_rel : forall Ξ κ tκ p t Seen F E M,
                StackUnroll Ξ κ tκ ->
                (In (wshell p tκ t) Seen \/ In (wshell p tκ t) F) ->
                state_rel (shell p κ t) (system Seen F E M Ξ).

Print sigT.
(*
Definition red_cesk_dec (s s' : CESK) : option (red_cesk s s').
destruct s as [[e ρ σ | v σ | x e ρ v σ] κ t];
destruct s' as [[e' ρ' σ' | v' σ' | x' e' ρ' v' σ'] κ' t'].
(* ev -> ev *)
destruct e as [x | e0 e1 | x e];
[exact None (* var -/-> ev *)
|destruct (expr_eq_dec e0 e'); [destruct (env_eq_dec ρ ρ'); [destruct (store_eq_dec σ σ'); [destruct (kont_eq_dec κ' ((ar e1 ρ) :: κ)); [destruct (time_eq_dec t' (tick (ev (app e0 e1) ρ σ))); [subst; apply Some; apply ev_app |]|]|]|]|]; exact None
|(* lam -/-> ev *)
exact None].

(* ev -> co *)
destruct e as [x | e0 e1 | x e];
[set (oa := lookup_ρ x ρ);
  case_eq oa; [intros a Haeq;subst oa;unfold lookup_ρ in Haeq; rewrite <- lookup_mapsto in Haeq|intros; exact None];
  destruct (val_eq_dec v' (adelay a)); [destruct (store_eq_dec σ σ'); [destruct (kont_eq_dec κ κ'); [destruct (time_eq_dec t' (tick (ev (var x) ρ σ))); [subst;apply Some,ev_var; assumption|]|]|]|]; exact None
|exact None (* app -/-> co *)
|destruct (val_eq_dec v' (closure x e ρ)); [destruct (store_eq_dec σ σ'); [destruct (kont_eq_dec κ κ'); [destruct (time_eq_dec t' (tick (ev (lam x e) ρ σ))); [subst; apply Some,ev_lam|]|]|]|]; exact None].

(* ev -> ap *)
exact None.

(* co -> ev *)
destruct κ as [|[e ρ|fnv] κ_];
  [exact None (* mt -/> *)
  |destruct (expr_eq_dec e e');[destruct (env_eq_dec ρ ρ'); [destruct (store_eq_dec σ σ'); [destruct (kont_eq_dec κ' (fn v :: κ_)); [destruct (time_eq_dec t' (tick (co v σ))); [subst; apply Some,co_ar|]|]|]|]|]; exact None
  |exact None (* fn v -/-> ev *)].

(* co -> co *)
exact None.

(* co -> ap *)
destruct κ as [|[e ρ|fnv] κ_];
  [exact None
  |exact None
  |destruct (set_In_dec storeable_eq_dec (s_closure x' e' ρ') (force σ fnv)) as [doable|];
    [rewrite <- in_force_In_force in doable;
      destruct (val_eq_dec v' v); [destruct (store_eq_dec σ σ'); [destruct (kont_eq_dec κ_ κ'); [destruct (time_eq_dec t' (tick (co v σ))); [subst; apply Some,co_fn; auto|]|]|]|]|]; exact None].

(* ap -> ev *)
set (a := alloc (ap x e ρ v σ));
destruct (expr_eq_dec e' e); [destruct (env_eq_dec ρ' (extend_ρ x a ρ));[destruct (store_eq_dec σ' (σ_join σ a v));[destruct (kont_eq_dec κ' κ);[destruct (time_eq_dec t' (tick (ap x e ρ v σ))); [subst; apply Some, do_ap;auto|]|]|]|]|]; exact None.

(* ap -> co *)
exact None.
(* ap -> ap *)
exact None.
Defined.
*)

Inductive Shallow_TrunKont_Kont_rel : TrunKont -> Kont -> Prop :=
| mt_rel : `{Shallow_TrunKont_Kont_rel mt nil}
| push_rel : `{Shallow_TrunKont_Kont_rel tκ κ ->
               Shallow_TrunKont_Kont_rel (kpush φ tκ) (φ :: κ)}
|  rt_rel : `{Shallow_TrunKont_Kont_rel (rt ctx) κ}.

Inductive Relate_nonmemo : CES_point -> Memo -> Prop :=
  rel_ev : `{Relate_nonmemo (ev e ρ σ) M}
| rel_co : `{Relate_nonmemo (co v σ) M}
| rel_nonmemo_ap : forall x e ρ v σ M,
                     let p := (ap x e ρ v σ) in
                     let a := alloc p in
                     let ρ' := extend_ρ x a ρ in
                     let σ' := σ_join σ a v in
                     let t' := tick p in
                     let ctx := (context e ρ' σ' t') in
                     Unmapped M ctx ->
                     Relate_nonmemo (ap x e ρ v σ) M.

Inductive relate_CESK_CESKMΞ : CESK -> CESKMΞ -> Prop :=
  relate_nonmemo_full : `{Shallow_TrunKont_Kont_rel tκ κ ->
                          Relate_nonmemo p M ->
                          relate_CESK_CESKMΞ (shell p κ t) (widemk (wshell p tκ t) M Ξ)}.

Inductive relate_CESK_CESKMΞ_traces : list CESK -> list (nat * CESKMΞ) -> Prop :=
| relate_inject : forall e n, relate_CESK_CESKMΞ_traces [inject_cesk e] [(n, (inject_ceskmk e))]
| relate_nonmemo : `{relate_CESK_CESKMΞ_traces (ς :: π) ((n,ςw) :: wπ) ->
                     red_cesk ς ς' ->
                     relate_CESK_CESKMΞ ς' ςw' ->
                     relate_CESK_CESKMΞ_traces (ς' :: ς :: π) ((nw,ςw') :: (n,ςw) :: wπ)}
| relate_stutter : `{nw' < nw ->
                     red_cesk ς ς' ->
                     relate_CESK_CESKMΞ_traces (ς :: π) ((nw,ςw) :: wπ) ->
                     relate_CESK_CESKMΞ_traces (ς' :: ς :: π) ((nw',ςw) :: (nw,ςw) :: wπ)}
| relate_memo : `{relate_CESK_CESKMΞ_traces (ς :: π)
                                            ((n', (widemk (wshell p_ tκ t_) M Ξ)) :: wπ)
                  ->
                  red_cesk ς (shell (ap x e ρ v σ) κ t) ->
                  let p := (ap x e ρ v σ) in
                  let a := alloc p in
                  let ρ' := extend_ρ x a ρ in
                  let σ' := σ_join σ a v in
                  let t' := tick p in
                  let ctx := (context e ρ' σ' t') in
                  in_memos M ctx (res vm σm tm) ->
                  Trace red_cesk (shell (ev e ρ σ) κ t)
                        ((shell (co vm σm) κ tm) :: mπ) ->
                  relate_CESK_CESKMΞ_traces ((shell (ap x e ρ v σ) κ t) :: π)
                                            ((length mπ,(widemk (wshell (ap x e ρ v σ) tκ t) M Ξ))
                                               :: (n',(widemk (wshell p_ tκ t_) M Ξ)) :: wπ)}.

Theorem initial_trace_inv : forall e wπ,
                              Trace red_ceskmk (inject_ceskmk e) wπ ->
                              Forall (fun x =>
                                        Inv e x /\
                                        match x with
                                            widemk s M Ξ => StateOrd s M Ξ
                                        end) wπ.
Proof.
  induction wπ; intros HT; [constructor|].
  inversion HT as [| ς wπ' ? HT' Hstep Hin];
    [constructor;[exact (inject_ceskmk_inv e)
                 |constructor]
    |subst;rewrite Forall_forall; intros ς' Hin; inversion Hin;
     rewrite Forall_forall in IHwπ;
     [subst;
       destruct ς as [s M Ξ];
       assert (invlast : Inv e (widemk s M Ξ) /\ StateOrd s M Ξ) by
           (apply IHwπ; [|left];auto);
      destruct invlast as [invlast ordlast];
        destruct ς' as [s' M' Ξ'];
        split;
        [inversion invlast as [? ? ? Hwinv]; subst;constructor; apply (inv_invariant Hwinv); auto
        |apply (ord_invariant Hstep ordlast)]
      |apply IHwπ; auto]].
Qed.

Theorem TraceRed_preserves_relation : forall e π wπ
                                             (Hrel : relate_CESK_CESKMΞ_traces π wπ)
                                             π' wπ'
                                             (HMK : TraceRed_Stutter red_ceskmk (inject_ceskmk e) wπ wπ')
                                             (Horig : TraceRed red_cesk (inject_cesk e) π π'),
                                        relate_CESK_CESKMΞ_traces π' wπ'.
Proof.
  intros e_ ? ? Hrel; induction Hrel as [|ς π_ wn wς wπ_ ς' wς' wn' Hrel' IH Hstep Hsrel
                                         |
                                         |x e* ρ v σ κ t π_ tκ M Ξ wπ_ v_ σ_ t_ π'_ πsuff ? IH
                                          p a ρ' σ' t' ctx Hinmemo HT Htail];
  [intros π' wπ' HMK Horig
  |intros π' wπ' HMK Horig
  |intros π' wπ' HMK Horig
  |intros Hsuff π_'].

  (* injection case always not memo'd *)
  inversion Horig as [|? ? ς' Horig' Hstep];
  inversion HMK as [nw foo bar |nw_ nw'_ ? ? Hlew |? nw ? ? wς' HMK' Hstep']; subst;
  [apply relate_stutter; [| |apply relate_inject]; auto
  |apply relate_nonmemo;
    [apply relate_inject| |
     inversion Hstep' as [x ρ σ a tκs ts Ms Ξs ps Hmap Hpeq Hs'eq |
                          e0 e1 ρ σ tκs ts Ms Ξs ps Hpeq |
                          x elam ρ σ tκs ts Ms Ξs ps Hpeq Hs'eq |
                          v σ earg ρ tκs ts Ms Ξs ps Hpeq Hs'eq |
                          v σ x ebody ρ fnv tκs ts Ms Ξs ps Hin_force Hpeq Hs'eq |
                          x ebody ρ v σ tκs ts Ms Ξs ps a ρ' σ' ts' ctx Hunmapped Hpeq Hs'eq |
                          x ebody ρ v σ tκs ts Ms Ξs vm σm tm ps a ρ' σ' ctx Hinmemos Hpeq Hs'eq |
                          v σ ctx tκs Ms Ξs t's M's Hin_ctxs Hpeq Hs'eq]; subst;
     try solve [inversion Hmap];
     inversion Hstep as [x_ ρ_ σ_ a_ κ_ t_ p_ Hmap_
                        |e0_ e1_ ρ_ σ_ κ_ t_ p_ Hpeq_
                        |x_ elam_ ρ_ σ_ κ_ t_ p_ Hpeq Hs'eq_
                        | | | ];
     try solve [inversion Hmap_]; subst; repeat constructor]]; auto.

  inversion Horig as [|? ? ς'_ Horig' Hstep_];
  inversion HMK as [nw foo bar |nw_ nw'_ ? ? Hlew |? nw ? ? wς'_ HMK' Hstep']; subst.
Abort.
End NonStandardSemantics.
End NonStandardData.
End StandardSemantics.
End Data.
