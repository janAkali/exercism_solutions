import std/[math, random]

randomize()

proc privateKey*(p: int): int =
  rand(1..<p)

proc publicKey*(p, g, a: int): int =
  g ^ a mod p

proc secret*(p, bPub, a: int): int =
  bPub ^ a mod p
