import std/[re, strutils]

type
  ISBN = string

func asInt(digit: char):int =
  if digit notin Digits: raise newException(ValueError, "")
  ord(digit) - ord('0')

func isValid*(id: ISBN): bool =
  let id = id.replace("-","")
  if not id.match(re"^\d{9}[X\d]$"): return false

  var sum = 0
  for index, digit in id[0..8]: sum += digit.asInt * (10 - index )
  sum += (if id[9] == 'X': 10 else: id[9].asInt)
  sum mod 11 == 0
