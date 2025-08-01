import std/[sequtils, strutils]

proc clean*(s: string): string =
  var parsed = s.filterIt(it in Digits).join()
  let length = parsed.len()

  if length > 11 or length < 10: 
    raise newException(ValueError, "Phone number is too long or too short.")

  if length == 11:
    if parsed[0] != '1': 
      raise newException(ValueError, "Invalid Country code.")
    parsed = parsed[1..parsed.high()]

  if parsed[0] < '2' or parsed[3] < '2':
    raise newException(ValueError, "Invalid Area or Exchange code.")

  return parsed
