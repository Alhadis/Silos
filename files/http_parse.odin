package server

// test file for parsing http
import "core:fmt"
import "core:mem"
import "core:strconv"

HTTP_Version :: enum {
    V1,
    V1_1,
}

HTTP_Method :: enum {
    GET,
    POST,
    PUT,
    DELETE,
    OPTIONS,
    HEAD,
    TRACE,
    CONNECT,
}

HTTP_Request :: struct {
    version: HTTP_Version,
    method: HTTP_Method,
    url: string,
    auth_token: string,
    host: string,
    content_length: int,
}

Text_Iterator :: struct {
    text: string,
    index: int,
}

itr_get_word :: proc(using itr: ^Text_Iterator) -> string {
    start := index;
    end := start;
    loop: for ; index < len(text); index += 1 {
        switch text[index] {
            case ' ', '\n':
                end = index;
                break loop;
            case '\r':
                end = index;
                if index + 1 < len(text) && text[index + 1] == '\n' {
                    index += 1;
                }
                break loop;
            case:
                continue;
        }
    }
    return text[start:end];
}

// reads line up to (but not including) new line char
itr_get_line :: proc(using itr: ^Text_Iterator) -> string {
    start := index;
    end := start;
    loop: for ;index < len(text); index += 1 {
        if text[index] == '\n' {
            end = index;
            break loop;
        }
        else if text[index] == '\r' {
            end = index;
            if index + 1 < len(text) && text[index + 1] == '\n' {
                index += 1;
            }
            break loop;
        }
    }
    return text[start:end];
}

itr_step :: proc(itr: ^Text_Iterator) -> byte {
    if (itr.index >= len(itr.text)) {
        return 0;
    }
    result := itr.text[itr.index];
    itr.index += 1;
    return result;
}

is_upper_case :: inline proc(c: byte) -> bool {
    return c >= 'A' && c <= 'Z';
}

char_to_lower_case :: proc(c: byte) -> byte {
    if is_upper_case(c) {
        return c + 'a' - 'A';
    } else {
        return c;
    }
}

itr_consume_newline :: proc(itr: ^Text_Iterator) -> bool {
    c1 := itr_step(itr);
    if c1 == '\n' {
        return true;
    }
    if c1 == '\r' {
        c2 := itr_step(itr);
        if c2 == '\n' {
            return true;
        }
    }
    return false;
}

string_iequals :: proc(str1: string, str2: string) -> bool {
    if len(str1) != len(str2) {
        return false;
    }
    for i := 0; i < len(str1); i += 1 {
        lower1 := char_to_lower_case(str1[i]);
        lower2 := char_to_lower_case(str2[i]);
        if lower1 != lower2 {
            return false;
        }
    }
    return true;
}

parse_http_request :: proc(request: string) -> (result: HTTP_Request, success: bool) {
    // parse the request line
    itr := Text_Iterator{text=request};
    method := itr_get_word(&itr);
    switch(method) {
        case "GET":      result.method = HTTP_Method.GET;
        case "POST":     result.method = HTTP_Method.POST;
        case "PUT":      result.method = HTTP_Method.PUT;
        case "DELETE":   result.method = HTTP_Method.DELETE;
        case "OPTIONS":  result.method = HTTP_Method.OPTIONS;
        case "HEAD":     result.method = HTTP_Method.HEAD;
        case "TRACE":    result.method = HTTP_Method.TRACE;
        case "CONNECT":  result.method = HTTP_Method.CONNECT;
        case:
            // fmt.println("unrecognized method", method); // DEBUG
            return result, false;
    }

    // expect and skip over a space
    if (itr_step(&itr) != ' ') {
        // fmt.println("no space after method"); // DEBUG
        return result, false;
    }

    url := itr_get_word(&itr);
    result.url = url; // TODO do we clone? should we decode?

    // expect and skip over a space
    if (itr_step(&itr) != ' ') {
        // fmt.println("no space after url"); // DEBUG
        return result, false;
    }

    version := itr_get_word(&itr);
    switch(version) {
        case "HTTP/1.0":
            result.version = HTTP_Version.V1;
        case "HTTP/1.1":
            result.version = HTTP_Version.V1_1;
        case:
            // fmt.println("unrecognized version", version, cast([]byte)version); // DEBUG
            return result, false;
    }

    if (!itr_consume_newline(&itr)) {
        return result, false;
    }

    // now parse headers
    for {
        if itr.index > len(itr.text) || itr.text[itr.index] == '\n' {
            break;
        }
        header_name  := itr_get_word(&itr);
        if itr_step(&itr) != ' ' {
            fmt.println("no space after header", header_name); // DEBUG
            return result, false;
        }
        header_value := itr_get_line(&itr);

        if itr.index > len(itr.text) && itr.text[itr.index] == '\n' {
            itr.index += 1;
        }

        if string_iequals(header_name, "host:") {
            result.host = header_value;
        } else if string_iequals(header_name, "content-length:") {
            result.content_length = strconv.parse_int(header_value);
        } else {
            // nothing!
        }
    }

    return result, true;
}
