import strformat, math

type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

proc initClock*(hour, minute: int): Clock =
  let allMinutes = ( hour * 60 + minute ).floorMod 1440
  Clock(hour: allMinutes div 60, minute: allMinutes mod 60)

func `$`*(c: Clock): string =
  &"{c.hour:02}:{c.minute:02}"

proc `+`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute + int(v) )

proc `-`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute - int(v) )
