import strutils, sequtils, math

func toInt(c:char):int = parseInt($c)

proc isArmstrongNumber*(number: int): bool =
  let numString = $number
  number == numString.mapIt( toInt(it) ^ numString.len ).sum
