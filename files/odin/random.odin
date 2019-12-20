type Randomizer_64bit struct {
	seed: u64
}

proc x_or_shift_64_star(randomizer: ^Randomizer_64bit) -> u64 {
	var result = randomizer.seed;
	result = result ~ (result >> 12);
	result = result ~ (result << 25);
	result = result ~ (result >> 27);
	randomizer.seed = result;

	return result * 0x2545F4914F6CDD1D;
}