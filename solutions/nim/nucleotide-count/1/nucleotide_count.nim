import std/[tables, sequtils]

const  Nucleotids = {'A','G','C','T'}

func countDna*(dna: string): CountTable[char] =
  if dna.anyIt(it notin Nucleotids):
    raise newException(ValueError, "dnaString must only contain nucleotids")
  dna.toCountTable()
