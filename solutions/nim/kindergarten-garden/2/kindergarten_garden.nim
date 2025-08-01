import std/[strutils, tables]

type
  Plant* = enum
    Clover, Grass, Radishes, Violets

const 
  students = 
    [ "Alice", "Bob", "Charlie", "David",
    "Eve", "Fred", "Ginny", "Harriet",
    "Ileana", "Joseph", "Kincaid", "Larry" ]
  plantTable = 
    { 'C': Clover, 'G': Grass, 'R':Radishes, 'V': Violets}.toTable

proc plants*(garden: string, student: string): seq[Plant] =
  let studentIndex = students.find(student)
  for row in garden.split():
    for n in 0..1:
      let plantLetter = row[studentIndex * 2 + n]
      result.add plantTable[plantLetter]
