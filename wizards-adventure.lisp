;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The Wizard's Adventure Game ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; From Conrad Barski's ;
;   The Land of Lisp   ;
;      Showcasing      ;
;  Basic Graph Theory  ;
;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *nodes* '((living-room (you are in the living room.
                                          a wizard is snoring loudly on the
                                          couch.))
                        (garden ( you are in a beautiful garden.
                                      there is a well front of you.))
                        (attic (you are in the attic.
                                    there is a giant welding torch in the corner.))))
(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

