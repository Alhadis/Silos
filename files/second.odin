package main

import "core:fmt"

test2 :: proc() {
    fmt.println("hello2");
}

main :: proc() {
    fmt.println("second!!");
    test2();
}