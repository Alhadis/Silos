
struct MyStruct { a: Int; }

struct OtherStruct { b: MyStruct; }

fn main() { let ms = OtherStruct(MyStruct(11)); ms.b.a }
