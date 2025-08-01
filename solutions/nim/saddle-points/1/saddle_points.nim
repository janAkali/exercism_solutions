proc saddlePoints*(matrix: seq[seq[int]]): seq[tuple[r, c: int]] =
  for row in matrix:
    echo row.find(row.max())

echo saddlePoints(
[
  [0,1,2],
  [0,1,2],
  [0,1,2],
]

)
