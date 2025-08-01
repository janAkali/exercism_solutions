import std/[strutils, sequtils, algorithm, math]
  
type Square = tuple
  col, row: int
  
func closestSquare(area: int): Square =
  result = (2, 2)
  while result.col * result.row < area:
    if result.col >= result.row:
      result.row.inc()
    else: 
      result.col.inc()

func encrypt*(s: string): string =
  var matrix: seq[seq[char]]
  let 
    parsed = s.toLower.filterIt(it in Letters + Digits)
    (cols, rows) = closestSquare(parsed.len)

  if parsed.len <= 1: return parsed.join()

  for c in 0..cols-1:
    for r in 0..rows-1:
      if c == 0: matrix.add(@[])
      try:
        matrix[r].add(parsed[c * rows + r])
      except IndexError:
        matrix[r].add(' ')

  matrix.mapIt(it.join()).join(" ")
