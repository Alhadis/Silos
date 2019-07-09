// See intiter.v for non-generic code

import array

interface Iterable<Element>
{
    next() ?Element
}

// type template
type IterElement<Iterable<E!>> = E

// compile-time assert
$assert IterElement<Iterable<int>> is int
// ArrayIter converts to Iterable
$assert IterElement<ArrayIter<int>> is int

/* Parameter specialization syntax:
 * fn f(it! : Iterable<E!>)
 * fn f<It : Iterable<E!>>(it It) // explicit
 * 
 * This means infer type(it) and use as an implicit template parameter
 * type(it) must convert to Iterable<E>
 * E is inferred from type(it).next()
 * E is not a template type parameter, we already have parameter type(it) instead
 */

/// Create an array from an iterator
fn array(it! : Iterable<E!>) []E
{
    // introspection
    $if type(it) is ArrayIter<E>
    {   // array memory already exists
        return it.slice()
        // below code does not apply for ArrayIter
        // as $if block has terminating return statement
    }
    // Could pre-allocate [E{}; it.len()] if len defined
    mut a := []E
    for e in it
    {
        a << e
    }
    return a
}

fn test_array()
{
    arr := [1,2,3]
    it := arr.iter()
    // var.function_name(...) = Method Call Syntax
    // Calls array<ArrayIter<int>>, E = int
    assert it.array() == arr
}

/// Gets the next element without mutating `iter`
fn elem(iter! : Iterable<E!>) ?E
{
    mut it := iter
    return it.next()
}

/// Returns `iter` advanced to the first occurrence of `element`
fn find(iter It! : Iterable<E!>, element E) It
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
    it := [1,2,3].iter()
    // UFCS chaining
    assert it.find(7).array() == int[]
    assert it.find(2).array() == [2,3]
}

// iterator for lazily evaluated filter()
struct Filter<It : Iterable<E!>>
{
    it mut It
    f fn(E)bool
}
fn (it mut Filter<It! : Iterable<E!>>) next() ?E
{
    for
    {
        e := it.next()?
        if it.f(e) return e
    }
}
/// Returns an iterator
fn (it It! : Iterable<E!>) filter(f fn(E)bool) Filter<It>
{
    return {it, f}
}

fn test_filter()
{
    // calls filter<ArrayIter<int>>, E = int
    odd := [1,2,3,4,5].iter().filter(fn e {e & 1 != 0})
    assert odd.array() == [1,3,5]
}

// iterator for lazily evaluated map()
struct Map<It : Iterable<E!>, R>
{
    it mut It
    f fn(E)R
}
fn (it mut Map<It!, R!>) next() ?R
{
    e := it.next()?
    return it.f(e)
}
/// Returns an iterator
fn (it It! : Iterable<E!>) map(f fn(E)R!) Map<It, R>
{
    return {it, f}
}

/*
Inference of R is complicated:
Calling `ArrayIter<int>.map(fn i {i * i})`, we can partially
infer `map<ArrayIter<int>, R!>`, R not known yet.
Then f is a `fn(int)R!`.
Applying this to the lambda: `fn (int i) R! {i * i}`
R is type(i * i) = int
*/
fn test_map()
{
    arr := [1,2,3]
    it := arr.iter()
    // calls map<ArrayIter<int>, int>
    mut mi := it.map(fn i {i * i})
    assert mi.array() == [1,4,9]
    assert mi.next() == none
}

/// Check if two iterators have equal elements
// <E> not needed for inference of Iterable
fn equal(i1! : Iterable, i2! : Iterable) bool
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
    it := a.iter()
    assert equal(it, a.iter())
    assert !equal(it, [1,2].iter())
}
