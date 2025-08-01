import std/strutils

type
  Allergen* = enum
    Cats, Pollen, Chocolate, Tomatoes, Strawberries, Shellfish, Peanuts, Eggs

func allergies*(score: int): set[Allergen] =
  let binary = score.toBin(8)
  for index, digit in binary:
    if digit == '1': result.incl(index.Allergen)

func isAllergicTo*(score: int, allergen: Allergen): bool =
  allergen in allergies(score)
