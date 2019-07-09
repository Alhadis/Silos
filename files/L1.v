Require Import DataTypes StoreAtomicity Omega Coq.Logic.Classical MsiState.

Module Type L1Axioms (dt: DataTypes).
  Import dt.
  Axiom deqLeaf: forall {c i t}, deqR c i t -> leaf c.
  Axiom deqDef: forall {c i t}, deqR c i t -> defined c.
  Axiom uniqDeqProc: forall {c i1 t i2},
                       deqR c i1 t -> deqR c i2 t ->
                       i1 = i2.
  Axiom uniqDeqProc2: forall {c i t1 t2},
                        deqR c i t1 -> deqR c i t2 -> t1 = t2.
  Axiom deqOrder: forall {c i1 t1 i2 t2},
                    deqR c i1 t1 -> deqR c i2 t2 ->
                    i1 < i2 -> ~ t1 > t2.
  Axiom processDeq: forall {c i t}, deqR c i t -> let q := reqFn c i in
                                          match desc q with
                                            | Ld => sle Sh (state c (loc q) t)
                                            | St => state c (loc q) t = Mo
                                          end.
  Axiom deqImpEnq: forall {c i t}, deqR c i t ->
                                   match desc (reqFn c i) with
                                     | Ld => enqLd c i (data c (loc (reqFn c i)) t) t
                                     | St => enqSt c i t
                                   end.
  Axiom enqLdImpDeq: forall {c i st t}, enqLd c i st t -> deqR c i t /\ desc (reqFn c i) = Ld /\
                                                          data c (loc (reqFn c i)) t = st.
  Axiom enqStImpDeq: forall {c i t}, enqSt c i t -> deqR c i t /\ desc (reqFn c i) = St.
  Axiom deqImpDeqBefore: forall {c i1 i2 t},
                           deqR c i1 t -> i2 < i1 -> exists t', deqR c i2 t'.
End L1Axioms.

Module Type L1Theorems (dt: DataTypes).
  Import dt.
  Parameter latestValue:
  forall {c a t},
    defined c ->
    leaf c ->
    sle Sh (state c a t) ->
    (data c a t = initData a /\
     forall {ti}, 0 <= ti < t -> forall {ci ii},
                                   defined ci ->
                                   ~ (deqR ci ii ti /\ loc (reqFn ci ii) = a /\
                                      desc (reqFn ci ii) = St)) \/
    (exists cb ib tb, defined cb /\ tb < t /\ deqR cb ib tb /\ desc (reqFn cb ib) = St /\
                      loc (reqFn cb ib) = a /\
                      data c a t = dataQ (reqFn cb ib) /\
                      forall {ti}, tb < ti < t ->
                                   forall {ci ii},
                                     defined ci ->
                                     ~ (deqR ci ii ti /\ loc (reqFn ci ii) = a /\
                                        desc (reqFn ci ii) = St)
    ).

  Parameter uniqM:
  forall {c a t}, defined c -> leaf c ->
    state c a t = Mo -> forall {co}, defined co -> leaf co -> c <> co -> state co a t = In.
End L1Theorems.


Module mkL1InputTypes (d: DataTypes) (l1: L1Axioms d) <: L1InputTypes d.
  Import d l1.
  Record RespSet: Set :=
    { labelR: Label;
      dataR: Data;
      timeR: Time;
      defR: let (c,i) := labelR in
            enqLd c i dataR timeR + enqSt c i timeR
    }.
  Definition Resp := RespSet.
End mkL1InputTypes.

