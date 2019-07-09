#flag -lsample
#include "sample.h"

struct C.Sample {
    str string
}

fn main() {
    sample := C.Sample {
        'hello'
    }

    println(sample.str)
}
