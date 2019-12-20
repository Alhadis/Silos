package koi

import "core:fmt"

GCState :: struct {
	all_objects: ^GCObject,
}

// This has to be the first element of a value
// so that when we call free on it, the actual
// object gets freed
GCObject :: struct {
	next: ^GCObject,
	is_constant: b8,
	marked: b8,
}

gc_register_object :: inline proc(state: ^GCState, v: ^GCObject) {
	v.next = state.all_objects;
	state.all_objects = v;
}

gc_mark_value :: proc(gc: ^GCState, v: ^Value) {
	if v.marked do return;

	v.marked = true;

	switch v.kind {
	case True, False, Nil, String, Number:
		// No children to add
	case Function:
		f := cast(^Function) v;
		#complete switch fv in f.variant {
		case KoiFunction:
			for v in fv.constants {
				gc_mark_value(gc, v);
			}
		}
	case Table:
		t := cast(^Table) v;
		for _, v in t.data {
			gc_mark_value(gc, v);
		}
	case Array:
		arr := cast(^Array) v;
		for v in arr.data.data[:arr.data.size] {
			gc_mark_value(gc, v);
		}
	case: panic("Unsupported value type!");
	}
}

gc_mark_and_sweep :: proc(gc: ^GCState, state: ^State) {
	for i in 0..state.top-1 {
		if state.stack[i] == nil do continue;

		gc_mark_value(gc, state.stack[i]);
	}

	for _, v in state.global_scope.names {
		gc_mark_value(gc, v.value);
	}

	for _, v in state.loaded_modules {
		gc_mark_value(gc, v);
	}

	//TODO: Free excess Numbers stored in number_pool
	//      so that we dont sit on those forever

	obj: ^^GCObject = &gc.all_objects;
	for obj^ != nil {
		if obj^.marked == false {
			to_free := obj^;
			obj^ = to_free.next;
			if !to_free.is_constant {
				free_value(state, cast(^Value) to_free);
			}
		} else {
			obj^.marked = false;
			obj = &(obj^.next);
		}
	}
}

gc_free_all :: proc(state: ^State, gc: ^GCState) {
	obj := gc.all_objects;
	for obj != nil {
		o := obj;
		obj = obj.next;
		free_value(state, cast(^Value) o);
	}

	gc.all_objects = nil;
}