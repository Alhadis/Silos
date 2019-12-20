package vet_warn_unused_proc_params

// "meep" should receive a warning during -vet
foo :: proc(meep: int) -> int {
    bar := 4;
    return 42;
}

main :: proc() {
    foo(101);
}
