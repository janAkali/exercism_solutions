import std/strformat
  
proc twoFer*(name = ""): string =
  var givenName = name
  if name == "": givenName = "you"
  let answer = &"One for {givenName}, one for me."
  return answer