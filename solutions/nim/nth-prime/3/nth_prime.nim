#https://stackoverflow.com/a/4424496
func isPrime(number: int): bool {.inline.} =
  if ( number mod 2 == 0 and number != 2 ) or (number < 2) or (number mod 3 == 0 and number != 3):
    return false
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
