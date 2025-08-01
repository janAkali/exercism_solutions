import algorithm

proc binarySearch*(list: openArray[int], searchItem: int): int =
  if list.len < 1 or searchItem < list[0] or searchItem > list[list.high]: 
    return -1
  var 
    temp:seq[int] = @list
    position: int = 0

  while temp.len > 1:
    let halflength = temp.len div 2
    if searchItem >= temp[halflength]:
      temp = temp[halflength..temp.high]
      position += halflength
    else:
      temp = temp[0..<halflength]

  if list[position] == searchItem: return position
  return -1
