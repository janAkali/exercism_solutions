import sequtils, strutils, math, tables

const scores = {
  'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T': 1,
  'D', 'G': 2,
  'B', 'C', 'M', 'P': 3,
  'F', 'H', 'V', 'W', 'Y': 4,
  'K': 5,
  'J', 'X':8,
  'Q', 'Z':10
  }.toTable

func letScore(c:char): int =
  scores[c]

proc score*(word: string): int =
  for letter in word.toUpper:
    result.inc(letter.letScore)
