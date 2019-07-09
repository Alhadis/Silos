//------------------------------------------------
// Balls Demonstraion
// only tested on V 0.1.8
//
// written by T.Ashitani
//------------------------------------------------

import time
import gx
import gl
import gg
import glfw

const (
    WinWidth = 640
    WinHeight = 480
    BallSize = 50
    WaitMsec = 10
    NumberOfBalls=10
    )

//------------------------------------------------
// Ball
//------------------------------------------------


struct Ball{
    size int
    mut:
    img u32
    x int
    y int
    vx f32
    vy f32
}

// update ball positions
fn (b mut Ball) update() {
    b.vy+=1
    b.x+=int(b.vx)
    b.y+=int(b.vy)

    if(b.y>WinHeight-BallSize){
        b.vy=-b.vy
        b.y=WinHeight-BallSize
    }
    if(b.x>WinWidth-BallSize){
        b.vx=-b.vx
        b.x=WinWidth-BallSize
    }
    if(b.x<0){
        b.vx=-b.vx
        b.x=0
    }
}

// initialize balls
fn create_balls(img u32, num int) []Ball{
    mut balls:=[]Ball

    rand.seed()
    mut i:=0
    for i<num {
        mut b:=Ball{
            BallSize, 
            img,
            rand.next(WinWidth-BallSize), // x
            200-rand.next(100),           // y
            f32(10-rand.next(20)),        // dx
            0.0                           // dy
        }
        balls << b
        i++
    }

    return balls
}

//------------------------------------------------
// Screen
//------------------------------------------------

struct Screen{
    mut:
        window *glfw.Window
        context *gg.GG
}

// init screen
fn (s mut Screen) init() {
    glfw.init()

    s.window = glfw.create_window(glfw.WinCfg {
        width: WinWidth
        height: WinHeight
        title: 'V GLFW test'
        ptr:0 // glfw user pointer
        })
    s.window.make_context_current()

    gg.init()

    s.context = gg.new_context(
        gg.Cfg {
            width: WinWidth
            height: WinHeight
            use_ortho: true // This is needed for 2D drawing
            })

    s.clear()// For some reason this is necessary to avoid an intial flickering

}

// clear screen
fn (s mut Screen) clear() {
    gl.clear()
    gl.clear_color(255, 255, 255, 255)
}

// draw single ball
fn (s mut Screen) draw(b Ball) {
    s.context.draw_image(b.x,b.y,b.size,b.size,b.img)
}

// update screen
fn (s mut Screen) update() {
    s.window.swap_buffers()
    time.sleep_ms(10)

    glfw.poll_events()
    if s.window.should_close() {
        s.window.destroy()
        glfw.terminate()
        exit(0)
    }
}


//------------------------------------------------
// Main
//------------------------------------------------

fn main() {

    mut s:=Screen{}
    s.init()

    img := gg.create_image('circle.png')
    mut balls:=create_balls(img,NumberOfBalls)

    for {
        s.clear()

        for i,b in balls{
            s.draw(b)
            balls[i].update()
        }
        s.update()
    }

}

