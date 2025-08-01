const SOUNDPAIR = [(factor: 3, string:"Pling"), (5, "Plang"), (7, "Plong")]

proc convert*(number: int): string =
  for sound in SOUNDPAIR:
    if number mod sound.factor == 0: 
      result &= sound.string
  if result.len() < 1: result = $number

