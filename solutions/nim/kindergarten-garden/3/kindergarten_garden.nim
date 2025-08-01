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
    result.add plantTable[row[studentIndex * 2 ]]
    result.add plantTable[row[studentIndex * 2 + 1]]
