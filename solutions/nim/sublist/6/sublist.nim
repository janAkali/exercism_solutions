type
  Comparison* = enum
    Unequal, Sublist, Superlist, Equal

func isSublist[T](list, superList: openArray[T]): bool =
  if list.len < 1: return true
  if list.len >= superList.len: return false

  var window = superList[0..list.high] 
  if window == list: return true

  for i in 1..superList.len-list.len:
    window.delete(0)
    window.add superList[i+list.high]
    if window == list: return true
  false

func sublist*(a, b: openArray[int]): Comparison =
  if a == b: return Equal
  if a.isSublist(b): return Sublist
  if b.isSublist(a): return Superlist
  Unequal
