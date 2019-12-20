package pthread


handle :: distinct rawptr;

attr :: distinct struct {
    __opaque: [64]byte,
};

cond :: opaque struct {
	__opaque: [48]byte
};

cond_attr :: opaque struct {
	__opaque: [16]byte
};

// sched_param stuff based on
// https://github.com/dlang/druntime/blob/a59c3832fc00ab127018d9a570ba03520437524f/src/core/sys/posix/sched.d
when ODIN_OS == "linux" {
    SCHED_OTHER   :: 0;
    SCHED_FIFO    :: 1;
    SCHED_RR      :: 2;
	sched_param :: struct {
		sched_priority: i32,
	}
}
when ODIN_OS == "osx" {
    SCHED_OTHER   :: 1;
    SCHED_FIFO    :: 4;
    SCHED_RR      :: 2;
	sched_param :: struct {
		sched_priority: i32,
		__opaque: [4]byte,
	}
}

foreign import pthread "system:pthread"

@(link_prefix="pthread_")
foreign pthread {
    create :: proc(th: ^handle, attr: ^attr, routine: proc(rawptr) -> rawptr, data: rawptr) -> i32 ---;
    join :: proc(th: handle, ret: ^rawptr) -> i32 ---;
    detach :: proc(th: handle) -> i32 ---;

    cond_init :: proc(cond: ^cond, attr: ^cond_attr) -> i32 ---;
    cond_destroy :: proc(cond: ^cond) -> i32 ---;

    self :: proc() -> handle ---;

    attr_init :: proc(attr: ^attr) -> i32 ---;
    attr_destroy :: proc(attr: ^attr,) -> i32 ---;

    attr_setstack :: proc(attr: ^attr, stackaddr: rawptr, stacksize: uint) -> i32 ---;
    attr_getstack :: proc(attr: ^attr, stackaddr: ^rawptr, stacksize: uint) -> i32 ---;

    attr_setstacksize :: proc(attr: ^attr, stacksize: uint) -> i32 ---;
    attr_getstacksize :: proc(attr: ^attr, stacksize: ^uint) -> i32 ---;

    attr_setguardsize :: proc(attr: ^attr, guardsize: uint) -> i32 ---;
    attr_getguardsize :: proc(attr: ^attr, guardsize: ^uint) -> i32 ---;

    attr_setstackaddr :: proc(attr: ^attr, stackaddr: rawptr) -> i32 ---;
    attr_getstackaddr :: proc(attr: ^attr, stackaddr: ^rawptr) -> i32 ---;

    attr_setdetachstate :: proc(attr: ^attr, detachstate: i32) -> i32 ---;
    attr_getdetachstate :: proc(attr: ^attr, detachstate: ^i32) -> i32 ---;

    attr_setinheritsched :: proc(attr: ^attr, inheritsched: i32) -> i32 ---;
    attr_getinheritsched :: proc(attr: ^attr, inheritsched: ^i32) -> i32 ---;

    attr_setschedparam :: proc(attr: ^attr, param: ^sched_param) -> i32 ---;
    attr_getschedparam :: proc(attr: ^attr, param: ^sched_param) -> i32 ---;

    attr_setschedpolicy :: proc(attr: ^attr, policy: i32) -> i32 ---;
    attr_getschedpolicy :: proc(attr: ^attr, policy: ^i32) -> i32 ---;

    attr_setscope :: proc(attr: ^attr, contentionscope: i32) -> i32 ---;
    attr_getscope :: proc(attr: ^attr, contentionscope: ^i32) -> i32 ---;
}
