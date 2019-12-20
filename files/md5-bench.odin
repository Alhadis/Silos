import(
    fmt "fmt.odin";
    os "os.odin";
    md5 "../../md5.odin";
);

foreign_system_library "kernel32.lib";
foreign kernel32 {
    GetSystemTime :: proc(systime: ^_SYSTEMTIME) #cc_std #link_name "GetSystemTime" ---;
};

_SYSTEMTIME :: struct {
  wYear: u16,
  wMonth: u16,
  wDayOfWeek: u16,
  wDay: u16,
  wHour: u16,
  wMinute: u16,
  wSecond: u16,
  wMilliseconds: u16,
};


_md5_test :: struct {
    str, hash: string
}

run :: proc(testFile: string) {

    time := _SYSTEMTIME{};
    GetSystemTime(&time);
    fmt.printf("Start: %v\n", time);

    //NOTE IMPORTANT: md5-test.txt MUST use Unix line endings!
    file_cont, success := os.read_entire_file(testFile);

    if ! success {
        fmt.printf("Can't read file %s :(\n", testFile);
        return;
    }

    lines := 0;
    for char in file_cont {
        if char == ':' {
            lines++;
        }
    }

    tests := make([]_md5_test, lines);
    offset, index, testIndex := 0, 0, 0;
    for char in file_cont {
        //fmt.println(index);
        if char == ':' {
            word := make([]u8, index - offset);
            for b, i in file_cont[offset..<index] {
                word[i] = b;
            }
            offset = index + 1; //+1 for the :

            hash := make([]u8, 32);
            for b, i in file_cont[offset..<offset+32] {
                hash[i] = b;
            }

            offset += 32 + 1; //+1 for the \n

            tests[testIndex] = _md5_test{str = string(word), hash = string(hash)};
            testIndex++;

        }
        index++;
    }
    
    GetSystemTime(&time);
    fmt.printf("Read file: %v\n", time);
    
    test := tests[0];
    for i in 0..<1_000 {
        h := md5.hash([]u8(test.str));
        //fmt.printf("'%s' ('%s' == '%s'): %v\n", test.str, h, test.hash, h == test.hash);
        if test.hash != h {
            panic(test.str);
        }
    }

    GetSystemTime(&time);
    fmt.printf("Hashed: %v\n", time);
}

main :: proc() {
    INPUT_PATH :: "md5-test.txt";
    run(INPUT_PATH);
    
}
