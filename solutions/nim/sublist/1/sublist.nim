import std/sets

type
  Comparison* = enum
    Unequal, Sublist, Superlist, Equal

func isSublist(list, superList: openArray[int]): bool =
  if list.len < 1: return true
  if list.len > superList.len: return false

  var window = superList[0..list.len-1] 
  if list == window: return true

  for i in 1..superList.len-list.len:
    window = window[1..window.high] & superList[i+(list.len-1)]
    if list == window: return true
  false

func sublist*(a, b: openArray[int]): Comparison =
  if a == b: return Equal
  if a.isSublist(b): return Sublist
  if b.isSublist(a): return Superlist
  Unequal

when isMainModule:
  echo sublist([1, 1, 2], [0, 1, 1, 1, 2, 1, 2])
  echo sublist([1, 2, 3], [0, 1, 1, 1, 2, 1, 2])
  echo sublist([1, 2, 3], [0, 1, 1, 1, 2, 1, 2, 3])
