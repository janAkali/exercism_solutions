import std/[sugar, strutils, sequtils, re]

func parseId(id: string): seq[int] =
  for i in id[0..8]: result.add(parseInt($i))
  let check = id[9]
  result.add( if check == 'X': 10 else: parseInt($check))

func isValid*(id: string): bool =
  let id = id.replace("-","")
  if not id.match(re"^\d{9}[X\d]$"): return false

  let parsed: seq[int] = parseId(id) 
  let values = collect:
    for index, value in parsed: value * (10 - index)

  values.foldr(a + b) mod 11 == 0
