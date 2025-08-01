import std/[math, random]


proc privateKey*(p: int): int =
  randomize()
  rand(2..<p)

proc publicKey*(p, g, a: int): int =
  g ^ a mod p

proc secret*(p, bPub, a: int): int =
  bPub ^ a mod p
