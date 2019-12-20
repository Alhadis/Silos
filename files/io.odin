package io

import "core:os"
import "core:mem"
import "core:log"
import "core:fmt" // for panicf
import "core:runtime"

Error :: enum {
    Ok,
    Could_Not_Create_File,
    Could_Not_Open_File,
    Could_Not_Read_From_File,
    Not_Enough_Bytes,
    End_Of_Stream,
    Invalid_Handle,
    Write_Proc_Is_Nil,
    Read_Proc_Is_Nil,
}


Writer :: struct {
    // Could also include some more specific actions, like `close` and `flush`
    write_proc: proc(writer: ^Writer, data: []byte) -> (int, Error),
}

write :: inline proc(using writer: ^Writer, data: []byte) -> (int, Error) {
    if writer.write_proc == nil do return 0, .Write_Proc_Is_Nil;
    return writer.write_proc(writer, data);
}

write_string :: inline proc(using writer: ^Writer, s: string) -> (int, Error) {
    if writer.write_proc == nil do return 0, .Write_Proc_Is_Nil;
    return writer.write_proc(writer, transmute([]u8) s);
}

write_byte :: inline proc(using writer: ^Writer, b: byte) -> (int, Error) {
    if writer.write_proc == nil do return 0, .Write_Proc_Is_Nil;
    return writer.write_proc(writer, []u8{b});
}

write_any :: proc(using writer: ^Writer, data: any) -> (int, Error) {
    // use type information to write structs, enums, unions, etc.
    // have corresponding read_any.
    tb := runtime.type_info_base(type_info_of(data.id));

    switch ti in tb.variant {
    case runtime.Type_Info_Struct:
        bytes := mem.any_to_bytes(data);
        return write(writer, bytes);
    case runtime.Type_Info_String:
        return write_string(writer, data.(string));
    case:
        fmt.panicf("write_any: type '%v' not supported", tb.id);
        return 0, .Ok;
    }

}



Reader :: struct {
    read_proc: proc(reader: ^Reader, data: []byte) -> (int, Error),
}

read :: inline proc(using reader: ^Reader, data: []byte) -> (int, Error) {
    if reader.read_proc == nil do return 0, .Read_Proc_Is_Nil;
    return reader.read_proc(reader, data);
}

read_byte :: inline proc(using reader: ^Reader) -> (byte, Error) {
    if reader.read_proc == nil do return 0, .Read_Proc_Is_Nil;

    buffer: [1]u8;
    n, err := reader.read_proc(reader, buffer[:]);
    if err != .Ok {
        return 0, err;
    }

    if n == 0 {
        // What do we do here? Another error code? EOS error code?
        return 0, .Ok;
    }

    return buffer[0], .Ok;
}

read_u32le :: inline proc(using reader: ^Reader) -> (u32le, Error) {
    if reader.read_proc == nil do return 0, .Read_Proc_Is_Nil;
    return read_typeid(reader, u32le);
}

read_typeid :: inline proc(using reader: ^Reader, $T: typeid) -> (T, Error) {
    if reader.read_proc == nil do return {}, .Read_Proc_Is_Nil;

    buffer: [size_of(T)]byte;
    l, err := read(reader, buffer[:]);
    if l != size_of(T) {
        return {}, .Not_Enough_Bytes;
    }

    return transmute(T) buffer, .Ok;
}

nil_write_proc :: proc(writer: ^Writer, data: []byte) -> (int, Error) {
    return len(data), .Ok;
}

@private
_nil_writer := Writer{nil_write_proc};

nil_writer :: proc() -> ^Writer {
    return &_nil_writer;
}
