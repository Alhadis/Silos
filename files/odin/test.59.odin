/*
 *  @Name:     test
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hoej@northwolfprod.com
 *  @Creation: 29-11-2017 00:42:39
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 11-12-2017 00:43:32
 *  
 *  @Description:
 *  
 */

import "core:fmt.odin";

Symbol :: struct {
    name: string,
    value: Element,
}

Cons :: struct {
    car, cdr: Element,
}

Element :: union {
    ^Symbol,
    ^Cons,
}

main :: proc() {
    fmt.println("TEST");
}