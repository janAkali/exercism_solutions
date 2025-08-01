import std/strutils

type
  Plant* = enum
    Clover = 'C'
    Grass = 'G'
    Radishes = 'R'
    Violets = 'V'

const 
  students = 
    [ "Alice", "Bob", "Charlie", "David",
    "Eve", "Fred", "Ginny", "Harriet",
    "Ileana", "Joseph", "Kincaid", "Larry" ]

proc plants*(garden: string, student: string): seq[Plant] =
  let studentIndex = students.find(student)
  for row in garden.split():
    result.add Plant(row[studentIndex * 2 ])
    result.add Plant(row[studentIndex * 2 + 1])
