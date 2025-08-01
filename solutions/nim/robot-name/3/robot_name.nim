import std/[sets, sequtils, strutils, random, sugar]

type
  Name* = array[5, char]
  Robot* = object
    name*: Name

const NAMELIMIT = 26 * 26 * 1000
var takenNames: HashSet[Name]

randomize()

proc genRandomName(): Name =
  result[0..1] = collect(for i in 0..1: rand('A'..'Z'))
  result[2..4] = intToStr(rand(999), 3)

proc getUniqueName(): Name = 
  if takenNames.len >= NAMELIMIT: raise newException(ValueError, "Number of names hit the limit.")
  result = genRandomName()
  while result in takenNames:
    result = genRandomName()
  takenNames.incl(result)

proc makeRobot*: Robot =
  Robot(name: getUniqueName())

proc reset*(robot: var Robot) =
  let oldName = robot.name
  robot.name = getUniqueName()
  takenNames.excl(oldName)

var n: Name
for i in 0..676_000-1:
  n = getUniqueName()
  echo NAMELIMIT - takenNames.len()
