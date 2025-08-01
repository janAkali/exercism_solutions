import sequtils, math, algorithm

type 
  Triangle = array[3, int]
  TriangleType = enum Illegal, Isosceles, Equilateral, Scalene

func getTriangleType(triangle:Triangle):TriangleType = 
  let triangle = triangle.sorted
  if triangle.sum <= 0 or triangle[2] > triangle[0] + triangle[1]: return Illegal
  case triangle.deduplicate.len:
  of 1: Equilateral
  of 3: Scalene
  else: Isosceles

proc isEquilateral*(sides: array[3, int]): bool =
  getTriangleType(sides) == Equilateral

proc isIsosceles*(sides: array[3, int]): bool =
  let t = getTriangleType(sides) 
  t == Isosceles or t == Equilateral

proc isScalene*(sides: array[3, int]): bool =
  getTriangleType(sides) == Scalene
