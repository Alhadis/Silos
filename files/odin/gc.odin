package koi

import "core:fmt"
import "core:sync"
import "core:thread"
/*
gc_add_to_grey_from_white :: proc(state: ^State, v: ^Value) {
	if v.color != GCColor.White do return;
	v.color = GCColor.Grey;
	v.next_list = state.grey_list;
	if state.grey_list != nil {
		state.grey_list.prev_list = v;
	}
	state.grey_list = v;
}

gc_mark_value :: proc(state: ^State, v: ^Value) {
	if v.color == GCColor.Black do return; // Does this even happen?
	assert(v.color == GCColor.Grey);

	v.color = GCColor.Black;
	v.next_list = state.black_list;
	if state.black_list != nil {
		state.black_list.prev_list = v;
	}
	state.black_list = v;

	switch v.kind {
	case True, False, Null, String, Number:
		// No children to add
	case Function:
		f := cast(^Function) v;
		#complete switch fv in f.variant {
		case KoiFunction:
			for v in fv.constants {
				gc_add_to_grey_from_white(state, v);
			}
		}
	case Table:
		t := cast(^Table) v;
		for _, v in t.data {
			gc_add_to_grey_from_white(state, v);
		}
	case Array:
		arr := cast(^Array) v;
		for v in arr.data.data[:arr.data.size] {
			gc_add_to_grey_from_white(state, v);
		}
	case: panic("Unsupported value type!");
	}
}

gc_worker_proc :: proc(t: ^thread.Thread) -> int {
	state := cast(^State) t.data;
	for {
		sync.semaphore_wait(&state.start_gc_thread);
		sync.semaphore_post(&state.start_gc_thread, 0);

		sync.mutex_lock(&state.gc_worker_stop_mutex);
		if state.gc_worker_stop {
			sync.mutex_unlock(&state.gc_worker_stop_mutex);
			return 0;
		}
		sync.mutex_unlock(&state.gc_worker_stop_mutex);

		sync.mutex_lock(&state.marking_mutex);
		if !state.marking {
			panic("GC thread was started but we are not marking :(");
		}
		sync.mutex_unlock(&state.marking_mutex);

		sync.mutex_lock(&state.grey_list_mutex);
		grey_list_empty := state.grey_list == nil;
		sync.mutex_unlock(&state.grey_list_mutex);

		for !grey_list_empty {
			sync.mutex_lock(&state.grey_list_mutex);

			v := cast(^Value) state.grey_list;
			state.grey_list = v.next_list;
			gc_mark_value(state, v);

			grey_list_empty = state.grey_list == nil;
			if !grey_list_empty do sync.mutex_unlock(&state.grey_list_mutex);
		}

		assert(state.grey_list == nil);

		// We dont want any more elements
		// So set marking = false and grab the greylist
		sync.mutex_lock(&state.marking_mutex);
		state.marking = false;
		sync.mutex_unlock(&state.marking_mutex);

		freed_in_pass := 0;

		gc := &state.all_objects;
		for gc^ != nil {
			val := gc^;
			if val.color == GCColor.White && !val.is_constant {
				gc^ = val.next;
				free_value(state, cast(^Value)val);
				freed_in_pass += 1;	
			} else {
				val.color = GCColor.White;
				gc = &val.next;
			}
		}

		fmt.printf("GC: Freed %d, Values: %d, Max: %d\n", freed_in_pass, state.total_values, state.max_values);
		state.max_values = int(1.25 * f64(state.total_values)); // New threshold
		//fmt.printf("New Threshold: %d\n", state.max_values);

		b := state.black_list;
		for b != nil {
			next := b.next_list;

			b.color = GCColor.White;
			b.next_list = nil;
			b.prev_list = nil;

			b = next;
		}
		state.black_list = nil;


		sync.mutex_unlock(&state.grey_list_mutex);
	}

	return 0;
}
*/