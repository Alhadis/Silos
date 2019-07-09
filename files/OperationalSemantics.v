Require Export NamelessUTLC.Language.

Fixpoint unshift (t: term) :=
  match t return term with
  | var n => n.-1
  | abs t => [fun unshift t]
  | app fn arg => unshift fn @ unshift arg
  end.

Theorem unshift_bounded {n t} : bounded n t -> bounded n (unshift t).
Proof. elim=> //=. move=> {n t} ? k lt. constructor. by case: k lt. Qed.

Fixpoint reduce (t: term) : seq term :=
  match t with
  | var n => [::]
  | abs t => map abs (reduce t)
  | app fn arg =>
    (if fn is abs body
     then [:: unshift (substitute (shift 1 arg) 0 body)]
     else [::]) ++ map (app ^~ arg) (reduce fn) ++ map (app fn) (reduce arg)
  end.

Fixpoint normal_step (t: term) : option term :=
  match t with
  | var n => None
  | abs t => fmap abs (normal_step t)
  | app (abs body) arg => Some (unshift (substitute (shift 1 arg) 0 body))
  | app fn arg =>
    (match normal_step fn with
     | Some fn' => Some (fn' @ arg)
     | None => fmap (app fn) (normal_step arg)
     end)
  end.

Fixpoint cbn_step (t: term) : option term :=
  match t with
  | var n => None
  | abs t => None
  | app (abs body) arg => Some (unshift (substitute (shift 1 arg) 0 body))
  | app fn arg => fmap (app ^~ arg) (cbn_step fn)
  end.

Fixpoint cbv_step (t: term) : option term :=
  match t with
  | var n => None
  | abs t => None
  | app [fun body] [fun argbody] =>
    Some (unshift (substitute (shift 1 [fun argbody]) 0 body))
  | app fn arg => fmap (app ^~ arg) (cbv_step fn)
  end.

Lemma option_fmap_Some {A B f} {mx: option A} {y: B}
  : fmap f mx = Some y -> {x | mx = Some x /\ f x = y}.
Proof. case: mx => //= ?. by case. Qed.

Theorem cbv_in_reduce : forall {t t'}, (cbv_step t == Some t') ==> (t' \in reduce t).
Proof. elim=> //= fn IHfn arg _ t.
  have H: match fn with
           | [ fun body] =>
             match arg with
             | [ fun argbody] => Some (unshift (substitute (shift 1 [ fun argbody]) 0 body))
             | _ => fmap (app^~ arg) (cbv_step fn)
             end
           | _ => fmap (app^~ arg) (cbv_step fn)
          end == Some t ->
          (exists body, fn = [fun body] /\
                   (exists argbody, arg = [fun argbody] /\
                                unshift (substitute (shift 1 [ fun argbody]) 0 body) = t))
          \/ (exists fn', cbv_step fn == Some fn' /\ fn' @ arg = t).
  {
    case: fn {IHfn} => //.
    - move=> ?. case: arg => //. move=> ?. by case/eqP.
    - move=> ? ? /eqP/option_fmap_Some-[fn' ?]. right. exists fn'. by split; [apply/eqP|].
  }
  apply/implyP.
  move/H=> {H}. case.
  - move=> [? [-> [? [-> ->]]]] /=. by rewrite in_cons eq_refl.
  - move=> [fn' [H <-]]. move/(_ fn'): IHfn. rewrite {}H /= mem_cat => ?.
    apply/orP. right. rewrite mem_cat. apply/orP. left.
    by apply: map_f.
Qed.

Corollary reduce_nil_cbv_None {t} : nilp (reduce t) ==> ~~ cbv_step t.
Proof. rewrite implybN. apply/implyP=> H.
  case H: (cbv_step t) H => _ //.
  move/eqP/(implyP cbv_in_reduce): H.
  by case: (reduce t).
Qed.

Theorem cbn_in_reduce : forall {t t'}, (cbn_step t == Some t') ==> (t' \in reduce t).
Proof. elim=> //= fn IHfn arg _ t.
  have H: (match fn with
           | [ fun body] => Some (unshift (substitute (shift 1 arg) 0 body))
           | _ => fmap (app^~ arg) (cbn_step fn)
           end == Some t) ->
          (exists body, fn = [fun body] /\ unshift (substitute (shift 1 arg) 0 body) = t)
          \/ (fmap (app^~ arg) (cbn_step fn) = Some t).
  {
    case: fn {IHfn} => //.
    - move=> ?. by case/eqP.
    - move=> fn arg'. by move/eqP/option_fmap_Some=> [? [-> <-]].
  }
  apply/implyP. move/H=> {H}. case.
  - move=> [body [-> <-]]. by rewrite in_cons eq_refl.
  - move=> H. move/option_fmap_Some: H IHfn => {t}[t [-> <-]].
    move/(_ t)/implyP/(_ (eq_refl _)) => H.
    rewrite mem_cat. apply/orP. right. rewrite mem_cat. apply/orP. left.
    by apply: map_f.
Qed.

Theorem normal_in_reduce : forall {t t'}, (normal_step t == Some t') ==> (t' \in reduce t).
Proof. elim=> //=.
  - move=> t IH t'. apply/implyP=> /eqP/option_fmap_Some-H.
    move: H IH => [body [-> <-]] /(_ body)/implyP/(_ (eq_refl _)).
    by apply: map_f.
  - move=> fn IHfn arg IHarg t.
    have H: (match fn with
             | [ fun body] => Some (unshift (substitute (shift 1 arg) 0 body))
             | _ => match normal_step fn with
                   | Some fn' => Some (fn' @ arg)
                   | None => fmap (app fn) (normal_step arg)
                   end
             end == Some t) ->
            (exists body, fn = [fun body] /\
                     t = unshift (substitute (shift 1 arg) 0 body))
            \/ (exists fn', normal_step fn = Some fn' /\ t = app fn' arg)
            \/ (normal_step fn = None /\
               fmap (app fn) (normal_step arg) = Some t).
    {
      case: fn IHfn => //.
      - move=> ? _. by move/eqP.
      - move=> ? _. by case/eqP.
      - move=> fn arg'. case: (normal_step (fn @ arg')) => [fn'|] //.
        + move/(_ fn'). move fn_eq: (fn @ arg') => ?.
          rewrite eq_refl /= => ? /eqP. by case=> <-.
        + move=> _. case: (normal_step arg) IHarg => [arg''|] //=.
          move/(_ arg''). rewrite eq_refl /= => ? /eqP. by case=> <-.
    }
    apply/implyP. case/H=> {H}; [|case].
    + move=> [body [-> ->]]. by rewrite in_cons eq_refl.
    + move=> H. move: H IHfn => [fn' [-> ->]] /(_ fn'). rewrite eq_refl /= => H.
      rewrite mem_cat. apply/orP. right. rewrite mem_cat. apply/orP. left.
      by apply: map_f.
    + move=> H. move: H IHarg => [_ /option_fmap_Some-[arg' [-> <-]]].
      move/(_ arg'). rewrite eq_refl /= => H.
      do !(rewrite mem_cat; apply/orP; right). by apply: map_f.
Qed.

Lemma reduce_nil_normal_None : forall {t}, nilp (reduce t) ==> ~~ normal_step t.
Proof. move=> t. case reduction_nil: (nilp (reduce t)) => //=.
  apply/negP. case normal_steps_some: (normal_step t) => //=.
  move/eqP/(implyP normal_in_reduce): normal_steps_some.
  by move/nilP: reduction_nil=> ->.
Qed.

Theorem normal_None_reduce_nil : forall {t}, ~~ normal_step t ==> nilp (reduce t).
Proof. elim=> //=.
  - move=> t. by case: (normal_step t) => // /nilP->.
  - move=> fn IHfn arg IHarg.
    case: fn IHfn => //.
    + move=> /= ? _. case: (normal_step arg) IHarg => //=. by move/nilP=> ->.
    + move=> fn arg'. case (normal_step (fn @ arg')) => //.
      move: {fn arg'} (fn @ arg') => fn /nilP-> /=.
      by case: (normal_step arg) IHarg => //= /nilP->.
Qed.