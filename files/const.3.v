struct Color {
  r int
  g int
  b int
}

fn (c Color) str() string {
  return '$c.r $c.g $c.b'
}

fn rgb(r, g, b int) Color {
  return Color{r: r, g: g, b: b}
}

const (
  Numbers = [1, 2, 3]
  Red     = Color { r: 255, g: 0, b: 0 }
  Blue    = rgb(0, 0, 255)
  PI      = 3.14
  World   = '世界'
)

fn main(){
  println(Numbers)
  println(Red)
  println(Blue)
  println(PI)
  println(World)
}
