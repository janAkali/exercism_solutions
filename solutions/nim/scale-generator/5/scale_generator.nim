import std/[sequtils, strutils]

type
  Note = string
  Notes = seq[Note]
  BaseScale = array[12, Note]

const 
  MajorSharp = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"] 
  MajorFlat  = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"] 
  MinorSharp = ["a", "a#", "b", "c", "c#", "d", "d#", "e", "f", "f#", "g", "g#"] 
  MinorFlat  = ["a", "bb", "b", "c", "db", "d", "eb", "e", "f", "gb", "g", "ab"] 

func toUpper(notes: Notes): Notes =
  result = notes
  for ind, note in result:
    result[ind][0] = note[0].toUpperAscii

func getBaseScale(tonic: Note): BaseScale =
  case tonic:
    of "G", "D", "A", "E", "B", "F#", "C": MajorSharp
    of "F", "Bb", "Eb", "Ab", "Db", "Gb": MajorFlat
    of "e", "b", "f#", "c#", "g#", "d#", "a": MinorSharp
    of "d", "g", "c", "f", "bb", "eb": MinorFlat
    else: raise new ValueError

func scale*(tonic: string, intervals: string): Notes =
  let baseScale = getBaseScale(tonic)
  var bScaleIndex = baseScale.find(tonic)
  
  result = newSeq[Note](intervals.len + 1)
  result[0] = tonic
  for ind, interval in intervals:
    case interval:
      of 'm': bScaleIndex.inc()
      of 'M': bScaleIndex.inc(2)
      of 'A': bScaleIndex.inc(3)
      else: raise new ValueError
    result[ind+1] = baseScale[bScaleIndex mod 12]

  let nonChromatic = intervals.anyIt(it != 'm')
  if nonChromatic: return result.toUpper()
