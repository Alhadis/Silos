using import "core:fmt.odin";
using import "core:strconv.odin";
import "core:os.odin";

test :: "((lambda (x) (print (+ 40 x))) (+ 1 1))";

Fake_Stream :: struct {
	text: string,
	loc: int,
};
EOF :: rune(-1);

getc :: proc(using stream: ^Fake_Stream) -> rune {
	if loc == len(text) {
		return EOF;
	} else if loc > len(text) {
		panic("You dun fucked up!");
		return 0;
	} else {
		loc = loc + 1;
		return cast(rune)text[loc - 1];
	}
}
ungetc :: proc(using stream: ^Fake_Stream) -> rune {
	if loc == 0 {
		return EOF;
	} else {
		loc = loc - 1;
		return cast(rune)text[loc];
	}
}

Symbol :: struct {
	name: string,
}
Cons :: struct {
	car, cdr: Element,
}
Nil :: Cons;
Literally_Nothing :: struct {};
Element :: union {
	int,
	Literally_Nothing,
	^Nil,
	^Symbol,
	^Cons,
}

nil_value: Nil;

read :: proc(stream: ^Fake_Stream) -> Element {
	for {
		char := getc(stream);
		switch char {
		case '(':
			return read_list(stream);
		case ')':
			return &nil_value;
		case ' ':
			continue;
		case EOF:
			return Literally_Nothing{};
		case:
			ungetc(stream);
			return read_atom(stream);
		}
	}
	return -1;
}
read_list :: proc(stream: ^Fake_Stream) -> Element {
	next := read(stream);
	el: Element;
	if val, ok := next.(^Nil); ok {
		el = &nil_value;
	} else {
		cons := new(Cons);
		cons.car = next;
		cons.cdr = read_list(stream);
		el = cons;
	}
	return el;
}
read_atom :: proc(stream: ^Fake_Stream) -> Element {
	valid_char :: proc(char: rune) -> bool {
		if char == '('
		    || char == ')'
		    || char == ' '
		do return false;
		else do return true;
	}
	is_digit :: proc(char: rune) -> bool {
		if char <= '9' && char >= '0'
		do return true;
		else do return false;
	}
	is_num := true;
	atom := new(String_Buffer);
	for {
		char := getc(stream);
		if !valid_char(char) {
			ungetc(stream);
			break;
		}
		if !is_digit(char) do is_num = false;
		write_rune(atom, char);
	}

	ret: Element;
	if is_num {
		num := parse_int(to_string(atom^));
		ret = num;
	} else {
		sym := new(Symbol);
		sym.name = to_string(atom^);
		ret = sym;
	}
	return ret;
}


print_sexp :: proc(sexp: Element) {
	switch v in sexp {
	case int:
		print(v);
	case ^Symbol:
		print(v.name);
	case ^Cons:
		print("(");
		print_cons(v);
		print(")");
	case ^Nil:
		print("nil");
	}
}
print_cons :: proc(cons: ^Cons) {
	print_sexp(cons.car);
	switch v in cons.cdr {
	case ^Cons:
		print(" ");
		print_cons(v);
	case ^Nil:
		return;
	case:
		print(" . ");
		print_sexp(v);
		return;
	}
}

print_el :: proc(el: Element) {
	switch v in el {
	case ^Cons:
		print("^Cons{");
		print_el(v.car);
		print(", ");
		print_el(v.cdr);
		print("}");
	case ^Symbol:
		print("^Symbol{\"",
			v.name,
			"\"}");
	case ^Nil:
		print("nil");
	case Literally_Nothing:
		print("BOOP");
	case int:
		print(v);
	}
}


foo: [0]int;

main :: proc() {
	nil_value.car = &nil_value;
	nil_value.cdr = &nil_value;

	stream := Fake_Stream{test, 0};
	print("Parsing \"", test, "\"\n");
	el := read(&stream);
	//print("Got: ");
	//print_el(el);
	//println();
	print("=> ");
	print_sexp(el);
	println();
	//printf("%v\n",union_type_info(el.(^Cons).car));
}

union_type_info :: proc(v: any) -> ^Type_Info { // provided by @bpunsky#3852
    info := type_info_base(v.type_info).variant.(Type_Info_Union); // assert if not union

    tag_ptr := uintptr(v.data) + info.tag_offset;
    tag_any := any{rawptr(tag_ptr), info.tag_type};

    tag: i64 = -1;
    switch i in tag_any {
    case u8:   tag = i64(i);
    case i8:   tag = i64(i);
    case u16:  tag = i64(i);
    case i16:  tag = i64(i);
    case u32:  tag = i64(i);
    case i32:  tag = i64(i);
    case u64:  tag = i64(i);
    case i64:  tag = i64(i);
    case u128: tag = i64(i);
    case i128: tag = i64(i);
    case: panic("Invalid union tag type");
    }

    if v.data != nil && tag != 0 {
        return info.variants[tag-1];
    }

    return nil;
}

