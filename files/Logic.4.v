
From mathcomp Require Import ssreflect ssrfun ssrbool ssrint eqtype ssrnat seq choice fintype rat .
From mathcomp Require Import bigop ssralg div ssrnum ssrint finset ssrnum ssrnat finmap tuple.

Require Import Premeas Meas Posrat Aux SeqOps.
Require List.

Definition dep_cast {A} {B : A -> Type} {x y : A}  (z : B x) (heq : x = y) : B y.
  rewrite -heq; apply z.
Defined.

Lemma cast_existT : forall {A} {P : A -> Type} {x1} {x2} (heq : x1 = x2) (p : P x1),
    existT P x1 p = existT P x2 (dep_cast p heq).
intros.
destruct heq.
simpl.
done.
Qed.

Class type (T : eqType) :=
  {
    denomT : T -> choiceType;
    tprod : T -> T -> T;
    Hprod : forall t1 t2, denomT (tprod t1 t2) = [choiceType of (denomT t1) * (denomT t2)]
                                               }.

Section RDef.
  Context (N : choiceType) (T : choiceType) `{type T}.

  Fixpoint Reaction (ns : list (N * T)) (n : N * T) :=
    match ns with
      | nil => meas (denomT n.2)
      | n' :: ns' => (denomT n'.2 -> Reaction ns' n)
                                   end.

  Fixpoint detReaction (ns : list (N * T)) (n : N * T) : Type :=
    match ns with
      | nil => (denomT n.2)
      | n' :: ns' => (denomT n'.2 -> detReaction ns' n)
                                   end.

  Fixpoint lift_det {ns n} (r : detReaction ns n) {struct ns} : Reaction ns n.
  destruct ns; simpl in *.
  apply (ret r).
  apply (fun a => lift_det _ _ (r a)).
  Defined.

  Definition rbind_def {ns} {ns'} {n n'} (r : Reaction ns n) (k : denomT n.2 -> Reaction (ns ++ ns') n') : Reaction (ns ++ ns') n'.
    induction ns; simpl in *.
    induction ns'; simpl in *.
    apply (mbind r k).
    intro; apply IHns'.
    apply (fun n2 => k n2 X).
    intro; apply IHns.
    apply r; apply X.
    apply (fun n2 => k n2 X).
  Defined.

  Definition rbind {ns} {ns'} {n n'} (r : Reaction ns n) (k : denomT n.2 -> Reaction (ns ++ ns') n') :=
    locked (rbind_def r k).



  Fixpoint detReaction_subst {ns ns'} {n n'} (r : detReaction ns n) (k : Reaction (n :: (ns ++ ns')) n')  {struct ns}
    : Reaction (n :: (ns ++ ns')) n'.
    induction ns.
    simpl in *.
    apply (fun _ => (k r)).
    simpl in *.
    intros x y.
    apply (detReaction_subst _ _ _ _  (r y) (fun z => k z y) x).
  Defined.


  Definition subst_arg (ns : list (N * T)) (n n' : N) : list (N * T) :=
  map (fun a => if a.1 == n then (n', a.2) else a) ns.

  Definition React_subst_arg {ns f} (r : Reaction ns f) (n n' : N) : Reaction (subst_arg ns n n') f.
  induction ns.
  apply r.
  simpl in *.
  destruct (a.1 == n).
  simpl in *.
  apply (fun x => IHns (r x)).
  apply (fun x => IHns (r x)).
  Defined.

  Definition React_subst_val {ns f} (r : Reaction ns f) (n n' : N) : Reaction ns (if f.1 == n then n' else f.1, f.2).
  induction ns.
  apply r.
  simpl in *.
  destruct (f.1 == n).
  apply (fun x => IHns (r x)).
  apply (fun x => IHns (r x)).
  Defined.

  Definition Reaction_Perm {t1 t2 t'} (r : Reaction t1 t') : Perm t1 t2 -> Reaction t2 t'.
    intro HR.
    induction HR; simpl in *.
    apply r.
    apply (fun x => IHHR (r x)).
    apply (fun x y => r y x).
    apply IHHR2; apply IHHR1; apply r.
  Defined.

  Definition Reaction_pair {ns} {n n'} t (k1 : Reaction ns n) (k2 : Reaction ns n') : (Reaction ns (t, tprod n.2 n'.2)) * (detReaction ((t, tprod n.2 n'.2) :: ns) n) * (detReaction ((t, tprod n.2 n'.2) :: ns) n').
    induction ns; simpl in *.
    rewrite !Hprod //=.
    apply (k1 ** k2, fst, snd).
    rewrite !Hprod //= in IHns.
    set ih := fun t => IHns (k1 t) (k2 t).
    split.
    split.
    apply (fun t => (ih t).1.1).
    rewrite Hprod //=.
    apply (fun p x => (ih x).1.2 p).
    rewrite Hprod //=.
    apply (fun p x => (ih x).2 p).
  Defined.

  

Definition reaction :=
  { ns : (list (N * T) * bool * (N * T)) & Reaction ns.1.1 ns.2 }.


Definition reaction_perm (r : reaction) {ns} (Hp : Perm (tag r).1.1 ns) : reaction.
    destruct r; simpl in *.
    econstructor.
    instantiate (1 := (ns, x.1.2, x.2)).
    simpl.
    eapply (Reaction_Perm r Hp).
Defined.

Definition rct {ns n} b (r : Reaction ns n) : reaction := existT _ (ns, b, n) r.
Definition drct {ns n} b (r : detReaction ns n) : reaction := existT _ (ns, b, n) (lift_det r).

Definition reaction_pair (r1 r2 : reaction) (n : N) : (tag r1).1.1 = (tag r2).1.1 -> reaction * reaction * reaction.
intro.
destruct r1, r2; simpl in *.
rewrite H0 in r.
move: (Reaction_pair n r r0) => p.
apply (existT _ (_, false, _) p.1.1, existT (fun ns => Reaction ns.1.1 ns.2) (_,x.1.2,_) (lift_det p.1.2), existT (fun ns => Reaction ns.1.1 ns.2) (_, x0.1.2, _) (lift_det  p.2)).
Defined.

Definition reaction_weak (r : reaction) (n : N * T) : reaction.
    destruct r.
    econstructor.
    instantiate (1 := (n :: x.1.1, x.1.2, x.2)).
    simpl.
    apply (fun _ => r).
Defined.

Definition reaction_subst_arg (r : reaction) (n n' : N) : reaction.
    destruct r.
    econstructor.
    instantiate (1 := (subst_arg x.1.1 n n', x.1.2, x.2)).
    simpl in *.
    apply React_subst_arg.
    apply r.
Defined.

Definition reaction_subst (r : reaction) (n n' : N) : reaction.
    destruct r.
    econstructor.
    instantiate (1 := (subst_arg x.1.1 n n', x.1.2, (if x.2.1 == n then n' else x.2.1, x.2.2))).
    simpl.
    apply React_subst_arg.
    apply React_subst_val.
    apply r.
Defined.

Definition reaction_dep (r : reaction) (n : N) := n \in map fst (tag r).1.1.

Definition rlist := list (reaction + (N * T)).

Definition rlist_subst_arg (r : rlist) (n n' : N) : rlist :=
  map (fun a => match a with | inr m => inr m | inl r => inl (reaction_subst_arg r n n') end) r.

Definition rlist_subst (r : rlist) (n n': N) : rlist :=
  map (fun a => match a with | inr m => inr (if m.1 == n then (n', m.2) else m) | inl r => inl (reaction_subst r n n') end) r.


  Fixpoint RHiddens (r : rlist) : seq N :=
    match r with
      | nil => nil
      | inr _ :: rs => RHiddens rs
      | inl (existT p _) :: rs =>
        if p.1.2 then RHiddens rs else p.2.1 :: RHiddens rs
                                                       end.

Fixpoint ROutputs (r : rlist) : seq N:=
    match r with
      | nil => nil
      | inr _ :: rs => ROutputs rs
      | inl (existT p _) :: rs =>
        if p.1.2 then p.2.1 :: ROutputs rs else ROutputs rs
                                                       end.

  Fixpoint RInputs (r : rlist) : seq N:=
    match r with
    | nil => nil
    | inr n :: rs => n.1 :: RInputs rs
    | inl _ :: rs => RInputs rs
                             end.

    Definition chan_of (x : reaction + (N * T)) :=
      match x with
        | inr a => a.1
        | inl (existT t _) => t.2.1
                                end.

    Definition chan_ty_of (x : reaction + (N * T)) : (N * T) :=
      match x with
        | inr a => a
        | inl (existT t _) => t.2
                                end.
      

  Definition RSeqs (r : rlist) : seq N:=
    map chan_of r.

  Definition RArgs (r : rlist) : seq N :=
    flatten (map (fun x =>
                    match x with
                      | inl r => map fst (tag r).1.1
                      | inr _ => nil end) r).

  Definition RChans r := RSeqs r ++ RArgs r.

  Definition rlist_nub (r : rlist) :=
    filter (fun p =>
              match p with
                | inl _ => true
                | inr i => i.1 \notin (ROutputs r) end) r.

  Definition rlist_comp (r1 r2 : rlist) := rlist_nub (r1 ++ r2).
  Definition rlist_hide (rs : rlist) (i : N -> bool) : rlist :=
    map (fun r =>
           match r with
           | inl (existT (a, b, c) r) => if i c.1 then inl (existT (fun ns => Reaction ns.1.1 ns.2) (a, false, c) r) else inl (existT (fun ns => Reaction ns.1.1 ns.2) (a, b, c) r) 
           | inr m => inr m end) rs.                                                                                            

  Definition r_comparable (r1 r2 : rlist) :=
    ((RInputs r1) ==i (RInputs r2)) && ((ROutputs r1 ==i ROutputs r2)).
    
  
    Definition r_compat (r1 r2 : rlist) :=
      all (fun x => (x \in RChans r2) ==>
                                                        [|| ((x \in RInputs r1) && (x \in ROutputs r2)) |
                                                         ((x \in RInputs r2) && (x \in ROutputs r1))]) (RChans r1).

  Definition rlist_nub_hide (r : rlist) (chans1 chans2 : seq N) : rlist :=
    pmap (fun rct =>
            match rct with
            | inl (existT (a,b,c) r) => if (c.1 \in chans1) && (c.1 \in chans2) then
                                          Some (inl (existT (fun ns => Reaction ns.1.1 ns.2) (a, false, c) r)) else
                                          Some rct
            | inr i => if (i.1 \in chans1) && (i.1 \in chans2) then None else Some (inr i)
                                                                               end) r.
  Definition rlist_comp_hide r1 r2 :=
    let c1 := RChans r1 in
    let c2 := RChans r2 in
    (rlist_nub_hide r1 c1 c2) ++ (rlist_nub_hide r2 c1 c2).

  Fixpoint React_eq ns n (r1 r2 : Reaction ns n) {struct ns} : Prop.
    destruct ns; simpl in *.
    apply (r1 = r2).
    apply (forall x, React_eq _ _ (r1 x) (r2 x)).
  Defined.

Notation "G ~> c b D" := (inl (existT (fun ns => Reaction ns.1.1 ns.2) (G, b, c) D)) (at level 80, c at level 9, b at level 9).

Open Scope nat_scope.

Inductive r_rewr_bi : rlist -> rlist -> Prop :=
| rewr_bi_trans : forall r1 r2 r3, r_rewr_bi r1 r2 -> r_rewr_bi r2 r3 -> r_rewr_bi r1 r3
| rewr_bi_refl : forall r1, r_rewr_bi r1 r1
| rewr_bi_sym : forall r1 r2, r_rewr_bi r1 r2 -> r_rewr_bi r2 r1
| rewr_perm : forall rs rs', Perm rs rs' -> r_rewr_bi rs rs'
| rewr_add_ch : forall rs b g f (r : Reaction g f) n c,
    List.nth_error rs n = Some (g ~> f b r) ->
    c \in g ->
    r_rewr_bi rs (lset rs n ((c :: g) ~> f b (fun _ => r)))
| rewr_r_perm : forall rs n r {ns} (H : Perm _ ns),
    List.nth_error rs n = Some (inl r) ->
    r_rewr_bi rs (lset rs n (inl (reaction_perm r H)))
| rewr_ext : forall rs n G c b (k k' : Reaction G c),
    List.nth_error rs n = Some (G ~> c b k) ->
    React_eq _ _ k k' ->
    r_rewr_bi rs (lset rs n (G ~> c b k'))
| rewr_fold : forall rs G1 G2 h (r : Reaction G1 h) n (k : (denomT h.2 -> Reaction (G1 ++ G2) n)) (b : bool) ,
      h.1 \notin RChans rs ->
      h.1 != n.1 ->
      r_rewr_bi (((G1 ++ G2) ~> n b (rbind r k)) :: rs)
                ((G1 ~> h false r) :: ((h :: (G1 ++ G2)) ~> n b k) :: rs)

  | rewr_pair : forall rs (n1 n2 : nat) (n' : N) (r1 r2 : reaction),
      List.nth_error rs n1 = Some (inl r1) ->
      List.nth_error rs n2 = Some (inl r2) ->
      n' \notin RChans rs ->
      forall (H : (tag r1).1.1 = (tag r2).1.1),
        let p := reaction_pair r1 r2 n' H in
        r_rewr_bi rs (inl p.1.1 :: inl p.1.2 :: inl p.2 :: remove2 rs n1 n2)
  | rewr_subst : forall (rs : rlist) pos1 pos2 ns ns' b1 b2 h f (r : detReaction ns h) (k : Reaction (h :: (ns ++ ns')) f), 
      List.nth_error rs pos1 = Some (ns ~> h b1 (lift_det r)) ->
      List.nth_error rs pos2 = Some (h :: (ns ++ ns') ~> f b2 k) ->
      r_rewr_bi rs (lset rs pos2 (h :: (ns ++ ns') ~> f b2 (detReaction_subst r k)))
  | rewr_hid_ws : forall (rs : rlist) pos1 pos2 g1 g2 h (d : Reaction g1 h) c (d' : Reaction g2 c) b,
      List.nth_error rs pos1 = Some (g1 ~> h false d) ->
      List.nth_error rs pos2 = Some (g2 ~> c b d') ->
      all (fun x => x \in g2) g1 ->
      r_rewr_bi rs (lset rs pos2 (h :: g2 ~> c b (fun _ => d')))
  | rewr_addrem : forall (rs : rlist) pos h g1 (r : Reaction g1 h),
      List.nth_error rs pos = Some (g1 ~> h false r) ->
      let rs' := remove rs pos in
      all (fun x => x \in RChans rs') (map fst g1) ->
      h.1 \notin RChans rs' ->
      r_rewr_bi rs rs'
  | rewr_ch_trans : forall (rs : rlist) pos1 pos2 n (g1 g2 : seq (N * T)) (f1 f2 : N * T) (d : Reaction g1 f1) (d' : Reaction g2 f2) b1 b2,
      List.nth_error rs pos1 = Some (g1 ~> f1 b1 d) ->
      List.nth_error rs pos2 = Some (g2 ~> f2 b2 d') ->
      n \in g1 ->
      f1 \in g2 ->
      r_rewr_bi rs (lset rs pos2 (n :: g2 ~> f2 b2 (fun _ => d')))
  | rewr_congr : forall rs1 rs2 rs3,
      r_compat rs3 rs1 ->
      r_compat rs3 rs2 ->
      r_rewr_bi rs1 rs2 ->
      r_rewr_bi (rlist_comp_hide rs3 rs1) (rlist_comp_hide rs3 rs2)
  | rewr_rename : forall rs n n',
      n \notin RInputs rs ->
      n \notin ROutputs rs ->
      n' \notin RChans rs ->
      n' \notin RArgs rs ->
      r_rewr_bi rs (rlist_subst rs n n').

  Inductive r_rewr : rlist -> rlist -> Prop :=
  | rewr_bi_r : forall r1 r2, r_rewr_bi r1 r2 -> r_rewr r1 r2
  | rewr_bi_l : forall r1 r2, r_rewr_bi r1 r2 -> r_rewr r2 r1
  | rewr_refl : forall r, r_rewr r r
  | rewr_trans : forall r1 r2 r3, r_rewr r1 r2 -> r_rewr r2 r3 -> r_rewr r1 r3
  | rewr_str : forall (rs : rlist) pos (g : seq (N * T)) (f : N * T) (d : Reaction g f) b (n : N * T) ,
      List.nth_error rs pos = Some (n :: g ~> f b (fun _ => d)) ->
      n.1 \in RChans (remove rs pos) ->
      r_rewr rs (lset rs pos (g ~> f b d))
  | rewr_str_inp : forall (rs : rlist) pos (i : N * T) g b f (k : Reaction g f),
      List.nth_error rs pos = Some (i :: g ~> f b (fun _ => k)) ->
      i.1 \in RInputs rs ->
      r_rewr rs (lset rs pos (g ~> f b k)).

End RDef.
