package io_test

import "io"

import "core:os"
import "core:fmt"
import "core:log"
import "core:strings"
import win32 "core:sys/win32"

Lower_Case_Writer :: struct {
    using writer: io.Writer,
    input_writer: ^io.Writer,
}

lower_case_write_proc :: proc(using w: ^Lower_Case_Writer, data: []byte) -> (int, io.Error) {
    wrote := 0;

    for b in data {
        b := b;

        if b >= 0x41 && b <= 0x5A {
            b += 0x20;
        }

        n, err := io.write_byte(w.input_writer, b);
        wrote += n;
        if err != .Ok {
            return wrote, err;
        }
    }

    return wrote, .Ok;
};

make_lower_case_writer :: proc(input_writer: ^io.Writer) -> Lower_Case_Writer {
    lcw := Lower_Case_Writer{};
    lcw.write_proc = cast(type_of(lcw.write_proc)) lower_case_write_proc;
    lcw.input_writer = input_writer;

    return lcw;
}

parse_i64 :: proc(str: string, base:i64 = 10) -> i64 {
    _digit_value :: proc(r: rune) -> int {
    	ri := int(r);
    	v: int = 16;
    	switch r {
    	case '0'..'9': v = ri-'0';
    	case 'a'..'z': v = ri-'a'+10;
    	case 'A'..'Z': v = ri-'A'+10;
    	}
    	return v;
    }

	s := str;
	neg := false;
	if len(s) > 1 {
		switch s[0] {
		case '-':
			neg = true;
			s = s[1:];
		case '+':
			s = s[1:];
		}
	}

    base := base;
	if len(s) > 2 && s[0] == '0' {
		switch s[1] {
		case 'b': base =  2;  s = s[2:];
		case 'o': base =  8;  s = s[2:];
		case 'd': base = 10;  s = s[2:];
		case 'z': base = 12;  s = s[2:];
		case 'x': base = 16;  s = s[2:];
		}
	}


	value: i64;
	for r in s {
		if r == '_' {
			continue;
		}

		v := i64(_digit_value(r));
		if v >= base {
			break;
		}
		value *= base;
		value += v;
	}

	if neg do return -value;
	return value;
}


read_tar :: proc(reader: ^io.Reader) {
    Posix_Ustar_Header :: struct #packed {
    	name: [100]u8,
    	mode: [8]u8,
    	uid: [8]u8,
    	gid: [8]u8,
    	size: [12]u8,
    	mtime: [12]u8,
    	checksum: [8]u8,
    	typeflag: u8,
    	linkname: [100]u8,
    	magic: [6]u8,
    	version: [2]u8,
    	uname: [32]u8,
    	gname: [32]u8,
    	devmajor: [8]u8,
    	devminor: [8]u8,
    	prefix: [155]u8,
    	pad: [12]u8,
    };
    USTAR_MAGIC := [?]byte{'u', 's', 't', 'a', 'r', 0};

    loop:
    for {
        header, err := io.read_typeid(reader, Posix_Ustar_Header);
        if header.magic != USTAR_MAGIC {
            break loop;
        }

        size := parse_i64(string(header.size[:len(header.size)-1]), 8);
        fmt.printf("name: %s, size: %v\n", cstring(&header.name[0]), size);

        if size == 0 do continue;

        read_size := size;
        if read_size % 512 != 0 {
            read_size += (512 - (size % 512));
        }
        data := make([]u8, read_size);
        io.read(reader, data);
        delete(data);
    }
}

read_zip :: proc(reader: ^io.Reader) {
    LOCAL_FILE_MAGIC        :: 0x04034B50;
    END_MAGIC               :: 0x06054b50;

    Local_File_Header :: struct #packed {
    	//signature:          u32le,
    	minimum_version:    u16le,
    	flags:              u16le,
    	compression:        u16le,
    	last_mod_time:      u16le,
    	last_mod_date:      u16le,
    	crc32:              u32le,
    	compressed_size:    u32le,
    	uncompressed_size:  u32le,
    	name_length:        u16le,
    	extra_field_length: u16le,
    	// name:        [name_length]u8
    	// extra_field: [extra_field_length]u8
    };

    End_Of_Central_Record :: struct #packed {
    	//signature: u32le,
    	number_of_this_disk: u16le,
    	number_of_disk_with_start_of_central: u16le,
    	total_entries_on_this_disk: u16le,
    	total_entries: u16le,
    	size_of_central_dir: u32le,
    	offset_of_central: u32le,
    	zip_file_comment_length: u16le,
    	// zip_file_comment: [zip_file_comment_length]u8
    };

    loop:
    for {
        signature, err := io.read_u32le(reader);

        switch signature {
        case LOCAL_FILE_MAGIC:
            file, ferr := io.read_typeid(reader, Local_File_Header);

            buffer := make([]u8, file.name_length);
            n, err := io.read(reader, buffer);
            name := string(buffer);

            if name[len(name)-1] == '/' {
                fmt.printf("directory: %v\n", name);
            } else {
                fmt.printf("file: %v, size: %d\n", name, file.compressed_size);
            }

            data := make([]u8, file.compressed_size);
            io.read(reader, data);

            delete(name);
            delete(data);
        case END_MAGIC:
            break loop;
        case:
            fmt.printf("Unexpected signature 0x%04X\n", signature);
            break loop;
        }
    }
}

main :: proc() {
    context.logger = log.create_console_logger();

    Some_Struct :: struct {
        a: u8,
        b: u16,
        c: u32,
    };

    {
        fr, _ := io.open_file_reader("test.zip");
        defer io.close_file_reader(&fr);
        read_zip(&fr);
    }

    {
        fmt.println();fmt.println();
        fr, _ := io.open_file_reader("test.tar");
        defer io.close_file_reader(&fr);
        read_tar(&fr);
    }

    { // very basic writer example
        fw, _ := io.create_file("basic.txt");
        defer io.close_file_writer(&fw);

        io.write_any(&fw, Some_Struct{100, 2000, 20000000});
    }

    { // very basic reader example
        fmt.println();fmt.println();
        fr, _ := io.open_file_reader("basic.txt");
        defer io.close_file_reader(&fr);

        a, _ := io.read_typeid(&fr, Some_Struct);
        fmt.println(a);
    }

    {
        fmt.println();fmt.println();
        fw, _ := io.create_file("test.txt");
        defer io.close_file_writer(&fw);

        // Example of a wrapping writer
        lcw := make_lower_case_writer(&fw);

        log_writer := io.Writer {
            proc(writer: ^io.Writer, data: []byte) -> (int, io.Error) {
                fmt.printf("wrote %d bytes\n", len(data));
                return len(data), .Ok;
            }
        };

        w := io.make_multi_writer({&lcw, &log_writer, io.nil_writer()});
        defer io.delete_multi_writer(&w);

        a := Some_Struct{0x10, 0x2000, 0x40000000};
        fmt.printf("wrote: a.a: 0x%02X, a.b: 0x%04X, a.c: 0x%08X\n", expand_to_tuple(a));
        io.write_any(&w, a);

        t := "This is some data";
        io.write(&w, transmute([]u8) t);
        io.write_byte(&w, '\n');
        io.write_string(&w, "This is some more data\n");

        io.write_any(&w, "This is a string\n");
    }

    { // Append some more data
        fw, _ := io.open_file_writer("test.txt");
        defer io.close_file_writer(&fw);

        str := "'Appended string!'\n";
        n, err := io.write_string(&fw, str);
        if err != .Ok || n != len(str) {
            fmt.printf("Failed to write append string. Err %v\n", err);
        }
    }

    // win32.delete_file_a("test.txt");

    { // Reading a file 8 bytes at a time, using File_Reader
        fr, _ := io.open_file_reader("test.txt");
        //fr, _ := io.make_file_reader(os.Handle(0xFFFF_FFFF_FFFF_FFF6)); // win32 stdin
        defer io.close_file_reader(&fr);

        a, _ := io.read_typeid(&fr, Some_Struct);
        fmt.printf("read: a.a: 0x%02X, a.b: 0x%04X, a.c: 0x%08X\n", expand_to_tuple(a));

        data: [8]byte;
        for {
            n, err := io.read(&fr, data[:]);
            if err != .Ok {
                if err == .End_Of_Stream {
                    break;
                } else {
                    fmt.panicf("read err: %v\n", err);
                }
            }

            for i in 0..<len(data) {
                if i < n {
                    c := data[i];

                    switch c {
                    case ' '..'~':
                        // do nothing
                    case:
                        c = '.';
                    }
                    fmt.printf("%c", c);
                } else {
                    fmt.printf(" ");
                }
            }

            fmt.printf("    ");

            for i in 0..<len(data) {
                if i < n {
                    fmt.printf("%2X ", data[i]);
                }
            }

            fmt.println();
        }
    }
}
