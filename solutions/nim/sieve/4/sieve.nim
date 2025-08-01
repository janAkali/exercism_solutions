import std/[sequtils, sugar]

proc primes*(limit: int): seq[int] =
  var
    primeBools = newSeqWith[bool](limit+1, true)
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

  collect:
    for number, isPrime in primeBools: 
      if isPrime: number
