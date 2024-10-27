(in-package #:ratgame)

#+nil
(launch)

#+nil
(maybe-reload-scene)

(setf +app-system+ "rat-game")

(define-pool ratgame)

(define-action-set in-game)
(define-action move (directional-action in-game))
(define-action quit-game (in-game)) 

(defmethod setup-scene ((main main) scene)
  (enter (make-instance 'rat :name :rat :location (vec 0 0 0)) scene)
  (enter (make-instance 'sidescroll-camera :zoom 4.0 :name :camera) scene)
  (enter (make-instance 'render-pass) scene))

(define-handler (scene quit-game) ()
  (quit *context*))

(defclass main (trial:main)
  ())

(defun launch (&rest args)
  (let ((*package* #.*package*))
    (load-keymap :reset t)
    (setf (active-p (action-set 'in-game)) T)
    (apply #'trial:launch 'main args)))
