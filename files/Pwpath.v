(** * Pwpath - Pointwise Path

    点付きの道についての定義、定理を記述する。 *)

Require Import Basis .
Require Import Path .

(** 戦術を使う。 *)
Declare ML Module "ltac_plugin" .
Set Default Proof Mode "Classic" .

(** 記法を使う。 *)
Import Basis.Notation .
Import Basis.Notation.Path .
Import Path.Notation .


(** 道から、点ごとの道を得る。

    逆は [funext] であり、証明も反証もできない。 *)
Definition pwpaths_paths
  {A : Type} {B : A -> Type}
  {f g : forall a, B a} (p : paths f g)
  : pwpaths f g
  := ap10_dep p .

(** 点ごとの恒等道。 *)
Definition idpath_pw
  (A : Type) (B : A -> Type)
  (f : forall a, B a)
  : pwpaths f f
  := fun a => idpath (f a) .

Arguments idpath_pw {_ _ _} , [_ _] _ .

(** 点ごとの道の逆。 *)
Definition inverse_pw
  {A : Type} {B : A -> Type}
  {f g : forall a, B a}
  (p : pwpaths f g)
  : pwpaths g f
  := fun a => inverse (p a) .

(** 点ごとの道の合成。 *)
Definition concat_pw
  {A : Type} {B : A -> Type}
  {f g h : forall a, B a}
  (p : pwpaths f g) (q : pwpaths g h)
  : pwpaths f h
  := fun a => concat (p a) (q a) .

(** 点ごとの道の両辺に、左から関数を合成する。 *)
Definition wiskerL_pw_fn
  {A B C : Type}
  (f : B -> C)
  {g h : A -> B} (p : g == h)
  : f o g == f o h .
Proof.
 refine (fun x => _) .
 change (f (g x) = f (h x)) .
 refine (ap f _) .
 exact (p x) .
Defined.

(** 点ごとの道の両辺に、右から関数を合成する。 *)
Definition wiskerR_pw_fn
  {A B C : Type}
  {f g : B -> C} (p : pwpaths f g)
  (h : A -> B)
  : f o h == g o h .
Proof.
 refine (fun x => _) .
 change (f (h x) = g (h x)) .
 exact (p (h x)) .
Defined.

Definition wiskerL_pw_fn_p
  {A B C : Type}
  (f : B -> C)
  {g h : A -> B} {p q : g == h} (r : p == q)
  : wiskerL_pw_fn f p == wiskerL_pw_fn f q .
Proof.
 refine (fun x => _) .
 change (ap f (p x) = ap f (q x)) .
 refine (ap (ap f) _) .
 exact (r x) .
Defined.

Definition wiskerR_pw_fn_p
  {A B C : Type}
  {f g : B -> C} {p q : pwpaths f g} (r : p == q)
  (h : A -> B)
  : wiskerR_pw_fn p h == wiskerR_pw_fn q h .
Proof.
 refine (fun x => _) .
 change (p (h x) = q (h x)) .
 exact (r (h x)) .
Defined.

(** [wiskerL_pw_fn] の分配則。 *)
Definition wiskerL_pw_fn_pp
  {A B C : Type}
  (f : B -> C)
  {g h i : A -> B} (p : g == h) (q : h == i)
  : pwpaths
    (wiskerL_pw_fn f (concat_pw p q))
    (concat_pw (wiskerL_pw_fn f p) (wiskerL_pw_fn f q)) .
Proof.
 refine (fun x => _) .
 change (ap f (concat_pw p q x) = wiskerL_pw_fn f p x @ wiskerL_pw_fn f q x) .
 change (ap f (p x @ q x) = ap f (p x) @ ap f (q x)) .
 exact (ap_pp f (p x) (q x)) .
Defined.

(** [wiskerR_pw_fn] の分配則。 *)
Definition wiskerR_pw_fn_pp
  {A B C : Type}
  {f g h : B -> C} (p : f == g) (q : g == h)
  (i : A -> B)
  : pwpaths
    (wiskerR_pw_fn (concat_pw p q) i)
    (concat_pw (wiskerR_pw_fn p i) (wiskerR_pw_fn q i)) .
Proof.
 refine (fun x => _) .
 change (concat_pw p q (i x) = wiskerR_pw_fn p i x @ wiskerR_pw_fn q i x) .
 change (p (i x) @ q (i x) = p (i x) @ q (i x)) .
 exact 1 .
Defined.

(** [wiskerL_pw_fn] の分配則その２。 *)
Definition wiskerL_pw_fn_ff
  {A B C D : Type}
  (f : C -> D) (g : B -> C)
  {h i : A -> B} (p : h == i)
  : pwpaths
    (wiskerL_pw_fn (f o g) p)
    (wiskerL_pw_fn f (wiskerL_pw_fn g p)) .
Proof.
 refine (fun x => _) .
 change (ap (f o g) (p x) = ap f (ap g (p x))) .
 exact (ap_ff f g (p x)) .
Defined.

(** [wiskerR_pw_fn] の分配則その２。 *)
Definition wiskerR_pw_fn_ff
  {A B C D : Type}
  {f g : C -> D} (p : f == g)
  (h : B -> C) (i : A -> B)
  : pwpaths
    (wiskerR_pw_fn p (h o i))
    (wiskerR_pw_fn (wiskerR_pw_fn p h) i) .
Proof.
 refine (fun x => _) .
 change (p ((h o i) x) = p (h (i x))) .
 exact 1 .
Defined.

(** 二つの、関手を恒等関手に移す自然変換があるのならば、
    それらをどのような順番で適用しても等しい。 *)
Definition concat_pw_wLpp
  {A : Type} {f g : A -> A}
  (p : f == idmap) (q : g == idmap)
  : concat_pw (wiskerL_pw_fn f q) p == concat_pw (wiskerR_pw_fn p g) q .
Proof.
 refine (fun x => _) .
 change (wiskerL_pw_fn f q x @ p x = wiskerR_pw_fn p g x @ q x) .
 change (ap f (q x) @ p x = p (g x) @ q x) .
 refine (
   paths_elim _ (q x)
     (P := fun x' qx' => ap f qx' @ p x' = p (g x) @ qx')
   ) .
 change (1 @ p (g x) = p (g x) @ 1) .
 refine (
   concat (y := p (g x)) _ _
   ) .
 -
  exact (concat_1p (p (g x))) .
 -
  exact (concat_p1 (p (g x)))^ .
Defined.

(** [wiskerL_pw_fn] と [wiskerR_pw_fn] は交換する。 *)
Definition wiskerLR_pw_fn_comm
  {A B C D : Type}
  (f : C -> D)
  {g h : B -> C} (p : g == h)
  (i : A -> B)
  : pwpaths
    (wiskerR_pw_fn (wiskerL_pw_fn f p) i)
    (wiskerL_pw_fn f (wiskerR_pw_fn p i)) .
Proof.
 refine (fun x => _) .
 change (wiskerL_pw_fn f p (i x) = ap f (wiskerR_pw_fn p i x)) .
 change (ap f (p (i x)) = ap f (p (i x))) .
 exact 1 .
Defined.

(** 点ごとの道の点ごとの道の両辺に、左から点ごとの道を合成する。 *)
Definition wiskerL_pw_pw
  {A B : Type} {f g h : A -> B}
  (p : f == g)
  {q r : g == h} (s : q == r)
  : concat_pw p q == concat_pw p r .
Proof.
 refine (fun x => _) .
 change (p x @ q x = p x @ r x) .
 refine (wiskerL (p x) _) .
 exact (s x) .
Defined.

(** 点ごとの道の点ごとの道の両辺に、右から点ごとの道を合成する。 *)
Definition wiskerR_pw_pw
  {A B : Type} {f g h : A -> B}
  {p q : f == g} (r : p == q)
  (s : g == h)
  : concat_pw p s == concat_pw q s .
Proof.
 refine (fun x => _) .
 change (p x @ s x = q x @ s x) .
 refine (wiskerR _ (s x)) .
 exact (r x) .
Defined.

(** 点ごとの道の点ごとの道を、縦に合成する。 *)
Definition concat_pw_pw
  {A B : Type} {f g h : A -> B}
  {p q : f == g} (r : p == q)
  {s t : g == h} (u : s == t)
  : concat_pw p s == concat_pw q t .
Proof.
 refine (fun x => _) .
 change (p x @ s x = q x @ t x) .
 refine (concat2 _ _) .
 -
  exact (r x) .
 -
  exact (u x) .
Defined.


(** ** Notations

    記法を定義する。 *)

Module Notation .

  (** 記法が使われる文脈を設定する。 *)
  Delimit Scope pwpath_scope with pwpath .

  (** 文脈を開く。 *)
  Open Scope pwpath_scope .

  (** 文脈を型と結びつける。 *)
  Bind Scope pwpath_scope with pwpaths .

  (** [paths] の [idpath] に準じたもの。 *)
  Notation "1" := idpath_pw
    : pwpath_scope
    .

  (** [paths] の　[concat] に準じたもの。 *)
  Notation "p @ q" := (concat_pw p q)
    (at level 20)
    : pwpath_scope
    .

  (** [paths] の [inverse] に準じたもの。 *)
  Notation "p ^" := (inverse_pw p)
    (at level 3, format "p '^'")
    : pwpath_scope
    .

  (** [wiskerL_pw_fn] の記法。 *)
  Notation "f @> p" := (wiskerL_pw_fn f p)
    (at level 41, right associativity)
    : pwpath_scope
    .

  (** [wiskerR_pw_fn] の記法。 *)
  Notation "p <@ i" := (wiskerR_pw_fn p i)
    (at level 42, left associativity)
    : pwpath_scope
    .

  (** [concat_pw_pw] の記法。 *)
  Notation "r @@ u" := (concat_pw_pw r u)
    (at level 30)
    : pwpath_scope
    .

  (** 等式を鎖状につなげるための記法。

      <<
          (* x0 *)
        _
          @[ x1 ]
        _
          @[ x2 ]
        _
          (* x3 *)
      >>

      *)

  Module Chain .

    (** [p @ q] の、中間の型を明示した記法。 *)
    Notation "p @[ f ] q" := (concat_pw (g := f) p q)
      (at level 50, only parsing, left associativity)
      : pwpath_scope
      .

  End Chain .

End Notation .

(** 参考文献:

    * https://github.com/HoTT/HoTT/blob/1940297dd121d54d033274d84c5d023fdc56bfb4/theories/Basics/PathGroupoids.v

    *)
