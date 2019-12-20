package socket

socket_type :: enum i32 {
    STREAM = 1,
    DGRAM  = 2,
    RAW    = 3,
}

protocol :: enum i32 {
    AUTO = 0,
    TCP  = 6,
    UDP  = 17,
}

level :: enum i32 {
    SOCKET = 0xffff,
}

// for async
O_NONBLOCK	:: 0x0004;		/* no delay */
O_APPEND	:: 0x0008;		/* set append mode */

F_DUPFD		:: 0;		/* duplicate file descriptor */
F_GETFD		:: 1;		/* get file descriptor flags */
F_SETFD		:: 2;		/* set file descriptor flags */
F_GETFL		:: 3;		/* get file status flags */
F_SETFL		:: 4;		/* set file status flags */
F_GETLK		:: 7;		/* get record locking information */
F_SETLK		:: 8;		/* set record locking information */
F_SETLKW	:: 9;		/* F_SETLK; wait if blocked */
