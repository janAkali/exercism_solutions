import std/[sequtils, math]

proc isValid*(input: string): bool =
  let input = input.filterIt( it != ' ' )

  if input.len <= 1: return false
  if input.anyIt(it notin {'0'..'9'}): return false

  var digits = input.mapIt(it.ord - '0'.ord)
  for index in countDown(digits.high - 1, 0, step = 2):
    let double = digits[index] * 2
    digits[index] = if double >= 10: double - 9 else: double
  sum(digits) mod 10 == 0
