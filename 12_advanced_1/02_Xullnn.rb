def star(num)
  up = (num / 2 - 1).downto(0).map { |spaces| %w(* * *).join(' ' * spaces).center(num) }
  down = up.reverse
  puts up, '*' * num, down
end

star(7)
