import std/[strutils, setutils]

proc isPangram*(sentence: string): bool =
  {'a'..'z'} <= sentence.toLower.toSet
