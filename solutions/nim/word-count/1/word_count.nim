import std/tables, strutils, sequtils

proc countWords*(s: string): Table[string, int] =
  let s_low = s.toLower
  var words = s_low.split(AllChars - (Letters + Digits) - {'\''} )
  words.applyIt( it.strip(chars = {'\''}))
  for index, word in words.deduplicate:
    if word.len < 1: continue
    result.add(word, words.count(word))
