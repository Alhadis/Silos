Require Import DataTypes.

Module Type L1InputTypes (d: DataTypes).
  Import d.

  Parameter Resp: Set.
  Parameter labelR: Resp -> Label.
  Parameter dataR: Resp -> Data.
  Parameter timeR: Resp -> Time.
End L1InputTypes.

Module Type StoreAtomicity (dt: DataTypes) (l1B: L1InputTypes dt).
  Import dt l1B.

  Axiom uniqRespLabels:
    forall {r1 r2}, labelR r1 = labelR r2 ->
                    timeR r1 = timeR r2 /\
                    desc (reqFn (fst (labelR r1)) (snd (labelR r1))) = Ld ->
                    dataR r1 = dataR r2.

  Axiom uniqRespTimes:
    forall {r1 r2}, timeR r1 = timeR r2 ->
                    loc (reqFn (fst (labelR r1)) (snd (labelR r1))) =
                    loc (reqFn (fst (labelR r2)) (snd (labelR r2))) ->
                    desc (reqFn (fst (labelR r1)) (snd (labelR r1))) = St ->
                    labelR r1 = labelR r2.

  Axiom localOrdering:
    forall {r1 r2}, fst (labelR r1) = fst (labelR r2) ->
                    snd (labelR r1) < snd (labelR r2) -> ~ timeR r1 > timeR r2.

  Axiom allPrevious:
    forall {r1 i}, i < snd (labelR r1) -> exists r2, fst (labelR r2) = fst (labelR r1) /\
                                                     snd (labelR r2) = i.

  Axiom storeAtomicity:
    forall {r},
      let q := reqFn (fst (labelR r)) (snd (labelR r)) in
      desc q = Ld ->
      (dataR r = initData (loc q) /\
       forall {r'}, let q' := reqFn (fst (labelR r')) (snd (labelR r')) in
                    0 <= timeR r' < timeR r -> ~ (loc q' = loc q /\ desc q' = St)) \/
      (exists rm,
         let qm := reqFn (fst (labelR rm)) (snd (labelR rm)) in
         dataR r = dataQ qm /\
         timeR rm < timeR r /\ loc qm = loc q /\ desc qm = St /\
         forall {r'}, let q' := reqFn (fst (labelR r')) (snd (labelR r')) in
                      timeR rm < timeR r' < timeR r -> ~ (loc q' = loc q /\ desc q' = St)).
End StoreAtomicity.