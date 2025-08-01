func descAscSeq(top, bottom: int): seq[int] =
  for i in countDown(top, bottom): result.add i
  for i in countUp(bottom + 1, top): result.add i

func diamond*(c: char): string =
  let 
    edge = int(c) - 65
    position = descAscSeq(edge, 0)

  for ind, val in position:
    for pos in position:
      let letterIndex = edge - position[ind] # [2,1,0,1,2] -> [0,1,2,1,0]
      result.add( if pos == letterIndex: char(pos + 65) else: ' ' ) 
    result.add('\n')
