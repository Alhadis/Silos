get_symbol_type :: proc(symbol : u8) -> SymbolType {
    match symbol {
        case OR_SYMBOL:         return SymbolType.Or;
        case REPEAT_SYMBOL:     return SymbolType.Repeat;
        case ATLEASTONE_SYMBOL: return SymbolType.AtLeastOne;
        case OPTION_SYMBOL:     return SymbolType.Option;
        default: return SymbolType.Terminal;
    }
}

build_tree :: proc(exp : string) -> ^SyntaxTreeNode {
    if is_in_brackets(exp) {
        return build_tree(exp[1..len(exp)-2]);
    }

    using sTree := new(SyntaxTreeNode);
    using SymbolType;

    pos : u32;
    type, pos = get_lowest_operator(exp);

    println(exp, type,pos);

    match type {
        case Undefined:
            panic("The Syntax is wrong");
        case Terminal:
            type = Terminal;
            // TODO string conversion
            //symbol = exp[pos];
        case Option, Repeat, AtLeastOne: // unary operator (right side)

        case Or:                         // binary operator
            left  := exp[0..<pos];
            right := exp[pos+1..];
            println(left, right);
            append(children, build_tree(left));
            append(children, build_tree(right));
        case Concat:                     // sonderfall
            left  := exp[0..<pos];
            right := exp[pos..];

            append(children, build_tree(left));
            append(children, build_tree(right));

    }

    return sTree;
}


print_tree :: proc (using tree : SyntaxTreeNode) {
    println(type);
    //println("c", children);
    for c in children {
        print_tree(c^);
    }
}

split_at_lowest_operator :: proc(tokenArray : []string) -> ([]string, []string, SymbolType ) {
    using SymbolType;

    // remove unnecessary other brackets
    for is_in_brackets(tokenArray) {
        tokenArray = tokenArray[1..len(tokenArray)-2];
    }
    pos, type   := get_lowest_operator(tokenArray);
    left, right : []string;

    match type {
        case Terminal:
        case Concat:
        case Or:
            left  = tokenArray[0..pos-1];
            right = tokenArray[pos+1..len(tokenArray)-1];
        case Repeat, Option, AtLeastOne:
    }

    return left, right, type;
}

get_lowest_operator :: proc(str : string) -> (SymbolType, u32) {
    // for returning
    operator : SymbolType;
    operatorPos : u32 = 0;
    // for loop
    posInStr : u32 = 0;
    currChar : u8;

    for {
        // if reached end of the string -> break
        if posInStr == u32(len(str)) { break; }

        currChar = str[posInStr];

        // if currChar is ( then jump to end, or if posInStr == 0 and ) is the
        // last char to the corresponding ( then return the lowest operator in
        // the parenthesies.
        if currChar == u8('(') {
            closeBracketsPos := find_closing_brackets(posInStr, str);
            if closeBracketsPos == 0 { return SymbolType.Undefined, 0; };
            if posInStr == 0 && closeBracketsPos == u32(len(str)-1) {
                return get_lowest_operator(str[1..len(str)-2]);
            } else {
                posInStr = closeBracketsPos + 1;
            }
        } else {
            // currChar is not a (
            // if it is an operator , check if it is lower than the actual
            // else -> keep searching
            match currChar {
                case OR_SYMBOL, REPEAT_SYMBOL, ATLEASTONE_SYMBOL, OPTION_SYMBOL:
                    currSymbol := get_symbol_type(currChar);
                    if operator == SymbolType.Undefined || currSymbol < operator {
                        operator = currSymbol;
                        operatorPos = posInStr;
                    }
            }
            // println(posInStr, operator, operatorPos);
            posInStr++;
        }
    }

    // checking for concatination
    if operator > SymbolType.Concat || operator == SymbolType.Undefined {
        for i in 0..len(str)-2 {
            type1 := get_symbol_type(str[i]);
            type2 := get_symbol_type(str[i+1]);
            if type1 == type2 && type1 == SymbolType.Terminal {
                operator = SymbolType.Concat;
                operatorPos = u32(i+1);
                break;
            }
        }
    }

    // if still hasn't found any it has to be a Terminal
    if operator == SymbolType.Undefined {
        operator = SymbolType.Terminal;
        operatorPos = 0;
    }

    return operator, operatorPos;
}
