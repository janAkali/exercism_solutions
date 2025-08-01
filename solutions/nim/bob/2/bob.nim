import std/[sequtils, strutils]

func isQuestion(s: string): bool =
  s.strip().endsWith('?')

func isYelling(s: string): bool =
  s.anyIt(it in Letters) and not s.anyIt(it in {'a'..'z'})

func isSilence(s: string): bool = s.allIt(it in Whitespace)

func hey*(s: string): string =
  if s.isSilence():
    "Fine. Be that way!"
  elif s.isQuestion():
    if s.isYelling():
      "Calm down, I know what I'm doing!"
    else:
      "Sure."
  elif s.isYelling(): 
    "Whoa, chill out!"
  else:
    "Whatever."
