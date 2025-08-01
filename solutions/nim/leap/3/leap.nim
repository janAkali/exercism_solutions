proc isLeapYear*(year: int): bool =
  if year mod 100 == 0:
    return year mod 400 == 0
  return year mod 4 == 0
