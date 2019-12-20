package socket

address_family :: enum i32 {
    INET :: 2,
    INET6 :: 10,
}

options :: enum i32 {
    REUSEADDR = 2,
    RCVBUF = 8,
    SO_RCVTIMEO = 20,
}

MSG_NOSIGNAL :: 0x4000;
MSG_DONTWAIT ::  0x40;

EWOULDBLOCK :: 11;
EAGAIN  :: 11;
