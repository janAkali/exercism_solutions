import std/strutils

type
  Plant* = enum
    Clover, Grass, Radishes, Violets

const students = 
    [ "Alice", "Bob", "Charlie", "David",
    "Eve", "Fred", "Ginny", "Harriet",
    "Ileana", "Joseph", "Kincaid", "Larry" ]

proc plants*(garden: string, student: string): seq[Plant] =
  let studentIndex = students.find(student)
  for row in garden.split():
    for n in 0..1:
      let plantLetter = row[studentIndex * 2 + n]
      case plantLetter:
        of 'C': result.add Clover
        of 'G': result.add Grass
        of 'R': result.add Radishes
        of 'V': result.add Violets
        else: raise newException(ValueError, "Incorrect letter for a plant")
