import std/[sequtils]

type
  Nationality* = enum Englishman, Spaniard, Ukrainian, Norwegian, Japanese
  Color = enum Red, Green, Ivory, Yellow, Blue
  Pet = enum Dog, Snails, Fox, Horse, Zebra
  Drink = enum Coffee, Tea, Milk, OrangeJuice, Water
  Smoke = enum OldGold, Kools, Chesterfields, LuckyStrike, Parliaments

iterator permutations[T](items: openArray[T]): seq[T] =
  var perm = @items
  let size = perm.len
  var counts = newSeq[int](size)
  var idx = 1

  yield perm

  while idx < size:
    if counts[idx] < idx:
      if (idx and 1) == 0: swap(perm[0], perm[idx])
      else: swap(perm[counts[idx]], perm[idx])
      yield perm
      inc counts[idx]
      idx = 1
    else:
      counts[idx] = 0
      inc idx

proc solveZebraPuzzle(): array[5, tuple[color: Color, nationality: Nationality, pet: Pet, drink: Drink, smoke: Smoke]] =
  let colors = toSeq(permutations([Red, Green, Ivory, Yellow, Blue]))
  let nationalities = toSeq(permutations([Englishman, Spaniard, Ukrainian, Norwegian, Japanese]))
  let pets = toSeq(permutations([Dog, Snails, Fox, Horse, Zebra]))
  let drinks = toSeq(permutations([Coffee, Tea, Milk, OrangeJuice, Water]))
  let smokes = toSeq(permutations([OldGold, Kools, Chesterfields, LuckyStrike, Parliaments]))

  for color in colors:
    for nationality in nationalities:
      # 10
      if nationality[0] != Norwegian: continue

      let norwegianIdx = nationality.find(Norwegian)
      var norwegianNextToBlue = false
      if norwegianIdx > 0 and color[norwegianIdx - 1] == Blue: norwegianNextToBlue = true
      if norwegianIdx < 4 and color[norwegianIdx + 1] == Blue: norwegianNextToBlue = true
      if not norwegianNextToBlue: continue

      for drink in drinks:
        # 9
        if drink[2] != Milk: continue

        # 4
        let ukrainianIdx = nationality.find(Ukrainian)
        if ukrainianIdx != -1 and drink[ukrainianIdx] != Tea: continue

        # 3
        let greenIdx = color.find(Green)
        if greenIdx != -1 and drink[greenIdx] != Coffee: continue

        for smoke in smokes:
          # 14
          let japaneseIdx = nationality.find(Japanese)
          if japaneseIdx != -1 and smoke[japaneseIdx] != Parliaments: continue

          # 13
          var luckyStrikeValid = true
          for i in 0..<5:
            if smoke[i] == LuckyStrike and drink[i] != OrangeJuice:
              luckyStrikeValid = false
              break
          if not luckyStrikeValid: continue

          # 8
          let yellowIdx = color.find(Yellow)
          if yellowIdx != -1 and smoke[yellowIdx] != Kools: continue

          for pet in pets:
            var houses: array[5, tuple[color: Color, nationality: Nationality, pet: Pet, drink: Drink, smoke: Smoke]]
            for i in 0..<5:
              houses[i] = (color[i], nationality[i], pet[i], drink[i], smoke[i])

            var valid = true

            # 2
            for i in 0..<5:
              if houses[i].nationality == Englishman and houses[i].color != Red:
                valid = false
                break
            if not valid: continue

            # 3
            for i in 0..<5:
              if houses[i].nationality == Spaniard and houses[i].pet != Dog:
                valid = false
                break
            if not valid: continue

            # 6
            let ivoryIdx = color.find(Ivory)
            let greenIdx = color.find(Green)
            if ivoryIdx == -1 or greenIdx == -1 or greenIdx != ivoryIdx + 1:
              continue

            # 7
            for i in 0..<5:
              if houses[i].smoke == OldGold and houses[i].pet != Snails:
                valid = false
                break
            if not valid: continue

            # 11
            var chesterfieldFoxValid = false
            for i in 0..<5:
              if houses[i].smoke == Chesterfields:
                if (i > 0 and houses[i-1].pet == Fox) or (i < 4 and houses[i+1].pet == Fox):
                  chesterfieldFoxValid = true
                  break
            if not chesterfieldFoxValid: continue

            # 12
            var koolsHorseValid = false
            for i in 0..<5:
              if houses[i].smoke == Kools:
                if (i > 0 and houses[i-1].pet == Horse) or (i < 4 and houses[i+1].pet == Horse):
                  koolsHorseValid = true
                  break
            if not koolsHorseValid: continue

            return houses

let Solution = solveZebraPuzzle()

proc waterDrunkBy*: Nationality =
  for house in Solution:
    if house.drink == Water: return house.nationality

proc zebraOwnedBy*: Nationality =
  for house in Solution:
    if house.pet == Zebra: return house.nationality
