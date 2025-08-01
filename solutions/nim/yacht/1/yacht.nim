import std/[algorithm, sequtils, math]

type
  Category* = enum
    Ones, Twos, Threes, Fours, Fives, Sixes,
    FullHouse, FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

const 
  STRAIGHTPTS = 30
  YACHTPTS = 50

func addFaces(dice: array[5, int], category: Category): int =
  let face = category.ord() + 1
  dice.filterIt(it == face).sum()

func isFullHouse(dice: array[5, int]): bool =
  dice.deduplicate.len == 2 and dice.countIt(it == dice[0]) in {2,3}

func isFourOfAKind(dice: array[5, int]): bool =
  dice.deduplicate.len <= 2 and dice.countIt(it == dice[0]) in {5, 4, 1}

proc score*(dice: array[5, int], category: Category): int =
  case category:
    of Ones..Sixes: 
      return dice.addFaces(category)
    of FullHouse:
      if dice.isFullHouse(): 
        return dice.sum()
    of FourOfAKind:
      if dice.isFourOfAKind(): 
        return dice.sorted[2] * 4
    of LittleStraight:
      if dice.sorted == [1,2,3,4,5]:
        return STRAIGHTPTS
    of BigStraight:
      if dice.sorted == [2,3,4,5,6]:
        return STRAIGHTPTS
    of Choice:
      return dice.sum()
    of Yacht:
      if dice.deduplicate.len == 1:
        return YACHTPTS

