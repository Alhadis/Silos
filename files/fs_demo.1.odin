import "zext:fs.odin";
import "core:fmt.odin";

main :: proc() {

	// TODO: Do any of these depend on the platform?
	//       These are only being tested on posix.

	assert(fs.base_name("/home/some_user/project/test.ts") == "test.ts");
	assert(fs.base_name("/home/some_user/project///") == "project");
	assert(fs.base_name("/home/some_user/Programming/project/a") == "a");
	assert(fs.parent_name("/home/some_user/project/test.ts") == "/home/some_user/project");
	assert(fs.parent_name("/home/some_user/project///") == "/home/some_user");
	assert(fs.parent_name("/home/some_user/Programming/project/a") == "/home/some_user/Programming/project");

	check_common_path :: (expected_str: string, expected_success: bool, paths: ...string) {
		// TODO: This is a hack that passes the string array to a function expecting string varargs.
		//       I need to implement a spread syntax at some point that does this automatically.
		p, s := (cast(proc([]string)->(string, bool))fs.common_path)(transmute([]string)paths);
		assert_str := fmt.aprintp("check_common_path failed on paths: {}\n", paths);
		defer free(assert_str);
		assert(p == expected_str && s == expected_success, assert_str);
	}

	check_common_path("/aaa", true,  "/aaa", "/aaa/bill", "/aaa/heck");
	check_common_path("/aaa", true,  "/aaa", "/aaa/heck");
	check_common_path("/",    true,  "/hello", "/tmp", "/test");
	check_common_path("phil", true,  "phil/todd/test", "phil/allison/heck", "phil");
	check_common_path("phil", true,  "phil/todd/test", "phil", "phil/allison/heck");
	check_common_path("/",    true,  "/taco", "/test", "/t");
	check_common_path("",     false, "/heck", "phil/heck");


	// Testing to_relative_raw but not to_relative because to_relative depends on the files actually existing.
	check_to_relative_raw :: (expected_str: string, expected_success: bool, a, b: string) {

		p, s := fs.to_relative_raw(a, b);
		assert_str := fmt.aprintp("check_to_relative_raw failed on paths: '{}', '{}'\n", a, b);
		defer free(assert_str);
		assert(p == expected_str && s == expected_success, assert_str);
	}

	check_to_relative_raw("heck",                          true,  "/aaa", "/aaa/heck");
	check_to_relative_raw("../tmp",                        true,  "/hello", "/tmp");
	check_to_relative_raw("../../allison/heck",            true,  "phil/todd/test", "phil/allison/heck");
	check_to_relative_raw("../../../../../allison/heck/a", true,  "phil/todd/test/thing/long/dirs", "phil/allison/heck/a");
	check_to_relative_raw("../test",                       true,  "/taco", "/test");
	check_to_relative_raw("",                              false, "/heck", "phil/heck");
	
	fmt.println("test passed");
}