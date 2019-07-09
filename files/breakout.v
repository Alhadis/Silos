// Copyright (c) 2019 Delyan Angelov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.

import rand
import time
import gx
import gl
import gg
import glfw
import math

const (
    MaxBricksX = 10
    MaxBricksY = 30
    BrickWidth = 80 // pixels
    BrickHeight = 20 // pixels
    WinWidth = BrickWidth * MaxBricksX
    WinHeight = BrickHeight * MaxBricksY
    TimerPeriod = 16
)

struct Moves {
mut:
    left bool
    right bool
}
struct Paddle {
mut:
    x int
    y int
    speed int
    maxspeed int
    size int // halfsize, from the center till the edges in pixels
    height int
    color gx.Color
    image u32
}

struct Ball {
mut:
    x int
    y int
    radius int
    dx int
    dy int
    color gx.Color
    image u32
}

struct Brick {
mut:
    x int
    y int
    color gx.Color
    image u32
}

struct Game {
mut:
    frames int
    fps int
    moves Moves
    bricks []Brick
    paddle Paddle
    ball Ball
    quit bool
    gg   *gg.GG
    textConfig gx.TextCfg
}

fn ptodo (s string) {
    println('TODO: $s')
}

fn (g mut Game) init_game() {
    rand.seed()
    g.init_bricks()
    g.textConfig = gx.TextCfg {   color: gx.White,   size: 18,   align: gx.ALIGN_LEFT,   }

    g.paddle.image = gg.create_image( 'assets/paddle.png' )
    g.paddle.color = gx.rgb(0, 127, 0)
    g.paddle.x = WinWidth / 2
    g.paddle.size = 40
    g.paddle.height = 15
    g.paddle.maxspeed = 5
    g.paddle.y = WinHeight - g.paddle.height

    g.ball.color = gx.rgb(255, 255, 0)
    g.ball.dx = 3
    g.ball.dy = 3
    g.ball.radius = 32
    g.ball.image = gg.create_image( 'assets/ball.png' )

    g.quit = false
}

fn (g mut Game) init_bricks() {
    ptodo('init_bricks')
}

fn (g mut Game) run() {
    for {
        g.frames++
        g.move_paddle()
        g.move_ball()
        g.delete_broken_bricks()
        //glfw.post_empty_event()
        if(g.quit) {
            break
        }
        time.sleep_ms(TimerPeriod)
    }
}

fn (g mut Game) move_paddle() {
    g.paddle.speed = 0
    if g.moves.left {
        g.paddle.speed = - g.paddle.maxspeed
    }
    if g.moves.right {
        g.paddle.speed =   g.paddle.maxspeed
    }
    g.paddle.x = g.paddle.x + g.paddle.speed
    if g.paddle.x - g.paddle.size < 0 {
        g.paddle.x = g.paddle.size
    }
    if g.paddle.x + g.paddle.size > WinWidth {
        g.paddle.x = WinWidth - g.paddle.size
    }
}
fn (g mut Game) move_ball() {
    g.ball.x += g.ball.dx
    g.ball.y += g.ball.dy
    if g.ball.x + g.ball.radius > WinWidth && g.ball.dx > 0 {
        g.ball.x = WinWidth - g.ball.radius
        g.ball.dx *= -1
    }
    if g.ball.x - g.ball.radius < 0 && g.ball.dx < 0 {
        g.ball.x = g.ball.radius
        g.ball.dx *= -1
    }
    if g.ball.y + g.ball.radius > WinHeight && g.ball.dy > 0 {
        println('Ball fell through. You died.')
        g.ball.y = 0
        g.ball.x = rand.next(WinWidth)
        //g.ball.y = WinHeight - g.ball.radius
        //g.ball.dy *= -1
    }
    if g.ball.y - g.ball.radius < 0 && g.ball.dy < 0 {
        g.ball.y = g.ball.radius
        g.ball.dy *= -1
    }

    if  g.ball.y + g.ball.radius > g.paddle.y &&
        iabs(g.ball.x - g.paddle.x) < g.paddle.size &&
        g.ball.dy > 0
    {
        if 1.0 * iabs(g.ball.x - g.paddle.x) > (0.6 * g.paddle.size) {
            println('paddle edge hit')
            g.ball.dx *= -1
        }else{
            println('paddle hit')
        }
        g.ball.y = g.paddle.y - g.ball.radius
        g.ball.dy *= -1
    }
    //g.ball.y += rand.next(4) - 2
    //g.ball.x += rand.next(4) - 2
}

fn iabs(a int) int {
    if a >= 0 {
        return a
    }
    return -a
}

fn (g mut Game) delete_broken_bricks() {
    //ptodo('delete_broken_bricks')
}

fn (g &Game) print_state() {
    mut old_frames := g.frames
    mut fps := 0
    for {
        if(g.quit){
            break
        }
        fps = g.frames - old_frames
        g.fps = fps
        old_frames = g.frames
        println(' frame: $g.frames | fps: $fps | game.ball: $g.ball.x $g.ball.y $g.ball.dx $g.ball.dy | game.paddle: $g.paddle.x $g.paddle.y')
        time.sleep_ms( 1000 )
    }
}

fn (g &Game) draw_paddle() {
    //g.gg.draw_rect( g.paddle.x - g.paddle.size, g.paddle.y, 2*g.paddle.size, g.paddle.height, g.paddle.color )
    g.gg.draw_image( g.paddle.x - g.paddle.size, g.paddle.y+g.paddle.height, 2*g.paddle.size, - g.paddle.height, g.paddle.image )
}

fn (g &Game) draw_ball() {
    //g.gg.draw_rect( g.ball.x-g.ball.radius, g.ball.y-g.ball.radius, 2*g.ball.radius, 2*g.ball.radius, g.ball.color )
    g.gg.draw_image( g.ball.x - g.ball.radius, g.ball.y+g.ball.radius, 2*g.ball.radius, -2*g.ball.radius, g.ball.image )
}

fn (g &Game) draw_bricks() {
    //ptodo('draw_bricks')
}

fn (g &Game) draw_brick(i int, j int) {
    //ptodo('draw_brick $i $j')
}

fn (g &Game) draw_stats() {
    g.gg.draw_text(3,3, 'fps: $g.fps', g.textConfig)
    g.gg.draw_text(3,20, 'f: $g.frames', g.textConfig)                            
}

fn (g &Game) draw_scene() {
    g.draw_bricks()
    g.draw_paddle()
    g.draw_ball()
    g.draw_stats()
}

const (
    KEY_UP = 0
    KEY_DOWN = 1
    KEY_REPEAT = 2
)
fn key_down(wnd voidptr, key int, code int, action, mods int) {
    if  action == KEY_DOWN {
        mut g := &Game(glfw.get_window_user_pointer(wnd))
        switch key {
        case glfw.KEY_ESCAPE:
            g.quit = true
        case glfw.KeyLeft:
            g.start_moving_paddle(true, false)
        case glfw.KeyRight:
            g.start_moving_paddle(false, true)
        case glfw.KeyUp:
            g.start_moving_paddle(false, false)
        }
        //println('key: $key | action: $action | mods: $mods')
    }
}

fn (g &Game) start_moving_paddle(le bool, ri bool) {
    g.moves.right = ri
    g.moves.left  = le
}

////////////////////////////////////////////////////////////

fn main() {
    g_ustring_runes = []int
    
    glfw.init()
    mut game := &Game{gg: 0}
    mut window := glfw.create_window(glfw.WinCfg {
        width: WinWidth
        height: WinHeight
        title: 'V Breakout'
        ptr: game
    })
    window.make_context_current()
    window.onkeydown(key_down)
    gg.init()
    game.gg = gg.new_context(gg.Cfg {
        width: WinWidth
        height: WinHeight
        use_ortho: true,
        font_size: 18,
    })

    game.init_game()
    go game.run()
    go game.print_state()

    for {
        if( window.should_close() || game.quit ) {
            break
        }
        gl.clear()
        gl.clear_color(0, 0, 0, 255)
        game.draw_scene()
        window.swap_buffers()
        glfw.poll_events()
        //glfw.wait_events()
    }

    println('Have a nice day.')
}
