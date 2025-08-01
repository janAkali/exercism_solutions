import std/strutils
import std/setutils

proc isPangram*(sentence: string): bool =
  {'a'..'z'} <= sentence.toLower.toSet
