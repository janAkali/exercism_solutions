import std/[sequtils, strutils, tables]

type
  Note = string
  Notes = seq[string]
  Scale = array[12, string]
  ScaleType = enum
    MajorSharp
    MajorFlat
    MinorSharp
    MinorFlat

const 
  SCALES = {
    MajorSharp: ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"], 
    MajorFlat:  ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"], 
    MinorSharp: ["a", "a#", "b", "c", "c#", "d", "d#", "e", "f", "f#", "g", "g#"], 
    MinorFlat:  ["a", "bb", "b", "c", "db", "d", "eb", "e", "f", "gb", "g", "ab"], 
  }.toTable
  CHROMATICINTERVALS = "mmmmmmmmmmm"

func toUpper(n: Notes): Notes =
  result = n
  for ind, note in result:
    result[ind][0] = note[0].toUpperAscii

func getScale(tonic: Note): Scale =
  case tonic:
    of "G", "D", "A", "E", "B", "F#", "C":    SCALES[MajorSharp]
    of "F", "Bb", "Eb", "Ab", "Db", "Gb":     SCALES[MajorFlat]
    of "e", "b", "f#", "c#", "g#", "d#", "a": SCALES[MinorSharp]
    of "d", "g", "c", "f", "bb", "eb":        SCALES[MinorFlat]
    else: raise new ValueError

func scale*(tonic: string, intervals: string): Notes =
  let notes = getScale(tonic)
  var index = notes.find(tonic)

  result = @[tonic]
  for i in intervals:
    case i:
      of 'm': index.inc()
      of 'M': index.inc(2)
      of 'A': index.inc(3)
      else: raise new ValueError
    result.add(notes[(index mod 12)])

  if intervals != CHROMATICINTERVALS: return result.toUpper
