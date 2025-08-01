import sequtils
proc sum*(limit: int, factors: openArray[int]): int =
  if len(factors) < 1 or all(factors, proc(x:int):bool = x > limit):
    return 0
  var unique_multiples:seq[int] = @[]
  for val in factors:
    var n = 0
    if val == 0:
      unique_multiples.add(0)
      continue
    while val * (n + 1) < limit:
      n += 1
      if val * n notin unique_multiples:
        unique_multiples.add(val * n)
  return foldr(unique_multiples, a + b)
