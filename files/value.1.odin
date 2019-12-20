package badscript

GCObject :: struct
{
	next: ^Value,
}

Value :: struct
{
	gc: GCObject,
	variant: union {
		Null,
		True,
		False,
		Number,
		String,
		Table,
		Userdata,
	},
}

Null :: struct
{
	using value: ^Value,
}

True :: struct
{
	using value: ^Value,
}

False :: struct
{
	using value: ^Value,
}

Number :: struct
{
	using value: ^Value,
	number: f64,
}

String :: struct
{
	using value: ^Value,
	text: string,
}

Table :: struct
{
	using value: ^Value,
	
}

Userdata :: struct
{
	using value: ^Value,
	data: rawptr,
}

_null_value  := Value{variant = Null{}};
_true_value  := Value{variant = True{}};
_false_value := Value{variant = False{}};
null_value   := &_null_value;
true_value   := &_true_value;
false_value  := &_false_value;

new_value :: proc(T: type) -> ^T
{
	v := new(Value);
	v.variant = T{value = v};
	return &(v.variant.(T));
}

value_add :: proc(lhs: ^Value, rhs: ^Value) -> ^Value
{
	n := new_value(Number);
	n.number = lhs.variant.(Number).number + rhs.variant.(Number).number;
	return n;
}