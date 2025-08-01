import std/sugar

func saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  if matrix.len < 1: return @[]

  let lowestYList = collect:
    for x in 0..matrix[0].high:
      var lowest = matrix[0][x]
      for y in 0..matrix.high: 
        if matrix[y][x] < lowest: lowest = matrix[y][x]
      lowest
    
  for y in 0..matrix.high:
    let highestX = matrix[y].max()
    for x in 0..matrix[0].high:
      if highestX == lowestYList[x]:
        result &= (y+1, x+1)
