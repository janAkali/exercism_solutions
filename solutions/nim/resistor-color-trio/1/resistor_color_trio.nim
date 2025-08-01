import std/math

type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc label*(colors: array[3, ResistorColor]): tuple[value: int, unit: string] =
  let val = (colors[0].ord * 10 + colors[1].ord) * (10 ^ colors[2].ord)
  if val == 0: return (0, "ohms")

  if val mod 10^9 == 0: return (val div 10^9, "gigaohms")
  if val mod 10^6 == 0: return (val div 10^6, "megaohms")
  if val mod 10^3 == 0: return (val div 10^3, "kiloohms")

  (val, "ohms")
