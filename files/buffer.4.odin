import "core:fmt.odin"
import "core:strings.odin"
import "core:utf8.odin"
import "core:os.odin"

// Gap buuffer
// pre  - start of gap
// post - end of gap
// pre therefore doubles as the insert position
Buffer :: struct {
    data: []rune,
    name: string,
    pre, post: int,
    
    utf8_string: string,
    dirty: bool = true,
}

make_empty_buffer :: proc(name: string) -> ^Buffer {
    b := new(Buffer);
    
    b.name = strings.new_string(name);
    b.data = nil;
    b.pre = 0;
    b.post = 0;
    
    return b;
}

make_sized_buffer :: proc(name: string, size: int) -> ^Buffer {
    b := new(Buffer);
    
    b.name = strings.new_string(name);
    b.data = make([]rune, size);
    b.pre = 0;
    b.post = 0;
    
    return b;
}

load_buffer_from_file :: proc(path: string) -> ^Buffer {
    data, ok := os.read_entire_file(path);
    if !ok {
        return nil;
    }
    
    result := make_sized_buffer(path, len(data));
    
    buffer_insert(result, string(data[..]));
    
    return result;
}

buffer_new_size :: proc(using buffer: ^Buffer) -> int {
    if data == nil {
        return 32;
    } else if len(data) > 1024 {
        return len(data)+1024;
    } else {
        return len(data)*2;
    }
}

buffer_expand :: proc(using buffer: ^Buffer) {
    if pre+post == len(data) {
        fmt.printf("context: %v\n", context);
        new_size := buffer_new_size(buffer);
        old_data := data;
        data = make([]rune, new_size);
        
        for i in 0..pre {
            data[i] = old_data[i];
        }
        
        for i in 0..post{
            data[len(data)-i-1] = old_data[len(old_data)-i-1];
        }
        
        if old_data != nil do free(old_data);
    }
}

buffer_to_utf8_string :: proc(using buffer: ^Buffer) -> string {
    if dirty {
        if utf8_string != "" do free(utf8_string);
        string_buffer: [dynamic]u8;
        codepointbuffer: [4]u8;
        length: int = 0;
        
        append_bytes :: proc(string_buffer: ^[dynamic]u8, cp: [4]u8, length: int) {
            for i in 0..length {
                append(string_buffer, cp[i]);
            }
        }
        
        for i := 0; i < pre; i += 1 {
            codepointbuffer, length = utf8.encode_rune(data[i]);
            append_bytes(&string_buffer, codepointbuffer, length);
        }
        
        for i := post; i > 0; i -= 1 {
            codepointbuffer, length = utf8.encode_rune(data[len(data)-i]);
            append_bytes(&string_buffer, codepointbuffer, length);
        }
        
        utf8_string = cast(string)string_buffer[..];
        dirty = false;
        return utf8_string;
    } else {
        return utf8_string;		
    }
}

buffer_insert :: proc[
    buffer_insert_char,
    buffer_insert_string,
];

buffer_insert_char :: proc(using buffer: ^Buffer, r: rune) {
    buffer_expand(buffer);
    data[pre] = r;
    pre += 1;
    dirty = true;
}

buffer_insert_string :: proc(using buffer: ^Buffer, str: string) {
    // TODO(thebirk): This is silly, this requires moving to chars everytime we insert a
    // character from the string.
    if pre+post+len(str) <= len(data) {
        fmt.printf("Speedy on buffer '%s'!\n", name);
        stri := 0;
        for i := 0; i < len(str); i += 1 {
            r, s := utf8.decode_rune(cast([]u8)str[stri..]);
            stri += s;
            data[pre]= r;
            pre += 1;
        }
    } else {
        for r in str {
            buffer_insert_char(buffer, r);
        }
    }
}

buffer_remove :: proc(using buffer: ^Buffer) {
    if pre > 0 {
        pre -= 1;
        dirty = true;
    }
}

buffer_move_left :: proc(using buffer: ^Buffer) {
    if pre > 0 {
        data[len(data)-post-1] = data[pre-1];
        pre -= 1;
        post += 1;
        dirty = true;
    }
}

buffer_move_right :: proc(using buffer: ^Buffer) {
    if post > 0 {
        data[pre] = data[len(data)-post];
        pre += 1;
        post -= 1;
        dirty = true;
    }
}

buffer_seek :: proc(using buffer: ^Buffer, dist: int) {
    if dist < 0 {
        dist = -dist;
        for i in 0..dist {
            buffer_move_left(buffer);
        }
    } else {
        for i in 0..dist {
            buffer_move_right(buffer);
        }
    }
}

buffer_seek_next_word :: proc(using buffer: ^Buffer) {
    for post != 0 {
        if !_is_whitespace(data[pre]) do return;
    }
}

_is_whitespace :: proc(r: rune) -> bool {
    return (r == ' ' || r == '\t' || r == '\r' || r == '\n');
}