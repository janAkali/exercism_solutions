import std/[strutils, random, sugar]

type
  Name* = array[5, char]
  Robot* = object
    name*: Name

randomize()

proc getName(): Name =
  result[0..1] = collect(for i in 0..1: rand('A'..'Z'))
  result[2..4] = collect(for i in 0..2: rand('0'..'9'))

proc makeRobot*: Robot =
  Robot(name: getName())

proc reset*(robot: var Robot) =
  let oldName = robot.name
  while robot.name == oldName:
    robot.name = getName()
