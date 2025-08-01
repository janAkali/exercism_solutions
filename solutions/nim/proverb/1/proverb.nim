import std/strformat

proc recite*(words: openArray[string]): string =
  if words.len() < 1: return
  for i in 0..<words.high():
    result.add &"For want of a {words[i]} the {words[i+1]} was lost.\n"
  result & &"And all for the want of a {words[0]}."
