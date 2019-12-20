Pcg_Kind :: struct {
};
Oneseq :: Pcg_Kind;
Mcg :: Pcg_Kind;
Unique :: Pcg_Kind;
Setseq :: Pcg_Kind;
Rng :: struct(Kind, Size, Out_Size: type) {
	state: Size,
}
SetRng :: struct(Kind, Size, Out_Size: type) #ordered {
	using _state: Rng(Kind, Size, Out_Size),
	inc: Size,
};
