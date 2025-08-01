import std/[strutils, tables]

const 
  ALLOWEDRANGE = 0..999_999_999_999
  DIVISORS = {
    1_000_000_000: "billion",
    1_000_000: "million",
    1_000: "thousand",
    100: "hundred",
  }.toOrderedTable()
  DISTINCT = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    20: "twenty",
    30: "thirty",
    40: "forty",
    50: "fifty",
    80: "eighty",
  }.toTable()

func say*(number: int64): string =
  if number notin ALLOWEDRANGE:
    raise newException(ValueError, "number should be between 0 and 999_999_999_999")
  if DISTINCT.hasKey(int(number)): return DISTINCT[int(number)]

  var 
    words: seq[string]
    double: seq[string]
    number = number

  while number > 99:
    for d, str in DIVISORS:
      if number div d > 0: 
        let mult = number div d
        number = number mod d
        words.add(say(mult))
        words.add(str)
        break

  for d in countDown(90,20,10):
    if number div d > 0: 
      number = number mod d
      double.add:
        if d in DISTINCT: DISTINCT[d]
        else: DISTINCT[d div 10] & "ty"
      break

  for d in countDown(19,1):
    if number - d == 0: 
      number -= d
      double.add :
        if d in DISTINCT: DISTINCT[d]
        else: DISTINCT[d - 10] & "teen"
      break

  if double.len > 0:
    words.add(double.join("-"))

  words.join(" ")
