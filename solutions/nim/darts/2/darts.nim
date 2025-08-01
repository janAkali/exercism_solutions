import std/math

type
  Vec2 = array[2,float]

const 
  TARGET_RADIUS = [1.0, 5.0 ,10.0]
  SCORE = [10, 5 ,1]

func vectorLength(vector: Vec2): float =
  var sumOfSquares = 0.0
  for coord in vector:
    sumOfSquares += coord ^ 2
  sqrt(sumOfSquares)

proc score*(x, y: float): int =
  for index, radius in TARGET_RADIUS:
    if vectorLength([x,y]) <= radius: 
      return SCORE[index]

