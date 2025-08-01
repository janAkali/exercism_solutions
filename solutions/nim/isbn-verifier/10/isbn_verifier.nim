import std/re

func asInt(digit: char):int = ord(digit) - ord('0')

func isValid*(isbn: string): bool =
  let isbn = isbn.replace(re"-")
  if not isbn.match(re"^\d{9}[X\d]$"): return false

  var sum = 0
  for index, digit in isbn[0..8]: 
    sum += digit.asInt * (10 - index)
  sum += (if isbn[9] == 'X': 10 else: isbn[9].asInt)
  sum mod 11 == 0
