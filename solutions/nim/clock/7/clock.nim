import std/[strformat, math]

type
  Clock* = object
    hour*: range[0..23]
    minute*: range[0..59]

  Minutes* = distinct int

func initClock*(hour, minute: int): Clock =
  let minutes = (hour * 60 + minute).floorMod(60 * 24)
  Clock(
    hour: minutes div 60,
    minute: minutes mod 60,
  )

func `$`*(c: Clock): string = &"{c.hour:02}:{c.minute:02}"

func `+`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute + int(v) )

func `-`*(c: Clock, v: Minutes): Clock =
  initClock(c.hour, c.minute - int(v) )