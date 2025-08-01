proc binarySearch*(list: openArray[int], searchItem: int): int =
  if list.len < 1 or searchItem < list[0] or searchItem > list[list.high]: return -1
  var 
    startArr = 0
    endArr = list.high
    half = 0

  while startArr <= endArr:
    half = (startArr + endArr) div 2
    if list[half] == searchItem: return half
    if list[half] < searchItem: startArr = half + 1 
    else: endArr = half - 1
  return -1
