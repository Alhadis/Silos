Require Import List Peano_dec Arith.
Require Import Containers FinSummDefs (*VArith *) Substitution JMeq MyTactics.

(** * Container based reasoning system for lists *)

Set Implicit Arguments.

Section Ucontainers_lists.

(** the Ucontainer for lists *)  
 Definition pLst  (n m : nat)  := ucont (FinSum n m) .

Section nil_and_cons.

Variable X : Set . 
(* Definition clist   := Ext Lst X. *)
     
 (* nil and cons *)
 Definition cnil := uext Lst  0 (nofin X).
 
 Definition ccons  (x: X) (xs: Ext Lst X  ) : Ext Lst X := 
           match xs with  uext u0 f0 => uext Lst (S u0) (caseFin x f0) end.

Theorem nil_not_cons : forall (x : X) (cs : Ext Lst X),  cnil <> ccons x cs.
Proof.
  intros x cs0; destruct cs0.
  unfold cnil; unfold ccons;
  intro H; destruct (ext_eq_dst H) as [H0 _ ]; 
  discriminate H0.
Qed.
 
End nil_and_cons.

Section natural_transformations_to_lists_and_back.  
 (** * Isomorphism form normal list to extensions *) 
 Implicit Arguments fz [n].
   


 (* extension to normal list *)

 Fixpoint nf2list X n : (Fin n -> X) -> list X :=
   match n as n return (Fin n -> X) -> list X with
   | O => fun _ => nil
   | S n' => fun f => f fz :: nf2list (fun i => f (fs i))
   end.

 Definition ext_to_list X (cl  : Ext Lst X) :=
   match cl with
   | uext _ F => nf2list F
   end.

(** the shape is given by the length *)
Lemma ext_to_list_len  X n  (G : Fin n -> X) :
    length (ext_to_list (uext Lst n G)) = n .
 Proof.
  induction n; auto. 
  intro G;
  replace (length (ext_to_list (uext Lst (S n) G))) with
       (S(length (ext_to_list (uext Lst  n (fun i => G (fs i))))));
  auto.
 Qed. 


 (* pointer to elements *)
 Fixpoint  typ X  (l: list X) : Fin (length l) ->  X :=
   match l as e return (Fin (length e) -> X) with
   | nil => fun i => (nofin X i) (*match  (fin_0_empty i) return X with end *)
   | x :: xs => fun i => match finSN i with
                         | isfs a => typ xs a
                         |  _     =>  x
                         end
   end.

(* normal list to exteniosns *)
Definition list_to_ext  X (l: list X) : Ext Lst X := 
   uext Lst (length l) (typ l).

  (* Calculate the container morphism given a function 
     f : \forall X,  List X -> List X
     f : \forall X,  List X * List X -> List X
     f : \forall X,  List (List X) -> List X
    *)
 
 Definition lfun2mor (h : forall X, list X -> list X) :=
    ext_mor (fun _ l => list_to_ext ( h _ (ext_to_list l))).
 


 (* domain is a product *)
 Definition lfun2morP (h : forall X, list X * list X -> list X):= 
    let H := fun X (l : Ext Lst X * Ext Lst X) => 
         list_to_ext  ( h _ (ext_to_list (fst l), ext_to_list (snd l))) in
      ext_mor (fun _ Ec => (H _ (extP Ec))).
 
   
  (* composition *)
 Definition lfun2Cmor (h : forall X, list (list X) -> list X):= 
    let H := fun X (l : Ext Lst (Ext Lst X)) => 
       list_to_ext (h _ (map (ext_to_list (X := X)) (ext_to_list l))) in 
         ext_mor (fun _ Ec => (H _ (extC Ec))).


 (* In general, we can convert any natural transforamtion whose 
    domain is built form sums prodsucts and compositions *)
  Inductive LDom : Set :=
   | one : LDom
   | prd : LDom -> LDom -> LDom.

  Fixpoint IDom ld (X : Type) :=
   match ld with
   | one => list X
   | prd l r => prod (IDom l X) (IDom r X)
   end.
 
  Fixpoint domCont l :=
    match l with
    | one => Lst
    | prd l r => cont_prod (domCont l) (domCont r)
    end.


   Fixpoint IDomEX ld X : IDom ld X -> Ext (domCont ld) X :=
   match ld as e return  (IDom e X) -> Ext (domCont e) X  with
    | one => fun a =>  list_to_ext a
    | prd l r =>  fun a =>  extP1 (IDomEX l _ (fst a) , IDomEX r _ (snd a))
   end. 

  (* Definition IDomL2eX ld X :  Ext (domCont ld) X -> IDom ld X  .
     induction ld; simpl. exact ext_to_list.
     intros. Check (extP X0). *)

   Fixpoint IDomL2eX ld X :  Ext (domCont ld) X -> IDom ld X  :=
   match ld as e return  Ext (domCont e) X ->  (IDom e X)   with
    | one => fun a =>  ext_to_list a
    | prd l r =>  fun a => let ex :=  extP a in
                     (IDomL2eX _ (fst ex) , IDomL2eX _ (snd ex) )
   end.

 (* turning an arbitrary poltmorphic function, with nary domain, into its corresponding 
    container morphism *)
 Definition dom2cmor l :  (forall X, (IDom l X) -> list X) -> cmr (domCont l) Lst := 
    match l as e return (forall X, (IDom e X) -> list X) -> cmr (domCont e) Lst with
    | one => lfun2mor
    | prd l1 l2 =>  fun H => 
        let K := fun X (d : Ext (domCont l1 <x> domCont l2) X) =>
                   list_to_ext (H _  (IDomL2eX (prd l1 l2) d)) in
        ext_mor K
    end.       
  

Lemma ext_to_LList X : forall l : list X,
   ext_to_list (uext Lst (length l) (typ l))  = l.
Proof.
  induction l. simpl; trivial.
  pattern l at 3; rewrite <- IHl; simpl.
  replace  (fun m : Fin (length l) => typ l m) with (typ l);  
  try (apply extensionality); trivial.
Qed.

Lemma list_to_EExt X : forall l : list X, 
   list_to_ext (ext_to_list (uext Lst (length l) (typ l)))  = 
    uext Lst (length l) (typ l). 
Proof.
  unfold list_to_ext.
  intros X l; apply ext_eq. 
  rewrite <-  (ext_to_list_len (typ l)); trivial.
  apply  (dextensionality Fin (ext_to_list_len (typ l))
         (typ (ext_to_list (uext Lst (length l) (typ l)))) (typ l)).
  rewrite  (ext_to_LList l).
  intros x y H; case (JMeq_eq H); trivial.
Qed.
 

End natural_transformations_to_lists_and_back. 

Section List_functions_and_proofs.
             
(*Set Implicit Arguments. *)

Section Container_Morphisms.
 (** * Definition of polymorphic functions  *)

 (* reverse *)
 Definition crev :  Lst ===> Lst := 
  uCmr Lst Lst (id (s Lst))  (fun nn: s Lst => fun Fn: p Lst nn => rv Fn).

  Definition hd_ss n : nat :=
     match n with 
     | O => O
     | S _ => 1
     end.

 (* a better wa to write teh shape map*)
  Lemma hds_ok_aux : forall n, 0 < n -> 1 = n - (n - 1).
    intros; omega.
  Qed.

  Lemma hds_ok : forall n, hd_ss n = n - (n - 1).
    intros. destruct (lt_eq_lt_dec n 0). destruct s; subst; simpl; trivial. destruct (lt_n_O _ l).
    rewrite <- (hds_ok_aux l). destruct n; simpl; trivial. inversion l. 
  Qed.

 Definition hd_pos n :  Fin (n - (n - 1)) -> Fin n :=
    match n as e return Fin (e - (e - 1)) -> Fin e with
    | O =>  nofin (Fin 0) 
    | S _ => fun _ => fz _ 
    end.
    
 (* Head*)
 (*Definition cHead : Lst ===> (One_cont <+> Lst):=  
    ( uCmr Lst  (One_cont <+> Lst) hd_ss hd_pos ). *)

 Definition  cHead : Lst ===>  Lst := uCmr Lst  Lst (fun n => n - (n - 1))  hd_pos.

 (* last *)
  Definition last_pos n :  Fin (n - (n - 1)) -> Fin n :=
    match n as e return Fin  (e - (e - 1)) -> Fin e with
    | O =>  nofin (Fin 0)
    | S _ => fun _ => tp _ 
    end.

 Definition  clast : Lst ===>  Lst := uCmr Lst  Lst (fun n => n - (n - 1)) last_pos. 
  
 
(* Tail *)
  Definition tail_s n :  nat :=
   match n   with
   | O => 0
   | S m => m
   end.    

  Lemma tails_ok : forall n, tail_s n = n - 1.
    destruct n; simpl; auto with arith.
  Qed.        
                                                 
 Definition  tail_p (n: nat) :  Fin (n - 1) ->  Fin n :=
   match n as e return  Fin (e - 1) ->  Fin e with
   | O => nofin (Fin 0) 
   | S 0 => fun i => fs i
   | S (S n) => fun i => fs i
   end.
               
(* Tail *)      
Definition ctail :=  uCmr Lst Lst (fun n => n - 1)  tail_p.    
    
Definition not_last (n:nat) : Fin (n - 1) ->  Fin n :=
   match n as n0 return (Fin  (n0 - 1) -> Fin n0) with
   | 0 =>   nofin (Fin 0) 
   | S 0 =>  nofin (Fin 1) 
   | S (S n) => fun i => emb i
   end.

 (* But_last *)
 Definition cbut_lst := uCmr Lst Lst (fun n => n - 1) not_last.

 (* take nad drop *)
  Fixpoint takeP m : forall n, Fin (n - m) -> Fin n :=
    match m as e return (forall n, Fin (n - e) -> Fin n) with
    | O   =>  fun n => match n with
                       | O => nofin (Fin 0) 
                       | S _ => fun i => i
                      end
    | S m1 => fun n => match n return (Fin (n - S m1) -> Fin n)  with
                       | O => nofin (Fin (0 - S m1)) 
                       | S n1 => fun  i => emb (takeP m1 _ i)
                       end
    end.

  (* rotate the positions once  *) 
  Definition rot1 n (i : Fin n) :  Fin n :=
   match i in (Fin e) return (Fin e)  with
   |  fz _   => tp _
   |  fs _ j  => emb j (* match j in (Fin e) return (Fin (S e)) with
                 | fz _ =>  fz _
                 | fs _  k =>    fs (emb  k)
                 end *)
   end.

  (* rotate the positons m times *)
  Fixpoint rotm_aux m n (i : Fin m) (j : Fin n ) : Fin n :=
     match i  with
     | fz _   =>  rot1 j
     | fs _ l =>  rot1 (rotm_aux  l j)
     end.  

   Definition rotm n (i j : Fin n) := rotm_aux i j. 


   (* position map for rotate m *)
   Definition rotmP m n (i : Fin n) : Fin n :=
     match m with 
     | O =>  i
     | S a =>  match le_lt_dec  n a with
              | left _ => i
              | right l => rotm_aux (nat_finite _ l)  i
              end
     end.

   (* rotate m as a container morphism *)
   Definition crotm m :=  uCmr Lst Lst (fun n => n) (rotmP m).

  (* Lemma rotm_aux_id : forall n , rotm_aux (tp n) (fz n) =  (fz _).
   induction n; intros; simpl; auto. 
    Check ( (rotm_aux (tp n) (fz (S n)))).

   Lemma rotm_aux_id : forall n (i : Fin (S n)), rotm_aux (tp n) i =  i.
     induction n; intros; simpl; auto.   FSimpl. 
     destruct (finSN i); simpl.  Check (IHn (fz _ ) ).  rewrite <- IHn at 3. . *)
 
    (* take as a cm *) 
    Definition ts n m := if le_lt_dec n m then n else m. 
    Definition takep n m : Fin (if le_lt_dec n m then n else m) -> Fin n :=
       match le_lt_dec n m as  a return  Fin (if a then n else  m) -> Fin n with
       | left _ => fun i => i 
        | right l => fun i => nat_finite _ l 
       end.
    Definition ctake m := uCmr Lst Lst (fun n => ts n m) (fun n => takep n m). 

    (* drop *)
    Fixpoint dropP m : forall n, Fin (n - m) -> Fin n :=
    match m as e return (forall n, Fin (n - e) -> Fin n) with
    | O   =>  fun n => match n with
                       | O => nofin (Fin 0) 
                       | S _ => fun i => i
                      end
    | S m1 => fun n => match n return (Fin (n - S m1) -> Fin n)  with
                       | O => nofin (Fin (0 - S m1)) 
                       | S n1 => fun  i => fs (dropP m1 _ i)
                       end
    end.

  Definition cdrop m := uCmr Lst Lst (fun n => n - m) (dropP m).  

(* append *)                       
 Definition cappend  := 
      let smap :=  (fun SP: s (Lst <x> Lst) =>(fst SP + snd SP))  in 
          let pmap :=  (fun nm : s (Lst <x> Lst)  =>  
             fun pm: p Lst  (smap nm) => FinCase (fst nm) (snd nm) pm ) in
                 uCmr   (Lst <x> Lst)  Lst smap pmap . 

 Definition cappd : cmr (Lst <x> Lst) Lst.
   refine (uCmr (Lst <x> Lst) Lst
       (fun SP: s (Lst <x> Lst) =>(fst SP + snd SP)) _ ); simpl.
   destruct a; simpl. 
   exact (fun i => match finsplit _ _ i with
                   | is_inl a => inl _  a
                   | is_inr b => inr  _ b
                   end).
 Defined.


Definition cappendl : cmr (Lst <x> (Lst <x> Lst)) Lst.
  refine (uCmr (Lst <x> (Lst <x> Lst)) Lst 
    (fun sp : nat * (nat * nat) => fst sp + fst (snd sp) + snd (snd sp))
    _ ); simpl.
  intros a H . 
  destruct a as [n p]; simpl in *. 
  destruct p as [n0 n1]; simpl in *.
  destruct (finsplit (n + n0) n1 H) as [l | r].
  destruct (finsplit n n0 l) as [i | j].
  exact (inl  _ i). (* Fin n0 + Fin n1 *)
  exact (inr  _ (inl _ j)). (*Fin n * (Fin n1) *)
  exact (inr  _ (inr  _ r)). (*Fin n * (Fin n0) *)
Defined.

Definition cappendr : cmr ((Lst <x> Lst) <x> Lst) Lst.
  refine (uCmr ((Lst <x> Lst) <x> Lst) Lst 
    (fun sp : (nat * nat) * nat  =>  fst (fst sp) + snd (fst sp) + snd sp)
    _ ); simpl.
  intros a H.
  destruct a as [p n]; simpl in *.
  destruct p as [n0 n1]; simpl in *.
  destruct (finsplit (n0 + n1) n H) as [l | r].
  destruct (finsplit n0 n1 l) as [i | j].
  exact (inl _  (inl _  i)). (*Fin n* Fin n0*  *)
  exact (inl _ (inr _ j)). (*Fin n* (Fin n0) *)
  exact (inr _ r). 
Defined. 

 (* Composiitons of lists indexted bu n *)
 
  Definition  cflatt_p (a: Ext Lst nat) (i : Fin (sum_n (f a))) : CPos Lst a :=
   match  (finSumm (f a) i) with
   | finPair j k => cpos Lst a j k
   end. 

 (* flatten *)   
 Definition cflatt := 
     let smap := (fun a : s (cComp Lst Lst)  => sum_n (f a)) in
          let pmap := (fun a : s (cComp Lst Lst) => 
             fun ps : p Lst (sum_n (f a)) => cflatt_p a ps) in
               uCmr (cComp Lst Lst) Lst smap pmap.

(* define the alternative flatten using vectors *)
Definition map_rev := 
     let pmap :=  
        (fun a : Ext Lst nat =>
            fun ps : CPos Lst a  => cpos Lst a (cs ps) (rv (cp ps))) in
          uCmr (cComp Lst Lst) (cComp Lst Lst) (id (Ext Lst nat))  pmap.

Definition min (n m : nat) : nat := if le_lt_dec n m  then n else m.        
         
Definition zip_pos  n m := 
    let s := le_lt_dec n m in
       if s as s0 return (Fin (if s0 then n else m) -> Fin n + Fin m)
           then fun i : Fin n => inl (Fin m) i
                else fun i : Fin m => inr (Fin n) i.
 
 
            
(* Zip *)
(*Definition czip :=  let smap :=  (fun a => min (fst a) (snd a)) in
      let pmap := (fun aa : s (Lst <x> Lst) => 
                (fun ps: p zLst (smap aa) =>  zip_pos aa ps)) in
             uCmr (Lst <x> Lst) zLst smap pmap. *)

 Definition czip1 : cmr  (Lst <x> Lst) Lst :=
    uCmr (Lst <x> Lst) Lst (fun a => min (fst a) (snd a)) (fun a => zip_pos (fst a) (snd a)).

(* Unzip *)

Definition cunzip  := 
   uCmr Lst (Lst <x> Lst) (fun n : nat =>  (n , n)) 
        (fun a : nat => fun ps : Fin a + Fin a => match ps with
                                                  | inl a =>  a
                                                  | inr a =>  a 
                                                 end).
  (* zip rev 1*)
Definition zrev : cmr (Lst <x> Lst) (Lst <x> Lst) := let pmap := 
     (fun a : nat * nat => fun Pz : Fin (fst a) + Fin (snd a) => 
            match Pz with
            | inl a => inl _ (rv a) 
            | inr a => inr _ (rv a)
            end) in 
            uCmr (Lst <x> Lst) (Lst <x> Lst) (id (s (Lst <x> Lst)))  pmap.   
 

End Container_Morphisms.  
                                    
Section Container_Proofs. 
 (** * Container Proofs *)
Theorem crev_crev_id :  (m_comp crev crev) ==== (idm Lst).
 Proof.  
   simpl; unfold idm; unfold comp.
   apply morq;  simpl.
   intro a; apply (refl_equal a). 
   intros a p0 p1 H;  elim  H; apply idem_rvFin.
Qed.

 (* head after rev is last *)
 Theorem crev_chead_clast :  (m_comp cHead crev) ==== clast.
 Proof. 
   contInitialize with comp;   FSimpl.
    simpl.  unfold comp; unfold id; trivial.  
    intros; 
   match goal with
   | [ a : nat |- context[last_pos ?a ?x]] => destruct a; FSimpl
   end.
 Qed.

 (* tail. rev = rev . butlast*)
  Theorem crev_cbut_last_ctail :  (m_comp ctail crev) ==== (m_comp crev cbut_lst).
 Proof.
    simpl; unfold idm; unfold comp.
   apply morq;  simpl. unfold id; trivial.
   unfold id; intros; 
   match goal with
   | [a : nat |- context[tail_p ?a ?x]] => destruct a; FSimpl
   end.
  match goal with
  | [a : nat, p1 : Fin (S ?a - 1) |- context[tail_p (S ?a) ?p1]] =>
      destruct a; simpl in *; FSimpl
  end.
 Qed.


 Lemma cpos_nrv ( a : Ext Lst nat)
   (p0 : CPos Lst (uext Lst (u a) (fun a0 : Fin (u a) => f a (rv (rv a0)))))
   ( p1 : CPos Lst a) : JMeq p0 p1 -> 
   cpos Lst a (rv (rv (cs p0))) (cp p0) = p1.
  Proof.
     intros.
    cut  (a = uext Lst (u a) (fun z : Fin (u a) => f a (rv (rv z)))).
    intro H1.  destruct (cpos_Jmeq (C := Lst) (D := Lst)  (sym_eq H1) H).
    apply (cpos_eq (cpos Lst a (rv (rv (cs p0))) (cp p0)) p1). simpl.
    rewrite idem_rvFin ; apply (JMeq_eq H0). simpl. trivial.
    rewrite  (extensionality (fun z : Fin ( u a) => f a (rv (rv z))) (f a) 
                (fun x  :Fin (u a) => f_equal (f a) (idem_rvFin x))).
   destruct a; trivial.
 Qed.

(* reversing nested lists (i.e. via composing containers) is also idempotent *)
Theorem ap_crev_id :
  (m_comp (ap_mor crev Lst) (ap_mor crev Lst)) ==== (idm (cComp Lst Lst)).
Proof.
  apply morq; unfold comp; unfold id; simpl. unfold id. unfold comp. simpl.
  intro a ;  
  rewrite (extensionality (fun z : Fin ( u a) => f a (rv (rv z))) (f a) 
                (fun x  :Fin (u a) => f_equal (f a) (idem_rvFin x))).
  destruct a; simpl; trivial.
  unfold id; intro a. unfold comp; simpl. intros.
  rewrite <- (cpos_nrv   H). trivial.
 Qed.


 (* zip_rev  *)
 (*  Theorem czip_rev : (czip_revr)  ==== (m_comp zrev czip ).
 Proof.
   apply morq; simpl; trivial; unfold comp; unfold id.
   intros a p0 p1 H; elim H; trivial.
 Qed. 
                           
 (* Distributuvty of append over reverse *)

(* Lemma finsplit_inl_rv n n0 (i : Fin n):
   match finsplit n n0 (rv (fin_inl n0 i)) with
   | is_inl a => inl (Fin n0) a
   | is_inr a => inr (Fin n) a
   end =  inl (Fin n0) (rv i).
 Proof.
    induction i.  simpl.  destruct n; simpl. intros. inversion i.
    intros. destruct (finEmtp i). simpl. *)

 Lemma cdist_apprev_pos_lemma: 
   forall (a : nat * nat) (p0 : Fin (snd a + fst a))
     (p1 : Fin (fst a + snd a)),  JMeq p0 p1 ->
   match
     match FinCase (snd a) (fst a) p0 with
     | inl p2 => inl (Fin (fst a)) (rv p2)
     | inr p2 => inr (Fin (snd a)) (rv p2)
     end
   with
   | inl d => inr (Fin (fst a)) d
   | inr c => inl (Fin (snd a)) c
   end = FinCase (fst a) (snd a) (rv p1).
 Proof.
   intros a p0 p1 jm; destruct a.
   unfold FinCase;  simpl in  * |- *.
   rewrite (match_simpl n0 n p0). 
   apply  (finsumX (refl_equal (rv p1)) (finsplit n0 n p0) (finsplit n n0 (rv p1)) jm).
   (* reflexivity. *)
 Qed.

Theorem cdist_aprev : 
  (m_comp cappend  (m_comp (mor_prod crev crev) (prod_swap Lst Lst))) ====
    (m_comp crev cappend). 
Proof.
   apply morq; simpl; unfold comp; unfold id; auto with arith. 
   apply cdist_apprev_pos_lemma.
 Qed.
 

(* append is nill *)
Theorem capp_is_nil (X : Set) (ex : Ext (Lst <x> Lst) X) : 
   mmap cappd ex = cnil X -> (fst (u ex)) = 0 /\ (snd (u ex)) = 0.  
 Proof.
   intros X ex; destruct ex; simpl.
   unfold comp; unfold cnil.
   intro H; injection H.
   intros H0 H1;
   case (plus_is_O (fst u) (snd u)); auto.
Qed.

(* associativity of append  *)
Lemma capp_assoc :  (m_comp cappendl (prod_swap1 Lst Lst Lst)) ==== cappendr.
Proof.
 unfold cappendl; unfold cont_prod; simpl.
 unfold comp ; apply morq; simpl; auto.
 intros a p0 p1 H; destruct a.
 destruct p; simpl in *.
 destruct (finsplit (n0 + n1) n p0).
 destruct (finsplit n0 n1 i).
 destruct (finsplit (n0 + n1) n p1).
 destruct (finsplit n0 n1 i0).
 case (fin_inl_inject n1 i i0 
  (JMeq_eq  (fin_inl_JM n (refl_equal (n0 + n1)) (fin_inl n1 i) (fin_inl n1 i0) H)));
 trivial.
 case (finsplit_inl_inr i j 
      (JMeq_eq  (fin_inl_JM n (refl_equal (n0 + n1)) (fin_inl n1 i) (fin_inr n0 j)H )) ).
 case (finsplit_inl_inr (fin_inl n1 i) j (JMeq_eq H)).
 destruct (finsplit (n0 + n1) n p1).
 destruct (finsplit n0 n1 i).
 case (finsplit_inl_inr i j   
      (sym_equal (fin_inl_inject n (fin_inr n0 j) (fin_inl n1 i) (JMeq_eq H))) ).
 case (fin_inr_inject n0 j j0 
     (fin_inl_inject n (fin_inr n0 j) (fin_inr n0 j0) (JMeq_eq H))); trivial.
 case (finsplit_inl_inr (fin_inr n0  j) j0 (JMeq_eq H) ) .
 destruct (finsplit (n0 + n1) n p1).
 destruct (finsplit n0 n1 i).
 case  (finsplit_inl_inr (fin_inl n1 i) j (sym_equal (JMeq_eq H)) ).
 case (finsplit_inl_inr (fin_inr n0 j0) j (sym_equal (JMeq_eq H))).
 case (fin_inr_inject (n0 + n1) j j0 (JMeq_eq H)); trivial.
Qed.
 
Section  Naturality_Laws.

  Variables X Y : Set.
  Variable  F : X -> Y.
 

  Theorem cmap_head (ex : Ext Lst X) : (cmap F (mmap cHead ex)) = (mor_map cHead F ex). 
  Proof. 
    destruct ex; auto.
  Qed.
 
  Theorem cmap_tail (ex : Ext Lst X): cmap F (mmap ctail ex) = mor_map ctail F ex.
  Proof.
    destruct ex; auto.
  Qed.  

  Theorem cmap_rev (ex : Ext Lst X): cmap F (mmap crev ex) = mor_map crev F ex.
  Proof.
    destruct ex;  auto.
  Qed.

 Theorem cmap_flatt (ex : Ext (cComp Lst Lst) X) :
     cmap F (mmap cflatt ex) = mor_map cflatt F ex.
  Proof.
    destruct ex; auto.
  Qed.

 Theorem cmap_append (ex : Ext (cont_prod Lst Lst) X):
      (mor_map cappend F ex) =  (cmap F (mmap cappend ex)).
  Proof.
    destruct ex; auto. 
  Qed.

End Naturality_Laws. 


Theorem map_flatt_rev:
    (m_comp cflatt (m_comp  map_rev (ap_mor crev Lst))) ==== (m_comp crev cflatt).
Proof.
 simpl; unfold comp; unfold id.
 apply morq; simpl.
 apply (fun a : Ext Lst nat => sum_n_rv (f a)). 
 intros a  p0 p1 H; unfold cflatt_p; simpl.
 unfold cflatt_p; simpl.
 destruct a; simpl in *.
 destruct (finSumm (fun a => f (rv a)) p0); simpl. 
 apply  (rv_elim3 p1 (fun _ => fun b => cpos Lst (uext Lst u f) (rv i) (rv k) =
                                         match finSumm f b with
                                        | finPair j k0 => cpos Lst (uext Lst u f) j k0
                                        end ) ). 
 intros j H0; rewrite (rvdist p1 (sym_equal H0)) in H.
 destruct (finSumm f j); simpl. 
 destruct  (finjLem f i0 k0 i k (rvdistJM (sym_eq (sum_n_rv f)) (finj f i0 k0) (sym_JMeq H))).
 apply cpos_eq; auto.
Qed.
 
 (* reversing each inner list  is idempotent *)
Theorem map_rev_id : (m_comp map_rev map_rev) ==== (idm (cComp Lst Lst)).
Proof.
  simpl; unfold comp; unfold id.
  apply morq; simpl; trivial.
  intros a p0 p1 H; elim H. unfold id in *; auto.
  clear H; clear p1. rewrite idem_rvFin. 
  destruct p0; auto. 
Qed.

 
(* map_rev over nested lists *)
Theorem crev_flat : 
    (m_comp cflatt (m_comp (ap_mor crev Lst) map_rev)) ====
    (m_comp cflatt  (m_comp map_rev (ap_mor crev Lst))) .
    apply morq; simpl; unfold comp; unfold id; trivial. 
    unfold cflatt_p; simpl. intros a p0 p1 H; elim H. reflexivity. 
Qed.
   

 Definition two_to1p (a : Ext Lst nat * Ext Lst nat) (b : CPos Lst (extP1 a)) :
                                               CPos Lst (fst a) + CPos Lst (snd a).
   unfold extP1; intros a b;  destruct a; destruct b; simpl in *. 
   destruct  cs; simpl in *.
   exact (inl _ (cpos Lst e f cp)). (*CPos Lst (snd a)*)
   exact (inr  _ (cpos Lst e0 f cp)). (*CPos Lst (fst a)*)
 Defined. Check extP1.

 Definition extP2 : forall (C D : Ucontainer) (X : Type),
   Ext (ucont (fun q : s C * s D => (p C (fst q) + p D (snd q))%type)) X ->
       Ext C X * Ext D X.
   intros C D X ex; destruct ex; simpl in *. destruct u; simpl in *.
   exact (uext C s (fun a => f (inl (p D s0) a)) ,  uext D s0 (fun a => f (inr (p C s) a))).
 Defined. 

 Definition cComp_prd_iso (a : cmr (cComp (cont_prod Lst Lst) Lst) (cComp Lst Lst)) :
               cmr (cont_prod (cComp Lst Lst) (cComp Lst Lst)) (cComp Lst Lst).
    intro a; destruct a; simpl in *.
    exact (uCmr (cont_prod (cComp Lst Lst) (cComp Lst Lst)) 
          (cComp Lst Lst) (fun a: Ext Lst nat * Ext Lst nat => v (extP1 a)) 
          (fun a H =>  (two_to1p _ (g  (extP1 a) H)))).
 Defined. 

 
 Definition ext_app (a : Ext Lst nat * Ext Lst nat) := 
     uext Lst (u (fst a) + u (snd a)) (fun a0 : Fin (u (fst a) + u (snd a)) =>
                                         match finsplit (u (fst a)) (u (snd a)) a0 with
                                         | is_inl z => f (fst a) z
                                         | is_inr z => f (snd a) z
                                         end). 

Lemma sum_n_sim : forall a : Ext Lst nat * Ext Lst nat, 
                sum_n (f (fst a)) + sum_n (f (snd a)) =  sum_n (f  (ext_app a)).
Proof.
  intro a; destruct a; simpl.
  replace (fun a0 : Fin (u e + u e0) =>
      match finsplit (u e) (u e0) a0 with
      | is_inl z => f e z
      | is_inr z => f e0 z
      end) with (fun a0 : Fin (u e + u e0) =>
      match FinCase (u e) (u e0) a0 with
      | inl z => f e z
      | inr z => f e0 z
      end). 
  rewrite (sum_nm (f e) (f e0)); trivial.
   apply extensionality. intro a; unfold FinCase.
  destruct (finsplit (u e) (u e0) a); trivial.
Qed.

(* flatten append is equal as container morphism  *)
Theorem cdist_apflatt :
   (m_comp cflatt (cComp_prd_iso (ap_mor cappend Lst))) ==== 
    (m_comp cappend (mor_prod cflatt cflatt)).
 Proof. 
    unfold Lst; apply morq;
   intros; simpl;  unfold comp; simpl in *; unfold cComp_prd_iso;
    let hhh := (try (match goal with 
       |[ a : ?X * ?Y |- _] =>  destruct a; simpl in *
       end); unfold comp in *; simpl in *; 
     try apply  (sum_nm (f e) (f e0))) in hhh. 
    match goal with
    | [ |- context [cflatt_p]] => unfold cflatt_p; simpl in *
    end;  
   repeat 
      (match goal with 
          | [ P1 : Fin (?m + ?n ) |- _ ] =>
                    destruct ( finsplit _ _  P1) ; simpl in *
          | [ |- context [finSumm ?f ?a ] ] => 
                    destruct (finSumm f a)
           | [ |- context [FinCase _ ?X (fin_inl ?X ?i) ]] => 
                let Eq := constr:(FinCase_inl X i) in
                      rewrite Eq
           | [ |- context [FinCase ?X _ (fin_inr ?X ?i) ]] => 
                let Eq := constr:(FinCase_inr X i) in
                      rewrite Eq

    | [ H : JMeq (finj  _ (fin_inr _ ?b) _ ) (fin_inl (sum_n _ ) (finj _ _ _ )) |- _ ] =>
                   let dterm := constr:(finjInr_Inl_false _ _ _ _ _ _ H) in
                                destruct dterm 
    | [ H : JMeq (fin_inl (sum_n _ ) (finj _ _ _ )) (finj  ?a (fin_inr _ ?b) ?c )  |- _ ] =>
                   let dterm := constr:(finjInr_Inl_false _ _ _ _ _ _ (sym_JMeq H)) in
                                destruct dterm 
 

     | [ H : JMeq (finj  _ (fin_inl _ ?b) _ ) (fin_inr (sum_n _ ) (finj _ _ _ )) |- _ ] =>
                   let dterm := constr:(finjInl_Inr_false _ _ _ _ _ _ H) in
                                destruct dterm 
     | [ H : JMeq (fin_inr (sum_n _ ) (finj _ _ _ )) (finj  _ (fin_inl _ ?b) _ ) |- _ ] =>
                   let dterm := constr:(finjInl_Inr_false _ _ _ _ _ _ (sym_JMeq H)) in
                                destruct dterm  
             (* rewriting *)
     | [ H : JMeq (finj  _ (fin_inl _ ?b) _) (fin_inl (sum_n _ ) (finj _ _ _ )) |- _ ] =>
               let Eq := constr:(FinCase_inl_rwt _ _ _ _ _ _ H) in
                  match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end
 
       | [ H : JMeq (finj  _ (fin_inr _ ?b) _) (fin_inr (sum_n _ ) (finj _ _ _ )) |- _ ] =>
              let Eq := constr:(FinCase_inr_rwt _ _ _ _ _ _ H) in
                 match goal with
                  | [ |- context [Lst]] => 
                            progress (unfold Lst) ; (rewrite Eq || rewrite <- Eq)
                  | [ |- context[(cpos (ucont Fin) _ _)] ] =>  rewrite Eq || rewrite <- Eq
                  end 
      

           end); auto. 
    Qed.
   

End Container_Proofs.
(** * Automatic Proofs *)

  Ltac finSumn_rewrite :=
    match goal with
    | x : Ext _ nat |- _  => 
         let F := constr:(f x) in
            let Eq := constr:(sum_n_rv F) in 
                   rewrite Eq || rewrite <- Eq
    end.
   
  
  (* resolve the shape maps *)
  Ltac solveShapes :=
      match goal with
      | [ |- (?X = ?Y) ] => 
                     match type of X with
                     | nat => first [auto with arith | omega ]
                     end
     | [ x : _ * _ |- _ ] => destruct x; simpl fst in *; simpl snd in * 
      end.


 Tactic Notation "contInitialise" "with" constr(h) := repeat (contInit h). 

  (* Intialize and solve the shape maps *)
  Ltac conTinit := 
     contInitialise with cflatt_p ;  
           repeat (solveShapes || finSumn_rewrite ). 

 Section Automatic_Proofs.
 (**  Auotomatic proofs of previous results *)


 Ltac container_tac := 
   let ctac :=
     (conTinit; simpl in *; FSimpl; repeat 
     ( match goal with
     | [ x :  _ * _ |- _ ] =>  destruct x as [e1 e2]; simpl in *
     | [x : Ext _ nat, y : Ext _ nat |- _ ] =>
          let F := constr:(f x) in 
               let G := constr:(f y) in
                 let Eq := constr:(sum_nm F G) in rewrite Eq 
     | [a : nat |- context[tail_p ?a ?x]] => destruct a 
     | [a : nat, p1 : Fin (S ?a - 1) |- context[tail_p (S ?a) ?p1]] =>
        destruct a; simpl in *
      | [ a : nat |- context[last_pos ?a ?x]] => destruct a; FSimpl
    end); auto) in 
      first [ progress ctac | fail "container_tac cannot solve this goal"  ].


  Theorem crev_crev_id1 :  (m_comp crev crev) ==== (idm Lst).
    Time container_tac. (*Finished transaction in 0. secs (0.008569u,0.000247s)*) 
  Qed.

  Theorem crev_crev_id2 : (idm Lst) ====  (m_comp crev crev).
     Time container_tac. (* Finished transaction in 0. secs (0.008531u,0.000351s) *)
  Qed.

 (* head after rev is last *)
Theorem crev_chead_clastA :  (m_comp cHead crev) ==== clast. 
  Time container_tac. (*Finished transaction in 0. secs (0.016541u,0.000488s) *)
Qed.

(* Theorem ap_crev_idA :
  (m_comp (ap_mor crev Lst) (ap_mor crev Lst)) ==== (idm (cComp Lst Lst)). 
  Time container_tac. (* *)
 Qed. *) 

 (* tail. rev = rev . butlast
  Theorem crev_cbut_last_ctailA :  (m_comp ctail crev) ==== (m_comp crev cbut_lst).
    Time container_tac. (* Finished *)
   Qed. *)


  Theorem cdist_aprev1 : 
    (m_comp cappd (m_comp (mor_prod crev crev)  (prod_swap Lst Lst))) ====
    (m_comp crev cappd).
   Proof. 
     Time container_tac. (* Finished transaction in 0. secs (0.071536u,0.001503s) *)
  Qed.

  Theorem cdist_aprev2 : 
   (m_comp crev cappd) ==== (m_comp cappd (m_comp (mor_prod crev crev)  (prod_swap Lst Lst))). 
  Proof.
     Time container_tac. 
  Qed.

 Lemma capp_assoc1 :  (m_comp cappendl (prod_swap1 Lst Lst Lst)) ==== cappendr.
  Proof.
    Time container_tac. 
 Qed.

 Lemma capp_assoc2 :  cappendr ==== (m_comp cappendl (prod_swap1 Lst Lst Lst)).
  Proof.
   Time container_tac. 
 Qed.

 (* examples with flatten *)
 Theorem crev_flat1 : 
    (m_comp cflatt (m_comp (ap_mor crev Lst) map_rev)) ====
    (m_comp cflatt  (m_comp map_rev (ap_mor crev Lst))) .
  Proof.
    Time container_tac. 
 Qed.

 
 Theorem crev_flat2 : 
    (m_comp cflatt  (m_comp map_rev (ap_mor crev Lst))) ====
    (m_comp cflatt (m_comp (ap_mor crev Lst) map_rev)).
  Proof.
   Time container_tac. 
 Qed.

 Theorem map_flatt_rev1:
    (m_comp cflatt (m_comp  map_rev (ap_mor crev Lst))) ==== (m_comp crev cflatt).
 Proof.
   Time container_tac. 
 Qed.

  Theorem map_flatt_rev2:
     (m_comp crev cflatt) ==== (m_comp cflatt (m_comp  map_rev (ap_mor crev Lst))).
 Proof.
   Time container_tac. 
 Qed. 

 Theorem cdist_apflatt1 :
   (m_comp cflatt (cComp_prd_iso (ap_mor cappend Lst))) ====
    (m_comp cappend (mor_prod cflatt cflatt)).
 Proof. 
   Time container_tac. 
 Qed.

 Theorem cdist_apflatt2 :
    (m_comp cappend (mor_prod cflatt cflatt)) ====
      (m_comp cflatt (cComp_prd_iso (ap_mor cappend Lst))).
 Proof. 
   Time container_tac. 
 Qed.
  

 End Automatic_Proofs.
   

End  List_functions_and_proofs.

End  Ucontainers_lists.

 Section Folds.
   (** * Experiments with Folds  *)
  (* We now define a generic fold over container morphisms *)
      Section foldSmap.
      (* The shape map for the folds *)
      Variables ( C A : Type) (u0 : C -> A) (u1 : (C * unit * A) -> A)  
      (P1 : A -> Type) (P : C -> Type) 
      (f0 : forall c, P1 (u0 c) -> P c)
      (f1 : forall c x a, P1 (u1 (c, x, a)) -> P c + unit + P1 a).
     
     Fixpoint fld s n  : A :=
       match n with
       | O => u0 s
       | S n' => u1 (s , tt,  (fld s n'))
       end.
   
     Fixpoint fldp s n : P1 (fld s n) -> P s + Fin n :=
        match n as e return (P1 (fld s e) -> P s + Fin e) with
        | 0   => fun i => inl _ (f0 i)
        | S m => fun i => match f1 i with
                    | inl (inl q) => inl _ q
                    | inl (inr _) => inr _ (fz m)
                    | inr q =>
                        match fldp _ _ q with
                        | inl p0 => inl _ p0
                        | inr a => inr _ (fs a)
                        end
                    end
        end.         
     End foldSmap.
  
   (** fold on contaienrs for lists  *)
   Variables (C A : Ucontainer)
             (a : C ===> A)
             (F : ((C <x> Un_cont) <x> A) ===> A). 

   Definition cGenfold : (C <x> (ucont Fin)) ===> A :=
     uCmr (C <x> (ucont Fin)) A
      (fun (x : s C * nat)  => fld (v a) (v F) (fst x) (snd x)) 
      (fun (x : s C * nat) =>  fldp (v a) (v F) (p A) (p C) (g a)  
        (fun c x a => g F (c, x ,a)) (fst x) (snd x)).
 End Folds.
 
 
  Definition crevZero : One_cont ===> Lst :=
       uCmr One_cont Lst (fun _ => 0) (fun _ => (nofin Empty)).

  Definition crevSuc : ((One_cont <x> Un_cont) <x> Lst) ===> Lst.
    refine (uCmr ((One_cont <x> Un_cont) <x> Lst) Lst
       (fun x => S (snd x)) _ ); simpl.
    destruct a; simpl.  
    intro i; destruct (finEmtp i).
    exact (inl _ (inr _ tt)).
    exact (inr _  i).
  Defined.

  Definition crevSuc1 : ((One_cont <x> Un_cont) <x> Lst) ===> Lst.
    refine (uCmr ((One_cont <x> Un_cont) <x> Lst) Lst
       (fun x => (snd x) + 1) _ ); simpl.
    destruct a; simpl.  
    intro i; destruct (finsplit _ _  i).
    exact (inr _  i).
    exact (inl _ (inr _ tt)).
  Defined.

  Definition cappSuc : ((Lst <x> Un_cont) <x> Lst) ===> Lst.
    refine (uCmr ((Lst <x> Un_cont) <x> Lst) Lst
       (fun x =>  (snd x) + 1) _ ); simpl. 
    destruct a ; simpl.
     intro i ;   destruct (finsplit _ _  i).
     exact (inr _ i).
     exact (inl _ (inr _ tt)).
    (* destruct i.
      exact (inl _ (inr _ tt)).
    (* destruct (finsplit _ _ i).
     exact (inl _ (inl _ i)).*)
     exact (inr _ (fs i)). *)
  Defined.

 Lemma isId : (fld (fun i : unit => 0) (fun x => S (snd x)) tt ) = (fun x => x) .
   apply extensionality.
   induction a; simpl; auto.
  Qed.

 Lemma finEmtp_tp : forall n, finEmtp (tp n) = isTp n.
   induction n; simpl; auto. rewrite IHn. trivial.
 Qed.

 Lemma finEmtp_em : forall n (i : Fin n), finEmtp (emb i) = isEmb i.
   induction i; simpl; auto.
   rewrite IHi; trivial.
 Qed.

 Definition feq_app : forall (A B : Type) (f g : A -> B), 
   f = g -> (forall a : A, f a = g a).
  intros A B f g h; destruct h; trivial.
 Qed. 

 Definition Jm_feq_app :
   forall (X A B : Set) (f : A -> X) (g : B -> X),
      JMeq f g ->  (forall (a : A) (b : B), JMeq a b -> f a = g b).
  
 Lemma rv_tp : forall n, rv (tp n) = fz n.
  induction n; simpl ; auto.
  rewrite IHn; simpl. trivial.
 Qed.

 Lemma Jmeq_embInject (n m : nat) (i :Fin n) (j : Fin m) :
     n = m -> JMeq (emb i) (emb j) -> JMeq i j.
Proof.
  intros n m i j H; destruct H. 
  intro H;  elim (embInject _ _  (JMeq_eq H));  trivial.
Qed.

 Lemma isRv (a0 : nat) : (JMeq (
   fldp (fun _ : unit => 0) (fun x : unit * unit * nat => S (snd x)) Fin
       (fun _ : unit => Empty) (fun _ : unit => nofin Empty)
       (fun (_ _ : unit) (a3 : nat) (i : Fin (S a3)) =>
        match finEmtp i with
        | isTp => inl (Fin a3) (inr Empty tt)
        | isEmb i0 => inr (Empty + unit) i0
        end) tt a0 ) (fun i : Fin a0 => inr Empty (rv i))).
  Proof.
    intros. apply jm_ext; intros.
    induction a0; simpl. inversion b. simpl in a.
    destruct (finEmtp a). simpl. rewrite finEmtp_tp.
    cut (forall n m, n = m -> JMeq (tp n) (tp m)). intros.
    set (r := trans_JMeq (sym_JMeq H) (H0 _ _  (feq_app isId a0)) ). 
    destruct (finEmtp b). rewrite rv_tp;  trivial.
    destruct (tp_emb _ (sym_eq (JMeq_eq r))). intros n m h; destruct h;
    auto. rewrite finEmtp_em. 
    destruct (finEmtp b); simpl.  
    cut (forall n m, n = m -> JMeq (tp n) (tp m)). intros.
    destruct  (tp_emb _ (sym_eq
      (JMeq_eq (trans_JMeq H (sym_JMeq (H0 _ _  (feq_app isId a0))))))). 
    intros n m h; destruct h; auto.
    rewrite (IHa0 i i0 (Jmeq_embInject _ _ (feq_app isId a0) H));
    rewrite  emb_S; trivial.
  Qed.

 Definition dext_swp :
    forall (A C : Type) (B : A -> Type) (a a' : A),
       a = a' ->
       forall (F : B a -> C) (G : B a' -> C),
    JMeq F G -> 
       (forall (x : B a) (y : B a'), JMeq x y -> F x = G y).
   intros A C B a a1 h; destruct h.
   intros F G H; elim H.
   intros x y h; elim h; trivial.
 Qed.

 (* reverse is indeed given by crevZero and crevSuc *)
 Lemma isRev : Eqmor (oneTimes (cGenfold crevZero crevSuc)) crev.
  repeat (contInitialize); try (rewrite isId; trivial). 
   rewrite  (dext_swp (C := Empty + Fin a0)  Fin 
      (feq_app isId a0) (isRv a0) a2 ); trivial.
 Qed.

 Lemma fld_add : forall n m,
     fld (fun a : nat => a)
     (fun x : nat * unit * nat => (snd x) + 1)  n m =
    n + m.
 Proof.
  induction m; simpl;   auto with arith.  
  rewrite IHm;   
  rewrite <- (plus_assoc n m 1 );  rewrite <- (plus_Snm_nSm m 0);
  auto with arith.
 Qed. 

 Lemma Jmeq_fs (n m : nat) (i :Fin n) (j : Fin m) :
     n = m -> JMeq i j -> JMeq (fs i) (fs j).
Proof.
  intros n m i j H; destruct H. 
  intro H; elim  H ;  trivial.
Qed.

 Lemma fin_inl_Sm : forall n m (i : Fin n),
      JMeq (fin_inl (S m) i) (fin_inl 1 (fin_inl m i)).
   cut (forall n m, n + S m = n + m + 1).
   induction i; simpl. fold plus. rewrite (H _ _ ); trivial.
   exact (Jmeq_fs  (H n m) IHi ). intros.
   rewrite <- (plus_assoc n m 1); rewrite <- (plus_Snm_nSm m 0);
   rewrite plus_0_r; auto. 
  Qed.
 
