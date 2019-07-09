
From mathcomp Require Import ssreflect ssrfun ssrbool ssrint eqtype ssrnat seq choice fintype rat finfun.
From mathcomp Require Import bigop ssralg div ssrnum ssrint.
From mathcomp Require Import fingroup finset. 
From mathcomp Require Import cyclic zmodp.

Require Import Posrat Premeas Meas Aux Logic String SSRString SeqOps RLems Tacs DerivedTacs Aux OTBase.

Definition lset_ch {N T : choiceType} `{type T} (rs : rlist N T) (n : N) (r : reaction N T + N * T) :=
  match (ofind rs (fun x => chan_of x == n)) with
    | Some i => lset rs i r
    | None => rs
                end.

Definition insert_ch {N T : choiceType} `{type T} (rs : rlist N T) (n : N) (r : reaction N T + N * T) :=
  match (ofind rs (fun x => chan_of x == n)) with
    | Some i => insert rs i r
    | None => rs
                end.
  
Definition rename_ch {N T : choiceType} `{type T} (rs : rlist N T) (n n' : N) :=
  rlist_subst _ _ rs n n'.

Ltac oppc a :=
  match a with
  | leftc => rightc
  | rightc => leftc
                end.

Ltac ext_match a n :=
  let aopp := oppc a in
  let d1 := get_dist_at a n in
  r_ext_at aopp n d1.

Module OT.
  Import OblivTransfer.

  Local Instance ty_type : type [eqType of ty].
  econstructor.
  instantiate (1 := denomTy).
  instantiate (1 := tyPair).
  done.
  Defined.

  Open Scope string_scope.
  
  Definition pr {A} (f : bool -> A) := (f true, f false).
  Definition pget {A} (x : A * A) : bool -> A := fun b => if b then x.1 else x.2.

  Notation "b1 'xor' b2" := (xorb b1 b2) (at level 80).

  Definition OT_real : rl :=
    [::
       inr ("m", tyPair tyBool tyBool);
       inr ("i", tyBool);
       [::] ~> ("p", tyTDP) hid (munif [finType of TDP]);
       [::] ~> ("y", tyPair tyD tyD) hid ((munif D) ** (munif D));
       [:: ("i", tyBool); ("N2Rf", tyTDP); ("y", tyPair tyD tyD)] ~> ("z", tyPair tyD tyD) dhid
            (fun i f y => pr (fun b => if b == i then sval f (pget y b) else (pget y b)));
       [:: ("N2Tz", tyPair tyD tyD); ("p", tyTDP); ("m", tyPair tyBool tyBool)] ~> ("x", tyPair tyBool tyBool) dhid
            (fun z f m => pr (fun b => B (dec_inv_f f (pget z b)) xor (pget m b)));
       [:: ("N2Rx", tyPair tyBool tyBool); ("i", tyBool); ("y", tyPair tyD tyD)] ~> ("o", tyBool) dvis
                (fun x i y => B (pget y i) xor (pget x i));
       [:: ("i", tyBool)] ~> ("leakRRi", _) dvis id;
       [:: ("p", tyTDP)] ~> ("T2Nf", _) dhid id;
       [:: ("T2Nf", tyTDP)] ~> ("N2Rf", _) dhid id;
       [:: ("T2Nf", tyTDP)] ~> ("leakRNf", _) dvis id;
       [:: ("N2Rf", tyTDP)] ~> ("leakRRf", _) dvis id;
       [:: ("y", tyPair tyD tyD)] ~> ("leakRRy", _) dvis id;
       [:: ("z", tyPair tyD tyD)] ~> ("R2Nz", _) dhid id;
       [:: ("R2Nz", tyPair tyD tyD)] ~> ("N2Tz", _) dhid id;
       [:: ("R2Nz", tyPair tyD tyD)] ~> ("leakRNz", _) dvis id;
       [:: ("x", tyPair tyBool tyBool)] ~> ("T2Nx", _) dhid id;
       [:: ("T2Nx", tyPair tyBool tyBool)] ~> ("N2Rx", _) dhid id;
       [:: ("T2Nx", tyPair tyBool tyBool)] ~> ("leakRNx", _) dvis id;
       [:: ("T2Nx", tyPair tyBool tyBool)] ~> ("leakRRx", _) dvis id].

  Lemma OT_real_valid : R_wf _ _ OT_real.
    done.
  Qed.

  Definition OT_ideal :=
    [::
       inr ("m", tyPair tyBool tyBool);
       inr ("i", tyBool);
       [:: ("T2Fm", tyPair tyBool tyBool); ("R2Fi", tyBool)] ~> ("F2Ro", tyBool) dhid (fun m i => pget m i);
       [:: ("F2Ro", tyBool)] ~> ("o", _) dvis id;
       [:: ("m", tyPair tyBool tyBool)] ~> ("T2Fm", _) dhid id;
       [:: ("i", tyBool)] ~> ("R2Fi", _) dhid id; 
       [:: ("i", tyBool)] ~> ("leakIRi", _) dvis id;
       [:: ("F2Ro", tyBool)] ~> ("leakIRo", _) dvis id].

  Definition OT_ideal_clean :=
    [::
       inr ("m", tyPair tyBool tyBool);
       inr ("i", tyBool);
       [:: ("m", tyPair tyBool tyBool); ("i",tyBool)] ~> ("o", tyBool) dvis (fun m i => pget m i);
       [:: ("i", tyBool)] ~> ("leakIRi", _) dvis id;
       [:: ("m", tyPair tyBool tyBool); ("i", tyBool)] ~> ("leakIRo", tyBool) dvis (fun m i => pget m i)].
       
  Lemma OT_ideal_valid : R_wf _ _ OT_ideal.
    done.
  Qed.

  Lemma OT_ideal_1 : OT_ideal <~~> OT_ideal_clean.
  rewrite /OT_ideal.
  simpl.
  autosubst_at leftc "R2Fi" "F2Ro".
  remove_at leftc "R2Fi".
  autosubst_at leftc "F2Ro" "leakIRo".
  autosubst_at leftc "F2Ro" "o".
  remove_at leftc "F2Ro".
  autosubst_at leftc "T2Fm" "leakIRo".
  autosubst_at leftc "T2Fm" "o".
  remove_at leftc "T2Fm".
  rewrite /OT_ideal_clean.
  reflexivity.
  Qed.


  Definition OT_real_clean := [::
      inp ("m", tyPair tyBool tyBool); inp ("i", tyBool);
      [::] ~> ("p", tyTDP) hid munif [finType of TDP];
      [::] ~> ("y", tyPair tyD tyD) hid munif D ** munif D;
      [:: ("p", tyTDP); ("i", tyBool); ("y", tyPair tyD tyD)] ~> ("z", tyPair tyD tyD)
      dhid (fun (f : _) (i : _) (y : _) =>
           pr (fun b => if b == i then sval f (pget y b) else (pget y b)));
      [:: ("z", tyPair tyD tyD); ("p", tyTDP); ("m", tyPair tyBool tyBool)] ~>
      ("x", tyPair tyBool tyBool)
      dhid (fun (z : _) (f : _) (m : _) =>
           pr (fun b => B (dec_inv_f f (pget z b)) xor (pget m b)));
      [:: ("x", tyPair tyBool tyBool); ("i", tyBool); ("y", tyPair tyD tyD)] ~> 
      ("o", tyBool)
      dvis (fun (x : _) (i : _) (y : _) =>
           B (pget y i) xor (pget x i));
      [:: ("i", tyBool)] ~> ("leakRRi", tyBool) vis [eta mret];
      [:: ("p", tyTDP)] ~> ("leakRNf", tyTDP) vis [eta mret];
      [:: ("p", tyTDP)] ~> ("leakRRf", tyTDP) vis [eta mret];
      [:: ("y", tyPair tyD tyD)] ~> ("leakRRy", tyPair tyD tyD) vis [eta mret];
      [:: ("z", tyPair tyD tyD)] ~> ("leakRNz", tyPair tyD tyD) vis [eta mret];
      [:: ("x", tyPair tyBool tyBool)] ~> ("leakRNx", tyPair tyBool tyBool) vis [eta mret];
      [:: ("x", tyPair tyBool tyBool)] ~> ("leakRRx", tyPair tyBool tyBool) vis [eta mret]].

  Definition OT_1 : OT_real <~~> OT_real_clean.
    rewrite /OT_real.
    simpl.
    autosubst_at leftc "T2Nf" "N2Rf".
    autosubst_at leftc "T2Nf" "leakRNf".
    remove_at leftc "T2Nf".
    autosubst_at leftc "N2Rf" "leakRRf".
    autosubst_at leftc "N2Rf" "z".
    remove_at leftc "N2Rf".
    autosubst_at leftc "R2Nz" "N2Tz".
    autosubst_at leftc "R2Nz" "leakRNz".
    remove_at leftc "R2Nz".
    autosubst_at leftc "N2Tz" "x".
    remove_at leftc "N2Tz".
    autosubst_at leftc "T2Nx" "N2Rx".
    autosubst_at leftc "T2Nx" "leakRNx".
    autosubst_at leftc "T2Nx" "leakRRx".
    remove_at leftc "T2Nx".
    autosubst_at leftc "N2Rx" "o".
    remove_at leftc "N2Rx".
    reflexivity.
  Qed.

  Arguments lset_ch /.
  Arguments lset /.

  Definition OT_real2 := Eval simpl in lset_ch OT_real_clean "o" ([:: ("x", tyPair tyBool tyBool); ("z", tyPair tyD tyD); ("p", tyTDP); ("i", tyBool)] ~> ("o", tyBool) dvis (fun x z f i => B (dec_inv_f f (pget z i)) xor (pget x i))).

  Lemma OT_2 : OT_real_clean <~~> OT_real2.
  rewrite /OT_real2 /OT_real_clean /lset_ch /lset //=.
  autosubst_at rightc "z" "o".
  arg_move_at rightc "o" "x" 1.
  r_ext_at rightc "o" (fun (_ : TDP) (a : bool * bool) (a0 : bool) (a1 : D * D) =>
                        ret (B (pget a1 a0) xor pget a a0)); last first.
  intros.
  destruct x1; rewrite //= dec_inv_cancel_f_l //=.
  hid_str_at rightc "p" "o".
  reflexivity.
  Qed.

  Lemma xor_cancel b1 b2 :
    (b1 xor (b1 xor b2)) = b2.
  destruct b1; destruct b2; done.
  Qed.
  
  Definition OT_real3 := Eval simpl in lset_ch OT_real2 "o"
                                 ([:: ("m", tyPair tyBool tyBool); ("i", tyBool)] ~> ("o", tyBool) dvis (fun m i => pget m i)).

  Lemma OT_3 : OT_real2 <~~> OT_real3.
    rewrite /OT_real2 /OT_real3 /lset_ch /lset //=.
    autosubst_at leftc "x" "o".
    r_ext_at leftc "o" (fun (z : D * D) (f : TDP) (m : bool * bool) (i : bool) =>
                          ret (pget m i)).
    intros.
    destruct x2; simpl; rewrite xor_cancel //=.
    hid_weak_at leftc "y" "o".
    hid_str_at leftc "z" "o".
    hid_str_at leftc "y" "o".
    hid_str_at leftc "p" "o".
    reflexivity.
 Qed.

  Definition OT_real4 := Eval simpl in lset_ch OT_real3 "x"
                                ([:: ("i", tyBool); ("y", tyPair tyD tyD); ("p", tyTDP); ("m", tyPair tyBool tyBool)] ~> ("x", tyPair tyBool tyBool) dhid (fun i y f m => pr (fun b => if b == i then B (pget y b) xor (pget m b) else B (dec_inv_f f (pget y b)) xor (pget m b)))).

  Lemma OT_4 : OT_real3 <~~> OT_real4.
    rewrite /OT_real3 /OT_real4 /lset_ch /lset //=.
    autosubst_at leftc "z" "x".
    arg_move_at rightc "x" "p" 0.
    ext_match rightc "x".
    intros.
    rewrite /pr //=.
    destruct x0; simpl.
    rewrite dec_inv_cancel_f_l //=.
    rewrite dec_inv_cancel_f_l //=.
    reflexivity.
  Qed.

  Arguments insert_ch /.

  Definition OT_real5 := Eval simpl in 
    insert_ch (lset_ch OT_real4 "x"
                       ([:: ("c", tyPair tyBool tyBool); ("i", tyBool); ("y", tyPair tyD tyD); ("m", tyPair tyBool tyBool)] ~> ("x", tyPair tyBool tyBool) dhid (fun c i y m => pr (fun b => if b == i then B (pget y b) xor (pget m b) else (pget c b))))) "x" ([:: ("y", tyPair tyD tyD); ("p", tyTDP); ("m", tyPair tyBool tyBool)] ~> ("c", tyPair tyBool tyBool) dhid (fun y f m => pr (fun b => B (dec_inv_f f (pget y b)) xor (pget m b)))). 

  Lemma OT_5 : OT_real4 <~~> OT_real5.
  rewrite /OT_real4 /OT_real5 /insert_ch /lset_ch /lset //=.
  autosubst_at rightc "c" "x".
  arg_move_at rightc "x" "i" 0.
  ext_match leftc "x".
  remove_at rightc "c".

  reflexivity.
 done.
 Qed.

  Definition OT_real6 := Eval simpl in
    insert_ch (lset_ch OT_real5 "y" ([:: ("w", tyPair tyD tyD); ("p", tyTDP)] ~> ("y", tyPair tyD tyD) dhid (fun w p => pr (fun b => sval p (pget w b))))) "y" ([::] ~> ("w", tyPair tyD tyD) hid (munif D ** munif D)).

  Lemma OT_6 : OT_real5 <~~> OT_real6.
  rewrite /OT_real6 /OT_real5 /insert_ch /lset_ch /lset //=.
  r_move_at rightc "w" 0.
  r_move_at rightc "y" 1.
  fold_at rightc.
  hid_weak_at leftc "p" "y".
  ext_match leftc "y".
  align.
  reflexivity.
  intros; msimp.
  rewrite {3}(munif_bij (sval x)).
  rewrite {4}(munif_bij (sval x)).
  msimp.
  apply mbind_eqP => a Ha; apply mbind_eqP => b Hb.
  rewrite /pr //=.
  destruct x as [x Hx].
  simpl.
  move/bij_dec_bij: Hx; done.
  destruct x as [x Hx].
  simpl.
  move/bij_dec_bij: Hx; done.
  Qed.

  Definition OT_real7 := Eval simpl in
    lset_ch OT_real6 "c" ([:: ("w", tyPair tyD tyD); ("m", tyPair tyBool tyBool)] ~> ("c", tyPair tyBool tyBool) dhid (fun w m => pr (fun b => B (pget w b) xor (pget m b)))).

  Lemma OT_7 : OT_real6 <~~> OT_real7.
  rewrite /OT_real6 /OT_real7 /insert_ch /lset_ch /lset //=.
  autosubst_at leftc "y" "c".
  hid_weak_at rightc "p" "c".
  arg_move_at leftc "c" "p" 0.
  ext_match rightc "c".
  intros.
  rewrite /pr //=.
  rewrite !dec_inv_cancel_l //=.
  reflexivity.
  Qed.

  Definition OT_real8 := Eval simpl in
    insert_ch (lset_ch OT_real7 "c" ([:: ("b", tyPair tyBool tyBool); ("m", tyPair tyBool tyBool)] ~> ("c", tyPair tyBool tyBool) dhid (fun bs m => pr (fun b => (pget bs b) xor (pget m b))))) "c" ([:: ("w", tyPair tyD tyD)] ~> ("b", tyPair tyBool tyBool) dhid (fun w => (B w.1, B w.2))).

  Lemma OT_8 : OT_real7 <~~> OT_real8.
  rewrite /OT_real8 /OT_real7 /insert_ch /lset_ch /lset //=.
  autosubst_at rightc "b" "c".
  remove_at rightc "b".
  reflexivity.
  Qed.

  Arguments rename_ch /.

  Definition OT_real9 := Eval simpl in
    rename_ch (rename_ch (rename_ch (rename_ch OT_real8 "x" "otx") "b" "otb") "p" "otp") "w" "otw".

  Lemma OT_9 : OT_real8 <~~> OT_real9.
  rewrite /OT_real8 /OT_real9 /insert_ch /lset_ch /lset //=.
  rename_at rightc "otx" "x".
  rename_at rightc "otb" "b".
  rename_at rightc "otp" "p".
  rename_at rightc "otw" "w".
  reflexivity.
  Qed.

  Fixpoint remove_chs (rs : rl) (n : list string) :=
    match n with
      | n :: ns => 
           let rs' := remove_chs rs ns in
            match ofind rs' (fun x => chan_of x == n) with
            | Some i => remove rs' i
            | None => rs'
                        end
      | nil => rs
                 end.

  Arguments remove_chs /.


  Definition OT_hc_sim : rl := Eval simpl in
    ([::
       inp ("leakf_pair", tyTDP);
       inp ("leakb_pair", tyPair tyBool tyBool);
       inp ("leakx_pair", tyPair tyD tyD);
       [:: ("leakf_pair", tyTDP)] ~> ("otp", tyTDP) dhid id;
       [:: ("leakb_pair", tyPair tyBool tyBool)] ~> ("otb", _) dhid id;
       [:: ("leakx_pair", tyPair tyD tyD)] ~> ("y", _) dhid id] ++ remove_chs OT_real9 [:: "y"; "otw"; "otb"; "otp"])%SEQ.

  Ltac find_diff_chan :=
    let rs1 := get_rs_at leftc in
    let rs2 := get_rs_at rightc in
    let c1 := eval compute in (ofind_val (RSeqs _ _ rs1) (fun x => x \notin (RSeqs _ _ rs2))) in
    let c2 := eval compute in (ofind_val (RSeqs _ _ rs2) (fun x => x \notin (RSeqs _ _ rs1))) in
    idtac c1; idtac c2.

  Definition OT_10_middle :=
    [:: [:: ("p", tyTDP)] ~> ("otp", tyTDP) hid [eta mret]
     ; [:: ("b", tyPair tyBool tyBool)] ~> ("otb", tyPair tyBool tyBool) hid [eta mret]
     ; [:: ("x", tyPair tyD tyD)] ~> ("y", tyPair tyD tyD) hid [eta mret]
     ; inp ("m", tyPair tyBool tyBool)
     ; inp ("i", tyBool)
     ;
      [:: ("p", tyTDP); ("i", tyBool); ("y", tyPair tyD tyD)] ~> ("z", tyPair tyD tyD) hid 
     (fun (x : _) (x0 : _) (x1 : _) =>
      ret pr (fun b : bool => if b == x0 then sval x (pget x1 b) else pget x1 b))
     ;
      [:: ("otb", tyPair tyBool tyBool); ("m", tyPair tyBool tyBool)] ~> 
     ("c", tyPair tyBool tyBool) hid (fun x x0 : _ =>
                                      ret pr (fun b : bool => pget x b xor pget x0 b))
     ;
      [:: ("c", tyPair tyBool tyBool); ("i", tyBool); ("y", tyPair tyD tyD);
          ("m", tyPair tyBool tyBool)] ~> ("otx", tyPair tyBool tyBool) hid 
     (fun (x : _) (x0 : _) (x1 : _) (x2 : _) =>
      ret pr (fun b : bool => if b == x0 then B (pget x1 b) xor pget x2 b else pget x b))
     ;
      [:: ("m", tyPair tyBool tyBool); ("i", tyBool)] ~>("o", tyBool) vis 
     (fun (x : _) (x0 : _) => ret pget x x0)
     ; [:: ("i", tyBool)] ~>("leakRRi", tyBool) vis [eta mret]
     ; [:: ("p", tyTDP)] ~>("leakRNf", tyTDP) vis [eta mret]
     ; [:: ("p", tyTDP)] ~>("leakRRf", tyTDP) vis [eta mret]
     ; [:: ("y", tyPair tyD tyD)] ~>("leakRRy", tyPair tyD tyD) vis [eta mret]
     ; [:: ("z", tyPair tyD tyD)] ~>("leakRNz", tyPair tyD tyD) vis [eta mret]
     ; [:: ("otx", tyPair tyBool tyBool)] ~>("leakRNx", tyPair tyBool tyBool) vis [eta mret]
     ; [:: ("otx", tyPair tyBool tyBool)] ~>("leakRRx", tyPair tyBool tyBool) vis [eta mret]
     ; [::] ~> ("p", tyTDP) hid munif [finType of TDP]
     ; [::] ~> ("w", tyPair tyD tyD) hid munif D ** munif D
     ;
      [:: ("p", tyTDP); ("w", tyPair tyD tyD)] ~> ("x", tyPair tyD tyD) hid 
     (fun (a : _) (a0 : _) => ret (sval a a0.1, sval a a0.2))
     ;
      [:: ("w", tyPair tyD tyD)] ~> ("b", tyPair tyBool tyBool) hid (fun a : _ =>
                                                                     ret (B a.1, B a.2))
     ].

  Lemma OT_10_1 : OT_10_middle <~~> (OT_hc_sim ||| hcBitPair_real).
    rewrite /OT_real9 /rlist_comp_hide; vm_compute RChans; simpl.
    autosubst_at rightc "leakf_pair" "otp".
    remove_at rightc "leakf_pair".
    autosubst_at rightc "leakx_pair" "y".
    remove_at rightc "leakx_pair".
    autosubst_at rightc "leakb_pair" "otb".
    remove_at rightc "leakb_pair".
    autosubst_at rightc "otp" "z".
    autosubst_at rightc "otp" "leakRNf".
    autosubst_at rightc "otp" "leakRRf".
    reflexivity.
  Qed.

  Lemma OT_10_2 : OT_real9 <~~> OT_10_middle.
    remove_at rightc "otp".
    rename_at leftc "otp" "p".
    rename_at leftc "otw" "w".
    autosubst_at rightc "x" "y".
    remove_at rightc "x".
    autosubst_at rightc "b" "otb".
    remove_at rightc "b".
    align.
    arg_move_at leftc "y" "p" 0.
    reflexivity.
  Qed.

  Lemma OT_10 : OT_real9 <~~> (OT_hc_sim ||| hcBitPair_real).
    rewrite -OT_10_1; apply OT_10_2.
  Qed.

  Definition OT_Sim : rl :=
    [::
       inp ("leakIRi", tyBool);
       inp ("leakIRo", tyBool);
       [::] ~> ("p", tyTDP) hid (munif [finType of TDP]);
       [::] ~> ("y", tyPair tyD tyD) hid (munif D ** munif D);
       [::] ~> ("c", tyPair tyBool tyBool) hid (munif [finType of bool] ** munif [finType of bool]);
       [:: ("leakIRi", tyBool); ("p", tyTDP); ("y", tyPair tyD tyD)] ~> ("z", tyPair tyD tyD) dhid (fun i f y => pr (fun b => if b == i then sval f (pget y b) else (pget y b)));
       [:: ("c", tyPair tyBool tyBool); ("y", tyPair tyD tyD); ("leakIRo", tyBool); ("leakIRi", tyBool)] ~> ("x", tyPair tyBool tyBool) dhid (fun c y o i => pr (fun b => if b == i then B (pget y b) xor o else (pget c b)));
       [:: ("leakIRi", tyBool)] ~> ("leakRRi", _) dvis id;
       [:: ("p", tyTDP)] ~> ("leakRNf", _) dvis id;
       [:: ("p", tyTDP)] ~> ("leakRRf", _) dvis id;
       [:: ("y", tyPair tyD tyD)] ~> ("leakRRy", _) dvis id;
       [:: ("z", tyPair tyD tyD)] ~> ("leakRNz", _) dvis id;
       [:: ("x", tyPair tyBool tyBool)] ~> ("leakRNx", _) dvis id;
       [:: ("x", tyPair tyBool tyBool)] ~> ("leakRRx", _) dvis id].


  Lemma OT_11 : (OT_hc_sim ||| hcBitPair_ideal) ~~> (OT_Sim ||| OT_ideal_clean).
    rewrite /rlist_comp_hide; vm_compute RChans; simpl.
    autosubst_at leftc "leakf_pair" "otp".
    remove_at leftc "leakf_pair".
    autosubst_at leftc "leakx_pair" "y".
    remove_at leftc "leakx_pair".
    autosubst_at leftc "leakb_pair" "otb".
    remove_at leftc "leakb_pair".
    autosubst_at leftc "otp" "z".
    autosubst_at leftc "otp" "leakRNf".
    autosubst_at leftc "otp" "leakRRf".
    remove_at leftc "otp".
    autosubst_at leftc "otb" "c".
    remove_at leftc "otb".
    autosubst_at leftc "y" "leakRRy".
    autosubst_at leftc "y" "z".
    autosubst_at leftc "y" "otx".
    remove_at leftc "y".
    rename_at leftc "x" "y".
    r_move_at leftc "b" 0.
    r_move_at leftc "c" 1.
    fold_at leftc.
    r_ext_at leftc "c" (fun (_ : bool * bool) => munif [finType of bool] ** munif [finType of bool]).
    intro.
    msimp.
    rewrite /pr //=.
    rewrite {1}(munif_bij (fun x0 => x0 xor x.1)).
    msimp.
    rewrite {2}(munif_bij (fun x0 => x0 xor x.2)).
    msimp.
    apply mbind_eqP => a Ha.
    apply mbind_eqP => b Hb.
    destruct a; destruct x.1; destruct x.2; destruct b; done.
    exists (fun (a : bool) => a xor x.2).
    move => a; destruct a; destruct x.2; done.
    move => a; destruct a; destruct x.2; done.
    exists (fun (a : bool) => a xor x.1).
    move => a; destruct a; destruct x.1; done.
    move => a; destruct a; destruct x.1; done.
    inp_str_at leftc "c" "m" (tyPair tyBool tyBool).
    autosubst_at rightc "leakIRi" "z".
    autosubst_at rightc "leakIRi" "leakRRi".
    autosubst_at rightc "leakIRi" "x".
    remove_at rightc "leakIRi".
    rename_at leftc "otx" "x".
    autosubst_at rightc "leakIRo" "x".
    remove_at rightc "leakIRo".
    align.
    arg_move_at leftc "z" "i" 0.
    arg_move_at leftc "z" "y" 1.
    arg_move_at leftc "x" "m" 0.
    arg_move_at leftc "x" "i" 1.
    arg_move_at leftc "x" "c" 2.
    arg_move_at leftc "z" "p" 1.
    ext_match leftc "z".
    ext_match leftc "x".
    reflexivity.
    intros.
    destruct x0; rewrite /pr //=.
    intros.
    destruct x; rewrite /pr //=.
 Qed.

  Theorem OT_secure : hcBit_real <~~> hcBit_ideal -> OT_real ~~> (OT_Sim ||| OT_ideal).
    intros.
    etransitivity.
    apply rewr_bi_r; apply OT_1.
    etransitivity.
    apply rewr_bi_r; apply OT_2.
    etransitivity.
    apply rewr_bi_r; apply OT_3.
    etransitivity.
    apply rewr_bi_r; apply OT_4.
    etransitivity.
    apply rewr_bi_r; apply OT_5.
    etransitivity.
    apply rewr_bi_r; apply OT_6.
    etransitivity.
    apply rewr_bi_r; apply OT_7.
    etransitivity.
    apply rewr_bi_r; apply OT_8.
    etransitivity.
    apply rewr_bi_r; apply OT_9.
    etransitivity.
    apply rewr_bi_r; apply OT_10.
    etransitivity.
    apply rewr_bi_r.
    apply: rewr_congr.
    done.
    instantiate (1 := hcBitPair_ideal).
    done.
    apply hcBitPair_equiv.
    done.
    etransitivity.
    apply OT_11.
    apply rewr_bi_r.
    apply: rewr_congr.
    done.
    done.
    symmetry.
    apply OT_ideal_1.
  Qed.
End OT.
