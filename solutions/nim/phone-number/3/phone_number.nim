const VALID_COUNTRY_CODES = {'1'}

proc clean*(number: string): string =
  for char in number: 
    if char in {'0'..'9'}: result.add(char)

  if result.len() == 11:
    if result[0] notin VALID_COUNTRY_CODES: 
      raise newException(ValueError, "Invalid Country code")
    result = result[1..^1]

  if result.len() != 10 or result[0] < '2' or result[3] < '2':
    raise newException(ValueError, "Invalid number")

