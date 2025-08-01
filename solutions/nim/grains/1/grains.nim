import math

proc onSquare*(n: int): uint64 =
  if n < 1 or n > 64: raise newException(ValueError,"Only 1-64 integers allowed.")
  2'u64 ^ (n - 1)

proc total*: uint64 =
  for i in 0..63:
    result += (2'u64 ^ i)
