Add LoadPath "proofs".

Require Import Coq.Init.Nat.
Require Import Coq.Bool.Bool.
Require Import ZArith.
Require Import Qcanon.
Require Import List.
Require Import Util_Z.
Require Import Util_list.
Require Import Programs.
Require Import Coq.Sorting.Permutation.
Require Import Coq.Logic.FunctionalExtensionality.

Set Implicit Arguments.

(** # <font size="5"><b> Locations </b></font> # *)

Definition olocation A := (A * Z * A * option Z * bool)%type.

Definition location A := (olocation A * (Z * list (Z * Z)) * (Z * list (Z * Z)) * list (olocation A))%type.

Definition olocation_eq_dec A (dec: forall (x y:A), {x = y} + {x <> y}) (l1 l2: olocation A) : {l1 = l2} + {l1 <> l2}.
Proof.
  repeat decide equality.
Qed.

Definition location_eq_dec A (dec: forall (x y:A), {x = y} + {x <> y}) (l1 l2: location A) : {l1 = l2} + {l1 <> l2}.
Proof.
  repeat decide equality.
Qed.

Definition Aofo A (l: olocation A) : A :=
  fst (fst (fst (fst l))).

Definition Rofo A (l: olocation A) : Z :=
  snd (fst (fst (fst l))).

Definition Lofo A (l: olocation A) : A :=
  snd (fst (fst l)).

Definition Xofo A (l: olocation A) : option Z :=
  snd (fst l).

Definition Pofo A (l: olocation A) : bool :=
  snd l.

Definition Oof A (l: location A) : olocation A :=
  fst (fst (fst l)).

Definition Aof A (l: location A) : A :=
  Aofo (Oof l).

Definition Rof A (l: location A) : Z :=
  Rofo (Oof l).

Definition Lof A (l: location A) : A :=
  Lofo (Oof l).

Definition Xof A (l: location A) : option Z :=
  Xofo (Oof l).

Definition Pof A (l: location A) : bool :=
  Pofo (Oof l).

Definition Iof A (l: location A) : (Z * list (Z * Z)) :=
  snd (fst (fst l)).

Definition Mof A (l: location A) : (Z * list (Z * Z)) :=
  snd (fst l).

Definition M'of A (l: location A) : list (olocation A) :=
  snd l.

Definition evalol (l: olocation exp) : olocation Z :=
  ([[Aofo l]], Rofo l, [[Lofo l]], Xofo l, Pofo l).

Definition evall (l: location exp) : location Z :=
  (evalol (Oof l), Iof l, Mof l, map evalol (M'of l)).

(** # <font size="5"><b> Assertions </b></font> # *)

Definition bag := Z -> nat.

Definition empb : (Z -> nat) :=
  fun _ => O.

Inductive assn :=
  | Aprop (p: Prop)
  | Abool (b: bool)
  | Aconj (P: assn) (Q: assn)
  | Adisj (P: assn) (Q: assn)
  | Astar (P: assn) (Q: assn)
  | Asepimp (P: assn) (Q: assn)
  | Apointsto (fr:Qc) (a: location exp) (e: exp)
  | Aulock (l: location exp) (Wt Ot: bag)
  | Alock (l: location exp)
  | Alocked (l: location exp) (Wt Ot: bag)
  | Acond (v: location exp)
  | Aucond (v: location exp)
  | Aicond (v: location exp)
  | Aobs (obs: (list (olocation exp)))
  | Atic (e: exp)
  | Actr (e: exp) (n: nat)
  | Aex A (pp: A -> assn)
  | Afa A (pp: A -> assn).


Definition subsol (l:olocation exp) (se: exp -> exp): olocation exp :=
  match l with
    | (A,R,L,X,P) => (se A,R,se L,X,P)
  end.

Definition subsl (l:location exp) (se: exp -> exp): location exp :=
  match l with
    | (ol,i,M,M') => (subsol ol se,i,M, map (fun y => subsol y se) M')
  end.

Fixpoint subsa (a:assn) (se: exp -> exp): assn :=
  match a with 
    | Aprop p => Aprop p
    | Abool b => Abool b
    | Aconj P Q => Aconj (subsa P se) (subsa Q se)
    | Adisj P Q => Adisj (subsa P se) (subsa Q se)
    | Astar P Q => Astar (subsa P se) (subsa Q se)
    | Asepimp P Q => Asepimp (subsa P se) (subsa Q se)
    | Apointsto f a v => Apointsto f (subsl a se) (se v)
    | Aulock l Wt Ot => Aulock (subsl l se) Wt Ot
    | Alock l => Alock (subsl l se)
    | Alocked l Wt Ot => Alocked (subsl l se) Wt Ot
    | Acond v => Acond (subsl v se)
    | Aucond v => Aucond (subsl v se)
    | Aicond v => Aicond (subsl v se)
    | Aobs O1 => Aobs (map (fun y => subsol y se) O1)
    | Atic v => Atic (se v)
    | Actr v n => Actr (se v) n
    | Aex pp => Aex (fun y => subsa (pp y) se)
    | Afa pp => Afa (fun y => subsa (pp y) se)
  end.

Fixpoint subsas (xz: list (Z * Z)) (a:assn) : assn :=
  match xz with
    | nil => a
    | xz::xzs => subsas xzs (subsa a (subse (fst xz) (snd xz)))
  end.


(** # <font size="5"><b> Permission Heaps </b></font> # *)

Inductive knowledge :=
  | Cell (f:Qc) (z:Z)
  | Ulock (Wt Ot: bag)
  | Lock
  | Locked (Wt Ot: bag)
  | Cond
  | Ucond
  | Icond.

Definition pheap := location Z -> option knowledge.

Local Open Scope Qc.

Definition phplusdef (p1 p2 : pheap) :=
  forall x,
    match p1 x with
      | None => True
      | Some (Cell f1 z1) => match p2 x with
                               | None => True
                               | Some (Cell f2 z2) => z1 = z2
                               | _ => False
                             end
      | Some (Ulock _ _) => match p2 x with
                                | None => True
                                | _ => False
                              end
      | Some (Lock) => match p2 x with
                         | None => True
                         | Some Lock => True
                         | Some (Locked _ _) => True
                         | _ => False
                       end
      | Some (Locked _ _) => match p2 x with
                                 | None => True
                                 | Some Lock => True
                                 | _ => False
                               end
      | Some Cond => match p2 x with
                       | None => True
                       | Some Cond => True
                       | _ => False
                     end
      | Some Ucond => match p2 x with
                       | None => True
                       | _ => False
                     end
      | Some Icond => match p2 x with
                       | None => True
                       | _ => False
                     end
    end.

Definition phplus (p1 p2: pheap) : pheap :=
  fun x =>
     match p1 x with
       | None => p2 x
       | Some (Cell f1 z1) => match p2 x with
                                | Some (Cell f2 z2) => Some (Cell (f1+f2) z1)
                                | _ => p1 x
                              end
       | Some Lock => match p2 x with
                        | Some (Locked _ _) => p2 x
                        | _ => p1 x
                      end
       | _ => p1 x
     end.

Definition boundph (p: pheap) :=
  forall x f z, p x = Some (Cell f z) -> 0 < f /\ f <= 1.

Definition emp A B : (A -> option B) :=
  fun _ => None.

Definition phtoh (p: pheap) (h: heap) := 
  (forall l,
    match p l with
      | None => True
      | Some (Cell _ z) => h (Aof l) = Some z
      | Some (Ulock _ _) => h (Aof l) = Some 1%Z
      | Some Lock => h (Aof l) = Some 1%Z
      | Some (Locked _ _) => h (Aof l) = Some 0%Z
      | Some Cond => h (Aof l) <> None
      | Some Ucond => h (Aof l) <> None
      | Some Icond => h (Aof l) <> None
    end) /\
 forall z (NONE: forall l (EQ:Aof l = z), p l = None), h z = None.

Definition injph (p: pheap) :=  
  forall x1 x2 (px1: p x1 <> None) (px2: p x2 <> None),
    inj (fun x => Aof x) x1 x2 .

Lemma inj_mon:
  forall p1 p2 (INJ: injph (phplus p1 p2)),
    injph p1.
Proof.
  unfold injph; unfold inj; unfold phplus.
  intros; specialize INJ with x1 x2; apply INJ.
  repeat dstr_. repeat dstr_. assumption.
Qed.

Lemma injo:
  forall x1 x2
         (INJ: inj (fun x : location Z => Aof x) x1 x2),
    inj (fun x : olocation Z => Aofo x) (Oof x1) (Oof x2).
Proof.
  unfold inj.
  intros.
  apply INJ in H.
  rewrite H.
  reflexivity.
Qed.

(** # <font size="5"><b> Ghost Heaps </b></font> # *)

Definition gheap := Z -> option (option nat * nat).

Definition ghplusdef (g1 g2 : gheap) :=
  forall x,
    match g1 x with
      | Some (Some n, _) => match g2 x with
                               | Some (Some n2, _) => False
                               | _ => True
                            end
      | _ => True
   end.

Definition ghplus (g1 g2: gheap) : gheap :=
  fun x =>
     match g1 x with
       | None => g2 x
       | Some (m1, n1) => match g2 x with
                            | None => g1 x
                            | Some (m2, n2) => Some (lift' m1 m2, plus n1 n2)
                          end
     end.

Definition boundgh (g: gheap) :=
  forall x m n, g x = Some (Some m, n) -> le n m.

(** # <font size="5"><b> Obligations </b></font> # *)

Inductive oplus A: (option (list A)) -> (option (list A)) -> (option (list A)) -> Prop :=
  | None_op: oplus None None None
  | fs_op o o' (PERM: Permutation o o'): oplus (Some o) None (Some o')
  | sn_op o o' (PERM: Permutation o o'): oplus None (Some o) (Some o').

(** # <font size="5"><b> Satisfaction Relation </b></font> # *)

Fixpoint sat (p:pheap) (O: option (list (olocation Z))) (g: gheap) (a:assn) :=
  match a with
    | Aprop p => p
    | Abool b => b = true
    | Aconj P Q => sat p O g P /\ sat p O g Q
    | Adisj P Q => sat p O g P \/ sat p O g Q
    | Astar P Q => exists (p1 p2: pheap) (phpdef: phplusdef p1 p2) (BP1: boundph p1) (BP2: boundph p2) (BP12: boundph (phplus p1 p2)) 
                          O1 O2 g1 g2 (ghpdef: ghplusdef g1 g2) (BG1: boundgh g1) (BG2: boundgh g2) (BG12: boundgh (ghplus g1 g2))
                          (OPLUS: oplus O1 O2 O),
                    sat p1 O1 g1 P /\ sat p2 O2 g2 Q /\ phplus p1 p2 = p /\ ghplus g1 g2 = g
    | Asepimp P Q => forall p' (BP': boundph p') (PHPDEF: phplusdef p p') (BPP': boundph (phplus p p')) O' g' (BG': boundgh g') 
                            (GHPDEF: ghplusdef g g') (BGG': boundgh (ghplus g g')) O'' (OPLUS: oplus O O' O'') (SAT: sat p' O' g' P),
                       sat (phplus p p') O'' (ghplus g g') Q
    | Apointsto f a z => exists f' (LE: 0 <= f'), p (evall a) = Some (Cell (f+f') ([[z]]))
    | Aulock l Wt Ot => p (evall l) = Some (Ulock Wt Ot)
    | Alock l => p (evall l) = Some Lock \/ exists Wt Ot, p (evall l) = Some (Locked Wt Ot)
    | Alocked l Wt Ot => p (evall l) = Some (Locked Wt Ot)
    | Acond v => p (evall v) = Some Cond
    | Aucond v => p (evall v) = Some Ucond
    | Aicond v => p (evall v) = Some Icond
    | Aobs O1 => oplus (Some (map evalol O1)) None O
    | Atic v => exists n o, g ([[v]]) = Some (o, S n)
    | Actr v m => exists n, g ([[v]]) = Some (Some m, n)
    | Aex pp => exists v, sat p O g (pp v)
    | Afa pp => forall v, sat p O g (pp v)
  end.

Notation "P '|=' Q" := 
  (forall p o g (bp: boundph p) (bg: boundgh g)
          (SAT: sat p o g P),
    sat p o g Q)
(at level 120).

Notation "'FA' z ',' P" := 
  (Afa (fun z => P))(at level 115).

Notation "'EX' z ',' P" := 
  (Aex (fun z => P))(at level 115).

Notation "P '--*' Q" := 
  (Asepimp P Q)(at level 110).

Notation "P '|*' Q" := 
  (Adisj P Q)(at level 105).

Notation "P '&*' Q" := 
  (Aconj P Q)(at level 100).

Notation "P '**' Q" := 
  (Astar P Q)(at level 95, right associativity).

Notation "P '|->' Q" := 
  (Apointsto 1 P Q)(at level 90).


(** # <font size="5"><b> Precedence Relation </b></font> # *)

Definition prcl (o:olocation Z) (O: list (olocation Z)) : bool :=
  match (Xofo o) with
    | None => forallb (fun x => Z.ltb (Rofo o) (Rofo x)) O
    | Some xo => andb (leb (length (filter (fun x => Z.leb (Rofo x) (Z.max (Rofo o) xo)) O)) 1)
                (andb (forallb (fun x => orb (Z.ltb (Z.max (Rofo o) xo) (Rofo x)) 
                                             (leb_o (Z.max (Rofo o) xo) (Xofo x))) O)
                (orb (forallb (fun x => Z.ltb (Rofo o) (Rofo x)) O)
                (Pofo o)))
  end.

Lemma prcl_perm:
  forall O O' o
         (PRC: prcl o O = true)
         (PERM: Permutation O' O),
    prcl o O' = true.
Proof.
  unfold prcl.
  intros.
  destruct (Xofo o).
  apply Coq.Bool.Bool.andb_true_iff in PRC.
  destruct PRC as (PRC1,PRC2).
  apply Nat.leb_le in PRC1.
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply Nat.leb_le.
  rewrite prem_length_eq with (l':=O).
  assumption.
  assumption.
  apply Coq.Bool.Bool.andb_true_iff in PRC2.
  destruct PRC2 as (PRC2,PRC3).
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply forallb_forall.
  intros.
  apply forallb_forall with (x:=x) in PRC2.
  apply PRC2.
  apply Permutation_in with O'.
  assumption.
  assumption.
  apply Coq.Bool.Bool.orb_true_iff.
  apply Coq.Bool.Bool.orb_true_iff in PRC3.
  destruct PRC3 as [PRC3|PRC3].
  left.
  apply forallb_forall.
  intros.
  apply forallb_forall with (x:=x) in PRC3.
  assumption.
  apply Permutation_in with O'.
  assumption.
  assumption.
  right.
  assumption.
  apply forallb_forall.
  intros.
  apply forallb_forall with (x:=x) in PRC.
  assumption.
  apply Permutation_in with O'.
  assumption.
  assumption.
Qed.

Lemma prcl_mono:
  forall l O1 O2
         (PRCL: prcl l (O1 ++ O2) = true),
    prcl l O2 = true.
Proof.
  unfold prcl.
  intros.
  destruct (Xofo l).
  apply Coq.Bool.Bool.andb_true_iff in PRCL.
  destruct PRCL as (P1,P2).
  apply Nat.leb_le in P1.
  rewrite length_filter_app in P1.
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply Nat.leb_le.
  omega.
  apply Coq.Bool.Bool.andb_true_iff in P2.
  destruct P2 as (P2,P3).
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply forallb_forall.
  intros.
  rewrite forallb_forall in P2.
  apply P2.
  apply in_app_iff.
  right.
  assumption.
  apply Coq.Bool.Bool.orb_true_iff in P3.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct P3 as [P3|P3].
  left.
  apply forallb_forall.
  intros.
  rewrite forallb_forall in P3.
  apply P3.
  apply in_app_iff.
  right.
  assumption.
  right.
  assumption.
  apply forallb_forall.
  intros.
  rewrite forallb_forall in PRCL.
  apply PRCL.
  apply in_app_iff.
  right.
  assumption.
Qed.


(** # <font size="5"><b> Safe Number of Obligations </b></font> # *)

Definition safe_obs (o:location Z) (Wt Ot: nat) := 
  andb (orb (Nat.eqb Wt 0) (ltb 0 Ot))
       (andb (orb (negb (Pof o))(orb (Nat.eqb Wt 0) (ltb Wt Ot)))
             (orb (ifb (opZ_eq_dec (Xof o) None)) (leb Wt Ot))).


Lemma safe_obs_wt_weak:
  forall v wt ot wt'
         (LE: le wt' wt)
         (SAFE_OBS: safe_obs v wt ot = true),
  safe_obs v wt' ot = true.
Proof.
  unfold safe_obs.
  intros.
  apply Coq.Bool.Bool.andb_true_iff in SAFE_OBS.
  destruct SAFE_OBS as (ONE,SAFE_OBS).
  apply Coq.Bool.Bool.andb_true_iff in SAFE_OBS.
  destruct SAFE_OBS as (SPR,OWN).
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply Coq.Bool.Bool.orb_true_iff in ONE.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct ONE as [ONE|ONE].
  left.
  apply Nat.eqb_eq in ONE.
  apply Nat.eqb_eq.
  omega.
  right.
  assumption.
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply Coq.Bool.Bool.orb_true_iff in SPR.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct SPR as [SPR|SPR].
  left.
  assumption.
  right.
  apply Coq.Bool.Bool.orb_true_iff in SPR.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct SPR as [SPR|SPR].
  left.
  apply Nat.eqb_eq in SPR.
  apply Nat.eqb_eq.
  omega.
  right.
  apply Nat.ltb_lt in SPR.
  apply Nat.ltb_lt.
  omega.
  apply Coq.Bool.Bool.orb_true_iff in OWN.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct OWN as [OWN|OWN].
  left.
  assumption.
  right.
  apply Nat.leb_le in OWN.
  apply Nat.leb_le.
  omega.
Qed.

Lemma safe_obs_ot_weak:
  forall v wt ot ot'
         (LE: le ot ot')
         (SAFE_OBS: safe_obs v wt ot = true),
  safe_obs v wt ot' = true.
Proof.
  unfold safe_obs.
  intros.
  apply Coq.Bool.Bool.andb_true_iff in SAFE_OBS.
  destruct SAFE_OBS as (ONE,SAFE_OBS).
  apply Coq.Bool.Bool.andb_true_iff in SAFE_OBS.
  destruct SAFE_OBS as (SPR,OWN).
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply Coq.Bool.Bool.orb_true_iff in ONE.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct ONE as [ONE|ONE].
  left.
  assumption.
  apply Nat.ltb_lt in ONE.
  right.
  apply Nat.ltb_lt.
  omega.
  apply Coq.Bool.Bool.andb_true_iff.
  split.
  apply Coq.Bool.Bool.orb_true_iff in SPR.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct SPR as [SPR|SPR].
  left.
  assumption.
  right.
  apply Coq.Bool.Bool.orb_true_iff in SPR.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct SPR as [SPR|SPR].
  left.
  apply Nat.eqb_eq in SPR.
  apply Nat.eqb_eq.
  omega.
  right.
  apply Nat.ltb_lt in SPR.
  apply Nat.ltb_lt.
  omega.
  apply Coq.Bool.Bool.orb_true_iff in OWN.
  apply Coq.Bool.Bool.orb_true_iff.
  destruct OWN as [OWN|OWN].
  left.
  assumption.
  right.
  apply Nat.leb_le in OWN.
  apply Nat.leb_le.
  omega.
Qed.


(** # <font size="5"><b> Spurious Wakeups </b></font> # *)

Definition inv := bag -> bag -> assn.

Definition spurious_ok (sp: bool) (l v: location Z) (invs: Z -> inv) :=
  sp = false \/
  (M'of v = nil /\
  forall wt ot,
    Abool (andb (ltb O (wt (Aof v))) ((ifb (list_eq_dec (olocation_eq_dec Z_eq_dec) (M'of v) nil)))) &* subsas (snd (Iof l)) (invs (fst (Iof l)) wt ot) |= 
    subsas (snd (Iof l)) (invs (fst (Iof l)) (upd Z.eq_dec wt (Aof v) (wt (Aof v) - 1)%nat) ot) **
    subsas (snd (Mof v)) (invs (fst (Mof v)) empb empb)).


(** # <font size="5"><b> Injectivity of Locations </b></font> # *)

Definition comp A B (l: list A) (f: A -> B) :=
  forall x1 x2 (IN: In x1 l) (IN: In x2 l), inj f x1 x2.

Lemma count_loc_Z:
  forall l x (COMP: comp (x::l) (fun x => Aof x)),
    count_occ Z.eq_dec (map (fun x => Aof x) l) (Aof x) = count_occ (location_eq_dec Z.eq_dec) l x.
Proof.
  induction l.
  simpl.
  reflexivity.
  simpl.
  intros.
  assert (COMP1: comp (x :: l) (fun x => Aof x)).
  {
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  }
  destruct (location_eq_dec Z.eq_dec a x).
  destruct (Z.eq_dec (Aof a) (Aof x)).
  rewrite IHl.
  reflexivity.
  assumption.
  rewrite e in n.
  contradiction.
  destruct (Z.eq_dec (Aof a) (Aof x)).
  assert (CO: a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  reflexivity.
  assumption.
  }
  contradiction.
  apply IHl.
  assumption.
Qed.

Lemma count_loc_Zo:
  forall l x (COMP: comp (x::l) (fun x => Aofo x)),
    count_occ Z.eq_dec (map (fun x => Aofo x) l) (Aofo x) = count_occ (olocation_eq_dec Z.eq_dec) l x.
Proof.
  induction l.
  simpl.
  reflexivity.
  simpl.
  intros.
  assert (COMP1: comp (x :: l) (fun x => Aofo x)).
  {
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  }
  destruct (olocation_eq_dec Z.eq_dec a x).
  destruct (Z.eq_dec (Aofo a) (Aofo x)).
  rewrite IHl.
  reflexivity.
  assumption.
  rewrite e in n.
  contradiction.
  destruct (Z.eq_dec (Aofo a) (Aofo x)).
  assert (CO: a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  reflexivity.
  assumption.
  }
  contradiction.
  apply IHl.
  assumption.
Qed.

Lemma count_map_eqo A (f1: A -> list (olocation Z)):
  forall l x
         (COMP: comp (x::concat (map f1 l)) (fun x => Aofo x)),
     count_occ Z.eq_dec (concat (map (fun t => map (fun x => Aofo x) (f1 t)) l)) (Aofo x) = 
     count_occ (olocation_eq_dec Z.eq_dec) (concat (map f1 l)) x.
Proof.
  induction l.
  simpl.
  intros.
  reflexivity.
  simpl.
  intros.
  rewrite <- count_app.
  rewrite <- count_app.
  rewrite IHl.
  assert (G: count_occ Z.eq_dec (map (fun x0 => Aofo x0) (f1 a)) (Aofo x) = count_occ (olocation_eq_dec Z.eq_dec) (f1 a) x).
  {
  apply count_loc_Zo.
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  left.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  left.
  assumption.
  }
  rewrite G.
  reflexivity.
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  right.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  right.
  assumption.
Qed.

Lemma count_map_eq A (f1: A -> list (location Z)):
  forall l x
         (COMP: comp (x::concat (map f1 l)) (fun x => Aof x)),
     count_occ Z.eq_dec (concat (map (fun t => map (fun x => Aof x) (f1 t)) l)) (Aof x) = 
     count_occ (location_eq_dec Z.eq_dec) (concat (map f1 l)) x.
Proof.
  induction l.
  simpl.
  intros.
  reflexivity.
  simpl.
  intros.
  rewrite <- count_app.
  rewrite <- count_app.
  rewrite IHl.
  assert (G: count_occ Z.eq_dec (map (fun x0 => Aof x0) (f1 a)) (Aof x) = count_occ (location_eq_dec Z.eq_dec) (f1 a) x).
  {
  apply count_loc_Z.
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  left.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  left.
  assumption.
  }
  rewrite G.
  reflexivity.
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  right.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite EQ1.
  left.
  reflexivity.
  right.
  apply in_app_iff.
  right.
  assumption.
Qed.

Lemma comp_cons A (f: location Z -> A):
  forall locs x (IN: In x locs)
         (COMP: comp locs f),
    comp (x::locs) f.
Proof.
  unfold comp.
  intros.
  apply COMP.
  destruct IN0 as [EQ0|IN0].
  rewrite <- EQ0.
  assumption.
  assumption.
  destruct IN1 as [EQ0|IN2].
  rewrite <- EQ0.
  assumption.
  assumption.
Qed.

Lemma comp_conso A (f: olocation Z -> A):
  forall locs x (IN: In x (map (fun x => Oof x) locs))
         (COMP: comp (map (fun x => Oof x) locs) f),
    comp (x::(map (fun x => Oof x) locs)) f.
Proof.
  unfold comp.
  intros.
  apply COMP.
  destruct IN0 as [EQ0|IN0].
  rewrite <- EQ0.
  assumption.
  assumption.
  destruct IN1 as [EQ0|IN2].
  rewrite <- EQ0.
  assumption.
  assumption.
Qed.

Fixpoint xOf A (f: location Z -> A) (l: list (location Z)) (z: Z) : option A :=
  match l with
    | nil => None
    | h::t => if Z.eq_dec z (Aof h) then (Some (f h)) else (xOf f t z)
  end.

Lemma xOf_same A (f: location Z -> A):
  forall (l: list (location Z)) x
         (IN: In (Aof x) (map (fun x => Aof x) l))
         (COMP: comp (x::l) (fun x => Aof x)),
    xOf f l (Aof x) = Some (f x).
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.
  destruct IN as [EQ|IN].
  rewrite <- EQ in *.
  destruct (Z.eq_dec (Aof a) (Aof a)).
  assert (EQ1: a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  reflexivity.
  assumption.
  }
  rewrite EQ1.
  reflexivity.
  contradiction.
  destruct (Z.eq_dec (Aof x) (Aof a)).
  assert (G: a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  reflexivity.
  symmetry.
  assumption.
  }
  rewrite G.
  reflexivity.
  apply IHl.
  assumption.
  unfold comp in *.
  intros.
  apply COMP.
  unfold comp in *.
  destruct IN0 as [EQ0|IN0].
  rewrite <- EQ0.
  left.
  reflexivity.
  right.
  right.
  assumption.
  destruct IN1 as [EQ0|IN1].
  rewrite <- EQ0.
  left.
  reflexivity.
  right.
  right.
  assumption.
Qed.

Lemma xOf_sameo A (f: location Z -> A) (f': olocation Z -> A):
  forall (l: list (location Z)) (x: olocation Z)
         (FF': forall l, f l = f' (Oof l))
         (IN: In x (map (fun x => Oof x) l))
         (COMP: comp (x::(map (fun x : location Z => Oof x) l)) (fun x => Aofo x)),
    xOf f l (Aofo x) = Some (f' x).
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.
  destruct IN as [EQ|IN].
  rewrite <- EQ in *.
  rewrite eqz.
  assert (EQ1: Oof a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  assumption.
  rewrite EQ.
  reflexivity.
  }
  rewrite EQ.
  rewrite <- EQ1.
  rewrite FF'.
  reflexivity.
  destruct (Z.eq_dec (Aofo x) (Aof a)).
  assert (G: Oof a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  reflexivity.
  symmetry.
  assumption.
  }
  rewrite <- G.
  rewrite FF'.
  reflexivity.
  apply IHl.
  assumption.
  assumption.
  unfold comp in *.
  intros.
  apply COMP.
  unfold comp in *.
  destruct IN0 as [EQ0|IN0].
  rewrite <- EQ0.
  left.
  reflexivity.
  right.
  right.
  assumption.
  destruct IN1 as [EQ0|IN1].
  rewrite <- EQ0.
  left.
  reflexivity.
  right.
  right.
  assumption.
Qed.

Lemma filter_filter_map_eq A B (f1: B -> bool) (f2: A -> bool) m:
  forall (l: list A)
    (COMP: comp l m)
    (EQF: forall x (IN: In x l), f1 (m x) = f2 x),
    length (filter f1 (map m l)) = length (filter f2 l).
Proof.
  induction l.
  simpl.
  reflexivity.
  simpl.
  intros.
  destruct (f1 (m a)) eqn:f1ma.
  assert (f2a:=f1ma).
  rewrite EQF in f2a.
  rewrite f2a.
  simpl.
  rewrite IHl.
  reflexivity.
  unfold comp.
  intros.
  apply COMP.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply EQF.
  right.
  assumption.
  left.
  reflexivity.
  assert (f2a:=f1ma).
  rewrite EQF in f2a.
  rewrite f2a.
  rewrite IHl.
  reflexivity.
  unfold comp.
  intros.
  apply COMP.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply EQF.
  right.
  assumption.
  left.
  reflexivity.
Qed.

Lemma count_occ_map_map A B (f: A -> B) eq_dec1 eq_dec2:
  forall (l: list A) x
    (COMP: comp (x::l) f),
    count_occ eq_dec1 l x =
    count_occ eq_dec2 (map f l) (f x).
Proof.
  induction l.
  simpl.
  reflexivity.
  simpl.
  intros.
  destruct (eq_dec1 a x).
  rewrite e.
  destruct (eq_dec2 (f x) (f x)).
  rewrite IHl.
  reflexivity.
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite <- EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite <- EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  contradiction.
  destruct (eq_dec2 (f a) (f x)).
  assert (CO: a = x).
  {
  apply COMP.
  right.
  left.
  reflexivity.
  left.
  reflexivity.
  assumption.
  }
  contradiction.
  apply IHl.
  unfold comp in *.
  intros.
  apply COMP.
  destruct IN as [EQ1|IN1].
  rewrite <- EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
  destruct IN0 as [EQ1|IN1].
  rewrite <- EQ1.
  left.
  reflexivity.
  right.
  right.
  assumption.
Qed.

Lemma count_occ_concat_eq A B C (f1: A -> list B) (f3: B -> C) eq_dec1 eq_dec2:
  forall (l: list A) x
    (COMP: forall y (IN: In y l), comp (x::f1 y) f3),
    count_occ eq_dec1 (concat (map f1 l)) x =
    count_occ eq_dec2 (concat (map (fun y => map f3 (f1 y)) l)) (f3 x).
Proof.
  induction l.
  simpl.
  reflexivity.
  simpl.
  intros.
  rewrite <- count_app.
  rewrite <- count_app.
  rewrite IHl.
  rewrite <- count_occ_map_map with (eq_dec1 := eq_dec1).
  reflexivity.
  unfold comp in *.
  intros.
  apply COMP with a.
  left.
  reflexivity.
  assumption.
  assumption.
  intros.
  apply COMP.
  right.
  assumption.
Qed.

Lemma xOf_exists A:
  forall l z O (X: location Z -> A)
         (XOF: xOf X l z = Some O),
    exists x (IN: In x l) (EQ1: Aof x = z), X x = O.
Proof.
  induction l.
  simpl.
  intros.
  inversion XOF.
  simpl.
  intros.
  destruct (Z.eq_dec z (Aof a)).
  inversion XOF.
  exists a.
  exists.
  tauto.
  exists.
  symmetry.
  assumption.
  reflexivity.
  apply IHl in XOF.
  destruct XOF as (x,(INx,(EQ1,EQ2))).
  exists x.
  exists.
  right.
  assumption.
  exists EQ1.
  assumption.
Qed.

Lemma xOf_exists1 A (f: location Z -> A):
  forall l z,
    xOf f l z = None <-> ~ exists x (IN: In x l), Aof x = z.
Proof.
  induction l.
  simpl.
  split.
  intros.
  unfold not.
  intros.
  destruct H0 as (x,(FAL,EQ)).
  assumption.
  reflexivity.
  simpl.
  split.
  intros.
  destruct (Z.eq_dec z (Aof a)).
  inversion H.
  apply IHl in H.
  unfold not in *.
  intros.
  destruct 0 as (x,(EQ1,EQ2)).
  destruct EQ1 as [EQ1|IN1].
  apply n.
  rewrite EQ1.
  omega.
  apply H.
  exists x, IN1.
  assumption.
  intros.
  destruct (Z.eq_dec z (Aof a)).
  exfalso.
  apply H.
  exists a.
  exists.
  left.
  reflexivity.
  omega.
  apply IHl.
  unfold not.
  intros.
  apply H.
  destruct H0 as (x,(IN,EQ)).
  exists x.
  exists.
  right.
  assumption.
  assumption.
Qed.

Lemma xof_mon' A (X: location Z -> A):
  forall l l' x z
         (XOF: xOf X l x = Some z)
         (COMP: comp (l ++ l') (fun x => Aof x)),
    xOf X (l' ++ l) x = Some z.
Proof.
  intros.
  apply xOf_exists in XOF.
  destruct XOF as (x0,(IN,(EQ,Xx))).
  unfold comp, inj in COMP.
  destruct (xOf X (l' ++ l) x) eqn:XOF.
  apply xOf_exists in XOF.
  destruct XOF as (x1,(IN1,(EQ1,Xx1))).
  rewrite <- Xx1.
  rewrite <- Xx.
  replace x1 with x0.
  reflexivity.
  apply COMP.
  apply in_app_iff.
  left.
  assumption.
  apply in_app_iff in IN1.
  apply in_app_iff.
  destruct IN1.
  right. assumption.
  left. assumption.
  rewrite EQ, EQ1.
  reflexivity.
  apply xOf_exists1 in XOF.
  exfalso.
  apply XOF.
  exists x0.
  exists.
  apply in_app_iff.
  right. assumption.
  assumption.
Qed.

Lemma xof_app_or A (X: location Z -> A):
  forall l l' a,
    xOf X (l ++ l') a = xOf X l a \/
    xOf X (l ++ l') a = xOf X l' a.
Proof.
  induction l.
  simpl.
  intros.
  right.
  reflexivity.
  simpl.
  intros.
  destruct (Z.eq_dec a0 (Aof a)).
  left.
  reflexivity.
  apply IHl.
Qed.

Definition xcomp (l: list (location Z)) :=
  forall x1 (IN1: In x1 l) x2 (IN1: In x2 l) (EQ1: Lof x1 = Aof x2),
    Xof x1 = Xof x2.

Definition lcomp (l: list (location Z)) :=
  forall x (IN: In x l), In (Lof x) (map (fun x => Aof x) l).

Lemma xOf_same1:
  forall (l: list (location Z)) x O
         (IN: In x l)
         (COMP: comp l (fun x => Aof x))
         (XCOM: xcomp l)
         (XOF: xOf (fun x => Xof x) l (Lof x) = Some O),
    Xof x = O.
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.
  destruct IN as [EQ|IN].
  rewrite <- EQ in *.
  destruct (Z.eq_dec (Lof a) (Aof a)).
  inversion XOF.
  reflexivity.
  unfold xcomp in XCOM.

  apply xOf_exists in XOF.
  destruct XOF as (x1,(INx,(EQx1,EQx2))).
  rewrite <- EQx2.
  apply XCOM.
  left.
  reflexivity.
  right.
  assumption.
  rewrite EQx1.
  reflexivity.

  destruct (Z.eq_dec (Lof x) (Aof a)).
  inversion XOF.
  unfold xcomp in XCOM.
  apply XCOM.
  right.
  assumption.
  left.
  reflexivity.
  assumption.

  apply IHl;
  try tauto.
  unfold comp in *.
  intros.
  apply COMP.
  right.
  assumption.
  right.
  assumption.
  unfold xcomp in *.
  intros.
  apply XCOM.
  right.
  assumption.
  right.
  assumption.
  assumption.
Qed.

Lemma eq_xof0:
  forall l a x (NEQ: x <> Aof a),
    xOf (fun x => Lof x) l x =
    xOf (fun x => Lof x) (remove (location_eq_dec Z.eq_dec) a l) x.
Proof.
  induction l.
  simpl.
  reflexivity.
  simpl.
  intros.
  repeat dstr_;
  apply IHl;
  assumption.
Qed.

Lemma eq_xof:
  forall l x e i 
         (IN: In e l)
         (COMP: comp l (fun x => Aof x)),
     xOf (fun x => Lof x) l x = xOf (fun x => Lof x) ((Oof e, i, Mof e, M'of e) :: remove (location_eq_dec Z.eq_dec) e l) x.
Proof.
  simpl.
  intros.
  destruct (Z.eq_dec x (Aof (Oof e, i, Mof e, M'of e))).
  rewrite e0.
  unfold Aof.
  unfold Lof.
  unfold Aofo.
  unfold Oof.
  simpl.
  apply xOf_same.
  apply in_map_iff.
  exists e.
  tauto.
  unfold comp.
  unfold inj.
  intros.
  destruct IN0 as [EQ0|IN0].
  rewrite <- EQ0.
  destruct IN1 as [EQ1|IN1].
  rewrite <- EQ1.
  reflexivity.
  apply COMP.
  assumption.
  assumption.
  rewrite <- H.
  rewrite <- EQ0.
  reflexivity.

  destruct IN1 as [EQ1|IN1].
  rewrite <- EQ1.
  apply COMP.
  assumption.
  assumption.
  rewrite H.
  rewrite EQ1.
  reflexivity.
  apply COMP.
  assumption.
  assumption.
  assumption.
  apply eq_xof0.
  assumption.
Qed.

Lemma xof_mon A (X: location Z -> A):
  forall l x z a
         (XOF: xOf X l x = Some z)
         (NIN: forall l' (EQ: Aof l' = Aof a), ~ In l' l),
    xOf X (a::l) x = Some z.
Proof.
  intros.
  simpl.
  destruct (Z.eq_dec x (Aof a)).
  rewrite e in XOF.
  apply xOf_exists in XOF.
  destruct XOF as (x1,(in1,(eq1,eq2))).
  assert (CO: ~ In x1 l).
  {
  apply NIN.
  assumption.
  }
  contradiction.
  assumption.
Qed.

(** # <font size="5"><b> oplus </b></font> # *)

Lemma sn_oplus A (o:option (list A)):
  oplus None o o.
Proof.
  destruct o.
  apply sn_op.
  apply Permutation_refl.
  apply None_op.
Qed.

Lemma fs_oplus A (o:option (list A)):
  oplus o None o.
Proof.
  destruct o.
  apply fs_op.
  apply Permutation_refl.
  apply None_op.
Qed.

Lemma oplus_assoc A:
  forall (o1 o2 o3 o4 o1o2 o2o4: option (list A))
         (OP1: oplus o1 o2 o1o2)
         (OP2: oplus o3 o4 o1)
         (OP3: oplus o2 o4 o2o4),
    oplus o3 o2o4 o1o2.
Proof.
  intros.
  inversion OP1.
  rewrite <- H in *.
  rewrite <- H0 in *.
  rewrite <- H1 in *.
  inversion OP2.
  rewrite <- H3 in *.
  inversion OP3.
  apply None_op.
  rewrite <- H in *.
  rewrite <- H0 in *.
  rewrite <- H1 in *.
  inversion OP2.
  rewrite <- H3 in *.
  inversion OP3.
  apply fs_op.
  apply Permutation_trans with o.
  assumption.
  assumption.
  rewrite <- H3 in *.
  inversion OP3.
  apply sn_op.
  apply Permutation_trans with o0.
  apply Permutation_sym.
  assumption.
  apply Permutation_trans with o.
  assumption.
  assumption.
  rewrite <- H in *.
  rewrite <- H0 in *.
  rewrite <- H1 in *.
  inversion OP2.
  rewrite <- H3 in *.
  inversion OP3.
  apply sn_op.
  apply Permutation_trans with o.
  apply Permutation_sym.
  assumption.
  assumption.
Qed.

Lemma oplus_comm A:
  forall (o1 o2 o1o2: option (list A))
         (OP: oplus o1 o2 o1o2),
    oplus o2 o1 o1o2.
Proof.
  intros.
  inversion OP.
  apply None_op.
  apply sn_op.
  assumption.
  apply fs_op.
  assumption.
Qed.

Lemma oplus_trans A:
  forall (o1 o2: option (list A)) o1o2 o1o2'
         (OP: oplus o1 o2 (Some o1o2))
         (PERM: Permutation o1o2 o1o2'),
    oplus o1 o2 (Some o1o2').
Proof.
  intros.
  inversion OP.
  apply fs_op.
  apply Permutation_trans with o1o2;
  tauto.
  apply sn_op.
  apply Permutation_trans with o1o2;
  tauto.
Qed.

Lemma oplus_exists A:
  forall (o1 o2: option (list A)) (DEF: o1 = None \/ o2 = None),
    exists o1o2, oplus o1 o2 o1o2.
Proof.
  intros.
  destruct DEF as [DEF|DEF].
  rewrite DEF.
  exists o2.
  destruct o2.
  apply sn_op.
  apply Permutation_refl.
  apply None_op.
  rewrite DEF.
  exists o1.
  destruct o1.
  apply fs_op.
  apply Permutation_refl.
  apply None_op.
Qed.

(** # <font size="5"><b> phplusdef </b></font> # *)

Lemma phpdef_comm: 
  forall p1 p2 (PHPDEF: phplusdef p1 p2),
    phplusdef p2 p1.
Proof.
  unfold phplusdef; intros; specialize PHPDEF with x; repeat dstr_.
Qed.

Lemma phpdef_emp p: 
  phplusdef p (emp knowledge).
Proof.
  unfold phplusdef; unfold emp; repeat dstr_.
Qed.

Lemma phpdef_pair:
  forall p1 p2 p3
         (PHPD1: phplusdef p2 p3)
         (PHPD2: phplusdef p1 p2)
         (PHPD3: phplusdef p1 p3),
    phplusdef p1 (phplus p2 p3).
Proof.
  unfold phplusdef; unfold phplus; intros;
  specialize PHPD1 with x; specialize PHPD2 with x; specialize PHPD3 with x.
  repeat dstr_.
Qed.

Lemma phpdef_pair':
  forall p1 p2 p3
         (PHPD1: phplusdef p1 p2)
         (PHPD2: phplusdef p1 p3)
         (PHPD3: phplusdef p2 p3),
    phplusdef (phplus p1 p2) p3.
Proof.
  unfold phplusdef; unfold phplus; intros.
  specialize PHPD1 with x; specialize PHPD2 with x; specialize PHPD3 with x.
  repeat dstr_.
Qed.

Lemma phpdef_assoc:
  forall p1 p2 p3
         (PHPD1: phplusdef p1 p2)
         (PHPD2: phplusdef p1 p3)
         (PHPD3: phplusdef p2 p3),
    phplusdef (phplus p1 p2) p3 <->
    phplusdef p1 (phplus p2 p3).
Proof.
  unfold phplusdef; unfold phplus; split;
  intros; specialize PHPD1 with x; specialize PHPD2 with x; specialize PHPD3 with x; specialize H with x;
  repeat dstr_.
Qed.

Lemma phpdef_dist:
  forall p1 p2 p3
         (PHPD1: phplusdef (phplus p1 p2) p3)
         (PHPD2: phplusdef p1 p2),
    phplusdef p1 p3 /\ phplusdef p2 p3.
Proof.
  unfold phplusdef; unfold phplus; split; intros;
  specialize PHPD1 with x; specialize PHPD2 with x;
  repeat dstr_.
Qed.

Lemma phpdef_dist':
  forall p1 p2 p3
         (PHPD1: phplusdef p1 (phplus p2 p3))
         (PHPD2: phplusdef p2 p3),
    phplusdef p1 p2 /\ phplusdef p1 p3.
Proof.
  unfold phplus; unfold phplusdef; split; intros;
  specialize PHPD1 with x; specialize PHPD2 with x; repeat dstr_.
Qed.

Lemma phpdef_v:
  forall p1 p2 z v
         (PHPDL: phplusdef p1 p2)
         (P1z: p2 z = None),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z v) p2.
Proof.
  unfold phplusdef; intros; specialize PHPDL with x;
  repeat dstr_.
Qed.

Lemma phplus_none:
  forall p1 p2 z
         (P1z: p1 z = None)
         (P2z: p2 z = None),
    phplus p1 p2 z = None.
Proof.
  unfold phplus.
  intros.
  rewrite P1z.
  assumption.
Qed.

Lemma phpdef_none:
  forall p1 p2 z
         (phpdefp1p2: phplusdef p1 p2),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z None) p2.
Proof.
  unfold phplusdef.
  unfold upd.
  intros.
  specialize phpdefp1p2 with x.
  repeat dstr_.
Qed.

Lemma phplus_none_mon:
  forall p1 p2 z
        (p1p2z: phplus p1 p2 z = None),
    p2 z = None.
Proof.
  unfold phplus.
  intros.
  destruct (p1 z).
  destruct k.
  destruct (p2 z).
  destruct k;
  inversion p1p2z.
  inversion p1p2z.
  inversion p1p2z.
  destruct (p2 z).
  destruct k;
  inversion p1p2z.
  inversion p1p2z.
  inversion p1p2z.
  inversion p1p2z.
  inversion p1p2z.
  inversion p1p2z.
  assumption.
Qed.

Lemma phplus_None:
 forall p1 p2 z
        (p1p2z: phplus p1 p2 z = None),
   p1 z = None.
Proof.
  unfold phplus.
  intros.
  repeat dstr_;
  inversion p1p2z.
Qed.

Lemma phplus_some:
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P1v: p1 z <> None),
    phplus p1 p2 z <> None.
Proof.
  unfold phplus.
  unfold phplusdef.
  intros.
  specialize PHPD with z.
  repeat dstr_; eexists; reflexivity.
Qed.

Lemma phplus_some':
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P2v: p2 z <> None),
    phplus p1 p2 z <> None.
Proof.
  unfold phplus.
  unfold phplusdef.
  intros.
  specialize PHPD with z.
  repeat dstr_; eexists; reflexivity.
Qed.

Lemma phpdef_locked:
  forall p1 p2 wt ot z
         (PHPDL: phplusdef p1 p2)
         (P1z: exists wt1 ot1, p1 z = (Some (Locked wt1 ot1))),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) p2.
Proof.
  unfold phplusdef; intros; specialize PHPDL with x;
  repeat dstr_; destruct P1z as (wt1,(ot1,p1z)); inversion p1z.
Qed.

Lemma phpdef_locked':
  forall p1 p2 wt ot z
         (PHPDL: phplusdef p1 p2)
         (P2z: p2 z = Some Lock \/ p2 z = None),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) p2.
Proof.
  unfold phplusdef; intros; specialize PHPDL with x;
  repeat dstr_; destruct P2z as [P2z|P2z]; inversion P2z.
Qed.

Lemma phplus_lock_none:
  forall p1 p2 z
         (P2z: phplus p1 p2 z = Some Lock \/ phplus p1 p2 z = None),
    p1 z = Some Lock \/ p1 z = None.
Proof.
  unfold phplus; intros; repeat dstr_; destruct P2z as [P2z|P2z]; inversion P2z.
  right.
  reflexivity.
  right.
  reflexivity.
Qed.

Lemma phplus_lock_none':
  forall p1 p2 z
         (phpdefp1p2: phplusdef p1 p2)
         (P1z: phplus p1 p2 z = Some Lock \/ phplus p1 p2 z = None),
    p2 z = Some Lock \/ p2 z = None.
Proof.
  unfold phplus; intros.
  unfold phplusdef in phpdefp1p2.
  specialize phpdefp1p2 with z.
  destruct P1z as [P1z|P1z].
  repeat dstr_; try inversion P1z.
  left. reflexivity.
  left. reflexivity.
  right. reflexivity.
  repeat dstr_; try inversion P1z.
  left. reflexivity.
  right. reflexivity.
  right. reflexivity.
  right. reflexivity.
  right. reflexivity.
  right. reflexivity.
Qed.

Lemma phpdef_ulock:
  forall p1 p2 wt ot z
         (PHPDL: phplusdef p1 p2)
         (P1z: p2 z = None),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some (Ulock wt ot))) p2.
Proof.
  unfold phplusdef; intros; specialize PHPDL with x;
  repeat dstr_.
Qed.

Lemma phplus_ulock':
  forall p1 p2 l wt ot
         (PHPD: phplusdef p1 p2)
         (P1l: p2 l = Some (Ulock wt ot)),
    (phplus p1 p2) l = Some (Ulock wt ot).
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with l; repeat dstr_.
Qed.

Definition dstr_cells' A (f: location Z -> A) (l: list (location Z)) (default: A) (a: location Z) := 
  if in_dec (location_eq_dec Z.eq_dec) a l then default else f a.

Lemma phplus_dstr1:
  forall p1 p2 n m z' 
         (NIN: ~ In z' (map m (seq 0 n))),
    phplus (dstr_cells' p1 (map m (seq 0 n)) (Some (Cell full 0))) p2 z' =
    phplus p1 p2 z'.
Proof.
  intros.
  unfold phplus.
  unfold dstr_cells'.
  destruct (in_dec (location_eq_dec Z.eq_dec) z' (map m (seq 0 n))).
  contradiction.
  reflexivity.
Qed.

Lemma phpdef_ucond:
  forall p1 p2 z
        (PHPD: phplusdef p1 p2)
        (P1z: p1 z = Some Ucond),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some Cond)) p2.
Proof.
  unfold phplusdef; intros; specialize PHPD with x; repeat dstr_;
  destruct P1z as (wt,(ot,p1z)); destruct p1z as [p1z|p1z]; inversion p1z.
Qed.

Lemma phpdef_icond:
  forall p1 p2 z
        (PHPD: phplusdef p1 p2)
        (P1z: p1 z = Some Ucond),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some Icond)) p2.
Proof.
  unfold phplusdef; intros; specialize PHPD with x; repeat dstr_;
  destruct P1z as (wt,(ot,p1z)); destruct p1z as [p1z|p1z]; inversion p1z.
Qed.

Lemma phpdef_upd_none:
  forall p1 p2 z v
         (PHPDL: phplusdef p1 p2)
         (P1z: p2 z = None),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z v) p2.
Proof.
  unfold phplusdef; intros; specialize PHPDL with x;
  repeat dstr_.
Qed.

Lemma phpdef_updl A m:
  forall (l: list (A * Z)) p1 p2 z x
         (PHPDL: forall p (IN: In p (map m l)), phplusdef p p2)
         (IN: In p1 (map m (updl l z x)))
         (PHPD: phplusdef (m x) p2),
    phplusdef p1 p2.
Proof.
  induction l; simpl; intros; try contradiction.
  destruct (Z.eq_dec (snd a) z).
  destruct IN as [EQ|IN].
  rewrite <- EQ; assumption.
  apply IHl with z x; try tauto.
  intros; apply PHPDL; right; assumption.
  destruct IN as [EQ|IN].
  rewrite <- EQ; apply PHPDL; tauto.
  apply IHl with z x; try tauto.
  intros; apply PHPDL; tauto.
Qed.

Lemma phpdef_assoc_mon:
  forall p1 p2 p3
         (PHPDEF1: phplusdef p1 p2)
         (PHPDEF2: phplusdef (phplus p1 p2) p3),
    phplusdef p2 p3.
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPDEF1 with x; specialize PHPDEF2 with x;
  repeat dstr_.
Qed.

Lemma phpdef_locked_lock:
  forall p1 p2 z
        (PHPD: phplusdef p1 p2)
        (P1z: exists wt ot, p1 z = Some (Locked wt ot) \/ p1 z = Some (Ulock wt ot)),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock)) p2.
Proof.
  unfold phplusdef; intros; specialize PHPD with x; repeat dstr_;
  destruct P1z as (wt,(ot,p1z)); destruct p1z as [p1z|p1z]; inversion p1z.
Qed.

Lemma phpdef_assoc_mon2:
  forall p1 p2 p3
         (PHPDEF1: phplusdef p1 p2)
         (PHPDEF2: phplusdef (phplus p1 p2) p3),
    phplusdef p2 p3.
Proof.
  unfold phplusdef; unfold phplus; intros;
  specialize PHPDEF1 with x; specialize PHPDEF2 with x;
  repeat dstr_.
Qed.

Lemma phpdef_upd_locked:
  forall p1 p2 z wt ot
         (PHPD: phplusdef p1 p2)
         (p2z: p2 z = Some Lock \/ p2 z = None),
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) p2.
Proof.
  unfold phplusdef; intros; specialize PHPD with x; repeat dstr_;
  destruct p2z as [p2z|p2z]; inversion p2z.
Qed.

(** # <font size="5"><b> phplus </b></font> # *)

Lemma phplus_emp:
  forall p,
    phplus p (emp knowledge) = p.
Proof.
  unfold emp; unfold phplus; intros; apply functional_extensionality; intros; repeat dstr_.
Qed.

Lemma phplus_comm:
  forall p1 p2 (PHPD: phplusdef p1 p2),
    phplus p1 p2 = phplus p2 p1.
Proof.
  unfold phplusdef; unfold phplus; intros;
  apply functional_extensionality; intros;
  specialize PHPD with x; repeat dstr_.
  rewrite Qcplus_comm; reflexivity.
Qed.

Lemma phplus_assoc:
  forall p1 p2 p3 
         (PHPD1: phplusdef p1 p2)
         (PHPD2: phplusdef p1 p3)
         (PHPD3: phplusdef p2 p3),
    phplus (phplus p1 p2) p3 = phplus p1 (phplus p2 p3).
Proof.
  unfold phplusdef; unfold phplus; intros;
  apply functional_extensionality; intros;
  specialize PHPD1 with x; specialize PHPD2 with x; specialize PHPD3 with x;
  repeat dstr_.
  rewrite Qcplus_assoc; reflexivity.
Qed.

Lemma phplus_lock:
  forall p1 p2 l
         (P1l: p1 l = Some Lock \/ exists wt ot, p1 l = Some (Locked wt ot)),
    (phplus p1 p2) l = Some Lock \/ exists wt ot, (phplus p1 p2) l = Some (Locked wt ot).
Proof.
  unfold phplusdef; unfold phplus; intros; destruct P1l as [p1l|p1l].
  rewrite p1l in *; repeat dstr_; try tauto.
  right; exists Wt, Ot; reflexivity.
  destruct p1l as (wt,(ot,p1l)); rewrite p1l in *;
  right; exists wt, ot; reflexivity.
Qed.

Lemma phplus_lock':
  forall p1 p2 l
         (phpdefp1p2: phplusdef p1 p2)
         (P2l: p2 l = Some Lock \/ exists wt ot, p2 l = Some (Locked wt ot)),
    (phplus p1 p2) l = Some Lock \/ exists wt ot, (phplus p1 p2) l = Some (Locked wt ot).
Proof.
  unfold phplusdef; unfold phplus; intros.
  unfold phplusdef in phpdefp1p2.
  specialize phpdefp1p2 with l.
  destruct P2l as [p2l|p2l].
  rewrite p2l in *.
  destruct (p1 l).
  destruct k; try contradiction; try reflexivity.
  left. reflexivity.
  right. exists Wt, Ot.
  reflexivity.
  left. reflexivity.
  destruct p2l as (wt,(ot,p2l)); rewrite p2l in *.
  destruct (p1 l).
  destruct k; try contradiction; try reflexivity.
  right. exists wt, ot.
  reflexivity.
  right. exists wt, ot.
  reflexivity.
Qed.

Lemma phplus_locked:
  forall p1 p2 l wt ot
         (PHPD: phplusdef p1 p2)
         (P1l: p1 l = Some (Locked wt ot)),
    (phplus p1 p2) l = Some (Locked wt ot).
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with l; rewrite P1l in *; reflexivity.
Qed.

Lemma phplus_locked':
  forall p1 p2 l wt ot
         (PHPD: phplusdef p1 p2)
         (P2l: p2 l = Some (Locked wt ot)),
    (phplus p1 p2) l = Some (Locked wt ot).
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with l; rewrite P2l in *; repeat dstr_.
Qed.

Lemma phplus_locked_mon:
  forall p1 p2 l wt ot
         (LOCKED: phplus p1 p2 l = Some (Locked wt ot)),
    p1 l = Some (Locked wt ot) \/ p2 l = Some (Locked wt ot). 
Proof.
  unfold phplus; repeat dstr_; tauto.
Qed.

Lemma phplus_ulock:
  forall p1 p2 l wt ot
         (PHPD: phplusdef p1 p2)
         (P1l: p1 l = Some (Ulock wt ot)),
    (phplus p1 p2) l = Some (Ulock wt ot).
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with l; repeat dstr_.
Qed.

Lemma phplus_upd:
  forall p1 p2 z z'
         (CELL: ~ exists v f v' f' (Z': z' = Some (Cell f v)), p2 z = Some (Cell f' v'))
         (LOCKED: z' = Some Lock -> ~ exists wt ot, p2 z = Some (Locked wt ot))
         (NONE: z' = None -> p2 z = None),
    phplus (upd (location_eq_dec Z.eq_dec) p1 z z') p2 = upd (location_eq_dec Z.eq_dec) (phplus p1 p2) z z'.
Proof.
  intros; unfold phplus; apply functional_extensionality; repeat dstr_.
  exfalso; apply CELL; repeat eexists.
  exfalso; apply LOCKED; try reflexivity.
  exists Wt, Ot; reflexivity.
  apply NONE; reflexivity.
Qed.

Lemma phplus_upd1:
  forall p1 p2 z v z' (NEQ: z <> z'),
    phplus (upd (location_eq_dec Z.eq_dec) p1 z v) p2 z' =
    phplus p1 p2 z'.
Proof.
  intros.
  unfold phplus.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) z' z).
  rewrite e in NEQ.
  contradiction.
  reflexivity.
Qed.

Lemma phplus_Cond:
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P1v: p1 z = Some Cond),
    phplus p1 p2 z = Some Cond.
Proof.
  unfold phplus; unfold phplusdef; intros; specialize PHPD with z;
  rewrite P1v in *; reflexivity.
Qed.

Lemma phplus_Cond':
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P2v: p2 z = Some Cond),
    phplus p1 p2 z = Some Cond.
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with z; rewrite P2v in *; repeat dstr_.
Qed.

Lemma phplus_Icond:
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P1v: p1 z = Some Icond),
    phplus p1 p2 z = Some Icond.
Proof.
  unfold phplus; unfold phplusdef; intros; specialize PHPD with z;
  rewrite P1v in *; reflexivity.
Qed.

Lemma phplus_Icond':
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P2v: p2 z = Some Icond),
    phplus p1 p2 z = Some Icond.
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with z; rewrite P2v in *; repeat dstr_.
Qed.

Lemma phplus_locked_mono:
  forall p1 p2 z
         (p1p2z: phplus p1 p2 z = None \/ phplus p1 p2 z = Some Lock),
    p1 z = None \/ p1 z = Some Lock.
Proof.
  unfold phplus; repeat dstr_;
  destruct p1p2z as [CO|CO]; inversion CO; tauto.
Qed.

Lemma phplus_lock_mon:
  forall p1 p2 z wt ot
         (PHPDEF: phplusdef p1 p2)
         (P1: p1 z = Some (Locked wt ot)),
    p2 z = Some Lock \/ p2 z = None.
Proof.
  unfold phplus; unfold phplusdef; intros.
  specialize PHPDEF with z; rewrite P1 in *;
  repeat dstr_; tauto.
Qed.

Lemma phplus_ulock_mon:
  forall p1 p2 z wt ot
         (PHPDEF: phplusdef p1 p2)
         (P1: p1 z = Some (Ulock wt ot)),
    p2 z = None.
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPDEF with z; rewrite P1 in *; repeat dstr_.
Qed.

Lemma phplus_upd_lock:
  forall p1 p2 z (P2: p2 z = Some Lock \/ p2 z = None),
    phplus (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock)) p2 z = Some Lock.
Proof.
  unfold phplus; repeat dstr_; destruct P2 as [p2z|p2z]; inversion p2z.
Qed.

Lemma phplus_mon:
  forall p1 p1' p2 x
         (EQ: p1 x = p1' x),
    phplus p1 p2 x = phplus p1' p2 x.
Proof.
  unfold phplus; intros; rewrite EQ; reflexivity.
Qed.

(** # <font size="5"><b> boundph </b></font> # *)

Lemma bph_comm:
  forall p1 p2 
        (PHPDEF: phplusdef p1 p2)
        (BP: boundph (phplus p1 p2)),
    boundph (phplus p2 p1).
Proof.
  unfold boundph; intros; apply BP with x z;
  rewrite phplus_comm; assumption.
Qed.

Lemma bph_assoc: 
  forall p1 p2 p3
        (PHPDEF1: phplusdef p1 p2)
        (PHPDEF2: phplusdef p1 p3)
        (PHPDEF3: phplusdef p2 p3),
    boundph (phplus p1 (phplus p2 p3)) <->
    boundph (phplus (phplus p1 p2) p3).
Proof.
  unfold boundph; split; intros;
  apply H with x z;
  try rewrite <- phplus_assoc; try tauto;
  try rewrite phplus_assoc; try tauto.
Qed.

Lemma boundph_emp: 
  boundph (emp knowledge).
Proof.
  unfold boundph; unfold emp; intros; inversion H.
Qed.

Lemma boundph_phplus_upd:
  forall p1 p2 z v
         (BP1: boundph p1)
         (BP2: boundph p2)
         (PHPD: phplusdef p1 p2)
         (BP: boundph (phplus p1 p2))
         (V1: forall f1 v1 (VCELL: v = Some (Cell f1 v1)), 0 < f1 /\ f1 <= 1 )
         (V2: forall f1 f2 (CELL: exists v1 v2 (V1: v = Some (Cell f1 v1)), p2 z = Some (Cell f2 v2)), f1 + f2 <= 1 ),
    boundph (phplus (upd (location_eq_dec Z.eq_dec) p1 z v) p2).
Proof.
  unfold boundph; unfold phplusdef; unfold phplus; unfold upd; intros;
  specialize BP1 with (x:=x); specialize BP2 with (x:=x);
  specialize PHPD with (x:=x); specialize BP with (x:=x).
  destruct ((location_eq_dec Z.eq_dec) x z).
  rewrite e in *.
  destruct v;
  try tauto.
  symmetry in H.
  destruct k;
  inversion H;
  try tauto.
  assert (G1: 0 < f0 /\ f0 <= 1).
  {
  apply V1 with z1.
  reflexivity.
  }
  destruct (p2 z) eqn:p2z.
  destruct k;
  inversion H;
  try tauto.
  assert (G: f0 + f1 <= 1).
  {
  apply V2.
  exists z1, z2.
  exists.
  reflexivity.
  reflexivity.
  }
  assert (G2: 0 < f1 /\ f1 <= 1).
  {
  apply BP2 with z2.
  reflexivity.
  }
  split.
  apply Qc_Lt_plus.
  tauto.
  tauto.
  tauto.
  inversion H.
  tauto.
  destruct (p2 z) eqn:p2z.
  destruct k;
  inversion H;
  try tauto.
  inversion H.
  apply BP2 with z0.
  tauto.
  destruct (p1 x) eqn:p1x.
  destruct k;
  try tauto.
  assert (G: 0 < f0 /\ f0 <= 1).
  {
  apply BP1 with z1.
  reflexivity.
  }
  destruct (p2 x) eqn:p2x.
  destruct k;
  inversion H;
  try tauto.
  assert (G1: 0 < f1 /\ f1 <= 1).
  {
  apply BP2 with z2.
  reflexivity.
  }
  split.
  apply Qc_Lt_plus.
  tauto.
  tauto.
  assert (G2: 0 < f0 + f1 /\ f0 + f1 <= 1).
  {
  apply BP with z1.
  reflexivity.
  }  
  tauto.
  symmetry in H.
  inversion H.
  tauto.
  inversion H.
  destruct (p2 x) eqn:p2x.
  destruct k;
  inversion H;
  try tauto.
  inversion H.
  inversion H.
  inversion H.
  inversion H.
  inversion H.
  apply BP2 with z0.
  assumption.
Qed.

Lemma boundph_upd:
  forall p z v
         (BP: boundph p)
         (BV: forall f, (exists z', v = Some (Cell f z')) -> 0 < f /\ f <= 1),
    boundph (upd (location_eq_dec Z.eq_dec) p z v).
Proof.
  unfold boundph; unfold upd; intros; specialize BP with (x:=x).
  destruct ((location_eq_dec Z.eq_dec) x z).
  rewrite e in *; apply BV; exists z0; try assumption.
  apply BP with z0; assumption.
Qed.

Lemma boundph_updl A m:
  forall (l: list (A * Z)) p z x
         (PHPDL: forall p (IN: In p (map m l)), boundph p)
         (IN: In p (map m (updl l z x)))
         (BP: boundph (m x)),
    boundph p.
Proof.
  unfold updl.
  intros.
  rewrite map_map in IN.
  apply in_map_iff in IN.
  destruct IN as ((x1,x2),(EQ,IN)).
  simpl in *.
  rewrite <- EQ.
  destruct (Z.eq_dec x2 z).
  assumption.
  apply PHPDL.
  apply in_map.
  assumption.
Qed.

Lemma boundph_mon:
  forall p1 p2 p3
         (BP1: boundph p1)
         (BP2: boundph p2)
         (BP3: boundph p3)
         (BP134: boundph (phplus (phplus p1 p2) p3)),
    boundph (phplus p1 p2).
Proof.
  unfold boundph; unfold phplus; intros;
  specialize BP1 with (x:=x); specialize BP2 with (x:=x).
  specialize BP3 with (x:=x); specialize BP134 with (x:=x).
  destruct (p1 x).
  destruct k;
  try tauto.
  assert (G1: 0 < f0 /\ f0 <= 1).
  {
  apply BP1 with z0.
  reflexivity.
  }
  destruct (p2 x).
  destruct k;
  try tauto.
  assert (G2: 0 < f1 /\ f1 <= 1).
  {
  apply BP2 with z1.
  reflexivity.
  }
  destruct (p3 x).
  destruct k;
  try tauto.
  inversion H.
  assert (G3: 0 < f2 /\ f2 <= 1).
  {
  apply BP3 with z2.
  reflexivity.
  }
  assert (G: 0 < f0 + f1 + f2 /\ f0 + f1 + f2 <= 1).
  {
  apply BP134 with z0.
  reflexivity.
  }
  split.
  apply Qc_Lt_plus.
  tauto.
  tauto.
  apply Qc_Le_mon12 with f2.
  rewrite Qcplus_assoc.
  tauto.
  tauto.
  inversion H.
  split.
  apply Qc_Lt_plus.
  tauto.
  tauto.
  assert (G: 0 < f0 + f1 /\ f0 + f1 <= 1).
  {
  apply BP134 with z0.
  reflexivity.
  }
  tauto.
  inversion H.
  assert (G: 0 < f0 + f1 /\ f0 + f1 <= 1).
  {
  apply BP134 with z0.
  reflexivity.
  }
  tauto.
  inversion H.
  assert (G: 0 < f0 + f1 /\ f0 + f1 <= 1).
  {
  apply BP134 with z0.
  reflexivity.
  }
  tauto.
  inversion H.  
  assert (G: 0 < f0 + f1 /\ f0 + f1 <= 1).
  {
  apply BP134 with z0.
  reflexivity.
  }
  tauto.
  inversion H.
  assert (G: 0 < f0 + f1 /\ f0 + f1 <= 1).
  {
  apply BP134 with z0.
  reflexivity.
  }
  tauto.
  inversion H.
  apply BP134 with z0.
  reflexivity.
  inversion H.
  apply BP134 with z0.
  reflexivity.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  rewrite <- H1.
  assumption.
  inversion H.
  destruct (p2 x).
  destruct k;
  inversion H;
  try tauto.
  inversion H.
  inversion H.
  inversion H.
  inversion H.
  inversion H.
  destruct (p2 x).
  destruct k;
  inversion H;
  try tauto.
  inversion H.
  apply BP2 with z.
  assumption.
  inversion H.
Qed.

(** # <font size="5"><b> phtoheap </b></font> # *)

Lemma phtoh_upd_locked:
  forall p1 z wt ot
         (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1)),
    forall h, phtoh (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) h -> phtoh p1 h.
Proof.
  unfold upd.
  intros.
  destruct P1z as (wt1,(ot1,p1z)).
  destruct H as (PH,PH1).
  split.
  intros.
  specialize PH with l.
  destruct ((location_eq_dec Z.eq_dec) l z).
  rewrite e in *; rewrite p1z; tauto.
  assumption.
  intros.
  apply PH1.
  intros.
  destruct ((location_eq_dec Z.eq_dec) l z).
  rewrite e in *.
  apply NONE in EQ.
  rewrite p1z in EQ.
  inversion EQ.
  apply NONE.
  assumption.
Qed. 

Lemma phtoh_upd_locked':
  forall p1 z wt ot
         (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1)),
    forall h, phtoh p1 h -> phtoh (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) h.
Proof.
  unfold phtoh.
  unfold upd.
  intros.
  destruct H as (H,I).
  split.
  intros.
  specialize H with l.
  destruct ((location_eq_dec Z.eq_dec) l z).
  rewrite e in *.
  destruct P1z as (wt1,(ot1,p1z)).
  rewrite p1z in *.
  tauto.
  assumption.
  intros.
  apply I.
  intros.
  apply NONE in EQ.
  destruct ((location_eq_dec Z.eq_dec) l z).
  inversion EQ.
  assumption.
Qed.

(** # <font size="5"><b> can phplus </b></font> # *)

Lemma can_phpdef: can phplusdef phplus.
Proof.
  unfold can.
  split.
  apply phplus_comm.
  split.
  apply phplus_assoc.
  split.
  {
  intros.
  apply phpdef_pair.
  assumption.
  assumption.
  assumption.
  }
  split.
  {
  intros.
  apply phpdef_dist.
  assumption.
  assumption.
  }
  split.
  {
  apply phpdef_comm.
  }
  exists (emp knowledge).
  unfold neutral.
  intros.
  split.
  apply phplus_emp.
  rewrite phplus_comm.
  apply phplus_emp.
  apply phpdef_comm.
  apply phpdef_emp.
Qed.

(** # <font size="5"><b> gheap </b></font> # *)

Lemma boundgh_emp: 
  boundgh (emp (option nat*nat)).
Proof.
  unfold boundgh.
  unfold emp.
  intros.
  inversion H.
Qed.

Lemma boundgh_mon:
  forall g1 g2
         (Bg1g2: boundgh (ghplus g1 g2)),
    boundgh g1.
Proof.
  unfold boundgh.
  unfold ghplus.
  intros.
  specialize Bg1g2 with (x:=x).
  rewrite H in Bg1g2.
  destruct (g2 x) eqn:g2x.
  destruct p.
  unfold lift' in Bg1g2.
  apply le_trans with (plus n n0).
  omega.
  apply Bg1g2.
  reflexivity.
  apply Bg1g2.
  reflexivity.
Qed.

Lemma boundgh_upd:
  forall p z v
         (BP: boundgh p)
         (BV: forall n m, v = Some (Some m, n) -> le n m),
    boundgh (upd Z.eq_dec p z v).
Proof.
  unfold boundgh; unfold upd; intros; specialize BP with (x:=x).
  destruct (Z.eq_dec x z).
  apply BV.
  assumption.
  apply BP.
  assumption.
Qed.

Lemma ghplus_emp:
  forall (g: gheap),
    ghplus g (emp (option nat*nat)) = g.
Proof.
  unfold ghplus.
  intros.
  apply functional_extensionality.
  intros.
  unfold emp.
  destruct (g x) eqn:gx;
  try destruct p;
  reflexivity.
Qed.

Lemma ghpdef_emp g: 
  ghplusdef g (emp (option nat*nat)).
Proof.
  unfold ghplusdef.
  unfold emp.
  intros.
  destruct (g x);
  try destruct p;
  try destruct o;
  trivial.
Qed.

Lemma ghpdef_v:
  forall p1 p2 z v
         (PHPD: ghplusdef p1 p2)
         (P1z: p2 z = None),
    ghplusdef (upd Z.eq_dec p1 z v) p2.
Proof.
  unfold ghplusdef; intros; specialize PHPD with x;
  repeat dstr_.
Qed.

Lemma exc_ghpdef:
  forall p1 p2 o1 o2 n1 n2 z
        (ghpd:ghplusdef p1 p2)
        (p1z: p1 z = Some (o1,n1))
        (p2z: p2 z = Some (o2,n2)),
    exc_op o1 o2.
Proof.
  intros.
  unfold exc_op.
  unfold ghplusdef in ghpd.
  specialize ghpd with z.
  rewrite p1z in ghpd.
  rewrite p2z in ghpd.
  destruct o1.
  destruct o2.
  contradiction.
  right.
  reflexivity.
  left.
  reflexivity.
Qed.

Lemma ghplus_None:
 forall p1 p2 z
        (p1p2z: ghplus p1 p2 z = None),
   p1 z = None.
Proof.
  unfold ghplus.
  intros.
  repeat dstr_;
  inversion p1p2z.
Qed.

Lemma ghplus_None':
 forall p1 p2 z
        (p1p2z: ghplus p1 p2 z = None),
   p2 z = None.
Proof.
  unfold ghplus.
  intros.
  repeat dstr_;
  inversion p1p2z.
Qed.

Lemma ghplus_comm:
  forall g1 g2 (GHPD: ghplusdef g1 g2),
    ghplus g1 g2 = ghplus g2 g1.
Proof.
  unfold ghplusdef; unfold ghplus; intros; apply functional_extensionality;
  intros; specialize GHPD with x; repeat dstr_;
  rewrite plus_comm; try reflexivity.
  unfold lift'; repeat dstr_.
Qed.

Lemma ghpdef_comm:
  forall g1 g2 (GHPD: ghplusdef g1 g2),
    ghplusdef g2 g1.
Proof.
  unfold ghplusdef; intros; specialize GHPD with x; repeat dstr_.
Qed.

Lemma ghpdef_assoc:
  forall g1 g2 g3
         (GHPD1: ghplusdef g1 g2)
         (GHPD2: ghplusdef g1 g3)
         (GHPD3: ghplusdef g2 g3),
    ghplusdef (ghplus g1 g2) g3 <->
    ghplusdef g1 (ghplus g2 g3).
Proof.
  unfold ghplusdef; unfold ghplus; split; intros;
  specialize GHPD1 with x; specialize GHPD2 with x;
  specialize GHPD3 with x; specialize H with x;
  repeat dstr_.
Qed.

Lemma ghpdef_pair:
  forall g1 g2 g3
         (GHPD1: ghplusdef g2 g3)
         (GHPD2: ghplusdef g1 g2)
         (GHPD3: ghplusdef g1 g3),
    ghplusdef g1 (ghplus g2 g3).
Proof.
  unfold ghplusdef; unfold ghplus; intros;
  specialize GHPD1 with x; specialize GHPD2 with x; specialize GHPD3 with x;
  repeat dstr_.
Qed.

Lemma ghpdef_pair':
  forall g1 g2 g3
         (GHPD1: ghplusdef g1 g2)
         (GHPD2: ghplusdef g1 g3)
         (GHPD3: ghplusdef g2 g3),
    ghplusdef (ghplus g1 g2) g3.
Proof.
  unfold ghplusdef; unfold ghplus; intros;
  specialize GHPD1 with x; specialize GHPD2 with x; specialize GHPD3 with x;
  repeat dstr_.
Qed.

Lemma ghplus_assoc:
  forall g1 g2 g3 
         (GHPD1: ghplusdef g1 g2)
         (GHPD2: ghplusdef g1 g3)
         (GHPD3: ghplusdef g2 g3),
    ghplus (ghplus g1 g2) g3 = ghplus g1 (ghplus g2 g3).
Proof.
  unfold ghplusdef; unfold ghplus; intros;
  apply functional_extensionality; intros;
  specialize GHPD1 with x; specialize GHPD2 with x; specialize GHPD3 with x;
  repeat dstr_; rewrite plus_assoc; reflexivity.
Qed.

Lemma ghpdef_dist:
  forall g1 g2 g3
         (GHPD1: ghplusdef (ghplus g1 g2) g3)
         (GHPD2: ghplusdef g1 g2),
    ghplusdef g1 g3 /\ ghplusdef g2 g3.
Proof.
  unfold ghplusdef; unfold ghplus; split; intros;
  specialize GHPD1 with x; specialize GHPD2 with x;
  repeat dstr_.
Qed.

Lemma ghpdef_dist':
  forall g1 g2 g3
         (GHPD1: ghplusdef g1 (ghplus g2 g3))
         (GHPD2: ghplusdef g2 g3),
    ghplusdef g1 g2 /\ ghplusdef g1 g3.
Proof.
  unfold ghplus; unfold ghplusdef; split; intros;
  specialize GHPD1 with x; specialize GHPD2 with x;
  repeat dstr_.
Qed.

Lemma ghpdef_assoc_mon:
  forall g1 g2 g3
         (GHPDEF1: ghplusdef g1 g2)
         (GHPDEF2: ghplusdef (ghplus g1 g2) g3),
    ghplusdef g2 g3.
Proof.
  unfold ghplus; unfold ghplusdef; unfold lift'; intros;
  specialize GHPDEF1 with x; specialize GHPDEF2 with x;
  repeat dstr_.
Qed.

Lemma ghpdef_assoc_mon2:
  forall g1 g2 g3
         (GHPDEF1: ghplusdef g1 g2)
         (GHPDEF2: ghplusdef (ghplus g1 g2) g3),
    ghplusdef g2 g3.
Proof.
  unfold ghplusdef; unfold ghplus; unfold lift'; intros;
  specialize GHPDEF1 with x; specialize GHPDEF2 with x;
  repeat dstr_.
Qed.

Lemma ghplus_upd1:
  forall p1 p2 z v z' (NEQ: z <> z'),
    ghplus (upd Z.eq_dec p1 z v) p2 z' =
    ghplus p1 p2 z'.
Proof.
  intros.
  unfold ghplus.
  unfold upd.
  destruct (Z.eq_dec z' z).
  rewrite e in NEQ.
  contradiction.
  reflexivity.
Qed.

Lemma bgh_comm:
  forall g1 g2 
        (GHPDEF: ghplusdef g1 g2)
        (BG: boundgh (ghplus g1 g2)),
    boundgh (ghplus g2 g1).
Proof.
  unfold boundgh; intros; apply BG with x;
  rewrite ghplus_comm; assumption.
Qed.

Lemma bgh_assoc: 
  forall g1 g2 g3
        (GHPDEF1: ghplusdef g1 g2)
        (GHPDEF2: ghplusdef g1 g3)
        (GHPDEF3: ghplusdef g2 g3),
    boundgh (ghplus g1 (ghplus g2 g3)) <->
    boundgh (ghplus (ghplus g1 g2) g3).
Proof.
  unfold boundgh; split; intros; apply H with x;
  try rewrite <- ghplus_assoc; try assumption;
  try rewrite ghplus_assoc; assumption.
Qed.

Lemma can_ghpdef:
  can ghplusdef ghplus.
Proof.
  unfold can.
  split.
  apply ghplus_comm.
  split.
  apply ghplus_assoc.
  split.
  {
  intros.
  apply ghpdef_pair.
  assumption.
  assumption.
  assumption.
  }
  split.
  {
  intros.
  apply ghpdef_dist.
  assumption.
  assumption.
  }
  split.
  {
  apply ghpdef_comm.
  }
  exists (emp (option nat*nat)).
  unfold neutral.
  intros.
  split.
  apply ghplus_emp.
  rewrite ghplus_comm.
  apply ghplus_emp.
  apply ghpdef_comm.
  apply ghpdef_emp.
Qed.

Ltac cnj_ := 
  repeat match goal with 
          | H: _ /\ _ |- _ => let H1 := fresh H "_1" in let H2 := fresh H "_2" in destruct H as (H1,H2)
         end; trivial.

Ltac php_ := 
  trivial; cnj_; match goal with
        | _: _ |- phplus ?p _ = phplus _ ?p => rewrite phplus_comm
        | _: _ |- phplus _ ?p = phplus ?p _ => rewrite phplus_comm
        | _: _ |- phplus ?p _ = phplus ?p _ => f_equal
        | _: _ |- phplus _ ?p = phplus _ ?p => f_equal
        | _: _ |- phplus (phplus _ _) _ = phplus (phplus _ _) _ => rewrite phplus_assoc
        | _: _ |- phplus (phplus _ _) _ = phplus _ (phplus _ _) => rewrite phplus_assoc
        | _: _ |- phplus _ (phplus _ _) = phplus (phplus _ _) _ => rewrite phplus_assoc


        | _: _ |- phplusdef _ (emp knowledge) => apply phpdef_emp
        | _: _ |- phplusdef (emp knowledge) _ => apply phpdef_comm
        | _: phplusdef ?p1 ?p2 |- phplusdef ?p2 ?p1 => apply phpdef_comm
        | _: phplusdef ?p1 (phplus ?p2 ?p3) |- phplusdef ?p1 ?p2 /\ phplusdef ?p1 ?p3 => apply phpdef_dist'
        | _: phplusdef (phplus ?p1 ?p2) ?p3 |- phplusdef ?p1 ?p3 /\ phplusdef ?p2 ?p3 => apply phpdef_dist
        | _: _ |- phplusdef ?p1 (phplus ?p2 ?p3) => apply phpdef_pair
        | _: _ |- phplusdef (phplus ?p1 ?p2) ?p3 => apply phpdef_pair'


        | _: _ |- boundph (emp knowledge) => apply boundph_emp
        | _: boundph (phplus ?p1 (phplus ?p2 ?p3)) |- boundph (phplus ?p1 ?p2) => apply boundph_mon with p3
        | _: boundph (phplus ?p1 (phplus ?p2 ?p3)) |- boundph (phplus ?p1 ?p3) => apply boundph_mon with p2
        | _: boundph (phplus ?p1 (phplus ?p2 ?p3)) |- boundph (phplus ?p2 ?p3) => apply boundph_mon with p1
        | _: boundph (phplus (phplus ?p1 ?p2) ?p3) |- boundph (phplus ?p1 ?p2) => apply boundph_mon with p3
        | _: boundph (phplus (phplus ?p1 ?p2) ?p3) |- boundph (phplus ?p2 ?p3) => apply boundph_mon with p1
        | _: boundph (phplus (phplus ?p1 ?p2) ?p3) |- boundph (phplus ?p1 ?p3) => apply boundph_mon with p2
        | _: boundph (phplus ?p1 (phplus ?p2 ?p3)) |- boundph (phplus (phplus ?p1 ?p2) ?p3) => rewrite phplus_assoc
        | _: boundph (phplus ?p1 ?p2) |- boundph (phplus ?p2 ?p1) => rewrite phplus_comm

        | [_: _ |- context[phplus _ (emp knowledge)] ] => rewrite phplus_emp
        | [_: _ |- context[phplus (emp knowledge) _] ] => rewrite phplus_comm

        | _: _ |- ghplus ?p _ = ghplus _ ?p => rewrite ghplus_comm
        | _: _ |- ghplus _ ?p = ghplus ?p _ => rewrite ghplus_comm
        | _: _ |- ghplus ?p _ = ghplus ?p _ => f_equal
        | _: _ |- ghplus _ ?p = ghplus _ ?p => f_equal
        | _: _ |- ghplus (ghplus _ _) _ = ghplus (ghplus _ _) _ => rewrite ghplus_assoc
        | _: _ |- ghplus (ghplus _ _) _ = ghplus _ (ghplus _ _) => rewrite ghplus_assoc
        | _: _ |- ghplus _ (ghplus _ _) = ghplus (ghplus _ _) _ => rewrite ghplus_assoc

        | _: _ |- ghplusdef _ (emp (option nat*nat)) => apply ghpdef_emp
        | _: _ |- ghplusdef (emp (option nat*nat)) _ => apply ghpdef_comm
        | _: ghplusdef ?p1 ?p2 |- ghplusdef ?p2 ?p1 => apply ghpdef_comm
        | _: ghplusdef ?p1 (ghplus ?p2 ?p3) |- ghplusdef ?p1 ?p2 /\ ghplusdef ?p1 ?p3 => apply ghpdef_dist'
        | _: ghplusdef (ghplus ?p1 ?p2) ?p3 |- ghplusdef ?p1 ?p3 /\ ghplusdef ?p2 ?p3 => apply ghpdef_dist
        | _: _ |- ghplusdef ?p1 (ghplus ?p2 ?p3) => apply ghpdef_pair
        | _: _ |- ghplusdef (ghplus ?p1 ?p2) ?p3 => apply ghpdef_pair'

        | _: _ |- boundgh (emp (option nat*nat)) => apply boundgh_emp
        | _: boundgh (ghplus ?p1 (ghplus ?p2 ?p3)) |- boundgh (ghplus ?p1 ?p2) => apply boundgh_mon with p3
        | _: boundgh (ghplus ?p1 (ghplus ?p2 ?p3)) |- boundgh (ghplus ?p1 ?p3) => apply boundgh_mon with p2
        | _: boundgh (ghplus ?p1 (ghplus ?p2 ?p3)) |- boundgh (ghplus ?p2 ?p3) => apply boundgh_mon with p1
        | _: boundgh (ghplus (ghplus ?p1 ?p2) ?p3) |- boundgh (ghplus ?p1 ?p2) => apply boundgh_mon with p3
        | _: boundgh (ghplus (ghplus ?p1 ?p2) ?p3) |- boundgh (ghplus ?p2 ?p3) => apply boundgh_mon with p1
        | _: boundgh (ghplus (ghplus ?p1 ?p2) ?p3) |- boundgh (ghplus ?p1 ?p3) => apply boundgh_mon with p2
        | _: boundgh (ghplus ?p1 (ghplus ?p2 ?p3)) |- boundgh (ghplus (ghplus ?p1 ?p2) ?p3) => rewrite ghplus_assoc
        | _: boundgh (ghplus ?p1 ?p2) |- boundgh (ghplus ?p2 ?p1) => rewrite ghplus_comm

        | [_: _ |- context[ghplus _ (emp (option nat*nat))] ] => rewrite ghplus_emp
        | [_: _ |- context[ghplus (emp (option nat*nat)) _] ] => rewrite ghplus_comm

  end; trivial.

(** # <font size="5"><b> sat </b></font> # *)

Theorem sat_mon:
  forall a p O C p' O' O'' C'
         (BP: boundph p)
         (BP': boundph p')
         (PHPDEF: phplusdef p p')
         (BPP': boundph (phplus p p'))
         (BC' : boundgh C')
         (GHPDEF: ghplusdef C C')
         (BCC': boundgh (ghplus C C'))
         (OP: oplus O O' O'')
         (SAT: sat p O C a),
    sat (phplus p p') O'' (ghplus C C') a.
Proof.
  induction a; simpl; intros; try assumption.
  {
  destruct SAT as (S1,S2).
  split.
  apply IHa1 with O O'; try assumption.
  apply IHa2 with O O'; try assumption.
  }
  {
  destruct SAT as [S|S].
  left. apply IHa1 with O O'; try assumption.
  right. apply IHa2 with O O'; try assumption.
  }
  {
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp12,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(bc12,(opO1O2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  subst.
  assert (phpdefp1p'p2p': phplusdef p1 p' /\ phplusdef p2 p'). repeat php_.
  assert (ghpdefp1p'p2p': ghplusdef C1 C' /\ ghplusdef C2 C'). repeat php_.
  assert (eqh: phplus (phplus p2 p') p1 = phplus (phplus p1 p2) p'). rewrite phplus_comm; repeat php_.
  assert (bp2p'p1: boundph (phplus (phplus p2 p') p1)). rewrite eqh; assumption.
  assert (eqg: ghplus (ghplus C2 C') C1 = ghplus (ghplus C1 C2) C'). rewrite ghplus_comm; repeat php_.
  assert (bgp2p'p1: boundgh (ghplus (ghplus C2 C') C1)). rewrite eqg; assumption.

  assert (exoo: exists o2o, oplus o1 o2o O'' /\ oplus o2 O' o2o).
  {
  destruct OP.
  inversion opO1O2.
  exists None.
  split; apply None_op.
  inversion opO1O2.
  exists None.
  split.
  apply fs_op.
  apply Permutation_trans with o; try assumption.
  apply None_op.
  exists (Some o0).
  split.
  apply sn_op.
  apply Permutation_trans with o; try assumption.
  apply fs_op. apply Permutation_refl.
  inversion opO1O2.
  exists (Some o).
  split.
  apply sn_op; assumption.
  apply sn_op. apply Permutation_refl.
  }
  destruct exoo as (o2o,(opo1o2,opo2o')).
  exists p1, (phplus p2 p').
  exists. repeat php_.
  exists. repeat php_.
  exists. apply boundph_mon with p1; repeat php_.
  exists. repeat php_.
  exists o1, o2o, C1, (ghplus C2 C').
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. assumption.
  split. assumption.
  split.
  apply IHa2 with o2 O'; repeat php_.
  split; repeat php_.
  }
  {
  assert (phpdefp0p'0: phplusdef p p'0 /\ phplusdef p' p'0). repeat php_.
  assert (ghpdefp0p'0: ghplusdef C g' /\ ghplusdef C' g'). repeat php_.
  rewrite phplus_assoc; repeat php_.
  rewrite ghplus_assoc; repeat php_.
  assert (exo1: exists O1, oplus O O1 O''0).
  {
  destruct O''.
  inversion OPLUS.
  inversion OP.
  exists None.
  apply fs_op.
  apply Permutation_trans with l; assumption.
  exists (Some o').
  apply sn_op. apply Permutation_refl.
  inversion OP.
  exists O''0.
  destruct O''0.
  apply sn_op. apply Permutation_refl.
  apply None_op.
  }
  destruct exo1 as (O1,o1p).

  apply SAT with O1; repeat php_.
  rewrite phplus_comm; repeat php_.
  rewrite <- phplus_assoc; repeat php_.
  rewrite <- phplus_assoc; repeat php_.
  rewrite ghplus_comm; repeat php_.
  rewrite <- ghplus_assoc; repeat php_.
  rewrite <- ghplus_assoc; repeat php_.

  rewrite phplus_comm; repeat php_.
  rewrite ghplus_comm; repeat php_.

  assert (exo2: exists O2, oplus O'0 O2 O1).
  {
  destruct O''0.
  inversion o1p.
  rewrite <- H in OP.
  inversion OP.
  rewrite <- H4 in OPLUS.
  inversion OPLUS.
  exists None.
  apply None_op.
  destruct O'0.
  exists None.
  apply fs_op.
  inversion OPLUS.
  apply Permutation_trans with l; try assumption.
  apply Permutation_sym; assumption.
  exists (Some o).
  apply sn_op.
  apply Permutation_refl.
  inversion o1p.
  inversion OPLUS.
  exists None.
  apply None_op.
  }
  destruct exo2 as (O2, eqo2).
  apply IHa1 with O'0 O2; repeat php_.
  apply boundph_mon with p; repeat php_.
  rewrite phplus_assoc; repeat php_.
  rewrite phplus_comm; repeat php_.
  replace (phplus p' p) with (phplus p p'); repeat php_.
  apply boundgh_mon with C; repeat php_.
  rewrite ghplus_assoc; repeat php_.
  rewrite ghplus_comm; repeat php_.
  replace (ghplus C' C) with (ghplus C C'); repeat php_.
  }
  {
  destruct SAT as (f',(lef',pl)).
  unfold phplusdef in PHPDEF.
  specialize PHPDEF with (evall a).
  unfold phplus.
  rewrite pl in *.
  destruct (p' (evall a)) eqn:p'a.
  destruct k; try contradiction.
  exists (f'+f).
  exists.
  assert (0 < f).
  {
  eapply BP'.
  apply p'a.
  }
  apply Qc_Lte_plus; assumption.
  rewrite Qcplus_assoc.
  reflexivity.
  exists f', lef'.
  reflexivity.
  }
  {
  unfold phplus.
  rewrite SAT.
  reflexivity.
  }
  {
  apply phplus_lock. assumption.
  }
  {
  unfold phplus.
  rewrite SAT.
  reflexivity.
  }
  {
  unfold phplus.
  rewrite SAT.
  reflexivity.
  }
  {
  unfold phplus.
  rewrite SAT.
  reflexivity.
  }
  {
  unfold phplus.
  rewrite SAT.
  reflexivity.
  }
  {
  inversion SAT.
  rewrite <- H1 in OP.
  inversion OP.
  apply fs_op.
  apply Permutation_trans with o'; assumption.
  }
  {
  destruct SAT as (n,(o,ce)).
  unfold ghplus.
  rewrite ce.
  destruct (C' ([[e]])).
  destruct p0.
  unfold lift'.
  destruct o.
  exists (n+n0)%nat, (Some n1). reflexivity.
  exists (n+n0)%nat, o0. reflexivity.
  exists n, o. reflexivity.
  }
  {
  destruct SAT as (n0,ce).
  unfold ghplus.
  rewrite ce.
  destruct (C' ([[e]])).
  destruct p0.
  exists (n0+n1)%nat. reflexivity.
  exists n0. reflexivity.
  }
  {
  destruct SAT as (v,SAT).
  exists v.
  apply H with O O'; repeat php_.
  }
  {
  intros.
  apply H with O O'; repeat php_.
  }
Qed.

Lemma sat_comm:
  forall a a' p O C
         (SAT: sat p O C (a ** a')),
    sat p O C (a' ** a).
Proof.
  simpl.
  intros.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp1p2,(o1,(o2,(C1,(C2,(ghpdefc1c2,(BC1,(BC2,(bgC1C2,(opo1o2,(bt,(sat2,(p1p2,C1C2)))))))))))))))))).
  exists p2, p1.
  exists. php_.
  exists bp2, bp1.
  exists. repeat php_.

  exists o2, o1, C2, C1.
  exists. php_.
  exists BC2, BC1.
  exists. repeat php_.
  exists. apply oplus_comm. assumption.
  rewrite phplus_comm; repeat php_.
  rewrite ghplus_comm; repeat php_.
  tauto.
Qed.

Lemma sat_assoc:
  forall a1 a2 a3 p O C (BP: boundph p) (BG: boundgh C),
    sat p O C (a1 ** (a2 ** a3)) <->
    sat p O C ((a1 ** a2) ** a3).
Proof.
  simpl.
  split.
  {
  intros.
  destruct H as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp1p2,(o1,(o2,(C1,(C2,(ghpdefc1c2,(BC1,(BC2,(bgC1C2,(opo1o2,(bt,(sat2,(p1p2,C1C2)))))))))))))))))).
  destruct sat2 as (p3,(p4,(phpdefp3p4,(bp3,(bp4,(bp34,(o3,(o4,(C3,(C4,(ghpdefc3c4,(bC3,(bC4,(bgC3C4,(opo3o4,(sat3,(sat4,(p3p4,C3C4)))))))))))))))))).
  subst.

  assert (phpdefp13p14: phplusdef p1 p3 /\ phplusdef p1 p4). repeat php_.
  assert (ghpdefp13p14: ghplusdef C1 C3 /\ ghplusdef C1 C4). repeat php_.

  exists (phplus p1 p3), p4.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.

  assert (opo1o3: exists o1o3, oplus o1 o3 o1o3).
  {
  apply oplus_exists.
  destruct o1.
  inversion opo1o2.
  rewrite <- H1 in opo3o4.
  inversion opo3o4.
  right.
  reflexivity.
  left.
  reflexivity.
  }
  destruct opo1o3 as (o1o3,opo1o3).
  exists o1o3, o4.
  exists (ghplus C1 C3), C4.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists.
  apply oplus_comm.
  apply oplus_assoc with o2 o1 o3.
  apply oplus_comm.
  assumption.
  apply oplus_comm.
  assumption.
  assumption.
  exists.
  exists p1, p3.
  exists; repeat php_.
  exists bp1, bp3.
  exists; repeat php_.
  exists o1, o3, C1, C3.
  exists; repeat php_.
  exists BC1, bC3.
  exists; repeat php_.
  exists opo1o3; tauto.
  split. assumption.
  repeat php_.
  split; repeat php_.
  }
  {
  intros.
  destruct H as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp1p2,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(BC12,(opo1o2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  destruct sat1 as (p3,(p4,(phpdefp3p4,(bp3,(bp4,(bp34,(o3,(o4,(C3,(C4,(ghpdefC3C4,(BC3,(BC4,(BC34,(opo3o4,(sat3,(sat4,(p3p4,C3C4)))))))))))))))))).
  subst.

  assert (phpdefp32p42: phplusdef p3 p2 /\ phplusdef p4 p2). repeat php_.
  assert (ghpdefp32p42: ghplusdef C3 C2 /\ ghplusdef C4 C2). repeat php_.

  exists p3, (phplus p4 p2).
  exists. repeat php_.
  exists. repeat php_.
  exists.  repeat php_. rewrite phplus_comm; repeat php_.
  rewrite <- phplus_assoc; repeat php_.
  exists.
  rewrite <- phplus_assoc; repeat php_.
  assert (opo1o3: exists o4o2, oplus o4 o2 o4o2).
  {
  apply oplus_exists.
  destruct o4.
  inversion opo3o4.
  rewrite <- H0 in opo1o2.
  inversion opo1o2.
  right.
  reflexivity.
  left.
  reflexivity.
  }
  destruct opo1o3 as (o4o2,opo4o2).
  exists o3, o4o2.
  exists C3, (ghplus C4 C2).
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_. rewrite ghplus_comm; repeat php_.
  rewrite <- ghplus_assoc; repeat php_.
  exists.
  rewrite <- ghplus_assoc; repeat php_.
  exists.
  apply oplus_assoc with o1 o2 o4.
  assumption.
  assumption.
  apply oplus_comm.
  assumption.
  split.
  assumption.
  exists.
  exists p4, p2.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists.  repeat php_. rewrite phplus_comm; repeat php_.
  rewrite <- phplus_assoc; repeat php_.
  exists o4, o2, C4, C2.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_. rewrite ghplus_comm; repeat php_.
  rewrite <- ghplus_assoc; repeat php_.
  exists opo4o2.
  tauto.
  split; repeat php_.
  }
Qed.

Lemma sat_assoc_comm:
  forall a1 a2 a3 p O C (BP: boundph p)
         (SAT:sat p O C ((a1 ** a2) ** a3)),
    sat p O C ((a2 ** a1) ** a3).
Proof.
  simpl.
  intros.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp1p2,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(BC12,(opo1o2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  destruct sat1 as (p3,(p4,(phpdefp3p4,(bp3,(bp4,(bp34,(o3,(o4,(C3,(C4,(ghpdefC3C4,(BC3,(BC4,(BC34,(opo3o4,(sat3,(sat4,(p3p4,C3C4)))))))))))))))))).
  exists p1, p2, phpdefp1p2, bp1, bp2, bp1p2, o1, o2, C1, C2, ghpdefC1C2, BC1, BC2, BC12, opo1o2.
  exists.
  exists p4, p3.
  exists; repeat php_.
  exists; repeat php_.
  exists; repeat php_.
  exists; repeat php_.
  exists o4, o3, C4, C3.
  exists; repeat php_.
  exists; repeat php_.
  exists; repeat php_.
  exists; repeat php_.
  exists; repeat php_.
  apply oplus_comm; assumption.
  rewrite phplus_comm; repeat php_.
  rewrite ghplus_comm; repeat php_.
  tauto.
  tauto.
Qed.

Lemma sat_plus:
  forall a1 a2 p1 p2 C1 C2 o1 o2 o (PHPD: phplusdef p1 p2) (BP1: boundph p1) (BP2: boundph p2) (BP12: boundph (phplus p1 p2))
         (GHPD: ghplusdef C1 C2) (BG1: boundgh C1) (BG2: boundgh C2) (BG12: boundgh (ghplus C1 C2)) (opo1o2: oplus o1 o2 o)
         (SAT1: sat p1 o1 C1 a1)
         (SAT2: sat p2 o2 C2 a2),
    sat (phplus p1 p2) o (ghplus C1 C2) (a1 ** a2).
Proof.
  simpl.
  intros.
  exists p1, p2, PHPD, BP1, BP2, BP12, o1, o2, C1, C2, GHPD, BG1, BG2, BG12, opo1o2.
  auto.
Qed.

Lemma sat_star_imp:
  forall b b' a p o C
         (SAT: sat p o C (b ** a))
         (IMP: b |= b'),
    sat p o C (b' ** a).
Proof.
  simpl.
  intros.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp1p2,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(BC12,(opo1o2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  exists p1, p2, phpdefp1p2, bp1, bp2, bp1p2, o1, o2, C1, C2, ghpdefC1C2, BC1, BC2, BC12, opo1o2.
  split.
  apply IMP;
  assumption.
  tauto.
Qed.

Lemma sat_fold_imp:
  forall l p O C b b' (BP: boundph p) (BG: boundgh C)
         (SAT: sat p O C (fold_left Astar l b))
         (IMP: b |= b'),
    sat p O C (fold_left Astar l b').
Proof.
  induction l.
  simpl.
  intros.
  apply IMP;
  assumption.
  simpl.
  intros.
  apply IHl with (b**a);
  try assumption.
  intros.
  apply sat_star_imp with b;
  assumption.
Qed.

Lemma sat_perm:
  forall l l' 
         (Perm: Permutation.Permutation l l') p C b 
         (BP: boundph p) (BG: boundgh C)
         (SAT: sat p None C (fold_left Astar l b)),
    sat p None C (fold_left Astar l' b).
Proof.
  intros l l' Perm.
  induction Perm.
  simpl.
  trivial.
  simpl.
  intros.
  apply IHPerm;
  assumption.
  simpl.
  intros.
  apply sat_fold_imp with ((b ** y) ** x);
  try assumption.
  intros.
  apply sat_comm.
  apply sat_assoc; try assumption.
  apply sat_assoc_comm; try assumption.
  intros.
  apply IHPerm2; try assumption.
  apply IHPerm1; try assumption.
Qed.

Lemma sat_O_perm:
  forall a O O' p C
         (Perm: Permutation.Permutation O O')
         (SAT: sat p (Some O) C a),
    sat p (Some O') C a.
Proof.
  induction a;
  simpl;
  intros;
  try assumption.
  destruct SAT as (SAT1,SAT2).
  split.
  apply IHa1 with O; assumption.
  apply IHa2 with O; assumption.
  destruct SAT as [S|S].
  left.
  apply IHa1 with O; try assumption.
  right.
  apply IHa2 with O; try assumption.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp1p2,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(BC12,(opo1o2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  exists p1, p2, phpdefp1p2, bp1, bp2, bp1p2, o1, o2, C1, C2, ghpdefC1C2, BC1, BC2, BC12.
  exists.
  inversion opo1o2.
  apply fs_op.
  apply Permutation_trans with O; try assumption.
  apply sn_op.
  apply Permutation_trans with O; try assumption.
  auto.
  apply SAT with O'0;
  try assumption.
  inversion OPLUS.
  apply fs_op.
  apply Permutation_trans with O'; try assumption.
  apply fs_op.
  inversion SAT.
  apply Permutation_trans with O; try assumption.
  destruct SAT as (v,sat).
  exists v.
  apply H with O; try assumption.
  apply H with O.
  assumption.
  apply SAT.
Qed.


(** # <font size="5"><b> defl </b></font> # *)

Lemma defl_Notify A m:
   forall (l: list (A * Z)) id id' z p1 pm p' wt ot x1 x2
          (NEQ: id <> id')
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (IN: In (phplus p1 pm,id) (map (fun x => (m x, snd x)) l))
          (phpdefp1pm: phplusdef p1 pm)
          (IN': In (p',id') (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1))
          (X1: (m x1, snd x1) = (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot)), id))
          (X2: (m x2, snd x2) = (phplus p' pm, id')),
     defl phplusdef (map (fun x => (m x, snd x)) (updl (updl l id x1) id' x2)).
Proof.
  intros.
  inversion X1.
  inversion X2.

  assert (phpdefp1mp': phplusdef (phplus p1 pm) p').
  {
  apply DEFL with id id'.
  omega.
  assumption.
  assumption.
  }

  assert (phpdefp1'mp': phplusdef p1 p' /\ phplusdef pm p').
  {
  apply phpdef_dist.
  tauto.
  tauto.
  }

  assert (phpdefp'mp1u: phplusdef (phplus p' pm) (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot)))).
  {
  apply phpdef_comm.
  apply phpdef_locked.
  apply phpdef_pair;
  try tauto.
  apply phpdef_comm.
  tauto.
  assumption.
  }

  assert (phpdefp1up'm: phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) (phplus p' pm)).
  {
  apply phpdef_locked.
  apply phpdef_pair;
  try tauto.
  apply phpdef_comm.
  tauto.
  assumption.
  }

  assert (phpdefp1mx: forall x (INx: In x l) (NEQ: id <> (snd x)), 
    phplusdef (phplus p1 pm) (m x)).
  {
  intros.
  apply DEFL with id (snd x).
  omega.
  assumption.
  apply in_map_iff.
  exists x.
  tauto.
  }

  assert (phpdefp'mx: forall x (INx: In x l) (NEQ1: id <> (snd x)) (NEQ2: id' <> (snd x)), 
    phplusdef (phplus p' pm) (m x)).
  {
  intros.
  apply phpdef_pair';
  try tauto.
  apply phpdef_comm.
  tauto.
  apply DEFL with id' (snd x).
  omega.
  assumption.
  apply in_map_iff.
  exists x.
  tauto.
  apply phpdef_assoc_mon with p1.
  tauto.
  apply phpdefp1mx;
  try tauto.
  }

  assert (phpdefp1ux: forall x (INx: In x l) (NEQ: id <> (snd x)), 
    phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))) (m x)).
  {
  intros.
  apply phpdef_locked.
  apply phpdef_assoc_mon with pm.
  apply phpdef_comm.
  tauto.
  rewrite phplus_comm.
  apply phpdefp1mx;
  try tauto.
  apply phpdef_comm.
  tauto.
  assumption.
  }

  unfold updl.
  rewrite map_map.
  rewrite map_map.
  unfold defl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x3,(EQx1,INx1)).
  inversion EQx1.
  apply in_map_iff in IN2.
  destruct IN2 as (x4,(EQx2,INx2)).
  inversion EQx2.
  destruct (Z.eq_dec (snd x3) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  destruct (Z.eq_dec (snd x4) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  omega.
  destruct (Z.eq_dec (snd x4) (snd x2)).
  rewrite H0, H2.
  assumption.
  rewrite H0.
  apply phpdefp1ux;
  try tauto.
  omega.
  destruct (Z.eq_dec (snd x3) (snd x2)).
  destruct (Z.eq_dec (snd x4) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  rewrite H0, H2.
  apply phpdef_comm.
  tauto.
  destruct (Z.eq_dec (snd x4) (snd x2)).
  omega.
  rewrite H2.
  apply phpdefp'mx;
  try tauto.
  omega.
  omega.
  destruct (Z.eq_dec (snd x4) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  rewrite H0.
  apply phpdef_comm.
  apply phpdefp1ux;
  try tauto.
  omega.
  destruct (Z.eq_dec (snd x4) (snd x2)).
  rewrite H2.
  apply phpdef_comm.
  apply phpdefp'mx;
  try tauto.
  omega.
  omega.
  apply DEFL with (snd x3) (snd x4).
  omega.
  apply in_map_iff.
  exists x3.
  tauto.
  apply in_map_iff.
  exists x4.
  tauto.
Qed.


Lemma deflg_Notify A m:
   forall (l: list (A * Z)) id id' p1 pm p' x1 x2
          (NEQ: id <> id')
          (NODUP: NoDup (map snd l))
          (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
          (IN: In (ghplus p1 pm,id) (map (fun x => (m x, snd x)) l))
          (phpdefp1pm: ghplusdef p1 pm)
          (IN': In (p',id') (map (fun x => (m x, snd x)) l))
          (X1: (m x1, snd x1) = (p1, id))
          (X2: (m x2, snd x2) = (ghplus p' pm, id')),
     defl ghplusdef (map (fun x => (m x, snd x)) (updl (updl l id x1) id' x2)).
Proof.
  intros.
  inversion X1.
  inversion X2.

  assert (phpdefp1mp': ghplusdef (ghplus p1 pm) p').
  {
  apply DEFL with id id'.
  omega.
  assumption.
  assumption.
  }

  assert (phpdefp1'mp': ghplusdef p1 p' /\ ghplusdef pm p').
  {
  apply ghpdef_dist.
  tauto.
  tauto.
  }

  assert (phpdefp1mx: forall x (INx: In x l) (NEQ: id <> (snd x)), 
    ghplusdef (ghplus p1 pm) (m x)).
  {
  intros.
  apply DEFL with id (snd x).
  omega.
  assumption.
  apply in_map_iff.
  exists x.
  tauto.
  }

  assert (phpdefp'mx: forall x (INx: In x l) (NEQ1: id <> (snd x)) (NEQ2: id' <> (snd x)), 
    ghplusdef (ghplus p' pm) (m x)).
  {
  intros.
  apply ghpdef_pair';
  try tauto.
  apply ghpdef_comm.
  tauto.
  apply DEFL with id' (snd x).
  omega.
  assumption.
  apply in_map_iff.
  exists x.
  tauto.
  apply ghpdef_assoc_mon with p1.
  tauto.
  apply phpdefp1mx;
  try tauto.
  }

  assert (phpdefp1ux: forall x (INx: In x l) (NEQ: id <> (snd x)), 
    ghplusdef p1 (m x)).
  {
  intros.
  apply ghpdef_assoc_mon with pm.
  apply ghpdef_comm.
  tauto.
  rewrite ghplus_comm.
  apply phpdefp1mx;
  try tauto.
  apply ghpdef_comm.
  tauto.
  }


  unfold updl.
  rewrite map_map.
  rewrite map_map.
  unfold defl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x3,(EQx1,INx1)).
  inversion EQx1.
  apply in_map_iff in IN2.
  destruct IN2 as (x4,(EQx2,INx2)).
  inversion EQx2.
  destruct (Z.eq_dec (snd x3) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  destruct (Z.eq_dec (snd x4) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  omega.
  destruct (Z.eq_dec (snd x4) (snd x2)).
  rewrite H0, H2.
  apply ghpdef_pair;
  try tauto.
  apply ghpdef_comm.
  tauto.
  rewrite H0.
  apply phpdefp1ux;
  try tauto.
  omega.
  destruct (Z.eq_dec (snd x3) (snd x2)).
  destruct (Z.eq_dec (snd x4) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  rewrite H0, H2.
  apply ghpdef_comm.
  apply ghpdef_pair;
  try tauto.
  apply ghpdef_comm.
  tauto.
  destruct (Z.eq_dec (snd x4) (snd x2)).
  omega.
  rewrite H2.
  apply phpdefp'mx;
  try tauto.
  omega.
  omega.
  destruct (Z.eq_dec (snd x4) (snd x1)).
  destruct (Z.eq_dec (snd x1) (snd x2)).
  omega.
  rewrite H0.
  apply ghpdef_comm.
  apply phpdefp1ux;
  try tauto.
  omega.
  destruct (Z.eq_dec (snd x4) (snd x2)).
  rewrite H2.
  apply ghpdef_comm.
  apply phpdefp'mx;
  try tauto.
  omega.
  omega.
  apply DEFL with (snd x3) (snd x4).
  omega.
  apply in_map_iff.
  exists x3.
  tauto.
  apply in_map_iff.
  exists x4.
  tauto.
Qed.

Lemma defl_NotifyAll A m (m': (A * Z) -> (A * Z)):
   forall (l l': list (A * Z)) id z p wt ot x1
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p z = Some (Locked wt1 ot1))
          (X1: (m x1, snd x1) = (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)), id))
          (M': forall x, (m x, snd x) = (m (m' x), snd (m' x))),
     defl phplusdef (map (fun x => (m x, snd x)) (updl (map m' l) id x1)).
Proof.
  unfold defl in *.
  unfold updl in *.
  intros.
  inversion X1.
  rewrite map_map in *.
  apply in_map_iff in IN1.
  destruct IN1 as (x,(EQx,INx)).
  destruct (Z.eq_dec (snd x) id).
  inversion EQx.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  omega.
  rewrite H0.
  apply phpdef_locked.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff in INx3.
  destruct INx3 as (x4,(EQx4,INx4)).
  apply in_map_iff.
  exists x4.
  rewrite <- EQx4 in EQx3.
  rewrite <- M' in EQx3.
  tauto.
  assumption.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_locked.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff in INx.
  destruct INx as (x4,(EQx4,INx4)).
  apply in_map_iff.
  exists x4.
  rewrite <- EQx4 in EQx.
  rewrite <- M' in EQx.
  tauto.
  assumption.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff in INx.
  destruct INx as (x4,(EQx4,INx4)).
  apply in_map_iff.
  exists x4.
  rewrite <- EQx4 in EQx.
  rewrite <- M' in EQx.
  tauto.
  apply in_map_iff in INx3.
  destruct INx3 as (x4,(EQx4,INx4)).
  apply in_map_iff.
  exists x4.
  rewrite <- EQx4 in EQx3.
  rewrite <- M' in EQx3.
  tauto.
Qed.

Lemma defl_Wait A m:
   forall (l: list (A * Z)) id z p1 p2 x
          (NODUP: NoDup (map snd l))
          (BP2: boundph p2)
          (PHPD: phplusdef p1 p2)
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1) \/ p1 z = Some (Ulock wt1 ot1))
          (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock), id)),
     defl phplusdef (map (fun x => (m x, snd x)) (updl l id x)).
Proof.
  unfold defl in *.
  unfold updl in *.
  intros.
  inversion X.
  rewrite map_map in *.
  apply in_map_iff in IN1.
  destruct IN1 as (x0,(EQx,INx)).
  destruct (Z.eq_dec (snd x0) id).
  inversion EQx.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  omega.
  rewrite H0.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff.
  exists x3.
  tauto.
  apply phpdef_comm.
  assumption.
  assumption.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff.
  exists x0.
  tauto.
  apply phpdef_comm.
  assumption.
  assumption.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x0.
  tauto.
  apply in_map_iff.
  exists x3.
  tauto.
Qed.

Lemma deflg_Wait A m:
   forall (l: list (A * Z)) id C1 C2 x
          (NODUP: NoDup (map snd l))
          (PHPD: ghplusdef C1 C2)
          (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
          (IN: In (ghplus C1 C2,id) (map (fun x => (m x, snd x)) l))
          (X: (m x, snd x) = (C1, id)),
     defl ghplusdef (map (fun x => (m x, snd x)) (updl l id x)).
Proof.
  unfold defl in *.
  unfold updl in *.
  intros.
  inversion X.
  rewrite map_map in *.
  apply in_map_iff in IN1.
  destruct IN1 as (x0,(EQx,INx)).
  destruct (Z.eq_dec (snd x0) id).
  inversion EQx.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  omega.
  rewrite H0.
  apply ghpdef_assoc_mon with C2.
  apply ghpdef_comm.
  assumption.
  rewrite ghplus_comm.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff.
  exists x3.
  tauto.
  apply ghpdef_comm.
  assumption.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  rewrite H0.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with C2.
  apply ghpdef_comm.
  assumption.
  rewrite ghplus_comm.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff.
  exists x0.
  tauto.
  apply ghpdef_comm.
  assumption.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x0.
  tauto.
  apply in_map_iff.
  exists x3.
  tauto.
Qed.

Lemma defl_updl A m:
  forall (l: list (A * Z)) a z
         (PHPD: forall p id (NEQ: z <> id)
                       (IN: In (p, id) (map (fun x => (m x, snd x)) l)),
                  phplusdef p (m (a,z)))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l)),
    defl phplusdef (map (fun x => (m x, snd x)) (updl l z (a, z))).
Proof.
  intros.
  unfold defl in *.
  intros.
  unfold updl in *.
  rewrite map_map in *.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x1) z).
  inversion EQ1.
  destruct (Z.eq_dec (snd x2) z).
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H1.
  apply phpdef_comm.
  apply PHPD with id2.
  omega.
  apply in_map_iff.
  exists x2.
  inversion EQ2.
  tauto.
  destruct (Z.eq_dec (snd x2) z).
  inversion EQ2.
  rewrite <- H1.
  apply PHPD with id1.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  apply in_map_iff.
  exists x2.
  tauto.
Qed.

(** # <font size="5"><b> fold_left </b></font> # *)


Lemma foldg A m:
  forall (l: list (A * Z)) a b
         (BGT: boundgh (fold_left ghplus (map m l) (ghplus b (m a))))
         (NODUP: NoDup (snd a :: map snd l))
         (GHPDL: defl ghplusdef ((m a, snd a) :: map (fun x => (m x, snd x)) l))
         (GHPD: forall g, m a = g \/ In g (map m l) -> ghplusdef g b),
    fold_left ghplus (map m l) (ghplus (m a) b) = 
    ghplus (m a) (fold_left ghplus (map m l) b).
Proof.
  intros.
  apply fold_left_f_m_def with (def:=ghplusdef).
  apply can_ghpdef.
  inversion NODUP.
  assumption.
  unfold defl in *.
  intros.
  apply GHPDL with id1 id2;
  try assumption; try right; try assumption; try right.
  apply GHPD.
  left.
  reflexivity.
  intros.
  split.
  unfold defl in GHPDL.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQ0,IN0)).
  destruct x0 as (a0,id0).
  apply GHPDL with id0 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (a0, id0).
  tauto.
  right.
  apply in_map_iff.
  exists (a0, id0).
  rewrite EQ0.
  tauto.
  left.
  reflexivity.
  apply GHPD.
  right.
  assumption.
Qed.

Lemma foldg' A m:
  forall (l: list (A * Z)) a b
         (BGT: boundgh (fold_left ghplus (map m l) (ghplus b (m a))))
         (NODUP: NoDup (snd a :: map snd l))
         (GHPDL: defl ghplusdef ((m a, snd a) :: map (fun x => (m x, snd x)) l))
         (GHPD: forall g, m a = g \/ In g (map m l) -> ghplusdef g b),
    fold_left ghplus (map m l) (ghplus b (m a)) = 
    ghplus b (fold_left ghplus (map m l) (m a)).
Proof.
  intros.
  apply fold_left_f_m_def with (def:=ghplusdef).
  apply can_ghpdef.
  inversion NODUP.
  assumption.
  unfold defl in *.
  intros.
  apply GHPDL with id1 id2.
  assumption.
  right.
  assumption.
  right.
  assumption.
  apply ghpdef_comm.
  apply GHPD.
  left.
  reflexivity.
  intros.
  split.
  apply GHPD.
  right.
  assumption.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  destruct x1 as (c1,z1).
  apply GHPDL with z1 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (c1,z1).
  tauto.
  right.
  apply in_map_iff.
  exists (c1, z1).
  rewrite EQx1.
  tauto.
  left.
  reflexivity.
Qed.

Lemma ghpdef_fold A m:
  forall (l: list (A * Z)) p b
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (GHPLp: forall p0 (IN: In p0 (map m l)), ghplusdef p0 p)
         (GHPDbp: ghplusdef b p),
    ghplusdef (fold_left ghplus (map m l) b) p.
Proof.
  induction l.
  simpl.
  intros.
  assumption.
  simpl.
  intros.
  apply IHl.
  inversion NODUP.
  assumption.
  unfold defl in *.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply ghpdef_pair.
  apply ghpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply DEFLb.
  right.
  assumption.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  unfold defl in DEFL.
  apply DEFL with z (snd a).
  unfold not.
  intros.
  inversion NODUP.
  apply H2.
  rewrite <- H.
  apply in_map_iff.
  exists (a0,z).
  tauto.
  right.
  apply in_map_iff.
  exists (a0,z).
  rewrite EQx.
  tauto.
  left.
  reflexivity.
  intros.
  apply GHPLp.
  right.
  assumption.
  apply ghpdef_pair'.
  apply ghpdef_comm.
  apply DEFLb.
  tauto.
  tauto.
  apply GHPLp.
  tauto.
Qed.

Lemma foldg_None A m:
  forall (l: list (A * Z)) z b 
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (NONE: fold_left ghplus (map m l) b z = None),
    forall p (IN: In p (map m l) \/ p = b), p z = None.
Proof.
  induction l.
  simpl.
  intros.
  destruct IN as [CO|EQ].
  contradiction.
  rewrite EQ.
  assumption.
  simpl.
  intros.

  assert (NDP1: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }
  assert (DEFL1: defl ghplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl in *.
  intros.
  apply DEFL with id1 id2;
  try assumption.
  right.
  assumption.
  right.
  assumption.
  }
  assert (PHPD1: forall p0, In p0 (map m l) -> ghplusdef p0 b).
  {
  intros.
  apply DEFLb.
  right.
  assumption.
  }
  assert (defmab: ghplusdef (m a) b).
  {
  apply DEFLb.
  left.
  reflexivity.
  }
  assert (defb1: forall x, In x (map m l) -> ghplusdef x (m a) /\ ghplusdef x b).
  {
  intros.
  apply in_map_iff in H.
  destruct H as (x0,(EQx,INx)).
  destruct x0 as (x0,id0).
  rewrite <- EQx in *.
  split.
  apply DEFL with id0 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  }
  assert (phpd2: forall p0, In p0 (map m l) -> ghplusdef p0 (ghplus b (m a))).
  {
  intros.
  apply ghpdef_pair.
  apply ghpdef_comm.
  assumption.
  apply PHPD1.
  assumption.
  apply defb1.
  assumption.
  }

  assert (phpdefmaf: ghplusdef (m a) (fold_left ghplus (map m l) b)).
  {
  apply ghpdef_comm.
  apply ghpdef_fold; repeat php_.
  intros.
  apply defb1.
  assumption.
  }

  destruct IN as [IN|EQ'].
  destruct IN as [EQ|IN].
  rewrite <- EQ.

  rewrite ghplus_comm in NONE.
  rewrite fold_left_f_m_def with (def:=ghplusdef) in NONE; repeat php_.
  apply ghplus_None with (fold_left ghplus (map m l) b).
  assumption.
  apply can_ghpdef.
  apply ghpdef_comm.
  apply DEFLb.
  auto.
  apply IHl with b; try tauto.
  rewrite ghplus_comm in NONE.
  rewrite fold_left_f_m_def with (def:=ghplusdef) in NONE; repeat php_.
  rewrite ghplus_comm in NONE; repeat php_.
  apply ghplus_None with (m a).
  assumption.
  apply can_ghpdef.
  apply ghpdef_comm.
  apply DEFLb.
  auto.
  rewrite EQ'.
  apply IHl with b; try tauto.
  rewrite ghplus_comm in NONE.
  rewrite fold_left_f_m_def with (def:=ghplusdef) in NONE; repeat php_.
  rewrite ghplus_comm in NONE; try tauto.
  apply ghplus_None with (m a).
  assumption.
  apply can_ghpdef.
  apply ghpdef_comm.
  assumption.
Qed.

Lemma foldg_none' A m:
  forall (l: list (A * Z)) z b
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (NONEp: forall p (IN: In p (map m l)), p z = None)
         (NONEb: b z = None),
    fold_left ghplus (map m l) b z = None.
Proof.
  induction l.
  simpl.
  intros.
  assumption.
  simpl.
  intros.
  assert (ND: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }

  assert (DEFL1: defl ghplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  }

  assert (phpdefp0ma: forall p0, In p0 (map m l) -> ghplusdef p0 (m a)).
  {
  intros.
  apply in_map_iff in H.
  destruct H as (x0,(EQ0,IN0)).
  rewrite <- EQ0.
  apply DEFL with (snd x0) (snd a).
  inversion NODUP.
  unfold not.
  intros.
  rewrite <- H3 in H1.
  apply H1.
  apply in_map.
  assumption.
  right.
  apply in_map_iff.
  exists x0.
  auto.
  left.
  reflexivity.
  }

  rewrite fold_left_f_m_def with (def:=ghplusdef); repeat php_.
  unfold ghplus at 1.
  rewrite NONEb.
  rewrite IHl; repeat php_.
  intros.
  apply NONEp.
  auto.
  apply NONEp.
  auto.
  apply can_ghpdef.
  apply ghpdef_comm.
  apply DEFLb.
  auto.
  intros.
  split.
  apply DEFLb.
  auto.
  apply phpdefp0ma.
  assumption.
Qed.

Lemma fold_ctr A m:
  forall (l: list (A * Z)) id x z b v
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (DEFLx: forall p0 id' (NEQ: id <> id') (IN: In (p0,id') (map (fun x => (m x, snd x)) l)), ghplusdef p0 (m x))
         (DEFxb: ghplusdef (m x) b)
         (FN: fold_left ghplus (map m l) b z = None)
         (INx: In id (map snd l))
         (X1: m x z = Some v /\ snd x = id),
    fold_left ghplus (map m (updl l id x)) b z = Some v.
Proof.
  intros.
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).
  destruct x as (x,id').
  simpl in *.
  destruct X1 as (mx,eqid).
  rewrite eqid in *.
  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= m (x,id))(id:=id)(x:=empx); repeat php_.
  rewrite updl_updl.
  {
  unfold ghplus at 1.
  rewrite mx.
  destruct v.
  assert (fzn: fold_left ghplus (map m (updl l id (empx, id))) b z = None).
  {
  apply foldg_none'; repeat php_.
  apply NoDup_updl.
  assumption.
  {
  unfold updl.
  rewrite map_map.
  unfold defl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  destruct (Z.eq_dec id'' id).
  simpl in EQx1.
  inversion EQx1.
  rewrite <- H1.
  rewrite memp; repeat php_.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  rewrite <- H1.
  rewrite memp; repeat php_.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  inversion EQx1.
  rewrite <- H1.
  auto.
  apply in_map_iff.
  exists (x2, id2').
  inversion EQx2.
  rewrite <- H1.
  auto.
  }
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  rewrite <- EQx1.
  destruct (Z.eq_dec id'' id).
  rewrite memp; repeat php_.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  rewrite <- EQx1.
  destruct (Z.eq_dec id'' id).
  rewrite memp. reflexivity.
  apply foldg_None with A m l b; repeat php_.
  left.
  apply in_map.
  assumption.
  }
  apply foldg_None with A m l b; repeat php_.
  right.
  reflexivity.
  }
  rewrite fzn.
  reflexivity.
  }
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.
  {
  unfold updl.
  rewrite map_map.
  unfold defl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  destruct (Z.eq_dec id'' id).
  simpl in EQx1.
  inversion EQx1.
  rewrite <- H1.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  omega.
  inversion EQx2.
  apply ghpdef_comm.
  apply DEFLx with id2.
  omega.
  rewrite <- H3.
  apply in_map_iff.
  exists (x2, id2').
  auto.
  inversion EQx1.
  rewrite <- H1.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  rewrite <- H3.
  apply DEFLx with id''.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  auto.
  simpl in EQx2.
  inversion EQx2.
  apply DEFL with id'' id2.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  auto.
  apply in_map_iff.
  exists (x2, id2').
  rewrite <- H3.
  auto.
  }
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  rewrite <- EQx1.
  destruct (Z.eq_dec id'' id).
  assumption.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in INx.
  destruct INx as (x1,(EQx1,INx1)).
  exists x1.
  destruct (Z.eq_dec (snd x1) id).
  auto.
  omega.
Qed.

Lemma deflg_updl A m:
  forall (l: list (A * Z)) a z
         (PHPD: forall p id (NEQ: z <> id)
                       (IN: In (p, id) (map (fun x => (m x, snd x)) l)),
                  ghplusdef p (m (a,z)))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l)),
    defl ghplusdef (map (fun x => (m x, snd x)) (updl l z (a, z))).
Proof.
  intros.
  unfold defl in *.
  intros.
  unfold updl in *.
  rewrite map_map in *.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x1) z).
  inversion EQ1.
  destruct (Z.eq_dec (snd x2) z).
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H1.
  apply ghpdef_comm.
  apply PHPD with id2.
  omega.
  apply in_map_iff.
  exists x2.
  inversion EQ2.
  tauto.
  destruct (Z.eq_dec (snd x2) z).
  inversion EQ2.
  rewrite <- H1.
  apply PHPD with id1.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  apply in_map_iff.
  exists x2.
  tauto.
Qed.

Lemma eqg_heap A m:
  forall (l: list (A * Z)) id z z' p x b v
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (DEFU: forall p0 id' (NEQ: id <> id') (IN: In (p0,id') (map (fun x => (m x, snd x)) l)), ghplusdef p0 (upd Z.eq_dec p z v))
         (DEFUb: ghplusdef (upd Z.eq_dec p z v) b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (X: m (x,id) = upd Z.eq_dec p z v)
         (NEQ: z <> z'),
    fold_left ghplus (map m (updl l id (x, id))) b z' = fold_left ghplus (map m l) b z'.
Proof.
  intros.
  assert (EXT2:=EXT).
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx,memp).

  assert (Inp: In p (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  assert (phpdefpp12: ghplusdef p b).
  {
  apply DEFLb.
  assumption.
  }  

  assert (deflu: defl ghplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (empx, id)))).
  {
  apply deflg_updl.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  assumption.
  }

  replace (fold_left ghplus (map m l) b) with
    (ghplus p (fold_left ghplus (map m (updl l id (empx, id))) b)); repeat php_.

  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:=upd Z.eq_dec p z v)(id:=id)(x:=empx); repeat php_.
  rewrite updl_updl.
  apply ghplus_upd1; repeat php_.
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.

  unfold defl.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  inversion EQ1.
  destruct (Z.eq_dec (snd x1) id).
  rewrite X.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  inversion EQ2.
  destruct (Z.eq_dec (snd x2) id).
  omega.
  apply ghpdef_comm.
  apply DEFU with (id':=snd x2).
  omega.
  inm_.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  inversion EQ2.
  destruct (Z.eq_dec (snd x2) id).
  rewrite X.
  apply DEFU with (snd x1).
  omega.
  inm_.
  apply DEFL with (snd x1) (snd x2).
  omega.
  inm_.
  inm_.
  repeat php_.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  inversion EQ0.
  destruct (Z.eq_dec (snd x1) id).
  rewrite X.
  apply DEFUb.
  apply DEFLb.
  inm_.
  apply in_map_iff.
  exists (x,id).
  split.
  rewrite X.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ0,IN0)).
  inversion EQ0.
  destruct x1.
  exists a.
  tauto.
  symmetry.
  apply fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat)); repeat php_.
  apply can_ghpdef.
Qed.

Lemma fold_ctr_some A m:
  forall (l: list (A * Z)) x z b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (INx: In x l)
         (X: exists t n, m x z = Some (Some (S t), S n)),
    exists t2 m2, fold_left ghplus (map m l) b z = Some (Some (S t2), S m2).
Proof.
  intros.
  destruct x as (x,id).
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).
  destruct X as (t,(n,mx)).
  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= m (x,id))(id:=id)(x:=empx); repeat php_.
  unfold ghplus at 1.
  rewrite mx.
  destruct ((fold_left ghplus (map m (updl l id (empx, id))) b) z) eqn:fz.
  destruct p.
  unfold lift'.
  exists t, (n+n0)%nat.
  reflexivity.
  exists t, n.
  reflexivity.
  apply can_ghpdef.
  apply in_map_iff.
  exists (x,id).
  auto.
Qed.

Lemma fold_ctr_some' A m:
  forall (l: list (A * Z)) x z b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (INx: In x l)
         (X: exists t n, m x z = Some (Some t, n)),
    exists t2 m2, fold_left ghplus (map m l) b z = Some (Some t2, m2).
Proof.
  intros.
  destruct x as (x,id).
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).
  destruct X as (t,(n,mx)).
  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= m (x,id))(id:=id)(x:=empx); repeat php_.
  unfold ghplus at 1.
  rewrite mx.
  destruct ((fold_left ghplus (map m (updl l id (empx, id))) b) z) eqn:fz.
  destruct p.
  unfold lift'.
  exists t, (n+n0)%nat.
  reflexivity.
  exists t, n.
  reflexivity.
  apply can_ghpdef.
  apply in_map_iff.
  exists (x,id).
  auto.
Qed.

Lemma fold_ctr_dec A m:
  forall (l: list (A * Z)) id x z b C t1 m1 t2 m2
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (DEFxb: ghplusdef (m x) b)
         (fz2: fold_left ghplus (map m l) b z = Some (Some (S t2), (S m2)))
         (INx: In (C,id) (map (fun x => (m x, snd x)) l))
         (Cz: C z = Some (Some (S t1), S m1))
         (X1: m x = upd Z.eq_dec C z (Some (Some t1, m1)) /\ snd x = id),
    fold_left ghplus (map m (updl l id x)) b z = Some (Some t2, m2).
Proof.
  intros.
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).
  destruct X1 as (mx,snx).
  destruct x as (x,id').
  simpl in snx.
  rewrite snx in *.


  assert (on: forall c0 id0 o n (NEQ: id <> id0) 
    (IN: In (c0,id0) (map (fun x => (m x, snd x)) l)) (c0z: c0 z = Some (o,n)),
    o = None).
  {
  intros.
  assert (ghpd: ghplusdef C c0).
  {
  apply DEFL with id id0; try assumption.
  }
  unfold ghplusdef in ghpd.
  specialize ghpd with z.
  rewrite Cz in ghpd.
  rewrite c0z in ghpd.
  destruct o.
  contradiction.
  reflexivity.
  }

  assert (ghpdefcup': forall p' id' (NEQ: id <> id')
    (IN: In (p',id') (map (fun x => (m x, snd x)) l)),
    ghplusdef p' (upd Z.eq_dec C z (Some (Some t1, m1)))).
  {
  unfold ghplusdef.
  unfold upd.
  intros.
  destruct (Z.eq_dec x0 z).
  rewrite e.
  destruct (p' z) eqn:p2gc.
  destruct p.
  apply on with (id0:=id'0) in p2gc.
  rewrite p2gc.
  trivial.
  omega.
  assumption.
  trivial.
  assert (ghpdefcp2: ghplusdef C p').
  {
  apply DEFL with id id'0.
  omega.
  assumption.
  assumption.
  }
  apply ghpdef_comm in ghpdefcp2.
  apply ghpdefcp2.
  }

  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= m (x,id))(id:=id)(x:=empx); repeat php_.
  {
  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= C)(id:=id)(x:=empx) in fz2; repeat php_.
  rewrite updl_updl.
  unfold ghplus at 1 in fz2.
  rewrite Cz in fz2.
  rewrite mx.
  unfold ghplus at 1.
  unfold upd.
  rewrite eqz.
  unfold lift' in *.
  destruct (fold_left ghplus (map m (updl l id (empx, id))) b z).
  destruct p.
  inversion fz2.
  reflexivity.
  inversion fz2.
  reflexivity.
  apply can_ghpdef.
  }
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.
  {
  unfold updl.
  rewrite map_map.
  unfold defl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  destruct (Z.eq_dec id'' id).
  simpl in EQx1.
  inversion EQx1.
  rewrite <- H1.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  omega.
  inversion EQx2.
  rewrite mx.
  apply ghpdef_comm.
  apply ghpdefcup' with id2'.
  omega.
  apply in_map_iff.
  exists (x2, id2').
  rewrite <- H3.
  auto.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  rewrite <- H1.
  rewrite mx.
  apply ghpdefcup' with id''.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  inversion EQx1.
  rewrite <- H3.
  auto.
  inversion EQx1.
  inversion EQx2.
  apply DEFL with id'' id2'.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  rewrite <- H1.
  auto.
  apply in_map_iff.
  exists (x2, id2').
  rewrite <- H3.
  auto.
  }
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  rewrite <- EQx1.
  destruct (Z.eq_dec id'' id).
  assumption.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in INx.
  destruct INx as (x1,(EQx1,INx1)).
  exists x1.
  destruct (Z.eq_dec (snd x1) id).
  auto.
  inversion EQx1.
  contradiction.
Qed.

Lemma fold_ctr_inc A m:
  forall (l: list (A * Z)) id x z b C t1 m1 t2 m2
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (DEFxb: ghplusdef (m x) b)
         (fz2: fold_left ghplus (map m l) b z = Some (Some t2, m2))
         (INx: In (C,id) (map (fun x => (m x, snd x)) l))
         (Cz: C z = Some (Some t1, m1))
         (X1: m x = upd Z.eq_dec C z (Some (Some (S t1), S m1)) /\ snd x = id),
    fold_left ghplus (map m (updl l id x)) b z = Some (Some (S t2), S m2).
Proof.
  intros.
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).
  destruct X1 as (mx,snx).
  destruct x as (x,id').
  simpl in snx.
  rewrite snx in *.


  assert (on: forall c0 id0 o n (NEQ: id <> id0) 
    (IN: In (c0,id0) (map (fun x => (m x, snd x)) l)) (c0z: c0 z = Some (o,n)),
    o = None).
  {
  intros.
  assert (ghpd: ghplusdef C c0).
  {
  apply DEFL with id id0; try assumption.
  }
  unfold ghplusdef in ghpd.
  specialize ghpd with z.
  rewrite Cz in ghpd.
  rewrite c0z in ghpd.
  destruct o.
  contradiction.
  reflexivity.
  }

  assert (ghpdefcup': forall p' id' (NEQ: id <> id')
    (IN: In (p',id') (map (fun x => (m x, snd x)) l)),
    ghplusdef p' (upd Z.eq_dec C z (Some (Some (S t1), S m1)))).
  {
  unfold ghplusdef.
  unfold upd.
  intros.
  destruct (Z.eq_dec x0 z).
  rewrite e.
  destruct (p' z) eqn:p2gc.
  destruct p.
  apply on with (id0:=id'0) in p2gc.
  rewrite p2gc.
  trivial.
  omega.
  assumption.
  trivial.
  assert (ghpdefcp2: ghplusdef C p').
  {
  apply DEFL with id id'0.
  omega.
  assumption.
  assumption.
  }
  apply ghpdef_comm in ghpdefcp2.
  apply ghpdefcp2.
  }

  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= m (x,id))(id:=id)(x:=empx); repeat php_.
  {
  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:= C)(id:=id)(x:=empx) in fz2; repeat php_.
  rewrite updl_updl.
  unfold ghplus at 1 in fz2.
  rewrite Cz in fz2.
  rewrite mx.
  unfold ghplus at 1.
  unfold upd.
  rewrite eqz.
  unfold lift' in *.
  destruct (fold_left ghplus (map m (updl l id (empx, id))) b z).
  destruct p.
  inversion fz2.
  reflexivity.
  inversion fz2.
  reflexivity.
  apply can_ghpdef.
  }
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.
  {
  unfold updl.
  rewrite map_map.
  unfold defl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  destruct (Z.eq_dec id'' id).
  simpl in EQx1.
  inversion EQx1.
  rewrite <- H1.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  omega.
  inversion EQx2.
  rewrite mx.
  apply ghpdef_comm.
  apply ghpdefcup' with id2'.
  omega.
  apply in_map_iff.
  exists (x2, id2').
  rewrite <- H3.
  auto.
  apply in_map_iff in IN2.
  destruct IN2 as ((x2,id2'),(EQx2,INx2)).
  simpl in *.
  destruct (Z.eq_dec id2' id).
  simpl in EQx2.
  inversion EQx2.
  rewrite <- H1.
  rewrite mx.
  apply ghpdefcup' with id''.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  inversion EQx1.
  rewrite <- H3.
  auto.
  inversion EQx1.
  inversion EQx2.
  apply DEFL with id'' id2'.
  omega.
  apply in_map_iff.
  exists (x1, id'').
  rewrite <- H1.
  auto.
  apply in_map_iff.
  exists (x2, id2').
  rewrite <- H3.
  auto.
  }
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as ((x1,id''),(EQx1,INx1)).
  simpl in *.
  rewrite <- EQx1.
  destruct (Z.eq_dec id'' id).
  assumption.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in INx.
  destruct INx as (x1,(EQx1,INx1)).
  exists x1.
  destruct (Z.eq_dec (snd x1) id).
  auto.
  inversion EQx1.
  contradiction.
Qed.

Lemma boundgh_fold0 A m:
  forall (l: list (A * Z)) b g
         (BGT: boundgh (fold_left ghplus (map m l) b))
         (NODUP: NoDup (map snd l))
         (GHPDL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (GHPD: forall g (IN: In g (map m l)), ghplusdef g b)
         (BGT: boundgh (fold_left ghplus (map m l) b))
         (INEQ: In g (map m l) \/ g = b),
    boundgh g.
Proof.
  induction l.
  simpl.
  intros.
  destruct INEQ.
  contradiction.
  rewrite H.
  assumption.
  simpl.
  intros.
  destruct INEQ as [IN|EQ].
  destruct IN as [EQ|IN].
  rewrite <- EQ.
  {
  rewrite ghplus_comm in BGT.
  rewrite foldg in BGT; try tauto.
  apply boundgh_mon with (fold_left ghplus (map m l) b).
  assumption.
  apply ghpdef_comm.
  apply GHPD.
  left.
  reflexivity.
  }
  apply IHl with (ghplus b (m a));
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl in *.
  intros.
  apply GHPDL with id1 id2.
  assumption.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply ghpdef_pair.
  apply ghpdef_comm.
  apply GHPD.
  left.
  reflexivity.
  apply GHPD.
  right.
  assumption.
  unfold defl in GHPDL.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQx,INx)).
  destruct x as (a1,z1).
  apply GHPDL with z1 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (a1, z1).
  tauto.
  right.
  apply in_map_iff.
  exists (a1, z1).
  rewrite EQx.
  tauto.
  left.
  reflexivity.
  rewrite EQ.
  rewrite foldg' in BGT; try tauto.
  apply boundgh_mon with (fold_left ghplus (map m l) (m a)).
  assumption.
Qed.

Lemma boundgh_fold A m:
  forall (l: list (A * Z)) b p
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (BGT: boundgh (fold_left ghplus (map m l) b))
         (IN: In p (map m l)),
    boundgh (ghplus b p).
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.

  assert (NOD: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }
  assert (defl2: defl ghplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl in *.
  intros.
  apply DEFL with id1 id2.
  assumption.
  right.
  assumption.
  right.
  assumption.
  }
  assert (ghpdefbma: ghplusdef b (m a)).
  {
  apply ghpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  }

  destruct IN as [EQ|IN].
  rewrite <- EQ.
  {
  replace (ghplus b (m a)) with (ghplus (ghplus b (m a)) (emp (option nat*nat))) in BGT.
  rewrite fold_left_f_m_def with (def:=ghplusdef) in BGT;
  try assumption.
  apply boundgh_mon with (fold_left ghplus (map m l) (emp (option nat * nat))).
  assumption.
  apply can_ghpdef.
  apply ghpdef_emp.
  intros.
  split.
  apply ghpdef_pair.
  apply ghpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply DEFLb.
  right.
  assumption.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQ0,IN0)).
  destruct x0 as (a0,id0).
  apply DEFL with id0 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (a0, id0).
  tauto.
  right.
  apply in_map_iff.
  exists (a0, id0).
  rewrite EQ0.
  tauto.
  left.
  reflexivity.
  apply ghpdef_emp.
  apply ghplus_emp.
  }
  apply IHl;
  try assumption.
  inversion NODUP.
  intros.
  apply DEFLb.
  right.
  assumption.
  rewrite ghplus_comm in BGT.
  rewrite fold_left_f_m_def with (def:=ghplusdef) in BGT;
  try assumption.
  rewrite ghplus_comm in BGT.
  apply boundgh_mon with (m a).
  assumption.
  apply ghpdef_comm.
  {
  apply ghpdef_fold;
  try tauto.
  intros.
  apply DEFLb.
  tauto.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQx,INx)).
  destruct x as (a1,z1).
  apply DEFL with z1 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (a1, z1).
  tauto.
  right.
  apply in_map_iff.
  exists (a1, z1).
  rewrite EQx.
  tauto.
  left.
  reflexivity.
  }
  apply can_ghpdef.
  apply ghpdef_comm.
  assumption.
  intros.
  split.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx1,INx1)).
  destruct x1 as (a1,z1).
  apply DEFL with z1 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (a1, z1).
  tauto.
  right.
  apply in_map_iff.
  exists (a1, z1).
  rewrite EQx1.
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  assumption.
  assumption.
Qed.

Lemma phpdef_fold A m:
  forall (l: list (A * Z)) p b
         (NODUP: NoDup (map snd l))
         (PHPDL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (PHPLp: forall p0 (IN: In p0 (map m l)), phplusdef p0 p)
         (PHPDbp: phplusdef b p),
    phplusdef (fold_left phplus (map m l) b) p.
Proof.
  induction l.
  simpl.
  intros.
  assumption.
  simpl.
  intros.
  apply IHl.
  inversion NODUP.
  assumption.
  unfold defl in *.
  intros.
  apply PHPDL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply DEFLb.
  right.
  assumption.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  unfold defl in PHPDL.
  apply PHPDL with z (snd a).
  unfold not.
  intros.
  inversion NODUP.
  apply H2.
  rewrite <- H.
  apply in_map_iff.
  exists (a0,z).
  tauto.
  right.
  apply in_map_iff.
  exists (a0,z).
  rewrite EQx.
  tauto.
  left.
  reflexivity.
  intros.
  apply PHPLp.
  right.
  assumption.
  apply phpdef_pair'.
  apply phpdef_comm.
  apply DEFLb.
  tauto.
  tauto.
  apply PHPLp.
  tauto.
Qed.

Lemma fold_None A m:
  forall (l: list (A * Z)) z b 
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (NONE: fold_left phplus (map m l) b z = None),
    forall p (IN: In p (map m l) \/ p = b), p z = None.
Proof.
  induction l.
  simpl.
  intros.
  destruct IN as [CO|EQ].
  contradiction.
  rewrite EQ.
  assumption.
  simpl.
  intros.

  assert (NDP1: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }
  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl in *.
  intros.
  apply DEFL with id1 id2;
  try assumption.
  right.
  assumption.
  right.
  assumption.
  }
  assert (PHPD1: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 b).
  {
  intros.
  apply DEFLb.
  right.
  assumption.
  }
  assert (defmab: phplusdef (m a) b).
  {
  apply DEFLb.
  left.
  reflexivity.
  }
  assert (defb1: forall x : pheap, In x (map m l) -> phplusdef x (m a) /\ phplusdef x b).
  {
  intros.
  apply in_map_iff in H.
  destruct H as (x0,(EQx,INx)).
  destruct x0 as (x0,id0).
  rewrite <- EQx in *.
  split.
  apply DEFL with id0 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  }
  assert (phpd2: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 (phplus b (m a))).
  {
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  assumption.
  apply PHPD1.
  assumption.
  apply defb1.
  assumption.
  }

  assert (phpdefmaf: phplusdef (m a) (fold_left phplus (map m l) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold; try tauto.
  intros.
  apply defb1.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  destruct IN as [IN|EQ'].
  destruct IN as [EQ|IN].
  rewrite <- EQ.

  rewrite phplus_comm in NONE.
  rewrite fold_left_f_m_def with (def:=phplusdef) in NONE; try tauto.
  apply phplus_None with (fold_left phplus (map m l) b).
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  apply DEFLb.
  auto.
  apply IHl with b; try tauto.
  rewrite phplus_comm in NONE.
  rewrite fold_left_f_m_def with (def:=phplusdef) in NONE; try tauto.
  rewrite phplus_comm in NONE; try tauto.
  apply phplus_None with (m a).
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  apply DEFLb.
  auto.
  rewrite EQ'.
  apply IHl with b; try tauto.
  rewrite phplus_comm in NONE.
  rewrite fold_left_f_m_def with (def:=phplusdef) in NONE; try tauto.
  rewrite phplus_comm in NONE; try tauto.
  apply phplus_None with (m a).
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  assumption.
Qed.

Lemma fold_none' A m:
  forall (l: list (A * Z)) z b
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (NONEp: forall p (IN: In p (map m l)), p z = None)
         (NONEb: b z = None),
    fold_left phplus (map m l) b z = None.
Proof.
  induction l.
  simpl.
  intros.
  assumption.
  simpl.
  intros.
  assert (ND: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }

  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  }

  assert (phpdefp0ma: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 (m a)).
  {
  intros.
  apply in_map_iff in H.
  destruct H as (x0,(EQ0,IN0)).
  rewrite <- EQ0.
  apply DEFL with (snd x0) (snd a).
  inversion NODUP.
  unfold not.
  intros.
  rewrite <- H3 in H1.
  apply H1.
  apply in_map.
  assumption.
  right.
  apply in_map_iff.
  exists x0.
  auto.
  left.
  reflexivity.
  }

  rewrite fold_left_f_m_def with (def:=phplusdef); repeat php_.
  unfold phplus at 1.
  rewrite NONEb.
  rewrite IHl; repeat php_.
  intros.
  apply NONEp.
  auto.
  apply NONEp.
  auto.
  apply can_phpdef.
  apply phpdef_comm.
  apply DEFLb.
  auto.
  intros.
  split.
  apply DEFLb.
  auto.
  apply phpdefp0ma.
  assumption.
Qed.

Lemma fold_left_upd_Notify_1 A m:
   forall (l: list (A * Z)) id z p b wt ot x1
          (EXT: forall z p, exists x, m (x, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p z = Some (Locked wt1 ot1))
          (X1: (m x1, snd x1) = (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)), id)),
      fold_left phplus (map m (updl l id x1)) b = 
        upd (location_eq_dec Z.eq_dec) (fold_left phplus (map m l) b) z (Some (Locked wt ot)).
Proof.
  intros.
  inversion X1.
  destruct x1.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)))(id:=z0)(x:=empx).
  {
  rewrite updl_updl.
  replace (fold_left phplus (map m l) b) with
    (phplus p (fold_left phplus (map m (updl l z0 (empx,z0))) b)).
  {
  apply phplus_upd.
  unfold not.
  intros CO.
  destruct CO as (v,(f,(v',(f',(CO,rest))))).
  inversion CO.
  intros CO.
  inversion CO.
  intros CO.
  inversion CO.
  }
  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge).
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  simpl in H1.
  rewrite H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_locked.
  unfold defl in DEFL.
  apply DEFL with id id0.
  simpl in H1.
  omega.
  assumption.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  simpl in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) z0).
  rewrite <- EQ0.
  rewrite H0.
  apply phpdef_locked.
  apply DEFLb.
  apply in_map_iff in IN.
  destruct IN as (x1,(EXx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EXx.
  tauto.
  assumption.
  rewrite <- EQ0.
  apply DEFLb.
  apply in_map.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  split.
  inversion X1.
  tauto.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EXx,INx)).
  destruct x1.
  exists a0.
  rewrite H1.
  inversion EXx.
  rewrite <- H3.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma fold_locked A m:
  forall (l: list (A * Z)) wt ot z b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some (Locked wt ot) \/ exists p (IN: In p (map m l)), p z = Some (Locked wt ot)),
    (fold_left phplus (map m l) b) z = Some (Locked wt ot).
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  {
  replace b with (phplus b (emp knowledge)).
  rewrite fold_left_f_m_def with (def:=phplusdef).
  unfold phplus.
  rewrite p1z.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  apply DEFLb.
  assumption.
  apply phpdef_emp.
  apply phplus_emp.
  }
  {
  destruct p1z as (p, (INp, EQp)).
  assert (INp2:=INp).
  apply in_map_iff in INp2.
  destruct INp2 as (x, (EXx, INx)).
  destruct x.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=z0)(x:=empx).
  unfold phplus.
  rewrite EQp.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  simpl.
  rewrite EXx.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
Qed.

Lemma fold_ulock A m:
  forall (l: list (A * Z)) wt ot z b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some (Ulock wt ot) \/ exists p (IN: In p (map m l)), p z = Some (Ulock wt ot)),
    (fold_left phplus (map m l) b) z = Some (Ulock wt ot).
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  {
  replace b with (phplus b (emp knowledge)).
  rewrite fold_left_f_m_def with (def:=phplusdef).
  unfold phplus.
  rewrite p1z.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  apply DEFLb.
  assumption.
  apply phpdef_emp.
  apply phplus_emp.
  }
  {
  destruct p1z as (p, (INp, EQp)).
  assert (INp2:=INp).
  apply in_map_iff in INp2.
  destruct INp2 as (x, (EXx, INx)).
  destruct x.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=z0)(x:=empx).
  unfold phplus.
  rewrite EQp.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  simpl.
  rewrite EXx.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
Qed.

Lemma cond_finlc A m:
  forall (l: list (A * Z)) id z p x b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (P1z: p z = Some Icond)
         (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) p z (Some Cond), id)),
     fold_left phplus (map m (updl l id x)) b z = Some Cond.
Proof.
  intros.
  destruct x.
  inversion X.
  rewrite H1 in *.
  subst.

  assert (IN1:=IN).
  apply in_map_iff in IN1.
  destruct IN1 as (x12,(EQx,INx)).
  assert (EXTE:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (x2, mx2).

  assert (DEFL2: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (x2, id)))).
  {
  unfold defl.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H2.
  rewrite mx2.
  repeat php_.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H4.
  rewrite mx2.
  repeat php_.
  inversion EQ2.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  rewrite <- H2.
  exists x1. auto.
  apply in_map_iff.
  rewrite <- H4.
  exists x3. auto.
  }

  assert (INP: In p (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x,(EQx1,INx1)).
  apply in_map_iff.
  exists x.
  inversion EQx1.
  auto.
  }

  assert (PHPD1: phplusdef (fold_left phplus (map m (updl l id (x2, id))) b) p).
  {
  apply phpdef_fold; repeat php_.
  apply NoDup_updl.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQa,INa)).
  destruct (Z.eq_dec (snd x) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFLb.
  apply in_map.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQa,INa)).
  destruct (Z.eq_dec (snd x) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFL with (snd x) id.
  omega.
  apply in_map_iff.
  exists x.
  auto.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (EQH2: fold_left phplus (map m (updl l id (x2, id))) b z = None).
  {
  apply phpdef_comm in PHPD1.
  unfold phplusdef in PHPD1.
  specialize PHPD1 with z.
  rewrite P1z in PHPD1.
  destruct (fold_left phplus (map m (updl l id (x2, id))) b z).
  contradiction.
  reflexivity.
  }

  assert (PHPD0: forall p0, In p0 (map m (updl l id (x2, id))) -> phplusdef p0 b).
  {
  intros p0 IN0.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQa,INa)).
  destruct (Z.eq_dec (snd x) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  assert (NONE1: forall p (IN: In p (map m (updl l id (x2, id))) \/ p = b), p z = None).
  {
  apply fold_None; repeat php_.
  apply NoDup_updl.
  assumption.
  }

  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (a, id)))).
  {
  unfold defl.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H2.
  rewrite H0.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) (m x3)).
  {
  apply phpdef_none.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff.
  rewrite <- H4.
  exists x3.
  auto.
  }
  apply phpdef_v.
  apply DEFL with id id2.
  omega.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  auto.
  apply in_map_iff.
  exists x3.
  inversion EQ2.
  auto.
  apply NONE1.
  left.
  apply in_map.
  destruct x3.
  apply in_updl_neq.
  simpl in H4.
  omega.
  assumption.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H4.
  rewrite H0.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) (m x1)).
  {
  apply phpdef_none.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff.
  rewrite <- H2.
  exists x1.
  auto.
  }
  apply phpdef_comm.
  apply phpdef_v.
  apply DEFL with id id1.
  omega.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  auto.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  auto.
  apply NONE1.
  left.
  apply in_map.
  destruct x1.
  apply in_updl_neq.
  simpl in n.
  omega.
  assumption.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x1.
  rewrite <- H2.
  auto.
  apply in_map_iff.
  exists x3.
  auto.
  }

  assert (PHPDB: forall x : pheap, In x (map m (updl l id (a, id))) -> phplusdef x b).
  {
  intros x IN1.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite H0.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) b).
  {
  apply phpdef_none.
  apply DEFLb.
  assumption.
  }
  apply phpdef_v.
  apply DEFLb.
  assumption.
  apply NONE1.
  right.
  reflexivity.
  apply DEFLb.
  rewrite <- EQ1.
  apply in_map.
  assumption.
  }

  assert (EQH1: fold_left phplus (map m (updl l id (a, id))) b =
    phplus (upd (location_eq_dec Z.eq_dec) p z (Some Cond))
    (fold_left phplus (map m (updl (updl l id (a, id)) id (x2,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); repeat php_.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx1,INx1)).
  exists x.
  inversion EQx1.
  rewrite eqz.
  rewrite H2.
  rewrite H1.
  rewrite H0.
  auto.
  }

  rewrite updl_updl in EQH1.

  assert (UPDcond:upd (location_eq_dec Z.eq_dec) p z (Some Cond) z = Some Cond).
  {
  unfold upd.
  destruct (location_eq_dec Z.eq_dec z z).
  reflexivity.
  contradiction.
  }

  rewrite EQH1.
  unfold phplus at 1.
  rewrite UPDcond.
  reflexivity.
Qed.

Lemma fold_icond A m:
  forall (l: list (A * Z)) z b 
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some Icond \/ exists p (IN: In p (map m l)), p z = Some Icond),
    (fold_left phplus (map m l) b) z = Some Icond.
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  {
  replace b with (phplus b (emp knowledge)).
  rewrite fold_left_f_m_def with (def:=phplusdef).
  unfold phplus.
  rewrite p1z.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  apply DEFLb.
  assumption.
  apply phpdef_emp.
  apply phplus_emp.
  }
  {
  destruct p1z as (p, (INp, EQp)).
  assert (INp2:=INp).
  apply in_map_iff in INp2.
  destruct INp2 as (x, (EXx, INx)).
  destruct x.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=z0)(x:=empx).
  unfold phplus.
  rewrite EQp.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  simpl.
  rewrite EXx.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
Qed.

Lemma fold_cond A m:
  forall (l: list (A * Z)) z b 
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some Cond \/ exists p (IN: In p (map m l)), p z = Some Cond),
    (fold_left phplus (map m l) b) z = Some Cond.
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  {
  replace b with (phplus b (emp knowledge)).
  rewrite fold_left_f_m_def with (def:=phplusdef).
  unfold phplus.
  rewrite p1z.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  apply DEFLb.
  assumption.
  apply phpdef_emp.
  apply phplus_emp.
  }
  {
  destruct p1z as (p, (INp, EQp)).
  assert (INp2:=INp).
  apply in_map_iff in INp2.
  destruct INp2 as (x, (EXx, INx)).
  destruct x.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=z0)(x:=empx).
  unfold phplus.
  rewrite EQp.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  simpl.
  rewrite EXx.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
Qed.

Lemma fold_ucond A m:
  forall (l: list (A * Z)) z b 
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some Ucond \/ exists p (IN: In p (map m l)), p z = Some Ucond),
    (fold_left phplus (map m l) b) z = Some Ucond.
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  {
  replace b with (phplus b (emp knowledge)).
  rewrite fold_left_f_m_def with (def:=phplusdef).
  unfold phplus.
  rewrite p1z.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  apply DEFLb.
  assumption.
  apply phpdef_emp.
  apply phplus_emp.
  }
  {
  destruct p1z as (p, (INp, EQp)).
  assert (INp2:=INp).
  apply in_map_iff in INp2.
  destruct INp2 as (x, (EXx, INx)).
  destruct x.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=z0)(x:=empx).
  unfold phplus.
  rewrite EQp.
  reflexivity.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  simpl.
  rewrite EXx.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
Qed.

Lemma phplus_Ucond:
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P1v: p1 z = Some Ucond),
    phplus p1 p2 z = Some Ucond.
Proof.
  unfold phplus; unfold phplusdef; intros; specialize PHPD with z;
  rewrite P1v in *; reflexivity.
Qed.

Lemma phplus_Ucond':
  forall p1 p2 z
         (PHPD: phplusdef p1 p2)
         (P2v: p2 z = Some Ucond),
    phplus p1 p2 z = Some Ucond.
Proof.
  unfold phplus; unfold phplusdef; intros;
  specialize PHPD with z; rewrite P2v in *; repeat dstr_.
Qed.

Lemma phplus_cell:
  forall p1 p2 f1 f2 z v
         (p1z: p1 z = Some (Cell f1 v))
         (p2z: p2 z = Some (Cell f2 v)),
    phplus p1 p2 z = Some (Cell (f1+f2) v).
Proof.
  unfold phplus.
  intros.
  rewrite p1z.
  rewrite p2z.
  reflexivity.
Qed.

Lemma phplus_none_cell:
  forall p1 p2 f z v
         (p1z: p1 z = None)
         (p2z: p2 z = Some (Cell f v)),
    phplus p1 p2 z = Some (Cell f v).
Proof.
  unfold phplus.
  intros.
  rewrite p1z.
  rewrite p2z.
  reflexivity.
Qed.

Lemma fold_cell A m:
  forall (l: list (A * Z)) z b v
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: exists f, b z = Some (Cell f v) \/ exists p (IN: In p (map m l)), p z = Some (Cell f v)),
    exists f, (fold_left phplus (map m l) b) z = Some (Cell f v).
Proof.
  induction l.
  simpl.
  intros.
  destruct P1z as (f,p1z).
  destruct p1z as [p1z|p1z].
  exists f.
  assumption.
  destruct p1z as (p,(fal,pz)).
  contradiction.
  simpl.
  intros.

  assert (NDP1: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }
  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl in *.
  intros.
  apply DEFL with id1 id2;
  try assumption.
  right.
  assumption.
  right.
  assumption.
  }
  assert (PHPD1: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 b).
  {
  intros.
  apply DEFLb.
  right.
  assumption.
  }
  assert (defmab: phplusdef (m a) b).
  {
  apply DEFLb.
  left.
  reflexivity.
  }
  assert (defb1: forall x : pheap, In x (map m l) -> phplusdef x (m a) /\ phplusdef x b).
  {
  intros.
  apply in_map_iff in H.
  destruct H as (x0,(EQx,INx)).
  destruct x0 as (x0,id0).
  rewrite <- EQx in *.
  split.
  apply DEFL with id0 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  }
  assert (phpd2: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 (phplus b (m a))).
  {
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  assumption.
  apply PHPD1.
  assumption.
  apply defb1.
  assumption.
  }

  destruct P1z as (f,p1z).
  destruct p1z as [p1z|p1z].
  rewrite phplus_comm.
  rewrite fold_left_f_m_def with (def:=phplusdef);
  try assumption.
  assert (G: exists f : Qc, fold_left phplus (map m l) b z = Some (Cell f v)).
  {
  apply IHl;
  try assumption.
  exists f.
  left.
  assumption.
  }
  destruct G as (f1,foldlz).
  destruct ((m a) z) eqn:maz.
  assert (PHPD: phplusdef (m a) b).
  {
  apply DEFLb.
  left.
  reflexivity.
  }
  unfold phplusdef in PHPD.
  specialize PHPD with z.
  rewrite maz in PHPD.
  rewrite p1z in PHPD.
  destruct k;
  try contradiction.
  exists (f0+f1).
  rewrite PHPD in *.
  apply phplus_cell;
  assumption.
  exists f1.
  apply phplus_none_cell;
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  assumption.
  apply IHl;
  try assumption.
  destruct p1z as (p,(map,p1z)).
  destruct map.
  rewrite H.
  assert (PHPD: phplusdef p b).
  {
  apply DEFLb.
  left.
  assumption.
  }
  unfold phplusdef in PHPD.
  specialize PHPD with z.
  rewrite p1z in PHPD.
  destruct (b z) eqn:bz.
  destruct k;
  try contradiction.
  rewrite PHPD in *.
  exists (f0+f).
  left.
  apply phplus_cell;
  assumption.
  exists f.
  left.
  apply phplus_none_cell;
  assumption.
  exists f.
  right.
  exists p, H.
  assumption.
Qed.

Lemma fold_cell_full A m:
  forall (l: list (A * Z)) z b v p' id'
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (INP1: In (p',id') (map (fun x => (m x, snd x)) l))
         (P1z: p' z = Some (Cell full v))
         (NONE: forall p id (NEQ: id' <> id) (IN: In (p,id) (map (fun x => (m x, snd x)) l)), p z = None)
         (NONEb: b z = None)
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b),
    fold_left phplus (map m l) b z = Some (Cell full v).
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.

  assert (NDP1: NoDup (map snd l)).
  {
  inversion NODUP.
  assumption.
  }
  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) l)).
  {
  unfold defl in *.
  intros.
  apply DEFL with id1 id2;
  try assumption.
  right.
  assumption.
  right.
  assumption.
  }
  assert (PHPD1: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 b).
  {
  intros.
  apply DEFLb.
  right.
  assumption.
  }
  assert (defmab: phplusdef (m a) b).
  {
  apply DEFLb.
  left.
  reflexivity.
  }
  assert (defb1: forall x : pheap, In x (map m l) -> phplusdef x (m a) /\ phplusdef x b).
  {
  intros.
  apply in_map_iff in H.
  destruct H as (x0,(EQx,INx)).
  destruct x0 as (x0,id0).
  rewrite <- EQx in *.
  split.
  apply DEFL with id0 (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  apply in_map_iff.
  exists (x0, id0).
  tauto.
  }
  assert (phpd2: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 (phplus b (m a))).
  {
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  assumption.
  apply PHPD1.
  assumption.
  apply defb1.
  assumption.
  }
  rewrite phplus_comm.
  rewrite fold_left_f_m_def with (def:=phplusdef);
  try assumption.
  destruct INP1 as [EQ1|IN1].
  inversion EQ1.
  rewrite H0.
  unfold phplus at 1.
  rewrite P1z.
  rewrite fold_none'; repeat php_.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  apply NONE with (snd x).
  unfold not.
  intros.
  rewrite H1 in NODUP.
  rewrite H in NODUP.
  inversion NODUP.
  apply H4.
  apply in_map. assumption.
  right.
  rewrite <- EQx.
  apply in_map_iff.
  exists x. auto.

  assert (foldlz: fold_left phplus (map m l) b z = Some (Cell full v)).
  {
  apply IHl with p' id';
  try assumption.
  intros.
  apply NONE with id.
  assumption.
  right. assumption.
  }
  {
  unfold phplus at 1.
  erewrite NONE with (id:=snd a); repeat php_.
  unfold not.
  intros.
  rewrite <- H in NODUP.
  inversion NODUP.
  apply H2.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1. auto.
  left. reflexivity.
  }
  apply can_phpdef.
  repeat php_.
Qed.

Lemma cond_initc A m:
  forall (l: list (A * Z)) id z z' p x b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (P1z: p z = Some Ucond)
         (PzN: z <> z' -> fold_left phplus (map m l) b z' = None)
         (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p z None) z' (Some Icond), id)),
     (z' <> z -> fold_left phplus (map m (updl l id x)) b z = None) /\
     fold_left phplus (map m (updl l id x)) b z' = Some Icond.
Proof.
  intros.
  destruct x.
  inversion X.
  rewrite H1 in *.
  subst.

  assert (IN1:=IN).
  apply in_map_iff in IN1.
  destruct IN1 as (x12,(EQx,INx)).
  assert (EXTE:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (x2, mx2).

  assert (DEFL2: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (x2, id)))).
  {
  unfold defl.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H2.
  rewrite mx2.
  repeat php_.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H4.
  rewrite mx2.
  repeat php_.
  inversion EQ2.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  rewrite <- H2.
  exists x1. auto.
  apply in_map_iff.
  rewrite <- H4.
  exists x3. auto.
  }

  assert (INP: In p (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x,(EQx1,INx1)).
  apply in_map_iff.
  exists x.
  inversion EQx1.
  auto.
  }

  assert (PHPD1: phplusdef (fold_left phplus (map m (updl l id (x2, id))) b) p).
  {
  apply phpdef_fold; repeat php_.
  apply NoDup_updl.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQa,INa)).
  destruct (Z.eq_dec (snd x) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFLb.
  apply in_map.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQa,INa)).
  destruct (Z.eq_dec (snd x) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFL with (snd x) id.
  omega.
  apply in_map_iff.
  exists x.
  auto.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (EQH2: fold_left phplus (map m (updl l id (x2, id))) b z = None).
  {
  apply phpdef_comm in PHPD1.
  unfold phplusdef in PHPD1.
  specialize PHPD1 with z.
  rewrite P1z in PHPD1.
  destruct (fold_left phplus (map m (updl l id (x2, id))) b z).
  contradiction.
  reflexivity.
  }

  assert (PHPD0: forall p0, In p0 (map m (updl l id (x2, id))) -> phplusdef p0 b).
  {
  intros p0 IN0.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x,(EQa,INa)).
  destruct (Z.eq_dec (snd x) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  assert (NONE1: forall p (IN: In p (map m (updl l id (x2, id))) \/ p = b), p z = None).
  {
  apply fold_None; repeat php_.
  apply NoDup_updl.
  assumption.
  }

  assert (NONE2: z <> z' -> forall p (IN: In p (map m l) \/ p = b), p z' = None).
  {
  intro neq.
  apply fold_None; repeat php_.
  apply PzN.
  assumption.
  }


  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (a, id)))).
  {
  unfold defl.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H2.
  rewrite H0.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) (m x3)).
  {
  apply phpdef_none.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff.
  rewrite <- H4.
  exists x3.
  auto.
  }
  destruct (location_eq_dec Z.eq_dec z z').
  rewrite <- e0.
  apply phpdef_v.
  assumption.
  apply NONE1.
  left.
  apply in_map.
  unfold updl.
  apply in_map_iff.
  exists x3.
  destruct (Z.eq_dec (snd x3) id).
  omega.
  auto.
  apply phpdef_v.
  assumption.
  apply NONE2.
  assumption.
  left.
  apply in_map.
  assumption.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H4.
  rewrite H0.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) (m x1)).
  {
  apply phpdef_none.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff.
  rewrite <- H2.
  exists x1.
  auto.
  }
  apply phpdef_comm.
  destruct (location_eq_dec Z.eq_dec z z').
  rewrite <- e0.
  apply phpdef_v.
  assumption.
  apply NONE1.
  left.
  apply in_map.
  unfold updl.
  apply in_map_iff.
  exists x1.
  destruct (Z.eq_dec (snd x1) id).
  omega.
  auto.
  apply phpdef_v.
  assumption.
  apply NONE2.
  assumption.
  left.
  apply in_map.
  assumption.
  inversion EQ2.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x1.
  rewrite <- H2.
  auto.
  apply in_map_iff.
  exists x3.
  rewrite <- H4.
  auto.
  }

  assert (PHPDB: forall x : pheap, In x (map m (updl l id (a, id))) -> phplusdef x b).
  {
  intros x IN1.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite H0.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) b).
  {
  apply phpdef_none.
  apply DEFLb.
  assumption.
  }
  destruct (location_eq_dec Z.eq_dec z z').
  rewrite <- e0.
  apply phpdef_v.
  assumption.
  apply NONE1.
  right.
  reflexivity.
  apply phpdef_v.
  assumption.
  apply NONE2.
  assumption.
  right.
  reflexivity.
  apply DEFLb.
  rewrite <- EQ1.
  apply in_map.
  assumption.
  }

  assert (EQH1: fold_left phplus (map m (updl l id (a, id))) b =
    phplus (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) 
    p z None) z' (Some Icond))
    (fold_left phplus (map m (updl (updl l id (a, id)) id (x2,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); repeat php_.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx1,INx1)).
  exists x.
  inversion EQx1.
  rewrite eqz.
  rewrite H2.
  rewrite H1.
  rewrite H0.
  auto.
  }

  rewrite updl_updl in EQH1.

  assert (UPDcond:upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) 
    p z None) z' (Some Icond) z' = Some Icond).
  {
  unfold upd.
  destruct (location_eq_dec Z.eq_dec z' z').
  reflexivity.
  contradiction.
  }

  assert (UPDnone: z' <> z -> upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) 
    p z None) z' (Some Icond) z = None).
  {
  unfold upd.
  intros.
  destruct (location_eq_dec Z.eq_dec z z').
  symmetry in e.
  contradiction.
  destruct (location_eq_dec Z.eq_dec z z).
  reflexivity.
  contradiction.
  }

  rewrite EQH1.
  split.
  {
  intros.
  unfold phplus at 1.
  rewrite UPDnone.
  rewrite EQH2.
  reflexivity.
  assumption.
  }
  unfold phplus at 1.
  rewrite UPDcond.
  reflexivity.
Qed.

Lemma eq_heap_dstr A m:
  forall (l: list (A * Z)) id z' p x b a n
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (DEFU: forall p0 id' (NEQ: id <> id') (IN: In (p0,id') (map (fun x => (m x, snd x)) l)), phplusdef p0 
             (dstr_cells' p (map  (fun x : nat =>
             ((a + Z.of_nat x)%Z, 0%Z, (a + Z.of_nat x)%Z, None, false,
             (0%Z, nil), (0%Z, nil), nil)) (seq 0 n)) (Some (Cell full 0))))
         (DEFUb: phplusdef (dstr_cells' p (map  (fun x : nat =>
             ((a + Z.of_nat x)%Z, 0%Z, (a + Z.of_nat x)%Z, None, false,
             (0%Z, nil), (0%Z, nil), nil)) (seq 0 n)) (Some (Cell full 0))) b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (X: m (x,id) = dstr_cells' p (map  (fun x : nat =>
             ((a + Z.of_nat x)%Z, 0%Z, (a + Z.of_nat x)%Z, None, false,
             (0%Z, nil), (0%Z, nil), nil)) (seq 0 n)) (Some (Cell full 0)))
         (NIN: ~ In z' (map (fun x => (((a + (Z.of_nat x))%Z, 0%Z, (a + (Z.of_nat x))%Z, None, false), (0%Z,nil), (0%Z,nil), nil)) (seq 0 n))),
    fold_left phplus (map m (updl l id (x, id))) b z' = fold_left phplus (map m l) b z'.
Proof.
  intros.
  assert (EXT2:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).

  assert (Inp: In p (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  assert (phpdefpp12: phplusdef p b).
  {
  apply DEFLb.
  assumption.
  }  

  assert (deflu: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (empx, id)))).
  {
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }

  replace (fold_left phplus (map m l) b) with
    (phplus p (fold_left phplus (map m (updl l id (empx, id))) b)); try tauto.

  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=(dstr_cells' p (map  (fun x : nat =>
             ((a + Z.of_nat x)%Z, 0%Z, (a + Z.of_nat x)%Z, None, false,
             (0%Z, nil), (0%Z, nil), nil)) (seq 0 n)) (Some (Cell full 0))))(id:=id)(x:=empx); try tauto.
  rewrite updl_updl.
  apply phplus_dstr1.
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.

  unfold defl.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  inversion EQ1.
  destruct (Z.eq_dec (snd x1) id).
  rewrite X.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  inversion EQ2.
  destruct (Z.eq_dec (snd x2) id).
  omega.
  apply phpdef_comm.
  apply DEFU with (id':=snd x2).
  omega.
  inm_.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  inversion EQ2.
  destruct (Z.eq_dec (snd x2) id).
  rewrite X.
  apply DEFU with (snd x1).
  omega.
  inm_.
  apply DEFL with (snd x1) (snd x2).
  omega.
  inm_.
  inm_.
  repeat php_.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  inversion EQ0.
  destruct (Z.eq_dec (snd x1) id).
  rewrite X.
  apply DEFUb.
  apply DEFLb.
  inm_.
  rewrite phplus_comm; repeat php_.

  apply in_map_iff.
  exists (x,id).
  split.
  rewrite X.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ0,IN0)).
  inversion EQ0.
  destruct x1.
  exists a0.
  tauto.
  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); try tauto.
  apply can_phpdef.
  repeat php_.
Qed.

Lemma eq_heap_initc A m:
  forall (l: list (A * Z)) id z p x z' z'' b
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (P1z: p z = Some Ucond)
          (PzN: z <> z' -> fold_left phplus (map m l) b z' = None)
          (X: m (x,id) = upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p z None) z' (Some Icond))
          (NEQ: z <> z'' /\ z' <> z''),
    fold_left phplus (map m (updl l id (x,id))) b z'' = fold_left phplus (map m l) b z''.
Proof.
  intros.
  assert (IN1:=IN).
  apply in_map_iff in IN1.
  destruct IN1 as (x12,(EQx,INx)).
  assert (EXTE:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (x2, mx2).

  assert (DEFL2: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (x2, id)))).
  {
  unfold defl.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H1.
  rewrite mx2.
  repeat php_.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H3.
  rewrite mx2.
  repeat php_.
  inversion EQ2.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  rewrite <- H1.
  exists x1. auto.
  apply in_map_iff.
  rewrite <- H3.
  exists x3. auto.
  }

  assert (INP: In p (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx1,INx1)).
  apply in_map_iff.
  exists x0.
  inversion EQx1.
  auto.
  }

  assert (PHPD1: phplusdef (fold_left phplus (map m (updl l id (x2, id))) b) p).
  {
  apply phpdef_fold; repeat php_.
  apply NoDup_updl.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQa,INa)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFLb.
  apply in_map.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQa,INa)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFL with (snd x0) id.
  omega.
  apply in_map_iff.
  exists x0.
  auto.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (EQH2: fold_left phplus (map m (updl l id (x2, id))) b z = None).
  {
  apply phpdef_comm in PHPD1.
  unfold phplusdef in PHPD1.
  specialize PHPD1 with z.
  rewrite P1z in PHPD1.
  destruct (fold_left phplus (map m (updl l id (x2, id))) b z).
  contradiction.
  reflexivity.
  }

  assert (PHPD0: forall p0, In p0 (map m (updl l id (x2, id))) -> phplusdef p0 b).
  {
  intros p0 IN0.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQa,INa)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQa.
  rewrite mx2.
  repeat php_.
  rewrite <- EQa.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  assert (NONE1: forall p (IN: In p (map m (updl l id (x2, id))) \/ p = b), p z = None).
  {
  apply fold_None; repeat php_.
  apply NoDup_updl.
  assumption.
  }

  assert (NONE2: z <> z' -> forall p (IN: In p (map m l) \/ p = b), p z' = None).
  {
  intro neq.
  apply fold_None; repeat php_.
  apply PzN.
  assumption.
  }

  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (x, id)))).
  {
  unfold defl.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  omega.
  inversion EQ2.
  rewrite <- H1.
  rewrite X.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) (m x3)).
  {
  apply phpdef_none.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff.
  rewrite <- H3.
  exists x3.
  auto.
  }
  destruct (location_eq_dec Z.eq_dec z z').
  rewrite <- e0.
  apply phpdef_v.
  assumption.
  apply NONE1.
  left.
  apply in_map.
  unfold updl.
  apply in_map_iff.
  exists x3.
  destruct (Z.eq_dec (snd x3) id).
  omega.
  auto.
  apply phpdef_v.
  assumption.
  apply NONE2.
  assumption.
  left.
  apply in_map.
  assumption.
  inversion EQ1.
  unfold updl in IN2.
  rewrite map_map in IN2.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x3) id).
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H3.
  rewrite X.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) (m x1)).
  {
  apply phpdef_none.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff.
  rewrite <- H1.
  exists x1.
  auto.
  }
  apply phpdef_comm.
  destruct (location_eq_dec Z.eq_dec z z').
  rewrite <- e0.
  apply phpdef_v.
  assumption.
  apply NONE1.
  left.
  apply in_map.
  unfold updl.
  apply in_map_iff.
  exists x1.
  destruct (Z.eq_dec (snd x1) id).
  omega.
  auto.
  apply phpdef_v.
  assumption.
  apply NONE2.
  assumption.
  left.
  apply in_map.
  assumption.
  inversion EQ2.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x1.
  rewrite <- H1.
  auto.
  apply in_map_iff.
  exists x3.
  rewrite <- H3.
  auto.
  }

  assert (PHPDB: forall x0 : pheap, In x0 (map m (updl l id (x, id))) -> phplusdef x0 b).
  {
  intros x0 IN1.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  assert (PHPDu1: phplusdef (upd (location_eq_dec Z.eq_dec) p z None) b).
  {
  apply phpdef_none.
  apply DEFLb.
  assumption.
  }
  destruct (location_eq_dec Z.eq_dec z z').
  rewrite <- e0.
  apply phpdef_v.
  assumption.
  apply NONE1.
  right.
  reflexivity.
  apply phpdef_v.
  assumption.
  apply NONE2.
  assumption.
  right.
  reflexivity.
  apply DEFLb.
  rewrite <- EQ1.
  apply in_map.
  assumption.
  }

  assert (EQH1: fold_left phplus (map m (updl l id (x, id))) b =
    phplus (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) 
    p z None) z' (Some Icond))
    (fold_left phplus (map m (updl (updl l id (x, id)) id (x2,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); repeat php_.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx1,INx1)).
  exists x0.
  inversion EQx1.
  rewrite eqz.
  rewrite H1.
  rewrite X.
  rewrite H0.
  auto.
  }

  rewrite updl_updl in EQH1.

  assert (EQH3: fold_left phplus (map m l) b =
    phplus p (fold_left phplus (map m (updl l id (x2,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); repeat php_.
  apply can_phpdef.
  }
  rewrite EQH1.
  rewrite EQH3.
  apply phplus_mon.
  unfold upd.
  destruct NEQ as (NEQ1,NEQ2).
  destruct (location_eq_dec Z.eq_dec z'' z').
  symmetry in e.
  contradiction.
  destruct (location_eq_dec Z.eq_dec z'' z).
  symmetry in e.
  contradiction.
  reflexivity.
Qed.

Lemma phplus_fold_lock A m:
  forall (l:list (A * Z)) z b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (PHPDL: defl phplusdef (map (fun x => (m x,snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some Lock \/ exists p (IN: In p (map m l)), p z = Some Lock),
    (fold_left phplus (map m l) b) z = Some Lock \/
    exists wt ot, (fold_left phplus (map m l) b) z = Some (Locked wt ot).
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  {
  replace b with (phplus b (emp knowledge)).
  rewrite fold_left_f_m_def with (def:=phplusdef).
  apply phplus_lock.
  left.
  assumption.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  apply DEFLb.
  assumption.
  apply phpdef_emp.
  apply phplus_emp.
  }
  {
  destruct p1z as (p, (INp, EQp)).
  assert (INp2:=INp).
  apply in_map_iff in INp2.
  destruct INp2 as (x, (EXx, INx)).
  destruct x.
  specialize EXT with z0 (emp knowledge).
  destruct EXT as (empx, memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=z0)(x:=empx).
  apply phplus_lock.
  left.
  assumption.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a,z0).
  simpl.
  rewrite EXx.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
Qed.

Lemma fold_lock_ed A m:
  forall (l: list (A * Z)) z b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (P1z: b z = Some Lock \/ (exists wt ot, b z = Some (Locked wt ot))
           \/ exists p (IN: In p (map m l)), p z = Some Lock \/ exists wt ot, p z = Some (Locked wt ot)),
    (fold_left phplus (map m l) b) z = Some Lock \/
    exists wt ot, (fold_left phplus (map m l) b) z = Some (Locked wt ot).
Proof.
  intros.
  destruct P1z as [p1z|p1z].
  apply phplus_fold_lock.
  assumption.
  assumption.
  assumption.
  assumption.
  left.
  assumption.
  destruct p1z as [p1z|p1z].
  right.
  destruct p1z as (wt, (ot, bz)).
  exists wt, ot.
  apply fold_locked.
  assumption.
  assumption.
  assumption.
  assumption.
  left.
  assumption.
  destruct p1z as (p,(INp,p1z)).
  destruct p1z as [p1z|p1z].
  apply phplus_fold_lock.
  assumption.
  assumption.
  assumption.
  assumption.
  right.
  exists p, INp.
  assumption.
  right.
  destruct p1z as (wt, (ot, bz)).
  exists wt, ot.
  apply fold_locked.
  assumption.
  assumption.
  assumption.
  assumption.
  right.
  exists p, INp.
  assumption.
Qed.

Lemma phplus_mon1:
  forall p1 p1' p2 x
         (EQ: p1 x = p1' x),
    phplus p1 p2 x = phplus p1' p2 x.
Proof.
  intros.
  unfold phplus.
  rewrite EQ.
  reflexivity.
Qed.

Lemma ghplus_mon1:
  forall p1 p1' p2 x
         (EQ: p1 x = p1' x),
    ghplus p1 p2 x = ghplus p1' p2 x.
Proof.
  intros.
  unfold ghplus.
  rewrite EQ.
  reflexivity.
Qed.

Lemma phplus_mon2:
  forall p1 p2 p3 p4
         (PHPD12: phplusdef p1 p2)
         (PHPD12: phplusdef p1 p3)
         (PHPD12: phplusdef p1 p4)
         (PHPD12: phplusdef p2 p3)
         (PHPD12: phplusdef p2 p4)
         (PHPD12: phplusdef p3 p4),
    phplus p1 (phplus (phplus p2 p3) p4) = phplus (phplus p1 p2) (phplus p3 p4).
Proof.
  intros.
  apply functional_extensionality.
  intros.
  rewrite phplus_assoc;
  try tauto.
  rewrite phplus_assoc;
  try tauto.
  apply phpdef_pair;
  try tauto.
  apply phpdef_pair;
  try tauto.
Qed.  

Lemma ghplus_mon2:
  forall p1 p2 p3 p4
         (PHPD12: ghplusdef p1 p2)
         (PHPD12: ghplusdef p1 p3)
         (PHPD12: ghplusdef p1 p4)
         (PHPD12: ghplusdef p2 p3)
         (PHPD12: ghplusdef p2 p4)
         (PHPD12: ghplusdef p3 p4),
    ghplus p1 (ghplus (ghplus p2 p3) p4) = ghplus (ghplus p1 p2) (ghplus p3 p4).
Proof.
  intros.
  apply functional_extensionality.
  intros.
  rewrite ghplus_assoc;
  try tauto.
  rewrite ghplus_assoc;
  try tauto.
  apply ghpdef_pair;
  try tauto.
  apply ghpdef_pair;
  try tauto.
Qed.  

Lemma fold_left_upd_Notify A m:
   forall (l: list (A * Z)) id id' z p1 pm p' b wt ot x1 x2
          (NEQ: id <> id')
          (EXT: forall z p, exists x, m (x, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (phplus p1 pm,id) (map (fun x => (m x, snd x)) l))
          (phpdefp1pm: phplusdef p1 pm)
          (IN': In (p',id') (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1))
          (X1: (m x1, snd x1) = (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot)), id))
          (X2: (m x2, snd x2) = (phplus p' pm, id')),
      fold_left phplus (map m (updl (updl l id x1) id' x2)) b = 
        upd (location_eq_dec Z.eq_dec) (fold_left phplus (map m l) b) z (Some (Locked wt ot)).
Proof.
  intros.
  inversion X1.
  inversion X2.
  apply functional_extensionality.
  intros.
  destruct x1.
  destruct x2.
  unfold snd in *.
  rewrite H1 in *.
  rewrite H3 in *.

  assert (phpdefp1mp': phplusdef (phplus p1 pm) p').
  {
  apply DEFL with id id'.
  omega.
  assumption.
  assumption.
  }
  
  assert (phpdefp1p'pmp': phplusdef p1 p' /\ phplusdef pm p').
  {
  apply phpdef_dist;
  try tauto.
  }

  assert (inp1m: In (phplus p1 pm) (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (inp': In p' (map m l)).
  {
  apply in_map_iff in IN'.
  destruct IN' as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (EXTE:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx, memp).
  assert (EXTE1:=EXTE).
  specialize EXTE with id' (emp knowledge).
  destruct EXTE as (empx', memp').


  assert (DEFL1: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0))
    (updl (updl l id' (a0, id')) id (empx, id)))).
  {
  unfold defl.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  simpl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQx1,INx1)).
  simpl in EQx1.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQx2,INx2)).
  simpl in EQx2.
  destruct (Z.eq_dec (snd x1) id').
  destruct (Z.eq_dec (snd x2) id').
  simpl in *.
  destruct (Z.eq_dec id' id).
  omega.
  inversion EQx1.
  inversion EQx2.
  omega.
  simpl in *.
  destruct (Z.eq_dec (snd x2) id).
  inversion EQx2.
  rewrite <- H5.
  rewrite memp.
  apply phpdef_emp.
  inversion EQx2.
  destruct (Z.eq_dec id' id).
  omega.
  inversion EQx1.
  rewrite <- H7.
  rewrite H2.
  apply phpdef_pair';
  try tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id id'.
  omega.
  assumption.
  assumption.
  apply DEFL with id' (snd x2).
  omega.
  assumption.
  apply in_map_iff.
  exists x2.
  tauto.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x2).
  omega.
  assumption.
  apply in_map_iff.
  exists x2.
  tauto.
  destruct (Z.eq_dec (snd x1) id).
  inversion EQx1.
  rewrite <- H5.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  inversion EQx1.
  destruct (Z.eq_dec (snd x2) id').
  simpl in *.
  destruct (Z.eq_dec id' id).
  omega.
  inversion EQx2.
  rewrite <- H7.
  rewrite H2.
  apply phpdef_pair.
  apply phpdef_comm.
  tauto.
  apply DEFL with (snd x1) id'.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  destruct (Z.eq_dec (snd x2) id).
  inversion EQx2.
  rewrite <- H7.
  rewrite memp.
  apply phpdef_emp.
  inversion EQx2.
  apply DEFL with (snd x1) (snd x2).
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  apply in_map_iff.
  exists x2.
  tauto.
  }
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) x z).
  {
  rewrite e.  
  apply fold_locked;
  try tauto.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite H2.
  apply phpdef_pair.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x',(EQx,INx)).
  destruct x'.
  unfold snd in *.
  destruct (Z.eq_dec z2 z0).
  rewrite e0 in *.
  apply phpdef_comm.
  tauto.
  apply phpdef_comm.
  tauto.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x',(EQx,INx)).
  destruct x'.
  unfold snd in *.
  destruct (Z.eq_dec z2 id).
  inversion EQx.
  rewrite <- H5 in *.
  rewrite H0.
  apply phpdef_locked;
  tauto.
  inversion EQx.
  rewrite <- H5 in *.
  apply DEFL with z2 id'.
  omega.
  apply in_map_iff.
  exists (a1, z2).
  tauto.
  assumption.

  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x',(EQx,INx)).
  destruct x'.
  unfold snd in *.
  destruct (Z.eq_dec z2 id).
  rewrite e0 in *.
  inversion EQx.
  rewrite <- H5 in *.
  rewrite H0.
  apply phpdef_locked;
  tauto.
  inversion EQx.
  rewrite <- H5 in *.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1;
  try tauto.
  apply DEFL with id z2.
  omega.
  assumption.
  apply in_map_iff.
  exists (a1, z2).
  tauto.
  apply defl_updl.
  intros.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_locked.
  apply phpdef_assoc_mon with pm;
  try tauto.
  apply phpdef_comm.
  tauto.
  apply DEFL with id id0.
  omega.
  rewrite phplus_comm.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  assumption.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct x1.
  simpl in EQx.
  destruct (Z.eq_dec z2 id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite H0.
  apply phpdef_locked.
  apply phpdef_assoc_mon with pm;
  try tauto.
  apply phpdef_comm.
  tauto.
  apply DEFLb.
  rewrite phplus_comm.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply phpdef_comm.
  assumption.
  assumption.
  simpl in EQx.
  destruct (Z.eq_dec z2 id').
  rewrite <- EQx.
  rewrite H2.
  apply phpdef_pair'.
  apply phpdef_comm.
  tauto.
  apply DEFLb.
  apply in_map_iff in IN'.
  destruct IN' as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply phpdef_assoc_mon with p1;
  try tauto.
  apply DEFLb.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  right.
  exists (upd (location_eq_dec Z.eq_dec) p1 z (Some (Locked wt ot))).
  exists.
  apply in_map_iff.
  exists (a,id).
  split.
  tauto.
  apply in_updl_neq;
  try tauto.
  omega.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  destruct x1.
  inversion EQ1.
  exists a1.
  rewrite <- H5.
  tauto.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) z z).
  reflexivity.
  contradiction.
}

  assert (EQ1: fold_left phplus (map m l) b =
    phplus (phplus p1 pm) (fold_left phplus (map m (updl l id (empx,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge);
  try tauto.
  apply can_phpdef.
  apply phpdef_comm.
  apply phpdef_emp.
  }

  assert (EQ2: fold_left phplus (map m (updl l id (empx, id))) b =
    phplus p' (fold_left phplus (map m (updl (updl l id (empx, id)) id' (empx',id'))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge);
  try tauto.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl;
  try tauto.
  intros.
  rewrite memp.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_emp.
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ0.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  apply in_map_updl.
  omega.
  rewrite phplus_comm.
  rewrite phplus_emp.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  }
  rewrite EQ2 in EQ1.

  assert (EQ3: fold_left phplus (map m (updl (updl l id (a, id)) id' (a0, id'))) b =
    phplus (m (a, id)) (fold_left phplus (map m (updl (updl (updl l id (a, id)) id' (a0, id')) id (empx,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge);
  try tauto.
  apply can_phpdef.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  {
  apply defl_updl.
  intros.
  rewrite H2.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  inversion EQx.
  rewrite <- H5.
  rewrite H0.
  apply phpdef_locked.
  apply phpdef_pair;
  try tauto.
  apply phpdef_comm.
  tauto.
  assumption.
  inversion EQx. 
  apply phpdef_pair.
  apply phpdef_comm.
  tauto.
  apply DEFL with (snd x1) id'.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.

  apply defl_updl.
  intros.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_locked.
  apply phpdef_assoc_mon with pm.
  apply phpdef_comm.
  assumption.
  apply DEFL with id id0.
  omega.
  rewrite phplus_comm.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  assumption.
  assumption.
  }

  apply phpdef_comm.
  apply phpdef_emp.
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite H0.
  apply phpdef_locked.
  apply phpdef_assoc_mon with pm.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite H2.
  apply phpdef_pair'.
  apply phpdef_comm.
  tauto.
  apply DEFLb.
  assumption.
  apply phpdef_assoc_mon with p1.
  tauto.
  apply DEFLb.
  assumption.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  rewrite phplus_comm.
  rewrite phplus_emp.
  {
  apply in_map_iff.
  exists (a, id).
  split.
  tauto.
  apply in_updl_neq.
  omega.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  destruct x1.
  exists a1.
  inversion EQx.
  rewrite <- H5.
  tauto.
  }
  apply phpdef_comm.
  apply phpdef_emp.
  }
  rewrite H0 in EQ3.
  rewrite updl_updl_neq in EQ3 at 2.
  rewrite updl_updl in EQ3.

  assert (EQ4: fold_left phplus (map m (updl (updl l id' (a0, id')) id (empx, id))) b =
    phplus (m (a0, id')) (fold_left phplus (map m (updl (updl (updl l id' (a0, id')) id (empx, id)) id' (empx',id'))) b)).
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge);
  try tauto.
  apply can_phpdef.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  {
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id').
  simpl in EQx.
  destruct (Z.eq_dec id' id).
  omega.
  rewrite <- EQx.
  rewrite H2.
  apply phpdef_pair'.
  apply phpdef_comm.
  tauto.
  apply DEFLb.
  assumption.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  rewrite phplus_comm.
  rewrite phplus_emp.
  {
  apply in_map_iff.
  exists (a0, id').
  split.
  tauto.
  apply in_updl_neq.
  omega.
  apply in_updl_eq.
  apply in_map_iff in IN'.
  destruct IN' as (x1,(EQx,INx)).
  destruct x1.
  inversion EQx.
  exists a1.
  rewrite <- H5.
  tauto.
  }
  apply phpdef_comm.
  apply phpdef_emp.
  }

  rewrite updl_updl_neq in EQ4 at 2.
  rewrite updl_updl in EQ4.

  rewrite H2 in EQ4.
  rewrite EQ4 in EQ3.
  rewrite EQ1.
  rewrite EQ3.
  rewrite phplus_mon1 with (p1':=p1).
  replace (phplus p' pm) with (phplus pm p').
  rewrite phplus_mon2;
  try tauto.
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  inversion NODUP.
  assumption.
  assumption.
  {
  apply defl_updl.
  intros.
  rewrite memp'.
  apply phpdef_emp.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply phpdef_comm.
  apply phpdef_assoc_mon with pm.
  apply phpdef_comm.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  rewrite phplus_comm.
  assumption.
  apply phpdef_comm.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with pm.
  apply phpdef_comm.
  assumption.
  apply DEFLb.
  rewrite phplus_comm.
  assumption.
  apply phpdef_comm.
  assumption.

  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  inversion NODUP.
  assumption.
  assumption.
  {
  apply defl_updl.
  intros.
  rewrite memp'.
  apply phpdef_emp.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.

  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  inversion NODUP.
  assumption.
  assumption.
  {
  apply defl_updl.
  intros.
  rewrite memp'.
  apply phpdef_emp.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQx.
  apply phpdef_comm.
  apply DEFL with id' (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  apply phpdef_comm.
  apply DEFLb.
  assumption.

  apply phplus_comm.
  tauto.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) x z).
  tauto.
  reflexivity.
  omega.
  omega.
Qed.

Lemma foldg_left_upd_Notify A m:
   forall (l: list (A * Z)) id id' p1 pm p' b x1 x2
          (NEQ: id <> id')
          (EXT: forall z p, exists x, m (x, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
          (IN: In (ghplus p1 pm,id) (map (fun x => (m x, snd x)) l))
          (phpdefp1pm: ghplusdef p1 pm)
          (IN': In (p',id') (map (fun x => (m x, snd x)) l))
          (X1: (m x1, snd x1) = (p1, id))
          (X2: (m x2, snd x2) = (ghplus p' pm, id')),
      fold_left ghplus (map m (updl (updl l id x1) id' x2)) b = 
      fold_left ghplus (map m l) b.
Proof.
  intros.
  inversion X1.
  inversion X2.
  apply functional_extensionality.
  intros.
  unfold upd.
  destruct x1.
  destruct x2.
  unfold snd in *.
  rewrite H1 in *.
  rewrite H3 in *.

  assert (phpdefp1mp': ghplusdef (ghplus p1 pm) p').
  {
  apply DEFL with id id'.
  omega.
  assumption.
  assumption.
  }
  
  assert (phpdefp1p'pmp': ghplusdef p1 p' /\ ghplusdef pm p').
  {
  apply ghpdef_dist;
  try tauto.
  }

  assert (inp1m: In (ghplus p1 pm) (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (inp': In p' (map m l)).
  {
  apply in_map_iff in IN'.
  destruct IN' as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (EXTE:=EXT).
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).
  assert (EXTE1:=EXTE).
  specialize EXTE with id' (emp (option nat*nat)).
  destruct EXTE as (empx', memp').


  assert (DEFL1: defl ghplusdef (map (fun x0 : A * Z => (m x0, snd x0))
    (updl (updl l id' (a0, id')) id (empx, id)))).
  {
  unfold defl.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  simpl.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQx1,INx1)).
  simpl in EQx1.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQx2,INx2)).
  simpl in EQx2.
  destruct (Z.eq_dec (snd x1) id').
  destruct (Z.eq_dec (snd x2) id').
  simpl in *.
  destruct (Z.eq_dec id' id).
  omega.
  inversion EQx1.
  inversion EQx2.
  omega.
  simpl in *.
  destruct (Z.eq_dec (snd x2) id).
  inversion EQx2.
  rewrite <- H5.
  rewrite memp.
  apply ghpdef_emp.
  inversion EQx2.
  destruct (Z.eq_dec id' id).
  omega.
  inversion EQx1.
  rewrite <- H7.
  rewrite H2.
  apply ghpdef_pair';
  try tauto.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id id'.
  omega.
  assumption.
  assumption.
  apply DEFL with id' (snd x2).
  omega.
  assumption.
  apply in_map_iff.
  exists x2.
  tauto.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x2).
  omega.
  assumption.
  apply in_map_iff.
  exists x2.
  tauto.
  destruct (Z.eq_dec (snd x1) id).
  inversion EQx1.
  rewrite <- H5.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  inversion EQx1.
  destruct (Z.eq_dec (snd x2) id').
  simpl in *.
  destruct (Z.eq_dec id' id).
  omega.
  inversion EQx2.
  rewrite <- H7.
  rewrite H2.
  apply ghpdef_pair.
  apply ghpdef_comm.
  tauto.
  apply DEFL with (snd x1) id'.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  destruct (Z.eq_dec (snd x2) id).
  inversion EQx2.
  rewrite <- H7.
  rewrite memp.
  apply ghpdef_emp.
  inversion EQx2.
  apply DEFL with (snd x1) (snd x2).
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  apply in_map_iff.
  exists x2.
  tauto.
  }

  assert (EQ1: fold_left ghplus (map m l) b =
    ghplus (ghplus p1 pm) (fold_left ghplus (map m (updl l id (empx,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat));
  try tauto.
  apply can_ghpdef.
  apply ghpdef_comm.
  apply ghpdef_emp.
  }

  assert (EQ2: fold_left ghplus (map m (updl l id (empx, id))) b =
    ghplus p' (fold_left ghplus (map m (updl (updl l id (empx, id)) id' (empx',id'))) b)).
  {
  apply fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat));
  try tauto.
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.
  apply deflg_updl;
  try tauto.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQ0.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  apply in_map_updl.
  omega.
  rewrite ghplus_comm.
  rewrite ghplus_emp.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_emp.
  }
  rewrite EQ2 in EQ1.

  assert (EQ3: fold_left ghplus (map m (updl (updl l id (a, id)) id' (a0, id'))) b =
    ghplus (m (a, id)) (fold_left ghplus (map m (updl (updl (updl l id (a, id)) id' (a0, id')) id (empx,id))) b)).
  {
  apply fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat));
  try tauto.
  apply can_ghpdef.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  {
  apply deflg_updl.
  intros.
  rewrite H2.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  inversion EQx.
  rewrite <- H5.
  rewrite H0.
  apply ghpdef_pair;
  try tauto.
  apply ghpdef_comm.
  tauto.
  inversion EQx. 
  apply ghpdef_pair.
  apply ghpdef_comm.
  tauto.
  apply DEFL with (snd x1) id'.
  omega.
  apply in_map_iff.
  exists x1.
  tauto.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.

  apply deflg_updl.
  intros.
  rewrite H0.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with pm.
  apply ghpdef_comm.
  assumption.
  apply DEFL with id id0.
  omega.
  rewrite ghplus_comm.
  assumption.
  apply ghpdef_comm.
  assumption.
  assumption.
  assumption.
  }

  apply ghpdef_comm.
  apply ghpdef_emp.
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite H0.
  apply ghpdef_assoc_mon with pm.
  apply ghpdef_comm.
  assumption.
  rewrite ghplus_comm.
  apply DEFLb.
  assumption.
  apply ghpdef_comm.
  assumption.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite H2.
  apply ghpdef_pair'.
  apply ghpdef_comm.
  tauto.
  apply DEFLb.
  assumption.
  apply ghpdef_assoc_mon with p1.
  tauto.
  apply DEFLb.
  assumption.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  rewrite ghplus_comm.
  rewrite ghplus_emp.
  {
  apply in_map_iff.
  exists (a, id).
  split.
  tauto.
  apply in_updl_neq.
  omega.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  destruct x1.
  exists a1.
  inversion EQx.
  rewrite <- H5.
  tauto.
  }
  apply ghpdef_comm.
  apply ghpdef_emp.
  }
  rewrite H0 in EQ3.
  rewrite updl_updl_neq in EQ3 at 2.
  rewrite updl_updl in EQ3.

  assert (EQ4: fold_left ghplus (map m (updl (updl l id' (a0, id')) id (empx, id))) b =
    ghplus (m (a0, id')) (fold_left ghplus (map m (updl (updl (updl l id' (a0, id')) id (empx, id)) id' (empx',id'))) b)).
  {
  apply fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat));
  try tauto.
  apply can_ghpdef.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_emp.
  {
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id').
  simpl in EQx.
  destruct (Z.eq_dec id' id).
  omega.
  rewrite <- EQx.
  rewrite H2.
  apply ghpdef_pair'.
  apply ghpdef_comm.
  tauto.
  apply DEFLb.
  assumption.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  }
  rewrite ghplus_comm.
  rewrite ghplus_emp.
  {
  apply in_map_iff.
  exists (a0, id').
  split.
  tauto.
  apply in_updl_neq.
  omega.
  apply in_updl_eq.
  apply in_map_iff in IN'.
  destruct IN' as (x1,(EQx,INx)).
  destruct x1.
  inversion EQx.
  exists a1.
  rewrite <- H5.
  tauto.
  }
  apply ghpdef_comm.
  apply ghpdef_emp.
  }

  rewrite updl_updl_neq in EQ4 at 2.
  rewrite updl_updl in EQ4.

  rewrite H2 in EQ4.
  rewrite EQ4 in EQ3.
  rewrite EQ1.
  rewrite EQ3.
  replace (ghplus p' pm) with (ghplus pm p').
  rewrite ghplus_mon2;
  try tauto.
  apply ghpdef_comm.
  apply ghpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  inversion NODUP.
  assumption.
  assumption.
  {
  apply deflg_updl.
  intros.
  rewrite memp'.
  apply ghpdef_emp.
  apply deflg_updl.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with pm.
  apply ghpdef_comm.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  rewrite ghplus_comm.
  assumption.
  apply ghpdef_comm.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with pm.
  apply ghpdef_comm.
  assumption.
  apply DEFLb.
  rewrite ghplus_comm.
  assumption.
  apply ghpdef_comm.
  assumption.

  apply ghpdef_comm.
  apply ghpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  inversion NODUP.
  assumption.
  assumption.
  {
  apply deflg_updl.
  intros.
  rewrite memp'.
  apply ghpdef_emp.
  apply deflg_updl.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.

  apply ghpdef_comm.
  apply ghpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  inversion NODUP.
  assumption.
  assumption.
  {
  apply deflg_updl.
  intros.
  rewrite memp'.
  apply ghpdef_emp.
  apply deflg_updl.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  assumption.
  }
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQx,INx)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQx.
  destruct (Z.eq_dec id id').
  omega.
  rewrite <- EQx.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  destruct (Z.eq_dec (snd x1) id').
  rewrite <- EQx.
  rewrite memp'.
  apply ghpdef_comm.
  apply ghpdef_emp.
  rewrite <- EQx.
  apply ghpdef_comm.
  apply DEFL with id' (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  tauto.
  apply ghpdef_comm.
  apply DEFLb.
  assumption.

  apply ghplus_comm.
  tauto.
  omega.
  omega.
Qed.

Lemma lock_Wait A m:
  forall (l: list (A * Z)) id z p1 p2 x b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (PHPD: phplusdef p1 p2)
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
         (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1) \/ p1 z = Some (Ulock wt1 ot1))
         (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock), id)),
     fold_left phplus (map m (updl l id x)) (phplus b p2) z = Some Lock.
Proof.
  intros.
  assert (IN1:=IN).
  apply in_map_iff in IN1.
  destruct IN1 as (x12,(EQx,INx)).
  assert (EXTE:=EXT).
  specialize EXT with id p2.
  destruct EXT as (x2, mx2).
  destruct P1z as (wt, (ot, p1z)).

  assert (G1:
    phplus p1 (fold_left phplus (map m (updl l id (x2, id))) b) z = Some (Locked wt ot) \/
    phplus p1 (fold_left phplus (map m (updl l id (x2, id))) b) z = Some (Ulock wt ot)).
  {
  destruct p1z as [p1z|p1z];
  unfold phplus;
  rewrite p1z;
  tauto;
  reflexivity.
  }
  assert (PHPDF: phplusdef p1 (fold_left phplus (map m (updl l id (x2, id))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite mx2.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  assumption.
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x0.
  tauto.
  }
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_comm.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  destruct x0.
  simpl in n.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  apply phpdef_comm.
  assumption.
  }
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply phpdef_comm.
  assumption.
  }
  assert (G2:
    (fold_left phplus (map m (updl l id (x2, id))) b) z = Some Lock \/
    (fold_left phplus (map m (updl l id (x2, id))) b) z = None).
  {
  destruct G1 as [G1z|G1z].
  {
  destruct p1z as [p1z|p1z].
  unfold phplus in G1z.
  rewrite p1z in G1z.
  Focus 2.
  unfold phplus in G1z.
  rewrite p1z in G1z.
  inversion G1z.
  apply phplus_lock_mon with p1 wt ot.
  assumption.
  assumption.
  }
  destruct p1z as [p1z|p1z].
  unfold phplus in G1z.
  rewrite p1z in G1z.
  inversion G1z.
  right.
  apply phplus_ulock_mon with p1 wt ot.
  assumption.
  assumption.
  }

  specialize EXTE with id (emp knowledge).
  destruct EXTE as (empx, memp).

  assert (G3:
    phplus p2 (fold_left phplus (map m (updl (updl l id (x2, id)) id (empx, id))) b) z = Some Lock \/
    phplus p2 (fold_left phplus (map m (updl (updl l id (x2, id)) id (empx, id))) b) z = None).
  {
  rewrite <- fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p2)(id:=id)(x:=empx).
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite mx2.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x2, id).
  split.
  rewrite mx2.
  tauto.
  unfold updl.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  repeat dstr_.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }  

  assert (G4:
    fold_left phplus (map m (updl l id (empx, id))) (phplus b p2) z = Some Lock \/
    fold_left phplus (map m (updl l id (empx, id))) (phplus b p2) z = None).
  {
  rewrite updl_updl in G3.
  rewrite <- fold_left_f_m_def with (def:=phplusdef) in G3.
  rewrite phplus_comm in G3.
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  split.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_emp.
  split.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  destruct x1.
  unfold defl in DEFL.
  apply DEFL with id z0.
  simpl in n.
  omega.
  assumption.
  apply in_map_iff.
  exists (a, z0).
  inversion EQ0.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  }

  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p1 z (Some Lock))(id:=id)(x:=empx).
  {
  destruct x.
  inversion X.
  rewrite updl_updl.
  rewrite <- H1.
  rewrite H0.
  apply phplus_upd_lock.
  rewrite H1.
  assumption.
  }
  apply can_phpdef.
  destruct x.
  inversion X.
  apply NoDup_updl.
  assumption.
  destruct x.
  inversion X.
  apply defl_updl.
  intros.
  rewrite <- H1.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  exists wt, ot.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  inversion X.
  rewrite H0.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply phpdef_comm.
  assumption.
  exists wt, ot.
  assumption.
  rewrite <- EQ0.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  inversion X.
  rewrite H0.
  apply phpdef_locked_lock.
  assumption.
  exists wt, ot.
  assumption.
  rewrite <- EQ0.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists x.
  split.
  tauto.
  apply in_updl_eq.
  exists (fst x12).
  inversion EQx.
  destruct x12.
  simpl.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma eq_heap_Wait A m:
  forall (l: list (A * Z)) id z p1 p2 x z' b
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (PHPD: phplusdef p1 p2)
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p1 z = Some (Locked wt1 ot1) \/ p1 z = Some (Ulock wt1 ot1))
          (X: m (x,id) = upd (location_eq_dec Z.eq_dec) p1 z (Some Lock))
          (NEQ: z <> z'),
    fold_left phplus (map m (updl l id (x,id))) (phplus b p2) z' = fold_left phplus (map m l) b z'.
Proof.
  intros.
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx, memp).

  assert (phpdefp2up1: phplusdef p2 (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock))).
  {
  apply phpdef_comm.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  }

  assert (INp1p2: In (phplus p1 p2) (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  assert (phpdefp1b: phplusdef p1 b).
  {
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  assert (phpdefp2b: phplusdef p2 b).
  {
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.
  }

  assert (phpdefup1fold: phplusdef (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock)) (fold_left phplus (map m (updl l id (empx, id))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x0.
  tauto.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  destruct x0.
  simpl in n.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  apply phpdef_comm.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  }

  assert (phpdefp0b: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 b).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x0.
  tauto.
  }

  assert (phpdefp0p2: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p2).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  destruct x0.
  simpl in n.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  }

  assert (phpdefp2fold: phplusdef p2 (fold_left phplus (map m (updl l id (empx, id))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  assert (deflu: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (x, id)))).
  {
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  assumption.
  }

  rewrite phplus_comm.
  rewrite fold_left_f_m_def with (def:=phplusdef).
  {
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p1 z (Some Lock))(id:=id)(x:=empx).
  {
  rewrite updl_updl.
  replace (fold_left phplus (map m l) b) with 
    (phplus (phplus p1 p2) (fold_left phplus (map m (updl l id (empx,id))) b)).
  {
  rewrite <- phplus_assoc.
  apply phplus_mon.
  rewrite phplus_comm.
  unfold upd.
  unfold phplus.
  destruct ((location_eq_dec Z.eq_dec) z' z).
  symmetry in e.
  contradiction.
  reflexivity.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  assumption.
  assumption.
  assumption.
  }
  symmetry.
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge).
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
  }
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  tauto.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  destruct x1.
  exists a.
  inversion EQx1.
  rewrite <- H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  assumption.
  intros.
  split.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite X.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  destruct x1.
  simpl in n.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite X.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  destruct x1.
  simpl in n.
  apply DEFLb.
  apply in_map_iff.
  exists (a, z0).
  inversion EQ0.
  tauto.
  apply phpdef_comm.
  assumption.
Qed.

Lemma boundph_Wait A m:
   forall (l: list (A * Z)) id z p1 p2 x b
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (PHPD: phplusdef p1 p2)
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt ot, p1 z = Some (Locked wt ot) \/ p1 z = Some (Ulock wt ot))
          (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock), id))
          (BP: boundph (fold_left phplus (map m l) b)),
     boundph (fold_left phplus (map m (updl l id x)) (phplus b p2)).
Proof.
  intros.
  assert (INp1p2: In (phplus p1 p2) (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  unfold boundph.
  intros.
  destruct x.
  inversion X.
  rewrite H2 in *.
  unfold upd in *.
  destruct ((location_eq_dec Z.eq_dec) z x0).
  rewrite <- e in *.

  assert (CO: fold_left phplus (map m (updl l id (a, id))) (phplus b p2) z = Some Lock \/
    exists wt ot, fold_left phplus (map m (updl l id (a, id))) (phplus b p2) z = Some (Locked wt ot)).
  {
  apply phplus_fold_lock.
  assumption.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite H1.
  apply phpdef_comm.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  assumption.
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite H1.
  apply phpdef_locked_lock.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  tauto.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite H1.
  apply phpdef_locked_lock.
  assumption.
  assumption.
  destruct x1.
  simpl in n.
  unfold defl in DEFL.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id z2.
  omega.
  assumption.
  apply in_map_iff.
  exists (a0,z2).
  inversion EQ1.
  tauto.
  right.
  exists (upd (location_eq_dec Z.eq_dec) p1 z (Some Lock)).
  exists.
  apply in_map_iff.
  exists (a,id).
  split.
  assumption.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x,(EQ,IN)).
  destruct x.
  exists a0.
  inversion EQ.
  rewrite <- H4.
  tauto.
  repeat dstr_.
  }

  destruct CO as [CO|CO].
  rewrite H in CO.
  inversion CO.
  destruct CO as (wt,(ot,CO)).
  rewrite H in CO.
  inversion CO.

  rewrite eq_heap_Wait with (z:=z) (p1:=p1) in H;
  try assumption.
  unfold boundph in BP.
  apply BP with x0 z0.
  assumption.
Qed.



Lemma ghplus_mon:
  forall p1 p1' p2 x
         (EQ: p1 x = p1' x),
    ghplus p1 p2 x = ghplus p1' p2 x.
Proof.
  unfold ghplus.
  intros.
  rewrite EQ.
  reflexivity.
Qed.

Lemma eq_gheap_Wait A m:
  forall (l: list (A * Z)) id p1 p2 x b
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (PHPD: ghplusdef p1 p2)
          (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
          (IN: In (ghplus p1 p2,id) (map (fun x => (m x, snd x)) l))
          (X: m (x,id) = p1),
    fold_left ghplus (map m (updl l id (x,id))) (ghplus b p2) = fold_left ghplus (map m l) b.
Proof.
  intros.
  apply functional_extensionality.
  intros z.
  specialize EXT with id (emp (option nat*nat)).
  destruct EXT as (empx, memp).

  assert (INp1p2: In (ghplus p1 p2) (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  assert (phpdefp1b: ghplusdef p1 b).
  {
  apply ghpdef_assoc_mon with p2.
  apply ghpdef_comm.
  assumption.
  rewrite ghplus_comm.
  apply DEFLb.
  assumption.
  apply ghpdef_comm.
  assumption.
  }

  assert (phpdefp2b: ghplusdef p2 b).
  {
  apply ghpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.
  }

  assert (phpdefup1fold: ghplusdef p1 (fold_left ghplus (map m (updl l id (empx, id))) b)).
  {
  apply ghpdef_comm.
  apply ghpdef_fold.
  apply NoDup_updl.
  assumption.
  apply deflg_updl.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  assumption.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x0.
  tauto.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p2.
  apply ghpdef_comm.
  assumption.
  rewrite ghplus_comm.
  unfold defl in DEFL.
  destruct x0.
  simpl in n.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  apply ghpdef_comm.
  assumption.
  apply ghpdef_comm.
  assumption.
  }

  assert (phpdefp0b: forall p0, In p0 (map m (updl l id (empx, id))) -> ghplusdef p0 b).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x0.
  tauto.
  }

  assert (phpdefp0p2: forall p0, In p0 (map m (updl l id (empx, id))) -> ghplusdef p0 p2).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite memp.
  apply ghpdef_comm.
  apply ghpdef_emp.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  destruct x0.
  simpl in n.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  }

  assert (phpdefp2fold: ghplusdef p2 (fold_left ghplus (map m (updl l id (empx, id))) b)).
  {
  apply ghpdef_comm.
  apply ghpdef_fold.
  apply NoDup_updl.
  assumption.
  apply deflg_updl.
  intros.
  rewrite memp.
  apply ghpdef_emp.
  assumption.
  assumption.
  assumption.
  apply ghpdef_comm.
  assumption.
  }

  assert (deflu: defl ghplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (x, id)))).
  {
  apply deflg_updl.
  intros.
  rewrite X.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p2.
  apply ghpdef_comm.
  assumption.
  rewrite ghplus_comm.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  apply ghpdef_comm.
  assumption.
  assumption.
  }

  rewrite ghplus_comm.
  rewrite fold_left_f_m_def with (def:=ghplusdef).
  {
  erewrite fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat))
    (x2:=p1)(id:=id)(x:=empx).
  {
  rewrite updl_updl.
  replace (fold_left ghplus (map m l) b) with 
    (ghplus (ghplus p1 p2) (fold_left ghplus (map m (updl l id (empx,id))) b)).
  {
  rewrite <- ghplus_assoc.
  apply ghplus_mon.
  rewrite ghplus_comm.
  unfold upd.
  unfold phplus.
  reflexivity.
  apply ghpdef_comm.
  assumption.
  apply ghpdef_comm.
  assumption.
  assumption.
  assumption.
  }
  symmetry.
  {
  apply fold_left_move_m_eq with (def:=ghplusdef) (x1:=emp (option nat*nat)).
  apply can_ghpdef.
  assumption.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_emp.
  assumption.
  rewrite ghplus_comm.
  rewrite ghplus_emp.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_emp.
  assumption.
  }
  }
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  tauto.
  rewrite ghplus_comm.
  rewrite ghplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  tauto.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  destruct x1.
  exists a.
  inversion EQx1.
  rewrite <- H1.
  assumption.
  apply ghpdef_comm.
  apply ghpdef_emp.
  assumption.
  }
  apply can_ghpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  assumption.
  intros.
  split.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite X.
  assumption.
  destruct x1.
  simpl in n.
  apply ghpdef_comm.
  apply ghpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  inversion EQ0.
  tauto.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite X.
  assumption.
  destruct x1.
  simpl in n.
  apply DEFLb.
  apply in_map_iff.
  exists (a, z0).
  inversion EQ0.
  tauto.
  apply ghpdef_comm.
  assumption.
Qed.

Lemma fold_phplus_Fork A m:
  forall (l: list (A * Z)) id p1 p2 x b
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (PHPD: phplusdef p1 p2)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
         (X1: (m x, snd x) = (p1, id)),
  fold_left phplus (map m (updl l id x)) (phplus p2 b) =
  fold_left phplus (map m l) b.
Proof.
  intros.
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).
  destruct x.
  inversion X1.
  rewrite H1 in *.

  assert (deflu: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (empx, id)))).
  {
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }

  assert (phpdefp0b: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 b).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  tauto.
  }

  assert (phpdefp0p2: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p2).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  }

  assert (phpdefp0p1: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p1).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  apply phpdef_comm.
  assumption.
  }

  assert (INp1p2: In (phplus p1 p2) (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  exists x.
  inversion EQx.
  tauto.
  }

  assert (phpdefbp2: phplusdef b p2).
  {
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  assumption.
  }

  assert (phpdefbp1: phplusdef b p1).
  {
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  assert (updlua: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (a, id)))).
  {
  apply defl_updl.
  intros.
  rewrite H0.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  assumption.
  }

  assert (phpdefxb: forall x : pheap, In x (map m (updl l id (a, id))) -> phplusdef x b).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite H0.
  apply phpdef_comm.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  }

  assert (phpdefxp2: forall x : pheap, In x (map m (updl l id (a, id))) -> phplusdef x p2).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite H0.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id (snd x1).
  omega.
  assumption.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  }

  rewrite fold_left_f_m_def with (def:=phplusdef).
  {
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p1)(id:=id)(x:=empx).
  {
  rewrite updl_updl.
  replace (fold_left phplus (map m l) b) with 
    (phplus (phplus p1 p2) (fold_left phplus (map m (updl l id (empx,id))) b)).
  {
  rewrite <- phplus_assoc.
  replace (phplus p1 p2) with (phplus p2 p1).
  reflexivity.
  apply phplus_comm.
  apply phpdef_comm.
  assumption.
  apply phpdef_comm.
  assumption.
  apply phpdef_comm.
  {
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  assumption.
  assumption.
  assumption.
  assumption.
  }
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  assumption.
  assumption.
  assumption.
  assumption.
  }

  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef)(x1:=emp knowledge).
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  assumption.
  assumption.
  }
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a, id).
  inversion H0.
  split.
  tauto.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  exists a0.
  inversion EQx.
  rewrite <- H4.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }

  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  intros.
  split.
  apply phpdefxp2.
  assumption.
  apply phpdefxb.
  assumption.
Qed.

Lemma fold_left_upd_NotifyAll A m (m': (A * Z) -> (A * Z)):
  forall (l: list (A * Z)) id z p wt ot x b
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (P1z: exists wt1 ot1, p z = Some (Locked wt1 ot1))
         (X1: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)), id))
         (M': forall x, m x = m (m' x) /\ snd (m' x) = snd x),
     fold_left phplus (map m (updl (map m' l) id x)) b = 
       upd (location_eq_dec Z.eq_dec) (fold_left phplus (map m l) b) z (Some (Locked wt ot)).
Proof.
  intros.
  rewrite eq_map.
  apply fold_left_upd_Notify_1 with (p:=p);
  try assumption.
  assumption.
Qed.


Lemma eq_heap_Acquire A m:
  forall (l: list (A * Z)) id (z z': location Z) (p p1 p2: pheap) x
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 (phplus p1 p2))
         (PHPD: phplusdef p1 p2)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (Pl : p z = Some Lock \/ (exists wt ot, p z = Some (Locked wt ot)))
         (X: exists wt ot, m (x,id) = phplus (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1)
         (p0l: forall p0 (IN: In p0 (map m l) \/ p0 = phplus p1 p2), p0 z = None \/ p0 z = Some Lock)
         (NEQ: z <> z'),
    fold_left phplus (map m (updl l id (x, id))) p2 z' = fold_left phplus (map m l) (phplus p1 p2) z'.
Proof.
  intros.
  destruct X as (wt,(ot,mxid)).
  assert (EXT2:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).

  assert (Inp: In p (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  assert (phpdefpp12: phplusdef p (phplus p1 p2)).
  {
  apply DEFLb.
  assumption.
  }  

  assert (phpdefpp1pp2: phplusdef p p1 /\ phplusdef p p2).
  {
  apply phpdef_dist'.
  assumption.
  assumption.
  }

  assert (deflu: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (empx, id)))).
  {
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }

  assert (phpdefp0p2: forall x1, In x1 l -> phplusdef (m x1) p2).
  {
  intros.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  assert (phpdefup0p2: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p2).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  apply phpdefp0p2.
  assumption.
  }

  assert (phpdefp0p1: forall x1, In x1 l -> phplusdef (m x1) p1).
  {
  intros.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  assert (phpdefup0p1: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p1).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  apply phpdefp0p1.
  assumption.
  }

  assert (phpdefp1fold: phplusdef p1 (fold_left phplus (map m (updl l id (empx, id))) p2)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  assert (phpdefup0p: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p).
  {
  intros.
  unfold updl in H.
  rewrite map_map in H.
  apply in_map_iff in H.
  destruct H as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  unfold defl in DEFL.
  apply DEFL with (snd x1) id.
  omega.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  assumption.
  }

  assert (phpdefpfold: phplusdef p (fold_left phplus (map m (updl l id (empx, id))) p2)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  tauto.
  }

  assert (p1p2N: phplus p1 p2 z = None \/ phplus p1 p2 z = Some Lock).
  {
  apply p0l.
  right.
  reflexivity.
  }

  assert (phpdefupp1: phplusdef (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1).
  {
  apply phpdef_upd_locked.
  tauto.
  apply phplus_locked_mono in p1p2N.
  tauto.
  }

  assert (phpdefupp2: phplusdef (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p2).
  {
  apply phpdef_upd_locked.
  tauto.
  rewrite phplus_comm in p1p2N.
  apply phplus_locked_mono in p1p2N.
  tauto.
  assumption.
  }

  rewrite fold_left_f_m_def with (def:=phplusdef).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=phplus (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1)(id:=id)(x:=empx).
  rewrite updl_updl.
  replace (fold_left phplus (map m l) p2) with
    (phplus p (fold_left phplus (map m (updl l id (empx,id))) p2)).
  rewrite <- phplus_assoc.
  apply phplus_mon.
  replace (phplus p1 p) with (phplus p p1).
  unfold phplus.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) z' z).
  rewrite e in NEQ.
  contradiction.
  reflexivity.
  apply phplus_comm.
  tauto.
  apply phpdef_comm.
  tauto.
  assumption.
  assumption.
  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge).
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  inversion EQ1.
  apply phpdefp0p2.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.

  assert (deflux: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (x, id)))).
  {
  apply defl_updl.
  intros.

  assert (p0N: p0 z = None \/ p0 z = Some Lock).
  {
  apply p0l.
  left.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  }

  rewrite mxid.
  apply phpdef_pair.
  assumption.
  apply phpdef_comm.
  apply phpdef_upd_locked.
  unfold defl in DEFL.
  apply DEFL with id id0.
  assumption.
  assumption.
  assumption.
  tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff in IN0.
  destruct IN0 as (x1, (EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply phpdef_comm.
  tauto.
  assumption.
  }

  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite mxid.
  apply phpdef_pair'.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.

  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x, id).
  split.
  rewrite mxid.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  destruct x1.
  exists a.
  simpl in EQ1.
  inversion EQ1.
  rewrite <- H1.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  apply can_phpdef.
  assumption.
  assumption.
  assumption.
  intros.
  split.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff in IN0.
  destruct IN0 as (x1, (EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply phpdef_comm.
  tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  assumption.
Qed.

Lemma locked_Acquire A m:
   forall (l: list (A * Z)) x p p1 p2 z id wt ot
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 (phplus p1 p2))
          (PHPD: phplusdef p1 p2)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (X: m (x,id) = phplus (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1)
          (Pl : p z = Some Lock \/ (exists wt ot, p z = Some (Locked wt ot)))
          (p'z: forall p0 (IN: In p0 (map m l) \/ p0 = phplus p1 p2), p0 z = None \/ p0 z = Some Lock),
    fold_left phplus (map m (updl l id (x,id))) p2 z = Some (Locked wt ot).
Proof.
  intros.

  assert (p1z: p1 z = None \/ p1 z = Some Lock).
  {
  apply phplus_locked_mono with p2.
  apply p'z.
  right.
  reflexivity.
  }

  assert (p2z: p2 z = None \/ p2 z = Some Lock).
  {
  apply phplus_locked_mono with p1.
  apply p'z.
  right.
  apply phplus_comm.
  apply phpdef_comm.
  assumption.
  }

  assert (INp: In p (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (phpdefpp12: phplusdef p (phplus p1 p2)).
  {
  apply DEFLb.
  assumption.
  }

  assert (phpdefpp1pp2: phplusdef p p1 /\ phplusdef p p2).
  {
  apply phpdef_dist';
  assumption.
  }

  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).

  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=phplus (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1)(id:=id)(x:=empx).
  unfold phplus.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) z z).
  reflexivity.
  contradiction.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_pair.
  apply phpdef_upd_locked;
  tauto.
  apply phpdef_comm.
  apply phpdef_upd_locked.
  unfold defl in DEFL.
  apply DEFL with id id0;
  assumption.
  assert (G: p0 z = None \/  p0 z = Some Lock).
  apply p'z.
  left.
  apply in_map_iff.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  exists x0.
  inversion EQ0.
  tauto.
  tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  exists x0.
  inversion EQ0.
  tauto.
  apply phpdef_comm.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  apply phpdef_pair'.
  apply phpdef_upd_locked;
  tauto.
  apply phpdef_upd_locked;
  tauto.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  destruct x1.
  exists a.
  simpl in EQ1.
  inversion EQ1.
  rewrite <- H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma defl_Acquire A m:
   forall (l: list (A * Z)) id p p1 p2 x z
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (PHPDEF: phplusdef p1 p2)
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 (phplus p1 p2))
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (Pl : p z = Some Lock \/ (exists wt ot ct : bag, p z = Some (Locked wt ot)))
          (X: exists wt ot, m (x,id) = phplus (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1)
          (p'z: forall p0 (IN: In p0 (map m l) \/ p0 = phplus p1 p2), p0 z = None \/ p0 z = Some Lock),
     defl phplusdef (map (fun x => (m x, snd x)) (updl l id (x,id))).
Proof.
  intros.
  assert (p1z: p1 z = None \/ p1 z = Some Lock).
  {
  apply phplus_locked_mono with p2.
  apply p'z.
  right.
  reflexivity.
  }

  assert (p2z: p2 z = None \/ p2 z = Some Lock).
  {
  apply phplus_locked_mono with p1.
  apply p'z.
  right.
  apply phplus_comm.
  apply phpdef_comm.
  assumption.
  }

  assert (phpdefpp12: phplusdef p (phplus p1 p2)).
  {
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  exists x1.
  inversion EQ1.
  tauto.
  }

  assert (phpdefpp1pp2: phplusdef p p1 /\ phplusdef p p2).
  {
  apply phpdef_dist'.
  assumption.
  assumption.
  }

  unfold defl in *.
  unfold updl in *.
  intros.
  rewrite map_map in *.
  destruct X as (wt,(ot,EQm)).
  apply in_map_iff in IN1.
  destruct IN1 as (x0,(EQx,INx)).
  destruct (Z.eq_dec (snd x0) id).
  inversion EQx.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  omega.
  rewrite <- H1.
  rewrite EQm.
  apply phpdef_pair'.
  apply phpdef_upd_locked.
  tauto.
  tauto.
  apply phpdef_upd_locked.
  apply DEFL with id id2.
  omega.
  assumption.
  apply in_map_iff.
  exists x3.
  tauto.
  inversion EQx3.
  assert (G:  m x3 z = None \/ m x3 z = Some Lock).
  {
  apply p'z.
  left.
  apply in_map.
  assumption.
  }
  tauto.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff.
  exists x3.
  inversion EQx3.
  tauto.
  apply phpdef_comm.
  assumption.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  destruct (Z.eq_dec (snd x3) id).
  inversion EQx3.
  rewrite <- H1.
  rewrite EQm.
  apply phpdef_pair.
  apply phpdef_upd_locked.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ,IN)).
  apply in_map_iff.
  exists x1.
  inversion EQ.
  tauto.
  apply phpdef_comm.
  assumption.
  tauto.
  apply phpdef_comm.
  apply phpdef_upd_locked.
  apply DEFL with id id1.
  omega.
  assumption.
  apply in_map_iff.
  exists x0.
  tauto.
  inversion EQx.
  assert (G: m x0 z = None \/ m x0 z = Some Lock).
  {
  apply p'z.
  left.
  apply in_map.
  assumption.
  }
  tauto.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ,IN)).
  apply in_map_iff.
  exists x0.
  inversion EQx.
  tauto.
  apply phpdef_comm.
  assumption.
  apply DEFL with id1 id2.
  omega.
  apply in_map_iff.
  exists x0.
  inversion EQx.
  tauto.
  apply in_map_iff.
  exists x3.
  tauto.
Qed.

Lemma boundph_Acquire A m:
   forall (l: list (A * Z)) x p p1 p2 z id
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 (phplus p1 p2))
          (PHPD: phplusdef p1 p2)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (X: exists wt ot, m (x,id) = phplus (upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))) p1)
          (Pl : p z = Some Lock \/ (exists wt ot, p z = Some (Locked wt ot)))
          (BPT: boundph (fold_left phplus (map m l) (phplus p1 p2)))
          (p'z: forall p0 (IN: In p0 (map m l) \/ p0 = phplus p1 p2), p0 z = None \/ p0 z = Some Lock),
    boundph (fold_left phplus (map m (updl l id (x,id))) p2).
Proof.
  intros.
  unfold boundph.
  intros.
  destruct X as (wt,(ot,X)).
  destruct ((location_eq_dec Z.eq_dec) x0 z).
  rewrite e in *.
  rewrite locked_Acquire with (p:=p) (p1:=p1) (wt:=wt) (ot:=ot) in H; try assumption.
  inversion H.
  rewrite eq_heap_Acquire with (z:=z) (p:=p) (p1:=p1) in H; try assumption.
  unfold boundph in BPT.
  apply BPT with x0 z0.
  assumption.
  exists wt, ot.
  assumption.
  unfold not.
  intros.
  rewrite H0 in n.
  contradiction.
Qed.

Lemma locked_fold_phtoheap A m:
  forall (l: list (A * Z)) id p b (h: heap) z
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (Pl : p z = Some Lock \/ (exists wt ot: bag, p z = Some (Locked wt ot)))
         (hz': h (Aof z) = Some 1%Z)
         (PH2H: phtoh (fold_left phplus (map m l) b) h),
    forall p' (IN: In p' (map m l) \/ p' = b), p' z = None \/ p' z = Some Lock.
Proof.
  intros.
  assert (EXT1:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).

  assert (phpdefpb: phplusdef p b).
  {
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  exists x1.
  inversion EQ1.
  tauto.
  }

  assert (G: phtoh (phplus p (fold_left phplus (map m (updl l id (empx, id))) b)) h).
  {
  erewrite <- fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p)(id:=id)(x:=empx).
  assumption.
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  rewrite phplus_comm.
  rewrite phplus_emp.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }

  assert (pz: p z = Some Lock).
  {
  destruct Pl as [pz|pz].
  assumption.
  unfold phtoh in G.
  destruct G as (G,G1).
  unfold phplus in G.
  specialize G with z.
  destruct pz as (wt,(ot,pz)).
  rewrite pz in G.
  rewrite hz' in G.
  inversion G.
  }

  assert (deflu: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (empx, id)))).
  {
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }

  destruct IN0 as [INp'|EQp'].
  {
  apply in_map_iff in INp'.
  destruct INp' as (x0,(EQ0,IN0)).
  inversion EQ0.
  destruct x0.
  destruct (Z.eq_dec z0 id).
  {
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  destruct x1.
  inversion EQ1.
  simpl in H2.
  rewrite e in *.
  rewrite H2 in *.
 
  assert (EQa: a0 = a).
  {
  eapply unique_key_eq.
  apply IN1.
  apply IN0.
  assumption.
  }
  rewrite <- EQa in EQ0.
  rewrite EQ0 in H1.
  rewrite H.
  rewrite H1.
  right.
  assumption.
  }

  assert (phpdefpp': phplusdef p p').
  {
  unfold defl in DEFL.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a,z0).
  rewrite EQ0.
  tauto.
  }

  assert (phpdefpp'1:=phpdefpp').
  unfold phplusdef in phpdefpp'.
  specialize phpdefpp' with z.
  rewrite pz in phpdefpp'.
  rewrite H.
  destruct (p' z) eqn:p'z.
  destruct k;
  try tauto.
  Focus 2.
  left.
  reflexivity.

  specialize EXT1 with z0 (emp knowledge).
  destruct EXT1 as (empx1,memp1).

  assert (deflu1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl (updl l id (empx, id)) z0 (empx1, z0)))).
  {
  apply defl_updl.
  intros.
  rewrite memp1.
  apply phpdef_emp.
  assumption.
  }

  assert (G1: phtoh (phplus p (phplus p' (fold_left phplus (map m (updl (updl l id (empx, id)) z0 (empx1,z0))) b))) h).
  {
  erewrite <- fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p')(id:=z0)(x:=empx1).
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (a, z0).
  rewrite H.
  split.
  tauto.
  apply in_updl_neq.
  omega.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }

  assert (phpdefbp': phplusdef b p').
  {
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  exists (a, z0).
  inversion EQ0.
  tauto.
  }

  assert (phpdefpfold: phplusdef p (fold_left phplus (map m (updl (updl l id (empx, id)) z0 (empx1, z0))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  assumption.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  destruct (Z.eq_dec id z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  destruct (Z.eq_dec id z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  unfold defl in DEFL.
  apply DEFL with (snd x1) id.
  omega.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  assumption.
  apply phpdef_comm.
  assumption.
  }

  assert (phpdefp'fold: phplusdef p' (fold_left phplus (map m (updl (updl l id (empx, id)) z0 (empx1, z0))) b)).
  {
  apply phpdef_comm.

  apply phpdef_fold.
  apply NoDup_updl.
  apply NoDup_updl.
  assumption.
  assumption.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  destruct (Z.eq_dec id z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  intros.
  unfold updl in IN1.
  rewrite map_map in IN1.
  rewrite map_map in IN1.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  simpl in EQ1.
  destruct (Z.eq_dec id z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  destruct (Z.eq_dec (snd x1) z0).
  rewrite <- EQ1.
  rewrite memp1.
  apply phpdef_comm.
  apply phpdef_emp.
  unfold defl in DEFL.
  apply DEFL with (snd x1) z0.
  omega.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply in_map_iff.
  exists (a, z0).
  rewrite EQ0.
  tauto.
  assumption.
  }

  assert (G2: phtoh (phplus (phplus p p') (fold_left phplus (map m (updl (updl l id (empx, id)) z0 (empx1, z0))) b)) h).
  {
  rewrite phplus_assoc.
  assumption.
  assumption.
  assumption.
  assumption.
  }

  unfold phtoh in G2.
  destruct G2 as (G2,G3).
  specialize G2 with z.
  unfold phplus in G2.
  rewrite pz in G2.
  rewrite p'z in G2.
  rewrite hz' in G2.
  inversion G2.
  }
  rewrite EQp'.
  assert (G1: phtoh (phplus p (phplus b (fold_left phplus (map m (updl l id (empx, id))) (emp knowledge)))) h).
  {
  rewrite <- fold_left_f_m_def with (def:=phplusdef).
  rewrite phplus_emp.
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  assumption.
  apply phpdef_emp.
  intros.
  split.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  rewrite <- EQ1.
  tauto.
  apply phpdef_emp.
  }

  assert (G2: phtoh (phplus (phplus p b) (fold_left phplus (map m (updl l id (empx, id))) (emp knowledge))) h).
  {
  rewrite phplus_assoc.
  assumption.
  assumption.
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  assumption.
  intros.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  unfold defl in DEFL.
  apply DEFL with (snd x1) id.
  omega.
  apply in_map_iff.
  exists x1.
  rewrite <- EQ1.
  tauto.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  }
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  assumption.
  intros.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite memp.
  apply phpdef_comm.
  apply phpdef_emp.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  rewrite <- EQ1.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  }

  assert (phpdefpb2:=phpdefpb).
  unfold phplusdef in phpdefpb.
  specialize phpdefpb with z.
  rewrite pz in phpdefpb.
  destruct (b z) eqn:bz.
  destruct k;
  try tauto.
  Focus 2.
  left.
  reflexivity.
  unfold phtoh in G2.
  destruct G2 as (G2,G3).
  specialize G2 with z.
  unfold phplus in G2.
  rewrite pz in G2.
  rewrite bz in G2.
  rewrite hz' in G2.
  inversion G2.
Qed.

Lemma ulock_dischu A m:
   forall (l: list (A * Z)) x p b z id wt ot
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (pz: exists wt ot, p z = Some (Ulock wt ot))
          (X: m (x,id) = upd (location_eq_dec Z.eq_dec) p z (Some (Ulock wt ot))),
    fold_left phplus (map m (updl l id (x,id))) b z = Some (Ulock wt ot).
Proof.
  intros.
  assert (p0zn: forall p0 id0 (NEQ: id <> id0)
    (IN: In (p0, id0) (map (fun x : A * Z => (m x, snd x)) l)),
    p0 z = None).
  {
  intros.
  assert (pd: phplusdef p0 p).
  {
  apply DEFL with id0 id.
  omega.
  assumption.
  assumption.
  }
  unfold phplusdef in pd.
  specialize pd with z.
  destruct pz as (wt1,(ot1,pz)).
  rewrite pz in pd.
  destruct (p0 z).
  destruct k; contradiction.
  reflexivity.
  }

  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p z (Some (Ulock wt ot)))(id:=id)(x:=empx).
  unfold phplus.
  unfold upd.
  repeat dstr_.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_comm.
  apply phpdef_ulock.
  unfold defl in DEFL.
  apply DEFL with id id0;
  tauto.
  apply p0zn with id0; assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  apply phpdef_ulock.
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  exists x2.
  inversion EQ2.
  tauto.
  assert (pd: phplusdef p b).
  {
  apply DEFLb.
  apply in_map_iff in IN.
  destruct IN as (x3,(EQ,IN)).
  apply in_map_iff.
  exists x3.
  inversion EQ.
  auto.
  }
  unfold phplusdef in pd.
  specialize pd with z.
  destruct pz as (wt1,(ot1,pz)).
  rewrite pz in pd.
  destruct (b z).
  destruct k; contradiction.
  reflexivity.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  destruct x2.
  exists a.
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma eq_heap_dischu A m:
   forall (l: list (A * Z)) x p b z z' id
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (pz: exists wt ot, p z = Some (Ulock wt ot))
          (X: exists wt ot, m (x,id) = upd (location_eq_dec Z.eq_dec) p z (Some (Ulock wt ot)))
          (NEQ: z <> z'),
    fold_left phplus (map m (updl l id (x,id))) b z' = fold_left phplus (map m l) b z'.
Proof.
  intros.
  assert (p0zn: forall p0 id0 (NEQ: id <> id0)
    (IN: In (p0, id0) (map (fun x : A * Z => (m x, snd x)) l)),
    p0 z = None).
  {
  intros.
  assert (pd: phplusdef p0 p).
  {
  apply DEFL with id0 id.
  omega.
  assumption.
  assumption.
  }
  unfold phplusdef in pd.
  specialize pd with z.
  destruct pz as (wt1,(ot1,pz)).
  rewrite pz in pd.
  destruct (p0 z).
  destruct k; contradiction.
  reflexivity.
  }

  destruct X as (wt,(ot,X)).
  destruct pz as (wt1,(ot1,pz)).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p z (Some (Ulock wt ot)))(id:=id)(x:=empx).
  rewrite updl_updl.
  replace (fold_left phplus (map m l) b) with 
    (phplus p (fold_left phplus (map m (updl l id (empx,id))) b)).
  unfold phplus.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) z' z).
  symmetry in e.
  contradiction.
  reflexivity.
  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge).
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  assumption.
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_comm.
  apply phpdef_ulock.
  unfold defl in DEFL.
  apply DEFL with id id0;
  tauto.
  apply p0zn with id0; assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  apply phpdef_ulock.
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  exists x2.
  inversion EQ2.
  tauto.
  assert (pd: phplusdef p b).
  {
  apply DEFLb.
  apply in_map_iff in IN.
  destruct IN as (x3,(EQ,IN)).
  apply in_map_iff.
  exists x3.
  inversion EQ.
  auto.
  }
  unfold phplusdef in pd.
  specialize pd with z.
  rewrite pz in pd.
  destruct (b z).
  destruct k; contradiction.
  reflexivity.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  tauto.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  destruct x2.
  exists a.
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma boundph_dischu A m:
   forall (l: list (A * Z)) x p b z id
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (pz: exists wt ot, p z = Some (Ulock wt ot))
          (X: exists wt ot, m (x,id) = upd (location_eq_dec Z.eq_dec) p z (Some (Ulock wt ot)))
          (BPT: boundph (fold_left phplus (map m l) b)),
    boundph (fold_left phplus (map m (updl l id (x,id))) b).
Proof.
  intros.
  unfold boundph.
  intros.
  destruct ((location_eq_dec Z.eq_dec) x0 z).
  rewrite e in *.
  destruct X as (wt,(ot,X)).
  rewrite ulock_dischu with (p:=p)(wt:=wt)(ot:=ot) in H;
  try assumption.
  inversion H.
  rewrite eq_heap_dischu with (p:=p) (z:=z) in H;
  try assumption.
  unfold boundph in BPT.
  apply BPT with x0 z0.
  assumption.
  unfold not.
  intros.
  symmetry in H0.
  contradiction.
Qed.

Lemma fold_some A m:
  forall (l: list (A * Z)) z b
          (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (pzn: exists p (IN: In p (map m l)), p z <> None),
    fold_left phplus (map m l) b z <> None.
Proof.
  intros.
  destruct pzn as (p,(IN,pz)).
  apply in_map_iff in IN.
  destruct IN as ((x,id),(EQx,INx)).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).

  assert (phpdefpfold: phplusdef p (fold_left phplus (map m (updl l id (empx, id))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold; repeat php_.
  apply NoDup_updl.
  assumption.
  unfold defl.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  inversion EQ1.
  rewrite <- H1.
  rewrite memp.
  repeat php_.
  inversion EQ1.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  destruct (Z.eq_dec (snd x2) id).
  inversion EQ2.
  rewrite <- H3.
  rewrite memp.
  repeat php_.  
  inversion EQ2.
  apply DEFL with (snd x1) (snd x2).
  omega.
  apply in_map_iff.
  exists x1.
  auto.
  apply in_map_iff.
  exists x2.
  auto.

  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  inversion EQ1.
  rewrite memp.
  repeat php_.
  inversion EQ1.
  apply DEFLb.
  apply in_map.
  assumption.

  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  inversion EQ1.
  rewrite memp.
  repeat php_.
  inversion EQ1.
  apply DEFL with (snd x1) id.
  assumption.
  apply in_map_iff.
  exists x1.
  auto.
  apply in_map_iff.
  exists (x, id).
  rewrite EQx.
  auto.
  apply phpdef_comm.
  apply DEFLb.
  apply in_map_iff.
  exists (x, id).
  rewrite EQx.
  auto.
  }
  rewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge) (x2:=p) (id:=id) (x:=empx); repeat php_.
  apply phplus_some; repeat php_.
  apply can_phpdef.
  apply in_map_iff.
  exists (x, id).
  inversion EQx.
  auto.
Qed.

Lemma eq_heap_Val A m:
  forall (l: list (A * Z)) p id b
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l)),
    fold_left phplus (map m (filter (fun x => negb (snd x =? id)%Z) l)) (phplus b p) = fold_left phplus (map m l) b.
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.

  assert (phpdefbma: phplusdef b (m a)).
  {
  apply phpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  }

  assert (PHPD0: forall p0 : pheap, In p0 (map m l) -> phplusdef p0 (phplus b (m a))).
  {
  intros.
  apply phpdef_pair.
  assumption.
  apply DEFLb.
  right.
  assumption.
  apply in_map_iff in H.
  destruct H as (x,(EQx,INx)).
  apply DEFL with (snd x) (snd a).
  unfold not.
  intros.
  inversion NODUP.
  apply H2.
  rewrite <- H.
  apply in_map_iff.
  exists x.
  tauto.
  right.
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  left.
  reflexivity.
  }

  destruct IN as [EQ|IN].
  inversion EQ.
  destruct (snd a =? snd a)%Z eqn:EQ1.
  Focus 2.
  apply neqb_neq in EQ1.
  contradiction.
  simpl.
  rewrite filter_list.
  reflexivity.
  intros.
  destruct (snd x =? snd a)%Z eqn:xa.
  apply Z.eqb_eq in xa.
  exfalso.
  inversion NODUP.
  apply H3.
  apply in_map_iff.
  exists x.
  tauto.
  reflexivity.

  assert (inp: In p (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  }

  destruct (snd a =? id)%Z eqn:aid.
  apply Z.eqb_eq in aid.
  exfalso.
  inversion NODUP.
  apply H1.
  rewrite aid.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  apply neqb_neq in aid.
  simpl.
  replace (phplus (phplus b p) (m a)) with (phplus (phplus b (m a)) p).
  apply IHl.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  assumption.
  assumption.
  rewrite phplus_comm.
  rewrite <- phplus_assoc.
  replace (phplus p b) with (phplus b p).
  reflexivity.
  apply phplus_comm.
  apply phpdef_comm.
  apply DEFLb.
  right.
  assumption.
  apply DEFLb.
  right.
  assumption.
  apply DEFL with id (snd a).
  omega.
  right.
  assumption.
  left.
  reflexivity.
  apply phpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply phpdef_comm.
  apply PHPD0.
  assumption.
Qed.

Lemma eq_gheap_Val A m:
  forall (l: list (A * Z)) p id b
          (NODUP: NoDup (map snd l))
          (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l)),
    fold_left ghplus (map m (filter (fun x => negb (snd x =? id)%Z) l)) (ghplus b p) = fold_left ghplus (map m l) b.
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.

  assert (ghpdefbma: ghplusdef b (m a)).
  {
  apply ghpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  }

  assert (GHPD0: forall p0, In p0 (map m l) -> ghplusdef p0 (ghplus b (m a))).
  {
  intros.
  apply ghpdef_pair.
  assumption.
  apply DEFLb.
  right.
  assumption.
  apply in_map_iff in H.
  destruct H as (x,(EQx,INx)).
  apply DEFL with (snd x) (snd a).
  unfold not.
  intros.
  inversion NODUP.
  apply H2.
  rewrite <- H.
  apply in_map_iff.
  exists x.
  tauto.
  right.
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  left.
  reflexivity.
  }

  destruct IN as [EQ|IN].
  inversion EQ.
  destruct (snd a =? snd a)%Z eqn:EQ1.
  Focus 2.
  apply neqb_neq in EQ1.
  contradiction.
  simpl.
  rewrite filter_list.
  reflexivity.
  intros.
  destruct (snd x =? snd a)%Z eqn:xa.
  apply Z.eqb_eq in xa.
  exfalso.
  inversion NODUP.
  apply H3.
  apply in_map_iff.
  exists x.
  tauto.
  reflexivity.

  assert (inp: In p (map m l)).
  {
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  }

  destruct (snd a =? id)%Z eqn:aid.
  apply Z.eqb_eq in aid.
  exfalso.
  inversion NODUP.
  apply H1.
  rewrite aid.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  apply neqb_neq in aid.
  simpl.
  replace (ghplus (ghplus b p) (m a)) with (ghplus (ghplus b (m a)) p).
  apply IHl.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  assumption.
  assumption.
  rewrite ghplus_comm.
  rewrite <- ghplus_assoc.
  replace (ghplus p b) with (ghplus b p).
  reflexivity.
  apply ghplus_comm.
  apply ghpdef_comm.
  apply DEFLb.
  right.
  assumption.
  apply DEFLb.
  right.
  assumption.
  apply DEFL with id (snd a).
  omega.
  right.
  assumption.
  left.
  reflexivity.
  apply ghpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply ghpdef_comm.
  apply GHPD0.
  assumption.
Qed.

Lemma lock_initl A m:
  forall (l: list (A * Z)) id z z' p1 p2 x b
         (EXT: forall z p, exists x, m (x, z) = p)
         (NODUP: NoDup (map snd l))
         (PHPD: phplusdef p1 p2)
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
         (P1z: exists wt1 ot1, p1 z = Some (Ulock wt1 ot1))
         (PzN: z <> z' -> fold_left phplus (map m l) b z' = None)
         (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock), id)),
     (z' <> z -> fold_left phplus (map m (updl l id x)) (phplus b p2) z = None) /\
     fold_left phplus (map m (updl l id x)) (phplus b p2) z' = Some Lock.
Proof.
  intros.
  destruct x.
  inversion X.
  rewrite H1 in *.
  subst.

  assert (IN1:=IN).
  apply in_map_iff in IN1.
  destruct IN1 as (x12,(EQx,INx)).
  assert (EXTE:=EXT).
  specialize EXT with id p2.
  destruct EXT as (x2, mx2).
  destruct P1z as (wt, (ot, p1z)).

  assert (G1: phplus p1 (fold_left phplus (map m (updl l id (x2, id))) b) z = Some (Ulock wt ot)).
  {
  unfold phplus;
  rewrite p1z;
  tauto;
  reflexivity.
  }

  assert (PHPDF: phplusdef p1 (fold_left phplus (map m (updl l id (x2, id))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite mx2.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  assumption.
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x0.
  tauto.
  }
  {
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x0) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_comm.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  unfold defl in DEFL.
  destruct x0.
  simpl in n.
  apply DEFL with id z0.
  omega.
  assumption.
  apply in_map_iff.
  exists (a0,z0).
  inversion EQ0.
  tauto.
  apply phpdef_comm.
  assumption.
  }
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  apply phpdef_comm.
  assumption.
  rewrite phplus_comm.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply phpdef_comm.
  assumption.
  }

  assert (G2: fold_left phplus (map m (updl l id (x2, id))) b z = None).
  {
  unfold phplus in G1.
  rewrite p1z in G1.
  inversion G1.
  apply phplus_ulock_mon with p1 wt ot.
  assumption.
  assumption.
  }

  specialize EXTE with id (emp knowledge).
  destruct EXTE as (empx, memp).


  assert (DEFL1: defl phplusdef (map (fun x : A * Z => (m x, snd x)) (updl l id (a, id)))).
  {
  apply defl_updl.
  intros.
  inversion X.
  rewrite H1.
  apply phpdef_comm.
  apply phpdef_v.
  apply phpdef_none.
  apply phpdef_assoc_mon with p2.
  php_.
  rewrite phplus_comm.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  php_.
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  assert (phpdefpp12: phplusdef p (phplus p1 p2)).
  {
  apply DEFL with id0 id.
  omega.
  assumption.
  assumption.
  }
  unfold phplusdef in phpdefpp12.
  specialize phpdefpp12 with z.
  unfold phplus in phpdefpp12.
  rewrite p1z in phpdefpp12.
  destruct (p z).
  destruct k; inversion phpdefpp12.
  reflexivity.
  apply fold_None with (m:=m) (l:=l) (b:=b); repeat php_.
  apply PzN.
  assumption.
  left.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  apply in_map_iff.
  exists x0.
  inversion EQ0.
  auto.
  assumption.
  }

  assert (inp1p2: In (phplus p1 p2) (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQ0,IN0)).
  exists x0.
  inversion EQ0.
  auto.
  }

  assert (phpdefp12b: phplusdef (phplus p1 p2) b).
  {
  apply DEFLb.
  assumption.
  }

  assert (phpdefp2b: phplusdef p2 b).
  {
  apply phpdef_assoc_mon with p1; repeat php_.
  }

  assert (phpdefp1b: phplusdef p1 b).
  {
  apply phpdef_assoc_mon with p2. repeat php_.
  rewrite phplus_comm; repeat php_.
  }


  assert (bz': b z' = None).
  {
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  unfold phplusdef in phpdefp1b.
  specialize phpdefp1b with z.
  rewrite p1z in phpdefp1b.
  destruct (b z).
  contradiction.
  reflexivity.
  apply fold_None with (m:=m) (l:=l) (b:=b); repeat php_.
  auto.
  auto.
  }

  assert (p2z': p2 z' = None).
  {
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  unfold phplusdef in PHPD.
  specialize PHPD with z.
  rewrite p1z in PHPD.
  destruct (p2 z).
  contradiction.
  reflexivity.
  apply phplus_none_mon with p1.
  apply fold_None with (m:=m) (l:=l) (b:=b); repeat php_.
  apply PzN.
  assumption.
  left.
  assumption.
  }

  assert (G2': (fold_left phplus (map m (updl l id (x2, id))) b) z' = None).
  {
  apply fold_none'; repeat php_.
  apply NoDup_updl.
  assumption.

  apply defl_updl.
  intros.
  rewrite mx2.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  php_.
  apply DEFL with id id0.
  assumption.
  assumption.
  assumption.
  assumption.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as ((x0,id0),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id0 id).
  rewrite <- EQ0.
  rewrite mx2.
  assumption.
  rewrite <- EQ0.
  apply DEFLb.
  apply in_map.
  assumption.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as ((x0,id0),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id0 id).
  rewrite <- EQ0.
  rewrite mx2.
  assumption.
  rewrite <- EQ0.
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  assert (phpd: phplusdef (m (x0,id0)) p1).
  {
  apply phpdef_comm.
  apply phpdef_assoc_mon with p2.
  php_.
  rewrite phplus_comm.
  apply DEFL with id id0.
  omega.
  assumption.
  apply in_map_iff.
  exists (x0, id0).
  auto.
  php_.
  }
  unfold phplusdef in phpd.
  specialize phpd with z.
  rewrite p1z in phpd.
  destruct (m (x0,id0) z).
  destruct k; inversion phpd.
  reflexivity.
  apply fold_None with A m l b; repeat php_.
  apply PzN.
  assumption.
  left.
  apply in_map.
  assumption.
  }

  assert (G3:
    phplus p2 (fold_left phplus (map m (updl (updl l id (x2, id)) id (empx, id))) b) z = None).
  {
  rewrite <- fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p2)(id:=id)(x:=empx).
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite mx2.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x2, id).
  split.
  rewrite mx2.
  tauto.
  unfold updl.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  repeat dstr_.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }

  assert (G4: fold_left phplus (map m (updl l id (empx, id))) (phplus b p2) z = None).
  {
  rewrite updl_updl in G3.
  rewrite <- fold_left_f_m_def with (def:=phplusdef) in G3.
  rewrite phplus_comm in G3.
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  split.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_emp.
  split.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  destruct x1.
  unfold defl in DEFL.
  apply DEFL with id z0.
  simpl in n.
  omega.
  assumption.
  apply in_map_iff.
  exists (a0, z0).
  inversion EQ0.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  }

  assert (G3': phplus p2 (fold_left phplus (map m (updl (updl l id (x2, id)) id (empx, id))) b) z' = None).
  {
  intros.
  rewrite <- fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=p2)(id:=id)(x:=empx).
  apply G2'.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite mx2.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  unfold defl in DEFL.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite mx2.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x2, id).
  split.
  rewrite mx2.
  tauto.
  unfold updl.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  repeat dstr_.
  tauto.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  }

  assert (G4': fold_left phplus (map m (updl l id (empx, id))) (phplus b p2) z' = None).
  {
  rewrite updl_updl in G3'.
  rewrite <- fold_left_f_m_def with (def:=phplusdef) in G3'.
  rewrite phplus_comm in G3'.
  assumption.
  apply can_phpdef.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x12.
  inversion EQx.
  tauto.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ0.
  rewrite memp.
  split.
  apply phpdef_comm.
  apply phpdef_emp.
  apply phpdef_comm.
  apply phpdef_emp.
  split.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  destruct x1.
  unfold defl in DEFL.
  apply DEFL with id z0.
  simpl in n.
  omega.
  assumption.
  apply in_map_iff.
  exists (a0, z0).
  inversion EQ0.
  tauto.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ0.
  tauto.
  }



  assert (phpdefpnbp2: phplusdef (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))
    (phplus b p2)).
  {
  apply phpdef_v.
  apply phpdef_none.
  apply phpdef_pair; repeat php_.
  apply phplus_none; assumption.
  }

  assert (phpdefxbp2: forall x : pheap,
    In x (map m (updl l id (a, id))) -> phplusdef x (phplus b p2)).
  {
  intros p0 IN0.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as ((x0,id0),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id0 id).
  rewrite <- EQ0.
  rewrite H0.

  assumption.
  rewrite <- EQ0.
  apply phpdef_pair; repeat php_.
  apply DEFLb.
  apply in_map.
  assumption.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id id0.
  omega.
  assumption.
  apply in_map_iff.
  exists (x0, id0).
  auto.
  }

  assert (INu: In (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock), id)
    (map (fun x : A * Z => (m x, snd x)) (updl l id (a, id)))).
  {
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx1,INx1)).
  exists x.
  inversion EQx1.
  rewrite eqz.
  rewrite H2.
  rewrite H0.
  auto.
  }

  split.
  {
  intros.
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))(id:=id)(x:=empx); repeat php_.
  {
  rewrite updl_updl.
  apply phplus_none.
  unfold upd.
  repeat dstr_.
  assumption.
  }
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  }

  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))(id:=id)(x:=empx); repeat php_.
  {
  rewrite updl_updl.
  unfold phplus at 1.
  rewrite G4'.
  repeat dstr_.
  }
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
Qed.

Lemma locked_disch A m:
   forall (l: list (A * Z)) x p b z id wt ot
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (pz: exists wt ot, p z = Some (Locked wt ot))
          (X: m (x,id) = upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot))),
    fold_left phplus (map m (updl l id (x,id))) b z = Some (Locked wt ot).
Proof.
  intros.
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)))(id:=id)(x:=empx).
  unfold phplus.
  unfold upd.
  repeat dstr_.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_comm.
  apply phpdef_locked.
  unfold defl in DEFL.
  apply DEFL with id id0;
  tauto.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  apply phpdef_locked.
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  exists x2.
  inversion EQ2.
  tauto.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  destruct x2.
  exists a.
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma eq_heap_disch A m:
   forall (l: list (A * Z)) x p b z z' id
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (pz: exists wt ot, p z = Some (Locked wt ot))
          (X: exists wt ot, m (x,id) = upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)))
          (NEQ: z <> z'),
    fold_left phplus (map m (updl l id (x,id))) b z' = fold_left phplus (map m l) b z'.
Proof.
  intros.
  destruct X as (wt,(ot,X)).
  destruct pz as (wt1,(ot1,pz)).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)))(id:=id)(x:=empx).
  rewrite updl_updl.
  replace (fold_left phplus (map m l) b) with 
    (phplus p (fold_left phplus (map m (updl l id (empx,id))) b)).
  unfold phplus.
  unfold upd.
  destruct ((location_eq_dec Z.eq_dec) z' z).
  symmetry in e.
  contradiction.
  reflexivity.
  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge).
  apply can_phpdef.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
  assumption.
  assumption.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_comm.
  apply phpdef_locked.
  unfold defl in DEFL.
  apply DEFL with id id0;
  tauto.
  exists wt1, ot1.
  assumption.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  intros.
  unfold updl in IN0.
  rewrite map_map in IN0.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ1,IN1)).
  destruct (Z.eq_dec (snd x1) id).
  rewrite <- EQ1.
  rewrite X.
  apply phpdef_locked.
  apply DEFLb.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  exists x2.
  inversion EQ2.
  tauto.
  exists wt1, ot1.
  assumption.
  apply DEFLb.
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  rewrite phplus_comm.
  rewrite phplus_emp.
  apply in_map_iff.
  exists (x,id).
  rewrite X.
  split.
  tauto.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x2,(EQ2,IN2)).
  destruct x2.
  exists a.
  simpl in EQ2.
  inversion EQ2.
  rewrite <- H1.
  assumption.
  apply phpdef_comm.
  apply phpdef_emp.
  assumption.
Qed.

Lemma boundph_disch A m:
   forall (l: list (A * Z)) x p b z id
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (pz: exists wt ot, p z = Some (Locked wt ot))
          (X: exists wt ot, m (x,id) = upd (location_eq_dec Z.eq_dec) p z (Some (Locked wt ot)))
          (BPT: boundph (fold_left phplus (map m l) b)),
    boundph (fold_left phplus (map m (updl l id (x,id))) b).
Proof.
  intros.
  unfold boundph.
  intros.
  destruct ((location_eq_dec Z.eq_dec) x0 z).
  rewrite e in *.
  destruct X as (wt,(ot,X)).
  rewrite locked_disch with (p:=p)(wt:=wt)(ot:=ot) in H;
  try assumption.
  inversion H.
  rewrite eq_heap_disch with (p:=p) (z:=z) in H;
  try assumption.
  unfold boundph in BPT.
  apply BPT with x0 z0.
  assumption.
  unfold not.
  intros.
  symmetry in H0.
  contradiction.
Qed.

Definition uboundph (p: pheap) :=
  forall x f z, p x = Some (Cell f z) -> f <= 1.

Lemma uboundph_fold:
  forall l b 
         (BPE: forall p (IN: In p l), boundph p)
         (BPT: boundph (fold_left phplus l b)),
    uboundph b.
Proof.
  induction l.
  simpl.
  intros.
  unfold boundph in *.
  unfold uboundph.
  intros.
  apply BPT in H.
  tauto.
  simpl.
  intros.
  assert (UB: uboundph (phplus b a)).
  {
  apply IHl.
  intros.
  apply BPE.
  right.
  assumption.
  assumption.
  }
  assert (Ba: boundph a).
  {
  apply BPE.
  left.
  reflexivity.
  }
  unfold uboundph in *.
  unfold boundph in *.
  intros.
  specialize UB with (x:=x).
  specialize Ba with (x:=x).
  unfold phplus in UB.
  rewrite H in UB.
  destruct (a x).
  destruct k;
  try tauto.
  assert (G1: f + f0 <= 1).
  apply UB with z.
  reflexivity.
  assert (G2: 0 < f0 /\ f0 <= 1).
  apply Ba with z0.
  reflexivity.
  apply Qc_Le_mon1 with f0.
  tauto.
  tauto.
  apply UB with z.
  reflexivity.
  apply UB with z.
  reflexivity.
  apply UB with z.
  reflexivity.
  apply UB with z.
  reflexivity.
  apply UB with z.
  reflexivity.
  apply UB with z.
  reflexivity.
  apply UB with z.
  reflexivity.
Qed.

Definition lboundph (p: pheap) :=
  forall x f z, p x = Some (Cell f z) -> 0 < f.

Lemma boundph_lboundph:
  forall p (BP: boundph p),
    lboundph p.
Proof.
  unfold boundph.
  unfold lboundph.
  intros.
  apply BP in H.
  tauto.
Qed.

Lemma lboundph_phplus:
  forall p1 p2
         (BP1: lboundph p1)
         (BP2: lboundph p2),
    lboundph (phplus p1 p2).
Proof.
  unfold lboundph.
  unfold phplus.
  intros.
  specialize BP1 with (x:=x).
  specialize BP2 with (x:=x).
  destruct (p1 x).
  destruct k;
  try tauto.
  assert (G: 0 < f0).
  {
  apply BP1 with z0.
  reflexivity.
  }
  destruct (p2 x).
  destruct k;
  inversion H;
  try tauto.
  assert (G2: 0 < f1).
  {
  apply BP2 with z1.
  reflexivity.
  }
  apply Qc_Lt_plus.
  tauto.
  tauto.
  inversion H.
  rewrite <- H1.
  tauto.
  rewrite <- H1.
  tauto.
  rewrite <- H1.
  tauto.
  rewrite <- H1.
  tauto.
  rewrite <- H1.
  tauto.
  rewrite <- H1.
  tauto.
  inversion H.
  rewrite <- H1.
  tauto.
  inversion H.
  destruct (p2 x).
  destruct k;
  inversion H;
  try tauto.
  inversion H.
  inversion H.
  inversion H.
  inversion H.
  inversion H.
  apply BP2 in H.
  tauto.
Qed.

Lemma luboundph:
  forall p
         (LB: lboundph p)
         (UB: uboundph p),
    boundph p.
Proof.
  unfold lboundph.
  unfold uboundph.
  unfold boundph.
  intros.
  split.
  apply LB with x z.
  assumption.
  apply UB with x z.
  assumption.
Qed.

Lemma boundph_fold A m:
  forall (l: list (A * Z)) b p
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (BPb: boundph b)
         (BPE: forall p (IN: In p (map m l)), boundph p)
         (BPT: boundph (fold_left phplus (map m l) b))
         (IN: In p (map m l)),
    boundph (phplus b p).
Proof.
  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.
  assert (BP: boundph p).
  apply BPE.
  assumption.
  assert (LB: lboundph (phplus b p)).
  {
  apply lboundph_phplus.
  apply boundph_lboundph.
  assumption.
  apply boundph_lboundph.
  assumption.
  }
  destruct IN as [EQ|IN].
  rewrite EQ in *.

  assert (UB: uboundph (phplus b p)).
  {
  apply uboundph_fold with (map m l).
  intros.
  apply BPE.
  right.
  assumption.
  assumption.
  }

  apply luboundph.
  assumption.
  assumption.

  assert (UBba: uboundph (phplus b (m a))).
  {
  apply uboundph_fold with (map m l).
  intros.
  apply BPE.
  right.
  assumption.
  assumption.
  }

  assert (LBba: lboundph (phplus b (m a))).
  {
  apply lboundph_phplus.
  apply boundph_lboundph.
  assumption.
  apply boundph_lboundph.
  apply BPE.
  left.
  reflexivity.
  }

  assert (boundph (phplus (phplus b (m a)) p)).
  {
  apply IHl.
  inversion NODUP.
  assumption.
  {
  unfold defl in *.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  }
  {
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply DEFLb.
  right.
  assumption.
  unfold defl in DEFL.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  destruct x0.
  inversion EQ0.
  apply DEFL with z (snd a).
  unfold not.
  intros.
  rewrite <- H0 in NODUP.
  inversion NODUP.
  apply H3.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  right.
  apply in_map_iff. 
  exists (a0, z).
  tauto.
  left.
  reflexivity.
  }
  apply luboundph.
  assumption.
  assumption.
  intros.
  apply BPE.
  right.
  assumption.
  assumption.
  assumption.
  }

  assert (phpdefab: phplusdef (m a) b).
  {
  apply DEFLb.
  left.
  reflexivity.
  }
  
  assert (phpdefap: phplusdef (m a) p).
  {
  unfold defl in DEFL.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQ0,IN0)).
  destruct x0.
  inversion EQ0.
  apply DEFL with (snd a) z.
  unfold not.
  intros.
  rewrite H1 in NODUP.
  inversion NODUP.
  apply H4.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  left.
  reflexivity.
  right.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  }

  assert (phpdefba: phplusdef b p).
  {
  apply phpdef_comm.
  apply DEFLb.
  right.
  assumption.
  }

  apply boundph_mon with (m a).
  assumption.
  assumption.
  apply BPE.
  left.
  reflexivity.
  apply bph_comm.
  {
  apply phpdef_pair.
  assumption.
  assumption.
  assumption.
  }
  apply bph_assoc.
  assumption.
  assumption.
  assumption.
  replace (phplus (m a) b) with (phplus b (m a)).
  assumption.
  apply phplus_comm.
  apply phpdef_comm.
  assumption.
Qed.


Lemma boundph_mon_2:
  forall p1 p2
         (bp1: boundph p1)
         (lbp2: lboundph p2)
         (bp1p2: boundph (phplus p1 p2))
         (PHPD: phplusdef p1 p2),
    boundph p2.
Proof.
  unfold boundph.
  unfold lboundph.
  unfold phplusdef.
  intros.
  specialize bp1p2 with (x:=x).
  specialize PHPD with (x:=x).
  unfold phplus in bp1p2.
  rewrite H in *.
  destruct (p1 x) eqn:p1x.
  destruct k;
  try tauto.
  assert (G: 0 < (f0 + f) /\ (f0 + f) <= 1).
  {
  apply bp1p2 with z0.
  reflexivity.
  }
  assert (p1x':=p1x).
  apply bp1 in p1x.
  apply bp1 in p1x'.
  apply lbp2 in H.
  split.
  assumption.
  apply Qc_Le_mon1 with f0.
  rewrite Qcplus_comm.
  tauto.
  tauto.
  apply bp1p2 with z.
  reflexivity.
Qed.

Lemma lbound_fold A m:
  forall (l: list (A * Z)) b
         (bb: boundph b)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (BPE: forall p : pheap, In p (map m l) -> boundph p),
    lboundph (fold_left phplus (map m l) b).
Proof.
  induction l.
  simpl.
  intros.
  unfold lboundph.
  unfold boundph in bb.
  intros.
  apply bb in H.
  tauto.
  simpl.
  intros.
  rewrite fold_left_f_m_def with (def:=phplusdef).
  apply lboundph_phplus.
  apply boundph_lboundph.
  assumption.
  apply IHl.
  apply BPE.
  left. 
  reflexivity.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  apply DEFL with (snd x1) (snd a).
  unfold not.
  inversion NODUP.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map.
  assumption.
  right.
  rewrite <- EQx1.
  apply in_map_iff.
  exists x1.
  tauto.
  left.
  reflexivity.
  intros.
  apply BPE.
  tauto.
  apply can_phpdef.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id1 id2.
  omega.
  right.
  assumption.
  right.
  assumption.
  apply phpdef_comm.
  apply DEFLb.
  tauto.
  intros.
  split.
  apply DEFLb.
  tauto.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  apply DEFL with (snd x1) (snd a).
  unfold not.
  inversion NODUP.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map.
  assumption.
  right.
  rewrite <- EQx1.
  apply in_map_iff.
  exists x1.
  tauto.
  left.
  reflexivity.
Qed.

Lemma boundph_fold1 A m:
  forall (l: list (A * Z)) b p1 p2 id1 id2
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (BPb: boundph b)
         (BPE: forall p (IN: In p (map m l)), boundph p)
         (BPT: boundph (fold_left phplus (map m l) b))
         (IN1: In (p1,id1) (map (fun x => (m x, snd x)) l))
         (IN2: In (p2,id2) (map (fun x => (m x, snd x)) l))
         (NEQ: id1 <> id2),
    boundph (phplus p1 p2).
Proof.
  intros.
  assert (bbp1: boundph (phplus b p1)).
  {
  apply boundph_fold with A m l;
  try tauto.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (bbp2: boundph (phplus b p2)).
  {
  apply boundph_fold with A m l;
  try tauto.
  apply in_map_iff in IN2.
  destruct IN2 as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (inp1: In p1 (map m l)).
  {
  apply in_map_iff in IN1.
  destruct IN1 as (x,(EQ1,IN1)).
  apply in_map_iff.
  exists x.
  inversion EQ1.
  tauto.
  }

  assert (inp2: In p2 (map m l)).
  {
  apply in_map_iff in IN2.
  destruct IN2 as (x,(EQ2,IN2)).
  apply in_map_iff.
  exists x.
  inversion EQ2.
  tauto.
  }

  assert (phpdefbp1: phplusdef b p1).
  {
  apply phpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (phpdefbp2: phplusdef b p2).
  {
  apply phpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (phpdefp1p2: phplusdef p1 p2).
  {
  apply DEFL with id1 id2;
  tauto.
  }


  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.
  destruct IN1 as [EQ1|IN1].
  inversion EQ1.
  destruct IN2 as [EQ2|IN2].
  inversion EQ2.
  omega.
  {
  apply boundph_mon with b;
  try tauto.
  apply BPE.
  left.
  tauto.
  apply BPE.
  right.
  apply in_map_iff in IN2.
  destruct IN2 as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.

  replace (phplus (phplus (m a) p2) b) with (phplus (phplus b p1) p2).
  apply boundph_fold with A m l;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  assumption.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  apply DEFLb.
  rewrite <- H0.
  left.
  tauto.
  apply DEFLb.
  right.
  tauto.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  apply DEFL with z (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H3.
  rewrite <- H5.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  right.
  apply in_map_iff.
  exists (a0, z).
  rewrite EQx.
  tauto.
  left.
  rewrite H0.
  tauto.
  intros.
  apply BPE.
  right.
  tauto.
  rewrite <- H0.
  assumption.
  apply in_map_iff in IN2.
  destruct IN2 as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  rewrite H0.
  rewrite phplus_assoc;
  try tauto.
  apply phplus_comm;
  try tauto.
  apply phpdef_pair;
  try tauto.
  }

  destruct IN2 as [EQ2|IN2].
  {
  inversion EQ2.
  apply boundph_mon with b;
  try tauto.
  apply BPE.
  right.
  apply in_map_iff in IN1.
  destruct IN1 as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  apply BPE.
  left.
  reflexivity.

  replace (phplus (phplus p1 (m a)) b) with (phplus (phplus b p2) p1).
  apply boundph_fold with A m l;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  assumption.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply phpdef_pair.
  apply phpdef_comm.
  apply DEFLb.
  rewrite <- H0.
  left.
  tauto.
  apply DEFLb.
  right.
  tauto.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  apply DEFL with z (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H3.
  rewrite <- H5.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  right.
  apply in_map_iff.
  exists (a0, z).
  rewrite EQx.
  tauto.
  left.
  rewrite H0.
  tauto.
  intros.
  apply BPE.
  right.
  tauto.
  rewrite <- H0.
  assumption.
  apply in_map_iff in IN1.
  destruct IN1 as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  rewrite H0.
  rewrite phplus_assoc;
  try tauto.
  replace (phplus p2 p1) with (phplus p1 p2).
  apply phplus_comm;
  try tauto.
  apply phpdef_pair;
  try tauto.
  apply phplus_comm.
  tauto.
  apply phpdef_comm.
  tauto.
  }

  apply IHl;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply DEFLb.
  right.
  assumption.
  intros.
  apply BPE.
  right.
  assumption.
  simpl in BPT.
  apply boundph_mon_2 with (m a).
  apply BPE.
  left.
  reflexivity.
  apply lbound_fold;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply DEFLb.
  right.
  assumption.
  intros.
  apply BPE.
  right.
  assumption.
  rewrite <- fold_left_f_m_def with (def:=phplusdef);
  try tauto.
  rewrite phplus_comm.
  tauto.
  apply DEFLb.
  left.
  reflexivity.
  apply can_phpdef.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  apply DEFLb.
  left.
  reflexivity.
  intros.
  split.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  apply DEFL with (snd x1) (snd a).
  unfold not.
  inversion NODUP.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map.
  assumption.
  right.
  rewrite <- EQx.
  apply in_map_iff.
  exists x1.
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  assumption.
  apply phpdef_comm.
  apply phpdef_fold;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply DEFLb.
  right.
  assumption.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  apply DEFL with (snd x1) (snd a).
  unfold not.
  inversion NODUP.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map.
  assumption.
  right.
  rewrite <- EQx1.
  apply in_map_iff.
  exists x1.
  tauto.
  left.
  reflexivity.
  apply phpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  apply in_map_iff.
  exists x2.
  inversion EQ2.
  tauto.
Qed.

Lemma boundgh_fold1 A m:
  forall (l: list (A * Z)) b p1 p2 id1 id2
         (NODUP: NoDup (map snd l))
         (DEFL: defl ghplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), ghplusdef p0 b)
         (BPb: boundgh b)
         (BPT: boundgh (fold_left ghplus (map m l) b))
         (IN1: In (p1,id1) (map (fun x => (m x, snd x)) l))
         (IN2: In (p2,id2) (map (fun x => (m x, snd x)) l))
         (NEQ: id1 <> id2),
    boundgh (ghplus p1 p2).
Proof.
  intros.
  assert (bbp1: boundgh (ghplus b p1)).
  {
  apply boundgh_fold with A m l;
  try tauto.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (bbp2: boundgh (ghplus b p2)).
  {
  apply boundgh_fold with A m l;
  try tauto.
  apply in_map_iff in IN2.
  destruct IN2 as (x1,(EQx,INx)).
  apply in_map_iff.
  exists x1.
  inversion EQx.
  tauto.
  }

  assert (inp1: In p1 (map m l)).
  {
  apply in_map_iff in IN1.
  destruct IN1 as (x,(EQ1,IN1)).
  apply in_map_iff.
  exists x.
  inversion EQ1.
  tauto.
  }

  assert (inp2: In p2 (map m l)).
  {
  apply in_map_iff in IN2.
  destruct IN2 as (x,(EQ2,IN2)).
  apply in_map_iff.
  exists x.
  inversion EQ2.
  tauto.
  }

  assert (phpdefbp1: ghplusdef b p1).
  {
  apply ghpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (phpdefbp2: ghplusdef b p2).
  {
  apply ghpdef_comm.
  apply DEFLb.
  assumption.
  }

  assert (phpdefp1p2: ghplusdef p1 p2).
  {
  apply DEFL with id1 id2;
  tauto.
  }


  induction l.
  simpl.
  intros.
  contradiction.
  simpl.
  intros.
  destruct IN1 as [EQ1|IN1].
  inversion EQ1.
  destruct IN2 as [EQ2|IN2].
  inversion EQ2.
  omega.
  {
  apply boundgh_mon with b;
  try tauto.

  replace (ghplus (ghplus (m a) p2) b) with (ghplus (ghplus b p1) p2).
  apply boundgh_fold with A m l;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  assumption.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply ghpdef_pair.
  apply ghpdef_comm.
  apply DEFLb.
  rewrite <- H0.
  left.
  tauto.
  apply DEFLb.
  right.
  tauto.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  apply DEFL with z (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H3.
  rewrite <- H5.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  right.
  apply in_map_iff.
  exists (a0, z).
  rewrite EQx.
  tauto.
  left.
  rewrite H0.
  tauto.
  rewrite <- H0.
  assumption.
  apply in_map_iff in IN2.
  destruct IN2 as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  rewrite H0.
  rewrite ghplus_assoc;
  try tauto.
  apply ghplus_comm;
  try tauto.
  apply ghpdef_pair;
  try tauto.
  }

  destruct IN2 as [EQ2|IN2].
  {
  inversion EQ2.
  apply boundgh_mon with b;
  try tauto.

  replace (ghplus (ghplus p1 (m a)) b) with (ghplus (ghplus b p2) p1).
  apply boundgh_fold with A m l;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  assumption.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply ghpdef_pair.
  apply ghpdef_comm.
  apply DEFLb.
  rewrite <- H0.
  left.
  tauto.
  apply DEFLb.
  right.
  tauto.
  apply in_map_iff in IN.
  destruct IN as (x,(EQx,INx)).
  destruct x.
  apply DEFL with z (snd a).
  inversion NODUP.
  unfold not.
  intros.
  apply H3.
  rewrite <- H5.
  apply in_map_iff.
  exists (a0, z).
  tauto.
  right.
  apply in_map_iff.
  exists (a0, z).
  rewrite EQx.
  tauto.
  left.
  rewrite H0.
  tauto.
  rewrite <- H0.
  assumption.
  apply in_map_iff in IN1.
  destruct IN1 as (x,(EQx,INx)).
  apply in_map_iff.
  exists x.
  inversion EQx.
  tauto.
  rewrite H0.
  rewrite ghplus_assoc;
  try tauto.
  replace (ghplus p2 p1) with (ghplus p1 p2).
  apply ghplus_comm;
  try tauto.
  apply ghpdef_pair;
  try tauto.
  apply ghplus_comm.
  tauto.
  apply ghpdef_comm.
  tauto.
  }

  apply IHl;
  try tauto.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply DEFLb.
  right.
  assumption.
  simpl in BPT.
  apply boundgh_mon with (m a).
  rewrite ghplus_comm in BPT.
  rewrite fold_left_f_m_def with (def:=ghplusdef) in BPT;
  try tauto.
  rewrite ghplus_comm.
  assumption.
  apply ghpdef_fold;
  try tauto.
  inversion NODUP; tauto.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply DEFLb.
  right; assumption.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx,INx)).
  apply DEFL with (snd x1) (snd a).
  unfold not.
  inversion NODUP.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map.
  assumption.
  right.
  rewrite <- EQx.
  apply in_map_iff.
  exists x1.
  tauto.
  left.
  reflexivity.
  apply ghpdef_comm.
  apply DEFLb.
  left; tauto.
  apply can_ghpdef.
  inversion NODUP.
  assumption.
  unfold defl.
  intros.
  apply DEFL with id0 id3.
  omega.
  right.
  assumption.
  right.
  assumption.
  intros.
  apply DEFLb.
  left; tauto.
  intros.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQx1,INx1)).
  split.
  apply DEFL with (snd x1) (snd a).
  unfold not.
  inversion NODUP.
  intros.
  apply H1.
  rewrite <- H3.
  apply in_map.
  assumption.
  right.
  rewrite <- EQx1.
  apply in_map_iff.
  exists x1.
  tauto.
  left.
  reflexivity.
  apply DEFLb.
  right.
  rewrite <- EQx1.
  apply in_map.
  assumption.
  apply ghpdef_comm.
  apply DEFLb.
  left.
  reflexivity.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  apply in_map_iff.
  exists x1.
  inversion EQ1.
  tauto.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  apply in_map_iff.
  exists x2.
  inversion EQ2.
  tauto.
Qed.

Lemma eq_heap A m:
  forall (l: list (A * Z)) id z z' p x b v
         (EXT: forall z p, exists x2, m (x2, z) = p)
         (NODUP: NoDup (map snd l))
         (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
         (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
         (DEFU: forall p0 id' (NEQ: id <> id') (IN: In (p0,id') (map (fun x => (m x, snd x)) l)), phplusdef p0 (upd (location_eq_dec Z.eq_dec) p z v))
         (DEFUb: phplusdef (upd (location_eq_dec Z.eq_dec) p z v) b)
         (IN: In (p,id) (map (fun x => (m x, snd x)) l))
         (X: m (x,id) = upd (location_eq_dec Z.eq_dec) p z v)
         (NEQ: z <> z'),
    fold_left phplus (map m (updl l id (x, id))) b z' = fold_left phplus (map m l) b z'.
Proof.
  intros.
  assert (EXT2:=EXT).
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx,memp).

  assert (Inp: In p (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQx0,INx0)).
  exists x0.
  inversion EQx0.
  tauto.
  }

  assert (phpdefpp12: phplusdef p b).
  {
  apply DEFLb.
  assumption.
  }  

  assert (deflu: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (empx, id)))).
  {
  apply defl_updl.
  intros.
  rewrite memp.
  apply phpdef_emp.
  assumption.
  }

  replace (fold_left phplus (map m l) b) with
    (phplus p (fold_left phplus (map m (updl l id (empx, id))) b)); try tauto.

  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) p z v)(id:=id)(x:=empx); try tauto.
  rewrite updl_updl.
  apply phplus_upd1; try tauto.
  apply can_phpdef.
  apply NoDup_updl.
  assumption.

  unfold defl.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN1.
  destruct IN1 as (x1,(EQ1,IN1)).
  inversion EQ1.
  destruct (Z.eq_dec (snd x1) id).
  rewrite X.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  inversion EQ2.
  destruct (Z.eq_dec (snd x2) id).
  omega.
  apply phpdef_comm.
  apply DEFU with (id':=snd x2).
  omega.
  inm_.
  apply in_map_iff in IN2.
  destruct IN2 as (x2,(EQ2,IN2)).
  inversion EQ2.
  destruct (Z.eq_dec (snd x2) id).
  rewrite X.
  apply DEFU with (snd x1).
  omega.
  inm_.
  apply DEFL with (snd x1) (snd x2).
  omega.
  inm_.
  inm_.
  repeat php_.
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in IN0.
  destruct IN0 as (x1,(EQ0,IN0)).
  inversion EQ0.
  destruct (Z.eq_dec (snd x1) id).
  rewrite X.
  apply DEFUb.
  apply DEFLb.
  inm_.
  rewrite phplus_comm; repeat php_.

  apply in_map_iff.
  exists (x,id).
  split.
  rewrite X.
  reflexivity.
  apply in_updl_eq.
  apply in_map_iff in IN.
  destruct IN as (x1,(EQ0,IN0)).
  inversion EQ0.
  destruct x1.
  exists a.
  tauto.
  symmetry.
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); try tauto.
  apply can_phpdef.
  repeat php_.
Qed.

Lemma eq_heap_initl A m:
  forall (l: list (A * Z)) id z p1 p2 x z' z'' b
          (EXT: forall z p, exists x2, m (x2, z) = p)
          (NODUP: NoDup (map snd l))
          (PHPD: phplusdef p1 p2)
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p1 z = Some (Ulock wt1 ot1))
          (PzN: z <> z' -> fold_left phplus (map m l) b z' = None)
          (X: m (x,id) = upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))
          (NEQ: z <> z'' /\ z' <> z''),
    fold_left phplus (map m (updl l id (x,id))) (phplus b p2) z'' = fold_left phplus (map m l) b z''.
Proof.
  intros.
  specialize EXT with id (emp knowledge).
  destruct EXT as (empx, memp).
  destruct NEQ as (NEQ1,NEQ2).
  destruct P1z as (wt,(ot,p1z)).

  assert (inp1p2: In (phplus p1 p2) (map m l)).
  {
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQ0,IN0)).
  exists x0.
  inversion EQ0.
  auto.
  }

  assert (phpdefp12b: phplusdef (phplus p1 p2) b).
  {
  apply DEFLb.
  assumption.
  }

  assert (phpdefp2b: phplusdef p2 b).
  {
  apply phpdef_assoc_mon with p1; repeat php_.
  }

  assert (phpdefp1b: phplusdef p1 b).
  {
  apply phpdef_assoc_mon with p2. repeat php_.
  rewrite phplus_comm; repeat php_.
  }


  assert (bz': b z' = None).
  {
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  unfold phplusdef in phpdefp1b.
  specialize phpdefp1b with z.
  rewrite p1z in phpdefp1b.
  destruct (b z).
  contradiction.
  reflexivity.
  apply fold_None with (m:=m) (l:=l) (b:=b); repeat php_.
  auto.
  auto.
  }

  assert (p2z': p2 z' = None).
  {
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  unfold phplusdef in PHPD.
  specialize PHPD with z.
  rewrite p1z in PHPD.
  destruct (p2 z).
  contradiction.
  reflexivity.
  apply phplus_none_mon with p1.
  apply fold_None with (m:=m) (l:=l) (b:=b); repeat php_.
  apply PzN.
  assumption.
  left.
  assumption.
  }

  assert (phpdefp2u: phplusdef p2 (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))).
  {
  apply phpdef_comm.
  apply phpdef_v.
  apply phpdef_none.
  assumption.
  assumption.
  }

  assert (phpdefub: phplusdef (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock)) b).
  {
  apply phpdef_v.
  apply phpdef_none.
  assumption.
  assumption.
  }

  assert (ND: NoDup (map snd (updl l id (x, id)))).
  {
  apply NoDup_updl.
  assumption.
  }

  assert (ND2: NoDup (map snd (updl l id (empx, id)))).
  {
  apply NoDup_updl.
  assumption.
  }

  assert (phpdefx0p2b: forall x0 : pheap,
    In x0 (map m (updl l id (x, id))) -> phplusdef x0 p2 /\ phplusdef x0 b).
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in H.
  destruct H as ((x1,id'),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id' id).
  rewrite <- EQ0.
  rewrite X.
  split.
  php_.
  php_.
  rewrite <- EQ0.
  split.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id id'.
  omega.
  assumption.
  apply in_map_iff.
  exists (x1, id').
  auto.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  assert (DEFL1: defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (empx, id)))).
  {
  apply defl_updl; repeat php_.
  intros.
  rewrite memp.
  php_.
  }

  assert (phpdefp0b: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 b).
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in H.
  destruct H as ((x1,id'),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id' id).
  rewrite <- EQ0.
  rewrite memp.
  repeat php_.
  rewrite <- EQ0.
  apply DEFLb.
  apply in_map.
  assumption.
  }

  assert (phpdefp0p2: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) -> phplusdef p0 p2).
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in H.
  destruct H as ((x1,id'),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id' id).
  rewrite <- EQ0.
  rewrite memp.
  repeat php_.
  rewrite <- EQ0.
  apply phpdef_comm.
  apply phpdef_assoc_mon with p1.
  assumption.
  apply DEFL with id id'.
  omega.
  assumption.
  apply in_map_iff.
  exists (x1, id').
  auto.
  }

  assert(phpdefp2f: phplusdef p2 (fold_left phplus (map m (updl l id (empx, id))) b)).
  {
  apply phpdef_comm.
  apply phpdef_fold; repeat php_.
  }

  assert (phpdefp0un: forall x1 id' (NEQ: id <> id'), In (x1, id') l -> phplusdef (m (x1, id'))
    (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))).
  {
  intros.
  assert (phpd: phplusdef p1 (m (x1, id'))).
  {
  apply phpdef_assoc_mon with p2.
  php_.
  rewrite phplus_comm.
  apply DEFL with id id'.
  omega.
  assumption.
  apply in_map_iff.
  exists (x1, id').
  auto.
  php_.
  }
  apply phpdef_comm.
  apply phpdef_v.
  apply phpdef_none.
  assumption.
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  unfold phplusdef in phpd.
  specialize phpd with z.
  rewrite p1z in phpd.
  destruct (m (x1, id') z).
  contradiction.
  reflexivity.
  apply fold_None with A m l b; repeat php_.
  apply PzN.
  assumption.
  left.
  apply in_map.
  assumption.
  }

  assert (phpdefp0u: forall p0 : pheap, In p0 (map m (updl l id (empx, id))) ->
    phplusdef p0 (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))).
  {
  unfold updl.
  rewrite map_map.
  intros.
  apply in_map_iff in H.
  destruct H as ((x1,id'),(EQ0,IN0)).
  simpl in *.
  destruct (Z.eq_dec id' id).
  rewrite <- EQ0.
  rewrite memp.
  repeat php_.
  rewrite <- EQ0.
  apply phpdefp0un.
  omega.
  assumption.
  }

  assert (phpdefpuf: phplusdef (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))
    (fold_left phplus (map m (updl l id (empx, id))) b)).
  {
  apply phpdef_comm; repeat php_.
  apply phpdef_fold; repeat php_.
  }

  assert (canp: can phplusdef phplus).
  {
  apply can_phpdef.
  }

  assert (defl phplusdef (map (fun x0 : A * Z => (m x0, snd x0)) (updl l id (x, id)))).
  {
  apply defl_updl.
  intros.
  rewrite X.
  apply phpdef_comm.
  apply phpdef_v.
  apply phpdef_none.
  apply phpdef_assoc_mon with p2.
  php_.
  rewrite phplus_comm.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  php_.
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  assert (phpdefpp12: phplusdef p (phplus p1 p2)).
  {
  apply DEFL with id0 id.
  omega.
  assumption.
  assumption.
  }
  unfold phplusdef in phpdefpp12.
  specialize phpdefpp12 with z.
  unfold phplus in phpdefpp12.
  rewrite p1z in phpdefpp12.
  destruct (p z).
  destruct k; inversion phpdefpp12.
  reflexivity.
  apply fold_None with (m:=m) (l:=l) (b:=b); repeat php_.
  apply PzN.
  assumption.
  left.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  apply in_map_iff.
  exists x0.
  inversion EQ0.
  auto.
  assumption.
  }

  rewrite phplus_comm; repeat php_.
  rewrite fold_left_f_m_def with (def:=phplusdef); repeat php_.
  {
  erewrite fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge)
    (x2:=upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock))(id:=id)(x:=empx); repeat php_.
  {
  rewrite updl_updl.
  replace (fold_left phplus (map m l) b) with 
    (phplus (phplus p1 p2) (fold_left phplus (map m (updl l id (empx,id))) b)).
  {
  rewrite <- phplus_assoc; repeat php_.
  apply phplus_mon.
  rewrite phplus_comm; repeat php_.
  unfold upd.
  unfold phplus.
  destruct ((location_eq_dec Z.eq_dec) z'' z).
  symmetry in e.
  contradiction.
  destruct ((location_eq_dec Z.eq_dec) z'' z').
  symmetry in e.
  contradiction.
  reflexivity.
  }
  symmetry.
  {
  apply fold_left_move_m_eq with (def:=phplusdef) (x1:=emp knowledge); repeat php_.
  }
  }
  intros.
  apply phpdefx0p2b.
  assumption.
  unfold updl.
  rewrite map_map.
  apply in_map_iff.
  apply in_map_iff in IN.
  destruct IN as (x0,(EQ0,IN0)).
  exists x0.
  inversion EQ0.
  rewrite eqz.
  rewrite H2.
  rewrite X.
  auto.
  }
Qed.

Lemma defl_initl A m:
   forall (l: list (A * Z)) id z z' p1 p2 x b
          (NODUP: NoDup (map snd l))
          (BP2: boundph p2)
          (PHPD: phplusdef p1 p2)
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (IN: In (phplus p1 p2,id) (map (fun x => (m x, snd x)) l))
          (P1z: exists wt1 ot1, p1 z = Some (Ulock wt1 ot1))
          (PzN: z <> z' -> fold_left phplus (map m l) b z' = None)
          (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) (upd (location_eq_dec Z.eq_dec) p1 z None) z' (Some Lock), id)),
     defl phplusdef (map (fun x => (m x, snd x)) (updl l id x)).
Proof.
  intros.
  destruct x.
  inversion X.
  rewrite H1 in *.
  apply defl_updl.
  intros.
  rewrite H0.
  destruct P1z as (wt,(ot,p1z)).


  assert (phpd: phplusdef p1 p).
  {
  apply phpdef_assoc_mon with p2.
  php_.
  rewrite phplus_comm.
  apply DEFL with id id0.
  omega.
  assumption.
  assumption.
  php_.
  }
  apply phpdef_comm.
  apply phpdef_v.
  apply phpdef_none.
  assumption.
  destruct ((location_eq_dec Z.eq_dec) z z').
  rewrite <- e.
  unfold phplusdef in phpd.
  specialize phpd with z.
  rewrite p1z in phpd.
  destruct (p z).
  contradiction.
  reflexivity.
  apply fold_None with A m l b; repeat php_.
  apply PzN.
  assumption.
  left.
  apply in_map_iff in IN0.
  destruct IN0 as (x0,(EQ0,IN0)).
  apply in_map_iff.
  exists x0.
  inversion EQ0.
  auto.
  assumption.
Qed.

Lemma defl_New A m:
   forall (l: list (A * Z)) b id z p x v
          (NODUP: NoDup (map snd l))
          (DEFL: defl phplusdef (map (fun x => (m x, snd x)) l))
          (DEFLb: forall p0 (IN: In p0 (map m l)), phplusdef p0 b)
          (DEFU: forall p0 id0 (NEQ: id <> id0) (IN: In (p0,id0) (map (fun x => (m x, snd x)) l)), phplusdef p0 (upd (location_eq_dec Z.eq_dec) p z v))
          (IN: In (p,id) (map (fun x => (m x, snd x)) l))
          (P1z: fold_left phplus (map m l) b z = None)
          (X: (m x, snd x) = (upd (location_eq_dec Z.eq_dec) p z v, id)),
     defl phplusdef (map (fun x => (m x, snd x)) (updl l id x)).
Proof.
  unfold defl.
  unfold updl.
  intros.
  rewrite map_map in *.
  inversion X.
  rewrite H0, H1 in *.
  apply in_map_iff in IN1.
  destruct IN1 as (x0,(EQx,INx)).
  destruct (Z.eq_dec (snd x0) id).
  inversion EQx.
  rewrite H0.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  inversion EQx3.
  destruct (Z.eq_dec (snd x3) id).
  omega.
  apply phpdef_comm.
  apply DEFU with (snd x3).
  omega.
  inm_.
  inversion EQx.
  apply in_map_iff in IN2.
  destruct IN2 as (x3,(EQx3,INx3)).
  inversion EQx3.
  destruct (Z.eq_dec (snd x3) id).
  rewrite H0.
  apply DEFU with (snd x0).
  omega.
  inm_.
  apply DEFL with (snd x0) (snd x3).
  omega.
  inm_.
  inm_.
Qed.

Lemma sat_fold_move0:
  forall l a b c p O C
         (SAT: sat p O C (fold_left Astar l (a ** b) ** c)),
    sat p O C (fold_left Astar l (a ** c) ** b).
Proof.
  induction l.
  {
  simpl.
  intros.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp12,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(bc12,(opO1O2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  destruct sat1 as (p3,(p4,(phpdefp3p4,(bp3,(bp4,(bp34,(O3,(O4,(C3,(C4,(ghpdefC3C4,(BC3,(BC4,(bc34,(opO3O4,(tmp4,(tmp5, (p3p4,C3C4)))))))))))))))))).
  subst.
  assert (phpp32p42: phplusdef p3 p2 /\ phplusdef p4 p2). repeat php_.
  assert (ghpp32p42: ghplusdef C3 C2 /\ ghplusdef C4 C2). repeat php_.
  assert (eqh: phplus (phplus p3 p2) p4 = phplus (phplus p3 p4) p2). rewrite phplus_assoc; repeat php_.
  assert (bp324: boundph (phplus (phplus p3 p2) p4)). rewrite eqh; assumption.
  assert (eqg: ghplus (ghplus C3 C2) C4 = ghplus (ghplus C3 C4) C2). rewrite ghplus_assoc; repeat php_.
  assert (bgp324: boundgh (ghplus (ghplus C3 C2) C4)). rewrite eqg; assumption.


  assert (exo: exists O', oplus O' O4 O /\ oplus O3 o2 O').
  {
  inversion opO1O2.
  rewrite <- H in opO3O4.
  inversion opO3O4.
  exists None.
  split; apply None_op.
  exists O3.
  split.
  apply oplus_trans with o.
  rewrite H. assumption.
  assumption.
  destruct O3.
  apply fs_op.
  apply Permutation_refl.
  apply None_op.
  rewrite <- H in opO3O4.
  inversion opO3O4.
  exists (Some o).
  split.
  apply fs_op.
  assumption.
  apply sn_op.
  apply Permutation_refl.
  }
  destruct exo as (O',(op1,op2)).

  exists (phplus p3 p2), p4.
  exists. repeat php_.
  exists.
  apply boundph_mon with p4; repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists O', O4, (ghplus C3 C2), C4.
  exists. repeat php_.
  exists.
  apply boundgh_mon with C4; repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. assumption.
  split.
  exists p3, p2.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists O3, o2, C3, C2.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. repeat php_.
  exists. assumption.
  split; reflexivity.
  split. assumption.
  split; repeat php_.
  }
  intros.
  apply IHl in SAT.
  apply IHl.
  simpl.
  simpl in SAT.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp12,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(bc12,(opO1O2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  exists p1, p2, phpdefp1p2, bp1, bp2, bp12, o1, o2, C1, C2, ghpdefC1C2, BC1, BC2, bc12, opO1O2.
  split.
  simpl.
  apply sat_fold_imp with ((a0 ** b) ** c); repeat php_.
  intros.
  apply sat_comm in SAT; repeat php_.
  apply sat_assoc in SAT; repeat php_.
  apply sat_assoc_comm in SAT; repeat php_.
  tauto.
Qed.

Lemma sat_fold_move:
  forall l a b p O C
         (SAT: sat p O C (Astar (fold_left Astar l a) b)),
    sat p O C (fold_left Astar l (a ** b)).
Proof.
  induction l.
  simpl.
  intros.
  assumption.
  simpl.
  intros.
  destruct SAT as (p1,(p2,(phpdefp1p2,(bp1,(bp2,(bp12,(o1,(o2,(C1,(C2,(ghpdefC1C2,(BC1,(BC2,(bc12,(opO1O2,(sat1,(sat2,(p1p2,C1C2)))))))))))))))))).
  subst.
  apply IHl.
  apply sat_fold_move0.
  apply sat_plus with o1 o2; repeat php_.
Qed.

Definition array (l: location exp) (index: nat) : location exp :=
  ((Eplus (Aof l) (Enum (Z.of_nat index)), Rof l, Eplus (Lof l) (Enum (Z.of_nat index)), Xof l, Pof l), Iof l, Mof l, M'of l).

Definition points_tos (ns: list nat) (l: location exp) : list assn := map (fun index => array l index |-> (Enum 0)) ns.

Lemma sat_dstr:
  forall n m a,
    sat (dstr_cells' (emp knowledge) (map (fun x0 : nat =>
     ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
     (0%Z, nil), (0%Z, nil), nil)) (seq m n)) (Some (Cell full 0))) None
     (emp (option nat * nat))
     (fold_left Astar (points_tos (seq m n)
     (Enum a, 0%Z, Enum a, None, false, (0%Z, nil), (0%Z, nil), nil))
     (Abool true)).
Proof.
  induction n.
  reflexivity.
  simpl.
  intros.
  replace (emp (option nat * nat)) with (ghplus (emp (option nat * nat)) (emp (option nat * nat))).
  Focus 2. repeat php_.
  assert (EQH: dstr_cells' (emp knowledge)
     (((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)
     :: map (fun x0 : nat =>
     ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
     (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n)) (Some (Cell full 0)) =
    phplus (dstr_cells' (emp knowledge)
     (map (fun x0 : nat =>
     ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
     (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n)) (Some (Cell full 0)))
     (fun x => if location_eq_dec Z.eq_dec x 
     ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil) then
     Some (Cell full 0) else None)).
  {
  apply functional_extensionality.
  intros.
  unfold dstr_cells'.
  unfold phplus.
  destruct (in_dec (location_eq_dec Z.eq_dec) x (map
    (fun x0 : nat => ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n))).
  destruct (in_dec (location_eq_dec Z.eq_dec) x
    (((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil),(0%Z, nil), nil)
    :: map (fun x0 : nat => ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n))).
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)).
  rewrite e in i.
  apply in_map_iff in i.
  destruct i as (y1,(y2,y3)).
  inversion y2.
  assert (CO: y1 = m).
  {
  omega.
  }
  rewrite CO in y3.
  apply in_seq in y3.
  omega.
  reflexivity.
  exfalso.
  apply n0.
  right.
  assumption.
  destruct (in_dec (location_eq_dec Z.eq_dec) x
    (((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)
    :: map (fun x0 : nat => ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n))).
  destruct i as [i1|i2].
  rewrite <- i1.
  destruct (location_eq_dec Z.eq_dec
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)).
  reflexivity.
  contradiction.
  contradiction.
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)).
  exfalso.
  apply n1.
  left.
  rewrite e.
  reflexivity.
  reflexivity.
  }
  rewrite EQH.
  apply sat_fold_move.
  apply sat_plus with None None; repeat php_.
  {
  unfold phplusdef.
  unfold dstr_cells'.
  intros.
  destruct (in_dec (location_eq_dec Z.eq_dec) x
    (map (fun x0 : nat => ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n))).
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil),
    (0%Z, nil), nil)); reflexivity.
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil),
    (0%Z, nil), nil)); reflexivity.
  }
  {
  unfold boundph.
  unfold dstr_cells'.
  intros.
  destruct (in_dec (location_eq_dec Z.eq_dec) x
    (map (fun x0 : nat => ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n))).
  inversion H.
  apply full_bound.
  inversion H.
  }
  {
  unfold boundph.
  intros.
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)).
  inversion H.
  apply full_bound.
  inversion H.
  }
  {
  unfold boundph.
  unfold dstr_cells'.
  unfold phplus.
  intros.
  destruct (in_dec (location_eq_dec Z.eq_dec) x
    (map (fun x0 : nat => ((a + Z.of_nat x0)%Z, 0%Z, (a + Z.of_nat x0)%Z, None, false,
    (0%Z, nil), (0%Z, nil), nil)) (seq (S m) n))).
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil),
    (0%Z, nil), nil)).
  rewrite e in i.
  apply in_map_iff in i.
  destruct i as (y1,(y2,y3)).
  inversion y2.
  assert (CO: y1 = m).
  {
  omega.
  }
  rewrite CO in y3.
  apply in_seq in y3.
  omega.
  inversion H.
  apply full_bound.
  destruct (location_eq_dec Z.eq_dec x
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil),
    (0%Z, nil), nil)).
  unfold emp in H.
  inversion H.
  apply full_bound.
  unfold emp in H.
  inversion H.
  }
  apply None_op.
  simpl.
  exists 0.
  exists.
  unfold Qcle.
  unfold QArith_base.Qle.
  simpl.
  omega.
  destruct (location_eq_dec Z.eq_dec (evall (array (Enum a, 0%Z, Enum a, None, false, (0%Z, nil), (0%Z, nil), nil) m))
    ((a + Z.of_nat m)%Z, 0%Z, (a + Z.of_nat m)%Z, None, false, (0%Z, nil), (0%Z, nil), nil)).
  reflexivity.
  contradiction.
Qed.
