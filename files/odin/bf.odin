package main

import "core:fmt"
import "core:os"

main :: proc() {

    mem := [dynamic]u8 {0};
    memptr, ip, depth : u32 = 0, 0, 0;

    prog, succ := os.read_entire_file("input.bf");
    if succ == false {
        fmt.println("Cant open input.bf");
        return;
    }

    for int(ip) < len(prog) {
        switch prog[ip] {
            case '>' :  {
                memptr += 1;
                if u32(len(mem)) <= memptr do append(&mem, 0);
            }
            case '<' :  memptr -= 1;
            case '+' :  mem[memptr] += 1;
            case '-' :  mem[memptr] -= 1;
            case '.' :  os.write_byte(os.stdout, auto_cast mem[memptr]);
            case ',' :  {
                input := []byte {0..<1 = 0};
                os.read(os.stdin, input);
                mem[memptr] = input[0];
            }
            case '[' : {
                if mem[memptr] == 0 {
                    depth += 1;
                    for depth != 0 {
                        ip += 1;
                        if prog[ip] == '[' do depth += 1;
                        else if prog[ip] == ']' do depth -= 1;
                    }
                }
            }
            case ']' : {
                if mem[memptr] != 0 {
                    depth += 1;
                    for depth != 0 {
                        ip -= 1;
                        if prog[ip] == ']' do depth += 1;
                        else if prog[ip] == '[' do depth -= 1;
                    }
                }
            }
        }
        ip += 1;
    }
}
