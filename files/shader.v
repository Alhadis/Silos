module vex

#flag linux -lSDL2
#flag linux -lSDL2_ttf
#flag linux -lSDL2_mixer
#flag linux -lSDL2_image
#flag linux -lGLEW
#flag linux -lGL
#flag linux -I @VROOT/thirdparty/vex

#include "vex.h"

/**
 *
 */
struct Shader {
pub mut:
    id u32
}

/**
 * Shader::Use
 */
pub fn (s mut Shader) use() *Shader
{
    C.glUseProgram(s.id)
    return s
}

/**
 * Shader::checkCompileErrors
 */
fn (s mut Shader) check_compile_errors(object u32, typ string) 
{
    mut success := 0
    info_log := byteptr(malloc(1024))
    if typ == 'PROGRAM' {
        C.glGetShaderiv(object, GL_COMPILE_STATUS, &success)
        println('| ERROR::SHADER: Compile-time error: Type: $typ\n')
        println(tos(info_log, C.strlen(info_log)))
        println('-- --------------------------------------------------- --')
    } else {
        C.glGetShaderiv(object, GL_LINK_STATUS, &success)
        println('| ERROR::SHADER: Link-time error: Type: $typ\n')
        println(tos(info_log, C.strlen(info_log)))
        println('-- --------------------------------------------------- --')
    }
}

/**
 * Shader::Compile
 */
pub fn (s mut Shader) compile(vertex_source string, fragment_source string) 
{
    mut sVertex := u32(0)
    mut sFragment := u32(0)

    // Vertex Shader
    sVertex = C.glCreateShader(GL_VERTEX_SHADER)
    C.glShaderSource(sVertex, 1, &vertex_source, 0)
    C.glCompileShader(sVertex)
    s.check_compile_errors(sVertex, 'VERTEX')

    // Fragment Shader
    sFragment = C.glCreateShader(GL_FRAGMENT_SHADER)
    C.glShaderSource(sFragment, 1, &fragment_source, 0)
    C.glCompileShader(sFragment)
    s.check_compile_errors(sVertex, 'FRAGMENT')

    // Shader Program
    s.id = C.glCreateProgram()
    C.glAttachShader(s.id, sVertex)
    C.glAttachShader(s.id, sFragment)
    C.glLinkProgram(s.id)
    s.check_compile_errors(s.id, 'PROGRAM')
    // Delete the shaders as they're linked into our program now and no longer necessery
    C.glDeleteShader(sVertex)
    C.glDeleteShader(sFragment)
}

/**
 * Shader::SetFloat
 */
pub fn (s mut Shader) set_float(name string, value f32, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniform1f(C.glGetUniformLocation(s.id, &name), value)
}

/**
 * Shader::SetInteger
 */
pub fn (s mut Shader) set_integer(name string, value int, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniform1i(C.glGetUniformLocation(s.id, &name), value)
}

/**
 *
 */
pub fn (s mut Shader) set_float2(name string, x f32, y f32, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniform2f(C.glGetUniformLocation(s.id, &name), x, y)
}

/**
 *
 */
pub fn (s mut Shader) set_float3(name string, x f32, y f32, z f32, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniform3f(C.glGetUniformLocation(s.id, &name), x, y, z)
}

pub fn (s mut Shader) set_vector3(name string, v Vec3, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniform3f(C.glGetUniformLocation(s.id, &name), v.x, v.y, v.z)
}

/**
 *
 */
pub fn (s mut Shader) set_float4(name string, x f32, y f32, z f32, w f32, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniform4f(C.glGetUniformLocation(s.id, &name), x, y, z, w)
}

// pub fn (s mut Shader) set_vector4(name string, v Vec4, use_shader bool)
// {
//     if use_shader {
//         s.use()
//     }
//     C.glUniform4f(C.glGetUniformLocation(s.id, &name), v.x, v.y, v.z, v.w)
// }


/**
 *
 */
pub fn (s mut Shader) set_matrix(name string, mat Mat4, use_shader bool)
{
    if use_shader {
        s.use()
    }
    C.glUniformMatrix4fv(C.glGetUniformLocation(s.id, &name), 1, GL_FALSE, &mat.data)
}

