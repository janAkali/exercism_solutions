import std/times

type
  Schedule* = enum
    Teenth, First, Second, Third, Fourth, Last

proc meetup*(year: int, month: int, schedule: Schedule, day: WeekDay): string =
  var meetingDay:MonthdayRange = 1
  let daysInMonth = getDaysInMonth(month.Month, year)
  case schedule:
    of Teenth: 
      for d in 13..19:
        if day == getDayOfWeek(d, month.Month, year):
          meetingDay = d
          break
    of First..Fourth: 
      var count:range[1..4] = 1
      for d in 1..daysInMonth:
        if day == getDayOfWeek(d, month.Month, year):
          if count == schedule.ord(): 
            meetingDay = d
            break
          count.inc()
    of Last: 
      for d in daysInMonth-6..daysInMonth:
        if day == getDayOfWeek(d, month.Month, year):
          meetingDay = d
          break
  dateTime(year, month.Month, meetingDay).format("yyyy-MM-dd")
