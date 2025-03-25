=begin
Try modifying your solution or our solution so it prints only the outline of
the diamond:
diamond(9)

    *
   * *
  *   *
 *     *
*       *
 *     *
  *   *
   * *
    *
=end

def diamond(size)
  mid_point = size / 2

  puts ' '

  num_star = 1
  mid_point.times do |n| 
    puts "#{' ' * (mid_point - n)}*#{' ' *}"
    num_star += 2
  end
  
  puts "*#{' ' * (size - 2)}*"

  num_star = size - 2
  mid_point.times do |n|
    puts "#{' ' * (n + 1)}#{'*' * num_star}"
    num_star -= 2
  end
end
