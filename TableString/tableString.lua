-- [V0.01]

-- Returns a string representation of a table (serialization)
function tableToString(t)
  local str = "{"
  for k,v in pairs(t) do
    str = str ..  tostring(k) .. "="
    if type(v) == "table" then
      str = str .. toString(v)
    else
       str = str .. tostring(v)
    end
    str = str .. ", "
  end
  str = string.sub(str, 1, #str-2)
  str = str .. "}"
  return str
end