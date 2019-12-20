package day7

import "core:fmt"

run_once :: proc(ip: int, input: []int, user_input: []int) -> (output: int, ip_out: int, hlt: bool) {
    //disasm();

    ip := ip;
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

    get_value :: proc(input: []int, arg, mode: int) -> int {
        return mode == 0 ? input[arg] : arg;
    }

    loop:
    for {
        instruction := input[ip];

        mode_a, mode_b, mode_c, op := decode_instruction(instruction);

        switch op {
            case 1:
                a := input[ip+1];
                b := input[ip+2];
                r := input[ip+3];

                input[r] =
                    get_value(input, a, mode_c) +
                    get_value(input, b, mode_b);

                ip += 4;
            case 2:
                a := input[ip+1];
                b := input[ip+2];
                r := input[ip+3];

                input[r] =
                    get_value(input, a, mode_c) *
                    get_value(input, b, mode_b);

                ip += 4;
            case 3:
                dst := input[ip+1];

                input[dst] = user_input[uip];
                uip += 1;

                ip += 2;
            case 4:
                src := input[ip+1];

                ip += 2;
                return get_value(input, src, mode_c), ip, false;
            case 5:
                cond := input[ip+1];
                dst := input[ip+2];

                if (get_value(input, cond, mode_c)) != 0 {
                    ip = get_value(input, dst, mode_b);
                } else {
                    ip += 3;
                }
            case 6:
                cond := input[ip+1];
                dst := input[ip+2];

                if (get_value(input, cond, mode_c)) == 0 {
                    ip = get_value(input, dst, mode_b);
                } else {
                    ip += 3;
                }
            case 7:
                a := input[ip+1];
                b := input[ip+2];
                dst := input[ip+3];

                input[dst] =
                    (get_value(input, a, mode_c) <
                    get_value(input, b, mode_b)) ? 1: 0;

                ip += 4;
             case 8:
                a := input[ip+1];
                b := input[ip+2];
                dst := input[ip+3];

                input[dst] =
                    (get_value(input, a, mode_c) ==
                    get_value(input, b, mode_b)) ? 1: 0;

                ip += 4;
            case 99:
                break loop;
            case:
                fmt.panicf("Invalid opcode at %d: %v", ip, op);
        }
    }

    return input[0], ip, true;
}

part1 :: proc() {
    generate :: proc(k: int, A: [$N]int, result: ^[dynamic][N]int) {
        // Heap's algorithm
        A := A;
        if k == 1 {
            append(result, A);
            return;
        }

        for i in 0..<k {
            generate(k-1, A, result);

            if k % 2 == 0 {
                A[i], A[k-1] = A[k-1], A[i];
            } else {
                A[0], A[k-1] = A[k-1], A[0];
            }
        }
    }
    perms := [?]int{0, 1, 2, 3, 4};
    confs: [dynamic][5]int;
    generate(len(perms), perms, &confs);
    fmt.printf("part1: total permutations %d\n", len(confs));

    best_conf: [5]int;
    best_output := 0;

    for conf in confs {
        amp_in := 0;

        for phase in conf {
            copy := input;
            amp_in, _, _ = run_once(0, copy[:], []int{phase, amp_in});
        }


        if amp_in > best_output {
            best_output = amp_in;
            best_conf = conf;
        }
    }

    fmt.printf("part1: best conf %v -> %d\n", best_conf, best_output);
}

part2 :: proc() {
    generate :: proc(k: int, A: [$N]int, result: ^[dynamic][N]int) {
        // Heap's algorithm
        A := A;
        if k == 1 {
            append(result, A);
            return;
        }

        for i in 0..<k {
            generate(k-1, A, result);

            if k % 2 == 0 {
                A[i], A[k-1] = A[k-1], A[i];
            } else {
                A[0], A[k-1] = A[k-1], A[0];
            }
        }
    }
    perms := [?]int{5, 6, 7, 8, 9};
    confs: [dynamic][5]int;
    generate(len(perms), perms, &confs);
    fmt.printf("part2: total permutations %d\n", len(confs));

    best_conf: [5]int;
    best_output := 0;

    for conf in confs {
        amp_in := 0;
        last_E := 0;

        amps: [5]struct{state: []int, ip: int};
        for _, i in amps {
            amps[i].state = make([]int, len(input));
            copy(amps[i].state[:], input[:]);
        }

        // initialize for feedback mode
        hlt := false;
        for phase, i in conf {
            amp_in, amps[i].ip, hlt = run_once(amps[i].ip, amps[i].state[:], []int{phase, amp_in});
        }
        last_E = amp_in;

        // run until hlt
        hlt_loop:
        for hlt == false {
            for phase, i in conf {
                amp_in, amps[i].ip, hlt = run_once(amps[i].ip, amps[i].state[:], []int{amp_in});
                if hlt do break hlt_loop;
            }

            last_E = amp_in;
        }


        if last_E > best_output {
            best_output = last_E;
            best_conf = conf;
        }
    }

    fmt.printf("part2: best conf %v -> %d\n", best_conf, best_output);
}


main :: proc() {
    part1();
    part2();
}

input := [?]int{
3,8,1001,8,10,8,105,1,0,0,21,38,63,72,85,110,191,272,353,434,99999,3,9,102,4,9,9,101,2,9,9,102,3,9,9,4,9,99,3,9,1001,9,4,9,102,2,9,9,1001,9,5,9,1002,9,5,9,101,3,9,9,4,9,99,3,9,1001,9,2,9,4,9,99,3,9,1001,9,3,9,102,2,9,9,4,9,99,3,9,101,2,9,9,102,2,9,9,1001,9,2,9,1002,9,4,9,101,2,9,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,101,2,9,9,4,9,99,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,99
};
