// See intiter.v for non-generic code
// This module would also define Array<E> so arr.iter() works
// We could just define Array.next() instead of having ArrayIter

// E = Element type
struct ArrayIter<E>
{
    // these can be null but will never be read when null
    // so we can avoid using optional types
    ptr mut *E
    end *E
}
// arr is an array of generic type E
fn (arr []E!) iter() ArrayIter<E>
{
    unsafe {
        // Array<int>.ptr should be readable in unsafe code
        p := arr.ptr
        // return struct inference
        return {p, p + arr.len}
    }
}
fn (it mut ArrayIter<E!>) next() E?
{
    if it.ptr == it.end {return none}
    e := *it.ptr
    unsafe {
        it.ptr++
    }
    return e
}
/// Get the array back from `it`
fn (it ArrayIter<E>) slice() []E
{
    unsafe {
        p := it.ptr
        return := p[:it.end - p]
    }
}

fn test_iter()
{
    arr := [1,2,3]
    // calls iter<int>
    mut it := arr.iter()
    // next<int> returns an optional int
    e := it.next() or {0}
    assert e == 1
    // temporary result of iter() is inferred as mutable
    assert arr.iter().next() == 1
    assert arr.iter().slice() == arr
}

