import complex

fn test_eqviv() {
	num1 := complex.new(1.0, 2.0)
	num2 := complex.new(2.0, 3.0)
	num3 := complex.new(3.0, 5.0)
	// sum
	numSum := num1 + num2

	assert numSum.eq(num3)
}

fn test_arefm() {
	num1 := complex.new(1.0, 3.0)
	num2 := complex.new(5.0, 2.0)
	numSum := complex.new(6.0, 5.0)
	numDiff := complex.new(-4.0, 1.0)
	numMul := complex.new(-1.0, 17.0)
	numDiv := complex.new(0.379310, 0.448276)

	num12Sum := num1 + num2
	num12Diff := num1 - num2
	num12Mul := num1 * num2
	num12Div := num1 / num2

	assert num12Sum.eq(numSum)
	assert num12Diff.eq(numDiff)
	assert num12Mul.eq(numMul)
	assert num12Div.eq(numDiv) // TODO try to improve
}
