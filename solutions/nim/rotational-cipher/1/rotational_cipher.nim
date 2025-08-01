import std/strutils

proc rotate*(input: string, cycle: int): string =
  result = input.toLowerAscii()

  for ind, c in result:
    if c notin LowercaseLetters: continue

    let cypher = char('a'.ord + (c.ord - 'a'.ord + cycle.ord) mod 26)
    result[ind] = 
      if input[ind].isUpperAscii(): 
        cypher.toUpperAscii()
      else: 
        cypher
