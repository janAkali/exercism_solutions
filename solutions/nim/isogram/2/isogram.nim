import strutils, sequtils

proc isIsogram*(phrase: string): bool =
  let letters = phrase.toLower.filterIt( it notin Whitespace + {'-','_'} )
  letters.deduplicate.len == letters.len
