using import "core:math.odin"
import "core:fmt.odin"

using import "basic.odin"
using import "entity.odin"
using import "render.odin"

GRID_SIZE_X :: 30;
GRID_SIZE_Y :: 30;
CELL_SIZE := 200;

grid := [GRID_SIZE_X][GRID_SIZE_Y]Cell{};

Cell :: struct {
	entities : [dynamic]int
}

update_collision :: proc() -> bool {
	grid = [GRID_SIZE_X][GRID_SIZE_Y]Cell{};

	for e in gameObjects {
		if !e.collide do continue;
		add_entity(get_grid_coords(e), e.id);
	}

	return true;
}

get_bounding_box :: proc(e : GameObject) -> (Vec2, Vec2) {
	return e.transform.position - (e.transform.size/2), e.transform.position + (e.transform.size/2);
}

is_inside :: inline proc(point: Vec2, min, max: Vec2) -> bool {
	return point.x < max.x
		&& point.x > min.x
		&& point.y < max.y
		&& point.y > min.y;
}

get_grid_coords :: proc(e : GameObject) -> (Vec2, Vec2) {

	entityMin := Vec2{e.transform.position.x, e.transform.position.y};
	entityMax := Vec2{e.transform.position.x + e.transform.size.x, e.transform.position.y + e.transform.size.y};

	minX : f32 = (entityMin.x / cast(f32)CELL_SIZE) - (cast(f32)GRID_SIZE_X / 2.0);
	minY : f32 = (entityMin.y / cast(f32)CELL_SIZE) - (cast(f32)GRID_SIZE_Y / 2.0);
	maxX : f32 = (entityMax.x / cast(f32)CELL_SIZE) - (cast(f32)GRID_SIZE_X / 2.0);
	maxY : f32 = (entityMax.y / cast(f32)CELL_SIZE) - (cast(f32)GRID_SIZE_Y / 2.0);

	return Vec2{minX, minY}, Vec2{maxX, maxY};
}

add_entity :: proc(min, max : Vec2, id : int) {

	add :: proc(x,y,id : int) -> bool {
		if x < 0 || y < 0 || x >= len(&grid) || y >= len(&grid[x]) do return false;

		current := grid[x][y];

		if current.entities == nil {
			grid[x][y] = Cell{
				make([dynamic]int, 0, 10)
			};
		}

		append(&current.entities, id);
		grid[x][y] = current;

		return true;
	}
	
	if (cast(int)min.x == cast(int)max.x && cast(int)min.y == cast(int)max.y) {
		add(
			cast(int)min.x + (GRID_SIZE_X/2),
			cast(int)min.y + (GRID_SIZE_Y/2), id);
		return;
	}

	for x in cast(int)min.x..cast(int)max.x {
		for y in cast(int)min.y..cast(int)max.y {
			if !add(
				cast(int)min.x + (GRID_SIZE_X/2),
				cast(int)min.y + (GRID_SIZE_Y/2), id) do continue;
		}
	}
}

test_move :: proc(entity : GameObject, targetPos : Vec2, ignore : ...int) -> bool {
	gridMin, gridMax := get_grid_coords(entity);

	test :: proc(entity : GameObject, targetPos : Vec2, x, y : int, ignore : ...int) -> bool {
		if x < 0 || y < 0 || x >= len(&grid) || y >= len(&grid[x]) do return false;

		cell := grid[x][y];

		if cell.entities == nil || len(&cell.entities) == 0 do return false;

		entityLoop: for other in cell.entities {
			if other == entity.id do continue;

			oe := get_entity(other);
			if oe == nil do continue;

			for ign in ignore {
				if oe.layer == ign do continue entityLoop;
			}
			
			hit := do_boxes_intersect(targetPos, entity.transform.size, oe.transform.position, oe.transform.size);

			if hit do return hit;
		}

		return false;
	}

	if (cast(int)gridMin.x == cast(int)gridMax.x && cast(int)gridMin.y == cast(int)gridMax.y) {
		return test(entity, targetPos, (cast(int)gridMin.x) + GRID_SIZE_X/2, (cast(int)gridMin.y) + GRID_SIZE_Y/2, ...ignore);
	}

	for x in cast(int)gridMin.x..cast(int)gridMax.x {
		for y in cast(int)gridMin.y..cast(int)gridMax.y {
			hit := test(entity, targetPos, x, y, ...ignore);
			if hit do return true;
		}
	}

	return false;
}


do_boxes_intersect :: proc(entityPos, entitySize : Vec2, otherPos, otherSize : Vec2) -> bool {
	return
	    entityPos.x < otherPos.x + otherSize.x &&
	    entityPos.x + entitySize.x > otherPos.x &&
	    entityPos.y < otherPos.y + otherSize.y &&
	    entityPos.y + entitySize.y > otherPos.y;
}
