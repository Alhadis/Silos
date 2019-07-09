// iterator example
// uses minimal features aiming to compile soon
// see iter.v for generic version

struct ArrayIter
{
    // Note: iter.v uses pointers
    slice mut []int
}
// this would be a method in the Array<T> module
//fn (arr []int) iter() ArrayIter
fn iter(arr []int) ArrayIter
{
    return ArrayIter{slice:arr}
}
fn (it mut ArrayIter) next() int?
{
    s := it.slice
    if !s.len {return none}
    e := s[0]
    it.slice = s.slice(1,s.len)
    return e
}

fn test_iter()
{
    arr := [1,2,3]
    mut it := iter(arr)
    // next returns an optional value
    e := it.next() or {0}
    assert e == 1
}

/// Create an array from an iterator
fn (it ArrayIter) array() []int
{
    // Could pre-allocate [E{}; it.len()] if len defined
    mut a := []int
    // `for` makes a mut copy of `it`
    for e in it
    {
        a << e
    }
    return a
}

fn test_array()
{
    arr := [1,2,3]
    it := iter(arr)
    assert it.array() == arr
}

/// Returns `iter` advanced to the first occurrence of `element`
fn (iter ArrayIter) find(element int) ArrayIter
{
    for it := iter;; it.next()
    {
        // if no more elements, we return `it` not none
        // because the iterator may still have useful public fields
        e := it.elem() or {return it}
        if e == element {return it}
    }
}

fn test_find()
{
    it := iter([1,2,3])
    assert it.find(7).array() == int[]
    assert it.find(2).array() == [2,3]
}

// iterator for lazily evaluated filter()
struct Filter
{
    it mut IntIter
    f fn(int)bool
}
fn (it mut Filter) next() int?
{
    for
    {
        e := it.next()?
        if it.f(e) return e
    }
}
/// Returns an iterator
fn (it IntIter) filter(f fn(int)bool) Filter
{
    return Filter{it, f}
}

fn test_filter()
{
    odd := [1,2,3,4,5].iter().filter(fn e {e & 1 != 0})
    assert odd.array() == [1,3,5]
}

// iterator for lazy map
struct Map
{
    it mut ArrayIter
    f fn(int)int
}
fn (it mut Map) next() int?
{
    e := it.next()?
    return it.f(e)
}
// Returns an iterator
fn (it ArrayIter) map(f fn(int)int) Map
{
    return Map{it, f}
}

fn square(i int) int
{
    return i * i
}
fn test_map()
{
    arr := [1,2,3]
    it := iter(arr)
    mut mi := it.map(square)
    assert mi.array() == [1,4,9]
    assert mi.next() == none
}

/// Check if two iterators have equal elements
fn equal(i1, i2 ArrayIter) bool
{
    mut m1 = i1
    mut m2 = i2
    for
    {
        e := m1.next()
        if e != m2.next() {return false}
        if e == none {return true}
    }
}

fn test_equal()
{
    a := [1,2,3]
    it := iter(a)
    assert equal(it, iter(a))
    assert !equal(it, iter([1,2]))
}
