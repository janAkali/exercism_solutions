import math, sequtils, strformat

proc convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
  if fromBase < 2 or toBase < 2: raise newException(ValueError,"Base can't be less than 2.")
  if digits.sum == 0: return @[0]

  var decVal: int = 0

  for power in 0..digits.high:
    let digit = digits[ ^(power + 1) ]
    if digit < 0 or digit > fromBase - 1: raise newException(ValueError, &"{digit} digit is invalid for base {fromBase}.")
    decVal += digit * fromBase ^ power

  while decVal > 0:
    result.insert(decVal mod toBase, 0)
    decVal = decVal div toBase
