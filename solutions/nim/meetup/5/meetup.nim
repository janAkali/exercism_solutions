import std/times

type
  Schedule* = enum
    First, Second, Third, Fourth, Teenth, Last

proc meetup*(year: int, month: int, schedule: Schedule, day: WeekDay): string =
  var meetingDay:MonthdayRange = 1
  let daysInMonth = getDaysInMonth(month.Month, year)
  case schedule:
    of First..Fourth: 
      for d in 1..7:
        if day == getDayOfWeek(d, month.Month, year):
            meetingDay = d + schedule.ord() * 7
            break
    of Teenth: 
      for d in 13..19:
        if day == getDayOfWeek(d, month.Month, year):
          meetingDay = d
          break
    of Last: 
      for d in daysInMonth-6..daysInMonth:
        if day == getDayOfWeek(d, month.Month, year):
          meetingDay = d
          break
  dateTime(year, month.Month, meetingDay).format("yyyy-MM-dd")
