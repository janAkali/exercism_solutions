import std/[strutils, sugar, times]

func saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  if matrix.len < 1: return @[]

  let lowestInColList = collect:
    for x in 0..matrix[0].high:
      var low = matrix[0][x]
      for y in 0..matrix.high: 
        let value = matrix[y][x]
        if value < low: low = value
      low
    
  for y in 0..matrix.high:
    let highestInRow = matrix[y].max()
    for x in 0..matrix[0].high:
      if highestInRow == lowestInColList[x]:
        result &= (y+1, x+1)

import sequtils
func saddleCollect(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  for r in 0..<matrix.len():
    for c in 0..<matrix[r].len():
      if (matrix[r][c] >= matrix[r].max) and (matrix[r][c] <= matrix.mapIt(it[c]).min):
        result.add [(r+1,c+1)]

let a =  @[
  @[7,0,4,2,5,9,5,5,9,8,3,5,1,1,5,4,3,3,4,9,],
  @[7,0,4,2,5,9,5,5,9,8,3,5,1,1,5,4,3,3,4,9,],
  @[7,0,4,2,5,9,5,5,9,8,3,5,1,1,5,4,3,3,4,9,],
  @[7,0,4,2,5,9,5,5,9,8,3,5,1,1,5,4,3,3,4,9,],
  @[5,5,9,8,3,5,1,1,5,4,3,3,4,9,8,1,6,2,7,4,],
  @[8,1,7,9,4,4,1,1,0,1,2,5,5,7,7,2,9,5,3,3,],
  @[2,5,7,3,5,2,8,1,9,5,1,2,4,0,9,8,4,0,0,7,],
  @[2,9,8,3,0,4,4,0,1,0,8,6,4,2,3,0,2,5,8,1,],
  @[9,8,3,0,4,4,0,1,0,8,6,4,2,3,0,2,5,8,1,9,],
  @[8,3,0,4,4,0,1,0,8,6,4,2,3,0,2,5,8,1,9,4,],
  @[3,0,4,4,0,1,0,8,6,4,2,3,0,2,5,8,1,9,4,6,],
  @[0,4,4,0,1,0,8,6,4,2,3,0,2,5,8,1,9,4,6,9,],
  @[4,4,0,1,0,8,6,4,2,3,0,2,5,8,1,9,4,6,9,8,],
]

template bench(code: untyped): string =
  let start = cpuTime()
  discard code
  (cpuTime() - start).formatFloat(ffDecimal)

echo bench(saddleCollect(a))
echo bench(saddleCollect(a))
echo bench(saddleCollect(a))
echo bench(saddleCollect(a))
echo bench(saddleCollect(a))

echo bench(saddlePoints(a))
echo bench(saddlePoints(a))
echo bench(saddlePoints(a))
echo bench(saddlePoints(a))
echo bench(saddlePoints(a))

