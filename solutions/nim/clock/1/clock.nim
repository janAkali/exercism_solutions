import strutils, math

type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

proc `+` (x, y: Minutes): Minutes =
  result = Minutes(int(x) + int(y))
proc `-` (x, y: Minutes): Minutes =
  result = Minutes(int(x) - int(y))

proc initClock*(hour, minute: int): Clock =
  let allMinutes = ( hour * 60 + minute ).floorMod 1440
  Clock(hour: allMinutes div 60, minute: allMinutes mod 60)

func `$`*(c: Clock): string =
  c.hour.intToStr(2) & ":" & c.minute.intToStr(2)

proc `+`*(c: Clock, v: Minutes): Clock =
  initClock(0, ( c.hour * 60 + c.minute + int(v) ))

proc `-`*(c: Clock, v: Minutes): Clock =
  initClock(0, ( c.hour * 60 + c.minute - int(v) ))
