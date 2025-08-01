proc isQuestion(s: string): bool =
  for n in countdown(len(s) - 1, 0):
    if s[n] == ' ':
      continue
    return s[n] == '?'

proc isYelling(s: string): bool =
  var test: bool = false
  for n in countdown(len(s) - 1, 0):
    if int(s[n]) <= 90 and int(s[n]) >= 65:
      test = true
  for n in countdown(len(s) - 1, 0):
    if int(s[n]) <= 122 and int(s[n]) >= 97:
      test = false
  return test

proc isSilence(s: string): bool =
  for n in countdown(len(s) - 1, 0):
    if (int(s[n]) <= 126 and int(s[n]) >= 33):
      return false
  return true

proc hey*(s: string): string =
  if isSilence(s):
    return "Fine. Be that way!"
  if isQuestion(s) and isYelling(s):
    return "Calm down, I know what I'm doing!"
  if isQuestion(s):
    return "Sure."
  if isYelling(s): 
    return "Whoa, chill out!"
  return "Whatever."
