def triangle(*sides)
  sides = [] unless sides.all?(&:positive?) && sides.min(2).reduce(:+) > sides.max
  %i[invalid equilateral isoceles scalene][sides.uniq.size]
end
