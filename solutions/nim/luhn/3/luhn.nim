import std/[sequtils, strutils]

proc isValid*(input: string): bool =
  let input = input.filterIt( it != ' ' )
  if input.anyIt(it notin {'0'..'9'}): return false

  var digits = input.mapIt(it.ord - '0'.ord)
  if digits.len <= 1: return false

  for backIndex in countUp(2, input.len, step = 2):
    let double = digits[^backIndex] * 2
    digits[^backIndex] = if double >= 10: double - 9 else: double
  digits.foldl(a+b) mod 10 == 0
