Queue :: struct(Value: type) {
    values: []Value,
    start, stop: int,
    len, cap: int,
}

init :: proc(q: ^$T/Queue) {
    q.values = make([]T.Value, 32);
    q.start = 0;
    q.stop = 0;
    q.len = 0;
    q.cap = 32;
}

clear :: proc(q: ^$T/Queue) {
    start = 0;
    stop = 0;
    len = 0;
}

add :: proc(q: ^$T/Queue, el: T.Value) {
    
}

main :: proc() {
    test: Queue(int);
    init(&test);
    add(&test, 123);
}