BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(str)
  blocks_used = BLOCKS.count do |block|
    block =~ /[#{str.upcase}]/
  end
  blocks_used == str.size
end

p block_word?('BATCH')  # => true
p block_word?('BUTCH')  # => false
p block_word?('jest')   # => true
p block_word?('apples') # => false
p block_word?('Baby')   # => false
