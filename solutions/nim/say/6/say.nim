import std/[strutils, tables, sugar]

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
    15: "fifteen",
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

  const count = 
    collect(for i in countDown(90,20,10): i) &
    collect(for i in countDown(19,1,1): i)

  for d in count:
    if number == 0: break
    if number - d < 0: continue
    number = number - d
    double.add:
      if d in DISTINCT: DISTINCT[d]
      elif d > 19: DISTINCT[d div 10] & "ty"
      else: DISTINCT[d - 10] & "teen"

  if double.len > 0:
    words.add(double.join("-"))

  words.join(" ")

echo say(15)
