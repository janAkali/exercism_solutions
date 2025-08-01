import sequtils

const lookup = static:
  ## a compile-time lookup table
  const Sounds = [
    (3, "Pling"),
    (5, "Plang"),
    (7, "Plong"),
  ]

  const period: int = Sounds.mapIt(it[0]).foldl(a * b)

  func genLookup(t: openArray[(int, string)]): array[period, string] =
    # prime sieve instead of modulo
    for (fac, msg) in Sounds:
      for i in countUp(0, result.high, fac):
        result[i] &= msg

  genLookup(Sounds)

func convert*(number: int): string =
  result = lookup[number mod lookup.len]
  if result.len == 0: result = $number