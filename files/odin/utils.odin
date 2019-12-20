package sgl

@private
swap :: inline proc(a, b: ^$T) {
    temp := a^;
    a^ = b^;
    b^ = temp;
}