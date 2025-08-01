import std/sugar

func getPascalSum(s:seq[int], index:int): int =
  let left = if index != 0: s[index-1] else: 0
  let right = if index != s.len: s[index] else: 0
  left + right

proc pascal*(count: int): seq[seq[int]] =
  if count == 0: return
  result = @[@[1]]
  for vIndex in 1..<count:
    let length = vIndex
    let row = collect(newSeqOfCap(length)):
      for col in 0..length: getPascalSum(result[vIndex-1], col)
    result.add(row)
