package lipid

import "core:fmt"
import "core:strings"

intToRawptr :: proc(offset: int) -> rawptr {
    return rawptr(uintptr(offset));
}

/* Printing */

_print_limited_counter := 10;
printLimited :: proc(args: ..any) {
    if _print_limited_counter > 0 {
        _print_limited_counter -= 1;
        fmt.println(..args);
    }
}

/* Arrays and Slices */

resetDynamic :: proc(array: ^$D/[dynamic]$T) {
    array^ = make(D);
}

sizeOfSlice :: proc(s: []$T) -> int do return size_of(T) * len(s);

reverseSlice :: proc(s: []$T) {
    for i in 0..(len(s) / 2)-1 {
        j := len(s) - 1 - i;
        s[i], s[j] = s[j], s[i];
    }
}

import "core:runtime"

unorderedRemove :: proc(array: ^[dynamic]$T, index: int, loc := #caller_location) {
    runtime.bounds_check_error_loc(loc, index, len(array));
    array[index] = array[len(array)-1];
    pop(array);
}

orderedRemove :: proc(array: ^[dynamic]$T, index: int, loc := #caller_location) {
    runtime.bounds_check_error_loc(loc, index, len(array));
    copy(array[index:], array[index+1:]);
    pop(array);
}

/* String operations */

isASCIIWhitespace :: proc(c: byte) -> bool {
    return c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == '\f' || c == '\v';
}

countRunes :: proc(s: string) -> (count: int = 0) {
    for r in s do count += 1;
    return;
}

split :: proc(s: string, splitter: byte = 0) -> []string {
    words_dyn: [dynamic]string;

    isSplitter :: proc(b, s: byte) -> bool {
        if s == 0 do return isASCIIWhitespace(b);
        else do return b == s;
    }

    start := 0;
    for {
        for start < len(s) {
            if isSplitter(s[start], splitter) do start += 1;
            else do break;
        }

        end := start;

        for end < len(s) {
            if !isSplitter(s[end], splitter) do end += 1;
            else do break;
        }

        if start >= len(s) do break;

        append(&words_dyn, s[start:end]);

        start = end;
    }

    return words_dyn[:];
}

getLines :: proc(str: string) -> []string {
    result: [dynamic]string;

    current_line_start := 0;
    for i := 0; i <= len(str); i += 1 {
        if i == len(str) || str[i] == '\n' {
            line_end := i;
            if i > 0 && str[i - 1] == '\r' do line_end = i - 1;
            append(&result, str[current_line_start:line_end]);
            current_line_start = i + 1;
        }
    }

    return result[:];
}

// Returns inclusive:exclusive index pairs.
getLineIndices :: proc(str: string) -> [][2]int {
    result: [dynamic][2]int;

    current_line_start := 0;
    for i := 0; i <= len(str); i += 1 {
        if i == len(str) || str[i] == '\n' {
            line_end := i;
            if i > 0 && str[i - 1] == '\r' do line_end = i - 1;
            append(&result, [2]int{current_line_start, line_end});
            current_line_start = i + 1;
        }
    }

    return result[:];
}

// Returns inclusive:exclusive index pairs.
getTrimmedNonBlankLineIndices :: proc(str: string) -> [][2]int {
    result: [dynamic][2]int;

    found_line_start := false;
    current_line_start := -1;
    for i := 0; i < len(str); i += 1 {
        if !found_line_start && !isASCIIWhitespace(str[i]) {
            found_line_start = true;
            current_line_start = i;
        }

        if str[i] == '\n' {
            if found_line_start {
                line_end := i;
                for isASCIIWhitespace(str[line_end]) do line_end -= 1;
                append(&result, [2]int{current_line_start, line_end + 1});
            }
            found_line_start = false;
        }
    }

    return result[:];
}

// Mostly COPIED⛓ from getTrimmedNonBlankLines
getTrimmedNonBlankLines :: proc(str: string) -> []string {
    result: [dynamic]string;

    found_line_start := false;
    current_line_start := -1;
    for i := 0; i < len(str); i += 1 {
        if !found_line_start && !isASCIIWhitespace(str[i]) {
            found_line_start = true;
            current_line_start = i;
        }

        if str[i] == '\n' {
            if found_line_start {
                line_end := i;
                for isASCIIWhitespace(str[line_end]) do line_end -= 1;
                append(&result, str[current_line_start : line_end + 1]);
            }
            found_line_start = false;
        }
    }

    return result[:];
}

// Remove initial newline and indentation from multiline literal
// Indent has to be just spaces or just tabs.
// Doesn't work with \r\n.
cleanMultilineLiteral :: proc(str: string) -> string {
    if len(str) <= 1 do return str;

    start := str[0] == '\n' ? 1 : 0;
    s := cast([]byte) str[start:];

    Line :: struct {
        start, end: int,
        is_empty: bool,
    }
    lines: [dynamic]Line; defer delete(lines);

    line_start := 0;
    min_indent_length := 99999; // TODO: Actual max int.
    current_indent_length := 0;
    found_first_character_in_line := false;

    for i := 0; i < len(s); i += 1 {
        if !found_first_character_in_line {
            if s[i] == ' ' || s[i] == '\t' {
                current_indent_length += 1;
            } else if s[i] != '\n' {
                found_first_character_in_line = true;
                if current_indent_length < min_indent_length {
                    min_indent_length = current_indent_length;
                }
            }
        }

        if s[i] == '\n' {
            append(&lines, Line{line_start, i, !found_first_character_in_line});

            line_start = i + 1;
            found_first_character_in_line = false;
            current_indent_length = 0;
        }
    }

    result: strings.Builder;

    for line in lines {
        if line.is_empty {
            strings.write_string(&result, "\n");
        } else {
            strings.write_bytes(&result, s[line.start + min_indent_length : line.end + 1]);
        }
    }

    return strings.to_string(result);
}