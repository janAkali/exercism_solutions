import std/[strutils, wordwrap]

type
  Queen* = object
    row*: int
    col*: int

func initQueen*(row, col: int): Queen =
  if row notin {0..7} or col notin {0..7}: raise new ValueError
  Queen(row: row, col: col)

func canAttack*(white, black: Queen): bool =
  if white == black: raise new ValueError
  if white.row == black.row or white.col == black.col or
  abs(white.row - black.row) == abs(white.col - black.col):
    return true

func board*(white, black: Queen): string =
  if white == black: raise new ValueError
  var board: seq[string] = repeat('_', 64).wrapWords(8).split('\n')
  board[white.row][white.col] = 'W'
  board[black.row][black.col] = 'B'
  board.join("\n") & '\n'
