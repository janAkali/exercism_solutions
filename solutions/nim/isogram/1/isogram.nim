import strutils, sequtils

proc isIsogram*(phrase: string): bool =
  let parsed = phrase.toLower.filterIt( it notin Whitespace + {'-','_'} )
  for letter in parsed:
    if parsed.count(letter) > 1: return false
  return true
