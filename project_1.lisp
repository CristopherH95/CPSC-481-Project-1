;;;; project_1.lisp
;;;; Produces a list of moves to make to completely cover a 7x7 chess board.
;;;; Uses the special "Giraffe" piece which can move like a knight or a rook that's limited to one square

;;; Helper function
(defun gen-moves (row col)
    "Generates all 12 giraffe moves from the given row and column position"
    (list
        ;; 'rook style' moves 
        (list (+ row 1) col)
        (list row (+ col 1))
        (list (- row 1) col)
        (list row (- col 1))
        ;; positive y 'knight style' moves
        (list (+ row 2) (+ col 1))
        (list (+ row 2) (- col 1))
        (list (+ row 1) (+ col 2))
        (list (+ row 1) (- col 2))
        ;; negative y 'knight style' moves
        (list (- row 2) (+ col 1))
        (list (- row 2) (- col 1))
        (list (- row 1) (+ col 2))
        (list (- row 1) (- col 2))))

;;; Recursive path-finding
(defun find-path (start)
    "Recursively walks the tree of giraffe moves on a 7x7 board to get a path covering the whole board.
    The board is 0-indexed with (0 0) representing the upper-left, and (6 6) representing the bottom right.
        Expects: 
            The argument start should be a list whose elements are of the form:
            (Y . X)
            This argument represents the current path followed on the board.
            The first element is assumed to be the current position.
        Returns: 
            A list of the form:
            ((Y . X) (Y . X) ...)
            OR: 
            Nil
            A list represents moves to make to cover the board.
            Nil represents no more valid moves found."
    (cond
        ;; parameter is not a list, return nil
        ((not (listp start)) (return-from find-path nil))
        ;; parameter has enough moves to cover the board
        ((>= (length start) 49) (return-from find-path (reverse start)))
        ;; generate more moves from current position
        (T (let ((pos-moves (gen-moves (nth 0 (nth 0 start)) (nth 1 (nth 0 start)))))
                (loop 
                    for move in pos-moves
                    do (if (and 
                       (not (member move start :test 'equal)) ; No repeat moves 
                       (not (or (< (nth 0 move) 0) (< (nth 1 move) 0) ; No moves off board 
                            (> (nth 0 move) 6) (> (nth 1 move) 6)))) 
                                (return-from find-path (find-path (cons move start)))
                        nil)
                )
            )
        )
    )
)

;;; Test
(print (find-path (list (list 0 0))))