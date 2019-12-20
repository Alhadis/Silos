package maze

push :: proc {
    push_q,
    push_pq,
    push_s,
};

pop :: proc {
    pop_q,
    pop_pq,
    pop_s,
};

cleanup :: proc {
    cleanup_q,
    cleanup_pq,
    cleanup_s,
};

push_q :: proc(_q: ^Queue($T), value: T) {
    q := _q;

    q.values[size] = value;
    q.size += 1;
}

push_pq :: proc(pq: ^Priority_Queue($R, $T), value: R, priority: T) {
    part1 := 0;
    part2 := len(pq.values);
    //fmt.print("Current size: ");
    //fmt.println(pq.size);
    if (pq.size > 0) {
        for {
            index := (part1 + part2) / 2;
            pq_heur := pq.priority[index];

            if (part1 != part2 && part1 != part2 - 1) {
                if (priority < pq_heur) {
                    part1 = index;
                }

                else if (priority > pq_heur) {
                    part2 = index;
                }

                else {
                    if (index != len(pq.values)) {
                        //fmt.println("Got here while parts are not together and index != len(pq.values)");
                        copy(pq.values[index + 1:], pq.values[index:]);
                        pq.values[index] = value;

                        copy(pq.priority[index + 1:], pq.priority[index:]);
                        pq.priority[index] = priority;
                        
                        break;
                    }

                    else {
                        //fmt.println("Got here while parts are not together and index does equal len(pq.values)");
                        append_elem(&pq.values, value);
                        append_elem(&pq.priority, priority);
                        
                        break;
                    }
                }
            }

            else {
                if (part2 != len(pq.values)) {
                    //fmt.println("Got here while parts are together and part2 != len(pq.values)");
                    copy(pq.values[part2 + 1:], pq.values[part2:]);
                    pq.values[part2] = value;

                    copy(pq.priority[part2 + 1:], pq.priority[part2:]);
                    pq.priority[part2] = priority;
                    
                    break;
                }

                else {
                    //fmt.println("Got here while parts are together and part2 does equal len(pq.values)");
                    append_elem(&pq.values, value);
                    append_elem(&pq.priority, priority);
                    
                    break;
                }
            }
        }
    }

    else {
        append_elem(&pq.values, value);
        append_elem(&pq.priority, priority);
        
        //fmt.println("Being initialized");
    }

    pq.size += 1;
}

push_s :: proc(s: ^Stack($T), value: T) {
    s.values[size] = value;
    s.size += 1;
}

pop_q :: proc(q: ^Queue($T)) -> T {
    q.size -= 1;
    val := q.values[0];
    copy(q.values[:], q.values[1:]);
    return val;
}

pop_pq :: proc(pq: ^Priority_Queue($R, $T)) -> (R, T) {
    val, heur := pq.values[0], pq.priority[0];
    copy(pq.values[:], pq.values[1:]);
    copy(pq.priority[:], pq.priority[1:]);
    pq.size -= 1;
    return val, heur;
}

pop_s :: proc(s: ^Stack($T)) -> T {
    s.size -= 1;
    return s.values[size];
}

cleanup_q :: proc(q: ^Queue($T)) {
    delete(q.values);
    free(q);
}

cleanup_pq :: proc(pq: ^Priority_Queue($R, $T)) {
    delete(pq.values);
    delete(pq.priority);
    free(pq);
}

cleanup_s :: proc(s: ^Stack($T)) {
    delete(s.values);
    free(s);
}

Priority_Queue :: struct(R, T: typeid) {
    values: [dynamic]R,
    priority: [dynamic]T,
    size: int,
}

Queue :: struct(T: typeid) {
    values: [dynamic]T,
    size: int,
}

Stack :: struct(T: typeid) {
    values: [dynamic]T,
    size: int,
}