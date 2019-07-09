fn main() {
    mut m := map[string]int{}
    m['衛宮士郎'] = 167
    m['セイバー'] = 154
    m['遠坂凛'] = 159
    m['間桐桜'] =156

    get_height(m, 'セイバー')
    get_height(m, '遠坂凛')
    get_height(m, '間桐桜')
}

fn get_height(m map_int,name string){
    height := m[name].str()
    println('$name: \t$height cm')
}