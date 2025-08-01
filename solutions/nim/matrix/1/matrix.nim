import std/[strutils, sequtils]

proc row*(matrix: string, row: int): seq[int] =
  matrix.split('\n')[row-1]
    .split(' ')
    .mapIt(it.parseInt)

proc column*(matrix: string, col: int): seq[int] =
  let rows = matrix.split('\n').mapIt(it.split(' '))
  for row in rows: 
    result.add parseInt($row[col-1])
