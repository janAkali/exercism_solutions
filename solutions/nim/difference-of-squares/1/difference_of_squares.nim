import math
import sequtils

proc squareOfSum*(n: int): int =
  sum(toSeq(1..n)) ^ 2

proc sumOfSquares*(n: int): int =
  toSeq(1..n).mapIt(it ^ 2).sum

proc difference*(n: int): int =
  abs(n.squareOfSum() - n.sumOfSquares())
