#import "fmt.odin";
#import . "lexer.odin";
#import . "parser.odin";
#import . "ast.odin";

// Crash: https://gist.github.com/anonymous/ecfd39c1cdeb5be41f6d7a3310fcac4d

indents := 0;
indent :: proc() {
    for i in 1..indents {
        fmt.printf("  ");
    }
}

print_expression :: proc(expr: ^Node) {
    match expr.type {
        case NodeType.BinaryOp: {
            n := ^BinaryOp(expr);
            indent();
            fmt.println(n^);
            indents++;
            print_expression(n.lhs);
            print_expression(n.rhs);
            indents--;
        }
        case NodeType.UnaryOp: {
            n := ^UnaryOp(expr);
            indent();
            fmt.println(n^);
            indents++;
            print_expression(n.rhs);
            indents--;
        }
        case NodeType.Literal: {
            n := ^Literal(expr);
            indent();
            fmt.println(n^);
        }
        case NodeType.Declaration: {
            n := ^Declaration(expr);
            indent();
            fmt.println(n^);
            indents++;
            if n.ident != nil {print_expression(n.ident);}
            if n.dtype != nil {print_expression(n.dtype);}
            if n.expr != nil {print_expression(n.expr);}
            indents--;
        }
        
        case: {
            fmt.println("Unimplemented print_expression!");
        }
    }
}

main :: proc() {
    parser := new(Parser);
    init_parser(parser, "test.b");
    
    expr := parse_statement(parser);
    print_expression(expr);
}