BLOCKS = [['b', 'o'], ['x', 'k'], ['d', 'q'], ['c', 'p'], ['n', 'a'],
          ['g', 't'], ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'],
          ['v', 'i'], ['l', 'y'], ['z', 'm']]

def block_word?(str)
  blocks = str.chars.map do |char|
    BLOCKS.find { |block| block.include?(char.downcase) }
  end.uniq
  p blocks
  blocks.size == str.size
end

p block_word?('BATCH')  # => true
p block_word?('BUTCH')  # => false
p block_word?('jest')   # => true
p block_word?('apples') # => false
p block_word?('Baby')   # => false
