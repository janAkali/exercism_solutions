import std/times

type
  Schedule* = enum
    Teenth, First, Second, Third, Fourth, Last

proc meetup*(year: int, month: int, schedule: Schedule, day: WeekDay): string =
  case schedule:
    of First: 
      for d in 0..getDaysInMonth(month, year)
        echo getDayOfWeek(d, month, year)
    else: discard
    "aa"

echo meetup(2023, 03, First, dFri)
