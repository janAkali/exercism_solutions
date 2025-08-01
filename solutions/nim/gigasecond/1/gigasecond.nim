import std/times

proc addGigasecond*(date: DateTime): DateTime =
  date + 1_000_000_000.seconds

