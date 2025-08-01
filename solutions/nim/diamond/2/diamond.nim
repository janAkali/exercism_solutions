func descAscSeq(top, bottom: int): seq[int] =
  for i in countDown(top, bottom): result.add i
  for i in countUp(bottom + 1, top): result.add i

func diamond*(c: char): string =
  let 
    edge = int(c) - 65
    position = descAscSeq(edge, 0)

  for index, v in position:
    for pos in position:
      let letter = edge - position[index]
      if pos == letter:
        result.add char(pos + 65)
      else: 
        result.add ' '
    result.add '\n'
