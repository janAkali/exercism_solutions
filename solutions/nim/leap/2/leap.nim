proc isLeapYear*(year: int): bool =
  if year mod 4 == 0:
    if year mod 100 == 0:
      if year mod 400 == 0:
        return true
      else:
        return false

    return true
