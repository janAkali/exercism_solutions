func minInEachColumn(matrix: seq[seq[int]]): seq[int] =
  for x in 0..matrix[0].high:
    var lowest = matrix[0][x]
    for y in 0..matrix.high: 
      if matrix[y][x] < lowest: lowest = matrix[y][x]
    result.add(lowest)

func saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  if matrix.len < 1: return @[]

  let lowestInColList = minInEachColumn(matrix)
    
  for y in 0..matrix.high:
    let highestInRow = matrix[y].max()
    for x in 0..matrix[0].high:
      if highestInRow == lowestInColList[x]:
        result &= (y+1, x+1)
