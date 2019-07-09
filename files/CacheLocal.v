Require Import DataTypes Coherence Tree.

Set Implicit Arguments.

Module Type CacheLocal (Import coh: Coherence).
  Parameter state: Addr -> Time -> Tree -> t.
  Parameter dir: Addr -> Time -> Tree -> Tree -> t.
  Parameter data: Addr -> Time -> Tree -> Data.
  Parameter wait: Addr -> Time -> Tree -> bool.
  Parameter waitS: Addr -> Time -> Tree -> t.
  Parameter dwait: Addr -> Time -> Tree -> Tree -> bool.
  Parameter dwaitS: Addr -> Time -> Tree -> Tree -> t.
  Parameter next: Addr -> Time -> Tree -> nat.

  Parameter respFn: Addr -> Time -> option Resp.

  Parameter respFnIdx: forall a t,
                         match respFn a t with
                           | Some (Build_Resp c i _) => i = next a t (p_node c)
                           | None => True
                         end.
  Parameter respFnLdData: forall a t,
                            match respFn a t with
                              | Some (Build_Resp c i d) =>
                                  match desc (reqFn a c i) with
                                    | Ld => d = data a t (p_node c)
                                    | St => d = initData zero
                                  end
                              | None => True
                            end.

  Parameter state0: forall a c, state a 0 c = match decTree c hier with
                                                | left _ => Mo
                                                | right _ => In
                                              end.

  Parameter dir0: forall a p c, dir a 0 p c = In.

  Parameter data0: forall a c, data a 0 c = initData a.

  Parameter wait0: forall a c, wait a 0 c = false.

  Parameter dwait0: forall a p c, dwait a 0 p c = false.

  Parameter next0: forall a c, next a 0 c = 0.
End CacheLocal.

(*
Section CacheLocal.
  Variable State: Set.

  Record CacheState :=
    {
      state: Tree -> Addr -> State;
      dir: Tree -> Tree -> Addr -> State;
      data: Tree -> Addr -> Data;
      wait: Tree -> Addr -> bool;
      waitS: Tree -> Addr -> State;
      dwait: Tree -> Tree -> Addr -> bool;
      dwaitS: Tree -> Tree -> Addr -> State;
      next: Tree -> nat
    }.

  Variable coh: Coherence State.

  Record CacheLocal :=
    {
      getCacheState: Time -> CacheState;
      respFn: Time -> option Resp;

      stateZero: state (getCacheState 0) = fun c a =>
                   match decTree c hier with
                     | left _ => Mo coh
                     | right _ => In coh
                   end;
      dirZero: dir (getCacheState 0) = fun p c a => In coh;
      dataZero: data (getCacheState 0) = fun c a => initData a;
      waitZero: wait (getCacheState 0) = fun c a => false;
      dwaitZero: dwait (getCacheState 0) = fun p c a => false;
      nextZero: next (getCacheState 0) = fun c => 0;

    }.
End CacheLocal.
*)