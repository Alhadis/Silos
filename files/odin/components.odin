package components

import "../renderer"

using import "../math"

sprite_component :: struct {
	using sprite: renderer.sprite,
}

AABB :: struct {
	using transform: renderer.transform,
}