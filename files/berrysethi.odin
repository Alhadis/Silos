#import "bitset.odin";
#load "regextree.odin";

// NOTE(Felix): terminals will be states and 0 will be the separate start state
terminalIdCounter : u8 = 1;

compute_name_and_empty_and_first_and_last :: proc (using t : ^SyntaxTreeNode) {
    using SymbolType;

    if type == Terminal {
        number = terminalIdCounter;
        terminalIdCounter += 1;
        empty = false;
        bitset.set(&first, number);
        bitset.set(&last, number);
    } else {
        for c in children {
            compute_name_and_empty_and_first_and_last(c);
        }
        match type {
            case Option:
                empty = true;
                first = children[0].first;
                // TODO(Felix): check next line again
                last  = children[0].last;
            case Repeat:
                empty = true;
                first = children[0].first;
                last  = children[0].last;
            case Or:
                // empty
                empty = false;
                for c in children {
                    empty |= c.empty;
                }
                // first
                first = 0;
                for c in children {
                    first |= c.first;
                }
                // last
                last = 0;
                for c in children {
                    last |= c.last;
                }
            case Concat:
                // empty
                empty = true;
                for c in children {
                    empty &= c.empty;
                }
                // first
                if children[0].empty {
                    first = 0;
                    for c in children {
                        first |= c.first;
                    }
                } else {
                    first = children[0].first;
                }
                // last
                last = 0;
                last = children[1].last | (children[1].empty ? children[0].last : 0);

            case AtLeastOne:
                empty = children[0].empty;
                first = children[0].first;
                // TODO(Felix): check next line again
                last  = children[0].last;
        }
    }
 }

compute_next :: proc (using t : ^SyntaxTreeNode) {
    using SymbolType;

    match type {
        case Option:
            // TODO(Felix): check again
            children[0].next = next;
        case Repeat:
            children[0].next = children[0].first | next;
            compute_next(children[0]);
        case Or:
            for i in 0..<len(children) {
                children[i].next = next;
            }
            for c in children {
                compute_next(c);
            }
        case Concat:
            children[0].next = children[1].first | (children[1].empty ? next : 0);
            children[1].next = next;
            compute_next(children[0]);
            compute_next(children[1]);
        case AtLeastOne:
            // TODO(Felix): check again
            // NOTE(Felix): copied from repeat
            children[0].next = children[0].first | next;
            compute_next(children[0]);

    }
}

berry_sethi :: proc (t : ^SyntaxTreeNode) {
    compute_name_and_empty_and_first_and_last(t);
    compute_next(t);
}
