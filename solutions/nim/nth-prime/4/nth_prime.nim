func isPrime(number: int): bool {.inline.} =
  #https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
  const WITNESS = [2,3,5,7,11,13,17]
  if number == 1: return false
  for w in WITNESS:
    if number == w: return true
    if number mod w == 0: return false
  #https://stackoverflow.com/a/4424496
  var k = 1
  while 36*k*k-12*k < number:
    if number mod (6*k+1) == 0 or number mod (6*k-1) == 0:
      return false
    k.inc()
  return true

func prime*(n: int): int =
  if n <= 0: raise newException(ValueError, "Input should be a positive integer.")
  var count = 0
  while count < n:
    result.inc()
    if isPrime(result): 
      count.inc()
