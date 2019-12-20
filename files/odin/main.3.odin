package maze

import "core:os"
import "core:strings"

main :: proc() {
    temp_input, _ := os.read_entire_file(os.args[1]);
    input := cast(string)temp_input;

    clean_output := clean(cast(string)temp_input);
    dot_splits := strings.split(clean_output, ".");   // Splitting the dots to get the individual parts

    sizex, sizey, startx, starty, endx, endy := get_header(dot_splits[0], dot_splits[1], dot_splits[2]);

    points := to_point(strings.split(dot_splits[3], "),"));
    grid := make([]bool, sizey * sizex);

    i := 0;

    for i in 0..<len(grid) {
        grid[i] = false;
    }

    for p in points {
        if (p.x != cast(u32)startx || p.x != cast(u32)starty ||
            p.y != cast(u32)endx || p.y != cast(u32)endy) {

            grid[p.y * cast(u32)sizex + p.x] = true;
            
            i += 1;
        }
    }

    came_from := astar(grid, sizex, sizey, Point{u32(startx), u32(starty)}, Point{u32(endx), u32(endy)});

    file, _ := os.open(os.args[2], os.O_WRONLY);
    os.write_string(file, visualize(input, &came_from));
}