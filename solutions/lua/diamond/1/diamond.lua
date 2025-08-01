return function(letter)
  local result = ""
  local lim = string.byte(letter) - string.byte('A')
  for i = -lim, lim do
    local off = math.abs(i)
    for i=1,off do result = result .. ' ' end
    local char = string.char(string.byte('A') + lim - off)
    result = result .. char
    if off ~= lim then
      for i=1,(lim-off)*2-1 do result = result .. ' ' end
      result = result .. char
    end
    for i=1,off do result = result .. ' ' end
    result = result .. '\n'
  end
  return result
end