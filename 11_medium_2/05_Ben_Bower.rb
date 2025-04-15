def triangle(a, b ,c)
  sides = [a, b, c].sort
  return :invalid if (sides[0] + sides[1]) <= sides.last

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isoceles
  when 3 then :scalene
  end
end
