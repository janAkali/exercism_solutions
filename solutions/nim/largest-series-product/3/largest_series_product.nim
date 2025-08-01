import std/[sequtils, strutils]

proc largestProduct*(input: string, span: int): int =
  if span < 0 or span > input.len: 
    raise newException(ValueError, "Span must be a positive integer less than or equal to the input length.")

  let lastIndex = input.len - span
  for index in 0..lastIndex:
    let substring = input[index..index+(span-1)] 
    let product = substring.mapIt(parseInt($it)).foldl(a*b)
    if product > result:
      result = product
