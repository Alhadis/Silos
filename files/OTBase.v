
From mathcomp Require Import ssreflect ssrfun ssrbool ssrint eqtype ssrnat seq choice fintype rat finfun.
From mathcomp Require Import bigop ssralg div ssrnum ssrint.
From mathcomp Require Import fingroup finset. 
From mathcomp Require Import cyclic zmodp.

Require Import Posrat Premeas Meas Aux Logic String SSRString SeqOps RLems Tacs DerivedTacs Aux.

Section BijectiveDec.
  Definition bij_dec {S T : finType} (f : S -> T) :=
    [forall t : T, [exists s : S, f s == t]] &&
    [forall s1 : S, [forall s2 : S, (f s1 == f s2) ==> (s1 == s2)]].

  Definition dec_inv_f {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : {ffun T -> S}.
    destruct f as [f Hf].
    move/andP: Hf.
    elim.
    move => h1 h2.
    move/forallP: h1 => h1.
    apply ([ffun x => xchoose (existsP (h1 x))]).
  Defined.

  Lemma dec_inv_cancel_f_l {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : cancel (val f) (dec_inv_f f).
    move => x.
    destruct f as [f Hf].
    rewrite /dec_inv_f.
    rewrite /and_rect.
    destruct (elimTF andP Hf).
    simpl.
    rewrite ffunE.
    move: (xchooseP (existsP (elimTF forallP i (f x)))).
    intro.
    move/forallP: i0.
    move/(_ x).
    move/forallP.
    move/(_ (xchoose (existsP (elimTF forallP i (f x))))).
    move/implyP => h.
    rewrite eq_sym in xchooseP.
    symmetry; apply/eqP; apply h; done.
  Qed.

  Lemma dec_inv_cancel_f_r {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : cancel (dec_inv_f f) (val f).
    move => x.
    destruct f as [f Hf].
    simpl.
    rewrite /and_rect.
    destruct (elimTF andP Hf).
    rewrite ffunE.
    move: (xchooseP (existsP (elimTF forallP i x))).
    move/eqP.
    done.
  Qed.

  Definition dec_inv_bij_dec {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : bij_dec (dec_inv_f f).
    apply/andP; split.
    apply/forallP => x.
    apply/existsP; exists ((val f) x).
    rewrite dec_inv_cancel_f_l; done.
    apply/forallP => x; apply/forallP => y; apply/implyP => h.
    move: (dec_inv_cancel_f_r f x) => h1.
    move: (dec_inv_cancel_f_r f y) => h2.
    rewrite -h1 -h2.
    rewrite (eqP h) //=.
  Qed.

  Definition dec_inv {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : {f : {ffun T -> S} | bij_dec f}.
    exists (dec_inv_f f).
    apply dec_inv_bij_dec.
  Defined.
  

  Lemma bij_dec_bij {S T : finType} (f : S -> T) : (bij_dec f) -> (bijective f).
    move/andP; elim => h1 h2.
    move/forallP: h1 => h1.
    move/forallP: h2 => h2.
    exists (fun x => xchoose (existsP (h1 x))).
    move => x.
    move: (xchooseP (existsP (h1 (f x)))) => h.
    apply/eqP.
    move/forallP: (h2 (xchoose (existsP (h1 (f x))))).
    move/(_ x).
    move/implyP.
    move => h3.
    apply (h3 h).
    move => x.
    move: (xchooseP (existsP (h1 x))); move/eqP => ->; done.
  Qed.

  Lemma dec_inv_cancel_r {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : cancel (val (dec_inv f)) (val f).
    move => x.
    simpl.
    rewrite dec_inv_cancel_f_r //=.
  Qed.

  Lemma dec_inv_cancel_l {S T : finType} (f : {f : {ffun S -> T} | bij_dec f}) : cancel (val f) (val (dec_inv f)).
    move => x.
    simpl.
    rewrite dec_inv_cancel_f_l //=.
  Qed.

End BijectiveDec.

Module OblivTransfer.
  Parameter (D: finType).
  Definition TDP :=
    { x: {ffun D -> D} | bij_dec x}.
  Definition inv_tdp : TDP -> TDP := fun f => dec_inv f. (* this function is inefficient *)
  Parameter (B : D -> bool).

  Inductive ty :=
  | tyD
  | tyTDP
  | tyBool
  | tyPair : ty -> ty -> ty.

  Fixpoint ty_enc (t : ty) : GenTree.tree (option bool) :=
    match t with
    | tyD => GenTree.Leaf None 
    | tyTDP => GenTree.Leaf (Some false)
    | tyBool => GenTree.Leaf (Some true)
    | tyPair t1 t2 => GenTree.Node 0 [:: ty_enc t1; ty_enc t2]
    end.

  Fixpoint ty_dec (t : GenTree.tree (option bool)) : ty :=
    match t with
      | GenTree.Leaf (Some false) => tyTDP
      | GenTree.Leaf (Some true) => tyBool
      | GenTree.Leaf None => tyD                                    
      | GenTree.Node _ (x :: y :: _) => tyPair (ty_dec x) (ty_dec y)
      | _ => tyD
               end.
                          
  Lemma ty_can : cancel ty_enc ty_dec.
    move => x.
    induction x; rewrite //=.
    rewrite IHx1 IHx2 //=.
  Qed.
  Canonical ty_eq := EqType ty (CanEqMixin ty_can).
  Canonical ty_ch := ChoiceType ty (CanChoiceMixin ty_can).

  Fixpoint denomTy (t : ty) : finType :=
    match t with
      | tyD => D
      | tyTDP => [finType of TDP]
      | tyBool => [finType of bool]
      | tyPair t1 t2 => [finType of (denomTy t1) * (denomTy t2)]
                          end.

  Local Instance ty_type : type [eqType of ty].
   econstructor.
   instantiate (1 := denomTy).
   instantiate (1 := tyPair).
   done.
 Defined.

  Definition rl := rlist [choiceType of string] [choiceType of ty].

  Open Scope string_scope.

  Definition hcBit_real : rl :=
    [::
       [::] ~> ("p", tyTDP) hid (munif [finType of TDP]);
       [::] ~> ("w", tyD) hid (munif D);
       [:: ("p", tyTDP); ("w", tyD)] ~> ("x", tyD) dhid (fun f x => sval f x);
       [:: ("w", tyD)] ~> ("b", tyBool) dhid (fun x => B x);
       [:: ("p", tyTDP)] ~> ("leakf", _) dvis id;
       [:: ("x", tyD)] ~> ("leakx", _) dvis id;
       [:: ("b", tyBool)] ~> ("leakb", _) dvis id].

  Definition hcBit_ideal : rl :=
    [::
       [::] ~> ("p", tyTDP) hid (munif [finType of TDP]);
       [::] ~> ("x", tyD) hid (munif D);
       [::] ~> ("b", tyBool) hid (munif [finType of bool]);
       [:: ("p", tyTDP)] ~> ("leakf", _) dvis id;
       [:: ("x", tyD)] ~> ("leakx", _) dvis id;
       [:: ("b", tyBool)] ~> ("leakb", _) dvis id].

  Definition hcBitPair_real : rl :=
    [::
       [::] ~> ("p", tyTDP) hid (munif [finType of TDP]);
       [::] ~> ("w", tyPair tyD tyD) hid (munif D) ** (munif D);
       [:: ("p", tyTDP); ("w", tyPair tyD tyD)] ~> ("x", tyPair tyD tyD) dhid (fun f x => (sval f x.1, sval f x.2));
       [:: ("w", tyPair tyD tyD)] ~> ("b", tyPair tyBool tyBool) dhid (fun x => (B x.1, B x.2));
       [:: ("p", tyTDP)] ~> ("leakf_pair", _) dvis id;
       [:: ("x", tyPair tyD tyD)] ~> ("leakx_pair", _) dvis id;
       [:: ("b", tyPair tyBool tyBool)] ~> ("leakb_pair", _) dvis id].

  Definition hcBitPair_ideal : rl :=
    [::
       [::] ~> ("p", tyTDP) hid (munif [finType of TDP]);
       [::] ~> ("x", tyPair tyD tyD) hid (munif D) ** (munif D);
       [::] ~> ("b", tyPair tyBool tyBool) hid (munif [finType of bool]) ** (munif [finType of bool]);
       [:: ("p", tyTDP)] ~> ("leakf_pair", _) dvis id;
       [:: ("x", tyPair tyD tyD)] ~> ("leakx_pair", _) dvis id;
       [:: ("b", tyPair tyBool tyBool)] ~> ("leakb_pair", _) dvis id].

  Definition sim1 : rl :=
    [::
       inp ("leakf", tyTDP);
       inp ("leakx", tyD);
       inp ("leakb", tyBool);
       [::] ~> ("w2", tyD) hid (munif D);
       [:: ("leakf", tyTDP); ("w2", tyD)] ~> ("x2", tyD) dhid (fun f x => sval f x);
       [:: ("w2", tyD)] ~> ("b2", tyBool) dhid (fun x => B x);
       [:: ("leakf", tyTDP)] ~> ("leakf_pair", _) dvis id;
       [:: ("leakx", tyD); ("x2", tyD)] ~> ("leakx_pair", tyPair tyD tyD) dvis (fun x y => (x,y));
       [:: ("leakb", tyBool); ("b2", tyBool)] ~> ("leakb_pair", tyPair tyBool tyBool) dvis (fun x y => (x,y))].

  Definition step1 : rl :=
    [:: [::] ~> ("w", tyPair tyD tyD) hid munif D ** munif D
     ; [::] ~> ("p", tyTDP) hid munif [finType of TDP]
     ;
      [:: ("w", tyPair tyD tyD); ("p", tyTDP)] ~> ("x1", tyD) hid (fun (x : _) (x0 : _) =>
                                                                   ret sval x0 x.1)
     ; [:: ("w", tyPair tyD tyD)] ~> ("b", tyBool) hid (fun x : _ => ret B x.1)
     ;
      [:: ("w", tyPair tyD tyD); ("p", tyTDP)] ~> ("x2", tyD) hid (fun (x : _) (x0 : _) =>
                                                                   ret sval x0 x.2)
     ; [:: ("w", tyPair tyD tyD)] ~> ("b2", tyBool) hid (fun x : _ => ret B x.2)
     ; [:: ("p", tyTDP)] ~>("leakf_pair", tyTDP) vis [eta mret]
     ;
      [:: ("x1", tyD); ("x2", tyD)] ~>("leakx_pair", tyPair tyD tyD) vis 
     (fun x x0 : _ => ret (x, x0))
     ;
      [:: ("b", tyBool); ("b2", tyBool)] ~>("leakb_pair", tyPair tyBool tyBool) vis 
     (fun x x0 : _ => ret (x, x0))
     ].

  Lemma hcBit_11 :
    (sim1 ||| hcBit_real) <~~> step1.
    rewrite /hcBitPair_real /rlist_comp_hide; vm_compute RChans; simpl.
    autosubst_at leftc "leakf" "x2".
    autosubst_at leftc "leakf" "leakf_pair".
    remove_at leftc "leakf".
    autosubst_at leftc "leakx" "leakx_pair".
    remove_at leftc "leakx".
    autosubst_at leftc "leakb" "leakb_pair".
    remove_at leftc "leakb".
    rename_at leftc "w" "w1".
    pair_at leftc "w1" "w2" "w".
    autosubst_at leftc "w1" "b".
    autosubst_at leftc "w1" "x".
    remove_at leftc "w1".
    autosubst_at leftc "w2" "b2".
    autosubst_at leftc "w2" "x2".
    remove_at leftc "w2".
    rename_at leftc "x" "x1".
    rewrite /step1 //=.
    align.
    reflexivity.
  Qed.


  Lemma hcBit_12 :
    step1 <~~> hcBitPair_real.
    rewrite /hcBitPair_real /step1 /rlist_comp_hide; vm_compute RChans; simpl.
    pair_at leftc "x1" "x2" "x".
    autosubst_at leftc "x1" "leakx_pair".
    autosubst_at leftc "x2" "leakx_pair".
    rename_at leftc "b" "b1".
    pair_at leftc "b1" "b2" "b".
    autosubst_at leftc "b1" "leakb_pair".
    remove_at leftc "b1".
    autosubst_at leftc "b2" "leakb_pair".
    remove_at leftc "b2".
    remove_at leftc "x1".
    remove_at leftc "x2".
    align.
    arg_move_at leftc "x" "p" 0.
    hid_str_at leftc "w" "leakx_pair".
    hid_str_at leftc "p" "leakx_pair".
    hid_str_at leftc "w" "leakb_pair".
    r_ext_at leftc "x" (fun (a : TDP) (a0 : D * D) => ret (sval a a0.1, sval a a0.2)).
      intros; msimp; done.
    r_ext_at leftc "leakx_pair" (fun (x : D *D )=> ret x).
      intros; destruct x; done.
    r_ext_at leftc "leakb_pair" (fun (x : bool  * bool )=> ret x).
      intros; destruct x; done.
    r_ext_at leftc "b" (fun t : D * D => ret (B t.1, B t.2)).
      intros; msimp; done.
    reflexivity.
Qed.

  Lemma hcBit_1 :
    hcBitPair_real <~~> (sim1 ||| hcBit_real).
  symmetry.
  etransitivity.
  apply hcBit_11.
  apply hcBit_12.
  Qed.
  

  Definition sim2 : rl :=
    [::
       inp ("leakf", tyTDP);
       inp ("leakx", tyD);
       inp ("leakb", tyBool);
       [::] ~> ("x2", tyD) hid (munif D);
       [::] ~> ("b2", tyBool) hid (munif [finType of bool]);
       [:: ("leakf", tyTDP)] ~> ("leakf_pair", _) dvis id;
       [:: ("leakx", tyD); ("x2", tyD)] ~> ("leakx_pair", tyPair tyD tyD) dvis (fun x y => (y,x));
       [:: ("leakb", tyBool); ("b2", tyBool)] ~> ("leakb_pair", tyPair tyBool tyBool) dvis (fun x y => (y,x))].

  Ltac swap_name_at a n1 n2 tmp :=
    rename_at a n1 tmp;
    rename_at a n2 n1;
    rename_at a tmp n2.
    

  Lemma hcBit_2 :
    (sim1 ||| hcBit_ideal) <~~> (sim2 ||| hcBit_real).
    rewrite /rlist_comp_hide; vm_compute RChans; simpl.
    swap_name_at rightc "x" "x2" "xx".
    rename_at leftc "w2" "w".
    swap_name_at rightc "b" "b2" "bx".
    autosubst_at leftc "leakf" "x2".
    autosubst_at leftc "leakf" "leakf_pair".
    remove_at leftc "leakf".
    autosubst_at rightc "leakf" "leakf_pair".
    remove_at rightc "leakf".
    autosubst_at leftc "leakb" "leakb_pair".
    remove_at leftc "leakb".
    autosubst_at rightc "leakb" "leakb_pair".
    remove_at rightc "leakb".
    autosubst_at leftc "leakx" "leakx_pair".
    remove_at leftc "leakx".
    autosubst_at rightc "leakx" "leakx_pair".
    remove_at rightc "leakx".
    align.
    arg_move_at rightc "leakx_pair" "x" 0.
    arg_move_at rightc "leakb_pair" "b" 0.
    reflexivity.
  Qed.

  Lemma hcBit_3 :
    (sim2 ||| hcBit_ideal) <~~> (hcBitPair_ideal).
    rewrite /rlist_comp_hide; vm_compute RChans; simpl.
    rewrite /hcBitPair_ideal.
    autosubst_at leftc "leakf" "leakf_pair".
    remove_at leftc "leakf".
    autosubst_at leftc "leakx" "leakx_pair".
    remove_at leftc "leakx".
    autosubst_at leftc "leakb" "leakb_pair".
    remove_at leftc "leakb".
    rename_at leftc "x" "x1".
    pair_at leftc "x1" "x2" "x".

    autosubst_at leftc "x2" "leakx_pair".
    remove_at leftc "x2".
    autosubst_at leftc "x1" "leakx_pair".
    remove_at leftc "x1".
    r_move_at leftc "leakx_pair" 1.
    fold_at leftc.
    r_ext_at leftc "leakx_pair" (munif D ** munif D).
    msimp.
    rewrite mbind_swap //=.

    r_move_at rightc "x" 0.
    r_move_at rightc "leakx_pair" 1.
    fold_at rightc.
    rewrite bind_ret.
    rename_at leftc "b" "b1".
    pair_at leftc "b1" "b2" "b".
    autosubst_at leftc "b1" "leakb_pair".
    remove_at leftc "b1".
    autosubst_at leftc "b2" "leakb_pair".
    remove_at leftc "b2".
    r_move_at leftc "leakb_pair" 1.
    fold_at leftc.
    r_ext_at leftc "leakb_pair" (munif [finType of bool] ** munif [finType of bool]).
        msimp.
        rewrite mbind_swap //=.
    r_move_at rightc "b" 0.
    r_move_at rightc "leakb_pair" 1.
    fold_at rightc.
    rewrite bind_ret.
    align.
    reflexivity.
 Qed.
    
  Lemma hcBitPair_equiv :
    hcBit_real <~~> hcBit_ideal -> hcBitPair_real <~~> hcBitPair_ideal.
    intros.
    etransitivity.
    rewrite hcBit_1.
    apply: rewr_congr.
    done.
    instantiate (1 := hcBit_ideal).
    done.
    done.
    etransitivity.
    apply hcBit_2.
    etransitivity. 
    apply: rewr_congr.
    done.
    instantiate (1 := hcBit_ideal).
    done.
    done.
    apply hcBit_3.
  Qed.
End OblivTransfer.
