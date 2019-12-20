import_load "../bitset.odin";
import_load "fmt.odin";
test_cut_set :: proc () {
	test_simple();
	test_one_not();
}

test_simple :: proc () {
	a  := create_set(1,2,3,20,64,100);
 	b  := create_set(1,2,3,21,65,100);
	ga := get_all(cut_set(a,b));
	assert(len(ga) == 4);
	assert(ga[0] == 1);
	assert(ga[1] == 2);
	assert(ga[2] == 3);
	assert(ga[3] == 100);
}

test_one_not :: proc () {
	a  := create_set(1,2,3,20,64,100);
 	b  := create_set(1,2,3,21,65,100);
	b.is_not_set = true;
	set(b, 3);

	ga := get_all(cut_set(a,b));
	assert(len(ga) == 3);
	assert(ga[0] == 3);
	assert(ga[1] == 20);
	assert(ga[2] == 64);
}
