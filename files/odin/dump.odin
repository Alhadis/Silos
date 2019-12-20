package koi

import "core:os"
import "core:fmt"

print_node :: proc(out: os.Handle, node: ^Node) {
	if node == nil do fmt.fprintf(out, "6;nil;;");
	switch n in node.kind {
		case NodeNull:
			fmt.fprintf(out, "6;Null;;");
		case NodeTrue:
			fmt.fprintf(out, "6;True;;");
		case NodeFalse:
			fmt.fprintf(out, "6;False;;");
		case NodeIdent:
			fmt.fprintf(out, "6;Ident;%s;", n.name);
		case NodeNumber:
			fmt.fprintf(out, "6;Number;%v;", n.value);
		case NodeString:
			fmt.fprintf(out, "6;String;%v;", n.value);
		case NodeIndex:
			fmt.fprintf(out, "7;Index;");
			//print_node()
			fmt.fprintf(out, ";");			
		case NodeField:
			fmt.fprintf(out, "6;Field;Stub;");
		case NodeCall:
			fmt.fprintf(out, "6;Call;Stub;");
		case NodeBinary:
			fmt.fprintf(out, "7;Binary %v;", n.op);
			fmt.fprintf(out, "7;lhs;");
			print_node(out, n.lhs);
			fmt.fprintf(out, ";");

			fmt.fprintf(out, "7;rhs;");
			print_node(out, n.rhs);
			fmt.fprintf(out, ";");

			fmt.fprintf(out, ";");
		case NodeUnary:
			fmt.fprintf(out, "6;Unary;Stub;");
		case NodeAssignment:
			fmt.fprintf(out, "6;Assignment;Stub;");
		case NodeBlock:
			fmt.fprintf(out, "7;Block (%v);", len(n.stmts));
			for i in 0..len(n.stmts)-1 {
				print_node(out, n.stmts[i]);
			}
			fmt.fprintf(out, ";");
		case NodeVariableDecl:
			fmt.fprintf(out, "7;VariableDecl: %v;", n.name);
			fmt.fprintf(out, "6;Name;%v;", n.name);
			fmt.fprintf(out, "7;Expr;");
			if n.expr != nil do print_node(out, n.expr);
			fmt.fprintf(out, ";");
			fmt.fprintf(out, ";");
		case NodeFn:
			fmt.fprintf(out, "7;Fn %s;", n.name);
			fmt.fprintf(out, "6;Name;%s;", n.name);
			fmt.fprintf(out, "7;Args (%v);", len(n.args));
			for a, i in n.args {
				fmt.fprintf(out, "6;#%v;%v;", i, a);
			}
			fmt.fprintf(out, ";");
			print_node(out, n.block);
			fmt.fprintf(out, ";");
		case NodeIf:
			fmt.fprintf(out, "6;If;Stub;");
		case NodeForType:
			fmt.fprintf(out, "6;ForType;Stub;");
		case NodeFor:
			fmt.fprintf(out, "6;For;Stub;");
		case NodeReturn:
			fmt.fprintf(out, "7;Return;");
			print_node(out, n.expr);
			fmt.fprintf(out, ";");
		case NodeImport:
			fmt.fprintf(out, "6;Import;Stub;");
		case NodeTableLiteral:
			fmt.fprintf(out, "6;TableLiteral;Stub;");
		case NodePrint:
			fmt.fprintf(out, "6;Print;Stub;");
		case NodeLen:
			fmt.fprintf(out, "6;Len;Stub;");
		case NodeFnExpr:
			fmt.fprintf(out, "6;FnExpr;Stub;");
		case: panic("Invalid node in print_node");
	}
}

dump_nodes :: proc(nodes: []^Node) {
	dump, _ := os.open("ast.dump", os.O_CREATE);
	for i in 0..len(nodes)-1 {
		print_node(dump, nodes[i]);
	}
	os.close(dump);

}