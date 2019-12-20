package encoding

import "core:strings"

// @note(zh): Generates a decoding table for any given Base64 alphabet 
// if it is within the 128 character ASCII range.
// -1 indicates and index that can never be hit with the given alphabet.
generate_base64_decoding_table :: inline proc "contextless"(ENC_TABLE: []byte, allocator := context.allocator) -> string {
    b := strings.make_builder(allocator);
    strings.write_string(&b, "decoding_table := [128]int {\n");

    for i in 0..<128 {
        if index, is_valid := get_enc_index(byte(i), ENC_TABLE); is_valid do strings.write_int(&b, index);
        else do strings.write_int(&b, index);
        
        if (i+1) % 8 == 0 do strings.write_string(&b, ",\n");
        else do strings.write_string(&b, ", ");
    }

    get_enc_index :: inline proc "contextless"(n: byte, ENC_TABLE: []byte) -> (int, bool) {
        for i in 0..< len(ENC_TABLE) {
            if ENC_TABLE[i] == n do return i, true;
        }
        return -1, false;
    }

    strings.write_string(&b, "};");
    return strings.to_string(b);
}