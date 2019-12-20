package geometry

using import "core:math"
using import "shared:lipid/lipid_math"

pointInAABB :: proc(point, bottom_left, size: Vec2) -> bool {
    return point.x >= bottom_left.x && point.x <= bottom_left.x + size.x &&
    point.y >= bottom_left.y && point.y <= bottom_left.y + size.y;
}

pointInUnorderedAABB :: proc(boxA, boxB, p: Vec2) -> bool {
    return (
        p.x <= max(boxA.x, boxB.x) && p.x >= min(boxA.x, boxB.x) &&
        p.y <= max(boxA.y, boxB.y) && p.y >= min(boxA.y, boxB.y)
    );
}

pointInUnorderedAABBWeak :: proc(boxA, boxB, p: Vec2) -> bool {
    return (
        p.x < max(boxA.x, boxB.x) && p.x > min(boxA.x, boxB.x) &&
        p.y < max(boxA.y, boxB.y) && p.y > min(boxA.y, boxB.y)
    );
}

Winding :: enum { Clockwise, CounterClockwise, Degenerate };

triangleWinding :: proc(a, b, c: Vec2) -> Winding {
    pd := perpdot(b - a, c - a);
    if pd == 0 do return Winding.Degenerate;
    else if pd > 0 do return Winding.CounterClockwise;
    else do return Winding.Clockwise;
}

polygonWinding :: proc(p: []Vec2) -> Winding {
    assert(len(p) > 2);
    low_right_i: int;
    low_right := p[0];

    for i in 1 .. len(p)-1 {
        if (
            p[i].y < low_right.y ||
            (p[i].y == low_right.y && p[i].x > low_right.x)
        ) {
            low_right_i = i;
            low_right = p[i];
        }
    }

    previous_i := wrap(low_right_i - 1, len(p));
    next_i := wrap(low_right_i + 1, len(p));
    return triangleWinding(p[previous_i], p[low_right_i], p[next_i]);
}

// Check if vector b points between a and c in clockwise order.
// True if b is aligned with a or c.
liesBetween :: proc(a, b, c: Vec2) -> bool {
    assert(a != Vec2{0, 0});
    assert(b != Vec2{0, 0});
    assert(c != Vec2{0, 0});
    if a == b || c == b do return true;

    pd_a, pd_c := perpdot(a, b), perpdot(c, b);

    if perpdot(c, a) >= 0 do return (pd_a <= 0 && pd_c >= 0);
    else do return (pd_a <= 0 || pd_c >= 0);
}

lineSegmentsIntersect :: proc(a0, a1, b0, b1: Vec2) -> bool {
    using Winding;

    w0 := triangleWinding(a0, a1, b0);
    w1 := triangleWinding(a0, a1, b1);
    w2 := triangleWinding(b0, b1, a0);
    w3 := triangleWinding(b0, b1, a1);

    if w0 != w1 && w2 != w3 do return true;

    if (w0 == Degenerate && pointInUnorderedAABB(a0, a1, b0)) ||
    (w1 == Degenerate && pointInUnorderedAABB(a0, a1, b1)) ||
    (w2 == Degenerate && pointInUnorderedAABB(b0, b1, a0)) ||
    (w3 == Degenerate && pointInUnorderedAABB(b0, b1, a1)) {
        return true;
    }

    return false;
}

// Weak test: endpoints aren't considered a part of the segment.
lineSegmentsIntersectWeak :: proc(a0, a1, b0, b1: Vec2) -> bool {
    if (a0 == b0 && a1 == b1) || (a0 == b1 && a1 == b0) do return true;
    using Winding;

    w0 := triangleWinding(a0, a1, b0);
    w1 := triangleWinding(a0, a1, b1);
    w2 := triangleWinding(b0, b1, a0);
    w3 := triangleWinding(b0, b1, a1);

    if w0 == Degenerate || w1 == Degenerate || w2 == Degenerate || w3 == Degenerate {
        if w0 == Degenerate && w1 == Degenerate {
            if (
                pointInUnorderedAABBWeak(a0, a1, b0) ||
                pointInUnorderedAABBWeak(a0, a1, b1) ||
                pointInUnorderedAABBWeak(b0, b1, a0)
            ) {
                return true;
            }
        }

        return false;
    }

    return w0 != w1 && w2 != w3;
}

circleIntersections :: proc(p0: Vec2, r0: f32, p1: Vec2, r1: f32) -> ([2]Vec2, int) {
    dist := distance(p0, p1);

    if dist > r0 + r1 || dist < abs(r0 - r1) do return [2]Vec2{}, 0;

    // Distance to the crossing of the line containing circle centers and
    // the line containing circle intersections.
    dist_to_crossing := ((r0*r0) - (r1*r1) + (dist*dist)) / (2 * dist);
    crossing := p0 + (p1 - p0) * (dist_to_crossing / dist);

    if dist_to_crossing == r0 do return [2]Vec2{crossing, Vec2{}}, 1;

    dist_crossing_to_intersection := sqrt(r0 * r0 - dist_to_crossing * dist_to_crossing);

    crossing_to_intersection := perp(p1 - p0) * dist_crossing_to_intersection / dist;

    return [2]Vec2{
        crossing + crossing_to_intersection,
        crossing - crossing_to_intersection
    }, 2;
}

circleLineSegmentIntersections :: proc(circle_p: Vec2, radius: f32, a, b: Vec2) -> ([2]Vec2, int) {
    dist := distanceToLine(circle_p, a, b);
    segment_len := distance(a, b);
    segment_vec := norm(b - a);

    if dist > radius do return [2]Vec2{}, 0;

    circle_projection, circle_t := projectPointOnLine(circle_p, a, b);

    if dist == radius {
        if nonDescending(f32(0), circle_t, f32(1)) {
            return [2]Vec2{circle_projection, Vec2{}}, 1;
        }
        else do return [2]Vec2{}, 0;
    }

    dist_proj_to_intersection := sqrt((radius * radius) - (dist * dist));

    int0_t := circle_t + dist_proj_to_intersection / segment_len;
    int1_t := circle_t - dist_proj_to_intersection / segment_len;

    if nonDescending(f32(0), int0_t, f32(1)) {
        int0 := lerp(a, b, int0_t);

        if nonDescending(f32(0), int1_t, f32(1)) {
            int1 := lerp(a, b, int1_t);
            return [2]Vec2{int0, int1}, 2;
        }
        else {
            return [2]Vec2{int0, Vec2{}}, 1;
        }
    }
    else if nonDescending(f32(0), int1_t, f32(1)) {
        int1 := lerp(a, b, int1_t);
        return [2]Vec2{int1, Vec2{}}, 1;
    }
    else {
        return [2]Vec2{}, 0;
    }
}

// Returns projection point and theta such that lerp(a, b, t) == projection.
projectPointOnLine :: proc(p, a, b: Vec2) -> (Vec2, f32) {
    a_to_b := b - a;
    dist := distance(a, b);
    t := dot(a_to_b, p - a) / (dist * dist);
    return a + a_to_b * t, t;
}

lineSegmentIntersection :: proc(a0, a1, b0, b1: Vec2) -> (Vec2, bool) {
    vec0 := a1 - a0;
    vec1 := b1 - b0;
    if cross(vec0, vec1) == 0 do return Vec2{}, false;

    t0 := cross(a0 - b0, vec1) / cross(vec1, vec0);
    t1 := cross(b0 - a0, vec0) / cross(vec0, vec1);

    if nonDescending(f32(0), t0, f32(1)) && nonDescending(f32(0), t1, f32(1)) {
        return a0 + vec0 * t0, true;
    }
    else do return Vec2{}, false;
}

// COPIED☠️  from lineSegmentIntersection.
lineSegmentIntersectionWeak :: proc(a0, a1, b0, b1: Vec2) -> (Vec2, bool) {
    vec0 := a1 - a0;
    vec1 := b1 - b0;
    if cross(vec0, vec1) == 0 do return Vec2{}, false;

    t0 := cross(a0 - b0, vec1) / cross(vec1, vec0);
    t1 := cross(b0 - a0, vec0) / cross(vec0, vec1);

    // Difference from copy: nonDescending -> ascending.
    if ascending(f32(0), t0, f32(1)) && ascending(f32(0), t1, f32(1)) {
        return a0 + vec0 * t0, true;
    }
    else do return Vec2{}, false;
}

// Area of simple polygon if its vertices are listed in counterclockwise order. Negative area otherwise.
signedArea :: proc(polygon: []Vec2) -> f32 {
    double_area: f32 = 0.0;
    for _, i in polygon {
        j := (i + 1) % len(polygon);
        a, b := polygon[i], polygon[j];
        double_area += (a.x - b.x) * (a.y + b.y);
    }
    return double_area / 2;
}

distanceToLine :: proc(point, a, b: Vec2) -> f32{
    line_normal := perp(norm(-b+a));
    return abs(dot(point - a, line_normal));
}

angleFromVec :: proc(v0, v1: Vec2) -> f32 {
    x := dot(v0, v1);
    y := cross(v0, v1);
    return approxAtan2(y, x);
}

angleFromXAxis :: proc(v: Vec2) -> f32 {
    return approxAtan2(v.y, v.x);
}

angle :: proc{angleFromXAxis, angleFromVec};
