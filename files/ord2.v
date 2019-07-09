
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

Fixpoint repeatn (a:Type) (n:nat) (f:a->a) (x:a) : a := 
 match n with
  | O => x
  | S p => repeatn a p f (f x)
 end. 

Fixpoint repeat (a:Type) (n:ord) (f:a->a) (x:a) : a :=
 match n with
  | zero => x
  | suc p => repeat a p f (f x)
  | lim g => lim (fun i => repeat a (g i) f x)
 end.






