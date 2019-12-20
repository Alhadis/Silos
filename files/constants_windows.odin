package socket

address_family :: enum i32 {
    INET :: 2,
    INET6 :: 23,
    BTH: 32, // bluetooth
}

options :: enum i32 {
    REUSEADDR = 0x0004,
    RCVBUF = 0x1002, // TODO: find windows and linux values
}

EWOULDBLOCK :: 11;
EAGAIN  :: 11;
