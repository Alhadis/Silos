#load "fmt.odin";
#import "bitset.odin";

OR_SYMBOL         :: "|";
REPEAT_SYMBOL     :: "*";
ATLEASTONE_SYMBOL :: "+";
OPTION_SYMBOL     :: "?";

// starts at 1 so uninitialized is an invalid state
SymbolType :: enum {
    Terminal = 1,
    Or,         // |
    Concat,
    Option,     // ?
    AtLeastOne, // +
    Repeat,     // *
}

SyntaxTreeNode :: struct {
    type     : SymbolType,
    children : [dynamic]^SyntaxTreeNode,

    // if type is terminal these become relevant:
    symbol : string, // symbols can be more than 1 char: \d or \(

    // for berry sethi -> u64s are bitsets
    empty : bool,
    first : u64,
    last  : u64,
    next  : u64,

    // only for terminals
    number : u8,
}

split_into_tokens :: proc(exp : string) -> []string {
    ret : [dynamic]string;
    for i := 0; i < len(exp); i+=1 {
        if exp[i] == '\\' {
            append(ret, exp[i..i+1]);
            i++;
        } else {
            append(ret, exp[i..i]);
        }
    }
    return ret[..]; // convert to normal array
}

find_closing_brackets :: proc(tokenSteam: []string, posInStream : int) -> int {
    nestness := 0;
    for i in posInStream+1 ..< len(tokenSteam) {
        if tokenSteam[i] == "(" {
            nestness++;
        } else if tokenSteam[i] == ")" {
            if nestness == 0 {
                return i;
            }
            nestness--;
        }
    }
    panic("Closing brackets are missing somewhere");
    return 0;
}

is_in_brackets :: proc(tokenArray : []string) -> bool {
    return tokenArray[0] == "(" &&
           find_closing_brackets(tokenArray, 0) == len(tokenArray)-1;
}

get_symbol_type :: proc(symbol : string) -> SymbolType {
    using SymbolType;

    match symbol {
        case OR_SYMBOL:         return Or;
        case REPEAT_SYMBOL:     return Repeat;
        case ATLEASTONE_SYMBOL: return AtLeastOne;
        case OPTION_SYMBOL:     return Option;
        case:                   return Terminal;
    }
}

get_lowest_operator :: proc(tokenArray : []string) -> (SymbolType, int) {
    using SymbolType;

    if is_in_brackets(tokenArray) {
        pos, type := get_lowest_operator(tokenArray[1..len(tokenArray)-2]);
        return pos+1, type;
    }

    lowestOperator    : SymbolType;
    lowestOperatorPos : int;

    posInArr := 0;
    curToken : string;

    for { // TODO(Felix): make this a c style for
        if posInArr == len(tokenArray) { break; }

        // skip brackets
        curToken = tokenArray[posInArr];
        if curToken == "(" {
            closing := find_closing_brackets(tokenArray, posInArr);
            posInArr = closing + 1;
        } else {
            // curToken is not a (
            // if it is an operator, check if it is lower than the current
            // else -> keep searching
            curSymbol := get_symbol_type(curToken);
            if curSymbol != Terminal &&
               (lowestOperator == 0 || lowestOperator > curSymbol)
            {
                lowestOperator    = curSymbol;
                lowestOperatorPos = posInArr;
            }
            posInArr++;
        }
    }

    // checking for concatination
    if lowestOperator == 0 || lowestOperator > SymbolType.Concat {
        for i := 0; i < len(tokenArray)-1; i+=1 {
            /*println(tokenArray[i]);*/
            if tokenArray[i] == "(" {
                // concat before parenth open
                if i > 0 && tokenArray[i-1] != "(" {
                    lowestOperator = SymbolType.Concat;
                    lowestOperatorPos = i;
                    /*println("concat:", tokenArray[i-1..i]);*/
                    break;
                } else { // concat after parenthesies close
                    i = find_closing_brackets(tokenArray, i);
                    /*println("jumping to:", i);*/
                    if i > len(tokenArray)-2 { break; }
                }
            }
            // NOTE(Felix): maybe only type2 has to be terminal and type 1 can be
            // whatever but i has to be greater 0?? maybe..
            type1 := get_symbol_type(tokenArray[i]);
            type2 := get_symbol_type(tokenArray[i+1]);
            if (type1 == AtLeastOne ||
                type1 == Repeat ||
                type1 == Option ||
                type1 == Terminal) &&
                type2 == Terminal
            {
                lowestOperator = SymbolType.Concat;
                lowestOperatorPos = i+1;
                /*println("concat:", tokenArray[i..i+1]);*/
                break;
            }
        }
    }

    if lowestOperator == 0 {
        lowestOperator = SymbolType.Terminal;
        lowestOperatorPos = 0;
    }

    return lowestOperator, lowestOperatorPos;
}

build_tree :: proc(exp : string) -> ^SyntaxTreeNode {
    return build_tree(split_into_tokens(exp));
}

build_tree :: proc(tokenArray : []string) -> ^SyntaxTreeNode {
    using SymbolType;

    using tree := new(SyntaxTreeNode);

    for is_in_brackets(tokenArray) {
        tokenArray = tokenArray[1..len(tokenArray)-2];
    }

    pos : int;
    type, pos = get_lowest_operator(tokenArray);
    left, right: []string;

    match type {
        case Concat: // concat is special because tehre is no symbol
            left  = tokenArray[0..<pos];
            right = tokenArray[pos..len(tokenArray)-1];
            append(children, build_tree(left));
            append(children, build_tree(right));
        case Or: // infix operator
            left  = tokenArray[0..<pos];
            right = tokenArray[pos+1..len(tokenArray)-1];
            append(children, build_tree(left));
            append(children, build_tree(right));
        case AtLeastOne, Option, Repeat: // postfix operator
            left = tokenArray[0..<pos];
            append(children, build_tree(left));
        case Terminal:
            symbol = tokenArray[0]; // NOTE(Felix): is that right???
            /* NOTE(Felix): We can start assigning terminals number here already
                            using a global counter
            */
    }
    return tree;
}

print_tree :: proc(t : ^SyntaxTreeNode) {
    print_tree(t,"",true);
}

print_tree :: proc(using t : ^SyntaxTreeNode, prefix : string, isTail : bool) {
    print(prefix, isTail ?  "└── " : "├── ", type);

    // berri sethi info printing starts here -->
    for _ in 0..(35-len(prefix)-len(aprint(type))) {
        print(" ");
    }

    print(" empty: ", empty);
    if empty {
        print(" ");
    }
    print("\tfirst: ", bitset.get_all(first));
    print("\tnext:  ", bitset.get_all(next));
    print("\tlast:  ", bitset.get_all(last));

    if type == SymbolType.Terminal {
        print("\t\tid: [", number, "]");
        print("\tsymbol: '", symbol , "'");
    }
    // <-- and ends here

    println();
    for c, idx in children {
        print_tree(c, aprint(prefix, isTail ? "    " : "|   "),
                      (idx == len(children)-1));
    }
}

get_test_tree :: proc() -> ^SyntaxTreeNode {
    // NOTE(Felix): Returns tree for "a((a|bc?)|cd)b*a"

    using SymbolType;

    a, b, c, d, o : ^SyntaxTreeNode;
    c = new(SyntaxTreeNode);
    c.type = Terminal;
    c.symbol = "c";
    o = new(SyntaxTreeNode);
    o.type = Option;
    append(o.children, c);
    b = new(SyntaxTreeNode);
    b.type = Terminal;
    b.symbol = "b";
    c = new(SyntaxTreeNode);
    c.type = Concat;
    append(c.children, b, o);
    a = new(SyntaxTreeNode);
    a.type = Terminal;
    a.symbol = "a";
    o = new(SyntaxTreeNode);
    o.type = Or;
    append(o.children, a, c);
    c = new(SyntaxTreeNode);
    c.type = Terminal;
    c.symbol = "c";
    d = new(SyntaxTreeNode);
    d.type = Terminal;
    d.symbol = "d";
    b = new(SyntaxTreeNode);
    b.type = Concat;
    append(b.children, c, d);
    c = new(SyntaxTreeNode);
    c.type = Or;
    append(c.children, o, b);
    a = new(SyntaxTreeNode);
    a.type = Terminal;
    a.symbol = "a";
    b = new(SyntaxTreeNode);
    b.type = Concat;
    append(b.children, a, c);
    d = new(SyntaxTreeNode);
    d.type = Terminal;
    d.symbol = "b";
    c = new(SyntaxTreeNode);
    c.type = Repeat;
    append(c.children, d);
    d = new(SyntaxTreeNode);
    d.type = Concat;
    append(d.children, c, a);
    c = new(SyntaxTreeNode);
    c.type = Concat;
    append(c.children, b, d);
    return c;
}
