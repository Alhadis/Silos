(** * Equivalence

    等価性に関する定理や定義。 *)

Require Import Basis .
Require Import Path .
Require Import Pwpath .
Require Import Homotopy.

(** 戦術を使う。 *)
Declare ML Module "ltac_plugin".
Set Default Proof Mode "Classic".

(** 記法を使う。 *)
Import Basis.Notation .
Import Basis.Notation.Path .
Import Path.Notation .
Import Pwpath.Notation .
Import Pwpath.Notation.Chain .

(** Note: このモジュールでは式が複雑なため [ _ @[ _ ] _ ] という記法を
    使っている。理解するために絵算を書いてみることを勧める。その際に使う
    見方は以下のとおりである。

    * [A : Type] - 圏
    * [x = y : Type] - [x] から [y] への射
    * [f : A -> B] - [A] から [B] への関手
    * [f == g] - [f] から [g] への自然変換
    * [f @> η] - "Fη" 、左から関手を付ける
    * [ε <@ f] - "εF" 、右から関手を付ける

    *)


(** ** Equivalence'

    Equivalence を使いやすい形で再定義する。
    これらは [change] で元の定義と互いに移り合う。 *)

(** [s] は [r] の断面 (section) である。

    * [s] は [r] の右逆射である。
    * [r] は [s] の引き込み (retraction) である。
    * [r] は [s] の左逆射である。 *)
Definition section
  {A B : Type}
  (s : A -> B) (r : B -> A)
  : Type
  := r o s == idmap .

(** [r] は [s] の引き込み (retraction) である。

    * [r] は [s] の左逆射である。
    * [s] は [r] の断面 (section) である。
    * [s] は [r] の右逆射である。 *)
Definition retraction
  {A B : Type}
  (r : B -> A) (s : A -> B)
  : Type
  := r o s == idmap .

(** [f] と [g] は [retr] と [sect] を通じて随伴的である。 *)
Definition is_adjoint
  {A B : Type}
  {f : A -> B} {g : B -> A}
  (retr : retraction f g) (sect : section f g)
  : Type
  := retr <@ f == f @> sect .

(** [A] と [B] は [f] と [g] を通じて等価 (equivalence) である。 *)
Definition is_equiv_rel
  {A B : Type}
  (f : A -> B) (g : B -> A)
  : Type
  := sigma retr sect, is_adjoint (f := f) (g := g) retr sect .

(** [f] は等価射 (equivalence) である。 *)
Definition is_equiv
  {A B : Type} (f : A -> B)
  : Type
  := sigma equiv_inv, is_equiv_rel f equiv_inv .

(** [A] と [B] は等価 (equivalence) である。 *)
Definition equiv
  (A B : Type) : Type
  := sigma f, is_equiv (A := A) (B := B) f .

(** それぞれ [Homotopy] の同名定義と互換である (convertible) 。 *)
Check idpath : @is_adjoint = @Homotopy.is_adjoint .
Check idpath : @is_equiv_rel = @Homotopy.is_equiv_rel .
Check idpath : @is_equiv = @Homotopy.is_equiv .
Check idpath : @equiv = @Homotopy.equiv .


(** ** Reflexivity

    [equiv] は反射的である。 *)

Lemma retr_idmap
  {A : Type}
  : @retraction A A idmap idmap .
Proof.
 exact 1 .
Defined.

Lemma sect_idmap
  {A : Type}
  : @section A A idmap idmap .
Proof.
 exact 1 .
Defined.

Lemma is_adj_idmap
  {A : Type}
  : @is_adjoint A A idmap idmap retr_idmap sect_idmap .
Proof.
 exact 1 .
Defined.

(** [idmap] は [is_equiv] である。 *)
Definition is_equiv_idmap {A : Type} : is_equiv (@idmap A) .
Proof.
 refine (dpair idmap _) .
 refine (dpair retr_idmap _) .
 refine (dpair sect_idmap _) .
 exact is_adj_idmap .
Defined.

(** 全ての [A : Type] に対して [equiv A A] である。 *)
Definition equiv_idmap {A : Type} : equiv A A .
Proof.
 refine (dpair idmap _) .
 exact is_equiv_idmap .
Defined.


(** ** Transitivity

    [equiv] は推移的である。 *)

Lemma retr_compose
  {A B C : Type} {f : A -> B} {g : B -> A} {h : B -> C} {i : C -> B}
  (r_fg : retraction f g) (r_hi : retraction h i)
  : retraction (h o f) (g o i) .
Proof.
 unfold retraction ; unfold retraction in r_fg, r_hi .
 change (h o (f o g) o i == idmap) .
  refine (
      (* h o (f o g) o i *)
    _
      @[ h o i ]
    _
      (* idmap *)
    ) .
 -
  change (h o (f o g) o i == h o idmap o i) .
  refine (h @> _ <@ i) .
  exact r_fg .
 -
  exact r_hi .
Defined.

Lemma sect_compose
  {A B C : Type} {f : A -> B} {g : B -> A} {h : B -> C} {i : C -> B}
  (s_fg : section f g) (s_hi : section h i)
  : section (h o f) (g o i) .
Proof.
 unfold section ; unfold section in s_fg, s_hi .
 change (g o (i o h) o f == idmap) .
  refine (
      (* g o (i o h) o f *)
    _
      @[ g o f ]
    _
      (* idmap *)
    ) .
 -
  change (g o (i o h) o f == g o idmap o f) .
  refine (g @> _ <@ f) .
  exact s_hi .
 -
  exact s_fg .
Defined.

Lemma is_adj_compose
  {A B C : Type} {f : A -> B} {g : B -> A} {h : B -> C} {i : C -> B}
  (r_fg : retraction f g) (s_fg : section f g)
  (r_hi : retraction h i) (s_hi : section h i)
  (fg : is_adjoint r_fg s_fg) (hi : is_adjoint r_hi s_hi)
  : is_adjoint (retr_compose r_fg r_hi) (sect_compose s_fg s_hi) .
Proof.
 unfold is_adjoint ; unfold is_adjoint in fg, hi .
 unfold retraction in r_fg, r_hi .
 unfold section in s_fg, s_hi .
 unfold retr_compose, sect_compose .
 refine (
     (* (h @> r_fg <@ i) @ r_hi <@ h o f *)
   _
     @[ (h @> r_fg <@ i <@ h o f) @ (r_hi <@ h o f) ]
   _
     @[ ((h @> r_fg <@ i o h) <@ f) @ ((h @> s_hi) <@ f) ]
   _
     @[ (h @> ((r_fg <@ i o h) @ s_hi)) <@ f ]
   _
     @[ h @> ((f o g @> s_hi) @ r_fg) <@ f ]
   _
     @[ (h @> (f o g @> s_hi) <@ f) @ (h @> r_fg <@ f) ]
   _
     @[ (h o f @> (g @> s_hi <@ f)) @ (h o f @> s_fg) ]
   _
     (* h o f @> (g @> s_hi <@ f) @ s_fg *)
   ) .
 -
  exact (wiskerR_pw_fn_pp (h @> r_fg <@ i) r_hi (h o f)) .
 -
  refine (concat_pw_pw _ _) .
  +
   refine ( _ @[ h @> r_fg <@ i <@ h <@ f ] _ ) .
   *
    exact (wiskerR_pw_fn_ff (h @> r_fg <@ i) h f) .
   *
    refine (wiskerR_pw_fn_p _ f) .
    exact (wiskerR_pw_fn_ff (h @> r_fg) i h)^ .
  +
   refine ( _ @[ r_hi <@ h <@ f ] _ ) .
   *
    exact (wiskerR_pw_fn_ff r_hi h f) .
   *
    refine (wiskerR_pw_fn_p _ f) .
    exact hi .
 -
  refine ( _ @[ (h @> r_fg <@ i o h) @ (h @> s_hi) <@ f ] _ ) .
  +
   exact (wiskerR_pw_fn_pp (h @> r_fg <@ i o h) (h @> s_hi) f)^ .
  +
   refine (wiskerR_pw_fn_p _ f) .
   refine ( _ @[ (h @> (r_fg <@ i o h)) @ (h @> s_hi) ] _ ).
   *
    refine (wiskerR_pw_pw _ (h @> s_hi)) .
    exact (wiskerLR_pw_fn_comm h r_fg (i o h)) .
   *
    exact (wiskerL_pw_fn_pp h (r_fg <@ i o h) s_hi)^ .
 -
  refine (wiskerR_pw_fn_p _ f) .
  refine (wiskerL_pw_fn_p h _) .
  exact (concat_pw_wLpp r_fg s_hi)^ .
 -
  refine ( _ @[ (h @> f o g @> s_hi) @ (h @> r_fg) <@ f ] _ ) .
  +
   refine (wiskerR_pw_fn_p _ f) .
   exact (wiskerL_pw_fn_pp h (f o g @> s_hi) r_fg) .
  +
   exact (wiskerR_pw_fn_pp (h @> f o g @> s_hi) (h @> r_fg) f) .
 -
  refine (concat_pw_pw _ _) .
  +
   refine ( _ @[ h @> f @> g @> s_hi <@ f ] _ ).
   *
    refine (wiskerR_pw_fn_p _ f) .
    refine (wiskerL_pw_fn_p h _) .
    exact (wiskerL_pw_fn_ff f g s_hi) .
   *
    refine ( _ @[ h o f @> g @> s_hi <@ f ] _ ) .
    --
     refine (wiskerR_pw_fn_p _ f) .
     exact (wiskerL_pw_fn_ff h f (g @> s_hi))^ .
    --
     exact (wiskerLR_pw_fn_comm (h o f) (g @> s_hi) f) .
  +
   refine ( _ @[ h @> (r_fg <@ f) ] _ ) .
   *
    exact (wiskerLR_pw_fn_comm h r_fg f) .
   *
    refine ( _ @[ h @> f @> s_fg ] _ ) .
    --
     refine (wiskerL_pw_fn_p h _) .
     exact fg .
    --
     exact (wiskerL_pw_fn_ff h f s_fg)^ .
 -
  exact (wiskerL_pw_fn_pp (h o f) (g @> s_hi <@ f) s_fg)^ .
Defined.

Lemma is_equiv_rel_compose
  {A B C : Type} {f : A -> B} {g : B -> A} {h : B -> C} {i : C -> B}
  (fg : is_equiv_rel f g) (hi : is_equiv_rel h i)
  : is_equiv_rel (h o f) (g o i) .
Proof.
 revert fg hi .
 refine (dsum_elim_nodep _) .
 refine (fun r_fg => _) .
 refine (dsum_elim_nodep _) .
 refine (fun s_fg fg => _) .
 refine (dsum_elim_nodep _) .
 refine (fun r_hi => _) .
 refine (dsum_elim_nodep _) .
 refine (fun s_hi hi => _) .
 refine (dpair (retr_compose r_fg r_hi) _) .
 refine (dpair (sect_compose s_fg s_hi) _) .
 exact (is_adj_compose r_fg s_fg r_hi s_hi fg hi) .
Defined.

(** [f] と [h] が等価射であるならば、それを合成した [h o f] も等価射である。 *)
Definition is_equiv_compose
  {A B C : Type} {f : A -> B} {h : B -> C}
  (f_iv : is_equiv f) (h_iv : is_equiv h)
  : is_equiv (h o f) .
Proof.
 revert f_iv h_iv .
 refine (dsum_elim_nodep _) .
 refine (fun g fg => _) .
 refine (dsum_elim_nodep _) .
 refine (fun i hi => _) .
 refine (dpair (g o i) _) .
 exact (is_equiv_rel_compose fg hi) .
Defined.

(** [equiv] の合成。 *)
Definition equiv_compose
  {A B C : Type}
  (AB : equiv A B) (BC : equiv B C)
  : equiv A C .
Proof.
 revert AB BC .
 refine (dsum_elim_nodep _) .
 refine (fun f f_iv => _) .
 refine (dsum_elim_nodep _) .
 refine (fun h h_iv => _) .
 refine (dpair (h o f) _) .
 exact (is_equiv_compose f_iv h_iv) .
Defined.


(** ** Homotopic

    [h : f == g] を通して [is_equiv f] から [is_equiv g] を得る。 *)

Lemma retr_homotopic
  {A B : Type} {f : A -> B} {g : A -> B} {h : B -> A}
  (r : retraction f h) (homo : f == g)
  : retraction g h .
Proof.
 unfold retraction; unfold retraction in r .
 refine ( _ @[ f o h ] _ ) .
 -
  exact (wiskerR_pw_fn homo^ h) .
 -
  exact r .
Defined.

Lemma sect_homotopic
  {A B : Type} {f : A -> B} {g : A -> B} {h : B -> A}
  (s : section f h) (homo : f == g)
  : section g h .
Proof.
 unfold section; unfold section in s .
 refine ( _ @[ h o f ] _ ) .
 -
  exact (wiskerL_pw_fn h homo^) .
 -
  exact s .
Defined.

Definition idpath_pw' := @idpath_pw .

Arguments idpath_pw' [_ _] _ .

Lemma is_adj_homotopic
  {A B : Type} {f : A -> B} {g : A -> B} {h : B -> A}
  (r : retraction f h) (s : section f h)
  (a : is_adjoint r s) (homo : f == g)
  : is_adjoint (retr_homotopic r homo) (sect_homotopic s homo) .
Proof.
 unfold is_adjoint ; unfold is_adjoint in a .
 unfold retraction in r .
 unfold section in s .
 unfold retr_homotopic, sect_homotopic .
 refine (
     (* (homo^ <@ h) @ r <@ g *)
   _
     @[ (homo^ @@ (1 : h == h)) @ (r @@ (1 : g == g)) ]
   _
     @[ (homo^ @@ (1 : h == h) @ r) @@ (homo^ @ (1 : f == f) @ homo) ]
   _
     @[ ((homo^ @@ (1 : h == h)) @@ homo^) @ ((1 : f == f) @@ r) @ homo ]
   _
     @[ ((homo^ @@ (1 : h == h)) @@ homo^) @ (f @> r) @ homo ]
   _
     @[ (homo^ @@ ((1 : h == h) @@ homo^)) @ (s <@ f) @ homo ]
   _
     @[ (homo^ @@ ((1 : h == h) @@ homo^)) @ (s @@ (1 : f == f)) @ homo ]
   _
     @[ (homo^ @ (1 : f == f) @ homo) @@ (((1 : h == h) @@ homo^) @ s) ]
   _
     @[ idpath_pw' (idpath_pw' g) @@ ((idpath_pw' homo^) @@ (idpath_pw' (idpath_pw' h)) @ s) ]
   _
     (* g @> (h @> homo^) @ s *)
   ) .
Admitted.

(** 参考文献:

    * https://github.com/HoTT/HoTT/blob/1940297dd121d54d033274d84c5d023fdc56bfb4/theories/Basics/Equivalences.v

    *)
