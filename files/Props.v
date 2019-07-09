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
Require Import Mult.
Require Import Types.
Require Import Envs.
Require Import CSyntax.
Require Import CSemantics.
Require Import Axioms.
Require Import Libs.

(*
Axiom skip : False.
Ltac skip := assert False; [ apply skip | contradiction ].
*)

(**********************************************************)
(*                        wfEnv                           *)
(**********************************************************)
Lemma wfE_lookUp_validAddresses : forall M S TI v l t,
  wfEnv (MkEnv M S TI)  ->
  lookUpStack S v = Some (l, t) ->
  validAddresses M (l) (sizeOfAType t) 
  .
Proof.
  intros.
  unfold wfEnv in H. decompose [and] H. clear H.
   destruct (@H4 v l t H0); auto.   
Qed.

Lemma lhs__wft :  forall S lhs t E M TI l, 
  s_lhs E lhs (RLoc l) t ->
  E = MkEnv M S TI ->  wfEnv E -> 
  wf_AType t.
Proof.
  intros until 1.
  remember (RLoc l) as R.
  generalize dependent M.
  generalize dependent S.
  generalize dependent TI.
  generalize dependent l.
  induction H; intros; inversion HeqR; subst; simpl in *; auto.
    apply IHs_lhs with (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in H3; auto.
      inversion H3; subst.
         inversion H5; auto.
         inversion H5; auto.
         inversion H6; auto.
    unfold Error in H0. destruct H0; inversion H0.
    apply IHs_lhs with (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in H5; auto.
      apply wf_AType__wf_subAType with (t':=t') (id:=id) in H5; eauto.
    unfold Error in H0. destruct H0; inversion H0.
    apply IHs_lhs with (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in H6; auto.
       inversion H6; subst.
         inversion H8; subst.
         rewrite H7 in H1. inversion H1. subst.
         assert (wf_AType (A_Pointer (P_Struct s) Safe)). 
            apply wf_A_SafePointer; auto.
              apply wf_P_Struct; auto.
         apply wf_AType__wf_subAType with (t':=t') (id:=id) in H5; eauto.

         inversion H8; subst.
         rewrite H7 in H1. inversion H1. subst.
         assert (wf_AType (A_Pointer (P_Struct s) Safe)). 
            apply wf_A_SafePointer; auto.
              apply wf_P_Struct; auto.
         apply wf_AType__wf_subAType with (t':=t') (id:=id) in H5; eauto.

         inversion H9; subst.
         rewrite H7 in H1. inversion H1. subst.
         assert (wf_AType (A_Pointer (P_Struct s) Safe)). 
            apply wf_A_SafePointer; auto.
              apply wf_P_Struct; auto.
                simpl; auto.
         apply wf_AType__wf_subAType with (t':=t') (id:=id) in H5; eauto.
    unfold Error in H0. destruct H0; inversion H0.
Qed.

Lemma lhs__ptrInvariant :  forall S lhs t E M TI l, 
  s_lhs E lhs (RLoc l) t ->
  E = MkEnv M S TI ->  wfEnv E -> 
  (forall p, t = A_Pointer p Safe -> atypeEqual (E.(typeInfo) l) (A_Pointer p Safe)) /\
  (forall p, t = A_Pointer p Seq -> atypeEqual (E.(typeInfo) l) (A_Pointer p Seq)) /\
  (forall p, t = A_Pointer p Tame -> exists q, atypeEqual (E.(typeInfo) l) (A_Pointer q Tame)) /\
  (t = A_Int -> atypeEqual (E.(typeInfo) l) (A_Int) \/ exists q, atypeEqual (E.(typeInfo) l) (A_Pointer q Tame))
  .
Proof.
  intros until 1.
  remember (RLoc l) as R.
  generalize dependent M.
  generalize dependent S.
  generalize dependent TI.
  generalize dependent l.
  induction H; intros; inversion HeqR; subst; simpl in *.
     clear HeqR.
     unfold wfEnv in H2. decompose [and] H2. clear H2.
     apply H5 in H; auto.  decompose [and] H. clear H.
     simpl in *. 
     assert (l0 + 0 = l0). omega. rewrite <- H. clear H.
     split; intros. subst t; auto; omega.
     split; intros. subst t; auto; omega.
     split; intros. exists(p). subst t; auto; omega.
                        subst t; auto; omega.

     clear HeqR. assert (J:=H3). 
     destruct q.
     (*Safe*)
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H3. decompose [and] H3. clear H3. 
       unfold wfMem in H2. simpl in *.
       assert (JJ:= @H2 loc). clear H2.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (A_Pointer (P_AType t) Safe = A_Pointer (P_AType t) Safe) as EQ. auto.
       apply J1 in EQ. inversion EQ; subst.
       rename H7 into JpEq.
       rewrite <- H2 in *. clear H2.
       inversion JpEq; subst.
       unfold assertion_ptr in H1.
       destruct JJ.
           decompose [and] H2; subst. clear H2.
           rewrite sizeOfAType_one in *.
           assert (0<=0<1). omega.
           apply H10 in H2. destruct H2.
           assert (l+0=l). omega. rewrite H11 in H9.
           split; intros. subst t. apply atypeEqual_trans with (a':=t1); auto.
           split; intros. subst t. apply atypeEqual_trans with (a':=t1); auto.
           split; intros. exists(p). subst t. apply atypeEqual_trans with (a':=t1); auto.
                              subst t. left. apply atypeEqual_trans with (a':=t1); auto. 
  
           absurd_hyp H2; auto.
     (*Seq*)
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H3. decompose [and] H3. clear H3. 
       unfold wfMem in H2. simpl in *.
       assert (JJ:= @H2 loc). clear H2.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (A_Pointer (P_AType t) Seq = A_Pointer (P_AType t) Seq) as EQ. auto.
       apply J2 in EQ. inversion EQ; subst.
       rename H7 into JpEq.
       rewrite <- H2 in *. clear H2.
       inversion JpEq; subst. rename H4 into JaEq.
       unfold assertion_ptr in H1. destruct H1; subst.
       destruct JJ.
           decompose [and] H3; subst. clear H3.
           destruct H10 as [s H10]. decompose [and] H10; subst. clear H10.
           rewrite sizeOfAType_one in *.
           assert (b<=l<e). omega.
           apply H13 in H7. destruct H7.
           destruct H10 as [j [HA HB]].
           split; intros.
              subst t.
              simpl in HB.
              destruct j.
                  inversion HB; subst. apply atypeEqual_trans with (a':=t1); auto.
                  inversion HB.

           split; intros.
              subst t.
              simpl in HB.
              destruct j.
                  inversion HB; subst. apply atypeEqual_trans with (a':=t1); auto.
                  inversion HB.
  
           split; intros.
              subst t.
              simpl in HB.
              destruct j.
                  inversion HB. exists(p). subst. apply atypeEqual_trans with (a':=t1); auto.
                  inversion HB.


              subst t. 
              simpl in HB.
              destruct j.
                  inversion HB. left. apply atypeEqual_trans with (a':=t1); auto. 
                  inversion HB.

           absurd_hyp H1; auto.
     (*Tame*)
       split; intros. subst.
       apply lhs__wft with (M:=M) (S:=S) (TI:=TI) in H; auto.
          inversion H. inversion H4; subst. inversion H7.

       split; intros. subst.
       apply lhs__wft with (M:=M) (S:=S) (TI:=TI) in H; auto.
          inversion H. inversion H4; subst. inversion H7.

       split; intros. 
       subst.
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H3. decompose [and] H3. clear H3. 
       unfold wfMem in H2. simpl in *.
       assert (JJ:= @H2 loc). clear H2.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
         eapply J3; eauto.
       destruct H2 as [q H2].
       inversion H2; subst.
       rename H8 into JpEq.
       rewrite <- H3 in *. clear H3.
       rename H2 into JaEq.
       unfold assertion_ptr in H1. destruct H1; subst.
       destruct JJ.
             decompose [and] H3; subst. clear H3.
             rewrite sizeOfAType_one in *.
             assert (b<=l<e). omega.
             apply H10 in H3. destruct H3. auto.

             absurd_hyp H1; auto.

       subst.
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H3. decompose [and] H3. clear H3. 
       unfold wfMem in H2. simpl in *.
       assert (JJ:= @H2 loc). clear H2.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
         eapply J3; eauto.
       destruct H2 as [q H2].
       inversion H2; subst.
       rename H8 into JpEq.
       rewrite <- H3 in *. clear H3.
       rename H2 into JaEq.
       unfold assertion_ptr in H1. destruct H1; subst.
       destruct JJ.
           decompose [and] H3; subst. clear H3.
           rewrite sizeOfAType_one in *.
           assert (b<=l<e). omega.
           apply H10 in H3. destruct H3. auto.

           absurd_hyp H1; auto.

     unfold Error in H0. destruct H0; inversion H0.

     clear HeqR. assert (J:=H5). 
     destruct q.
     (* Safe *)
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H5. decompose [and] H5. clear H5. 
       unfold wfMem in H4. simpl in *.
       assert (JJ:= @H4 loc). clear H4.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (A_Pointer (P_Struct s) Safe = A_Pointer (P_Struct s) Safe) as EQ. auto.
       apply J1 in EQ. inversion EQ; subst.
       rename H9 into JpEq.
       rewrite <- H4 in *. clear H4.
       inversion JpEq; subst.
       unfold assertion_ptr in H3.
       destruct JJ.
         decompose [and] H4; subst. clear H4.
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H2; auto.
           rewrite sizeOfAType_one in *.
           simpl in H2. omega.
         assert (JsEq:=H6).
         apply structEqual_symm in H6.
         apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in H6; auto.
         rewrite H6 in *.
         apply H12 in H4. destruct H4.
         assert (getStructType s id = getStructNthType s offset).
            assert (JJ:=H2).
            apply struct__OffsetNthType with (offset:=offset) in H2; auto.
            rewrite H2; auto.
         assert (EQ':=@structEqual__getStructNthPType s1 s offset JsEq).
         rewrite H13 in H2. rewrite H2 in EQ'.
         split; intros. subst.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Safe)) in H11; auto.
                inversion H11; auto.
         split; intros; subst.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Seq)) in H11; auto.
                inversion H11; auto.
         split; intros; subst.
                exists(p).
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Tame)) in H11; auto.
                inversion H11; auto.

                subst. left.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Int)) in H11; auto.
                inversion H11; auto.

         absurd_hyp H4; auto.
     (* Seq *)
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H5. decompose [and] H5. clear H5. 
       unfold wfMem in H4. simpl in *.
       assert (JJ:= @H4 loc). clear H4.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (A_Pointer (P_Struct s) Seq = A_Pointer (P_Struct s) Seq) as EQ. auto.
       apply J2 in EQ. inversion EQ; subst.
       rename H9 into JpEq.
       rewrite <- H4 in *. clear H4.
       inversion JpEq; subst.
       assert (JsEq:=H6).
       apply structEqual_symm in H6.
       apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in H6; auto.
       unfold assertion_ptr in H3. destruct H3; subst.
       destruct JJ.
         decompose [and] H5; subst. clear H5.
         destruct H13 as [s0 H13]. decompose [and] H13; subst. clear H13.
         assert (KJ := @struct__subfield s id offset t' H1 H2).
         rewrite sizeOfAType_one in *.
         assert (b<=loc'+offset<e). omega.
         apply H16 in H10. destruct H10.
         destruct H13 as [j [HA HB]].
         split; intros.
              subst t'.
              simpl in HB.
              simpl in H5. inversion H5; subst. clear H5.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H2; auto.
                 rewrite sizeOfAType_one in *.
                 simpl in H2. omega.
              assert (offset<sizeOfStruct s). omega.
              rewrite H6 in *.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j (A_Pointer p Safe) H1 H2).
              assert (EQ':=@structEqual__getStructNthPType s1 s j JsEq).
              rewrite K in EQ'. 
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Safe)) in HB; auto.
              inversion HB; auto.

         split; intros.
              subst t'.
              simpl in HB.
              simpl in H5. inversion H5; subst. clear H5.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H2; auto.
                 rewrite sizeOfAType_one in *.
                 simpl in H2. omega.
              assert (offset<sizeOfStruct s). omega.
              rewrite H6 in *.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j (A_Pointer p Seq) H1 H2).
              assert (EQ':=@structEqual__getStructNthPType s1 s j JsEq).
              rewrite K in EQ'.
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Seq)) in HB; auto.
              inversion HB; auto.

         split; intros.
              subst t'.
              simpl in HB.
              simpl in H5. inversion H5; subst. clear H5.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H2; auto.
                 rewrite sizeOfAType_one in *.
                 simpl in H2. omega.
              assert (offset<sizeOfStruct s). omega.
              rewrite H6 in *.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j (A_Pointer p Tame) H1 H2).
              assert (EQ':=@structEqual__getStructNthPType s1 s j JsEq).
              rewrite K in EQ'.
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Tame)) in HB; auto.
              inversion HB; subst.
              exists(p); auto.

              subst t'.
              simpl in HB.
              simpl in H5. inversion H5; subst. clear H5.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H2; auto.
                 rewrite sizeOfAType_one in *.
                 simpl in H2. omega.
              assert (offset<sizeOfStruct s). omega.
              rewrite H6 in *.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j A_Int H1 H2).
              assert (EQ':=@structEqual__getStructNthPType s1 s j JsEq).
              rewrite K in EQ'. 
              apply optionAtypeEqual_trans with (ot'':=Some (A_Int)) in HB; auto.
              left. inversion HB; auto.

         absurd_hyp H3; auto.
     (* Tame *)
       split; intros. subst.
       apply lhs__wft with (M:=M) (S:=S) (TI:=TI) in H; auto.
          inversion H. inversion H6; subst. 
          apply isTameStruct_inv in H2; auto.
          inversion H2.

       split; intros. subst.
       apply lhs__wft with (M:=M) (S:=S) (TI:=TI) in H; auto.
          inversion H. inversion H6; subst.
          apply isTameStruct_inv in H2; auto.
          inversion H2.

       split; intros. subst.
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H5. decompose [and] H5. clear H5. 
       unfold wfMem in H4. simpl in *.
       assert (JJ:= @H4 loc). clear H4.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
         eapply J3; eauto.
       destruct H4 as [q H4].
       inversion H4; subst. rename H10 into JpEq.
       rewrite <- H5 in JJ.
       unfold assertion_ptr in H3. destruct H3; subst.
       destruct JJ.
           decompose [and] H9; subst. clear H9.
           assert (b<=loc'+offset<e). 
             assert (K := @struct__subfield s id offset (A_Pointer p Tame) H1 H2).
             rewrite sizeOfAType_one in *.
             omega.
           apply H14 in H9. destruct H9. auto.

           absurd_hyp H3; auto.

       subst.
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H5. decompose [and] H5. clear H5. 
       unfold wfMem in H4. simpl in *.
       assert (JJ:= @H4 loc). clear H4.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
         eapply J3; eauto.
       destruct H4 as [q H4].
       inversion H4; subst. rename H10 into JpEq.
       rewrite <- H5 in JJ.
       unfold assertion_ptr in H3. destruct H3; subst.
       destruct JJ.
           decompose [and] H9; subst. clear H9.
           assert (b<=loc'+offset<e). 
             assert (K := @struct__subfield s id offset (A_Int) H1 H2).
             rewrite sizeOfAType_one in *.
             omega.
           apply H14 in H9. destruct H9. auto.

           absurd_hyp H3; auto.

     unfold Error in H0. destruct H0; inversion H0.

     clear HeqR. assert (J:=H6). 
     destruct q.
     (*Safe*)
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto. 
       destruct J as [J1 [J2 J3]].
       unfold wfEnv in H6. decompose [and] H6. clear H6. 
       unfold wfMem in H5. simpl in *.
       assert (JJ:= @H5 loc). clear H5.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (A_Pointer (P_Name n) Safe = A_Pointer (P_Name n) Safe) as EQ. auto.
       apply J1 in EQ. inversion EQ; subst.
       rename H10 into JpEq.
       rewrite <- H5 in *. clear H5.
       inversion JpEq; subst.
       (* name_name *)
       unfold assertion_ptr in H4. rewrite H1 in H4.
       destruct JJ.
         destruct H5 as [ss H5]. 
         decompose [and] H5; subst. clear H5.
         rewrite H10 in H6. inversion H6; subst.
         rewrite H7 in H1. inversion H1; subst.
         assert (JsEq:=H11).
         apply structEqual_symm in H11.
         apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in H11; auto.
         rewrite <- H11 in *.
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H3; auto.
           rewrite sizeOfAType_one in *.
           simpl in H3. omega.
         apply H16 in H5. destruct H5.
         assert (getStructType s id = getStructNthType s offset) as EQ'.
            assert (JJ:=H3).
            apply struct__OffsetNthType with (offset:=offset) in H3; auto.
            rewrite H3; auto.
         assert (EQ0:=@structEqual__getStructNthPType s1 s offset JsEq).
         rewrite EQ' in H3. rewrite H3 in EQ0.
         split; intros. subst.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Safe)) in H15; auto.
                inversion H15; auto.
         split; intros; subst.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Seq)) in H15; auto.
                inversion H15; auto.
         split; intros; subst.
                exists(p).
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Tame)) in H15; auto.
                inversion H15; auto.

                subst. left.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Int)) in H15; auto.
                inversion H15; auto.

         absurd_hyp H5; auto.
       (* eq_name *)
       unfold assertion_ptr in H4. rewrite H1 in H4.
       destruct JJ.
         destruct H5 as [ss H5]. 
         decompose [and] H5; subst. clear H5.
         rewrite H1 in H6. inversion H6; subst.
         clear JpEq EQ H6.
         assert (0<=offset<sizeOfStruct ss).
           apply struct__subfield with (offset:=offset) in H3; auto.
           rewrite sizeOfAType_one in *.
           simpl in H3. omega.
         apply H13 in H5. destruct H5.
         assert (getStructType ss id = getStructNthType ss offset) as EQ'.
            assert (JJ:=H3).
            apply struct__OffsetNthType with (offset:=offset) in H3; auto.
            rewrite H3; auto.
         rewrite EQ' in H3.
         split; intros. subst.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Safe)) in H6; auto.
                  inversion H6; auto.
                  rewrite H3. apply optionAtypeEqual_refl.
         split; intros; subst.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Seq)) in H6; auto.
                  inversion H6; auto.
                  rewrite H3. apply optionAtypeEqual_refl.
         split; intros; subst.  
                exists(p).
                apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Tame)) in H6; auto.
                  inversion H6; auto.
                  rewrite H3. apply optionAtypeEqual_refl.

                subst. left.
                apply optionAtypeEqual_trans with (ot'':=Some (A_Int)) in H6; auto.
                  inversion H6; auto.
                  rewrite H3. apply optionAtypeEqual_refl.

         absurd_hyp H5; auto.
     (* Seq *)
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 J3]].
       unfold wfEnv in H6. decompose [and] H6. clear H6. 
       unfold wfMem in H5. simpl in *.
       assert (JJ:= @H5 loc). clear H5.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (A_Pointer (P_Name n) Seq = A_Pointer (P_Name n) Seq) as EQ. auto.
       apply J2 in EQ. inversion EQ; subst.
       rename H10 into JpEq.
       rewrite <- H5 in *. clear H5.
       (* name_name *)
       inversion JpEq; subst.
       assert (JsEq:=H11).
       apply structEqual_symm in H11.
       apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H11; auto.
       unfold assertion_ptr in H4.  rewrite H1 in H4. destruct H4; subst.
       destruct JJ.
         decompose [and] H10; subst. clear H10.
         destruct H16 as [s0 H16]. decompose [and] H16; subst. clear H16.
         assert (KJ := @struct__subfield s id offset t' H2 H3).
         assert (b<=loc'+offset<e). 
           rewrite sizeOfAType_one in *.
           omega.
         apply H19 in H13. destruct H13.
         destruct H16 as [j [HA HB]].
         split; intros. 
              subst t'.
              simpl in HB. rewrite H6 in HB.
              rewrite H1 in H7. inversion H7; subst. clear H7.
              simpl in H10. rewrite H6 in H10. inversion H10; subst. clear H17.
              assert (0<=offset<sizeOfStruct s2).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s1). omega.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H18 H16).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s2 id j (A_Pointer p Safe) H2 H3).
              assert (EQ0:=@structEqual__getStructNthPType s1 s2 j JsEq).
              rewrite K in EQ0. 
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Safe)) in HB; auto.
              inversion HB; auto.

         split; intros. 
              subst t'.
              simpl in HB. rewrite H6 in HB.
              rewrite H1 in H7. inversion H7; subst. clear H7.
              simpl in H10. rewrite H6 in H10. inversion H10; subst. clear H17.
              assert (0<=offset<sizeOfStruct s2).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s1). omega.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H18 H16).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s2 id j (A_Pointer p Seq) H2 H3).
              assert (EQ0:=@structEqual__getStructNthPType s1 s2 j JsEq).
              rewrite K in EQ0. 
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Seq)) in HB; auto.
              inversion HB; auto.

         split; intros. 
              subst t'.
              simpl in HB. rewrite H6 in HB.
              rewrite H1 in H7. inversion H7; subst.
              simpl in H10. rewrite H6 in H10. inversion H10; subst. clear H10.
              assert (0<=offset<sizeOfStruct s1).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s1). omega.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H18 H16).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s2 id j (A_Pointer p Tame) H2 H3).
              assert (EQ0:=@structEqual__getStructNthPType s1 s2 j JsEq).
              rewrite K in EQ0.
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Tame)) in HB; auto.
              inversion HB; subst.
              exists(p); auto.

              subst t'. left.
              simpl in HB. rewrite H6 in HB.
              rewrite H1 in H7. inversion H7; subst. clear H7.
              simpl in H10. rewrite H6 in H10. inversion H10; subst. clear H17.
              assert (0<=offset<sizeOfStruct s2).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s1). omega.
              assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H18 H16).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s2 id j (A_Int) H2 H3).
              assert (EQ0:=@structEqual__getStructNthPType s1 s2 j JsEq).
              rewrite K in EQ0. 
              apply optionAtypeEqual_trans with (ot'':=Some (A_Int)) in HB; auto.
              inversion HB; auto.

         absurd_hyp H10; auto.
       (* eq_name *)
       clear EQ JpEq.
       unfold assertion_ptr in H4.  rewrite H1 in H4. destruct H4; subst.
       destruct JJ as [ H6 | JJ].
         decompose [and] H6; subst. clear H6.
         destruct H13 as [s0 H13]. decompose [and] H13; subst. clear H13.
         assert (KJ := @struct__subfield s id offset t' H2 H3).
         assert (b<=loc'+offset<e). 
           rewrite sizeOfAType_one in *.
           omega.
         apply H16 in H10. destruct H10.
         destruct H13 as [j [HA HB]].
         split; intros. 
              subst t'.
              simpl in HB. rewrite H1 in HB.
              simpl in H6. rewrite H1 in H6. inversion H6; subst. clear H6.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s). omega.
              assert (J:=@mmod_inv (sizeOfStruct s) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j (A_Pointer p Safe) H2 H3).
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Safe)) in HB; auto.
                inversion HB; auto.
                rewrite K. apply optionAtypeEqual_refl.

         split; intros. 
              subst t'.
              simpl in HB. rewrite H1 in HB.
              simpl in H6. rewrite H1 in H6. inversion H6; subst. clear H6.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s). omega.
              assert (J:=@mmod_inv (sizeOfStruct s) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j (A_Pointer p Seq) H2 H3).
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Seq)) in HB; auto.
                inversion HB; auto.
                rewrite K. apply optionAtypeEqual_refl.

         split; intros. 
              subst t'.
              simpl in HB. rewrite H1 in HB.
              simpl in H6. rewrite H1 in H6. inversion H6; subst. clear H6.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s). omega.
              assert (J:=@mmod_inv (sizeOfStruct s) loc' offset H15 H13).
              rewrite HA in J. inversion J; subst.
              assert (K:=@struct__OffsetNthType
                                     s id offset (A_Pointer p Tame) H2 H3).
              apply optionAtypeEqual_trans with (ot'':=Some (A_Pointer p Tame)) in HB; auto.
                inversion HB; subst.
                exists(p). auto.

                rewrite K. apply optionAtypeEqual_refl.

              subst t'. left.
              simpl in HB. rewrite H1 in HB.
              simpl in H6. rewrite H1 in H6. inversion H6; subst. clear H6.
              assert (0<=offset<sizeOfStruct s).
                 apply struct__subfield with (offset:=offset) in H3; auto.
                 simpl in H3. omega.
              assert (offset<sizeOfStruct s). omega.
              assert (J:=@mmod_inv (sizeOfStruct s) loc' offset H15 H13).
              rewrite J in HA. inversion HA. subst.
              assert (K:=@struct__OffsetNthType
                                     s id j (A_Int) H2 H3).
              apply optionAtypeEqual_trans with (ot'':=Some (A_Int)) in HB; auto.
                inversion HB; auto.
                rewrite K. apply optionAtypeEqual_refl.

         absurd_hyp JJ; auto.
     (*Tame*)
       split; intros. subst.
       apply lhs__wft with (M:=M) (S:=S) (TI:=TI) in H; auto.
          inversion H. inversion H7; subst.
          rewrite H1 in H10. inversion H10; subst.
          apply isTameStruct_inv in H3; auto.
          inversion H3.

       split; intros. subst.
       apply lhs__wft with (M:=M) (S:=S) (TI:=TI) in H; auto.
          inversion H. inversion H7; subst.
          rewrite H1 in H10. inversion H10; subst.
          apply isTameStruct_inv in H3; auto.
          inversion H3.

       split; intros. subst.
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H6. decompose [and] H6. clear H6. 
       unfold wfMem in H5. simpl in *.
       assert (JJ:= @H5 loc). clear H5.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
         eapply J3; eauto.
       destruct H5 as [q H5].
       inversion H5; subst. rename H11 into JpEq.
       rewrite <- H6 in JJ.
       unfold assertion_ptr in H4. rewrite H1 in H4. destruct H4; subst.
       destruct JJ.
           decompose [and] H10; subst. clear H10.
           assert (b<=loc'+offset<e). 
             assert (K := @struct__subfield s id offset (A_Pointer p Tame) H2 H3).
             rewrite sizeOfAType_one in *.
             omega.
           apply H15 in H10. destruct H10. auto.

           absurd_hyp H10; auto.

       subst.
       apply IHs_lhs with  (M0:=M) (S0:=S) (TI0:=TI) (l:=loc) in J; auto.
       destruct J as [J1 [J2 [J3 J4]]].
       unfold wfEnv in H6. decompose [and] H6. clear H6. 
       unfold wfMem in H5. simpl in *.
       assert (JJ:= @H5 loc). clear H5.
       rewrite H0 in JJ. unfold wfData in JJ. destruct be' as [b e].
       assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
         eapply J3; eauto.
       destruct H5 as [q H5].
       inversion H5; subst. rename H11 into JpEq.
       rewrite <- H6 in JJ.
       unfold assertion_ptr in H4. rewrite H1 in H4. destruct H4; subst.
       destruct JJ.
           decompose [and] H10; subst. clear H10.
           assert (b<=loc'+offset<e). 
             assert (K := @struct__subfield s id offset (A_Int) H2 H3).
             rewrite sizeOfAType_one in *.
             omega.
           apply H15 in H10. destruct H10. auto.

           absurd_hyp H10; auto.

       unfold Error in H0. destruct H0; inversion H0.
Qed.

Lemma lhs__inversion :  forall S lhs t E M TI l, 
  s_lhs E lhs (RLoc l) t ->
  E = MkEnv M S TI ->  wfEnv E -> 
  validAddresses M l (sizeOfAType t) /\ 
  ((l <> 0 /\ l >= baseAddress /\ l+sizeOfAType t < maxAddress))
  .
Proof.
  intros until 1.
  remember (RLoc l) as R.
  generalize dependent M.
  generalize dependent l.
  induction H; intros; inversion HeqR; subst.    
    split. 
     intros.
     apply wfE_lookUp_validAddresses with (S:=S) (TI:=TI) (v:=v) (t:=t); auto.

     unfold wfEnv in H2. decompose [and] H2. clear H2.
     unfold wfStack in H4. decompose [and] H4. clear H4.
     apply H2 in H; auto. simpl in *. decompose [and] H. clear H.
     assert (J:=validAddressRange).
     split; omega.
    
    unfold assertion_ptr in H1. destruct be' as [b e]. 
    clear HeqR. assert (JJ:=H3).
    unfold wfEnv in H3. decompose [and] H3. clear H3.
    unfold wfStack in H5. decompose [and] H5. clear H5.
    unfold wfMem in H2. simpl in *.
    assert (J:=@H2 (loc)). clear H2.
    rewrite H0 in J.
    destruct q.
    (*q=Safe*)
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]].
    simpl in *. 
    assert (A_Pointer (P_AType t) Safe =  A_Pointer (P_AType t) Safe) as EQ. auto.
    apply J1 in EQ.
    inversion EQ; subst. rename H5 into JpEq.
    rewrite <- H in J. clear H.
    inversion JpEq; subst. rename H4 into JaEq.
    destruct J.
      decompose [and] H. clear H.
      rewrite sizeOfAType_one in *.
      split. 
        apply validAddress__validAddresses.
          assert (l+0=l). omega. rewrite <- H.
          assert (0<=0<1). omega.
          apply H11 in H10. destruct H10; auto.

          intros. 
          apply H11 in H. destruct H; auto.

        assert (K:=validAddressRange).
        split; try omega.
      absurd_hyp H; auto.
    (*q=Seq*)
    decompose [and] H1; clear H1; subst; auto.
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    unfold wfData in J.
    assert (A_Pointer (P_AType t) Seq =  A_Pointer (P_AType t) Seq) as EQ. auto.
    apply J2 in EQ.
    inversion EQ; subst. rename H11 into JpEq.
    rewrite <- H in J. clear H.
    inversion JpEq; subst. rename H4 into JaEq.
    destruct J.
       decompose [and] H. clear H.
      rewrite sizeOfAType_one in *.
       destruct H13 as [s H13]. decompose [and] H13. clear H13.
          split.
           apply validAddress__validAddresses.
             assert (b<=l<e). omega.
             apply H16 in H4. destruct H4. auto.

             intros.
             assert (b<=l+i<e). omega.
             apply H16 in H13. destruct H13. auto.

           assert (K:=validAddressRange).
           split; try omega.

         absurd_hyp H2; auto.
    (*q=Tame*)
    decompose [and] H1; clear H1; subst; auto.
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    unfold wfData in J.
    assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
       eapply J3; eauto.
    destruct H as [q H].
    inversion H; subst. rename H12 into JpEq.
    rewrite <- H1 in J. clear H1. 
     (*q=Tame*)
      destruct J.
       decompose [and] H1. clear H1.
          split.
           apply validAddress__validAddresses.
             rewrite sizeOfAType_one in *.
             assert (b<=l<e). omega.
             apply H14 in H1. destruct H1; auto.

             intros.
             assert (b<=l+i<e). omega.
             apply H14 in H11. destruct H11; auto.

           assert (K:=validAddressRange).
           split; try omega.

         absurd_hyp H2; auto.

    unfold Error in H0. destruct H0; inversion H0.

    unfold assertion_ptr in H3. destruct be' as [b e]. 
    clear HeqR. assert (JJ:=H5).
    unfold wfEnv in H5. decompose [and] H5. clear H5.
    unfold wfMem in H4. simpl in *.
    assert (J:=@H4 (loc)). clear H4.
    rewrite H0 in J.
    destruct q.
    (*q=Safe*)
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]].
    simpl in *. 
    assert (A_Pointer (P_Struct s) Safe =  A_Pointer (P_Struct s) Safe) as EQ. auto.
    apply J1 in EQ.
    inversion EQ; subst. rename H6 into JpEq.
    rewrite <- H in J. clear H.
    inversion JpEq; subst. rename H5 into JsEq.
    destruct J.
      decompose [and] H. clear H.
      split. 
        apply validAddress__validAddresses.
          assert (0<=offset<sizeOfStruct s).
             apply struct__subfield with (offset:=offset) in H2; auto.
             rewrite sizeOfAType_one in H2. simpl in H2. omega.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in JsEq; auto.
          rewrite JsEq in *.
          apply H10 in H. destruct H; auto.

          intros.
          assert (0<= offset + i < sizeOfStruct s).
             apply struct__subfield with (offset:=offset) in H2; auto.
             rewrite sizeOfAType_one in *. simpl in H2. omega.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in JsEq; auto.
          rewrite JsEq in *.
          apply H10 in H9. destruct H9.
          assert (loc'+(offset+i) =loc' + offset + i). omega.
          rewrite H12 in H9. auto.

        assert (K:=validAddressRange).
        split; try omega.
        assert (offset + sizeOfAType t' <= sizeOfStruct s).
            apply struct__subfield with (id:=id); auto.
        apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in JsEq; auto.
        rewrite JsEq in *.
        omega.

      absurd_hyp H; auto.
    (*q=Seq*)
    decompose [and] H3; clear H3; subst; auto.
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    unfold wfData in J.
    assert (A_Pointer (P_Struct s) Seq =  A_Pointer (P_Struct s) Seq) as EQ. auto.
    apply J2 in EQ.
    inversion EQ; subst. rename H10 into JpEq.
    rewrite <- H in J. clear H.
    inversion JpEq; subst. rename H5 into JsEq.
        destruct J.
          decompose [and] H. clear H.
          destruct H12 as [ss H12]. decompose [and] H12. clear H12.
          assert (KJ := @struct__subfield s id offset t' H1 H2).
          split.
           apply validAddress__validAddresses.
             assert (b<=loc'+offset<e). 
               rewrite sizeOfAType_one in *.
               omega.
             apply H15 in H5. destruct H5. auto.

             intros.
             assert (b<=loc'+offset + i<e). omega.
             apply H15 in H12. destruct H12. auto.

           assert (K:=validAddressRange).
           split; try omega.

         absurd_hyp H4; auto.
    (*q=Tame*)
    decompose [and] H3; clear H3; subst; auto.
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
       eapply J3; eauto.
    destruct H as [q H].
    inversion H; subst. rename H11 into JpEq.
    rewrite <- H3 in J. clear H3.
        destruct J.
          decompose [and] H3. clear H3.
          assert (KJ := @struct__subfield s id offset t' H1 H2).
          split.
           apply validAddress__validAddresses.
             assert (b<=loc'+offset<e). 
               rewrite sizeOfAType_one in *.
               omega.
             apply H13 in H3. destruct H3; auto.

             intros.
             assert (b<=loc'+offset + i<e). omega.
             apply H13 in H10. destruct H10; auto.

           assert (K:=validAddressRange).
            split; try omega.

         absurd_hyp H4; auto.

    unfold Error in H0. destruct H0; inversion H0.

    unfold assertion_ptr in H4. destruct be' as [b e]. rewrite H1 in H4. 
    clear HeqR. assert (JJ:=H6).
    unfold wfEnv in H6. decompose [and] H6. clear H6.
    unfold wfMem in H5. simpl in *.
    assert (J:=@H5 (loc)). clear H5.
    rewrite H0 in J.
    destruct q.
    (*q=Safe*)
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]].
    simpl in *. 
    assert (A_Pointer (P_Name n) Safe =  A_Pointer (P_Name n) Safe) as EQ. auto.
    apply J1 in EQ.
    inversion EQ; subst. rename H7 into JpEq.
    rewrite <- H in J. clear H.
    inversion JpEq; subst. rename H10 into JsEq.
    (*  q=namename  *)
    rewrite H1 in H6. inversion H6; subst.
    destruct J.
      destruct H as [ss H].
      decompose [and] H. clear H.
      rewrite H5 in H7. inversion H7; subst. 
      split. 
        apply validAddress__validAddresses.
          assert (0<=offset<sizeOfStruct s2).
             apply struct__subfield with (offset:=offset) in H3; auto.
             rewrite sizeOfAType_one in H3. simpl in H3. omega.
        apply structEqual_eq_sizeOf with (n:=sizeOfStruct ss) in JsEq; auto.
        rewrite JsEq in *.
        apply H14 in H. destruct H; auto.

          intros.
          assert (0<= offset + i < sizeOfStruct s2).
             apply struct__subfield with (offset:=offset) in H3; auto.
             rewrite sizeOfAType_one in *. simpl in H3. omega.
          apply structEqual_eq_sizeOf with (n:=sizeOfStruct ss) in JsEq; auto.
          rewrite JsEq in *.
          apply H14 in H13. destruct H13.
          assert (loc'+(offset+i) =loc' + offset + i). omega.
          rewrite H16 in H13. auto.

        assert (K:=validAddressRange).
        split; try omega.
        assert (offset + sizeOfAType t' <= sizeOfStruct s2).
            apply struct__subfield with (id:=id); auto.
        apply structEqual_eq_sizeOf with (n:=sizeOfStruct ss) in JsEq; auto.
        rewrite JsEq in *.
        omega.

      absurd_hyp H; auto.
    (*  q=eqname  *)
    destruct J.
      destruct H as [ss H].
      decompose [and] H. clear H.
      rewrite H5 in H1. inversion H1; subst.
      clear H1 JpEq.
      split. 
        apply validAddress__validAddresses.
          assert (0<=offset<sizeOfStruct s).
             apply struct__subfield with (offset:=offset) in H3; auto.
             rewrite sizeOfAType_one in H3. simpl in H3. omega.
        apply H12 in H. destruct H; auto.

          intros.
          assert (0<= offset + i < sizeOfStruct s).
             apply struct__subfield with (offset:=offset) in H3; auto.
             rewrite sizeOfAType_one in *. simpl in H3. omega.
          apply H12 in H1. destruct H1.
          assert (loc'+(offset+i) =loc' + offset + i). omega.
          rewrite H13 in H1. auto.

        assert (K:=validAddressRange).
        split; try omega.
        assert (offset + sizeOfAType t' <= sizeOfStruct s).
            apply struct__subfield with (id:=id); auto.
        omega.

      absurd_hyp H; auto.
    (*q=Seq*)
    decompose [and] H4. clear H4.
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]].
    simpl in *. 
    assert (A_Pointer (P_Name n) Seq =  A_Pointer (P_Name n) Seq) as EQ. auto.
    apply J2 in EQ.
    inversion EQ; subst. rename H11 into JpEq.
    rewrite <- H in J. clear H.
    inversion JpEq; subst. rename H12 into JsEq.
    (* q = namename*)
    rewrite H1 in H6. inversion H6; subst.
        destruct J.
          decompose [and] H. clear H.
          destruct H15 as [ss H15]. decompose [and] H15. clear H15.
          assert (KJ := @struct__subfield s2 id offset t' H2 H3).
          split.
           apply validAddress__validAddresses.
             assert (b<=loc'+offset<e). 
               rewrite sizeOfAType_one in *.
               omega.
             apply H18 in H12. destruct H12. auto.

             intros.
             assert (b<=loc'+offset + i<e). omega.
             apply H18 in H15. destruct H15. auto.

           assert (K:=validAddressRange).
           split; try omega.

         absurd_hyp H5; auto.
    (* q = eqname*)
        destruct J.
          decompose [and] H. clear H.
          destruct H13 as [ss H13]. decompose [and] H13. clear H13.
          simpl in H. rewrite H1 in H. inversion H; subst. clear H.
          assert (KJ := @struct__subfield s id offset t' H2 H3).
          split.
           apply validAddress__validAddresses.
             assert (b<=loc'+offset<e). 
               rewrite sizeOfAType_one in *.
               omega.
             apply H16 in H. destruct H. auto.

             intros.
             assert (b<=loc'+offset + i<e). omega.
             apply H16 in H6. destruct H6. auto.

           assert (K:=validAddressRange).
           split; try omega.

         absurd_hyp H5; auto.
    (*q=Tame*)
    decompose [and] H4. clear H4.
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
       eapply J3; eauto.
    destruct H as [q H].
    inversion H; subst. rename H12 into JpEq.
    rewrite <- H4 in J. clear H4.
        destruct J.
          decompose [and] H4. clear H4.
          assert (KJ := @struct__subfield s id offset t' H2 H3).
          split.
           apply validAddress__validAddresses.
             assert (b<=loc'+offset<e). 
               rewrite sizeOfAType_one in *.
               omega.
             apply H14 in H4. destruct H4; auto.

             intros.
             assert (b<=loc'+offset +i <e). omega.
             apply H14 in H11. destruct H11; auto.

           assert (K:=validAddressRange).
           split; try omega.

         absurd_hyp H5; auto.

    unfold Error in H0. destruct H0; inversion H0.
Qed.

Lemma validAddress__s_rhs__validAddress :
(forall E rhs ds t E', s_rhs E rhs (RVal ds) t E' -> (forall i, validAddress E.(mem) i -> validAddress E'.(mem) i)).
Proof.
   intros.
   remember (RVal ds) as R.
   generalize dependent ds.
   induction H; intros; eauto.
     destruct E'' as [M'' S'' TI'']. apply malloc__inversion in H6.
     destruct H6 as [M [TI H6]]. decompose [and] H6. clear H6.
     subst. simpl in *.
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     destruct H0. destruct H0 as [v H0].
     split.
       apply H11 in H0. exists(v). auto.
       intros. destruct (validAccessMemMeta__validStoreMemMeta M'' i v0).
         apply H7.
         destruct (validAccessMemMeta__validStoreMemMeta M i v0).
         assert (J:=@H6 v0). apply H19 in J. destruct J.
         apply H11 in H20. exists(x). auto.

     destruct E'' as [M'' S'' TI'']. apply malloc__inversion in H5.
     destruct H5 as [M [TI H5]]. decompose [and] H5. clear H5.
     subst. simpl in *.
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     destruct H0. destruct H0 as [v H0].
     split.
       apply H10 in H0. exists(v). auto.
       intros. destruct (validAccessMemMeta__validStoreMemMeta M'' i v0).
         apply H6.
         destruct (validAccessMemMeta__validStoreMemMeta M i v0).
         assert (J:=@H5 v0). apply H18 in J. destruct J.
         apply H10 in H19. exists(x). auto.

     destruct E'' as [M'' S'' TI'']. apply malloc__inversion in H5.
     destruct H5 as [M [TI H5]]. decompose [and] H5. clear H5.
     subst. simpl in *.
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     destruct H0. destruct H0 as [v H0].
     split.
       apply H10 in H0. exists(v). auto.
       intros. destruct (validAccessMemMeta__validStoreMemMeta M'' i v0).
         apply H6.
         destruct (validAccessMemMeta__validStoreMemMeta M i v0).
         assert (J:=@H5 v0). apply H18 in J. destruct J.
         apply H10 in H19. exists(x). auto.
Qed.

Lemma rhs__SafeSeqPtr :  forall E E' rhs d t, 
  s_rhs E rhs (RVal d) t E' ->
  wfEnv E ->
  (forall p, 
    t = A_Pointer p Seq -> 
    snd d = A_Int -> 
    (exists v, fst d = (v, (0,0))) \/ (exists s, fst d = (0, (0,s)))
  ) /\
  (forall p, t = A_Pointer p Safe -> 
    (snd d <> A_Int \/ (snd d = A_Int /\ (exists s, fst d = (0, (0, s)))))
  ) /\
  (forall p q0 p0, t = A_Pointer p Tame -> 
     (snd d = A_Pointer q0 p0 /\ p0 <> Tame) ->
     exists v, fst d = (v, (0,0))
  ) /\
  (forall p, t = A_Pointer p Tame -> 
     snd d = A_Int ->
     exists v, fst d = (v, (0,0))
  ) /\
  (forall p v b e n q0, t = A_Pointer p Safe -> 
     fst d = (v, (b, e)) ->
     Some n = sizeOfPType p ->
     (snd d = A_Pointer q0 Seq) ->
     v = 0 \/ (b <> 0 /\ b <= v <= e - n)
  ) /\
  (forall p v b e q0, t = A_Pointer p Safe -> 
     fst d = (v, (b, e)) ->
     (snd d = A_Pointer q0 Tame) ->
     False \/ v = 0
  ) /\
  (forall p v b e q0, t = A_Pointer p Seq -> 
     fst d = (v, (b, e)) ->
     (snd d = A_Pointer q0 Tame) ->
     False \/ (b=0 /\ e =0) \/ v = 0
  ).
Proof.
  intros until 1.
  remember (RVal d) as R.
  generalize dependent d.
  induction H; intros; inversion HeqR; subst; simpl in *; try solve [
  unfold Error in H0; destruct H0; inversion H0 |
  unfold Error in H1; destruct H1; inversion H1
  ].

  split; intros. inversion H0.
  split; intros. inversion H0.
  split; intros. inversion H0.
  split; intros. inversion H0.
  split; intros. inversion H0.
  split; intros. inversion H0.
                       inversion H0.

  split; intros; subst.
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]].
    assert(A_Pointer p Seq = A_Pointer p Seq) as EQ. auto.
    apply J2 in EQ. rewrite H3 in EQ.
    inversion EQ.

  split; intros; subst.
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]].
    assert(A_Pointer p Safe = A_Pointer p Safe) as EQ. auto.
    apply J1 in EQ.
    left. unfold not. intros. rewrite H in EQ. inversion EQ.

  split; intros; subst.
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
      eapply J3; eauto.
    unfold wfEnv in H1. decompose [and] H1. clear H1.
    unfold wfMem in H2.
    assert (K:=@H2 loc). clear H2.
    simpl in *. rewrite H0 in K.    
    destruct H as [q H].
    destruct H3. rewrite H1 in H. inversion H; subst.
    absurd_hyp H2; auto.

  split; intros; subst.
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (exists q, atypeEqual (TI loc) (A_Pointer q Tame)).
      eapply J3; eauto.
    unfold wfEnv in H1. decompose [and] H1. clear H1.
    unfold wfMem in H2.
    assert (K:=@H2 loc). clear H2.
    simpl in *. rewrite H0 in K.    
    destruct H as [q H].
    rewrite H3 in H. inversion H; subst.

  split; intros; subst.
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (atypeEqual (TI loc) (A_Pointer p Safe)).
      eapply J1; eauto.
    rewrite H5 in H. inversion H; subst. inversion H9.

  split; intros; subst.
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (atypeEqual (TI loc) (A_Pointer p Safe)).
      eapply J1; eauto.
    rewrite H4 in H. inversion H; subst. inversion H8.

    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
    destruct H as [J1 [J2 [J3 J4]]]. simpl in *.
    assert (atypeEqual (TI loc) (A_Pointer p Seq)).
      eapply J2; eauto.
    rewrite H4 in H. left. inversion H; subst. inversion H8.

  split; intros. inversion H3.
  split; intros. left. unfold not. intros. inversion H4.
  split; intros. inversion H3.
  split; intros. inversion H3.
  split; intros. inversion H6.
  split; intros. inversion H5.
                      inversion H5.

  split; intros. inversion H4.
  split; intros. left. unfold not. intros. inversion H4.
  split; intros. inversion H3.
  split; intros. inversion H4.
  split; intros. inversion H3.
  split; intros. inversion H5.
                      inversion H5.

  split; intros. inversion H4.
  split; intros. left. unfold not. intros. inversion H4.
  split; intros. destruct H4. inversion H4; subst. absurd_hyp H5; auto.
  split; intros. inversion H4.
  split; intros. inversion H3.
  split; intros. inversion H3.
                      inversion H3.

  split; intros. inversion H4.
  split; intros. inversion H4.
  split; intros. inversion H4.
  split; intros. inversion H4.
  split; intros. inversion H4.
  split; intros. inversion H4.
                       inversion H4.

  split; intros. inversion H7.
  split; intros. inversion H5; subst.
  split; intros. destruct H7. inversion H5; subst. inversion H7; subst. absurd_hyp H8; auto.
  split; intros. inversion H7.
  split; intros. inversion H5; subst.
  split; intros. inversion H5; subst.
                 inversion H5; subst.

  apply IHs_rhs with (d:=ds) in H4; auto.
  destruct H4 as [J1 [J2 [J3 [J4 [J5 [J6 J7]]]]]].
  split; intros; subst.
    unfold convertible in H0.
    destruct t.
      (*A_Int*)
      unfold dataCast in H2.
      destruct ds. simpl in H2. destruct d0. destruct m.
      left. exists (v). inversion H2. auto.
      (* ptr *)
      destruct q.
        (* safe *)
        assert (snd ds <> A_Int \/ snd ds = A_Int /\ (exists s, fst ds = (0, (0,s)))).
          eapply J2; eauto.
        destruct H4.
          rewrite H5 in H4. absurd_hyp H4; auto.

          destruct H4. destruct H6 as [s H6]. 
          destruct ds. simpl in *. subst.
          unfold dataCast in H2.
          destruct (sizeOfPType p0).
             inversion H2; subst. right. exists (n). auto.
             inversion H2.
        (* seq *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.
        inversion H2; subst.
        simpl in J1.
        eapply J1; eauto.        
        (* tame *)
        inversion H0.

  split; intros; subst.
    unfold convertible in H0.
    destruct t.
      (*A_Int*)
      unfold dataCast in H2.
      destruct ds. simpl in H2. destruct d0. destruct m.
      inversion H2; subst. simpl in *.
      destruct a.
        right. split; auto. exists (0). auto.
        left. intro. inversion H4. 
      (* ptr *)
      destruct q.
        (* safe *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.
        inversion H2; subst. simpl in *.
        eapply J2; eauto.
        (* seq *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.
        inversion H2; subst.
        destruct a; simpl in *.
          (*a = int*)
          assert ((exists v0, (v, (b, b0)) = (v0, (0,0))) \/ (exists s, (v, (b, b0)) = (0, (0,s)))).
             eapply J1; eauto.
          destruct H4.
             destruct H4 as [v0 H4] .
             inversion H4. subst.
             unfold assertion_dataCast in H3.
             destruct H3.
               subst. right. split; auto. exists (0). auto.
               destruct (sizeOfPType p0).
                  destruct H3. absurd_hyp H3; auto.
                  inversion H3.

             right. auto.
          (*a = ptr*)
          left. unfold not. intros. inversion H4.
        (* tame *)
        inversion H0.

  split; intros; subst.
    unfold convertible in H0.
    destruct t.
      (*A_Int*)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.        
        exists v. inversion H2; auto.
      (* ptr *)
      destruct q.
        (* safe *)
        inversion H0.
        (* seq *)
        inversion H0.
        (* tame *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.
        inversion H2; subst. clear H0 H2 HeqR.
        destruct H5.
        destruct a; simpl in *.
          (*a = int*)
          inversion H0.
          (*a = ptr*)
          inversion H0; subst. clear H0.
          eapply J3; eauto.

  split; intros; subst.
    unfold convertible in H0.
    destruct t.
      (*A_Int*)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.        
        exists v. inversion H2; auto.
      (* ptr *)
      destruct q.
        (* safe *)
        inversion H0.
        (* seq *)
        inversion H0.
        (* tame *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d0. destruct m.
        inversion H2; subst. clear H0 H2 HeqR.
        simpl in *. subst.
        assert (A_Pointer p0 Tame = A_Pointer p0 Tame). auto.
        apply J4 in H0; auto.  

  split; intros; subst.
    unfold convertible in H0.
    destruct t.
      (*A_Int*)
      unfold dataCast in H2.
      destruct ds. simpl in H2. destruct d. destruct m.
      inversion H2; subst. simpl in *.
      left. auto.
      (* ptr *)
      destruct q.
        (* safe *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.
        inversion H2; subst. simpl in *.
        eapply J5; eauto.
          eapply ptypeEqual_eq_sizeOf; eauto.
        (* seq *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.
        inversion H2; subst.
        destruct a; simpl in *.
          (*a = int*)
          assert ((exists v0, (v, (b, e)) = (v0, (0,0))) \/ (exists s, (v, (b, e)) = (0, (0,s)))).
             eapply J1; eauto.
          destruct H4. 
             inversion H4. inversion H5; subst.
             unfold assertion_dataCast in H3.
             destruct H3.
               auto.
               destruct (sizeOfPType p0).
                  destruct H3. absurd_hyp H3; auto.
                  inversion H3.
             inversion H4. inversion H5; subst. auto.
          (*a = ptr*)
          clear J1 J2 J3 J4 J5.
          inversion H7; subst.
          unfold assertion_dataCast in H3.
              assert (K:=@ptypeEqual_eq_sizeOf p p0 H0 n H6).
              rewrite <- K in H3. auto.
        (* tame *)
        inversion H0.

  split; intros; subst.
    unfold convertible in H0.
    destruct t.
      (*A_Int*)
      unfold dataCast in H2.
      destruct ds. simpl in H2. destruct d. destruct m.
      inversion H2; subst. simpl in *.
      right. auto.
      (* ptr *)
      destruct q.
        (* safe *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.
        inversion H2; subst. simpl in *.
        eapply J6; eauto.
        (* seq *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.
        inversion H2; subst.
        destruct a; simpl in *.
          (*a = int*) inversion H6.
          (*a = ptr*)
          clear J1 J2 J3 J4 J5 J6.
          inversion H6; subst.
          assert (False \/ b = 0 /\ e = 0 \/ v = 0). eapply J7; eauto.
          destruct H4; auto.
            destruct H4; subst; auto.
              unfold assertion_dataCast in H3.
              destruct H3; auto.
                 destruct (sizeOfPType p0).
                     destruct H4; subst. destruct H3. absurd_hyp H3; auto.
                     inversion H3.
        (* tame *)
        inversion H0.

    unfold convertible in H0.
    destruct t.
      (*A_Int*)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.        
        simpl in *. inversion H2; subst.
        auto.
      (* ptr *)
      destruct q.
        (* safe *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.
        destruct (sizeOfPType p0).
           inversion H2; subst. simpl in *. subst.
           assert (False \/ b = 0). eapply J6; eauto.
           destruct H4; auto.

           inversion H2.
        (* seq *)
        unfold dataCast in H2.
        destruct ds. simpl in H2. destruct d. destruct m.
        inversion H2; subst. simpl in *. subst.
        eapply J7; eauto.
        (* tame *)
        inversion H0.

  split; intros. inversion H2.
  split; intros. inversion H2.
  split; intros. inversion H2.
  split; intros.  inversion H2.
  split; intros.  inversion H2.
  split; intros.  inversion H2.
                       inversion H2.

  split; intros. inversion H7.
  split; intros. left. unfold not. intros. inversion H8.
  split; intros. inversion H7.
  split; intros. inversion H7.
  split; intros. inversion H10.
  split; intros. inversion H9.
                       inversion H7.

  split; intros. inversion H7.
  split; intros. inversion H6.
  split; intros. inversion H6.
  split; intros. inversion H7.
  split; intros. inversion H6.
  split; intros. inversion H6.
                       inversion H8.

  split; intros. inversion H7.
  split; intros. inversion H6.
  split; intros. destruct H7. inversion H7; subst. absurd_hyp H8; auto.
  split; intros. inversion H7.
  split; intros. inversion H6.
  split; intros. inversion H6.
                       inversion H6.
Qed.

Lemma s_lhs__wf_lhs :  forall E lhs l t, 
  s_lhs E lhs (RLoc l) t ->
  wf_lhs E.(stack) lhs t.
Proof.
  intros.
  remember (RLoc l) as R.
  generalize dependent l.
  induction H; intros; inversion HeqR; subst; simpl in *.
    eapply WF_Var; eauto.
    eapply WF_Deref; eauto.
    unfold Error in H0. destruct H0; inversion H0.
    eapply WF_StructPos; eauto.
    unfold Error in H0. destruct H0; inversion H0.
    eapply WF_NamePos; eauto.
    unfold Error in H0. destruct H0; inversion H0.
Qed.

Lemma wf_lhs_uniq : forall S lhs t t',
  wf_lhs S lhs t ->
  wf_lhs S lhs t' ->
  t = t'.
Proof.
  intros.
  generalize dependent t'.
  induction H; intros; simpl in *. 
     inversion H1; subst. rewrite H in H3. inversion H3; auto.
     inversion H0; subst. apply IHwf_lhs in H3. inversion H3; auto.
     inversion H2; subst. 
       apply IHwf_lhs in H5. inversion H5; subst. rewrite H9 in H1. inversion H1; auto.
     inversion H3; subst. 
       apply IHwf_lhs in H6. inversion H6; subst. 
          rewrite H7 in H0. inversion H0; subst.
          rewrite H11 in H2. inversion H2; auto.
Qed.  

Lemma nontame_ref_lhs__TI
     : forall (S : Stack) (lhs : c_lhs) (t : AType) (E : Env) (M : Mem)
         (TI : TypeInfo) (l : Loc),
       s_lhs E lhs (RLoc l) t ->
       wf_nontame_ref_lhs (stack E) lhs t ->
       E = MkEnv M S TI -> wfEnv E -> atypeEqual (typeInfo E l) t.
Proof.
  intros until 1.
  remember (RLoc l) as R.
  generalize dependent M.
  generalize dependent S.
  generalize dependent TI.
  generalize dependent l.
  induction H; intros; inversion HeqR; subst; simpl in *.
     clear HeqR.
     unfold wfEnv in H3. decompose [and] H3. clear H3.
     apply H6 in H; auto.  decompose [and] H. clear H.
     simpl in *. 
     assert (l0 + 0 = l0). omega. rewrite <- H. 
     rewrite sizeOfAType_one in *.
     apply H4. omega.

     inversion H2.

     unfold Error in H0. destruct H0; inversion H0.

     unfold assertion_ptr in H3. destruct be' as [b e]. 
     clear HeqR. assert (JJ:=H6).
     unfold wfEnv in H6. decompose [and] H6. clear H6.
     unfold wfMem in H5. simpl in *.
     assert (J:=@H5 (loc)). clear H5.
     rewrite H0 in J.
     destruct q.
     (* Safe *)
      apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
      destruct H as [J1 [J2 [J3 J4]]].
      simpl in *. 
      assert (A_Pointer (P_Struct s) Safe = A_Pointer (P_Struct s) Safe) as EQ. auto.
      apply J1 in EQ.
      inversion EQ; subst. rename H7 into JpEq.
      rewrite <- H in J. inversion JpEq; subst. rename H7 into JsEq.
      destruct J.
         decompose [and] H5.
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H2; auto.
           rewrite sizeOfAType_one in *.
           omega.
         assert(K:=JsEq).
         apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in K; auto.
         rewrite K in *.
         apply H12 in H11. destruct H11.
         assert (getStructType s id = getStructNthType s offset).
            assert (J:=H2).
            apply struct__OffsetNthType with (offset:=offset) in H2; auto.
            rewrite H2; auto.
         rewrite H14 in H2. 
         assert (EQ0:=@structEqual__getStructNthPType s1 s offset JsEq).
         rewrite H2 in EQ0. 
         apply optionAtypeEqual_trans with (ot'':=Some t') in H13; auto.
         inversion H13; auto.

         absurd_hyp H; auto.
     (* Seq *)
      decompose [and] H3; clear H3; subst; auto.
      apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
      destruct H as [J1 [J2 [J3 J4]]].
      simpl in *.
      assert (A_Pointer (P_Struct s) Seq = A_Pointer (P_Struct s) Seq) as EQ. auto.
      apply J2 in EQ.
      inversion EQ; subst. rename H11 into JpEq.
      rewrite <- H in J. inversion JpEq; subst. rename H11 into JsEq.
      destruct J.
         decompose [and] H3. clear H3.
         destruct H14 as [s0 H14]. decompose [and] H14. clear H14.
         simpl in H. inversion H; subst. clear H.
         assert (KJ := @struct__subfield s id offset t' H1 H2).
         assert (b<=loc'+offset<e). 
           rewrite sizeOfAType_one in *.
           omega.
         assert(K:=JsEq).
         apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in K; auto.
         apply H17 in H. destruct H. 
         destruct H11 as [j H11]. destruct H11.
         simpl in H3.
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H2; auto.
           rewrite sizeOfAType_one in *.
           omega.
         assert (offset<sizeOfStruct s1). omega.
         inversion H3; subst.
         assert (J:=@mmod_inv (sizeOfStruct s1) loc' offset H16 H20).
         rewrite J in H11. inversion H11. subst.
         assert (K':=@struct__OffsetNthType
                                     s id j t' H1 H2).
         assert (EQ0:=@structEqual__getStructNthPType s1 s j JsEq).
         rewrite K' in EQ0. 
         apply optionAtypeEqual_trans with (ot'':=Some t') in H18; auto.
         inversion H18; auto.

         absurd_hyp H5; auto.
     (* tame *)
      decompose [and] H3; clear H3; subst; auto.
      inversion H4; subst.
         apply s_lhs__wf_lhs in H. simpl in H.
         apply wf_lhs_uniq with (t':=A_Pointer (P_Struct s0) q) in H; auto.
         inversion H; subst.
         absurd_hyp H12; auto.

     unfold Error in H0. destruct H0; inversion H0.

     unfold assertion_ptr in H4. destruct be' as [b e]. rewrite H1 in H4.
     clear HeqR. assert (JJ:=H7).
     unfold wfEnv in H7. decompose [and] H7. clear H7.
     unfold wfMem in H6. simpl in *.
     assert (J:=@H6 (loc)). clear H6.
     rewrite H0 in J.
     destruct q.
     (* Safe *)
      apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
      destruct H as [J1 [J2 [J3 J4]]].
      simpl in *. 
      assert (A_Pointer (P_Name n) Safe = A_Pointer (P_Name n) Safe) as EQ. auto.
      apply J1 in EQ.
      inversion EQ; subst. rename H8 into JpEq.
      rewrite <- H in J. inversion JpEq; subst. 
      (* namename *)
      rename H12 into JsEq.
      rewrite H8 in H1. inversion H1; subst.
      destruct J.
         destruct H6 as [ss H6].
         decompose [and] H6. clear H6.
         rewrite H7 in H11. inversion H11; subst.
         assert(K:=JsEq).
         apply structEqual_eq_sizeOf with (n:=sizeOfStruct ss) in K; auto.
         rewrite K in *.
         assert (0<=offset<sizeOfStruct ss).
           apply struct__subfield with (offset:=offset) in H3; auto.
           rewrite sizeOfAType_one in *.
           omega.
         rewrite K in *.
         apply H16 in H6. destruct H6.
         assert (getStructType s id = getStructNthType s offset).
            assert (J:=H3).
            apply struct__OffsetNthType with (offset:=offset) in H3; auto.
            rewrite H3; auto.
         rewrite H17 in H3. 
         assert (EQ0:=@structEqual__getStructNthPType ss s offset JsEq).
         rewrite H3 in EQ0. 
         apply optionAtypeEqual_trans with (ot'':=Some t') in H15; auto.
         inversion H15; auto.

         absurd_hyp H; auto.
      (* eqname *)
      clear JpEq.
      destruct J.
         destruct H6 as [ss H6].
         decompose [and] H6. clear H6.
         rewrite H7 in H1. inversion H1; subst. clear H1.
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H3; auto.
           rewrite sizeOfAType_one in *.
           omega.
         apply H14 in H1. destruct H1.
         assert (getStructType s id = getStructNthType s offset).
            assert (J:=H3).
            apply struct__OffsetNthType with (offset:=offset) in H3; auto.
            rewrite H3; auto.
         rewrite H13 in H3. 
         apply optionAtypeEqual_trans with (ot'':=Some t') in H6; auto.
           inversion H6; auto.
           rewrite H3. apply optionAtypeEqual_refl.

         absurd_hyp H; auto.
     (* Seq *)
      decompose [and] H4; clear H4; subst; auto.
      apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in H; auto.
      destruct H as [J1 [J2 [J3 J4]]].
      simpl in *.
      assert (A_Pointer (P_Name n) Seq = A_Pointer (P_Name n) Seq) as EQ. auto.
      apply J2 in EQ.
      inversion EQ; subst. rename H12 into JpEq.
      rewrite <- H in J. inversion JpEq; subst. 
      (* namename *)
      rename H14 into JsEq.
      rewrite H12 in H1. inversion H1; subst.
      destruct J.
         decompose [and] H4. clear H4.
         destruct H17 as [s0 H17]. decompose [and] H17. clear H17.
         simpl in H4. inversion H4; subst. clear H4.
         rewrite H7 in H17. inversion H17; subst.
         assert (KJ := @struct__subfield s id offset t' H2 H3).
         assert (b<=loc'+offset<e). 
           rewrite sizeOfAType_one in *.
           omega.
         apply H20 in H4. destruct H4. 
         destruct H14 as [j H14]. destruct H14.
         simpl in H21. rewrite H7 in H21. 
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H3; auto.
           rewrite sizeOfAType_one in *.
           omega.
         assert(K:=JsEq).
         apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in K; auto.
         rewrite K in *.
         assert (offset<sizeOfStruct s). omega.
         assert (J:=@mmod_inv (sizeOfStruct s) loc' offset H19 H23).
         rewrite J in H14. inversion H14. subst.
         assert (K':=@struct__OffsetNthType
                                     s id j t' H2 H3).
         assert (EQ0:=@structEqual__getStructNthPType s1 s j JsEq).
         rewrite K' in EQ0. 
         apply optionAtypeEqual_trans with (ot'':=Some t') in H21; auto.
         inversion H21; auto.

         absurd_hyp H6; auto.
      (* eqename *)
      clear JpEq.
      destruct J.
         decompose [and] H4. clear H4.
         destruct H15 as [s0 H15]. decompose [and] H15. clear H15.
         simpl in H4. inversion H4; subst. clear H4.
         rewrite H1 in H15. inversion H15; subst.
         assert (KJ := @struct__subfield s id offset t' H2 H3).
         assert (b<=loc'+offset<e). 
           rewrite sizeOfAType_one in *.
           omega.
         apply H18 in H4. destruct H4. 
         destruct H12 as [j H12]. destruct H12.
         assert (0<=offset<sizeOfStruct s).
           apply struct__subfield with (offset:=offset) in H3; auto.
           rewrite sizeOfAType_one in *.
           omega.
         assert (offset<sizeOfStruct s). omega.
         assert (J:=@mmod_inv (sizeOfStruct s) loc' offset H17 H21).
         rewrite J in H12. inversion H12. subst.
         assert (K':=@struct__OffsetNthType
                                     s id j t' H2 H3).
         apply optionAtypeEqual_trans with (ot'':=Some t') in H19; auto.
           inversion H19; auto.
           simpl. rewrite H1. rewrite K'. apply optionAtypeEqual_refl.

         absurd_hyp H6; auto.
    (* tame *)
      decompose [and] H4; clear H4; subst; auto.
       inversion H5; subst.
         apply s_lhs__wf_lhs in H. simpl in H.
         apply wf_lhs_uniq with (t':=A_Pointer (P_Name n0) q) in H; auto.
         inversion H; subst.
         absurd_hyp H12; auto.

     unfold Error in H0. destruct H0; inversion H0.
Qed.

Lemma wfE__s_rhs__wfE__nonTameCase__outsideCase:
forall E E' M'' S'' TI'' rhs ds loc n be size p q,
  s_rhs E rhs (RVal ds) A_Int E' ->
  wfEnv E ->
  (wfEnv E -> wfEnv E') ->
  wf_AType (A_Pointer p q) ->
  fst ds = (n, be) ->
  sizeOfPType p = Some size ->
  size > 0 ->
  q <> Tame ->
  malloc E' n = Some (MkEnv M'' S'' TI'', loc) ->
  wfStack S'' ->
  forall l p0,
  Some p0 = accessMemMeta M'' l ->
  wfData M'' TI'' p0 (TI'' l) ->
  l<loc \/ l >=loc+n ->
  wfData M'' (updateTypeInfo TI'' loc p n) p0 (updateTypeInfo TI'' loc p n l).
Proof.
  intros E E' M'' S'' TI'' rhs ds loc n be size p q
         H H0 IHs_rhs H1 H2 H3 H5 Q J H9 l p0 HeqG K H8.
        assert (H4 := True).
        assert (H10 := True).
        (*accessMemMeta M'' l = some*)
        apply sym_eq in HeqG.
        destruct (@updateNonTameTypeInfo_inversion TI'' loc p size n (updateTypeInfo TI'' loc p n) q H1 H3); auto.
        unfold wfData in *.
        destruct p0. destruct m.
          assert (JJ := H8).
          apply H6 in H8. rewrite <- H8.
          remember (TI'' l)as EQ.
          destruct (EQ); auto.
           (*EQ = p0* q0*)
           destruct q0; destruct p0; auto.
            (*EQ = a* safe*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            intros. 
            rewrite sizeOfAType_one in *.
            assert (i=0). omega. subst. 
            apply H16 in H11.
            destruct H11. split; auto.
            assert (v+0 = v). omega. rewrite H17 in *.
            destruct (le_lt_dec loc v).
             (*loc  <= v*)
             destruct (le_lt_dec (loc+n) v).
               (*loc +n <= v*)
               assert (v <loc \/ v >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto.                                                                    
               (* v < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. destruct p0 as [v' [b' e']]. inversion HeqG0. subst v' b' e'. 
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    subst t1 p2. rename H27 into JaEq'. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H34 0); auto.
                       assert (loc <= v < loc+n). omega.
                       apply H24 in H35. destruct H0. destruct H0.
                       assert (v+0=v). omega. rewrite H37 in H0.
                       rewrite H0 in H35. inversion H35.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* v < loc *)
               assert (v <loc \/ v >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto.                                                                    
            (*EQ = s* safe*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            subst.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (v+i)).
             (*loc  <= v+i*)
             destruct (le_lt_dec (loc+n) (v+i)).
               (*loc +n <= v+i*)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H6 in H17. rewrite <- H17. auto.                                                                    
               (* v+i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H17; auto. subst M S'' TI. clear H17.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H21 in HeqG0. 
                  rewrite HeqG in HeqG0. destruct p0 as [v' [b' e']]. inversion HeqG0. subst v' b' e'. 
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H25 in H17. rewrite <- HeqEQ in H17.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H26. clear H29 H30.
                    assert (LL:=@H26 l). clear H26.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H17).
                    inversion JaEq. subst q2 p1 q1.
                    rename H29 into JpEq. inversion JpEq.
                    subst s1 p2. rename H26 into JsEq. rename H28 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    assert(K1:=JsEq).
                    apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in K1; auto.
                    rewrite K1 in *.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H31 i); auto.
                       assert (loc <= v+i < loc+n). omega.
                       apply H23 in H32. destruct H0. destruct H0.
                       rewrite H32 in H0. inversion H0.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H20 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* v+i < loc *)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H6 in H17. rewrite <- H17. auto.                                                                    
            (*EQ = n* safe*)
            destruct K; auto.
            destruct H11 as [s H11].
            decompose [and] H11. clear H11.
            left. exists(s). split; auto. split; auto. split; auto.
            split; auto. subst.
            intros.
            assert (X:=H11). 
            apply H17 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (v+i)).
             (*loc  <= v+i*)
             destruct (le_lt_dec (loc+n) (v+i)).
               (*loc +n <= v+i*)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto.                                                                    
               (* v+i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. destruct p0 as [v' [b' e']]. inversion HeqG0. subst v' b' e'. 
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27. clear H31 H30.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H30 into JpEq. 
                    inversion JpEq.
                    (* namename *)
                    subst n1 p2. rename H31 into JsEq. rename H29 into EQ.
                    rename H27 into Htab1. rename H30 into Htab2.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       destruct H0 as [ss H0].
                       decompose [and] H0. clear H0.
                       rewrite Htab2 in H27. inversion H27; subst. clear H27.
                       rewrite Htab1 in H12. inversion H12; subst. clear H12.
                       assert(K1:=JsEq).
                       apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in K1; auto.
                       rewrite <- K1 in *.                 
                       destruct (@H33 i); auto.
                       assert (loc <= v+i < loc+n). omega.
                       apply H24 in H27. destruct H0. destruct H0.
                       rewrite H27 in H0. inversion H0.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                    (* eqname *)
                    subst n0 p2. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       destruct H0 as [ss H0].
                       decompose [and] H0. clear H0.
                       rewrite H27 in H12. inversion H12; subst.
                       destruct (@H33 i); auto.
                       assert (loc <= v+i < loc+n). omega.
                       apply H24 in H34. destruct H0. destruct H0.
                       rewrite H0 in H34. inversion H34.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* v+i < loc *)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto.                                                                    
            (*EQ = a* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists (s). split; auto. split; auto.
            intros. 
            assert (K:=H13). apply H19 in H13.
            destruct H13. destruct H16 as [j [J1 J2]].
            split; auto.
            exists (j). split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H16. rewrite <- H16. auto.                                                                    
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H16; auto. subst M S'' TI. clear H16.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K1:=HeqG0). apply H23 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H27 in H16. rewrite <- HeqEQ in H16.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H28.
                    assert (LL:=@H28 l). clear H28.
                    simpl in LL. rewrite K1 in LL.
                    assert (JaEq:=H16).
                    inversion JaEq. subst q2 p1 q1.
                    rename H33 into JpEq. inversion JpEq.
                    subst t1 p2. rename H28 into JaEq'. rename H30 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H35 as [ss H35]. decompose [and] H35. clear H35.
                       simpl in H11. simpl in H0. rewrite sizeOfAType_one in *.
                       rewrite H11 in H0. inversion H0; subst. clear H0.
                       destruct (@H38 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H25 in H35. destruct H0. destruct H0.
                       rewrite H0 in H35. inversion H35.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                    (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H22 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H16. rewrite <- H16. auto.                                                                    
            (*EQ = s* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s0 H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists(s0). split; auto. split; auto. subst.
            intros.
            assert (X:=H13). 
            apply H19 in H13.
            destruct H13. destruct H16 as [j [J1 J2]].
            split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H16. rewrite <- H16. 
               exists (j). auto.              
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H16; auto. subst M S'' TI. clear H16.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H23 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H27 in H16. rewrite <- HeqEQ in H16.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H28. clear H31 H32.
                    assert (LL:=@H28 l). clear H28.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H16).
                    inversion JaEq. subst q2 p1 q1.
                    rename H31 into JpEq. inversion JpEq.
                    subst s1 p2. rename H28 into JsEq. rename H30 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H33 as [ss0 H33]. decompose [and] H33. clear H33.
                       simpl in H11. simpl in H0.
                       assert (s0 = sizeOfStruct s) as EE.
                         apply sym_eq in H11. inversion H11; auto.
                       assert(GG:=@structEqual_eq_sizeOf s s2 JsEq (s0) EE).
                       rewrite <- GG in H0. inversion H0; subst. clear H0.
                       destruct (@H36 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H25 in H37. destruct H0. destruct H0.
                       rewrite H37 in H0. inversion H0.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H22 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H16. rewrite <- H16. 
               exists (j). auto.                                                                    
            (*EQ = n* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists(s). split; auto. split; auto. subst.
            intros.
            assert (X:=H13). 
            apply H19 in H13.
            destruct H13. split; auto.
            destruct (le_lt_dec loc (i)).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) (i)).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H20. rewrite <- H20. auto.                                                                    
               (* i < loc +size *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H20; auto. subst M S'' TI. clear H20.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H24 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H28 in H20. rewrite <- HeqEQ in H20.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H29. clear H32 H33.
                    assert (LL:=@H29 l). clear H29.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H20).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    (* namename *)
                    subst n1 p2. rename H33 into JsEq. rename H31 into EQ.
                    rename H29 into Htab1. rename H32 into Htab2.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H34 as [ss H34]. decompose [and] H34. clear H34.
                       simpl in H11. rewrite Htab1 in H11.
                       simpl in H0. rewrite Htab2 in H0.
                       assert(K1:=JsEq).
                       apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in K1; auto.
                       rewrite <- K1 in *.
                       destruct (@H37 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H26 in H38. destruct H31. destruct H31.
                       rewrite H38 in H31. inversion H31.
                       (*meta is zero*)
                       subst. assert (False). apply H12; auto. inversion H0.
                    (* eqname *)
                    subst n0 p2. rename H31 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H34 as [ss H34]. decompose [and] H34. clear H34.
                       simpl in H11. simpl in H0.
                       remember (typeTable c) as TC.
                       destruct TC; inversion H0; subst.
                       inversion H11; subst.
                       destruct (@H37 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H26 in H38. destruct H31. destruct H31.
                       rewrite H38 in H31. inversion H31.
                       (*meta is zero*)
                       subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H23 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H20. rewrite <- H20. auto.                                                                    
            (*EQ = void* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists (s). split; auto. split; auto.
            intros. 
            assert (K:=H13). apply H19 in H13.
            destruct H13. destruct H16 as [j [J1 J2]].
            split; auto.
            exists (j). split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H16. rewrite <- H16. auto.                                                                    
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H16; auto. subst M S'' TI. clear H16.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K1:=HeqG0). apply H23 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H27 in H16. rewrite <- HeqEQ in H16.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H28.
                    assert (LL:=@H28 l). clear H28.
                    simpl in LL. rewrite K1 in LL.
                    assert (JaEq:=H16).
                    inversion JaEq. subst q2 p1 q1.
                    rename H33 into JpEq. inversion JpEq.
                    subst p2. rename H30 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H35 as [ss H35]. decompose [and] H35. clear H35.
                       rewrite H11 in H0. inversion H0; subst. clear H0.
                       destruct (@H38 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H25 in H35. destruct H0. destruct H0.
                       rewrite H0 in H35. inversion H35.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H22 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H16. rewrite <- H16. auto.                 

            (*EQ = a* tame*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            intros. 
            assert (K:=H11). apply H16 in H11.
            destruct H11.
            split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto. 
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K1:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K1 in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    subst t1 p2. rename H27 into JaEq'. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H34 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H24 in H36. destruct H0. destruct H0.
                       rewrite H0 in H36. inversion H36.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto.                                                                    
            (*EQ = s* tame*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11 as [J1 J2].
            split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H11. rewrite <- H11. auto.              
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H11; auto. subst M S'' TI. clear H11.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H20 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H24 in H11. rewrite <- HeqEQ in H11.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H25.
                    assert (LL:=@H25 l). clear H25.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H11).
                    inversion JaEq. subst q2 p1 q1.
                    rename H30 into JpEq. inversion JpEq.
                    subst s1 p2. rename H25 into JsEq. rename H27 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H32 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H22 in H34. destruct H0. destruct H0.
                       rewrite H34 in H0. inversion H0.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H19 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H11. rewrite <- H11.  auto. 
            (*EQ = n* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto. subst.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (i)).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) (i)).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto. 
               (* i < loc +size *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    (* namename *)
                    subst n1 p2. rename H33 into JsEq. rename H29 into EQ.
                    rename H27 into Htab1. rename H32 into Htab2.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H34 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H24 in H36. destruct H0. destruct H0.
                       rewrite H36 in H0. inversion H0.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                    (* eqname *)
                    subst n0 p2. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H34 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H24 in H36. destruct H0. destruct H0.
                       rewrite H36 in H0. inversion H0.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto. 
            (*EQ = void* tame*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto. subst.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (i)).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) (i)).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto. 
               (* i < loc +size *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    subst p2. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H34 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H24 in H36. destruct H0. destruct H0.
                       rewrite H36 in H0. inversion H0.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H6 in H18. rewrite <- H18. auto. 
Qed.

Lemma wfE__s_rhs__wfE__nonTameCase : 
forall E E' E'' rhs ds loc n be size p q,
  s_rhs E rhs (RVal ds) A_Int E' ->
  wfEnv E ->
  (wfEnv E -> wfEnv E') ->
  wf_AType (A_Pointer p q) ->
  fst ds = (n, be) ->
  sizeOfPType p = Some size ->
  size > 0 ->
  malloc E' n = Some (E'', loc) ->
  q <> Tame ->
  wfEnv (MkEnv (mem E'') (stack E'') (updateTypeInfo (typeInfo E'') loc p n)).
Proof.
  intros E E' E'' rhs ds loc n be size p q
             H H0 IHs_rhs H1 H2 H3 H5 H6 Q.
    assert (True) as H4. auto.
    assert (J:=H6).
    destruct E'' as [M'' S'' TI''].
    apply malloc__wfE in H6; auto.
    simpl in *. unfold wfEnv in H6.
    decompose [and] H6. clear H6.
    unfold wfMem in H7.
    split.
      (*wfMem*)
      unfold wfMem. intros. simpl in *.
      assert (K:=@H7 l). clear H7.
      remember (accessMemMeta M'' l) as G.
      destruct G; auto.
        destruct (le_lt_dec loc l).
         (*loc <= l*)
         destruct (le_lt_dec (loc+n) l).
          (*loc + n <= l*)
          assert (l<loc \/ l >=loc+n). omega.
          eapply wfE__s_rhs__wfE__nonTameCase__outsideCase; eauto.

          (*loc <= l < loc + n *)
          apply sym_eq in HeqG.
          destruct (@updateNonTameTypeInfo_inversion TI'' loc p size n (updateTypeInfo TI'' loc p n) q H1 H3); auto.
          unfold wfData in *.
          destruct p0. destruct m.
          destruct E' as [M' S' TI'].
          apply malloc__inversion in J.
          destruct J as [M [TI J]].
          decompose [and] J. clear J.
          inversion H8; auto. subst M S'' TI. clear H8.
          assert (loc <= l < loc + n). omega.
          apply H17 in H8. rewrite HeqG in H8. inversion H8; subst.
          clear K.
          remember (updateTypeInfo TI'' loc p n l) as EQ.
          destruct (EQ); auto; destruct p0; destruct q0; auto.
          assert (loc <= l < loc + n). omega.
          apply H7 in H19.
          rewrite <- HeqEQ in H19.
          inversion H1; subst.
            destruct H19 as [j H19]. destruct H19 as [J1 J2].
            inversion J2; subst. inversion H22; subst.
            apply sym_eq in H21.
            apply wf_PType__wf_subAType in H21; auto.
            inversion H22; subst. inversion H28; subst.
            inversion H21; subst. inversion H27.

            destruct H19 as [j H19]. destruct H19 as [J1 J2].
            inversion J2; subst. inversion H22; subst.
            apply sym_eq in H21.
            apply wf_PType__wf_subAType in H21; auto.
            inversion H22; subst. inversion H28; subst.
            inversion H21; subst. inversion H27.

            absurd_hyp Q; auto.

          (* l < loc *)
          assert (l<loc \/ l >=loc+n). omega.
          eapply wfE__s_rhs__wfE__nonTameCase__outsideCase; eauto.

    split.
      (*wfStack*)
      unfold wfStack in *.
      decompose [and] H9. clear H9.
      split; auto.

      (*wf...*)
      intros. simpl in *. assert (JJ:=H6).
      apply H10 in H6. destruct H6.
      split; auto.
      intros. rewrite sizeOfAType_one in *. 
      assert (i=0). omega. subst.
      apply H8 in H11.
      assert (loc0+0=loc0). omega. rewrite H12 in *. clear H12.
      destruct (@updateNonTameTypeInfo_inversion TI'' loc p size n (updateTypeInfo TI'' loc p n) q H1 H3); auto.
      destruct (le_lt_dec loc loc0).
         (*loc <= loc0*)
         destruct (le_lt_dec (loc+n) loc0).
          (*loc + n <= loc0*)
          assert (loc0<loc \/ loc0 >=loc+n). omega.
          apply H12 in H14. rewrite <- H14; auto.          
          (*loc <= loc0 < loc + n*)
          destruct E' as [M' S' TI'].
          apply malloc__inversion in J.
          destruct J as [M [TI J]].
          decompose [and] J. clear J.
          inversion H14; auto. subst M S'' TI. clear H14.
          assert (loc <= loc0 < loc+n). omega.
          apply H20 in H14.
          apply IHs_rhs in H0.
          unfold wfEnv in H0. decompose [and] H0. clear H0. clear H23 H26.
          apply H27 in JJ. destruct JJ. simpl in *.
          rewrite sizeOfAType_one in *.  
          unfold validAddresses in H0. destruct H0.
          destruct H0. destruct H0.  rewrite H0 in H14. inversion H14.
        (*loc0 < loc*)
        assert (loc0<loc \/ loc0 >=loc+n). omega.
        apply H12 in H14. rewrite <- H14; auto.
Qed.

Lemma wfE__s_rhs__wfE__TameCase__outsideCase:
forall E E' M'' S'' TI'' rhs ds loc n be size p,
  s_rhs E rhs (RVal ds) A_Int E' ->
  wfEnv E ->
  (wfEnv E -> wfEnv E') ->
  wf_AType (A_Pointer p Tame) ->
  fst ds = (n, be) ->
  sizeOfPType p = Some size ->
  size > 0 ->
  malloc E' n = Some (MkEnv M'' S'' TI'', loc) ->
  wfStack S'' ->
  forall l p0,
  Some p0 = accessMemMeta M'' l ->
  wfData M'' TI'' p0 (TI'' l) ->
  l<loc \/ l >=loc+n ->
  wfData M'' (updateTypeInfo TI'' loc p n) p0 (updateTypeInfo TI'' loc p n l).
Proof.
  intros E E' M'' S'' TI'' rhs ds loc n be size p
         H H0 IHs_rhs H1 H2 H3 H4 J H9 l p0 HeqG K H8.
        assert (H6 := True).
        assert (H10 := True).
        (*accessMemMeta M'' l = some*)
        apply sym_eq in HeqG.
        destruct (@updateTameTypeInfo_inversion TI'' loc p n (updateTypeInfo TI'' loc p n) H1); auto.
        unfold wfData in *.
        destruct p0. destruct m.
          assert (JJ:=H8).
          apply H5 in H8. rewrite <- H8.
          remember (TI'' l)as EQ.
          destruct (EQ); auto.
           (*EQ = p0* q*)
           destruct q; destruct p0; auto.
            (*EQ = a* safe*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            intros. 
            rewrite sizeOfAType_one in *.
            assert (i=0). omega. subst. 
            apply H16 in H11.
            destruct H11. split; auto.
            assert (v+0 = v). omega. rewrite H17 in *.
            destruct (le_lt_dec loc v).
             (*loc  <= v*)
             destruct (le_lt_dec (loc+n) v).
               (*loc +n <= v*)
               assert (v <loc \/ v >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto.                                                                    
               (* v < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. destruct p0 as [v' [b' e']]. inversion HeqG0. subst v' b' e'. 
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    subst t1 p2. rename H27 into JaEq'. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H34 0); auto.
                       assert (loc <= v < loc+n). omega.
                       apply H24 in H35. destruct H0. destruct H0.
                       assert (v+0=v). omega. rewrite H37 in H0.
                       rewrite H0 in H35. inversion H35.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* v < loc *)
               assert (v <loc \/ v >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto. 

            (*EQ = s* safe*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            subst.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (v+i)).
             (*loc  <= v+i*)
             destruct (le_lt_dec (loc+n) (v+i)).
               (*loc +n <= v+i*)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H5 in H17. rewrite <- H17. auto.                                                                    
               (* v+i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H17; auto. subst M S'' TI. clear H17.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H21 in HeqG0. 
                  rewrite HeqG in HeqG0. destruct p0 as [v' [b' e']]. inversion HeqG0. subst v' b' e'. 
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H25 in H17. rewrite <- HeqEQ in H17.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H26. clear H29 H30.
                    assert (LL:=@H26 l). clear H26.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H17).
                    inversion JaEq. subst q2 p1 q1.
                    rename H29 into JpEq. inversion JpEq.
                    subst s1 p2. rename H26 into JsEq. rename H28 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    assert(K1:=JsEq).
                    apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in K1; auto.
                    rewrite K1 in *.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct (@H31 i); auto.
                       assert (loc <= v+i < loc+n). omega.
                       apply H23 in H32. destruct H0. destruct H0.
                       rewrite H32 in H0. inversion H0.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H20 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* v+i < loc *)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H5 in H17. rewrite <- H17. auto.                                                                    
            (*EQ = n* safe*)
            destruct K; auto.
            destruct H11 as [s H11].
            decompose [and] H11. clear H11.
            left. exists(s). split; auto. split; auto. split; auto.
            split; auto. subst.
            intros.
            assert (X:=H11). 
            apply H17 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (v+i)).
             (*loc  <= v+i*)
             destruct (le_lt_dec (loc+n) (v+i)).
               (*loc +n <= v+i*)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto.                                                                    
               (* v+i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H18; auto. subst M S'' TI. clear H18.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H22 in HeqG0. 
                  rewrite HeqG in HeqG0. destruct p0 as [v' [b' e']]. inversion HeqG0. subst v' b' e'. 
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H26 in H18. rewrite <- HeqEQ in H18.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H27. clear H31 H30.
                    assert (LL:=@H27 l). clear H27.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H18).
                    inversion JaEq. subst q2 p1 q1.
                    rename H30 into JpEq. inversion JpEq.
                    (* namename *)
                    subst n1 p2. rename H31 into JsEq. rename H29 into EQ.
                    rename H27 into Htab1. rename H30 into Htab2.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       destruct H0 as [ss H0].
                       decompose [and] H0. clear H0.
                       rewrite Htab2 in H27. inversion H27; subst. clear H27.
                       rewrite Htab1 in H12. inversion H12; subst. clear H12.
                       assert(K1:=JsEq).
                       apply structEqual_eq_sizeOf with (n:=sizeOfStruct s) in K1; auto.
                       rewrite <- K1 in *.                 
                       destruct (@H33 i); auto.
                       assert (loc <= v+i < loc+n). omega.
                       apply H24 in H27. destruct H0. destruct H0.
                       rewrite H27 in H0. inversion H0.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                    (* eqname *)
                    subst n0 p2. rename H29 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       destruct H0 as [ss H0].
                       decompose [and] H0. clear H0.
                       rewrite H12 in H27. inversion H27; subst. clear H27.
                       destruct (@H33 i); auto.
                       assert (loc <= v+i < loc+n). omega.
                       apply H24 in H32. destruct H0. destruct H0.
                       rewrite H32 in H0. inversion H0.
                       (*meta is zero*)
                       assert (KK:=validAddressRange).
                       subst.
                       absurd_hyp H14; omega.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H21 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* v+i < loc *)
               assert (v+i <loc \/ v+i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto.                                                                    
            (*EQ = a* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists (s). split; auto. split; auto.
            intros. 
            assert (K:=H13). apply H19 in H13.
            destruct H13. destruct H16 as [j [J1 J2]].
            split; auto.
            exists (j). split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H16. rewrite <- H16. auto.                                                                    
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H16; auto. subst M S'' TI. clear H16.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K1:=HeqG0). apply H23 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H27 in H16. rewrite <- HeqEQ in H16.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H28.
                    assert (LL:=@H28 l). clear H28.
                    simpl in LL. rewrite K1 in LL.
                    assert (JaEq:=H16).
                    inversion JaEq. subst q2 p1 q1.
                    rename H33 into JpEq. inversion JpEq.
                    subst t1 p2. rename H28 into JaEq'. rename H30 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H35 as [ss H35]. decompose [and] H35. clear H35.
                       simpl in H11. simpl in H0. rewrite sizeOfAType_one in *.
                       rewrite H11 in H0. inversion H0; subst. clear H0.
                       destruct (@H38 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H25 in H35. destruct H0. destruct H0.
                       rewrite H0 in H35. inversion H35.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H22 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H16. rewrite <- H16. auto.                                                                    
            (*EQ = s* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s0 H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists(s0). split; auto. split; auto. subst.
            intros.
            assert (X:=H13). 
            apply H19 in H13.
            destruct H13. destruct H16 as [j [J1 J2]].
            split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H16. rewrite <- H16. 
               exists (j). auto.              
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H16; auto. subst M S'' TI. clear H16.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H23 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H27 in H16. rewrite <- HeqEQ in H16.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H28. clear H31 H32.
                    assert (LL:=@H28 l). clear H28.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H16).
                    inversion JaEq. subst q2 p1 q1.
                    rename H31 into JpEq. inversion JpEq.
                    subst s1 p2. rename H28 into JsEq. rename H30 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H33 as [ss0 H33]. decompose [and] H33. clear H33.
                       simpl in H11. simpl in H0.
                       assert (s0 = sizeOfStruct s) as EE.
                         apply sym_eq in H11. inversion H11; auto.
                       assert(GG:=@structEqual_eq_sizeOf s s2 JsEq (s0) EE).
                       rewrite <- GG in H0. inversion H0; subst. clear H0.
                       destruct (@H36 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H25 in H37. destruct H0. destruct H0.
                       rewrite H37 in H0. inversion H0.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H22 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H16. rewrite <- H16. 
               exists (j). auto.                                                                    
            (*EQ = n* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists(s). split; auto. split; auto. subst.
            intros.
            assert (X:=H13). 
            apply H19 in H13.
            destruct H13. split; auto.
            destruct (le_lt_dec loc (i)).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) (i)).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H20. rewrite <- H20. auto.                                                                    
               (* i < loc +size *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H20; auto. subst M S'' TI. clear H20.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K:=HeqG0). apply H24 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H28 in H20. rewrite <- HeqEQ in H20.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H29. clear H32 H33.
                    assert (LL:=@H29 l). clear H29.
                    simpl in LL. rewrite K in LL.
                    assert (JaEq:=H20).
                    inversion JaEq. subst q2 p1 q1.
                    rename H32 into JpEq. inversion JpEq.
                    (* namename *)
                    subst n1 p2. rename H33 into JsEq. rename H31 into EQ.
                    rename H29 into Htab1. rename H32 into Htab2.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H34 as [ss H34]. decompose [and] H34. clear H34.
                       simpl in H11. rewrite Htab1 in H11.
                       simpl in H0. rewrite Htab2 in H0.
                       assert(K1:=JsEq).
                       apply structEqual_eq_sizeOf with (n:=sizeOfStruct s1) in K1; auto.
                       rewrite <- K1 in *.
                       destruct (@H37 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H26 in H38. destruct H31. destruct H31.
                       rewrite H38 in H31. inversion H31.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                    (* eqname *)
                    subst n0 p2. rename H31 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H34 as [ss H34]. decompose [and] H34. clear H34.
                       simpl in H11. simpl in H0.
                       remember (typeTable c) as TC.
                       destruct TC; inversion H0; subst. inversion H11; subst.
                       destruct (@H37 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H26 in H38. destruct H31. destruct H31.
                       rewrite H38 in H31. inversion H31.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H23 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H20. rewrite <- H20. auto.                                                                    
            (*EQ = void* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            destruct H16 as [s H16]. decompose [and] H16. clear H16.
            left. split; auto. split; auto. split; auto.
            exists (s). split; auto. split; auto.
            intros. 
            assert (K:=H13). apply H19 in H13.
            destruct H13. destruct H16 as [j [J1 J2]].
            split; auto.
            exists (j). split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H16. rewrite <- H16. auto.                                                                    
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
                inversion H16; auto. subst M S'' TI. clear H16.
                remember (accessMemMeta M' l) as G.
                destruct G.
                  (*accessMemMeta M' l = some*)
                  apply sym_eq in HeqG0. assert (K1:=HeqG0). apply H23 in HeqG0. 
                  rewrite HeqG in HeqG0. inversion HeqG0. subst.
                    assert (l<loc \/ l >=loc+n). omega.
                    apply H27 in H16. rewrite <- HeqEQ in H16.
                    apply IHs_rhs in H0. unfold wfEnv in H0.
                    decompose [and] H0. clear H0.
                    unfold wfMem in H28.
                    assert (LL:=@H28 l). clear H28.
                    simpl in LL. rewrite K1 in LL.
                    assert (JaEq:=H16).
                    inversion JaEq. subst q2 p1 q1.
                    rename H33 into JpEq. inversion JpEq.
                    subst p2. rename H30 into EQ.
                    rewrite <- EQ in LL. unfold wfData in LL.
                    destruct LL.
                       (*meta is non-zero*)
                       decompose [and] H0. clear H0.
                       destruct H35 as [ss H35]. decompose [and] H35. clear H35.
                       rewrite H11 in H0. inversion H0; subst. clear H0.
                       destruct (@H38 i); auto.
                       assert (loc <= i < loc+n). omega.
                       apply H25 in H35. destruct H0. destruct H0.
                       rewrite H0 in H35. inversion H35.
                       (*meta is zero*)
                        subst. assert (False). apply H12; auto. inversion H0.
                  (*accessMemMeta M' l = None*)
                  apply sym_eq in HeqG0.
                    assert (l < loc \/ l >= loc+n). omega.
                    apply H22 in HeqG0; auto. rewrite HeqG in HeqG0. inversion HeqG0.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H16. rewrite <- H16. auto.                 

            (*EQ = a* tame*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            intros. 
            assert (K:=H11). apply H16 in H11.
            destruct H11.
            split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto. 
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
               exists (P_VoidPtr).
               inversion H18; auto.
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto.                                                                    
            (*EQ = s* tame*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11 as [J1 J2].
            split; auto.
            destruct (le_lt_dec loc i).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) i).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H11. rewrite <- H11. auto.              
               (* i < loc +n *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
               exists (P_VoidPtr).
               inversion H11; auto. 
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H11. rewrite <- H11.  auto. 
            (*EQ = n* seq*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto. subst.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (i)).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) (i)).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto. 
               (* i < loc +size *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
               exists (P_VoidPtr).
               inversion H18; auto. 
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto. 
            (*EQ = void* tame*)
            destruct K; auto.
            decompose [and] H11. clear H11.
            left. split; auto. split; auto. split; auto. subst.
            intros.
            assert (X:=H11). 
            apply H16 in H11.
            destruct H11. split; auto.
            destruct (le_lt_dec loc (i)).
             (*loc  <= i*)
             destruct (le_lt_dec (loc+n) (i)).
               (*loc +n <= i*)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto. 
               (* i < loc +size *)
               destruct E' as [M' S' TI'].
               apply malloc__inversion in J.
               destruct J as [M [TI J]].
               decompose [and] J. clear J.
               exists (P_VoidPtr).
               inversion H18; auto. 
             (* i < loc *)
               assert (i <loc \/ i >=loc+n). omega.
               apply H5 in H18. rewrite <- H18. auto. 
Qed.

Lemma wfE__s_rhs__wfE__TameCase : 
forall E E' E'' rhs ds loc n be size p,
  s_rhs E rhs (RVal ds) A_Int E' ->
  wfEnv E ->
  (wfEnv E -> wfEnv E') ->
  wf_AType (A_Pointer p Tame) ->
  fst ds = (n, be) ->
  sizeOfPType p = Some size ->
  size > 0 ->
  malloc E' n = Some (E'', loc) ->
  wfEnv (MkEnv (mem E'') (stack E'') (updateTypeInfo (typeInfo E'') loc p n)).
Proof.
  intros E E' E'' rhs ds loc n be size p 
             H H0 IHs_rhs H1 H2 H3 H4 H5.

    assert (True) as H6. auto.
    assert (J:=H5).
    destruct E'' as [M'' S'' TI''].
    apply malloc__wfE in H5; auto.
    simpl in *. unfold wfEnv in H5.
    decompose [and] H5. clear H5.
    unfold wfMem in H7.
    split.
      (*wfMem*)
      unfold wfMem. intros. simpl in *.
      assert (K:=@H7 l). clear H7.
      remember (accessMemMeta M'' l) as G.
      destruct G; auto.
        destruct (le_lt_dec loc l).
         (*loc <= l*)
         destruct (le_lt_dec (loc+n) l).
          (*loc + n <= l*)
          assert (l<loc \/ l >=loc+n). omega.
          eapply wfE__s_rhs__wfE__TameCase__outsideCase; eauto.

          (*loc <= l < loc + n *)
          apply sym_eq in HeqG.
          destruct (@updateTameTypeInfo_inversion TI'' loc p n (updateTypeInfo TI'' loc p n) H1); auto.
          unfold wfData in *.
          destruct p0. destruct m.
          destruct E' as [M' S' TI'].
          apply malloc__inversion in J.
          destruct J as [M [TI J]].
          decompose [and] J. clear J.
          inversion H8; auto. subst M S'' TI. clear H8.
          assert (loc <= l < loc + n). omega.
          apply H17 in H8. rewrite HeqG in H8. inversion H8; subst.
          clear K.
          remember (updateTypeInfo TI'' loc p n l) as EQ.
          destruct (EQ); auto; destruct p0; destruct q; auto.
          assert (loc <= l < loc + n). omega.
          apply H7 in H19.
          rewrite <- HeqEQ in H19.
          inversion H19; subst. inversion H26.

          (* l < loc *)
          assert (l<loc \/ l >=loc+n). omega.
          eapply wfE__s_rhs__wfE__TameCase__outsideCase; eauto.

    split.
      (*wfStack*)
      unfold wfStack in *.
      decompose [and] H9. clear H9.
      split; auto.

      (*wf...*)
      intros. simpl in *. assert (JJ:=H5).
      apply H10 in H5. destruct H5.
      split; auto.
      intros. rewrite sizeOfAType_one in *. 
      assert (i=0). omega. subst.
      apply H8 in H11.
      assert (loc0+0=loc0). omega. rewrite H12 in *. clear H12.
      destruct (@updateTameTypeInfo_inversion TI'' loc p n (updateTypeInfo TI'' loc p n) H1); auto.
      destruct (le_lt_dec loc loc0).
         (*loc <= loc0*)
         destruct (le_lt_dec (loc+n) loc0).
          (*loc + n <= loc0*)
          assert (loc0<loc \/ loc0 >=loc+n). omega.
          apply H12 in H14. rewrite <- H14; auto.
          (*loc <= loc0 < loc + n*)
          destruct E' as [M' S' TI'].
          apply malloc__inversion in J.
          destruct J as [M [TI J]].
          decompose [and] J. clear J.
          inversion H14; auto. subst M S'' TI. clear H14.
          assert (loc <= loc0 < loc+n). omega.
          apply H20 in H14.
          apply IHs_rhs in H0.
          unfold wfEnv in H0. decompose [and] H0. clear H0. clear H23 H26.
          apply H27 in JJ. destruct JJ. simpl in *.
          rewrite sizeOfAType_one in *.  
          unfold validAddresses in H0. destruct H0.
          destruct H0. destruct H0.  rewrite H0 in H14. inversion H14.
        (*loc0 < loc*)
        assert (loc0<loc \/ loc0 >=loc+n). omega.
        apply H12 in H14. rewrite <- H14; auto.
Qed.

Lemma wfE__s_rhs__wfE :
(forall E rhs R t E', s_rhs E rhs R t E' -> (wfEnv E -> wfEnv E')).
Proof.
  intros.
  induction H; auto.
    eapply wfE__s_rhs__wfE__nonTameCase; eauto.
      unfold not. intros. inversion H7.
    eapply wfE__s_rhs__wfE__nonTameCase; eauto.
      unfold not. intros. inversion H6.
    eapply wfE__s_rhs__wfE__TameCase; eauto.
Qed.

Lemma s_rhs__TI_preserve : forall E rhs ds t E', 
  s_rhs E rhs (RVal ds) t E' -> 
  wfEnv E ->
  (forall i, 
  validAddress E.(mem) i ->
  atypeEqual (E.(typeInfo) i) (E'.(typeInfo) i)).
Proof.
   intros.
   remember (RVal ds) as R.
   generalize dependent ds.
   generalize dependent i.
   induction H; intros; 
     try solve[eauto | eapply atypeEqual_refl; eauto].
     assert (atypeEqual (typeInfo E i) (typeInfo E' i)) as EQ1.
       apply IHs_rhs1 with (ds:=ds1); auto.
     assert (atypeEqual (typeInfo E' i) (typeInfo E'' i)) as EQ2.
       apply IHs_rhs2 with (ds:=ds2); auto.
         apply wfE__s_rhs__wfE in H; auto.
         eapply validAddress__s_rhs__validAddress; eauto.
     eapply atypeEqual_trans; eauto.

     subst. unfold Error in H2. inversion H2; inversion H4.

     assert (atypeEqual (typeInfo E i) (typeInfo E' i)) as EQ1.
       apply IHs_rhs1 with (ds:=ds1); auto.
     assert (atypeEqual (typeInfo E' i) (typeInfo E'' i)) as EQ2.
       apply IHs_rhs2 with (ds:=ds2); auto.
         apply wfE__s_rhs__wfE in H; auto.
         eapply validAddress__s_rhs__validAddress; eauto.
     eapply atypeEqual_trans; eauto.
    
     subst. unfold Error in H2. inversion H2; inversion H3.

     destruct E' as [M' S' TI'].
     destruct E'' as [M'' S'' TI''].
     apply malloc__inversion in H6.
     destruct H6 as [M''' [TI''' H6]].
     decompose [and] H6. clear H6.
     inversion H8; auto. subst M''' S'' TI'''. clear H8.
     simpl in *.
     assert (atypeEqual (typeInfo E i) (TI' i)) as EQ1.
       eapply IHs_rhs; eauto.
     assert (atypeEqual (TI' i) (TI'' i)) as EQ2.
       destruct (le_lt_dec loc i).
           destruct (le_lt_dec (loc+n) i).
               assert (i<loc \/ i>=loc+n). omega. apply H16 in H6; auto.
                 eapply atypeEqual_symm; eauto.
               assert (loc<=i<loc+n). omega. apply H14 in H6.
                 assert (validAddress (mem (MkEnv M' S' TI')) i).
                   eapply validAddress__s_rhs__validAddress; eauto.
                 destruct H8. destruct H8. simpl in *. rewrite H6 in H8. inversion H8.
            assert (i<loc \/ i>=loc+n). omega. apply H16 in H6; auto.
             eapply atypeEqual_symm; eauto.
      eapply atypeEqual_trans with (a':=TI'' i); eauto.
        eapply atypeEqual_trans; eauto.
      destruct (updateNonTameTypeInfo_inversion TI'' loc p size n (updateTypeInfo TI'' loc p n) Safe H1 H3) as [J1 J2]; auto.
         unfold not. intros. inversion H6.
      destruct (le_lt_dec loc i).
           destruct (le_lt_dec (loc+n) i).
               assert (i<loc \/ i>=loc+n). omega. apply J1 in H6; auto.
                 rewrite <- H6. apply atypeEqual_refl.
               assert (loc<=i<loc+n). omega. apply H14 in H6.
                 assert (validAddress (mem (MkEnv M' S' TI')) i).
                   eapply validAddress__s_rhs__validAddress; eauto.
                 destruct H8. destruct H8. simpl in *. rewrite H6 in H8. inversion H8.
            assert (i<loc \/ i>=loc+n). omega. apply J1 in H6; auto.
              rewrite <- H6. apply atypeEqual_refl.

     destruct E' as [M' S' TI'].
     destruct E'' as [M'' S'' TI''].
     apply malloc__inversion in H5.
     destruct H5 as [M''' [TI''' H5]].
     decompose [and] H5. clear H5.
     inversion H7; auto. subst M''' S'' TI'''. clear H7.
     simpl in *.
     assert (atypeEqual (typeInfo E i) (TI' i)) as EQ1.
       eapply IHs_rhs; eauto.
     assert (atypeEqual (TI' i) (TI'' i)) as EQ2.
       destruct (le_lt_dec loc i).
           destruct (le_lt_dec (loc+n) i).
               assert (i<loc \/ i>=loc+n). omega. apply H15 in H5; auto.
                 eapply atypeEqual_symm; eauto.
               assert (loc<=i<loc+n). omega. apply H13 in H5.
                 assert (validAddress (mem (MkEnv M' S' TI')) i).
                   eapply validAddress__s_rhs__validAddress; eauto.
                 destruct H7. destruct H7. simpl in *. rewrite H5 in H7. inversion H7.
            assert (i<loc \/ i>=loc+n). omega. apply H15 in H5; auto.
              eapply atypeEqual_symm; eauto.
      eapply atypeEqual_trans with (a':=TI'' i); eauto.
        eapply atypeEqual_trans; eauto.
      destruct (updateNonTameTypeInfo_inversion TI'' loc p size n (updateTypeInfo TI'' loc p n) Seq H1 H3) as [J1 J2]; auto.
         unfold not. intros. inversion H5.
      destruct (le_lt_dec loc i).
           destruct (le_lt_dec (loc+n) i).
               assert (i<loc \/ i>=loc+n). omega. apply J1 in H5; auto.
                 rewrite <- H5. apply atypeEqual_refl.
               assert (loc<=i<loc+n). omega. apply H13 in H5.
                 assert (validAddress (mem (MkEnv M' S' TI')) i).
                   eapply validAddress__s_rhs__validAddress; eauto.
                 destruct H7. destruct H7. simpl in *. rewrite H5 in H7. inversion H7.
            assert (i<loc \/ i>=loc+n). omega. apply J1 in H5; auto.
              rewrite <- H5. apply atypeEqual_refl.

     destruct E' as [M' S' TI'].
     destruct E'' as [M'' S'' TI''].
     apply malloc__inversion in H5.
     destruct H5 as [M''' [TI''' H5]].
     decompose [and] H5. clear H5.
     inversion H7; auto. subst M''' S'' TI'''. clear H7.
     simpl in *.
     assert (atypeEqual (typeInfo E i) (TI' i)) as EQ1.
       eapply IHs_rhs; eauto.
     assert (atypeEqual (TI' i) (TI'' i)) as EQ2.
       destruct (le_lt_dec loc i).
           destruct (le_lt_dec (loc+n) i).
               assert (i<loc \/ i>=loc+n). omega. apply H15 in H5; auto.
                 eapply atypeEqual_symm; eauto.
               assert (loc<=i<loc+n). omega. apply H13 in H5.
                 assert (validAddress (mem (MkEnv M' S' TI')) i).
                   eapply validAddress__s_rhs__validAddress; eauto.
                 destruct H7. destruct H7. simpl in *. rewrite H5 in H7. inversion H7.
            assert (i<loc \/ i>=loc+n). omega. apply H15 in H5; auto.
              eapply atypeEqual_symm; eauto.
      eapply atypeEqual_trans with (a':=TI'' i); eauto.
        eapply atypeEqual_trans; eauto.
      destruct (updateTameTypeInfo_inversion TI'' loc p n (updateTypeInfo TI'' loc p n) H1) as [J1 J2]; auto.
      destruct (le_lt_dec loc i).
           destruct (le_lt_dec (loc+n) i).
               assert (i<loc \/ i>=loc+n). omega. apply J1 in H5; auto.
                 rewrite <- H5. apply atypeEqual_refl.
               assert (loc<=i<loc+n). omega. apply H13 in H5.
                 assert (validAddress (mem (MkEnv M' S' TI')) i).
                   eapply validAddress__s_rhs__validAddress; eauto.
                 destruct H7. destruct H7. simpl in *. rewrite H5 in H7. inversion H7.
            assert (i<loc \/ i>=loc+n). omega. apply J1 in H5; auto.
              rewrite <- H5. apply atypeEqual_refl.
Qed.

Lemma wfD__cast__wfD : forall M TI d t t' d', 
  wf_AType t ->
  wf_AType t' ->
  wfData M TI d t ->
  dataCast t' d t = Some d' ->
  assertion_dataCast t' d t ->
  convertible t' t ->
  wfData M TI d' t'.
Proof.
  intros M TI d t t' d' Hwft Hwft' HwfD Hcast Hassert Hconv.
  destruct d as [v [b e]].
  destruct d' as [v' [b' e']].
  destruct t'; unfold wfData;
    (* t' = int *)
    simpl; auto.
    (* t' = p* q *)
    destruct q.
    (* t'.q = Safe *)
      destruct p.
      (* t'.p = patype *)
        destruct t.
        (* t = int *)
          inversion Hconv.
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv; subst. 
             unfold wfData in HwfD; auto.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             rewrite sizeOfAType_one in *.
             destruct HwfD; auto.
               decompose [and] H. clear H.
               left. split; auto. split; auto. split; auto.
               intros i G.
                 apply H5 in G. destruct G as [G1 G2].
                 split; auto.
                   eapply atypeEqual_trans; eauto.
                     apply atypeEqual_symm; auto.
                   subst; auto.
           (*t.q = Seq *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             unfold wfData in HwfD; auto.
             destruct Hassert as [J | Hassert]; auto.
               remember (sizeOfPType p) as G.
               destruct G; try solve [inversion G].
                 destruct Hassert as [G1 G2].
                 destruct HwfD as [[G3 [G4 [G5 [s [G6 [G7 G8]]]]]] | Hwfd].
                 rewrite sizeOfAType_one in *.
                 left. split. omega.
                     split. omega.
                     split. inversion G6; subst. 
                            assert (e' > s /\ v' < e') as JJ.
                              apply omega_ex1 in G2; auto. 
                            destruct JJ. omega.
                     intros i J.
                     assert (b' <= v'+i < e') as EQ. 
                       inversion G6; subst. 
                       assert (e' > s /\ v' < e') as JJ.
                         apply omega_ex1 in G2; auto. 
                       destruct JJ. omega.
                     apply G8 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     split; auto.
                     destruct EQ2 as [j [EQ2 EQ3]].
                     assert (v' + i = v'). omega. 
                     assert (i = 0) as EQ. omega.
                     inversion G6. subst s i.
                     assert (mmod (v'+0) v' n = Some 0) as EQ.
                       apply mmod_inv; auto.
                     rewrite EQ2 in EQ. inversion EQ; subst j.
                     rewrite H in *. clear H.
                     inversion Hconv; subst.
                     simpl in EQ3. inversion EQ3; subst.
                     eapply atypeEqual_trans; eauto.
                       apply atypeEqual_symm; auto.
                 subst. absurd_hyp G1; auto.
               inversion Hassert.           
           (*t.q = Tame *)
             inversion Hconv.
      (* t'.p = pstruct *)
        destruct t.
        (* t = int *)
          inversion Hconv.
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv; subst; clear Hconv.
               unfold wfData in HwfD; auto.
               unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
               destruct HwfD; auto.
                 decompose [and] H. clear H.
                 assert (J:=H0).
                 apply structEqual_symm in H0.
                 apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H0; auto.
                 rewrite H0 in *.
                 left. 
                   split; auto.
                   split; auto. 
                   split. omega.
                   intros i G.
                     apply H5 in G. destruct G as [G1 G2].
                     split; auto.
                       assert(JK:=@structEqual__getStructNthPType s s2 i J).
                       eapply optionAtypeEqual_trans with (getStructNthType s2 i); eauto.
                         apply optionAtypeEqual_symm; eauto.
           (*t.q = Seq *)
             unfold convertible in Hconv. 
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
             unfold wfData in HwfD; auto.
             destruct Hassert as [J | Hassert]; auto.
               remember (sizeOfPType p) as G.
               destruct G; try solve [inversion G].
                 destruct Hassert as [G1 G2].
                 destruct HwfD as [[G3 [G4 [G5 [n' [G6 [G7 G8]]]]]] | Hwfd].
                 inversion G6; subst.
                 inversion Hconv; subst; simpl in *.
                   assert (J:=H0).
                   apply structEqual_symm in H0.
                   apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H0; auto.
                   rewrite H0 in *.
                   inversion HeqG; subst.
                   left. split. auto.
                     split. omega.
                     split. assert (e' > sizeOfStruct s /\ v' < e') as JJ.
                              apply omega_ex1 in G2; auto. 
                            destruct JJ. omega.
                     intros i JJ.
                     assert (b' <= v'+i < e') as EQ. 
                        assert (e' > sizeOfStruct s /\ v' < e') as KK.
                          apply omega_ex1 in G2; auto. 
                        destruct KK. omega.
                     apply G8 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     split; auto.
                     destruct EQ2 as [j [EQ2 EQ3]].
                     assert (mmod (v'+i) v' (sizeOfStruct s) = Some i) as EQ.
                       apply mmod_inv; omega.
                     rewrite EQ in EQ2. inversion EQ2; subst.
                     assert(JK:=@structEqual__getStructNthPType s s2 j J).
                     eapply optionAtypeEqual_trans with (getStructNthType s2 j); eauto.
                         apply optionAtypeEqual_symm; eauto.
                 subst. absurd_hyp G1; auto.
               inversion Hassert.           
           (*t.q = Tame *)
             inversion Hconv.
      (* t'.p = name *)
        destruct t.
        (* t = int *)
          inversion Hconv.
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv; subst; clear Hconv.
               (* namename *)
               unfold wfData in HwfD; auto.
               unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
               destruct HwfD; auto.
                 destruct H as [s2' H].
                 decompose [and] H. clear H.
                 rewrite H1 in H3. inversion H3; subst.
                 assert (J:=H2).
                 apply structEqual_symm in H2.
                 apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2') in H2; auto.
                 rewrite H2 in *.
                 left. 
                   exists(s1).
                   split; auto.
                   split; auto. 
                   split. omega.
                   split. omega.
                   intros i G.
                     apply H8 in G. destruct G as [G1 G2].
                     split; auto.
                       assert(JK:=@structEqual__getStructNthPType s1 s2' i J).
                       eapply optionAtypeEqual_trans with (getStructNthType s2' i); eauto.
                         apply optionAtypeEqual_symm; eauto.
               (* eqname *)
               unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
               auto.
           (*t.q = Seq *)
             unfold convertible in Hconv. 
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
             unfold wfData in HwfD; auto.
             destruct Hassert as [J | Hassert]; auto.
               remember (sizeOfPType p) as G.
               destruct G; try solve [inversion G].
                 destruct Hassert as [G1 G2].
                 destruct HwfD as [[G3 [G4 [G5 [n' [G6 [G7 G8]]]]]] | Hwfd].
                 inversion G6; subst.
                 inversion Hconv; subst; simpl in *.
                   (* namename *)
                   rewrite H1 in *. inversion HeqG; subst.
                   assert (J:=H2).
                   apply structEqual_symm in H2.
                   apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H2; auto.
                   rewrite H2 in *.
                   inversion HeqG; subst.
                   left. exists(s1).
                     split. auto.
                     split. auto.
                     split. omega.
                     split. assert (e' > sizeOfStruct s1 /\ v' < e') as JJ.
                              apply omega_ex1 in G2; auto. 
                            destruct JJ. omega.
                     intros i JJ.
                     assert (b' <= v'+i < e') as EQ. 
                       assert (e' > sizeOfStruct s1 /\ v' < e') as KK.
                         apply omega_ex1 in G2; auto. 
                       destruct KK. omega.
                     apply G8 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     split; auto.
                     destruct EQ2 as [j [EQ2 EQ3]].
                     assert (mmod (v'+i) v' (sizeOfStruct s1) = Some i) as EQ.
                       apply mmod_inv; omega.
                     rewrite EQ in EQ2. inversion EQ2; subst.
                     assert(JK:=@structEqual__getStructNthPType s1 s2 j J).
                     eapply optionAtypeEqual_trans with (getStructNthType s2 j); eauto.
                       apply optionAtypeEqual_symm; eauto.
                   (* eqname *)
                   remember (typeTable c) as TC.
                   destruct TC; inversion HeqG; subst.
                   left. exists(s).
                     split. auto.
                     split. auto.
                     split. omega.
                     split. assert (e' > sizeOfStruct s /\ v' < e') as JJ.
                              apply omega_ex1 in G2; auto. 
                            destruct JJ. omega.
                     intros i JJ.
                     assert (b' <= v'+i < e') as EQ. 
                       assert (e' > sizeOfStruct s /\ v' < e') as KK.
                         apply omega_ex1 in G2; auto. 
                       destruct KK. omega.
                     apply G8 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     split; auto.
                     destruct EQ2 as [j [EQ2 EQ3]].
                     assert (mmod (v'+i) v' (sizeOfStruct s) = Some i) as EQ.
                       apply mmod_inv; omega.
                     rewrite EQ in EQ2. inversion EQ2; subst.
                     eapply optionAtypeEqual_trans with (getStructNthType s j); eauto.
                       apply optionAtypeEqual_refl; auto.
                 subst. absurd_hyp G1; auto.
               inversion Hassert.           
           (*t.q = Tame *)
             inversion Hconv.
      (* t'.p = void *)
         inversion Hwft'. subst. inversion H1.
    (* t'.q = Seq *)
      destruct p.
      (* t'.p = patype *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             remember (sizeOfPType p) as G.
             destruct G; try solve [inversion Hcast; subst].
               inversion Hcast; subst.
               inversion Hconv. subst.
               unfold wfData in HwfD.
               destruct HwfD as [[G3 [G4 [G5 G6]]] | Hwfd]; auto.
                 assert (J:=validAddressRange).
                 simpl in HeqG. inversion HeqG; subst.
                 left. split. omega.
                     split. omega.
                     split. omega.
                     simpl. exists(sizeOfAType a).
                     split; auto.
                     split. rewrite sizeOfAType_one. auto.
                     intros i H.
                     rewrite sizeOfAType_one in *.
                     assert (0 <= 0 < 1) as EQ. omega.
                     apply G6 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     assert (i = b') as EQ. omega. subst.
                     assert (b' + 0 = b'). omega. 
                     rewrite H1 in *.                     
                     split; auto.
                     exists (0).
                     assert (mmod (b'+0) b' 1 = Some 0) as EQ.
                       apply mmod_inv; omega.
                     rewrite H1 in EQ.
                     split; auto.
                       apply optionAtypeEqual_some.
                         eapply atypeEqual_trans; eauto.
                           apply atypeEqual_symm; eauto.
           (*t.q = Seq *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             unfold wfData in HwfD; auto.
             destruct HwfD; auto.
               decompose [and] H. clear H.
               left. split; auto. split; auto. split; auto.
               destruct H4 as [s [G1 [G2 G3]]].
               exists(s).
               split. inversion Hconv; subst. simpl in *.
                      rewrite sizeOfAType_one in *; auto.
               split; auto.
               intros i G.
                 apply G3 in G. destruct G as [G4 G5].
                 split; auto.
                   destruct G5 as [j [G6 G7]].
                   exists(j). split; auto.
                              inversion Hconv; subst. simpl in *.
                              destruct j.
                              apply optionAtypeEqual_some.
                                inversion G7. subst.
                                eapply atypeEqual_trans; eauto.
                                  apply atypeEqual_symm; auto.
                              inversion G7.
           (*t.q = Tame *)
             inversion Hconv.
      (* t'.p = pstruct *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             remember (sizeOfPType p) as G.
             destruct G; try solve [inversion Hcast; subst].
               inversion Hcast; subst.
               inversion Hconv; subst.
                 unfold wfData in HwfD.
                 destruct HwfD as [[G3 [G4 [G5 G6]]] | Hwfd]; auto.
                   assert (J:=validAddressRange).
                   simpl in HeqG. inversion HeqG; subst.
                   assert (JK:=H0).
                   apply structEqual_symm in H0.
                   apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H0; auto.
                   rewrite H0 in *.
                   left. 
                     split. omega.
                     split. omega.
                     split. omega.
                     simpl. exists(sizeOfStruct s).
                     split; auto.
                     split. auto.
                     intros i H.
                     assert (0 <= i-b' < sizeOfStruct s) as EQ. omega.
                     apply G6 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     assert (b' + (i - b') = i) as EQ. omega. 
                     rewrite EQ in EQ1. rewrite EQ in EQ2.
                     split; auto.
                     exists (i-b'). split.
                       rewrite <- EQ. clear Hcast.
                       assert (i - b' = b' + (i - b') - b') as EQ'. omega.
                       rewrite <- EQ'.
                       apply mmod_inv; auto. omega.

                       assert(JK':=@structEqual__getStructNthPType s s2 (i-b') JK).
                       eapply optionAtypeEqual_trans with (getStructNthType s2 (i-b')); eauto.
                         apply optionAtypeEqual_symm; eauto.
           (*t.q = Seq *)
             unfold convertible in Hconv. 
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
             unfold wfData in HwfD; auto.
             destruct HwfD as [[G3 [G4 [G5 [n [G6 [G7 G8]]]]]] | Hwfd]; auto.
                 inversion Hconv; subst.
                   assert (JK:=H0).
                   apply structEqual_symm in H0. simpl in *. 
                   inversion G6; subst.
                   apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H0; auto.
                   rewrite H0 in *.
                   left. split. auto.
                     split. omega.
                     split. auto.
                     simpl. exists(sizeOfStruct s).
                     split; auto.
                     split. auto.
                     intros i J.
                     apply G8 in J.
                     destruct J as [J1 J2].
                     split; auto.
                       destruct J2 as [j [J2 J3]].
                       exists(j).
                          split; auto.
                           assert(JK':=@structEqual__getStructNthPType s s2 j JK).
                           eapply optionAtypeEqual_trans with (getStructNthType s2 j); eauto.
                             apply optionAtypeEqual_symm; eauto.
           (*t.q = Tame *)
             inversion Hconv.
      (* t'.p = name *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             remember (sizeOfPType p) as G.
             destruct G; try solve [inversion Hcast; subst].
               inversion Hcast; subst.
               inversion Hconv; subst.
                 (* namename *)
                 unfold wfData in HwfD.
                 destruct HwfD as [[s2' [G3 [G4 [G5 [G6 G7]]]]] | Hwfd]; auto.
                 rewrite H1 in G3. inversion G3; subst.
                 assert (J:=validAddressRange).
                 simpl in HeqG. inversion HeqG; subst.
                 rewrite H1 in *. inversion H3; subst.
                 assert (JK:=H2).
                 apply structEqual_symm in H2.
                 apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2') in H2; auto.
                 rewrite H2 in *.
                 left. split. omega.
                     split. omega.
                     split. omega.
                     simpl. rewrite H0 in *. exists(sizeOfStruct s1).
                     split; auto.
                     split. auto.
                     intros i H.
                     assert (0 <= i-b' < sizeOfStruct s1) as EQ. omega.
                     apply G7 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     assert (b' + (i - b') = i) as EQ. omega. 
                     rewrite EQ in EQ1. rewrite EQ in EQ2.
                     split; auto.
                     exists (i-b'). split.
                       rewrite <- EQ. clear Hcast.
                       assert (i - b' = b' + (i - b') - b') as EQ'. omega.
                       rewrite <- EQ'.
                       apply mmod_inv; auto. omega.

                       assert(JK':=@structEqual__getStructNthPType s1 s2' (i-b') JK).
                       eapply optionAtypeEqual_trans with (getStructNthType s2' (i-b')); eauto.
                         apply optionAtypeEqual_symm; eauto.
                 (* eqname *)
                 unfold wfData in HwfD.
                 destruct HwfD as [[s2' [G3 [G4 [G5 [G6 G7]]]]] | Hwfd]; auto.
                 simpl in HeqG. rewrite G3 in HeqG. inversion HeqG; subst.
                 assert (J:=validAddressRange).
                 left. split. omega.
                     split. omega.
                     split. omega.
                     simpl. rewrite G3 in *. exists(sizeOfStruct s2').
                     split; auto.
                     split. auto.
                     intros i H.
                     assert (0 <= i-b' < sizeOfStruct s2') as EQ. omega.
                     apply G7 in EQ.
                     destruct EQ as [EQ1 EQ2].
                     assert (b' + (i - b') = i) as EQ. omega. 
                     rewrite EQ in EQ1. rewrite EQ in EQ2.
                     split; auto.
                     exists (i-b'). split.
                       rewrite <- EQ. clear Hcast.
                       assert (i - b' = b' + (i - b') - b') as EQ'. omega.
                       rewrite <- EQ'.
                       apply mmod_inv; auto. omega.

                       eapply optionAtypeEqual_trans with (getStructNthType s2' (i-b')); eauto.
                         apply optionAtypeEqual_refl.
           (*t.q = Seq *)
             unfold convertible in Hconv. 
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast. inversion Hcast; subst. clear Hcast.
             unfold wfData in HwfD; auto.
             destruct HwfD as [[G3 [G4 [G5 [n [G6 [G7 G8]]]]]] | Hwfd]; auto.
                 inversion Hconv; subst.
                   (* namename *)
                   simpl in *. rewrite H1 in *. rewrite H0 in *.
                   assert (JK:=H2).
                   apply structEqual_symm in H2. 
                   inversion G6; subst.
                   apply structEqual_eq_sizeOf with (n:=sizeOfStruct s2) in H2; auto.
                   rewrite H2 in *.
                   left. split. auto.
                     split. omega.
                     split. auto.
                     simpl. exists(sizeOfStruct s1).
                     split; auto.
                     split. auto.
                     intros i J.
                     apply G8 in J.
                     destruct J as [J1 J2].
                     split; auto.
                       destruct J2 as [j [J2 J3]].
                       exists(j).
                          split; auto.
                          assert(JK':=@structEqual__getStructNthPType s1 s2 j JK).
                          eapply optionAtypeEqual_trans with (getStructNthType s2 j); eauto.
                            apply optionAtypeEqual_symm; eauto.
                   (* eqname *)
                   simpl in *.
                   remember (typeTable c) as G.
                   destruct G; inversion G6; subst.
                   left. split. auto.
                     split. omega.
                     split. auto.
                     simpl. exists(sizeOfStruct s).
                     split; auto.
            (*t.q = Tame *)
             inversion Hconv.
    (* t'.p = void *)
         inversion Hwft'. subst. inversion H1.
    (* t'.q = Tame *)
      destruct p.
      (* t'.p = patype *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv.
          (* t.q = Seq *)
             inversion Hconv.
           (*t.q = Tame *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             unfold wfData in HwfD; auto.
      (* t'.p = pstruct *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv.
           (*t.q = Seq *)
             inversion Hconv.
           (*t.q = Tame *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             unfold wfData in HwfD; auto.
      (* t'.p = pname *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv.
           (*t.q = Seq *)
             inversion Hconv.
           (*t.q = Tame *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             unfold wfData in HwfD; auto.
      (* t'.p = void *)
        destruct t.
        (* t = int *)
          unfold dataCast in Hcast. inversion Hcast; subst. auto.          
        (* t = p* q *)
          destruct q.
          (* t.q = Safe *)
             inversion Hconv.
          (* t.q = Seq *)
             inversion Hconv.
           (*t.q = Tame *)
             unfold convertible in Hconv.
             unfold assertion_dataCast in Hassert.
             unfold dataCast in Hcast.
             inversion Hcast; subst.
             unfold wfData in HwfD; auto.
Qed.

Lemma wfD__atypeEqual__wfD : forall M TI d t1 t2,
  wfData M TI d t1 ->
  atypeEqual t1 t2 ->
  wfData M TI d t2.
Proof.
  intros M TI d t1 t2 Hwfd Heq.
  destruct d as [v [b e]].
  destruct t1.
    destruct t2.
      simpl; auto.
      inversion Heq.
    destruct t2.
      inversion Heq.
      destruct q; destruct q0; inversion Heq; subst; simpl in *.
        destruct p; destruct p0; inversion H2; subst; auto.
          destruct Hwfd as [[J1 [J2 [J3 J4]]] | J]; auto.
            rewrite sizeOfAType_one in *.
            left. split; auto. split; auto. split; auto.
            intros i H. 
            apply J4 in H. destruct H as [J5 J6].
            split; auto.
              eapply atypeEqual_trans; eauto.
          destruct Hwfd as [[J1 [J2 [J3 J4]]] | J]; auto.
            assert (J5:=@structEqual_eq_sizeOf s s0 H1 (sizeOfStruct s)).
            rewrite J5 in *; auto.
            left. split; auto. split; auto. split; auto.
            intros i H. 
            apply J4 in H. destruct H as [J6 J7].
            split; auto.
              assert(J8:=@structEqual__getStructNthPType s s0 i H1).
              eapply optionAtypeEqual_trans; eauto.
          destruct Hwfd as [[s [J1 [J2 [J3 [J4 J5]]]]] | J]; auto.
            rewrite J1 in H1. inversion H1; subst.
            assert (J50:=@structEqual_eq_sizeOf s1 s2 H5 (sizeOfStruct s1)).
            left. exists(s2).
            rewrite J50 in *; auto.
            split; auto. split; auto. split; auto. split; auto.
            intros i H. 
            apply J5 in H. destruct H as [J6 J7].
            split; auto.
              assert(J8:=@structEqual__getStructNthPType s1 s2 i H5).
              eapply optionAtypeEqual_trans; eauto.
        inversion H4.   
        inversion H4.   
        inversion H4.   
        destruct Hwfd as [[J1 [J2 [J3 J4]]] | J]; auto.
          left. split; auto. split; auto. split; auto.
          destruct J4 as [s [J5 [J6 J7]]].
          exists(s).
          split; auto.
            assert (G:=@ptypeEqual_eq_sizeOf p p0 H2 s).
            rewrite G; auto.
          split; auto.
          intros i H. 
          apply J7 in H. destruct H as [J8 J9].
          split; auto.
            destruct J9 as [j [J10 J11]].
            exists(j).
              split; auto.
                assert(K:=@pEqual__getNthPType p p0 j H2).
                eapply optionAtypeEqual_trans; eauto.
        inversion H4.   
        inversion H4.   
        inversion H4.   
        destruct Hwfd as [[J1 [J2 [J3 J4]]] | J]; auto.
Qed.
 
Lemma wfE_lookUpStack_wfD : forall E l v t ds,
  wfEnv E  ->
  lookUpStack E.(stack) v = Some (l, t) ->
  accessMemMeta (E.(mem)) l = Some ds ->
  wfData E.(mem) E.(typeInfo) ds t
  .
Proof.
  intros.
  unfold wfEnv in H. decompose [and] H. clear H.
  unfold wfMem in H2.  
  assert (J := @H2 l).
  rewrite H1 in J.
  destruct (@H5 v l t H0) as [HvalM Htyp].
  assert (0 <= 0 < sizeOfAType t) as EQ.
    rewrite sizeOfAType_one. omega.
  apply Htyp in EQ.
  assert (l + 0 = l) as EQ'.
    omega.
  rewrite EQ' in EQ. 
  apply wfD__atypeEqual__wfD with (t1:=(typeInfo E l)); auto.
Qed.

Lemma wfE__s_lhs__wfD : forall E lhs loc t ds,
  wfEnv E -> 
  s_lhs E lhs (RLoc loc) t -> 
  accessMemMeta (E.(mem)) loc = Some ds ->
  wfData E.(mem) E.(typeInfo) ds t
  .
Proof.
  intros E lhs loc t ds Hwfe Hs_lhs.
  remember (RLoc loc) as R.
  generalize dependent ds.
  generalize dependent loc.
  induction Hs_lhs; intros; inversion HeqR; subst.
    eapply wfE_lookUpStack_wfD; eauto.
    (* S_Deref *)
    unfold wfEnv in Hwfe.
    assert (G:=Hwfe).
    destruct Hwfe as [HwfM [HwfS HwfO]].
    assert (J:=@HwfM loc0).
    rewrite H1 in J.
    assert (s_lhs E (C_Deref lhs) (RLoc loc0) t) as Hs_lhs'.
      eapply S_Deref; eauto.    
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in Hs_lhs'; auto.
    destruct Hs_lhs' as [J1 [J2 [J3 J4]]]. simpl in *.
    destruct t.
      unfold wfData; simpl; destruct ds; destruct m; auto.
      destruct q0.
        assert (A_Pointer p Safe = A_Pointer p Safe) as EQ. auto.
        apply J1 in EQ. eapply wfD__atypeEqual__wfD; eauto.
        
        assert (A_Pointer p Seq = A_Pointer p Seq) as EQ. auto.
        apply J2 in EQ. eapply wfD__atypeEqual__wfD; eauto.

        assert (A_Pointer p Tame = A_Pointer p Tame) as EQ. auto.
        apply J3 in EQ. destruct EQ as [p0 EQ]. 
        apply wfD__atypeEqual__wfD with (t2:=A_Pointer p0 Tame) in J; auto.
    (* S_Deref_ErrorProp *)
    unfold Error in H. destruct H as [H | H]; inversion H.
    (* S_StructPos *)
    assert (G:=Hwfe).
    unfold wfEnv in Hwfe.
    destruct Hwfe as [HwfM [HwfS HwfO]]. clear HwfS HwfO.
    assert (J:=@HwfM (loc' + offset)).
    rewrite H3 in J.
    assert (s_lhs E (C_StructPos lhs id) (RLoc (loc' + offset)) t') as Hs_lhs'.
      eapply S_StructPos; eauto.    
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in Hs_lhs'; auto.
    destruct Hs_lhs' as [J1 [J2 [J3 J4]]]. simpl in *.
    destruct t'.
      unfold wfData; simpl; destruct ds; destruct m; auto.
      destruct q0.
        assert (A_Pointer p Safe = A_Pointer p Safe) as EQ. auto.
        apply J1 in EQ. eapply wfD__atypeEqual__wfD; eauto.
        
        assert (A_Pointer p Seq = A_Pointer p Seq) as EQ. auto.
        apply J2 in EQ. eapply wfD__atypeEqual__wfD; eauto.

        assert (A_Pointer p Tame = A_Pointer p Tame) as EQ. auto.
        apply J3 in EQ. destruct EQ as [p0 EQ]. 
        apply wfD__atypeEqual__wfD with (t2:=A_Pointer p0 Tame) in J; auto.
    (* S_StructPos_ErrorProp *)
    unfold Error in H. destruct H as [H | H]; inversion H.
    (* S_NamePos *)
    assert (G:=Hwfe).
    unfold wfEnv in Hwfe.
    destruct Hwfe as [HwfM [HwfS HwfO]]. clear HwfS HwfO.
    assert (J:=@HwfM (loc' + offset)).
    rewrite H4 in J.
    assert (s_lhs E (C_NamePos lhs id) (RLoc (loc' + offset)) t') as Hs_lhs'.
      eapply S_NamePos; eauto.    
    destruct E as [M S TI].
    apply lhs__ptrInvariant with (M:=M) (TI:=TI) (S:=S) in Hs_lhs'; auto.
    destruct Hs_lhs' as [J1 [J2 [J3 J4]]]. simpl in *.
    destruct t'.
      unfold wfData; simpl; destruct ds; destruct m; auto.
      destruct q0.
        assert (A_Pointer p Safe = A_Pointer p Safe) as EQ. auto.
        apply J1 in EQ. eapply wfD__atypeEqual__wfD; eauto.
        
        assert (A_Pointer p Seq = A_Pointer p Seq) as EQ. auto.
        apply J2 in EQ. eapply wfD__atypeEqual__wfD; eauto.

        assert (A_Pointer p Tame = A_Pointer p Tame) as EQ. auto.
        apply J3 in EQ. destruct EQ as [p0 EQ].
        apply wfD__atypeEqual__wfD with (t2:=A_Pointer p0 Tame) in J; auto.
    (* S_NamePos_ErrorProp *)
    unfold Error in H. destruct H as [H | H]; inversion H.
Qed.

Lemma rhs__wft :  forall S rhs t E M TI d E', 
  s_rhs E rhs (RVal d) t E' ->
  E = MkEnv M S TI ->  wfEnv E -> 
  wf_AType t.
Proof.
  intros until 1.
  remember (RVal d) as R.
  generalize dependent M.
  generalize dependent S.
  generalize dependent TI.
  generalize dependent d.
  induction H; intros; inversion HeqR; subst; simpl in *; auto.
    apply wf_A_Int.
    eapply lhs__wft; eauto.
    unfold Error in H0. destruct H0 as [H0 | H0]; inversion H0.
    unfold Error in H0. destruct H0 as [H0 | H0]; inversion H0.
    apply wf_A_Int.
    unfold Error in H0. destruct H0 as [H0 | H0]; inversion H0.
    unfold Error in H1. destruct H1 as [H1 | H1]; inversion H1.
    unfold Error in H0. destruct H0 as [H0 | H0]; inversion H0.
    unfold Error in H1. destruct H1 as [H1 | H1]; inversion H1.
    unfold Error in H0. destruct H0 as [H0 | H0]; inversion H0.
    apply wf_A_Int.
    unfold Error in H0. destruct H0 as [H0 | H0]; inversion H0.
Qed.

Lemma wfE__s_rhs__wfD :
(forall E rhs ds t E', s_rhs E rhs (RVal ds) t E' -> (wfEnv E -> wfData E'.(mem) E'.(typeInfo) (fst ds) t)).
Proof.
   intros.
   remember (RVal ds) as R.
   generalize dependent ds.
   induction H; intros.
     inversion HeqR. simpl. auto.
     (* S_Lhs *)
     inversion HeqR. subst. destruct E as [M S TI]. clear HeqR. simpl. 
     eapply wfE__s_lhs__wfD with (E:=MkEnv M S TI); eauto.
     (* S_Lhs_ErrorProp *)
     subst. unfold Error in H1. inversion H1; inversion H2.
     (* S_Ref_Safe *)
     inversion HeqR; subst; simpl; clear HeqR.
     destruct E as [M S TI]. assert (J:=H).
     apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in H; auto.
     unfold validAddresses in H. decompose [and] H. clear H.
     left.
       rewrite sizeOfAType_one in *.
       split; auto.      
       split; auto.      
       split. omega.
         intros.
         assert (i=0). omega. subst.
         assert (loc+0=loc). omega. rewrite -> H8 in *.
         destruct H3 as [vs H3]. simpl. assert(K:=H3).
         apply accessMemMetaBlock_accessMemMeta with (offset:=0) in H3; auto.
           split; auto.
              apply nontame_ref_lhs__TI with (M:=M) (TI:=TI) (S:=S) in J; auto.
     (* S_Ref_Seq *)
     inversion HeqR; subst; simpl; clear HeqR.
     destruct E as [M S TI]. assert (J:=H).
     apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in H; auto.
     unfold validAddresses in H. decompose [and] H. clear H.
     left.
       split; auto.      
       split; auto.      
       split. omega.
       rewrite sizeOfAType_one in *.
       exists (1).
         split; auto.
         split; auto.
         intros.
         assert (loc = i).
            assert (loc <= i). omega.
            destruct (le_lt_dec i loc).
                clear H7 H5 H.
                apply le_ge__eq; auto.

                assert (loc + 1 <= i). omega.
                assert (i < loc + 1). clear H10. omega.
                absurd_hyp H11; omega.
         subst.
         destruct H3 as [vs H3].
         split.
           simpl.
           apply accessMemMetaBlock_accessMemMeta with (offset:=i-i) in H3; auto.
             omega.

           exists(0).
           split.
             assert (i+0=i). omega.
             assert (mmod (i+0) i 1 = mmod i i 1). rewrite H8. auto.
             rewrite <- H10.
             apply mmod_inv; auto.

             apply nontame_ref_lhs__TI with (M:=M) (TI:=TI) (S:=S) in J; auto.
                apply optionAtypeEqual_some; auto.
     (* S_Ref_Tame *)
     inversion HeqR; subst; simpl; clear HeqR.
     destruct E as [M S TI]. assert (J:=H).
     apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in H; auto.
     unfold validAddresses in H. decompose [and] H. clear H.
     left.
       split; auto.      
       split; auto.      
       split. omega.
         intros.
         destruct H3 as [vs H3]. simpl.
         apply accessMemMetaBlock_accessMemMeta with (offset:=i-loc) in H3; auto.
           assert (loc + (i-loc) = i). omega. rewrite H8 in H3.
           split.
             split; auto.
               intro. destruct (@validAccessMemMeta__validStoreMemMeta M i v); auto.
               clear H8.
               rewrite sizeOfAType_one in *.
               assert (loc = i).
                 assert (loc <= i). omega.
                   destruct (le_lt_dec i loc).
                     clear H7 H5.
                     apply le_ge__eq; auto.

                     assert (loc + 1 <= i). omega.
                     assert (i < loc + 1). clear H10. omega.
                     absurd_hyp H11; omega.
               inversion H1; subst; simpl in *.
                 apply lhs__ptrInvariant with (M:=M) (S:=S) (TI:=TI) in J; auto.
                 destruct J as [J1 [J2 [J3 J4]]]; simpl in *; eapply J3; eauto.     

                 apply lhs__ptrInvariant with (M:=M) (S:=S) (TI:=TI) in J; auto.
                 destruct J as [J1 [J2 [J3 J4]]]; simpl in *; eapply J3; eauto.     

                 apply lhs__ptrInvariant with (M:=M) (S:=S) (TI:=TI) in J; auto.
                 destruct J as [J1 [J2 [J3 J4]]]; simpl in *; eapply J3; eauto.     
           omega.
     (* S_Ref_ErrorProp *)
     subst. unfold Error in H1. inversion H1; inversion H2.
     (* S_Add_Int_Int *)
     inversion HeqR. simpl. auto.
     (* S_Add_Int_Int_ErrorProp1 *)
     subst. unfold Error in H1. inversion H1; inversion H2.
     (* S_Add_Int_Int_ErrorProp2 *)
     subst. unfold Error in H2. inversion H2; inversion H3.
     (* S_Add_Ptr_Int *)
     assert (HH:=H0).
     assert (HHH:=H).
     apply IHs_rhs1 with (ds:=ds1) in H0; auto.
     assert (wfEnv E') as K.
       apply wfE__s_rhs__wfE in H; auto.
     assert (HH1:=K).
     apply IHs_rhs2 with (ds:=ds2) in HH1; auto.
       inversion HeqR; subst; simpl in *.  destruct be1 as [b1 e1]. clear HeqR.
       destruct be2 as [b2 e2].
       destruct ds1. simpl in H2.
       destruct ds2. simpl in H3.
       subst.
       apply rhs__SafeSeqPtr in H; auto.
       destruct H as [J1 [J2 [J3 [J4 J5]]]]. simpl in H0. simpl.
       destruct a; auto.
          assert (A_Pointer p Tame = A_Pointer p Tame). auto.
          apply J4 in H; auto. 
          destruct H. inversion H; subst; auto.

          destruct q.
          (*Safe*)
            assert (A_Pointer p Tame = A_Pointer p Tame). auto.
            apply J3 with (q0:=p0) (p2:=Safe) in H; auto. 
              destruct H. inversion H; subst; auto.
              split; auto.
                 unfold not. intros. inversion H2.
          (* Seq *)
            assert (A_Pointer p Tame = A_Pointer p Tame). auto.
            apply J3 with (q0:=p0) (p2:=Seq) in H; auto. 
              destruct H. inversion H; subst; auto.
              split; auto.
                 unfold not. intros. inversion H2.
          (*Tame*)
             destruct H0; auto.
                    decompose [and] H; clear H.
                    left. 
                    split; auto.
                    split; auto.
                    split; auto.
                    intros. apply H7 in H. destruct H.
                       split.
                         apply validAddress__s_rhs__validAddress with (i:=i) in H1; auto.
                         assert (atypeEqual (typeInfo E' i) (typeInfo E'' i)) as EQ.
                            eapply s_rhs__TI_preserve; eauto.
                         destruct H2 as [q H2].
                         exists(q). eapply atypeEqual_trans; eauto. 
                           apply atypeEqual_symm; auto.
(* FIXME: if seq ptr arithmetic is supported.
          destruct q.
          (*Safe*)
            absurd_hyp H6; auto.
          (*seq*)
            assert (A_Pointer p Seq = A_Pointer p Seq). auto.
            apply J1 in H; auto. 
            simpl in H. destruct H. 
              destruct H as [v H]. inversion H; subst. right; auto.
              destruct H as [s H]. inversion H; subst. right; auto.
          (*tame*)
            assert (A_Pointer p Tame = A_Pointer p Tame). auto.
            apply J4 in H; auto. 
            destruct H. inversion H; subst; auto.
          
          destruct q0.
          (*Safe*)
            destruct q.
            (*Safe*)
              absurd_hyp H6; auto.
            (*seq*)
              skip.
            (*tame*)
              assert (A_Pointer p Tame = A_Pointer p Tame). auto.
              apply J3 with (q0:=p0) (p2:=Safe) in H; auto. 
                destruct H. inversion H; subst; auto.
          (* Seq *)
            destruct q.
            (*Safe*)
              absurd_hyp H6; auto.
            (*seq*)
              skip.
            (*tame*)
              assert (A_Pointer p Tame = A_Pointer p Tame). auto.
              apply J3 with (q0:=p0) (p2:=Seq) in H; auto. 
                destruct H. inversion H; subst; auto.
                split; auto.
                   unfold not. intros. inversion H2.
          (*Tame*)
            destruct q.
            (*Safe*)
              absurd_hyp H6; auto.
            (*seq*)
              skip.
            (*tame*)
              destruct H0; auto.
                    decompose [and] H; clear H.
                    left. 
                    split; auto.
                    split; auto.
                    split; auto.
                    intros. apply H8 in H. destruct H.
                       split.
                         apply validAddress__s_rhs__validAddress with (i:=i) in H1; auto.
                         assert (typeInfo E' i = typeInfo E'' i) as EQ.
                            eapply s_rhs__TI_preserve; eauto.
                         rewrite <- EQ; auto.
*)
     (* S_Add_Ptr_Int_ErrorProp1 *)
     subst. unfold Error in H1. inversion H1; inversion H2.
     (* S_Add_Ptr_Int_ErrorProp2 *)
     subst. unfold Error in H2. inversion H2; inversion H3.
     (* S_Cast *)
     inversion HeqR; subst; simpl.
     assert (K:=H0).
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     eapply wfD__cast__wfD with (d:=fst ds) (t:=t); eauto.
        destruct E as [M S TI].
        eapply rhs__wft; eauto.
     (* S_Cast_ErrorProp *)
     subst. unfold Error in H1. inversion H1; inversion H2.
     (* S_Cast_Abort *)
     inversion HeqR.
     (* S_Size *)
     inversion HeqR. subst. simpl. auto.
     (* S_Alloc_Safe *)
     inversion HeqR. subst. simpl. clear HeqR.
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     destruct E'' as [M'' S'' TI'']. apply malloc__inversion in H6.
     destruct H6 as [M [TI H6]]. decompose [and] H6. clear H6.
     destruct p.
     (* PAType *)
       left.
       assert (J:=validAddressRange).
       rewrite sizeOfAType_one in *.
       split; auto.
       split; auto.
       split. omega.
       intros. 
         assert (i=0). omega. subst. simpl in *.
         assert (loc <= loc+0 < loc +n). omega.
         apply H14 in H7.
         split.
            split.
               exists (0,(0,0)). auto.
               intro. destruct (validAccessMemMeta__validStoreMemMeta M'' (loc+0) v).
                  apply H16; auto. exists (0,(0,0)). auto.
            destruct (@updateNonTameTypeInfo_inversion TI'' loc (P_AType a) size n (updateTypeInfo TI'' loc (P_AType a) n) Safe H1 H3); auto.
               unfold not. intros. inversion H16.
            inversion H3; subst.
            rewrite sizeOfAType_one in *.
            assert (loc <= loc + 0 < loc + n). omega.
            apply H18 in H19. destruct H19 as [j [J1 J2]].
            simpl in *.
            destruct j.
                inversion J2. subst. auto.
                inversion J2.
     (* PStruct *)
       left. inversion H3; subst.
       assert (J:=validAddressRange).
       split. auto.
       split. auto.
       split. omega.
       intros.
         assert (loc <= loc+i < loc +n). omega.
         apply H14 in H7.
         split.
            split.
              exists (0,(0,0)). auto.
              intro. destruct (validAccessMemMeta__validStoreMemMeta M'' (loc+i) v).
                apply H16; auto. exists (0,(0,0)). auto.
            simpl in *.
            destruct (@updateNonTameTypeInfo_inversion TI'' loc (P_Struct s) (sizeOfStruct s) n (updateTypeInfo TI'' loc (P_Struct s) n) Safe H1 H3); auto.
              unfold not. intros. inversion H16.
            assert (loc <= loc + i < loc + n). omega.
            apply H18 in H19. destruct H19 as [j [J1 J2]].
            simpl in *.
            inversion J2.
            assert (i=j).
              assert (mmod (loc + i) loc (sizeOfStruct s) = Some i).
                eapply mmod_inv; eauto. omega.
              rewrite J1 in H22. inversion H22; auto.
            subst. auto.

     (* PName *)
       left.
       assert (J:=validAddressRange).
       assert (K:=H1). inversion K; subst. inversion H16; subst.
       inversion H3; subst. rewrite H7 in H20. inversion H20; subst. 
       exists (s).
       split. auto.
       split. auto.
       split. omega.
       split. omega.
       intros.
         assert (loc <= loc+i < loc +n). omega.
         apply H14 in H21.
         split.
            split.
              exists (0,(0,0)). auto.
              intro. destruct (validAccessMemMeta__validStoreMemMeta M'' (loc+i) v).
                apply H22; auto. exists (0,(0,0)). auto.
            simpl in *.
            destruct (@updateNonTameTypeInfo_inversion TI'' loc (P_Name c) (sizeOfStruct s) n (updateTypeInfo TI'' loc (P_Name c) n) Safe H1 H3); auto.
              unfold not. intros. inversion H22.
            assert (loc <= loc + i < loc + n). omega.
            apply H23 in H24. destruct H24 as [j [J1 J2]].
            simpl in *. rewrite H7 in J2.
            inversion J2.
            assert (i=j).
              assert (mmod (loc + i) loc (sizeOfStruct s) = Some i).
                eapply mmod_inv; eauto. omega.
              rewrite J1 in H27. inversion H27; auto.
            subst. auto.

     (* PVoid *)
      inversion H1. inversion H18.
     (* S_Alloc_Seq *)
     inversion HeqR. subst. simpl. clear HeqR.
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     destruct E'' as [M'' S'' TI'']. apply malloc__inversion in H5.
     destruct H5 as [M [TI H5]]. decompose [and] H5. clear H5.
       inversion H1; subst.
       assert (K:=@wf_PType__sizeOfType p H15).
       destruct K as [s K].
       rewrite H3 in K. inversion K; subst. clear K.
       left.
       assert (J:=validAddressRange).
       split. omega.
       split. omega.
       split. omega.
       exists (s).
          split; auto.
          split; auto.
          intros. simpl.
            assert (K:=H5). apply H13 in H5.
            split.
               split.
                  exists (0, (0,0)). auto.
                  intros. destruct (validAccessMemMeta__validStoreMemMeta M'' i v).
                     apply H6. exists (0, (0,0)). auto.
            simpl in *.
            destruct (@updateNonTameTypeInfo_inversion TI'' loc p s n (updateTypeInfo TI'' loc p n) Seq H1 H3); auto.
              unfold not. intros. inversion H6.
     (* S_Alloc_Tame *)
     inversion HeqR. subst. simpl. clear HeqR.
     apply IHs_rhs with (ds0:=ds) in H0; auto.
     destruct E'' as [M'' S'' TI'']. apply malloc__inversion in H5.
     destruct H5 as [M [TI H5]]. decompose [and] H5. clear H5.
       left.
       assert (J:=validAddressRange).
       split. omega.
       split. omega.
       split. omega.
       intros. assert (K:=H5). apply H13 in H5. simpl in *.
       split.
         split.
            exists (0,(0,0)). auto.
            intro. destruct (validAccessMemMeta__validStoreMemMeta M'' i v).
              apply H15; auto. exists (0,(0,0)). auto.
            exists (P_VoidPtr).
            destruct (@updateTameTypeInfo_inversion TI'' loc p n (updateTypeInfo TI'' loc p n) H1); auto.
     (* S_Alloc_ErrorProp *)
     subst. unfold Error in H1. inversion H1; inversion H3.
     (* S_Alloc_OutOfMem *)
     inversion HeqR.          
     (* S_Alloc_Safe_Abort *)
     inversion HeqR.          
Qed.

Theorem wfE__s_cmd__wfE :
(forall E c R E', s_cmd E c R E' -> (wfEnv E -> wfEnv E')).
Proof.
  intros E c R E' Hcmd.
  induction Hcmd; intros; auto.
    apply wfE__storeMemMeta__wfE with (M:=mem E') (loc:=loc) 
                                         (d:=d) 
                                         (t:=tl); auto.
      apply wfE__s_rhs__wfE in H0; auto.

      destruct ds as [vs a]. simpl in *.
      eapply wfD__cast__wfD with (t':=tl) (t:=tr) (d:=vs); eauto.
          destruct E as [M S TI].
          eapply rhs__wft; eauto.

          destruct E as [M S TI].
          eapply lhs__wft; eauto.

          apply wfE__s_rhs__wfD in H0; auto.

      split; auto.
      destruct E as [M S TI].
      destruct E' as [M' S' TI'].
      assert (Hlhs:=H).
      apply lhs__ptrInvariant with (M:=M) (S:=S) (TI:=TI) in H; auto.
      apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in Hlhs; auto.
      destruct Hlhs as [[J1 J2] J3].
      apply s_rhs__TI_preserve with (i:=loc) in H0; auto.
      simpl in *.
      destruct H as [G1 [G2 [G3 G4]]].
      split; intros; subst.
             apply atypeEqual_trans with (a':=TI loc); auto.
                apply atypeEqual_symm; auto.
      split; intros; subst.
             apply atypeEqual_trans with (a':=TI loc); auto.
                apply atypeEqual_symm; auto.
             assert (A_Pointer p Tame = A_Pointer p Tame) as EQ. auto.
             apply G3 in EQ. destruct EQ as [q EQ].
             exists(q).
             apply atypeEqual_trans with (a':=TI loc); auto.
                apply atypeEqual_symm; auto.
               
    apply wfE__storeMem__wfE with (M:=mem E') (loc:=loc) (v:=fst d); auto.
      apply wfE__s_rhs__wfE in H0; auto.
     
      destruct E as [M S TI].
      destruct E' as [M' S' TI'].
      assert (Hlhs:=H).
      apply lhs__ptrInvariant with (M:=M) (S:=S) (TI:=TI) in H; auto.
      apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in Hlhs; auto.
      destruct Hlhs as [[J1 J2] J3].
      apply s_rhs__TI_preserve with (i:=loc) in H0; auto.
      simpl in *.
      destruct H as [G1 [G2 [G3 G4]]].
      destruct tl.
         assert (A_Int = A_Int) as EQ. auto.
         apply G4 in EQ.
         destruct EQ as [EQ | EQ].
           left. eapply atypeEqual_trans; eauto.
                    apply atypeEqual_symm; auto.
           right. destruct EQ as [p EQ]. exists(p).
                  eapply atypeEqual_trans; eauto.
                    apply atypeEqual_symm; auto.

         unfold not in H1.
         assert (False). apply H1. simpl. auto.
         inversion H.
 
    apply wfE__s_rhs__wfE in H0; auto.

    apply wfE__s_rhs__wfE in H0; auto.
Qed.

(**********************************************************)
(*                                    Stack                                      *)
(**********************************************************)
Lemma wfE__s_rhs__S :
(forall E rhs R t E', s_rhs E rhs R t E' ->
  (forall S M TI S' M' TI', wfEnv E -> 
      E = MkEnv M S TI ->
      E' = MkEnv M' S' TI'->
      S = S'
  )
)
.
Proof.
  intros. 
  generalize dependent M.
  generalize dependent M'.
  generalize dependent S.
  generalize dependent S'.
  generalize dependent TI.
  generalize dependent TI'.
  induction H; intros; subst; try solve 
   [
    inversion H1; auto |
    inversion H3; auto |
    inversion H4; auto |
    inversion H5; auto
   ].

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    apply IHs_rhs1 with (S0:=S) (M0:=M) (TI0:=TI) (M':=M'0) (S':=S'0) (TI':=TI'0) in H0; auto.
    apply IHs_rhs2 with (S:=S'0) (M:=M'0) (TI:=TI'0) (M'1:=M') (S'1:=S') (TI'1:=TI') in H; auto.
    subst; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    apply IHs_rhs1 with (S0:=S) (M0:=M) (TI0:=TI) (M':=M'0) (S':=S'0) (TI':=TI'0) in H0; auto.
    apply IHs_rhs2 with (S:=S'0) (M:=M'0) (TI:=TI'0) (M'1:=M') (S'1:=S') (TI'1:=TI') in H; auto.
    subst; auto.

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    apply IHs_rhs1 with (S0:=S) (M0:=M) (TI0:=TI) (M':=M'0) (S':=S'0) (TI':=TI'0) in H0; auto.
    apply IHs_rhs2 with (S:=S'0) (M:=M'0) (TI:=TI'0) (M'1:=M') (S'1:=S') (TI'1:=TI') in H; auto.
    subst; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    apply IHs_rhs1 with (S0:=S) (M0:=M) (TI0:=TI) (M':=M'0) (S':=S'0) (TI':=TI'0) in H0; auto.
    apply IHs_rhs2 with (S:=S'0) (M:=M'0) (TI:=TI'0) (M'1:=M') (S'1:=S') (TI'1:=TI') in H; auto.
    subst; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    destruct E'' as [M'' S'' TI''].
    apply malloc__inversion in H6. destruct H6 as [M''0 [TI''0 H6]]. decompose [and] H6. clear H6.
    inversion H7; auto. inversion H8; subst.
    apply IHs_rhs with (M':=M''0) (S'0:=S') (TI':=TI''0) (S0:=S) (M0:=M) (TI0:=TI) in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    destruct E'' as [M'' S'' TI''].
    apply malloc__inversion in H5. destruct H5 as [M''0 [TI''0 H5]]. decompose [and] H5. clear H5.
    inversion H6; auto. inversion H7; subst.
    apply IHs_rhs with (M':=M''0) (S'0:=S') (TI':=TI''0) (S0:=S) (M0:=M) (TI0:=TI) in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    destruct E' as [M'0 S'0 TI'0].
    destruct E'' as [M'' S'' TI''].
    apply malloc__inversion in H5. destruct H5 as [M''0 [TI''0 H5]]. decompose [and] H5. clear H5.
    inversion H6; auto. inversion H7; subst.
    apply IHs_rhs with (M':=M''0) (S'0:=S') (TI':=TI''0) (S0:=S) (M0:=M) (TI0:=TI) in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.

    apply wfE__s_rhs__wfE in H; auto.
    apply IHs_rhs with (S0:=S) (M0:=M) (TI0:=TI) (M'0:=M') (S'0:=S') (TI'0:=TI') in H0; auto.
Qed.

Lemma wfE__s_cmd__S :
(forall E c R E', s_cmd E c R E' ->
  (forall S M TI S' M' TI', wfEnv E -> 
      E = MkEnv M S TI->
      E' = MkEnv M' S' TI' ->
      S = S'
  )
)
.
Proof.
  intros E c R E' Hcmd.
  induction Hcmd; intros; subst; auto.
    inversion H1. auto.

    apply wfE__s_cmd__wfE in Hcmd1; auto.
    apply wfE__s_cmd__wfE in Hcmd2; auto.
       assert (J:=Hcmd1).
       destruct E' as [M'0 S'0 TI'0].
       apply (@IHHcmd1 S M TI S'0 M'0 TI'0) in H; auto.
       apply (@IHHcmd2 S'0 M'0 TI'0 S' M' TI') in J; auto.
       subst. auto.

    apply (@IHHcmd S M TI S' M' TI'); auto.

    apply wfE__s_cmd__wfE in Hcmd1; auto.
    apply wfE__s_cmd__wfE in Hcmd2; auto.
       assert (J:=Hcmd1).
       destruct E' as [M'0 S'0 TI'0].
       apply (@IHHcmd1 S M TI S'0 M'0 TI'0) in H0; auto.
       apply (@IHHcmd2 S'0 M'0 TI'0 S' M' TI') in J; auto.
       subst. auto.
  
    assert (wfEnv E'). apply wfE__s_rhs__wfE in H0; auto.
    destruct E' as [M'0 S'0 TI'0].
    apply wfE__s_rhs__S with (S:=S) (M:=M) (TI:=TI) (S':=S'0) (M':=M'0) (TI':=TI'0) in H0; auto.
    subst. simpl in H8. inversion H8. auto.

    assert (wfEnv E'). apply wfE__s_rhs__wfE in H0; auto.
    destruct E' as [M'0 S'0 TI'0].
    apply wfE__s_rhs__S with (S:=S) (M:=M) (TI:=TI) (S':=S'0) (M':=M'0) (TI':=TI'0) in H0; auto.
    subst. simpl in H8. inversion H8. auto.

    inversion H3. auto.

    apply wfE__s_rhs__S with (S:=S) (M:=M) (TI:=TI) (S':=S') (M':=M') (TI':=TI') in H0; auto.

    apply wfE__s_rhs__S with (S:=S) (M:=M) (TI:=TI) (S':=S') (M':=M') (TI':=TI') in H0; auto.
Qed.

(**********************************************************)
(*                                    Inversion                                 *)
(**********************************************************)

Lemma validAddresses__s_rhs__validAddresses :
(forall E rhs ds t E', s_rhs E rhs (RVal ds) t E' -> (forall i n, validAddresses E.(mem) i n -> validAddresses E'.(mem) i n)).
Proof.
   intros. 
   unfold validAddresses in *. decompose [and] H0. clear H0.
   split.
     apply validAddress__s_rhs__validAddress with (i:=i) in H; auto.
   split.
     apply accessMemMeta__accessMemMetaBlock.
     intros.
     destruct H3.
     apply accessMemMetaBlock_accessMemMeta with (offset:=(i0-i)) in H2.
        assert (i + (i0 - i) = i0). omega.
        rewrite H3 in H2.
        assert (validAddress (mem E) i0).
          split; auto.
            intros. destruct (validAccessMemMeta__validStoreMemMeta (mem E) i0 v); auto.
        apply validAddress__s_rhs__validAddress with (i:=i0) in H; auto.
        destruct H; auto.

        omega.         
 
      intros. apply H4 in H0.
      apply storeMemMeta__storeMemMetaBlock with (n:=length vs) (vs:=vs) (v:=(0,(0,0))); auto.
      intros.
      destruct H0.
      apply storeMemMetaBlock_storeMemMeta with (offset:=(i0-i)) (v:=(0,(0,0))) (vs:=vs) (n:=length vs) in H0; auto.
        assert (i + (i0 - i) = i0). omega.
        rewrite H5 in H0.
        assert (validAddress (mem E) i0).
          split; auto.
            destruct (validAccessMemMeta__validStoreMemMeta (mem E) i0 (0,(0,0))); auto.
            intros. destruct (storeMemMeta_uniqBehavior (0,(0,0)) (mem E) i0 v); auto.     
        apply validAddress__s_rhs__validAddress with (i:=i0) in H; auto.
        destruct H; auto.

        omega.
Qed.

(**********************************************************)
(*                                    progress                                 *)
(**********************************************************)
Lemma lhs_progress: forall S lhs t E M TI, 
  wf_lhs S lhs t -> E = (MkEnv M S TI) ->  wfEnv E -> 
  (exists l,  s_lhs E lhs (RLoc l) t) \/ s_lhs E lhs Abort t.
Proof.
  intros until 1.
  induction H; intros; subst.
  (* S_Var *)
    left. exists (l). apply S_Var; auto.
  (* S_Def *)
    (*
       wf_lhs S lhs (t*q)
       IH: ex l. s_lhs E lhs l (t*q) \/ s_lhs E lhs abort (t*q)
       ------------------
       ex l.s_lhs E *lhs l t \/ s_lhs E *lhs abort t
    *)
    assert (J:=H1).
    apply IHwf_lhs in H1; auto.
    destruct H1.
     (* Case1: ex l. s_lhs E lhs l (t*q) *)
      destruct H0 as [l H0].
      (* By lhs__inversion, valMem E.M l /\ bAdds <= l < l+1 < mAddr *)
      destruct(@lhs__inversion S lhs (A_Pointer (P_AType t) q) (MkEnv M S TI) M TI l H0); auto.
      (* valMem E.M l => accessMemMeta E.M l = Some (l', b', e') *)
      assert (exists v, accessMemMeta M l = Some v).
        unfold validAddresses in H1. decompose [and] H1. clear H1.
        destruct H5. apply accessMemMetaBlock_accessMemMeta with (offset:=0) in H1.
           assert (l+0=l). omega. rewrite H4 in H1. auto.
           simpl. omega.
      destruct H3 as [[loc' be'] H3].
      (* result depends on (assertion_ptr l' b' e' (t*q)) *)
      destruct (assertion_ptr_dec loc' be' (A_Pointer (P_AType t) q)).
        left. exists (loc'). apply S_Deref with (loc:=l) (be':=be') (q:=q); auto.    
        right. apply S_Deref_Abort with (loc:=l) (t:=t) (loc':=loc') (be':=be') (q:=q); auto.
     (* Case2: s_lhs E lhs abort (t*q) *)
      right. apply S_Deref_ErrorProp with (t:=A_Pointer (P_AType t) q) ; auto.
        unfold Error. auto.
  (* S_StructPos *)
  assert (J:=H3).
  apply IHwf_lhs in H3; auto. destruct H3.
      destruct H2 as [l H2].
      destruct(@lhs__inversion S lhs (A_Pointer (P_Struct s) q) (MkEnv M S TI) M TI l H2); auto.
      assert (exists v, accessMemMeta M l = Some v).
        unfold validAddresses in H3. decompose [and] H3. clear H3.
        destruct H7. apply accessMemMetaBlock_accessMemMeta with (offset:=0) in H3.
           assert (l+0=l). omega. rewrite H6 in H3. auto.
           simpl. omega.
      destruct H5 as [[loc' be'] H5].
      destruct (assertion_ptr_dec loc' be' (A_Pointer (P_Struct s) q)).
        left. exists (loc'+offset). apply S_StructPos with (loc:=l) (be':=be') (q:=q) (s:=s); auto.    
        right. apply S_StructPos_Abort with (loc:=l) (s:=s) (q:=q) (loc':=loc') (be':=be') (offset:=offset); auto.
      right. apply S_StructPos_ErrorProp with (t:=A_Pointer (P_Struct s) q); auto.
        unfold Error. auto.       
  (* S_NamePos *)
  assert (J:=H4).
  apply IHwf_lhs in H4; auto. destruct H4.
      destruct H3 as [l H3].
      destruct(@lhs__inversion S lhs (A_Pointer (P_Name n) q) (MkEnv M S TI) M TI l H3); auto.
      assert (exists v, accessMemMeta M l = Some v).
        unfold validAddresses in H4. decompose [and] H4. clear H4.
        destruct H8. apply accessMemMetaBlock_accessMemMeta with (offset:=0) in H4.
           assert (l+0=l). omega. rewrite H7 in H4. auto.
           simpl. omega.
      destruct H6 as [[loc' be'] H6].
      destruct (assertion_ptr_dec loc' be' (A_Pointer (P_Name n) q)).
        left. exists (loc'+offset). apply S_NamePos with (loc:=l) (be':=be') (q:=q) (s:=s) (n:=n); auto.    
        right. apply S_NamePos_Abort with (loc:=l) (s:=s) (q:=q) (loc':=loc') (be':=be') (offset:=offset) (n:=n); auto.
      right. apply S_NamePos_ErrorProp with (t:=A_Pointer (P_Name n) q); auto.
        unfold Error. auto.       
Qed.

Lemma rhs_progress:
(forall S rhs t, wf_rhs S rhs t ->
  (forall E M TI, wfEnv E -> 
                       E = (MkEnv M S TI) -> 
                       (exists ds, exists E', s_rhs E rhs (RVal ds) t E') \/
                       (exists t', exists E', s_rhs E rhs OutofMem t' E') \/
                       (exists t', exists E', s_rhs E rhs Abort t' E')
                       )
).
Proof.
  intros.
  generalize dependent E.
  generalize dependent M.
  generalize dependent TI.
  induction H; intros; subst.
  (* S_Const *)
  left. exists ((n, (0,0)), A_Int). exists (MkEnv M S TI). apply S_Const.
  (* S_Lhs *)
  apply lhs_progress with (E:=MkEnv M S TI) (M:=M) (TI:=TI) in H; auto.
  destruct H.
   (* lhs => l *)
    destruct H as [l  H].
    assert (exists vs, accessMemMeta M l = Some vs).
      apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in H; auto.
      destruct H.
      unfold validAddresses in H. decompose [and] H. clear H.
      destruct H2. auto.
    destruct H1 as [ds H1].
      left. exists(ds, (TI l)). exists (MkEnv M S TI). 
      apply S_Lhs with (loc:=l) (E:=MkEnv M S TI); auto.
   (* lhs => Abort *)
    right. right. exists (t). exists(MkEnv M S TI).
    apply S_Lhs_ErrorProp with (t:=t); auto.
          unfold Error. auto.
  (* S_Ref_Safe *)
  assert (J:=H).
  apply wf_nontame_ref_lhs__wf_lhs in H.
  apply lhs_progress with (E:=MkEnv M S TI) (M:=M) (TI:=TI) in H; auto.
  destruct H.
   (* lhs => l *)
    destruct H as [l  H].
    left. exists((l, (0,0), (A_Pointer (P_AType t) Safe))). exists (MkEnv M S TI). 
    apply S_Ref_Safe with (loc:=l); auto.
   (* lhs => Abort *) 
    right. right. exists (A_Pointer (P_AType t) Safe). exists(MkEnv M S TI).
        apply S_Ref_ErrorProp with (t:=t); auto.
          unfold Error. auto.
  (* S_Ref_Seq *)
  assert (J:=H).
  apply wf_nontame_ref_lhs__wf_lhs in H.
  apply lhs_progress with (E:=MkEnv M S TI) (M:=M) (TI:=TI) in H; auto.
  destruct H.
   (* lhs => l *)
    destruct H as [l  H].
    left. exists((l, (l, l+sizeOfAType t)), (A_Pointer (P_AType t) Seq)). exists (MkEnv M S TI). 
    eapply S_Ref_Seq with (loc:=l); eauto.
   (* lhs => Abort *)  
    right. right. exists (A_Pointer (P_AType t) Seq). exists(MkEnv M S TI).
        apply S_Ref_ErrorProp with (t:=t); auto.
          unfold Error. auto.
  (* S_Ref_Tame *)
  assert (J:=H).
  apply wf_tame_ref_lhs__wf_lhs in H.
  apply lhs_progress with (E:=MkEnv M S TI) (M:=M) (TI:=TI) in H; auto.
  destruct H.
   (* lhs => l *)
    destruct H as [l  H].
    left. exists((l, (l, l+sizeOfAType t)), (A_Pointer (P_AType t) Tame)). exists (MkEnv M S TI). 
    eapply S_Ref_Tame with (loc:=l); eauto.
   (* lhs => Abort *)  
    right. right. exists (A_Pointer (P_AType t) Tame). exists(MkEnv M S TI).
        apply S_Ref_ErrorProp with (t:=t); auto.
          unfold Error. auto.
  (* S_Add_Int_Int *)
  assert (J:=H1).
  apply IHwf_rhs1 with (M:=M) (TI:=TI) in H1; auto. destruct H1.
    (* rhs1 runs successfully *)
    destruct H1 as [ds1 [E' H1]].
    assert (wfEnv E').
      apply wfE__s_rhs__wfE in H1; auto.
    destruct E' as [M' S' TI'].
    assert (S=S').
      apply wfE__s_rhs__S with (S:=S) (M:=M) (TI:=TI) (S':=S') (M':=M') (TI':=TI') in H1; auto. 
    subst.
    assert (J1:=H2). 
    apply IHwf_rhs2 with (M:=M') (TI:=TI') in J1; auto. destruct J1.
      (* rhs2 runs successfully *)
      destruct H3 as [ds2 [E'' H3]].
      remember (fst ds1) as EQ1. destruct EQ1 as [n1 be1].
      remember (fst ds2) as EQ2. destruct EQ2 as [n2 be2].
      left. exists((n1+n2, (0,0)), A_Int). exists(E''). 
        apply S_Add_Int_Int with (E':=MkEnv M' S' TI') (ds1:=ds1) (ds2:=ds2) (be1:=be1) (be2:=be2); auto.
      destruct H3.
      (* rhs2 leads to OutOfMem *)
        destruct H3 as [t' [E' H3]].
        right. left. exists (t'). exists(E').
        apply S_Add_Int_Int_ErrorProp2 with  (E':=MkEnv M' S' TI') (ds1:=ds1) (t:=t') (t':=t'); auto.
          unfold Error. auto.
      (* rhs2 leads to Abort *)
        destruct H3 as [t' [E' H3]].
        right. right. exists (t'). exists(E').
        apply S_Add_Int_Int_ErrorProp2 with  (E':=MkEnv M' S' TI') (ds1:=ds1) (t:=t') (t':=t'); auto.
          unfold Error. auto.
    destruct H1.
    (* rhs1 leads to MemViolation *)
    destruct H1 as [t' [E' H1]].
        right. left. exists (t'). exists(E').
        apply S_Add_Int_Int_ErrorProp1 with  (E':=E') (t:=t') (t':=t'); auto.
          unfold Error. auto.
    (* rhs2 leads to Abort *)
    destruct H1 as [t' [E' H1]].
        right. right. exists (t'). exists(E').
        apply S_Add_Int_Int_ErrorProp1 with  (E':=E') (t:=t') (t':=t'); auto.
          unfold Error. auto.
  (* S_Add_Ptr_Int *)
  assert (J:=H3).
  apply IHwf_rhs1 with (M:=M) (TI:=TI) in H3; auto. destruct H3.
    (* rhs1 runs successfully *)
    destruct H2 as [ds1 [E' H3]].
    assert (wfEnv E').
      apply wfE__s_rhs__wfE in H3; auto.
    destruct E' as [M' S' TI'].
    assert (S=S').
      apply wfE__s_rhs__S with (S:=S) (M:=M) (TI:=TI) (S':=S') (M':=M') (TI':=TI') in H3; auto. 
    subst.
    apply IHwf_rhs2 with (M:=M') (TI:=TI') in H2; auto. destruct H2.
      (* rhs2 runs successfully *)
      destruct H2 as [ds2 [E'' H4]].
      remember (fst ds1) as EQ1. destruct EQ1 as [n1 be1].
      remember (fst ds2) as EQ2. destruct EQ2 as [n2 be2].
      assert (Tame <> Safe). intro. inversion H2.
      assert (K:=@wf_AType__some_size p Tame H1 H2); auto.
      destruct K as [size K].
      left. exists((n1+n2*size, be1), A_Pointer p Tame). exists(E''). 
        apply S_Add_Ptr_Int with (E':=MkEnv M' S' TI') (ds1:=ds1) (ds2:=ds2) (be1:=be1) (be2:=be2); auto.
      destruct H2.
      (* rhs2 leads to OutOfMem *)
        destruct H2 as [t' [E' H4]].
        right. left. exists (t'). exists(E').
        apply S_Add_Ptr_Int_ErrorProp2 with  (E':=MkEnv M' S' TI') (ds1:=ds1) (p:=p) (t':=t') (q:=Tame); auto.
          unfold Error. auto.
      (* rhs2 leads to Abort *)
        destruct H2 as [t' [E' H4]].
        right. right. exists (t'). exists(E').
        apply S_Add_Ptr_Int_ErrorProp2 with  (E':=MkEnv M' S' TI') (ds1:=ds1) (p:=p) (t':=t') (q:=Tame); auto.
          unfold Error. auto.
    destruct H2.
      (* rhs1 leads to Abort *)
      destruct H2 as [t' [E' H3]].
        right. left. exists (t'). exists(E').
        apply S_Add_Ptr_Int_ErrorProp1 with  (E':=E') (t:=t') (t':=t'); auto.
          unfold Error. auto.
      (* rhs2 leads to Abort *)
      destruct H2 as [t' [E' H3]].
        right. right. exists (t'). exists(E').
        apply S_Add_Ptr_Int_ErrorProp1 with  (E':=E') (t:=t') (t':=t'); auto.
          unfold Error. auto.
  (* S_Cast *)
  assert (J:=H1).
  apply IHwf_rhs with (M:=M) (TI:=TI) in H2; auto. destruct H2.
    destruct H2 as [ds [E' H2]].
    assert (K:=dataCast__valid t' (fst ds) t (@wf_rhs__wf_AType S rhs t H)).
    destruct K as [d K].
    destruct (@assertion_dataCast_dec t' (fst ds) t). 
      left. 
      exists(d, snd ds). exists (E').
      apply S_Cast with (t:=t); auto.

      right. right.
      exists(t'). exists (E').
      apply S_Cast_Abort with (ds:=ds) (t:=t) (d:=d); auto.

    destruct H2.
    destruct H2 as [t'' [E' H2]].
        right. left. exists (t). exists(E').
        apply S_Cast_ErrorProp with  (E':=E') (t:=t'') (t':=t'); auto.
          unfold Error. auto.
    destruct H2 as [t'' [E' H2]].
        right. right. exists (t). exists(E').
        apply S_Cast_ErrorProp with  (E':=E') (t:=t'') (t':=t'); auto.
          unfold Error. auto.
  (* S_Size *)  
  left.
  assert (J:=H).
  apply wf_PType__sizeOfType in H.
  destruct H as [s H].
  exists ((s, (0,0)), A_Int). exists(MkEnv M S TI). apply S_Size; auto.
  (* S_Alloc *)
  assert (J:=H3).
  apply IHwf_rhs with (M:=M) (TI:=TI) in H3; auto. destruct H3.
    destruct H3 as [ds [E' H3]].
      remember (fst ds) as EQ. destruct EQ as [n be].
      destruct (malloc_dec E' n).
        destruct H4 as [E'' [loc H4]].
        destruct q.
          (*safe*)
          destruct (le_lt_dec size n).
            left. exists((loc, (0, 0)), (A_Pointer p Safe)). exists (MkEnv E''.(mem) E''.(stack) (updateTypeInfo E''.(typeInfo) loc p n)).
            apply S_Alloc_Safe with (ds:=ds) (E':=E') (n:=n) (be:=be) (size:=size); auto.
 
            right. right.
            exists(A_Int). exists(E').
            apply S_Alloc_Safe_Abort with (ds:=ds) (E':=E') (n:=n) (be:=be) (size:=size); auto.
          (*seq*)
          left. exists((loc, (loc, loc+n)), (A_Pointer p Seq)). exists (MkEnv E''.(mem) E''.(stack) (updateTypeInfo E''.(typeInfo) loc p n)).
          apply S_Alloc_Seq with (ds:=ds) (E':=E') (n:=n) (be:=be) (size:=size); auto.
          (*tame*)
          left. exists((loc, (loc, loc+n)), (A_Pointer p Tame)). exists (MkEnv E''.(mem) E''.(stack) (updateTypeInfo E''.(typeInfo) loc p n)).
          apply S_Alloc_Tame with (ds:=ds) (E':=E') (n:=n) (be:=be) (size:=size); auto.

        right. left.
        exists(A_Int). exists(E').
        apply S_Alloc_OutofMem with (ds:=ds) (E':=E') (n:=n) (be:=be) (size:=size); auto.

    destruct H3.
    destruct H3 as [t'' [E' H3]].
        right. left. exists (t''). exists(E').
        apply S_Alloc_ErrorProp with  (E':=E') (t:=t''); auto.
          unfold Error. auto.
    destruct H3 as [t'' [E' H3]].
        right. right. exists (t''). exists(E').
        apply S_Alloc_ErrorProp with  (E':=E') (t:=t''); auto.
          unfold Error. auto.
Qed.

Theorem Progress : forall E M S TI c, 
  wf_cmd S c -> 
  E = (MkEnv M S TI) ->                        
  wfEnv E -> 
  (exists E', s_cmd E c ROK E') \/
  (exists E', s_cmd E c OutofMem E') \/
  (exists E', s_cmd E c Abort E').
Proof.
  intros E M S TI c Hcmd.
  generalize dependent M.
  generalize dependent TI.
  generalize dependent E.
  induction Hcmd; intros; subst.
     (* skip *)
     left. exists (MkEnv M S TI). apply S_Skip.
     
     (* seq *)
     assert(J:=H0).
     apply IHHcmd1 with (M:=M) (TI:=TI) in H0; auto. destruct H0.
     (* c1 is ok *)
       destruct H as [E' H].
       assert (wfEnv E'). apply wfE__s_cmd__wfE in H; auto.

     destruct E' as [M'0 S'0 TI'0].
     assert (S = S'0).
       apply wfE__s_cmd__S with (S:=S) (M:=M) (TI:=TI) (S':=S'0) (M':=M'0) (TI':=TI'0) in H; auto.
     subst.
     apply IHHcmd2 with (M:=M'0) (TI:=TI'0) in H0; auto. destruct H0.
     (* c2 is ok *)
       destruct H0 as [E'' H0].
          left. exists (E''). apply S_Seq with (E':=MkEnv M'0 S'0 TI'0); auto.

       destruct H0.
     (* c2 is outofMem *)
            destruct H0 as [E' H0].
            right. left.
            exists(E').
            apply S_Seq_ErrorProp2 with (E':=MkEnv M'0 S'0 TI'0); auto.
              unfold Error. auto.
       
     (* c2 is Abort *)
            destruct H0 as [E' H0].
            right. right.
            exists(E').
            apply S_Seq_ErrorProp2 with (E':=MkEnv M'0 S'0 TI'0); auto.
              unfold Error. auto.

     destruct H.
     (* c1 is outofMem *)
          destruct H as [E' H].
          right. left.
          exists(E').
          apply S_Seq_ErrorProp1; auto.
            unfold Error. auto.
       
     (* c1 is Abort *)
          destruct H as [E' H].
          right. right.
          exists(E').
          apply S_Seq_ErrorProp1; auto.
            unfold Error. auto.

     (* assign *)
     apply lhs_progress with (E:= MkEnv M S TI) (M:=M) (TI:=TI) in H; auto.
     destruct H.
     (* lhs is ok *)
       destruct H as [l H]. assert (J:=H0).
       apply rhs_progress with (E:=MkEnv M S TI) (M:=M) (TI:=TI) in H0; auto.
       (* rhs is ok *)
       destruct H0.
         destruct H0 as [ds [E' H0]].
         destruct E' as [M''0 S''0 TI''0].
         assert (JJ:=dataCast__valid tl (fst ds) tr (@wf_rhs__wf_AType S rhs tr J)).
         destruct JJ as [d JJ].
         assert (exists m', storeMemMeta M''0 l d = Some m').
             apply lhs__inversion with (M:=M) (S:=S) (TI:=TI) in H; auto.
             destruct H. assert (JJJ:=H). unfold validAddresses in H. decompose [and] H. clear H.
             apply convertible__atypeEqual in H1.
             assert (K:=H0).
             apply validAddresses__s_rhs__validAddresses with (i:=l) (n:=sizeOfAType tl) in K; auto.
             simpl in *. unfold validAddresses in K. decompose [and] K. clear K.
             destruct H. apply H5; auto.  
         destruct H2 as [M'' H2].
         assert (exists m', storeMem M''0 l (fst d) = Some m').
           destruct (@validStoreMemMeta__validStoreMem M''0 l d (fst d)).
             apply H4. exists (M''). auto.
         destruct H4 as [M''' H4].
         destruct (isPtr_dec tl).
           destruct (@assertion_dataCast_dec tl (fst ds) tr).    
              left. exists (MkEnv M'' S''0 TI''0). 
              apply S_Assign_Ptr with (E':=MkEnv M''0 S''0 TI''0) (tl:=tl) (tr:=tr) (loc:=l) (ds:=ds) (d:=d); auto.

              right. right. exists (MkEnv M''0 S''0 TI''0). 
              apply S_Assign_Ptr_Abort with (tl:=tl) (tr:=tr) (loc:=l) (ds:=ds) (d:=d); auto.

           assert (K:=@assertion_dataCast_true tl (fst ds) tr).    
           left. exists (MkEnv M''' S''0 TI''0). 
           apply S_Assign_NPtr with (E':=MkEnv M''0 S''0 TI''0) (tl:=tl) (tr:=tr) (loc:=l) (ds:=ds) (d:=d); auto.
       (* rhs is error *)
          destruct H0.
            right. left. destruct H0 as [t' [E'0 H0]].
            exists(E'0).
            apply S_Assign_ErrorProp2  with (E':=E'0) (tl:=tl) (tr:=t') (loc:=l); auto.
              unfold Error. auto.
       
            right. right. destruct H0 as [t' [E'0 H0]].
            exists(E'0).
            apply S_Assign_ErrorProp2  with (E':=E'0) (tl:=tl) (tr:=t') (loc:=l); auto.
              unfold Error. auto.

     (* lhs is error *)
          right. right.
          exists(MkEnv M S TI).
          apply S_Assign_ErrorProp1 with (tl:=tl); auto.
              unfold Error. auto.
Qed.
