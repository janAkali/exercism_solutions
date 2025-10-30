import std/[sets, deques, tables, hashes]

type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}
  Callback = proc(val: int)
  CellKind = enum Input, Compute
  Cell = ref object
    case kind: CellKind
    of Input:
      discard
    of Compute:
      deps: seq[Cell]
      compute: ComputeFunc
      callbacks: HashSet[Callback]
    children: seq[Cell]
    val: int
    hasChanged = false
    isStale = false

proc hash(c: Cell): Hash =
  var h: Hash = 0
  h = h !& addr(c[]).hash
  result = !$h

proc topoSorted(cells: HashSet[Cell]): seq[Cell] =
  var queue: Deque[Cell]
  var degree: Table[Cell, int]

  for cell in cells:
    degree[cell] = 0
    for dep in cell.deps:
      if dep in cells:
        degree[cell] += 1

  for cell, val in degree:
    if val == 0: queue.addLast cell

  while queue.len > 0:
    let currentCell = queue.popFirst()
    result.add currentCell
    for child in currentCell.children:
      if child in cells:
        degree[child] -= 1
        if degree[child] == 0: queue.addLast child

  if result.len != cells.len:
    raise newException(ValueError, "Cycle detected!")

proc newInputCell*(val: int): Cell =
  Cell(kind: Input, val: val)

proc value*(cell: Cell): int =
  cell.val
     
proc collectStale(cell: Cell): HashSet[Cell] =
  for cell in cell.children:
    cell.isStale = true
    result.incl cell
    result.incl cell.collectStale()

proc `value=`*(cell: Cell, val: int) =
  if cell.kind == Input:
    cell.val = val
    let cellsToRecompute = cell.collectStale()
    let sortedList = cellsToRecompute.topoSorted()

    for cell in sortedList:
      cell.isStale = false
      let prevVal = cell.val
      var values: seq[int]
      for cell in cell.deps:
        values.add cell.val
      cell.val = cell.compute(values)
      if prevVal != cell.val: cell.hasChanged = true

    for cell in sortedList:
      if cell.hasChanged:
        cell.hasChanged = false
        for callback in cell.callbacks:
          callback(cell.val)

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  result = Cell(kind: Compute, deps: dependencies, compute: compute)
  var values: seq[int]
  for cell in dependencies:
    values.add cell.val
  result.val = compute(values)

  for cell in dependencies:
    cell.children.add result

proc addCallback*(cell: Cell, callback: Callback) =
  cell.callbacks.incl callback

proc removeCallback*(cell: Cell, callback: Callback) =
  cell.callbacks.excl callback
