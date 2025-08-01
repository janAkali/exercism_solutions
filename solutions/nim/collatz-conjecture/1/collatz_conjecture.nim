proc steps*(number: int): int =
  if number <= 0: raise newException(ValueError,"Negative or Zero not allowed!")

  var n = number
  while n > 1:
    if n mod 2 == 0:
      n = n div 2
    else:
      n = n * 3 + 1
    result += 1

