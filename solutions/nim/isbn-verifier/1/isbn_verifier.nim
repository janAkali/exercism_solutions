import std/[sugar, strutils, sequtils]

func parseId(id: seq[char]): seq[int] =
  let check = id[9]
  for i in id[0..8]: result.add(parseInt($i))
  result.add( if check == 'X': 10 else: parseInt($check))

proc isValid*(id: string): bool =
  let stripped: seq[char] = id.filterIt( it != '-')

  if stripped.len() != 10: return false
  if stripped[0..8].anyIt(it notin Digits): return false
  if stripped[9] notin Digits + {'X'}: return false

  var digits: seq[int] = parseId(stripped) 
  let temp = collect:
    for index, value in digits: value * (10 - index)

  temp.foldl(a + b) mod 11 == 0
