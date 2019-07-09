// int to int version
import intiter

// Returns a closure
fn (iter IntIter) map_close(f fn(int)int) fn()?int
{
    mut it := iter
    return fn {
        e := it.next()?
        return f(e)
    }
}

fn test_map()
{
    arr := [1,2,3]
    f := arr.iter().map_close(fn i {i * i})
    // print 149
    for
    {
        e := f() or {break}
        print(e)
    }
}

//// Generic version
import iter

// Returns a closure
fn (iter! Iterable<E!>) map_close(f fn(E)R!) fn()?R
{
    mut it := iter
    return fn {
        e := it.next()?
        return f(e)
    }
}
