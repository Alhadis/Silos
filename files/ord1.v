
Fixpoint repeat (a:Type) (n:nat) (f:a->a) (x:a) : a := 
 match n with
  | O => x
  | S p => repeat a p f (f x)
 end. 
	
Inductive ord : Type :=
 | z : ord
 | suc : ord -> ord
 | lim : (nat -> ord) -> ord.

Fixpoint ordofnat (n:nat) : ord :=
 match n with
  | O => z
  | S p => suc (ordofnat p)
 end.

Definition w := lim ordofnat.


