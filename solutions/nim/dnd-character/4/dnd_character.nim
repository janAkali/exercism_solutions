import std/[math, random, sequtils, sugar]

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc ability*: int =
  var rolls = collect:
    for i in 1..4: rand(1..6)
  rolls.delete(rolls.minIndex)
  rolls.sum()

template modifier*(n: int): untyped = floorDiv(n - 10, 2)

proc initCharacter*: Character =
  result = Character(
    strength: ability(),
    dexterity: ability(),
    constitution: ability(),
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
  )
  result.hitpoints = 10 + modifier(result.constitution)

randomize()