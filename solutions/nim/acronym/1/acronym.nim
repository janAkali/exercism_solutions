import strutils

proc abbreviate*(s: string): string =
  for word in s.split( Whitespace + {'-','_'} ):
    if word.len < 1: continue
    result.add word[0].toUpperAscii()
