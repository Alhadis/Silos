package main

import "core:fmt";
import "core:os";

VERSION_STR :: "v0.0.1-dev";

usage :: proc() {
    fmt.fprintf(os.stderr, "Umbra %s by Ethan Morgan 2019\n", VERSION_STR);
}

main :: proc() {
    args := os.args[1:];

    if len(os.args) == 0 {
	usage();
	os.exit(-1);
    }

    for arg in args {
	contents, success := os.read_entire_file(arg);
	if success != true {
	    panic("Can't read file");
	}

	fmt.println(string(contents));
    }        
}
