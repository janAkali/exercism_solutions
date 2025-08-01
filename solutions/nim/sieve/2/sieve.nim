import std/[sequtils, sugar]

proc primes*(limit: int): seq[int] =
  var
    numPairs = (0..limit).toSeq.map((x)=>(num: x, isPrime: true))
    index = 2
    p = 2

  block sieve:
    while p < limit:
      index = p
      while index+p <= limit:
        index.inc(p)
        numPairs[index].isPrime = false
      p.inc()
      while numPairs[p].isPrime == false:
        p.inc()
        if p >= limit: break sieve

  result = collect:
    for n in numPairs[2..numPairs.high]: 
      if n.isPrime: n.num
