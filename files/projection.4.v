(* This file describe the relation between COQ and C state for ARM *)

Require Import Globalenvs Memory.
Require Import Csyntax Csem Cstrategy Coqlib Integers Values Maps Errors. 
Require Import Arm6_State Arm6_Proc Arm6_SCC Bitvec Arm6.
(*Require Import adc_compcert.*)
Require Import type_slv6_proc.

Section proj.

(* Initial local environment, an empty PTree contents var location & type*)
Definition env0 := (PTree.empty (block * type)).

(* If an option val is Some integer then return the integer value else return zero*)
Definition load_val (v : option val):word:=
  match v with
    |Some (Vint v')=> v'                     
    |_ => Int.zero
  end.

(* Find the offset for elements in a struct*)
(* If there is no variable id in struct t then the returned offset will be zero
   (this location is then the same as for t);
   later, if you want to L/S a value from this location, it will return None
 *)

Definition ofs_of_fld (f_id:AST.ident) (fl:fieldlist) :word:=
  match field_offset f_id fl with
    | Error _ => Int.zero
    | OK r => repr r
  end.

(* offset of each element in Processor Tstruct *)
Definition cpsr_ofs:int:=ofs_of_fld cpsr typ_struct_SLv6_Processor.

Definition spsr_ofs:int:=ofs_of_fld spsrs typ_struct_SLv6_Processor.

Definition mode_ofs:int:=
  add (ofs_of_fld cpsr typ_struct_SLv6_Processor) 
  (ofs_of_fld mode typ_struct_SLv6_StatusRegister).

Definition reg_ofs (id:AST.ident):int:=
  ofs_of_fld id typ_struct_SLv6_Processor.

Definition mmu_ofs:int:=ofs_of_fld mmu_ptr typ_struct_SLv6_Processor.

Definition mem_ofs:int:=ofs_of_fld mem typ_struct_SLv6_MMU.

Definition cp15_ofs:int:=ofs_of_fld cp15 typ_struct_SLv6_Processor.

Definition pc_ofs:int:=ofs_of_fld pc typ_struct_SLv6_Processor.

Definition id_ofs:int:=ofs_of_fld id typ_struct_SLv6_Processor.

Definition jump_ofs:int:=ofs_of_fld jump typ_struct_SLv6_Processor.

Variable proc : positive.

Definition proc_loc (m:Mem.mem) (e:env):option val:=
  match e!proc with
    |Some(b,_)=>
      match 
        (load_value_of_type (Tpointer typ_SLv6_Processor) m b Int.zero) with
        |Some(Vptr b o) as v=>v
        |_=>None
      end
    |None=>None
  end.


(* Projection from C parameters to COQ parameters*)
(* If in local env the parameter of ADC (S, cond, d or n) exists,
   then return the value of it else return zero*)

Definition param_val (id:AST.ident) (m:Mem.mem) (e:env):val:=
  match e!id with
    |Some(b,t)=>
      let ov:=load_value_of_type t m b Int.zero in
        match ov with
          |Some v=>v
          |None=>Vundef
        end
    |None=>Vundef
  end.

Definition varg_proj (v:val):int:=
  match v with
    |Vint v'=>v'
    |_=>Int.zero
  end.

(* singal bit parameter projection *)
Definition bit_proj (m:Mem.mem) (e:env) (id:AST.ident):bool:=
  eq (varg_proj (param_val id m e)) w1.

Variable cond : positive.

(* condition parameter projection *)
Definition cond_proj (m:Mem.mem) (e:env):opcode:= 
  let c:=condition (varg_proj (param_val cond m e)) in
    match c with
      |Some c'=>c'
      |None=>AL
    end.

(* register parameter projection *)
Definition reg_proj (m:Mem.mem) (e:env) (id:AST.ident):regnum:=
  mk_regnum (varg_proj (param_val id m e)).

(* bits parameter projection*)
Definition bits_proj (m:Mem.mem) (e:env) (id:AST.ident):word:=
  varg_proj (param_val id m e).

Definition find_field (ofs:int) (m:Mem.mem) (e:env)
  :option val:=
  match proc_loc m e with
    |Some(Vptr b o) => Some (Vptr b (add o ofs))
    |_=>None
  end.

Definition find_cpsr (m:Mem.mem) (e:env):option val:=
  find_field cpsr_ofs m e.

Definition find_spsr (m:Mem.mem) (e:env):option val:=
  find_field spsr_ofs m e.

Definition find_reg (m:Mem.mem) (e:env) (rid:AST.ident):option val:=
  find_field (ofs_of_fld rid typ_struct_SLv6_Processor) m e.

Definition find_cp15 (m:Mem.mem) (e:env):option val:=
  find_field cp15_ofs m e.

Definition find_id (m:Mem.mem) (e:env):option val:=
  find_field id_ofs m e.

Definition find_jump (m:Mem.mem) (e:env):option val:=
  find_field jump_ofs m e.

(* If cpsr can be found, use the location of [cpsr] and the offset of 
   mode in StatusRegister struct to get location of [mode]*)
(* The mode field in cpsr and spsr should be the same. 
   And the element of spsrs array which is in use should correspond to the same mode.
   And the register array in use, should also corresponds to this mode.*)
Definition find_mode (m:Mem.mem) (e:env):option val:=
  match find_cpsr m e with
    |Some(Vptr b ofs)=>Some(Vptr b (add ofs mode_ofs))
    |_=>None
  end.

(* If in local environment the variable [porc] exists,
   then return the pointer of [proc] field [mmu_ptr].
   From this MMU struct, returns the pointer to the field [mem]*)
Definition find_mmu (m:Mem.mem) (e:env):option val:=
  match proc_loc m e with
    |Some(Vptr bp op)=>
      match 
        (load_value_of_type (Tpointer typ_SLv6_MMU) m bp (add op mmu_ofs)) with
        |Some(Vptr bm om) as v=>v
        |_=>None
      end
    |_=>None
  end.

Definition find_mem (m:Mem.mem) (e:env):option val:=
  match find_mmu m e with
    |Some(Vptr bm om)=>
      match 
        (load_value_of_type (Tpointer(Tint I8 Signed)) m bm (add om mem_ofs)) with
        |Some(Vptr b o) as v=>v
        |_=>None
      end
    |_=>None
  end.

(* If in local environment the variable [proc] exists
   then return the pointer of [proc] field [pc]*)
(* the pointer to [pc] should point to the exact location of
   the 16th element in array [user_regs]*)
Definition find_pc (m:Mem.mem) (e:env):option val:=
  match proc_loc m e with
    |Some(Vptr b ofs)=>
      match 
        (load_value_of_type (Tpointer (Tint I32 Unsigned)) m b ofs) with
        |Some(Vptr b o) as v=>v
        |_=>None
      end
    |_=>None
  end.

Definition pc_usereg15 (m:Mem.mem) (e:env):Prop:=
  find_pc m e = find_reg m e user_regs.

Definition find_fld (f: Mem.mem->env->option val) (fld:fieldlist)
  (id:AST.ident) (m:Mem.mem) (e:env):
  option val:=
  match f m e with
    |Some(Vptr bp op)=> 
      Some(Vptr bp (add op (ofs_of_fld id fld)))
    |_=>None
  end.

(* From a StateRegister Tstruct to word*)
(* Every bit is transformed from uint8 to one bit *)

Definition fld_sr:= typ_struct_SLv6_StatusRegister.


Definition sr_proj (m:Mem.mem) (b:block) (ofs:int) :word:=
  let load_val_of id tp :=
    load_val (load_value_of_type tp m b 
      (add ofs (ofs_of_fld id fld_sr))) in
  let nflag := load_val_of N_flag (Tint I8 Signed) in
  let zflag := load_val_of Z_flag (Tint I8 Signed) in
  let cflag := load_val_of C_flag (Tint I8 Signed) in
  let vflag := load_val_of V_flag (Tint I8 Signed) in
  let qflag := load_val_of Q_flag (Tint I8 Signed) in
  let jflag := load_val_of J_flag (Tint I8 Signed) in
  let ge0 := load_val_of GE0 (Tint I8 Signed) in
  let ge1 := load_val_of GE1 (Tint I8 Signed) in
  let ge2 := load_val_of GE2 (Tint I8 Signed) in
  let ge3 := load_val_of GE3 (Tint I8 Signed) in
  let eflag := load_val_of E_flag (Tint I8 Signed) in
  let aflag := load_val_of A_flag (Tint I8 Signed) in
  let iflag :=  load_val_of I_flag (Tint I8 Signed) in
  let fflag := load_val_of F_flag (Tint I8 Signed) in
  let tflag := load_val_of T_flag (Tint I8 Signed) in
  let md := load_val_of mode (Tint I32 Unsigned) in
(* according to P49,
   Implementations must read reversed bits as 0 and ignore writes to them.
   So no setting bits for the reversed bits*)
  let bg := Int.zero in
    (set_bit Nbit nflag
    (set_bit Zbit zflag
    (set_bit Cbit cflag
    (set_bit Vbit vflag
    (set_bit Qbit qflag
    (set_bit Jbit jflag
(* set bits 16 to 19 is set GEbits*)
    (set_bit 19 ge3
    (set_bit 18 ge2
    (set_bit 17 ge1
    (set_bit 16 ge0
    (set_bit Ebit eflag
    (set_bit Abit aflag
    (set_bit Ibit iflag 
    (set_bit Fbit fflag 
    (set_bit Tbit tflag 
(* set bits 0 to 4 is set Mbits*)
    (set_bits 4 0 md Int.zero)))))))))))))))).

(* Projection form C cpsr to COQ cpsr*)
(* If the location of cpsr is found, then project C cpsr to a word
   else return zero*)
Definition cpsr_proj (m:Mem.mem) (e:env) :word:=
  match find_cpsr m e with
    |Some (Vptr b ofs) => sr_proj m b ofs
    |_ => Int.zero
  end.

(* Projection from C spsr to COQ spsr*)
(* If the location of spsr of specified exception mode is found, 
   then project C cpsr to a word else return zero*)
Definition spsr_proj (m:Mem.mem) (e:env) (em:exn_mode):word:=
  let ofs o n:=add o (repr (n*sizeof typ_SLv6_StatusRegister)) in
  match find_spsr m e with
    |Some(Vptr b o)=>
      match em with
        |fiq=>sr_proj m b (ofs o 0)
        |irq=>sr_proj m b (ofs o 1)
        |svc=>sr_proj m b (ofs o 2)
        |abt=>sr_proj m b (ofs o 3)
        |und=>sr_proj m b (ofs o 4)
      end
    |_=>Int.zero
  end.

(* Projection from C mode in cpsr, to COQ mode*)
(* If the location of mode is found, 
   then project C mode to a proc_mode else return default user mode*)
(* The mode in cpsr should indecate which spsr mode is and which kind of register
   is used*)
Definition mode_proj (m:Mem.mem) (e:env) :proc_mode:=
  let om:=match find_mode m e with
    |Some(Vptr b ofs)=>
      proc_mode_of_word (load_val 
        (load_value_of_type (Tint I32 Unsigned) m b ofs))
    |_=>None
  end
  in 
  match om with
    |Some md=>md
    |None=>usr
  end.

(* Projection from C reg to COQ reg*)
(* If the location of reg is found, and by knowing which register mode
   and which register number it is, return the value of this register.
   else return zero*)
Definition regs_proj (m:Mem.mem) (e:env) (r:register):word:=
  let load_reg id n m e:=
    match find_reg m e id with 
    |Some(Vptr b ofs)=>
      load_val (load_value_of_type 
        (Tint I32 Unsigned) m b (add ofs (repr n))) 
    |_=>Int.zero
  end
    in
  match r with
    | R k => load_reg user_regs k m e
    | R_svc k _=> load_reg svc_regs k m e
    | R_abt k _=> load_reg abt_regs k m e
    | R_und k _=> load_reg und_regs k m e
    | R_irq k _=> load_reg irq_regs k m e
    | R_fiq k _=> load_reg fiq_regs k m e
  end.

(* Projection from C memory to COQ memory*)
(* If the location of memory is found, using the address to
   get the content of such memory block, else return zero*)
Definition mem_proj (m:Mem.mem) (e:env) (ad:address):word:=
  match find_mem m e with
    |Some(Vptr b ofs)=>
      load_val (load_value_of_type 
        (Tint I8 Signed) m b (add ofs (word_of_address ad)))
    |_=>Int.zero
  end.

(* Projection from C cp15 to COQ SCC register*)
(* If the location of cp15 is found, 
   get the value of ee_bit u_bit and v_bit to set the bits in
   COQ SCC reg*)

Definition fld_sc :=typ_struct_SLv6_SystemCoproc.

Definition screg_proj (m:Mem.mem) (e:env) (r:regnum):word:=
  match find_cp15 m e with
    |Some(Vptr b ofs)=>
      let regbit id:=
        load_val (load_value_of_type (Tint I8 Signed) m b
        (add ofs (ofs_of_fld id fld_sc))) in
        let ee := regbit ee_bit in
        let u := regbit u_bit in
        let v := regbit v_bit in
        set_bit Vbit v (set_bit Ubit u (set_bit EEbit ee Int.zero))
    |_=>Int.zero
  end.

Definition screg_proj' (m:Mem.mem) (e:env) (r:regnum):option word:=
  match find_cp15 m e with
    |Some(Vptr b ofs)=>
      let regbit id:=
        load_val (load_value_of_type (Tint I8 Signed) m b
        (add ofs (ofs_of_fld id fld_sc))) in
        let ee := regbit ee_bit in
        let u := regbit u_bit in
        let v := regbit v_bit in
        Some (set_bit Vbit v (set_bit Ubit u (set_bit EEbit ee Int.zero)))
    |_=>None
  end.

(* Projection from C proc to COQ state. exn in COQ proc state is assigned by
   a nil exception list*)
Definition proc_proj (m:Mem.mem) (e:env):Arm6_State.state:=
  Arm6_State.mk_state 
  (Arm6_Proc.mk_state (cpsr_proj m e) (spsr_proj m e) (regs_proj m e) nil (mode_proj m e))
  (Arm6_SCC.mk_state (screg_proj m e) (mem_proj m e)).



(* Stating theorems *)

Require Import Arm6_Simul.
Import I.
Import Arm6_Functions.Semantics.

(*Inductive proc_state_related : Mem.mem -> env -> @result unit -> Prop :=
  |proc_state_related_ok : 
    forall m e l b v, 
      proc_proj m e = Some v ->
      proc_state_related m e (Ok tt (mk_semstate l b v))
  |state_not_ok: 
    forall e m mes,
      proc_proj m e = None ->
      proc_state_related m e (Ko mes)
  |state_todo: 
    forall e m mes,
      proc_proj m e = None ->
      proc_state_related m e (Todo mes).*)

Inductive proc_state_related : Mem.mem -> env -> @result unit -> Prop :=
  |proc_state_related_ok : 
    forall m e l b, proc_state_related m e (Ok tt (mk_semstate l b (proc_proj m e)))
  |state_not_ok: forall e m mes, proc_state_related m e (Ko mes)
  |state_todo: forall e m mes, proc_state_related m e (Todo mes).

(* Functional relation between the C memory module which contains proc, 
   and the COQ specification of Arm6 state *)
(*Definition proc_state_func_related (m:Mem.mem) (e:env) (s:Arm6_State.state) :Prop:=
  proc_proj m e = s.*)

End proj.