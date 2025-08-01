func newSeq(up, top, down: int): seq[int] =
  for i in countUp(up, top): result.add i
  for i in countDown(top - 1, down): result.add i

func diamond*(c: char): string =
  let 
    edge = int(c) - 65
    struct: seq[int] = newSeq(0, edge, 0)
  var index = 0

  for vInd in -edge..edge:
    for hInd in -edge..edge:
      let pos = abs(hInd)

      if struct[index] == pos:
        result.add char(struct[index] + 65)
      else: 
        result.add ' '

    result.add '\n'
    index.inc()
