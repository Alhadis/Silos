Section SyntaxTests.

Require Import Syntax.

(*
forall p, q, f:
FS says Owner(p,f) and 
p says MayRead(q,f) implies
FS says MayRead(q,f)
*)
Definition Owner_r := Rel 1.
Definition Owner : list term -> formula := Rel_f Owner_r.
Definition MayRead_r := Rel 2.
Definition MayRead : list term -> formula := Rel_f MayRead_r.
Definition FS_fn := Fn 1.
Definition FS : term := Fun_t FS_fn nil.
Definition p_v := Var 1.
Definition q_v := Var 2.
Definition f_v := Var 3.
Definition p := Var_t p_v.
Definition q := Var_t q_v.
Definition f := Var_t f_v.
Definition p_f : list term := 
  cons p (cons f nil).
Definition owner_p_f : formula :=
  Owner p_f.
Definition q_f : list term :=
  cons q (cons f nil).
Definition mayread_q_f : formula :=
  MayRead q_f.
Definition policy : formula :=
  Forall p_v
  (Forall q_v
  (Forall f_v
  (Implies 
    (And 
      (Says FS owner_p_f)
      (Says p mayread_q_f))
    (Says FS mayread_q_f)))).


Definition the_formula : formula := 
  (Forall (Var 0)
    (Forall (Var 1)
      (Forall (Var 2)
        (Implies
          (And
            (Says (Fun_t (Fn 4) (nil))
              (Rel_f (Rel 5)
                (cons (Var_t (Var 0)) (cons (Var_t (Var 2)) (nil)))))
            (Says (Var_t (Var 0))
              (Rel_f (Rel 3)
                (cons (Var_t (Var 1)) (cons (Var_t (Var 2)) (nil))))))
          (Says (Fun_t (Fn 4) (nil))
            (Rel_f (Rel 3)
              (cons (Var_t (Var 1)) (cons (Var_t (Var 2)) (nil))))))))).


End SyntaxTests.
