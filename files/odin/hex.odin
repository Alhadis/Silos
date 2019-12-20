package hex

// @note(bp): transcoding hexidecimal strings to/from byte slices


encode :: encode_lowercase;
encode_uppercase :: proc(bytes: []byte, allocator := context.allocator) -> string {
    lut: [16]byte = [16]byte{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    buf := make([]byte, len(bytes)*2, allocator);
    for i: i32 = 0; i < i32(len(bytes)); i += 1 {
        buf[i*2+0] = lut[bytes[i] >> 4 & 0xF];
        buf[i*2+1] = lut[bytes[i]      & 0xF];
    }
    return string(buf);
}
encode_lowercase :: proc(bytes: []byte, allocator := context.allocator) -> string {
    lut: [16]byte = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    buf := make([]byte, len(bytes)*2, allocator);
    for i: i32 = 0; i < i32(len(bytes)); i += 1 {
        buf[i*2+0] = lut[bytes[i] >> 4 & 0xF];
        buf[i*2+1] = lut[bytes[i]      & 0xF];
    }
    return string(buf);
}

decode :: proc(str: string, allocator := context.allocator) -> []byte {
    buf := make([]byte, len(str)/2, allocator);
    return buf[:decode_to_buffer(str, buf)];
}

decode_to_buffer :: proc(str: string, buf: []byte) -> int {
    assert(len(str)/2 <= len(buf));
    for i: i32 = 0; i < i32(len(buf)); i += 1 {
        c1 := str[i*2+0];
        c2 := str[i*2+1];
        switch c1 {
        case '0'..'9': buf[i] = c1 - '0';
        case 'A'..'F': buf[i] = c1 - 'A' + 10;
        case 'a'..'f': buf[i] = c1 - 'a' + 10;
        }
        buf[i] <<= 4;
        switch c2 {
        case '0'..'9': buf[i] |= c2 - '0';
        case 'A'..'F': buf[i] |= c2 - 'A' + 10;
        case 'a'..'f': buf[i] |= c2 - 'a' + 10;
        }
    }
    return len(str)/2;
}
