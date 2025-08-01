import std/[strutils, algorithm]

const
  ACTIONS = ["wink", "double blink", "close your eyes", "jump"]

proc commands*(decimal: int): seq[string] =
  let binary = decimal.toBin(5)
  for ind, act in ACTIONS:
    if binary[^(ind+1)] == '1': result.add(act)

  if binary[0] == '1': return result.reversed()
