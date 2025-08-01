import strutils, parseutils, sequtils, math

proc isArmstrongNumber*(number: int): bool =
  let numarray = number.intToStr.mapIt(parseInt($it))
  number == numarray.mapIt( it ^ numarray.len ).sum
