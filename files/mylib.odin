package mylib

import "mylib2";
import "core:fmt";

Punkt :: struct {
	name: string,
	x, y: f32
}

Kolo :: struct {
	using punkt: Punkt,
	r: f32
}
/*
init_kolo :: proc(k: ^Kolo, r : f32 = 1.0) {
	init_punkt(k);
	k.r = r;
}

init_punkt :: proc(p: ^$T/Punkt, name := "P", x := 0.0, y := 0.0) {

}
*/