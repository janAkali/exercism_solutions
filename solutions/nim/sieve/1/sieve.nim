import std/sequtils

proc primes*(limit: int): seq[int] =
  var isPrime: bool

  for number in toSeq(2..limit):
    isPrime = true
    for primeNumber in result:
      if number mod primeNumber == 0: 
        isPrime = false
        break
    if isPrime: result.add(number)
