import "core:fmt.odin";
import "core:os.odin";
import "core:raw.odin";
import "zext:json.odin";
import "zext:fs.odin";
import "zext:child.odin";
import "zext:str.odin";

import "setup_tool.odin";

handle_message :: proc(msg: string) {
	fmt.println("Message:", msg);
}

Verb :: enum {
	build, update, run, init
}

App_State :: struct {

	action: Verb;
	should_exit: bool = false;

	using _ : struct #raw_union {
		build_info: struct {
			path: string;
		};
		update_info: struct {
			package: string;
		};
	};
}

parse_args :: proc() -> App_State #inline {

	state: App_State;

	if len(os.args) < 2 {
		state.action = Verb.build;
		ok: bool;
		state.build_info.path, ok = fs.to_absolute_from_cwd("project.json");
		if !ok {
			fmt.println("Failed to find your current working directory.");
			fmt.println("Gungnir can't work without that information.");
			fmt.println("Perhaps your permissions are messed up?");
			state.should_exit = true;
		} else if !fs.exists(state.build_info.path) {
			fmt.println("No parameters passed, and no project.json in the current directory.");
			fmt.println("Try", str.cat("`", os.args[0], " -h`"), "for usage information.");
			state.should_exit = true;
		}
		return state;
	}

	args := os.args[1..];

	odin_args_mode := false;

	for arg, i in args {
		if arg == "--" {
			odin_args_mode = true;
		} else if str.starts_with(arg, "--") { // Flag

		} else if arg == "init" {
			state.action = Verb.init;
			return state;
		} else {
			state.action = Verb.build;
			ok: bool;
			if str.ends_with(arg, ".json") {
				state.build_info.path, ok = fs.to_absolute_from_cwd(arg);
			} else {
				state.build_info.path, ok = fs.to_absolute_from_cwd(arg, "project.json");
			}
			if !ok {
				fmt.println("Failed to find your current working directory.");
				fmt.println("Gungnir can't work without that information.");
				fmt.println("Perhaps your permissions are messed up?");
				state.should_exit = true;
				return state;
			}
		}
	}

	//match 

	return state;
}

main :: proc() {

	state := parse_args();
	fmt.println(state.build_info.path);
	if state.should_exit {
		return;
	}
	match state.action {
		case Verb.build: {
			// Load JSON file.

			json_file, success := os.read_entire_file(state.build_info.path);
			if !success {
				fmt.println("Failed to read", fs.base_name(state.build_info.path));
				fmt.println("Perhaps you need to run `gungnir init`?");
			}
			data, err := json.parse(string(json_file));
			if err.code != json.Error_Code.NO_ERROR {
				fmt.print(fs.base_name(state.build_info.path)); fmt.print(':');
				fmt.print(err.y); fmt.print(','); fmt.print(err.x);
				fmt.println(" -", err.code);
				return;
			}
		}
		case Verb.init: setup_tool.do_setup(); return;
	}

	fmt.println(fs.to_absolute_from_cwd("/fds", "/home"));

/*
	//child.spawn(handle_message, "sh", "-c", "echo Hello; sleep 5; echo world!; echo done");

	fmt.println(fs.list_dir("/bad_path"));

	if len(os.args < 2) {

		if cwd, cwd_ok := fs.cwd(); cwd_ok {
			proj_file := str.cat(cwd, "/project.json");
		}
	fmt.println(cwd, "is dir? ", fs.is_dir(cwd));
	fmt.println(fs.list_dir(cwd));

	json_file, success := os.read_entire_file("project.json");
	data, err := json.parse(string(json_file));

	if err.code == json.Error_Code.NO_ERROR {

		fmt.println(json.write(data));
		json.free_value(data);
	} else {
		fmt.println("Failed to parse json.", err);
	}
	*/
}