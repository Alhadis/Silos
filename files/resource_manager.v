module vex

import os

#flag linux -lSDL2
#flag linux -lSDL2_ttf
#flag linux -lSDL2_mixer
#flag linux -lSDL2_image
#flag linux -lGLEW
#flag linux -lGL
#flag linux -I @VROOT/thirdparty/vex

#include "vex.h"


/**
 * ResourceManager is assebled sort of screwy because some
 * array and map declarations don't compile inside of a module
 */
struct ResourceManager {
pub mut:
    shader_index map[string]int
    shader_data []Shader    
    texture_index map[string]int
    texture_data []Texture2D    
}
 
/**
 * CreateResourceManager
 */
pub fn create_resource_manager() *ResourceManager
{
    mut shaders := []Shader{}
    mut textures := []Texture2D{}

    mut r := &ResourceManager {
        shader_index: map[string]int{}
        shader_data: shaders
        texture_index: map[string]int{}
        texture_data: textures
    }
    return r
}

/**
 * ResourceManager::LoadShader
 */
pub fn (r mut ResourceManager) load_shader(vertex_file string, fragment_file string, name string) *Shader
{
    i := r.shader_data.len
    r.shader_data << Shader{ }
    r.shader_index[name] = i
    r.load_shader_from_file(vertex_file, fragment_file, mut r.shader_data[i])
    return &r.shader_data[i]
}

/**
 * ResourceManager::GetShader
 */
pub fn (r mut ResourceManager) get_shader(name string) *Shader
{
    i := r.shader_index[name]
    return &r.shader_data[i]
}
/**
 * ResourceManager::readShaderFile
 */
fn read_shader_file(path string) string
{
    content := os.read_file(path) or {
        return ''
    }
    return content
}

/**
 * ResourceManager::loadShaderFromFile
 */
fn (r mut ResourceManager) load_shader_from_file(vertex_file string, fragment_file string, shader mut Shader)
{
	if !os.file_exists(vertex_file) {
        println('vertex shader file not found: $vertex_file')
    }
    vertex_code := read_shader_file(vertex_file)
	if !os.file_exists(fragment_file) {
        println('vertex shader file not found: $fragment_file')
    }
    fragment_code := read_shader_file(fragment_file)
    shader.compile(vertex_code, fragment_code)

}

/**
 * ResourceManager::LoadTexture
 */
pub fn (r mut ResourceManager) load_texture(path string, alpha bool, name string) *Texture2D
{
    i := r.texture_data.len
    r.texture_data << Texture2D{ }
    r.texture_index[name] = i
    r.load_texture_from_file(path, alpha, mut r.texture_data[i])
    return &r.texture_data[i]

}

/**
 * ResourceManager::GetTexture
 */
pub fn (r mut ResourceManager) get_texture(name string) *Texture2D
{
    i := r.texture_index[name]
    return &r.texture_data[i]
}

/**
 * ResourceManager::loadTextureFromFile
 */
fn (r mut ResourceManager) load_texture_from_file(path string, alpha bool, texture mut Texture2D)
{
	if !os.file_exists(path) {
        println('texture file not found: $path')
    }
    texture.init(path)

    mut surface := &C.SDL_Surface{}
    surface = C.IMG_Load(path.str)
    if C.SDL_MUSTLOCK(surface) {
        C.SDL_LockSurface(surface)
    }
    texture.generate(surface.w, surface.h, surface.pixels)

    if C.SDL_MUSTLOCK(surface) {
        C.SDL_UnlockSurface(surface)
    }
    C.SDL_FreeSurface(surface)
}