package server

import "core:fmt"
import "core:os"
import "../socket"

// kqueue api

EVFILT :: enum i16 {
    READ =     (-1),
    WRITE =    (-2),
    AIO =      (-3),    /* attached to aio requests */
    VNODE =    (-4),    /* attached to vnodes */
    PROC =     (-5),    /* attached to struct proc */
    SIGNAL =   (-6),    /* attached to struct proc */
    TIMER =    (-7),    /* timers */
    MACHPORT = (-8),    /* Mach portsets */
    FS =       (-9),    /* Filesystem events */
    USER =     (-10),   /* User events */
                       /* (-11) unused */
    VM =       (-12),   /* Virtual memory events */

    EXCEPT =   (-15),   /* Exception events */
};


EV_ADD     :: 0x0001;      /* add event to kq (implies enable) */
EV_DELETE  :: 0x0002;      /* delete event from kq */
EV_ENABLE  :: 0x0004;      /* enable event */
EV_DISABLE :: 0x0008;      /* disable event (not reported) */

EV_ONESHOT :: 0x0010;      /* only report one occurrence */
EV_CLEAR   :: 0x0020;      /* clear event state after reporting */
EV_RECEIPT :: 0x0040;      /* force immediate event output */
                                 /* ... with or without EV_ERROR */
                                 /* ... use KEVENT_FLAG_ERROR_EVENTS */
                                 /*     on syscalls supporting flags */
/* returned values */
EV_EOF   :: 0x8000;      /* EOF detected */
EV_ERROR :: 0x4000;      /* error, data contains errno */

KQ_Flags :: u16;

FFLAG :: enum u32 {
    POOL   = 0x1000,  // filter-specific flag
    OOBAND = 0x2000,  // filter-specific flag
};

KQ_FFlags :: u32;

KQIdent :: distinct uint;

KEvent :: struct {
    ident:  KQIdent,       // identifier for this event
    filter: EVFILT, // filter for event
    flags:  KQ_Flags,   // action flags for kqueue
    fflags: KQ_FFlags,  // filter flag value
    data:   int,        // filter data value
    udata:  rawptr,     // opaque user data identifier
};

KQueue :: distinct i32;

foreign import libc "system:c"
foreign libc {
    kqueue :: proc() -> KQueue ---;
    @(link_name="kevent") _kevent :: proc(kq: KQueue, changelist: ^KEvent, nchanges: i32, eventlist: ^KEvent, nevents: i32, timeout: ^os.TimeSpec) -> i32 ---;
}

// -----------------------------------------------------------------------------

// interface:
// aioList :: struct
// aioInit :: proc(list: ^aioList)
// aioAddReading :: proc(list: ^aioList, sock: socket.handle, udata: rawptr)
// aioAddWriting :: proc(list: ^aioList, sock: socket.handle, udata: rawptr)
// aioFrame :: proc()

aioList :: struct {
    kq: KQueue
}

aioInit :: proc(using list: ^aioList) {
    kq = kqueue();
}

kq_list :: proc(kq: KQueue, eventlist: []KEvent, timeout: ^os.TimeSpec) -> i32 {
    return _kevent(kq, nil, 0, &eventlist[0], i32(len(eventlist)), timeout);
}

kq_change :: proc(kq: KQueue, event: ^KEvent) -> i32 {
    return _kevent(kq, event, 1, nil, 0, nil);
}

aioAddReading :: proc(list: ^aioList, sock: socket.handle, udata: rawptr) -> i32 {
    kevSet := KEvent {
        ident = KQIdent(sock),
        filter = .READ,
        flags = EV_ADD,
        udata = udata,
    };
    return kq_change(list.kq, &kevSet);
}

aioAddWriting :: proc(list: ^aioList, sock: socket.handle, udata: rawptr) -> i32 {
    kevSet := KEvent {
        ident = KQIdent(sock),
        filter = .WRITE,
        flags = EV_ADD,
        udata = udata,
    };
    return kq_change(list.kq, &kevSet);
}

aioRemoveReading :: proc(list: ^aioList, sock: socket.handle, udata: rawptr) -> i32 {
    kevSet := KEvent {
        ident = KQIdent(sock),
        filter = .READ,
        flags = EV_DISABLE,
        udata = udata,
    };
    return kq_change(list.kq, &kevSet);
}

aioRemoveWriting :: proc(list: ^aioList, sock: socket.handle, udata: rawptr) -> i32 {
    kevSet := KEvent {
        ident = KQIdent(sock),
        filter = .WRITE,
        flags = EV_DISABLE,
        udata = udata,
    };
    return kq_change(list.kq, &kevSet);
}

aioHandler :: proc(sock: socket.handle, udata: rawptr);

aioFrame :: proc(list: ^aioList, serverSocket: socket.handle, acceptFn: aioHandler, readFn: aioHandler, writeFn: aioHandler) {
    events: [64]KEvent;
    count := kq_list(list.kq, events[:], nil);
    if count < 0 {
        // panic?!
        fmt.println("kevent failed!!!!!");
        os.exit(1);
    }

    for index := 0; index < int(count); index += 1 {
        ev := events[index];
        if ev.ident == KQIdent(serverSocket) {
            acceptFn(socket.handle(ev.ident), ev.udata);
        } else if ev.filter == .READ {
            readFn(socket.handle(ev.ident), ev.udata);
        } else if ev.filter == .WRITE {
            writeFn(socket.handle(ev.ident), ev.udata);
        } else {
            fmt.println("unknown event\n -->", ev);
        }
    }
}
