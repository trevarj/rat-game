(in-package #:ratgame)

#+nil
(launch)

#+nil
(maybe-reload-scene)

(defclass main (trial:main)
  ())

(define-pool ratgame)

(define-action-set in-game)
(define-action move (directional-action in-game))

(setf +app-system+ "rat-game")

(defmethod setup-scene ((main main) scene)
  (enter (make-instance 'rat :name :rat) scene)
  (enter (make-instance 'sidescroll-camera :zoom 10.0 :name :camera) scene)
  (enter (make-instance 'render-pass) scene))

(defun launch (&rest args)
  (let ((*package* #.*package*))
    (load-keymap)
    (setf (active-p (action-set 'in-game)) T)
    (apply #'trial:launch 'main args)))
