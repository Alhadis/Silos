package main

// Shared libraries
import "core:os"
import "core:strings"
import dt "shared:gruftools/dirtool"

// Project libraries
import "fmt"

USE_COLOR  := false;
SHOW_ALL   := false;
LONG_PRINT := false;
HUMAN_RDBL := false;

main :: proc() {
    dir: string;

    if len(os.args) == 1 {
        dir, _ = os.getenv("PWD");
    } else {
        dir = os.args[1];
    }

    dt.init();
    items := dt.read_directory(dir);

    for i := 0; i < len(items); i += 1 {
        fmt.print_item(&items[i], USE_COLOR, SHOW_ALL, LONG_PRINT, HUMAN_RDBL);
    }

    dt.cleanup();
}
