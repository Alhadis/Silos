package sgl

Buffer :: struct {
    data: []u8
}

make_buffer :: proc(size: int) -> ^Buffer {
    using b := new(Buffer);
    data = make([]u8, size);
    return b;
}

delete_buffer :: proc(using b: ^Buffer) {
    delete(data);
    free(b);
}

buffer_element_ptr :: proc(using b: ^Buffer, element: int, $T: typeid) -> ^T {
    offset := size_of(T) * element;
    return transmute(^T) rawptr(uintptr(&data[0]) + uintptr(offset));
}

read_buffer_element :: proc(using b: ^Buffer, element: int, $T: typeid) -> T {
    ptr := buffer_element_ptr(b, element, T);
    return ptr^;
}

write_buffer_element :: proc(using b: ^Buffer, element: int, value: $T) {
    ptr := buffer_element_ptr(b, element, T);
    ptr^ = value;
}