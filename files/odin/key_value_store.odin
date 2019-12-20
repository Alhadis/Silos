/*
 *  @Name:     key_value_store
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 16-05-2017 21:52:47
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 03-02-2018 23:32:58 UTC+1
 *  
 *  @Description:
 *      Contains a "generic" key value storage.
 */

import "core:fmt.odin";

Key_Value_Store :: struct {
    _data : map[string]any,
}

set :: proc(store : ^Key_Value_Store, id : string, value : any) {
    switch v in value {
        case int, uint, f64, string : {
            store._data[id] = value;
        }

        case i32 : {
            store._data[id] = int(v);
        }

        case u32 : {
            store._data[id] = uint(v);
        }

        case f32 : {
            store._data[id] = f64(v);
        }

        case : {
            fmt.println("Can't store", value);
        }
    }
}

get :: proc(store : ^Key_Value_Store, id : string, T : type) -> T {
    val, ok := store._data[id];
    if !ok { return T{}; }
    switch v in val {
        case int: {
            if T == int {
                return v;
            } else {
                return 0;
            }
        }

        case uint: {
            if T == uint {
                return v;
            } else {
                return 0;
            }
        }

        case f64: {
            if T == f64 {
                return v;
            } else {
                return 0;
            }
        }

        case string: {
            if T == string {
                return v;
            } else {
                return 0;
            }
        }
    }
}