
Require Import ZArith Cnotations.

Definition na := noattr.

Variable ee_bit : positive.
Variable u_bit : positive.
Variable v_bit : positive.

Variable SLv6_SystemCoproc : positive.

Definition typ_struct_SLv6_SystemCoproc := 
F[
  ee_bit -: uint8; 
  u_bit -: uint8; 
  v_bit -: uint8].

Definition typ_SLv6_SystemCoproc := Tstruct SLv6_SystemCoproc typ_struct_SLv6_SystemCoproc na.

Variable N_flag : positive.
Variable Z_flag : positive.
Variable C_flag : positive.
Variable V_flag : positive.
Variable Q_flag : positive.
Variable J_flag : positive.
Variable GE0 : positive.
Variable GE1 : positive.
Variable GE2 : positive.
Variable GE3 : positive.
Variable E_flag : positive.
Variable A_flag : positive.
Variable I_flag : positive.
Variable F_flag : positive.
Variable T_flag : positive.
Variable mode : positive.
Variable background : positive.

Variable SLv6_StatusRegister : positive.

Definition typ_struct_SLv6_StatusRegister := 
F[
  N_flag -: uint8; 
  Z_flag -: uint8; 
  C_flag -: uint8; 
  V_flag -: uint8; 
  Q_flag -: uint8; 
  J_flag -: uint8; 
  GE0 -: uint8; 
  GE1 -: uint8; 
  GE2 -: uint8; 
  GE3 -: uint8; 
  E_flag -: uint8; 
  A_flag -: uint8; 
  I_flag -: uint8; 
  F_flag -: uint8; 
  T_flag -: uint8; 
  mode -: int32; 
  background -: uint32].

Definition typ_SLv6_StatusRegister := Tstruct SLv6_StatusRegister typ_struct_SLv6_StatusRegister na.

Variable begin : positive.
Variable size : positive.
Variable _end : positive.
Variable mem : positive.

Variable SLv6_MMU : positive.

Definition typ_struct_SLv6_MMU := 
F[
  begin -: uint32; 
  size -: uint32; 
  _end -: uint32; 
  mem -: `*` uint8].

Definition typ_SLv6_MMU := Tstruct SLv6_MMU typ_struct_SLv6_MMU na.

Variable mmu_ptr : positive.
Variable cpsr : positive.
Variable spsrs : positive.
Variable cp15 : positive.
Variable id : positive.
Variable user_regs : positive.
Variable fiq_regs : positive.
Variable irq_regs : positive.
Variable svc_regs : positive.
Variable abt_regs : positive.
Variable und_regs : positive.
Variable pc : positive.
Variable jump : positive.

Variable SLv6_Processor : positive.

Definition typ_struct_SLv6_Processor := 
F[
  mmu_ptr -: `*` typ_SLv6_MMU; 
  cpsr -: typ_SLv6_StatusRegister; 
  spsrs -: Tarray typ_SLv6_StatusRegister 5 na; 
  cp15 -: typ_SLv6_SystemCoproc; 
  id -: uint32; 
  user_regs -: Tarray uint32 16 na; 
  fiq_regs -: Tarray uint32 7 na; 
  irq_regs -: Tarray uint32 2 na; 
  svc_regs -: Tarray uint32 2 na; 
  abt_regs -: Tarray uint32 2 na; 
  und_regs -: Tarray uint32 2 na; 
  pc -: `*` uint32; 
  jump -: uint8].

Definition typ_SLv6_Processor := Tstruct SLv6_Processor typ_struct_SLv6_Processor na.
