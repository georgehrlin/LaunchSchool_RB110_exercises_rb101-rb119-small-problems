def invalid?(angles)
  angles.include?(0) || angles.sum != 180 || angles.size != 3
end

def triangle(*angles)
  return :invalid if invalid?(angles)

  case angles.max <=> 90
  when 0 then :right
  when 1 then :obtuse
  else :acute
  end
end
