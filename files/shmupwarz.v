import vex
import emscripten


fn main() {
    println('Hello Sirius IV')


    mut shmup := create_shmup()

    if emscripten.is_enabled() == true {
        emscripten.set_main_loop_arg(main_loop, shmup, 60, 0)
    } else {
        for shmup.is_running() {
            shmup.update()
            shmup.render()
        }
        shmup.quit()
    }
}
fn main_loop(game mut Shmup) {
    game.update()
    game.render()
}




enum Actor {
    _background 
    _lives 
    _enemy1 
    _enemy2 
    _enemy3 
    _player 
    _bullet 
    _explosion 
    _bang 
    _hud
}

enum Category {
    _background 
    _bullet 
    _enemy 
    _explosion 
    _particle 
    _player
}

enum Effect {
    _pew 
    _smallasplode 
    _asplode
}

struct Health {
mut:
    current int
    maximum int
}

struct Tween {
mut:
    min f32
    max f32
    speed f32
    repeat bool
    active bool
}

struct Sprite {
mut:
    texture vex.Texture2D
    width int
    height int
}

struct Entity {
mut:
    id int
    name string
    active bool
    actor Actor
    category Category
    position vex.Vec2
    bounds C.SDL_Rect
    scale vex.Vec2
    sprite Sprite
    sound Effect
    tint vex.Vec3
    expires f32
    health Health
    tween Tween
    velocity vex.Vec2
}

struct Shmup {
mut:
    game &vex.Game
    bullets []vex.Vec2
    enemies1 []vex.Vec2
    enemies2 []vex.Vec2
    enemies3 []vex.Vec2
    explosions []vex.Vec2
    bangs []vex.Vec2
    particles []vex.Vec2
    entities []Entity
    player &Entity
}

pub fn create_shmup() *Shmup {
    return &Shmup{ 
            game: vex.create_game(vex.Config {
                title: 'Shmupwarz'
                width: 640
                height: 480
                major: 3
                minor: 0
                images: vex.IMG_INIT_PNG
            })
            bullets: []vex.Vec2
            enemies1: []vex.Vec2
            enemies2: []vex.Vec2
            enemies3: []vex.Vec2
            explosions: []vex.Vec2
            bangs: []vex.Vec2
            particles: []vex.Vec2
            entities: []Entity
    }
}

fn (s mut Shmup) update() {
    s.game.update()
}

fn (s mut Shmup) render() {
    s.game.render()
}

fn (s mut Shmup) is_running() bool {
    return s.game.is_running()
}

fn (s mut Shmup) quit() {
    s.game.quit()
}

