type
  Aliquot* = enum
    Deficient = -1, Perfect, Abundant

func getFactorSum(n: int): int =
  for i in 1..<n:
    if n mod i == 0: result += i

func classify*(n: int): Aliquot =
  if n < 1: raise new ValueError
  cmp(getFactorSum(n), n).Aliquot
