package io

////////////////////
/// Multi Writer ///
////////////////////

// Implement a seperate error code for Multi_Writer that indicates that some error occured
// and then store that error next to the writer in a structur perhaps a little like this:
//
//  writers: [dynamic]struct{^Writer, Error}
//

Multi_Writer :: struct {
    using writer: Writer,
    writers: []^Writer,
}

multi_write_proc :: proc(using w: ^Multi_Writer, data: []byte) -> (int, Error) {
    for w in writers {
        l, err := w.write_proc(w, data);
        if err != .Ok {
            return l, err;
        }
    }

    return len(data), .Ok;
}

make_multi_writer :: proc(writers: []^Writer, allocator := context.allocator) -> Multi_Writer {
    mw := Multi_Writer{};
    mw.write_proc = cast(type_of(mw.write_proc)) multi_write_proc;
    mw.writers = make([]^Writer, len(writers), allocator);
    copy(mw.writers, writers);

    return mw;
}

delete_multi_writer :: proc(mw: ^Multi_Writer) {
    delete(mw.writers);
}
