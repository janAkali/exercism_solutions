func reverse*(input: string): string = 
  result = input
  for i in 1..input.len div 2: swap(result[i-1], result[^i])
