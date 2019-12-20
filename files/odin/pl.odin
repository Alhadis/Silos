package pl
import "core:os"
import "core:fmt"
import "core:sys/win32"
import "core:mem"


Image_Buffer :: struct {
	width: i32,
	height: i32,
	pitch: i32,
	data: ^byte
}


Win32_Buffer :: struct {
	bitmap_info: win32.Bitmap_Info,
	using buffer: Image_Buffer
}

Window :: struct {
	x: i32,
	y: i32,
	width: i32,
	height: i32,
	name: ^u8
}


Mouse :: struct {
	x: i32,
	y: i32,
	delta_x: i32,
	delta_y: i32,

	left: Keystate,
	right: Keystate
}

Keystate :: struct {
	isDown: bool,
	wasDown: bool
}

PL :: struct {
	running: bool,
	window: Window,
	mouse: Mouse,
	keys: [256]Keystate,
	frame_buffer: Image_Buffer, 
	error: ^byte,


	delta_time_seconds: f64,
	time_seconds: f64,

	//windows specific
	device_context: win32.Hdc,
	win32_window_handle: win32.Hwnd,
	bitmap_info: win32.Bitmap_Info,
	performance_counter_freq: i64,

}






init :: proc (pl: ^PL, title: cstring) -> int {
	res: int;
	when os.OS == "windows" {
		res = win32_init(pl, title);
	} else {
		fmt.println("PL: OPERATING SYSTEM NOT SUPPORTED");
		res = -1;
	}
	pl.running = true;
	return res;
}

win32_init :: proc (pl: ^PL, title: cstring) -> int {
	instance: win32.Hinstance = cast(win32.Hinstance) win32.get_module_handle_a(nil);

	wc: win32.Wnd_Class_Ex_A;
	wc.size = size_of(win32.Wnd_Class_Ex_A);
	wc.instance = instance;
	wc.wnd_proc = window_proc;
	wc.class_name = title;

	res: i16 = win32.register_class_ex_a(&wc);

	if(res == 0) {
		fmt.printf("Class was not registered correctly\n");
		os.exit(1);
	}

	style: u32 = win32.WS_CAPTION | win32.WS_SYSMENU | win32.WS_MINIMIZEBOX | win32.WS_VISIBLE;

	r: win32.Rect;
	r.right = cast(i32)pl.window.width;
	r.bottom = cast(i32)pl.window.height;
	win32.adjust_window_rect(&r, style, false);

	pl.win32_window_handle = win32.create_window_ex_a(
		0, 
		title, 
		title, 
		style,
		pl.window.x, pl.window.y, r.right - r.left, r.bottom - r.top,
		nil,
		nil,
		instance,
		nil
		);
	
	if (pl.win32_window_handle == nil) {
		fmt.printf("Window was not created successfully\n");
		os.exit(1);
	}

	pl.device_context = win32.get_dc(pl.win32_window_handle);
	win32.set_window_long_ptr_a(pl.win32_window_handle, win32.GWLP_USERDATA, cast(win32.Long_Ptr)uintptr(pl));


	//initialize buffer;
	bytes_per_pixel : i32 = 4;
	pl.bitmap_info.size = size_of(win32.Bitmap_Info_Header);
	pl.bitmap_info.width = pl.window.width;
	pl.bitmap_info.height = pl.window.height;
	pl.bitmap_info.planes = 1;
	pl.bitmap_info.bit_count = 32;
	pl.bitmap_info.compression = win32.BI_RGB;

	pl.frame_buffer.width = pl.window.width;
	pl.frame_buffer.height = pl.window.height;
	pl.frame_buffer.pitch = pl.window.width * bytes_per_pixel;
	pl.frame_buffer.data = cast(^byte)mem.alloc(int(pl.window.width * pl.window.height * bytes_per_pixel));
	pl.frame_buffer.data = cast(^byte)mem.set(pl.frame_buffer.data, 0, int(pl.window.width * pl.window.height * bytes_per_pixel));

	win32.show_window(pl.win32_window_handle, win32.SW_SHOW);

	win32.query_performance_frequency(&pl.performance_counter_freq);
	current_count: i64;
	win32.query_performance_counter(&current_count);
	pl.time_seconds = f64(current_count) / f64(pl.performance_counter_freq);

	//TODO: detect failure
	return 1;
}


window_proc :: proc "c" (hwnd: win32.Hwnd, uMsg: u32, wParam: win32.Wparam, lParam: win32.Lparam) -> win32.Lresult {
	pl: ^PL = cast(^PL)uintptr(win32.get_window_long_ptr_a(hwnd, win32.GWLP_USERDATA));
	switch uMsg {
		case win32.WM_DESTROY, win32.WM_QUIT:
			fmt.println("Quitting!!");
			pl.running = false;
		case win32.WM_MOUSEMOVE:
		 	pl.mouse.x = cast(i32)lParam & 0xffff;
			pl.mouse.y = cast(i32)(lParam >> 16);
		case win32.WM_KEYDOWN:
			pl.keys[0].isDown = true;
		case win32.WM_KEYUP:
			pl.keys[0].isDown = false;
		case win32.WM_LBUTTONDOWN:
			pl.mouse.left.isDown = true;
		case win32.WM_LBUTTONUP:
			pl.mouse.left.isDown = false;
	}

	return win32.def_window_proc_a(hwnd, uMsg, wParam, lParam);
}


push :: proc (pl: ^PL) {
	//push buffer to window
	when os.OS == "windows" {
		win32.stretch_dibits(
			pl.device_context,
			0, 0, pl.window.width, pl.window.height,
			0, 0, pl.frame_buffer.width, pl.frame_buffer.height,
			pl.frame_buffer.data, &(pl.bitmap_info),
			win32.DIB_RGB_COLORS, win32.SRCCOPY);
		win32.update_window(pl.win32_window_handle);
	}

}


pull :: proc (pl: ^PL) {

	oldmousex := pl.mouse.x;
	oldmousey := pl.mouse.y;

	pl.mouse.left.wasDown = pl.mouse.left.isDown;
	pl.mouse.right.wasDown = pl.mouse.left.isDown;

	for i in 0..<len(pl.keys) {
		pl.keys[i].wasDown = pl.keys[i].isDown;
	}

	message: win32.Msg;
	for ; win32.peek_message_a(&message, nil, 0, 0, win32.PM_REMOVE); {
    	win32.translate_message(&message);
   	 	win32.dispatch_message_a(&message);
	}

	pl.mouse.delta_x = pl.mouse.x - oldmousex;
	pl.mouse.delta_y = pl.mouse.y - oldmousey;



	ticks: i64;
	win32.query_performance_counter(&ticks);	
	now: f64 = f64(ticks) / f64(pl.performance_counter_freq);
	pl.delta_time_seconds = now - pl.time_seconds;
	pl.time_seconds = now;
}