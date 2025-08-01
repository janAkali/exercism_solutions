const RomanNumerals = [
  ("M" , 1000), ("CM", 900), ("D" , 500),("CD", 400), ("C" , 100),
  ("XC", 90), ("L" , 50), ("XL", 40), ("X" , 10),
  ("IX", 9), ("V" , 5), ("IV", 4), ("I" , 1),
  ]

proc roman*(decimal: int): string =
  var number = decimal

  while number > 0:
    for (romStr, romNum) in RomanNumerals:
      if number - romNum >= 0: 
        number -= romNum
        result &= romStr
        break 
