#flag -ltest_clib -L.
#include "test_clib.h"

fn main() {
    a := int(C.c_add(10,20))
    println(a)
}
