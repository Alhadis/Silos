package gfx

import glfw "deps/odin-glfw"
import gl "deps/odin-gl"
import "core:fmt"

Window :: struct {
  glfw_window: glfw.Window_Handle,
}

window_should_close :: proc (w: ^Window) -> bool {
  return glfw.window_should_close(w.glfw_window);
}

swap_buffers :: proc(w: ^Window) {
  glfw.swap_buffers(w.glfw_window);
}

poll_events :: proc() {
  glfw.poll_events();
}

clear_window :: proc(w: ^Window) {
  gl.Clear(gl.COLOR_BUFFER_BIT);
}

/** See input_constants.odin */
key_down :: proc(w: ^Window, key: int) -> bool {
  return glfw.get_key(w.glfw_window, cast(glfw.Key)key) == glfw.PRESS;
}

create_window :: proc (windowName: string) -> (w: Window) {
  assert(glfw.init());

  // Init window + GL context
  glfw.window_hint(glfw.CONTEXT_VERSION_MAJOR, 3);
  glfw.window_hint(glfw.CONTEXT_VERSION_MINOR, 3);
  glfw.window_hint(glfw.OPENGL_PROFILE, cast(int)glfw.OPENGL_CORE_PROFILE);
  w.glfw_window = glfw.create_window(800, 600, windowName, nil, nil);
  glfw.make_context_current(w.glfw_window);
  gl.load_up_to(3, 3, glfw.set_proc_address);
  gl.Enable(gl.BLEND);
  gl.BlendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
  gl.ClearColor(0.0, 0.0, 0.0, 1.0);

  return;
}
