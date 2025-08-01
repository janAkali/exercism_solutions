import std/[math, re, strutils, sugar]

type
  ISBN = string

func parseIsbnId(id: ISBN ): seq[int] =
  for i in id[0..8]: result.add(parseInt($i))
  let check = id[9]
  result.add( if check == 'X': 10 else: parseInt($check))

func isValid*(id: ISBN): bool =
  let id = id.replace("-","")
  if not id.match(re"^\d{9}[X\d]$"): return false

  let parsed: seq[int] = parseIsbnId(id) 
  let values = collect(newSeqOfCap(10)):
    for index, value in parsed: value * (10 - index)

  values.sum mod 11 == 0
