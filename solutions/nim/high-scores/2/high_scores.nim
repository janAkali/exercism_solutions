import std/algorithm

proc latest*(scores: openArray[int]): int =
  scores[scores.high]

proc personalBest*(scores: openArray[int]): int =
  scores.max

proc personalTopThree*(scores: openArray[int]): seq[int] =
  scores.sorted(Descending)[0..min(2, scores.high)]
