package quad_tree

import "core:intrinsics"

REGION_SELF :: -1;
REGION_NE :: 0;
REGION_NW :: 1;
REGION_SW :: 2;
REGION_SE :: 3;

Rect :: struct(T: typeid) where intrinsics.type_is_numeric(T) {
    x, y, w, h: T
}

contains :: proc(a, b: Rect($T)) -> bool {
    return a.w > 0 && a.h > 0 && b.w > 0 && b.h > 0 &&
            b.x >= a.x && b.x + b.w <= a.x + a.w &&
            b.y >= a.y && b.y + b.h <= a.y + a.h;
}

Quad_Tree_Node :: struct(T: typeid, V: typeid) {
    zone: Rect(T),
    value: V
}

Quad_Tree :: struct(T: typeid, V: typeid) {
    nodes: [dynamic]Quad_Tree_Node(T, V),
    
    zone: Rect(T),
    level: int,
    
    regions: [4]^Quad_Tree(T, V),
    using_regions: bool,
    
    max_nodes: int,
    max_level: int
}

make_quad_tree :: proc(_zone: Rect($T), _level: int, $V: typeid, _max_nodes: int, _max_level: int) -> ^Quad_Tree(T, V) {
    using qt := new(Quad_Tree(T, V));
    
    nodes = make([dynamic]Quad_Tree_Node(T, V));

    zone = _zone;
    level = _level;

    max_nodes = _max_nodes;
    max_level = _max_level;
    
    return qt;
}

delete_quad_tree :: proc(using qt: ^Quad_Tree($T, $V)) {
    if nodes != nil do delete(nodes);
    if using_regions do for i in 0..<4 do delete_quad_tree(regions[i]);
    free(qt);
}

insert :: proc(using qt: ^Quad_Tree($T, $V), r: Rect(T), value: V) {
    region := find_region(qt, r, true);

    if region == REGION_SELF || level == max_level {
        append(&nodes, Quad_Tree_Node(T, V){r, value});
        return;
    } else {
        insert(regions[region], r, value);
    }

    if len(nodes) >= max_nodes && level < max_level {
        temp: [dynamic]Quad_Tree_Node(T, V);
        defer delete(temp);
        
        for node in nodes do append(&temp, node);
        
        clear(&nodes);

        for node in temp do insert(qt, node.zone, node.value);
    }
}

query :: proc(using qt: ^Quad_Tree($T, $V), r: Rect(T), output: ^[dynamic]Quad_Tree_Node(T, V)) {
    region := find_region(qt, r, false);

    for node in nodes do append(output, node);

    if region != REGION_SELF {
        query(regions[region], r, output);
    } else {
        query_all(qt, output);
    }
}

get_zones :: proc(using qt: ^Quad_Tree($T, $V), output: ^[dynamic]Rect(T)) {
    append(output, zone);
    if using_regions do for region in regions do get_zones(region, output);
}

query_all :: inline proc(using qt: ^Quad_Tree($T, $V), output: ^[dynamic]Quad_Tree_Node(T, V)) {
    _query_all(qt, output, true);
}

@private
_query_all :: proc(using qt: ^Quad_Tree($T, $V), output: ^[dynamic]Quad_Tree_Node(T, V), first: bool) {
    if using_regions do for i in 0..<4 do _query_all(regions[i], output, false);
    if !first do for node in nodes do append(output, node);
}

@private
find_region :: proc(using qt: ^Quad_Tree($T, $V), r: Rect(T), should_split: bool) -> int {
    region := REGION_SELF;

    if len(nodes) >= max_nodes && level < max_level {
        if !using_regions && should_split {
            split(qt);
        }

        if using_regions {
            if contains(regions[REGION_NW].zone, r) do region = REGION_NW;
            else if contains(regions[REGION_NE].zone, r) do region = REGION_NE;
            else if contains(regions[REGION_SW].zone, r) do region = REGION_SW;
            else if contains(regions[REGION_SE].zone, r) do region = REGION_SE;
        }
    }

    return region;
}

@private
split :: proc(using qt: ^Quad_Tree($T, $V)) {
    using_regions = true;

    nw := zone.w / 2;
    nh := zone.h / 2;
    nlevel := level + 1;

    regions[REGION_NW] = make_quad_tree(Rect(T){zone.x, zone.y + nh, nw, nh}, nlevel, V, max_nodes, max_level);
    regions[REGION_NE] = make_quad_tree(Rect(T){zone.x + nw, zone.y + nh, nw, nh}, nlevel, V, max_nodes, max_level);
    regions[REGION_SW] = make_quad_tree(Rect(T){zone.x, zone.y, nw, nh}, nlevel, V, max_nodes, max_level);
    regions[REGION_SE] = make_quad_tree(Rect(T){zone.x + nw, zone.y, nw, nh}, nlevel, V, max_nodes, max_level);
}