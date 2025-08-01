import std/[strutils, sequtils]

proc row*(matrix: string, row: int): seq[int] =
  matrix.splitLines[row-1].splitWhitespace.mapIt(it.parseInt)

proc column*(matrix: string, col: int): seq[int] =
  matrix.splitLines.mapIt(it.splitWhitespace[col-1].parseInt)
