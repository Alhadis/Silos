package socket

import "core:os"

// reference: https://beej.us/guide/bgnet/html/multi/sockaddr_inman.html
// poor man's polymorphism
when ODIN_OS == "osx" {
    addressbase :: struct {
        len: u8,    // doesn't need to be filled actually!
        family: u8, // AF_INET or AF_INET6 (this is like a union flag)
        port: u16,  // in network byte order
    }
} else {
    addressbase :: struct {
        family: u16, // AF_INET or AF_INET6 (this is like a union flag)
        port: u16,   // in network byte order
    }
}

// A thing that can represent either sockaddr_in or sockaddr_in6
// sockaddr
address_generic :: struct {
    using base: addressbase,
    sa_data: [12]byte, // actually could be more!!
}

// IPv4
// sockaddr_in
address :: struct {
    using base: addressbase,
    addr: u32,      // IP Address (v4)
    zero: [8]byte,  // padding
}

// IPv6
// sockaddr_in6
address6 :: struct {
    using base: addressbase,
    flowinfo: u32,  // No idea what this is for; probably obsolete
    addr: [16]byte, // IP Address (v6)
    scope_id: u32,  // No idea what this is for!
}

handle :: distinct i32;

shut :: enum i32 {
    RD = 0,
    WR = 1,
    RDWR = 2,
}

foreign import libc "system:c";
foreign libc {
    @(link_name="socket") _socket     :: proc(domain: address_family, t: socket_type, protocol: protocol) -> handle ---;

    @(link_name="bind") _bind         :: proc(fd: handle, addr: ^address_generic, addrlen: u32) -> i32 ---;
    @(link_name="accept") _accept     :: proc(fd: handle, addr: ^address_generic, addrlen: ^u32) -> handle ---;
    @(link_name="listen") _listen     :: proc(fd: handle, backlog: i32) -> i32 ---;
    @(link_name="shutdown") _shutdown :: proc(fd: handle, how: shut) -> i32 ---;

    @(link_name="recv") _recv         :: proc(s: handle, buf: rawptr, len: uint, flags: i32) -> i32 ---;
    @(link_name="send") _send         :: proc(s: handle, msg: rawptr, len: uint, flags: i32) -> i32 ---;

    @(link_name="recvfrom") _recvfrom :: proc(s: handle, buf: rawptr, len: uint, flags: i32, addr: ^address_generic, addrlen: ^u32) -> i32 ---;
    @(link_name="sendto") _sendto     :: proc(s: handle, msg: rawptr, len: i32, flags: i32,  addr: ^address_generic, addrlen: ^u32) -> i32 ---;


    // https://beej.us/guide/bgnet/html/multi/setsockoptman.html
    getsockopt :: proc (fd: handle, level: level, optname: options, optval: rawptr, optlen: ^u32) -> i32 ---;
    setsockopt :: proc (fd: handle, level: level, optname: options, optval: rawptr, optlen: u32) -> i32 ---;

    htonl :: proc(hl: u32) -> u32 ---;
    htons :: proc(hs: u16) -> u16 ---;
    ntohl :: proc(nl: u32) -> u32 ---;
    ntohs :: proc(ns: u16) -> u16 ---;
}

hton :: proc {htonl, htons};
ntoh :: proc {ntohl, ntohs};

// ----------

_or_error :: proc(s: $T) -> (T, os.Errno) {
    if s == -1 {
        return s, os.get_last_error();
    } else {
        return s, 0;
    }
}

_error_if :: proc(s: $T) -> os.Errno {
    if s == -1 {
        return os.get_last_error();
    } else {
        return 0;
    }
}

socket :: proc(domain: address_family = .INET, stype: socket_type = .STREAM, protocol: protocol = .AUTO) -> (handle, os.Errno) {
    return _or_error(_socket(domain, stype, protocol));
}

bind :: proc(fd: handle, addr: ^$T) -> os.Errno {
    #assert(type_of(addr.base) == addressbase);
    return _error_if(_bind(fd, cast(^address_generic) addr, size_of(addr^)));
}

listen :: proc(fd: handle, backlog: i32) -> os.Errno {
    return _error_if(_listen(fd, backlog));
}

accept :: proc(fd: handle, addr: ^$T) -> (handle, os.Errno) {
    #assert(type_of(addr.base) == addressbase);
    len : u32 = size_of(addr^);
    return _or_error(_accept(fd, cast(^address_generic) addr, &len));
}

send_bytes :: proc(fd: handle, buffer: []byte) -> (i32, os.Errno) {
    sent := _send(fd, &buffer[0], uint(len(buffer)), MSG_NOSIGNAL);
    if sent == -1 {
        return 0, os.get_last_error();
    }
    return sent, 0;
}

send :: proc{send_bytes};

// utility
sendall :: proc(fd: handle, buffer: []byte) -> os.Errno {
    sent: int;
    for sent < len(buffer) {
        count, err := send_bytes(fd, buffer[sent:]);
        sent += int(count);
        if err != 0 {
            return err;
        }
    }
    return 0;
}

// returns bytes read and socket state. errors ignored for now!!
recv :: proc(fd: handle, buffer: []byte) -> (int, os.Errno) {
    return _or_error(int(_recv(fd, &buffer[0], uint(len(buffer)), 0)));
}

shutdown :: proc(fd: handle, how: shut) -> os.Errno {
    return _error_if(_shutdown(fd, how));
}

close :: proc(fd: handle) {
    os.close(os.Handle(fd));
}

set_option_i32 :: proc(fd: handle, option_name: options, val: i32) -> os.Errno {
    val := val;
    return _error_if(setsockopt(fd, .SOCKET, option_name, &val, size_of(val)));
}

set_option :: proc{set_option_i32};

// TODO: a version for buffers
get_option_int :: proc(fd: handle, option_name: options) -> (i32, os.Errno) {
    val: int;
    size := u32(size_of(val));
    res := getsockopt(fd, .SOCKET, option_name, &val, &size);
    return _or_error(res);
}

get_option :: proc{get_option_int};

// -----------

make_address :: proc(port: u16 = 0) -> address {
    add: address;

    // probably not needed!
    when ODIN_OS == "osx" {
        add.len = size_of(add);
    }

    add.family = auto_cast address_family.INET;
    add.port = hton(port);
    return add;
}

make_address_v6 :: proc(port: u16 = 0) -> address6 {
    add: address6;

    // probably not needed!
    when ODIN_OS == "osx" {
        add.len = size_of(add);
    }

    add.family = auto_cast address_family.INET6;
    add.port = hton(port);
    return add;
}

set_option_reuse_address :: proc(fd: handle, reuse: bool) -> os.Errno {
    return set_option(fd, .REUSEADDR, i32(reuse));
}

get_recv_buffer_size :: proc(fd: handle) -> (i32, os.Errno) {
    return get_option(fd, .RCVBUF);
}
