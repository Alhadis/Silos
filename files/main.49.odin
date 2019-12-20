package chip8

import "core:os"
import "core:fmt"
import "core:math"
import  mathrand "core:math/rand"
import coremem "core:mem"

import sdl "shared:odin-sdl2"

Chip :: struct {
    mem: [0x10000]u8,
    reg: [16]u8,
    stack: [16]u16,
    keypad: [16]b8,
    i: u16,
    pc, sp: u16,
    delay_timer, sound_timer: u8,
    schip: bool,
    rand: mathrand.Rand,
    wait_for_key: bool,
    wait_for_key_reg: u8,

    last_time_delay: u64,
    last_time_sound: u64,

    display: []u8,
    display_width, display_height: int,
}

chip_init :: proc(using c: ^Chip, is_schip := false) {
    reg = 0;
    i = 0;
    pc = 0x200;
    sp = 0;
    delay_timer = 0;
    sound_timer = 0;
    keypad = false;
    schip = is_schip;

    mathrand.init(&rand, 0xFF11);

    display_width = 64;
    display_height = 32;
    display = make([]u8, display_width * display_height);

    last_time_delay = sdl.get_performance_counter();
    last_time_sound = sdl.get_performance_counter();

    copy(mem[:], FONT);
}

chip_step :: proc(using c: ^Chip) {
    //TODO: Have these be actual timers
    now := sdl.get_performance_counter();

    if f64(now - last_time_delay) / f64(sdl.get_performance_frequency()) > 1.0/60.0 {
        last_time_delay = now;
        if delay_timer > 0 {
            delay_timer -= 1;
        }
    }

    if f64(now - last_time_sound) / f64(sdl.get_performance_frequency()) > 1.0/60.0 {
        last_time_sound = now;
        if sound_timer > 0 {
            sound_timer -= 1;
        }
    }
    //if delay_timer > 0 do delay_timer -= 1;
    //if sound_timer > 0 do sound_timer -= 1;

    if wait_for_key {
        for v, index in keypad {
            if v {
                reg[wait_for_key_reg] = u8(index);
                wait_for_key = false;
            }
        }

        return;
    }

    op := u16(mem[pc]) << 8 | u16(mem[pc+1]);
    pc += 2;

    when false {
        fmt.printf("pc: 0x%04X, op: 0x%04X\n", pc-2, op);
        fmt.printf("v0: 0x%02X, v1: 0x%02X\n", reg[0], reg[1]);
        fmt.printf("v2: 0x%02X, v3: 0x%02X\n", reg[2], reg[3]);
        fmt.printf("v4: 0x%02X, v5: 0x%02X\n", reg[4], reg[5]);
        fmt.printf("v6: 0x%02X, v7: 0x%02X\n", reg[6], reg[7]);
        fmt.printf("v8: 0x%02X, v9: 0x%02X\n", reg[8], reg[9]);
        fmt.printf("vA: 0x%02X, vB: 0x%02X\n", reg[0xA], reg[0xB]);
        fmt.printf("vC: 0x%02X, vD: 0x%02X\n", reg[0xC], reg[0xD]);
        fmt.printf("vE: 0x%02X, vF: 0x%02X\n", reg[0xE], reg[0xF]);
    }

    switch op & 0xF000 {
        case 0x0000:
            switch op {
            case 0x00E0:
                coremem.zero_slice(display);
            case 0x00EE:
                sp -= 1;
                pc = stack[sp];
            case:
                fmt.panicf("SYS addr instruction not supported by emulators, your rom is ancient :)\nopcode: 0x%04x\n", op);
            }
        case 0x1000:
            pc = op & 0x0FFF;
        case 0x2000:
            stack[sp] = pc;
            sp += 1;
            pc = op & 0x0FFF;
        case 0x3000:
            if reg[op & 0x0F00 >> 8] == u8(op & 0x00FF) {
                pc += 2;
            }
        case 0x4000:
            if reg[op & 0x0F00 >> 8] != u8(op & 0x00FF) {
                pc += 2;
            }
        case 0x5000:
            if reg[op & 0x0F00 >> 8] == reg[op & 0x00F0 >> 4] {
                pc += 2;
            }
        case 0x6000:
            reg[op & 0x0F00 >> 8] = u8(op & 0x00FF);
        case 0x7000:
            reg[op & 0x0F00 >> 8] += u8(op & 0x00FF);
        case 0x8000:
            switch op & 0xF {
            case 0x0: // LD
                reg[op & 0x0F00 >> 8] = reg[op & 0x00F0 >> 4];
            case 0x1: // OR
                reg[op & 0x0F00 >> 8] |= reg[op & 0x00F0 >> 4];
            case 0x2: // AND
                reg[op & 0x0F00 >> 8] &= reg[op & 0x00F0 >> 4];
            case 0x3: // XOR
                reg[op & 0x0F00 >> 8] ~= reg[op & 0x00F0 >> 4];
            case 0x4: // ADD
                res := u16(reg[op & 0x0F00 >> 8]) + u16(reg[op & 0x00F0 >> 4]);
                reg[0xf] = res > u16(max(u8)) ? 1 : 0;
                reg[op & 0x0F00 >> 8] += reg[op & 0x00F0 >> 4];
            case 0x5: // SUB
                reg[0xf] = reg[op & 0x0F00 >> 8] > reg[op & 0x00F0 >> 4] ? 1 : 0;
                reg[op & 0x0F00 >> 8] -= reg[op & 0x00F0 >> 4];
            case 0x6: // SHR
                // This commented code uses VY
                //reg[0xf] = reg[op & 0x00F0 >> 4] & 0b1;
                //reg[op & 0x0F00 >> 8] = reg[op & 0x00F0 >> 4] >> 1;

                reg[0xf] = reg[op & 0x0F00 >> 8] & 0b1;
                reg[op & 0x0F00 >> 8] = reg[op & 0x0F00 >> 8] >> 1;
            case 0x7: // SUBN
                reg[0xf] = reg[op & 0x00F0 >> 4] > reg[op & 0x0F00 >> 8] ? 1 : 0;
                reg[op & 0x0F00 >> 8] = reg[op & 0x00F0 >> 4] - reg[op & 0x0F00 >> 8];
            case 0xE: // SHL
                // This commented code uses VY
                //reg[0xf] = reg[op & 0x00F0 >> 4] & 0b1000_0000 > 0 ? 1 : 0;
                //reg[op & 0x0F00 >> 8] = reg[op & 0x00F0 >> 4] << 1;
                
                reg[0xf] = reg[op & 0x0F00 >> 8] & 0b1000_0000 > 0 ? 1 : 0;
                reg[op & 0x0F00 >> 8] = reg[op & 0x0F00 >> 8] << 1;
            case:
                panic("Invalid instruction!");
            }
        case 0x9000:
            if reg[op & 0x0F00 >> 8] != reg[op & 0x00F0 >> 4] {
                pc += 2;
            }
        case 0xA000:
            i = op & 0x0FFF;
        case 0xB000:
            pc = u16(reg[0]) + (op & 0x0FFF);
        case 0xC000:
            r := u16(mathrand.uint32(&rand) & 0xFF);
            reg[op & 0x0F00 >> 8] = u8(r & (op & 0x00FF));
        case 0xD000:
            n := op & 0x000F;
            vx := reg[(op & 0x0F00) >> 8];
            vy := reg[(op & 0x00F0) >> 4];

            //TODO: Make sure the modulo wrapping is good enough

            reg[0xf] = 0;

            PRINT :: false;

            for y := 0; y < int(n); y += 1 {
                b := mem[int(i) + y];
                yy := (int(vy) + y) % display_height;

                for x := 0; x < 8; x += 1 {
                    bit := u8(b & 0b1000_0000 > 0 ? 1 : 0);
                    when PRINT do fmt.printf("%c", bit > 0 ? '1' : '0');
                    b <<= 1;

                    xx := (int(vx) + x) % display_width;
                    screen_bit := display[xx+yy*display_width];

                    if screen_bit == 1 && bit == 1 do reg[0xf] = 1;

                    display[xx+yy*display_width] = screen_bit ~ bit > 0 ? 1 : 0;
                }

                when PRINT do fmt.printf("\n");
            }
        case 0xE000:
            switch op & 0xFF {
            case 0x9E:
                vx := reg[op & 0x0F00 >> 8];
                fmt.println("SKIP KEY ", vx);
                if vx <= 0xF && keypad[vx] {
                    pc += 2;
                }
            case 0xA1:
                vx := reg[op & 0x0F00 >> 8];
                if vx <= 0xF && !keypad[vx] {
                    pc += 2;
                }
            case:
                panic("Invalid instruction!");
            }
        case 0xF000:
            switch op & 0xFF {
            case 0x07:
                reg[op & 0x0F00 >> 8] = delay_timer;
            case 0x0A:
                wait_for_key = true;
                wait_for_key_reg = u8(op & 0x0F00 >> 8);
            case 0x15:
                delay_timer = reg[op & 0x0F00 >> 8];
            case 0x18:
                sound_timer = reg[op & 0x0F00 >> 8];
            case 0x1E:
                i += u16(reg[op & 0x0F00 >> 8]);
            case 0x29:
                i = u16(reg[op & 0x0F00 >> 8]) * 5;
            case 0x33:
                val := reg[op & 0x0F00 >> 8];
                
                //fmt.println("BCD: val    :", val);

                mem[i+2] = val % 10;
                val /= 10;
                mem[i+1] = val % 10;
                val /= 10;
                mem[i+0] = val % 10;
                val /= 10;

                //fmt.println("BCD: hundres:", mem[i]);
                //fmt.println("BCD: tens   :", mem[i+1]);
                //fmt.println("BCD: ones   :", mem[i+2]);
            case 0x55:
                for index := 0; index <= int(op & 0x0F00 >> 8); index += 1 {
                    mem[i + u16(index)] = reg[index];
                }
            case 0x65:
                for index := 0; index <= int(op & 0x0F00 >> 8); index += 1 {
                    reg[index] = mem[i + u16(index)];
                }
            case:
                panic("invalid instruction");
            }
        case:
            panic("Invalid instruction");

    }    
}

chip_load_file :: proc(using c: ^Chip, path: string) {
    file, ok := os.read_entire_file(path);
    if !ok {
        fmt.panicf("Failed to open rom '%s'\n", path);
    }

    //TODO: Make sure image isnt to big
    copy(mem[0x200:], file);
}

disassemble_instruction :: proc(op: u16) -> string {
    using fmt;

    switch op & 0xF000 {
    case 0x0000:
        switch op {
        case 0x00E0:
            return tprintf("CLS");
        case 0x00EE:
            return tprintf("RET");
        case:
            return tprintf("SYS 0x%04X", op & 0x0FFF);
        }
    case 0x1000:
        return tprintf("JMP 0x%04X", op & 0x0FFF);
    case 0x2000:
        return tprintf("CALL 0x%04X", op & 0x0FFF);
    case 0x3000:
        return tprintf("SE V%X, 0x%02X", op & 0x0F00 >> 8, op & 0x00FF);
    case 0x4000:
        return tprintf("SNE V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
    case 0x5000:
        return tprintf("SE V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
    case 0x6000:
        return tprintf("LD V%X, 0x%02X", op & 0x0F00 >> 8, op & 0x00FF);
    case 0x7000:
        return tprintf("ADD V%X, 0x%02X", op & 0x0F00 >> 8, op & 0x00FF);
    case 0x8000:
        switch op & 0xF {
        case 0x0:
            return tprintf("LD V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x1:
            return tprintf("OR V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x2:
            return tprintf("AND V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x3:
            return tprintf("XOR V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x4:
            return tprintf("ADD V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x5:
            return tprintf("SUB V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x6:
            return tprintf("SHR V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0x7:
            return tprintf("SUBN V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        case 0xE:
            return tprintf("SHL V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
        }
    case 0x9000:
        return tprintf("SNE V%X, V%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4);
    case 0xA000:
        return tprintf("LD I, 0x%04X", op & 0x0FFF);
    case 0xB000:
        return tprintf("JMP V0, 0x%04X", op & 0x0FFF);
    case 0xC000:
        return tprintf("RND V%X, 0x%02X", op & 0x0F00 >> 8, op & 0x00FF);
    case 0xD000:
        return tprintf("DRAW V%X, V%X, 0x%X", op & 0x0F00 >> 8, op & 0x00F0 >> 4, op & 0xF);
    case 0xE000:
        switch op & 0xFF {
        case 0x9E:
            return tprintf("SKP V%X", op & 0x0F00 >> 8);
        case 0xA1:
            return tprintf("SKNP V%X", op & 0x0F00 >> 8);
        }
    case 0xF000:
        switch op & 0xFF {
        case 0x07:
            return tprintf("LD V%X, DT", op & 0x0F00 >> 8);
        case 0x0A:
            return tprintf("WAITKP V%X", op & 0x0F00 >> 8);
        case 0x15:
            return tprintf("LD DT, V%X", op & 0x0F00 >> 8);
        case 0x18:
            return tprintf("LD ST, V%X", op & 0x0F00 >> 8);
        case 0x1E:
            return tprintf("ADD I, V%X", op & 0x0F00 >> 8);
        case 0x29:
            return tprintf("SPR V%X", op & 0x0F00 >> 8);
        case 0x33:
            return tprintf("BCD V%X", op & 0x0F00 >> 8);
        case 0x55:
            return tprintf("SAVE V%X", op & 0x0F00 >> 8);
        case 0x65:
            return tprintf("LOAD V%X", op & 0x0F00 >> 8);
        }
    }

    return tprintf("0x%04X", op);
}

chip_print_state :: proc(using c: ^Chip) {
    fmt.printf("V0: 0x%02X, V1: 0x%02X, V2: 0x%02X, V3: 0x%02X\n", c.reg[0], c.reg[1], c.reg[2], c.reg[3]);
    fmt.printf("V4: 0x%02X, V5: 0x%02X, V6: 0x%02X, V7: 0x%02X\n", c.reg[4], c.reg[5], c.reg[6], c.reg[7]);
    fmt.printf("V8: 0x%02X, V9: 0x%02X, VA: 0x%02X, VB: 0x%02X\n", c.reg[8], c.reg[9], c.reg[0xA], c.reg[0xB]);
    fmt.printf("VC: 0x%02X, VD: 0x%02X, VE: 0x%02X, VF: 0x%02X\n", c.reg[0xC], c.reg[0xD], c.reg[0xE], c.reg[0xF]);
    fmt.println();
    op := (u16(c.mem[c.pc]) << 8) | u16(c.mem[c.pc + 1]);
    fmt.printf("PC: 0x%04X, OP: 0x%04X - %s\n", c.pc, op, disassemble_instruction(op));

    fmt.println();

    for i := 5; i > 0; i -= 1 {
        if pc >= 0 && pc <= 0xFFFF {
            pc := c.pc - u16(i) * 2;
            fmt.printf(" %04X: %s\n", pc, disassemble_instruction((u16(c.mem[pc]) << 8) | u16(c.mem[pc + 1])));
        }
    }

    fmt.printf(">%04X: %s\n", pc, disassemble_instruction(op));

    for i := 1; i < 5; i += 1 {
        if pc >= 0 && pc <= 0xFFFF {
            pc := c.pc + u16(i) * 2;
            fmt.printf(" %04X: %s\n", pc, disassemble_instruction((u16(c.mem[pc]) << 8) | u16(c.mem[pc + 1])));
        }
    }
}

init_sdl :: proc() -> (window: ^sdl.Window, renderer: ^sdl.Renderer, device: sdl.Audio_Device_Id) {
    sdl.init(.Everything);
    window = sdl.create_window("chip8", i32(sdl.Window_Pos.Undefined), i32(sdl.Window_Pos.Undefined), 64 * 15, 32 * 15, .Resizable);
    renderer = sdl.create_renderer(window, -1, .Accelerated);
    sdl.render_set_logical_size(renderer, 64, 32);

    counter := new(u64);
    want := sdl.Audio_Spec{
        freq = 44100,
        /*
        SDLs Audio_Format
             +----------------------sample is signed if set
             |
             |        +----------sample is bigendian if set
             |        |
             |        |           +--sample is float if set
             |        |           |
             |        |           |  +--sample bit size---+
             |        |           |  |                    |
            15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
        */
        // 16-bit signed little endian samples
        format = 0b1_00_0_000_0_00010000,
        channels = 1,
        samples = 512,
        userdata = counter,

        callback = proc "c" (userdata: rawptr, stream_in: ^u8, len: i32) {
            // This clearly demonstrate that there is something I dont fully understand about computer audio. 
            // Why is my square wave not actually 440hz >:(
            when false {
                f := 440.0;
                A := 0.1 * f64(max(i16));

                stream := coremem.slice_ptr(stream_in, auto_cast len);

                for i := 0; i < int(len)/2; i += 1 {
                    val := i16(A * math.sin((2.0 * math.PI * f * f64(i)) / f64(len/2)));
                    stream[i*2] = u8(val & 0xFF);
                    stream[i*2+1] = u8(u16(val) & 0xFF00 >> 8);
                }
            } else {
                // Square
                f := 440.0;
                HIGH := max(i16) / 4;
                LOW := min(i16) / 4;

                stream := coremem.slice_ptr(stream_in, auto_cast len);

                T := int(44100.0 / f);

                counter := cast(^u64) userdata;

                for i := 0; i < int(len)/2; i += 1 {
                    if counter^ == u64(T) {
                        counter^ = 0;
                    }
                    counter^ += 1;

                    val := counter^ >= u64(T)/2 ? HIGH : LOW;
                    stream[i*2] = u8(val & 0xFF);
                    stream[i*2+1] = u8(u16(val) & 0xFF00 >> 8);
                }
            }
        },
    };

    obtained: sdl.Audio_Spec;
    device = sdl.open_audio_device(nil, 0, &want, &obtained, 0);
    if device < 0 {
        fmt.println("failed to open audio\nSDL_Error:", sdl.get_error());
        fmt.println("want:", want);
        fmt.println();
        fmt.println("obtained:", obtained);
    }
    if want.format != obtained.format do panic("Invalid audio format, even though SDL said we would get one");

    return;
}

main :: proc() {
    window, renderer, device := init_sdl();

    c: Chip;
    chip_init(&c);
    //chip_load_file(&c, "test_opcode.ch8");
    //chip_load_file(&c, "programs/IBM Logo.ch8");
    chip_load_file(&c, "programs/PONG(1P).ch8");
    //chip_load_file(&c, "programs/Clock Program [Bill Fisher, 1981].ch8");
    //chip_load_file(&c, "programs/Jumping X and O [Harry Kleinberg, 1977].ch8");
    //chip_load_file(&c, "programs/Life [GV Samways, 1980].ch8");
    //chip_load_file(&c, "programs/Keypad Test [Hap, 2006].ch8");
    //chip_load_file(&c, "programs/15 Puzzle [Roger Ivie] (alt).ch8");
    //chip_load_file(&c, "programs/Breakout (Brix hack) [David Winter, 1997].ch8");
    //chip_load_file(&c, "programs/Tic-Tac-Toe [David Winter].ch8");
    //chip_load_file(&c, "programs/Brix [Andreas Gustafsson, 1990].ch8");
    //chip_load_file(&c, "programs/Lunar Lander (Udo Pernisz, 1979).ch8");
    //chip_load_file(&c, "programs/Minimal game [Revival Studios, 2007].ch8");
    //chip_load_file(&c, "programs/Random Number Test [Matthew Mikolay, 2010].ch8");
    //chip_load_file(&c, "programs/Delay Timer Test [Matthew Mikolay, 2010].ch8");

    set_op :: proc(offs: int, using c: ^Chip, op: u16) -> int {
        mem[offs]   = u8(op & 0xFF00 >> 8);
        mem[offs+1] = u8(op & 0x00FF);
        return offs + 2;
    }

    test_call_ret :: proc(c: ^Chip) {
        offset := 0x0200;
        // CALL 0x0400
        offset = set_op(offset, c, 0x2400);
        // JMP 0x0200
        offset = set_op(offset, c, 0x1200);

        offset = 0x0400;
        // ADD v2, 1
        offset = set_op(offset, c, 0x7201);
        // RET
        offset = set_op(offset, c, 0x00EE);
    }
    //test_call_ret(&c);

    //TODO: Step CPU on seperate thread, use SDL threads because they are portable
    //      Meh, we dont really need to
    //fmt.println("yay");
    //sdl.create_thread(proc "c" (data: rawptr) -> i32 {
    //    fmt.printf("context: %v\n", context.allocator);
    //    dummy_state := 0;
    //    fmt.printf("%d\n", dummy_state);
    //    for {
    //        chip_step(cast(^Chip) data);
    //        sdl.delay(2);
    //    }
    //    return 0;
    //}, "chip8 - CPU thread", &c);

    STEPPING :: false;

    Color :: struct{r, g, b, a: byte}
    BACKGROUND_COLOR := Color{ 80,  69, 155, 255};
    FOREGROUND_COLOR := Color{136, 126, 203, 255};

    step := false;
    if STEPPING do chip_print_state(&c);
    for {

        e: sdl.Event;
        for sdl.poll_event(&e) > 0 {
            switch e.type {
            case .Quit:
                //TODO: Confirmation
                os.exit(1);
            case .Key_Up:
                switch e.key.keysym.sym {
                case i32(sdl.SDLK_UP):
                    c.keypad[2] = false;
                case i32(sdl.SDLK_DOWN):
                    c.keypad[8] = false;
                case i32(sdl.SDLK_LEFT):
                    c.keypad[4] = false;
                case i32(sdl.SDLK_RIGHT):
                    c.keypad[6] = false;
                
                case sdl.SDLK_1:
                    c.keypad[1] = false;
                case sdl.SDLK_2:
                    c.keypad[2] = false;
                case sdl.SDLK_3:
                    c.keypad[3] = false;
                case sdl.SDLK_4:
                    c.keypad[0xC] = false;

                case sdl.SDLK_q:
                    c.keypad[4] = false;
                case sdl.SDLK_w:
                    c.keypad[5] = false;
                case sdl.SDLK_e:
                    c.keypad[6] = false;
                case sdl.SDLK_r:
                    c.keypad[0xD] = false;

                case sdl.SDLK_a:
                    c.keypad[7] = false;
                case sdl.SDLK_s:
                    c.keypad[8] = false;
                case sdl.SDLK_d:
                    c.keypad[9] = false;
                case sdl.SDLK_f:
                    c.keypad[0xE] = false;

                case sdl.SDLK_z:
                    c.keypad[0xA] = false;
                case sdl.SDLK_x:
                    c.keypad[0] = false;
                case sdl.SDLK_c:
                    c.keypad[0xB] = false;
                case sdl.SDLK_v:
                    c.keypad[0xF] = false;

                case sdl.SDLK_RETURN:
                    if STEPPING {
                        step = true;
                    }

                case i32(sdl.SDLK_F5):
                    c.pc = 0x200;
                }

            case .Key_Down:
                switch e.key.keysym.sym {
                case i32(sdl.SDLK_UP):
                    c.keypad[2] = true;
                case i32(sdl.SDLK_DOWN):
                    c.keypad[8] = true;
                case i32(sdl.SDLK_LEFT):
                    c.keypad[4] = true;
                case i32(sdl.SDLK_RIGHT):
                    c.keypad[6] = true;
                
                case sdl.SDLK_1:
                    c.keypad[1] = true;
                case sdl.SDLK_2:
                    c.keypad[2] = true;
                case sdl.SDLK_3:
                    c.keypad[3] = true;
                case sdl.SDLK_4:
                    c.keypad[0xC] = true;

                case sdl.SDLK_q:
                    c.keypad[4] = true;
                case sdl.SDLK_w:
                    c.keypad[5] = true;
                case sdl.SDLK_e:
                    c.keypad[6] = true;
                case sdl.SDLK_r:
                    c.keypad[0xD] = true;

                case sdl.SDLK_a:
                    c.keypad[7] = true;
                case sdl.SDLK_s:
                    c.keypad[8] = true;
                case sdl.SDLK_d:
                    c.keypad[9] = true;
                case sdl.SDLK_f:
                    c.keypad[0xE] = true;

                case sdl.SDLK_z:
                    c.keypad[0xA] = true;
                case sdl.SDLK_x:
                    c.keypad[0] = true;
                case sdl.SDLK_c:
                    c.keypad[0xB] = true;
                case sdl.SDLK_v:
                    c.keypad[0xF] = true;
                }
            }
        }

        sdl.set_render_draw_color(renderer, BACKGROUND_COLOR.r, BACKGROUND_COLOR.g, BACKGROUND_COLOR.b, BACKGROUND_COLOR.a);
        sdl.render_clear(renderer);

        sdl.set_render_draw_color(renderer, FOREGROUND_COLOR.r, FOREGROUND_COLOR.g, FOREGROUND_COLOR.b, FOREGROUND_COLOR.a);
        for y := 0; y < c.display_height; y += 1 {
            for x := 0; x < c.display_width; x += 1 {
                if u8(c.display[x+y*c.display_width]) > 0 {
                    sdl.render_draw_point(renderer, auto_cast x, auto_cast y);
                }
            }
        }

        if c.sound_timer > 0 {
            sdl.pause_audio_device(device, 0);
        } else if c.sound_timer == 0 {
            sdl.pause_audio_device(device, 0);
        }

        if !STEPPING do step = true;
        if step {
            step = false;
            op := (u16(c.mem[c.pc]) << 8) | u16(c.mem[c.pc + 1]);
            if !STEPPING do fmt.printf("pc: %04X, op: %04X, %s\n", c.pc, op, disassemble_instruction(op));
            chip_step(&c);
            if STEPPING do chip_print_state(&c);
            if !STEPPING do sdl.delay(1);
        }

        sdl.render_present(renderer);
    }
}

FONT := []u8 {
    0b11110000,
    0b10010000,
    0b10010000,
    0b10010000,
    0b11110000,

    0b00100000,
    0b01100000,
    0b00100000,
    0b00100000,
    0b01110000,

    0b11110000,
    0b00010000,
    0b11110000,
    0b10000000,
    0b11110000,

    0b11110000,
    0b00010000,
    0b11110000,
    0b00010000,
    0b11110000,

    0b10010000,
    0b10010000,
    0b11110000,
    0b00010000,
    0b00010000,

    0b11110000,
    0b10000000,
    0b11110000,
    0b00010000,
    0b11110000,

    0b11110000,
    0b10000000,
    0b11110000,
    0b10010000,
    0b11110000,

    0b11110000,
    0b00010000,
    0b00100000,
    0b01000000,
    0b01000000,

    0b11110000,
    0b10010000,
    0b11110000,
    0b10010000,
    0b11110000,

    0b11110000,
    0b10010000,
    0b11110000,
    0b00010000,
    0b11110000,

    0b11110000,
    0b10010000,
    0b11110000,
    0b10010000,
    0b10010000,

    0b11100000,
    0b10010000,
    0b11100000,
    0b10010000,
    0b11100000,

    0b11110000,
    0b10000000,
    0b10000000,
    0b10000000,
    0b11110000,

    0b11100000,
    0b10010000,
    0b10010000,
    0b10010000,
    0b11100000,

    0b11110000,
    0b10000000,
    0b11110000,
    0b10000000,
    0b11110000,

    0b11110000,
    0b10000000,
    0b11110000,
    0b10000000,
    0b10000000,
};