;;;; project_1.lisp
;;;; Written by: Cristopher Hernandez
;;;; Contact: cristopherh@csu.fullerton.edu
;;;; Defines a helper function, gen-moves, for getting possible (though not necessarily legal) giraffe moves from arbitrary coordinates.
;;;; Defines find-path: the main recursive function for determining a path to cover the 7x7 board, given an initial path.

;;; Helper function
(defun gen-moves (row col)
    "Produces a list of all 12 giraffe moves from the given row and column coordinates.
     Note: this function does not perform any legality checks for the moves.
        Expects:
            row is an arbitrary integer
            col is an arbitrary integer
        Returns:
            A list of the form:
            ((Y X) (Y X) ...)
            Where each element is a coordinate pair representing a possible giraffe move."
    (list
        ;; 'rook style' moves 
        (list (+ row 1) col)
        (list row (+ col 1))
        (list (- row 1) col)
        (list row (- col 1))
        ;; 'knight style' moves down board
        (list (+ row 2) (+ col 1))
        (list (+ row 2) (- col 1))
        (list (+ row 1) (+ col 2))
        (list (+ row 1) (- col 2))
        ;; 'knight style' moves up board
        (list (- row 2) (+ col 1))
        (list (- row 2) (- col 1))
        (list (- row 1) (+ col 2))
        (list (- row 1) (- col 2))))

;;; Recursive path-finding
(defun find-path (curr-path)
    "Recursively walks the tree of giraffe moves on a 7x7 board to get a path covering the whole board.
    The board is 0-indexed with (0 0) representing the upper-left, and (6 6) representing the bottom right.
        Expects: 
            The argument curr-path should be a list whose elements are of the form:
            (Y X)
            This argument represents the current path followed on the board.
            The first element is assumed to be the current position.
        Returns: 
            A list of the form:
            ((Y X) (Y X) ...)
            OR: 
            Nil
            A list represents moves to make to cover the board.
            Nil represents no more valid moves found."
    (cond
        ;; parameter is not a list, return nil
        ((not (listp curr-path)) (return-from find-path nil))
        ;; parameter has enough moves to cover the board
        ((>= (length curr-path) 49) (return-from find-path curr-path))
        ;; generate more moves from current position
        (T (let ((pos-moves (gen-moves (nth 0 (nth 0 curr-path)) (nth 1 (nth 0 curr-path))))
                (new-path nil))
                (loop 
                    for move in pos-moves
                    do (if (and 
                       (not (or (member move curr-path :test 'equal) (member move new-path :test 'equal))) ; No repeat moves 
                       (not (or (< (nth 0 move) 0) (< (nth 1 move) 0) ; No moves off board 
                            (> (nth 0 move) 6) (> (nth 1 move) 6))))
                                  (if new-path 
                                    (setf new-path (find-path (cons move new-path)))
                                  (setf new-path (find-path (cons move curr-path))))     
                        nil)
                    finally 
                        (return-from find-path new-path)
                )
            )
        )
    )
)

;;; run find path from start position of (0 0)
(print (find-path (list (list 0 0))))