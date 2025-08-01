import algorithm, sequtils, strutils

func splitSize(s: string, i: int): seq[string] =
  var temp: string
  for index, c in s:
    temp.add(c)
    if index mod i == 4 or index == s.high:
      result.add(temp)
      temp = ""

proc deEncode*(s: string, mode: char): string =
  let parsedString = s.toLower.filterIt(it in {'a'..'z'}+{'0'..'9'})
  var temp: string
  for letter in parsedString:
    if letter in Letters: 
      temp.add(char(25 - (letter.int - 97) + 97)) #ASCII
    else:
      temp.add(letter)
  if mode == 'e':
    temp.splitSize(5).join(" ")
  else:
    temp


proc encode*(s: string): string =
  deEncode(s, 'e')

proc decode*(s: string): string =
  deEncode(s, 'd')
