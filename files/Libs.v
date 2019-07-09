(************************************************************************************)
(* Copyright (c) 2009 Santosh Nagarakatte, Milo M. K. Martin. All rights reserved.  *)
(*                                                                                  *)
(* Developed by: Santosh Nagarakatte, Milo M.K. Martin,                             *)
(*               Jianzhou Zhao, Steve Zdancewic                                     *)
(*               Department of Computer and Information Sciences,                   *)
(*               University of Pennsylvania                                         *)
(*               http://www.cis.upenn.edu/acg/softbound/                            *)
(*                                                                                  *)
(* Permission is hereby granted, free of charge, to any person obtaining a copy     *)
(* of this software and associated documentation files (the "Software"), to         *)
(* deal with the Software without restriction, including without limitation the     *)
(* rights to use, copy, modify, merge, publish, distribute, sublicense, and/or      *)
(* sell copies of the Software, and to permit persons to whom the Software is       *)
(* furnished to do so, subject to the following conditions:                         *)
(*                                                                                  *)
(*   1. Redistributions of source code must retain the above copyright notice,      *)
(*      this list of conditions and the following disclaimers.                      *)
(*                                                                                  *)
(*   2. Redistributions in binary form must reproduce the above copyright           *)
(*      notice, this list of conditions and the following disclaimers in the        *)
(*      documentation and/or other materials provided with the distribution.        *)
(*                                                                                  *)
(*   3. Neither the names of Santosh Nagarakatte, Milo M. K. Martin,                *)
(*      Jianzhou Zhao, Steve Zdancewic, University of Pennsylvania, nor             *)
(*     the names of its contributors may be used to endorse or promote              *)
(*     products derived from this Software without specific prior                   *)
(*     written permission.                                                          *)
(*                                                                                  *)
(* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR       *)
(* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,         *)
(* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE     *)
(* CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *)
(* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING          *)
(* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS     *)
(* WITH THE SOFTWARE.                                                               *)
(************************************************************************************)

Require Import EqNat.
Require Import List.
Require Import Compare_dec.
Require Import Omega.
Require Import Types.
Require Import Envs.
Require Import CSyntax.
Require Import CSemantics.
Require Import Axioms.

Axiom skip : False.
Ltac skip := assert False; [ apply skip | contradiction ].

(***************************************************************************)
(*                                      ValidAddress                       *)
(***************************************************************************)

Lemma invalidAccess__invalidStore : forall m l v,
  (accessMemMeta m l = None) <-> (storeMemMeta m l v = None).
Proof.
  intros.
  remember (accessMemMeta m l) as G.
  destruct G.
    assert (J:=validAccessMemMeta__validStoreMemMeta m l v). destruct J.
    assert (exists v, accessMemMeta m l = Some v). exists(p). auto.
    apply H in H1.
    split.
      intro. inversion H2.
      intros. destruct H1. rewrite H1 in H2. inversion H2.

    remember (storeMemMeta m l v) as G.
    destruct G.
      assert (J:=validAccessMemMeta__validStoreMemMeta m l v). destruct J.
      assert (exists m', storeMemMeta m l v = Some m'). exists(m0). auto.
      apply H0 in H1.  destruct H1. rewrite H1 in HeqG. inversion HeqG.
         
      split; auto.
Qed.

Lemma validAccessMemMeta__validAddress : forall m l,
  (exists v, accessMemMeta m l = Some v) ->
  validAddress m l.
Proof.
  intros.
  unfold validAddress.
  split; auto.
    intros. destruct (validAccessMemMeta__validStoreMemMeta m l v). auto.
Qed.

Lemma validStoreMemMeta__validAddress : forall m l v,
  (exists m', storeMemMeta m l v = Some m') ->
  validAddress m l.
Proof.
  intros.
  unfold validAddress.
  split.
    destruct (validAccessMemMeta__validStoreMemMeta m l v). auto.
    intros. auto. 
      destruct (storeMemMeta_uniqBehavior v m l v0). auto.
Qed.

Lemma validStoreMem__validAddress : forall m l v,
  (exists m', storeMem m l v = Some m') ->
  validAddress m l.
Proof.
  intros.
  unfold validAddress.
  split.
    destruct (validStoreMemMeta__validStoreMem m l (v, (0,0)) v).
    apply H1 in H.
    destruct (validAccessMemMeta__validStoreMemMeta m l (v, (0,0))). auto.
    intros. auto. 
      destruct (storeMemMeta_uniqBehavior (v, (0,0)) m l v0). auto.
      destruct (validStoreMemMeta__validStoreMem m l v0 v); auto.    
Qed.

Lemma invalidStoreMemMeta__invalidAddress : forall m l v,
  (storeMemMeta m l v = None) ->
  ~validAddress m l.
Proof.
  intros. unfold not. intro.
  unfold validAddress in H0. destruct H0.
  destruct (@H1 v). rewrite H2 in H. inversion H.
Qed.

(***************************************************************************)
(*                            Access                                       *)
(***************************************************************************)
Lemma accessMemMetaBlock__length : forall n m l vs,
  accessMemMetaBlock m l n = Some vs ->
  length vs = n.
Proof.
  induction n; intros.
    simpl in H. inversion H. auto.
    simpl in H. 
      remember (accessMemMeta m l) as G.
      destruct G; auto.
        apply sym_eq in HeqG.
        remember (accessMemMetaBlock m (S l) n) as G1.
        destruct G1; auto.
          apply sym_eq in HeqG1.
          apply IHn in HeqG1.
          inversion H. subst. simpl. auto.
        inversion H.
      inversion H.
Qed.

Lemma accessMemBlock__length : forall n m l vs,
  accessMemBlock m l n = Some vs ->
  length vs = n.
Proof.
  induction n; intros.
    simpl in H. inversion H. auto.
    simpl in H. 
      remember (accessMem m l) as G.
      destruct G; auto.
        apply sym_eq in HeqG.
        remember (accessMemBlock m (S l) n) as G1.
        destruct G1; auto.
          apply sym_eq in HeqG1.
          apply IHn in HeqG1.
          inversion H. subst. simpl. auto.
        inversion H.
      inversion H.
Qed.

Lemma accessMemMetaNone_accessMemMetaBlockNone : forall n m l offset,
  accessMemMeta m (l+offset) = None ->
  offset < n -> n <> 0 ->
  accessMemMetaBlock m (l) n = None.
Proof.
  induction n; intros.
    assert (False). omega. inversion H2.
    clear H1. simpl.
    remember (accessMemMeta m l) as G.
    destruct G; auto.
      apply sym_eq in HeqG.
      destruct offset.  
          assert (l+0=l). omega. rewrite H1 in H. rewrite H in HeqG. inversion HeqG.
          assert (offset < n). omega.
          assert (l + S offset = S l + offset). omega.
          assert (n<>0). omega.
          rewrite H2 in H. apply IHn in H; auto.
          rewrite H; auto. 
Qed.      

Lemma accessMemMetaBlock_accessMemMeta : forall m l offset n vs,
  accessMemMetaBlock m (l) n = Some vs ->
  offset < n -> 
  (exists v, accessMemMeta m (l+offset) = Some v).
Proof. 
  intros.
  remember (accessMemMeta m (l+offset)) as G.
  destruct G.
    exists(p). auto.
    apply sym_eq in HeqG.
      assert (n<>0). omega.
      apply accessMemMetaNone_accessMemMetaBlockNone with (n:=n) in HeqG; auto.
      rewrite H in HeqG. inversion HeqG.
Qed.  

Lemma accessMemMetaZeroBlock : forall m l,
  exists v, accessMemMetaBlock m l 0 = Some v.
Proof.
  intros. simpl.
  exists(@nil (Value*Meta)). auto.
Qed.

Lemma accessMemZeroBlock : forall m l,
  exists v, accessMemBlock m l 0 = Some v.
Proof.
  intros. simpl.
  exists(@nil (Value)). auto.
Qed.

Lemma accessMemMetaBlockNone__inversion : forall n m l,
  accessMemMetaBlock m l n = None ->
  exists i, l<=i<l+n /\ accessMemMeta m i = None.
Proof.
  induction n; intros.
    simpl in H. inversion H.
    simpl in H.
    remember (accessMemMeta m l ) as G.
    destruct G.
      remember (accessMemMetaBlock m (S l) n) as G1.
      destruct G1.
        inversion H.
        apply sym_eq in HeqG1. apply IHn in HeqG1.
        destruct HeqG1 as [i HeqG1].
        destruct HeqG1.
        assert (l <= i < l + S n). omega.
        exists (i). split; auto.
      exists(l).
        split; auto.
        omega.
Qed.

Lemma accessMemBlockNone__inversion : forall n m l,
  accessMemBlock m l n = None ->
  exists i, l<=i<l+n /\ accessMem m i = None.
Proof.
  induction n; intros.
    simpl in H. inversion H.
    simpl in H.
    remember (accessMem m l ) as G.
    destruct G.
      remember (accessMemBlock m (S l) n) as G1.
      destruct G1.
        inversion H.
        apply sym_eq in HeqG1. apply IHn in HeqG1.
        destruct HeqG1 as [i HeqG1].
        destruct HeqG1.
        assert (l <= i < l + S n). omega.
        exists (i). split; auto.
      exists(l).
        split; auto.
        omega.
Qed.

Lemma accessMemMeta__accessMemMetaBlock : forall m l n,
  (forall i, 
    l<=i<l+n -> 
    (exists v, accessMemMeta m i = Some v)
  ) ->
  exists vs, accessMemMetaBlock m l n = Some vs.
Proof.
  intros.
  remember (accessMemMetaBlock m l n) as G.
  destruct G.
    exists(l0). auto.
    apply sym_eq in HeqG.
      apply accessMemMetaBlockNone__inversion in HeqG.
      destruct HeqG as [i HeqG]. destruct HeqG.
      apply H in H0.
      destruct H0. rewrite H1 in H0. inversion H0.
Qed.      

Lemma accessMem__accessMemBlock : forall m l n,
  (forall i, 
    l<=i<l+n -> 
    (exists v, accessMem m i = Some v)
  ) ->
  exists vs, accessMemBlock m l n = Some vs.
Proof.
  intros.
  remember (accessMemBlock m l n) as G.
  destruct G.
    exists(l0). auto.
    apply sym_eq in HeqG.
      apply accessMemBlockNone__inversion in HeqG.
      destruct HeqG as [i HeqG]. destruct HeqG.
      apply H in H0.
      destruct H0. rewrite H1 in H0. inversion H0.
Qed.    

Lemma accessMemMetaBlock__accessMemMetaSubBlock : forall m l offset n n' vs,
  accessMemMetaBlock m (l) n = Some vs -> 
  offset + n' <= n -> 
  n' > 0 ->
  exists vs', accessMemMetaBlock m ((l+offset)) n' = Some vs'.
Proof.
  intros.
  assert (forall i, 
    l+offset<=i<l+offset+n' -> (exists v, accessMemMeta m i = Some v)).
    intros.  
    apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) in H.
      assert (l+(i-l)=i). omega. rewrite H3 in H. auto.
      omega.
  apply accessMemMeta__accessMemMetaBlock in H2; auto.
Qed.

Lemma accessMemMetaBlock_uniqBehavior : forall n vs m l vs',
  (accessMemMetaBlock m l n = Some vs-> accessMemMetaBlock m l n = Some vs' -> vs = vs') /\
  (accessMemMetaBlock m l n = None -> accessMemMetaBlock m l n = None).
Proof.
  induction n; intros.
  
  split; intros.
    simpl in H. simpl in H0. inversion H. inversion H0. reflexivity.
    simpl in H. inversion H.
  
  split; intros.
    simpl in *. remember (accessMemMeta m l) as G.
    destruct G.
      remember (accessMemMetaBlock m (S l) n) as G1.
      destruct G1.
        inversion H. inversion H0. reflexivity.
        inversion H0.
     inversion H0.

    simpl in *. remember (accessMemMeta m l) as G.
    destruct G.
      remember (accessMemMetaBlock m (S l) n) as G1.
      destruct G1.
        inversion H.
        reflexivity.
      reflexivity.
Qed.

Lemma accessMemMetaBlock_accessMemBlock : forall n l m vs,
  accessMemMetaBlock m (l) n = Some vs ->
  (exists vs', accessMemBlock m l n = Some vs').
Proof.
  induction n; intros.
  simpl. exists(@nil Value). auto.
  simpl in *.
  remember (accessMemMeta m l) as G.
  destruct G.
    apply sym_eq in HeqG. 
    assert (exists v, accessMemMeta m l = Some v). exists(p). auto.
    destruct (validAccessMemMeta__validAccessMem m l).
    apply H1 in H0. destruct H0. rewrite H0.
    remember (accessMemMetaBlock m (S l) n) as G1.
    destruct G1.
      apply sym_eq in HeqG1. 
      apply IHn in HeqG1.
      destruct HeqG1.
      rewrite H3. exists(x::x0). auto.

      inversion H.
    inversion H.
Qed.

Lemma accessMemBlock_accessMemMetaBlock : forall n l m vs,
  accessMemBlock m (l) n = Some vs ->
  (exists vs', accessMemMetaBlock m l n = Some vs').
Proof.
  induction n; intros.
  simpl. exists(@nil (Value*Meta)). auto.
  simpl in *.
  remember (accessMem m l) as G.
  destruct G.
    apply sym_eq in HeqG. 
    assert (exists v, accessMem m l = Some v). exists(v). auto.
    destruct (validAccessMemMeta__validAccessMem m l).
    apply H2 in H0. destruct H0. rewrite H0.
    remember (accessMemBlock m (S l) n) as G1.
    destruct G1.
      apply sym_eq in HeqG1. 
      apply IHn in HeqG1.
      destruct HeqG1.
      rewrite H3. exists(x::x0). auto.

      inversion H.
    inversion H.
Qed.

(***************************************************************************)
(*                         Store                                           *)
(***************************************************************************)

Lemma storeMemMeta__validAddress: forall M M' d loc l,
  storeMemMeta M loc d = Some M' ->
  (validAddress M l <->validAddress M' l).
Proof.
  intros.
  split. intro.
  unfold validAddress in *. destruct H0.
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    destruct H0 as [v H0]. 
    destruct (eq_nat_dec l loc); subst.
      exists(d). auto.
      apply H4 in H0; auto. exists(v). auto.
    intro.
      destruct H0 as [v' H0]. 
      destruct (eq_nat_dec l loc); subst.
        destruct (validAccessMemMeta__validStoreMemMeta M' loc v). 
        apply H. exists(d). auto.

        apply H4 in H0; auto.
        destruct (validAccessMemMeta__validStoreMemMeta M' l v). 
        apply H. exists(v'). auto.

  intro.
  unfold validAddress in *. destruct H0.
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    remember (accessMemMeta M l) as G.
    destruct G.
      exists (p). auto.
      apply sym_eq in HeqG. apply H5 in HeqG.
        destruct H0. rewrite H in HeqG. inversion HeqG.
    intros.
    remember (storeMemMeta M l v) as G.
    destruct G.
      exists (m). auto.
      apply sym_eq in HeqG.
      destruct (invalidAccess__invalidStore M l v).
      apply H3 in HeqG.
      apply H5 in HeqG.
        destruct H0. rewrite H0 in HeqG. inversion HeqG.     
Qed. 

Lemma storeMem__validAddress: forall M M' loc d l,
  storeMem M loc d = Some M' ->
  (validAddress M l <-> validAddress M' l).
Proof.
  intros.
  split. intro.
  unfold validAddress in *. destruct H0.
  assert (exists v, accessMemMeta M loc = Some v).
       destruct (@validAccessMemMeta__validStoreMem M loc d).
       apply H3. exists (M'). auto.
  destruct H2 as [[v' be] H2].
  apply storeMem__inversion with (loc:=loc) (v:=v') (be:=be) in H;auto. decompose [and] H. clear H.
  split.
    destruct H0 as [v H0]. 
    destruct (eq_nat_dec l loc); subst.
      exists(d, be). auto.
      apply H5 in H0; auto. exists(v). auto.
    intro.
      destruct H0 as [v'' H0]. 
      destruct (eq_nat_dec l loc); subst.
        destruct (validAccessMemMeta__validStoreMemMeta M' loc v). 
        apply H. exists(d, be). auto.

        apply H5 in H0; auto.
        destruct (validAccessMemMeta__validStoreMemMeta M' l v). 
        apply H. exists(v''). auto.

  intro.
  unfold validAddress in *. destruct H0.
  assert (exists v, accessMemMeta M loc = Some v).
       destruct (@validAccessMemMeta__validStoreMem M loc d).
       apply H3. exists (M'). auto.
  destruct H2 as [[v' be] H2].
  apply storeMem__inversion with (loc:=loc) (v:=v') (be:=be) in H;auto. decompose [and] H. clear H.
  split.
    remember (accessMemMeta M l) as G.
    destruct G.
      exists (p). auto.
      apply sym_eq in HeqG. apply H6 in HeqG.
        destruct H0. rewrite H in HeqG. inversion HeqG.
    intros.
    remember (storeMemMeta M l v) as G.
    destruct G.
      exists (m). auto.
      apply sym_eq in HeqG.
      destruct (invalidAccess__invalidStore M l v).
      apply H4 in HeqG.
      apply H6 in HeqG.
        destruct H0. rewrite H0 in HeqG. inversion HeqG.     
Qed.

Lemma storeMemMeta__invalidAddress: forall M M' d loc l,
  storeMemMeta M loc d = Some M' ->
  (~validAddress M l <->~validAddress M' l).
Proof.
  intros.
  split. intro. unfold not in *. intro. apply H0.
  unfold validAddress in *. destruct H0.
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    remember (accessMemMeta M l) as G.
    destruct G.
      exists (p). auto.
      apply sym_eq in HeqG. apply H4 in HeqG.
        destruct H1. destruct H. rewrite H in HeqG. inversion HeqG.
    intros.
    remember (storeMemMeta M l v) as G.
    destruct G.
      exists (m). auto.
      apply sym_eq in HeqG.
      destruct (invalidAccess__invalidStore M l v).
      apply H2 in HeqG.
      apply H4 in HeqG.
        destruct H1. destruct H1. rewrite H1 in HeqG. inversion HeqG.     

  intro. unfold not in *. intro. apply H0. clear H0.
  unfold validAddress in *. destruct H1.
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    destruct H0 as [v H0]. 
    destruct (eq_nat_dec l loc); subst.
      exists(d). auto.
      apply H4 in H0; auto. exists(v). auto.
    intro.
      destruct H0 as [v' H0]. 
      destruct (eq_nat_dec l loc); subst.
        destruct (validAccessMemMeta__validStoreMemMeta M' loc v). 
        apply H. exists(d). auto.

        apply H4 in H0; auto.
        destruct (validAccessMemMeta__validStoreMemMeta M' l v). 
        apply H. exists(v'). auto.
Qed.

Lemma storeMemMetaBlock_storeMemMeta : forall vs m l offset n m' v,
  storeMemMetaBlock m (l) vs = Some m' ->
  length vs = n ->
  offset < n -> 
  (exists m', storeMemMeta m (l+offset) v = Some m').
Proof.
  induction vs; intros.

  simpl in H0. subst. assert(False). omega. inversion H0.
  
  simpl in *. remember (storeMemMeta m l a) as G.
  destruct G.
    destruct offset.
      assert (l+0 = l). omega.
      rewrite H2. destruct (@storeMemMeta_uniqBehavior a m l v).
      apply H3. exists(m0). auto.
      destruct n.
        inversion H0.
        assert (offset < n). omega.
        apply IHvs with (offset:=offset) (v:=v) (n:=n) in H; auto.
        apply sym_eq in HeqG.
            destruct (@storeMemMeta__validAddress m m0 a l (l+ S offset) HeqG).
            assert (S l + offset = l + S offset). omega. rewrite H5 in H.
            apply validStoreMemMeta__validAddress in H.
            apply H4 in H.
            unfold validAddress in H. destruct H; auto.
     inversion H.
Qed.  

Lemma storeMemBlock_storeMem : forall vs m l offset n m' v,
  storeMemBlock m (l) vs = Some m' ->
  length vs = n ->
  offset < n -> 
  (exists m', storeMem m (l+offset) v = Some m').
Proof.
  induction vs; intros.

  simpl in H0. subst. assert(False). omega. inversion H0.
  
  simpl in *. remember (storeMem m l a) as G.
  destruct G.
    destruct offset.
      assert (l+0 = l). omega.
      rewrite H2. destruct (@storeMem_uniqBehavior a m l v).
      apply H3. exists(m0). auto.
      destruct n.
        inversion H0.
        assert (offset < n). omega.
        apply IHvs with (offset:=offset) (v:=v) (n:=n) in H; auto.
        apply sym_eq in HeqG.
            destruct (@storeMem__validAddress m m0 l a (l+ S offset) HeqG).
            assert (S l + offset = l + S offset). omega. rewrite H5 in H.
            apply validStoreMem__validAddress in H.
            apply H4 in H.
            unfold validAddress in H. destruct H; auto.
            assert (J:=@H6 (v, (0,0))).
            destruct(@validStoreMemMeta__validStoreMem m (l+S offset) (v, (0,0)) v); auto.
     inversion H.
Qed.  

Lemma storeMemBlockNone__inversion : forall vs n m l v,
  storeMemMetaBlock m l vs = None ->
  length vs = n ->
  exists i, l<=i<l+n /\ storeMemMeta m i v = None.
Proof.
  induction vs; intros.
    simpl in H. inversion H.
    simpl in H. simpl in H0. subst.
    remember (storeMemMeta m l a) as G.
    destruct G.
      apply IHvs with (n:=length vs) (v:=v) in H; auto.
      destruct H as [i H]. destruct H.
      exists(i).
        split.
          omega.
          apply sym_eq in HeqG.
            destruct (@storeMemMeta__invalidAddress m m0 a l i HeqG).
            apply invalidStoreMemMeta__invalidAddress in H0.
            apply H2 in H0.
            remember (storeMemMeta m i v) as G1.
            destruct G1; auto.
              apply sym_eq in HeqG1.
              assert (exists m', storeMemMeta m i v = Some m'). exists(m1). auto.
              apply validStoreMemMeta__validAddress in H3.
              assert (False). auto. inversion H4.   
      exists(l).
         split.
            omega.
            destruct (@storeMemMeta_uniqBehavior a m l v).
            apply H1. auto.
Qed.

Lemma storeMemMeta__storeMemMetaBlock : forall m l n vs v,
  (forall i, 
    l<=i<l+n -> 
    (exists m', storeMemMeta m i v = Some m')
  ) ->
  length vs = n ->
  exists m', storeMemMetaBlock m l vs = Some m'.
Proof.
  intros.
  remember (storeMemMetaBlock m l vs) as G.
  destruct G.
    exists(m0). auto.
    apply sym_eq in HeqG.
      apply storeMemBlockNone__inversion with (n:=n) (v:=v) in HeqG; auto.
      destruct HeqG as [i HeqG]. destruct HeqG.
      apply H in H1.
      destruct H1. rewrite H1 in H2. inversion H2.
Qed.

Lemma storeMemMeta__validAddresses: forall M M' d loc l n,
  storeMemMeta M loc d = Some M' ->
  (validAddresses M l n <-> validAddresses M' l n).
Proof.
  intros. 
  split; intro.
  unfold validAddresses in *. decompose [and] H0. clear H0.
  split.
    destruct (@storeMemMeta__validAddress M M' d loc l H); auto.
  assert (JJ:=H).
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      destruct H3 as [vs H3].
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H7 in H3.
        destruct (eq_nat_dec i loc).
          exists (d). rewrite e. auto.

          apply H5 in H3; auto.
          exists (v). auto.
        omega.

    intros.
      apply storeMemMeta__storeMemMetaBlock with (v:=d) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=d) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H7 in H.
      destruct (@storeMemMeta__validAddress M M' d loc i JJ); auto.
      apply validStoreMemMeta__validAddress in H.
      apply H8 in H. destruct H. auto.
       omega.       

  unfold validAddresses in *. decompose [and] H0. clear H0.
  split.
    destruct (@storeMemMeta__validAddress M M' d loc l H); auto.
  assert (JJ:=H).
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      destruct H3 as [vs H3].
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H7 in H3.
        remember (accessMemMeta M i) as G.
        destruct G. 
          exists (p). auto.
          apply sym_eq in HeqG. apply H6 in HeqG. rewrite H3 in HeqG. inversion HeqG.
        omega.

    intros.
      apply storeMemMeta__storeMemMetaBlock with (v:=d) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=d) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H7 in H.
      destruct (@storeMemMeta__validAddress M M' d loc i JJ); auto.
      apply validStoreMemMeta__validAddress in H.
      remember (storeMemMeta M i d) as G.
      destruct G. 
          exists (m). auto.
          apply sym_eq in HeqG. apply H9 in H. destruct H.
          destruct (@H10 d). rewrite H11 in HeqG. inversion HeqG.
      omega.       
Qed.  

Lemma storeMem__validAddresses: forall M M' d loc l n,
  storeMem M loc d = Some M' ->
  (validAddresses M l n <-> validAddresses M' l n).
Proof.
  intros.
  assert (exists v, accessMemMeta M loc = Some v) as K.
       destruct (@validAccessMemMeta__validStoreMem M loc d).
       apply H1. exists (M'). auto.
  destruct K as [[w be] K]. 
  split; intro.
  unfold validAddresses in *. decompose [and] H0. clear H0.
  split.
    destruct (@storeMem__validAddress M M' loc d l H); auto.
  assert (JJ:=H).
  apply storeMem__inversion with (loc:=loc) (v:=w) (be:=be) in H; auto. decompose [and] H. clear H.
  split.
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      destruct H3 as [vs H3].
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H7 in H3.
        destruct (eq_nat_dec i loc).
          exists (d, be). rewrite e. auto.

          apply H5 in H3; auto.
          exists (v). auto.
        omega.

    intros.
      apply storeMemMeta__storeMemMetaBlock with (v:=(d, (0,0))) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=(d, (0,0))) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H7 in H.
      destruct (@storeMem__validAddress M M' loc d i JJ); auto.
      apply validStoreMemMeta__validAddress in H.
      apply H8 in H. destruct H. auto.
       omega.       

  unfold validAddresses in *. decompose [and] H0. clear H0.
  split.
    destruct (@storeMem__validAddress M M' loc d l H); auto.
  assert (JJ:=H).
  apply storeMem__inversion with (loc:=loc) (v:=w) (be:=be) in H; auto. decompose [and] H. clear H.
  split.
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      destruct H3 as [vs H3].
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H7 in H3.
        remember (accessMemMeta M i) as G.
        destruct G. 
          exists (p). auto.
          apply sym_eq in HeqG. apply H6 in HeqG. rewrite H3 in HeqG. inversion HeqG.
        omega.

    intros.
      apply storeMemMeta__storeMemMetaBlock with (v:=(d, (0,0))) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=(d, (0,0))) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H7 in H.
      destruct (@storeMem__validAddress M M' loc d i JJ); auto.
      apply validStoreMemMeta__validAddress in H.
      remember (storeMemMeta M i (d,(0,0))) as G.
      destruct G. 
          exists (m). auto.
          apply sym_eq in HeqG. apply H9 in H. destruct H.
          destruct (@H10 (d, (0,0))). rewrite H11 in HeqG. inversion HeqG.
      omega.       
Qed.

Lemma storeMemMeta__invalidAddresses: forall M M' d loc l n,
  storeMemMeta M loc d = Some M' ->
  (~validAddresses M l n <-> ~validAddresses M' l n).
Proof.
  intros. 
  split; intro.
  unfold not in *. intro. apply H0. clear H0.
  unfold validAddresses in *. decompose [and] H1. clear H1.
  split.
    destruct (@storeMemMeta__validAddress M M' d loc l H); auto.
  assert (JJ:=H).
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    destruct H3 as [vs H3]. 
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H7 in H3.
        remember (accessMemMeta M i) as G.
        destruct G. 
          exists (p). auto.
          apply sym_eq in HeqG. apply H6 in HeqG. rewrite H3 in HeqG. inversion HeqG.
        omega.

    intros.
    apply storeMemMeta__storeMemMetaBlock with (v:=d) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=d) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H7 in H.
      destruct (@storeMemMeta__validAddress M M' d loc i JJ); auto.
      apply validStoreMemMeta__validAddress in H.
      remember (storeMemMeta M i d) as G.
      destruct G. 
          exists (m). auto.
          apply sym_eq in HeqG. apply H9 in H. destruct H.
          destruct (@H10 d). rewrite H11 in HeqG. inversion HeqG.
      omega.       

  unfold not in *. intro. apply H0. clear H0.
  unfold validAddresses in *. decompose [and] H1. clear H1.
  split.
    destruct (@storeMemMeta__validAddress M M' d loc l H); auto.
  assert (JJ:=H).
  apply storeMemMeta__inversion in H. decompose [and] H. clear H.
  split.
    destruct H3 as [vs H3]. 
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H7 in H3.
        destruct (eq_nat_dec i loc).
          exists (d). rewrite e. auto.
          apply H5 in H3; auto. exists (v). auto.
        omega.

    intros.
    apply storeMemMeta__storeMemMetaBlock with (v:=d) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=d) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H7 in H.
      destruct (@storeMemMeta__validAddress M M' d loc i JJ); auto.
      apply validStoreMemMeta__validAddress in H.
      apply H8 in H. destruct H. auto.
      omega.       
Qed.  

Lemma storeMemMeta__StoreMemMetaBlock: forall M M' d loc l vs vs',
  storeMemMeta M loc d = Some M' ->
  length vs = length vs' ->
  ((exists m, storeMemMetaBlock M l vs = Some m) <-> (exists m, storeMemMetaBlock M' l vs' = Some m)).
Proof.
  intros.
  split; intro.
      destruct (@storeMemMeta__validAddresses M M' d loc l (length vs) H).
      destruct vs.
      destruct vs'.
        exists(M'). auto.
        simpl in H0. inversion H0.
      destruct vs'.
        simpl in H0. inversion H0.
      simpl in H0.
      assert (exists vs' : list (Value * Meta), accessMemMetaBlock M l (length (p::vs)) = Some vs').
        apply accessMemMeta__accessMemMetaBlock.
        intros.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p::vs)) (v:=d) in H1; auto.
            assert (l + (i - l) = i). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            omega.
      assert (validAddress M l).
        split.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p::vs)) (v:=d) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            simpl. omega.
          intro.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p::vs)) (v:=v) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1; auto.
            simpl. omega.
      assert (validAddresses M l (length (p::vs))).
        split; auto.
        split; auto.
        intros. 
          destruct H1.
          apply storeMemMeta__storeMemMetaBlock with (n:=length (vs0)) (v:=d); auto.
          intros.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p::vs)) (v:=d) in H1; auto.
            assert (l + (i-l) = i). omega. rewrite H8 in H1; auto.
            simpl. simpl in H6. omega.
     apply H2 in H6.
     unfold validAddresses in H6. 
     decompose [and] H6. clear H6.
     apply H10; auto.

      destruct (@storeMemMeta__validAddresses M M' d loc l (length vs') H).
      destruct vs.
      destruct vs'.
        exists(M). auto.
        simpl in H0. inversion H0.
      destruct vs'.
        simpl in H0. inversion H0.
      simpl in H0.
      assert (exists vs : list (Value * Meta), accessMemMetaBlock M' l (length (p0::vs')) = Some vs).
        apply accessMemMeta__accessMemMetaBlock.
        intros.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p0::vs')) (v:=d) in H1; auto.
            assert (l + (i - l) = i). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            omega.
      assert (validAddress M' l).
        split.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p0::vs')) (v:=d) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            simpl. omega.
          intro.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p0::vs')) (v:=v) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1; auto.
            simpl. omega.
      assert (validAddresses M' l (length (p0::vs'))).
        split; auto.
        split; auto.
        intros. 
          destruct H1.
          apply storeMemMeta__storeMemMetaBlock with (n:=length (vs0)) (v:=d); auto.
          intros.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p0::vs')) (v:=d) in H1; auto.
            assert (l + (i-l) = i). omega. rewrite H8 in H1; auto.
            simpl. simpl in H6. omega.
     apply H3 in H6.
     unfold validAddresses in H6. 
     decompose [and] H6. clear H6.
     apply H10; auto.
Qed.

Lemma storeMemMetaBlock_uniqBehavior : forall vs m l vs',
  length vs = length vs' ->
  (exists m', storeMemMetaBlock m l vs = Some m') -> 
  (exists m', storeMemMetaBlock m l vs' = Some m').
Proof.
  induction vs; intros.
    destruct vs'.
      simpl. exists(m). auto.
      simpl in H. inversion H.

    destruct vs'.
      simpl in H. inversion H.
      simpl in *.
      remember (storeMemMeta m l a) as G.
      destruct G.
        apply sym_eq in HeqG.
        assert (exists m', storeMemMeta m l a = Some m'). exists(m0). auto.
        destruct (@storeMemMeta_uniqBehavior a m l p).
        apply H2 in H1. destruct H1. rewrite H1.
        apply IHvs; auto. 
        destruct (storeMemMeta__StoreMemMetaBlock m x p l (S l) vs vs); auto.
          apply H4.
        destruct (storeMemMeta__StoreMemMetaBlock m m0 a l (S l) vs vs); auto.

        destruct H0. inversion H0.
Qed.

Lemma storeMemMeta__invalidStoreMemMetaBlock: forall M M' d loc l vs,
  storeMemMeta M loc d = Some M' ->
  (storeMemMetaBlock M l vs = None <-> storeMemMetaBlock M' l vs = None).
Proof.
  intros.
  split; intro.
    destruct (@storeMemMeta__invalidAddresses M M' d loc l (length vs) H).
    assert (~validAddresses M l (length vs)).
      unfold not. intro.
      unfold validAddresses in H3. decompose [and] H3. clear H3.
      destruct (@H7 vs); auto.
       rewrite H0 in H3. inversion H3.
    apply H1 in H3.
    remember (storeMemMetaBlock M' l vs) as G.
    destruct G; auto.
      apply sym_eq in HeqG.
      assert (exists vs' : list (Value * Meta), accessMemMetaBlock M' l (length vs) = Some vs').
        apply accessMemMeta__accessMemMetaBlock.
        intros.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length vs) (v:=d) in HeqG; auto.
            assert (l + (i - l) = i). omega. rewrite H5 in HeqG.
            apply validStoreMemMeta__validAddress in HeqG.
            destruct HeqG; auto.
            omega.
      assert (validAddress M' l).
        split.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length vs) (v:=d) in HeqG; auto.
            assert (l + 0 = l). omega. rewrite H5 in HeqG.
            apply validStoreMemMeta__validAddress in HeqG.
            destruct HeqG; auto.
            destruct vs; simpl.
               simpl in H0. inversion H0.
               omega.
          intro.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length vs) (v:=v) in HeqG; auto.
            assert (l + 0 = l). omega. rewrite H5 in HeqG; auto.
            destruct vs; simpl.
               simpl in H0. inversion H0.
               omega.
      assert (validAddresses M' l (length vs)).
        split; auto.
        split; auto.
        intros.
          apply storeMemMetaBlock_uniqBehavior with (vs:=vs); auto.
            exists(m). auto.

    destruct (storeMemMeta__StoreMemMetaBlock M M' d loc l vs vs); auto.
      assert (exists m, storeMemMetaBlock M' l vs = Some m). exists(m). auto.
      apply H8 in H9. destruct H9. rewrite H0 in H9. inversion H9.
 
    destruct (@storeMemMeta__invalidAddresses M M' d loc l (length vs) H).
    assert (~validAddresses M' l (length vs)).
      unfold not. intro.
      unfold validAddresses in H3. decompose [and] H3. clear H3.
      destruct (@H7 vs); auto.
       rewrite H0 in H3. inversion H3.
    apply H2 in H3.
    remember (storeMemMetaBlock M l vs) as G.
    destruct G; auto.
      apply sym_eq in HeqG.
      assert (exists vs' : list (Value * Meta), accessMemMetaBlock M l (length vs) = Some vs').
        apply accessMemMeta__accessMemMetaBlock.
        intros.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length vs) (v:=d) in HeqG; auto.
            assert (l + (i - l) = i). omega. rewrite H5 in HeqG.
            apply validStoreMemMeta__validAddress in HeqG.
            destruct HeqG; auto.
            omega.
      assert (validAddress M l).
        split.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length vs) (v:=d) in HeqG; auto.
            assert (l + 0 = l). omega. rewrite H5 in HeqG.
            apply validStoreMemMeta__validAddress in HeqG.
            destruct HeqG; auto.
            destruct vs; simpl.
               simpl in H0. inversion H0.
               omega.
          intro.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length vs) (v:=v) in HeqG; auto.
            assert (l + 0 = l). omega. rewrite H5 in HeqG; auto.
            destruct vs; simpl.
               simpl in H0. inversion H0.
               omega.
      assert (validAddresses M l (length vs)).
        split; auto.
        split; auto.
        intros.
          apply storeMemMetaBlock_uniqBehavior with (vs:=vs); auto.
            exists(m). auto.

    destruct (storeMemMeta__StoreMemMetaBlock M M' d loc l vs vs); auto.
      assert (exists m, storeMemMetaBlock M l vs = Some m). exists(m). auto.
      apply H7 in H9. destruct H9. rewrite H0 in H9. inversion H9.
Qed.

Lemma storeMemMetaNone_storeMemMetaBlockNone : forall vs m l v n offset,
  storeMemMeta m (l+offset) v = None ->
  length vs = n ->
  offset < n -> n <> 0 ->
  storeMemMetaBlock m (l) vs = None.
Proof.
  induction vs; intros.
    simpl in H0. assert (False). omega. inversion H3.

    simpl in H0. clear H2. simpl.
    remember (storeMemMeta m l a) as G.
    destruct G; auto.
      apply sym_eq in HeqG.
      destruct vs.
          simpl in *. subst. 
          assert (offset=0). omega. subst.
          assert (l+0=l). omega. rewrite H0 in H.
          assert (J := storeMemMeta_uniqBehavior v m l a).
          destruct J. apply H3 in H. rewrite H in HeqG. inversion HeqG.

          destruct offset.
            assert (l+0=l). omega. rewrite H2 in H.
            assert (J := storeMemMeta_uniqBehavior v m l a).
            destruct J. apply H4 in H. rewrite H in HeqG. inversion HeqG.
          
            simpl in H0. simpl. subst.
            assert (l + S offset = S l + offset). omega.
            rewrite H0 in H.
            assert (offset < S(length vs)). omega.
            apply IHvs with (n:=S (length vs)) in H; auto.
            simpl in H.
            remember (storeMemMeta m (S l) p) as G1.
            destruct G1; auto.
              assert (validAddress m (S l)).
                apply validStoreMemMeta__validAddress with (v:=p); auto.
                  exists(m1). auto.
              assert (J:=HeqG).
              apply storeMemMeta__validAddress with (l:=S l) in HeqG; auto.
              destruct HeqG. apply H4 in H3.
              destruct H3. 
              apply sym_eq in HeqG1. destruct (@H6 p). rewrite H7.
              destruct (storeMemMeta__invalidStoreMemMetaBlock m m1 p (S l) (S (S l)) vs HeqG1).
              apply H9 in H.
              destruct (storeMemMeta__invalidStoreMemMetaBlock m m0 a l (S (S l)) vs J).
              apply H10 in H.
              destruct (storeMemMeta__invalidStoreMemMetaBlock m0 x p (S l) (S (S l)) vs H7); auto.
       apply sym_eq in HeqG1.
       apply storeMemMeta__invalidAddress with (l:=S l) in HeqG; auto.
       apply invalidStoreMemMeta__invalidAddress in HeqG1.
       destruct HeqG. apply H3 in HeqG1.
       remember (storeMemMeta m0 (S l) p) as G.
       destruct G; auto.
         apply sym_eq in HeqG.
         assert (exists m', storeMemMeta m0 (S l) p = Some m'). exists(m1). auto.
         apply validStoreMemMeta__validAddress in H5.
         assert (False). auto. inversion H6.
Qed.      

Lemma storeMemMetaZeroBlock : forall m l vs,
  length vs = 0 ->
  exists m', storeMemMetaBlock m l vs = Some m'.
Proof.
  intros.
  destruct vs.
     simpl. exists(m). auto.
     simpl in H. inversion H.
Qed.

Lemma storeMemZeroBlock : forall m l vs,
  length vs = 0 ->
  exists m', storeMemBlock m l vs = Some m'.
Proof.
  intros.
  destruct vs.
     simpl. exists(m). auto.
     simpl in H. inversion H.
Qed.

Lemma storeMemMetaBlock__storeMemMetaSubBlock : forall m l offset n n' vs vs' m',
  storeMemMetaBlock m (l) vs = Some m' -> 
  offset + n' <= n -> 
  n' > 0 ->
  length vs' = n' ->
  length vs = n ->
  exists m'', storeMemMetaBlock m ((l+offset)) vs' = Some m''.
Proof.
  intros.
  assert (forall i, 
    l+offset<=i<l+offset+n' -> (exists m', storeMemMeta m i (0, (0,0))= Some m')).
    intros.  
    apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (v:=(0,(0,0))) (n:=length vs) in H; auto.
      assert (l+(i-l)=i). omega. rewrite H5 in H. auto.
      omega.
  apply storeMemMeta__storeMemMetaBlock with (vs:=vs') in H4; auto.
Qed.

Lemma storeMem__StoreMemMetaBlock: forall M M' d loc l vs vs',
  storeMem M loc d = Some M' ->
  length vs = length vs' ->
  ((exists m, storeMemMetaBlock M l vs = Some m) <-> (exists m, storeMemMetaBlock M' l vs' = Some m)).
Proof.
  intros.
  split; intro.
      destruct (@storeMem__validAddresses M M' d loc l (length vs) H).
      destruct vs.
      destruct vs'.
        exists(M'). auto.
        simpl in H0. inversion H0.
      destruct vs'.
        simpl in H0. inversion H0.
      simpl in H0.
      assert (exists vs' : list (Value * Meta), accessMemMetaBlock M l (length (p::vs)) = Some vs').
        apply accessMemMeta__accessMemMetaBlock.
        intros.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p::vs)) (v:=(d, (0,0))) in H1; auto.
            assert (l + (i - l) = i). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            omega.
      assert (validAddress M l).
        split.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p::vs)) (v:=(d, (0,0))) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            simpl. omega.
          intro.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p::vs)) (v:=v) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1; auto.
            simpl. omega.
      assert (validAddresses M l (length (p::vs))).
        split; auto.
        split; auto.
        intros. 
          destruct H1.
          apply storeMemMeta__storeMemMetaBlock with (n:=length (vs0)) (v:=(d, (0,0))); auto.
          intros.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p::vs)) (v:=(d, (0,0))) in H1; auto.
            assert (l + (i-l) = i). omega. rewrite H8 in H1; auto.
            simpl. simpl in H6. omega.
     apply H2 in H6.
     unfold validAddresses in H6. 
     decompose [and] H6. clear H6.
     apply H10; auto.

      destruct (@storeMem__validAddresses M M' d loc l (length vs') H).
      destruct vs.
      destruct vs'.
        exists(M). auto.
        simpl in H0. inversion H0.
      destruct vs'.
        simpl in H0. inversion H0.
      simpl in H0.
      assert (exists vs : list (Value * Meta), accessMemMetaBlock M' l (length (p0::vs')) = Some vs).
        apply accessMemMeta__accessMemMetaBlock.
        intros.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p0::vs')) (v:=(d, (0,0))) in H1; auto.
            assert (l + (i - l) = i). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            omega.
      assert (validAddress M' l).
        split.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p0::vs')) (v:=(d, (0,0))) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1.
            apply validStoreMemMeta__validAddress in H1.
            destruct H1; auto.
            simpl. omega.
          intro.
          destruct H1.
          apply storeMemMetaBlock_storeMemMeta with (offset:=0) (n:=length (p0::vs')) (v:=v) in H1; auto.
            assert (l + 0 = l). omega. rewrite H5 in H1; auto.
            simpl. omega.
      assert (validAddresses M' l (length (p0::vs'))).
        split; auto.
        split; auto.
        intros. 
          destruct H1.
          apply storeMemMeta__storeMemMetaBlock with (n:=length (vs0)) (v:=(d, (0,0))); auto.
          intros.
          apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=length (p0::vs')) (v:=(d, (0,0))) in H1; auto.
            assert (l + (i-l) = i). omega. rewrite H8 in H1; auto.
            simpl. simpl in H6. omega.
     apply H3 in H6.
     unfold validAddresses in H6. 
     decompose [and] H6. clear H6.
     apply H10; auto.
Qed.

Lemma storeMemMetaBlock_storeMemBlock : forall ds l m vs,
  (exists m', storeMemMetaBlock m l ds = Some m') ->
  length ds = length vs ->
  (exists m', storeMemBlock m l vs = Some m').
Proof.
  induction ds; destruct vs; intros.
  simpl. exists(m). auto.
  simpl in H0. inversion H0.
  simpl in H0. inversion H0.
  simpl in *.
  remember (storeMemMeta m l a) as G.
  destruct G.
    apply sym_eq in HeqG. 
    assert (exists m', storeMemMeta m l a = Some m'). exists(m0). auto.
    destruct (validStoreMemMeta__validStoreMem m l a v).
    apply H2 in H1. destruct H1. rewrite H1.
    apply IHds; auto.
       destruct (@storeMemMeta__StoreMemMetaBlock m m0 a l (S l) ds ds); auto.
       apply H5 in H.
       destruct (@storeMem__StoreMemMetaBlock m x v l (S l) ds ds); auto.

    destruct H. inversion H.
Qed.

(***************************************************************************)
(*                                        Types                            *)
(***************************************************************************)

Lemma atype_struct_ptypeEqual_refl :
 (forall a, atypeEqual a a) /\
 (forall s, structEqual s s) /\
 (forall p, ptypeEqual p p).
Proof.
 apply mutual_AType_Struct_ind; intros; simpl in *; auto.
    apply atypeEqual_Int.
    apply atypeEqual_Pointer; auto.
    apply structEqual_Nil; auto.
    apply structEqual_Cons; auto.
    apply ptypeEqual_AType; auto.
    apply ptypeEqual_Struct; auto.
    apply ptypeEqual_Func; auto.
    eapply ptypeEqual_EqName; eauto.
    apply ptypeEqual_VoidPtr; auto.
Qed.

Lemma atypeEqual_refl : forall a,
  atypeEqual a a.
Proof.
  decompose [and] atype_struct_ptypeEqual_refl.
  auto.
Qed.

Lemma atypeEqual__eq__atypesize: forall t1 t2, 
  atypeEqual t1 t2 -> sizeOfAType t1 = sizeOfAType t2.
Proof.
  destruct t1; destruct t2; simpl; auto.
Qed.

Lemma convertible__atypeEqual: forall t1 t2, 
  convertible t1 t2 -> sizeOfAType t1 = sizeOfAType t2.
Proof.
  intros.
  induction t1; destruct t2; simpl in *; auto; try solve [inversion H].
Qed.

Lemma atype_struct_ptypeEqual_eq_sizeOf :
 (forall a a', atypeEqual a a' ->
    (forall n,
    n = sizeOfAType a ->
    n = sizeOfAType a')) /\
 (forall s s', structEqual s s' ->
    (forall n,
    n = sizeOfStruct s ->
    n = sizeOfStruct s')) /\
 (forall p p', ptypeEqual p p' ->
    (forall n,
    Some n = sizeOfPType p ->
    Some n = sizeOfPType p')).
Proof.
 apply mutual_atype_struct_ptype_Equal_ind; intros; simpl in *; auto.
    assert (sizeOfAType t1 = sizeOfAType t2).
      eapply H; eauto.
    assert (sizeOfStruct s1 = sizeOfStruct s2).
      eapply H0; eauto.
    rewrite <- H2. rewrite <- H3. auto.

    assert (sizeOfAType t1 = sizeOfAType t2).
      eapply H; eauto.
    rewrite <- H1. auto.
   
    assert (sizeOfStruct s1 = sizeOfStruct s2).
      eapply H; eauto.
    rewrite <- H1. auto.

    rewrite e in H0. rewrite e0.
    assert (sizeOfStruct s1 = sizeOfStruct s2).
      eapply H; eauto.
    rewrite <- H1. auto.
Qed.

Lemma atypeEqual_eq_sizeOf :
 (forall a a', atypeEqual a a' ->
    (forall n,
    n = sizeOfAType a ->
    n = sizeOfAType a')).
Proof.
  decompose [and] atype_struct_ptypeEqual_eq_sizeOf.
  auto.
Qed.

Lemma structEqual_eq_sizeOf :
 (forall s s', structEqual s s' ->
    (forall n,
    n = sizeOfStruct s ->
    n = sizeOfStruct s')).
Proof.
  decompose [and] atype_struct_ptypeEqual_eq_sizeOf.
  auto.
Qed.

Lemma ptypeEqual_eq_sizeOf :
 (forall p p', ptypeEqual p p' ->
    (forall n,
    Some n = sizeOfPType p ->
    Some n = sizeOfPType p')).
Proof.
  decompose [and] atype_struct_ptypeEqual_eq_sizeOf.
  auto.
Qed.

Lemma sizeOfAType_one : forall t,
  sizeOfAType t = 1.
Proof.
  destruct t; simpl; auto.
Qed.

Lemma atype_struct_ptypeEqual_symm :
 (forall a a', atypeEqual a a' -> atypeEqual a' a) /\
 (forall s s', structEqual s s' -> structEqual s' s) /\
 (forall p p', ptypeEqual p p' -> ptypeEqual p' p).
Proof.
 apply mutual_atype_struct_ptype_Equal_ind; intros; simpl in *; auto.
    apply atypeEqual_Int.
    apply atypeEqual_Pointer; auto.
    apply structEqual_Nil.
    apply structEqual_Cons; auto.
    apply ptypeEqual_AType; auto.
    apply ptypeEqual_Struct; auto.
    apply ptypeEqual_Func; auto.
    eapply ptypeEqual_Name; eauto.
    eapply ptypeEqual_EqName; eauto.
    apply ptypeEqual_VoidPtr; auto.
Qed.

Lemma structEqual_symm : forall s s',
  structEqual s s' ->
  structEqual s' s.
Proof.
  intros.
  decompose [and] atype_struct_ptypeEqual_symm.
  auto.
Qed.
  
Lemma atypeEqual_symm : forall a a',
  atypeEqual a a' ->
  atypeEqual a' a.
Proof.
  intros.
  decompose [and] atype_struct_ptypeEqual_symm.
  auto.
Qed.

Lemma ptypeEqual_symm : forall p p',
  ptypeEqual p p' ->
  ptypeEqual p' p.
Proof.
  intros.
  decompose [and] atype_struct_ptypeEqual_symm.
  auto.
Qed.

Lemma atype_struct_ptypeEqual_trans :
 (forall a a', atypeEqual a a' -> forall a'', atypeEqual a' a'' -> atypeEqual a a'') /\
 (forall s s', structEqual s s' -> forall s'', structEqual s' s'' -> structEqual s s'') /\
 (forall p p', ptypeEqual p p' -> forall p'', ptypeEqual p' p'' -> ptypeEqual p p'').
Proof.
 apply mutual_atype_struct_ptype_Equal_ind; intros; simpl in *; eauto.
    destruct a''; inversion H0; subst.
      apply atypeEqual_Pointer; auto.
    destruct s''; inversion H1; subst.
      apply structEqual_Cons; auto.
    destruct p''; inversion H0; subst.
      apply ptypeEqual_AType; auto.
    destruct p''; inversion H0; subst.
      apply ptypeEqual_Struct; auto.
    destruct p''; inversion H0; subst.
      rewrite e0 in H3. inversion H3; subst.
      eapply ptypeEqual_Name with (s1:=s1) (s2:=s3); eauto.
    eapply ptypeEqual_Name with (s1:=s1) (s2:=s2); eauto.
Qed.

Lemma atypeEqual_trans : forall a a' a'',
  atypeEqual a a' ->
  atypeEqual a' a'' ->
  atypeEqual a a''
  .
Proof.
  intros.
  decompose [and] atype_struct_ptypeEqual_trans.
  eauto.
Qed.

Lemma structEqual__getStructNthPType : forall s s' i,
  structEqual s s' ->
  optionAtypeEqual (getStructNthType s i) (getStructNthType s' i).
Proof.
  intros. generalize dependent i.
  induction H; intro; simpl; auto.
    apply optionAtypeEqual_none.
    destruct i; auto.
      apply optionAtypeEqual_some; auto.
Qed.  

Lemma pEqual__getNthPType : forall s s' i,
  ptypeEqual s s' ->
  optionAtypeEqual (getNthPType s i) (getNthPType s' i).
Proof.
  intros. generalize dependent i.
  induction H; intro; simpl; auto.
    destruct i; auto.
      apply optionAtypeEqual_some; auto.
    apply optionAtypeEqual_none.
    apply structEqual__getStructNthPType; auto.
    apply optionAtypeEqual_none.
    rewrite H. rewrite H0. apply structEqual__getStructNthPType; auto.
    destruct (typeTable n).
      destruct (getStructNthType s i).
        apply optionAtypeEqual_some.
          apply atypeEqual_refl.
        apply optionAtypeEqual_none.
      apply optionAtypeEqual_none.
    apply optionAtypeEqual_none.
Qed.  

Lemma optionAtypeEqual_trans : forall ot ot' ot'',
  optionAtypeEqual ot ot' ->
  optionAtypeEqual ot' ot'' ->
  optionAtypeEqual ot ot''.
Proof.
  intros ot ot' ot'' H1 H2.
  inversion H1; subst; auto.
    inversion H2; subst; auto.
       apply optionAtypeEqual_some.
         eapply atypeEqual_trans; eauto.
Qed.

Lemma optionAtypeEqual_symm : forall ot ot',
  optionAtypeEqual ot ot' ->
  optionAtypeEqual ot' ot.
Proof.
  intros ot ot' H.
  inversion H; subst; auto.
    apply optionAtypeEqual_some.
      eapply atypeEqual_symm; eauto.
Qed.

Lemma optionAtypeEqual_refl : forall ot,
  optionAtypeEqual ot ot.
Proof.
  intros ot.
  destruct ot.  
    apply optionAtypeEqual_some.
      eapply atypeEqual_refl; eauto.
    apply optionAtypeEqual_none.
Qed.

(***************************************************************************)
(*                       wfEnv                                             *)
(***************************************************************************)

Lemma wfE__storeMemMeta__wfE : forall M Mu S TI loc d M' t,
  wfEnv (MkEnv M Mu S TI) ->
  wfData M TI d t ->
  storeMemMeta M loc d = Some M' -> 
  (
  isPtr t /\
  (forall p, t = A_Pointer p Safe -> atypeEqual (TI loc) (A_Pointer p Safe)) /\
  (forall p, t = A_Pointer p Seq -> atypeEqual (TI loc) (A_Pointer p Seq)) /\
  (forall p, t = A_Pointer p Tame -> exists q, atypeEqual (TI loc) (A_Pointer q Tame))
  ) ->
  wfEnv (MkEnv M' Mu S TI).
Proof.
  intros. rename H2 into W.
  unfold wfEnv in *. decompose [and] H. clear H.
  split.
    unfold wfMem in *. simpl in *. intros.  
    assert (JJ:=H1).
    apply storeMemMeta__inversion with (loc:=loc) in H1; auto.
    decompose [and] H1. clear H1.
    remember (accessMemMeta M l) as G1.
    destruct G1.
    (* accessMemMeta M l = Some *)
      apply sym_eq in HeqG1. 
      assert (J:=H2 l). clear H2. rewrite HeqG1 in J.
      destruct (eq_nat_dec loc l);subst.
      (* => loc = l *)
      clear H6 J.
      rewrite H.
      destruct d as [v [b e]].
      destruct W as [J1 [J2 [J3 J4]]].
      destruct (t).
        inversion J1.
        destruct q.
         (* Safe *)
         assert (A_Pointer p0 Safe = A_Pointer p0 Safe) as EQ. auto.
         apply J2 in EQ.
         inversion EQ; subst. rename H6 into JpEq.
         unfold wfData in H0. destruct p0.
           (*atype*)
           inversion JpEq; subst. rename H6 into JaEq.
           unfold wfData.
           destruct H0 as [[G1 [G2 [G3 G4]]] | G]; auto.
             rewrite sizeOfAType_one in *.
             left. split; auto. split; auto. split; auto.
             intros i HH.
             apply G4 in HH. destruct HH as [HH1 HH2].
             split.
               destruct (@storeMemMeta__validAddress M M' (v,(b,e)) l (v+i) JJ) as [G5 G6]; auto.
               eapply atypeEqual_trans; eauto.
                 apply atypeEqual_symm; auto.
           (*struct*)
           inversion JpEq; subst. rename H6 into JsEq.
           unfold wfData.
           destruct H0 as [[G1 [G2 [G3 G4]]] | G]; auto.
           assert (JK:=JsEq).
           apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in JsEq; auto.
           rewrite JsEq in *.
           left. split; auto. split; auto. split; auto.
             intros i HH.
             apply G4 in HH. destruct HH as [HH1 HH2].
             split.
               destruct (@storeMemMeta__validAddress M M' (v,(b,e)) l (v+i) JJ) as [G5 G6]; auto.
               assert(JK':=@structEqual__getStructNthPType s1 s i JK).
               eapply optionAtypeEqual_trans; eauto.
                 apply optionAtypeEqual_symm; auto.
           (*func*)
           (*name*)
           inversion JpEq; subst. rename H9 into JsEq.
           unfold wfData.
           destruct H0 as [[ss1 [G2 [G3 [G4 [G5 G6]]]]] | G]; auto.
           assert (JK:=JsEq).
           apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in JsEq; auto.
           simpl in G2. inversion G2; subst.
           rewrite H6 in H2. inversion H2; subst.
           assert (KK:=validAddressRange).
           left. exists(s1).
             rewrite JsEq in *.           
             split; auto. split; auto. split; auto. split; auto.
             intros i HH.
             apply G6 in HH. destruct HH as [HH1 HH2].
             split.
               destruct (@storeMemMeta__validAddress M M' (v,(b,e)) l (v+i) JJ) as [G7 G8]; auto.
               assert(JK':=@structEqual__getStructNthPType s1 ss1 i JK).
               eapply optionAtypeEqual_trans; eauto.
                 apply optionAtypeEqual_symm; auto.
           (*eqname*)
           unfold wfData.
           destruct H0 as [[s [G2 [G3 [G4 [G5 G6]]]]] | G]; auto.
           left. exists(s).
             split; auto. split; auto. split; auto. split; auto.
             intros i HH.
             apply G6 in HH. destruct HH as [HH1 HH2].
             split; auto.
               destruct (@storeMemMeta__validAddress M M' (v,(b,e)) l (v+i) JJ) as [G7 G8]; auto.
           (*void*)
           inversion JpEq; subst. inversion H0.
         (* Seq *)
         assert (A_Pointer p0 Seq = A_Pointer p0 Seq) as EQ. auto.
         apply J3 in EQ.
         inversion EQ; subst. rename H6 into JpEq.
         unfold wfData in *.
         destruct H0 as [[G1 [G2 [G3 G4]]] | G]; auto.
         destruct G4 as [s [G4 [G5 G6]]].
         left. split; auto. split; auto. split; auto.
         assert (JK:=JpEq).
         apply ptypeEqual_symm in JpEq.
         apply ptypeEqual_eq_sizeOf with (n:=s) in JpEq; auto.
         exists(s). split; auto. split; auto.
             intros i HH.
             apply G6 in HH. destruct HH as [HH1 HH2].
             split.
               destruct (@storeMemMeta__validAddress M M' (v,(b,e)) l i JJ) as [G7 G8]; auto.
               destruct HH2 as [j [HH3 HH4]].
               exists(j). split; auto.
               assert(JK':=@pEqual__getNthPType p1 p0 j JK).
               eapply optionAtypeEqual_trans; eauto.
                 apply optionAtypeEqual_symm; auto.
         (* Tame *)
         assert (A_Pointer p0 Tame = A_Pointer p0 Tame) as EQ. auto.
         apply J4 in EQ.
         destruct EQ as [q EQ].
         inversion EQ; subst. rename H6 into JpEq.
         unfold wfData in *.
         destruct H0 as [[G1 [G2 [G3 G4]]] | G]; auto.
         left. split; auto. split; auto. split; auto.
             intros i HH.
             apply G4 in HH. destruct HH as [HH1 HH2].
             split; auto.
               destruct (@storeMemMeta__validAddress M M' (v,(b,e)) l i JJ) as [G7 G8]; auto.

      (* => loc <> l*)
      apply H6 in HeqG1; auto.
      rewrite HeqG1. unfold wfData in J. unfold wfData.
      destruct p. destruct m. destruct (TI l); auto.
      destruct q.
        (*Safe*)
        destruct p.
          (*PAType*)
          destruct J; auto.
          decompose [and] H1; subst. clear H1. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H10 in H1.
            apply storeMemMeta__validAddress with (l:=v+i) in JJ; auto.
             destruct JJ. destruct H1. split; auto.
          (*PStruct*)
          destruct J; auto.
          decompose [and] H1; subst. clear H1. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H10 in H1.
            apply storeMemMeta__validAddress with (l:=v+i) in JJ; auto.
               destruct JJ. destruct H1. split; auto.
          (*PName*)
          destruct J; auto.
          destruct H1 as [s H1].
          decompose [and] H1; subst. clear H1. left.
          exists(s).
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H11 in H1.
            apply storeMemMeta__validAddress with (l:=v+i) in JJ; auto.
             destruct JJ. destruct H1. split; auto.
          (*PVoid*)
          inversion J.
        (*Seq*)
          destruct J; auto.
          decompose [and] H1. clear H1. 
          destruct H10 as [s H10]. decompose [and] H10. clear H10.  
          left.
          split; auto.
          split; auto.
          split; auto.
          exists (s).
          split; auto.
          split; auto.
          intros.
            apply H13 in H3. clear H13. destruct H3.
            split; auto.
              apply storeMemMeta__validAddress with (l:=i) in JJ; auto.
              destruct JJ . auto.               
        (*Tame*)
          destruct J; auto.
          decompose [and] H1. clear H1. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H10 in H1. destruct H1.
            apply storeMemMeta__validAddress with (l:=i) in JJ; auto.
            split; auto.
              destruct JJ; auto. 
    (* accessMemMeta M l = None *) 
      apply sym_eq in HeqG1. 
      apply H7 in HeqG1. rewrite HeqG1. auto.
  split; auto.
    intros. simpl in *.
    apply H5 with (loc:=loc0) (v:=v) (t:=t0) in H; auto.  destruct H; auto.
    split; auto.
      apply storeMemMeta__validAddresses with (l:=loc0) (n:=sizeOfAType t0) in H1; auto.
      destruct H1. apply H1. auto.
Qed.

Lemma wfE__storeMem__wfE : forall M S TI loc v M',
  wfEnv (MkEnv M S TI) ->
  storeMem M loc v = Some M' -> 
  (atypeEqual (TI loc) (A_Int) \/ exists q, atypeEqual (TI loc) (A_Pointer q Tame))->
  wfEnv (MkEnv M' S TI).
Proof.
  intros.
  rename H1 into W.
  unfold wfEnv in *. decompose [and] H. clear H.
  split.
    unfold wfMem in *. simpl in *. intros.  
    assert (JJ:=H0).
    assert (exists v, accessMemMeta M loc = Some v).
       destruct (@validAccessMemMeta__validStoreMem M loc v).
       apply H2. exists (M'). auto.
    destruct H as [[v' be] H].
    apply storeMem__inversion with (loc:=loc) (v:=v') (be:=be) in H0; auto.
    decompose [and] H0. clear H0.
    remember (accessMemMeta M l) as G1.
    destruct G1.
    (* accessMemMeta M l = Some *)
      apply sym_eq in HeqG1. 
      assert (J:=H1 l). clear H1. rewrite HeqG1 in J.
      destruct (eq_nat_dec loc l);subst.
      (* => loc = l *)
      rewrite H2. 
      destruct (TI l).
         destruct be as [b e]; simpl; auto.

         destruct q.
           destruct W as [W | W].
             inversion W.
             destruct W as [q W]. inversion W. inversion H10.
           destruct W as [W | W].
             inversion W.
             destruct W as [q W]. inversion W. inversion H10.
           destruct W as [W | W].
             inversion W.
             destruct W as [q W]. inversion W; subst.
             destruct be as [b e].
             destruct p as [pv [pb pe]].
             rewrite HeqG1 in H. inversion H; subst.
             unfold wfData in *.
             destruct J as [[J1 [J2 [J3 J4]]] | J]; auto.
             left. split; auto. split; auto. split; auto.
             intros i HH.
             apply J4 in HH. destruct HH as [HH1 HH2].
             split; auto.
               destruct (@storeMem__validAddress M M' l (v) i JJ) as [G7 G8]; auto.
      (* => loc <> l*)
      apply H6 in HeqG1; auto.
      rewrite HeqG1. unfold wfData in J. unfold wfData.
      destruct p. destruct m.
      destruct (TI l); auto.
      destruct q.
        (*Safe*)
        destruct p.
          (*PAType*)
          destruct J; auto.
          decompose [and] H0. clear H0. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H10 in H0.
            apply storeMem__validAddress with (l:=v0+i) in JJ; auto.
             destruct JJ. destruct H0. split; auto.
          (*PStruct*)
          destruct J; auto.
          decompose [and] H0. clear H0. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H10 in H0.
            apply storeMem__validAddress with (l:=v0+i) in JJ; auto.
             destruct JJ. destruct H0. split; auto.
          (*PName*)
          destruct J; auto.
          destruct H0 as [s H0] ; auto.
          decompose [and] H0. clear H0. left.
          exists(s).
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H11 in H0.
            apply storeMem__validAddress with (l:=v0+i) in JJ; auto.
             destruct JJ. destruct H0. split; auto.
          (*PVoid*)
          inversion J.
        (*Seq*)
          destruct J; auto.
          decompose [and] H0. clear H0. 
          destruct H10 as [s H10]. decompose [and] H10. clear H10.  
          left.
          split; auto.
          split; auto.
          split; auto.
          exists (s).
          split; auto.
          split; auto.
          intros.
            apply H13 in H5. clear H13. destruct H5.
            split; auto.
              apply storeMem__validAddress with (l:=i) in JJ; auto.
              destruct JJ . auto.               
        (*Tame*)
          destruct J; auto.
          decompose [and] H0. clear H0. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H10 in H0. destruct H0.
            apply storeMem__validAddress with (l:=i) in JJ; auto.
            split; auto.
              destruct JJ; auto.
    (* accessMemMeta M l = None *) 
      apply sym_eq in HeqG1. 
      apply H7 in HeqG1. rewrite HeqG1. auto.
  split; auto.
  intros. simpl in *.
    apply H4 with (loc:=loc0) (v:=v0) (t:=t) in H; auto. destruct H.
    split; auto.
      apply storeMem__validAddresses with (l:=loc0) (n:=sizeOfAType t) in H0; auto.
      destruct H0. apply H0. auto.
Qed.

Lemma wfD__storeMemMeta__wfD : forall M S TI ds M' loc ts d,
  wfEnv (MkEnv M S TI) ->
  wfDatas M TI ds ts ->  
  storeMemMeta M loc d = Some M' -> 
  wfDatas M' TI ds ts .
Proof.
  intros. 
  generalize dependent M.
  generalize dependent S.
  generalize dependent TI.
  generalize dependent M'.
  generalize dependent loc.
  generalize dependent ts.
  generalize dependent d.
  induction ds; intros; destruct ts.
    simpl.  auto.
    simpl in H0. inversion H0.
    simpl in H0. inversion H0.

    simpl in *. destruct H0.
    split; eauto.
      unfold wfData in *.
      destruct a. destruct m.
      destruct (a0); auto.
      destruct q.
        (*Safe*)
        destruct p.
          (*PAType*)
          destruct H0; auto.
          intros. decompose [and] H0. clear H0. left.
          split; auto.
          split; auto.
          split; auto.
          intros. 
            apply H7 in H0. destruct H0.
            destruct (@storeMemMeta__validAddress M M' d loc (v+i) H1); auto.                      
          (*PStruct*)
          destruct H0; auto.
          intros. decompose [and] H0. clear H0. left.
          split; auto.
          split; auto.
          split; auto.
          intros. 
            apply H7 in H0. destruct H0.
            destruct (@storeMemMeta__validAddress M M' d loc (v+i) H1); auto.                      
          (*PName*)
          destruct H0; auto.
          destruct H0 as [s H0]; auto.
          intros. decompose [and] H0. clear H0. left.
          exists(s).
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros. 
            apply H8 in H0. destruct H0.
            destruct (@storeMemMeta__validAddress M M' d loc (v+i) H1); auto.                      
          (*PVoid*)
          inversion H0.
        (*Seq*)
          destruct H0; auto.
          decompose [and] H0. clear H0. 
          destruct H7 as [s H7]. decompose [and] H7. clear H7.  
          left.
          split; auto.
          split; auto.
          split; auto.
          exists (s).
          split; auto.
          split; auto.
          intros.
            apply H10 in H4. clear H10. destruct H4.
            split; auto.
            destruct (@storeMemMeta__validAddress M M' d loc i H1); auto.
        (*Tame*)
          destruct H0; auto.
          decompose [and] H0. clear H0. left.
          split; auto.
          split; auto.
          split; auto.
          intros. 
            apply H7 in H0. destruct H0.
            destruct (@storeMemMeta__validAddress M M' d loc i H1); auto.
Qed.

(***************************************************************************)
(*                            Malloc                                       *)
(***************************************************************************)
Lemma malloc__validAddress: forall M S TI M' S' TI' loc size l,
  validAddress M l ->
  malloc (MkEnv M S TI) size = Some ((MkEnv M' S' TI'), loc) ->
  validAddress M' l.
Proof.
  intros.
  unfold validAddress in *. destruct H.
  apply malloc__inversion in H0. destruct H0 as [M0 [TI0 H0]]. decompose [and] H0. clear H0.
  inversion H2. subst. clear H2.
  split.
    destruct H as [v H]. apply H6 in H. exists(v). auto.
    intro.
      destruct H as [v' H]. apply H6 in H. 
      destruct (validAccessMemMeta__validStoreMemMeta M' l v). 
      apply H0. exists(v'). auto.
Qed.

Lemma malloc__validAddresses: forall M S TI M' S' TI' loc size l n,
  validAddresses M l n ->
  malloc (MkEnv M S TI) size = Some ((MkEnv M' S' TI'), loc) ->
  validAddresses M' l n.
Proof.
  intros. 
  unfold validAddresses in *. decompose [and] H. clear H.
  split.
    assert (J:=@malloc__validAddress M S TI M' S' TI' loc size l H1 H0). auto.
  assert (JJ:=H0).
  apply malloc__inversion in H0. destruct H0 as [M0 [TI0 H0]]. decompose [and] H0. clear H0.
  inversion H. subst. clear H.
  split.
    apply accessMemMeta__accessMemMetaBlock.
      intros.
      destruct H3 as [vs H3].
      assert (n>0). omega.
      apply accessMemMetaBlock_accessMemMeta with (offset:=i-l) (n:=n) (vs:=vs) in H3; auto.
        destruct H3 as [v H3].
        assert (l + (i-l) = i). omega. rewrite H12 in H3.
        apply H7 in H3; auto.
        exists (v). auto.
        omega.

    intros.
      apply storeMemMeta__storeMemMetaBlock with (v:=(0,(0,0))) (n:=n); auto.
      assert (J:=H).
      apply H4 in H. intros. 
      destruct H as [m' H].      
      apply storeMemMetaBlock_storeMemMeta with (offset:=i-l) (n:=n) (v:=(0,(0,0))) in H; auto.
      assert (l + (i-l) = i). omega. rewrite H12 in H.
      apply validStoreMemMeta__validAddress in H.
      destruct (@malloc__validAddress M0 S' TI0 M' S' TI' loc size i H JJ); auto.
       omega.       
Qed.

Lemma malloc__wfE: forall E E' loc size,
  wfEnv E ->
  malloc E size = Some (E', loc) ->
  wfEnv E'.
Proof.
  intros.
  destruct E' as [M' S' TI'].
  assert (JJ:=H0).
  apply malloc__inversion in H0.
  destruct H0 as [M [TI H0]]. decompose [and] H0. clear H0.
  subst.
  unfold wfEnv in *. decompose [and] H. clear H.
  split.
    unfold wfMem in *. simpl in *. intros.
    remember (accessMemMeta M l) as G1.
    destruct G1.
      apply sym_eq in HeqG1. 
      assert (J:=H0 l). clear H0. rewrite HeqG1 in J.
      apply H5 in HeqG1.
      rewrite HeqG1. unfold wfData in *.
      destruct p. destruct m.
      destruct (le_lt_dec loc l).
        destruct (le_lt_dec (loc+size) l).
          (* loc + size <= l /\ loc <= l*)
          assert (atypeEqual (TI' l) (TI l)). apply H9; auto.
      destruct (TI l). 
       (* TI l = A_int *)
       inversion H; subst. auto.
       (* TI l = p * q *)
       inversion H; subst. clear H H0. rename H14 into JpEeq.        
       destruct q.
        (*Safe*)
        destruct p.
          (*PAType*)
          inversion JpEeq; subst. rename H1 into JaEq.
          destruct J; auto.
          decompose [and] H. clear H. left.
          rewrite sizeOfAType_one in *. 
          split. auto.
          split; auto.
          split; auto.
          intros.
            apply H15 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H18; subst. clear H18.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size) as EQ. omega. 
                     apply H26 in EQ.
                     apply atypeEqual_trans with (a':=TI0 (v+i)); auto.
                       apply atypeEqual_trans with (a':=a); auto.
                         apply atypeEqual_symm; auto.
                         apply atypeEqual_symm; auto.
                     assert (loc<=v+i<loc+size) as EQ. omega.
                     apply H7 in EQ.
                        destruct H. destruct H. rewrite H in EQ. inversion EQ.
                  assert (v+i<loc \/ v+i>=loc+size) as EQ. omega. 
                  apply H26 in EQ.
                  apply atypeEqual_trans with (a':=TI0 (v+i)); auto.
                    apply atypeEqual_trans with (a':=a); auto.
                      apply atypeEqual_symm; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*PStruct*)
          inversion JpEeq; subst. rename H1 into JsEq.
          destruct J; auto.
          decompose [and] H. clear H. 
          assert (JK:=JsEq).
          apply structEqual_symm in JsEq.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in JsEq; auto.
          rewrite <- JsEq in *.
          left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H15 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H18; subst. clear H18.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size). omega. 
                     apply H26 in H18; auto.
                     assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                       apply optionAtypeEqual_some; auto.
                       apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                          apply optionAtypeEqual_symm; auto.

                     assert (loc<=v+i<loc+size). omega. apply H7 in H18.
                        destruct H. destruct H. rewrite H in H18. inversion H18.
                 assert (v+i<loc \/ v+i>=loc+size). omega. 
                 apply H26 in H18; auto.
                 assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                 apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                   apply optionAtypeEqual_some; auto.
                   apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                      apply optionAtypeEqual_symm; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*PName*)
          inversion JpEeq; subst.
          (* PNameName *) 
          rename H14 into JsEq. rename H0 into Htab1. rename H1 into Htab2.
          destruct J; auto.
          destruct H as [s H].
          decompose [and] H. clear H. 
          rewrite Htab2 in H0. inversion H0; subst. clear H0.
          assert (JK:=JsEq).
          apply structEqual_symm in JsEq.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in JsEq; auto.
          left. exists(s1).
          rewrite <- JsEq in *.
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H16 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H18; subst. clear H18.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size). omega. 
                     apply H26 in H18; auto.
                     assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                       apply optionAtypeEqual_some; auto.
                       apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                          apply optionAtypeEqual_symm; auto.

                     assert (loc<=v+i<loc+size). omega. 
                     apply H7 in H18.
                     destruct H. destruct H. rewrite H in H18. inversion H18.
                 assert (v+i<loc \/ v+i>=loc+size). omega. 
                 apply H26 in H18; auto.
                 assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                 apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                   apply optionAtypeEqual_some; auto.
                   apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                      apply optionAtypeEqual_symm; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (* PEqName *) 
          destruct J; auto.
          destruct H as [s H].
          decompose [and] H. clear H. 
          left. exists(s).
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H16 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H19; subst. clear H19.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size). omega. 
                     apply H27 in H19; auto.
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))); auto.
                       apply optionAtypeEqual_some; auto.

                     assert (loc<=v+i<loc+size). omega. 
                     apply H7 in H19.
                     destruct H. destruct H. rewrite H in H19. inversion H19.
                 assert (v+i<loc \/ v+i>=loc+size). omega. 
                   apply H27 in H19; auto.
                   apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))); auto.
                     apply optionAtypeEqual_some; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*PVoid*)
           inversion J.
        (*Seq*)
          destruct J; auto.
          decompose [and] H. clear H. 
          destruct H15 as [s H15]. decompose [and] H15. clear H15. 
          left.
          split; auto.
          split; auto.
          split; auto.
          exists (s).
          split.
            apply ptypeEqual_symm in JpEeq.
            apply sym_eq in H.
            assert (G:=@ptypeEqual_eq_sizeOf p p1 JpEeq s H). auto.            
          split; auto.
          intros.
            apply H18 in H1. destruct H1. destruct H15 as [j H15]. destruct H15.
            assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ; auto.

              split; auto.
              apply malloc__inversion in JJJ; auto.
              destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
              inversion H22; subst. clear H22.
              exists (j).
              split; auto. 
                 destruct (le_lt_dec loc i).
                   destruct (le_lt_dec (loc+size) i).
                     assert (i<loc \/ i>=loc+size). omega. 
                     apply H30 in H22; auto.
                     assert(JK':=@pEqual__getNthPType p1 p j JpEeq).
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 i)).
                       apply optionAtypeEqual_some; auto.
                       apply optionAtypeEqual_trans with (ot':=getNthPType p j); auto.
                          apply optionAtypeEqual_symm; auto.

                     assert (loc<=i<loc+size). omega. 
                     apply H7 in H22.
                     destruct H1. destruct H1. rewrite H22 in H1. inversion H1.
                   assert (i<loc \/ i>=loc+size). omega.
                   apply H30 in H22; auto.
                   assert(JK':=@pEqual__getNthPType p1 p j JpEeq).
                   apply optionAtypeEqual_trans with (ot':=Some (TI0 i)).
                     apply optionAtypeEqual_some; auto.
                     apply optionAtypeEqual_trans with (ot':=getNthPType p j); auto.
                        apply optionAtypeEqual_symm; auto.

              split; auto.
                split; auto.
                  apply accessMemMetaZeroBlock.
                  apply storeMemMetaZeroBlock.
          (*Tame*)
          destruct J; auto.
          decompose [and] H. clear H. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H15 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. 
              split.
                destruct JJ; auto.
                apply malloc__inversion in JJJ; auto.
                destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
                inversion H17; subst. clear H17.

                 destruct (le_lt_dec loc i).
                   destruct (le_lt_dec (loc+size) i).
                     assert (i<loc \/ i>=loc+size). omega. 
                     apply H25 in H17; auto.
                     destruct H1 as [q H1].
                     exists(q).
                     apply atypeEqual_trans with (a':=(TI0 i)); auto.

                     assert (loc<=i<loc+size). omega. 
                     apply H7 in H17.
                     destruct H. destruct H. rewrite H in H17. inversion H17.
                   assert (i<loc \/ i>=loc+size). omega. 
                   apply H25 in H17; auto.
                   destruct H1 as [q H1].
                   exists(q).
                   apply atypeEqual_trans with (a':=(TI0 i)); auto.

              split; auto.
              apply malloc__inversion in JJJ; auto.
              destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
              inversion H17; subst. clear H17.
              split; auto. 
                  apply accessMemMetaZeroBlock.
                  apply storeMemMetaZeroBlock.

          (* l < loc + size /\ loc <= l*)
          assert (atypeEqual (TI' l) A_Int). apply H11; auto.
          inversion H; subst. auto.

          (* l < loc *)
          assert (atypeEqual (TI' l) (TI l)). apply H9; auto.
      destruct (TI l). 
       (* TI l = A_int *)
       inversion H; subst. auto.
       (* TI l = p * q *)
       inversion H; subst. clear H H0. rename H14 into JpEeq.        
       destruct q.
        (*Safe*)
        destruct p.
          (*PAType*)
          inversion JpEeq; subst. rename H1 into JaEq.
          destruct J; auto.
          decompose [and] H. clear H. left.
          rewrite sizeOfAType_one in *. 
          split. auto.
          split; auto.
          split; auto.
          intros.
            apply H15 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H18; subst. clear H18.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size) as EQ. omega. 
                     apply H26 in EQ.
                     apply atypeEqual_trans with (a':=TI0 (v+i)); auto.
                       apply atypeEqual_trans with (a':=a); auto.
                         apply atypeEqual_symm; auto.
                         apply atypeEqual_symm; auto.
                     assert (loc<=v+i<loc+size) as EQ. omega.
                     apply H7 in EQ.
                        destruct H. destruct H. rewrite H in EQ. inversion EQ.
                  assert (v+i<loc \/ v+i>=loc+size) as EQ. omega. 
                  apply H26 in EQ.
                  apply atypeEqual_trans with (a':=TI0 (v+i)); auto.
                    apply atypeEqual_trans with (a':=a); auto.
                      apply atypeEqual_symm; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*PStruct*)
          inversion JpEeq; subst. rename H1 into JsEq.
          destruct J; auto.
          decompose [and] H. clear H. 
          assert (JK:=JsEq).
          apply structEqual_symm in JsEq.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in JsEq; auto.
          rewrite <- JsEq in *.
          left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H15 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H18; subst. clear H18.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size). omega. 
                     apply H26 in H18; auto.
                     assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                       apply optionAtypeEqual_some; auto.
                       apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                          apply optionAtypeEqual_symm; auto.

                     assert (loc<=v+i<loc+size). omega. apply H7 in H18.
                        destruct H. destruct H. rewrite H in H18. inversion H18.
                 assert (v+i<loc \/ v+i>=loc+size). omega. 
                 apply H26 in H18; auto.
                 assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                 apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                   apply optionAtypeEqual_some; auto.
                   apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                      apply optionAtypeEqual_symm; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*PName*)
          (*   P_NameName *)
          inversion JpEeq; subst. 
          rename H14 into JsEq. rename H0 into Htab1. rename H1 into Htab2.
          destruct J; auto.
          destruct H as [s H].
          decompose [and] H. clear H. 
          rewrite Htab2 in H0. inversion H0; subst. clear H0.
          assert (JK:=JsEq).
          apply structEqual_symm in JsEq.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in JsEq; auto.
          left. exists(s1).
          rewrite <- JsEq in *.
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H16 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H18; subst. clear H18.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size). omega. 
                     apply H26 in H18; auto.
                     assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                       apply optionAtypeEqual_some; auto.
                       apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                          apply optionAtypeEqual_symm; auto.

                     assert (loc<=v+i<loc+size). omega. 
                     apply H7 in H18.
                     destruct H. destruct H. rewrite H in H18. inversion H18.
                 assert (v+i<loc \/ v+i>=loc+size). omega. 
                 apply H26 in H18; auto.
                 assert(JK':=@structEqual__getStructNthPType s1 s i JK).
                 apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))).
                   apply optionAtypeEqual_some; auto.
                   apply optionAtypeEqual_trans with (ot':=getStructNthType s i); auto.
                      apply optionAtypeEqual_symm; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*   P_EqName *)
          destruct J; auto.
          destruct H as [s H].
          decompose [and] H. clear H. 
          left. exists(s).
          split; auto.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H16 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=v+i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ.
               split; auto. 
               apply malloc__inversion in JJJ; auto.
               destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
               inversion H19; subst. clear H19.
        
               destruct (le_lt_dec loc (v+i)).
                 destruct (le_lt_dec (loc+size) (v+i)).
                     assert (v+i<loc \/ v+i>=loc+size). omega. 
                     apply H27 in H19; auto.
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))); auto.
                        apply optionAtypeEqual_some; auto.

                     assert (loc<=v+i<loc+size). omega. 
                     apply H7 in H19.
                     destruct H. destruct H. rewrite H in H19. inversion H19.
                 assert (v+i<loc \/ v+i>=loc+size). omega. 
                 apply H27 in H19; auto.
                 apply optionAtypeEqual_trans with (ot':=Some (TI0 (v+i))); auto.
                   apply optionAtypeEqual_some; auto.

              unfold validAddresses. split; auto.
              split.
                apply accessMemMetaZeroBlock.
                apply storeMemMetaZeroBlock.
          (*PVoid*)
           inversion J.
        (*Seq*)
          destruct J; auto.
          decompose [and] H. clear H. 
          destruct H15 as [s H15]. decompose [and] H15. clear H15. 
          left.
          split; auto.
          split; auto.
          split; auto.
          exists (s).
          split.
            apply ptypeEqual_symm in JpEeq.
            apply sym_eq in H.
            assert (G:=@ptypeEqual_eq_sizeOf p p1 JpEeq s H). auto.            
          split; auto.
          intros.
            apply H18 in H1. destruct H1. destruct H15 as [j H15]. destruct H15.
            assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. destruct JJ; auto.

              split; auto.
              apply malloc__inversion in JJJ; auto.
              destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
              inversion H22; subst. clear H22.
              exists (j).
              split; auto. 
                 destruct (le_lt_dec loc i).
                   destruct (le_lt_dec (loc+size) i).
                     assert (i<loc \/ i>=loc+size). omega. 
                     apply H30 in H22; auto.
                     assert(JK':=@pEqual__getNthPType p1 p j JpEeq).
                     apply optionAtypeEqual_trans with (ot':=Some (TI0 i)).
                       apply optionAtypeEqual_some; auto.
                       apply optionAtypeEqual_trans with (ot':=getNthPType p j); auto.
                          apply optionAtypeEqual_symm; auto.

                     assert (loc<=i<loc+size). omega. 
                     apply H7 in H22.
                     destruct H1. destruct H1. rewrite H22 in H1. inversion H1.
                   assert (i<loc \/ i>=loc+size). omega.
                   apply H30 in H22; auto.
                   assert(JK':=@pEqual__getNthPType p1 p j JpEeq).
                   apply optionAtypeEqual_trans with (ot':=Some (TI0 i)).
                     apply optionAtypeEqual_some; auto.
                     apply optionAtypeEqual_trans with (ot':=getNthPType p j); auto.
                        apply optionAtypeEqual_symm; auto.

              split; auto.
                split; auto.
                  apply accessMemMetaZeroBlock.
                  apply storeMemMetaZeroBlock.
          (*Tame*)
          destruct J; auto.
          decompose [and] H. clear H. left.
          split; auto.
          split; auto.
          split; auto.
          intros.
            apply H15 in H. destruct H. assert (JJJ:=JJ).
            apply malloc__validAddresses with (l:=i) (n:=0) in JJ; auto.
              unfold validAddresses in JJ. 
              split.
                destruct JJ; auto.
                apply malloc__inversion in JJJ; auto.
                destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
                inversion H17; subst. clear H17.

                 destruct (le_lt_dec loc i).
                   destruct (le_lt_dec (loc+size) i).
                     assert (i<loc \/ i>=loc+size). omega. 
                     apply H25 in H17; auto.
                     destruct H1 as [q H1].
                     exists(q).
                     apply atypeEqual_trans with (a':=(TI0 i)); auto.

                     assert (loc<=i<loc+size). omega. 
                     apply H7 in H17.
                     destruct H. destruct H. rewrite H in H17. inversion H17.
                   assert (i<loc \/ i>=loc+size). omega. 
                   apply H25 in H17; auto.
                   destruct H1 as [q H1].
                   exists(q).
                   apply atypeEqual_trans with (a':=(TI0 i)); auto.

              split; auto.
              apply malloc__inversion in JJJ; auto.
              destruct JJJ as [M0 [TI0 JJJ]]. decompose [and] JJJ. clear JJJ.
              inversion H17; subst. clear H17.
              split; auto. 
                  apply accessMemMetaZeroBlock.
                  apply storeMemMetaZeroBlock.

      apply sym_eq in HeqG1. 
      assert (J:=H0 l). clear H0. rewrite HeqG1 in J.
      destruct (le_lt_dec loc l).
        destruct (le_lt_dec (loc+size) l).
          (* loc + size <= l /\ loc <= l*)
           apply H4 in HeqG1; auto.
           rewrite HeqG1. auto.

           assert (loc <= l < loc+size). omega.
           assert (J':=H). apply H11 in J'; auto.
           apply H8 in H; auto.
           rewrite H. unfold wfData.
           destruct (TI' l); auto; inversion J'.

         apply H4 in HeqG1; auto.
         rewrite HeqG1. auto.

  split; auto.
  intros. simpl in *.
  apply H12 in H. destruct H.  
  split; auto.
    apply malloc__validAddresses with (M:=M) (S:=S') (TI:=TI) (M':=M') (S':=S') (TI':=TI') (size:=size) (loc:=loc); auto.
    intros. assert (J:=H13). apply H1 in H13.

    destruct (le_lt_dec loc (loc0+i)).
        destruct (le_lt_dec (loc+size) (loc0+i)).
            assert ((loc0+i)<loc \/ (loc0+i)>=loc+size). omega.
                 apply H9 in H14; auto.
                 apply atypeEqual_trans with (a':=(TI (loc0+i))); auto.
            assert (loc <= (loc0+i) < loc+size). omega.
              apply H7 in H14; auto.
              unfold validAddresses in H. 
              decompose [and] H. clear H.
              destruct H17 as [vs H17].
              apply accessMemMetaBlock_accessMemMeta with (offset:=i) in H17; try omega.
              destruct H17. rewrite H14 in H. inversion H.
         assert ((loc0+i)<loc \/ (loc0+i)>=loc+size). omega.
                 apply H9 in H14; auto.
                 apply atypeEqual_trans with (a':=(TI (loc0+i))); auto.
Qed.

(***************************************************************************)
(*                      ValidAddress                                       *)
(***************************************************************************)

Lemma validAddress__validAddresses : forall (m:Mem) (l:Loc) n,
  validAddress m l ->
  (forall i, 0<=i<n -> validAddress m (l+i)) ->
  validAddresses m l n.
Proof.
  intros.
  unfold validAddresses.
  split; auto.
  split.
     apply accessMemMeta__accessMemMetaBlock.
     intros.
       assert (0<=i-l<n). omega.
       apply H0 in H2.
       assert (l + (i - l) = i). omega. rewrite H3 in H2.
       destruct H2; auto.

     intros.
     apply storeMemMeta__storeMemMetaBlock with (v:=(0,(0,0))) (n:=n); auto.
       intros.
       assert (0<=i-l<n). omega.
       apply H0 in H3.
       assert (l + (i - l) = i). omega. rewrite H4 in H3.
       destruct H3; auto.
Qed.

Lemma validAddress__validCopyMemMetaBlock: forall (m:Mem) (l l':Loc) n,
  validAddresses m l n->
  validAddresses m l' n->
  (exists m', copyMemMetaBlock m l l' n = Some m') /\
  (exists m', copyMemMetaBlock m l' l n = Some m')
  .
Proof.
  intros.
  unfold validAddresses in *.
  decompose [and] H. clear H. destruct H3 as [vs H3].
  decompose [and] H0. clear H0. destruct H5 as [vs' H5].
  unfold copyMemMetaBlock.
    rewrite H3. rewrite H5.
    split.
      apply H6.
        apply accessMemMetaBlock__length in H3; auto.
      apply H4.
        apply accessMemMetaBlock__length in H5; auto.
Qed.  

Lemma validAddress__validCopyMemBlock: forall (m:Mem) (l l':Loc) n,
  validAddresses m l n->
  validAddresses m l' n->
  (exists m', copyMemBlock m l l' n = Some m') /\
  (exists m', copyMemBlock m l' l n = Some m')
  .
Proof.
  intros.
  unfold validAddresses in *.
  decompose [and] H. clear H. destruct H3 as [vs H3].
  decompose [and] H0. clear H0. destruct H5 as [vs' H5].
  unfold copyMemBlock.
    assert (J1:=H3). assert (J2:=H5).
    apply accessMemMetaBlock_accessMemBlock in H3.
    apply accessMemMetaBlock_accessMemBlock in H5.
    destruct H3. destruct H5. rewrite H0. rewrite H2.
    split.
      apply storeMemMetaBlock_storeMemBlock with (ds:=vs).
      apply H6.
        apply accessMemMetaBlock__length in J1; auto.
        apply accessMemMetaBlock__length in J1; auto.
        apply accessMemBlock__length in H0; auto. subst. auto.
      apply storeMemMetaBlock_storeMemBlock with (ds:=vs).
      apply H4.
        apply accessMemMetaBlock__length in J1; auto.
        apply accessMemMetaBlock__length in J1; auto.
        apply accessMemBlock__length in H2; auto. subst. auto.
Qed.  

Lemma validAddresses__subValidAddresses : forall M l n offset n',
  validAddresses M (l) n -> 
  offset+n' <= n ->
  n' > 0 ->
  validAddresses M ((l+offset)) n'.
Proof.
  intros.
  unfold validAddresses in *.
  decompose [and] H. clear H.
  split.
   unfold validAddress.
   split.
     destruct H4 as [vs H4].
     apply accessMemMetaBlock_accessMemMeta with (n:=n) (vs:=vs); auto.
       omega.

     intros.
     destruct H4 as [vs H4].
     apply accessMemMetaBlock__length in H4. assert (J:=H4).
     apply H5 in H4. destruct H4 as [m' H4].
     apply storeMemMetaBlock_storeMemMeta with (n:=n) (vs:=vs) (m':=m'); auto.
       omega.
  split.
    destruct H4 as [vs H4].
    apply accessMemMetaBlock__accessMemMetaSubBlock with (n':=n') (offset:=offset) in H4; auto.

    intros. rename vs into vs'.
    destruct H4 as [vs H4].
    apply accessMemMetaBlock__length in H4. assert (J:=H4).
    apply H5 in H4. destruct H4 as [m' H4].
    apply storeMemMetaBlock__storeMemMetaSubBlock with (n:=n) (vs:=vs) (m':=m') (n':=n') ; auto.
Qed.

(***************************************************************************)
(*                            Decidable                                    *)
(***************************************************************************)
Lemma malloc_dec : forall E n,
  (exists E', exists b, malloc E n = Some (E', b)) \/ malloc E n = None.
Proof.
  intros.
  destruct (malloc E n).
    left. destruct p. exists(e). exists(b). auto.
    right. auto.
Qed.

Lemma accessMemMeta_dec : forall E loc,
  (exists d, accessMemMeta E loc = Some d) \/ accessMemMeta E loc = None.
Proof.
  intros.
  destruct (accessMemMeta E loc).
    left. exists(p). auto.
    right. auto.
Qed.

Lemma accessMemMetaBlock_dec : forall E loc size,
  (exists ds, accessMemMetaBlock E loc size = Some ds) \/ accessMemMetaBlock E loc size = None.
Proof.
  intros.
  destruct (accessMemMetaBlock E loc size).
    left. exists(l). auto.
    right. auto.
Qed.

Lemma assertion_ptr_dec : forall v be t,
  assertion_ptr v be t \/ ~assertion_ptr v be t.
Proof.
  intros.
  destruct v; destruct be as [b e]; destruct t; unfold assertion_ptr; simpl; auto;
    destruct b; destruct e; try solve [
       auto |
       right; unfold not; intros; destruct H; inversion H0 |
       right; unfold not; intros; destruct H; inversion H |
       right; unfold not; intros; destruct H; destruct H0; omega |
       right; unfold not; intros; destruct H; apply H; auto];
    destruct p; destruct q; try solve [
       auto |
       right; unfold not; intros; destruct H; inversion H0 |
       right; unfold not; intros; destruct H; inversion H |
       right; unfold not; intros; destruct H; destruct H0; omega |
       right; unfold not; intros; decompose [and] H; apply H3; auto |
       right; unfold not; intros; destruct H; apply H; auto];
    try solve [
     destruct (le_gt_dec (S b) (S v)); try solve [
      destruct (le_gt_dec (v + sizeOfAType a) e ); try solve [
        left; split;omega |
        right; unfold not; intros; decompose [and] H; clear H; omega] |
      right; unfold not; intros; decompose [and] H; clear H; omega] |
     destruct (le_gt_dec (S b) (S v)); try solve [
      destruct (le_gt_dec (v + sizeOfStruct s) e ); try solve [
        left; split;omega |
        right; unfold not; intros; decompose [and] H; clear H; omega] |
      right; unfold not; intros; decompose [and] H; clear H; omega]|
     destruct (typeTable c); right; intro; auto |
     destruct (typeTable c); try solve [
       right; unfold not; intros; decompose [and] H; apply H0; auto |
       right; intro; auto] |
     destruct (typeTable c); try solve [
       right; unfold not; intros; decompose [and] H; absurd_hyp H2; omega|
       right; intro; auto] |
     destruct (typeTable c); try solve [
       left; intros; unfold not; intros; inversion H|
       right; intro; auto] |
     destruct (typeTable c); try solve [
       destruct (le_gt_dec (S b) (S v)); try solve [
        destruct (le_gt_dec (v + sizeOfStruct s) e); try solve [
          left; split;omega |
          right; unfold not; intros; decompose [and] H; clear H; omega] |
        right; unfold not; intros; decompose [and] H; clear H; omega] |
       right; intro; auto]
    ].
Qed.

Lemma assertion_dataCast_dec : forall t' d t,
  assertion_dataCast t' d t \/ ~assertion_dataCast t' d t.
Proof.
  intros.
  destruct d as [v [b e]].
  destruct t'; destruct t; unfold assertion_dataCast; simpl; auto.
  destruct q; auto.
    destruct v; auto.

  destruct q; destruct q0; destruct p0; try solve [
    auto
    ].
    destruct (sizeOfPType (P_AType a)).
      destruct (zerop v).
         left. auto.
         destruct (le_gt_dec b v).
            destruct (le_gt_dec v (e-n)).
                destruct (zerop b).
                  right. unfold not. intros.
                  destruct H.
                      subst. absurd_hyp l; omega.
                      destruct H. apply H; auto.
                  left. right. split; omega.
                right. unfold not. intros. omega.
            right. unfold not. intros. omega.
      destruct (zerop v).
         left. auto.
         right. unfold not. intros. omega.

    destruct (sizeOfPType (P_Struct s)).
      destruct (zerop v).
         left. auto.
         destruct (le_gt_dec b v).
            destruct (le_gt_dec v (e-n)).
                destruct (zerop b).
                  right. unfold not. intros.
                  destruct H.
                      subst. absurd_hyp l; omega.
                      destruct H. apply H; auto.
                  left. right. split; omega.
                right. unfold not. intros. omega.
            right. unfold not. intros. omega.
      destruct (zerop v).
         left. auto.
         right. unfold not. intros. omega.

    destruct (sizeOfPType (P_Name c)).
      destruct (zerop v).
         left. auto.
         destruct (le_gt_dec b v).
            destruct (le_gt_dec v (e-n)).
                destruct (zerop b).
                  right. unfold not. intros.
                  destruct H.
                      subst. absurd_hyp l; omega.
                      destruct H. apply H; auto.
                  left. right. split; omega.
                right. unfold not. intros. omega.
            right. unfold not. intros. omega.
      destruct (zerop v).
         left. auto.
         right. unfold not. intros. omega.

    destruct (sizeOfPType (P_VoidPtr)).
      destruct (zerop v).
         left. auto.
         destruct (le_gt_dec b v).
            destruct (le_gt_dec v (e-n)).
                destruct (zerop b).
                  right. unfold not. intros.
                  destruct H.
                      subst. absurd_hyp l; omega.
                      destruct H. apply H; auto.
                  left. right. split; omega.
                right. unfold not. intros. omega.
            right. unfold not. intros. omega.
      destruct (zerop v).
         left. auto.
         right. unfold not. intros. omega.
Qed.

Lemma assertion_dataCast_true : forall t' d t,
  (~ isPtr t') ->
  assertion_dataCast t' d t.
Proof.
  intros.
  destruct d as [v [b e]].
  destruct t'; destruct t; unfold assertion_dataCast; simpl; auto.
  destruct q; auto.
    absurd_hyp H.
    unfold not. intros. apply H0. simpl. auto.
    apply H.

  destruct q; destruct q0; destruct p0; try solve [
    auto
    ].
    absurd_hyp H.
    unfold not. intros. apply H0. simpl. auto.
    apply H.
    
    absurd_hyp H.
    unfold not. intros. apply H0. simpl. auto.
    apply H.

    absurd_hyp H.
    unfold not. intros. apply H0. simpl. auto.
    apply H.

    absurd_hyp H.
    unfold not. intros. apply H0. simpl. auto.
    apply H.
Qed.

Lemma storeMemMeta_dec : forall E loc d,
  (exists m, storeMemMeta E loc d = Some m) \/ storeMemMeta E loc d = None.
Proof.
  intros.
  destruct (storeMemMeta E loc d).
    left. exists(m). auto.
    right. auto.
Qed.

Lemma storeMemMetaBlock_dec : forall E loc ds,
  (exists m, storeMemMetaBlock E loc ds = Some m) \/ storeMemMetaBlock E loc ds = None.
Proof.
  intros.
  destruct (storeMemMetaBlock E loc ds).
    left. exists(m). auto.
    right. auto.
Qed.

Lemma copyMemMetaBlock_dec : forall E ls ld n,
  (exists m, copyMemMetaBlock E ls ld n = Some m) \/ copyMemMetaBlock E ls ld n = None.
Proof.
  intros.
  destruct (copyMemMetaBlock E ls ld n).
    left. exists(m). auto.
    right. auto.
Qed.

Lemma isPtr_dec : forall t,
  isPtr t \/ ~isPtr t.
Proof.
  intros.
  destruct t. 
    simpl; try solve [left; auto | right; auto].
    destruct q; simpl; try solve [left; auto | right; auto].
Qed.  

Lemma storeMem_dec : forall E loc d,
  (exists m, storeMem E loc d = Some m) \/ storeMem E loc d = None.
Proof.
  intros.
  destruct (storeMem E loc d).
    left. exists(m). auto.
    right. auto.
Qed.

Lemma storeMemBlock_dec : forall E loc ds,
  (exists m, storeMemBlock E loc ds = Some m) \/ storeMemBlock E loc ds = None.
Proof.
  intros.
  destruct (storeMemBlock E loc ds).
    left. exists(m). auto.
    right. auto.
Qed.

(***************************************************************************)
(*                           Misc                                          *)
(***************************************************************************)
Lemma copyMemMetaZeroBlock : forall m l l',
  exists m', copyMemMetaBlock m l l' 0 = Some m'.
Proof.
  intros.
  assert (J:=accessMemMetaZeroBlock m l).
  destruct J as [r J].
  unfold copyMemMetaBlock.
  rewrite J.
  apply storeMemMetaZeroBlock; auto.
  apply accessMemMetaBlock__length in J; auto.
Qed.

Lemma copyMemZeroBlock : forall m l l',
  exists m', copyMemBlock m l l' 0 = Some m'.
Proof.
  intros.
  assert (J:=accessMemZeroBlock m l).
  destruct J as [r J].
  unfold copyMemBlock.
  rewrite J.
  apply storeMemZeroBlock; auto.
  apply accessMemBlock__length in J; auto.
Qed.

Lemma wf_AType__wf_subAType : forall s q id t',
  wf_AType  (A_Pointer (P_Struct s) q) ->
  getStructType s id = Some t' ->
  wf_AType  t'.
Proof.
  induction s; intros; simpl in H0; inversion H0. 
      inversion H; subst. 
         inversion H4; subst.
         inversion H3; subst.
         destruct (beq_nat c id).
            inversion H0; subst; auto.
            apply IHs with (q:=Safe) (id:=id); auto.
                apply wf_A_SafePointer; auto.
                   apply wf_P_Struct; auto.

         inversion H4; subst.
         inversion H3; subst.
         destruct (beq_nat c id).
            inversion H0; subst; auto.
            apply IHs with (q:=Seq) (id:=id); auto.
                apply wf_A_SeqPointer; auto.
                   apply wf_P_Struct; auto.

         inversion H5; subst.
         inversion H3; subst.
         destruct (beq_nat c id).
            inversion H0; subst; auto.
            apply IHs with (q:=Safe) (id:=id); auto.
                apply wf_A_SafePointer; auto.
                   apply wf_P_Struct; auto.
                   simpl. auto.
Qed.

Lemma wf_Struct__wf_subAType : forall s i t,
  wf_Struct s ->
  getStructNthType s i = Some t ->
  wf_AType  t.
Proof.
  intros.
  generalize dependent i.
  generalize dependent t.
  induction H; intros; simpl in *; auto.
    inversion H0.
    destruct i; eauto.
       inversion H1; subst; auto.
Qed.

Lemma wf_PType__wf_subAType : forall p i t,
  wf_PType  p ->
  getNthPType p i = Some t ->
  wf_AType  t.
Proof.
  intros.
  generalize dependent i.
  generalize dependent t.
  induction H; intros; simpl in *; auto.
    destruct i.
       inversion H0; subst; auto.
       inversion H0.
    eapply wf_Struct__wf_subAType; eauto.
    rewrite H in H1. eapply wf_Struct__wf_subAType; eauto.
    inversion H0.
Qed.

Lemma wf_lhs__wf_AType : forall E lhs t,
  wf_lhs E lhs t -> wf_AType  t.
Proof.
  intros.
  induction H; auto.
    inversion IHwf_lhs; subst; auto.
      inversion H2; subst; auto.
      inversion H2; subst; auto.
      inversion H3; subst; auto.

    apply wf_AType__wf_subAType with (t':=t') (id:=id) in IHwf_lhs; eauto.

    inversion IHwf_lhs; subst.
       inversion H5; subst; auto. 
       rewrite H4 in H0. inversion H0. subst.
       assert (wf_AType (A_Pointer (P_Struct s) Safe)). 
          apply wf_A_SafePointer; auto.
               apply wf_P_Struct; auto.
       apply wf_AType__wf_subAType with (t':=t') (id:=id) in H3; eauto.

       inversion H5; subst; auto. 
       rewrite H4 in H0. inversion H0. subst.
       assert (wf_AType (A_Pointer (P_Struct s) Safe)). 
          apply wf_A_SafePointer; auto.
               apply wf_P_Struct; auto.
       apply wf_AType__wf_subAType with (t':=t') (id:=id) in H3; eauto.

       inversion H6; subst; auto. 
       rewrite H4 in H0. inversion H0. subst.
       assert (wf_AType (A_Pointer (P_Struct s) Safe)). 
          apply wf_A_SafePointer; auto.
               apply wf_P_Struct; auto.
                  simpl. auto.
       apply wf_AType__wf_subAType with (t':=t') (id:=id) in H3; eauto.
Qed.

Lemma wf_rhs__wf_AType : forall E rhs t,
  wf_rhs E rhs t -> wf_AType  t.
Proof.
  intros.
  induction H; auto.
    apply wf_A_Int.
    apply wf_lhs__wf_AType in H; auto.
    apply wf_A_Int.
Qed.

Lemma sizeOfFields__non_zero : forall s,
  sizeOfStruct s >=0.
Proof.
  intros.
  induction s.
    simpl. omega.
    simpl. omega.
Qed.

Lemma struct__subfield : forall s id offset t',
  getStructOffset s id = Some offset ->
  getStructType s id = Some t' ->
  offset + sizeOfAType t' <= sizeOfStruct s.
Proof.
  induction s; intros.
    simpl in H. inversion H.
    simpl in *.
    destruct (beq_nat c id).
      inversion H. inversion H0. subst. clear H0 H.
      assert (J:=sizeOfFields__non_zero s).
      omega.

    remember (getStructOffset s id) as G.
    destruct G.
      apply sym_eq in HeqG.
      apply IHs with (t':=t') in HeqG; auto.
      inversion H. subst. clear H.
      omega.

      inversion H.
Qed.

Lemma struct__OffsetNthType : forall s id offset t',
  getStructOffset s id = Some offset ->
  getStructType s id = Some t' ->
  getStructNthType s offset = Some t'.
Proof.
  induction s; intros.
    simpl in H. inversion H.
    simpl in *.
    destruct (beq_nat c id).
      inversion H. inversion H0. subst. auto.

      remember (getStructOffset s id) as G.
      destruct G.
        apply sym_eq in HeqG.
        apply IHs with (t':=t') in HeqG; auto.
        inversion H. subst. clear H.
        rewrite sizeOfAType_one.
        assert (n+1 = S n). omega.
        rewrite H. auto.

        inversion H.
Qed.

Lemma  isTameStruct_inv : forall s id t,
  isTameStruct s ->
  getStructType s id = Some t ->
  isTameAType t.
Proof.
  induction s; intros.
    simpl in H0. inversion H0.
    simpl in *.
    destruct (beq_nat c id).
      inversion H0. subst. 
      inversion H; subst; auto.
 
      inversion H; subst.
      apply IHs with (id:=id); auto.
Qed.

Lemma wf_AType__some_size : forall p q,
   wf_AType (A_Pointer p q) ->
   q <> Safe ->
   exists size, sizeOfPType p = Some size.
Proof.
   intros.
   destruct q.
     absurd_hyp H0; auto.
     destruct p; simpl.
       exists (sizeOfAType a). auto.
       exists (sizeOfStruct s). auto.
       inversion H; subst. inversion H2; subst.
         rewrite H4. exists (sizeOfStruct s). auto.
       exists (1). auto.
     destruct p; simpl.
       exists (sizeOfAType a). auto.
       exists (sizeOfStruct s). auto.
       inversion H; subst. inversion H2; subst.
         rewrite H4. exists (sizeOfStruct s). auto.
       exists (1). auto.
Qed. 

Lemma wf_nontame_ref_lhs__wf_lhs : forall S lhs t,
   wf_nontame_ref_lhs S lhs t -> wf_lhs S lhs t.
Proof.
  intros.
  induction H.
    eapply WF_Var; eauto.
    eapply WF_StructPos; eauto.
    eapply WF_NamePos; eauto.
Qed.

Lemma wf_tame_ref_lhs__wf_lhs : forall S lhs t,
   wf_tame_ref_lhs S lhs t -> wf_lhs S lhs t.
Proof.
  intros.
  induction H.
    eapply WF_Var; eauto.
       apply wf_A_TamePointer; auto.
          apply isTamePType_VoidPtr.
          apply wf_P_VoidPtr.
    eapply WF_StructPos; eauto.
    eapply WF_NamePos; eauto.
Qed.

Lemma wf_PType__sizeOfType: forall p0, 
  wf_PType p0 ->
  exists s, sizeOfPType p0 = Some s.
Proof.
  intros.
  destruct p0; simpl.
    exists (sizeOfAType a). auto.
    exists (sizeOfStruct s). auto.

    inversion H; subst. rewrite H1.
    exists (sizeOfStruct s). auto.

    exists (1). auto.
Qed.

Lemma dataCast__valid : forall t' d t, 
  wf_AType  t ->
  exists d', dataCast t' d t = Some d'.
Proof.
  intros.
  destruct d as [v [b e]].
  destruct t'; destruct t; unfold dataCast; simpl; auto.
    exists (v, (b, e)). auto.
    exists (v, (b, e)). auto.

    destruct q.
      exists (0, (0, 0)). auto.
      exists (v, (0, 0)). auto.
      exists (v, (0, 0)). auto.

    destruct q; destruct q0; try solve [
      exists (v, (b, e)); auto |
      exists (v, (0, 0)); auto ].
      inversion H; subst.
      apply wf_PType__sizeOfType in H1.
      destruct H1 as [s H1]. rewrite H1.
      exists (v, (v, v+s)). auto.
Qed.

Require Import Zdiv.

Lemma mod_inv :  forall (s offset:Z),
  (s > 0)%Z ->
  (offset >= 0)%Z ->
  (offset < s)%Z ->
  Zmod offset s = offset.
Proof.
  intros s offset Hs Hoffset H.
  assert ((s/s >= offset / s)%Z).
     apply Z_div_ge; omega.
  assert ((s/s = 1)%Z).
     apply Z_div_same; auto.
  assert (K:=@Z_mod_lt offset s Hs).
  assert (J:=@Z_div_mod_eq offset s Hs).
  assert (offset >= 0)%Z as W. omega.
  assert (G:=@Z_div_ge0 offset s Hs W).
  assert ((offset / s = 0)%Z).
     rewrite H1 in H0.
     remember (offset / s)%Z as EQ.
     destruct (Z_lt_dec EQ 1).
       assert (EQ = 0)%Z; omega.

       assert (EQ = 1)%Z. omega.
       rewrite H2 in J.
       assert (s * 1 + offset mod s > s)%Z. omega.
       rewrite <- J in H3.
       absurd_hyp H3; omega.
  rewrite H2 in J.
  omega.
Qed.

Lemma Z_of_nat__nat_of_Z:
  forall z, (z >= 0)%Z -> Z_of_nat (nat_of_Z z) = z.
Proof.
  intros. destruct z; simpl.
  auto.
  symmetry. apply Zpos_eq_Z_of_nat_o_nat_of_P.
  compute in H. congruence.
Qed.

Lemma nat_of_Z__Z_of_nat : forall n,
  n >= 0 ->
  nat_of_Z (Z_of_nat n) = n.
Proof.
  intros. destruct n; simpl.
  auto.
  apply nat_of_P_o_P_of_succ_nat_eq_succ.
Qed.

Lemma mmod_inv : forall s loc offset,
  s > 0 ->
  offset < s ->
  mmod (loc + offset) loc s = Some offset.
Proof.
  intros.
  unfold mmod.
  destruct s.
    absurd_hyp H; omega.
    destruct (le_lt_dec loc (loc + offset)).
      assert (loc+offset-loc = offset). omega.
      rewrite H1.
      rewrite  mod_inv.
        rewrite nat_of_Z__Z_of_nat; auto.
          omega.
        rewrite inj_S. omega.

        assert (Z_of_nat 0 = 0)%Z. auto.
        rewrite <- H2.
        apply inj_ge; auto.
          omega.
        rewrite inj_S. omega.

      absurd_hyp l; omega.
Qed.

Lemma le_ge__eq : forall (i j:nat),
   i <= j ->
   j <= i ->
   i = j.
Proof.
  induction i; destruct j; intros; auto.
    absurd_hyp H0; omega.
    absurd_hyp H; omega.

    assert (i<=j). omega.
    assert (j<=i). omega.
    assert (i=j). auto.
    subst; auto.
Qed.

Lemma omega_ex1 : forall a b c d,
  d <= a <= b - c ->
  c > 0 ->
  d <> 0 ->
  (b > c /\ a < b).
Proof.
  induction a; intros.
    assert (d = 0). clear H1. omega.
    subst. absurd_hyp H1; auto.

    destruct (le_lt_dec b c).
      assert (b - c = 0). omega.
      rewrite H2 in H.
      absurd_hyp H; omega.

      split; omega.
Qed.      


