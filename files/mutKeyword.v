
// mut 关键字比较新颖啊，如果age不加mut 后面的age=20赋值会报错（age是不可变的）
fn main(){
    mut age := 20
    println(age)
    age = 21
    println(age)
}