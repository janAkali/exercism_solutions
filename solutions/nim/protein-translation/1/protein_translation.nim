import std/[sequtils, strutils, tables, wordwrap]

const proteinTable = {
  "AUG":                      "Methionine",
  "UUU", "UUC":               "Phenylalanine",
  "UUA", "UUG":               "Leucine",
  "UCU", "UCC", "UCA", "UCG": "Serine",
  "UAU", "UAC":               "Tyrosine",
  "UGU", "UGC":               "Cysteine",
  "UGG":                      "Tryptophan",
  "UAA", "UAG", "UGA":        "STOP",
}.toTable()

proc translate*(dna: string): seq[string] =
  if dna.len() < 3: return
  for c in dna.wrapWords(3).split('\n'):
    let protein = proteinTable[c]
    if protein == "STOP": return
    result.add(protein)

