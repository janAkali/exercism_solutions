import std/[strutils, sequtils]

func descAscSeq(top, bottom: int): seq[int] =
  for i in countDown(top, bottom): result.add i
  for i in countUp(bottom + 1, top): result.add i

func diamond*(c: char): string =
  let 
    edge = int(c) - 65
    side = edge * 2 + 1
    indexSeq = descAscSeq(edge, 0)
  var square = sequtils.repeat(spaces(side), side)

  for vInd, val in square:
    let pos = indexSeq[vInd]
    let letterId = edge - pos # [2,1,0,1,2] -> [0,1,2,1,0]

    square[vInd][ pos ] = char(letterId + 65)
    square[vInd][ val.high() - pos ] = char(letterId + 65)
  square.join("\n") & '\n'
