/// Node holding int of linked list
struct IntList
{
	data int
	next ?*IntList
}
fn prepend(l ?*IntList, e int) IntList
{
	return IntList{data:e, next:l}
}

fn test_list()
{
	//n1 := prepend(none, 4)
	n1 := IntList{data:4}
	assert n1.data == 4
	n2 := prepend(&n1, 3)
	assert n2.next == &n1
	
	mut it := iter(&n2)
	assert it.next() == 3
	assert it.next() == 4
	assert it.next() == none
	assert iter(none).next() == none
}

struct IntListIter
{
	node mut?*IntList
}
fn iter(il ?*IntList) IntListIter
{
	return IntListIter{il}
}
fn (it mut IntListIter) next() ?int
{
	n := it.node?
	e := n.data
	it.node = n.next
	return e
}

/// Generic linked list
struct List<E>
{
	data E
	next mut ?*List<E>
}
fn prepend(l ?*List<E!>, e E) List<E>
{
	return {e, l}
}

struct ListIter<E>
{
	node mut?*List<E>
}
fn iter(il ?*List<E!>) ListIter<E>
{
	return {il}
}
fn (it mut ListIter<E!>) next() ?E
{
	n := it.node?
	e := n.data
	it.node = n.next
	return e
}
fn test_list()
{
	n1 := prepend(none, 4)
	// literal struct inference for comparisons
	assert n1 == {4, none}
	n2 := prepend(&n1, 3)
	assert n2 == {3, &n1}

	mut it := iter(&n2)
	assert it.next() == 3
	assert it.next() == 4
	assert it.next() == none
	assert iter(none).next() == none
}
