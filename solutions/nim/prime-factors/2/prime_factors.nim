func isPrime(number: int): bool {.inline.} =
  const WITNESS = [2,3,5,7,11]
  if number == 1: return false
  for w in WITNESS:
    if number mod w == 0 and number != w:
      return false

  var k = 1
  while 36*k*k-12*k < number:
    if number mod (6*k+1) == 0 or number mod (6*k-1) == 0:
      return false
    k.inc()
  return true

func nextPrime(n: int): int =
  result = n
  while true:
    result += 1
    if result.isPrime(): return

proc primeFactors*(n: int64): seq[int] =
  var num = n
  var prime = 2
  while num > 1:
    if num mod prime == 0: 
      num = num div prime
      result.add(prime)
      continue
    prime = nextPrime(prime)

