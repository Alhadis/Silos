package maze

import "core:math"

// Gets the straight distance between two points
distance :: proc(curr, end: Point) -> f64 {

    // sqrt((x1 - x2)^2 + (y1 - y2)^2)
    // Accounts for byte underflow
    return math.sqrt(math.pow(cast(f64)(curr.x > end.x ? curr.x - end.x : end.x - curr.x), 2) +
                     math.pow(cast(f64)(curr.y > end.y ? curr.y - end.y : end.y - curr.y), 2));
}

// Returns the neighbors (in-bounds) of a specific Point
neighbors :: proc(p: Point,
                  sizex, sizey: int) -> [4]Point {

    return {Point{(p.x > 0 ? p.x - 1 : 0), p.y}, // Left (lower check)
            Point{p.x, (p.y > 0 ? p.y - 1 : 0)}, // Up   (lower check)
            Point{(p.x < cast(u32)sizex - 1 ? p.x + 1 : cast(u32)sizex - 1), p.y},  // Right (upper check)
            Point{p.x, (p.y < cast(u32)sizey - 1 ? p.y + 1 : cast(u32)sizey - 1)}}; // Down  (upper check)
}

// Checks if two points are equal
is_equal :: proc(curr, next: Point) -> bool {
    return curr.x == next.x && curr.y == next.y;
}

// Is it a bird? Is it a plane? No! It's astar
astar :: proc(grid: []bool,
              sizex, sizey: int,
              start, end: Point) -> map[u64]Point {

    // Initialize the "point_score_priority" priority queue
    point_score_priority := Priority_Queue(Point, f64) {make([dynamic]Point),
                                                        make([dynamic]f64),
                                                        0};

    // Push the start to the priority queue to begin with
    push(&point_score_priority, start, 0 - distance(start, end));

    // This is just a map of how you got to each individual point
    came_from := make(map[u64]Point);

    // This is a map of each hashed Point with its cost
    costs := make(map[u64]f64);

    // Loop until point_score_priority is exhausted or we've reached the end
    for {
        if (point_score_priority.size == 0) {
            break;
        }

        // Popping off the current Point and its cost
        curr, curr_cost := pop(&point_score_priority);

        // If we've reached the goal, return
        if (curr.x == end.x && curr.y == end.y) {
            cleanup(&point_score_priority);
            return came_from;
        }

        // Iterating through the 4 neighbors
        for next in neighbors(curr, sizex, sizey) {

            // If not the beginning and not blocked, proceed with calculating heuristic value
            if (!grid[next.y * u32(sizex) + next.x]) {

                // Getting overall cost for comparison. It's just an addition of curr_cost and the distance
                overall_cost := curr_cost - distance(curr, next);

                // Get the previous cost for comparison
                previous_cost := costs[hash_point(next)];

                // Checking for priority
                if (overall_cost <= previous_cost) {

                    // Make the bigger heuristic values smaller for priority
                    costs[hash_point(next)] = overall_cost;

                    // Making sure the next value is not already in came_from
                    if (!(hash_point(next) in came_from)) {
                        came_from[hash_point(next)] = curr;
                    }

                    // Push the new value to the priority queue
                    push(&point_score_priority, next, previous_cost - distance(next, end));
                }
            }
        }
    }

    cleanup(&point_score_priority);

    // This means something went horribly wrong
    // Should never return nil unless something in the grid is wrong
    return nil;
}