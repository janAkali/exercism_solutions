import std/[enumutils, sequtils, strutils, algorithm]

type
  RomanNumeral = enum
    I  = 1  
    IV = 4
    V  = 5
    IX = 9
    X  = 10
    XL = 40
    L  = 50
    XC = 90
    C  = 100
    CD = 400
    D  = 500
    CM = 900
    M  = 1000

let rNumerals = RomanNumeral.toSeq.reversed()

proc roman*(n: int): string =
  var number = n

  for roman in RomanNumeral:
    if n == roman.ord: return $roman

  while number > 0:
    for rom in rNumerals:
      if number - rom.ord >= 0: 
        number -= rom.ord
        result &= $rom
        break 
