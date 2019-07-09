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
struct Texture2D {
pub mut:
    id  u32
    width u32
    height u32
    internal_format u32
    image_format u32
    wrap_s u32
    wrap_t u32
    filter_min u32
    filter_mag u32
    path string
}


/**
 * Texture2D::Init
 */
pub fn(t mut Texture2D) init(path string) 
{
    t.path = path
    t.internal_format = u32(GL_RGB)
    t.image_format = u32(GL_RGB)
    t.wrap_s = u32(GL_REPEAT)
    t.wrap_t = u32(GL_REPEAT)
    t.filter_min = u32(GL_LINEAR)
    t.filter_mag = u32(GL_LINEAR)
    C.glGenTextures(1, &t.id)
}

/**
 * Texture2D::Generate
 */
pub fn(t mut Texture2D) generate(width int, height int, data voidptr)
{
    t.width = u32(width)
    t.height = u32(height)
    C.glBindTexture(GL_TEXTURE_2D, t.id)
    C.glTexImage2D(GL_TEXTURE_2D, 0, t.internal_format, width, height, 0, t.image_format, GL_UNSIGNED_BYTE, data)
    C.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, t.wrap_s)
    C.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, t.wrap_t)
    C.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, t.filter_min)
    C.glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, t.filter_mag)
    C.glBindTexture(GL_TEXTURE_2D, 0)
}

/**
 * Texture2D::Bind
 */
pub fn(t mut Texture2D) bind()
{
    C.glBindTexture(GL_TEXTURE_2D, t.id)
}

