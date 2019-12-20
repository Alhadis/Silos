package libjit

Context                 :: distinct rawptr;
Function                :: distinct rawptr;
Type                    :: distinct rawptr;
Block                   :: distinct rawptr;
Label                   :: distinct rawptr;
Value                   :: distinct rawptr;
Insn                    :: distinct rawptr;

Meta_Free_Proc          :: proc(data: rawptr);
On_Demand_Proc          :: proc(func: Function);
On_Demand_Driver_Proc   :: proc(func: Function);