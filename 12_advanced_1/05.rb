=begin
Rotating Matrices

Write a method that takes an arbitrary matrix and rotates it 90 degrees
clockwise.
=end

=begin
PEDAC
P
Input:
- An arr that represents an arbitrary matrix
Output:
- An arr that is the input arr rotated 90 degrees clockwise

E
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

D
Input: An arr
Output: An arr

A
Analysis
[[1]] -> [[1]]
00 -> 00

[[1, 2], [3, 4]] -> [[3, 1], [4, 2]]
00 -> 01   10 00
01 -> 11   11 01
10 -> 00
11 -> 10

[[1, 5, 8], [4, 7, 2], [3, 9, 6]] -> [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
00 -> 02   20 10 00 Ones move left then plus (num of cols - 1)
01 -> 12   21 11 01
02 -> 22   22 12 02

10 -> 01            Tens and ones flip
11 -> 11
12 -> 21

20 -> 00            Ones move left then ones remain
21 -> 10
22 -> 20

[[3, 7, 4, 2], [5, 1, 0, 8]] -> [[5, 3], [1, 7], [0, 4], [8, 2]]
00 -> 01   10 00   Ones move left then plus (num of cols - 1)
01 -> 11   11 01
02 -> 21   12 02
03 -> 31   13 03

10 -> 00           Ones move left then ones remain
11 -> 10
12 -> 20
13 -> 30

- Indices of first row
  - Second idx becomes first
  - Second idx is (num of cols - 1)
- Indices between first and last row
  - Second and first idcies swap
- Indices of last row
  - Second idx becomes first
  - Second idx is 0
=end

def rotate90(matrix)
  result = []
  matrix.first.size.times { result << [] }

  num_col = matrix.size

  # First row
  matrix.first.each_with_index do |ele, ele_idx|
    result[ele_idx][num_col - 1] = ele
    p result
  end

  # Rows in between
  (1...(matrix.size - 1)).each do |row_idx|
    matrix[row_idx].each_with_index do |ele, ele_idx|
      puts "Working on #{ele} from original row #{row_idx} col #{ele_idx}"
      puts "Setting it to row #{ele_idx} col #{row_idx}"
      result[ele_idx][row_idx] = ele
      p result
    end
  end

  # Last row
  matrix.last.each_with_index do |ele, ele_idx|
    result[ele_idx][0] = ele
  end

  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
