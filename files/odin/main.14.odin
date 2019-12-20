package main

import "core:fmt"
import "core:os"
import "thread"
import "server"

main :: proc() {
    th_server := thread.go(server.start, 3040);
    thread.come(&th_server);

    fmt.println("server came!");
}

