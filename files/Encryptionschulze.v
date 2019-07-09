Require Import Notations.
Require Import Coq.Lists.List. 
Require Import Coq.Arith.Le.
Require Import Coq.Numbers.Natural.Peano.NPeano.
Require Import Coq.Arith.Compare_dec.
Require Import Coq.omega.Omega.
Require Import Bool.Sumbool.
Require Import Bool.Bool.
Require Import Coq.Logic.ConstructiveEpsilon.
Require Import Coq.ZArith.ZArith.
Require Import ListLemma.
Require Import ValidityExist.
Require Import Coq.Logic.FinFun.
Require Import Coq.Program.Basics.
Require Import Coq.Logic.FunctionalExtensionality.
Require Import Psatz.
Require Import Schulze.
Require Export CryptoAxioms.
Require Export Cand.
Require Export Keys.
Import ListNotations.
Open Scope Z. 
 

Notation "'existsT' x .. y , p" :=
  (sigT (fun x => .. (sigT (fun y => p)) ..))
    (at level 200, x binder, right associativity,
     format "'[' 'existsT' '/ ' x .. y , '/ ' p ']'") : type_scope.

Module Encschulze (Import C : Cand) (Import K : Keys)  (Import Abst : Abstype)
       (Import Crp : CryptoAxioms.Crypto C K Abst).

  
  (* Decidability of pair of cand *)
  Lemma pair_cand_dec : forall (c d : cand * cand), {c = d} + {c <> d}.
  Proof.
    intros c d. destruct c, d.
    pose proof (dec_cand c c1).
    pose proof (dec_cand c0 c2).
    destruct H, H0. left.
    subst. reflexivity.
    right. unfold not. intros. inversion H. pose proof (n H2). inversion H0.
    right. unfold not. intros. inversion H. pose proof (n H1). inversion H0.
    right. unfold not. intros. inversion H. pose proof (n H1). inversion H0.
  Qed.
  
  (* all candidate pair is (all_pairs cand_all) *)      
  Lemma every_cand_t : forall (c d : cand), In (c, d) (all_pairs cand_all).
  Proof.
    intros c d. apply  all_pairsin;
                  apply cand_fin.
  Qed.
  
  
  Lemma non_empty_l_pair : forall (l : list cand), l <> [] -> all_pairs l <> [].
  Proof.
    destruct l.
    + cbn. auto.
    + cbn. intros Hc Hd.
      inversion Hd.
  Qed.
  
  Lemma non_empty_cand_pair : all_pairs cand_all <> [].
    apply non_empty_l_pair.
    apply cand_not_nil.
  Qed.

  
  (* A ballot is in matrix with all the entries are
     -1, 0 and 1 with no cyles *)
  Definition matrix_ballot_valid (p : pballot) :=
    (forall c d : cand, In (p c d) [-1; 0; 1]) /\
    valid cand p. 



  (* Helping lemma for partition integer *)   
  Lemma partition_integer : forall (b : Z),
      ({b = -1} + {b = 0} + {b = 1}) + {b <> -1 /\ b <> 0 /\ b <> 1}.
  Proof.
    intros b.
    destruct (Z_le_dec b (-2)). right.  omega.
    destruct (Z_ge_dec b 2). right. omega.
    left. assert (b > -2) by omega.
    assert (b < 2) by omega.  clear n. clear n0.
    destruct (Z_eq_dec b (-1)). left. left. auto.
    destruct (Z_eq_dec b 0). left. right.  auto.
    assert (b = 1) by omega. right.  auto.
  Qed.
    
   
  (* I learned pretty nice trick *)
  Lemma finite_gen : forall (b : cand -> cand -> Z) (l : list (cand * cand)),
      (forall c d,  In (c, d) l -> {b c d = -1} + {b c d = 0} + {b c d = 1}) +
      (exists c d,  In (c, d) l /\ b c d <> -1 /\ b c d <> 0 /\ b c d <> 1).
  Proof.
    intros b l.
    induction l. 
    + left; intros. inversion H.
    + destruct IHl. 
      destruct a as (c1, c2).
      destruct (partition_integer (b c1 c2)); swap 1 2.  
      right.  exists c1, c2. split. cbn. left. auto. auto.
      left. intros. 
      destruct (pair_cand_dec (c, d) (c1, c2)). 
      inversion e.  subst. auto.
      assert (In (c, d) l).
      destruct H. unfold not in n. symmetry in H. pose proof (n H).
      inversion H0. assumption.
      pose proof (s _ _ H0). auto.
      right.  destruct e as [c [d Hin]].
      exists c, d. destruct Hin. split. cbn.  right. auto.
      auto.
  Qed.

  (* Decidability of b is either -1, 0, 1 or not *)
  Lemma  finiteness : forall  (b : cand -> cand -> Z)
                         (l : list (cand * cand))  (H : forall c d, In (c, d) l),
      (forall c d, {b c d = -1} + {b c d = 0} + {b c d = 1}) +
      (exists c d,  b c d <> -1 /\ b c d <> 0 /\ b c d <> 1).
  Proof.
    intros.
    pose proof (finite_gen b l).
    destruct X. left.  intros. apply s. auto.
    right. destruct e as [c [d Hin]].
    exists c, d. destruct Hin. assumption.
  Qed.   

  (* decidability of pballot. pballot is decryption of final shuffled encrypted 
     ballots *)
  Lemma dec_pballot :
    forall (p : pballot), 
      {forall c d : cand, In (p c d) [-1; 0; 1]} +
      {~(forall c d : cand, In (p c d) [-1; 0; 1])}.
  Proof.
    intros.
    pose proof (finiteness p (all_pairs cand_all) every_cand_t).
    destruct X. left. intros.
    destruct (s c d) as [[H1 | H1] | H1].
    left. auto.  right; left. auto. right; right. simpl. auto.
    right. intro. destruct e as [c [d [Hp1 [Hp2 Hp3]]]].
    pose proof (H c d). destruct H0. congruence.
    destruct H0. congruence. destruct H0. congruence. inversion H0.
  Qed.
    
    (* Decidability of validity definition. *)
  Lemma pballot_valid_dec :
    forall b : pballot, {valid cand b} +
                   {~(valid cand b)}.
  Proof.
    intros b. pose proof (decidable_valid cand b dec_cand).
    pose proof (finiteness b (all_pairs cand_all) every_cand_t) as Ht.
    destruct Ht. pose proof (X s).
    unfold finite in X0. apply X0. exists cand_all. apply cand_fin.
    right.  unfold valid, not; intros. destruct H as [f Hf].
    destruct e as [c [d [He1 [He2 He3]]]]. pose proof (Hf c d).
    destruct H. destruct H0.
    destruct (lt_eq_lt_dec (f c) (f d)) as [[H2 | H2] | H2].
    apply H in H2. congruence. apply H0 in H2. congruence.
    assert (f c > f d)%nat by omega. apply H1 in H3. congruence.
  Qed.

          
    (* The decrypted ballot is either valid or not valid *)
  Lemma matrix_ballot_valid_dec :
    forall p : pballot, {matrix_ballot_valid p} +
                   {~matrix_ballot_valid p}.
  Proof.
    intros p. 
    destruct (dec_pballot p); destruct (pballot_valid_dec p).
    left. unfold matrix_ballot_valid. intuition.
    right. unfold matrix_ballot_valid. unfold not. intros.
    destruct H. pose proof (n H0). auto.
    right. unfold not. intros; intuition. destruct H.
    pose proof (n H). auto.
    right. unfold not. intros. destruct H.
    pose proof (n H). auto.
  Defined.


  
  (* Returns true if v is row permutation of u by a permutation whose commitment is cpi *)
  Definition verify_row_permutation_ballot (grp : Group)
             (u : eballot) (v : eballot)
             (cpi : Commitment) (zkppermuv : cand -> ShuffleZkp) : cand -> bool := 
    fun c => verify_shuffle grp (List.length cand_all)
                         cand_all (u c) (v c) cpi (zkppermuv c). 
      
  (* cth column of w is permutation of cth column of v by a permutation whose commitment is cpi *)  
  Definition verify_col_permutation_ballot (grp : Group)
             (v : eballot) (w : eballot)
             (cpi : Commitment) (zkppermvw  : cand -> ShuffleZkp) : cand ->  bool :=
    fun c => verify_shuffle grp (List.length cand_all)
                         cand_all (fun d => v d c) (fun d => w d c) cpi (zkppermvw c).

    
  (* Bring a Schulze instance *)
  Module M := Schulze.Schulze C.
    
  (* Inductive type to capture states during the counting *)
  Inductive EState : Type :=
  | epartial : (list eballot * list eballot) ->
               (cand -> cand -> ciphertext) -> EState
  | edecrypt : (cand -> cand -> plaintext) -> EState
  | ewinners : (cand -> bool) -> EState.
  
   
  (* Inductive type for counting. Indexed over a given Group, and list of ballots 
       to be counted *) 
  Inductive ECount (grp : Group) (bs : list eballot) : EState -> Type :=
  | ecax (us : list eballot) (encm : cand -> cand -> ciphertext)
         (decm : cand -> cand -> plaintext)
         (zkpdec : cand -> cand -> DecZkp) :
      us = bs ->
      (forall c d : cand, decm c d = 0) -> 
      (forall c d, verify_zero_knowledge_decryption_proof 
                grp (decm c d) (encm c d) (zkpdec c d) = true) ->
      ECount grp bs (epartial (us, []) encm)
  | ecvalid (u : eballot) (v : eballot) (w : eballot)
            (b : pballot) (zkppermuv : cand -> ShuffleZkp)
            (zkppermvw : cand -> ShuffleZkp) (zkpdecw : cand -> cand -> DecZkp)
            (cpi : Commitment) (zkpcpi : PermZkp)
            (us : list eballot) (m nm : cand -> cand -> ciphertext)
            (inbs : list eballot) :
      ECount grp bs (epartial (u :: us, inbs) m) ->
      matrix_ballot_valid b ->
      (* commitment proof *)
      verify_permutation_commitment grp (List.length cand_all) cpi zkpcpi = true ->
      (forall c, verify_row_permutation_ballot grp u v cpi zkppermuv c = true)  ->
      (forall c, verify_col_permutation_ballot grp v w cpi zkppermvw c = true)  ->
      (forall c d, verify_zero_knowledge_decryption_proof 
                grp (b c d) (w c d) (zkpdecw c d) = true) (* b is honest decryption of w *) ->
      (forall c d, nm c d = homomorphic_addition grp (u c d) (m c d)) -> 
      ECount grp bs (epartial (us, inbs) nm)
  | ecinvalid (u : eballot) (v : eballot) (w : eballot)
              (b : pballot) (zkppermuv : cand -> ShuffleZkp)
              (zkppermvw : cand -> ShuffleZkp) (zkpdecw : cand -> cand -> DecZkp)
              (cpi : Commitment) (zkpcpi : PermZkp)
              (us : list eballot) (m : cand -> cand -> ciphertext)
              (inbs : list eballot) :
      ECount grp bs (epartial (u :: us, inbs) m) ->
      ~matrix_ballot_valid b ->
      (* commitment proof *)
      verify_permutation_commitment grp (List.length cand_all) cpi zkpcpi = true  ->
      (forall c, verify_row_permutation_ballot grp u v cpi zkppermuv c = true) ->
      (forall c, verify_col_permutation_ballot grp v w cpi zkppermvw c = true) ->
      (forall c d, verify_zero_knowledge_decryption_proof 
                grp (b c d) (w c d) (zkpdecw c d) = true) (* b is honest decryption of w *) ->
      ECount grp bs (epartial (us, (u :: inbs)) m)
  | ecdecrypt inbs (encm : cand -> cand -> ciphertext)
              (decm : cand -> cand -> plaintext)
              (zkp : cand -> cand -> DecZkp) :
      ECount grp bs (epartial ([], inbs) encm) ->
      (forall c d, verify_zero_knowledge_decryption_proof
                grp (decm c d) (encm c d) (zkp c d) = true) ->
      ECount grp bs (edecrypt decm)
  | ecfin dm w (d : (forall c, (M.wins_type dm c) + (M.loses_type dm c))) :
      ECount grp bs (edecrypt dm) ->
      (forall c, w c = true <-> (exists x, d c = inl x)) ->
      (forall c, w c = false <-> (exists x, d c = inr x)) ->
      ECount grp bs (ewinners w).  
    

  (* Bring axioms from proof module *)
  Module Pr := CryptoAxioms.CAxioms C K Abst Crp.
  
  (* Bootstrapping the counting process *)
  Lemma ecount_all_ballot :
    forall (bs : list eballot), existsT encm, ECount Crp.grp bs (epartial (bs, []) encm).
  Proof.
    intros.
    remember (fun c d : cand => encrypt_message Crp.grp 0) as encm. exists encm.
    pose proof (ecax Crp.grp bs bs encm
                     (fun c d => 0)
                     (fun c d => construct_zero_knowledge_decryption_proof
                                Crp.grp privatekey (encm c d))
                     eq_refl (fun c d => eq_refl)).
    assert (forall c d : cand,
               verify_zero_knowledge_decryption_proof
                 Crp.grp ((fun _ _ : cand => 0) c d)
                 (encm c d)
                 ((fun _ _ : cand =>
                     construct_zero_knowledge_decryption_proof
                       Crp.grp privatekey (encm c d)) c d) = true). 
    intros.  apply Pr.verify_honest_decryption_zkp. 
    symmetry.  rewrite Heqencm. apply Pr.decryption_deterministic.
    pose proof (X H). auto.
  Qed.
  


  (* A helper function which convertes list to function. It helpful in using list as a 
     function *)
  Lemma idx_search_list : forall (A : Type) (c : cand) (cl : list cand)
                            (l : list A) (Hin : In c cl)
                            (H : List.length l = List.length cl), A.
  Proof.
    intros A c.
    refine (fix F cl :=
              match cl as cl'
                    return (forall l, In c cl' ->
                                 Datatypes.length l = Datatypes.length cl' -> A) with
              | [] => fun l Hin Heq => match Hin with end
              | c0 :: cs => fun l => match l with
                                 | [] => fun Hin Heq => _
                                 | a :: t => fun Hin Heq =>
                                              match dec_cand c c0 with
                                              | left _ => a
                                              | right _ => _
                                              end
                                 end                                  
              end); inversion Heq.
    assert (Ht : In c cs).
    destruct Hin; try congruence.
    refine (F cs t Ht H0).
  Defined.
    
                                                     

  (* This Lemma states that we will always end up in state where 
     we have counted all the ballots by taking one ballot, and deciding if it's 
     valid or not. If valid then add it to encrypted marging otherwise add it invalid  
     ballot list *)
  Lemma ppartial_count_all_counted bs : forall ts inbs m,
      ECount Crp.grp bs (epartial (ts, inbs) m) ->
      existsT i nm, (ECount Crp.grp bs (epartial ([], i) nm)).
  Proof.    
    induction ts as [|u ts IHs].
    intros inbs m He.
    exists inbs, m. auto.
    intros inbs m He. 
    (* The idea is u valid or not valid which can be shown via u -> (* row permutation *) -> v
       -> (* colume permutation *) -> w -> (* decryption *) -> b *)
    (* generate permutation pi to permute ballot*) 
    remember (generatePermutation Crp.grp (List.length cand_all) cand_all) as pi.
    (* generate randomness S *)
    remember (generateS Crp.grp (List.length cand_all)) as s.
    (* commit to this permutation  using randomness s*)
    remember (generatePermutationCommitment Crp.grp (List.length cand_all) cand_all pi s) as cpi.
    (* generate zero knowledge proof of commitment *)
    remember (zkpPermutationCommitment Crp.grp (List.length cand_all)
                                       cand_all pi cpi s) as zkpcpi.
    (* At this point I can assert that 
       verify_permutation_commitment grp (List.length cand_all) cpi zkpcpi = true 
       using the Axiom permutation_commitment_axiom *)
    assert (verify_permutation_commitment Crp.grp (List.length cand_all) cpi zkpcpi = true).
    pose proof (Pr.permutation_commitment_axiom
                  pi cpi s zkpcpi Heqcpi Heqzkpcpi). auto.
      
    (* Convert u -> rowpermute pi -> v *)
    (* Generate randomness to use in shuffle *)
    remember (map (fun _ => generateR Crp.grp (List.length cand_all)) cand_all) as rrowlistvalues.
    (* I have generated the randomness for each row and use them in shuffling. 
         It would be good idea to convert rlistvalues to rfunvalues by 
         using search_list function *)
    assert (Datatypes.length rrowlistvalues = Datatypes.length cand_all).
    rewrite Heqrrowlistvalues. rewrite map_length; auto. 
    remember (fun c => idx_search_list _ c cand_all rrowlistvalues (cand_fin c) H0) as rrowfunvalues.
    (* Now I have converted rrowlistvalues in rrowfunvalues. Smile *)

    (* get the ballot v by shuffling each row by pi and randomness R *)
    remember (fun c =>
                shuffle Crp.grp (List.length cand_all)
                        cand_all dec_cand (u c) pi (rrowfunvalues c)) as v.
    (* construct zero knowledge proof of shuffle that v is row shuffle of u by pi
         using the same randomness R which used in shuffle *)
    remember (fun c =>
                shuffle_zkp Crp.grp (List.length cand_all)
                            cand_all (u c) (v c) pi cpi s (rrowfunvalues c)) as zkppermuv.
    
    
    (* Show that verify_row_permutation_ballot u v cpi zkppermuv return true.
         The property here is construct matrix from u and v and comp
         This is bit tricky so I am leaving it for the moment because we need to 
         massage the axioms *)
    assert (Ht1 : forall c, verify_row_permutation_ballot Crp.grp u v cpi zkppermuv c = true). 
    intros; unfold verify_row_permutation_ballot.
    pose proof (Pr.verify_shuffle_axiom pi cpi s (u c) (v c) (rrowfunvalues c) (zkppermuv c)
                                     Heqcpi).
    assert (Hvr : v c = shuffle Crp.grp (List.length cand_all)
                                cand_all dec_cand (u c) pi (rrowfunvalues c)).
    rewrite Heqv; try auto.
    specialize (H1 Hvr). clear Hvr. rewrite Heqzkppermuv in H1.
    specialize (H1 eq_refl). rewrite Heqzkppermuv; try auto. 

    (* generate again the randomness R to make cryptography great again *)
    remember (map (fun _ => generateR Crp.grp (List.length cand_all)) cand_all) as rcollistvalues.
    (* I have generated the randomness for each column and use them in shuffling. 
         It would be good idea to convert rcollistvalues to rcolfunvalues by 
         using search_list function *)
    assert (Datatypes.length rcollistvalues = Datatypes.length cand_all).
    rewrite Heqrcollistvalues. rewrite map_length; auto. 
    remember (fun c => idx_search_list _ c cand_all rcollistvalues (cand_fin c) H1)
      as rcolfunvalues.
      
    (* convert v -> column permutation pi -> w *)
    (* get the colum shuffled ballot. Notice that t is now in column form. For any candidate c, 
         it fetches the cth column of v and permute them by pi, so t c is 
         permuted cth column of v. Important *)
    remember (fun c =>
                shuffle Crp.grp (List.length cand_all)
                        cand_all dec_cand (fun d => v d c) pi (rcolfunvalues c)) as t. 
    remember (fun c d => t d c) as w. (* transpose t to get w in row form *)
        
    (* construct zero knowledge proof of shuffle that w is column permutation of v by pi *)
    remember (fun c =>
                shuffle_zkp Crp.grp (List.length cand_all)
                            cand_all (fun d => v d c) (fun d => w d c) pi cpi s (rcolfunvalues c))
      as zkppermvw.
    
    assert (Ht2 : forall c, verify_col_permutation_ballot Crp.grp v w cpi zkppermvw c = true).
    intros. unfold verify_col_permutation_ballot. 
    pose proof (Pr.verify_shuffle_axiom pi cpi s (fun d => v d c) (fun d => w d c)
                                     (rcolfunvalues c) (zkppermvw c)  Heqcpi).
    rewrite Heqw in H2.
    assert ((fun d => t c d) = shuffle Crp.grp (List.length cand_all)
                                    cand_all dec_cand (fun d : cand => v d c) pi (rcolfunvalues c)).
    rewrite Heqt; try auto.
    specialize (H2 H3).
    rewrite Heqzkppermvw in H2. rewrite Heqw in H2. specialize (H2 eq_refl).
    rewrite Heqzkppermvw; rewrite Heqw. try auto. 

      
    (* Now decrypt the ballot w. *)
    remember (fun c d => decrypt_message Crp.grp privatekey (w c d)) as b.
    (* construct zero knowledge proof of decryption *)
    remember (fun c d => construct_zero_knowledge_decryption_proof
                          Crp.grp privatekey (w c d)) as zkpdecw.
    (* Show that the zkpdecw is true b is honest decryption of w *)
    assert (Ht3 : forall c d, verify_zero_knowledge_decryption_proof
                           Crp.grp (b c d) (w c d) (zkpdecw c d) = true).
    intros c d. rewrite Heqzkpdecw.
    apply Pr.verify_honest_decryption_zkp. rewrite Heqb. reflexivity.

    (* Now connect the validity of b to validity of u. A valid b means 
         there is no cycle in b which reflects back to ballot u and 
         u is homomorphically added to margin. 
         If b is not valid then it contains cycle and this reflects back to u *)
    destruct (matrix_ballot_valid_dec b) as [Hb | Hnb].
    (* Since b is valid so add the ballot u to margin m and call it nm *)
    remember (fun c d => homomorphic_addition Crp.grp (u c d) (m c d)) as nm.
    assert (Ht4 : forall c d, nm c d = homomorphic_addition Crp.grp (u c d) (m c d)).
    intros c d.  rewrite Heqnm. reflexivity.
    
    (* ecvalid *) 
    pose proof (ecvalid Crp.grp bs u v w b zkppermuv zkppermvw
                        zkpdecw cpi zkpcpi ts m nm inbs He
                        Hb H Ht1 Ht2 Ht3 Ht4).
    (* Induction Hypothesis *)
    destruct (IHs _ _ X) as [inb [mrg T]].
    exists inb, mrg. assumption.
    
    (* ecinvalid *)
    pose proof (ecinvalid Crp.grp bs u v w b zkppermuv zkppermvw
                          zkpdecw cpi zkpcpi ts m inbs He Hnb H
                          Ht1 Ht2 Ht3).
    destruct (IHs (u :: inbs) m X) as [inb [mrg T]].
    exists inb, mrg. assumption.
  Qed.
    
      


  
  (* for every list of incoming ballots, we can progress the count to a state where all
     ballots are processed *)
  Lemma  pall_ballots_counted (bs : list eballot) :
    existsT i m, ECount Crp.grp bs (epartial ([], i) m).
  Proof.
    pose proof (ecount_all_ballot bs) as Hs.
    destruct Hs as [encm Heg].
    pose proof (ppartial_count_all_counted bs bs [] encm Heg).
    destruct X as [i [nm He]]. exists i, nm. assumption.
  Defined.
  
    
    
  (* We decrypt the encrypted margin to run the computation *)
  Lemma decrypt_margin (bs : list eballot) :
    existsT m, ECount Crp.grp bs (edecrypt m).
  Proof.
    remember (pall_ballots_counted bs) as Hc.
    destruct Hc as [i [m Hcount]].
    remember (fun c d => decrypt_message Crp.grp privatekey (m c d)) as decm.
    remember (fun c d => construct_zero_knowledge_decryption_proof
                        Crp.grp privatekey (m c d)) as zkpdecm. 
    exists decm.
    apply ecdecrypt with (inbs := i) (encm := m) (zkp := zkpdecm). 
    assumption.
    intros c d. rewrite Heqzkpdecm.
    apply Pr.verify_honest_decryption_zkp.
    rewrite Heqdecm. reflexivity.
  Defined. 

  (* The main theorem: for every list of ballots, we can find a boolean function that decides
     winners, together with evidences of the correctness of this determination *)
  Lemma pschulze_winners (bs : list eballot) :
    existsT (f : cand -> bool), ECount Crp.grp bs (ewinners f).
  Proof.
    destruct (decrypt_margin bs) as [dm Hecount].
    exists (M.c_wins dm).
    pose proof (ecfin Crp.grp bs dm (M.c_wins dm) (M.wins_loses_type_dec dm) Hecount).
    pose proof (X (M.c_wins_true_type dm) (M.c_wins_false_type dm)).
    auto.
  Defined.

  (* End of computation. *)
End Encschulze.

(* Everthing below is connecting the plain text winner to ciphertext winner
       and ciphertext winner to plaintext winner *)

Module Encproof (Import C : Cand) (Import K : Keys)  (Import Abst : Abstype)
       (Import Crp : CryptoAxioms.Crypto C K Abst).
  Module Pf := CryptoAxioms.CAxioms C K Abst.
  Module M := Schulze.Schulze C.
  Module E := Encschulze C K Abst Crp.
  Import M E.
   
  (* Now Try to prove that result computed by schulze_winner 
       pschulze_winners are same if ballots match *)
  
  (* This function connects ballot ot pballot *)
  Definition map_ballot_pballot (b : ballot) (p : pballot) :=
    ((exists c,  b c = 0)%nat /\ ~matrix_ballot_valid p) \/
    (matrix_ballot_valid p /\ (forall c, b c > 0)%nat /\
     (forall c d, (p c d = 1 <-> (b c < b d)%nat) /\
             (p c d = 0 <-> (b c = b d)%nat) /\
             (p c d = -1 <-> (b c > b d)%nat))).
  
    
  (* This reason I am going with this proof is that my proofs depends on this. 
       But inductive type is more elegant *)
  Fixpoint mapping_ballot_pballot (bs : list ballot) (pbs : list pballot) : Prop. 
  Proof.
    refine (match bs, pbs with
            | [], [] => True
            | [], h :: _ => False 
            | h :: _, [] => False
            | h1 :: t1, h2 :: t2 =>
              map_ballot_pballot h1 h2 /\
              mapping_ballot_pballot t1 t2
            end); inversion H.
  Defined.

  Lemma connect_validity_of_ballot_pballot :
    forall (b : ballot) (p : pballot),
      map_ballot_pballot b p -> 
      proj1_sig (bool_of_sumbool (ballot_valid_dec b)) = true <->
      proj1_sig (bool_of_sumbool (matrix_ballot_valid_dec p)) = true.
  Proof.
    intros b p H.
    split; intros.
    unfold map_ballot_pballot in H. destruct H.
    destruct H.  destruct H as [c H].
    destruct (bool_of_sumbool (ballot_valid_dec b)).
    simpl in H0. rewrite H0 in y.  pose proof (y c).  omega.
    destruct H as [H1 [H2 H3]].
    destruct (bool_of_sumbool (matrix_ballot_valid_dec p)).
    simpl in *. destruct x. auto. congruence.
    
    unfold map_ballot_pballot in H.
    destruct H.  destruct H as [c H].
    destruct (bool_of_sumbool (matrix_ballot_valid_dec p)). simpl in *.
    rewrite H0 in y. congruence.
    destruct H as [H1 [H2 H3]].
    destruct (bool_of_sumbool (ballot_valid_dec b)). simpl in *.
    destruct x.  auto. destruct y. pose proof (H2 x). omega.
  Qed.

  Lemma connect_invalidity_of_ballot_pballot :
    forall (b : ballot) (p : pballot),
      map_ballot_pballot b p -> 
      proj1_sig (bool_of_sumbool (ballot_valid_dec b)) = false <->
      proj1_sig (bool_of_sumbool (matrix_ballot_valid_dec p)) = false.
  Proof.
    intros b p H.
    split; intros.
    unfold map_ballot_pballot in H.
    destruct H. destruct H.  destruct H as [c H].
    destruct (bool_of_sumbool (matrix_ballot_valid_dec p)).
    simpl in *. destruct x; congruence.
    destruct H. destruct H1.
    destruct (bool_of_sumbool (ballot_valid_dec b)). simpl in *.
    rewrite H0 in y. destruct y.  pose proof (H1 x0). omega.
    
    unfold map_ballot_pballot in H.
    destruct H. destruct H. destruct H as [c H].
    destruct (bool_of_sumbool (ballot_valid_dec b)). simpl in *.
    destruct x. pose proof (y c). omega. auto.
    destruct H. destruct H1.
    destruct (bool_of_sumbool (matrix_ballot_valid_dec p)).
    simpl in *. rewrite H0 in y. congruence.
  Qed.
 
    
   
  
  Lemma margin_same_from_both_existential 
        (bs : list ballot) (ebs : list eballot) (pbs : list pballot)
        (Ht : pbs = map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) ebs)
        (H1 : mapping_ballot_pballot bs pbs) :
    forall (s : State),
      Count bs s ->
      forall (ts : list ballot) (tinbs : list ballot)
        (m : cand -> cand -> Z), (* valid ballot, invalid ballot, running margin *)
        s = partial (ts, tinbs) m ->
        existsT 
          (ets : list eballot) (etinbs : list eballot)
          (tpbs : list pballot) (etpbs : list pballot)
          (em : cand -> cand -> ciphertext),
    (ECount Crp.grp ebs (epartial (ets, etinbs) em) *
     (m = fun c d => decrypt_message Crp.grp privatekey (em c d)) *
     (tpbs =  map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) ets) *
     (etpbs =  map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) etinbs) * 
     mapping_ballot_pballot ts tpbs *
     mapping_ballot_pballot tinbs etpbs)%type.
  Proof.   
    intros s H.  
    (* induction on structure of H *)
    induction H. intros. inversion H.
    remember (fun c d => encrypt_message Crp.grp (m c d)) as em.
    exists ebs, [], pbs, [], em.
    pose proof (ecax Crp.grp ebs ebs em m
                     (fun c d => construct_zero_knowledge_decryption_proof
                                Crp.grp privatekey (em c d)) eq_refl e0).
    simpl in X.
    assert (forall c d : cand,
               verify_zero_knowledge_decryption_proof
                 Crp.grp (m c d) (em c d)
                 (construct_zero_knowledge_decryption_proof Crp.grp privatekey (em c d)) = true).
    intros. subst. apply Pr.verify_honest_decryption_zkp. rewrite Pr.decryption_deterministic. auto.
    specialize (X H0). clear H0.
    repeat split. assumption.
    rewrite Heqem.
    apply functional_extensionality. intros.
    apply functional_extensionality. intros.
    rewrite Pr.decryption_deterministic. rewrite H4. auto.
    assumption. rewrite H2 in e. rewrite <- e in H1.
    assumption. 
    (* first case finished *)  
    
    (*  Count bs (partial (u :: us, inbs) m) and u is valid 
           g : forall c : cand, u c > 0 *)
    intros.  inversion H0.  
    specialize (IHCount (u :: us) inbs m eq_refl). 
    destruct IHCount as [ets [etinbs [tbps [etpbs [em H6]]]]].
    destruct H6. destruct p. destruct p. destruct p. destruct p.
    (* From m2 we can infer that tbps <> [] and it can be written as 
         tbps = t :: tpbs'. From this statement we can infer that ets <> [] using e0.
         ets = e :: ets'. 
         u is valid => t valid => it's encryption e is also valid 
         go for ecvalid case *)
    
    assert (forall (A : Type) (l : list A),
               l <> [] -> existsT t l', l = t :: l').
    intros. destruct l.  intuition. exists a0, l. auto.
    assert (tbps <> []). unfold not. intros. destruct tbps.
    simpl in m2. inversion m2. inversion H2. 
    destruct (X _ _ H2) as [t [tbps' Htpbs']]. clear H2.
    rewrite Htpbs' in e0.
    assert (ets <> []). unfold not. intros.
    destruct ets. simpl in e0. inversion e0. inversion H2.
    destruct (X _ _ H2) as [en [ets' Hets']]. clear H2.
    rewrite Hets' in e0. inversion e0. clear e0. clear X.
    rewrite Htpbs' in m2. simpl in m2. destruct m2.
    rewrite Hets' in e1. 
    (*  ECount grp ebs (epartial (en :: ets', etinbs) em) 
          and u is valid then t is valid and it's encryption is valid *)
    pose proof (ecvalid Crp.grp ebs).
    (* u = en, v = row permutation of u, w is column permutation of v *)
    (* generate permutation *)  
    remember (generatePermutation Crp.grp (List.length cand_all) cand_all) as pi.
    (* generate randomness S *)
    remember  (generateS Crp.grp (List.length cand_all)) as s.
    (* commit it *)
    remember (generatePermutationCommitment Crp.grp (List.length cand_all) cand_all pi s) as cpi.
    (* generate zero knowledge proof of commitment *)
    remember (zkpPermutationCommitment Crp.grp (List.length cand_all)
                                       cand_all pi cpi s) as zkpcpi. 
    (* At this point I can assert that 
         verify_permutation_commitment grp (List.length cand_all) cpi zkpcpi = true 
         using the Axiom permutation_commitment_axiom *)
    assert (verify_permutation_commitment Crp.grp (List.length cand_all) cpi zkpcpi = true).
    pose proof (Pr.permutation_commitment_axiom
                  pi cpi s zkpcpi Heqcpi Heqzkpcpi). auto.
    
    

    (* Convert en -> rowpermute pi -> v *)
    (* What if i separate the R from shuffle ? *)
    (* This is what I am doing *)
    remember (map (fun _ => generateR Crp.grp (List.length cand_all)) cand_all) as rrowlistvalues.
    (* I have generated the randomness for each row and use them in shuffling. 
         It would be good idea to convert rlistvalues to rfunvalues by 
         using search_list function *)
    assert (Datatypes.length rrowlistvalues = Datatypes.length cand_all).
    rewrite Heqrrowlistvalues. rewrite map_length; auto. 
    remember (fun c => idx_search_list _ c cand_all rrowlistvalues (cand_fin c) H10) as rrowfunvalues.
    (* Now I have converted rrowlistvalues in rrowfunvalues. Smile *)
    
    (* Create a axiom, generateRandomR which takes grp and returns R. Use this R 
         in Shuffle *)
    (* get the ballot v by shuffling each row by pi and randomness R *)
    remember (fun c =>
                shuffle Crp.grp (List.length cand_all)
                        cand_all dec_cand (en c) pi (rrowfunvalues c)) as v.
    (* construct zero knowledge proof of shuffle that v is row shuffle of u by pi
         using the same randomness R which used in shuffle *)
    remember (fun c =>
                shuffle_zkp Crp.grp (List.length cand_all)
                            cand_all (en c) (v c) pi cpi s (rrowfunvalues c)) as zkppermuv.
    
    
    (* Show that verify_row_permutation_ballot u v cpi zkppermuv return true.
         The property here is construct matrix from u and v and comp
         This is bit tricky so I am leaving it for the moment because we need to 
         massage the axioms *)
    assert (Ht1 : forall c, verify_row_permutation_ballot Crp.grp en v cpi zkppermuv c = true). 
    intros; unfold verify_row_permutation_ballot.
    pose proof (Pr.verify_shuffle_axiom pi cpi s (en c) (v c) (rrowfunvalues c) (zkppermuv c)
                                     Heqcpi).
    assert (Hvr : v c = shuffle Crp.grp (List.length cand_all)
                                cand_all dec_cand (en c) pi (rrowfunvalues c)).
    rewrite Heqv; try auto.
    specialize (H11 Hvr). clear Hvr. rewrite Heqzkppermuv in H11.
    specialize (H11 eq_refl). rewrite Heqzkppermuv; try auto. 
    
    
    
    (* generate again the randomness R to make sure that cryptographic sprit is high *)
    remember (map (fun _ => generateR Crp.grp (List.length cand_all)) cand_all) as rcollistvalues.
    (* I have generated the randomness for each column and use them in shuffling. 
         It would be good idea to convert rcollistvalues to rcolfunvalues by 
         using search_list function *)
    assert (Datatypes.length rcollistvalues = Datatypes.length cand_all).
    rewrite Heqrcollistvalues. rewrite map_length; auto. 
    remember (fun c => idx_search_list _ c cand_all rcollistvalues (cand_fin c) H11)
      as rcolfunvalues.
    
    
    (* convert v -> column permutation pi -> w *)
    (* get the colum shuffled ballot. Notice that t is now in column form. For any candidate c, 
         it fetches the cth column of v and permute them by pi, so t c is 
         permuted cth column of v. Important *)
    remember (fun c =>
                shuffle Crp.grp (List.length cand_all)
                        cand_all dec_cand (fun d => v d c) pi (rcolfunvalues c)) as tt. 
    remember (fun c d => tt d c) as w. (* transpose t to get w in row form *)
    
    (* construct zero knowledge proof of shuffle that w is column permutation of v by pi *)
    remember (fun c =>
                shuffle_zkp Crp.grp (List.length cand_all)
                            cand_all (fun d => v d c) (fun d => w d c) pi cpi s (rcolfunvalues c))
      as zkppermvw.
    
    assert (Ht2 : forall c, verify_col_permutation_ballot Crp.grp v w cpi zkppermvw c = true).
    intros. unfold verify_col_permutation_ballot. 
    pose proof (Pr.verify_shuffle_axiom pi cpi s (fun d => v d c) (fun d => w d c)
                                     (rcolfunvalues c) (zkppermvw c)  Heqcpi).
    rewrite Heqw in H12.
    assert ((fun d => tt c d) = shuffle Crp.grp (List.length cand_all)
                                     cand_all dec_cand (fun d : cand => v d c) pi (rcolfunvalues c)).
    rewrite Heqtt; try auto.
    specialize (H12 H13).
    rewrite Heqzkppermvw in H12. rewrite Heqw in H12. specialize (H12 eq_refl).
    rewrite Heqzkppermvw; rewrite Heqw. try auto. 
    
    
    
    (* Now decrypt the ballot w *)
    remember (fun c d => decrypt_message Crp.grp privatekey (w c d)) as b.
    (* construct zero knowledge proof of decryption *)
    remember (fun c d => construct_zero_knowledge_decryption_proof
                        Crp.grp privatekey (w c d)) as zkpdecw.
    (* Show that the zkpdecw is true b is honest decryption of w *)
    assert (Ht3 : forall c d, verify_zero_knowledge_decryption_proof
                           Crp.grp (b c d) (w c d) (zkpdecw c d) = true).
    intros c d. rewrite Heqzkpdecw.
    apply Pr.verify_honest_decryption_zkp. rewrite Heqb. reflexivity.
    
    (* At this point we need Axioms which connects the validity of en to b 
         g : forall c : cand, u c > 0 
         H2 : map_ballot_pballot u t
         H6 : t = (fun c d : cand => decrypt_message grp privatekey (en c d)) 
         u is valid and it infers that t is also valid. 
         t is valid then it's encryption en is also valid *)
    pose proof (proj1 (connect_validity_of_ballot_pballot u t H2)). 
    (* I know that u is valid (Hypothesis g) *)
    assert (proj1_sig (bool_of_sumbool (matrix_ballot_valid_dec t)) = true).
    destruct (ballot_valid_dec u). simpl in H12. 
    specialize (H12 eq_refl). auto.
    destruct e0. pose proof (g x). omega.
    clear H12. destruct (matrix_ballot_valid_dec t); swap 1 2.
    inversion H13. clear H13.   
    (* Now I have m2 : matrix_ballot_valid t => en should be valid 
         and row and column permutation *)     
    assert (matrix_ballot_valid b).
    unfold matrix_ballot_valid in *. unfold valid in *. 
    destruct pi as [pi Sig].
    
    (* Each row of v is shuffle of each row of en by permutation pi *)      
    assert (forall c d, t c d = decrypt_message Crp.grp privatekey (en c d)).
    intros. rewrite H6. auto.
    
    (* Interpretation of permutation. v c d = en c (pi d) and it means 
         that element at '(pi d)' position in cth row of en goes to 'd' position of cth row in v *) 
    assert (forall c d, decrypt_message Crp.grp privatekey (v c d) =
                   decrypt_message Crp.grp privatekey (en c (pi d))). 
    rewrite Heqv. intros. 
    assert (shuffle Crp.grp (List.length cand_all) cand_all dec_cand (en c)
                    (existT (fun pi : cand -> cand => Bijective pi) pi Sig) (rrowfunvalues c) = v c).
    rewrite Heqv. auto.
    rewrite H13. eapply Pr.shuffle_perm in H13. 
    unfold compose in H13.
    instantiate (1 := d) in H13. simpl in H13. assumption.
    
    assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                   decrypt_message Crp.grp privatekey (v (pi c) d)).  
    rewrite Heqw. intros. rewrite Heqtt.
    assert (shuffle Crp.grp (List.length cand_all) cand_all dec_cand (fun d0 : cand => v d0 d)
                    (existT (fun pi0 : cand -> cand => Bijective pi0) pi Sig) (rcolfunvalues d) =
            fun d0 => w d0 d).
    rewrite Heqw. rewrite Heqtt. auto.
    rewrite H14. eapply Pr.shuffle_perm in H14.
    unfold compose in H14.
    instantiate (1 := c) in H14. cbn in H14. auto.
    
    assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                   decrypt_message Crp.grp privatekey (en (pi c) (pi d))).
    intros. rewrite  H14. rewrite H13. auto.
    
    
    
    assert (forall c d, b c d = t (pi c) (pi d)).
    intros. rewrite Heqb. rewrite H15. auto.
    destruct m2 as [Tin [gfun Hg]]. split. intros.
    rewrite H16. auto. 
    
    exists (fun c => gfun (pi c)); intros. rewrite H16. 
    eapply Hg. 
    
    (* I am the happiest person on earth *)
    
    
    specialize (X en v w b zkppermuv zkppermvw zkpdecw cpi
                  zkpcpi ets' em
                  (fun c d : cand => homomorphic_addition
                                    Crp.grp (en c d) (em c d))
                  etinbs e1 H12 H9 Ht1 Ht2 Ht3).
    simpl in X.
    assert ((forall c d : cand,
                homomorphic_addition Crp.grp (en c d) (em c d) =
                homomorphic_addition Crp.grp (en c d) (em c d))).
    auto.
    specialize (X H13).
    (*  ECount grp ebs
        (epartial (ets', etinbs) (fun c d : cand => homomorphic_addition grp (en c d) (em c d))) *)
    exists ets', etinbs, tbps', etpbs, (fun c d : cand => homomorphic_addition Crp.grp (en c d) (em c d)).
    repeat split. auto. 
    apply functional_extensionality. intros.
    apply functional_extensionality. intros.
    pose proof (Pr.homomorphic_addition_axiom (en x x0) (em x x0)).
    rewrite H14.
    (*  m = (fun c d : cand => decrypt_message grp privatekey (em c d))
           H6 : t = (fun c d : cand => decrypt_message grp privatekey (en c d)) *)
    assert (t x x0 = decrypt_message Crp.grp privatekey (en x x0)).
    rewrite H6. auto.
    assert (m x x0 = decrypt_message Crp.grp privatekey (em x x0)).
    rewrite e2. auto.
    rewrite <- H15. rewrite <- H16.
    rewrite <- H5.
    destruct (a x x0) as [H17 [H18 H19]].
    unfold matrix_ballot_valid in m2. destruct m2. 
    unfold map_ballot_pballot in H2. 
    destruct H2.  destruct H2. destruct H2 as [c H2].
    specialize (g c). omega.
    (*  H2 : matrix_ballot_valid t /\
       (forall c : cand, (u c > 0)%nat) /\
       (forall c d : cand,
        (t c d = 1 <-> (u c < u d)%nat) /\
        (t c d = 0 <-> u c = u d) /\ (t c d = -1 <-> (u c > u d)%nat)) *)
    destruct H2 as [H2m [H2c H2cd]].
    destruct (H2cd x x0) as [H2cdt1 [H2cdt2 H2cdt3]].
    destruct (lt_eq_lt_dec (u x) (u x0)) as [[Hul | Hul] | Hul].
    pose proof (H17 Hul).
    apply H2cdt1 in Hul. rewrite Hul. omega.
    pose proof (H18 Hul). apply H2cdt2 in Hul. rewrite Hul. omega.
    assert (u x > u x0)%nat by omega.
    pose proof (H19 H2). apply H2cdt3 in H2. rewrite H2. omega.
    assumption. assumption. rewrite H3 in H8. assumption.
    rewrite H4 in m1. assumption.
      (* Wohoo. Valid case discharged. *)
    
    (* Now we are in situation where u is not valid. *)
    intros. inversion H0.
    assert (proj1_sig (bool_of_sumbool (ballot_valid_dec u)) = false).
    destruct (ballot_valid_dec u); simpl; try auto.
    destruct e as [c Hc]. pose proof (g c). omega.
    
    assert (forall (A : Type) (l : list A),
               l <> [] -> existsT t l', l = t :: l').
    intros. destruct l.  intuition.
    exists a, l. auto.
    assert (tinbs <> []). unfold not; intros.
    destruct tinbs.  inversion H4. inversion H6.
    destruct (X _ tinbs H6) as [t [tinbs' Hinbs']].
    clear H6.
    (* u :: inbs = t :: tinbs' *)
    rewrite Hinbs' in H4.  inversion H4.
    specialize (IHCount (u :: us) tinbs' m). rewrite H8 in IHCount.
    specialize (IHCount eq_refl).
    destruct IHCount as [ets [etinbs [tpbs [etpbs [em Htt]]]]].
    destruct Htt as [Htt Hte]. destruct Htt as [Htt Hp].
    destruct Htt as [Htt Het].
    destruct Htt as [Htt Htp].
    destruct Htt as [He Hm].
    
    assert (tpbs <> []). unfold not. intros. destruct tpbs.
    simpl in Hp. inversion Hp. inversion H6.
    destruct (X _ _ H6) as [tp [tpbs' Htpbs']].
    rewrite Htpbs' in Htp.
    assert (ets <> []). unfold not. intros.
    rewrite H9 in Htp. inversion Htp.
    destruct (X _ _ H9) as [en [ets' Hets']]. clear H6; clear H9.
    rewrite Hets' in He. rewrite Htpbs' in Hp. simpl in Hp.
    destruct Hp. rewrite Hets' in Htp. inversion Htp.
    
    (* ecinvalid *)
    
    (* generate permutation *)  
    remember (generatePermutation Crp.grp (List.length cand_all) cand_all) as pi.
    (* generate randomness S *)
    remember (generateS Crp.grp (List.length cand_all)) as s.
    (* commit it *)
    remember (generatePermutationCommitment Crp.grp (List.length cand_all) cand_all pi s) as cpi.
    (* generate zero knowledge proof of commitment *)
    remember (zkpPermutationCommitment Crp.grp (List.length cand_all)
                                       cand_all pi cpi s) as zkpcpi. 
    (* At this point I can assert that 
         verify_permutation_commitment grp (List.length cand_all) cpi zkpcpi = true 
         using the Axiom permutation_commitment_axiom *)
    assert (verify_permutation_commitment Crp.grp (List.length cand_all) cpi zkpcpi = true).
    pose proof (Pr.permutation_commitment_axiom
                  pi cpi s zkpcpi Heqcpi Heqzkpcpi). auto.
    
    
    (* Convert en -> rowpermute pi -> v *)
    (* What if i separate the R from shuffle ? *)
    (* This is what I am doing *)
    remember (map (fun _ => generateR Crp.grp (List.length cand_all)) cand_all) as rrowlistvalues.
    (* I have generated the randomness for each row and use them in shuffling. 
         It would be good idea to convert rlistvalues to rfunvalues by 
         using search_list function *)
    assert (Datatypes.length rrowlistvalues = Datatypes.length cand_all).
    rewrite Heqrrowlistvalues. rewrite map_length; auto.
    remember (fun c => idx_search_list _ c cand_all rrowlistvalues (cand_fin c) H13) as rrowfunvalues.
    (* Now I have converted rrowlistvalues in rrowfunvalues. Smile *)
    
    (* Create a axiom, generateRandomR which takes grp and returns R. Use this R 
         in Shuffle *)
    (* get the ballot v by shuffling each row by pi and randomness R *)
    remember (fun c =>
                shuffle Crp.grp (List.length cand_all)
                          cand_all dec_cand (en c) pi (rrowfunvalues c)) as v.
    (* construct zero knowledge proof of shuffle that v is row shuffle of u by pi
         using the same randomness R which used in shuffle *)
    remember (fun c =>
                shuffle_zkp Crp.grp (List.length cand_all)
                            cand_all (en c) (v c) pi cpi s (rrowfunvalues c)) as zkppermuv.
    
    
    (* Show that verify_row_permutation_ballot u v cpi zkppermuv return true.
         The property here is construct matrix from u and v and comp
         This is bit tricky so I am leaving it for the moment because we need to 
         massage the axioms *)
    assert (Ht1 : forall c, verify_row_permutation_ballot Crp.grp en v cpi zkppermuv c = true). 
    intros; unfold verify_row_permutation_ballot.
    pose proof (Pr.verify_shuffle_axiom pi cpi s (en c) (v c) (rrowfunvalues c) (zkppermuv c)
                                     Heqcpi).
    assert (Hvr : v c = shuffle Crp.grp (List.length cand_all)
                                cand_all dec_cand (en c) pi (rrowfunvalues c)).
    rewrite Heqv; try auto.
    specialize (H14 Hvr). clear Hvr. rewrite Heqzkppermuv in H14.
    specialize (H14 eq_refl). rewrite Heqzkppermuv; try auto. 
    
    
    
    (* generate again the randomness R to make sure that cryptographic sprit is high *)
    remember (map (fun _ => generateR Crp.grp (List.length cand_all)) cand_all) as rcollistvalues.
    (* I have generated the randomness for each column and use them in shuffling. 
         It would be good idea to convert rcollistvalues to rcolfunvalues by 
         using search_list function *)
    assert (Datatypes.length rcollistvalues = Datatypes.length cand_all).
    rewrite Heqrcollistvalues. rewrite map_length; auto. 
    remember (fun c => idx_search_list _ c cand_all rcollistvalues (cand_fin c) H14)
      as rcolfunvalues.
    
    
    (* convert v -> column permutation pi -> w *)
    (* get the colum shuffled ballot. Notice that t is now in column form. For any candidate c, 
         it fetches the cth column of v and permute them by pi, so t c is 
         permuted cth column of v. Important *)
    remember (fun c =>
                shuffle Crp.grp (List.length cand_all)
                        cand_all dec_cand (fun d => v d c) pi (rcolfunvalues c)) as tt. 
    remember (fun c d => tt d c) as w. (* transpose t to get w in row form *)
    
    (* construct zero knowledge proof of shuffle that w is column permutation of v by pi *)
    remember (fun c =>
                shuffle_zkp Crp.grp (List.length cand_all)
                            cand_all (fun d => v d c) (fun d => w d c) pi cpi s (rcolfunvalues c))
      as zkppermvw.
    
    assert (Ht2 : forall c, verify_col_permutation_ballot Crp.grp v w cpi zkppermvw c = true).
    intros. unfold verify_col_permutation_ballot. 
    pose proof (Pr.verify_shuffle_axiom pi cpi s (fun d => v d c) (fun d => w d c)
                                     (rcolfunvalues c) (zkppermvw c)  Heqcpi).
    rewrite Heqw in H15.
    assert ((fun d => tt c d) = shuffle Crp.grp (List.length cand_all)
                                     cand_all dec_cand (fun d : cand => v d c) pi (rcolfunvalues c)).
    rewrite Heqtt; try auto.
    specialize (H15 H16).
    rewrite Heqzkppermvw in H15. rewrite Heqw in H15. specialize (H15 eq_refl).
    rewrite Heqzkppermvw; rewrite Heqw. try auto. 
    
    
    (* Now decrypt the ballot w *)
    remember (fun c d => decrypt_message Crp.grp privatekey (w c d)) as b.
    (* construct zero knowledge proof of decryption *)
    remember (fun c d => construct_zero_knowledge_decryption_proof
                        Crp.grp privatekey (w c d)) as zkpdecw.
    (* Show that the zkpdecw is true b is honest decryption of w *)
    assert (Ht3 : forall c d, verify_zero_knowledge_decryption_proof
                           Crp.grp (b c d) (w c d) (zkpdecw c d) = true).
    intros c d. rewrite Heqzkpdecw.
    apply Pr.verify_honest_decryption_zkp. rewrite Heqb. reflexivity. 
    (* At this point we need Axioms which connects the validity of en to b 
         e : exists c : cand, u c = 0 
         H6 : map_ballot_pballot u tp
         H11 : tp = (fun c d : cand => decrypt_message grp privatekey (en c d))
         u is invalid and it infers that t is also invalid. 
         t is invalid then it's encryption en is also invalid *)
    assert (proj1_sig (bool_of_sumbool (ballot_valid_dec u)) = false).
    destruct (bool_of_sumbool (ballot_valid_dec u)). simpl.
    destruct x. destruct e as [e Hc]. pose proof (y e). omega.
    auto.
    pose proof (proj1 (connect_invalidity_of_ballot_pballot u tp H6) H15).
    (* I know that u is valid (Hypothesis g) *)
    assert (~matrix_ballot_valid tp).
    destruct (matrix_ballot_valid_dec tp). simpl in H16.
    inversion H16. auto. 
    
    (* tp is decryption of en. tp is invalid so as en. and every permutation of 
         en => v => w => b *)
    assert (~matrix_ballot_valid b).
    unfold not in *.  intros m2. destruct H17.
    unfold matrix_ballot_valid in *. unfold valid in *.
    
    destruct pi as [pi Sig]. 
    (* Each row of v is shuffle of each row of en by permutation pi *)
    
    assert (forall c d, tp c d = decrypt_message Crp.grp privatekey (en c d)).
    intros. rewrite H11. auto.
    
    
    assert (forall c d, decrypt_message Crp.grp privatekey (v c d) =
                   decrypt_message Crp.grp privatekey (en c (pi d))). 
    rewrite Heqv. intros. 
    assert (shuffle Crp.grp (List.length cand_all) cand_all dec_cand (en c)
                    (existT (fun pi : cand -> cand => Bijective pi) pi Sig) (rrowfunvalues c) = v c).
    rewrite Heqv. auto.
    rewrite H18. eapply Pr.shuffle_perm in H18. 
    unfold compose in H18.
    instantiate (1 := d) in H18. simpl in H18. assumption.
    
    assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                   decrypt_message Crp.grp privatekey (v (pi c) d)).   
    rewrite Heqw. intros. rewrite Heqtt.
    assert (shuffle Crp.grp (List.length cand_all ) cand_all dec_cand (fun d0 : cand => v d0 d)
                    (existT (fun pi0 : cand -> cand => Bijective pi0) pi Sig) (rcolfunvalues d) =
            fun d0 => w d0 d).
    rewrite Heqw. rewrite Heqtt. auto.
    rewrite H19. eapply Pr.shuffle_perm in H19.
    unfold compose in H19.
    instantiate (1 := c) in H19. cbn in H19. auto.
    
    assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                   decrypt_message Crp.grp privatekey (en (pi c) (pi d))).
    intros. rewrite  H19. rewrite H18. auto.
    
      
    assert (forall c d, b c d = tp (pi c) (pi d)).
    intros. rewrite Heqb. rewrite H20. auto. 
    assert (Hsig : Bijective pi). auto.
    unfold Bijective in Hsig.
    destruct Hsig as [pi_inv [Hg1 Hg2]].
    
    destruct m2 as [Tin [gfun Hg]]. split. intros.     
    pose proof (Tin (pi_inv c) (pi_inv d)).
    pose proof (H21 (pi_inv c) (pi_inv d)).
    rewrite Hg2 in H23. rewrite Hg2 in H23.
    rewrite H23 in H22. auto.
    (* existence of function *)
    exists (fun c => gfun (pi_inv c)); intros.
    pose proof (Hg (pi_inv c) (pi_inv d)).
    rewrite H21 in H22.  rewrite Hg2 in H22.
    rewrite Hg2 in H22. auto.
    
    pose proof (ecinvalid Crp.grp ebs en v w b zkppermuv zkppermvw zkpdecw cpi
                          zkpcpi  ets' em etinbs He H18 H10 Ht1 Ht2 Ht3).
    exists ets', (en :: etinbs), tpbs', (tp :: etpbs), em.
    repeat split. assumption. rewrite <- H5. assumption.
    assumption. simpl. rewrite H11.  apply f_equal. assumption.
    rewrite H3 in H9.  assumption. rewrite <- H7. assumption.
    assumption.
    (* Invalid case finished *)
    intros. inversion H0.
  Qed.   
    
    
  Fixpoint compute_margin (bs : list ballot) :=
    match bs with
    | [] => fun c d => 0
    | h :: t =>
      match ballot_valid_dec h with
      | left _ => update_marg h (compute_margin t)
      | right _ => compute_margin t
      end
    end.

  Lemma nat_dec_me n m : 
    ({n < m} + {m < n} + {n = m})%nat.
  Proof. 
    induction n in m |- *; destruct m; auto with arith.
    destruct (IHn m) as [H|H]; auto with arith.
    destruct H; auto with arith.
  Qed.
    
  Lemma compute_assoc :
    forall u a m, (forall c, u c > 0)%nat -> (forall c, a c > 0)%nat ->  
             update_marg u (update_marg a m) = update_marg a (update_marg u m).
  Proof.
    intros.  unfold update_marg.
    apply functional_extensionality; intros.
    apply functional_extensionality; intros.
    destruct (nat_dec_me (u x) (u x0)) as [[H1 | H1] | H1].
    apply Nat.ltb_lt in H1. rewrite H1.
    destruct (nat_dec_me (a x) (a x0)) as [[H2 | H2] | H2].
    apply Nat.ltb_lt in H2.  rewrite H2.  auto.
    assert (Ht : (a x <? a x0)%nat = false).
    apply Nat.ltb_nlt. unfold not. intros. omega.
    rewrite Ht.  apply Nat.ltb_lt in H2. rewrite H2.  omega.
    rewrite H2. rewrite Nat.ltb_irrefl. auto.
    assert (Ht : (u x <? u x0)%nat = false).
    apply Nat.ltb_nlt. unfold not. intros. omega.
    rewrite Ht.  apply Nat.ltb_lt in H1. rewrite H1.
    destruct (nat_dec_me (a x) (a x0)) as [[H2 | H2] | H2].
    apply Nat.ltb_lt in H2.  rewrite H2. omega.
    assert (Htt : (a x <? a x0)%nat = false).
    apply Nat.ltb_nlt. unfold not. intros. omega.
    rewrite Htt.  apply Nat.ltb_lt in H2. rewrite H2.  omega.
    rewrite H2. rewrite Nat.ltb_irrefl. omega.
    (* u x = u x0 *)
    rewrite H1. rewrite Nat.ltb_irrefl.
    destruct (nat_dec_me (a x) (a x0)) as [[H2 | H2] | H2].
    apply Nat.ltb_lt in H2.  rewrite H2. omega.
    assert (Htt : (a x <? a x0)%nat = false).
    apply Nat.ltb_nlt. unfold not. intros. omega.
    rewrite Htt.  apply Nat.ltb_lt in H2. rewrite H2.  omega.
    rewrite H2. rewrite Nat.ltb_irrefl. omega.
  Qed.
     
      
      
    
  Lemma valid_compute_margin_distributes :
    forall bs (u : ballot), (forall c, u c > 0)%nat ->
                       compute_margin (bs ++ [u]) = update_marg u (compute_margin bs).
  Proof.
    induction bs; simpl; intros; try auto.
    destruct (ballot_valid_dec u). auto.
    destruct e as [e He]. pose proof (H e). omega.
    
    destruct (ballot_valid_dec a).
    rewrite (compute_assoc _ _ _ H g).
    specialize (IHbs u H). rewrite IHbs. auto.
    pose proof (IHbs u H). assumption.
  Qed. 
    

  Lemma invalid_compute_margin_same :
    forall bs (u : ballot), (exists c, u c = 0)%nat -> compute_margin (bs ++ [u]) = compute_margin bs.
  Proof.
    induction bs; simpl; intros; try auto.
    destruct (ballot_valid_dec u). destruct H as [e H].
    pose proof (g e). omega. auto.
    
    destruct (ballot_valid_dec a).
    pose proof (IHbs u H). rewrite H0. auto.
    pose proof (IHbs u H). auto.
  Qed.
      

  Lemma tail_count : forall bs s,
      Count bs s ->
      forall us inbs m,
        s = partial (us, inbs) m ->
        exists cs', bs = cs' ++ us  /\ m = compute_margin cs'.
  Proof.
    (* This proof is for m = compute_margin cs' *)
    intros bs s Hc.
    induction Hc; simpl; intros; inversion H; subst; clear H.
    exists []. split. auto.  simpl.
    apply functional_extensionality; intros.
    apply functional_extensionality; intros.
    auto.
      
    pose proof (IHHc (u :: us0) inbs0 m eq_refl).
    destruct H as [cs' [H1 H2]].
    exists (cs' ++ [u]). split. rewrite app_assoc_reverse. auto.
    rewrite (valid_compute_margin_distributes _ _ g). rewrite <- H2. 
    unfold update_marg. apply functional_extensionality; intros.
    apply functional_extensionality; intros. 
    destruct (a x x0) as [H3 [H4 H5]].
    destruct (lt_eq_lt_dec (u x) (u x0)) as [[H6 | H6] | H6].
    pose proof (H3 H6).
    apply Nat.ltb_lt in H6.  rewrite H6. assumption.
    rewrite H6.
    rewrite Nat.ltb_irrefl. apply H4. assumption.
    assert ((u x <? u x0) = false)%nat. apply Nat.ltb_nlt.
    unfold not.  intros. omega.
    rewrite H. clear H.
    assert (u x > u x0)%nat by omega. 
    apply Nat.ltb_lt in H6. rewrite H6.  
    apply H5. assumption.
    
    pose proof (IHHc (u :: us0) inbs m0 eq_refl).
    destruct H as [cs' [H1 H2]].
    exists (cs' ++ [u]). split. rewrite app_assoc_reverse. auto.
    rewrite (invalid_compute_margin_same _ _ e). auto.  
  Qed.
    


  (* Counting same list of ballots would give same margin *)
  Lemma unique_margin : forall bs inbs inbs0 m m0 s s0 (c0 : Count bs s) (c1 : Count bs s0),
      s = partial ([], inbs) m ->
      s0 = partial ([], inbs0) m0 -> m = m0.
  Proof.
    intros.
    pose proof (tail_count bs s c0 [] inbs m H).
    destruct H1 as [cs' [H1 H2]]. rewrite <- app_nil_end in H1.
    rewrite <- H1 in H2.
    pose proof (tail_count bs s0 c1 [] inbs0 m0 H0).
    destruct H3 as [cs1' [H1' H2']]. rewrite <- app_nil_end in H1'.
    rewrite <- H1' in H2'. rewrite H2, H2'. reflexivity.
  Qed.
    
   
                                                                            
  (* Uniqueness of winners *)
  Lemma uniqueness_proof : forall bs w w',
      Count bs (winners w) -> Count bs (winners w') -> w = w'.
  Proof.
    intros bs w w' H1 H2.     
    inversion H1. inversion H2.
    subst.  pose proof (unique_margin bs inbs inbs0 m m0 _ _  X X0 eq_refl eq_refl).
    subst.  apply functional_extensionality; intros.
    specialize (H3 x). specialize (H0 x). 
    specialize (H5 x). specialize (H6 x). 
    remember (w x) as Hw.
    remember (w' x) as Hw'.
    destruct Hw; destruct Hw'; try auto. 
    specialize ((proj1 H6) eq_refl); intros.
    specialize ((proj1 H0) eq_refl); intros.
    destruct H. destruct H4.
    destruct H3. destruct H5.
    pose proof (loses_type_prop m0 x x0).
    pose proof (loses_prop_iterated_marg m0 x H9).
    destruct H10 as [dd H10].
    pose proof (wins_type_prop m0 x x1).
    pose proof (wins_prop_iterated_marg m0 x H11).
    pose proof (H12 dd). omega.
    
    specialize ((proj1 H3) eq_refl); intros.
    specialize ((proj1 H5) eq_refl); intros.
    destruct H. destruct H4.
    destruct H3. destruct H5.
    pose proof (loses_type_prop m0 x x0).
    pose proof (loses_prop_iterated_marg m0 x H9).
    destruct H10 as [dd H10].
    pose proof (wins_type_prop m0 x x1).
    pose proof (wins_prop_iterated_marg m0 x H11).
    pose proof (H12 dd). omega.
  Qed.
    
  
  
  (* If there one to one correspondence between ballots and encrypted ballots, 
       then computing winners via plaintext ballot is same as encrypted ballot *)
  Lemma plaintext_schulze_to_homomorphic:
    forall (bs : list ballot) (pbs : list pballot) (ebs : list eballot)
      (w : cand -> bool)
      (H : pbs = map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) ebs)
      (H2 : mapping_ballot_pballot bs pbs), (* valid b <-> valid pb *)
      Count bs (winners w) -> ECount Crp.grp ebs (ewinners w).
  Proof.
    (* Show that margin computed from bs is same as ebs *)
    intros bs pbs ebs w H0 H1 H2.
    destruct (all_ballots_counted bs) as [inb [fm Hm]].
    pose proof (margin_same_from_both_existential bs ebs pbs H0 H1 _ Hm
                                                  [] inb fm eq_refl).
    destruct X as [ets [etinbs [tpbs [etpbs [em He]]]]].
    destruct He as [[[[[He Hfm] Htpb] Hetp] Het] Hie].
    assert(tpbs = []). destruct tpbs. auto. simpl in Het. inversion Het.
    assert (ets = []). destruct ets. auto.
    rewrite H in Htpb. inversion Htpb. rewrite H3 in He. 
    
    pose proof (ecdecrypt Crp.grp ebs etinbs
                          em
                          fm
                          (fun c d => construct_zero_knowledge_decryption_proof
                                     Crp.grp privatekey (em c d)) He).
    simpl in X. 
    assert (forall c d : cand,
               verify_zero_knowledge_decryption_proof
                 Crp.grp (fm c d) (em c d)
                 (construct_zero_knowledge_decryption_proof Crp.grp privatekey (em c d)) = true).
    intros. apply Pr.verify_honest_decryption_zkp. rewrite Hfm. auto.
    specialize (X H4). clear H4.
    
    pose proof (fin bs fm inb (c_wins fm) (wins_loses_type_dec fm) Hm
                    (c_wins_true_type fm) (c_wins_false_type fm)).
    pose proof (ecfin Crp.grp ebs fm (c_wins fm) (M.wins_loses_type_dec fm)
                      X (M.c_wins_true_type fm) (M.c_wins_false_type fm)).
    
    (* All I need now is assert c_wins fm = w *)
    pose proof (uniqueness_proof bs w (c_wins fm) H2 X0).
    rewrite H4. assumption.
  Qed.


    
  (* existence of permutation pi which is used to permute the ballots 
       v, and w *)
  Theorem existence_of_perm :
    forall cpi zkpcpi,
      verify_permutation_commitment Crp.grp (Datatypes.length cand_all) cpi zkpcpi = true ->
      existsT (pi : Permutation),  forall u v w zkppermuv zkppermvw, 
    (forall c, verify_row_permutation_ballot Crp.grp u v cpi zkppermuv c = true) ->
    (forall c, verify_col_permutation_ballot Crp.grp v w cpi zkppermvw c = true) ->
    forall c d, (decrypt_message Crp.grp privatekey (v c d) =
            decrypt_message Crp.grp privatekey (u c (projT1 pi d))) /\
           (decrypt_message Crp.grp privatekey (w c d) =
            decrypt_message Crp.grp privatekey (v (projT1 pi c) d)).
  Proof.
    intros. pose proof (Pr.perm_axiom cpi zkpcpi H).  
    destruct X as [pi X]. 
    exists pi. intros.
    unfold verify_row_permutation_ballot in H0.
    unfold verify_col_permutation_ballot in H1.
    split. pose proof (X (u c) (v c) (zkppermuv c) (H0 c)). apply H2.   
    pose proof (X (fun c0 => v c0 d) (fun c0 => w c0 d) (zkppermvw d) (H1 d)).
    apply H2.
  Qed.
   
    
    
  (* Correctness in reverse direction. From encrypted ballots to plaintext *)
  Lemma margin_same_from_both_existential_rev 
        (bs : list ballot) (ebs : list eballot) (pbs : list pballot)
        (Ht : pbs = map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) ebs)
        (H1 : mapping_ballot_pballot bs pbs) :
    forall (s : EState),
      ECount Crp.grp ebs s ->
      forall (ets etinbs : list eballot)
        (tpbs etpbs : list pballot)
        (em : cand -> cand -> ciphertext)
        (H2 : tpbs = map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) ets)
        (H3 : etpbs = map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) etinbs),
        s = epartial (ets, etinbs) em ->
        existsT
          (ts tinbs : list ballot)
          (m : cand -> cand -> Z), 
    (Count bs (partial (ts, tinbs) m) *
     (m = fun c d => decrypt_message Crp.grp privatekey (em c d)) *
     mapping_ballot_pballot ts tpbs *
     mapping_ballot_pballot tinbs etpbs)%type.
  Proof.
    intros s H.
    induction H; intros. inversion H. 
    exists bs, [], decm.
    pose proof (ax bs bs decm eq_refl e0).
    repeat split.  auto.
    (* Now from e1, I need to infer that decm is honest decryption of em *)
    apply functional_extensionality; intros.
    apply functional_extensionality; intros.
    pose proof (e1 x x0). subst. 
    (* This goal should be discharged from assumption H0 using the following Axiom.
         verify_zero_knowledge_decryption_proof grp dec enc zkp = true -> 
         dec = decryption_message grp privatekey enc *)
    apply Pr.decryption_from_zkp_proof with
        (c := em x x0) (zkp := zkpdec x x0); auto.
      
    subst. assumption.
    rewrite <- H5 in H3.  simpl in H3.  rewrite H3. apply I.
    
    (* ECvalid case. matrix_ballot valid b. 
         I am going to add u in encrypted margin *)
    inversion H0.
    specialize (IHECount (u :: us) inbs). simpl in IHECount.
    specialize (IHECount ((fun c d : cand => decrypt_message Crp.grp privatekey (u c d)) :: tpbs)
                         etpbs m).
    rewrite H2 in IHECount. rewrite H5 in IHECount.
    specialize (IHECount eq_refl).
    rewrite <- H6 in H3.
    specialize (IHECount H3 eq_refl).
    destruct IHECount as [ts [tinbs [decm IHm]]].
    destruct IHm as [[[IHc Hdec] Hts] Hm].
    destruct ts.  inversion Hts.  simpl in Hts.
    destruct Hts. 
    (*  m0 : matrix_ballot_valid b
          e : verify_permutation_commitment grp (Datatypes.length cand_all) cpi zkpcpi = true
          e0 : forall c : cand, verify_row_permutation_ballot grp u v cpi zkppermuv c = true
          e1 : forall c : cand, verify_col_permutation_ballot grp v w cpi zkppermvw c = true
          e2 : forall c d : cand,
                 verify_zero_knowledge_decryption_proof grp (b c d) (w c d) (zkpdecw c d) = true
         I know b is valid so this translates back to validity of u. 
         Since u is valid then b0 is valid *)
    assert (matrix_ballot_valid
              (fun c d : cand => decrypt_message Crp.grp privatekey (u c d))).
    pose proof (existence_of_perm cpi zkpcpi e). 
    destruct X as [[pi Hsig] Hf].
    specialize (Hf u v w zkppermuv zkppermvw e0 e1).
    destruct m0 as [Min [fn Mas]].

    assert (forall c d, decrypt_message Crp.grp privatekey (v c d) =
                   decrypt_message Crp.grp privatekey (u c (pi d))). 
     intros. pose proof (Hf c d).
     simpl in H9. destruct H9. assumption.

     assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                    decrypt_message Crp.grp privatekey (v (pi c) d)). 
     intros. pose proof (Hf c d). destruct H10. assumption.

     assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                    decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
     intros. rewrite H10. rewrite H9. auto.

     assert (forall c d, b c d = decrypt_message Crp.grp privatekey (w c d)).
     intros. pose proof (Pr.decryption_from_zkp_proof (w c d) (b c d) (zkpdecw c d) (e2 c d));
               assumption.

     assert (forall c d, b c d = decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
     intros.  rewrite H12. auto.
 
     split. intros. unfold Bijective in Hsig.
     destruct Hsig as [pi_inv [Hp1 Hp2]].
     pose proof (H13 (pi_inv c) (pi_inv d)). rewrite Hp2 in H14. rewrite Hp2 in H14.
     rewrite <- H14. auto.
     unfold valid.  destruct Hsig as [pi_inv [Hp1 Hp2]].
     exists (fun c => fn (pi_inv c)). intros. 
     pose proof (H13 (pi_inv c) (pi_inv d)).
     rewrite Hp2 in H14. rewrite Hp2 in H14.  rewrite <- H14.
     pose proof (Mas (pi_inv c) (pi_inv d)). assumption.
     
     

     
     pose proof (proj2 (connect_validity_of_ballot_pballot
                          b0
                          (fun c d : cand => decrypt_message Crp.grp privatekey (u c d)) H4)).
     assert ( forall c : cand, (b0 c > 0)%nat).
     destruct ((matrix_ballot_valid_dec (fun c d : cand =>
                                           decrypt_message Crp.grp privatekey (u c d)))).
     simpl in H10. specialize (H10 eq_refl).
      destruct (ballot_valid_dec b0). auto. inversion H10. congruence.
      (* Add this ballot in count *)
      pose proof (cvalid bs b0 ts decm
                         (fun c d : cand => decrypt_message Crp.grp privatekey (nm c d))
                         tinbs IHc H11).
      unfold map_ballot_pballot in H4.      
      assert (
          forall c d : cand,
            ((b0 c < b0 d)%nat ->
             (fun c0 d0 : cand => decrypt_message Crp.grp privatekey (nm c0 d0)) c d = decm c d + 1) /\
            (b0 c = b0 d -> (fun c0 d0 : cand => decrypt_message Crp.grp privatekey (nm c0 d0)) c d
                           = decm c d) /\
            ((b0 c > b0 d)%nat ->
             (fun c0 d0 : cand => decrypt_message Crp.grp privatekey (nm c0 d0)) c d = decm c d - 1)).
      destruct H4.  destruct H4.  congruence.
      destruct H4. destruct H12.  
      intros.
      split. intros. 
      pose proof (H13 c d).  rewrite e3.
      rewrite Pr.homomorphic_addition_axiom. destruct H15. apply H15 in H14.
      rewrite H14.  rewrite Hdec.
      rewrite Z.add_1_l. auto.
      split. intros. 
      destruct (H13 c d) as [Htt [H15 H16]].
      apply H15 in H14.  rewrite e3. rewrite Pr.homomorphic_addition_axiom.
      rewrite H14.  simpl. rewrite Hdec. auto.
      intros. destruct (H13 c d) as [Htt [H15 H16]].
      apply H16 in H14.  rewrite e3. rewrite Pr.homomorphic_addition_axiom.
      rewrite H14.  rewrite Hdec. rewrite Z.add_comm. auto.
      specialize (X H12).
      exists ts, tinbs, (fun c d : cand => decrypt_message Crp.grp privatekey (nm c d)).
      split. split. split. auto. rewrite H7. auto.  rewrite <- H2 in H8. auto.
      auto.
      (* Finished cvalid case *)

      inversion H0.
      assert (etinbs <> []). destruct etinbs. inversion H6.
      unfold not. intro. inversion H4.
      destruct etinbs.  unfold not in H4.
      pose proof (H4 eq_refl). inversion H8.
      inversion H6. 
      specialize (IHECount (u :: us) etinbs).
      simpl in IHECount.
      specialize (IHECount ((fun c d : cand => decrypt_message Crp.grp privatekey (u c d)) :: tpbs)).
      simpl in H3. destruct etpbs. inversion H3.
      inversion H3.
      specialize (IHECount etpbs m). rewrite <- H5 in H2.
      rewrite H2 in IHECount. specialize (IHECount eq_refl H12).
      rewrite H10 in IHECount. specialize (IHECount eq_refl).
      destruct IHECount as [ts [tinbs [decm IHm]]].
      destruct IHm as [[[IHc Hdec] Hts] Hm].
      destruct ts. inversion Hts. destruct Hts.
      (* 
       n : ~ matrix_ballot_valid b
       e : verify_permutation_commitment grp (Datatypes.length cand_all) cpi zkpcpi = true
       e0 : forall c : cand, verify_row_permutation_ballot grp u v cpi zkppermuv c = true
       e1 : forall c : cand, verify_col_permutation_ballot grp v w cpi zkppermvw c = true
       e2 : forall c d : cand,
          verify_zero_knowledge_decryption_proof grp (b c d) (w c d) (zkpdecw c d) = true
       I know b is invalid so this translates back to invalidity of u. 
         Since u is invalid then b0 is invalid *)
      assert (~matrix_ballot_valid
               (fun c d : cand => decrypt_message Crp.grp privatekey (u c d))).
      intro. apply n.
      
      unfold matrix_ballot_valid in *.  destruct H14 as [H14 [g Hg]].
      
      pose proof (existence_of_perm cpi zkpcpi e). 
      destruct X as [[pi Hsig] Hf].
      specialize (Hf u v w zkppermuv zkppermvw e0 e1).
      
      assert (forall c d, decrypt_message Crp.grp privatekey (v c d) =
                     decrypt_message Crp.grp privatekey (u c (pi d))). 
      intros. pose proof (Hf c d).
      simpl in H15. destruct H15. assumption.
      
      assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                     decrypt_message Crp.grp privatekey (v (pi c) d)). 
      intros. pose proof (Hf c d). simpl in H16. destruct H16. assumption.
      
      assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                     decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
      intros. rewrite H16. rewrite H15. auto.
      
      assert (forall c d, b c d = decrypt_message Crp.grp privatekey (w c d)).
      intros. pose proof (Pr.decryption_from_zkp_proof (w c d) (b c d) (zkpdecw c d) (e2 c d));
                assumption.
      
      assert (forall c d, b c d = decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
      intros.  rewrite H18. auto.
      
      
     
      split. intros. unfold Bijective in Hsig.
      destruct Hsig as [pi_inv [Hp1 Hp2]].
      rewrite H19. auto. 
      unfold valid.  destruct Hsig as [pi_inv [Hp1 Hp2]].
      exists (fun c => g (pi c)). intros.
      rewrite H19. auto. 
      
      pose proof (proj2 (connect_invalidity_of_ballot_pballot
                           b0
                           (fun c d : cand => decrypt_message Crp.grp privatekey (u c d)) H8)).
      assert (exists c, (b0 c = 0)%nat). 
      destruct (matrix_ballot_valid_dec
                  (fun c d : cand => decrypt_message Crp.grp privatekey (u c d))).
      congruence. simpl in H15. specialize (H15 eq_refl).
      destruct (ballot_valid_dec b0). inversion H15.  auto.
      pose proof (cinvalid bs b0 ts decm tinbs IHc H16).
      exists ts, (b0 :: tinbs), decm.
      split. split. split. auto.
      rewrite H7 in Hdec. auto.
      rewrite <- H2 in H13. auto.
      simpl.  split. rewrite <- H9. auto.
      rewrite <- H12. auto.
      (* finished cinvalid *)
      inversion H0.
      inversion H0.  
  Qed.


    


  (* This function computes the encrypted margin *)
  Fixpoint compute_margin_enc (bs : list eballot) :=
    match bs with
    | [] => fun c d => encrypt_message Crp.grp 0
    | h :: t =>
      match matrix_ballot_valid_dec (fun c d => decrypt_message Crp.grp privatekey (h c d)) with
      | left _ => fun c d => homomorphic_addition Crp.grp (h c d) (compute_margin_enc t c d)
      | right _ => compute_margin_enc t
      end
    end.

 
      
      
    Lemma valid_compute_margin_distributes_enc :
      forall bs (u : eballot),
        matrix_ballot_valid (fun c d : cand => decrypt_message Crp.grp privatekey (u c d)) ->
        forall c d, decrypt_message Crp.grp privatekey
                               (compute_margin_enc (bs ++ [u]) c d) =
               decrypt_message Crp.grp privatekey
                               (homomorphic_addition Crp.grp (u c d) (compute_margin_enc bs c d)).
    Proof. 
      induction bs.
      + simpl; intros. 
        destruct (matrix_ballot_valid_dec (fun c d : cand =>
                                             decrypt_message Crp.grp privatekey (u c d)));
          try congruence.
      + intros. simpl.
        destruct (matrix_ballot_valid_dec (fun c d : cand =>
                                             decrypt_message Crp.grp privatekey (a c d))).
        pose proof (IHbs _ H).
        repeat rewrite Pr.homomorphic_addition_axiom.  rewrite H0.
        rewrite Pr.homomorphic_addition_axiom. lia. auto. 
    Qed.
    
        


    Lemma invalid_compute_margin_same_enc :
      forall bs (u : eballot),
        ~matrix_ballot_valid (fun c d : cand => decrypt_message Crp.grp privatekey (u c d)) ->
        forall c d, decrypt_message Crp.grp privatekey 
                               (compute_margin_enc (bs ++ [u]) c d) = 
               decrypt_message Crp.grp privatekey (compute_margin_enc bs c d).
    Proof.
      induction bs; simpl; intros; try auto.
      destruct (matrix_ballot_valid_dec _).
      congruence. auto.
      
      destruct (matrix_ballot_valid_dec _).
      pose proof (IHbs u H).
      repeat rewrite Pr.homomorphic_addition_axiom.
      rewrite H0. auto.
      pose proof (IHbs u H). auto.
    Qed.
    
      
      
    Lemma tail_count_enc : forall bs s,
        ECount Crp.grp bs s ->
        forall us inbs m,
          s = epartial (us, inbs) m ->
          exists cs', bs = cs' ++ us /\
                 (forall c d, decrypt_message Crp.grp privatekey (m c d) =
                         decrypt_message Crp.grp privatekey (compute_margin_enc cs' c d)).
    Proof.
      intros bs s Hc.
      induction Hc; simpl; intros; inversion H; subst; clear H.
      exists []. split. auto.  simpl.
      intros. rewrite Pr.decryption_deterministic. 
      (* This goal can be discharged using axiom e1 which states that 
         decryption of m is decm *)

      pose proof (Pr.decryption_from_zkp_proof (m c d) (decm c d) (zkpdec c d) (e1 c d)).
      rewrite <- H. auto. 
     
      pose proof (IHHc (u :: us0) inbs0 m eq_refl).
      destruct H as [cs' [H1 H2]].
      exists (cs' ++ [u]). split. rewrite app_assoc_reverse. auto.
      intros. 
      (*  m0 : matrix_ballot_valid b it means matrix_ballot_valid u 
          so add it to the counting *)
      assert (matrix_ballot_valid (fun c d : cand => decrypt_message Crp.grp privatekey (u c d))). 
      pose proof (existence_of_perm cpi zkpcpi e). 
      destruct X as [[pi Hsig] Hf].
      specialize (Hf u v w zkppermuv zkppermvw e0 e1).
      destruct m0 as [Min [fn Mas]].

      assert (forall c d, decrypt_message Crp.grp privatekey (v c d) =
                     decrypt_message Crp.grp privatekey (u c (pi d))). 
      intros. pose proof (Hf c0 d0). destruct H.
      simpl in H.  assumption.
      
      assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                     decrypt_message Crp.grp privatekey (v (pi c) d)). 
      intros. pose proof (Hf c0 d0). destruct H0. assumption.
      
      assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                     decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
      intros. rewrite H0. rewrite H. auto.
      
      assert (forall c d, b c d = decrypt_message Crp.grp privatekey (w c d)).
      intros. pose proof (Pr.decryption_from_zkp_proof (w c0 d0) (b c0 d0)
                                                    (zkpdecw c0 d0) (e2 c0 d0)); assumption.

      assert (forall c d, b c d = decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
      intros. rewrite <- H3. auto.

      split. intros. unfold Bijective in Hsig.
      destruct Hsig as [pi_inv [Hp1 Hp2]].
      pose proof (H5 (pi_inv c0) (pi_inv d0)). rewrite Hp2 in H6. rewrite Hp2 in H6.
      rewrite <- H6. auto.
      unfold valid.  destruct Hsig as [pi_inv [Hp1 Hp2]].
      exists (fun c => fn (pi_inv c)). intros. 
      pose proof (H5 (pi_inv c0) (pi_inv d0)).
      rewrite Hp2 in H6. rewrite Hp2 in H6.  rewrite <- H6.
      pose proof (Mas (pi_inv c0) (pi_inv d0)). assumption.

      pose proof (valid_compute_margin_distributes_enc cs' u H).
      rewrite H0.
      rewrite e3.
      rewrite Pr.homomorphic_addition_axiom.
      rewrite Pr.homomorphic_addition_axiom.
      f_equal. apply H2.

      (* Hypothesis n states that b is not valid so it translates 
         back to decryption of u *)
      assert (Hm :
                ~matrix_ballot_valid (fun c d : cand => decrypt_message Crp.grp privatekey (u c d))).


      intro. apply n.
      unfold matrix_ballot_valid in *.
      destruct H as [H [g Hg]].

      pose proof (existence_of_perm cpi zkpcpi e). 
      destruct X as [[pi Hsig] Hf].
      specialize (Hf u v w zkppermuv zkppermvw e0 e1).

      assert (forall c d, decrypt_message Crp.grp privatekey (v c d) =
                     decrypt_message Crp.grp privatekey (u c (pi d))). 
      intros. pose proof (Hf c d).
      simpl in H0. destruct H0. assumption.

      assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                     decrypt_message Crp.grp privatekey (v (pi c) d)). 
      intros. pose proof (Hf c d). simpl in H1. destruct H1. assumption.

      assert (forall c d, decrypt_message Crp.grp privatekey (w c d) =
                     decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
      intros. rewrite H1. rewrite H0. auto.

      assert (forall c d, b c d = decrypt_message Crp.grp privatekey (w c d)).
      intros. pose proof (Pr.decryption_from_zkp_proof (w c d) (b c d) (zkpdecw c d) (e2 c d));
                assumption.

      assert (forall c d, b c d = decrypt_message Crp.grp privatekey (u (pi c) (pi d))).
      intros. rewrite H3. auto.

      split. intros. unfold Bijective in Hsig.
      destruct Hsig as [pi_inv [Hp1 Hp2]].
      rewrite H4. auto. 
      unfold valid.  destruct Hsig as [pi_inv [Hp1 Hp2]].
      exists (fun c => g (pi c)). intros.
      rewrite H4. auto. 

      
      pose proof (IHHc (u :: us0) inbs m0 eq_refl).
      destruct H as [cs' [H1 H2]].
      exists (cs' ++ [u]). split. rewrite app_assoc_reverse. auto. intros.
      rewrite (invalid_compute_margin_same_enc _ _ Hm). auto. 
    Qed.
    
    
    
    

    Lemma same_margin_enc :
      forall bs inbs inbs0 encm encm0 s s0 (c0 : ECount Crp.grp bs s) (c1 :  ECount Crp.grp bs s0),  
        s = epartial ([], inbs) encm ->
        s0 = epartial ([], inbs0) encm0 ->
        forall c d, decrypt_message Crp.grp privatekey (encm c d) =
               decrypt_message Crp.grp privatekey (encm0 c d). 
    Proof.
      intros.
      pose proof (tail_count_enc bs s c0 [] inbs encm H).
      destruct H1 as [cs' [H1 H2]]. rewrite <- app_nil_end in H1.
      rewrite <- H1 in H2.
      pose proof (tail_count_enc bs s0 c1 [] inbs0 encm0 H0).
      destruct H3 as [cs1' [H1' H2']]. rewrite <- app_nil_end in H1'.
      rewrite <- H1' in H2'. rewrite H2, H2'. reflexivity.
    Qed.
      
      
    
    Lemma unique_dec_margin : forall bs dm dm0,
      ECount Crp.grp bs (edecrypt dm) ->  ECount Crp.grp bs (edecrypt dm0) ->
      dm = dm0.
    Proof.
      intros. inversion X. inversion X0. subst.
      (* The proof is if you count same set of ballots then decryption is same 
             ECount grp bs (epartial ([], inbs) encm)
             ECount grp bs (epartial ([], inbs0) encm0)
            forall c d, decryption_message grp privatekey (encm c d) = 
            forall c d, decryption_message  grp privatekey (encm0 c d) *)
      pose proof (same_margin_enc bs inbs inbs0 encm encm0 _ _ X1 X2 eq_refl eq_refl).
      (* From zero knowledge proof axiom, we can infer that dm is decryption of 
         encm and dm0 is decryption of encm0. By hypothesis H, we can infer that 
         dm = dm0 *)
      apply functional_extensionality; intros.
      apply functional_extensionality; intros.
      pose proof (Pr.decryption_from_zkp_proof  (encm x x0) (dm x x0) (zkp x x0) (H0 x x0)).
      pose proof (Pr.decryption_from_zkp_proof  (encm0 x x0) (dm0 x x0) (zkp0 x x0) (H2 x x0)).
      rewrite H1. rewrite H3.  auto. 
    Qed.
        
      
    
    Lemma uniqueness_proof_enc : forall bs w w',
        ECount Crp.grp bs (ewinners w) -> ECount Crp.grp bs (ewinners w') -> w = w'.
    Proof. 
      intros bs w w' H1 H2.
      inversion H1. inversion  H2. 
      pose proof (unique_dec_margin _ _ _ X X0).
      subst. apply functional_extensionality; intros.

      specialize (H3 x). specialize (H0 x). 
      specialize (H5 x). specialize (H6 x). 
      remember (w x) as Hw.
      remember (w' x) as Hw'.
      destruct Hw; destruct Hw'; try auto. 
      specialize ((proj1 H6) eq_refl); intros.
      specialize ((proj1 H0) eq_refl); intros.
      destruct H. destruct H4.
      destruct H3. destruct H5.
      pose proof (M.loses_type_prop dm0 x x0).
      pose proof (M.loses_prop_iterated_marg dm0 x H9).
      destruct H10 as [dd H10].
      pose proof (M.wins_type_prop dm0 x x1).
      pose proof (M.wins_prop_iterated_marg dm0 x H11).
      pose proof (H12 dd). omega.

      specialize ((proj1 H3) eq_refl); intros.
      specialize ((proj1 H5) eq_refl); intros.
      destruct H. destruct H4.
      destruct H3. destruct H5.
      pose proof (M.loses_type_prop dm0 x x0).
      pose proof (M.loses_prop_iterated_marg dm0 x H9).
      destruct H10 as [dd H10].
      pose proof (M.wins_type_prop dm0 x x1).
      pose proof (M.wins_prop_iterated_marg dm0 x H11).
      pose proof (H12 dd). omega.
    Qed.
      
 
    Lemma homomorphic_schulze_to_plaintext:
      forall  (bs : list ballot) (pbs : list pballot) (ebs : list eballot)
         (w : cand -> bool)
         (H : pbs = map (fun x => (fun c d => decrypt_message Crp.grp privatekey (x c d))) ebs)
         (H2 : mapping_ballot_pballot bs pbs), (* valid b <-> valid pb *)
        ECount Crp.grp ebs (ewinners w) -> Count bs (winners w).
    Proof.
      intros bs pbs ebs w H0 H1 H2.
      destruct (pall_ballots_counted ebs) as [inb [fm Hm]]. 
      pose proof (margin_same_from_both_existential_rev
                     bs ebs pbs H0 H1 _ Hm [] inb []
                    (map
                       (fun (x : cand -> cand -> ciphertext)
                          (c d : cand) => decrypt_message Crp.grp privatekey (x c d)) inb)
                 fm eq_refl eq_refl eq_refl).
      destruct X as [ts [tinbs [m [[[IHc Hmm] IHm] Hw]]]].    
      assert (ts = []). destruct ts. reflexivity. inversion IHm.
      rewrite H in IHc, IHm.
      pose proof (ecdecrypt Crp.grp ebs inb fm m
                 (fun c d => construct_zero_knowledge_decryption_proof
                            Crp.grp privatekey (fm c d)) Hm).
      simpl in X.
      assert (forall c d : cand,
                 verify_zero_knowledge_decryption_proof
                   Crp.grp (m c d) (fm c d)
                   (construct_zero_knowledge_decryption_proof Crp.grp privatekey (fm c d)) = true).
      intros. apply Pr.verify_honest_decryption_zkp. rewrite Hmm. auto.
      specialize (X H3). clear H3. 
      pose proof (fin bs m tinbs (c_wins m) (wins_loses_type_dec m) IHc
                      (c_wins_true_type m) (c_wins_false_type m)).
      pose proof (ecfin Crp.grp ebs m (M.c_wins m) (M.wins_loses_type_dec m)
                        X (M.c_wins_true_type m) (M.c_wins_false_type m)).
      (* I need uniqueness proof stating that 
         ECount grp ebs (ewinners w) ->  ECount grp ebs (ewinners (c_wins m)) -> 
         w = c_wins m *)  
      pose proof (uniqueness_proof_enc ebs _ _ H2 X1).
      rewrite H3. auto. 
    Qed.

End Encproof.
