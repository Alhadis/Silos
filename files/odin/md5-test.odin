import "core:fmt.odin";
import "core:os.odin";
import md5 "../../md5.odin";


_md5_test :: struct {
	str, hash: string
}

run :: proc(testFile: string) {
	//NOTE IMPORTANT: md5-test.txt MUST use Unix line endings!
	file_cont, success := os.read_entire_file(testFile);

	if ! success {
		fmt.printf("Can't read file %s :(\n", testFile);
		return;
	}

	lines := 0;
	for char in file_cont {
		if char == ':' {
			lines += 1;
		}
	}

	tests := make([]_md5_test, lines);
	offset, index, testIndex := 0, 0, 0;
	for char in file_cont {
		//fmt.println(index);
		if char == ':' {
			word := make([]u8, index - offset);
			for b, i in file_cont[offset..index] {
				word[i] = b;
			}
			offset = index + 1; //+1 for the :

			hash := make([]u8, 32);
			for b, i in file_cont[offset..offset+32] {
				hash[i] = b;
			}

			offset += 32 + 1; //+1 for the \n

			tests[testIndex] = _md5_test{str = string(word), hash = string(hash)};
			testIndex += 1;

		}
		index += 1;
	}
	
	
	for test in tests {
		h := md5.hash(([]u8)(test.str));
		fmt.printf("'%s' ('%s' == '%s'): %v\n", test.str, h, test.hash, h == test.hash);
		if test.hash != h {
			panic(test.str);
		}
	}
}

main :: proc() {
	INPUT_PATH :: "md5-test.txt";
	run(INPUT_PATH);
	
}
