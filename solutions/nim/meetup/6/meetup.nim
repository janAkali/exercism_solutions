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
      let start = getDayOfWeek(13, month.Month, year)
      meetingDay = 13 + 7 - (day.ord - start.ord)
    of Last: 
      for d in daysInMonth-6..daysInMonth:
        if day == getDayOfWeek(d, month.Month, year):
          meetingDay = d
          break
  dateTime(year, month.Month, meetingDay).format("yyyy-MM-dd")
