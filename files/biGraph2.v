Require Import RamifyCoq.graph.find_not_in.
Require Import RamifyCoq.graph.graph_model.
Require Import RamifyCoq.graph.path_lemmas.
Require Import RamifyCoq.graph.reachable_ind.
Require Import Coq.Logic.ProofIrrelevance.
Require Import RamifyCoq.lib.Ensembles_ext.
Require Import RamifyCoq.lib.EquivDec_ext.
Require Import RamifyCoq.lib.List_ext.
Require Import RamifyCoq.lib.relation_list.
Require Import RamifyCoq.lib.Equivalence_ext.


Require Import Coq.Relations.Relation_Operators.
Require Import Coq.Relations.Relation_Definitions.


Arguments clos_refl_trans {A} _ _ _.
Arguments clos_refl_trans_1n {A} _ _ _.
Arguments clos_refl_trans_n1 {A} _ _ _.
Arguments PreGraph _ _ {_} {_}.

Section BiGraph.
Definition V:=nat.
Context {E : Type}.
Context {EV: EqDec V eq}.
Context {EE: EqDec E eq}.



(* 
Record PreGraph (Vertex Edge : Type) (EV : EqDec Vertex eq)
(EE : EqDec Edge eq) : Type := Build_PreGraph
  { vvalid : Ensemble Vertex;
    evalid : Ensemble Edge;
    src : Edge -> Vertex;
    dst : Edge -> Vertex }

Record LabeledGraph (Vertex Edge : Type) (EV : EqDec Vertex eq)
(EE : EqDec Edge eq) (DV DE DG : Type) : Type
  := Build_LabeledGraph
  { pg_lg : PreGraph Vertex Edge;
    vlabel : Vertex -> DV;
    elabel : Edge -> DE;
    glabel : DG }

    *)


Definition BiGraph_re (pg: PreGraph V E) (f : V -> bool ): Prop :=
  forall e x y, evalid pg e -> src pg e = x -> dst pg e = y -> f x = negb (f y).

Record BiGraph := {
 bgraph : PreGraph V E ;
 vlabel : V -> bool ; (* 表示两个点集 *)
 re : BiGraph_re bgraph vlabel
}.
Fixpoint Inb (x: V) (l : list V) : bool :=
match l with 
|nil => false
|y::l' => if  Nat.eqb x y then true else (Inb x l')
end. 

Definition Vstateb:= V -> bool.
Definition default_Vstateb : Vstateb := (fun _ => false).
Definition Vstateb_update (m : Vstateb) (v: V) : Vstateb :=
 fun x =>   if Nat.eqb x  v then true else m x.
Definition Vstateb_update_f (m : Vstateb) (v: V) : Vstateb :=
 fun x =>  if Nat.eqb x  v then false else m x.

Definition Vstateb_update_l (m : Vstateb) (v : list V) : Vstateb :=
 fun x => if Inb x v then true else m x.
Definition Vstateb_update_fl (m : Vstateb) (v : list V) : Vstateb :=
 fun x => if Inb x v then false else m x .

Definition Vstateb_update_op (m : Vstateb) (v : option V) : Vstateb :=
fun x => match v with 
       |None => m x 
       |Some y => Vstateb_update m y  x
       end.
Definition Vstate:= V -> Prop.
Definition default_Vstate : Vstate := (fun _ => False).
Definition Vstate_update (m : Vstate) (v: V) : Vstate :=
 fun x =>   x =  v \/ m x.
Definition Vstate_update_f (m : Vstate) (v: V) : Vstate :=
 fun x =>  ( x = v -> False ) \/ (~ x = v  -> m x).

Definition Vstate_update_l (m : Vstate) (v : list V) : Vstate :=
 fun x => In x v \/ m x.

Definition Vstate_update_fl (m : Vstate) (v : list V) : Vstate :=
 fun x => (In x v -> False ) \/ (~ In  x  v  -> m x).

Definition matching := list E.
Context {BG : BiGraph }.



Fixpoint list_sub (u v :list V) : list V :=
match v with 
|nil => u
|e::v' => list_sub (remove EV e u ) v'
end.
Notation Gph := (PreGraph V E).

Fixpoint epath_to_vpath (g: Gph) (p : list E) {struct p} : list V :=
  match p with
  | nil => nil
  | e :: nil => dst g e :: src g e :: nil
  | e :: el => dst g e :: epath_to_vpath' g el
  end.

(*均为有向*)
Definition gra := bgraph BG.

Inductive connected (v: V) (cl : list V) : Prop :=
|connected_intro : forall (x : V ), ( step gra v x <-> In x cl) -> connected v cl .

(*  给出图的点集  *)

Variable LV: list V.
Hypothesis lise_re : forall v , In v LV <-> vvalid gra v.

Definition get_connectednode_func  := V -> list V.
Variable con : V -> list V. (* TODO : 怎么得到一个点的连接点集 *)
Hypothesis conlistre : forall v , connected v (con v).







Fixpoint is_matching (vl: list V)(m : list E):Prop:=
match m with
|nil => True
|e::m' => (~ In (src gra e) vl /\ ~ In (dst gra e) vl) 
          /\(is_matching (vl++(src gra e::(dst gra e::nil)))  m') 
end.

Definition e_to_v (p : list E) : list V := epath_to_vpath gra p .

Fixpoint Ma (v : V) (M :matching): (option V) := 
match M with 
|nil => None
|e::m' => if Nat.eqb (src gra e) v then 
          Some (dst gra e) else 
            (Ma v m')
end.


Context {M : matching}.

Definition Matching (v: V) : (option V) := Ma v M.
Definition path : Type := (V * list E)%type.


(* Definition crossGraph (matching) : Type :=  PreGraph 

 *)

Print Nat.odd.

Variable Max : nat.


(*Inductive
step (Vertex Edge : Type) (EV : EqDec Vertex eq)
(EE : EqDec Edge eq) (pg : PreGraph Vertex Edge)
  : Vertex -> Vertex -> Prop :=
    step_intro : forall (e : Edge) (x y : Vertex),
                 evalid pg e ->
                 src pg e = x ->
                 dst pg e = y -> step pg x y

*)

(* 找到对于一个Vstateb中从大到小的*)
Print nth_In.
Fixpoint conn (v: V) (v1 : Vstateb) (n:nat): V :=
match n with
|O => O
|S n' =>  if Inb (S n') (con v) then 
             (if v1 (S n') then n else conn v v1 n')
             else conn v v1 n'
end.

Definition max_conn (v : V) (v1 : Vstateb) := conn v v1 Max.


Inductive cross_step : (Vstateb * path) -> (Vstateb * path ) -> Prop := 
| one_v : forall (u w: V ) (e1 e2 : E) (v1 : Vstateb) ,
    Matching u  = None -> let v := max_conn u v1  in 
    src gra e1 = u -> dst gra e1 = v  ->src gra e2 = v -> dst gra e2 = w ->~ In e1 M ->  In e2 M -> 
    (*-> Matching v = Some w -> *)
         cross_step (Vstateb_update default_Vstateb u, (u, nil)) ( Vstateb_update (Vstateb_update (Vstateb_update default_Vstateb u)  v) w  , (w ,e2 :: (e1::nil))) 
(**从一个非匹配点 经过非匹配边和匹配边  到一个匹配点 *)
| not_one : forall (u  w: V ) (e1 e2 e3 : E)(p :list E) (v1: Vstateb), (* ???  *) 
    dst gra e3 = u -> In e3 M -> let v := max_conn u v1 in
    (* Nat.odd (length p) = true ->*)
    v1 u = true -> v1 w = false  ->
    src gra e1 = u -> dst gra e1 = v  -> src gra e2 = v -> dst gra e2 = w -> In e2 M -> ~ In e1 M
    ->(*->
      Matching v = Some w -> *)
         cross_step (v1, (u, e3 :: p)) ( Vstateb_update (Vstateb_update v1  v) w  , (w ,e2::(e1::(e3::p))))
(**从一个匹配点 经过非匹配边和匹配边  到一个匹配点 *)
|yes_to_no : forall (u v : V ) (e1 e2 : E) (p: list E)  (v1 : Vstateb) ,
   dst gra e2 = u ->  In e2 M -> v1 u = true -> let v := max_conn u v1 in
   Matching v = None ->
   src gra e1 = u -> dst gra e1 = v  -> ~ In e1 M ->
         cross_step (v1, (u, e2::p)) ( Vstateb_update v1  v , (v ,e1::(e2::p)))
(**从一个匹配点到非匹配点*)
|no_to_no :  forall (u : V ) (e1 :E)  ,
    Matching u  = None -> let v := max_conn u  (Vstateb_update default_Vstateb u) in 
    Matching v = None ->
    src gra e1 = u -> dst gra e1 = v  -> ~ In e1 M ->
         cross_step (Vstateb_update default_Vstateb u, (u, nil)) 
         (Vstateb_update (Vstateb_update default_Vstateb u) v,(v, e1 :: nil) )
(* *)
|Back_to_yes : forall (u w1 w2: V ) (e1 e2 e3: E)(p :list E) 
               (v1: Vstateb),
      dst gra e3 = w2 -> In e3 M ->
      v1 u = true -> max_conn u v1 = O -> 
            In e1 M ->  ~In e2 M -> 
              src gra e1 = w1 -> dst gra e1 = u  -> src gra e2 = w2 -> dst gra e2 = w1 ->
           cross_step (v1, (u, e1::(e2::(e3::p)))) ( Vstateb_update_fl v1 (list_sub (con u) (e_to_v p) ) , (w2 ,e3::p))
(**回溯到上一个匹配点*) 
|Back_to_no : forall (u w1 w2 : V) (e1 e2 : E) (p : list E )
              (v1 : Vstateb) ,
     v1 u = true -> max_conn u v1 = O -> 
           In e1 M ->  ~In e2 M -> 
             src gra e1 = w1 -> dst gra e1 = u  -> src gra e2 = w2 -> dst gra e2 = w1 ->
           cross_step (v1, (u, e1::(e2::nil))) ( Vstateb_update_fl v1 (list_sub (con u )(e_to_v p) ) , (w2 ,nil))
(** 回溯到初始状态即一个点*)    .

Inductive cross_halt : (Vstateb * path) -> Prop :=
|success : forall (u : V) (v : Vstateb) (e : E )(p : list E),
              Matching u = None ->
            v u = true -> dst gra e = u -> ~ In e M -> cross_halt (v , (u, e::p)).
Definition state := (Vstateb * path)%type.
Definition multi_cstep : state -> state -> Prop := clos_refl_trans cross_step .


Lemma half_halt :
  forall st1 st2, cross_step st1 st2 -> ~ cross_halt st1.
Proof.
  intros.
  unfold not; intros; inversion H.
  - rewrite <- H8 in H0.
    inversion H0.
  - rewrite <- H11 in H0.
    inversion H0. subst. auto.
  - rewrite <- H8 in H0.
    inversion H0. subst. auto.
  - rewrite <- H6 in H0.
    inversion H0.
  - rewrite <- H11 in H0.
    inversion H0. subst. auto.
  - rewrite <- H9 in H0.
    inversion H0. subst. auto.
Qed.

Lemma stay_even :
  forall st1 st2, cross_step st1 st2 -> ~cross_halt st2 -> 
    Nat.even (length (snd (snd st1))) = Nat.even (length (snd (snd st2))).
Proof.
  intros.
  induction H.
  - simpl. reflexivity.
  - unfold snd. reflexivity.
  - unfold not in H0. destruct H0. apply success.
    auto.  unfold Vstateb_update. 
    assert (Nat.eqb v0 v0 = true). 
    apply PeanoNat.Nat.eqb_refl.
    rewrite H0. reflexivity.
    auto. auto.
  - unfold not in H0. destruct H0. apply success.
    auto. unfold Vstateb_update at 1.
    assert (Nat.eqb v v = true). 
    apply PeanoNat.Nat.eqb_refl.
    rewrite H0. reflexivity.
    auto. auto.
  - unfold snd. reflexivity.
  - unfold snd. reflexivity.
Qed.

Theorem try :
  forall  ( v: V) st , ~ cross_halt st ->
    multi_cstep ( Vstateb_update default_Vstateb v, (v, nil)) st -> 
      Nat.even (length (snd (snd st))) = true.
Proof.
  intros.
  apply Operators_Properties.clos_rt_rtn1_iff in H0.
  induction H0.
  - reflexivity.
  - pose proof (half_halt y z H0) .
    pose proof (IHclos_refl_trans_n1 H2).
    rewrite <- H3.
    apply eq_sym.
    apply stay_even; auto.
Qed.

Lemma cons_length : forall (v: E) l , length (v::l) = S (length l).
Proof.
  intros.
  induction l.
  - simpl. reflexivity.
  - simpl. reflexivity.
Qed.
Lemma S_even : forall n , Nat.even (S n) = negb (Nat.even n).
Proof.
  intros.
  induction n.
  - simpl. reflexivity.
  - rewrite IHn. simpl. rewrite Bool.negb_involutive. reflexivity.
Qed.
Lemma list_ode: forall (v: E) l,  Nat.even (length l) =Nat.odd (length ( v:: l)).
Proof.
 intros. revert v.
 induction l.
 - simpl. reflexivity.
 - unfold Nat.odd. rewrite cons_length. intros. rewrite cons_length. 
   rewrite S_even. rewrite S_even. rewrite Bool.negb_involutive.
   unfold Nat.odd in IHl. rewrite (IHl a). apply Bool.negb_involutive.
Qed.

Lemma notmatching : forall v e M, src gra e = v -> 
     In e M -> ~ Ma v M = None .
Proof.
  intros.
  unfold not.
  intros. induction M0.
  - inversion H0.
  - inversion H0. rewrite H2 in H1. rewrite <- H in H1. simpl in H1.
    rewrite PeanoNat.Nat.eqb_refl in H1. inversion H1.
    simpl in H1. destruct (Nat.eqb (src gra a) v). inversion H1. apply IHM0. auto. auto.
Qed.

Lemma notmatching_rev : forall v e M, src gra e = v -> 
      Ma v M = None -> ~ In e M .
Proof.
  intros.
  unfold not.
  intros. induction M0.
  - inversion H1.
  - inversion H1. rewrite H2 in H0. rewrite <- H in H0. simpl in H0.
    rewrite PeanoNat.Nat.eqb_refl in H0. inversion H0.
    simpl in H0. destruct (Nat.eqb (src gra a) v). inversion H0. apply IHM0. auto. auto.
Qed.

Lemma change_even :
  forall st1 st2, cross_step st1 st2 -> cross_halt st2 -> 
    Nat.even (length (snd (snd st1))) = Nat.odd (length (snd (snd st2))).
Proof.
  intros.
  induction H.
  - inversion H0. unfold not in H14. apply H14 in H6.  inversion H6.
  - inversion H0. unfold not in H17. apply H17 in H8.  inversion H8.
  - unfold snd . pose proof (list_ode e1 (e2 :: p)). apply H7.
  - unfold snd. apply list_ode.
  - inversion H0. unfold not in H17. apply H17 in H1.  inversion H1.
  - inversion H0.
Qed.


Theorem path_odevity :
 forall v st, cross_halt st -> 
      multi_cstep ( Vstateb_update default_Vstateb v, (v, nil)) st -> 
      Nat.odd (length (snd (snd st))) = true.
Proof.
 intros.
 apply Operators_Properties.clos_rt_rtn1_iff in H0.
 induction H0.
 - inversion H.
 - pose proof (half_halt y z H0).
   assert ( multi_cstep ( Vstateb_update default_Vstateb v, (v, nil)) y).
   unfold multi_cstep. apply Operators_Properties.clos_rt_rtn1_iff. apply H1.
   pose proof (try v y H2 H3).
   pose proof (change_even y z H0 H). rewrite H5 in H4. auto.
Qed.

Definition E_eqb (e1 e2: E) : bool := 
  if Nat.eqb (src gra e1) (src gra e2) then
    if Nat.eqb (dst gra e1) (dst gra e2) then
      true
    else false else false.

Fixpoint Inb_edge (x: E) (l : list E) : bool :=
match l with 
|nil => false
|y::l' => if  E_eqb x y then true else (Inb_edge x l')
end.

Fixpoint xor_edge (e1: list E) (p: list E) : list E :=
match p with
| nil => e1
| e::_ as p' => if (Inb_edge e e1) then xor_edge e1 p'
    else e::xor_edge e1 p'
end.

Variable de : E.

(**定义增广路*)
Fixpoint cross_path (l: list E) : Prop :=
match l with
|nil => True
|m::nil => True
|m::l' => (* actually hd de l' 不会需要default值*)
             ( In m M /\ ~ In (hd de l') M  \/ 
                   ~ In m M /\  In (hd de l') M)
             /\ cross_path l'
end.


Definition aug_path (l: list E) : Prop :=
match l with 
|nil => False
|m::nil => ~ In m M
|m::n::l' => (~ In m M /\ In n M )/\ 
          (cross_path l' /\ cross_path (n::l')) 
end.

Lemma cross_stay_unit : forall y z ,
   cross_step y z -> 
       cross_path (snd (snd y)) -> cross_path (snd (snd z)).
Proof.
  intros.
  induction H.
  - simpl. split. 2: auto.  left. split. auto. 
    pose proof ( notmatching_rev u e1 M). apply H7. auto. auto.
  - split. auto. unfold snd in H0. split. auto. auto.
  - unfold snd. unfold snd in H0. split. auto. auto.
  - unfold snd. unfold snd in H0. reflexivity.
  - unfold snd. unfold snd in H0. destruct H0. destruct H10. auto.
  - unfold snd. reflexivity.
Qed.

Theorem cross_stay :
  forall st1 st2, cross_path (snd (snd st1)) ->
      multi_cstep  st1  st2 -> 
      cross_path (snd (snd st2)).
Proof.
 intros.
 apply Operators_Properties.clos_rt_rtn1_iff in H0.
 induction H0.
 - unfold snd. auto. 
 - pose proof ( cross_stay_unit y z  H0 IHclos_refl_trans_n1 ). auto.
Qed.

Lemma st_ed_unmatched:
  forall (p: list E) (v: V) st, aug_path p -> cross_halt st -> multi_cstep (Vstateb_update default_Vstateb v, (v, nil)) st -> Matching (fst (snd st)) = None.
Proof.
  intros.
  apply Operators_Properties.clos_rt_rtn1_iff in H1.
  induction H1.
  inversion H0.
  inversion H0.
  unfold snd.
  unfold fst.
  exact H3.
Qed.

Lemma match_xor_aug_match:
  forall (e p: list E) (v: V) st, aug_path p -> Matching v = None -> 
  cross_halt (st (v, p)) -> multi_cstep (Vstateb_update default_Vstateb v, (v, nil)) (st (v, p)) -> is_matching nil M -> e = xor_edge M p -> is_matching nil e.
Proof.
  intros.
  unfold aug_path in H.
  destruct p.
  unfold xor_edge in H4.
  rewrite H4.
  exact H3.
  destruct p.
  unfold xor_edge in H4;
  destruct (Inb_edge e0 M) in H4.
  rewrite H4.
  exact H3.
  - apply Operators_Properties.clos_rt_rtn1_iff in H2.
    rewrite H4.
    unfold is_matching; repeat split.
    + tauto. + tauto.
    Admitted.

Lemma path_to_aug : forall p ,
    cross_path p ->
      Nat.odd (length p) = true  ->
                    ~ In (last p de) M ->
          aug_path p.
Proof.
  intros.
  induction p.
  - inversion H0.
  - destruct p.
    auto.
    split; split.
    Admitted.
