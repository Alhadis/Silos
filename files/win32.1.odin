package main;
import "pl"



main_world: World;


main :: proc() {

	initialize_world(&main_world);
	pl_ctx: pl.PL;
	pl_ctx.window.x = 100;
	pl_ctx.window.y = 100;
	pl_ctx.window.width = 640;
	pl_ctx.window.height = 480;

	pl.init(&pl_ctx, "ray");

	//game loop
	for ; pl_ctx.running ; {
		pl.pull(&pl_ctx);

		
		update(&main_world, &pl_ctx);
		render(&main_world, &pl_ctx.frame_buffer);
		pl.push(&pl_ctx);
		
		//message loop

	}
}