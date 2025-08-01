proc slices*(digits: string, length: int): seq[string] =
  if length < 1 or length > digits.len: 
    raise newException(ValueError, "length should be positive and not higher than length of digits")

  result = newSeq[string](digits.len - (length-1))

  var window = digits[0..length-1] 
  result[0] = window
  for i in 1..result.high:
    window = window[1..window.high] & digits[i+(length-1)]
    result[i] = window
