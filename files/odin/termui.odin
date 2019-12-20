package persist

import "core:fmt"
import "core:runtime"
import "core:os"
import "core:mem"
import "core:strings"
import "core:strconv"

SampleObject :: struct {
    name: string,
    job_title: string,
    birth_year: int,
    birth_month: int,
}

term_main :: proc() {
    objects := make([dynamic]SampleObject, 10);
    person := &objects[0];
    person.name = "Hasen";
    person.job_title = "Programmer";
    person.birth_year = 1985;
    person.birth_month = 5;
    edit_object(person);

    /*
    fmt.println("object is:", person);
    buf := make([dynamic]byte);
    encode_object(&buf, person);
    fmt.println("Encoded to bytes:");

    person2: SampleObject;
    person2.name = "something that will never be real";
    person2.birth_year = 4332;
    person2.birth_month = 523;
    fmt.println("new object:", person2);
    DecodeObject(buf[:], person2);
    fmt.println("new object after decoding from buffer", person2);
    */
}

edit_object :: proc(obj: any) {
    // for now let it just list all the fields!
    fmt.println("Editing object:", obj);

    // expect a pointer to a struct, or the struct info to be in there somewhere!
    type_data, ok := GetStructInfo(obj);
    if !ok {
        fmt.println("not a struct");
        return;
    }

    ptr := type_data.ptr;
    struct_info := type_data.info;

    input := make([]byte, 20);
    for name, index in struct_info.names {
        type := struct_info.types[index];
        fieldRef := GetField(ptr, struct_info, index);
        // fmt.println("Field:", name, "\tType:", type);
        fmt.printf("%s> ", name);
        count, err := os.read(context.stdin, input);
        if err == 0 && count > 1 {
            userInput := string(input[:count-1]);
            // fmt.println("You want to assign", userInput, "to", name);
            assign_string(userInput, fieldRef);
        }
        fmt.println("object now is:", obj);
    }
}

assign_string :: proc(input: string, obj: any) {
    ptr := obj.data;
    switch it in obj {
        case int: (cast(^int)ptr)^ = strconv.parse_int(input);
        case uint: (cast(^uint)ptr)^ = strconv.parse_uint(input);
        case i64: (cast(^i64)ptr)^ = strconv.parse_i64(input);
        case u64: (cast(^u64)ptr)^ = strconv.parse_u64(input);
        case string: (cast(^string)ptr)^ = strings.clone(input);
        case: fmt.println("we don't know how to assigned a string to", obj);
    }
}

assign_i64 :: proc(input: i64, obj: any) {
    ptr := obj.data;
    switch it in obj {
        case i64: (cast(^i64)ptr)^ = input;
        case int: (cast(^int)ptr)^ = int(input);
        case u64: (cast(^u64)ptr)^ = u64(input);
        case uint: (cast(^uint)ptr)^ = uint(input);
        case string: (cast(^string)ptr)^ = i64_to_string(input);
        case: fmt.println("we don't know how to assigned i64 to", obj);
    }
}

assign_u64 :: proc(input: u64, obj: any) {
    ptr := obj.data;
    switch it in obj {
        case u64: (cast(^u64)ptr)^ = input;
        case uint: (cast(^uint)ptr)^ = uint(input);
        case i64: (cast(^i64)ptr)^ = i64(input);
        case int: (cast(^int)ptr)^ = int(input);
        case string: (cast(^string)ptr)^ = u64_to_string(input);
        case: fmt.println("we don't know how to assigned u64 to", obj);
    }
}


assign_b8 :: proc(input: b8, obj: any) {
    ptr := obj.data;
    switch it in obj {
        case i64: (cast(^i64)ptr)^ = i64(input);
        case int: (cast(^int)ptr)^ = int(input);
        case u64: (cast(^u64)ptr)^ = u64(input);
        case uint: (cast(^uint)ptr)^ = uint(input);
        case string: (cast(^string)ptr)^ = input ? "true" : "false";
        case: fmt.println("we don't know how to assigned b8 to", obj);
    }
}

assign :: proc{assign_b8, assign_u64, assign_i64, assign_string};

i64_to_string :: proc(x: i64) -> string {
    s := strings.make_builder();
    strings.write_i64(&s, x);
    return strings.to_string(s);
}

u64_to_string :: proc(x: u64) -> string {
    s := strings.make_builder();
    strings.write_u64(&s, x);
    return strings.to_string(s);
}

// -------------------------- TEST DATA ----------------------------------------
// -----------------------------------------------------------------------------


// Note: next step, make a structure that nests another structure and make it possible to serialize/deserialize

BlogRepo :: struct {
    users: [dynamic]User,
    user_auths: [dynamic]UserAuth,
    user_sessions: [dynamic]UserSession,
    posts: [dynamic]Post,
    comments: [dynamic]Comment,
}

UserType :: enum u8 {
    Anon = 0,
    User = 1,
    Admin = 2,
}

User :: struct {
    id: int,
    screen_name: string,
    type: UserType,
    email: string,
    bio: string,
}

UserAuth :: struct {
    user: ^User,
    hashed_password: string,
    email_confirmed: bool,
    email_token: string, // if email needs confirmation
}

UserSession :: struct {
    user: ^User,
    session_token: string,
}

Post :: struct {
    id: int,
    posted_by: ^User,
    title: string,
    content: string, // could be large? do we care? for now, no!
    time: string,
}

PostTag :: struct {
    id: int,
    tag: string,
    post: ^Post,
}


Comment :: struct {
    id: int,
    posted_by: ^User,
    posted_on: ^Post,
    time: string,
    parent_comment: ^Comment, // fragility point: parent comment must have a lower id, or else we have a problem! (it will be deserialized as nil)
}

