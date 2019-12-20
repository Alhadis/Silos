package json_parse_bug

import "core:fmt"
import "core:encoding/json"

from_json :: proc(s: string, spec := json.Specification.JSON) -> json.Value {
    slice := cast([]u8)s;
    val, err := json.parse(slice, spec);
    assert(err == .None, fmt.tprintf("error: '%s' while parsing: %s", err, s));
    return val;
}



main :: proc() {

    // parse a float key
    {
        float_val := from_json("{\"foo\": 4.2, \"meep\": 5.3}").value.(json.Object)["foo"].value.(json.Float);
        assert(float_val == 4.2);
    }

    // parse a negative float key
    {
        float_val := from_json("{\"foo\": -100.0}").value.(json.Object)["foo"].value.(json.Float);
        assert(float_val == -100.0);
    }

    // parse an int key with digit length 2
    {
        int_val := from_json("{\"foo\": 13}").value.(json.Object)["foo"].value.(json.Integer);
        assert(int_val == 13);
    }

    // parse an int key with digit length 1
    {
        int_val := from_json("{\"foo\": 4}").value.(json.Object)["foo"].value.(json.Integer);
        assert(int_val == 4);
    }

    // parse a hex key
    {
        int_val := from_json("{\"foo\": 0x4}", .JSON5).value.(json.Object)["foo"].value.(json.Integer);
        assert(int_val == 0x4);
    }

}
