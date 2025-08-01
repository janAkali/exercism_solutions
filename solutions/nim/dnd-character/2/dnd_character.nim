import math, random, sequtils

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
  var rolls: seq[int]
  for i in 0..3: 
    rolls.add( rand(1..6) )
  rolls.delete( rolls.minIndex )
  rolls.foldl( a + b )

proc modifier*(n: int): int =
  int(floor( ( n - 10 ) / 2 ))

proc initCharacter*: Character =
  result = Character()
  result.strength = ability()
  result.dexterity = ability()
  result.constitution = ability()
  result.intelligence = ability()
  result.wisdom = ability()
  result.charisma = ability()
  result.hitpoints = 10 + modifier(result.constitution)
