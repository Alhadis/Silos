package print_pointer

import "core:fmt"

main :: proc() {
    foo := 42;
    p: rawptr = &foo;
    fmt.println("address of foo", p);
}
