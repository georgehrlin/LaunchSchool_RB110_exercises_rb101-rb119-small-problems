=begin
Matching Parentheses?

Write a method that takes a string as an argument, and returns true if all
parentheses in the string are properly balanced, false otherwise. To be
properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).
=end

=begin
PEDAC
P
Input:
- A str that may or may not contain "(" and/or ")"
Output:
- A bol that represents whether all parentheses in the input str are balanced
  - Each "(" has to be matched with a ")"
  - Each balanced pair has to start with a "("

E
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false

D
Input: A str
Output: A bol

A
- For all the parenthese to be balanced
  - The total number of "(" and ")" must be an even num
  - The first ('s index must be smaller than the first )'s index
  - The second ('s' index must be smaller than the second )'s index
  - And so on

- Determine if the total num of ( and ) is even
  - Use count with '()'

- Determine if all the indices of ( are smaller than the corresponding indices of )
  - Initialize an arr to collect ( indices
  - Initialize an arr to collect ) indices
  - Iterate over all chars of input str with index
    - IF char is (
      - Append its idx to indices_( arr
    - ELSIF char is )
      - Append its idx to indices_) arr
  - Determine if every num in indices_( is smaller than the corresponding num in indices_)
    - Try using all? with with_index
=end

def balanced?(str)
  even_pairs = str.count('()').even?

  if even_pairs
    idx_open = []
    idx_close = []
    str.each_char.with_index do |char, idx|
      if char == '('
        idx_open << idx
      elsif char == ')'
        idx_close << idx
      end
    end
  
    !!(idx_open.all? { |n| n < idx_close[idx_open.index(n)] })
  else
    false
  end
end

p balanced?('What (is) this?') # == true
p balanced?('What is) this?') # == false
p balanced?('What (is this?') # == false
p balanced?('((What) (is this))?') # == true
p balanced?('((What)) (is this))?') # == false
p balanced?('Hey!') # == true
p balanced?(')Hey!(') # == false
p balanced?('What ((is))) up(') # == false
p balanced?('What ())(is() up') # == false

# This method returns whether all elements of arr1 are smaller than arr2
def are_all_el_smaller?(arr1, arr2)
  arr1.all? { |n| n < arr2[arr1.index(n)] }
end
