import std/[strutils, sequtils, math]

template parseInt(c: char): untyped = c.ord - '0'.ord

func isArmstrongNumber*(number: int): bool =
  let numString = $number
  number == numString.mapIt(it.parseInt() ^ numString.len()).sum()
