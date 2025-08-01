import algorithm
type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

proc roster*(school: School): seq[string] =
  for i in school.students.sortedByIt((it.grade, it.name)):
    result.add( i.name )

proc addStudent*(school: var School, name: string, grade: int) =
  var student = Student( name: name, grade: grade ) 
  if student.name notin school.roster:
    school.students.add( student )
  else:
    raise newException( ValueError, "Name already in the roster!")

proc grade*(school: School, grade: int): seq[string] =
  for i in school.students.sortedByIt(it.name):
    if i.grade == grade:
      result.add(i.name)
