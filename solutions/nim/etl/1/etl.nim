import std/[tables, strutils]

proc transform*(t: Table[int, seq[char]]): Table[char, int] =
  for key, val in t:
    for letter in val:
      result[letter.toLowerAscii()] = key
