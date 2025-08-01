import std/[sequtils, sugar]

proc primes*(limit: int): seq[int] =
  var
    primeBools = repeat(true, limit+1)
    index = 2
    primeBase = 2

  primeBools[0] = false
  primeBools[1] = false

  block sieve:
    while primeBase < limit:
      index = primeBase
      while index+primeBase <= limit:
        index.inc(primeBase)
        primeBools[index] = false

      primeBase.inc()
      while primeBools[primeBase] == false:
        primeBase.inc()
        if primeBase >= limit: break sieve

  result = collect:
    for number, isPrime in primeBools: 
      if isPrime: number 
