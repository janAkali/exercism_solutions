import std/math

type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

func label*(colors: array[3, ResistorColor]): tuple[value: int, unit: string] =
  let val = (colors[0].ord * 10 + colors[1].ord) * (10 ^ colors[2].ord)
  if val == 0: return (0, "ohms")

  if val mod 1_000_000_000 == 0: return (val div 1_000_000_000, "gigaohms")
  if val mod 1_000_000 == 0: return (val div 1_000_000  , "megaohms")
  if val mod 1_000 == 0: return (val div 1_000 , "kiloohms")

  (val, "ohms")
