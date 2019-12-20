import	file "../../file.odin";
import "core:fmt.odin";


run :: proc(testFile: string) {
	lines: []string;
	s: bool;

	lines, s = file.read_lines(testFile);
	defer free(lines);

	if !s {
		fmt.println(" :( ");
	}
	expected := []string{
		"",
		"a",
		" ",
		"b",
		"",
		"",
		"c",
		""
	};


	fmt.printf("Same length (%d == %d): %v\n", len(lines), len(expected), len(lines) == len(expected));	
	for line, i in lines {
		fmt.printf("#%d ", i);
		fmt.printf("'%s' == '%s' = %v\n", line, expected[i], line == expected[i]);
		assert(line == expected[i]);
	}
	
}

main :: proc() {
	run("file-test.txt");
}