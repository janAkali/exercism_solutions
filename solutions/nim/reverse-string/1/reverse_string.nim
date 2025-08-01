func reverse*(input: string): string = 
  result = newString(input.len)
  for i in 1..input.len: result[i-1] = input[^i]
