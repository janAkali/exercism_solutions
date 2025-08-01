import strutils, sequtils, algorithm, math

proc closestSquare(number: int): (int, int) =
  var 
    cols = 2
    rows = 2
  
  while cols * rows < number:
    if cols > rows: rows += 1
    else: cols += 1
  result = (rows, cols)

proc encrypt*(s: string): string =
  let 
    parsed = s.toLower.filterIt(it in Letters + Digits)
    (cols, rows) = closestSquare(parsed.len)
  var 
    matrix: seq[seq[char]]

  if parsed.len <= 1: return parsed.join()

  for c in 0..cols-1:
    for r in 0..rows-1:
      if c == 0: matrix.add(@[])
      try:
        matrix[r].add(parsed[c * rows + r])
      except IndexError:
        matrix[r].add(' ')
  matrix.mapIt(it.join()).join(" ")
