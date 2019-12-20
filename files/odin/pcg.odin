using import "types.odin";
using import "output.odin";
using import "state.odin";

/*
 * f_*(a,b) = (a, f_a(b)) // ie, select variant of f() with a
 * f ◦ g = f(g())
 * split_t(x) = (x >> t, x & (~0 >> t))
 * join_t(x,y) = x << t | y
 * clockwise rotate = rotate_right(n, count)
 * x |> y = x >> y
 * x <| y = x << y
 * x boxed |> y = x >> (bits - y)
 * x boxed <| y = x & ~(~0 << y)
 * x |+> y = x ~ (x >> y) // xorshift
 *
 */

/*
 * s = state
 * b = bit-size of s
 * t = # of top-bits devoted to choosing permuator variant
 * c = car(split_t(s))		variant (c <= t)
 * n = cdr(split_t(s))		input to be scrambled (n <= b - t)
 * p = sizeof(n) = b - t
 * r = output length
 * output_t(state) = cdr(f_*(split_t(state)))
 * where f() is one of the following
Permutation functions:
 * RS  - Random shift: look at upper bits to choose "window" of lower bits
 *		n >> (b - t - r - c) & ~(~0 << r)
 * RR  - Random rotation: look at upper bits to rotate lower bits
 *		t = log2(r), n >> (b - t - r) rotr c
 * XS  - Xorshift: c gets xor'd with lower half of the output (I think?)
 *		t = r/2, n ~ (c << (b - t - t))
 * RXS - Random Xorshift:
 *		((n ~ (n >> c)) >> (b - t - r) ~ (c << (r - c))
 * M - Multiplication by constant
 *		n * M
 *
RNG variant names:
 * PCG-[permuator-]..StateLength/OutputLength-(misc)
 * Misc:
 *	EXT N - Extension, N-dimensional equidistribution
 *
 * (f)ast: MCG instead of LCG
 * (s)ingle: LCG with fixed constant
 * (u)nique: LCG with pointer-to-state constant
 * ()stream: LCG with user choosable constant
 *
 * (i)nsecure: StateLength = OutputLength
 */

/*
pcg32o_rs :: proc(state: ^u64) -> u32 {
	state^ = state^ * multiplier + inc;
	return u32(state^ >> (29 - (state^ >> 61)));
}*/

Pcg32  :: #alias Rng(Setseq,u64,u32);
Pcg32s :: #alias Rng(Oneseq,u64,u32);
Pcg32u :: #alias Rng(Unique,u64,u32);
Pcg32f :: #alias Rng(Mcg,u64,u32);
pcg_srandom :: seed;

pcg_random :: proc(using rng: ^Rng($K, $S, $O)) -> O {
	oldstate := state;
	step(rng);
	return xsh_rr(oldstate);
}
//pcg32s_random :: oneseq_64_xsh_rr_32;
/*pcg32_boundedrand :: proc(state: ^u64, bound: u32) -> u32 {
	threshold := -bound % bound;
	for {
		r := pcg_random(state);
		if r >= threshold {
			return r % bound;
		}
	}
	return ~u32(0);
}
*/
