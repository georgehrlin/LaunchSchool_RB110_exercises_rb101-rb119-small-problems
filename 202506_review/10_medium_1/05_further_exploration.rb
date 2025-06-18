=begin
def generate_positions(diamond_size)
  positions = []
  middle = diamond_size / 2
  l = middle
  r = middle

  1.upto(diamond_size) do |n|
    positions << [l, r]

    if n <= middle
      l -= 1
      r += 1
    else
      l += 1
      r -= 1
    end
  end

  positions
end
=end

=begin
# Improved (shorter, rubocop-approved) version after asking LSBot
def generate_positions(diamond_size)
  positions = []
  middle = diamond_size / 2
  l, r = middle, middle

  1.upto(diamond_size) do |n|
    positions << [l, r]
    n <= middle ? (l -= 1; r += 1) : (l += 1; r -= 1)
  end

  positions
end
=end

# Suggested by LSBot
def generate_positions(diamond_size)
  middle = diamond_size / 2
  distances = (0...middle).to_a + (middle.downto(0)).to_a

  distances.map { |distance| [middle - distance, middle + distance] }
end

def diamond_outline(diamond_size)
  # print_diamond_outline might be a better name for this method
  positions = generate_positions(diamond_size)
  positions.each do |(l, r)|
    line = ' ' * diamond_size
    line[l] = '*'
    line[r] = '*'
    puts line
  end
end
