=begin
Now I Know My ABCs

A collection of spelling blocks has two letters per block, as shown in this
list:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each letter in each block can only
be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.
=end

=begin
PEDAC
P
Input:
- A str that represents a word to be checked
Output:
- A bol of whether the input word str can be constructed with the letter blocks
  without using both letters from any given block or using any block more than
  once
Implicit:
- Case insensitive

E
p block_word?('BATCH') # => true
p block_word?('BUTCH') # => false
p block_word?('jest') # => true
p block_word?('apples') # => false
p block_word?('Baby') # => false

D
Input: A str
Output: A bol

A
- Use an arr of subarrs of strs to represent the set of blocks
- Iterate over chars of input str
  - IF char is NOT in the set
    - RETURN false
  - ELSE
    - Delete corresponding char from the set
- IF any of the subarr is empty
  - RETURN false
- ELSE
  - RETURN true
=end

SPELLING_BLOCKS = [
  ['b', 'o'], ['x', 'k'], ['d', 'q'], ['c', 'p'], ['n', 'a'], ['g', 't'],
  ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'], ['v', 'i'], ['l', 'y'],
  ['z', 'm']
]

def block_word?(word)
  spelling_blocks = SPELLING_BLOCKS.map(&:dup)
  word.downcase.each_char do |char|
    if !spelling_blocks.flatten.include?(char)
      return false
    else
      spelling_blocks.each do |block|
        if block.include?(char)
          block.delete(char)
        end
      end
    end
  end

  !spelling_blocks.any?([])
end

p block_word?('BATCH')  # => true
p block_word?('BUTCH')  # => false
p block_word?('jest')   # => true
p block_word?('apples') # => false
p block_word?('Baby')   # => false
