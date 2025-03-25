PEDAC
P
Input:
- A str that is the "program" supplied to the language method
  - Consists of either int strs or command strs
Output:
- An int or multiple individual ints depending on the supplied "program"
Explicit:
- All "programs" can be assumed to be correct
- All operations are integer operations

D
Input: A str
Output: An int or ints

A
- Initialize a stack var that points to an empty arr
- Initialize a register var that points to 0

- Interpreting the "program" input str
  - Split input str into an arr of strs
  - Iterate over arr of strs
    - Execute functionality depending on str

- n
  - Updates val of register to n
- PUSH
  - Push val of register to stack arr
  - Leave register's val untouched
- ADD
  - Pop val from stack arr
  - Add it to register's val
  - Update register's val with sum
- SUB
  - Pop val from stack arr
  - Subtract it from register's val
  - Update register's val with difference
- MULT
  - Pop val from stack arr
  - Multiply it with register's val
  - Update register's val with product
- DIV
  - Pop val from stack arr
  - Divide it into register's val
  - Update register's val with quotient
- MOD
  - Pop val from stack arr
  - Divide it into register's val
  - Update register's val with integer remainder
- POP
  - Pop val from stack arr
  - Update register's val with val
- PRINT
  - Print register's val
