fn main() {
  s := 'Hello, world. Abcdefghijklmn.'
  mut printing := false
  for c in s {
    if c == 0x63 {
      printing = true
    }
    if printing {
      print(c.str())
    }
  }
  print('\n')
}
