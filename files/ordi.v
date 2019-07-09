
Inductive ordinal : Type :=
 | Zero : ordinal
 | Succ : ordinal -> ordinal
 | Limit : (nat -> ordinal) -> ordinal.

Fixpoint iter (a:Type) (f:a->a) (n:nat) (x:a) : a :=
 match n with
  | O => x
  | S p => iter a f p (f x)
 end.

Definition OpLim (F:nat->ordinal->ordinal) (a:ordinal) : ordinal :=
 Limit (fun n => F n a).
 
Definition OpItw (f:ordinal->ordinal) : ordinal->ordinal :=
 OpLim (iter _ f).

Fixpoint cantor (a:ordinal) (c:ordinal) : ordinal :=
 match c with
  | Zero => Succ a
  | Succ b => OpItw (fun x => cantor x b) a
  | Limit f => Limit (fun n => cantor a (f n))
 end.

Fixpoint Nabla (f:ordinal->ordinal) (b:ordinal) : ordinal :=
 match b with
  | Zero => f Zero
  | Succ a => f (Succ (Nabla f a))
  | Limit h => Limit (fun n => Nabla f (h n))
 end.

Definition deriv (f:ordinal->ordinal) : ordinal->ordinal :=
 Nabla (OpItw f).

Fixpoint veblen (b:ordinal) : ordinal->ordinal :=
 match b with
  | Zero => Nabla (OpLim (iter _ (cantor Zero)))
  | Succ a => Nabla (OpLim (iter _ (veblen a)))
  | Limit f => Nabla (OpLim (fun n => veblen (f n)))
 end.

Definition veb (a:ordinal) : ordinal := veblen a Zero.

Definition epsilon0 : ordinal := veb Zero. 

Definition Gamma0 : ordinal := Limit (fun n => iter _ veb n Zero).

Check epsilon0.
Check Gamma0.


