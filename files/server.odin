import gc "gc/allocator.odin"

State :: struct {
	ip: string,
	port: int,
	gc: bool,
}

listen :: inline proc(ip: string = "127.0.0.1", port: int = 8080, gc: bool = true) {
	if gc do context.allocator = gc.create_gc();
	
	state := State{ip=ip, port=port, gc=gc};

	

}