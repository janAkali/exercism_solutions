import algorithm

proc binarySearch*(list: openArray[int], searchItem: int): int =
  if list.len < 1 or searchItem < list[0] or searchItem > list[list.high]: return -1
  var 
    startArr = 0
    endArr = list.high
    halflength = 0

  while startArr <= endArr:
    halflength = (startArr + endArr) div 2
    if list[halflength] == searchItem: return halflength
    if list[halflength] < searchItem: startArr = halflength + 1 
    else: endArr = halflength - 1
  return -1
