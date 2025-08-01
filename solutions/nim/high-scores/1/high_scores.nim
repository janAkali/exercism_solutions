import std/algorithm

proc latest*(scores: openArray[int]): int =
  scores[scores.high]

proc personalBest*(scores: openArray[int]): int =
  scores.max()

proc personalTopThree*(scores: openArray[int]): seq[int] =
  let sorted = scores.sorted()
  for i in 1..3:
    try: result.add(sorted[^i])
    except IndexError: break
