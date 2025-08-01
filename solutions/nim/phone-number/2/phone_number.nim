import std/[sequtils, strutils]

proc clean*(s: string): string =
  result = s.filterIt(it in Digits).join()

  if result[0] == '1': result = result[1..^1]

  if result.len() != 10 or result[0] < '2' or result[3] < '2':
    raise newException(ValueError, "Invalid number")

