import std/sequtils

func prime*(nth: int): int =
  if nth <= 0: raise newException(ValueError, "Input should be a positive integer.")
  result = 1
  var 
    count = 0
    dividers: seq[int]
  while count < nth:
    result.inc()
    if dividers.anyIt( result mod it == 0 ): 
      continue
    dividers.add(result)
    count.inc()
