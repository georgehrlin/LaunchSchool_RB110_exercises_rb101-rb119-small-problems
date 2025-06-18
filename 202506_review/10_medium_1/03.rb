=begin
PEDAC
P
Input: An integer
Output: The maximum rotation of input integer
  - Example: 735291
    1. 352917
    2. 329175
    3. 321759
    4. 321597
    5. 321579
    6? 321597 (Invalid!)

E
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

D
Input: An integer
Intermediary: An arr, potentially
Output: An integer

A
Rotation Pattern
1. Move first digit to last
2. Move second digit to last
3. Move third digit to last
4. Etc...

- Iteration should stop right after rotating the second last digit

- Return 
- Convert input int into an arr of digits, arr_digits
- Initialize a var with val 0, idx_to_rotate, to keep track of idx of digit to
  be rotated
- UNTIL idx_to_rotate >= size of digit
  - Delete arr_digits's element at idx_to_rotate and appends it back to
    arr_digits
- Convert arr_digits back to str and return it
=end

def max_rotation(n)
  return n if n.digits.size == 1

  digits = n.digits.reverse
  idx_to_rotate = 0

  until idx_to_rotate >= digits.size - 1
    digits.append(digits.delete_at(idx_to_rotate))
    idx_to_rotate += 1
  end

  digits.join # FURTHER EXPLORATION
end

p max_rotation(735291) # == 321579
p max_rotation(3) # == 3
p max_rotation(35) # == 53
p max_rotation(105) # == 15
p max_rotation(8_703_529_146) # == 7_321_609_845
p max_rotation(10005)
