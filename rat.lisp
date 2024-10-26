(in-package #:ratgame)

(define-asset (ratgame rat) sprite-data #p"rat.json")

(define-shader-entity rat (animated-sprite located-entity)
  ((sprite-data :initform (asset 'ratgame 'rat))
   (movement :initform 'front :accessor movement)))

(define-handler (rat tick :before) (dt)
  (let* ((dir (directional 'move))
         (speed 20.0)
         (x (vx dir))
         (y (vy dir))
         (last-dir (movement rat))
         (next-dir (cond
                     ((< x 0) 'walk-left)
                     ((> x 0) 'walk-right)
                     ((eq last-dir 'walk-left) 'idle-left)
                     ((eq last-dir 'walk-right) 'idle-right)
                     (T last-dir))))
    (play next-dir rat)
    (setf (movement rat) next-dir)
    (incf (vx (location rat)) (* dt speed x))
    (incf (vz (location rat)) (* dt speed y))))
