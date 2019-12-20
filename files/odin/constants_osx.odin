package socket

address_family :: enum i32 {
    INET  = 2,
    INET6 = 30,
}

MSG_NOSIGNAL :: 0x20000;
MSG_DONTWAIT ::  0x80;

EWOULDBLOCK :: 35;
EAGAIN  :: 35;

options :: enum i32 {
    REUSEADDR = 0x0004,
    REUSEPORT = 0x0200,
    RCVBUF = 0x1002,
    RCVLOWAT = 0x1004,
    RCVTIMEO = 0x1006,
    SNDBUF = 0x1001,
    SNDLOWAT = 0x1003,
    SNDTIMEO = 0x1005,
}
