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
  ## Returns the names of every student in the `school`, sorted by grade then name.

proc addStudent*(school: var School, name: string, grade: int) =
  var student = Student( name: name, grade: grade ) 
  if student.name notin school.roster:
    school.students.add( student )
  else:
    raise newException( ValueError, "Name already in the roster!")
  ## Adds a student with `name` and `grade` to the `school`.
  ##
  ## Raises a `ValueError` if `school` already contains a student named `name`.

proc grade*(school: School, grade: int): seq[string] =
  for i in school.students.sortedByIt(it.name):
    if i.grade == grade:
      result.add(i.name)
  ## Returns the names of the students in the given `school` and `grade`, in
  ## alphabetical order.

var test = School()
test.addStudent( "John", 2 )
echo test.roster()
