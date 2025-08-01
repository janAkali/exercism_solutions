import std/strutils

func dump(n: int, char: char): string =
  if char == '\0': return
  if n == 1: return $char
  if n > 1: return $n & char

proc encode*(input: string): string =
  var 
    memChar: char
    count = 0

  for char in input:
    if char in Letters+Whitespace: 
      if char == memChar:
        count.inc()
      else:
        result &= dump(count, memChar)
        memChar = char
        count = 1
    else:
      result &= dump(count, memChar)
      result &= char
      memChar = '\0'
      count = 0
  result &= dump(count, memChar)

proc decode*(input: string): string =
  var digits = ""

  for char in input:
    case char:
      of Digits:
        digits &= char 
      of Letters, Whitespace:
        if digits.len > 0:
          result &= repeat(char, parseInt(digits))
        else:
          result &= char
        digits = ""
      else:
        result &= char
