import std/sequtils

func prime*(n: int): int =
  if n <= 0: raise newException(ValueError, "Input should be a positive integer.")
  result = 1
  var 
    count = 0
    dividers: seq[int]
  while count < n:
    result.inc()
    if dividers.anyIt( result mod it == 0 ): 
      continue
    dividers.add(result)
    count.inc()
