import std/[strutils, wordwrap]

type
  Queen* = object
    row*: int
    col*: int
  Vec = object
    x: int
    y: int

func `+=`(a: var Vec, b: Vec) =
  a.x += b.x
  a.y += b.y

template walkDiagonal(dir: Vec) =
  pos = Vec(x: white.row, y: white.col)

  while pos.x != lim(dir.x) and pos.y != lim(dir.y):
    pos += dir
    if pos.x == black.row and pos.y == black.col: return true

func initQueen*(row, col: int): Queen =
  if row notin {0..7} or col notin {0..7}: raise new ValueError
  Queen(row: row, col: col)

func canAttack*(white, black: Queen): bool =
  if white == black: raise new ValueError
  if white.row == black.row or white.col == black.col:
    return true

  func lim(i: int): int =
    if i > 0: 8 else: 0

  var pos: Vec
  walkDiagonal Vec(x: -1, y: -1)
  walkDiagonal Vec(x: -1, y:  1)
  walkDiagonal Vec(x:  1, y: -1)
  walkDiagonal Vec(x:  1, y:  1)

func board*(white, black: Queen): string =
  if white == black: raise new ValueError
  var board: seq[string] = repeat('_', 64).wrapWords(8).split('\n')
  board[white.row][white.col] = 'W'
  board[black.row][black.col] = 'B'
  board.join("\n") & '\n'
