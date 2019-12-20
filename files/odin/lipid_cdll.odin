package lipid_cdll

List :: struct(T: typeid) {
    head: ^Node(T),
    length: int,
}

// Most of the proc is COPIED⛓  from lipid_dll.
toList :: proc(s: ..$T) -> (result: List(T)) {
    if s == nil do return;

    result.length = len(s);
    address_of_previous_link := &result.head;
    previous, current: ^Node(T) = nil, nil;

    for e in s {
        address_of_previous_link^ = new(Node(T));
        current = address_of_previous_link^;
        current.value = e;
        current.previous = previous;
        previous = current;
        address_of_previous_link = &current.next;
    }
    
    current.next = result.head;
    result.head.previous = current;

    return;
}

print :: proc(l: List($T)) {
    n := l.head;
    for i := 0; i < l.length; i += 1 {
        if n.next == nil do print(n.value);
        else do printf("%v, ", n.value);
        n = n.next;
    }
}

// Entirely COPIED⛓ from lipid_dll.
insert :: proc(l: ^List($T), index: int, v: T) {
    assert(index >= 0 && index <= l.length, "Circular doubly linked list insert out of bounds.");

    link_to_current := &l.head;
    current := l.head;
    previous: ^Node(T) = nil;

    for i := 0; i != index; i += 1 {
        link_to_current = &current.next;
        previous = current;
        current = current.next;
    }

    link_to_current^ = new_clone(Node(T){v, previous, current});
    if link_to_current^.next != nil do link_to_current^.next.previous = link_to_current^;

    l.length += 1;
}

insertAfter :: proc(l: ^List($T), node: ^Node(T), value: T) -> ^Node(T) {
    new_node := new_clone(Node(T){value, node, node.next});
    node.next.previous = new_node;
    node.next = new_node;

    l.length += 1;
    return new_node;
}

append :: proc(l: ^List($T), v: T) {
    if l.head == nil {
        l.head = new(Node(T));
        l.head.previous, l.head.next = l.head, l.head;
        l.head.value = v;
    } else {
        new_node := new_clone(Node(T){v, l.head.previous, l.head});
        l.head.previous.next = new_node;
        l.head.previous = new_node;
    }

    l.length += 1;
}

clear :: proc(l: ^List($T)) {
    current := l.head;
    for i in 0..l.length-1 {
        next := current.next;
        free(current);
        current = next;
    }

    l.head = nil;
    l.length = 0;
}

toSlice :: proc(l: List($T)) -> []T {
    result := make([]T, l.length);

    current := l.head;
    for i in 0..l.length-1 {
        result[i] = current.value;
        current = current.next;
    }

    return result;
}