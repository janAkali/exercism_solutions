import math

proc onSquare*(n: int): uint64 =
  if n < 1 or n > 64: raise newException(ValueError, $n & " is not in the range 1-64")
  2'u64 ^ (n - 1)

proc total*: uint64 =
  uint64.high
