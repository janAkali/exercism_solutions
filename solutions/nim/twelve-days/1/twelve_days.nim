import std/strutils, strformat

const 
  DAYS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
  GIFTS = ["twelve Drummers Drumming", "eleven Pipers Piping", "ten Lords-a-Leaping", "nine Ladies Dancing", "eight Maids-a-Milking", "seven Swans-a-Swimming", "six Geese-a-Laying", "five Gold Rings", "four Calling Birds", "three French Hens", "two Turtle Doves", "a Partridge in a Pear Tree"]

proc carol(start: int): string =
  let 
    nth = DAYS[start-1]
    delim = ", "
    lastDelim = if start > 1: ", and " else: ""
    gifts = (GIFTS[GIFTS.len-start..GIFTS.high-1]).join(delim) & lastDelim & GIFTS[^1]

  &"On the {nth} day of Christmas my true love gave to me: {gifts}."

proc recite*(start: int, stop = -1): string =
  if stop == -1: return carol(start)
  for i in start..stop:
    result &= carol(i) & "\n\n"
  result.strip()
