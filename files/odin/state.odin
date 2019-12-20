using import "constants.odin";
using import "types.odin";

step :: inline proc(using rng: ^Rng($K, $SK, $S, $O)) {
	state = state * type_constant(S, mults)
			+ inc_of(&state, K);
}
advance :: inline proc(using rng: ^Rng($K, $SK, $S, $O), delta: S) {
	state = advance_lcg(state, delta,
			type_constant(S, mults),
			inc_of(&state, K));
}


seed :: inline proc(using rng: ^Rng(Mcg, $SK, $S, $O), init: S) {
	state = init | 1;
}
seed :: inline proc(using rng: ^SetRng(Setseq, $SK, $S, $O), init, seq: S) {
	state = 0;
	inc = (seq << 1) | 1;
	step(rng);
	state += init;
	step(rng);
}
seed :: inline proc(using rng: ^Rng(Unique, $SK, $S, $O), init: S) {
	state = 0;
	step(rng);
	state += init;
	step(rng);
}
seed :: inline proc(using rng: ^Rng(Oneseq, $SK, $S, $O), init: S) {
	state = 0;
	step(rng);
	state += init;
	step(rng);
}


advance_lcg :: proc(state, delta, cur_mult, cur_plus: $T) {
	acc_mult, acc_plus: T = 1, 0;
	for delta > 0 {
		if delta & 1 != 0 {
			acc_mult *= cur_mult;
			acc_plus = acc_plus * cur_mult + cur_plus;
		}
		cur_plus = (cur_mult + 1) * cur_plus;
		cur_mult *= cur_mult;
		delta /= 2;
	}
	return acc_mult * state^ + acc_plus;
}
