type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

func colorCode*(color: ResistorColor): int =
  ord(color)

func colors*: array[0..ResistorColor.high.ord, ResistorColor] =  
  for i in 0..result.high(): 
    result[i] = ResistorColor(i)
