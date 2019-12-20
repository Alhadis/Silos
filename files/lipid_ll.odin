package lipid_ll

Node :: struct(T: typeid) {
    value: T, next: ^Node(T)
}

List :: struct(T: typeid) {
    head: ^Node(T),
    length: int,
}

print :: proc(l: List($T)) {
    n := l.head;
    for n != nil {
        if n.next == nil do print(n.value);
        else do printf("%v, ", n.value);
        n = n.next;
    }
}

toList :: proc(s: ..$T) -> (result: List(T)) {
    result.length = len(s);
    current := &result.head;

    for e in s {
        current^ = new(Node(T));
        current^.value = e;
        current = &current^.next;
    }

    return;
}

reverse :: proc(l: ^List($T)) {
    current := l.head;
    new_head, previous: ^Node(T);

    for current != nil {
        next := current.next;

        new_head = current;
        new_head.next = previous;

        previous = new_head;
        current = next;
    }

    l.head = new_head;
}

push :: proc(l: ^List($T), v: T) {
    l.head = new_clone(tNode(T){v, l.head});
    l.length += 1;
}

pop :: proc(l: ^List($T)) -> T {
    assert(l.head != nil, "Pop on empty Linked list.");

    old_head := l.head;
    old_value := old_head.value;
    l.head = old_head.next;
    free(old_head);

    l.length -= 1;

    return old_value;
}

insert :: proc(l: ^List($T), index: int, v: T) {
    assert(index >= 0 && index <= l.length, "Linked list insert out of bounds.");

    address_of_previous_link := &l.head;
    current := l.head;

    for i := 0; i != index; i += 1 {
        address_of_previous_link = &current.next;
        current = current.next;
    }

    address_of_previous_link^ = new_clone(Node(T){v, current});
    l.length += 1;
}

deleteIndex :: proc(l: ^List($T), index: int) {
    assert(index >= 0 && index < l.length, "Linked list deleteIndex out of bounds.");

    address_of_previous_link := &l.head;
    current := l.head;

    for i := 0; i != index; i += 1 {
        address_of_previous_link = &current.next;
        current = current.next;
    }

    address_of_previous_link^ = current.next;
    free(current);
    l.length -= 1;
}