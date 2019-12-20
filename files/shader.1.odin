package graphics

import mem "core:mem"
import "core:fmt"
import gl "shared:odin-gl"

//Shader :: struct {
//	vs, fs: u32
//	program: u32
//}

/*
get_cube_vertex_data :: proc() -> () {

	width := 1.0;
	height := 1.0;
	depth := 1.0;

	this.vertices = [
                // FRONT
                -(width/2.0),  -(height/2.0), this.depth/2, // left down
                -(this.width/2.0), (this.height/2.0), this.depth/2.0, // left top
                (this.width/2.0), (this.height/2.0), this.depth/2.0, // right top
                (this.width/2.0),  -(this.height/2.0), this.depth/2.0, // right down

                // BACK
                -(this.width/2.0),  -(this.height/2.0), -this.depth/2.0, // left down
                -(this.width/2.0), (this.height/2.0), -this.depth/2.0, // left top
                (this.width/2.0), (this.height/2.0), -this.depth/2.0, // right top
                (this.width/2.0),  -(this.height/2.0), -this.depth/2.0, // right down

                // LEFT
                -(this.width/2.0),  -(this.height/2.0), -this.depth/2.0, // left down
                -(this.width/2.0), (this.height/2.0), -this.depth/2.0, // left top
                -(this.width/2.0), (this.height/2.0), this.depth/2.0, // right top
                -(this.width/2.0),  -(this.height/2.0), this.depth/2.0, // right down

                // RIGHT
                (this.width/2.0),  -(this.height/2.0), -this.depth/2.0, // left down
                (this.width/2.0), (this.height/2.0), -this.depth/2.0, // left top
                (this.width/2.0), (this.height/2.0), this.depth/2.0, // right top
                (this.width/2.0),  -(this.height/2.0), this.depth/2.0, // right down

                // TOP
                -(this.width/2.0),  (this.height/2.0), this.depth/2.0, // left down
                -(this.width/2.0), (this.height/2.0), -this.depth/2.0, // left top
                (this.width/2.0), (this.height/2.0), -this.depth/2.0, // right top
                (this.width/2.0),  (this.height/2.0), this.depth/2.0, // right down

                // BOTTOM
                -(this.width/2.0),  -(this.height/2.0), this.depth/2.0, // left down
                -(this.width/2.0), -(this.height/2.0), -this.depth/2.0, // left top
                (this.width/2.0), -(this.height/2.0), -this.depth/2.0, // right top
                (this.width/2.0),  -(this.height/2.0), this.depth/2.0 // right down
            ]

            this.indices = [
                0, 1, 2,
                0, 2, 3,

                4, 5, 6, // + 4
                4, 6, 7,

                8, 9, 10,
                8, 10, 11,

                12, 13, 14,
                12, 14, 15,

                16, 17, 18,
                16, 18, 19,

                20, 21, 22,
                20, 22, 23,
            ]

            this.uv = [
                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0,

                0.0, 0.0,
                0.0, 1.0,
                1.0, 1.0,
                1.0, 0.0
            ]
}
*/

/*
use_shader :: proc(using s: ^Shader) {
	gl.UseProgram(program);
}

make_shader_from_strings :: proc(vs_text, fs_text: string) -> (Shader, bool) {

	using s: Shader;

	create_shader :: proc(shader_type: u32, src: string) -> (u32, bool) {
		
		shader := gl.CreateShader(shader_type);
		str := cast(^mem.Raw_String)(&src);
		gl.ShaderSource(shader, 1, cast(^^u8)&src, mem.raw_data([]i32{(cast(i32)str.len)}));
		gl.CompileShader(shader);

		ok := false;

		status: i32;
		gl.GetShaderiv(shader, gl.COMPILE_STATUS, &status);
		if status == gl.FALSE {
			info_buffer: [512]byte;
			ok = false;
			len: u32;
			//gl.GetShaderInfoLog(shader, info_buffer.count, &len, &info_buffer[0]);
			err_str: string;
			//err_str.data = &info_buffer[0];
			//err_str.count = cast(int)len;
			fmt.println(err_str);
		}

		return shader, ok;
	}

	vs, _ = create_shader(gl.VERTEX_SHADER, vs_text);
	fs, _ = create_shader(gl.FRAGMENT_SHADER, fs_text);

	program = gl.CreateProgram();
	gl.AttachShader(program, vs);
	gl.AttachShader(program, fs);
	gl.LinkProgram(program);
	
	return s, true;
}
*/

//Uniform_Type


/*
get_uniform_info :: proc() {
	std::map<std::string, uniform_info_t> uniforms;
	GLint uniform_count = 0;
	GLsizei length = 0, size = 0;
	GLenum type = GL_NONE;
	gl.GetProgramiv(program_name, GL_ACTIVE_UNIFORMS, &uniform_count);

	for (GLint i = 0; i < uniform_count; i++)
	{
		std::array<GLchar, 0xff> uniform_name = {};
		gl.GetActiveUniform(program_name, i, uniform_name.size(), &length, &size, &type, uniform_name.data());
		
		uniform_info_t uniform_info = {};
		uniform_info.location = gl.GetUniformLocation(program_name, uniform_name.data());
		uniform_info.count = size;
		
		uniforms.emplace(std::make_pair(std::string(uniform_name.data(), length), uniform_info));
	}
}
*/