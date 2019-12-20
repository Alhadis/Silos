#import . "regextree.odin";
#import . "berrysethi.odin";
#import . "automaton.odin";

test_regex :: proc () {
    regexp := "(ba)?(c(a|b)*)";

    tree := build_tree(regexp);
    berry_sethi(tree);

    /*print_tree(tree);*/

    nfa := build_nfa(tree);

    print_automaton(nfa);

}
