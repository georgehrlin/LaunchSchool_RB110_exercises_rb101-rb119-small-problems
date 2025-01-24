def triangle(size, right_angle)
  case right_angle
  when 'top_left'
    size.downto(1) { |n| puts ('*' * n) }
  when 'top_right'
    size.downto(1) { |n| puts ('*' * n).rjust(size, ' ') }
  when 'bottom_left'
    1.upto(size) { |n| puts ('*' * n) }
  when 'bottom_right'
    1.upto(size) { |n| puts ('*' * n).rjust(size, ' ')}
  end
end
