import algorithm

proc binarySearch*(list: openArray[int], searchItem: int): int =
  if list.len < 1 or searchItem < list[0] or searchItem > list[list.high]: 
    return -1
  var 
    startArr = 0
    endArr = list.high
    position = 0

  while endArr - startArr > 1:
    let halflength = (endArr - startArr) div 2
    if searchItem >= list[halflength]:
      startArr = halflength
      position += halflength
    else:
      endArr = halflength - 1

  if list[position] == searchItem: return position
  return -1
