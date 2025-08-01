import std/tables

type
  Protein = enum
    Adenine  = 'A'
    Cytosine = 'C'
    Guanine  = 'G'
    Thymine  = 'T'
    Uracil   = 'U'

const complement = {
  Adenine:  Uracil,
  Cytosine: Guanine,
  Guanine:  Cytosine,
  Thymine:  Adenine,
}.toTable()

proc toRna*(dna: string): string =
  result = newString(dna.len)
  for i, protein in dna:
    result[i] = complement[protein.Protein].char
