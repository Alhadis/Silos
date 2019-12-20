using import "shared:odin-sdl2/sdl.odin"
using import "core:math.odin"
import "core:math/rand.odin"
import "core:fmt.odin"

DEBUG :: 1;
RAND : rand.Rand;

basic_init :: proc() {
	rand.init(&RAND);
}

// Math

atan2 :: proc(y, x : f32) -> f32{
	coeff_1 : f32 = math.PI / 4;
	coeff_2 : f32 = 3 * coeff_1;
	abs_y : f32 = abs(y);
	angle : f32;
	if x >= 0 {
		r : f32 = (x - abs(y)) / (x + abs(y));
		angle : f32 = coeff_1 - coeff_1 * r;
	} else {
		r : f32 = (x + abs_y) / (abs_y - x);
		angle : f32 = coeff_2 - coeff_1 * r;
	}

	if y<0 do return -angle;
	return angle;
}

mabs :: proc(i : f32) -> f32 {
	if i < 0 do return i * -1;
	return i;
}

atan2_approximation :: proc(y, x : f32) -> f32 {

    ONEQTR_PI : f32 = PI / 4.0;
	THRQTR_PI : f32 = 3.0 * PI / 4.0;
	r, angle : f32;
	abs_y : f32 = mabs(y) + 0.00000000001;
	if x < 0.0
	{
		r = (x + mabs(y)) / (mabs(y) - x);
		angle = THRQTR_PI;
	}
	else
	{
		r = (x - mabs(y)) / (x + mabs(y));
		angle = ONEQTR_PI;
	}
	angle += (0.1963 * r * r - 0.9817) * r;
	if ( y < 0.0 ) do return -angle;
	else do return angle;

}

random_point_on_circle :: proc(center : Vec2, rad : int) -> Vec2 {
	angle := PI * rand.float32(&RAND);

	x := sin(angle)*f32(rad);
	y := cos(angle)*f32(rad);

	return Vec2{x,y};
}

look_at_point :: proc(origin, target : Vec2) -> f32 {
	return 0.0;
}

// Arrays

ordered_remove :: proc(array: ^[dynamic]$T, index: int, loc := #caller_location) {
	__bounds_check_error_loc(loc, index, len(array));
	copy(array[index..], array[index+1..]);
	pop(array);
}

remove_by_index :: inline proc(array: ^[dynamic]$T, to_remove: int) {
    array[to_remove] = array[len(array)-1];
    pop(array);
}

inst :: inline proc(array: ^[dynamic]$T, item : T) -> ^T {
    length := append(array, item);
    return &array[length-1];
}


check_errors :: proc(location := #caller_location) {
    for {
        err := sdl.get_error();
        if err == "" {
            break;
        }        
        fmt.println("SDL ERROR", location, err);
    }
}

