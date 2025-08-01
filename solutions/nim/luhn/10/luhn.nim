import std/[sequtils, math]

proc isValid*(input: string): bool =
  if input.anyIt(it notin {'0'..'9', ' '}): return false

  var digits = input.filterIt( it != ' ' ).mapIt(it.ord - '0'.ord)
  if digits.len <= 1: return false

  for index in countDown(digits.high - 1, 0, step = 2):
    let double = digits[index] * 2
    digits[index] = if double > 9: double - 9 else: double

  sum(digits) mod 10 == 0
