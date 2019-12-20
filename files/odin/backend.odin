package sample

import "core:sys/win32"
import "core:fmt"

import d3d "odin-libs/d3d"

WIN_STYLE :: win32.WS_CLIPSIBLINGS | win32.WS_CLIPCHILDREN | win32.WS_CAPTION | 
	win32.WS_SYSMENU | win32.WS_MINIMIZEBOX | win32.WS_MAXIMIZEBOX | win32.WS_SIZEBOX;

WIN_EX_STYLE :: win32.WS_EX_APPWINDOW | win32.WS_EX_WINDOWEDGE;

wnd_proc :: proc "c" (hwnd: win32.Hwnd, msg_type: u32, wparam: win32.Wparam, lparam: win32.Lparam) -> win32.Lresult {
	using win32;
	switch(msg_type) {
		case WM_CLOSE:
			fallthrough;
		case WM_DESTROY:
			return 0;
		case WM_KEYDOWN:
			if wparam == VK_ESCAPE do post_quit_message(0);
			return 0;
		case:
			return  def_window_proc_a(hwnd, msg_type, wparam, lparam);
	}
	return 0;
}

@(private)
app_name :: "GfxTest";

@(private)
dx11State: struct {
	width: int,
	height: int,
	hwnd: win32.Hwnd,
	dev: ^d3d.ID3D11_Device,
	dev_ctx: ^d3d.ID3D11_Device_Context,
	swap_chain: ^d3d.IDXGI_Swap_Chain,
	render_target: ^d3d.ID3D11_Texture2D,
	render_target_view: ^d3d.ID3D11_Render_Target_View,
	depth_buffer: ^d3d.ID3D11_Texture2D,
	depth_stencil_view: ^d3d.ID3D11_Depth_Stencil_View,
	sampler_states: struct {
		default: ^d3d.ID3D11_Sampler_State,
	},
	rasterizer_states: struct {
		default_culling, no_culling, wireframe: ^d3d.ID3D11_Rasterizer_State,
	},
	blend_states: struct {
		alpha_enabled, alpha_disabled: ^d3d.ID3D11_Blend_State,
	}
};

d3d11_init :: proc (w, h, sample_count: int) {

	using win32;
	wnd_class := Wnd_Class_Ex_A {
		size = size_of(Wnd_Class_Ex_W),
		style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC,
		wnd_proc = wnd_proc,
		instance = get_module_handle_a(nil),
		cursor = load_cursor_a(nil, IDC_ARROW),
		icon = load_icon_a(nil, IDI_WINLOGO),
		sm = nil,
		class_name = app_name,
	};

	if(register_class_ex_a(&wnd_class) == 0) {
		fmt.println("Failed to register Wnd_Class_Ex_W");
		return;
	}

	assert(w < int(max(i32)));
	assert(h < int(max(i32)));
	rect := Rect {
		left = 0,
		top = 0,
		right = i32(w),
		bottom = i32(h),
	};

	adjust_window_rect_ex(&rect, WIN_STYLE, false, WIN_EX_STYLE);

	win_width := rect.right - rect.left;
	win_height := rect.bottom - rect.top;

	hwnd := create_window_ex_a(
		WIN_EX_STYLE,
		app_name,
		app_name,
		WIN_STYLE,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		win_width,
		win_height,
		nil,
		nil,
		get_module_handle_a(nil),
		nil,
	);

	assert(hwnd != nil);

	dx11State.width = w;
	dx11State.height = h;
	dx11State.hwnd = hwnd;

	using d3d;
	swap_chain_desc := DXGI_Swap_Chain_Desc {
		buffer_desc = {
			width = u32(w), height = u32(h),
			refresh_rate = {
				numerator = 60,
				denominator = 1,
			},
			format = DXGIFormat.R8G8B8A8_UNSIGNED_NORMALIZED,
			scaling = DXGIModeScaling.UNSPECIFIED,
			scanline_order = DXGIModeScanlineOrder.UNSPECIFIED,
		},
		output_window = hwnd,
		is_windowed = true,
		swap_effect = DXGISwapEffect.DISCARD,
		buffer_count = 1,
		sample_desc = {
			count = 1,
			quality = sample_count > 1 ? cast(u32)D3D11StandardMultiSampleQualityLevels.STANDARD_MULTISAMPLE_PATTERN : 0,
		},
		buffer_usage = DXGIUsage.RENDER_TARGET_OUTPUT,
		flags = 0,
	};

	feature_lvl := D3DFeatureLevel.ELEVEN_ZERO;
	ret_feature_lvl: D3DFeatureLevel;
	hr := create_dx11_device_and_swap_chain(nil, D3DDriverType.HARDWARE, nil,
		D3D11CreateDeviceFlag.DEBUG, &feature_lvl, 1, D3D11_SDK_VERSION,
		&swap_chain_desc, &dx11State.swap_chain, &dx11State.dev, &ret_feature_lvl, &dx11State.dev_ctx);
	assert(succeeded(hr) && dx11State.swap_chain != nil && dx11State.dev != nil && dx11State.dev_ctx != nil);


	d3d11_create_default_render_target(&swap_chain_desc);
	show_window(hwnd, SW_SHOW);
}

d3d11_create_default_render_target :: proc (swap_chain_desc: ^d3d.DXGI_Swap_Chain_Desc)
{
	using d3d;
	using win32;
	using dx11State; //global variable

	assert(swap_chain != nil);
	hr: Hresult;
	hr = swap_chain.get_buffer(swap_chain, 0, RIID_ID3D11_Texture2D, &render_target);
	assert(succeeded(hr) && render_target != nil);
	hr = dev.create_render_target_view(dev, cast(^ID3D11_Resource)render_target, nil, &render_target_view);
	assert(succeeded(hr) && render_target_view != nil);

	ds_desc := D3D11_Texture2D_Desc {
		width = swap_chain_desc.buffer_desc.width,
		height = swap_chain_desc.buffer_desc.height,
		mip_levels = 1,
		array_size = 1,
		format = DXGIFormat.D24_UNSIGNED_NORMALIZED_S8_UNSIGNED_INT,
		sample_desc = swap_chain_desc.sample_desc,
		usage = D3D11Usage.DEFAULT,
		bind_flags = D3D11BindFlag.DEPTH_STENCIL,
		cpu_access_flags = D3D11CPUAccessFlag.NONE,
		misc_flags = 0,
	};

	hr = dev.create_texture_2d(dev, &ds_desc, nil, &depth_buffer);
	assert(succeeded(hr) && depth_buffer != nil);

	using D3D11DepthStencilViewDimension;
	sample_count := swap_chain_desc.sample_desc.count;
	dsv_desc := D3D11_Depth_Stencil_View_Desc {
		format = ds_desc.format,
		view_dimension = sample_count > 1 ? TEXTURE2D_MULTI_SAMPLED : TEXTURE2D,
	};

	hr = dev.create_depth_stencil_view(dev, cast(^ID3D11_Resource)depth_buffer, 
		&dsv_desc, &depth_stencil_view);
	assert(succeeded(hr) && depth_stencil_view != nil);
}

d3d11_update_default_render_target :: proc (w, h: int) {
	using dx11State;
	if swap_chain != nil {
		d3d11_destroy_default_render_target();
		assert(w < int(max(u32)));
		assert(h < int(max(u32)));
		swap_chain.resize_buffers(swap_chain, 1, u32(w), u32(h), d3d.DXGIFormat.R8G8B8A8_UNSIGNED_NORMALIZED, 0);
		desc: d3d.DXGI_Swap_Chain_Desc;
		assert(win32.succeeded(swap_chain.get_desc(swap_chain, &desc)));
		d3d11_create_default_render_target(&desc);
	}
}

d3d11_present :: proc ()
{
	dx11State.swap_chain.present(dx11State.swap_chain, 1, 0);
	rect: win32.Rect;
	if win32.get_client_rect(dx11State.hwnd, &rect) {
		curr_width := cast(int)(rect.right - rect.left);
		curr_height := cast(int)(rect.bottom - rect.top);
		if (curr_width > 0 && curr_width != dx11State.width) && 
			(curr_height > 0 && curr_height != dx11State.height) {
				dx11State.width = curr_width;
				dx11State.height = curr_height;
				d3d11_update_default_render_target(curr_width, curr_height);
			}
	}
}

get_d3d11_device :: proc() -> ^d3d.ID3D11_Device {
	assert(dx11State.dev != nil);
	return dx11State.dev;
}

get_d3d11_device_context :: proc () -> ^d3d.ID3D11_Device_Context {
	assert(dx11State.dev_ctx != nil);
	return dx11State.dev_ctx;
}

get_d3d11_render_target_view :: proc () -> ^d3d.ID3D11_Render_Target_View {
	assert(dx11State.render_target_view != nil);
	return dx11State.render_target_view;
}

get_d3d11_depth_stencil_view :: proc () -> ^d3d.ID3D11_Depth_Stencil_View {
	assert(dx11State.depth_stencil_view != nil);
	return dx11State.depth_stencil_view;
}

d3d11_destroy_default_render_target :: proc ()
{
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.render_target);
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.render_target_view);
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.depth_buffer);
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.depth_stencil_view);
}

d3d11_width :: proc () -> int {
	return dx11State.width;
}

d3d11_height :: proc () -> int {
	return dx11State.height;
}

@(private)
d3d11_safe_destroy :: proc (d: ^win32.I_Unknown) {
	if d != nil { d.release(d); d = nil; }
}

d3d11_shutdown :: proc () {
	d3d11_destroy_default_render_target();
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.swap_chain);
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.dev_ctx);
	d3d11_safe_destroy(cast(^win32.I_Unknown)dx11State.dev);
	win32.destroy_window(dx11State.hwnd); dx11State.hwnd = nil;
	win32.unregister_class_a(app_name, win32.get_module_handle_a(nil));
}

