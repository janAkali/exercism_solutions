type
  Classification* = enum
    Deficient = -1, Perfect, Abundant

func getAliquotSum(n: int): int =
  for i in 1..<n:
    if n mod i == 0: result += i

func classify*(n: int): Classification =
  if n < 1: raise new ValueError
  cmp(getAliquotSum(n), n).Classification
