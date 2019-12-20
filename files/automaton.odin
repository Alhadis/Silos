#load "regextree.odin";
#import "bitset.odin";

Automaton :: struct {
    // states are integers, 0 is start state
    state :      u8, // current state
    final :     u64, // bitset
    delta : [][]u64,
}

build_nfa :: proc (using t : ^SyntaxTreeNode) -> ^Automaton {
    using ret := new(Automaton);

    state = 0; // unnecessary
    final = empty ? last | 1 : last;

    // TODO(Felix): I HAVE NO IDEA

    return ret;
}

print_automaton :: proc (using a : ^Automaton) {

}
