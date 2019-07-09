(*
 * Copyright (C) BedRock Systems Inc. 2019 Gregory Malecha
 *
 * SPDX-License-Identifier:AGPL-3.0-or-later
 *)
(* Automation for verification of modules.
 *)
From ChargeCore.Logics Require Import
     ILogic BILogic ILEmbed Later.

From Cpp Require Import
     Parser Sem Util
     Auto.Definitions
     Auto.Lemmas
     Auto.Discharge.

Section find_in_module.
  Variable nm : obj_name.

  Variant CodeType : Set :=
  | CTmethod (_ : Method)
  | CTctor (_ : Ctor)
  | CTdtor (_ : Dtor)
  | CTfunction (_ : Func).

  Fixpoint find_code_decl (d : Decl) : option CodeType :=
    match d with
    | Dfunction nm' f =>
      if string_dec nm nm'
      then match f.(f_body) with
           | None => None
           | _ => Some (CTfunction f)
           end
      else None
    | Dmethod nm' f  =>
      if string_dec nm nm'
      then match f.(m_body) with
           | None => None
           | _ => Some (CTmethod f)
           end
      else None
    | Dconstructor nm' f =>
      if string_dec nm nm'
      then match f.(c_body) with
           | None => None
           | _ => Some (CTctor f)
           end
      else None
    | Ddestructor nm' f  =>
      if string_dec nm nm'
      then match f.(d_body) with
           | None => None
           | _ => Some (CTdtor f)
           end
      else None
    | _ => None
    end.

  Definition find_code := find_in_list find_code_decl.

End find_in_module.

Ltac start_module :=
  repeat eapply wandSPI.

Ltac finish_module :=
  repeat rewrite denoteModule_weaken ;
  repeat rewrite ti_cglob'_weaken ;
  repeat rewrite cglob'_weaken ;
  repeat rewrite later_cglob'_ti ;
  repeat rewrite later_empSP ;
  repeat rewrite empSPR; reflexivity.

Theorem verify_method
: forall (g : obj_name) ti (s : function_spec') (resolve : genv)
    (module : list Decl)
    (body : Stmt) (F Z : mpred) meth,
    find_code g module = Some (CTmethod meth) ->
    meth.(m_body) = Some body ->
    denoteModule module ** F |-- @method_ok' resolve meth ti s ->
    denoteModule module ** cglob' (resolve:=resolve) g ti s ** F |-- Z ->
    denoteModule module ** F |-- cglob' (resolve:=resolve) g ti s ** Z.
Proof. Admitted.


Theorem cut_spec (g : obj_name) (ti : option thread_info) (s : function_spec')
: forall module F Q (resolve : genv),
    match find_code g module with
    | None => True
    | Some what =>
        let it :=
            match ti with
            | None => ti_cglob' (resolve:=resolve) g s
            | Some ti => cglob' (resolve:=resolve) g ti s
            end
        in
        match what with
        | CTmethod meth =>
          match ti with
          | None => forall ti,
            denoteModule module ** F |-- @method_ok' resolve meth ti s
          | Some ti =>
            denoteModule module ** F |-- @method_ok' resolve meth ti s
          end ->
          denoteModule module ** it ** F |-- Q ->
          denoteModule module ** F |-- Q
        | CTctor ctor =>
          match ti with
          | None => forall ti,
            denoteModule module ** F |-- @ctor_ok' resolve ctor ti s
          | Some ti =>
            denoteModule module ** F |-- @ctor_ok' resolve ctor ti s
          end ->
          denoteModule module ** it ** F |-- Q ->
          denoteModule module ** F |-- Q
        | CTdtor dtor =>
          match ti with
          | None => forall ti, denoteModule module ** F |-- @dtor_ok' resolve dtor ti s
          | Some ti => denoteModule module ** F |-- @dtor_ok' resolve dtor ti s
          end ->
          denoteModule module ** it ** F |-- Q ->
          denoteModule module ** F |-- Q
        | CTfunction func =>
          match func.(f_body) with
          | None => True
          | Some body =>
            match ti with
            | None => forall ti,
                denoteModule module ** F |-- @func_ok' resolve func.(f_return) func.(f_params) body ti s
            | Some ti =>
              denoteModule module ** F |-- @func_ok' resolve func.(f_return) func.(f_params) body ti s
            end ->
          denoteModule module ** it ** F |-- Q ->
          denoteModule module ** F |-- Q
          end
        end
    end.
Proof. Admitted.

Theorem verify_code (remember : bool)
: forall (g : obj_name) (module : list Decl),
    match find_code g module with
    | None => True
    | Some what =>
      forall (ti : option thread_info) (s : function_spec') (resolve : genv) (F Z : mpred),
        let it :=
            match ti with
            | None => ti_cglob' (resolve:=resolve) g s
            | Some ti => cglob' (resolve:=resolve) g ti s
            end
        in
        match what with
        | CTmethod meth =>
          match ti with
          | None => forall ti,
            denoteModule module ** F |-- @method_ok' resolve meth ti s
          | Some ti =>
            denoteModule module ** F |-- @method_ok' resolve meth ti s
          end ->
          denoteModule module ** (if remember then it ** F else F) |-- Z ->
          denoteModule module ** F |-- it ** Z
        | CTctor ctor =>
          match ti with
          | None => forall ti,
            denoteModule module ** F |-- @ctor_ok' resolve ctor ti s
          | Some ti =>
            denoteModule module ** F |-- @ctor_ok' resolve ctor ti s
          end ->
          denoteModule module ** (if remember then it ** F else F) |-- Z ->
          denoteModule module ** F |-- it ** Z
        | CTdtor dtor =>
          match ti with
          | None => forall ti, denoteModule module ** F |-- @dtor_ok' resolve dtor ti s
          | Some ti => denoteModule module ** F |-- @dtor_ok' resolve dtor ti s
          end ->
          denoteModule module ** (if remember then it ** F else F) |-- Z ->
          denoteModule module ** F |-- it ** Z
        | CTfunction func =>
          match func.(f_body) with
          | None => True
          | Some body =>
            match ti with
            | None => forall ti,
                denoteModule module ** F |-- @func_ok' resolve func.(f_return) func.(f_params) body ti s
            | Some ti =>
              denoteModule module ** F |-- @func_ok' resolve func.(f_return) func.(f_params) body ti s
            end ->
          denoteModule module ** (if remember then it ** F else F) |-- Z ->
          denoteModule module ** F |-- it ** Z
          end
        end
    end.
Proof.
  intros.
  destruct (find_code g module) eqn:Hfind; auto.
  intros ti s resolve F Z.
  generalize (fun Q => cut_spec g ti s module F Q resolve).
  rewrite Hfind; clear Hfind.
  destruct c; intros.
  { destruct ti.
    { simpl in *.
      eapply H in H0; clear H.
      eapply H0.
      rewrite <- H1.
      unfold it.
      destruct remember.
      { rewrite cglob'_dup at 1.
        cancel ltac:(canceler fail eauto) eauto. }
      { cancel ltac:(canceler fail eauto) eauto. } }
    { simpl in *.
      eapply H in H0; clear H.
      eapply H0.
      rewrite <- H1; clear H1.
      unfold it.
      unfold ti_cglob'.
      admit. } }
  admit.
  admit.
  admit.
Admitted.

Ltac verifyF nm :=
  let check M F :=
      idtac;
      lazymatch goal with
      | |- _ |-- @cglob' ?res nm ?ti ?spec ** ?Z =>
        refine (@verify_code true nm M (Some ti) spec res F Z _ _)
      | |- _ |-- (Forall ti, @cglob' ?res nm ti ?spec) ** ?Z =>
        refine (@verify_code true nm M None spec res F Z _ _); [ intro | ]
      | |- _ |-- @ti_cglob' ?res nm ?spec ** ?Z =>
        refine (@verify_code true nm M None spec res F Z _ _); [ intro | ]
      end
  in
  let get_module :=
      idtac;
      lazymatch goal with
      | |- denoteModule ?M ** ?F |-- _ =>
        perm_right ltac:(check M F)
      end
  in
  perm_left ltac:(get_module).

Ltac verifyF_forget nm :=
  let check M F :=
      idtac;
      lazymatch goal with
      | |- _ |-- @cglob' ?res nm ?ti ?spec ** ?Z =>
        refine (@verify_code false nm M (Some ti) spec res F Z _ _)
      | |- _ |-- (Forall ti, @cglob' ?res nm ti ?spec) ** ?Z =>
        refine (@verify_code false nm M None spec res F Z _ _); [ intro | ]
      | |- _ |-- @ti_cglob' ?res nm ?spec ** ?Z =>
        refine (@verify_code false nm M None spec res F Z _ _); [ intro | ]
      end
  in
  let get_module :=
      idtac;
      lazymatch goal with
      | |- denoteModule ?M ** ?F |-- _ =>
        perm_right ltac:(check M F)
      end
  in
  perm_left ltac:(get_module).

(* todo(gmm): using perm_left means that this can succeed if, e.g. it cancels an empSP *)
Ltac cutF resolve nm ti s :=
  let get_module :=
      idtac;
      lazymatch goal with
      | |- denoteModule ?M ** ?F |-- ?Q =>
        refine (@cut_spec nm ti s M F Q resolve _ _)
      end
  in
  perm_left ltac:(get_module).
