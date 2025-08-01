proc distance*(a, b: string): int =
  if a.len != b.len: 
    raise newException(ValueError,"not matching length")
  for i in 0..<a.len:
    if a[i] != b[i]:
      result += 1
