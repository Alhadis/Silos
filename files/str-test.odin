import "core:fmt.odin";
import str "../../str.odin";


run :: proc() {
	using fmt;

	printf("startsWith(\"abc\", u8('a')) = %v\n", str.startsWith("abc", u8('a')));
	printf("startsWith(\"abc\", u8('b')) = %v\n\n", str.startsWith("abc", u8('b')));
	
	printf("startsWith(\"abc\", \"ab\") = %v\n", str.startsWith("abc", "ab"));
	printf("startsWith(\"abc\", \"bc\") = %v\n\n", str.startsWith("abc", "bc"));
	

	printf("indexOf(\"abc\", u8('a')) = %v\n", str.indexOf("abc", u8('a')));
	printf("indexOf(\"abc\", u8('b')) = %v\n", str.indexOf("abc", u8('b')));
	printf("indexOf(\"abc\", u8('c')) = %v\n", str.indexOf("abc", u8('c')));
	printf("indexOf(\"abc\", u8('d')) = %v\n\n", str.indexOf("abc", u8('d')));
	
	printf("indexOf(\"abc\", \"ab\") = %v\n", str.indexOf("abc", "ab"));
	printf("indexOf(\"abc\", \"bc\") = %v\n", str.indexOf("abc", "bc"));
	printf("indexOf(\"abc\", \"de\") = %v\n", str.indexOf("abc", "de"));
	printf("indexOf(\"abc\", \"defdhfdg\") = %v\n", str.indexOf("abc", "defdhfdg"));
	printf("indexOf(\"ugknbfddgicrmopn\", \"cd\") = %v\n", str.indexOf("ugknbfddgicrmopn", "cd"));
	printf("indexOf(\"ugknbfddgicrmopn\", \"cr\") = %v\n\n", str.indexOf("ugknbfddgicrmopn", "cr"));

	printf("join([\"a\", \"b\", \"c\"], \",\") = '%v'\n", str.join([]string{"a","b","c"}, ","));
	printf("join([\"a\", \"b\", \"c\"],\" - \") = '%v'\n", str.join([]string{"a","b","c"}, " - "));
	printf("join([\"a\", \"b\", \"c\"],\"\") = '%v'\n\n", str.join([]string{"a","b","c"}, ""));

	printf("join([\"a\"], \",\") = '%v'\n", str.join([]string{"a"}, ","));
	printf("join([\"a\"], \" - \") = '%v'\n", str.join([]string{"a"}, " - "));
	printf("join([\"a\"], \"\") = '%v'\n\n", str.join([]string{"a"}, ""));

	printf("join([\"\"], \",\") = '%v'\n", str.join([]string{""}, ","));
	printf("join([\"\"], \" - \") = '%v'\n", str.join([]string{""}, " - "));
	printf("join([\"\"], \"\") = '%v'\n\n", str.join([]string{""}, ""));

	printf("join([], \",\") = '%v'\n", str.join([]string{}, ","));
	printf("join([], \" - \") = '%v'\n", str.join([]string{}, " - "));
	printf("join([], \"\") = '%v'\n\n", str.join([]string{}, ""));

}

main :: proc() {
	run();
};
