import math

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc allergies*(score: int): set[Allergen] =
  var 
    all:set[Allergen] = {}
    score = score 
    index = 0

  while pow(2.0, float(index + 1)) <= float(score):
    index += 1

  while score > 255:
    score -= int(pow(2, float(index)))
    index -= 1

  while score > 0 and index >= 0:
    if score >= int(pow(2.0, float(index))):
      incl(all, index.Allergen)
      score -= int(pow(2, float(index)))
    index -= 1
  all

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  return allergen in allergies(score)
  discard
