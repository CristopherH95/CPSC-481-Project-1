# CPSC-481-Project-1
"Giraffe Cover" lisp project for CPSC-481 Artificial Intelligence

A "Giraffe" is a special chess piece which can:
  - Move like a knight
  - Move like a rook (with the limitation that 'rook' style moves are 1 space at a time max).

The goal is to perform a "Giraffe Cover" of a 7x7 (0-indexed) board.

In other words, the goal is to find a path, starting from (0, 0) which covers all spaces of the board.
No repeats are allowed in moves.

This solution uses a recursive tree-walk to find a path from the starting point.

#### implementation tested in Common Lisp 2.49
