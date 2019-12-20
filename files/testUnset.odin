import_load "../bitset.odin";

test_unset :: proc () {
	test_single();
	test_multiple();
	test_with_not_set_and_append();
}

test_single :: proc () {
	a := create_set(1, 3, 7, 51, 33);
	unset(a, 3);
	unset(a, 51);

	assert(len(a.bits) == 2);
	assert(a.bits[0] == 0b0000_0000__0000_0000__0000_0000__1000_0010);
	assert(a.bits[1] == 0b0000_0000__0000_0000__0000_0000__0000_0010);
}

test_multiple :: proc () {
	a := create_set(1, 3, 7, 51, 33, 12, 44);
	unset(a, 3, 1, 33);

	assert(len(a.bits) == 2);
	assert(a.bits[0] == 0b0000_0000__0000_0000__0001_0000__1000_0000);
	assert(a.bits[1] == 0b0000_0000__0000_1000__0001_0000__0000_0000);
}

test_with_not_set_and_append :: proc () {
	a := create_set(1, 3, 7, 51, 33, 12, 44);
	unset(a, 3, 1, 33);
	a.is_not_set = true;
	unset(a, 65);
	assert(a.bits[0] == 0b0000_0000__0000_0000__0001_0000__1000_0000);
	assert(a.bits[1] == 0b0000_0000__0000_1000__0001_0000__0000_0000);
	assert(a.bits[2] == 0b0000_0000__0000_0000__0000_0000__0000_0010);
}
