import std/sequtils
type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

func colorCode*(color: ResistorColor): int =
  ord(color)

func colors*: seq[ResistorColor] =  
  toSeq(ResistorColor.items())
