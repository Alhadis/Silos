package empty_make

main :: proc() {
    _ :: make(); 

    // ^^^ compiles with
    // odin\src\ir.cpp(7503): Assertion Failure: `e != nullptr`
}
