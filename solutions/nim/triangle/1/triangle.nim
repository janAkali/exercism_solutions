import sequtils, math

func isValidTriangle(sides: array[3, int]): bool = 
  if sides.anyIt(it <= 0): return false
  if sides.max <= sides.sum - sides.max: 
    return true

proc isEquilateral*(sides: array[3, int]): bool =
  if not isValidTriangle(sides): return false
  sides.deduplicate.len == 1

proc isIsosceles*(sides: array[3, int]): bool =
  if not isValidTriangle(sides): return false
  sides.deduplicate.len <= 2

proc isScalene*(sides: array[3, int]): bool =
  if not isValidTriangle(sides): return false
  sides.deduplicate.len == 3
