module vex

#flag linux -lSDL2
#flag linux -lSDL2_ttf
#flag linux -lSDL2_mixer
#flag linux -lSDL2_image
#flag linux -lGLEW
#flag linux -lGL
#flag linux -I @VROOT/thirdparty/vex

#include "vex.h"

union Event 
{
    _type u32
    padding[56] byte
}

/**
 * Game Config
 */
struct Config 
{
    title string
    width int
    height int
    major int
    minor int
    images int
}

/**
 * Game
 */
struct Game {
pub mut:
	window voidptr
	title string
    width int
    height int
	x int
	y int
    running bool
    mouseX int
    mouseY int
    mouseDown bool
    delta double
    resource_manager *ResourceManager
    keys []int
}

/**
 * CreateGame
 */
pub fn create_game(cfg Config) *Game 
{
    if C.SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_TIMER | SDL_INIT_AUDIO) {
        println('Unable to Init SDL')
        return 0
    }

    C.SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, cfg.major)
    C.SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, cfg.minor)
    C.SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1)
    C.SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24)

    if C.IMG_Init(cfg.images) != cfg.images {
        println('Unable to Init image')
    }

    w := C.SDL_CreateWindow(cfg.title.str, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, cfg.width, cfg.height, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN)
    maincontext := C.SDL_GL_CreateContext(w)

    if w == 0 {
        println('Unable to create window')
    }
    
    C.vexInit()

    C.glViewport(0, 0, cfg.width, cfg.height)
    C.glEnable(GL_CULL_FACE)
    C.glEnable(GL_BLEND)
    C.glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

    return &Game{ window: w, title: cfg.title, running: true, keys: [0; 256],
        resource_manager: create_resource_manager()}

    // return g
}

/**
 * Game::ProcessEvents
 */
pub fn (g mut Game) process_event()
{
    event := Event{}
    mut key := 0

    for C.SDL_PollEvent(&event) != 0 {  
        switch event._type {
            case  u32(SDL_QUIT):
                g.running = false

            case u32(SDL_KEYDOWN):
                key = C.KeyboardSym(&event)
                if key >= 0 && key < 256 {
                    g.keys[key] = 1
                }

            case u32(SDL_KEYUP):
                key = C.KeyboardSym(&event)
                if key >= 0 && key < 256 {
                    g.keys[key] = 0
                }

            case u32(SDL_MOUSEMOTION):
                g.mouseX = C.MouseX(&event)
                g.mouseY = C.MouseY(&event)
            
            case u32(SDL_MOUSEBUTTONDOWN):
                g.mouseDown = true
                g.mouseX = C.ButtonX(&event)
                g.mouseY = C.ButtonY(&event)
            
            case u32(SDL_MOUSEBUTTONUP):
                g.mouseDown = false
                g.mouseX = C.ButtonX(&event)
                g.mouseY = C.ButtonY(&event)
        }
    }
} 

/**
 * Game::IsRunning
 */
pub fn (g mut Game) is_running() bool 
{
    g.process_event()
    if g.keys[SDLK_ESCAPE] == 1 {
        g.running = false
    }
    return g.running
}

/**
 * Game::Update
 */
pub fn (g mut Game) update()
{

}

/**
 * Game::Render
 */
pub fn (g mut Game) render()
{
    C.glClearColor(1.0, 0.0, 0.0, 1.0)
	C.glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT)

    C.SDL_GL_SwapWindow(g.window)
}

/**
 * Game::Quit
 */
pub fn (g mut Game) quit() 
{
    C.SDL_DestroyWindow(g.window)
	C.IMG_Quit()
    C.SDL_Quit()

}

