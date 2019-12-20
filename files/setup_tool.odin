import "zext:str.odin";
import "zext:fs.odin";
import "zext:json.odin";
import "core:fmt.odin";
import "core:os.odin";
import "core:mem.odin";
import "core:raw.odin";

when ODIN_OS == "windows" {
	import "core:sys/windows.odin";
	_IN_HANDLE :: STD_INPUT_HANDLE;
	foreign __llvm_core {
		_fdopen :: proc(i32, ^u8) -> rawptr #cc_c #link_name "_fdopen" ---;
	}
} else {
	_IN_HANDLE := os.stdin;
	foreign __llvm_core {
		_fdopen :: proc(os.Handle, ^u8) -> rawptr #cc_c #link_name "fdopen" ---;
	}
}
_READ_CHAR : u8 = 'r';
_stdin_handle := _fdopen(_IN_HANDLE, &_READ_CHAR);

_getline :: proc() -> string {


	foreign __llvm_core {
		_c_getline :: proc(^^u8, ^i64, rawptr) -> i64  #cc_c #link_name "getline" ---;
	}

	str: ^u8 = nil;
	_l: i64 = 0;
	l: i64;
	defer os.heap_free(str);
	l = _c_getline(&str, &_l, _stdin_handle);
	if l < 2 do return transmute(string)(raw.String{nil, 0});
	c := make([]u8, l-1);
	copy(c, mem.slice_ptr(str, int(_l-1)));
	return string(c);
}

do_setup :: proc() {
	fmt.println(str.trim(`
Gungnir project setup tool

This will walk through the setup of a simple project.json file
It will only provide some basic defaults though. This doesn't handle every
option you could want. If you want to know every option available to you,
run 'gungnir help project.json' or go to http://gungnir.sh/docs

Press ^C to quit without saving.
`));
	fmt.println("---------------------------");
	fmt.print("Project name");
	cwd, ok := fs.cwd(); defer if ok do free(cwd);
	if ok {
		fmt.print(" (default: ");
		fmt.print(fs.base_name(cwd));
		fmt.print(")");
	}
	fmt.print(": ");
	_pn_resp := _getline(); // defer free(_pn_resp);
	project_name := str.trim(_pn_resp);
	if len(project_name) == 0 {
		if ok {
			free(_pn_resp);
			project_name = fs.base_name(cwd);
		} else {
			fmt.println("No project name specified. Aborting!");
			return;
		}
	}
	
	fmt.println("(You'll want to edit this one later in the JSON file)");
	fmt.print("Description (default: none): ");
	_desc_resp := _getline(); // defer free(_desc_resp);
	desc := str.trim(_desc_resp);
	
	fmt.print("Git repository (default: none): ");
	_repo_resp := _getline(); // defer free(_repo_resp);
	repo := str.trim(_repo_resp);

	fmt.print("License (default: proprietary): ");
	_license_resp := _getline(); // defer free(_license_resp);
	license := str.trim(_license_resp);
	if len(license) == 0 {
		license = "proprietary";
	}

	fmt.print("Entry point (default: src/app.odin): ");
	_entry_resp := _getline(); // defer free(_entry_resp);
	entry := str.trim(_entry_resp);
	if len(entry) == 0 {
		entry = "src/app.odin";
	}

	{ // Create entry point
		full_entry, err := fs.to_absolute_from_cwd(entry);
		defer if !err do free(full_entry);
		if !fs.exists(entry) {
			fs.mkdir(fs.parent_name(full_entry));
			fh, ok := fs.open(full_entry);
			fmt.println(ok);
			if ok {
				fs.write(fh, str.trim(`
import "core:fmt.odin";

main :: proc() {
	fmt.println("Hello world!");
}`));
				fs.close(fh);
			}
		}
	}
}