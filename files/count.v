import array, iter

fn test_for()
{
	arr := [1,2,3]
	// Iterator for
	for e in arr.iter()
	{
		println(e)
	}
	// Equivalent to:
	for it := arr.iter();;
	{
		e := it.next() or {break}
		// (`it` not visible here)
		println(e)
	}
	mut it := arr.iter()
	for i in count(1, 4)
	{
		assert i == it.next()
	}
}

struct Counter
{
	cur mut usize
	end usize
}
fn (c mut Counter) next() ?usize
{
	r := c.cur
	if r == c.end {return none}
	c.cur++
	return r
}
fn count(start, end usize) Counter
{
	// return struct inference (v useful when returning template type)
	return {start, end}
}

fn test_enumerate()
{
	arr := [1,2,3]
	// built-in for on arrays
	for i,e in arr
	{
		assert e == arr[i]
	}
	// possible generic equivalent:
	// EnumIter.next returns a tuple of index and element
	for i,e in enumerate(arr.iter())
	{
		assert e == arr[i]
	}
}

struct EnumIter<It>
{
	it mut It
	i mut usize
}
fn enumerate(it It! : Iterable) EnumIter<It> {return {it, 0}}

fn (ei mut EnumIter<It! : Iterable<E!>>) next() ?(usize, E)
{
	e := ei.it.next()?
	i := ei.i
	ei.i++
	return i, e
}

struct Series<T, R>
{
	// introspection: infinite items
	const empty = false
	cur T
	fun fn(T)R
}
fn series(first T, fun fn(T)R) Series<T, R>
{
	return {first, fun}
}
// result is never none
fn (mut s Series<T, R>) next() ?R
{
	e := s.cur
	s.cur = s.fun(s.cur)
	return e
}

fn test_series()
{
	mut s := series(1, fn n {n * 2})
	assert s.next() == 1
	assert s.next() == 2
	assert s.next() == 4
	assert s.next() == 8
}
