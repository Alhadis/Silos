Notation t_struct_cons_buf :=
   (Tstruct cons_buf
     (Fcons buffer (tarray tuint CB_SIZE)
       (Fcons rpos tuint
         (Fcons wpos tuint Fnil)))
    noattr).

Definition cons_buf_loc_type := {|
    gvar_info := t_struct_cons_buf;
    gvar_init := (Init_space (CB_SIZE*4) :: Init_int32 Int.zero :: Init_int32 Int.zero :: nil);
    gvar_readonly := false;
    gvar_volatile := false
  |}.

Definition cb_read_body :=
(Ssequence
  (Sset _rv (Econst_int (Int.repr CB_EMPTY) tint))
  (Ssequence
    (Sifthenelse (Ebinop One
                   (Efield (Evar cons_buf_LOC t_struct_cons_buf) rpos tuint)
                   (Efield (Evar cons_buf_LOC t_struct_cons_buf) wpos tuint) tint)
      (Ssequence
        (Sset _rv
          (Ederef
            (Ebinop Oadd
              (Efield (Evar cons_buf_LOC t_struct_cons_buf) buffer
                (tarray tuint CB_SIZE))
              (Efield (Evar cons_buf_LOC t_struct_cons_buf) rpos tuint)
              (tptr tuint)) tuint))
        (Sassign (Efield (Evar cons_buf_LOC t_struct_cons_buf) rpos tuint)
          (Ebinop Omod
            (Ebinop Oadd (Efield (Evar cons_buf_LOC t_struct_cons_buf) rpos tuint)
              (Econst_int (Int.repr 1) tint) tuint)
            (Econst_int (Int.repr CB_SIZE) tint) tuint)))
      Sskip)
    (Sreturn (Some (Etempvar _rv tuint))))).

Definition f_cb_read := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := nil;
  fn_vars := nil;
  fn_temps := ((_rv, tuint) :: nil);
  fn_body := cb_read_body
|}.
