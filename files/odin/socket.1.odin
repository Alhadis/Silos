package io

////////////////////////////////
/// Socket Reader and Writer ///
////////////////////////////////

when false {

Socket_Writer :: struct {
    using writer: Writer,
    socket_handle: sock.Socket,
}

socket_write_proc :: proc(using w: ^Socket_Writer, data: []byte) -> (int, Error) {
    n := sock.write(socket_handle, data, len(data));
    if n < 0 {
        // Handle errno
        return 0, .Socked_Write_Error;
    }

    return n, .Ok;
}

make_socket_writer :: proc(sock: sock.Socket) -> Socket_Writer {
    sw := Socket_Writer{};
    sw.write_proc = cast(type_of(sw.write_proc)) socket_write_proc;
    sw.socket_handle = sock;

    return sw;
}



Socket_Reader :: struct {
    using writer: Reader,
    socket_handle: sock.Socket,
}

socket_read_proc :: proc(using w: ^Socket_Reader, data: []byte) -> (int, Error) {
    n := sock.read(socket_handle, data, len(data));
    if n < 0 {
        // Handle errno
        return 0, .Socked_Read_Error;
    }

    return n, .Ok;
}

make_socket_reader :: proc(sock: sock.Socket) -> Socket_Reader {
    sw := Socket_Reader{};
    sw.read_proc = cast(type_of(sw.read_proc)) socket_read_proc;
    sw.socket_handle = sock;

    return sw;
}

}
