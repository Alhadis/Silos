package jmp

// LLVM says that this should be a 5 word buffer
Jmp_Buffer :: distinct [5]int;

@(default_calling_convention="c")
foreign _ {
	@(link_name="llvm.eh.sjlj.setjmp")
	set_jmp :: proc(buf: ^Jmp_Buffer) -> i32 ---;

	@(link_name="llvm.eh.sjlj.longjmp")
	long_jmp :: proc(buf: ^Jmp_Buffer) ---;
}