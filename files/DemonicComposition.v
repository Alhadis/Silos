Require Import Setoid.

Require Import Statement.

Definition fn { T U V : Type } (P : T >> U) (Q : U >> V) : T >> V :=
  fun s s' => (exists sx, P s sx /\ Q sx s') /\ (forall sx, P s sx -> exists s', Q sx s').

Notation "P ⊟ Q" := (fn P Q) (at level 90, right associativity, format "P  ⊟  Q").

Theorem assoc : forall { T U V W : Type } (P : T >> U) (Q : U >> V) (R : V >> W) s s', (P ⊟ Q ⊟ R) s s' <-> ((P ⊟ Q) ⊟ R) s s'.
Proof.
  intros T U V W P Q R s s'.
  split.
  { intros ((sx,(HHp,((sy,(HHq,HHr)),HHqr))),HHpqr).
    split.
    { exists sy; split; auto.
      firstorder.
    }
    { firstorder. }
  }
  { intros ((sy,(((sx,(HHp,HHq)),HHpq),HHr)),HHpqr).
    split.
    { exists sx; split; auto.
      firstorder.
    }
    { intros sz HHp'.
      destruct (HHpq _ HHp') as (sz',HHq').
      destruct (HHpqr sz') as (sz'',HHr').
      { firstorder. }
      { exists sz''; firstorder. }
    }
  }
Qed.

Theorem right_monotonic : forall (T U V : Type) (P : T >> U) (Q1 Q2 : U >> V),
    (forall s s', Q1 s s' -> Q2 s s') -> (forall s s', (P ⊟ Q1) s s' -> (P ⊟ Q2) s s').
Proof.
  intros T U V P Q1 Q2 HHq1q2 s s' ((sx,(HHpq1,HHpq1')),HHpq1'').
  split.
  { destruct (HHpq1'' _ HHpq1) as (sx',HHq1).
    exists sx; split; auto.
  }
  { intros sy HHp.
    destruct (HHpq1'' _ HHp) as (sy',HHq1).
    exists sy'; auto.
  }
Qed.

Theorem left_extensionality : forall { T U V : Type } (P1 P2 : T >> U) (Q : U >> V),
    (forall s s', P1 s s' <-> P2 s s') -> (forall s s', (P1 ⊟ Q) s s' <-> (P2 ⊟ Q) s s').
Proof. firstorder. Qed.

Theorem right_extensionality : forall { T U V : Type } (P : T >> U) (Q1 Q2 : U >> V),
    (forall s s', Q1 s s' <-> Q2 s s') -> (forall s s', (P ⊟ Q1) s s' <-> (P ⊟ Q2) s s').
Proof.
  intros.
  split; apply right_monotonic; firstorder.
Qed.

Theorem extensionality : forall { T U V : Type } (P1 P2 : T >> U) (Q1 Q2 : U >> V),
    (forall s s', P1 s s' <-> P2 s s') -> (forall s s', Q1 s s' <-> Q2 s s') -> (forall s s', (P1 ⊟ Q1) s s' <-> (P2 ⊟ Q2) s s').
Proof.
  intros; split; intros HH.
  { rewrite (left_extensionality _ _ _ H) in HH.
    rewrite (right_extensionality _ _ _ H0) in HH.
    auto.
  }
  { rewrite (left_extensionality _ _ _ H).
    rewrite (right_extensionality _ _ _ H0).
    auto.
  }
Qed.

Theorem left_identity_neutrality : forall { T U : Type } (Q : T >> U), (forall s s', ((fun s s' => s = s') ⊟ Q) s s' <-> Q s s').
Proof.
  split.
  { intros ((sx,(HH11,HH12)),HH2).
    subst sx; firstorder.
  }
  { intros; split.
    { eauto. }
    { intros sx HH; subst sx; eauto. }
  }
Qed.

Theorem right_identity_neutrality : forall { T U : Type } (Q : T >> U), (forall s s', (Q ⊟ (fun s s' => s = s')) s s' <-> Q s s').
Proof.
  split.
  { intros ((sx,(HH11,HH12)),HH2).
    subst sx; firstorder.
  }
  { intros; split; eauto. }
Qed.
