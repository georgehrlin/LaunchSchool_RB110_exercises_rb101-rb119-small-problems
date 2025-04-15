BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze
p BLOCKS

def block_word?(str)
  up_str = string.upcase
  BLOCKS.none? { |block| up_str.count(block) >= 2 }
end
