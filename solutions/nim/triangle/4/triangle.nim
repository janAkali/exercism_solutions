import sequtils, math, algorithm

type 
  Triangle = array[3, int]
  TriangleType = enum Illegal, Isosceles, Equilateral, Scalene

func isValid(triangle:Triangle): bool = 
  let triangle = triangle.sorted
  triangle.sum > 0 and triangle[2] <= triangle[0] + triangle[1]

func getTriangleType(triangle:Triangle): TriangleType = 
  if not isValid(triangle): return Illegal
  case triangle.deduplicate.len:
  of 1: Equilateral
  of 2: Isosceles
  else: Scalene

proc isEquilateral*(sides: array[3, int]): bool =
  getTriangleType(sides) == Equilateral

proc isIsosceles*(sides: array[3, int]): bool =
  let t = getTriangleType(sides) 
  t == Isosceles or t == Equilateral

proc isScalene*(sides: array[3, int]): bool =
  getTriangleType(sides) == Scalene
