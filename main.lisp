(in-package #:ratgame)

(setf +app-system+ "rat-game")

(defvar *world*)

(define-pool ratgame)

(define-action-set in-game)
(define-action move (directional-action in-game))
(define-action quit-game (in-game))

(define-asset (ratgame background) image #p"background.png")

(define-shader-entity background (textured-entity fullscreen-entity located-entity)
  ((texture :initform (// 'ratgame 'background))
   (location :initform (vec 0 0 0))))

(defclass main (trial:main)
  ()
  (:default-initargs :context '(:width 640 :height 480
                                :title "Rat Game")))

(defmethod setup-scene ((main main) scene)
  (setf *world* scene)
  (enter (make-instance 'background) scene)
  (enter (make-instance 'rat :name :rat :location (vec 0 -240 1000)) scene)
  (enter (make-instance 'sidescroll-camera :name :camera) scene)
  (enter (make-instance 'render-pass) scene))

(define-handler (scene quit-game) ()
  (quit *context*))

(defun launch (&rest args)
  (let ((*package* #.*package*))
    (load-keymap :reset t)
    (setf (active-p (action-set 'in-game)) T)
    (apply #'trial:launch 'main args)))
