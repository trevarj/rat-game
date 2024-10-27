(in-package #:ratgame)

(define-asset (ratgame rat) sprite-data #p"rat.json")

(define-shader-entity rat (animated-sprite located-entity)
  ((sprite-data :initform (asset 'ratgame 'rat))
   (movement :initform 'front :accessor movement)))

(define-handler (rat tick :before) (dt)
  (let* ((dir (directional 'move))
         (speed 100.0)
         (dx (vx dir))
         (rat-x (vx (location rat)))
         (next-x (+ rat-x (* dt speed dx)))
         (last-dir (movement rat))
         (next-dir (cond
                     ((< dx 0) 'walk-left)
                     ((> dx 0) 'walk-right)
                     ((eq last-dir 'walk-left) 'idle-left)
                     ((eq last-dir 'walk-right) 'idle-right)
                     (T last-dir))))
    (play next-dir rat)
    (setf (movement rat) next-dir)
    (when (move-in-bounds-p next-x)
      (setf (vx (location rat)) next-x))))

(defun move-in-bounds-p (x)
  (and (>= x -320)
       (<= x 320)))
