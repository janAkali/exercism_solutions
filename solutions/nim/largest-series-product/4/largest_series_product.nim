import std/sequtils

proc largestProduct*(input: string, span: int): int =
  if span < 0 or span > input.len: 
    raise newException(ValueError, "Span must be a positive integer less than or equal to the input length.")
  if input.anyIt(it notin {'0'..'9'}): 
    raise newException(ValueError, "Input must only contain digits.")

  let lastIndex = input.len - span
  for index in 0..lastIndex:
    let substring = input[index..index+(span-1)] 
    let product = substring.mapIt(it.ord - '0'.ord).foldl(a*b)
    if product > result:
      result = product
