import std/[re, strutils, sugar]

type
  ISBN = string

func ISBNsum(id: ISBN ): int =
  let check = id[9]
  for index, char in id[0..8]: result += (parseInt($char)) * (10 - index )
  result += (if check == 'X': 10 else: parseInt($check))

func isValid*(id: ISBN): bool =
  let id = id.replace("-","")
  if not id.match(re"^\d{9}[X\d]$"): return false

  ISBNsum(id) mod 11 == 0
