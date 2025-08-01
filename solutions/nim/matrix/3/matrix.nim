import std/[strutils, sequtils]

proc row*(matrix: string, rowIndex: int): seq[int] =
  matrix.splitLines[rowIndex-1].splitWhitespace.mapIt(it.parseInt)

proc column*(matrix: string, colIndex: int): seq[int] =
  matrix.splitLines.mapIt(it.splitWhitespace[colIndex-1].parseInt)
