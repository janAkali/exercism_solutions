func isPrime(number: int): bool {.inline.} =
  if number mod 2 == 0: return number == 2
  if number mod 3 == 0: return number == 3

  #https://stackoverflow.com/a/4424496
  var k = 1
  while 36*k*k-12*k < number:
    if number mod (6*k+1) == 0 or number mod (6*k-1) == 0:
      return false
    k.inc()
  return true

func prime*(n: int): int =
  if n <= 0: raise newException(ValueError, "Input should be a positive integer.")
  if n == 1: return 2 #only even Prime
  result = 3
  var count = 2
  while count < n:
    result.inc(2)
    if isPrime(result): 
      count.inc()
