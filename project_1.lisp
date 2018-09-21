(defun gen-moves (row col)
    (list 
        (list (+ row 1) col)
        (list row (+ col 1))
        (list (- row 1) col)
        (list row (- col 1))

        (list (+ row 2) (+ col 1))
        (list (+ row 2) (- col 1))
        (list (+ row 1) (+ col 2))
        (list (+ row 1) (- col 2))
        
        (list (- row 2) (+ col 1))
        (list (- row 2) (- col 1))
        (list (- row 1) (+ col 2))
        (list (- row 1) (- col 2))))

(defun find-path (start)
    (cond 
        ((not (listp start)) (return-from find-path nil))
        ((>= (length start) 49) (return-from find-path (reverse start)))
        (T (let ((pos-moves (gen-moves (nth 0 (nth 0 start)) (nth 1 (nth 0 start)))))
                (loop 
                    for move in pos-moves
                    do (if (and 
                       (not (member move start :test 'equal)) 
                       (not (or (< (nth 0 move) 0) (< (nth 1 move) 0) 
                            (> (nth 0 move) 6) (> (nth 1 move) 6)))) 
                                (return-from find-path (find-path (cons move start)))
                        nil)
                )
            )
        )
    )
)

(print (find-path (list (list 0 0))))