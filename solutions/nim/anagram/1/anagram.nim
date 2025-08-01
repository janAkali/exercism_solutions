import algorithm, strutils

proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string] =
  let word_lcase = word.toLower
  let word_sorted = word_lcase.sorted
  for candidate in candidates:
    if word_lcase == candidate.toLower: continue
    if word_sorted == candidate.toLower.sorted:
      result.add candidate
