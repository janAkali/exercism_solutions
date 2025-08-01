func isPrime(number: int): bool {.inline.} =
  if number mod 2 == 0: return number == 2
  if number mod 3 == 0: return number == 3

  var k = 1
  while 36*k*k-12*k < number:
    if number mod (6*k+1) == 0 or number mod (6*k-1) == 0:
      return false
    k.inc()
  return true

func nextPrime(n: var int) =
  n = if n == 2: n + 1 else: n + 2
  while not isPrime(n):
    n.inc(2)

proc primeFactors*(n: int64): seq[int] =
  var 
    num = n
    prime = 2
  while num > 1:
    if num mod prime == 0: 
      num = num div prime
      result.add(prime)
      continue
    prime.nextPrime()
