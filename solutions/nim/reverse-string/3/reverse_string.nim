func reverse*(input: string): string = 
  ## 3 times faster than unicode.reversed(), but will mangle unicode characters
  result = input
  for i in 1..input.len div 2: swap(result[i-1], result[^i])
