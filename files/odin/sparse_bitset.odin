package sparse_bitset

import "intrinsics"

// This implementation is based on "An Efficient Representation  for Sparse Sets" 
// (http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.30.7319&rep=rep1&type=pdf)
// by Preston Briggs and Linda Torczon from Rice University.

// TODO: allocate SparseBitSet dense and sparse arrays without zeroing them;
//       this data structure requires no initialization other than setting `n` to 0.

SparseBitSet :: struct(N: u64, T: typeid) where intrinsics.type_is_numeric(T) {
	dense: [N]T,
	sparse: [N]T,
	n: T
}

contains :: inline proc(using s: ^SparseBitSet($N, $T), x: T) -> bool {
	assert(x >= 0, "SparseBitSet only works with positive integers");
	return u64(x) < N && sparse[x] < n && dense[sparse[x]] == x;
}

insert :: proc(using s: ^SparseBitSet($N, $T), x: T) -> bool {
	if contains(s, x) do return false;

	dense[n] = x;
	sparse[x] = n;
	n += 1;

	return true;
}

unordered_remove :: proc(using s: ^SparseBitSet($N, $T), x: T) -> bool {
	if !contains(s, x) do return false;

	i := sparse[x];
	e := dense[n - 1];

	dense[i] = e;
	sparse[e] = i;
	n -= 1;

	return true;
}

ordered_remove :: proc(using s: ^SparseBitSet($N, $T), x: T) -> bool {
	if !contains(s, x) do return false;

	s := sparse[x];
	for i in s..n-2 {
		e := dense[i + 1];
		dense[i] = e;
		sparse[e] = i;
	}
	n -= 1;

	return true;
}

clear :: inline proc(using s: ^SparseBitSet($N, $T)) {
	n = 0;
}

for_each :: inline proc(using s: ^SparseBitSet($N, $T), fn: proc(T)) {
	for i in 0..<n {
		fn(dense[i]);
	}	
}