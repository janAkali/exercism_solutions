const sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

proc convert*(number: int): string =
  for s in sounds:
    if number mod s[0] == 0: 
      result &= s[1]
  if result == "": result = $number

