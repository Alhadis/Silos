using import "shared:odin-sdl2/sdl.odin"
using import "core:math.odin"

NOW : int = cast(int)get_performance_counter();
LAST : int = 0;
deltaTime : int = 0;

update_physics :: proc() -> bool {
	LAST = NOW;
   	NOW = cast(int)get_performance_counter();
   	deltaTime = (NOW - LAST)*1000 / cast(int)get_performance_frequency();

   	return true;
}