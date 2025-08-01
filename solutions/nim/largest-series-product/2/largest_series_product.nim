import std/[sequtils, strutils]

proc largestProduct*(input: string, span: int): int =
  if span > input.len: raise newException(ValueError, "Span can't be larger than input length.")
  if span < 0: raise newException(ValueError, "Span can't be negative.")
  let last = input.len - span
  for index in 0..last:
    let product = input[index..index+(span-1)].mapIt(parseInt($it)).foldl(a*b)
    if product > result: result = product
