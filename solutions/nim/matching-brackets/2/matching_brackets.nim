import std/sequtils

func isPaired*(input: string): bool =
  var stack: seq[char]
  for chr in input:
    case chr:
    of '{': stack.add('}')
    of '[': stack.add(']')
    of '(': stack.add(')')
    of '}',']',')':
      if stack.len < 1 or stack.pop() != chr:
        return false
    else:
      discard
  stack.len == 0