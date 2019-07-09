import base64

fn main() {
    // empty
    println(base64.decode(''))

    // vlang.io => dmxhbmcuaW8=
    println(base64.decode('dmxhbmcuaW8'))
    println(base64.decode('dmxhbmcuaW8='))
}