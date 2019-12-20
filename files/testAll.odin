import_load "fmt.odin";
import_load "testSet.odin";
import_load "testUnset.odin";
import_load "testCutSet.odin";

test :: proc() {
	test_set();
	test_unset();
	test_cut_set();
	/*test_get();
	test_copy_set();
	test_union_set();
	test_difference_set();*/

	println("All tests passed.");
}


/*
test_get :: proc () {
	a := create_set(0, 2, 4, 5, 33, 100);

	assert(get(a, 0));
	assert(get(a, 2));
	assert(get(a, 4));
	assert(get(a, 5));
	assert(get(a, 33));
	assert(get(a, 100));

	assert(!get(a, 1));
	assert(!get(a, 3));
	assert(!get(a, 7));
	assert(!get(a, 35));
	assert(!get(a, 99));

	ga := get_all(a);

	assert(len(ga) == 6);
	assert(ga[0] == 0);
	assert(ga[1] == 2);
	assert(ga[2] == 4);
	assert(ga[3] == 5);
	assert(ga[4] == 33);
	assert(ga[5] == 100);
}


test_copy_set :: proc () {
	a := create_set(1, 2, 4);
	b := copy_set(a);

	set(a, 3, 5);
	unset(a, 1);

	unset(b, 2, 1);
    set(b, 8, 9, 10);

	assert(len(a.bits) == 1);
	assert(a.bits[0]   == 60);

	assert(len(b.bits) == 1);
	assert(b.bits[0]   == 1808);

	// not_sets
	c := create_set(1,2,3);
	c = not_set(c);
	d := copy_set(c);
	assert(d.is_not_set);
}

test_union_set :: proc () {
	a := create_set(1, 2, 3, 33);
	b := create_set(1, 2, 0, 44);
	u := union_set(a,b);
	ga := get_all(u);

	assert(len(ga) == 6);
	assert(ga[0] == 0);
	assert(ga[1] == 1);
	assert(ga[2] == 2);
	assert(ga[3] == 3);
	assert(ga[4] == 33);
	assert(ga[5] == 44);

	// both not
	a = not_set(a);
	b = not_set(b);
	u = union_set(a, b);
	ga = get_all(u);
	assert(len(ga) == 62);

	// one is
	a = not_set(a);
	u = union_set(a, b);
	ga = get_all(u);
	assert(len(ga) == 62);

	a = not_set(a);
	b = not_set(b);
	__elementary_unset(a, 1, 2);
	u = union_set(a, b);
	ga = get_all(u);
	assert(len(ga) == 60);
}

test_difference_set :: proc () {
	a := create_set(1, 4, 8, 16, 20, 33);
	b := create_set(1, 8, 20, 25, 30);
	d := difference_set(a, b);
	ga := get_all(d);

	assert(len(ga) == 3);
	assert(ga[0] == 4);
	assert(ga[1] == 16);
	assert(ga[2] == 33);

	d = difference_set(b, a);
	ga = get_all(d);
	assert(len(ga) == 2);
	assert(ga[0] == 25);
	assert(ga[1] == 30);

	// both not_sets
	a = not_set(a);
	b = not_set(b);
	d = difference_set(b, a);
	ga = get_all(d);
	assert(len(ga) == 3);
	assert(ga[0] == 4);
	assert(ga[1] == 16);
	assert(ga[2] == 33);

	d = difference_set(a, b);
	ga = get_all(d);
	assert(len(ga) == 2);
	assert(ga[0] == 25);
	assert(ga[1] == 30);

	// a is regular, b is not_set
	a = not_set(a);
	d = difference_set(a, b);
	ga = get_all(d);
	assert(len(ga) == 3);
	assert(ga[0] == 1);
	assert(ga[1] == 8);
	assert(ga[2] == 20);

	// a is not_set, b is regular
	a = not_set(a);
	b = not_set(b);
	d = difference_set(a, b);
	ga = get_all(d);
	assert(len(ga) == 56);
}*/
