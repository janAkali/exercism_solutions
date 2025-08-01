import std/math

type
  Classification* = enum
    Perfect, Deficient, Abundant

func getFactorSum(n: int): int =
  for i in 1..<n:
    if n mod i == 0: result += i

proc classify*(n: int): Classification =
  if n < 1: raise new ValueError
  let a = n - getFactorSum(n)
  if a == 0: Perfect
  elif a > 0: Deficient
  else: Abundant
