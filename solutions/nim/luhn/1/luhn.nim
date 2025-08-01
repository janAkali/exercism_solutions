import std/[sequtils, strutils]

proc isValid*(input: string): bool =
  let input = input.filterIt( it != ' ' )
  if input.anyIt(it notin {'0'..'9'}): return false

  var digits = input.mapIt(it.ord - '0'.ord)
  if digits.len <= 1: return false

  for backIndex in 1..input.len:
    if backIndex mod 2 == 0:
      digits[^backIndex] *= 2
      if digits[^backIndex] > 9:
        digits[^backIndex] -= 9
  digits.foldl(a+b) mod 10 == 0
