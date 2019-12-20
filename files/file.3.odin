package io

import "core:os"
import "core:log"

//////////////////////////////
/// File Writer and Reader ///
//////////////////////////////


File_Writer :: struct {
    using writer: Writer,
    handle: os.Handle,
}

file_write_proc :: proc(using w: ^File_Writer, data: []byte) -> (int, Error) {
    if  len(data) == 0 do return 0, .Ok;
    if handle == os.INVALID_HANDLE do return 0, .Invalid_Handle;
    os.write(handle, data);
    return len(data), .Ok;
}

create_file :: proc(filename: string) -> (File_Writer, Error) {
    fw := File_Writer{};
    fw.write_proc = cast(type_of(fw.write_proc)) file_write_proc;
    fw.handle = os.INVALID_HANDLE;

    handle, err := os.open(filename, os.O_CREATE|os.O_TRUNC);
    if err != os.ERROR_NONE {
        log.error("create_file failed to open file, errno: %v", err);
        return fw, .Could_Not_Create_File;
    }

    fw.handle = handle;

    return fw, .Ok;
}

open_file_writer :: proc(filename: string) -> (File_Writer, Error) {
    fw := File_Writer{};
    fw.write_proc = cast(type_of(fw.write_proc)) file_write_proc;

    handle, err := os.open(filename, os.O_APPEND);
    if err != os.ERROR_NONE {
        log.error("open_file_writer failed to open file, errno: %v", err);
        return {}, .Could_Not_Open_File;
    }

    fw.handle = handle;

    return fw, .Ok;
}

make_file_writer :: proc(handle: os.Handle) -> (File_Writer, Error) {
    fw := File_Writer{};
    fw.write_proc = cast(type_of(fw.write_proc)) file_write_proc;
    fw.handle = handle;

    return fw, .Ok;
}

close_file_writer :: proc(fw: ^File_Writer) {
    os.close(fw.handle);
}



File_Reader :: struct {
    using reader: Reader,
    handle: os.Handle,
}

file_read_proc :: proc(using r: ^File_Reader, data: []byte) -> (int, Error) {
    if len(data) == 0 do return 0, .Ok;
    if handle == os.INVALID_HANDLE do return 0, .Invalid_Handle;

    l, err := os.read(r.handle, data);
    //log.debug("l: %v, err: %v", l, err);

    if err != os.ERROR_NONE  && err != os.ERROR_BROKEN_PIPE {
        return {}, .Could_Not_Read_From_File;
    }

    if l == 0 {
        return 0, .End_Of_Stream;
    }

    return l, .Ok;
}


open_file_reader :: proc(filename: string) -> (File_Reader, Error) {
    fr := File_Reader{};
    fr.read_proc = cast(type_of(fr.read_proc)) file_read_proc;
    fr.handle = os.INVALID_HANDLE;

    handle, err := os.open(filename, os.O_RDONLY);
    if err != os.ERROR_NONE {
        log.error("open_file_reader failed to open file, errno: %v", err);
        return fr, .Could_Not_Open_File;
    }

    fr.handle = handle;

    return fr, .Ok;
}

make_file_reader :: proc(handle: os.Handle) -> (File_Reader, Error) {
    fr := File_Reader{};
    fr.read_proc = cast(type_of(fr.read_proc)) file_read_proc;
    fr.handle = handle;

    return fr, .Ok;
}

close_file_reader :: proc(fr: ^File_Reader) {
    os.close(fr.handle);
}
