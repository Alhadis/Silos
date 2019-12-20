package maze

import "core:strings"
import "core:strconv"

Point :: struct {x, y: u32}

// Created by Tetralux. Thanks, Tetra!
hash_point :: proc(p: Point) -> u64 {
    return (u64(p.x) << 32) | u64(p.y);
}

// Get the header values from strings
get_header :: proc(size, start, end: string) -> (int, int, int, int, int, int) {
    size := strings.split(size, ",");            // Getting the first delimiter for size
    sizex := strconv.parse_int(size[0]);         // Getting the first value from the , delimiter then parsing it as an int
    sizey := strconv.parse_int(size[1]);         // Getting the second value from the , delimiter then parsing it as an int

    start_locat := strings.split(start, ",");    // Getting the second delimiter for location of the start flag
    startx := strconv.parse_int(start_locat[0]); // Getting the first value from the , delimiter then parsing it as an int
    starty := strconv.parse_int(start_locat[1]); // Getting the second value from the , delimiter then parsing it as an int

    end_locat := strings.split(end, ",");        // Getting the third delimiter for location of the end flag
    endx := strconv.parse_int(end_locat[0]);     // Getting the first value from the , delimiter then parsing it as an int
    endy := strconv.parse_int(end_locat[1]);     // Getting the second value from the , delimiter then parsing it as an int

    return sizex, sizey, startx, starty, endx, endy;
}

// Loads the visualized grid. Takes in a single string and builds the visual grid from it.
visualize :: proc(input: string, came_from: ^map[u64]Point) -> string {

    // Clean up the output or it'll cause errors
    clean_output := clean(input);

    // Splitting the dots to get the individual parts
    dot_splits := strings.split(clean_output, ".");

    // Parse header values
    sizex, sizey, startx, starty, endx, endy := get_header(dot_splits[0], dot_splits[1], dot_splits[2]);

    //
    // Header is now finished. Moving onto main grid
    //

    // Create char array equal to the size we should output. Disable sanitization on initialization
    output_arr := make([]rune, (sizey * 3 + 1) * (sizex * 3 + 1));

    // Sanitizing the array as it would default it to 0x00 if we hadn't disable it
    for i in 0..<sizey * 3 + 1 {
        for j in 0..<sizex * 3 + 1 {
            output_arr[(i * (sizex * 3 + 1)) + j] = ' ';
        }
    }

    // Iterating through the y values to add the grid #'s
    for i := 1; i <= sizex * 3 + 1; i += 3 {
        buffer: [3]byte;
        unloaded_int := strconv.itoa(buffer[:], i / 3); // Retrieve the true value of i, converting it into a string

        fullsize := len(unloaded_int) == 3;             // Getting the fullsize

        ival := fullsize ? i - 2 : i - 1;               // If fullsize (3), then subtract 2 instead of 1

        for j in ival..<len(unloaded_int) + ival {
            if (j != 0) {
                output_arr[j - 1] = cast(rune)unloaded_int[j - ival];  // Iterate through the values, updating the array with them
            }
        }
    }

    // Iterating through the x values to add the grid #'s
    for i := 1; i <= sizey * 3 + 1; i += 3 {
        buffer: [3]byte;
        unloaded_int := strconv.itoa(buffer[:], i / 3); // Retrieve the true value of i, converting it into a string

        fullsize := len(unloaded_int) == 3;             // Getting the fullsize

        ival := fullsize ? i - 2 : i - 1;               // If fullsize (3), then subtract 2 instead of 1

        for j in ival..<len(unloaded_int) + ival {
            if (j != 0) {
                output_arr[(sizex * 3 + 1) * (j - 1)] = cast(rune)unloaded_int[j - ival];  // Iterate through the values, updating the array with them
            }
        }
    }

    // Convert the points (4th dot split) into a point array
    points := to_point(strings.split(dot_splits[3], "),"));

    // Iterate through the entire array
    for y in 1..<sizey + 1 {
        for x in 1..<sizex + 1 {

            // Check to see if at start / end flag
            if ((x - 1 == startx && y - 1 == starty) || (x - 1 == endx && y - 1 == endy)) {

                // Since flags can't be walls, fill 3x3 with dots
                for suby in y * 3 - 2..<y * 3 + 1 {
                    for subx in x * 3 - 2..<x * 3 + 1 {
                        output_arr[(suby * (sizex * 3 + 1)) + subx] = '/';
                    }
                }

                // If at start flag, insert the S at the center
                if (x - 1 == startx && y - 1 == starty) {
                    output_arr[((y * 3 - 1) * (sizex * 3 + 1)) + (x * 3 - 1)] = 'S';
                }

                // If at end flag, insert the F at the center
                else {
                    output_arr[((y * 3 - 1) * (sizex * 3 + 1)) + (x * 3 - 1)] = 'F';
                }
            }

            // Runs if not at a flag
            else {

                // Load point
                test_point := Point{cast(u32)x - 1, cast(u32)y - 1};

                // Iterate through each of the points, checking if they match the test point
                for i in 0..<len(points) {
                    if (points[i].x == test_point.x && points[i].y == test_point.y) {

                        // If so, insert the # character in the 3x3 space
                        for suby in y * 3 - 2..<y * 3 + 1 {
                            for subx in x * 3 - 2..<x * 3 + 1 {
                                output_arr[(suby * (sizex * 3 + 1)) + subx] = '#';
                            }
                        }

                        // Break early since we've figured out it's in there
                        break;
                    }

                    // If it's not in the points array, insert a dot in the 3x3 space
                    else {
                        for suby in y * 3 - 2..<y * 3 + 1 {
                            for subx in x * 3 - 2..<x * 3 + 1 {
                                if (suby == y * 3 - 1 && subx == x * 3 - 1) {
                                    output_arr[(suby * (sizex * 3 + 1)) + subx] = '.';
                                }

                                else {
                                    output_arr[(suby * (sizex * 3 + 1)) + subx] = '.';
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Get the last current value so that we can backtrack through the steps the algorithm took
    curr := came_from[hash_point(Point{u32(endx), u32(endy)})];

    // Iterate through each block, setting the stepped-through areas to a 3x3 grid of `/` characters
    for {
        output_arr[(curr.y * 3 + 1) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 1)] = '/';
        output_arr[(curr.y * 3 + 1) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 2)] = '/';
        output_arr[(curr.y * 3 + 1) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 3)] = '/';

        output_arr[(curr.y * 3 + 2) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 1)] = '/';
        output_arr[(curr.y * 3 + 2) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 2)] = '/';
        output_arr[(curr.y * 3 + 2) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 3)] = '/';

        output_arr[(curr.y * 3 + 3) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 1)] = '/';
        output_arr[(curr.y * 3 + 3) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 2)] = '/';
        output_arr[(curr.y * 3 + 3) * (u32(sizex) * 3 + 1) + (curr.x * 3 + 3)] = '/';

        // Get the new current value by stepping to the Point this came from
        curr = came_from[hash_point(curr)];

        // If you've reached the starting point, then break
        if (is_equal(curr, Point{u32(startx), u32(starty)})) {
            break;
        }
    }

    output := strings.make_builder();

    // Iterate through, taking special care to do y, x and not x, y
    for y in 0..<sizey * 3 + 1 {
        for x in 0..<sizex * 3 + 1 {
            strings.write_rune(&output, output_arr[y * (sizex * 3 + 1) + x]);      
        }

        strings.write_rune(&output, '\n');
    }

    str_output := strings.to_string(output);
    return str_output;
}