type 
  Direction = enum
    Right
    Down
    Left
    Up
  Cursor = object
    x: int
    y: int

func `+`(cur: Cursor, dir: Direction): Cursor =
  result = cur
  case dir:
    of Right: result.x.inc()
    of Down: result.y.inc()
    of Left: result.x.dec()
    of Up: result.y.dec()

func next(dir: var Direction) = 
  dir = if dir == Up: Right else: dir.succ()

func spiral*(size: static int): array[size, array[size, int]] =
  if size <= 0: return

  var 
    cursor = Cursor(x:0, y:0)
    currentDir = Right

  for number in 1..size*size:
    result[cursor.y][cursor.x] = number

    let nextCursor = cursor + currentDir
    if nextCursor.y > size-1 or nextCursor.x > size-1 or
      nextCursor.y < 0 or nextCursor.x < 0 or
      result[nextCursor.y][nextCursor.x] != 0: 
        currentDir.next()
    cursor = cursor + currentDir

