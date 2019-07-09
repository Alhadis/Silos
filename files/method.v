struct Game {

pub mut:
    is_running bool 
} 

fn (g mut Game) start() {
	g.is_running = true
}

fn stop(g Game) Game {
	return {g | is_running:false }
}

fn main(){

    mut game := Game{}
    println(game.is_running)

    game.start()
    println(game.is_running)

    game = stop(game)
    println(game.is_running)

}