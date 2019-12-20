package libjit

Abi :: enum i32 {
    Cdecl       = 0,
    Vararg      = 1,
    Stdcall     = 2,
    Fastcall    = 3
}

Call_Flags :: enum i32 {
    No_Throw  = 1,
    No_Return = 2,
    Tail      = 4
}