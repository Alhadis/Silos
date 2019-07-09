fn gcd(A int, B int) int{
  if B > A {
    return gcd(B,A)
  } 
  if A % B > 0 {
    return gcd(B, A % B)
  } 
  if A % B == 0 {
    return B
  }
}

fn test_gcd() {
  assert gcd(8,12) == 4
  assert gcd(390,273) == 39
}