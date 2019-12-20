package lipid_dll

Node :: struct(T: typeid) {
    value: T, previous, next: ^Node(T)
}

List :: struct(T: typeid) {
    head: ^Node(T),
    length: int,
}

toList :: proc(s: ..$T) -> (result: List(T)) {
    result.length = len(s);
    address_of_previous_link := &result.head;
    previous: ^Node(T) = nil;

    for e in s {
        address_of_previous_link^ = new(Node(T));
        current := address_of_previous_link^;
        current.value = e;
        current.previous = previous;
        previous = current;
        address_of_previous_link = &current.next;
    }
    
    return;
}

// Entirely COPIED⛓  from lipid_ll
print :: proc(l: List($T)) {
    n := l.head;
    for n != nil {
        if n.next == nil do print(n.value);
        else do printf("%v, ", n.value);
        n = n.next;
    }
}

// Mostly COPIED⛓  from lipid_ll
insert :: proc(l: ^List($T), index: int, v: T) {
    assert(index >= 0 && index <= l.length, "Doubly linked list insert out of bounds.");

    address_of_previous_link := &l.head;
    current := l.head;
    previous: ^Node(T) = nil;

    for i := 0; i != index; i += 1 {
        address_of_previous_link = &current.next;
        previous = current;
        current = current.next;
    }

    new_node := new_clone(Node(T){v, previous, current});
    if new_node.next != nil do new_node.next.previous = new_node;
    address_of_previous_link^ = new_node;
    l.length += 1;
}