import std/[strutils, random]

type
  Name* = array[5, char]
  Robot* = object
    name*: Name

const NAMELIMIT = 26 * 26 * 1000
var namesTaken: array[NAMELIMIT, bool]
var namesCount = 0

randomize()

func ord(n: Name): int = 
  (n[0].ord - 'A'.ord) * 26000 +
  (n[1].ord - 'A'.ord) * 1000 +
  parseInt(n[2..4].join())

proc genRandomName(): Name =
  result[0] = rand('A'..'Z')
  result[1] = rand('A'..'Z')
  result[2..4] = intToStr(rand(999), 3)

proc getUniqueName(): Name = 
  if namesCount >= NAMELIMIT: 
    raise newException(OverflowDefect, "Number of names hit the limit.")

  result = genRandomName()
  var ind = result.ord()

  while namesTaken[ind]:
    result = genRandomName()
    ind = result.ord()

  namesTaken[ind] = true
  namesCount.inc()

proc makeRobot*: Robot =
  Robot(name: getUniqueName())

proc reset*(robot: var Robot) =
  let oldInd = robot.name.ord()
  robot.name = getUniqueName()
  namesTaken[oldInd] = false
