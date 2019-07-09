
Inductive ord : Type :=
 | zero : ord
 | suc : ord -> ord
 | lim : (nat -> ord) -> ord.

Fixpoint ordofnat (n:nat) : ord :=
 match n with
  | O => zero
  | S p => suc (ordofnat p)
 end.

Definition w := lim ordofnat.

Fixpoint repeat (a:Type) (n:nat) (f:a->a) (x:a) : a := 
 match n with
  | O => x
  | S p => repeat a p f (f x)
 end. 

Definition cbI (a:Type) (x:a) : a := x.

Fixpoint nuplet (a:Type) (n:nat) (f: ) : :=
 match n with
  | 0 => cbI



