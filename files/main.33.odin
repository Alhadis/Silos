package day11

import "core:os"
import "core:fmt"

IntCodeMachine :: struct {
    mem: []int,
    ip: int,
    rel_base: int,
    return_on_output: bool,
}

ic_run :: proc(using ic: ^IntCodeMachine, user_input: []int) -> (output: int, hlt: bool) {
    uip := 0;

    decode_instruction :: proc(instr: int) -> (a, b, c, op: int) {
        instr := instr;

        if instr > 0 {
            op = instr % 100;
            instr /= 100;
        }

        if instr > 0 {
            c = instr % 10;
            instr /= 10;
        }

        if instr > 0 {
            b = instr % 10;
            instr /= 10;
        }

        a = instr;

        return;
    }

    get_value :: proc(using ic: ^IntCodeMachine, arg, mode: int) -> int {
        switch mode {
        case 0: return mem[arg];
        case 1: return arg;
        case 2: return mem[rel_base+arg];
        case: fmt.panicf("unsupported mode %d", mode); return 0;
        }
    }

    write_value :: proc(using ic: ^IntCodeMachine, arg, mode, value: int) {
        switch mode {
        case 0: mem[arg] = value;
        case 1: fmt.panicf("trying to write to argument with mode 1(immediate)!");
        case 2: mem[rel_base+arg] = value;
        case: fmt.panicf("unsupported mode %d", mode);
        }
    }

    loop:
    for {
        instruction := mem[ip];

        mode_a, mode_b, mode_c, op := decode_instruction(instruction);

        switch op {
            case 1:
                a := mem[ip+1];
                b := mem[ip+2];
                r := mem[ip+3];

                write_value(ic, r, mode_a,
                    get_value(ic, a, mode_c) +
                    get_value(ic, b, mode_b)
                );

                ip += 4;
            case 2:
                a := mem[ip+1];
                b := mem[ip+2];
                r := mem[ip+3];

                write_value(ic, r, mode_a,
                    get_value(ic, a, mode_c) *
                    get_value(ic, b, mode_b)
                );

                ip += 4;
            case 3:
                dst := mem[ip+1];

                write_value(ic, dst, mode_c, user_input[uip]);
                uip += 1;

                ip += 2;
            case 4:
                src := mem[ip+1];

                ip += 2;

                v := get_value(ic, src, mode_c);

                if return_on_output {
                    return v, false;
                } else {
                    fmt.printf("%d\n", v);
                }
            case 5:
                cond := mem[ip+1];
                dst := mem[ip+2];

                if (get_value(ic, cond, mode_c)) != 0 {
                    ip = get_value(ic, dst, mode_b);
                } else {
                    ip += 3;
                }
            case 6:
                cond := mem[ip+1];
                dst := mem[ip+2];

                if (get_value(ic, cond, mode_c)) == 0 {
                    ip = get_value(ic, dst, mode_b);
                } else {
                    ip += 3;
                }
            case 7:
                a := mem[ip+1];
                b := mem[ip+2];
                dst := mem[ip+3];

                write_value(ic, dst, mode_a,
                    (get_value(ic, a, mode_c) <
                    get_value(ic, b, mode_b)) ? 1: 0
                );

                ip += 4;
             case 8:
                a := mem[ip+1];
                b := mem[ip+2];
                dst := mem[ip+3];

                write_value(ic, dst, mode_a,
                    (get_value(ic, a, mode_c) ==
                    get_value(ic, b, mode_b)) ? 1: 0
                );

                ip += 4;
            case 9:
                a := mem[ip+1];

                rel_base += get_value(ic, a, mode_c);

                ip += 2;
            case 99:
                break loop;
            case:
                fmt.panicf("Invalid opcode at %d: %v", ip, op);
        }
    }

    return mem[0], true;
}

part1 :: proc(input: []int) {
    HULL_WIDTH, HULL_HEIGHT :: 1000, 1000;
    Painting_Robot :: struct {
        ic: IntCodeMachine,
        x, y: int,
        dir: int,
        hull: []int,
        painted_hull: []bool,
    };
    robot := Painting_Robot{};
    robot.ic.mem = make([]int, 0x1000);
    copy(robot.ic.mem, input);
    robot.ic.return_on_output = true;
    robot.dir = 0;
    robot.x = HULL_WIDTH/2;
    robot.y = HULL_HEIGHT/2;
    robot.hull = make([]int, HULL_WIDTH*HULL_HEIGHT);
    robot.painted_hull = make([]bool, HULL_WIDTH*HULL_HEIGHT);

    for {
        current := robot.hull[robot.x+robot.y*HULL_WIDTH];
        color, hlt := ic_run(&robot.ic, []int{current});
        if hlt do break;

        robot.hull[robot.x+robot.y*HULL_WIDTH] = color;
        robot.painted_hull[robot.x+robot.y*HULL_WIDTH] = true;

        turn_dir: int;
        turn_dir, hlt = ic_run(&robot.ic, nil);
        if hlt do break;

        switch turn_dir {
        case 0: robot.dir -= 90;
        case 1: robot.dir += 90;
        }

        if robot.dir < 0 {
            robot.dir += 360;
        }
        if robot.dir >= 360 {
            robot.dir -= 360;
        }

        switch robot.dir {
        case 0: robot.y -= 1;
        case 90: robot.x += 1;
        case 180: robot.y += 1;
        case 270: robot.x -= 1;
        }
    }

    painted := 0;
    for i in robot.painted_hull {
        if i do painted += 1;
    }

    fmt.printf("part1: done, painted %v panels at least once\n", painted);
}

part2 :: proc(input: []int) {
    HULL_WIDTH, HULL_HEIGHT :: 50, 7;
    Painting_Robot :: struct {
        ic: IntCodeMachine,
        x, y: int,
        dir: int,
        hull: []int,
    };
    robot := Painting_Robot{};
    robot.ic.mem = make([]int, 0x1000);
    copy(robot.ic.mem, input);
    robot.ic.return_on_output = true;
    robot.dir = 0;
    robot.x = 0;
    robot.y = 0;
    robot.hull = make([]int, HULL_WIDTH*HULL_HEIGHT);
    robot.hull[robot.x+robot.y*HULL_WIDTH] = 1;

    for {
        current := robot.hull[robot.x+robot.y*HULL_WIDTH];
        color, hlt := ic_run(&robot.ic, []int{current});
        if hlt do break;

        robot.hull[robot.x+robot.y*HULL_WIDTH] = color;

        turn_dir: int;
        turn_dir, hlt = ic_run(&robot.ic, nil);
        if hlt do break;

        switch turn_dir {
        case 0: robot.dir -= 90;
        case 1: robot.dir += 90;
        }

        if robot.dir < 0 {
            robot.dir += 360;
        }
        if robot.dir >= 360 {
            robot.dir -= 360;
        }

        switch robot.dir {
        case 0: robot.y -= 1;
        case 90: robot.x += 1;
        case 180: robot.y += 1;
        case 270: robot.x -= 1;
        }
    }

    out: [dynamic]u8;
    for y in 0..<HULL_HEIGHT {
        for x in 0..<HULL_WIDTH {
            append(&out, robot.hull[x+y*HULL_WIDTH] > 0 ? '@' : ' ');
        }
        append(&out, '\n');
    }
    fmt.println("part2: hull registration:");
    fmt.println(string(out[:]));
}


main :: proc() {
    part1(input[:]);
    part2(input[:]);
}

input := [?]int{
3,8,1005,8,319,1106,0,11,0,0,0,104,1,104,0,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,101,0,8,28,2,1105,12,10,1006,0,12,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,102,1,8,58,2,107,7,10,1006,0,38,2,1008,3,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,108,0,8,10,4,10,1001,8,0,90,3,8,1002,8,-1,10,101,1,10,10,4,10,108,0,8,10,4,10,101,0,8,112,1006,0,65,1,1103,1,10,1006,0,91,3,8,102,-1,8,10,101,1,10,10,4,10,108,1,8,10,4,10,101,0,8,144,1006,0,32,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,102,1,8,169,1,109,12,10,1006,0,96,1006,0,5,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,101,0,8,201,3,8,102,-1,8,10,1001,10,1,10,4,10,108,0,8,10,4,10,1001,8,0,223,1,4,9,10,2,8,5,10,1,3,4,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,108,1,8,10,4,10,101,0,8,257,1,1,9,10,1006,0,87,3,8,102,-1,8,10,1001,10,1,10,4,10,1008,8,0,10,4,10,102,1,8,287,2,1105,20,10,1,1006,3,10,1,3,4,10,101,1,9,9,1007,9,1002,10,1005,10,15,99,109,641,104,0,104,1,21102,1,932972962600,1,21101,0,336,0,1106,0,440,21101,838483681940,0,1,21101,0,347,0,1106,0,440,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,21101,3375393987,0,1,21101,394,0,0,1105,1,440,21102,46174071847,1,1,21102,1,405,0,1106,0,440,3,10,104,0,104,0,3,10,104,0,104,0,21101,988648461076,0,1,21101,428,0,0,1106,0,440,21101,0,709580452200,1,21101,439,0,0,1105,1,440,99,109,2,22101,0,-1,1,21101,40,0,2,21102,1,471,3,21102,461,1,0,1106,0,504,109,-2,2106,0,0,0,1,0,0,1,109,2,3,10,204,-1,1001,466,467,482,4,0,1001,466,1,466,108,4,466,10,1006,10,498,1102,0,1,466,109,-2,2105,1,0,0,109,4,1202,-1,1,503,1207,-3,0,10,1006,10,521,21102,1,0,-3,22102,1,-3,1,21201,-2,0,2,21101,0,1,3,21102,540,1,0,1106,0,545,109,-4,2106,0,0,109,5,1207,-3,1,10,1006,10,568,2207,-4,-2,10,1006,10,568,22101,0,-4,-4,1105,1,636,22102,1,-4,1,21201,-3,-1,2,21202,-2,2,3,21102,1,587,0,1105,1,545,22101,0,1,-4,21102,1,1,-1,2207,-4,-2,10,1006,10,606,21101,0,0,-1,22202,-2,-1,-2,2107,0,-3,10,1006,10,628,21201,-1,0,1,21101,0,628,0,106,0,503,21202,-2,-1,-2,22201,-4,-2,-4,109,-5,2106,0,0
};
