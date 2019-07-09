/**
 * XNA like framework
 * 
 * Copyright (c) 2019 darkoverlordofdata MIT license
 */
 
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
 * SDL2 constants
 */
const (
    SDL_WINDOWPOS_CENTERED = 0
    SDL_WINDOW_OPENGL = 2
    SDL_WINDOW_SHOWN = 4
    SDL_INIT_TIMER = 0x00000001
    SDL_INIT_AUDIO = 0x00000010
    SDL_INIT_VIDEO = 0x00000020
    SDL_INIT_EVENTS = 0x00004000
    SDL_QUIT = 0x0100
    SDL_KEYDOWN = 0x0300
    SDL_KEYUP = 0x0301
    SDL_MOUSEMOTION = 0x0400
    SDL_MOUSEBUTTONDOWN = 0x0401
    SDL_MOUSEBUTTONUP = 0x0402
    SDL_GL_DEPTH_SIZE = 6
    SDL_GL_DOUBLEBUFFER = 0x0c32
    SDL_GL_CONTEXT_MAJOR_VERSION = 17
    SDL_GL_CONTEXT_MINOR_VERSION = 18
    IMG_INIT_PNG = 0x00000002
    SDLK_ESCAPE = 27
)

/**
 * OpenGL constants
 */
const (
    GL_FALSE =				             0
    GL_TRUE =					         1
    GL_CULL_FACE =                  0x0b44
    GL_BLEND =                      0x0be2
    GL_SRC_ALPHA =                  0x0302
    GL_ONE_MINUS_SRC_ALPHA =        0x0303
    GL_COLOR_BUFFER_BIT =           0x4000
    GL_DEPTH_BUFFER_BIT =           0x0100
    GL_STENCIL_BUFFER_BIT =         0x0400
    GL_TEXTURE_1D =                 0x0de0
    GL_TEXTURE_2D =                 0x0de1
    GL_TEXTURE_WRAP_S = 		    0x2802
    GL_TEXTURE_WRAP_T = 		    0x2803
    GL_TEXTURE_MAG_FILTER = 		0x2800
    GL_TEXTURE_MIN_FILTER = 		0x2801
    GL_RGB = 					    0x1907
    GL_RGBA	= 				        0x1908
    GL_REPEAT = 				    0x2901
    GL_LINEAR =				        0x2601
    GL_VERTEX_SHADER =              0x8b31
    GL_FRAGMENT_SHADER =            0x8b30
    GL_COMPILE_STATUS =             0x8b81
    GL_LINK_STATUS =                0x8b82
    GL_ARRAY_BUFFER =               0x8892
    GL_STATIC_DRAW =                0x88e4
    GL_BYTE =					    0x1400
    GL_UNSIGNED_BYTE =			    0x1401
    GL_SHORT =				        0x1402
    GL_UNSIGNED_SHORT =			    0x1403
    GL_INT =					    0x1404
    GL_UNSIGNED_INT =				0x1405
    GL_FLOAT =				        0x1406
    GL_2_BYTES =				    0x1407
    GL_3_BYTES =				    0x1408
    GL_4_BYTES =				    0x1409
    GL_DOUBLE =				        0x140a
    GL_TEXTURE0	=			        0xb4c0
    GL_POINTS =				        0x0000
    GL_LINES =				        0x0001
    GL_LINE_LOOP =				    0x0002
    GL_LINE_STRIP =				    0x0003
    GL_TRIANGLES =				    0x0004
    GL_TRIANGLE_STRIP =			    0x0005
    GL_TRIANGLE_FAN =				0x0006
    GL_QUADS =				        0x0007
    GL_QUAD_STRIP =				    0x0008
    GL_POLYGON =				    0x0009


)

struct C.SDL_Rect 
{
    x int
    y int
    w int
    h int
}

struct C.SDL_Surface 
{
    flags u32
    format voidptr
    w int
    h int
    pitch int
    pixels voidptr
    userdata voidptr
    locked int
    lock_data voidptr
    clip_rect C.SDL_Rect
    map voidptr
    refcount int
}



/**
 *
 */
// struct Event 
// {
// pub:
//     typ u32
//     padding[52] byte
// }

