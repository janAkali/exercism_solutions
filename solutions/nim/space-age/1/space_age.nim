import std/tables

type
  Planet* = enum
    Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune

const 
  SECONDSINYEAR = 31557600
  EARTHYEARSRATIO = {
    Mercury: 0.2408467,
    Venus: 0.61519726,
    Earth: 1.0,
    Mars: 1.8808158,
    Jupiter: 11.862615,
    Saturn: 29.447498,
    Uranus: 84.016846,
    Neptune: 164.79132,
  }.toTable()

func age*(planet: Planet, seconds: int64): float =
  let years = seconds.float64 / SECONDSINYEAR.float64
  years / EARTHYEARSRATIO[planet]
