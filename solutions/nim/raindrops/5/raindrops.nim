const Sounds = [
  (3, "Pling"),
  (5, "Plang"),
  (7, "Plong")
]

proc convert*(number: int): string =
  for (factor, msg) in Sounds:
    if number mod factor == 0: 
      result &= msg
  if result.len() < 1:
    result = $number