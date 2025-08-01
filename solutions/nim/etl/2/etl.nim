import std/[tables, strutils]

proc transform*(source: Table[int, seq[char]]): Table[char, int] =
  for score, letterSeq in source:
    for letter in letterSeq:
      result[letter.toLowerAscii()] = score
