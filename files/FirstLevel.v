Require Import StoreAtomicity Coherence CacheLocal Tree DataTypes Case Useful.

Set Implicit Arguments.

Module Type FirstLevel (Import coh: Coherence) (Import cl: CacheLocal coh).
  Definition clean a t p :=
    le Sh (state a t p) /\ forall c, parent c p -> le (dir a t p c) Sh.

  Definition noStoreData a d t :=
    d = initData a /\ forall t', t' < t -> noStore a respFn t'.

  Definition isStoreData a d t :=
    exists tm, tm < t /\ match respFn a tm with
                           | Some (Build_Resp cm im dm) =>
                             let (descQm, dtQm) := reqFn a cm im in
                             d = dtQm /\ descQm = St /\
                             forall t', tm < t' < t -> noStore a respFn t'
                           | None => False
                         end.
  Parameter latestValue:
    forall a t pCache,
      let p := node pCache in
      clean a t p ->
      noStoreData a (data a t p) t \/ isStoreData a (data a t p) t.

  Parameter processReq:
    forall a t, 
      match respFn a t with
        | Some (Build_Resp cProc _ _) =>
          let c := p_node cProc in
          let (op, d) := reqFn a cProc (next a t c) in
          match op with
            | Ld => le Sh (state a t c)
            | St => state a t c = Mo
          end
        | None => True
      end.
   
  Parameter nextChange:
    forall a t p,
      let c := p_node p in
      next a (S t) c <> next a t c ->
      match respFn a t with
        | Some (Build_Resp cProc' _ _) => p_node cProc' = c
        | None => False
      end.
   
  Parameter noReqAgain:
    forall a t,
    match respFn a t with
      | Some (Build_Resp cProc _ _) =>
        let c := p_node cProc in
        next a (S t) c = S (next a t c)
      | None => True
    end.
End FirstLevel.

Module mkStoreAtomic (Import coh: Coherence) (Import cl: CacheLocal coh) (Import fl: FirstLevel coh cl).
  Section ForAddr.
    Variable a: Addr.
    Lemma nextIncOrSame:
      forall t p,
        next a (S t) (p_node p) = next a t (p_node p) \/
        next a (S t) (p_node p) = S (next a t (p_node p)).
    Proof.
      intros t p.
      assert (opts: next a (S t) (p_node p) = next a t (p_node p) \/
                    next a (S t) (p_node p) <> next a t (p_node p)) by omega.
      pose proof (@nextChange a t p) as nextChange.
      pose proof (noReqAgain a t) as noReqAgain.
      destruct opts; repeat destructAll;
      try match goal with
            | [H: (next a (S t) (p_node p) <> next a t (p_node p)) |- _ ] =>
                specialize (nextChange H); try rewrite <- nextChange in *
          end;
      intuition.
    Qed.

    Lemma increasingIdx: forall t1 t2, t1 <= t2 -> forall p,
                                                     let c := p_node p in
                                                     next a t1 c <=
                                                     next a t2 c.
    Proof.
      intros t1 t2 cond p c.
      diff t1 t2 cond.
      induction td; simplArith.
      omega.
      destruct (nextIncOrSame (t1 + td) p) as [eq|neq]; unfold c in *; omega.
    Qed.

    Lemma incrOnResp: forall t1 t2, t1 < t2 -> match respFn a t1 with
                                                 | Some (Build_Resp c1 i1 _) =>
                                                   next a t2 (p_node c1) > i1
                                                 | _ => True
                                               end.
    Proof.
      intros t1 t2 t1_lt_t2.
      assert (St1_le_t2: S t1 <= t2) by omega.
      pose proof (increasingIdx St1_le_t2) as u1.
      pose proof (noReqAgain a t1).
      pose proof (respFnIdx a t1).
      repeat destructAll;
        repeat match goal with
          | c: Proc |- _ => specialize (u1 c); omega
          | _ => intuition
        end.
    Qed.

    Theorem uniqRespLabels':
      forall t1 t2, match respFn a t1, respFn a t2 with
                      | Some (Build_Resp c1 i1 _), Some (Build_Resp c2 i2 _) =>
                        p_node c1 = p_node c2 -> i1 = i2 -> t1 = t2
                      | _, _ => True
                    end.
    Proof.
      Ltac finish incrOnResp respFnIdx t2 slt :=
        specialize (incrOnResp _ _ slt);
        specialize (respFnIdx a t2);
        repeat destructAll;
        match goal with
          | _ => intros pEq idEq; rewrite pEq, idEq in *; omega
          | _ => intuition
        end.

      intros t1 t2.
      pose proof @incrOnResp as incr;
      assert (opts: t1 = t2 \/ t1 < t2 \/ t2 < t1) by (unfold Time in *; omega).
      destruct opts as [eq| [slt|sgt]].
      repeat destructAll; intuition.
      finish incr respFnIdx t2 slt.
      finish incr respFnIdx t1 sgt.
    Qed.

    Theorem localOrdering':
      forall t1 t2, match respFn a t1, respFn a t2 with
                      | Some (Build_Resp c1 i1 _), Some (Build_Resp c2 i2 _) =>
                        p_node c1 = p_node c2 -> i1 > i2 -> t1 > t2
                      | _, _ => True
                    end.
    Proof.
      intros t1 t2.
      assert (opts: t1 > t2 \/ t1 <= t2) by (unfold Time in *; omega).
      destruct opts as [lt|le].
      repeat destructAll; intuition.
      pose proof (increasingIdx le) as incr.
      pose proof (respFnIdx a t1) as r1.
      pose proof (respFnIdx a t2) as r2.
      repeat destructAll; intros;
        repeat match goal with
                 | [H: p_node ?p1 = p_node ?p2 |- _] =>
                     rewrite H in *;
                             specialize (incr p2); omega
                 | _ => intuition
               end.
    Qed.

    Lemma allPrevIdx:
      forall t2 p2 i1,
        let c2 := p_node p2 in
        i1 < next a t2 c2 ->
        exists t1, t1 < t2 /\
                   match respFn a t1 with
                     | Some (Build_Resp c1 i _) =>
                         p_node c1 = c2 /\ i = i1
                     | None => False
                   end.
    Proof.
      Ltac finishPrev iht t2 cond :=
        destruct (iht cond);
        match goal with
          | [H: context [?x < t2] |- _] => exists x; try omega; intuition
        end.

      intros t2 p2 i1 c2 i1LtNext.
      induction t2.
      rewrite next0 in *; omega.
      unfold c2 in *.
      pose proof (nextIncOrSame t2 p2) as opts.
      destruct opts as [same | inc].
      rewrite same in *.
      finishPrev IHt2 t2 i1LtNext.

      assert (opts: i1 < next a t2 (p_node p2) \/ i1 = next a t2 (p_node p2))
             by omega;
      destruct opts as [lt | same].
      finishPrev IHt2 t2 lt.

      rewrite same in *.
      assert (ne: next a (S t2) (p_node p2) <> next a t2 (p_node p2)) by omega.
      pose proof (nextChange p2 ne).
      pose proof (respFnIdx a t2).
      exists t2.
      repeat destructAll; try omega; match goal with
                                       | [H: p_node ?p = p_node p2 |- _ ] => rewrite <- H in *; intuition
                                     end.
    Qed.

    Theorem allPrevious':
      forall t2, match respFn a t2 with
                   | Some (Build_Resp c2 i2 _) =>
                       forall i1, i1 < i2 -> exists t1, t1 < t2 /\
                                                           match respFn a t1 with
                                                             | Some (Build_Resp c1 i _) =>
                                                                 p_node c1 = p_node c2 /\ i = i1
                                                             | None => False
                                                           end
                   | _ => True
                 end.
    Proof.
      intros t2.
      pose proof (@allPrevIdx t2) as u1.
      pose proof (respFnIdx a t2).
      repeat destructAll;
      try match goal with
            | [p: Proc |- _] => specialize (u1 (p_node p))
          end; intuition.
    Qed.

    Lemma leafProp: forall p c, ~ parent c (node (proc p)).
    Proof.
      unfold not; intros p c c_p.
      destruct p.
      unfold parent, leaf in *.
      simpl in *.
      repeat destructAll; simpl in *; intuition.
    Qed.

    Lemma cleanProp:
      forall t p,
        le Sh (state a t (node (proc p))) ->
        le Sh (state a t (node (proc p))) /\
        (forall c, parent c (node (proc p)) ->
                   le (dir a t (node (proc p)) c) Sh).
    Proof.
      intros.
      pose proof (leafProp p) as leafProp.
      constructor;
      intros;
        (try match goal with
               | [c: Tree |- _] => specialize (leafProp c)
             end); intuition.
    Qed.

    Theorem storeAtomicity':
      forall t,
        match respFn a t with
          | Some (Build_Resp c i d) =>
            let (descQ, dtQ) := reqFn a c i in
            match descQ with
              | Ld =>
                  noStoreData a d t \/ isStoreData a d t
              | St => d = initData zero
            end
          | _ => True
        end.
    Proof.
      intros t.
      unfold noStoreData, isStoreData.
      pose proof (@cleanProp t) as cleanProp.
      pose proof (respFnIdx a t) as respFnIdx.
      pose proof (respFnLdData a t) as respFnLdData.
      pose proof (@latestValue a t).
      pose proof (processReq a t) as processReq.
      unfold p_node in *.
      destructAll.
      destructAll.
      rewrite <- respFnIdx in *.
      destructAll.
      destructAll.

      specialize (latestValue (proc procR) (cleanProp _ processReq));
      simpl in *; rewrite <- respFnLdData in *;
      intuition.

      intuition.

      intuition.
    Qed.

    Theorem fullStoreAtomicity: StoreAtomicity a respFn.
    Proof.
      apply (Build_StoreAtomicity a respFn uniqRespLabels' localOrdering'
                                  allPrevious' storeAtomicity').
    Qed.
  End ForAddr.
End mkStoreAtomic.
